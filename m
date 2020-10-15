Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5428F5C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:24:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtPP0zCMzDqg5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.82;
 helo=se17-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-3.privateemail.com (se17-3.privateemail.com
 [198.54.127.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtLV0tYmzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:22:09 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kT4iV-0007rl-K3; Thu, 15 Oct 2020 07:58:57 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 49BEBA79;
 Thu, 15 Oct 2020 14:58:54 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 357C580051;
 Thu, 15 Oct 2020 10:58:54 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id EAF6380041;
 Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/8] powerpc/signal64: Replace setup_trampoline() w/
 unsafe_setup_trampoline()
Date: Thu, 15 Oct 2020 10:01:57 -0500
Message-Id: <20201015150159.28933-7-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00442090784405)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhVNtKkxyIswddP
 mMM+St0E/UTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZy4w
 PvAjpsqvjj/j6hjEzdgwjIM8WZL74q/ySdUU6LOaaqSWR3CtR9MEIpagdB6ZLItBp0ZKBmNWQvqk
 vDS0Ww23Ne7vwRJxFM/BRzDLXKGsjwf70+7do7vxRy98hA8Alvw1GE/Cydn5ZDjy83M8c+f8vC9y
 FJZ0kFGd5mPzJ18yEkFMgnpRObkTI0d8VNc23gBVGrIwH5DcMOPS6l8pYvFNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0WDioB3wdYQziB29ThgO+dDGuexHqoM8MMZ/+Vt6fmBOrXsVtdb5vXHsmjrM3PMl
 +bwqyT5p50x81ZKcmzCu2U1nS+fo8RPkdhnEE0g/KB9GdlzeqgLHqMHcMQ9hN/g2idwbqGxFBmIA
 iDD7PzfsCqBft7Ajx7WHtEhOA3XgEeYZW39F4n0x+HPOZspMfvAj0YRTW602yRQA5EJXZYVlfSNb
 7LsWe1T/HBot8r+VrUoMXuUtdBRw0CzMOyehQ6vQGMkQt7SVjG/Wt9q2MCBOO8okifyOlZVz+Ubf
 ZoWWBe3r7o8DebwK9n0BDYMYTfypr0++GRKi3fJfRTPr/PuJHE14Rl1ncZ3/2Ly7gkIlz7EOQVDg
 U8x/XonV574CjYPqsbK4t8eoCcCPuuAofv54KabNMIAIBiaK9DtmHf+mwe4RVKFwDpe+9rZABUSO
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

Previously setup_trampoline() performed a costly KUAP switch on every
uaccess operation. These repeated uaccess switches cause a significant
drop in signal handling performance.

Rewrite setup_trampoline() to assume that a userspace write access
window is open. Replace all uaccess functions with their 'unsafe'
versions to avoid the repeated uaccess switches.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index bd92064e5576..6d4f7a5c4fbf 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -600,30 +600,33 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 /*
  * Setup the trampoline code on the stack
  */
-static long setup_trampoline(unsigned int syscall, unsigned int __user *tramp)
+#define unsafe_setup_trampoline(syscall, tramp, e) \
+	unsafe_op_wrap(__unsafe_setup_trampoline(syscall, tramp), e)
+static long notrace __unsafe_setup_trampoline(unsigned int syscall,
+					unsigned int __user *tramp)
 {
 	int i;
-	long err = 0;
 
 	/* bctrl # call the handler */
-	err |= __put_user(PPC_INST_BCTRL, &tramp[0]);
+	unsafe_put_user(PPC_INST_BCTRL, &tramp[0], err);
 	/* addi r1, r1, __SIGNAL_FRAMESIZE  # Pop the dummy stackframe */
-	err |= __put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
-			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1]);
+	unsafe_put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
+			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1], err);
 	/* li r0, __NR_[rt_]sigreturn| */
-	err |= __put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2]);
+	unsafe_put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2], err);
 	/* sc */
-	err |= __put_user(PPC_INST_SC, &tramp[3]);
+	unsafe_put_user(PPC_INST_SC, &tramp[3], err);
 
 	/* Minimal traceback info */
 	for (i=TRAMP_TRACEBACK; i < TRAMP_SIZE ;i++)
-		err |= __put_user(0, &tramp[i]);
+		unsafe_put_user(0, &tramp[i], err);
 
-	if (!err)
-		flush_icache_range((unsigned long) &tramp[0],
-			   (unsigned long) &tramp[TRAMP_SIZE]);
+	flush_icache_range((unsigned long)&tramp[0],
+			   (unsigned long)&tramp[TRAMP_SIZE]);
 
-	return err;
+	return 0;
+err:
+	return 1;
 }
 
 /*
@@ -888,7 +891,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
 		regs->nip = tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
 	} else {
-		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
+		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
+			return -EFAULT;
+		err |= __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
+		user_write_access_end();
 		if (err)
 			goto badframe;
 		regs->nip = (unsigned long) &frame->tramp[0];
-- 
2.28.0

