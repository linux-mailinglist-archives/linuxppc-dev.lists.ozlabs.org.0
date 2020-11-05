Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D182A76DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:21:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRX1F6ZMdzDqsW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:21:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrb5yL6zDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:35 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kaXaV-000904-5a; Wed, 04 Nov 2020 21:13:33 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 01D1DA7A;
 Thu,  5 Nov 2020 05:13:30 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id E1ECD80046;
 Thu,  5 Nov 2020 00:13:29 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 9D17580041;
 Thu,  5 Nov 2020 05:13:29 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 8/8] powerpc/signal64: Rewrite rt_sigreturn() to minimise
 uaccess switches
Date: Wed,  4 Nov 2020 23:17:01 -0600
Message-Id: <20201105051701.25053-9-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00797005296031)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVUUA+VL+M+Nt+
 fkPKrD5600TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZy4w
 PvAjpsqvjj/j6hjEzdgwjIM8WZL74q/ySdUU6LOaaqSWR3CtR9MEIpagdB6ZLDOOGcQ6QEI752Lr
 rtEJgre3Ne7vwRJxFM/BRzDLXKGsjwf70+7do7vxRy98hA8Alvw1GE/Cydn5ZDjy83M8c+f8vC9y
 FJZ0kFGd5mPzJ18yHavRZN07VQcPQEjVP5ZDIABVGrIwH5DcMOPS6l8pYvFNxaypTbp28NxghjNo
 pU/Oaqj4KISIRSJ5MfjE8OaunZEyYYf7TmlI3iEcqXK4A61ChHMQHCMEWTX9HEhwSP4/MSl+mev0
 M9cO0xP2892D0WDioB3wdYQziB29ThgO+dDGuexHqoM8MMZ/+Vt6fmBOrXsVtdb5vXHsmjrM3PMl
 +bwqyT5p50x81ZKcmzCu2U1nS+fo8RPkdhnEE0g/KB9GdlzeqgLHqMHcMQ9hN/g2idwbqGxFBmIA
 iDD7PzfsCqBft7Ajx7WHtEhOA3XgEeYZW39F4n0x+HPOZspMfvAj0YRTW602yRQA5EJXZYVlfSN2
 haDPqOlEeyhkq0kKCW9CXuUtdBRw0CzMOyehQ6vQGEwjpCxssZCwSZB41xsmNlUkifyOlZVz+Ubf
 ZoWWBe3r7o8DebwK9n0BDYMYTfypr0++GRKi3fJfRTPr/PuJHE14Rl1ncZ3/2Ly7gkIlz7EOQVDg
 U8x/XonV574CjYPqsbK4t8eoCcCPuuAofv54KabvTyIs44FG5kw5focafUugVKFwDpe+9rZABUSO
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
Co-developed-by: Christopher M. Riedl <cmr@codefail.de>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d17f2d5436d2..82e68a508e5c 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -784,8 +784,11 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	regs->msr &= ~MSR_TS_MASK;
 #endif
 
-	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
+	if (!user_read_access_begin(uc, sizeof(*uc)))
 		goto badframe;
+
+	unsafe_get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR], badframe_block);
+
 	if (MSR_TM_ACTIVE(msr)) {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* We recheckpoint on return. */
@@ -793,10 +796,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
 
 		/* Trying to start TM on non TM system */
 		if (!cpu_has_feature(CPU_FTR_TM))
-			goto badframe;
+			goto badframe_block;
+
+		unsafe_get_user(uc_transact, &uc->uc_link, badframe_block);
+
+		user_read_access_end();
 
-		if (__get_user(uc_transact, &uc->uc_link))
-			goto badframe;
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
@@ -815,12 +820,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * causing a TM bad thing.
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
-		if (!user_read_access_begin(uc, sizeof(*uc)))
-			return -EFAULT;
-		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
-			user_read_access_end();
-			goto badframe;
-		}
+		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
+					  badframe_block);
+
 		user_read_access_end();
 	}
 
@@ -830,6 +832,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
 
+badframe_block:
+	user_read_access_end();
 badframe:
 	signal_fault(current, regs, "rt_sigreturn", uc);
 
-- 
2.29.0

