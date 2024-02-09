Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2B84EFFA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 06:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWN7X1B8pz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 16:43:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWN743QPTz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 16:43:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B737DA7;
	Thu,  8 Feb 2024 21:43:18 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 169583F762;
	Thu,  8 Feb 2024 21:42:32 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH] mm/hugetlb: Move page order check inside hugetlb_cma_reserve()
Date: Fri,  9 Feb 2024 11:12:21 +0530
Message-Id: <20240209054221.1403364-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All platforms could benefit from page order check against MAX_PAGE_ORDER
before allocating a CMA area for gigantic hugetlb pages. Let's move this
check from individual platforms to generic hugetlb.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This applies on v6.8-rc3
 
 arch/arm64/mm/hugetlbpage.c   | 7 -------
 arch/powerpc/mm/hugetlbpage.c | 4 +---
 mm/hugetlb.c                  | 7 +++++++
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8116ac599f80..6720ec8d50e7 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -45,13 +45,6 @@ void __init arm64_hugetlb_cma_reserve(void)
 	else
 		order = CONT_PMD_SHIFT - PAGE_SHIFT;
 
-	/*
-	 * HugeTLB CMA reservation is required for gigantic
-	 * huge pages which could not be allocated via the
-	 * page allocator. Just warn if there is any change
-	 * breaking this assumption.
-	 */
-	WARN_ON(order <= MAX_PAGE_ORDER);
 	hugetlb_cma_reserve(order);
 }
 #endif /* CONFIG_CMA */
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 0a540b37aab6..16557d008eef 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -614,8 +614,6 @@ void __init gigantic_hugetlb_cma_reserve(void)
 		 */
 		order = mmu_psize_to_shift(MMU_PAGE_16G) - PAGE_SHIFT;
 
-	if (order) {
-		VM_WARN_ON(order <= MAX_PAGE_ORDER);
+	if (order)
 		hugetlb_cma_reserve(order);
-	}
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index cf9c9b2906ea..345b3524df35 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7699,6 +7699,13 @@ void __init hugetlb_cma_reserve(int order)
 	bool node_specific_cma_alloc = false;
 	int nid;
 
+	/*
+	 * HugeTLB CMA reservation is required for gigantic
+	 * huge pages which could not be allocated via the
+	 * page allocator. Just warn if there is any change
+	 * breaking this assumption.
+	 */
+	VM_WARN_ON(order <= MAX_PAGE_ORDER);
 	cma_reserve_called = true;
 
 	if (!hugetlb_cma_size)
-- 
2.25.1

