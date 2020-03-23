Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA018EF8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 06:49:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m3Nn5vrPzDqsp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:49:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RyQyy/pI; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m3M43BZNzDqsp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 16:47:58 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so5449230plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFe32N3b/dMuGrx3ddHKXFhT/4qt8+NVIOlPxbEA/v8=;
 b=RyQyy/pI687m/a8Yt4gt79iaCck7lPzWd+EnujUQ0ce1Be8uTIbIJpW1jEH5cKHE3V
 UknVspF5kEZtnylJ17ebBEdyYjssYEF+y/ECoJBChOCTWb/JgxKEc/9zgDcTfrgwPyy0
 ZTSAxnPQFrAKVVOgTo2biT17pMz8fWhJlYAI38EwAGP0tDPxxYiJZUNsAXLpASbjWfm6
 +RoDOHl3bocbdn/fmiAZqSz38uGIK+Jaf4GqZzfVf896ZAeRoGX5vIiU/aYtF7igNy8S
 V0NX/z3POxxXnsMVHv+JuHU5Sl/cyLCQJZw5ciWQ8RicyO7EQGmwlSeT0M04wI+9ELc2
 TEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFe32N3b/dMuGrx3ddHKXFhT/4qt8+NVIOlPxbEA/v8=;
 b=B6/A8xHU6hUXwMlccQ82PMNV7avp8AfocIZMpSFeaDMP+eFIQqYq6+RcWC7TbdITfK
 Z1q7DM2SbWyAGG+qzeiZjFw379bJBmJmQl/6dAoKMQfMeUXUZpzrTyuGymHQkMXZqBxH
 TMhL/dMeQhPSnxAOwMTFeRxx1cEkiGsvdwQr2WSLf/igVIxn1vAXWTQZWFlywC9vEnJX
 tWAmX324FqBirwIiSYJOsnamzAjAcrnCRHlgHqsHj577JccEfHQatbKRm6JKxpJcuaru
 +WtKLRyRKOSCJAUXOfH/NOChCtdHwTrmuVt9DWwWUUxutPLt86Gihe6Y/Oqlkog0pI2b
 miLQ==
X-Gm-Message-State: ANhLgQ2ZrAKMf8e77O3SqLVjBjEje2DWr9Y/NWd81X6HOkYcMsUbdeWH
 6pbWRfZaCI7yXcsfDW1GJ8nNTn1H
X-Google-Smtp-Source: ADFU+vuD6C7G+34ONvOcw7Cj59u1cMrXhXeuwpopmfjDq32eM4jo7cD3esVRgFh8g3lH3dvLhvR5bQ==
X-Received: by 2002:a17:902:8f91:: with SMTP id
 z17mr20605091plo.234.1584942475119; 
 Sun, 22 Mar 2020 22:47:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id e9sm12279524pfl.179.2020.03.22.22.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 22:47:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] Fix "[v3,
 25/32] powerpc/64: system call implement entry/exit logic in C"
Date: Mon, 23 Mar 2020 15:44:08 +1000
Message-Id: <20200323054409.1932037-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Changes Christophe asked for to help ppc32 implementation, and move a
stray hunk into a later patch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  4 ---
 arch/powerpc/include/asm/cputime.h        | 38 +++++++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 4b3609554e76..ab59a4904254 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -97,12 +97,8 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp,
 unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
-#ifdef CONFIG_PPC64
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
-#endif
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 6639a6847cc0..0fccd5ea1e9a 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -43,8 +43,26 @@ static inline unsigned long cputime_to_usecs(const cputime_t ct)
  */
 #ifdef CONFIG_PPC64
 #define get_accounting(tsk)	(&get_paca()->accounting)
+#define raw_get_accounting(tsk)	(&local_paca->accounting)
 static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
 
+#else
+#define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
+#define raw_get_accounting(tsk)	get_accounting(tsk)
+/*
+ * Called from the context switch with interrupts disabled, to charge all
+ * accumulated times to the current process, and to prepare accounting on
+ * the next process.
+ */
+static inline void arch_vtime_task_switch(struct task_struct *prev)
+{
+	struct cpu_accounting_data *acct = get_accounting(current);
+	struct cpu_accounting_data *acct0 = get_accounting(prev);
+
+	acct->starttime = acct0->starttime;
+}
+#endif
+
 /*
  * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
  * can't use use get_paca()
@@ -52,35 +70,21 @@ static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
 static notrace inline void account_cpu_user_entry(void)
 {
 	unsigned long tb = mftb();
-	struct cpu_accounting_data *acct = &local_paca->accounting;
+	struct cpu_accounting_data *acct = raw_get_accounting(current);
 
 	acct->utime += (tb - acct->starttime_user);
 	acct->starttime = tb;
 }
+
 static notrace inline void account_cpu_user_exit(void)
 {
 	unsigned long tb = mftb();
-	struct cpu_accounting_data *acct = &local_paca->accounting;
+	struct cpu_accounting_data *acct = raw_get_accounting(current);
 
 	acct->stime += (tb - acct->starttime);
 	acct->starttime_user = tb;
 }
 
-#else
-#define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
-/*
- * Called from the context switch with interrupts disabled, to charge all
- * accumulated times to the current process, and to prepare accounting on
- * the next process.
- */
-static inline void arch_vtime_task_switch(struct task_struct *prev)
-{
-	struct cpu_accounting_data *acct = get_accounting(current);
-	struct cpu_accounting_data *acct0 = get_accounting(prev);
-
-	acct->starttime = acct0->starttime;
-}
-#endif
 
 #endif /* __KERNEL__ */
 #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
-- 
2.23.0

