Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F4B326AF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 02:13:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnT7L07Kmz3d6j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 12:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnT6g4tFmz3cYK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 12:13:15 +1100 (AEDT)
Received: from MTA-14-4.privateemail.com (mta-14.privateemail.com
 [198.54.118.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id E047380D7C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:11 -0500 (EST)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 5B5B480087;
 Fri, 26 Feb 2021 20:13:09 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.203])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 1B77080086;
 Sat, 27 Feb 2021 01:13:09 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 09/10] powerpc/signal64: Rewrite rt_sigreturn() to minimise
 uaccess switches
Date: Fri, 26 Feb 2021 19:12:58 -0600
Message-Id: <20210227011259.11992-10-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210227011259.11992-1-cmr@codefail.de>
References: <20210227011259.11992-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
 arch/powerpc/kernel/signal_64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 788854734b9a..00c907022707 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -822,11 +822,11 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
 		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext)))
-			return -EFAULT;
-		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
-			user_read_access_end();
 			goto badframe;
-		}
+
+		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
+					  badframe_block);
+
 		user_read_access_end();
 	}
 
@@ -836,6 +836,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
 
+badframe_block:
+	user_read_access_end();
 badframe:
 	signal_fault(current, regs, "rt_sigreturn", uc);
 
-- 
2.26.1

