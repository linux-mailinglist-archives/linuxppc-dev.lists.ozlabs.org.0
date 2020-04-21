Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0C1B1BDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:27:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495nXY19rGzDr0l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cr343oWq; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495nQ45MMkzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:22:04 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id g30so5927284pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 19:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BJQHypGtNF1RLQ1LYVUGA70GB59+/r9picW8nx8B8I8=;
 b=cr343oWq0YVUYiqwKSOAxikNI9vEa53gAuFXUrDwMyLQiitTaSMH+X2oZIqgq2twt8
 gJkhoM+5aXHtHzBb337IFz2P1LQv4SBcKAzVGk9PnihLV3wGEz8t0owiSWgbwmtAo8Y7
 yL0qPj7gv5E+2Ap5LvXTeSRWdTZ5UkgMm1sUBxaSJAhQ+hc5tqTtR/DEabmpceB0u7wZ
 xzP8uVB6lKaJ/JNlgjqW+qW+yociU8xkiWiIVfcTg3rnmS4vI6mL1owMYvToPHyrqn2l
 cDG2inKWpUELjZJG7aT8RQNpiFClvxdOv+HUDnMQYQKrA7567LUb3/V0UTZFHer8GfFp
 4Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJQHypGtNF1RLQ1LYVUGA70GB59+/r9picW8nx8B8I8=;
 b=VAhY8U+NG+xYKJFKAjLhJ3D0LJzs/s4MI2imJeJo12A5MjeqHFpdL57iduC9QpGozD
 uNedb4TUE0yi3FYefWP3Nnq0pGgNPL4iOPKC59XqjA5Q7z5BsEcEGEi6aK+4TdFTx/4P
 920u9YK6bjzRk/1aGVMR7kaM/spWGPZwg2fH0NJntb9g4jZPkoQnFsHmPz0QCLv3RtH5
 5yXvAIxpHoQeE5wqzzbeY8rtJr4eKW+DDvBXa52lC4olsJ1QSXWit4dOoAHyJ3LJ4KR1
 dgDS8C2yQJeD4kqsLP2ro5aQiP50PIhph6Nk9bGKgjFzcY6QGMwkh6jmcqUCso/IKP30
 ZUtA==
X-Gm-Message-State: AGi0PuYH1syH0LYMyOa7dGreyItKHXswqDJEx0OJ5OM31d0cSTzkS3ki
 C6rCQ1DwUzxbmlF7ZBSoAAZzxTG8
X-Google-Smtp-Source: APiQypLcWA2rlju5jgTH6wxIQ6+h47nAB3aZWdjUTOPW+Jbfif3j040djNiiGxUGQpBQoTzgT8DDDQ==
X-Received: by 2002:a62:cdc9:: with SMTP id
 o192mr20268567pfg.310.1587435721818; 
 Mon, 20 Apr 2020 19:22:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id w3sm829397pfn.115.2020.04.20.19.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 19:22:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc: Use SET_TRAP and avoid open-coding trap masking
Date: Tue, 21 Apr 2020 12:19:53 +1000
Message-Id: <20200421021955.772023-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200421021955.772023-1-npiggin@gmail.com>
References: <20200421021955.772023-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pt_regs.trap field keeps 4 low bits for some metadata about the
trap or how it was handled, which is masked off in order to test the
architectural trap number.

Add a SET_TRAP() accessor to set this, equivalent to TRAP() for
returning it. This is actually not quite the equivalent of TRAP()
because it always clears the low bits, which may be harmless if
it can only be updated via ptrace syscall, but it seems dangerous.
In fact settting TRAP from ptrace doesn't seem like a great idea
so maybe it's better deleted.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h        | 3 +++
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c | 2 +-
 arch/powerpc/xmon/xmon.c                 | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 89f31d5a8062..7eaa2ecfd0b7 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -183,10 +183,12 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 #ifdef __powerpc64__
 #ifdef CONFIG_PPC_BOOK3S
 #define TRAP(regs)		((regs)->trap)
+#define SET_TRAP(regs, val)	((regs)->trap = (val))
 #define FULL_REGS(regs)		true
 #define SET_FULL_REGS(regs)	do { } while (0)
 #else
 #define TRAP(regs)		((regs)->trap & ~0x1)
+#define SET_TRAP(regs, val)	((regs)->trap = ((regs)->trap & 0x1) | ((val) & ~0x1))
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #endif
@@ -201,6 +203,7 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
  * is a critical exception (1 means it is).
  */
 #define TRAP(regs)		((regs)->trap & ~0xF)
+#define SET_TRAP(regs, val)	((regs)->trap = ((regs)->trap & 0xF) | ((val) & ~0xF))
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index d75aff31f637..ac76b2924a1a 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -43,7 +43,7 @@ static int set_user_ckpt_msr(struct task_struct *task, unsigned long msr)
 
 static int set_user_ckpt_trap(struct task_struct *task, unsigned long trap)
 {
-	task->thread.ckpt_regs.trap = trap & 0xfff0;
+	SET_TRAP(&task->thread.ckpt_regs, trap);
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 15e3b79b6395..87c8bd67512c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -149,7 +149,7 @@ static int set_user_dscr(struct task_struct *task, unsigned long dscr)
  */
 static int set_user_trap(struct task_struct *task, unsigned long trap)
 {
-	task->thread.regs->trap = trap & 0xfff0;
+	SET_TRAP(task->thread.regs, trap);
 	return 0;
 }
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7af840c0fc93..20c1fc08819b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1178,7 +1178,7 @@ static int do_step(struct pt_regs *regs)
 				return 0;
 			}
 			if (stepped > 0) {
-				regs->trap = 0xd00 | (regs->trap & 1);
+				SET_TRAP(regs, 0xd00);
 				printf("stepped to ");
 				xmon_print_symbol(regs->nip, " ", "\n");
 				ppc_inst_dump(regs->nip, 1, 0);
-- 
2.23.0

