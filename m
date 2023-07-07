Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1874ABB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:18:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ulKP5n0f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy4Vz2HkZz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 17:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ulKP5n0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::61e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy4RB6wJDz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 17:15:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/K54ONH+C4hy2b9tyT5x8YP/nknwhSILRIKBUVWc7tjZP38igZLOCvcdzuA16S00RzgWDu0CvMsK9FT68oeorFr10OFE7CVG5xBYuhq3sAIz0Td7atsxT8vX5os2pvMBK8mWR2ZKo32YFjoMdUnbKwhRXdCJdBRjCedSpevKyaROk5RXzFoB2rm8FU4onBKdm6aXT6nORFh0DGRI/1ROupzM/kKJeYIaU8XRk8FXqaCmB/xjO+hu1BQ/wnk+BQxBLHZvwCuZbBGhrKX9SbM1FI2KTBuMdJPo2mBl0KanGbkQ1j7Ih4HVwalk39e0r2hK4LfpMGEYfaeM8ZRLtas+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sgw6A8l9bBmw2H/FjPUicVghu7vSsXL6mgL4AvDIH0=;
 b=iIL2Vowy7tkzD4rPql+xCYaRYkJhJkxT4qmJEJMqTu67he2JpgmSQ7qsnOi3UOytmFXI/fzQQpUaNljKwf3dS3NWQmGOC56IXFBFHmT+dw4OSRDoB69ru+rnzFA0hGj/Whbf4BzS2N/24N5WcMIMsgOhgMOOi16Cus2MeTX2nZrokJ90G0ROVG6aFWjKbWBYkal86avRFi0YN5FmJ2XI9hibMhVNO2VkPqCOVj1dZ5dXzQpabGqyqLir7hHj3cHFotdRd2wv5PCBd5fh356+S+BxcoOrFQ97LHA8aplsH5KExa9wIAAfxyKqRXuqk/z2adA6SM9yCchTQbFcC48QyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Sgw6A8l9bBmw2H/FjPUicVghu7vSsXL6mgL4AvDIH0=;
 b=ulKP5n0f73JQwqjIYiFpM4yXa0b9aBa/Wizqb2bPna9LCMi2H+iDHaXGH5iwevEBKhwAuVuiBgCqG/bVANveMr8Gy3VTw8p18mWxWZO2AvEc1WD/J5L7iRzNFShJe+ASLvSw4ny5Ig26Oka1BX6Ahx27PZRlKowgpN2jwNiuZbvTr/KN0SZUwlVWN3htpN/KGDN1amsfDa2QX+PMgO3SqIFjSyjc35MsSUflAiO1BPeUH2GQYx51nhhc1VdChn7UiuvXMCi2gnyfmK+qWBUSR5pT3S7oeR/Pv+ZUcQ0WrMdsxSaGJQkCIdmI1SHux1cGua8PKCnz/cUiTm5Ud6jEug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 07:14:59 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7%6]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:14:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [RFC PATCH v2 3/3] mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
Date: Fri,  7 Jul 2023 17:14:25 +1000
Message-Id: <1fd481392ca173c301de3edef4dcc79dea0619c2.1688714027.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
References: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0097.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::7) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 300ca14e-eff8-4e54-8aa7-08db7eb9dfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KToJcQD8Z5SdXKKM0fLqXJ519Q1H3jjjdnLVpwGUiqHz3JsNsw1RITRwI2bmjHZxcg8QfH1ar9/tYrKKnP771IsEC69PM9TaNI8OmRSPGH9zdAQcEf2pHV/Gd3ueQAgQ8fcU2LV/yYTbIh5G+fV71/OoU+zPVSGwLphHOh3VnRUTaBADM87dyRjIFm78e+861K6/rKSOOQk+UjWbLc+T1njQyD915aZpSe/5be3a5i0pxiTaWrb0iXtVhpYlgsuzFBFOGSGXpQt6E54ARctabPTj1Uw/8+dkTdJfB176r2qGWBzlnohdkpqHaRkgH7IBYsIPjbCdsAZDSNhdgMalTR8xVz+CZXsbt5f/rVV72N0lSPqDvFjoAOrfIS3h837VIVUovukuc1tGUj5PC0TEeKOAfQKiBcm6yEZ+GwBGwEXQ3ozkxB3sP4PMafBXTzONeienjbj4JBN8sHP5PTNd5Er+LBKIwBmbtdKq4h8oQTWufZgaNe8Fd7Mf8TNVG1IamJvE54stkl5y8V/G7xMfYaUdgBz1nvA3jG9iJwrypUc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(6916009)(38100700002)(66476007)(4326008)(66946007)(66556008)(2616005)(6666004)(186003)(6486002)(36756003)(107886003)(86362001)(478600001)(6506007)(26005)(6512007)(8676002)(8936002)(30864003)(5660300002)(7416002)(41300700001)(2906002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?XELrW64RTgdJphHb1XHlIvFI2BM3JhssINlE7O4aAxU4XJt3DAYxf1AtCR5o?=
 =?us-ascii?Q?YhfX+xiMCOlTRfMACFybgznROB9x7AYPAChGiVapFEmlpLa1Fx1oZvpptLZP?=
 =?us-ascii?Q?5xvmhbtwe6P7bODhkFYTGiQE73ggpFeenChnGxwN7+oOSpwBug7oL2dCwwzx?=
 =?us-ascii?Q?GqFatTY8tqVkCwyd2PeVAEE7IwUmIxIiRG8snTsx73pupm6YTRX7BTGTdaeb?=
 =?us-ascii?Q?iq8Tedv7yx4tXQA7q3mhGf61qriZ/PX6deJ07yaa0i3qTUQI2flPBdLtfY1Q?=
 =?us-ascii?Q?Reh3v3HvuhEefImK/O5ji5/siOQaMy346ZigFNDtcIaeLs/29rVrohRwijUc?=
 =?us-ascii?Q?cF6ORB5ZrTJpXyEkO/1Y3kRPS+e7l/sA2wA+RqW4lfSLKJGJpFw/vhgjp+sK?=
 =?us-ascii?Q?aTzKscr85moJeqypIRal5ax5STd0h/pwx3P0O8uCIU7NfljeWtvzaLhuO/hn?=
 =?us-ascii?Q?Xzs5b6lUmEwyQFanlMwsJnLBH68tRnSqSEnE9Mmsfpg1qNEeS8RjFOxthA2h?=
 =?us-ascii?Q?sPNJ7ci4urw6G2R5ZMW26q/50TqNBeFL0H1Hr8yfCDz7H12yOufIKvdmJMri?=
 =?us-ascii?Q?Usj66SAdAK52oY5zH3Ozsw63kEL4LVntfLLxtQ7sIp0HgNJIvv93nuSjD/so?=
 =?us-ascii?Q?Manay4KaOXZeSt/Oq5u0XfdseAYQEV8pxC6vhWedTxuAV/OODhsZsgB0xOoN?=
 =?us-ascii?Q?hM4iz8yoD3Ic2tn8Mj8fGMw8JVE1W2Zzc41fjzwF0JQVbzamwgisZtr0CtAZ?=
 =?us-ascii?Q?wALOhi8yPotJFXiadNrgoYx5VtHQnCj436vyGwwANqdhcjNU717js6k17roQ?=
 =?us-ascii?Q?SfxG20pL/RRQjJnMnVnp/uZtXDrQUIPgqtYxbqYFqCiGoYKO4OMcHx+cFA4W?=
 =?us-ascii?Q?KkPzknuOT32SCVSliJpJUbVH0aSSZxo40HIuNF9pcvvixaYIOIGuRZ5ETCAz?=
 =?us-ascii?Q?sE79njfBORsTwRflybjKr+/LwK/DCaVMxTLhHz/zp1QpODtU1X9BwFh0TuDv?=
 =?us-ascii?Q?MeQKDCEgptkdXv0mVm3jH3+BxpeXrgeVWEkXesopsJ+O9GFTs8VD8NNzkO6K?=
 =?us-ascii?Q?Eq6atAl1Fe5ElnNI+PRlwvpYkwhqJqBQCoks99xvEghJupVU13tU+K/x9LOX?=
 =?us-ascii?Q?crt7dVEEKjuY6GYqmP4K/OMdArQrwHwagzbET3Cefz9Co4hKdKOl7i4UrTD1?=
 =?us-ascii?Q?lrD051wpoTboP84XldfdJuGrLSZEsTh2xHUbYtsnphUodUbKDPE2vU/CYQws?=
 =?us-ascii?Q?KSgc51DI1qFO1suSDrD48VFmX1tyKEBFtwfW41/8L0+eoN9qfxBQ6+NOwEUp?=
 =?us-ascii?Q?jvQMqYHylXTsInt7s0u/tN5BgdAzaxfAHYM1PvYFOzHaDcWwUz0PuOCyUBDU?=
 =?us-ascii?Q?7YtuKlrjgTZLH8N9JLBZRdY6f30EiCQ28EWzrKd9onw4xoV1NHix+d4kKlbm?=
 =?us-ascii?Q?39joQjaq0d6vDvxtP985MjATtqPXLlynQKPPFWADTmHfXGiIh/l3WiFX7z/z?=
 =?us-ascii?Q?g2jrd8J5GVLFXcHT7eX+vfTialp4IhqfpRuNVOm4aGBIgErOnl3p8k2XfOYK?=
 =?us-ascii?Q?vncx5AW4aJpldFdDGw0EjaQWy/lOOPhWhJi0QGyp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 300ca14e-eff8-4e54-8aa7-08db7eb9dfd5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:14:59.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4P1vmAhyAikg3BR91McV+g1IeyjogpyRaScLwWIcof05Gu6t0c8r5hGiT/zPoCX0OW0IQmBdMjnyGFalBRBRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Secondary TLBs are now invalidated from the architecture specific TLB
invalidation functions. Therefore there is no need to explicitly
notify or invalidate as part of the range end functions. This means we
can remove mmu_notifier_invalidate_range_end_only() and some of the
ptep_*_notify() functions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 include/linux/mmu_notifier.h | 56 +------------------------------------
 kernel/events/uprobes.c      |  2 +-
 mm/huge_memory.c             | 25 ++---------------
 mm/hugetlb.c                 |  2 +-
 mm/memory.c                  |  8 +----
 mm/migrate_device.c          |  9 +-----
 mm/mmu_notifier.c            | 25 ++---------------
 mm/rmap.c                    | 42 +----------------------------
 8 files changed, 14 insertions(+), 155 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index a4bc818..6e3c857 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -395,8 +395,7 @@ extern int __mmu_notifier_test_young(struct mm_struct *mm,
 extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 				      unsigned long address, pte_t pte);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
-extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r,
-				  bool only_end);
+extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
 					unsigned long start, unsigned long end);
 extern bool
@@ -481,14 +480,7 @@ mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 		might_sleep();
 
 	if (mm_has_notifiers(range->mm))
-		__mmu_notifier_invalidate_range_end(range, false);
-}
-
-static inline void
-mmu_notifier_invalidate_range_only_end(struct mmu_notifier_range *range)
-{
-	if (mm_has_notifiers(range->mm))
-		__mmu_notifier_invalidate_range_end(range, true);
+		__mmu_notifier_invalidate_range_end(range);
 }
 
 static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
@@ -582,45 +574,6 @@ static inline void mmu_notifier_range_init_owner(
 	__young;							\
 })
 
-#define	ptep_clear_flush_notify(__vma, __address, __ptep)		\
-({									\
-	unsigned long ___addr = __address & PAGE_MASK;			\
-	struct mm_struct *___mm = (__vma)->vm_mm;			\
-	pte_t ___pte;							\
-									\
-	___pte = ptep_clear_flush(__vma, __address, __ptep);		\
-	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___addr,		\
-					___addr + PAGE_SIZE);		\
-									\
-	___pte;								\
-})
-
-#define pmdp_huge_clear_flush_notify(__vma, __haddr, __pmd)		\
-({									\
-	unsigned long ___haddr = __haddr & HPAGE_PMD_MASK;		\
-	struct mm_struct *___mm = (__vma)->vm_mm;			\
-	pmd_t ___pmd;							\
-									\
-	___pmd = pmdp_huge_clear_flush(__vma, __haddr, __pmd);		\
-	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___haddr,		\
-				      ___haddr + HPAGE_PMD_SIZE);	\
-									\
-	___pmd;								\
-})
-
-#define pudp_huge_clear_flush_notify(__vma, __haddr, __pud)		\
-({									\
-	unsigned long ___haddr = __haddr & HPAGE_PUD_MASK;		\
-	struct mm_struct *___mm = (__vma)->vm_mm;			\
-	pud_t ___pud;							\
-									\
-	___pud = pudp_huge_clear_flush(__vma, __haddr, __pud);		\
-	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___haddr,		\
-				      ___haddr + HPAGE_PUD_SIZE);	\
-									\
-	___pud;								\
-})
-
 /*
  * set_pte_at_notify() sets the pte _after_ running the notifier.
  * This is safe to start by updating the secondary MMUs, because the primary MMU
@@ -711,11 +664,6 @@ void mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 {
 }
 
-static inline void
-mmu_notifier_invalidate_range_only_end(struct mmu_notifier_range *range)
-{
-}
-
 static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
 				  unsigned long start, unsigned long end)
 {
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index f0ac5b8..3048589 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -193,7 +193,7 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	}
 
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
-	ptep_clear_flush_notify(vma, addr, pvmw.pte);
+	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
 		set_pte_at_notify(mm, addr, pvmw.pte,
 				  mk_pte(new_page, vma->vm_page_prot));
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index a232891..c80d0f9 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2003,7 +2003,7 @@ static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
 
 	count_vm_event(THP_SPLIT_PUD);
 
-	pudp_huge_clear_flush_notify(vma, haddr, pud);
+	pudp_huge_clear_flush(vma, haddr, pud);
 }
 
 void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
@@ -2023,11 +2023,7 @@ void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
 
 out:
 	spin_unlock(ptl);
-	/*
-	 * No need to double call mmu_notifier->invalidate_range() callback as
-	 * the above pudp_huge_clear_flush_notify() did already call it.
-	 */
-	mmu_notifier_invalidate_range_only_end(&range);
+	mmu_notifier_invalidate_range_end(&range);
 }
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
@@ -2094,7 +2090,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	count_vm_event(THP_SPLIT_PMD);
 
 	if (!vma_is_anonymous(vma)) {
-		old_pmd = pmdp_huge_clear_flush_notify(vma, haddr, pmd);
+		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
 		/*
 		 * We are going to unmap this huge page. So
 		 * just go ahead and zap it
@@ -2304,20 +2300,7 @@ void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
 
 out:
 	spin_unlock(ptl);
-	/*
-	 * No need to double call mmu_notifier->invalidate_range() callback.
-	 * They are 3 cases to consider inside __split_huge_pmd_locked():
-	 *  1) pmdp_huge_clear_flush_notify() call invalidate_range() obvious
-	 *  2) __split_huge_zero_page_pmd() read only zero page and any write
-	 *    fault will trigger a flush_notify before pointing to a new page
-	 *    (it is fine if the secondary mmu keeps pointing to the old zero
-	 *    page in the meantime)
-	 *  3) Split a huge pmd into pte pointing to the same page. No need
-	 *     to invalidate secondary tlb entry they are all still valid.
-	 *     any further changes to individual pte will notify. So no need
-	 *     to call mmu_notifier->invalidate_range()
-	 */
-	mmu_notifier_invalidate_range_only_end(&range);
+	mmu_notifier_invalidate_range_end(&range);
 }
 
 void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ba689e0..941a11c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5690,8 +5690,6 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 
 		/* Break COW or unshare */
 		huge_ptep_clear_flush(vma, haddr, ptep);
-		mmu_notifier_arch_invalidate_secondary_tlbs(mm, range.start,
-						range.end);
 		page_remove_rmap(&old_folio->page, vma, true);
 		hugepage_add_new_anon_rmap(new_folio, vma, haddr);
 		if (huge_pte_uffd_wp(pte))
diff --git a/mm/memory.c b/mm/memory.c
index 0ae5947..5736367 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3149,7 +3149,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		 * that left a window where the new PTE could be loaded into
 		 * some TLBs while the old PTE remains in others.
 		 */
-		ptep_clear_flush_notify(vma, vmf->address, vmf->pte);
+		ptep_clear_flush(vma, vmf->address, vmf->pte);
 		folio_add_new_anon_rmap(new_folio, vma, vmf->address);
 		folio_add_lru_vma(new_folio, vma);
 		/*
@@ -3195,11 +3195,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 	}
 
-	/*
-	 * No need to double call mmu_notifier->invalidate_range() callback as
-	 * the above ptep_clear_flush_notify() did already call it.
-	 */
-	mmu_notifier_invalidate_range_only_end(&range);
+	mmu_notifier_invalidate_range_end(&range);
 
 	if (new_folio)
 		folio_put(new_folio);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 8365158..9ce8214 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -658,7 +658,7 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 
 	if (flush) {
 		flush_cache_page(vma, addr, pte_pfn(orig_pte));
-		ptep_clear_flush_notify(vma, addr, ptep);
+		ptep_clear_flush(vma, addr, ptep);
 		set_pte_at_notify(mm, addr, ptep, entry);
 		update_mmu_cache(vma, addr, ptep);
 	} else {
@@ -754,13 +754,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 	}
 
-	/*
-	 * No need to double call mmu_notifier->invalidate_range() callback as
-	 * the above ptep_clear_flush_notify() inside migrate_vma_insert_page()
-	 * did already call it.
-	 */
 	if (notified)
-		mmu_notifier_invalidate_range_only_end(&range);
+		mmu_notifier_invalidate_range_end(&range);
 }
 
 /**
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 34c5a84..42bcc0a 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -551,7 +551,7 @@ int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 
 static void
 mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
-			struct mmu_notifier_range *range, bool only_end)
+			struct mmu_notifier_range *range)
 {
 	struct mmu_notifier *subscription;
 	int id;
@@ -559,24 +559,6 @@ mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
 	id = srcu_read_lock(&srcu);
 	hlist_for_each_entry_rcu(subscription, &subscriptions->list, hlist,
 				 srcu_read_lock_held(&srcu)) {
-		/*
-		 * Subsystems should register either invalidate_secondary_tlbs()
-		 * or invalidate_range_start()/end() callbacks.
-		 *
-		 * We call invalidate_secondary_tlbs() here so that subsystems
-		 * can use larger range based invalidations. In some cases
-		 * though invalidate_secondary_tlbs() needs to be called while
-		 * holding the page table lock. In that case call sites use
-		 * mmu_notifier_invalidate_range_only_end() and we know it is
-		 * safe to skip secondary TLB invalidation as it will have
-		 * already been done.
-		 */
-		if (!only_end && subscription->ops->invalidate_secondary_tlbs)
-			subscription->ops->invalidate_secondary_tlbs(
-				subscription,
-				range->mm,
-				range->start,
-				range->end);
 		if (subscription->ops->invalidate_range_end) {
 			if (!mmu_notifier_range_blockable(range))
 				non_block_start();
@@ -589,8 +571,7 @@ mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
 	srcu_read_unlock(&srcu, id);
 }
 
-void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range,
-					 bool only_end)
+void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 {
 	struct mmu_notifier_subscriptions *subscriptions =
 		range->mm->notifier_subscriptions;
@@ -600,7 +581,7 @@ void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range,
 		mn_itree_inv_end(subscriptions);
 
 	if (!hlist_empty(&subscriptions->list))
-		mn_hlist_invalidate_end(subscriptions, range, only_end);
+		mn_hlist_invalidate_end(subscriptions, range);
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 }
 
diff --git a/mm/rmap.c b/mm/rmap.c
index b74fc2c..1fbe83e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -990,13 +990,6 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 #endif
 		}
 
-		/*
-		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() as
-		 * we are downgrading page table protection not changing it to
-		 * point to a new page.
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		if (ret)
 			cleaned++;
 	}
@@ -1554,8 +1547,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_arch_invalidate_secondary_tlbs(
-						mm, range.start, range.end);
 					/*
 					 * The ref count of the PMD page was
 					 * dropped which is part of the way map
@@ -1628,9 +1619,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 * copied pages.
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
-			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
-						      address + PAGE_SIZE);
 		} else if (folio_test_anon(folio)) {
 			swp_entry_t entry = { .val = page_private(subpage) };
 			pte_t swp_pte;
@@ -1642,10 +1630,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					folio_test_swapcache(folio))) {
 				WARN_ON_ONCE(1);
 				ret = false;
-				/* We have to invalidate as we cleared the pte */
-				mmu_notifier_arch_invalidate_secondary_tlbs(mm,
-							address,
-							address + PAGE_SIZE);
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
@@ -1676,10 +1660,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				if (ref_count == 1 + map_count &&
 				    !folio_test_dirty(folio)) {
-					/* Invalidate as we cleared the pte */
-					mmu_notifier_arch_invalidate_secondary_tlbs(
-						mm, address,
-						address + PAGE_SIZE);
 					dec_mm_counter(mm, MM_ANONPAGES);
 					goto discard;
 				}
@@ -1734,9 +1714,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_uffd_wp(pteval))
 				swp_pte = pte_swp_mkuffd_wp(swp_pte);
 			set_pte_at(mm, address, pvmw.pte, swp_pte);
-			/* Invalidate as we cleared the pte */
-			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
-						      address + PAGE_SIZE);
 		} else {
 			/*
 			 * This is a locked file-backed folio,
@@ -1752,13 +1729,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			dec_mm_counter(mm, mm_counter_file(&folio->page));
 		}
 discard:
-		/*
-		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() it
-		 * has be done above for all cases requiring it to happen under
-		 * page table lock before mmu_notifier_invalidate_range_end()
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		page_remove_rmap(subpage, vma, folio_test_hugetlb(folio));
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
@@ -1937,8 +1907,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_arch_invalidate_secondary_tlbs(
-						mm, range.start, range.end);
 
 					/*
 					 * The ref count of the PMD page was
@@ -2043,9 +2011,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * copied pages.
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
-			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
-							address + PAGE_SIZE);
 		} else {
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2109,13 +2074,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 		}
 
-		/*
-		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() it
-		 * has be done above for all cases requiring it to happen under
-		 * page table lock before mmu_notifier_invalidate_range_end()
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		page_remove_rmap(subpage, vma, folio_test_hugetlb(folio));
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-- 
git-series 0.9.1
