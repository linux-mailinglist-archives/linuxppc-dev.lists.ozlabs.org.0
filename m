Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7428F609
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:43:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtpk64DkzDqbk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:43:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtn13xyDzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:41:41 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kT4iX-00033D-MN; Thu, 15 Oct 2020 07:59:01 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 9C1B3A7B;
 Thu, 15 Oct 2020 14:58:54 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 870AE80046;
 Thu, 15 Oct 2020 10:58:54 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 4A8B980041;
 Thu, 15 Oct 2020 14:58:54 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/8] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
Date: Thu, 15 Oct 2020 10:01:58 -0500
Message-Id: <20201015150159.28933-8-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015150159.28933-1-cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhV+Ws6hztJumlc
 uUKCTBr4GkTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZy4w
 PvAjpsqvjj/j6hjEzdgwjIM8WZL74q/ySdUU6LOaaqSWR3CtR9MEIpagdB6ZLJxCUthwiNCbVEnS
 TxhZ6WG3Ne7vwRJxFM/BRzDLXKGsjwf70+7do7vxRy98hA8Alvw1GE/Cydn5ZDjy83M8c+f8vC9y
 FJZ0kFGd5mPzJ18ygzP5/CwXu22J6DAXY3ggkQBVGrIwH5DcMOPS6l8pYvFNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0WDioB3wdYQziB29ThgO+dDmRO2CcIQVgm9T5haIwTso17NirEYyqwqMBGrw8ELi
 qAGCinUzIceIVZeUGq0BwEALM997hiPY1Dhpks79eBZCIK/1NH5THMtlYvyHAYGOGqz2oidVuoQM
 okQutY3pHcCHFzboKDhGx0chVC6Uo5u42dYfx3w0UOSIPFYT7DxPDZ/thsOlwXlrY/1FfLIgbj50
 iv/CY0lO9QHafJIclh40pNjMjgRiXNK68tJfSQlj6eHRbb8lOfIHsSlR1sys39tDVPQ6fMev1BMP
 vQ9qu4cW0z6bhalFEM/pjPCQA+BAlo2exN4rIyDxAwdFay68ibBBU4MSKwhxpck6GKs/b5nlhsHQ
 Ynb1+jMoZH+dWfTjPchS3hoJiFyfShemLdHVBPkccBIk1Sag4dKiqCrF8eZZ2JQOV7YeCU/nH7VP
 YQUF6miSHMVR5PUYCUn23x4KxDWEsp/4Rc0ibom45EaZ+jH70SpiTcBMjaVNXusG29JNM/FwFrCM
 gF7qmvibHcom4Xs1kcXIMx5L8kYhlDaATOXwf2rRpkjepuFexoN0uBb1uvFaGANj6294XpDomNnc
 ZPfKm1Gh3kmZq/No0dQDlNJDX08R/JWDw0CYv7aEV0QauA==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Add uaccess blocks and use the 'unsafe' versions of functions doing user
access where possible to reduce the number of times uaccess has to be
opened/closed.

There is no 'unsafe' version of copy_siginfo_to_user, so move it
slightly to allow for a "longer" uaccess block.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 54 ++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 6d4f7a5c4fbf..3b97e3681a8f 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -843,46 +843,42 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
 #endif
-
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 
-	err |= __put_user(&frame->info, &frame->pinfo);
-	err |= __put_user(&frame->uc, &frame->puc);
-	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
-	if (err)
-		goto badframe;
+	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
+	unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
 
 	/* Create the ucontext.  */
-	err |= __put_user(0, &frame->uc.uc_flags);
-	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
+	unsafe_put_user(0, &frame->uc.uc_flags, badframe_block);
+	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], badframe_block);
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
 		/* The ucontext_t passed to userland points to the second
 		 * ucontext_t (for transactional state) with its uc_link ptr.
 		 */
-		err |= __put_user(&frame->uc_transact, &frame->uc.uc_link);
+		unsafe_put_user(&frame->uc_transact, &frame->uc.uc_link, badframe_block);
+		user_write_access_end();
 		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
 					    &frame->uc_transact.uc_mcontext,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
+		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
+			goto badframe;
+
 	} else
 #endif
 	{
-		err |= __put_user(0, &frame->uc.uc_link);
-
-		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
-			return -EFAULT;
-		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
-						ksig->sig, NULL,
-						(unsigned long)ksig->ka.sa.sa_handler, 1);
-		user_write_access_end();
+		unsafe_put_user(0, &frame->uc.uc_link, badframe_block);
+		unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
+					NULL, (unsigned long)ksig->ka.sa.sa_handler,
+					1, badframe_block);
 	}
-	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
-	if (err)
-		goto badframe;
+
+	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
 
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
@@ -891,15 +887,17 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
 		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
 	} else {
-		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
-			return -EFAULT;
-		err |= __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
-		user_write_access_end();
-		if (err)
-			goto badframe;
+		unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0],
+					badframe_block);
 		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
+	user_write_access_end();
+
+	/* Save the siginfo outside of the unsafe block. */
+	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+		goto badframe;
+
 	/* Allocate a dummy caller frame for the signal handler. */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
@@ -939,6 +937,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	return 0;
 
+badframe_block:
+	user_write_access_end();
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
 
-- 
2.28.0

