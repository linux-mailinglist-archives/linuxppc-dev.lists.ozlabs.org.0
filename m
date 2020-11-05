Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607F2A770F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:27:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRX876BrlzDqfJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:27:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrg1ckGzDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:39 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kaXaW-0000Zb-86; Wed, 04 Nov 2020 21:13:36 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 9E340A79;
 Thu,  5 Nov 2020 05:13:29 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 8858C80046;
 Thu,  5 Nov 2020 00:13:29 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 4396380041;
 Thu,  5 Nov 2020 05:13:29 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/8] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
Date: Wed,  4 Nov 2020 23:17:00 -0600
Message-Id: <20201105051701.25053-8-cmr@codefail.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201105051701.25053-1-cmr@codefail.de>
References: <20201105051701.25053-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00912434020285)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhV6KZMF9bgejyY
 sprmQT/sSUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZy4w
 PvAjpsqvjj/j6hjEzdgwjIM8WZL74q/ySdUU6LOaaqSWR3CtR9MEIpagdB6ZLHZwcSDxDnveMu7U
 uOveN7O3Ne7vwRJxFM/BRzDLXKGsjwf70+7do7vxRy98hA8Alvw1GE/Cydn5ZDjy83M8c+f8vC9y
 FJZ0kFGd5mPzJ18ygzP5/CwXu22J6DAXY3ggkQBVGrIwH5DcMOPS6l8pYvFNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0WDioB3wdYQziB29ThgO+dDGuexHqoM8MMZ/+Vt6fmBOrXsVtdb5vXHsmjrM3PMl
 +bwqyT5p50x81ZKcmzCu2U1nS+fo8RPkdhnEE0g/KB9GdlzeqgLHqMHcMQ9hN/g2idwbqGxFBmIA
 iDD7PzfsCqBft7Ajx7WHtEhOA3XgEeYZW39F4n0x+HPOZspMfvAj0YRTW602yRQA5EJXZYVlfSNb
 7LsWe1T/HBot8r+VrUoMXuUtdBRw0CzMOyehQ6vQGLF09LEgAzUFM3w35U3rtF4kifyOlZVz+Ubf
 ZoWWBe3r7o8DebwK9n0BDYMYTfypr0++GRKi3fJfRTPr/PuJHE14Rl1ncZ3/2Ly7gkIlz7EOQVDg
 U8x/XonV574CjYPqsbK4t8eoCcCPuuAofv54Kaa7xNr2BiqQrzgjw1SfkZklVKFwDpe+9rZABUSO
 mrMA1t06xDMGattwo1uV8C85T2sDuqZMQd8MRn7MIVJyXHM9WxeQXKq4zKXxIidNa/vJ3chBkF1n
 BDIDda3A4W6X/AKQNp0AAtPqH+KJLPpSUJn7dvBbxPsvBDzFahmXZhm6GOijHBtexFH6/O9QemIW
 oIwDla26yemspyrEDYfZa91p0pRdPKxLj4jcJSWgPFoMJ6qhJBzU5fwG//sGHps/u1ExL7hrJSk6
 0SF3F6RYOYr2
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
Co-developed-by: Christopher M. Riedl <cmr@codefail.de>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 54 +++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d72153825719..d17f2d5436d2 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -848,44 +848,51 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long msr __maybe_unused = regs->msr;
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
-	if (!access_ok(frame, sizeof(*frame)))
-		goto badframe;
 
-	err |= __put_user(&frame->info, &frame->pinfo);
-	err |= __put_user(&frame->uc, &frame->puc);
-	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
-	if (err)
+	/* This only applies when calling unsafe_setup_sigcontext() and must be
+	 * called before opening the uaccess window.
+	 */
+	if (!MSR_TM_ACTIVE(msr))
+		prepare_setup_sigcontext(tsk, 1);
+
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 
+	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
+	unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
+
 	/* Create the ucontext.  */
-	err |= __put_user(0, &frame->uc.uc_flags);
-	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
+	unsafe_put_user(0, &frame->uc.uc_flags, badframe_block);
+	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], badframe_block);
 
 	if (MSR_TM_ACTIVE(msr)) {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* The ucontext_t passed to userland points to the second
 		 * ucontext_t (for transactional state) with its uc_link ptr.
 		 */
-		err |= __put_user(&frame->uc_transact, &frame->uc.uc_link);
+		unsafe_put_user(&frame->uc_transact, &frame->uc.uc_link, badframe_block);
+
+		user_write_access_end();
+
 		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
 					    &frame->uc_transact.uc_mcontext,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
+
+		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
+			goto badframe;
+
 #endif
 	} else {
-		err |= __put_user(0, &frame->uc.uc_link);
-		prepare_setup_sigcontext(tsk, 1);
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
+	user_write_access_end();
 
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
@@ -900,6 +907,11 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
+
+	/* Save the siginfo outside of the unsafe block. */
+	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+		goto badframe;
+
 	/* Allocate a dummy caller frame for the signal handler. */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
@@ -939,6 +951,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	return 0;
 
+badframe_block:
+	user_write_access_end();
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
 
-- 
2.29.0

