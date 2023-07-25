Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A01EA761A5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:47:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K73UlQGf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9JH83q8nz3cns
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 23:47:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K73UlQGf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::62e; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9JBg38Xrz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 23:43:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQOiVhFQ0MAGM+rZM+NYCeWj76SfOGuvNkZ8Txa3tGBq8kP3pSJz2lZfgeMSMcF40ZRbUpplECc/d8fHZcyW+7FwtKELgu+NF5GorqdWT9eq4PkZhxRxsp4OqYO/9MQboKhfUcKJLUbOqfjHKTKkovswW+y/EUvQwC7pR0fENWtde5LGBT4RA8h0y8UyA30Ip0dJ2LY+QNo7AD7uxjPu6CkI9hlmNvEli1N3g4jvDgG8e2eB3B7GhjpHVNhIfe48QepSgIHG3gEF2mwVj2ZrcFo+d5If/i/5MmsDolaR8m2eA20klIZIrXWKVuJ+aPMVfkoDPDdlKNPmGVx8sPpIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDNSkhRbM8klWFkwy+1ggUGwE01lDxa9kSP5AshmjRM=;
 b=jNWBhEXPyxd/3V21OwRFviS84/SjXOpJFMsIhm0+y1RlqQkqVbMVFjN3K+0COLP1DyZx4k6g09X7u4eTSUzaXHsAshlMbSrCmRcmEfueejqbgROd/E41TEIaTAE4Vse8ZxV+Rm3A7R4h57ev4yBCgpDDslVhupUZDNv2v7GyrcwdN6H7WjumS2/JXj7b0rpQo3kOBzBA3QuLYGcHdWix3uLudsUSOMayoVRZmdzfaFXVVEeGdVcEQhblcCLrCMauFJieNjdosUbIQuUZ3dwoS7xlw437y3PUd6l7NwqpWC1YISd5A66epS5kOgmaKR/ZZ9jQeC7YI5sTQICQjD6cDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDNSkhRbM8klWFkwy+1ggUGwE01lDxa9kSP5AshmjRM=;
 b=K73UlQGfetPf5uuxsCq9tijfUGqCvkKtPATS7SAfXF1c2ouOpVJr7UogIB/oU26zOpM5Yu2SekOAN8jAKtu/mwRe3odknp3i0I48scg9uF8TkLE9SkmIEABVnHlsqAic0yT7bKW9iwo0WazgxT1vijuWfiDY0J8mTvSqfoKphZuH/07jD594lWk6/lVFRXoje34gUXko4K18bg1fkCkom0wOvNLWoUdEwztHo/vK2Fz+XLxc08R32WkQ5vjMUMub+JOqOA+64uzcrrkVB6b/HD0j5NtBm+vLmQenwWY2an53lPmGeI6he9yEeQRFYBrqfpnLC1zYcVMH7jnqriTiQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:42:46 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 13:42:46 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v4 4/5] mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
Date: Tue, 25 Jul 2023 23:42:06 +1000
Message-Id: <90d749d03cbab256ca0edeb5287069599566d783.1690292440.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
References: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0154.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 8483cad2-1403-4cdc-4a1b-08db8d1507a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r3CJMTYiM2u2+Q/hdNPTl57ReW48/e422n0s/HikYnEMv1nU9DGzqIHm61tCN0E7e5qees0X0bnaSfGyaXz0bCQjGXf8R7LzOGqWgOwaxYx6U+JZyvNSWYXg51UtWmHzG0Ze0ibP5qWkWBvqtWyzvKMutPipNo2TghENmqLi47hLzT4GhTfrfxI9oNSPV/CbXNxeMNWWa9Tbipk8sDGGbYCKvpdjfnuWdsiSP9kFwfF22+cpLlm+0u/0kDYPIvcfmrSfI4elX9tMiAyi+ZMJiLkOstoXciX6FjrFMSNsw85a2AXNXker/Tst257y2lLDO5OewNhqNTQ2E26SjPSwKg5K66vtcKZq37qbswAVBmG2t/8/FnE61ikbKNUVx2IIzQ7tuyalFXfc8TdXKHkTtm7htOsHtatvpzktllWw8gs1ngrzE70umAkYzm9WM7VG1ZIiX1Pz5SYtX3f5k161ekd37eHWbhzteuQJs7wM/NUyHLP3JvQbI+NqfY+e5R2ROU7e95a0O94URId2qhZTsnEQ1vwz/yVW3miubqDY3FE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(186003)(2616005)(26005)(6506007)(107886003)(316002)(41300700001)(66556008)(36756003)(6486002)(66476007)(7416002)(5660300002)(30864003)(66946007)(38100700002)(2906002)(4326008)(6916009)(8676002)(8936002)(83380400001)(54906003)(478600001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uFPS3XS7bj2gJyJ9NxiIAf6cXuwgUXsja8jQYJy1hW9j4V53zE7mLtgcCH80?=
 =?us-ascii?Q?B709GOHnIO5Rohv3/EW/AgPyRIv9P99+6pg3g4Zr3mx2n6lOA4z25ppyh1B6?=
 =?us-ascii?Q?pfTDwPs5wuph3bjZAtRO57tq0BNukRCEBedN54koFQtmDmzteB7g5NeRauWZ?=
 =?us-ascii?Q?mFeSfip6vuJ2aiuabc1KAz+f82HyiMqaJcq1FJEXaHeaCKM9sLqBQ19617u0?=
 =?us-ascii?Q?vRTZRK6UdiwOlruc1UD/gkkFtMLZDS3stFh0pymsUZKrILwNAWML20S36wOW?=
 =?us-ascii?Q?9ztIE0XkKv+S2b0C/OBpELJYbzjrEzCnG+kCv5Iq4YZhlKlMEnmrqMM0uhuN?=
 =?us-ascii?Q?7hkGtm5DjSNLVA+463/J+KXFgTeKEHQ7DWRxCmi4S8EQaFeLlZHrbQf8qXy/?=
 =?us-ascii?Q?mHGFKRBnj9e/ITHIHArnsNJG6JELZX2sC7BpdewEvJAPVgcZ4vCsKauqkKSa?=
 =?us-ascii?Q?7oZTjfRB4YisQDmIpJ0gxeur3Roz/9PGBZlR9dSZbfc2IYbGOzw20a9TP8xk?=
 =?us-ascii?Q?RLUj4TU7M2MQStxyoVkExk7OGUEs9ht7NIN0deTXHcjwNQyl9oOUwYxaYm0q?=
 =?us-ascii?Q?0jqurgKMMNfT5RLYK1L/tYSdKbOAp39VEWyJwjIGzFxR+58fFwVdH0kiRnX3?=
 =?us-ascii?Q?ukLA98hf4DVO5Qc3p8xW3HWQclT+iTNgBScYdnL86V6BRGK608BkApxvcWSC?=
 =?us-ascii?Q?jqVPWaNEaGq8DuHZIofBfZ4waeUBc3XSvBNRUynMAv2ZrTuem0+kEznMNGY4?=
 =?us-ascii?Q?6Dvu0jpmXgUgrvYiGGTp+/zl2ZNHDH06G2vD+tood1F7pmN0Eo0M+5f/O+Rl?=
 =?us-ascii?Q?8n0pnk4zylxxF8sLxVvVQsTZmF7XbxbprtKxN/REI65c6xCpmHi8UiqYdr72?=
 =?us-ascii?Q?7vP+UsIvGyeJTjn9gZeRactYeSt3rg/iGsowiRLRxUbKnaDukK5lNcwMT/AI?=
 =?us-ascii?Q?RPL+gpS47dMLNLqFVLfBEtWDlr3iyST3hPzHaX5NC4E10eY01p6Iit7juKsr?=
 =?us-ascii?Q?pMH75q/hV2U5l/P5z7QiDiOIjj0mt/Sme7axC8NOz3egyhbfk7jJBPng3EDL?=
 =?us-ascii?Q?Oi2v9cXRDusIKtM0+shBTjdfxwqhcEQ1c/n7NjdRnKFd8km0l7jfbuvAbc5L?=
 =?us-ascii?Q?LfpDQsBF5hDxA8nPEyY7Sjq9wivf+i05/FEY+jG2DcaZpLE40+AgLqkSPqzU?=
 =?us-ascii?Q?sghY/CKFCk7TyIrmjn4xr61yUpIyO8TYfFZeFauRAb/frB4mi58JUpbBFWy/?=
 =?us-ascii?Q?6vQJX/aiVT1/PTFgV4Xz5U3qPU7VeDvxTsPwvvYR/iDfMp8GqKBgFvTsy4N6?=
 =?us-ascii?Q?oW7U0gA+3kJCJ1+3CfTmGH5WFoNxNGzcHFUoZcjYHWy3GUWVNqSx72xa15mQ?=
 =?us-ascii?Q?UI0Wj9QEbzgK8p9rxNzDIfHrQ3/17hDczxW3fwzz/tvMYiM8n+T8A/5tKc7X?=
 =?us-ascii?Q?oXPwJg9tuDTWoLQzvJXLrcpx0MQTRlGg8OGmzhxgclv6rhvYQDq2WqUwx1LK?=
 =?us-ascii?Q?VLHtap1UVbf4zS/4GVbRxtSzjg8F68vNRG86aKN+Mo/42nZTdQL5PCxpXNN7?=
 =?us-ascii?Q?fuFu0B5l6tyKGHg8hur3+OBFhXn1qXvp47zdA8lV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8483cad2-1403-4cdc-4a1b-08db8d1507a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:42:46.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ua5FOi9kb7hQZxNQ7P1efvv6V73oa5LztJOAPhCYqjRYfmgHsC3WobOihmxyjKmUA6CaHaePeEwabRwWPVfyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org, robin.murphy@arm.com, npiggin@gmail.com, chaitanya.kumar.borah@intel.com, linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Secondary TLBs are now invalidated from the architecture specific TLB
invalidation functions. Therefore there is no need to explicitly
notify or invalidate as part of the range end functions. This means we
can remove mmu_notifier_invalidate_range_end_only() and some of the
ptep_*_notify() functions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
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
