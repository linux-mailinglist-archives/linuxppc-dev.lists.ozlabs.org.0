Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECF74ABAE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:16:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vmdfrf2t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy4T30z1yz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 17:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vmdfrf2t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::61e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy4R95dZmz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 17:15:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdT2zNvB8OsQyqR1+TYXHwBi6GBGllkXIuSrOF8tV+xRyAkNkX3xPjCah1txhnblBGvh0nJ4rP4N1TWISogM8Cf/isszjb+toaO/WlBqp7dPeuYM8yR6JRVqtzdVhgsHRpSPifVwULvmm7LDt6kWZBoYa4tS0ve3FkZgU8F9edYFstFqIrThux1tOOpaaZNQljjJ46r2t39YowVRFus9VjnBnwvreP7NxhOmjLbvpEBmN3a2tJ8EhCsAlgsyXIR2SO1j9EmgH1/I2ZqHjR71QEAXZOibCkjoXSvrkAaCHlxp9mnbbc6g7Bv5iVtw2pBCzid0zLjAFxMFcEKOyH3YOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgEGSQwOnp8v3pdN1FhL3pXG/ec1md9gcb2/Z5r+vBk=;
 b=WMCY+4/nGJTagLJZaldbK7Pnp0PUJ+dO6plRACeRT7oGIwmO41naW18ixuqrdCngwpPo6F0ccCnOGD4K2+gV/fmmkOrLKu5DNX1tu4UCn9NSUlWXjXoMVF99esgW6IJEP6hCcg5z3nvx39LAaTJjJdk6i6padXlpcyW2IJen48hq1i40OVduObz4howoB14Oc+50zNycz40N4REKwZsF2mbYuQGPGmiVBxRSHMJF69hGRlA5IhZD34vw1F28cfdny8FInXA2ivshDh6JGmvMo8sVx31Q+s6bG4i/sby5+JEII6ZG4IZXX08RFSrNiIZVfizsb6AbfCp69IE4QgxNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgEGSQwOnp8v3pdN1FhL3pXG/ec1md9gcb2/Z5r+vBk=;
 b=Vmdfrf2tcNhFquK8HTQ9qTAqTRWd4utYe5JDL9GL//79GIMbLfXfpOGz+9gDJEFGtfwXPqxbLy2vzFXxSkgYioz9+soFPtWvx7slcVMIO73agFf3l9ZhrcOzf3QcmAdSEDFgD+vulYLmcXUkOWZjHOSDVgmr+Prs9et2W4GRMCt3WnsGuyY//GVNGevpbWStZvpqVVnJsuNwGW5h6EU055obTAR+0X8zgMZyGOoc6goWwiK+hA9r40r864Z6RG7lIZlD9/9xwmYsuLe1MMFUrDM8nl/uy6h9kZVzI8slahc81Yp1wg6weM4RG/nDniqIAUCCvsVoqJYgS8GJV4lxhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 07:14:42 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6cea:921f:eb00:c1e7%6]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:14:42 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [RFC PATCH v2 1/3] mm_notifiers: Rename invalidate_range notifier
Date: Fri,  7 Jul 2023 17:14:23 +1000
Message-Id: <863a7b3bdba88ff6a72b20a35026e07bdd709b31.1688714027.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
References: <cover.2c09c745ade01a7ef661733d0bbc39d645b6bde0.1688714027.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::13) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a822612-f60a-4800-8587-08db7eb9d599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aPI9CEo5cMT+navft+Gu1JTL1IJKRHihZPS+HJtm6CmJKHcDEEwGub81bRW6cqToxHvdII1whlr3y8GQa+uzcSl8OKt1dvd6mzJZGVh17XPqzqeC1x6VCN4sElWrS0roaZcGsrCqMuErAaw6Uga6YmXkBjkOYABR2ouEAUZSiwLykeCOsTQz6JCvmv6iqrSrEs9dbLtZ10intc3OeCLdtUvR6meVwOV4c7AKmJ2rJJ/s97Zm929D/1/GSBo1SgXvDrNiLfrbLyI15vbnrapZtCtlvIN/S2zY6+OF6dx83AUazskuG2DxD7kWokdvmXqICXIagxhNhwQjBLZ5QqbhCOe4wd4EQBBnntdrzuZWtL9WhzGiewfKClAhGNndMPZAuxfQZiXlUsFxJx5pL5FbRctgO+/xJvGfUPHFvEpxvYrVI/+gBMFzUnkZ2c+chOUDpmcen1nsLnnoBbHrwMy/YpvNlAnfjeP6h6to0ePGRSCyjj2xCoizH9deR/R5/9ZQz/rPGzmrHbSEX7SMxrcZJBHhL3tIflMUWAa6aYJSPSIvmh1XUcvySwdnX5KfJDN1
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(6916009)(38100700002)(66476007)(4326008)(66946007)(66556008)(2616005)(6666004)(186003)(6486002)(36756003)(107886003)(54906003)(86362001)(478600001)(6506007)(26005)(6512007)(8676002)(8936002)(30864003)(5660300002)(7416002)(41300700001)(2906002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mrr1SiygMY2vt/UOIsxRcBFdR90+NVPUAg/j5rr1OowH6UEcbFFXNY3bxTGN?=
 =?us-ascii?Q?/tmguhMGl9/VleAwJbT+jZdOYDcQ2VbjaabfHUcUP3ZXtmMRZMhNBaVxaQOW?=
 =?us-ascii?Q?tP+9VlisOe46pHRKCRnyKFV8EejSMzrbMJXZ8FeHDKQj9rsOeB6499OaelVX?=
 =?us-ascii?Q?OEoiFttAxKQotnKvlgdHfkDisP4Ff/J2uvtIDBwpAHf7qZuqQcQYRiXZ63lI?=
 =?us-ascii?Q?5/bp52iN6fqRRkzQm9qF3pYrs94Os0CdHi5SKIr+2CrGPZATAjFb0Br7S1Cq?=
 =?us-ascii?Q?Tlf6Kwn5xz2Hz8Dqph5N+HUcWzhVVpSCEeWwUMpJ9ameX7jhQ15lJt/VaDOD?=
 =?us-ascii?Q?B0ksmtuKi2j21bxmNLqErtp2CI2jU2J+oPFVc8DTKFHZua3mjFHrjHWd1Z6L?=
 =?us-ascii?Q?eD9tisExGUi0mOCpUXpmbj5z2AALpCsEFuy3CHIupkHqAJ+1J1BZc0QgM8vp?=
 =?us-ascii?Q?E3H2RDMwAhEasJ4IC3vsYwF/AVTZLnbMVQdqZn8y6WrlpsRWoYXTsgAHSZUb?=
 =?us-ascii?Q?WwINBDHfaDh9PqJZ37LQ2XMAt4cd8Y4V24uf3dDycPfctRyCbDLwUkCaC8lP?=
 =?us-ascii?Q?t+cJclu8CNCL3lxlsueNr4RNuGPFpmmadz3iY0iBiQVjte5ubdyKpM535wJE?=
 =?us-ascii?Q?WLfAMuG4nnvjm5FimQPHsJSqID9bAn9tzhI82YliYfIUTeg9sypGW5GrPJu8?=
 =?us-ascii?Q?mGWunIxASxY7QCXg2siMdnoarYKWtlUkKYBxrtuW0avqqQVu5VJ0yfAfyHVg?=
 =?us-ascii?Q?rARU4nDYf30lNr0x9XRBOzJfJhe7ViA99a2AfZBKV7UImob36P59auh6drqY?=
 =?us-ascii?Q?RSCrwE5ILQGxlu7ExVss8ewxaTomX7Y7SsqslRIgthxzmsLOHcesynPTQ2jD?=
 =?us-ascii?Q?J9xjUeyF9zF0EDpTYCONlc7hLglT65tRgGcrLFysgkOq0dvIbCC2j1vyReiO?=
 =?us-ascii?Q?/MtbB5oSXtxbQIXtGO3q0Shr7ikoOOzQXnB3g7mcYYpWd49P9LRQE0Mubrr3?=
 =?us-ascii?Q?nkD+xlgRZwEZclB6qXLFYXFIHVRtcOwsBc16/2v6oMYBNRTuGUCSj0p/sDtM?=
 =?us-ascii?Q?/eiYkOvmSf4QqNkZrrnAOWWqlsMX1qgx32+cXRuFtgID6uMCT5fsW9u8yijp?=
 =?us-ascii?Q?VGf7H7AH6P+r7ywRFzxQkbCmkOk9gqexJpy2WWnwAU83Di99/xL98duaJ1uw?=
 =?us-ascii?Q?zeDqAKFEdj57bBUlIUelovGxf7lTNxQTGS0IeHhOnwrGhC2kt4ZuoCa5YxM4?=
 =?us-ascii?Q?KkhF8hZHhPfQ7dKAIPGt7GeOrjBP5H9XwtwPVuMOeMxyFJ2KfN3qlmB8Si3U?=
 =?us-ascii?Q?Zca0QKsYFzmgMg7589EKeqOBfAH9BQgxgFFU/T1ClrPKHdbooLkko4TMBtNw?=
 =?us-ascii?Q?T7xP2ibJwAG5e4kV7E4DxwaPm9bcTfVCmPhPT6YhlCIqxDX90wQJehwVW4x3?=
 =?us-ascii?Q?1HjwjTBfz49SXdzS7ZyHF5N0n0kS3tuIBxWOLncNnleMqq0bF2HDJ6ac47kV?=
 =?us-ascii?Q?+Kywkl3q+pfbWxBjk5oQimVDmCkMucIGzlmgGoUTeGxriWFjAKn3FtXnQ+m+?=
 =?us-ascii?Q?I6kAEyZsrbLSPe/GWYpQ+afiXyMddoQFZpZHxqbP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a822612-f60a-4800-8587-08db7eb9d599
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:14:42.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er254UfUPsDPYjTKotUeXDg4Y9DK9L1y8WC5zgPwutkI4Cd9LenBmrSmNlVhyybi4LkwGreSYfbatZ2qzYh2rA==
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
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
 arch/x86/mm/tlb.c                               |  1 +-
 drivers/iommu/amd/iommu_v2.c                    | 10 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++--
 drivers/iommu/intel/svm.c                       |  8 +--
 drivers/misc/ocxl/link.c                        |  8 +--
 include/asm-generic/tlb.h                       |  2 +-
 include/linux/mmu_notifier.h                    | 54 +++++++++---------
 mm/huge_memory.c                                |  4 +-
 mm/hugetlb.c                                    | 10 +--
 mm/mmu_notifier.c                               | 52 ++++++++++-------
 mm/rmap.c                                       | 42 +++++++-------
 11 files changed, 110 insertions(+), 94 deletions(-)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 267acf2..eaefc10 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/sched/smt.h>
 #include <linux/task_work.h>
+#include <linux/mmu_notifier.h>
 
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
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
index a5a63b1..aa63cff 100644
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
@@ -237,9 +238,9 @@ static void arm_smmu_mmu_notifier_free(struct mmu_notifier *mn)
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
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index b466172..48c81b9 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -456,7 +456,7 @@ static inline void tlb_flush_mmu_tlbonly(struct mmu_gather *tlb)
 		return;
 
 	tlb_flush(tlb);
-	mmu_notifier_invalidate_range(tlb->mm, tlb->start, tlb->end);
+	mmu_notifier_invalidate_secondary_tlbs(tlb->mm, tlb->start, tlb->end);
 	__tlb_reset_range(tlb);
 }
 
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 64a3e05..a4bc818 100644
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
@@ -397,8 +397,8 @@ extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r,
 				  bool only_end);
-extern void __mmu_notifier_invalidate_range(struct mm_struct *mm,
-				  unsigned long start, unsigned long end);
+extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
+					unsigned long start, unsigned long end);
 extern bool
 mmu_notifier_range_update_to_read_only(const struct mmu_notifier_range *range);
 
@@ -491,11 +491,11 @@ mmu_notifier_invalidate_range_only_end(struct mmu_notifier_range *range)
 		__mmu_notifier_invalidate_range_end(range, true);
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
@@ -589,7 +589,7 @@ static inline void mmu_notifier_range_init_owner(
 	pte_t ___pte;							\
 									\
 	___pte = ptep_clear_flush(__vma, __address, __ptep);		\
-	mmu_notifier_invalidate_range(___mm, ___addr,			\
+	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___addr,		\
 					___addr + PAGE_SIZE);		\
 									\
 	___pte;								\
@@ -602,7 +602,7 @@ static inline void mmu_notifier_range_init_owner(
 	pmd_t ___pmd;							\
 									\
 	___pmd = pmdp_huge_clear_flush(__vma, __haddr, __pmd);		\
-	mmu_notifier_invalidate_range(___mm, ___haddr,			\
+	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___haddr,		\
 				      ___haddr + HPAGE_PMD_SIZE);	\
 									\
 	___pmd;								\
@@ -615,7 +615,7 @@ static inline void mmu_notifier_range_init_owner(
 	pud_t ___pud;							\
 									\
 	___pud = pudp_huge_clear_flush(__vma, __haddr, __pud);		\
-	mmu_notifier_invalidate_range(___mm, ___haddr,			\
+	mmu_notifier_arch_invalidate_secondary_tlbs(___mm, ___haddr,		\
 				      ___haddr + HPAGE_PUD_SIZE);	\
 									\
 	___pud;								\
@@ -716,7 +716,7 @@ mmu_notifier_invalidate_range_only_end(struct mmu_notifier_range *range)
 {
 }
 
-static inline void mmu_notifier_invalidate_range(struct mm_struct *mm,
+static inline void mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
 				  unsigned long start, unsigned long end)
 {
 }
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb36783..a232891 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2124,8 +2124,8 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
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
index bce28cc..ba689e0 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5690,7 +5690,8 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 
 		/* Break COW or unshare */
 		huge_ptep_clear_flush(vma, haddr, ptep);
-		mmu_notifier_invalidate_range(mm, range.start, range.end);
+		mmu_notifier_arch_invalidate_secondary_tlbs(mm, range.start,
+						range.end);
 		page_remove_rmap(&old_folio->page, vma, true);
 		hugepage_add_new_anon_rmap(new_folio, vma, haddr);
 		if (huge_pte_uffd_wp(pte))
@@ -6822,8 +6823,9 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
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
@@ -7462,7 +7464,7 @@ static void hugetlb_unshare_pmds(struct vm_area_struct *vma,
 	i_mmap_unlock_write(vma->vm_file->f_mapping);
 	hugetlb_vma_unlock_write(vma);
 	/*
-	 * No need to call mmu_notifier_invalidate_range(), see
+	 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs(), see
 	 * Documentation/mm/mmu_notifier.rst.
 	 */
 	mmu_notifier_invalidate_range_end(&range);
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 50c0dde..34c5a84 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -207,7 +207,7 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
 	 *    spin_lock
 	 *     seq = ++subscriptions->invalidate_seq
 	 *    spin_unlock
-	 *     op->invalidate_range():
+	 *     op->invalidate_secondary_tlbs():
 	 *       user_lock
 	 *        mmu_interval_set_seq()
 	 *         interval_sub->invalidate_seq = seq
@@ -560,23 +560,23 @@ mn_hlist_invalidate_end(struct mmu_notifier_subscriptions *subscriptions,
 	hlist_for_each_entry_rcu(subscription, &subscriptions->list, hlist,
 				 srcu_read_lock_held(&srcu)) {
 		/*
-		 * Call invalidate_range here too to avoid the need for the
-		 * subsystem of having to register an invalidate_range_end
-		 * call-back when there is invalidate_range already. Usually a
-		 * subsystem registers either invalidate_range_start()/end() or
-		 * invalidate_range(), so this will be no additional overhead
-		 * (besides the pointer check).
+		 * Subsystems should register either invalidate_secondary_tlbs()
+		 * or invalidate_range_start()/end() callbacks.
 		 *
-		 * We skip call to invalidate_range() if we know it is safe ie
-		 * call site use mmu_notifier_invalidate_range_only_end() which
-		 * is safe to do when we know that a call to invalidate_range()
-		 * already happen under page table lock.
+		 * We call invalidate_secondary_tlbs() here so that subsystems
+		 * can use larger range based invalidations. In some cases
+		 * though invalidate_secondary_tlbs() needs to be called while
+		 * holding the page table lock. In that case call sites use
+		 * mmu_notifier_invalidate_range_only_end() and we know it is
+		 * safe to skip secondary TLB invalidation as it will have
+		 * already been done.
 		 */
-		if (!only_end && subscription->ops->invalidate_range)
-			subscription->ops->invalidate_range(subscription,
-							    range->mm,
-							    range->start,
-							    range->end);
+		if (!only_end && subscription->ops->invalidate_secondary_tlbs)
+			subscription->ops->invalidate_secondary_tlbs(
+				subscription,
+				range->mm,
+				range->start,
+				range->end);
 		if (subscription->ops->invalidate_range_end) {
 			if (!mmu_notifier_range_blockable(range))
 				non_block_start();
@@ -604,8 +604,8 @@ void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *range,
 	lock_map_release(&__mmu_notifier_invalidate_range_start_map);
 }
 
-void __mmu_notifier_invalidate_range(struct mm_struct *mm,
-				  unsigned long start, unsigned long end)
+void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
+					unsigned long start, unsigned long end)
 {
 	struct mmu_notifier *subscription;
 	int id;
@@ -614,9 +614,10 @@ void __mmu_notifier_invalidate_range(struct mm_struct *mm,
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
@@ -635,6 +636,15 @@ int __mmu_notifier_register(struct mmu_notifier *subscription,
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
diff --git a/mm/rmap.c b/mm/rmap.c
index 0c0d885..b74fc2c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -991,9 +991,9 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 		}
 
 		/*
-		 * No need to call mmu_notifier_invalidate_range() as we are
-		 * downgrading page table protection not changing it to point
-		 * to a new page.
+		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() as
+		 * we are downgrading page table protection not changing it to
+		 * point to a new page.
 		 *
 		 * See Documentation/mm/mmu_notifier.rst
 		 */
@@ -1554,8 +1554,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_invalidate_range(mm,
-						range.start, range.end);
+					mmu_notifier_arch_invalidate_secondary_tlbs(
+						mm, range.start, range.end);
 					/*
 					 * The ref count of the PMD page was
 					 * dropped which is part of the way map
@@ -1629,7 +1629,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
 			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
+			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
 						      address + PAGE_SIZE);
 		} else if (folio_test_anon(folio)) {
 			swp_entry_t entry = { .val = page_private(subpage) };
@@ -1643,7 +1643,8 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				WARN_ON_ONCE(1);
 				ret = false;
 				/* We have to invalidate as we cleared the pte */
-				mmu_notifier_invalidate_range(mm, address,
+				mmu_notifier_arch_invalidate_secondary_tlbs(mm,
+							address,
 							address + PAGE_SIZE);
 				page_vma_mapped_walk_done(&pvmw);
 				break;
@@ -1676,8 +1677,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				if (ref_count == 1 + map_count &&
 				    !folio_test_dirty(folio)) {
 					/* Invalidate as we cleared the pte */
-					mmu_notifier_invalidate_range(mm,
-						address, address + PAGE_SIZE);
+					mmu_notifier_arch_invalidate_secondary_tlbs(
+						mm, address,
+						address + PAGE_SIZE);
 					dec_mm_counter(mm, MM_ANONPAGES);
 					goto discard;
 				}
@@ -1733,7 +1735,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				swp_pte = pte_swp_mkuffd_wp(swp_pte);
 			set_pte_at(mm, address, pvmw.pte, swp_pte);
 			/* Invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
+			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
 						      address + PAGE_SIZE);
 		} else {
 			/*
@@ -1751,9 +1753,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 discard:
 		/*
-		 * No need to call mmu_notifier_invalidate_range() it has be
-		 * done above for all cases requiring it to happen under page
-		 * table lock before mmu_notifier_invalidate_range_end()
+		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() it
+		 * has be done above for all cases requiring it to happen under
+		 * page table lock before mmu_notifier_invalidate_range_end()
 		 *
 		 * See Documentation/mm/mmu_notifier.rst
 		 */
@@ -1935,8 +1937,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 					hugetlb_vma_unlock_write(vma);
 					flush_tlb_range(vma,
 						range.start, range.end);
-					mmu_notifier_invalidate_range(mm,
-						range.start, range.end);
+					mmu_notifier_arch_invalidate_secondary_tlbs(
+						mm, range.start, range.end);
 
 					/*
 					 * The ref count of the PMD page was
@@ -2042,8 +2044,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			dec_mm_counter(mm, mm_counter(&folio->page));
 			/* We have to invalidate as we cleared the pte */
-			mmu_notifier_invalidate_range(mm, address,
-						      address + PAGE_SIZE);
+			mmu_notifier_arch_invalidate_secondary_tlbs(mm, address,
+							address + PAGE_SIZE);
 		} else {
 			swp_entry_t entry;
 			pte_t swp_pte;
@@ -2108,9 +2110,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		/*
-		 * No need to call mmu_notifier_invalidate_range() it has be
-		 * done above for all cases requiring it to happen under page
-		 * table lock before mmu_notifier_invalidate_range_end()
+		 * No need to call mmu_notifier_arch_invalidate_secondary_tlbs() it
+		 * has be done above for all cases requiring it to happen under
+		 * page table lock before mmu_notifier_invalidate_range_end()
 		 *
 		 * See Documentation/mm/mmu_notifier.rst
 		 */
-- 
git-series 0.9.1
