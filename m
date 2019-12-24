Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B3129E2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 07:43:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hmrP1GKBzDqLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="OtaCisGT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bvyOJlC3"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hmph1SwVzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 17:41:48 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 38B8921D51;
 Tue, 24 Dec 2019 01:41:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 01:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=rtj/7hIjt1tw1EMAQkHvGXSlMO
 R7mLvY3RUuvJp9mpw=; b=OtaCisGTuxgVEtGx0Qs0NNbckvk9I35N6hPwQNiVSO
 QmAw9RLS0PTHoUI5f0qcdY7Io6mPbGY9tkBhpgZ/gYvIiB+8f59n1Wh/VZuEjy7K
 aOGYDuU4KInHcaPLhcAnh4ODTzHUTuKvJukxtyZgk6wqXzOV2eIuvDjsa97EiNJ+
 k3psk4cx5/xWgHEPlfv6rT6uRI3D0MzcVBUI9aU9IPWgkvd2g0b3fVHBXMmnLsqv
 O/AeFDsYSycRyLAoNkUnyUsd0xxe6XD6XmeOx1xhXgwVOE/x5Y0aXLrV4KGspR//
 Nvi8mM+MQ/R5EGPqd23crb6SRZmFuAzsOonAltaGCT3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rtj/7hIjt1tw1EMAQ
 kHvGXSlMOR7mLvY3RUuvJp9mpw=; b=bvyOJlC3CKRi3MNsPeMJOLfczY3Dl7Ryn
 7yH7woMByuEJ1Tbb17w1JJpyGz0YdKdI4l3Q95+ZCsTepCF5wjeGnn00l8aRqM5/
 03VY2r7/Hj6nUe1iJBEN90JnnGmsWEoDu/nGu/ikWm/xSamg1oc5Voy7wGNCla0u
 m6hMOGWpkFdEnhRmO7ZE0JYk/NQWqozkRSY3ECZ4qp4+KauiJx8IqTlUjxUPyY2E
 YUcgfp4IvRpmQ1xM7jay4B5Ka9b/W6RZrinz0FLAg/2GeLzDf4etJc278+FiZjCU
 4+bJjVbQhcJZAPyMlfl5J1O3ljqxzy41JR3v1EpAX7bH+6myoi+Yw==
X-ME-Sender: <xms:J7MBXvGrZJMJLK334V8wUoBCRVKzJwA4SRnMdPSK_6eykL8-geVXSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgih
 uceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrd
 dutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgt
 tgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:J7MBXor1A_zoX1EFfSQaB26r4TuP8IgyNSsJPPD9ZQ5PVV8W2FlpRQ>
 <xmx:J7MBXl3NXKaozps_al_ilxx1DXJ9M8IGX9QcftrM5aHPPAU6xBSabw>
 <xmx:J7MBXhn1H9YmbJwWtpgwnvrV4yU_gXC1SS9ewgj7V8mtbrjvaWeDtQ>
 <xmx:KbMBXnwUhjXSvFLCC1VR9NJ8dbQHTiVEJa3biWRBeJuegEglGtUdPA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B6BD3060872;
 Tue, 24 Dec 2019 01:41:41 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/book3s64/hash: Disable 16M linear mapping size if
 not aligned
Date: Tue, 24 Dec 2019 17:41:25 +1100
Message-Id: <20191224064126.183670-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With STRICT_KERNEL_RWX on in a relocatable kernel under the hash MMU, if
the position the kernel is loaded at is not 16M aligned, the kernel
miscalculates its ALIGN*()s and things go horribly wrong.

We can easily avoid this when selecting the linear mapping size, so do
so and print a warning.  I tested this for various alignments and as
long as the position is 64K aligned it's fine (the base requirement for
powerpc).

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b30435c7d804..523d4d39d11e 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -652,6 +652,7 @@ static void init_hpte_page_sizes(void)
 
 static void __init htab_init_page_sizes(void)
 {
+	bool aligned = true;
 	init_hpte_page_sizes();
 
 	if (!debug_pagealloc_enabled()) {
@@ -659,7 +660,15 @@ static void __init htab_init_page_sizes(void)
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
 		 */
-		if (mmu_psize_defs[MMU_PAGE_16M].shift)
+		if (IS_ENABLED(STRICT_KERNEL_RWX) &&
+		    (unsigned long)_stext % 0x1000000) {
+			if (mmu_psize_defs[MMU_PAGE_16M].shift)
+				pr_warn("Kernel not 16M aligned, "
+					"disabling 16M linear map alignment");
+			aligned = false;
+		}
+
+		if (mmu_psize_defs[MMU_PAGE_16M].shift && aligned)
 			mmu_linear_psize = MMU_PAGE_16M;
 		else if (mmu_psize_defs[MMU_PAGE_1M].shift)
 			mmu_linear_psize = MMU_PAGE_1M;
-- 
2.24.1

