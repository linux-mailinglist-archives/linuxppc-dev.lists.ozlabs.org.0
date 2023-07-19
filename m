Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1914675950E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:23:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kk9d2h/U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zhy74fmz304l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Kk9d2h/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zd65lljz2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:19:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT4Hn+0PVVo3rDt+eWn5r8qKuc3X4dogYNmojWkqrNbDA1P1CF2PVBR+KP9NG0otGbj7ARI5HJc55SVuV+JM67c6GAkobLC0FeVrF4OqCYnkpV12zDjG1ESc0MGY0cx6iwCC7pbwCweSu4uquV00fikp4kFmcIudJke1wgtEHKC2kLkcs4A53vDGWz455m0+aiSdpgJqb9xF64CUMlUj6nHhLWFrvTmfPyDl8RNTzvwaxaCOeYwe6Xuw+uRgaCmM8KSyLc7uYEmLNxnKDBEWpSkiTY06ukY7hHmmTem5ccU/GoOCayLUJ441UgX1K4RTe8rbezmQh1R65trsPP7MIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7ln65n/Hpq4F8/Xi4Ld2pMN/wvlMSEVhslNm/lYul8=;
 b=av9IOjAfkTccCOaG7Roau4LZeCgkjJI8KG5801kht/tx2V1cHJMqWKWwjq7J8jgmcQy/hrVtXbSoEhpvkmRNKNBFAlMAwNaUJi6lOQEI0vCtc8KbLRHZ5gUBOUaoCy2oRAmQ1hjLH0HWqjf2Jrfhr+3uWprBa3UWKGrN7UehRte6ELSGZNsflVEqpaG0QqhnF7Sqwk6TycvyCJj/WH/4X3iYnmlTJdY9MBF1dcuJErEWKZTVO70UULtOIwrbTOsUboDaGUopmRWVAgA2YWpu4BLeEgT/PaK45dguTPpOfOSsp1r7X4pol/pODo2vMl1PLzDFe/+E5ZDSPFo9FAmQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7ln65n/Hpq4F8/Xi4Ld2pMN/wvlMSEVhslNm/lYul8=;
 b=Kk9d2h/UXu8tHao5JqM+1d+vCXPa9l8xGIjEBGf+Dct6lhHNPTrdeEji4/x6VUQd100CAFLhiJObP/IImT1pABxZlyFbd7cOUnIDDgU0mRFh8wBUa/3ocWYOjR4Qx3bFpCpPBCWQYy5I8LRZfufNB4M5bL0bu5f4QIJ/mOS9SuRhMmItD6CAqOGThlsaZk86z65UezDedI6bVe6rJQe6ZFPwcohIFlz5jAxfHhRf895ZaOc9HeAXn6b5eyFs3c3hnOKfmFCN9s6wJqTY59bQDAUzTpaG3KnGbu+FFz5l1IwaSJTR5/zDDl5QG+zYkEgZgfC3o60lKz78rZ3aeWziDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:32 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:32 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 3/5] mmu_notifiers: Call invalidate_range() when invalidating TLBs
Date: Wed, 19 Jul 2023 22:18:44 +1000
Message-Id: <8f293bb51a423afa71ddc3ba46e9f323ee9ffbc7.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0013.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::18) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: bec1a96b-0b83-4e70-ea91-08db8852681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EtM+koDEZOdci30wx6IY9TSUmvjAhX0GGnKtEVLQsdAbRVZUd+MGCxgdIMOuFqYh+h/8Hyrorrzu+RlGct/iQqczUAdCvxYHLODwTG4xiCHmZzyhMEk+mN8VK2+eDWOwGPyac50mHkkQph0eR2OAJZa8Q9vq1ROxaVi3Ovu7+GNfg4fVvnFJjs1vjXk/WLbqJ8MVEYDp584KLAVgXxJytMN7aWzE6EWiZHmH7xtKoTrIeyJigJS3Ri3CL1HNT1XysVZ+C5XXdQqPxrJppuMmsGpFkeZ1esW0e/eu90a9pMxCvzTaFRMdDtviCb09hddMupdIJyO6V5/OXc/N2jjVBGIx0io4MMixuSHz7EE37Ag2GgBckOZQIU5BUi8m/2SyySYpeHH9mGe++YuGesC+jwiX3hcTh4sdiu2TV2AAq8JI285sydnT3FyImVgGDCzfQldXTo0agCmT+vep+tzbTF/6u8t+0W2wIWVLlrxzf60AsSwmsA1j4S2k3uAalqVbAIfj7oQi1f4X1I5JfLl62x3QrZgykb/9jsnGxcyVqa8y0iYuwgbjfmGercoPHKU7zVJvJTJU01ZbKNTemzij4W94aQnpNTr0IBDXjSt3FgIB2sEDxwGndi2sAHw36JFd
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(186003)(7416002)(66946007)(66476007)(66556008)(6666004)(6916009)(4326008)(6486002)(86362001)(36756003)(41300700001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?60km7DvzxHdwrqsIpGcxs/Q3i0aOP5via7XTlHRCeP5RCZX+FGHUuIJNn+xB?=
 =?us-ascii?Q?bR35KEFEOxglvfFYoIyEAnWKZLR0MvMYIXSgmkzc7VwQAZ7h+VFpxnKspk/O?=
 =?us-ascii?Q?iAXOvVYiLVbdRir8AzBzaNYFjCuez2bTim4YDD5NIm37p/7+R8dOTXVU/4Ny?=
 =?us-ascii?Q?UpouXbLQOVVwA/bl9FRJuwP2jGXJj6ZPBNyoOb0rmd8mQObWwL2gQKHLmIRg?=
 =?us-ascii?Q?AWZPEYdYIy7QyyPUQ8PLBnjSsSXXquaoTHxhEHyh9b8O/YIb1d5hcSXIxmhg?=
 =?us-ascii?Q?FdN6svKIseLGTzPX6k5ySv9p8eO9icoqmI8g9aX1FAtavUlP4ZBBejE4jYnR?=
 =?us-ascii?Q?E9HW/+ntEj/mg08RHLVPCuKZFpxth+heJcCXbLyv3wPCDngVmBlJTbjG4bvm?=
 =?us-ascii?Q?8IJJawCWMB0eswXWhCchTqO4Tu4mfDiJJiyTLgRA7tT9XhmD1O8ILpBuHXP4?=
 =?us-ascii?Q?EuvaMMCYu8U1w/Og323aovjE3ZV8IhD1FvoZfpFgINqxgP6IVBY4Y9K0vAqa?=
 =?us-ascii?Q?NWYV2Kg6S7Sbrcm18BP6ORCCuexknZ5XDN3Q7YhXVY1V2cjfhyE1A8nUViX/?=
 =?us-ascii?Q?xem5LflXdnSkAHnftKyfBgIQ4+RyrEZ8W1ABLwBa5xAH1hR/OLXHwtb+W4P6?=
 =?us-ascii?Q?ZNhWsBzhMxrZGRpwo81xcgUpo0t54MztmLi7mVmxMOhwREEeG1Hu4ESKClxw?=
 =?us-ascii?Q?cvRX7GsVsvW5dbKFTP8TaX4PgjQxmfrSzMalTDZMYVbhjOEMJznKnMt4zmC6?=
 =?us-ascii?Q?0l2E7DrTMGu7f6+UlhGkIjU6taoR6v6sx4rk3EYBUjUSkyINz/GpvzAT/fiT?=
 =?us-ascii?Q?3ittFCtVWM2ZYaBpepYLzPug68AAFe7+Ex1M+jFvtgXxshdbwD9ij52VoESx?=
 =?us-ascii?Q?Eb8n+cc1OFeVI8x+m9fqMHOGYy9znsz4S/COsSacqQBPgkim7eawwfFLkGVi?=
 =?us-ascii?Q?HQhaiInNDUz6nlDiEaBkbwTmFjOMtwLHXL6oShdgK3lknRDLQJEyhi+P2YUz?=
 =?us-ascii?Q?XkmeSjNi6LyGVAes62sqmtUfRx69oXc1Fn1sTv11NmqG06FGvwI3DU/V2zHA?=
 =?us-ascii?Q?otTepKb3rfb8n9OWi9z4OHqgAOMlIyduLr7N86hlQsxRP2rmbfRJTp8K4YHf?=
 =?us-ascii?Q?lMkx57stGROgdX8PUqvsp3Z0ZygSUynv5Hh9hVntKZxXprD+V8V5RaI0qb02?=
 =?us-ascii?Q?r62Qj/50pzFXW6C8Gk98cVffb8XvklDwte8B6Ui6NhjySxlYhbHAkl8moyLc?=
 =?us-ascii?Q?+5N1nFCCeM6xw98xlmJRw+tUEY9e5PWXNx8pONa5clk6lMI1w0WhSbhPdfmc?=
 =?us-ascii?Q?VKVT4TaitAAih/l0yCri8J7py1iPe1p5UaGkC5c0DFk046k96kHJ9IodIGj7?=
 =?us-ascii?Q?4ppWO60jq4BWCLIqn6VWCYom98FzuNYGF7saarzNMty8pxqCrAgVfvJFESAx?=
 =?us-ascii?Q?u3KeL4aoYMmvkchNaV/kw+In3ynUw5w2uzp9WasuEZN8zFUUnnZa0+ivs1ZR?=
 =?us-ascii?Q?7fHFmCod2W46vKDsqMIWl5CeO0WEbOpD6v//hLUZIrCBJ96SkwDYbk/adSDN?=
 =?us-ascii?Q?70D36XVMo6IOW2d7/+cdPB4KcUzsjR0oI+bZNxFj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec1a96b-0b83-4e70-ea91-08db8852681e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:31.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3fNEqTHibnay/bQtxw1p9JiEFoELxCfoOlQxAKb+feCYhlvr7bVZ3tkdpEzC6pcdqnILdxLUZXTMqEeJ2mCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
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

The invalidate_range() is going to become an architecture specific mmu
notifier used to keep the TLB of secondary MMUs such as an IOMMU in
sync with the CPU page tables. Currently it is called from separate
code paths to the main CPU TLB invalidations. This can lead to a
secondary TLB not getting invalidated when required and makes it hard
to reason about when exactly the secondary TLB is invalidated.

To fix this move the notifier call to the architecture specific TLB
maintenance functions for architectures that have secondary MMUs
requiring explicit software invalidations.

This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
require a TLB invalidation. This invalidation is done by the
architecutre specific ptep_set_access_flags() which calls
flush_tlb_page() if required. However this doesn't call the notifier
resulting in infinite faults being generated by devices using the SMMU
if it has previously cached a read-only PTE in it's TLB.

Moving the invalidations into the TLB invalidation functions ensures
all invalidations happen at the same time as the CPU invalidation. The
architecture specific flush_tlb_all() routines do not call the
notifier as none of the IOMMUs require this.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
---
 arch/arm64/include/asm/tlbflush.h             | 5 +++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 1 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 1 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 6 ++++++
 arch/x86/mm/tlb.c                             | 3 +++
 include/asm-generic/tlb.h                     | 1 -
 6 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 3456866..a99349d 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -13,6 +13,7 @@
 #include <linux/bitfield.h>
 #include <linux/mm_types.h>
 #include <linux/sched.h>
+#include <linux/mmu_notifier.h>
 #include <asm/cputype.h>
 #include <asm/mmu.h>
 
@@ -252,6 +253,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
 	dsb(ish);
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 
 static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
@@ -263,6 +265,8 @@ static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
 	addr = __TLBI_VADDR(uaddr, ASID(mm));
 	__tlbi(vale1is, addr);
 	__tlbi_user(vale1is, addr);
+	mmu_notifier_invalidate_range(mm, uaddr & PAGE_MASK,
+						(uaddr & PAGE_MASK) + PAGE_SIZE);
 }
 
 static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
@@ -396,6 +400,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 		scale++;
 	}
 	dsb(ish);
+	mmu_notifier_invalidate_range(vma->vm_mm, start, end);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 0d0c144..dca0477 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -5,6 +5,7 @@
 #define MMU_NO_CONTEXT	~0UL
 
 #include <linux/mm_types.h>
+#include <linux/mmu_notifier.h>
 #include <asm/book3s/64/tlbflush-hash.h>
 #include <asm/book3s/64/tlbflush-radix.h>
 
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index 5e31955..f3fb49f 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -39,6 +39,7 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
 		radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize);
 	else
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
+	mmu_notifier_invalidate_range(vma->vm_mm, start, end);
 }
 
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 0bd4866..9724b26 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -752,6 +752,8 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
 		return radix__local_flush_hugetlb_page(vma, vmaddr);
 #endif
 	radix__local_flush_tlb_page_psize(vma->vm_mm, vmaddr, mmu_virtual_psize);
+	mmu_notifier_invalidate_range(vma->vm_mm, vmaddr,
+						vmaddr + mmu_virtual_psize);
 }
 EXPORT_SYMBOL(radix__local_flush_tlb_page);
 
@@ -987,6 +989,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 EXPORT_SYMBOL(radix__flush_tlb_mm);
 
@@ -1020,6 +1023,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 
 void radix__flush_all_mm(struct mm_struct *mm)
@@ -1228,6 +1232,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, start, end);
 }
 
 void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -1392,6 +1397,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, start, end);
 }
 
 void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 267acf2..c30fbcd 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/sched/smt.h>
 #include <linux/task_work.h>
+#include <linux/mmu_notifier.h>
 
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
@@ -1036,6 +1037,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 
 	put_flush_tlb_info();
 	put_cpu();
+	mmu_notifier_invalidate_range(mm, start, end);
 }
 
 
@@ -1263,6 +1265,7 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 
 	put_flush_tlb_info();
 	put_cpu();
+	mmu_notifier_invalidate_range(current->mm, 0, -1UL);
 }
 
 /*
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b466172..bc32a22 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -456,7 +456,6 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 		return;
 
 	tlb_flush(tlb);
-	mmu_notifier_invalidate_range(tlb->mm, tlb->start, tlb->end);
 	__tlb_reset_range(tlb);
 }
 
-- 
git-series 0.9.1
