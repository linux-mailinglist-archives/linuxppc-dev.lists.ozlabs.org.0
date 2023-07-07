Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AE474ABB2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:17:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d1s/gYJS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy4V10kPgz3cKK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 17:17:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=d1s/gYJS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::61e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy4RB34zhz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 17:15:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjVJfC3vLnaLuuL6R7s3+n1WfwUfQhaMYUvSGQn2Kvm6N6lDfLKYAgauDDlNuxN+mVJTbF6sdLE3SpXkI1Jm0nZrQQnigY+xK8RV6sZAlkNQSugFFWlcf4lbn28+EJDmHphyzG89plQt92mZuSL+fViqoAA53fn4q3Tcm1U91/ZsGAQNMCDbvx3+HBcK0a72eLbVq8+4supQeUYVbNr4Jpy+T6b591c8n/ly14Y68bQlXlY9ETGY/ZJ2zStk1bLIO1eSvHBww7C9VoXkDqEdUTTVt4Mk04Pm2X7RcxsBKZTgrAg3mhZ6kf9Q4UIyOtt4nwKCX55Hd/9LHkchCmA+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ie/6dGZIaxWVb38tF3O7WHptuZ4OzJ/YX3NdirM7l9E=;
 b=dmk+qekaXsaa6+qht/4nC94uTE/0sYeouX8fZPZ7VdK4zYVnLp4Q59UboBu/cbbzzD+ZX0TqDRq/fDlGyyBwrD9Eu+jly3ZyBhWRfcXDSepvgfKG5mqpzj9cQWJyGLs7zWV9nVhLj3/LM9hYCLCP8ydvXZ7FGQ0ky5svAmVryMycTFgXY5qSqZQbqScS3SOtpe70Jc3qOCaZcEgDrlhX9ZDF6t2V8gzaM+qc+z/a0ZCUENtyE0DK0AHuo45tGyAGa3CqK4YfNU2eKRfVyowG+u9C1xod8sUfV1sCLbzET02/9eKeQSCeUKrVyy+Ykueb1ELN6zVNIpdbOSwLOHfYmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ie/6dGZIaxWVb38tF3O7WHptuZ4OzJ/YX3NdirM7l9E=;
 b=d1s/gYJS+Ou0HEElwhXKMmoIA0n1QI2tpwYLI5/kJmOv3mzY2JakqIqdcmS8OBIjQ31jUJa9O4ZSb3gJ4w8aO17zhc+AinVzoi/CfNL8J3j5VM/vOOlauveHg6fJFMFErsY1cNarolP1zoNw7Kvx+vS4A1AoYxm+G4530F5m7q1DU/RwTae+cQNPGl6qsSq6JEIip9dOOgHN5nyFTXHpPdAea2Z9wXPyQkKhhn5U9taDdXN2QkjYeeXvYitxd+o7wyOCBGSjEQAG1Bp5O9tfIoFOtthca9KwINemav3Qvm/T8nKij1VZGbck9D66OxyXy+tOqUhmkEaxRV5jFArdUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 07:14:49 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7%6]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:14:49 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [RFC PATCH v2 2/3] mmu_notifiers: Call arch_invalidate_secondary_tlbs() when invalidating TLBs
Date: Fri,  7 Jul 2023 17:14:24 +1000
Message-Id: <6a230ed312333f7937ecbf6bfe7c19b6e9e96792.1688714027.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
References: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY2PR01CA0045.ausprd01.prod.outlook.com
 (2603:10c6:1:15::33) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5236dc85-ea6c-40a7-6750-08db7eb9d9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vf0SBT6q4TOTrwR+/UxF6zMHA5rw/HKY9wrxRC9WhMdFDsbk34Bub9CTwgcGdHyC/1lXiHX0gXSZCXEnyLZtEmmAWNTrhdrZJYAk++vZv+nPzv4TRGl3OksXU5cepvMjPm/om8gt03RZVCdJ2X5E7oT5u7smoN1SgmE+pc0SVjO7N7itRjlqHhH2a4V6aBlVOu2JUBGXj8JS3xdPDtaRAUkbqDaj7qCYkgb/8iqeLfucYd/opjlSBltm8Zx18mHgwuzk0MB2vMxJF9y9WLSQu4+v8oVuPdabSORuivRS0GSb9/M5cC7rv9JR/7PbJJ+NapxYLHdFtM2DmCsIHcHYHbzWdgoxlexCdmuKtdprfdolLe/8FxnhT/yCZxYluAennILLwKtKX399SsszO/8rfZQ6DwmQsR0Hv+Pqk0wa8y2gJolzNb1VUpz0GqpsOUsWtPZpAZRMSuotHdnzeAn17ZAnnm3IqCCxU3PqdR00UPTNilu4mHJSouMTksqYr3sdZEqS3p1BZSgbNWZ7iZy25wkh6dSodS4yghLUPOF1eZ5H3/s8cIYcu9npcQg8iScKU+Df72NH037v3fm9CBKjBPTo1WVqKiRaUhH9q9xsMXo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(6916009)(38100700002)(66476007)(4326008)(66946007)(66556008)(2616005)(6666004)(186003)(6486002)(36756003)(107886003)(86362001)(478600001)(6506007)(26005)(6512007)(8676002)(8936002)(5660300002)(7416002)(41300700001)(2906002)(316002)(83380400001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tf3CVIlA1nOARJ7gZIaJEFfcJonxLGQNatSVgkqyZqIPMuRMIY6WMv9XOry5?=
 =?us-ascii?Q?QE1i+s3v5I5QoSt4sZ6Vqr4mACeWqsTtDStvpX+H38AwVc/2XE+NNcGy4XRt?=
 =?us-ascii?Q?jPhR1e3bFQ6AofXoSeHcdo9c5mZYcSOxA5NU0RQw5cSU/R7DqKEH/NEEcsGp?=
 =?us-ascii?Q?3U+A61WAXBEsMt5wGbsCfJXH1aDoWAjJYbBOc2NAfyj3cnGbEp4wuyweRA10?=
 =?us-ascii?Q?yaE49/Re/ZNE5Fl4edK+DyRDoo71/fv56ktrN/zmbpMMJvoSkWgjPLMIckov?=
 =?us-ascii?Q?hTzc8/hNIPkysr4oHuQGugKnt98w7uKGoFUqOMVIZY/CMMyu9T73XVjp0/m/?=
 =?us-ascii?Q?sOc+UsYGzmrwMG3gdKg2f/cnisZJQ9OW9h3DIpg05t+qZElGNWWbuGPDWOV/?=
 =?us-ascii?Q?m59/BRHEvO1m796zJRiLVeLfVVXkIvSc3z3e4aI9O6dmsCrZsKpDPfVyOYXC?=
 =?us-ascii?Q?fQvONWjO9KkoFSdFbMNYBv627L2YG9ODJ4NWcud00KUV7Ao9rOXLS2ELROVN?=
 =?us-ascii?Q?SOD86kuWwCohYjWlzCQ9cSMi69aash8mU2Z1ilaAlmsdlthoA3wif+1K87AQ?=
 =?us-ascii?Q?XA4B00FxqiFTjyTtyTmaFW/fWNs6lHu6V+k7IAveOZnhE60jCJ6/8TFdsys7?=
 =?us-ascii?Q?kCJrvXCq0crlS2nwSecH2U7IFysWFrCOC+tPZr9IeWHjAn9UojCdDYxGlFL7?=
 =?us-ascii?Q?ApSr0pS/7q0aWx2k9Gd9QfB5A6OrJW0+QPYXfro4muqlsTx1TGbx+FaMPWtW?=
 =?us-ascii?Q?+xubI+g5eNHuUXrdz/Bojs8LivI/2+UoQYiqzuY5a2svGJ5/T8G71mYjGxXr?=
 =?us-ascii?Q?+aYIeQ3XncA1P0bfNzi5ecYgyZ3cTetw0SZtrjACGPzJMj4ai8VPBVY9AjgN?=
 =?us-ascii?Q?EXat9ByavtK+N1/jEg3a82v0zVlBLjvKdI+EaZVZ3D68PDh2wWcWpuUi0scI?=
 =?us-ascii?Q?3JHy+SjwLNR/vGdKsVvPest9p/1Mo0LdEavVvJgmQS+qk2uh9zngEV2jUnsj?=
 =?us-ascii?Q?J/AkL2tkoQUhragLQNPbGlX1WHtCrWmpCU96OmlOvD3h5vwHdfa5GrcXiov4?=
 =?us-ascii?Q?zkXxLzsa2lH42MwBgzhszNNE+dnRyxCKC9jyTvBhsYDphmKPEqanfHxjbPBY?=
 =?us-ascii?Q?1TKgodtlX/V1Cpq8CWj3f/eB0HZXRDDtmSAW/5RmEWjVGgV80pVAMhHMlPm1?=
 =?us-ascii?Q?F8pv4J5NHENPVH0DeZe9Vcw5HRcppZ0nyH2nJYCvT4RfE4IbaLtPYlFQBB1d?=
 =?us-ascii?Q?pqBIYMaGkl5DAOWreSqZaIZNW8ze3fPmtqsz6T17PvSQkgpDR3XyXlFpVRzP?=
 =?us-ascii?Q?7SJBlyPBSARjFUr4F2amSmtnJTBKgblVCEYGgDiqone8ZxtM0eVfDI5M+B9y?=
 =?us-ascii?Q?CTZ4586m9Vv44hJLA5gxUr7VP9XPgZm6Or7rbLRINQi6vORnYCv+cAm8g9bl?=
 =?us-ascii?Q?t6c2XEuWXC5X74rP4NFTjI0Di9Wyf3vru87uPb1Kxp+2bJH8EG9yqB9hygWa?=
 =?us-ascii?Q?+r93qVFSxzxS0trKZiXwSundX+26MlcdY4lBRtvaS0OfUmns8KCsAE0PZ6wG?=
 =?us-ascii?Q?UfmcFunOtq26MHggXLppTzBddUJvfFPq9nLh5M4R?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5236dc85-ea6c-40a7-6750-08db7eb9d9be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:14:49.3254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwYKiiEoDwVhh7ccVOBtfqwwU05oPpe/LTokLMr+LJbziaJt2Xn4pS/89IT137gQTzV9KaHE6fH56AcGYwNc/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The arch_invalidate_secondary_tlbs() is a architecture specific mmu
notifier use to keep the TLB of secondary MMUs such as an IOMMU in
sync with the CPU page tables. Currently it is called from separate
code paths to the main CPU TLB invalidations. This can lead to a
secondary TLB not getting invalidated when required and makes it hard
to reason about when exactly the secondary TLB is invalidated.

To fix this move the notifier call to the architecture specific TLB
maintenance functions for architectures that have secondary MMUs
requiring explicit software invalidations.

This fixes a SMMU bug on ARM64. On ARM64 PTE permission upgrades
require a TLB invalidation. This is invalidation is done by the
architecutre specific ptep_set_access_flags() which calls
flush_tlb_page() if required. However this doesn't call the notifier
resulting in infinite faults being generated by devices using the SMMU
if it has previously cached a read-only PTE in it's TLB.

Moving the invalidations into the TLB invalidation functions ensures
all invalidations happen as required. For now the notifier is not
called from flush_tlb_all() as it is only used to invalidate kernel
mappings and the notifier callback requires a non-NULL
mm_struct. Therefore these invalidations are already not happening and
it is assumed they are not required because IOMMUs are only attached
to userspace memory maps.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>

---

As this is an RFC I haven't yet fixed the last assumption for
flush_tlb_all() because it's a bit more involved. If this solution to
the ARM bug is acceptable I can investigate fixing it if required,
please comment.

Evidentally I have also missed some call sites that require an
invalidation call as some existing testing that relies on correct
notifier behaviour fails with this change applied.

Obviously I will clean that up when posting the non-RFC version if we
go with this approach of moving the notifier call sites.
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
