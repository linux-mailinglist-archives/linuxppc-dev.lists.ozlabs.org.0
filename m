Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10775760B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 10:00:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RdSTji4g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rwT2JmTz30f4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 18:00:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RdSTji4g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::628; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rrd2bD9z30Cg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:57:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr3Db1Q1p86dTkyi183SVLGv+4fFxb/Rmr44HlOcUK7xvqt5YCMV4YMyHJC0BHYKc3hx2PPCfidTj2rDb6y8k2i5zTB9d3c5RAbf1Be7X48Is98kHcrqd2TCIqmewg4JC7d+Hf7T4kZ5VhcYspoKTsavB/syuFbTl6FEHlN0DfYb/4Uogko5f0DWWWiK4ne00Z95/0k9t2RdJAaebBrquFE3T8RhCRI9K7dkrbp8xNKe3P1LaH7OkyISp+ONlBgbWZDGx1QsNNavbQ51iZULdp1AfXXA0Az8zyqak4WNfP2eyHkFCUCx74nDjyRB5K1pBEnjyoKSGbwxbYzStHscgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/1ZlJ6hZJaDce6b/fep0UVd3G4r1VZkyBk0pDLwBXk=;
 b=aqBnfrlvs8g6RMbX5cGrapxq0oZIhp/5u7XQZ0lZCU0G1kyI2ni95uLj3H/3L4qrFoHseeP14xvrXCC29z3/ppork5gtXbIJnY8DZkrKWSAPKzEEYoWqsGfCxUsZTuNo03MDGUdvQGjct25n5uDZK6UeuKqj8jlAWkeLkPBS+hx4F8cUOw7/EC7lkWGE2CmJoNlS3QBeHd/zECGUxYtT5GwUYiDIF6V53zxvq+j8nICXGHNknZCXSIqlghphi0k4WgERONSX5fQ6ISUqUreInK/olAE6CObSa2rOI8+zDyqe+pqQA8V0uqc0xO75bhB+PBw8rKHzWejpdemnZfH+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/1ZlJ6hZJaDce6b/fep0UVd3G4r1VZkyBk0pDLwBXk=;
 b=RdSTji4gs12tJW++2iqykAh3y+LCjIMoMYtA1XKQ3ItbGQduuJ4pzafCqqoS4Bj08Qd4qQepMMkNh7HddA0VwJ/zi0/ll08CgT3rOJc0J9W0guak0lp4SgVbx86jhi4H6VMnw6Oh7aVN0gPdUGdXR37JRCVaTn2Yx3prILOqpHxQaEfQNXnMMQ/9whJsr3GyhOZiEtNr88eIxyVH3XOQ681jOjS9598d3P43Wx6JsWkiTwdCETeVxfmit71jmmHOor+Xw2gEMKD9O1r6Dfl8sSPWzhg2yw9GChVmowIO2RO7q2f+ccs3kv6HjfisF354Fh84KdnLjO1KvJXOMyRHvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 18 Jul
 2023 07:56:58 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 07:56:58 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH 3/4] mmu_notifiers: Call arch_invalidate_secondary_tlbs() when invalidating TLBs
Date: Tue, 18 Jul 2023 17:56:17 +1000
Message-Id: <791a6c1c4a79de6f99bffc594b53a39a6234e87f.1689666760.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
References: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0082.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ac55c0-0b87-41be-7dc8-08db87649017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d1R9HuDA+yMQ5Wua+eTSXXiX8nQzHqTrYo6f/pwpzYfA3BI22tEBKnkKDDHkAH+yGyBqZ9o27F19qDhg0W68X8ypetqlz+aE6u566GKGmvN4qvVnqAwUI9q6sMkSaBET+/dwzuoTDLrPXH3YIi2MJSQSJEnNMTKrP1HZw40Ir21u4Ax+MzQmfo7z4sxCPbxfk+h6DYN2SvHaNmhybqvkz7gdyoq6ciCvTW62yORcBizgltMZSR4ekn9IU4ENmGaEcbxyBy4pvjXcxinJvV8RbGWShJjUcyL1ySRvp7n6YP6w/SykOCAruvjNGVxLH2jBUKEzhG7WY/1E9rCQBHMniojF9q9gbsm+PrBZQ6L9c6g81guhpW7JuG9a6QU51OFe2XxNL5wX/coCvmq9sL/slerNmT8z2ooozkh0O7hwLQR+YAGNAxB8BS9uHaZ26fBg8blJHPwqGrEdVetEzfcjnNKbsQjRcfzndleArLMQDljVrqjKlZxvI9nRVDwCdQEv3vprFblG4f/SrQFRuwwQY/XvdcrEQw0DFbY25bry0hNR5UB1yKMUuBjD8wtZFetANuikqzsb2iuW37xeushnuOlR9ME2WxgWc3JQy9eOmn0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(36756003)(66946007)(478600001)(5660300002)(26005)(41300700001)(107886003)(8676002)(186003)(6506007)(6512007)(8936002)(7416002)(2906002)(66556008)(2616005)(6916009)(83380400001)(6666004)(316002)(4326008)(6486002)(66476007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mGy4p9tjl0pFCXp3m+7JZ4PP7jfYckvqyOl/4+CKlw8tRr1xYSBznwgsstqD?=
 =?us-ascii?Q?wNcgtb3+AJJ39boMSMNQpa7S5tmHm3J7l3DXlw55DhbWDCSNyT26yqNdlPpg?=
 =?us-ascii?Q?ZG0mxdKHeRVgXnVd5di8hK4PQlm7uzgFrfj4f59B+HnDQnieCB0lTG6EuQrt?=
 =?us-ascii?Q?c/WdiSq8NEnm7x42GCABie/3DJ/rv3txMUSvoXK+4XYROxazw1k2WxUA6p4e?=
 =?us-ascii?Q?5O98wliS4QQfWncFhEz0VncpXlf/jwY/7FBIo7YNa63ad+DCBqZ3zdRR2bT9?=
 =?us-ascii?Q?EaepHGOegFO7wVI0pbOsU6cygtskrOlnIF6xtu/OH0mqWVAmGBYC51gUqY5S?=
 =?us-ascii?Q?5Ay211mhlG5fgdBzGVqdtnoma3I1LWX/g1VvuTBjFTL8I7z3i0BWynJcUWFe?=
 =?us-ascii?Q?su0XZ5sd3ydp38Jche7WAi6JvyAmZEqKV0tJMZYb+SRr+NECkDWkfD0qJgK/?=
 =?us-ascii?Q?asITLafx6QraJu4fHGnxF6x4NbQEdbBvYQ1hgchi55wCveJ3PDyCQtMnEggz?=
 =?us-ascii?Q?Ph6vTO5SUPSqipNEZFV8Qr3AlXSDBQ117IcLp1AfbpytsZpduUqac2zQOuPJ?=
 =?us-ascii?Q?gZUHrSqv8B+99DTxNahKdAQ5BSOD65tKKkFla0yBzxp7IO+coScBnq2baFT9?=
 =?us-ascii?Q?isHO4k/3IPu+4h7XCgm0WnYPFarbeUJJIKWM09LmyUxA/avKYBqtF+0aqsT6?=
 =?us-ascii?Q?f8wC1+IKhgX79BMXz8hYQUWvlYzJMhWi5cApCOZGSgHoitB+HuxXkvsdeRpr?=
 =?us-ascii?Q?G+2S9toxgHAmZrfN2Su3ILYjy2Vl61n6BBZGgLN/ifEvmjuSewJbHKkFjpY8?=
 =?us-ascii?Q?ApZC7IN1IT0l2Wty2Hkf4BAcd2vkIq49+A7iRTDV7y/gqhj8tWWBjc7TNhyi?=
 =?us-ascii?Q?N2Ut1jTJc5oF5yH2g49nzpZhtzoGVg+qra6cDZKhTrIdL3TajI81rMQM5EK3?=
 =?us-ascii?Q?txeHUWuCv/K3xkhQ3pmlnH47t+7EVjDF0wWxKlJE/RLFsgvFsqOwfnAQw59S?=
 =?us-ascii?Q?wRrFNOlLDbMnNcTF6J/xTVsz4p3DCC7ydvfL/s6qxOeyWZsrTKsH+lxMw4+g?=
 =?us-ascii?Q?fuSpOe6z0qeMe8nPPDOe82qCgMKUVJD7N20eHe+2VlNspL2ISfw+0USqNvWk?=
 =?us-ascii?Q?ru0WnD90JYOmgzup5mrcarA6oiWfSKmsuZ5Rr1i5huuK7IBrYrmp8/m2jBX0?=
 =?us-ascii?Q?btOJ84PFXSne8r/7kQS+X4MwaBqQWjd/hTgE/Yao47JdGJ2pQc7CisECVTFU?=
 =?us-ascii?Q?G2msBSsElIHAyMGdPY0HMHA1z+iDqCaiELhn0xwfcg9FoaNdGjgFPfC9uN8R?=
 =?us-ascii?Q?0l12WK551mNLFRMtK7nFilbfczRcMusmwAlAdazRr4BbWzZTf5AbfEOTMnrJ?=
 =?us-ascii?Q?mJ/zVZZ4wfAmXscOeqIDBn5PgDONDEjooEzApgHAfgBjD0TNSg+h13HrxEKk?=
 =?us-ascii?Q?tP++saIVppzDuu34YztUT+HYiA0xnxB05XlWMSKarhShy1xxLxCoLczR6RwG?=
 =?us-ascii?Q?u/KGziF6XfXNKjh97d33BQ7GMAxCa8GdlGqnqfugzlzgkMSJhgS4TY5QVfVz?=
 =?us-ascii?Q?mkTHr+yLU9o4TshrTxc+jOpA+lCT6f+sWKeRkL7M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ac55c0-0b87-41be-7dc8-08db87649017
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 07:56:58.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5oQkw+iskrQNiL2SgbsA1/hfrC74KIshAqfJ0Uf3hs3nzpb3cpHxpQ9kdS64USkXUoOF9lJUv7Uyn4nmG7nlA==
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

The arch_invalidate_secondary_tlbs() is an architecture specific mmu
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
 arch/x86/mm/tlb.c                             | 2 ++
 include/asm-generic/tlb.h                     | 1 -
 6 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 412a3b9..386f0f7 100644
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
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
@@ -263,6 +265,8 @@ static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
 	addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
 	__tlbi(vale1is, addr);
 	__tlbi_user(vale1is, addr);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, uaddr & PAGE_MASK,
+						(uaddr & PAGE_MASK) + PAGE_SIZE);
 }
 
 static inline void flush_tlb_page(struct vm_area_struct *vma,
@@ -358,6 +362,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 		scale++;
 	}
 	dsb(ish);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
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
index 5e31955..17075c7 100644
--- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
@@ -39,6 +39,7 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
 		radix__flush_tlb_pwc_range_psize(vma->vm_mm, start, end, psize);
 	else
 		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
 }
 
 void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 0bd4866..64c11a4 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -752,6 +752,8 @@ void radix__local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmadd
 		return radix__local_flush_hugetlb_page(vma, vmaddr);
 #endif
 	radix__local_flush_tlb_page_psize(vma->vm_mm, vmaddr, mmu_virtual_psize);
+	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, vmaddr,
+						vmaddr + mmu_virtual_psize);
 }
 EXPORT_SYMBOL(radix__local_flush_tlb_page);
 
@@ -987,6 +989,7 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 	preempt_enable();
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 EXPORT_SYMBOL(radix__flush_tlb_mm);
 
@@ -1020,6 +1023,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
 	}
 	preempt_enable();
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
 void radix__flush_all_mm(struct mm_struct *mm)
@@ -1228,6 +1232,7 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
@@ -1392,6 +1397,7 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	}
 out:
 	preempt_enable();
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index eaefc10..0b990fb 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1037,6 +1037,7 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 
 	put_flush_tlb_info();
 	put_cpu();
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 
@@ -1264,6 +1265,7 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 
 	put_flush_tlb_info();
 	put_cpu();
+	mmu_notifier_arch_invalidate_secondary_tlbs(current->mm, 0, -1UL);
 }
 
 /*
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 48c81b9..bc32a22 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -456,7 +456,6 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 		return;
 
 	tlb_flush(tlb);
-	mmu_notifier_invalidate_secondary_tlbs(tlb->mm, tlb->start, tlb->end);
 	__tlb_reset_range(tlb);
 }
 
-- 
git-series 0.9.1
