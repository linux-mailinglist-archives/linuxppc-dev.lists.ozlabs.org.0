Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43775A98A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:44:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pzkVvYJz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65pT13l0z3cCj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:44:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pzkVvYJz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::61e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65jM3zMzz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:40:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0Urp2JJb8Bsyj5XPSrYP1ZnUykYXDayVn9hFknzDkJs1mRr1Cv1LYNrGqmo2iqx/Gl5lcr1I9EIbb77tutGMNi3DyVwT+UDYj0XGcCnmXCjc5E5x4cm/kbkOPzMzvseV3+nrePAvTI3Ib0KrSyZaFN9enQTd60bxzigRumWtBQMYc3McdO0k+sC7Ac+8NDfITwNPgC/ebngsuwEhiZ3q9zBj7SV/zizHr6mFdsIQnvkDaitKXzPTgq7qPbMFYY+SDMD65tVt6fRCqiLUvraeyx+dyJQmlITpuGi7oabVtM1N7VlSscqgEjWSgF+4FWb1hnwTWxckFx3Cjt6Ysq/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyTjkl32gx9e58egMAR68Ym72eF/grtnHpGANsDW46c=;
 b=MIEHN7NSHcczrXuQ7uBNCBg/rwRO8xNzNvqQXMz3OTIof2EdelROairMuKzjEou7VIpkBGyt2HBqpQPB2jSXaJkabdUWwcsDhmGjX4zLkwOoUhtjfIiqkCZo7WS2aIu8e47U9EKmT1vzKn4GiiwzPg8ggJvIAbk5mndYbiFAk3ZQrNcFnhZygmduNZRLJt9pg4cekXbPry54Nswiucg9cEKDcHi2Gk79ZG7Z3gyKedtYBJpR2lDFndk8/101EbVRRDLG6Z1yctT3sejJGqGMln/bK58M5x5+Y5K4F41lXmcMyllyyadgtw5eMm0sFGAV/Ec38Cm8slJLC2jL0msrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyTjkl32gx9e58egMAR68Ym72eF/grtnHpGANsDW46c=;
 b=pzkVvYJzcqb+S4IieNcTuiq3SqCpx4UQZyGpRX8v1G+xz4RmfCmwH7iDq3+w9j8MuKdr8t21+zyJ/uNedHAlPFUmYOjY0S9/0OU2S2dIK0WL3ty0Uq/Lo69sE95g5yJD92OK55S6kWbD4sIp42Ova6gcY62WKbIRpRYjVP2QN9UJXNavSkceTLV5G67FU5za3mnPi6g88hhIpWYOiDIti9hQ9zYkwvGk8QL4j05Db+HoCI7udkLo+ok1rB47ihBUwvWrrkiFSNSt4bOcEiWtxcP+GtMbXOiXNjCdxmAq1K37x7QDKYbLibBl6C0YQNKDf5i2k9ORCA6eSQNqS5cRsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 08:40:00 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 08:39:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v3 3/5] mmu_notifiers: Call invalidate_range() when invalidating TLBs
Date: Thu, 20 Jul 2023 18:39:25 +1000
Message-Id: <86a0bf86394f1765fcbf9890bbabb154ba8dd980.1689842332.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
References: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0027.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:202::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e63b837-3c96-45cc-262f-08db88fce669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6tot57rTTfJnVhe6fp8DjkoKozXl1dpztfU9J9WUI4tb58AlpmEJDnzBjdJTh7XwmkkxhqauuOMRSVeTGHE0u4WLGmzGzN0TKJIm89mDKuRVV86Idy6ionB+dDlBS+pU7Zy/KZpvVgDGJ3PoDFg0oayuxdjRPrcNBE9DNDP4FQY3ZO9b79GxAGxv858lixRqbuZABj/BX+4vOG2OJJDUH+ib2kUxP+moHiNh1saqvDTgwXKSxzm1xmUdAJ6wIbr6fGT4/CKnreT1a+/+5E7BOxq0jazFHfmbEYqBOFdIPxhnRGtJQxbySNIhFbLaHaliMI3Im0DcTnK2gybJbuodV1ovkazXbEksQrfXmyegLzFShwwCzeEsVsrJ7YhxDcc4D6PQhVZJP/Ym8rcTK1diCT4T+kqTkQs+8zytOajTtyYamd5Uvnx0hvcL+PCxtcAd86WCYCD3hoYW15bsFHypnpt9IVzwATN6jScqzbE8INGYLaspenukshNNUgebDKSUhqA1CjsN7j9VsL+O+Km0wR8Ujo+F9FZZsaAO+PVMhK3nihEHVbwu0B394P9Utnv7G1QWNduuaa6uFfB68uJDlHsuBXjCq4f9jQiLTtxIHJNKcOHT0mQ92568KXjIAcnZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36756003)(86362001)(38100700002)(186003)(7416002)(478600001)(6506007)(6666004)(26005)(41300700001)(66476007)(66946007)(4326008)(66556008)(6916009)(5660300002)(316002)(2616005)(8936002)(8676002)(83380400001)(6512007)(107886003)(6486002)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/7HaGLIpXgQ8vHorvsI0YgpPv4wQ8MA9xwOxLIDX6vRO3AJJ5IP6DXoxBtzL?=
 =?us-ascii?Q?uVgMm61Q9VrHrMkGsWk2aw0q3fLr3wsdyWR2JcYaye8AY00ryRNrtrDuJCic?=
 =?us-ascii?Q?9g8UV9Ojdzyi0+N0iVEKYZsQ3BeIU3hrHs2uYXwzCYtD5wx51CYaj2IcIUXO?=
 =?us-ascii?Q?Wnguc6wM7lByDcH85bZdfMFaewNrtzJEZaJO1N+Qiw+1NTQHYGYeLzgriK0U?=
 =?us-ascii?Q?NRaHjlT5t42yBGr0MfgSsd+yIf6Qri/53qMs3x9vLl6PD2RoFGTjSuNsQzvH?=
 =?us-ascii?Q?twqs7l81n8qh+WsDClLA+CtN6CQAFxjdrBnQFnF7nS9VdyGFPIGaWOHtfJec?=
 =?us-ascii?Q?C42yiVLyBqXoKpqopr+YNQtH9+R9XTOexYo9zNEVb1pINZ/sowfxKj/m44Lv?=
 =?us-ascii?Q?8CdSLj+aRiZyA0G0bpCaHXalKk4ZbTEgG43X+ydXYp10mFHAlj0VGsOrDc4L?=
 =?us-ascii?Q?cpHmL4fEXqIvLo2ebJT8S74hCFGiuvjQtOg3ISi3y73H/4HENFLpA/wUZkTF?=
 =?us-ascii?Q?htOYkwCXgdf750AKk1TNkroJ/r2f7BzN7BsPOmr24aHY1EyOkBiL2kDLyQUw?=
 =?us-ascii?Q?XpPEg5bYzKLpnKtmwi2rV4MsJ0TV6wXHPvecq88FuDEQrvIB8jmuQ4PYHj//?=
 =?us-ascii?Q?Duy6n8Zbj/eJy4e/t6Kls1l08kl24TNp07XaElkqL6crq8HT8/K/2omkcQCI?=
 =?us-ascii?Q?k8UhQKmjqyrjIhJO4/LQ86IWs2Un7eRQbABSJQO6wj1NErKsmELStDJ+WY4p?=
 =?us-ascii?Q?MTBDgRriWaF6rJanVBktJKvenMbbevh2sXgnlm2NQ+i4FBITBhUQ80ujk21L?=
 =?us-ascii?Q?Vk/HXydHkciuwpOXvbQDOSwsmZouLrNFNjGHJ338K/nReuo0lSlCAnt8IVfx?=
 =?us-ascii?Q?PksL5RsMFeHXQAv6O0xVXMibn0+KWGkeVt9aEFxFhvtaIi3I8V8p082faEUT?=
 =?us-ascii?Q?6MVt4yJ9921Rft1NgmRdaJhVRND1wzUhBfgLy4kYeGv5sn5tpALRsi3KotP1?=
 =?us-ascii?Q?WvgbZxJidmZgD2l89vKGVEomMfQImettCy1vj9zsyR064n3ywsyVSn9CiklX?=
 =?us-ascii?Q?SRQgchWtSINi4ix4Rf/ctMASPWJb5NShhebNwW/sSV4FL1loPbTTQZ/3tM7O?=
 =?us-ascii?Q?Gvm43NvIeaSSpaegrcZ2DfdGcYTSyGHVfY0vQYaCvLw1gaOgyqGdbaVEXdaK?=
 =?us-ascii?Q?Bcdx0lHxUoXF3810Efrg4XkziuQDNZhO+vkZOEFnGJhQGLF8ezwMwbbMLvR6?=
 =?us-ascii?Q?qmSA4uvnjzb5EhcPSmTvzwWeXgevT1+dn/xcaiWSpySNZyuMV+QDQGQ1bkow?=
 =?us-ascii?Q?eOWGXk7MNpknimL2NpYwDKyzXayhrfPksb4Ci1ht6VdaEija8g9H+6kMOCL+?=
 =?us-ascii?Q?8KJw4dlnis6PgPUX4g+m/2zMgwY7cfeImCTUhHli4Xzroer6StstUquviHMB?=
 =?us-ascii?Q?ghqnB1J8OQ37Gcgv2RhsiqbPxTNEB+k96hAvgTRHZTWpIK8oaqbemnSbm9zv?=
 =?us-ascii?Q?7E6kJ5VCExHfFXtrJ+57AE+hcaSww8F54N3usj4zpUBrtuL137jSAjLzZ4Po?=
 =?us-ascii?Q?GmPU8oOd2RTK2qfe1OY3ydf/SmFROUCaowe/rF43?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e63b837-3c96-45cc-262f-08db88fce669
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:39:59.8060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0WbJ6hjFPqz9JkPDEgkJtq+Z0pPoQ2oupaF0DF15p5eatu+NmOCruQ/QR1C1X0PufRN7RqADUfhi5NZ13wzJw==
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
Tested-by: SeongJae Park <sj@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h             | 5 +++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 1 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 1 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 6 ++++++
 arch/x86/include/asm/tlbflush.h               | 2 ++
 arch/x86/mm/tlb.c                             | 2 ++
 include/asm-generic/tlb.h                     | 1 -
 7 files changed, 17 insertions(+), 1 deletion(-)

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
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 837e4a5..0a54323 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_TLBFLUSH_H
 
 #include <linux/mm_types.h>
+#include <linux/mmu_notifier.h>
 #include <linux/sched.h>
 
 #include <asm/processor.h>
@@ -282,6 +283,7 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 
 static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 267acf2..93b2f81 100644
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
