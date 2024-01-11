Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B082B83A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 00:48:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YEdBtaAD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Zv46Jjz3cgN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 10:48:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YEdBtaAD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TB1Yz4hVqz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 10:47:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0CDCCE1BAC;
	Thu, 11 Jan 2024 23:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6113C433F1;
	Thu, 11 Jan 2024 23:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705016866;
	bh=bt+QWO+BoyLrTgdPkH5ffD1b3CetCyHlTE9OT4h2Nqc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YEdBtaADUJYv3l2s/GpoCVgW6JEWZCq5/YooIXKpWp+CvCzlwIyzjcFNcFZI7K6zU
	 2AkN7RVa912J2WwPNzelB+fLx8bg3GmSn/WAQm1GrZNH0cSA9xhPeEgvN7xtg1POfA
	 Z7oYxYpGTKKhdxgA6WUsomUZBtL4GSv+4q1sMH2wKvtqsgxxTl+YbKWN/yqlrVvqKJ
	 PzEdbwICAAAmL+rmrhQ236xQL9Txff84KLXr862BVR1wnnq6UX/wtIoFZCLUdJHNLp
	 kuJqNfWOf9VX2tANMnqfS5JGdHpLMqcVSYZXGD1mT+gVlU86H5OAv+90FkXsG7yvpA
	 1PCQRRvxJZ0vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A94C4707B;
	Thu, 11 Jan 2024 23:47:46 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 11 Jan 2024 17:47:32 -0600
Subject: [PATCH RFC] powerpc/pseries: exploit H_PAGE_SET_UNUSED for
 partition migration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240111-h_page_set_unused-for-lpm-v1-1-cd56184ad608@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIABN+oGUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ0ND3Yz4gsT01Pji1JL40rzS4tQU3bT8It2cglzdFEsDI/NkM3OjtFQ
 LJaD+gqLUtMwKsNnRSkFuzkqxtbUAEWfkUHAAAAA=
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Brian King <brking@linux.ibm.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705016866; l=3110;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=QCi+aYIXD+KJwHE/NMLCXj3RgfCu6hT6HPoTPMEKTQE=;
 b=ugyi1ajuyIEOgMBZepRH2Zmbq/HsnGw8iKFxVOLzqV7gXBzP5wWbYUoPQOi7JQCvAyLeAOYHR
 AJVUYmJL3z3AStEOIn11pdccvX/eUsdw119WUzr9imQxQTBXGDalPYO
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Although the H_PAGE_INIT hcall's H_PAGE_SET_UNUSED historically has
been tied to the cooperative memory overcommit (CMO) platform feature,
the flag also is treated by the PowerVM hypervisor as a hint that the
page contents need not be copied to the destination during a live
partition migration.

Use the "ibm,migratable-partition" root node property to determine
whether this partition/guest can be migrated. Mark freed pages unused
if so (or if CMO is in use, as before).

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Several things yet to improve here:

* powerpc's arch_free_page()/HAVE_ARCH_FREE_PAGE should be decoupled
  from CONFIG_PPC_SMLPAR.

* powerpc's arch_free_page() could be made to use a static key if
  justified.

* I have not yet measured the overhead this introduces, nor have I
  measured the benefit to a live migration.

To date, I have smoke tested it by doing a live migration and
performing a build on a kernel with the change, to ensure it doesn't
introduce obvious memory corruption or anything. It hasn't blown up
yet :-)

This will be a possibly significant behavior change in that we will be
flagging pages unused where we typically did not before. Until now,
having CMO enabled was the only way to do this, and I don't think that
feature is used all that much?

Posting this as RFC to see if there are any major concerns.
---
 arch/powerpc/platforms/pseries/lpar.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 4561667832ed..b264371d8e12 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/jump_label.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/stop_machine.h>
 #include <linux/spinlock.h>
 #include <linux/cpuhotplug.h>
@@ -1772,17 +1773,25 @@ static void pSeries_set_page_state(struct page *page, int order,
 	}
 }
 
+static bool migratable_partition;
+
 void arch_free_page(struct page *page, int order)
 {
-	if (radix_enabled())
-		return;
-	if (!cmo_free_hint_flag || !firmware_has_feature(FW_FEATURE_CMO))
-		return;
-
-	pSeries_set_page_state(page, order, H_PAGE_SET_UNUSED);
+	if (migratable_partition ||
+	    (firmware_has_feature(FW_FEATURE_CMO) && cmo_free_hint_flag))
+		pSeries_set_page_state(page, order, H_PAGE_SET_UNUSED);
 }
 EXPORT_SYMBOL(arch_free_page);
 
+static int __init check_migratable_partition(void)
+{
+	struct device_node *root = of_find_node_by_path("/");
+	migratable_partition = !!of_find_property(root, "ibm,migratable-partition", NULL);
+	of_node_put(root);
+	return 0;
+}
+machine_device_initcall(pseries, check_migratable_partition);
+
 #endif /* CONFIG_PPC_SMLPAR */
 #endif /* CONFIG_PPC_BOOK3S_64 */
 

---
base-commit: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
change-id: 20240111-h_page_set_unused-for-lpm-d9027c672fe8

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>

