Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE797462D7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 08:30:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3DQQ4SRWz3cSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 18:30:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kt7h10ge;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Kt7h10ge; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3DPl0xgRz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 18:29:44 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so13326215pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 23:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fT1fMdsuC6Jw21/6Qn6LP/Ttbuo4JuePGOBG3eeItQ=;
 b=Kt7h10geLbxLUo6czwqtxLTry+wUOwPdlQmJdw1p90NOcx3PnJyUrskte/Va+NHfQj
 hhmC6odM3Z/aikgIuHmDhg5Uj/aGnXr+zK48ZJXni6l07BlVL/bDzWq1gYEuA6vfZbUK
 qIvMz6aaJ5UGwhHN+mev7bqWMkwUsgjoZ87D2sToF24DIXGyKI40H624N0DVLdpERzbe
 heLfGJl9SxRVIjX1NHkorIyTX56jdGahG039NkMkvEANOzqu+cKnLpGgS2m6/8So0y4d
 Z3INcSH3GhLg7u3kx+cSl0FhA4PXgHkK85FsljTOjL//WjaQGR5+oEdPLNofDF1ojoTz
 BI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fT1fMdsuC6Jw21/6Qn6LP/Ttbuo4JuePGOBG3eeItQ=;
 b=i65M8HIfZgW2hlEFTVdS70vpzIn9WX0ImgtS5dtr/vs4qB9sq8c5X6jkdLhjlY4eOT
 B7DhK7lVdyU6nxf4sopGiufmSrwd1IJs7PDyzUKEju07+wmQUTj0HyVkELS5+C9y2G8B
 fIGTY6wvS9UTxEw/FWcYDi72BAXhr/t9rFaa6WteGOgTFFl5OSZDW63ATlx74zk+WCxu
 E6ltRj0UrFnO5WgIFxx13wRNVJWrn6W3rXq/StgYNQkOI9MlNU/cprzswBy7KCoyIqWz
 yoGTKKYxtW2hkolFTS+EIDTmexdEvdx4EsnR0432FjJByufF0hDvxoJ4wUO1ZplB4R8j
 vpnw==
X-Gm-Message-State: AOAM532NhUSqEqpzO3G3qeFxqUBuIB1KQyEJeUciOhdVkWz6PlFShl4k
 vMKAfd8w5dXFJy40lzJFlI+qaa744wk=
X-Google-Smtp-Source: ABdhPJzreLQH9gecLGDngX0+vrkBGIC3PYVu4rOoR9Q1ihlQB1qm85WQVXyz5cSdISjZ9h8c/MLHpA==
X-Received: by 2002:a17:90b:4c44:: with SMTP id
 np4mr3984446pjb.195.1638257380085; 
 Mon, 29 Nov 2021 23:29:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id g5sm1417277pjt.15.2021.11.29.23.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 23:29:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/signal: sanitise PT_NIP and sa_handler low bits
Date: Tue, 30 Nov 2021 17:29:33 +1000
Message-Id: <20211130072933.2004389-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The bottom 2 bits of NIP are ignored when RFI returns with SRR0 = NIP,
so regs->nip does not correspond to the actual return address if either
of those bits are set. Further, these bits are reserved in SRR0 so they
should not be set. Sanitize PT_NIP from signal handlers to ensure they
can't be set by userspace, this also keeps the low 2 bit of TFHAR clear,
which are similarly reserved. 32-bit signal delivery returns directly to
the handler, so sa_handler is sanitised similarly there.

This can cause a bug when CONFIG_PPC_RFI_SRR_DEBUG=y on a processor that
does not implement the 2 low bits of SRR0 (always read back 0) because
SRR0 will not match regs->nip. This was caught by sigfuz, but a simple
reproducer follows.

  #include <stdlib.h>
  #include <signal.h>
  #include <ucontext.h>

  static void trap_signal_handler(int signo, siginfo_t *si, void *uc)
  {
      ucontext_t *ucp = uc;
      ucp->uc_mcontext.gp_regs[PT_NIP] |= 3;
  }

  int main(void)
  {
      struct sigaction trap_sa;
      trap_sa.sa_flags = SA_SIGINFO;
      trap_sa.sa_sigaction = trap_signal_handler;
      sigaction(SIGUSR1, &trap_sa, NULL);
      raise(SIGUSR1);
      exit(EXIT_SUCCESS);
  }

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
I'm not entirely sure about the 32-bit / compat part. Or the 64-bit for
that matter except that it does seem to fix the bug caused by the test
program.

Thanks,
Nick

 arch/powerpc/kernel/signal_32.c | 23 ++++++++++++++++-------
 arch/powerpc/kernel/signal_64.c | 17 ++++++++++++-----
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 3e053e2fd6b6..5379bece8072 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -116,7 +116,7 @@ __unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __user *sr)
 	int i;
 
 	for (i = 0; i <= PT_RESULT; i++) {
-		if ((i == PT_MSR) || (i == PT_SOFTE))
+		if ((i == PT_NIP) || (i == PT_MSR) || (i == PT_SOFTE))
 			continue;
 		unsafe_get_user(gregs[i], &sr->mc_gregs[i], failed);
 	}
@@ -156,7 +156,7 @@ static __always_inline
 int __unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __user *sr)
 {
 	/* copy up to but not including MSR */
-	unsafe_copy_from_user(regs, &sr->mc_gregs, PT_MSR * sizeof(elf_greg_t), failed);
+	unsafe_copy_from_user(regs, &sr->mc_gregs, PT_NIP * sizeof(elf_greg_t), failed);
 
 	/* copy from orig_r3 (the word after the MSR) up to the end */
 	unsafe_copy_from_user(&regs->orig_gpr3, &sr->mc_gregs[PT_ORIG_R3],
@@ -458,7 +458,7 @@ static long restore_user_regs(struct pt_regs *regs,
 			      struct mcontext __user *sr, int sig)
 {
 	unsigned int save_r2 = 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 #ifdef CONFIG_VSX
 	int i;
 #endif
@@ -473,6 +473,9 @@ static long restore_user_regs(struct pt_regs *regs,
 		save_r2 = (unsigned int)regs->gpr[2];
 	unsafe_restore_general_regs(regs, sr, failed);
 	set_trap_norestart(regs);
+	unsafe_get_user(nip, &sr->mc_gregs[PT_NIP], failed);
+	nip &= ~3UL;
+	regs_set_return_ip(regs, nip);
 	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
 	if (!sig)
 		regs->gpr[2] = (unsigned long) save_r2;
@@ -560,7 +563,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 				 struct mcontext __user *sr,
 				 struct mcontext __user *tm_sr)
 {
-	unsigned long msr, msr_hi;
+	unsigned long nip, msr, msr_hi;
 	int i;
 
 	if (tm_suspend_disabled)
@@ -576,7 +579,9 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		return 1;
 
 	unsafe_restore_general_regs(&current->thread.ckpt_regs, sr, failed);
-	unsafe_get_user(current->thread.tm_tfhar, &sr->mc_gregs[PT_NIP], failed);
+	unsafe_get_user(nip, &sr->mc_gregs[PT_NIP], failed);
+	nip &= ~3UL;
+	current->thread.tm_tfhar = nip;
 	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
 
 	/* Restore the previous little-endian mode */
@@ -646,6 +651,10 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		current->thread.used_vsr = true;
 	}
 
+	unsafe_get_user(nip, &tm_sr->mc_gregs[PT_NIP], failed);
+	nip &= ~3UL;
+	regs_set_return_ip(regs, nip);
+
 	/* Get the top half of the MSR from the user context */
 	unsafe_get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR], failed);
 	msr_hi <<= 32;
@@ -801,7 +810,7 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->gpr[4] = (unsigned long)&frame->info;
 	regs->gpr[5] = (unsigned long)&frame->uc;
 	regs->gpr[6] = (unsigned long)frame;
-	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler & ~3UL);
 	/* enter the signal handler in native-endian mode */
 	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
 
@@ -889,7 +898,7 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->gpr[1] = newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->gpr[4] = (unsigned long) sc;
-	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler & ~3UL);
 	/* enter the signal handler in native-endian mode */
 	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
 
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d1e1fc0acbea..5ef24adb9803 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -336,7 +336,7 @@ static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_
 	elf_vrreg_t __user *v_regs;
 #endif
 	unsigned long save_r13 = 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 	struct pt_regs *regs = tsk->thread.regs;
 #ifdef CONFIG_VSX
 	int i;
@@ -350,7 +350,9 @@ static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_
 
 	/* copy the GPRs */
 	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr), efault_out);
-	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
+	unsafe_get_user(nip, &sc->gp_regs[PT_NIP], efault_out);
+	nip &= ~3UL;
+	regs_set_return_ip(regs, nip);
 	/* get MSR separately, transfer the LE bit if doing signal return */
 	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
 	if (sig)
@@ -434,7 +436,7 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	elf_vrreg_t __user *v_regs, *tm_v_regs;
 #endif
 	unsigned long err = 0;
-	unsigned long msr;
+	unsigned long nip, msr;
 	struct pt_regs *regs = tsk->thread.regs;
 #ifdef CONFIG_VSX
 	int i;
@@ -458,8 +460,13 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	 * For the case of getting a signal and simply returning from it,
 	 * we don't need to re-copy them here.
 	 */
-	err |= __get_user(regs->nip, &tm_sc->gp_regs[PT_NIP]);
-	err |= __get_user(tsk->thread.tm_tfhar, &sc->gp_regs[PT_NIP]);
+	err |= __get_user(nip, &tm_sc->gp_regs[PT_NIP]);
+	nip &= ~3UL;
+	regs_set_return_ip(regs, nip);
+
+	err |= __get_user(nip, &sc->gp_regs[PT_NIP]);
+	nip &= ~3UL;
+	tsk->thread.tm_tfhar = nip;
 
 	/* get MSR separately, transfer the LE bit if doing signal return */
 	err |= __get_user(msr, &sc->gp_regs[PT_MSR]);
-- 
2.23.0

