Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D2C28F5FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:39:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtkJ2sNNzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:39:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBthR4g3MzDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:37:43 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kT4iW-0005UZ-IH; Thu, 15 Oct 2020 07:59:00 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id EB0D6A7C;
 Thu, 15 Oct 2020 14:58:54 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id D604180046;
 Thu, 15 Oct 2020 10:58:54 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 988E480041;
 Thu, 15 Oct 2020 14:58:54 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 8/8] powerpc/signal64: Rewrite rt_sigreturn() to minimise
 uaccess switches
Date: Thu, 15 Oct 2020 10:01:59 -0500
Message-Id: <20201015150159.28933-9-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00661351288243)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhVefBEIY/VcD6Y
 e98G5Jv/BETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZy4w
 PvAjpsqvjj/j6hjEzdgwjIM8WZL74q/ySdUU6LOaaqSWR3CtR9MEIpagdB6ZLLruW6NftI6lTnQ9
 3yWuMgu3Ne7vwRJxFM/BRzDLXKGsjwf70+7do7vxRy98hA8Alvw1GE/Cydn5ZDjy83M8c+f8vC9y
 FJZ0kFGd5mPzJ18yHavRZN07VQcPQEjVP5ZDIABVGrIwH5DcMOPS6l8pYvFNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0WDioB3wdYQziB29ThgO+dDGuexHqoM8MMZ/+Vt6fmBOrXsVtdb5vXHsmjrM3PMl
 +bwqyT5p50x81ZKcmzCu2U1nS+fo8RPkdhnEE0g/KB9GdlzeqgLHqMHcMQ9hN/g2idwbqGxFBmIA
 iDD7PzfsCqBft7Ajx7WHtEhOA3XgEeYZW39F4n0x+HPOZspMfvAj0YRTW602yRQA5EJXZYVlfSNb
 7LsWe1T/HBot8r+VrUoMXuUtdBRw0CzMOyehQ6vQGMh5Ecexmm2yHNzstWvfJEQkifyOlZVz+Ubf
 ZoWWBe3r7o8DebwK9n0BDYMYTfypr0++GRKi3fJfRTPr/PuJHE14Rl1ncZ3/2Ly7gkIlz7EOQVDg
 U8x/XonV574CjYPqsbK4t8eoCcCPuuAofv54KaZUAAggJKUhthGyTFbmz2wJVKFwDpe+9rZABUSO
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

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 3b97e3681a8f..0f4ff7a5bfc1 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -779,18 +779,22 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	 */
 	regs->msr &= ~MSR_TS_MASK;
 
-	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
+	if (!user_read_access_begin(uc, sizeof(*uc)))
 		goto badframe;
+
+	unsafe_get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR], badframe_block);
+
 	if (MSR_TM_ACTIVE(msr)) {
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
 
 		/* Trying to start TM on non TM system */
 		if (!cpu_has_feature(CPU_FTR_TM))
-			goto badframe;
+			goto badframe_block;
+
+		unsafe_get_user(uc_transact, &uc->uc_link, badframe_block);
+		user_read_access_end();
 
-		if (__get_user(uc_transact, &uc->uc_link))
-			goto badframe;
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
@@ -810,12 +814,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * causing a TM bad thing.
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
+
+#ifndef CONFIG_PPC_TRANSACTIONAL_MEM
 		if (!user_read_access_begin(uc, sizeof(*uc)))
-			return -EFAULT;
-		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
-			user_read_access_end();
 			goto badframe;
-		}
+#endif
+		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
+					  badframe_block);
 		user_read_access_end();
 	}
 
@@ -825,6 +830,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
 
+badframe_block:
+	user_read_access_end();
 badframe:
 	signal_fault(current, regs, "rt_sigreturn", uc);
 
-- 
2.28.0

