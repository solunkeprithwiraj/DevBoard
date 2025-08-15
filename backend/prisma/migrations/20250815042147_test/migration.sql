-- CreateTable
CREATE TABLE "public"."user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."task" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "userId" TEXT NOT NULL,

    CONSTRAINT "task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."tag" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."_tagTotask" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_tagTotask_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "public"."user"("email");

-- CreateIndex
CREATE INDEX "user_email_idx" ON "public"."user"("email");

-- CreateIndex
CREATE INDEX "user_createdAt_idx" ON "public"."user"("createdAt");

-- CreateIndex
CREATE INDEX "user_updatedAt_idx" ON "public"."user"("updatedAt");

-- CreateIndex
CREATE INDEX "task_userId_idx" ON "public"."task"("userId");

-- CreateIndex
CREATE INDEX "task_title_idx" ON "public"."task"("title");

-- CreateIndex
CREATE INDEX "task_completed_idx" ON "public"."task"("completed");

-- CreateIndex
CREATE INDEX "task_createdAt_idx" ON "public"."task"("createdAt");

-- CreateIndex
CREATE INDEX "task_updatedAt_idx" ON "public"."task"("updatedAt");

-- CreateIndex
CREATE INDEX "_tagTotask_B_index" ON "public"."_tagTotask"("B");

-- AddForeignKey
ALTER TABLE "public"."task" ADD CONSTRAINT "task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."_tagTotask" ADD CONSTRAINT "_tagTotask_A_fkey" FOREIGN KEY ("A") REFERENCES "public"."tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."_tagTotask" ADD CONSTRAINT "_tagTotask_B_fkey" FOREIGN KEY ("B") REFERENCES "public"."task"("id") ON DELETE CASCADE ON UPDATE CASCADE;
