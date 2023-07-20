Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D675A991
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:46:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mE3VgSkr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65rb1gdJz3cm0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:46:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mE3VgSkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65jm1TMlz3bxr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:40:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp0sD6v7udW5RFf4udneb36JIpoguD3JuCQrUBGAQNIHTLbYnkKuiyD2ESJ1nwulGkS24XP8HtG9BYXL8/2Ahhc6d6gyj/kQ2JkDg34i2osgwllOBsDAmJ1pKok2y1c/pHqIGxUnIYSx6OTGnVkCj4hgEOqBaUnQECcgvsHDYjWOHQD8RKTJP9+vgDP6r6K8BD0PnMqZFPumGRR+sZFcx+FkEGH/8pJ5foVUtbWlJ1lzSu78FwETLmMDsV9WGhlqt112S+/Ak43d9k5cKFNJLOwc+QH0kAbU8qAZkTCaryKtsdHm1+vVI5r2yu1dTrBU56jXVZRafOMW7TfquWn2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH28H+CAnzGmPruk0vGr9QVHzZtmLOQboUMLWND1YGU=;
 b=BoFDiv66r18UgHbxA5bntoevMyj4UhZtdW/8yCALPOVbgQD480tny8FDpz4Dz1WhJW62opsOnYxxU1EsuF/agYqqGZxFTbGDseJRA/4NnEtJFED5PxmtmP2sVajINsbQcPBsixU1qfblww2+JhKSWO7PWhkxyxAx/T1yCCGcLNsoI0xLqK5T+lQRsIwHQxd8BaprSdxumCTlNvYy1kmrW612IPaoj3DJWhwxeGcK2+EyKXMwtjTxJDPBkww6y+wOZ+xdYREMohKUz0gfaopRHaO3M4vYiIfCyW/+y6JYBJe8Ld0ea+W0GODAymTb5XIUh5hKXhR2bia+I/eEp56eHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH28H+CAnzGmPruk0vGr9QVHzZtmLOQboUMLWND1YGU=;
 b=mE3VgSkr4Zq62VrFLqFvZqijVQhldVPKcC92Z0aSLYdsNNtBktvQs6cQlPEg/Qdr0FDzk+7paWIeM7kryTPPRTsvUflZBF/1s0zNyJ9XS/IPftLa7MZF/dZMTnArn8jUbLArqzRpDZk7EOuO1Xb3yu9hJgrQ/cHwhffyUwpXzZF5KRo8Iz8MPj7022b3fQOB33X/bSJfLALSljSWQ92xAeu/Ys39HwPH4wbuJ6Q/Et2kTgWA67ZPi26td3jjfh9h7Fm239977wsIlxL3YZI6Eydzjx6g1FFxbnOUwoWDwN0K4wE9tItz1hcu0TamHbtG9b0RQHEHxS68VlleDpAWlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:40:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 08:40:14 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v3 5/5] mmu_notifiers: Rename invalidate_range notifier
Date: Thu, 20 Jul 2023 18:39:27 +1000
Message-Id: <3cbd2a644d56d503b47cfc35868d547f924f880e.1689842332.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0156.ausprd01.prod.outlook.com
 (2603:10c6:10:d::24) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cbfbc1-c0ff-4054-614e-08db88fcefb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	q1RUZK5rBSPAC260poeKsGZQ67ToNdg7OP+9XBJ6wA39XWmMHi0W3R0vXPnUfYs4jKzzOxx+1kNld+Dxc/BSykJDe1EU4fE7nVGhkjMZJ02jAvf3B/g4/AOwaWoKFmPdDS98SbNh0Uuzq3wNtBKmr8i8lxq+Hjkg/5ibYLg4K6i1iXCaLJSC7HBZIxhSJ4HkAh1+AmpvEPC+fdPaGhzA+znYoOc9Yqehj1B1RKRKTsEQ9aw93AvZb8/rzOwejZvW8RM/n9XkL9JczjsH4nQtnoclbvLSYUzwrTmOTPQNeni0Xio+vILv4t0xE0M8mcBDp+v++6MbRphxqzqQwP+Zz6+XkZr6F4NpJF6fWCISwJIkFRw8lkgJoCL2JZUrmlu8IfVx1Drlnnv5OcR6owGwooICIL0zKlhb1/ntaaaaQV5s6M4UyR7y26hxh2BgUhv4BZKe8cnN6Tmc6FdzcQREYwI1f9JZ6mc5whT91EtsjR6QaTpxVfsh8+bku5uPmF7wsXc7me1BZ8YxJOBw1eV+oY9F6spRQVhv/0Jh7ROghCUBa5RwWGuqD7udsii+7jXyRdninviN8zv5FMusKQLKQgirzieEKqYjjTxByTpSx60=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(186003)(7416002)(478600001)(6506007)(6666004)(26005)(41300700001)(66476007)(66946007)(4326008)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(83380400001)(6512007)(107886003)(6486002)(30864003)(54906003)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Lu9/xGhECsxFSuPSVe21S4nShrycFRbZjy4S51HrMBfAgHUO2hFR+v33/n7I?=
 =?us-ascii?Q?hk3vfip4UkLaZKXwf0KnCDXHKG4icj08TVmSl42R0+5cTz96zkdnY/EYaTYB?=
 =?us-ascii?Q?3goY1DnRfLUtMWrfTTeILj1UnsiN9ClL3N02SGYqU15ladFrpfr2KGMJUoV1?=
 =?us-ascii?Q?9vFE+sQs6f8NQJt31IqXgemQx7hRZp4ZgOchEvqGhpYlZwWdScNR7OkAkVb5?=
 =?us-ascii?Q?R0/K9168hTO6awdUb1ZKYQoGyFZ3yZjNNNmo3SFXQuW8FgKQgN7P9T26EhxC?=
 =?us-ascii?Q?ihx1Dep9edpNxMSIt2edRaTOrk0Cu7wU/T8FtYNMtGzTj4zxU/w0rSOXvnLQ?=
 =?us-ascii?Q?TfRlccybKUyPaf/kd4pj/JYW0fjV5DIUYS2FG7SWCkjjtG0ylT7PTdbVT02+?=
 =?us-ascii?Q?x13VnhUApIrjDWa+ZeLVM7DWygBuKnAKss3yAeDJQ2t+50CvWR97bemW+dVl?=
 =?us-ascii?Q?w03ObCYRmtom8x0+F6k6xFSnYgD3XFFaZOIHn8xLsnntYfa+wl0i1uPc8/5h?=
 =?us-ascii?Q?jgbjCaRHNy/KK0Dr/SOpPHQfxPc/9hhBNz8DcWaZ9csjrXd28CyOpKd6cOjy?=
 =?us-ascii?Q?d/RIztc19gYDAZDJ6xbjgfZ5qFjnsPLmvfFo2/WTcSrWdS4I8T8VHQ17F4Un?=
 =?us-ascii?Q?9Wp/1I+aJ/A76xPtYZYQ/owUFGUi9Kx2a5OAzs7ktbGRl4xPrRD8006DNwod?=
 =?us-ascii?Q?DeuQbszZ7MDO9gSS7aQRdyT75OHT/4bsDaJbVufmdY6U2uMq2Cv/6x9mapH2?=
 =?us-ascii?Q?a+rqn+fHqFrX8d5Qnv9mQO3URXkM3JppnG/MxxFDgBzsjQjMGV9FNrJ1Zqd1?=
 =?us-ascii?Q?kq5W6yjz6bHjPP1awv+c02hrlixNu9iBqsvVV5tvhKP4tP2OcziEJ4cfgEWp?=
 =?us-ascii?Q?fDP68by2QVtTI/25TyVWcFRxKDW9jZ1JdMX/Furt3DsntPd8h/woEahsQgZ0?=
 =?us-ascii?Q?CoQk2o3eS9ExVBJ7MyLNyWuwGOEFsE10eJiO3G0dXCVaIe8sxv/HdHyBDZ0O?=
 =?us-ascii?Q?VSTf+dc0on7xRfvtR+tCLOBHA7wXtdMUvQrAsudsxcM/kLGK/1lFoelnJljJ?=
 =?us-ascii?Q?/YOCqsCXg94v1wFijvh/aN8Qg2vr6A9tHobHdHKkN5hspc1yFw7dKCS/Yt3Q?=
 =?us-ascii?Q?dbJjBbRlgw78+wV6NoRSrHKAcqdA+X9iv9nHgvqbBc3CyrWbDUeJaVB8thL5?=
 =?us-ascii?Q?Fg4zWfJ2wQfm0NfciKTZZ3Qn3divMnuZH9yBCaZLSMb99DvRfDHrvLJjx8FE?=
 =?us-ascii?Q?GVhFguPCtIxksfK04Ke03AV5O9LB7Q4dkuF2pbOT54xOuRGnjdDhNUVjkDjw?=
 =?us-ascii?Q?tVDT91xX7HmDvk4uzxMdPJ/1Kw4mXm6IbQyqUUXYJU+VqlKO8nZ0uIVH5N7d?=
 =?us-ascii?Q?h98GAD7RkMPW9981OkIXRe1pOrukn5JMDnBj/8IbN4UbnfHDA8nUMmEWzhTV?=
 =?us-ascii?Q?wbytwIGBW80zroEDko62oUuP/R/BY542/1+IlMf6sdScpSzSH2E+TLkxl2pJ?=
 =?us-ascii?Q?5Krl9jd+ewR3z0kNyAe5FURiW6ezi459z3x9NiKir4XMBfH6hztfYVVcVTaZ?=
 =?us-ascii?Q?xP3Y7yOaw0mT2rILsQwojRpB6KmldCvtiJjWw4Nt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cbfbc1-c0ff-4054-614e-08db88fcefb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:40:14.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tix7EeaDS6l53ammRLs09uuO6zUxjam7jToWa7NELS3yf9S5uR7dpmf3vtRf5ORNgZt1wd3vx0Q3+/eMZ8QQ9A==
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
Cc: x86@kernel.org, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, Alistair Popple <apopple@nvidia.com>, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, sj@kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two main use cases for mmu notifiers. One is by KVM which
uses mmu_notifier_invalidate_range_start()/end() to manage a software
TLB.

The other is to manage hardware TLBs which need to use the
invalidate_range() callback because HW can establish new TLB entries
at any time. Hence using start/end() can lead to memory corruption as
these callbacks happen too soon/late during page unmap.

mmu notifier users should therefore either use the start()/end()
callbacks or the invalidate_range() callbacks. To make this usage
clearer rename the invalidate_range() callback to
arch_invalidate_secondary_tlbs() and update documention.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm64/include/asm/tlbflush.h               |  6 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c    |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c            | 10 ++--
 arch/x86/include/asm/tlbflush.h                 |  2 +-
 arch/x86/mm/tlb.c                               |  2 +-
 drivers/iommu/amd/iommu_v2.c                    | 10 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++---
 drivers/iommu/intel/svm.c                       |  8 +--
 drivers/misc/ocxl/link.c                        |  8 +--
 include/linux/mmu_notifier.h                    | 48 +++++++++---------
 mm/huge_memory.c                                |  4 +-
 mm/hugetlb.c                                    |  7 +--
 mm/mmu_notifier.c                               | 20 ++++++--
 13 files changed, 76 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a99349d..84a05a0 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -253,7 +253,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
 	dsb(ish);
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
@@ -265,7 +265,7 @@ static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
 	addr = __TLBI_VADDR(uaddr, ASID(mm));
 	__tlbi(vale1is, addr);
 	__tlbi_user(vale1is, addr);
-	mmu_notifier_invalidate_range(mm, uaddr & PAGE_MASK,
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MASK,
 						(uaddr & PAGE_MASK) + PAGE_SIZE);
 }
 
@@ -400,7 +400,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 		scale++;
 	}
 	dsb(ish);
-	mmu_notifier_invalidate_range(vma->vm_mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
 }
 
 static inline void flush_tlb_range(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
index f3fb49f..17075c7 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -39,7 +39,7 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
 		radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize);
 	else
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
-	mmu_notifier_invalidate_range(vma->vm_mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
 }
 
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 9724b26..64c11a4 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -752,7 +752,7 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
 		return radix__local_flush_hugetlb_page(vma, vmaddr);
 #endif
 	radix__local_flush_tlb_page_psize(vma->vm_mm, vmaddr, mmu_virtual_psize);
-	mmu_notifier_invalidate_range(vma->vm_mm, vmaddr,
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, vmaddr,
 						vmaddr + mmu_virtual_psize);
 }
 EXPORT_SYMBOL(radix__local_flush_tlb_page);
@@ -989,7 +989,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 EXPORT_SYMBOL(radix__flush_tlb_mm);
 
@@ -1023,7 +1023,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 void radix__flush_all_mm(struct mm_struct *mm)
@@ -1232,7 +1232,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -1397,7 +1397,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 0a54323..6ab42ca 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -283,7 +283,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 93b2f81..2d25391 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1037,7 +1037,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 
 	put_flush_tlb_info();
 	put_cpu();
-	mmu_notifier_invalidate_range(mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 
diff --git a/drivers/iommu/amd/iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
index 261352a..2596466 100644
--- a/drivers/iommu/amd/iommu_v2.c
+++ b/drivers/iommu/amd/iommu_v2.c
@@ -355,9 +355,9 @@ static struct pasid_state *mn_to_state(struct mmu_notifier *mn)
 	return container_of(mn, struct pasid_state, mn);
 }
 
-static void mn_invalidate_range(struct mmu_notifier *mn,
-				struct mm_struct *mm,
-				unsigned long start, unsigned long end)
+static void mn_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
+					struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	struct pasid_state *pasid_state;
 	struct device_state *dev_state;
@@ -391,8 +391,8 @@ static void mn_release(struct mmu_notifier *mn, struct mm_struct *mm)
 }
 
 static const struct mmu_notifier_ops iommu_mn = {
-	.release		= mn_release,
-	.invalidate_range       = mn_invalidate_range,
+	.release			= mn_release,
+	.arch_invalidate_secondary_tlbs	= mn_arch_invalidate_secondary_tlbs,
 };
 
 static void set_pri_tag_status(struct pasid_state *pasid_state,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index 2a19784..dbc812a 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -186,9 +186,10 @@ static void arm_smmu_free_shared_cd(struct arm_smmu_ctx_desc *cd)
 	}
 }
 
-static void arm_smmu_mm_invalidate_range(struct mmu_notifier *mn,
-					 struct mm_struct *mm,
-					 unsigned long start, unsigned long end)
+static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
+						struct mm_struct *mm,
+						unsigned long start,
+						unsigned long end)
 {
 	struct arm_smmu_mmu_notifier *smmu_mn = mn_to_smmu(mn);
 	struct arm_smmu_domain *smmu_domain = smmu_mn->domain;
@@ -247,9 +248,9 @@ static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
 }
 
 static const struct mmu_notifier_ops arm_smmu_mmu_notifier_ops = {
-	.invalidate_range	= arm_smmu_mm_invalidate_range,
-	.release		= arm_smmu_mm_release,
-	.free_notifier		= arm_smmu_mmu_notifier_free,
+	.arch_invalidate_secondary_tlbs	= arm_smmu_mm_arch_invalidate_secondary_tlbs,
+	.release			= arm_smmu_mm_release,
+	.free_notifier			= arm_smmu_mmu_notifier_free,
 };
 
 /* Allocate or get existing MMU notifier for this {domain, mm} pair */
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index e95b339..8f6d680 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -219,9 +219,9 @@ static void intel_flush_svm_range(struct intel_svm *svm, unsigned long address,
 }
 
 /* Pages have been freed at this point */
-static void intel_invalidate_range(struct mmu_notifier *mn,
-				   struct mm_struct *mm,
-				   unsigned long start, unsigned long end)
+static void intel_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
+					struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	struct intel_svm *svm = container_of(mn, struct intel_svm, notifier);
 
@@ -256,7 +256,7 @@ static void intel_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
 
 static const struct mmu_notifier_ops intel_mmuops = {
 	.release = intel_mm_release,
-	.invalidate_range = intel_invalidate_range,
+	.arch_invalidate_secondary_tlbs = intel_arch_invalidate_secondary_tlbs,
 };
 
 static DEFINE_MUTEX(pasid_mutex);
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 4cf4c55..c06c699 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -491,9 +491,9 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
 }
 EXPORT_SYMBOL_GPL(ocxl_link_release);
 
-static void invalidate_range(struct mmu_notifier *mn,
-			     struct mm_struct *mm,
-			     unsigned long start, unsigned long end)
+static void arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
+					struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
 	struct ocxl_link *link = pe_data->link;
@@ -509,7 +509,7 @@ static void invalidate_range(struct mmu_notifier *mn,
 }
 
 static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
-	.invalidate_range = invalidate_range,
+	.arch_invalidate_secondary_tlbs = arch_invalidate_secondary_tlbs,
 };
 
 static u64 calculate_cfg_state(bool kernel)
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index f2e9edc..6e3c857 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -187,27 +187,27 @@ struct mmu_notifier_ops {
 				     const struct mmu_notifier_range *range);
 
 	/*
-	 * invalidate_range() is either called between
-	 * invalidate_range_start() and invalidate_range_end() when the
-	 * VM has to free pages that where unmapped, but before the
-	 * pages are actually freed, or outside of _start()/_end() when
-	 * a (remote) TLB is necessary.
+	 * arch_invalidate_secondary_tlbs() is used to manage a non-CPU TLB
+	 * which shares page-tables with the CPU. The
+	 * invalidate_range_start()/end() callbacks should not be implemented as
+	 * invalidate_secondary_tlbs() already catches the points in time when
+	 * an external TLB needs to be flushed.
 	 *
-	 * If invalidate_range() is used to manage a non-CPU TLB with
-	 * shared page-tables, it not necessary to implement the
-	 * invalidate_range_start()/end() notifiers, as
-	 * invalidate_range() already catches the points in time when an
-	 * external TLB range needs to be flushed. For more in depth
-	 * discussion on this see Documentation/mm/mmu_notifier.rst
+	 * This requires arch_invalidate_secondary_tlbs() to be called while
+	 * holding the ptl spin-lock and therefore this callback is not allowed
+	 * to sleep.
 	 *
-	 * Note that this function might be called with just a sub-range
-	 * of what was passed to invalidate_range_start()/end(), if
-	 * called between those functions.
+	 * This is called by architecture code whenever invalidating a TLB
+	 * entry. It is assumed that any secondary TLB has the same rules for
+	 * when invalidations are required. If this is not the case architecture
+	 * code will need to call this explicitly when required for secondary
+	 * TLB invalidation.
 	 */
-	void (*invalidate_range)(struct mmu_notifier *subscription,
-				 struct mm_struct *mm,
-				 unsigned long start,
-				 unsigned long end);
+	void (*arch_invalidate_secondary_tlbs)(
+					struct mmu_notifier *subscription,
+					struct mm_struct *mm,
+					unsigned long start,
+					unsigned long end);
 
 	/*
 	 * These callbacks are used with the get/put interface to manage the
@@ -396,8 +396,8 @@ extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 				      unsigned long address, pte_t pte);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
-extern void __mmu_notifier_invalidate_range(struct mm_struct *mm,
-				  unsigned long start, unsigned long end);
+extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
+					unsigned long start, unsigned long end);
 extern bool
 mmu_notifier_range_update_to_read_only(const struct mmu_notifier_range *range);
 
@@ -483,11 +483,11 @@ mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 		__mmu_notifier_invalidate_range_end(range);
 }
 
-static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
-				  unsigned long start, unsigned long end)
+static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	if (mm_has_notifiers(mm))
-		__mmu_notifier_invalidate_range(mm, start, end);
+		__mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 static inline void mmu_notifier_subscriptions_init(struct mm_struct *mm)
@@ -664,7 +664,7 @@ void mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 {
 }
 
-static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
+static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
 				  unsigned long start, unsigned long end)
 {
 }
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3ece117..e0420de 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2120,8 +2120,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 	if (is_huge_zero_pmd(*pmd)) {
 		/*
 		 * FIXME: Do we want to invalidate secondary mmu by calling
-		 * mmu_notifier_invalidate_range() see comments below inside
-		 * __split_huge_pmd() ?
+		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+		 * inside __split_huge_pmd() ?
 		 *
 		 * We are going from a zero huge page write protected to zero
 		 * small page also write protected so it does not seems useful
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9c6e431..e0028cb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6676,8 +6676,9 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 	else
 		flush_hugetlb_tlb_range(vma, start, end);
 	/*
-	 * No need to call mmu_notifier_invalidate_range() we are downgrading
-	 * page table protection not changing it to point to a new page.
+	 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() we are
+	 * downgrading page table protection not changing it to point to a new
+	 * page.
 	 *
 	 * See Documentation/mm/mmu_notifier.rst
 	 */
@@ -7321,7 +7322,7 @@ static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
 	i_mmap_unlock_write(vma->vm_file->f_mapping);
 	hugetlb_vma_unlock_write(vma);
 	/*
-	 * No need to call mmu_notifier_invalidate_range(), see
+	 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs(), see
 	 * Documentation/mm/mmu_notifier.rst.
 	 */
 	mmu_notifier_invalidate_range_end(&range);
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 453a156..63c8eb7 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -585,8 +585,8 @@ void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range)
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 }
 
-void __mmu_notifier_invalidate_range(struct mm_struct *mm,
-				  unsigned long start, unsigned long end)
+void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	struct mmu_notifier *subscription;
 	int id;
@@ -595,9 +595,10 @@ void __mmu_notifier_invalidate_range(struct mm_struct *mm,
 	hlist_for_each_entry_rcu(subscription,
 				 &mm->notifier_subscriptions->list, hlist,
 				 srcu_read_lock_held(&srcu)) {
-		if (subscription->ops->invalidate_range)
-			subscription->ops->invalidate_range(subscription, mm,
-							    start, end);
+		if (subscription->ops->arch_invalidate_secondary_tlbs)
+			subscription->ops->arch_invalidate_secondary_tlbs(
+				subscription, mm,
+				start, end);
 	}
 	srcu_read_unlock(&srcu, id);
 }
@@ -616,6 +617,15 @@ int __mmu_notifier_register(struct mmu_notifier *subscription,
 	mmap_assert_write_locked(mm);
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 
+	/*
+	 * Subsystems should only register for invalidate_secondary_tlbs() or
+	 * invalidate_range_start()/end() callbacks, not both.
+	 */
+	if (WARN_ON_ONCE(subscription->ops->arch_invalidate_secondary_tlbs &&
+				(subscription->ops->invalidate_range_start ||
+				subscription->ops->invalidate_range_end)))
+		return -EINVAL;
+
 	if (!mm->notifier_subscriptions) {
 		/*
 		 * kmalloc cannot be called under mm_take_all_locks(), but we
-- 
git-series 0.9.1
