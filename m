Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E475950F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:24:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qIkWGxH7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zk80GFZz3cWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:24:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qIkWGxH7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::607; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5ZdB2GQGz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:19:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkSyCTWVoR37jmOAnWWvtQl57jsFLxSuo/yunrcyCDFIYLnEl7gNPBQb4zBzjLWS/oXAMUJdNwOXYo5nygSLGs7FkI8x1zpPBjFc+3h8Bd+oIAc2YwzwXlZapoEengzEzrLoNEOxoW3Q2B2s8baJZUHATwEHaKuvJa641vpACKB3IIez8IqT1NHYFpln7v7MXimNzmG8lwhdgNQVmLyluaPQQ9saZ0NUbfncPDRr2WSs0xXs/03S5bz3By04ExWAgnrr5uxtoeliCYluneD8uoVfBLtEUOeB2xIw70ipIhShnwQJG9ZwR8/oeAek1zoHDF6AeWglCisYul0fNq23uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVZWmJyawWp7qJVj6fsL5exDFyKRe6K0X+0eHRtAuyU=;
 b=V1ZutFK6Q8x/nr9TF06yH5fKk2C0IwKcAC1XyEqRu/mwS0lRURPeskrb3roFgCfQs0Y0TGUwXlqxpFlHFG6LKUc+V9j6mtWPbMlVa/6cYEC/Ltmp0XrKAsmndcAxHwKRlxSBmBTlD+bWubcK3u1StHS0J7aMm7LlDtgUsNw3t12IZwDWeqpwGuijxv1GbignJFMp5rTCih0uHDccyZF2BkYHtvUBWeLvNCeLNm8Rom8rsrJSzD0jZ62rElMyB9AqoqtCSN468bYd3SMVhjIeW+oLRXrR5HUl7/oPHkDAShj+o/4OPTPYVUoPzvfrYvEquxWVh8+T25q7cXx7AOb5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVZWmJyawWp7qJVj6fsL5exDFyKRe6K0X+0eHRtAuyU=;
 b=qIkWGxH7ccaeoZxYQ3jVzLGVx0mc2ptR9id8O58uwa9B9C0UMnI8p129b1/kG/afwyG0uOtj7EiO6vxCskvdsmKnFH1qxUizO8bT6H7in6/dr0edQo3e1RL2TNJpzKNgNKe3c4QoV8e4GZBEMm78NhmTnkbbNmSEjnDugjMDQfipkT5642pjOk9AYqvNrGSLs0cNrzu/Vwo6VoZwvzRM7SE0zE9PRtBRj6Vy3Nl5f03kYCP/Kj96wAMyyNt8gmuN3ETA3E5wo/3uqpDnmXm0GQbq8IIuB7vzo7uRQPgbP/NmOzuv6K563rC/o1PF3j0e/46awB8327Fb3j8nepU5vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 4/5] mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
Date: Wed, 19 Jul 2023 22:18:45 +1000
Message-Id: <b41972bf7b5c4d6f7ac7df5bd9ae07dd9fcb58ac.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY4P282CA0018.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6b6453-5239-4870-0156-08db88526b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jFA/fkx5PNF1Hb9ye5JW1X7Cmnqk1Woo+XEeIjgNlxg5WpWaoWwiTQfm3tWWOme3ywog+eTLg9GwYQYUIaIVRMUWm8CG/95hxpdyPxmITguoOXq3SmJvZJddcmZoUAqiVTT0IXC5GKteNqCGzAeO4istOQoKsQCf+T9uA/wN+iwvVHRG6DZGR0X2XK8xjQ3ACRrNGBSOpvcEtrdfQ0kS9RqYUXIQSM1JWXeVPWeRk0ozAocb9hM12uE9Q+YftObMM10QFKs2dFx5AT7kZ7+tWdnzE59ESvWKiKB6sm2e4YX2nPhxFbQxWDH2d0EHxthm2CIAVTb0wp2hsdb/I+PXTRPG3eX+6gtMV2WgOs5GcJKRtp3NA6G9Jna3dxDz7Z3lOcrkyssQCQ4tXeTg0cS6YI0nnCuGxEclWpCwdOEFCcxOoeZqkCTyOKQ/ia+OCnCFrza5wl8ddvD1/LvNf5f9/tpljz14c38suZmGpi8LHBVVrhVpMHjFKJgZkCbhurYRiqCWnXiNQ4P5k5JVbuYpT/Axc5QAqO5bA8caGLeUrOE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(30864003)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(186003)(7416002)(66946007)(66476007)(66556008)(6666004)(6916009)(4326008)(6486002)(86362001)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ns9g3m9R3uGn+yRf5VO8lYyD2d7iEHdJr44Er6nShVW6bjeln71Ll7C1dXHl?=
 =?us-ascii?Q?P4Pzsfp9R6ouSFnQf9iKNHRjMO4SGLMf4M+q5xELFhXDDzLWtcAFLa5Ddm7d?=
 =?us-ascii?Q?QLaC9mH+PEdWtcXumGxIFR7dSDQMG4LwqE5ggsZdE4GPnfyBbFw+zAYsnvTK?=
 =?us-ascii?Q?CK4fv4WnvVQUa3gEFLTnQhAL+g4D7qOtIG9r5FjimHWkT+NiB26Xgd2uyux4?=
 =?us-ascii?Q?4jscVXuUiG6oE2Uky5/7qW8s2B9TGn4FeR42Yzr4FqJRy/71GWFa8AQDsaSp?=
 =?us-ascii?Q?gtBFSKAWZDx9YPHISUTaSGRvUNj8IcF5oOe++WBPsoIVy65jEIEKCAsKUYv6?=
 =?us-ascii?Q?DVTbi+oHr7ewLzviaD1JEy4O7hwE53jlA0ljGwNYaLhJgQYd5Nat2KSi4cqu?=
 =?us-ascii?Q?iPPpaye9D0boBp3MkJAQxfjmgi3MdYM36F4VaesCiLonsxvkujKynjEphjWg?=
 =?us-ascii?Q?1gThqqonqi9Li/dr6jfqcSHqFpZTqEqTDn0E+KejAD0iRz7G2l8ll/yTU6Yv?=
 =?us-ascii?Q?Pd4Rn3QizIY6CrApbaTW+C9Ijh+oESBRBL85uGkFI3yvOn8Oh6Bqahln1zD6?=
 =?us-ascii?Q?EE3I1yrnAlFu3TDu96Xwb9LCZDDEULUH3gAY7cwz4HazfqbQURoakSQfvAYC?=
 =?us-ascii?Q?rCm7CNCMrnh/Zd2cB2b7wL30MAr8CeDaw85VkoIPqADdZYdx5/1H4awB6vcc?=
 =?us-ascii?Q?FB/LD3Q1kWgnqwF5s5PZCao1wbMAyYP3fF1qqW2yZj+54V9uirGhVEUo+SSn?=
 =?us-ascii?Q?t7MQ7UrEVbv55tAuvjDjSIGsVji2Kb4BMXXMb1wNUVEDw/tS45kAwG6L702g?=
 =?us-ascii?Q?74HzP6HN28/qwZHG22w9WN1g/8RvwBPaSTB8XiBOT1oIsNvbghS7ZSPnFgBR?=
 =?us-ascii?Q?ZhBIs0IiPIFPiJKsGvbqsFuh4v/uDZQWMk3BUnsG3iTGIECgf8QJE0AaXZzc?=
 =?us-ascii?Q?7H/7hLpVrLiiH+dt+Qbjfr4394MFyo0oxCysyHT13it5WyyPAUoUuAeOCBZA?=
 =?us-ascii?Q?fF2yloIR4uJAz3Qexrsybrj4w1NlcmbmnBcwwtQCNbON7bjhO1Im7SO20JeN?=
 =?us-ascii?Q?m39VDPu4BeCO+b3ablEPE2AIpSiaOEPU7EHVALOhzbSTQne6CzoQdIHn9jCo?=
 =?us-ascii?Q?w6yPYSljeK+sBLT8AqCX82CcSsNN4PDU7OC9fitf1+E4wpmGuJCqauV6J6uc?=
 =?us-ascii?Q?35lLlb5vDRB+yC9d8T5rUpWZzCOjjT9BeF61+Tz4+P15uqMhn1Jr/se+zULq?=
 =?us-ascii?Q?5bCgG6wYZT8N06V0Kzlw/pBqWYzXh3L6/5+V0PsafO4k0wPFjfzhyDiOPP1v?=
 =?us-ascii?Q?RK3IxXHi0WDm1PLgWmAjkqhZHFhrkdSfKFBH/XKbH1NSE3VSy54AVzGti0Ht?=
 =?us-ascii?Q?5UE5rO+Q56B5sUAZmgMsMqD6NFtiQB5axaxZRmEdV6KBGlJbGUdfcnQ8H/GA?=
 =?us-ascii?Q?CSf9t+u02lllprONyB7+z/dh7eqkwJDrhyTjx5AtE1hgeezuN1BXqPhN1bsq?=
 =?us-ascii?Q?TzQZuzioV5pygLt3rzbJtjldbt70dUBGytyScFnDHNLuEkPz0u7zngFOHxWI?=
 =?us-ascii?Q?gABDAb0o7XiLc0ceubaN1HMohm7SATDNFjTAScPI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6b6453-5239-4870-0156-08db88526b72
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:37.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtusOXNKQlyZVspOP3Ljov1fymKyOR+4fWJpJMwVSK+WV6KfcX+fmfdOSrl/LD3zQXQQpEywjsusUX597XcLtw==
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
