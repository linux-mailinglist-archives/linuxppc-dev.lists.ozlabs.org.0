Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD700757611
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 10:01:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vt2TBHhs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rxl5jQQz3cgZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 18:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vt2TBHhs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61c; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rrq2bmXz30gL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:57:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGijM2jHOs9HZwXL6n467Jyof44+adzz+rIVwu9dN+kiVemHMkOiBebAH/I7ha9fMqgji7L0g29AUWFKC+DXRD49CwRRz/zOXP0cXLiHcBawsNadcvDnLHVNaBBmfdxjfPPSbv7/EaMtpcuoVF01IU2Q0n0RBPm2hWDPQyc8a4IX7VgHiBDVsgJPB0emDhd4psfzbP8GIroiuBk1Sa0RIshArW3fnlTq3Xp3EWYqIhP2ayIPF2O0JUakXCW9J8fe/eAevegFD9keoHmBpYly9sTvhuGoQgaPpg2T7RnOOUk71iq4DKqInkYRndLj6TcEbq2s7rsCwCmxOCCE63DjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdUnKcYe2CSNvlJDQGklH4bL/DkXlTJSioyPKgnLYDY=;
 b=jL07cKqh47MYHOhARsWxDvUwIVR6SWuJ6KHDn1/sgTox95V+Th4RG4kmKneyVnZuRI9DgtIBiVubsoomPFeDi7sa+0b67dRTwgxnmMFKhv7u6KyAzh1bQSQfeygcD6RA1eTafO0B3ARugKLj8TiEf6OfLRuWMCM10y0NC1cwtZBk2UquihA4cVmsZD0Jw46IKTy8lMCclFhOY9SuxKGZh6yNW5+fy7/P2SY69J1PieSAKH8QwIrk6x/LoW025xvRoPV30HF3M1sGHjCr5cFnnNnuQgGl+9s98kEXCtTgPL3J2aU00x7cR43zb1n1f90z2PqPUqGl0uoqo4gUkZUvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdUnKcYe2CSNvlJDQGklH4bL/DkXlTJSioyPKgnLYDY=;
 b=Vt2TBHhsur1WFoCnGP+NnlARhXK/3RkrjjSYOqI0C1gvIEibnBzk1LVluvfaxNDFkXuzWXcgtnFen9ggX6sTJVEP3TAPhu73y71brRUeyUqOs9rNDaL3ehgPSEIq8a0tIfDy0c3KSQmDE8Tl8f2xWfRTxQ8j2SARMq3vYTfzi6djGGmnUJFNk9GoMXOQ0fUfu2TNvhJopDKSjYO7F4IY06skEptxDC67SXYuVDaUdx0cZd9fO8XeEWkW1mdZaiOKlcEgxA8iLDSIgUucqMbQquJ3JtgDF3w11N5Co3dPvqfssAViV75JmIj3EgzL5hK11CvCdB/J+KXeLdv46qRz+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 18 Jul
 2023 07:57:07 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 07:57:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH 4/4] mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
Date: Tue, 18 Jul 2023 17:56:18 +1000
Message-Id: <1de2f1853687c635add15a35f390ce62af36c5db.1689666760.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0010.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::19) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: adb2e1f4-dec7-47ce-15e9-08db8764951a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1YWXOm+cPFdwlO8e9eKCF9Aca8hnOYhrImFOxWdQf2aiWibPrcqSynwabgfZpiBO3m+7wElFIF72HsiJTDYbwHHUb/9ewQCUQdwobaJ9O/omoUl0OUYgHTdvRsu41ulSN8e9AbioCyxEaaYxyRUi0LmQMx9rb/E1Hx1spM89KKCutiTPiStUwNhSSddyDrkR1X/vZn9RC6s+TbU+bZZSFt0fsCENCbpXo3pda+2vGP347qjqe91OHfoUkBJEiQo+3v1GiK0zz3qTxkVJXkyxzt78LDkfs/NPZhHcmtefnWkpxv0WXmeSEBwa4x+tMWOP8OilxZyPqsbJbf1qfCG8KsIljCgjIG4axVsnnK2GfTZBAZ951ggVbPqdxx6ujjnUyuCR629XnE/cDmdF0l3DC4Z68NN7etKSlsvq6HJnAVXOMX4AfqPrBIbpx8Rm6JSL/Hkp+JMXnM8NJ3Hz37cKu8Ti5+0DtI+BZlLHyeHm6FhELe+N/fNPP16IXQ2j2VPo2Qt3P3zaptVPbQTOoiNr0Udwi67u6NVESUpB+BeQdS4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(36756003)(66946007)(478600001)(5660300002)(26005)(41300700001)(107886003)(8676002)(186003)(6506007)(6512007)(8936002)(7416002)(30864003)(2906002)(66556008)(2616005)(6916009)(83380400001)(6666004)(316002)(4326008)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DbsqD9+R2Ow4fvPy1uF70/k390FL3sb49dnOYcjDwu8acrUxMP8ojPwJ3sgU?=
 =?us-ascii?Q?ZtaRHUnaiE5WOVjVuXhWmXW7bWi+wsTtV1vBLbMqHJ32/YU6gkMYFvEz9SFR?=
 =?us-ascii?Q?3eRemTiqa1bCC/p9u8lnwEEDwkK/q2WAekT7k6o7l4rskPuv470tm/ssTEo7?=
 =?us-ascii?Q?cYu6Qg0B+baozfhV2LP3jS2sN5rTwoFp0wFwPLdAxHiAH6u+3OseAaVmRdtu?=
 =?us-ascii?Q?9jS6wquNy/Q3JWT9I8gO7+fRwwlMZMp2B7o/eGF9gh35D9IAMMXzYziJJ7zD?=
 =?us-ascii?Q?K+42Xf2k1MNwMKjbYSjMKLENsBn7XqlsXuTf23KynT+WoHc1E+UrHqPHLTUH?=
 =?us-ascii?Q?Rjd9gx5Pa4LfAAiGZAbYELFrw2j2ctSbePyInfkK6e+2xepAQ7o/If0l0w2r?=
 =?us-ascii?Q?429USbyhD9iy6zeQehx8w5PD4ItOPWChipikzFL/Uk1AdNuqZBjMKwk3HpUz?=
 =?us-ascii?Q?D/+OYV+ZOR8nWARINSmJbtCLpNXH3fDpVqGVcS/6JPPdKv0w4U3GRGixi+8c?=
 =?us-ascii?Q?DbihdVr+SBEGBc+P0u1xC0tAgzeX2G6kSriben/eB4+MpnLoDZHvCYZoIL70?=
 =?us-ascii?Q?Yc7i0uof4Tcz04BcCKBOjkR2/2jH7GUuLpmoavYAK/rFq3ROfhi49/REdAQn?=
 =?us-ascii?Q?f/bYCGzqpJd3tqvLSqsYK0utg37LYXFcDN8Q1Pa5Op3jQhcct4cwBw8GJSPA?=
 =?us-ascii?Q?ijLqzk37nk2nRyHsLlaQrwIKudJeGTiUvnG6jmxwX0yuhNEighOUCV64ehc+?=
 =?us-ascii?Q?acwpRKYUQVBM8gfUB289L6DtNkZVvTVZ6MIYivx147rs8wpYPpKXj4FCFsKn?=
 =?us-ascii?Q?vw/V/TpltCA65iy9qBPXHgl6HASk2ZpvpwTpmrhFxx+nURMPB+Kdn09dwV2l?=
 =?us-ascii?Q?3IPA1BaO/pns3532Uf3qXXzreepd41lc5AVbZYPaFQGPMZKPk7aOR8upBDrq?=
 =?us-ascii?Q?tM2m4gLQ/TV0CtYy0gb6jEoF5KBb6wupKiXBMsJEtPGSXiSmx5N0omYfazBT?=
 =?us-ascii?Q?0PK18rc65QX52+bzIRvI4XVBBnM6LP98s4UVJ8zwVOTsxIq28ggXK35d7QjE?=
 =?us-ascii?Q?fMpe0ZKsLeV1ZcibPliR6Tf4zVa/Gf1mf3lw6NucVjF8/kvukmrzPDYTl3eL?=
 =?us-ascii?Q?rh0bMnsB9TRq9u7zLRklW2V79N88Y6UmhMex89Oflm7amOWaV8GHpehlmIZP?=
 =?us-ascii?Q?W70/nAbHqueU8MjX+wszbKh0nzV+78E0Tgin6CNDejPlXw3de/KqXqfSLRdM?=
 =?us-ascii?Q?LkeGzF+jSPk6qYJXsMPLW2X5GRGsKQZm+bpGBDneNXpTIIBosz/0nU1hi0bP?=
 =?us-ascii?Q?D9/pxpCIs4vS96C+gzAlfAMdFy7mUcsuqGolqT3JvpFwysinC1LosrU5NHjM?=
 =?us-ascii?Q?t5J8Ibc5ylU6AaypJryCgDNE33sNF/tN/VguSH9FRHpcdrrvkF4/h5kjyqGg?=
 =?us-ascii?Q?LYInwMpWOL8Dy3wYm12PsKI3aX0O/5CO3FLNWVncfFnbO+Of28FUhDq2hFvx?=
 =?us-ascii?Q?+Pkr2Xbni6iOYv5lHpySlpMva+Il0ZfAj028+5M8C6RpClbcIWChVAnWFyY6?=
 =?us-ascii?Q?WxgySFq9ojHOcH/PZYKPYByqTmznoUhk7zsPr3H4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb2e1f4-dec7-47ce-15e9-08db8764951a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 07:57:07.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1aeg0CygsCcNYAa4UNvE5G7AQ+HOUuS11L9qhldZU00jRgmn510GnxEh0LKO35tkEmHri5fiXOLowyz5yvdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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
Cc: Alistair Popple <apopple@nvidia.com>, kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
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
index 178c930..b903377 100644
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
index 01f39e8..fbfcc01 100644
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
