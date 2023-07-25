Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8D5761A67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:47:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofcRWonU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9JJ712vBz3cYH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 23:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofcRWonU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::62e; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9JBh0h6xz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 23:43:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzzCLVtxXDEBJ8jujG3B9FJD72SL1APfeI4Yyy60Ige6z0RWd9U4Ff9nwGJvGvdXCM/GfDCmjLvIW6daWXEmtQaI5HaJH9L/FtLQAsT9nmgdVBgM/b8txD8sRyLvrTb2FrHEnxuBXUygjJXDFCi7F+Fp7s9r9HAu5qQckd+BRxKz5maMEcpqO8CoRivSTQQ5AV/9oJDuiOfd7Q/IbdfMtzEi/sfdXi1zwu3+UxORjzsvlFMig0XYvfF3G7fJs24j9VNtS5eVt0wlNWFd6Il9Ac3/UnO5D/sCCIhG3CwDvqmf24cBucvF6xyJ2Ac+1A+MtzrHFM8LfUjxkYUE/N4Gpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVlDrQz9p7k5DLdC3KTopFsNoia+jUaUauoL5oQKFzE=;
 b=ZKRiy7rkIrz2gqq3nbZ99R0xtBs5au8gJnrrWCqzENTwY78aAk8rcTCqFXUsfi6OQaihSJNkJ+FLLjuddomScvORdHoOmafprqtfFD7mdN3MuWQnkYSlb/FN6nufTuqBUdujncUGDDc5od5sKl81l6u4aj85qdkKWEsY1Ajrh+CgvcZmdOW/Rwjac8gJLpHybyuOhLwtAH27nHiMYJ64y93FvvtVu+IhKBH1/fYsVF3ADApzDi2I2WrTkG9msnLJnl1mC9cuDOhj9tdZEzs2JhZO+3bjro4UfwDN/BS5Bfr5n+rXpa1kAl6OLcJOa6TK7XzZ2UpaokJbxOlPqGPPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVlDrQz9p7k5DLdC3KTopFsNoia+jUaUauoL5oQKFzE=;
 b=ofcRWonUX09rZyHJyUBCCYHVfVeebecdUgpnakbGZc7wy65PhGAg4i5eABmEDa5JhqcgNei+ICkEsacsWAjRZOODtmF5Nh77IP3jde09skHQFX8cfhTK3bBFrphvebqtfL6XiZY81xwSW1WwingE56GsU7iaOZe9w+A/HjDf8RKJyQwuRdw4CN4Z+y81Xb6aC0y8CNaLyHk0RieSh7xvXSrSQatpxym+NS3RMu649rwIAlEzo4By//2ItHicm9ZHnQtWdzguOMA/wBzf3l+aNfKGE38YeejFyQX15syAh6s1t2MxM7/h7G3EHarRzsfNuVToc7681ZseHPbbMTmADQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:42:54 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 13:42:54 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v4 5/5] mmu_notifiers: Rename invalidate_range notifier
Date: Tue, 25 Jul 2023 23:42:07 +1000
Message-Id: <6f77248cd25545c8020a54b4e567e8b72be4dca1.1690292440.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
References: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0048.ausprd01.prod.outlook.com
 (2603:10c6:10:4::36) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: dddc46dd-7a20-48c2-2292-08db8d150c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	R1t6JK2O5CjMCuAgXuG3rW2BAhnqvUV2A9FLAJI5ya1HEEmgvutUGyononZw7+xlgURjfilM2GiFRmeSEdacV2+nL1eXHSO3tsoLMGW5sDpOR8luDo/Cxk3aU8aP09rX4u6AlIBoSVa6AnUUIINBHSC+xuaVLqzD+xnatLYKsJTWGfurlRy868PU2jyCkPaZ4ws79j96Tm6tFeHpizo1BoSXvWs57eiATbYmEzSGTo5nQ9hRaF9+J62TnH0PhZJI70gMeGnY4t1iITq+IWY9T7eBFDsa1H9kPHzSWztj13MkhzORO0UkiQL2bg485mtYYrg9yhDooUlY7oB5UU+WDqbap3oqKsSum4FVuMBGYg+YG+nrVMVOUtJ0UqTKcuYpC95lyGdQTRcerGFmyAgTWnwCdgu6CMUL+nvaJgg9caD+1zg6FP5QBKxWIMinly1vlRSwYlxfvL0dsOyajIBIp6VYcr/GNahLbut2/BYLd3pSV+vB79N4KdVDNx9v89SbI9ZHq7yTaeDcFAfzk6myCKubTZuPbiCIPy1sdicbMk7MFkNTVU1ZNcQB83ho7FIeoK57FoMWIq54pdRHo7pdQ/Ga46iYo8BsiZDShNnkuGmBD/xNiUauYHmj/nt1h/fg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(186003)(2616005)(26005)(6506007)(107886003)(316002)(41300700001)(66556008)(36756003)(6486002)(66476007)(7416002)(5660300002)(30864003)(66946007)(38100700002)(2906002)(4326008)(6916009)(8676002)(8936002)(83380400001)(54906003)(478600001)(86362001)(6666004)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ox9nOdIz4V3OTbMuF/Qt9rg/k2z6fMReVQmjumgpCDBXT0hQBn6DN9zE1LaQ?=
 =?us-ascii?Q?IYdwzNtcLqMIov0yrdBW+nqzhijKGOUiXKlSxtqJ7G9aJe6kmF30iFqjU4pk?=
 =?us-ascii?Q?0l+ap5UaBxezkgqpY60xGJzHj2DYYItEduvUw7AOL6t6ZxkCgE2bCwkgP8/J?=
 =?us-ascii?Q?Z1Ma/xQNwQzF4DlSyY+vbWuaWu2i9kLPHz5FCw3Ivw4Ww4pljTQBeFaonMRr?=
 =?us-ascii?Q?JEEF3JLOIYXsNEuVZHnXzvQVgZ+ZUWInnNZ87EpxI1/NY7TQ3oqqY4HWKXGP?=
 =?us-ascii?Q?Wj0dIrB1e+0BrqPETt4z1tNCyujpUVZTyRIto8kYB3JfMwlYLar0dhqGiFTK?=
 =?us-ascii?Q?Wxir3+8SvyJpcvJY2xBM/89AadZ5f3yP7WA7hm7rFUNhGQYRBkPRJl6PZvRu?=
 =?us-ascii?Q?3wwrL2NsDTms1PZCzDV3ga1x8EaylGg7h++XgU1UkOtOBrH23bYM+gwB/xci?=
 =?us-ascii?Q?haiXB8TvJqntDLCdlNTHw02hZmBij2iyfvv9dnEfTY53ZRnW9OABpUe44xYi?=
 =?us-ascii?Q?rQKnfFAKXAnX8dhsMizAp2qJktyaIfvzVLB2wTPx6VdS2JReC07ZSXVwubLK?=
 =?us-ascii?Q?b2RziUDujy2qw3BfOCWNVxwbrV72ASJW4aiiob7mhm9fNr2F1xFujOyqBr+7?=
 =?us-ascii?Q?iELp+3UVrixqNz4Z7HNSS+3ccIuk7EYMAuFC/MLF3nuieD0jFmh4VbV7KFpl?=
 =?us-ascii?Q?KlbSNLBPNKpwd7pAPakrwBNB9crqK0o2XdpkyeDYixlpOQxjLzfi9ul1DYQu?=
 =?us-ascii?Q?BKMTxYobQtDiiJqY79p/yMW3PJg5R+3v439PzbJAG1aPa1IMARrB2KZHOP77?=
 =?us-ascii?Q?WyCO+YqboxhwENoRzW3WftbUxo+mDLdISf43qWxYU7Ef8YCC941X+dnGwi1H?=
 =?us-ascii?Q?4e7CLfIFSobXSC4m4lZnRZ7lPy0sKs9Z8jrDIhKCs56rjJwYLg5UTpoXKhqL?=
 =?us-ascii?Q?yHxWmDpjXBTEIDxQ9rrFymqQCxBuVjYHhQqUjdLJMVDeklPE9YXReJ/4G4ah?=
 =?us-ascii?Q?oCYIKnAAteNkFxcSzkc1QicfDVnNUWzy3rYL68i/jDV6/44eaTPcPUl5qH+T?=
 =?us-ascii?Q?2LEbOt7ro40Pw2Pkan8lI4Cch6nGFDerl+pJapHSMWu4oPv9FqvHYdadQOIE?=
 =?us-ascii?Q?fTpLD64QcOo96g+3eEcCcoYjZJT8w1eufPeeqMnwvgbdppwMIGm1ixVRpxsl?=
 =?us-ascii?Q?G6aqMYvWGZlF8UWA6rSQEaKV43GOrCB+FFfQRqTh4naG29+NIwk7//LxS7iS?=
 =?us-ascii?Q?FKFyQXxJAnFXUTEwsVu7jnKM+UAK9unyFJP2asZqEiIHIaeGXWySpiiIu6po?=
 =?us-ascii?Q?ZZjtsunNlxTBl+bvvUKgNXRb8d1hzhsbekRytPilOjzoTlLehrXbJPbwV29k?=
 =?us-ascii?Q?hLNID24ZDGItc+DRkRu1O2RjWaePMHE1okVtk5ghm+EJbN3ZFjPS3TAPaKG+?=
 =?us-ascii?Q?Si26iVnSI1fkQ9EJPl+U4kWndpZZabgs/oelPR1BWAWgCTEVoU415zxjwbo1?=
 =?us-ascii?Q?ZwozQ/wmD+wbHWuA7yMpgtpJA9Rr92aXfqbxd2JPvdkdR5G0UO9ncGJ0mmRU?=
 =?us-ascii?Q?jOv8MxMrcWX7QHy/HkvsjmSUu9YC0mbYyVKrAV3a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddc46dd-7a20-48c2-2292-08db8d150c62
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:42:54.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /f/5YCDen4SUg3bwagasAPr/lnqRC7s4sDGO6KO8VDmoYSEk2l7x+QSAcqk302FL518SZ+BUdbXMI3pS8lZx1A==
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
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm64/include/asm/tlbflush.h               |  6 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c    |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c            |  8 +--
 arch/x86/include/asm/tlbflush.h                 |  2 +-
 arch/x86/mm/tlb.c                               |  2 +-
 drivers/iommu/amd/iommu_v2.c                    | 10 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++---
 drivers/iommu/intel/svm.c                       |  8 +--
 drivers/misc/ocxl/link.c                        |  8 +--
 include/linux/mmu_notifier.h                    | 48 +++++++++---------
 mm/huge_memory.c                                |  4 +-
 mm/hugetlb.c                                    |  7 +--
 mm/mmu_notifier.c                               | 21 ++++++--
 13 files changed, 76 insertions(+), 63 deletions(-)

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
index 4d44902..06e647e 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -987,7 +987,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 EXPORT_SYMBOL(radix__flush_tlb_mm);
 
@@ -1021,7 +1021,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, 0, -1UL);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 void radix__flush_all_mm(struct mm_struct *mm)
@@ -1230,7 +1230,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
-	mmu_notifier_invalidate_range(mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -1395,7 +1395,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
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
index 453a156..ec3b068 100644
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
@@ -616,6 +617,16 @@ int __mmu_notifier_register(struct mmu_notifier *subscription,
 	mmap_assert_write_locked(mm);
 	BUG_ON(atomic_read(&mm->mm_users) <= 0);
 
+	/*
+	 * Subsystems should only register for invalidate_secondary_tlbs() or
+	 * invalidate_range_start()/end() callbacks, not both.
+	 */
+	if (WARN_ON_ONCE(subscription &&
+			 (subscription->ops->arch_invalidate_secondary_tlbs &&
+			 (subscription->ops->invalidate_range_start ||
+			  subscription->ops->invalidate_range_end))))
+		return -EINVAL;
+
 	if (!mm->notifier_subscriptions) {
 		/*
 		 * kmalloc cannot be called under mm_take_all_locks(), but we
-- 
git-series 0.9.1
