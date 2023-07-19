Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32D2759512
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:25:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hFW2GtK2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5ZlG4SKkz3cby
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:24:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hFW2GtK2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::611; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zdc322hz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:20:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IL+EyisKPU2XEGp450TJCoiQnl51h4f+5ARx67Df6xPW8jeJcgvf/2jA0x21JqJ8ASUQyv06XrGv7KzC98gIAD603AeexeW6ZwBhktfTFtyLfhZtb8KKA3/OdTooOorACWCbtelS3Mk7ESfYTw5hRaWr5vFWr6PnH4uUdt7gLJXJPeG7KDrdNYlFYD/uWUoZEYJTVLZO9iKibfkk13ObFXswV8ARxuXohrdq6azFmKnB8kwohxkvMtAUrhTLrBdzmIxiJy3gfmSaOzzKqYDrIBymABGPDArUNwSRzb8F3lym4Rx3zDjWol7rDGxigL9h66Bq3ViyY5kgqPd0UXqAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbud4LSlK3yfCTb3jVXNEr8FB1vIhgQnDlLONht1yzY=;
 b=hN0VXTWSSK6f8h4kCpPs8jsVe9uwZtF86DeyUKXIrwbrGlra8NM1GBUWpXnjGB1B/lI9GITTTgst0mztrCbpv5ziupnkxdGU3jjXlUOhTHbPta3Evvd8/xqMIBBLDBfs/i1vaFsVd9H0UG39O2Ei8VcTTRn2f3fYWdnFQzhVjZcDkyXNDLqb2JIXk2gH/l8WVAZBvTSGGP+w18EZE7tO+/CNYWsR4ZYTwSNogqUYSRqlV7Wo19qIBmRb6eAJY7ojRlhfnpg/BjscnYWvObke1mmUEbIW3Cfi3fKmPu16w5LYZyga35t522M3MuQQ5/ab8SY2v3CuVZcw917q2YkmSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbud4LSlK3yfCTb3jVXNEr8FB1vIhgQnDlLONht1yzY=;
 b=hFW2GtK2ISijuMyHaioaSek3EoFQf8l+CacoM+eYoSIx75Hflh6qBVx6OgP5wH/9VHGniw40AhHSn/qT6q9Im9w/siY6Hk1unRoOVvfb1AnDLJxS5gERA4OVrUCQveyq6255bML7PE3UN2gOOGK3WRE0CJzZfJ2Gi/IdQgyZitHI1w/vumRADmvl/fOWRoBsDAbj0c3LyuoCivtfA8QRrNWLEmFBpo9EdyisAf5R1TjCwl6O+9aMhHiTHyCY/sudN66cYu2mNSk2KiUGbPXzoIuLUpiQyUc4r9Jz4v7xcPJrM0/12/eQJOsrx+rLsrvuSULgP4whEur8G1+ldD51BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:44 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:44 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 5/5] mmu_notifiers: Rename invalidate_range notifier
Date: Wed, 19 Jul 2023 22:18:46 +1000
Message-Id: <9a02dde2f8ddaad2db31e54706a80c12d1817aaf.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
References: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY4P282CA0011.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::21) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0f25be-1ae4-4b9f-226b-08db88526f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	U0DwmTa1mLjTNdKIGPSa5dYZIYxxO7uHJFmjs8xU27vi6fAQa4Md3uAiWCwPa9BIDnBXnAbd+Vvf7bWTEKulMDqw85D8nGTc8DZOyZch+HO4VJ2LiUeTZCI112CE5vteywdE/PIhmtWGqLPIpPK9KTRKC+8qf0PApL3+zYezJYPFLUKZy57NJN3X0CHTi/BpkIKQKM01OStp51dZeD1Ok4K6y8vJUuP8JRF5wtESmRy3YoCzQ0rr1BRoayZUqhOWEvm5zHbU/RPyiPs+hRetN5WLMO9K+82eAw4LrHgaHE6Ai5P0X7RSIAR0JzpqoslVmFGR0J73Ivpbq/sNVhp11LJado0YyFwGhOoILjwBq2Kr9LD7gL/sununM4HxhwffTMK7/vM/F3p+GBIXxvJ484d6WxaK+HacVWxizjoPXOlu8nzsXDXlBbpTxQ54AKyjTdOhKJwbW5HYDnbEvY/ywIug+2hOkwEkRxiAakyGXkTPvH2CSIdJ0X9XAhtDnm8FbRCakHhmy0BbGD7kfqaNo7ZfcLZnEvz4qOyG5hsXFBPXltNk1j/r7SH/lkIBeKtZ0nTQB5SLGxJWPdWIdBwSI7/85Mqg0tuZS7JcKsowrJU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(30864003)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(186003)(7416002)(66946007)(66476007)(66556008)(6916009)(4326008)(6486002)(86362001)(36756003)(41300700001)(54906003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xVdMQQwH56BtHwdBQAwW/M19P864N0HLiGQN3TmF++VWgYr8uwtamQeUYAg+?=
 =?us-ascii?Q?yNqs9X5wDhvx5EM7/jQrjn/YPX1v+h2eWUqlO56I8GaQZ8Z2K+H8p6DXesSY?=
 =?us-ascii?Q?uv1WZpp3lwH2GbNolITCozslZRgYjz5xSBl6H2SdJ5y8RnwLZx61DkgqY8/n?=
 =?us-ascii?Q?8xEXP0Zhxd6IcfRmvSPNbLLTs/JTJd6q19zmPKEPKyZeU36ZLR0O/GZ02Mu7?=
 =?us-ascii?Q?sZCMZuo6Yf2KTSbUvvd+vxfId8LLP9WDuY7w2p3Pg7PBrqcpGVtjbpk5ZGL/?=
 =?us-ascii?Q?jqdiGfJ/TUuau1ryNwzPLK0WIgVTN3SnIzALynm6iAE9/rzyirNbIPUpJM9Z?=
 =?us-ascii?Q?qMV1zhlYhCV+v36JfQh+c8U76Ikd2QYBLLc4McIV/hAzrdSsfIYpCEKRWAMD?=
 =?us-ascii?Q?xT4lp57yEasgjGyHozM0AdHnEr9Sy45JTMUrDfRT7GmY1PZnIZjqM/7Z47yc?=
 =?us-ascii?Q?olLEKS5VyXVZFzs7AlF3iq4qiRTZWPMUaSRmy7kd6O3bbyaBNkLQWV3x/Ug+?=
 =?us-ascii?Q?8jRzf/41EK2uU864a9XN1fPGVp6v8T2wUGYpA4xlc/0J6frhxvThdj/BvyKV?=
 =?us-ascii?Q?tdplDgBqQEZNfj4r6Wz0sWLyF1iM7/+M5Q/vnQXLimRQziEDV1la7BNDIzoS?=
 =?us-ascii?Q?XcpgkUNgMBUJbSvJaA3kbij/GMAFXli+O7onJSkwnYSAu6hM8dsA4J6FyOn6?=
 =?us-ascii?Q?ZIOgoYh7LB9CFr5YODbcJpiN17xCEO8kLpQ/2on9t41qdgPGRIa0ElwsyZoH?=
 =?us-ascii?Q?ohMXjkyfKupiyosk6HWga09G4PANwNFbntAtq6rjBwi1vtTTMIXxPR2+Rocp?=
 =?us-ascii?Q?GQ2m6mNENZsVWUB3cQBSj8ekdHQCZ9n6oiAwwC4d0TKQkcxCShq1HB724MgN?=
 =?us-ascii?Q?lc441kExLRIvGi0BsBgcMCSV2CZZxSYvKd12uTtMZ6DLquJIl4kgDnrGBReG?=
 =?us-ascii?Q?A1SSPXOJIF7+CFS4bd5hyNBqAsDHltDRn8uQ/yak8ha1XydXfdQCAu1O8AxO?=
 =?us-ascii?Q?LGYKb6Vw9RLIfdciK0l8paDVe6snsg/cUbuGR+/px0ipo+nb8JGHyIxG9eAJ?=
 =?us-ascii?Q?yJQdopG0pXUUVRm3Zc1+P/rkEJ82q2lqtgGdZ6fIxCFa39nyz+3G+9QcVDkF?=
 =?us-ascii?Q?LGpxKWvc3bODEhXErzAHa7USMnchWl/TUxjbCPxzVJ18ejWBTmtdpgHyLRfs?=
 =?us-ascii?Q?0gAb53c2gBs7e3TLQ4riXAgw3Jf+iUpDgAZjGxD+xDxVUkSHJAWfB10Ufc4B?=
 =?us-ascii?Q?m4brJgwKSd5icgbTJ0YnrFXoBvAXnyvJZkto9eEnQcKqZ5c3sMahAh02u1oB?=
 =?us-ascii?Q?+LQV/OrmJ4sGhoWPhDxXRtXguTan2qJ0JC426z5VF+Larbv6zwMNZ28ISNIt?=
 =?us-ascii?Q?wVPOQ9sDsjv7/FKfdwklkeV9G3syPP+7VNgBNYdzeaAmyxqc4NyMJQXQ5VAs?=
 =?us-ascii?Q?24pYzz8fxSzPX3wj0ZQI9sVE8XVSDXoungQpffGiGch7SzuT2KBgcqGe3get?=
 =?us-ascii?Q?CtsnuPk95tzYEDtGoOw094tLFUsgmJeUl75Nkd7fRYYDZ2lT+iRmOueJVzoA?=
 =?us-ascii?Q?gLePjB1HCNFR9vaXaNW+4EkPEHhMytppGQQdGtss?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0f25be-1ae4-4b9f-226b-08db88526f54
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:44.2253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u32lRe/7uiGKHmvSg054gKMKJ9fAKHGw/jUro8bl1irbdChFhUa2F3++PMgC7MYid9WOiu4Qs/R+/CtrEgem6g==
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
Cc: x86@kernel.org, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, Alistair Popple <apopple@nvidia.com>, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
 arch/x86/mm/tlb.c                               |  4 +-
 drivers/iommu/amd/iommu_v2.c                    | 10 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++---
 drivers/iommu/intel/svm.c                       |  8 +--
 drivers/misc/ocxl/link.c                        |  8 +--
 include/linux/mmu_notifier.h                    | 48 +++++++++---------
 mm/huge_memory.c                                |  4 +-
 mm/hugetlb.c                                    |  7 +--
 mm/mmu_notifier.c                               | 20 ++++++--
 12 files changed, 76 insertions(+), 64 deletions(-)

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
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index c30fbcd..0b990fb 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1037,7 +1037,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 
 	put_flush_tlb_info();
 	put_cpu();
-	mmu_notifier_invalidate_range(mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 
@@ -1265,7 +1265,7 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 
 	put_flush_tlb_info();
 	put_cpu();
-	mmu_notifier_invalidate_range(current->mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(current->mm, 0, -1UL);
 }
 
 /*
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
