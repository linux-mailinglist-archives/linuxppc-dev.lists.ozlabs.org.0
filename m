Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2A75A98E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:45:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pPpfBbTa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65qc1XxPz3cF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pPpfBbTa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65jl475jz3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:40:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIqKsAIVFtQNsYnJT5dHOtbgCS3X8vryi6jhBYSo6vWJ7Dpyxhh/nt7j4esY7jzVbe3jseoPSQ0gieOM9ulH2loBvgaDbXFfwXV1I4Zgj2pXlwroyKx8AS/AcINgL4hqU3UewWm4n5FJdym3BJ4ZgHH7tYHzjlOfslmpNxHCYhIkMV4iLlzf4XVnGLbYBpj2OPgc7ouDFte4gsVdq4aenzwBdUVPerw4ixJ+7L33IKd6L69/uJegGm6PO9aTJ5Rpe9CThTZGd2D4GZ992+k2fAN1zt60xwf5FYcymVt5HQ1LxO605ho0hW5Oez3i2IYGP07CwpMuTQpM5VBBqTdm/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVZWmJyawWp7qJVj6fsL5exDFyKRe6K0X+0eHRtAuyU=;
 b=TEjfkrAgM6hAHJiAjkTMEOXyCaOTO45FhGJQDQOh+xUp+zoT7h7/0Upuo+ZiydWjMV4zUgC+unnM/hGjnem2uqg3v0IgwEiIOQz21kt3vBaT3L0WfoGsD31GP5rRnEVQ/iorXlZNy41rXLp5ytDVyKL5pT+yD2cfR6kN5xLdlamQXXayf/M+eOrDqYSK0sj5ajTApVhJ+YcSqscljtU0jrtHVVE8YfBgmOy4uK7mpfSCoZ0NjK/uz1y+8vLEqeM6ny+GXcq1OpX+5sFELkQb81gFDQYttvQ6+pO6wHO6YxRX7dSPOuuCtW+znqGQ183gy4JqkhEWrOZjJlMPn2l3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVZWmJyawWp7qJVj6fsL5exDFyKRe6K0X+0eHRtAuyU=;
 b=pPpfBbTaF/OpRBTQ9IMZoTWEXW3uExYK0DT0PohZxWvWh2O6jjMyCY/XggarCm0fMX+n70+rp2iyezVxvVu7YQxrJSPqs9KD5Kl+Zlw9e9xkVi4yyOICgnXVc5v5x3Ko3NTxKtt/8N8JDiOR8RPwiq7pRPeo5RhFOxlfh7I1dnBrscNTtNtQjlEMVxozuV/JduP8ZO8Lt0vtsxuEtrSV4WbFdiZishNNPD1gV35FqzwnqZbziLPqfFb8iRXlMpSilZ2Di5G62M30PS9WcGF2sxS7VYxBLOGcI6iNgD/xMNaYvl4vx/e7NEOB2e6dQ4ckORz6I7dvbhSb+R/0sWErbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:40:07 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 08:40:07 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v3 4/5] mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
Date: Thu, 20 Jul 2023 18:39:26 +1000
Message-Id: <141e786b68527b1db9fc5a3259066c360448e7a4.1689842332.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0132.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::10) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 01842850-9864-4354-6da3-08db88fceb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZsxigUjQwEWxP12RqI7Nij/BMznIbynTr4xQGb+1dl5S5z17z56Z5DOu31OxsYQP8rxBxJkiTcgWClcEmEshn2ey5m6wxJ2vQ4TH0RhrhmadrppiLY46MB3Z6/fW3/kdQBPjpytircqmKSSSK+0pyu8js5zxHD+YUQfSdrjhK+K3tzomeEjzhnPRZp4yr4ZG6GuzAFN6EWBaFewsLTGHpQE72WerEc6p8EcnwgytxUW060glBSr86u9dX4ZeqxML3Q1EHNnUbPq6E06S27Neh+GGQoi081Z9TOgc3f1WPFY8M9oPAjJgRleieeW31SWr592WK6U8VvO98FXW+HHIkCRk8NVkAJTspZsvXWLmt2kd7EuDSz4oIfZoKjuBGPqP+9H3a0CgyT4HvwWHXj2MxN1bLqTptaG25kKz6F2ydJKy+NL+uuUyNBEke/MuL34E0tWqG3PrALOoay29LlT6Doa77ruxOJvmYhSVymNg0gNrBDYGPkPQNZYg6guvoKRqe2g1QKiFcIm5PZ9jw1NGa+4DF9PpJzJW0ZSclde4VrM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(186003)(7416002)(478600001)(6506007)(6666004)(26005)(41300700001)(66476007)(66946007)(4326008)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(83380400001)(6512007)(107886003)(6486002)(30864003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nQ3Qq5TqscrekbPzQjL4/+Gh5arDy7luatp0n6hlOVki06Imbh7MnTnxZZ2n?=
 =?us-ascii?Q?8s4rZXPFlBLwiaYOY8IDQ5HUXfnOHtSJZ+FLQtRph4ePfG0iHnPUUyWMxa2I?=
 =?us-ascii?Q?LDcbRM0HcLaMbNCWe5vD60D8a7N0ImyJJwFpG7xfbX/DelydMGRfFwv9YK5Y?=
 =?us-ascii?Q?1zckMXLyG/zki7m7g7yEQLaYntO86qr2yeHEPqJP816RvloxAoOtchUUVB8d?=
 =?us-ascii?Q?DE2Z3KDBPgLHjUuM+wQL71k9VC82vR1Qul1t3cCwfGtOwUGMIaNXuLpHSJeq?=
 =?us-ascii?Q?9M5elGFy+dm5LuCNMzSLADwlXYLqPGHRQ/TDypKOkcEp3jSACMPOYqVIyr8Y?=
 =?us-ascii?Q?b28j5LW6yZbFd9giu+7laeOv6a/sxUr4eI51OEgEuR3qRNP6N/U1B4tOnJU8?=
 =?us-ascii?Q?wYoi7gYNPl48o/bhYSl4ZP9Vjhwb7TLdJwRR8PyBFKyQT8X19bGJz4adWuuK?=
 =?us-ascii?Q?hTVd/4mGzmDLLK5aAW0KpMNn9/UF08EWC4rDqc+20zLb6yBinlcfRs5k8WQo?=
 =?us-ascii?Q?mOjjTI0Pn4WzfqHf4VQZDPTK64+VonIUuyaSOpSsjmFoz2k2ZV6diUZ85iWV?=
 =?us-ascii?Q?4SYDcwnHkwjv7+tlPYsPwSZomjlwXdm+rd+9YBW3palRAUgau+GaERy4QzjZ?=
 =?us-ascii?Q?G9cix1gt9N2ERsm5UCPMqysXwf29Y8FIP+lk7cSzuPNz+6670Kviv4cALVQG?=
 =?us-ascii?Q?ziBMT9Bl6IY8535rBtJv3PbsjxKGeb+X0LybpgP/T0kLuZfFX62hCnux5/ml?=
 =?us-ascii?Q?7+ZjQjk0ardXmc+Xw0wA1NuMrSB3hUas2g0Cn4gj27LZLVlD5TgMfowEimg8?=
 =?us-ascii?Q?E5FQWSkoKO9tgfgHCaCx3+8IK8I640mpoglbjpFyO3mQenNmw9kytiDqcGv/?=
 =?us-ascii?Q?6qSN4QjArQpxEVJ5i3tist9FQ2bDYgl1IvFynYIrQ2cNfLaxMumxBA9AfGIN?=
 =?us-ascii?Q?DOxG1lw5uLZs5brCPOfLIAWhS/1JRQaVX2A3dQV7Fr8S+/SWDQgtZ77pX6sN?=
 =?us-ascii?Q?cgkScplkOW4+2JOal/hb6C/79jBYjfcD+ezKqxu1S4CodL6tVmUrC+RZNwcH?=
 =?us-ascii?Q?smpB44UJKnQosxt7klfZvogWVnPblgs1QEjWeijIldVNiiOMu2flA/OdUp8E?=
 =?us-ascii?Q?OXpOLcWTwQCJSEtJnvgt4ZIH4wZkHGaTK5Pzc21dF3++b/YRho7xNsVZgZZk?=
 =?us-ascii?Q?kVJ49bGX8i5a/wuH6eaGfbWBZQsSE0xZlt4xqaVVwIViAnCN8pe2p+COZq9z?=
 =?us-ascii?Q?Hyv0eUQXWsBm4s1DDUvOf6PeXI2Zhvc8dujJ/DiLQ3yvd8RGnzhaWjUx/k1t?=
 =?us-ascii?Q?fQDJ78N/GQ9lB8N++592EvSR7Bal/KTkM8jRk313P3dYcxoHbJ19UdWnMGfz?=
 =?us-ascii?Q?CKbjwGknuqpNGi5YuSBeLAdRhrnyNCUibrQh0WH0NsefBcjicYVals/3fLkj?=
 =?us-ascii?Q?5CrlEmVPHoQVAf4O/ft/DBFQMsnYGIJnPWKOUWeswweOKU7UOWU9OlMpxhMA?=
 =?us-ascii?Q?fwCJOut17AoRtCUy+F+iP0DtGcGg78jmSK3ca/UWpz1nWKKWzhoksvwhEbcg?=
 =?us-ascii?Q?5BzZcJWBMhRQgD1BeGlEC+VxgsjgSMHD44UrhDn2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01842850-9864-4354-6da3-08db88fceb7c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:40:06.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5736zlc0rImE8FuDAZpZEPCmQgTpNlfn7N6ulUCe5VJ/klTgBpK/7NrPIxESovVvmpi3MIycm9JQF8zC0/suXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: x86@kernel.org, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, Alistair Popple <apopple@nvidia.com>, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, sj@kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
 mm/hugetlb.c                 |  1 +-
 mm/memory.c                  |  8 +----
 mm/migrate_device.c          |  9 +-----
 mm/mmu_notifier.c            | 25 ++---------------
 mm/rmap.c                    | 40 +--------------------------
 8 files changed, 14 insertions(+), 152 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 64a3e05..f2e9edc 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -395,8 +395,7 @@ extern int __mmu_notifier_test_young(struct mm_struct *mm,
 extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 				      unsigned long address, pte_t pte);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
-extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r,
-				  bool only_end);
+extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range(struct mm_struct *mm,
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
 
 static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
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
-	mmu_notifier_invalidate_range(___mm, ___addr,			\
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
-	mmu_notifier_invalidate_range(___mm, ___haddr,			\
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
-	mmu_notifier_invalidate_range(___mm, ___haddr,			\
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
 static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
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
index 762be2f..3ece117 100644
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
index dc1ec19..9c6e431 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5715,7 +5715,6 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 
 		/* Break COW or unshare */
 		huge_ptep_clear_flush(vma, haddr, ptep);
-		mmu_notifier_invalidate_range(mm, range.start, range.end);
 		page_remove_rmap(&old_folio->page, vma, true);
 		hugepage_add_new_anon_rmap(new_folio, vma, haddr);
 		if (huge_pte_uffd_wp(pte))
diff --git a/mm/memory.c b/mm/memory.c
index ad79039..8dca544 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3158,7 +3158,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		 * that left a window where the new PTE could be loaded into
 		 * some TLBs while the old PTE remains in others.
 		 */
-		ptep_clear_flush_notify(vma, vmf->address, vmf->pte);
+		ptep_clear_flush(vma, vmf->address, vmf->pte);
 		folio_add_new_anon_rmap(new_folio, vma, vmf->address);
 		folio_add_lru_vma(new_folio, vma);
 		/*
@@ -3204,11 +3204,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
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
index e29626e..6c556b5 100644
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
@@ -763,13 +763,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
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
index b7ad155..453a156 100644
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
-		 * Call invalidate_range here too to avoid the need for the
-		 * subsystem of having to register an invalidate_range_end
-		 * call-back when there is invalidate_range already. Usually a
-		 * subsystem registers either invalidate_range_start()/end() or
-		 * invalidate_range(), so this will be no additional overhead
-		 * (besides the pointer check).
-		 *
-		 * We skip call to invalidate_range() if we know it is safe ie
-		 * call site use mmu_notifier_invalidate_range_only_end() which
-		 * is safe to do when we know that a call to invalidate_range()
-		 * already happen under page table lock.
-		 */
-		if (!only_end && subscription->ops->invalidate_range)
-			subscription->ops->invalidate_range(subscription,
-							    range->mm,
-							    range->start,
-							    range->end);
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
index 1355bf6..51ec8aa 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -985,13 +985,6 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 #endif
 		}
 
-		/*
-		 * No need to call mmu_notifier_invalidate_range() as we are
-		 * downgrading page table protection not changing it to point
-		 * to a new page.
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		if (ret)
 			cleaned++;
 	}
@@ -1549,8 +1542,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_invalidate_range(mm,
-						range.start, range.end);
 					/*
 					 * The ref count of the PMD page was
 					 * dropped which is part of the way map
@@ -1623,9 +1614,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 * copied pages.
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
-			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
-						      address + PAGE_SIZE);
 		} else if (folio_test_anon(folio)) {
 			swp_entry_t entry = { .val = page_private(subpage) };
 			pte_t swp_pte;
@@ -1637,9 +1625,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					folio_test_swapcache(folio))) {
 				WARN_ON_ONCE(1);
 				ret = false;
-				/* We have to invalidate as we cleared the pte */
-				mmu_notifier_invalidate_range(mm, address,
-							address + PAGE_SIZE);
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
@@ -1670,9 +1655,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				if (ref_count == 1 + map_count &&
 				    !folio_test_dirty(folio)) {
-					/* Invalidate as we cleared the pte */
-					mmu_notifier_invalidate_range(mm,
-						address, address + PAGE_SIZE);
 					dec_mm_counter(mm, MM_ANONPAGES);
 					goto discard;
 				}
@@ -1727,9 +1709,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_uffd_wp(pteval))
 				swp_pte = pte_swp_mkuffd_wp(swp_pte);
 			set_pte_at(mm, address, pvmw.pte, swp_pte);
-			/* Invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
-						      address + PAGE_SIZE);
 		} else {
 			/*
 			 * This is a locked file-backed folio,
@@ -1745,13 +1724,6 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			dec_mm_counter(mm, mm_counter_file(&folio->page));
 		}
 discard:
-		/*
-		 * No need to call mmu_notifier_invalidate_range() it has be
-		 * done above for all cases requiring it to happen under page
-		 * table lock before mmu_notifier_invalidate_range_end()
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		page_remove_rmap(subpage, vma, folio_test_hugetlb(folio));
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
@@ -1930,8 +1902,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_invalidate_range(mm,
-						range.start, range.end);
 
 					/*
 					 * The ref count of the PMD page was
@@ -2036,9 +2006,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * copied pages.
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
-			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
-						      address + PAGE_SIZE);
 		} else {
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2102,13 +2069,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 		}
 
-		/*
-		 * No need to call mmu_notifier_invalidate_range() it has be
-		 * done above for all cases requiring it to happen under page
-		 * table lock before mmu_notifier_invalidate_range_end()
-		 *
-		 * See Documentation/mm/mmu_notifier.rst
-		 */
 		page_remove_rmap(subpage, vma, folio_test_hugetlb(folio));
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-- 
git-series 0.9.1
