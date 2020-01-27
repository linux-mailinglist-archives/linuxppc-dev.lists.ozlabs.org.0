Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B30F14A5E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 15:20:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485sMn6bJ5zDqCp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 01:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t4sEFpjI; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485sJt4cQDzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 01:17:32 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id m13so3169471pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 06:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhqemme1Xo9JwMmnanmQLo+0xQhW4ZzkILZwbQ2Yi7I=;
 b=t4sEFpjIV3ttLi5oDVAYXdAm4+DV9IxCmtXwd1Idd9ka8ThpWkUBXgKpHed7Ylnsks
 Vrel8yFyyF3q1y/Gf6+68lQc62Ov+ApQJ05ARakwYdE/0kdfLti8jJgQb7JMVS+WCAfk
 1L3/jjCk/SrgqxlkCioaEMhiO9H6FiNtC8RpxBStDiT2jFa/xhGBzlEi5n50X8zDEkaC
 K7LyBpIXt4QnviJrmGh0GIWBTvEP8sbTwFCXAwVRfdpyoXyNBQmazYmWAz3A7YS9/SaP
 ybS/M0vVTYMmaGJuD7ZPIKg4wqxHS+EJPl/tndzFgwBhUKXEUwEnfTB7yA7YThBZduDx
 5Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhqemme1Xo9JwMmnanmQLo+0xQhW4ZzkILZwbQ2Yi7I=;
 b=Zh+E/hky1FkOcZm+3Vn0R4l9/wKBs9mHK2n5Qpagmfgj7WG6eYjWhulluDKIUYkwdg
 v20uT+J0F4SlbATdbQf3y+2rUvdh1n4RWWWRLpXpHTejIhYyWOitdZySRK/9sqKaEQcm
 Pf/GUpkX6SYrrc9l++dYNrIJs/8bE/4UZnWR+L34gqKujZ/VlmwHFezcKbO1nULBcU0v
 py8CaJ7AmZ6johQic/xg3i/mGgcWQFUDX54mMgh1SsbLwfA8RZVkNvmZpD/rkrOIaPGt
 VfUn6e5dji2Of0RtBAqpSLl9kKbn7msPr7wFtDbOFjLBnSdfBsVR3L3Rixt6wuErdXx9
 DIsQ==
X-Gm-Message-State: APjAAAUeHSmOZ7R0aZczBazeQecIlsK8AmT1nVsA6d6d02F6/6Nr+jIn
 ZfjebHU3j5ZelTEOmtcsfVL8ohr9
X-Google-Smtp-Source: APXvYqzdRD/hzcwYXosSYsisTyGZnqhfx9tg7T1HQCrhPhSerlScgdnHFZi2/kTkSNh5n7/stUzVZA==
X-Received: by 2002:a17:902:768a:: with SMTP id
 m10mr18297283pll.9.1580134649250; 
 Mon, 27 Jan 2020 06:17:29 -0800 (PST)
Received: from bobo.ibm.com ([203.194.47.138])
 by smtp.gmail.com with ESMTPSA id c68sm16437027pfc.156.2020.01.27.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 06:17:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: system call implement the bulk of the logic in C
 fix
Date: Tue, 28 Jan 2020 00:17:12 +1000
Message-Id: <20200127141712.96738-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This incremental patch fixes several soft-mask debug and unsafe
smp_processor_id messages due to tracing and false positives in
"unreconciled" code.

It also fixes a bug with syscall tracing functions that set registers
(e.g., PTRACE_SETREG) not setting GPRs properly.

There was a bug reported with the TM selftests, I haven't been able
to reproduce that one.

I can squash this into the main patch and resend the series if it
helps but the incremental helps to see the bug fixes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputime.h | 39 +++++++++++++++++-------------
 arch/powerpc/kernel/syscall_64.c   | 26 ++++++++++++++------
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index c43614cffaac..6639a6847cc0 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -44,6 +44,28 @@ static inline unsigned long cputime_to_usecs(const cputime_t ct)
 #ifdef CONFIG_PPC64
 #define get_accounting(tsk)	(&get_paca()->accounting)
 static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
+
+/*
+ * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
+ * can't use use get_paca()
+ */
+static notrace inline void account_cpu_user_entry(void)
+{
+	unsigned long tb = mftb();
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	acct->utime += (tb - acct->starttime_user);
+	acct->starttime = tb;
+}
+static notrace inline void account_cpu_user_exit(void)
+{
+	unsigned long tb = mftb();
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	acct->stime += (tb - acct->starttime);
+	acct->starttime_user = tb;
+}
+
 #else
 #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
 /*
@@ -60,23 +82,6 @@ static inline void arch_vtime_task_switch(struct task_struct *prev)
 }
 #endif
 
-static inline void account_cpu_user_entry(void)
-{
-	unsigned long tb = mftb();
-	struct cpu_accounting_data *acct = get_accounting(current);
-
-	acct->utime += (tb - acct->starttime_user);
-	acct->starttime = tb;
-}
-static inline void account_cpu_user_exit(void)
-{
-	unsigned long tb = mftb();
-	struct cpu_accounting_data *acct = get_accounting(current);
-
-	acct->stime += (tb - acct->starttime);
-	acct->starttime_user = tb;
-}
-
 #endif /* __KERNEL__ */
 #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 static inline void account_cpu_user_entry(void)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 529393a1ff1e..cfe458adde07 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -19,7 +19,8 @@ extern void __noreturn tabort_syscall(void);
 
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
-long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
+/* Has to run notrace because it is entered "unreconciled" */
+notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
 			   unsigned long r0, struct pt_regs *regs)
 {
 	unsigned long ti_flags;
@@ -36,7 +37,7 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
 #ifdef CONFIG_PPC_SPLPAR
 	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
 	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
-		struct lppaca *lp = get_lppaca();
+		struct lppaca *lp = local_paca->lppaca_ptr;
 
 		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
 			accumulate_stolen_time();
@@ -71,13 +72,22 @@ long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
 		 * We use the return value of do_syscall_trace_enter() as the
 		 * syscall number. If the syscall was rejected for any reason
 		 * do_syscall_trace_enter() returns an invalid syscall number
-		 * and the test below against NR_syscalls will fail.
+		 * and the test against NR_syscalls will fail and the return
+		 * value to be used is in regs->gpr[3].
 		 */
 		r0 = do_syscall_trace_enter(regs);
-	}
-
-	if (unlikely(r0 >= NR_syscalls))
+		if (unlikely(r0 >= NR_syscalls))
+			return regs->gpr[3];
+		r3 = regs->gpr[3];
+		r4 = regs->gpr[4];
+		r5 = regs->gpr[5];
+		r6 = regs->gpr[6];
+		r7 = regs->gpr[7];
+		r8 = regs->gpr[8];
+
+	} else if (unlikely(r0 >= NR_syscalls)) {
 		return -ENOSYS;
+	}
 
 	/* May be faster to do array_index_nospec? */
 	barrier_nospec();
@@ -139,8 +149,10 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		regs->gpr[3] = r3;
 	}
 
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE))
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
 		do_syscall_trace_leave(regs);
+		ret |= _TIF_RESTOREALL;
+	}
 
 again:
 	local_irq_disable();
-- 
2.23.0

