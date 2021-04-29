Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448D36E607
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 09:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW6dg33yPz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 17:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050:1::465:209;
 helo=mout-y-209.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
X-Greylist: delayed 574 seconds by postgrey-1.36 at boromir;
 Thu, 29 Apr 2021 17:31:10 AEST
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org
 [IPv6:2001:67c:2050:1::465:209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW6cZ4gp5z2yjc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 17:31:09 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4FW6PS25tRzQjnf;
 Thu, 29 Apr 2021 09:21:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id NN2a4URMhZGs; Thu, 29 Apr 2021 09:21:29 +0200 (CEST)
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/11] lkdtm/x86_64: Add test to hijack a patch mapping
Date: Thu, 29 Apr 2021 02:20:50 -0500
Message-Id: <20210429072057.8870-5-cmr@bluescreens.de>
In-Reply-To: <20210429072057.8870-1-cmr@bluescreens.de>
References: <20210429072057.8870-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 1.26 / 15.00 / 15.00
X-Rspamd-Queue-Id: 519EF17E8
X-Rspamd-UID: c86d02
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A previous commit implemented an LKDTM test on powerpc to exploit the
temporary mapping established when patching code with STRICT_KERNEL_RWX
enabled. Extend the test to work on x86_64 as well.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
---
 drivers/misc/lkdtm/perms.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
index c6f96ebffccfd..55c3bec6d3b72 100644
--- a/drivers/misc/lkdtm/perms.c
+++ b/drivers/misc/lkdtm/perms.c
@@ -224,7 +224,7 @@ void lkdtm_ACCESS_NULL(void)
 }
 
 #if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
-	defined(CONFIG_PPC))
+	(defined(CONFIG_PPC) || defined(CONFIG_X86_64)))
 /*
  * This is just a dummy location to patch-over.
  */
@@ -233,28 +233,51 @@ static void patching_target(void)
 	return;
 }
 
+#ifdef CONFIG_PPC
 #include <asm/code-patching.h>
 struct ppc_inst * const patch_site = (struct ppc_inst *)&patching_target;
+#endif
+
+#ifdef CONFIG_X86_64
+#include <asm/text-patching.h>
+u32 * const patch_site = (u32 *)&patching_target;
+#endif
 
 static inline int lkdtm_do_patch(u32 data)
 {
+#ifdef CONFIG_PPC
 	return patch_instruction(patch_site, ppc_inst(data));
+#endif
+#ifdef CONFIG_X86_64
+	text_poke(patch_site, &data, sizeof(u32));
+	return 0;
+#endif
 }
 
 static inline u32 lkdtm_read_patch_site(void)
 {
+#ifdef CONFIG_PPC
 	struct ppc_inst inst = READ_ONCE(*patch_site);
 	return ppc_inst_val(ppc_inst_read(&inst));
+#endif
+#ifdef CONFIG_X86_64
+	return READ_ONCE(*patch_site);
+#endif
 }
 
 /* Returns True if the write succeeds */
 static inline bool lkdtm_try_write(u32 data, u32 *addr)
 {
+#ifdef CONFIG_PPC
 	__put_kernel_nofault(addr, &data, u32, err);
 	return true;
 
 err:
 	return false;
+#endif
+#ifdef CONFIG_X86_64
+	return !__put_user(data, addr);
+#endif
 }
 
 static int lkdtm_patching_cpu(void *data)
@@ -347,8 +370,8 @@ void lkdtm_HIJACK_PATCH(void)
 
 void lkdtm_HIJACK_PATCH(void)
 {
-	if (!IS_ENABLED(CONFIG_PPC))
-		pr_err("XFAIL: this test only runs on powerpc\n");
+	if (!IS_ENABLED(CONFIG_PPC) && !IS_ENABLED(CONFIG_X86_64))
+		pr_err("XFAIL: this test only runs on powerpc and x86_64\n");
 	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
 		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
 	if (!IS_BUILTIN(CONFIG_LKDTM))
-- 
2.26.1

