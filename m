Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99104761A55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:46:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fftYiGKi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9JG23f7jz3cZj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 23:46:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fftYiGKi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::609; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9JBG12yhz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 23:42:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgPrkztuUcH3xo13b6ibESHfLLaEh3iKNb9u0lxo121UfqBsBH3dG0ZEL5S2gHj3LGRdeCd3X0qJ8tDAIS5Pfhb+An8g3ps/KzJqkHFDLiTp5gV7kl5s4WKX+L2iFj8Pkn80m2sQbOqYaK85anYhfWzBN7OpzayfbcadPRQZQrMkXIQswtTK08WyboQk0j9ze1CW5PrP4VDAefYJsRuHQs0QHKW6QU1g18cW1VbacDz+B2SlV3eQy7Wx1aB7ARE9NJckDYBXFHFU59w8ZoI0ndI6TsI7sfRweg1oPS5SyP5E/N5FZu4oGy5FIKKJJ5rbOflOUJdnhIrRAvcAls6jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQLAFWkVOwLzrCoMP+t2btl8fvFP0zf16RJSkZTjrCo=;
 b=B0MUSFQ45sliSEtrqhl6KNfYvyS45/1dUSJNOAr5V7313ySXsnZ4mY9OBSnPXLjJBg6kirkywuBNojjXeXsw8xZV8Bmtw6oD3zcBfaCuCRy8NcSKMJbprZLAGc1RcQdpDGxLs/3SKCOM0fl9dXciKwU30WYleabHV+Y2TEIDGiFA1Jn9w7nxeZJEGJ08NEtihTGPMsxnGm6E6NKHfpkPpFNQ1QK+sFPMCybtMIG0oCsMj775yXAAGMxLj435T3PBrJDDnwYsXYKvJWYIopKIjjSTLPj0uJ8wQBiepM52Ym3Yk2eUCn0dzMF8O5tSePlf6M5tsSEHxL69XYlDR2ZqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQLAFWkVOwLzrCoMP+t2btl8fvFP0zf16RJSkZTjrCo=;
 b=fftYiGKi4InTiP2jsm24wplnipjXgXTrDMfGZ+mB3+ivTfW0FGo8+4epWU3c07tVGa0Ta1YNr003jJN5T8ZrjRAa9oR3QPNaHMDAYpkWQJfGvR3W5SBxVWXh0epk2ADMZeskjwqWxSQ8bYfHxiA/8XABB4EVo7TvsFXST02cudBTyVfJ3rEKXsZYvwNZFGUIAEjOl39vrk89R6WwTeiTVJQ0NgFZsXdq4C1o4TFrIrFqknmets/JCYLG537vhT2i0j1tNzARIPKx3X5J7CD68EKH+5kbFunLGgER94+iqwH2DaW7T2jEyaBcWRBmHyhLMNhj05stRIoy6cXorVmkNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:42:39 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 13:42:39 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v4 3/5] mmu_notifiers: Call invalidate_range() when invalidating TLBs
Date: Tue, 25 Jul 2023 23:42:05 +1000
Message-Id: <0287ae32d91393a582897d6c4db6f7456b1001f2.1690292440.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
References: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:10:3::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8e51fa-b7a4-449c-42c5-08db8d150357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	w/UxqcLg1z5+6sS1LShle/lhNNbLvCpFwaiDobtTrPQng/Qh+a00TLZpowvuQokSHG2/G7xuRbSoVWdOPtL9XH0sA3jsBWAtXPv4RpsGrvDH1XvmpVU1j5LNDUumXBtFsLkAvar2VPNVHypvbr5dYN4PSwFum9VSnCUqkfGAgFHqdC5O7q2xd+8/PB+VXhZB7YBrx60/qKJGsMAslxpofO+Gdp/xw6FY74AQsEgXBH03Es2sPOG0x/ZBV37rOyP3eZ8L8grvLYOGQS58tHLopEagnnK3GLyI+xneZI4/wGwrOUkj7s9w7KGrbRm05CovpoGhJVViHkaqxKSq+q+1k7vf4CHRFiofJ8nutJBSJtz3VAjXdkLr7YLy+rhqq7xhdkskZjTRZziaE0Y6o/k8ok61m0QmFFyhY+QamxF4Vdf77Y5ukSd8rPNZjOG6o2KUZEqJus82v6HSXeipd/+ezc4JD5UQKx+6SQjkeLEZlhqnJyp+3yZq2dFVt/dsQo1kLSo+93oV/8rlyUefVYjizXUc03hNwPC0SpsZu+jQ+YZ5woPxH40ZezGyF1zZee8/vYtHdS3xPnVKjHw+y+052dD0pBQhDjH+S3+qKaLBxjU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(186003)(2616005)(26005)(6506007)(107886003)(316002)(41300700001)(66556008)(36756003)(6486002)(66476007)(7416002)(5660300002)(66946007)(38100700002)(2906002)(4326008)(6916009)(8676002)(8936002)(83380400001)(54906003)(478600001)(86362001)(6666004)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mlUweiPCPMHE/Tcn55/SoYz5GB5ThEupfxhGvIe894QLrbNDbpZsqf1VmLof?=
 =?us-ascii?Q?/qm6Hsq540Bc80d1/TZmq2P2uVCiEYZNcSAiIM/d2SAUooveRVskvgU3oyij?=
 =?us-ascii?Q?+CrBYr6evM0nrQ/ZN6trdmMRJbRH+yN26yKBedlhiy/fBTYW/5KBwKV8PXp0?=
 =?us-ascii?Q?WE5RGBEKK9X+VZfQbT/6E2kSL1CWHVQvjA6xFGJevsrlKbzJisaYULA1Epos?=
 =?us-ascii?Q?B0QG8Xda65wVek8wUmT02Ydu9lsvEUspyaZDbkjF/CzCXwU8TrhI0RwUmNLc?=
 =?us-ascii?Q?Dm/ndwVBzbROjHBlfwFmTDswX9mWiJUbDCI0lbMfCi8zI0YloPLBEKo4c4Zk?=
 =?us-ascii?Q?6WralcLUKHruT4z311Od9gLjoH6bRMHDMx/1dDx2b9NG32ZNUq5kDTYD3D/r?=
 =?us-ascii?Q?XeW6kpQlcRo2PIdRtHxbl9uEITVupkD8I1LAIv29a0jQUR4aT9XrAE+SeaWn?=
 =?us-ascii?Q?PDxEgNKYzlPRhzDlL4qZxYipyOjBl6nMfGnBcqHBrDH0vb3NsRyNwj7YsEs7?=
 =?us-ascii?Q?/9ct+AYCHlZybbrpZ1FLE1chejy5FeR2iSzuBK4WWt5mFobhEnggrW+Dr920?=
 =?us-ascii?Q?JvmBZCGSUQNqUoGazLXSBVX9JnybhEuBcS//mr95xl6kz/RUW6rdljdvnhD0?=
 =?us-ascii?Q?bm9TsN48+PStpFKeuMX/ajAFOZ8cXSCq4orKhExvgjXvMke061w5moh+asHd?=
 =?us-ascii?Q?rP+TGOcfkRuNF3lZJ7k/9DPoVWKW7nrojTuyypDxoz3jAo0I8xVjTXRgZKHn?=
 =?us-ascii?Q?+AFMPypwpHTji7Z0BjTJhFMCWPOHJBoiJoqc8FykziL0A+6dLEZgJEhIBVHj?=
 =?us-ascii?Q?CDFJJSaoiklLNuqhNMjjwOEEM3OJfgHmxGZJ53TSVowS7d+3V8K3KWvI/nE7?=
 =?us-ascii?Q?5xQ2IxHC8e9N7+P0QFCNGdYuoYGF/OCEB3TMkwcS9Rt+dq11r2W7bn5A4gLM?=
 =?us-ascii?Q?EbzEjjrsbLe4TivM2Zz9fjwgWYG56nzNe/22Aj7QLmJND5Mx53BAU2JSbwiY?=
 =?us-ascii?Q?93nXiiGsqcwfqrHvspIv41ncJaMC7ELeLtSx3DP03QyfuBuZQjUww6Ogkqnr?=
 =?us-ascii?Q?lCQXekSI03UWqL8rNYO0+AQdkoU4S1So1kC+npHrg8lqnLLA/uw8c9LfocZC?=
 =?us-ascii?Q?LmoJ2rLNpmItjue0OOFHurf1/iGr3ebCPKrn1TYlKCAAKFOJ9a/Jh7Dg+8FY?=
 =?us-ascii?Q?njIkXRXyMmrOyYvgFvjILKlX5kTYYaVlV5qY32+vMIsTnKswXX2YlQWUiBo6?=
 =?us-ascii?Q?OVHN86qoNjPcXlZlZByrVgoADFj+Pb8UcwOZ+P0MkID8kwp8nOxPoB3jDdDm?=
 =?us-ascii?Q?LEdmBJBYw/yO2r+03KyXKMfpc9srq8/wEUL3KiVTO/QHqsorcWDvV+2dqIye?=
 =?us-ascii?Q?2QD4VLKxnsOLUWiPOOAMZCdm3n0y3tpP72v0h4tVlLd43ieXJltgYJVmDxaQ?=
 =?us-ascii?Q?7fHqBwBskd0tkuCNyO+tGMHBOtLwVZOmdmjdfYFZe+4WvERPboWC3R+nWx72?=
 =?us-ascii?Q?GVIhIA68sGtrIZDN9EUg0dBg6xWqXttjELLlWRkhVDACsanFIGwetwIj34sU?=
 =?us-ascii?Q?GIF53IOz12Xpkc4GAvSIHaO1SYn+aK2uaL82tWlm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8e51fa-b7a4-449c-42c5-08db8d150357
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:42:39.3985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBfOSUe0agO0ynf7xPxuJfybDgT+YlKy8KhZ6jXnsU1JpzIX7BshLon65XJ9ltcGAlP7FlEijv8CtH1oBUsXNg==
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org, robin.murphy@arm.com, npiggin@gmail.com, chaitanya.kumar.borah@intel.com, linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com, SeongJae Park <sj@kernel.org>, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
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
architecture specific ptep_set_access_flags() which calls
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
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/arm64/include/asm/tlbflush.h             | 5 +++++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 1 +
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  | 1 +
 arch/powerpc/mm/book3s64/radix_tlb.c          | 4 ++++
 arch/x86/include/asm/tlbflush.h               | 2 ++
 arch/x86/mm/tlb.c                             | 2 ++
 include/asm-generic/tlb.h                     | 1 -
 7 files changed, 15 insertions(+), 1 deletion(-)

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
index 0bd4866..4d44902 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -987,6 +987,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 EXPORT_SYMBOL(radix__flush_tlb_mm);
 
@@ -1020,6 +1021,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, 0, -1UL);
 }
 
 void radix__flush_all_mm(struct mm_struct *mm)
@@ -1228,6 +1230,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
+	mmu_notifier_invalidate_range(mm, start, end);
 }
 
 void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -1392,6 +1395,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
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
