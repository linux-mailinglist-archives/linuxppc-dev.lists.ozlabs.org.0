Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B267903B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1GDM2bZSz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:46:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rihIAfNv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.93.64; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rihIAfNv;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1GCM690hz3c61
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 16:45:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqLqCL4Xrebo0k34TfOtge83s+5RHqcyYC9a7m5kIxlVbXmN8lTtx19cruAMncqvS1Lpy3FqGVl++pBWrmWApNh3GEcus4Oj1+2e2IguM06iTh/a6pZ9b6lJHQAfSRc6wZ1LDr3uCd7TGxiZFWeIBBjjXs+Lj/2OU4m+0ZzfAZecerzNMkjg5liPzAO+fp9/e0DsJvpDz5ycqMOSoyn6cRrLA0TKlJ8DvKvmnulmX0Uaagg3mFYc8qp/2wssf9M2r4r5J5/3O7MuONUiFCvP7p9zXeJZhUiw12STGsgMHqmAe5CHwI1JD6r617/tjIQli55Tw/zqJOmiKZCnGCrAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+GpPc9JMDnZkAHSZ8sR9hzGtxuRq+aAmVdCeEX8IvI=;
 b=QtQLv6/70SYVzJSSwOQ6LjW+RlJrp/Vy0PZUq11hFo+zE6mVgUXxSpSM4qVcvoRHQCjb0Ym3NjbwpUnKlKKDBoaSe0i86nG0f8ZtfUyZlSc47F6u8q0o9KTnIOBfZpBosUr4eDSpti9nv8VYgFeMIW3mLfotO+VdFvq0++SG+JQJ47at+ZsjROZkYSjp+wiP1H3KpHlBmr45E80pDceMsYSbZtKwqLjbJ1esytXIGkswb5Sy5OwKurIvTF8ae3Z3G1FboDNOL4/TGnipsJabyGXfzI4uynPMkNIls4wjONZN88iVIFwJSs8cn3h/i3FHhuM3yZh5TTvtWwssfOzp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+GpPc9JMDnZkAHSZ8sR9hzGtxuRq+aAmVdCeEX8IvI=;
 b=rihIAfNvyXZqnt+0xpvBWi1FoOEFMDZBokr7LRw/2EeqNaDoznZEaZCIk7alKXs6YLIP/L+OJYqcgHI8LXxHtaUBRQ0X/ChlubjWtH0kgXjiGhMH43KGqLWJLDR7VZAHUaeybPg7hGCMNHM/2oTIihl0KGyhiS0Wo45iP1erH7UQSnbWc+qLdm45iO7QGDKmR+bSBccItXleOP7m4XQO0WeAS8Zz42iQwf2l52k5CTbPIb1JvA4bg80r0DzsFfyx26NILghbAJ/Wme7C9+ki5b47FvjcR0BjH7bY79f3PG3j2m2kII4lrUoBxMJbxh/51rkr6yyPgTh7hrc4bmlLfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB7793.namprd12.prod.outlook.com (2603:10b6:510:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:44:59 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::465a:6564:6198:2f4e]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::465a:6564:6198:2f4e%4]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:44:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH 08/19] vfio/spapr_tce: Convert accounting to pinned_vm
Date: Tue, 24 Jan 2023 16:42:37 +1100
Message-Id: <876047347220d490313293a41e261999d1619030.1674538665.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
References: <cover.f52b9eb2792bccb8a9ecd6bc95055705cfe2ae03.1674538665.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0107.ausprd01.prod.outlook.com
 (2603:10c6:10:111::22) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 9128fe6a-a8d4-4058-34c5-08dafdce2193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/3+XB99T69Q3lAMRsGO7c+nCkNrThSNDPOchsfank+XgPKEeX2pod1CGpu1nBsYA2/oY+aVhnGTjghijvddHzC6eRWgc5L9mO3Bq2cydfR239wFEHNrIH4mID5rG6skIVsQDVmlpcPIUnD7HA7v0hohWTBXLis9nQFDcgbncGmmVziuuB/Uy3nWLSFN3EJ83koHij3IeMOuT8731WZSomDPa2Yo9CuBk+fH12FoKvpx1wcv1FPLmNWIQw/FLR9D2XlS5EFh0jMpSKiVpcmBKBYWJuHub+xDb4oyF/p5YlfyZDRYnohIHrHd0+pokADQ7535OBM3eZpwGx91ex5k/gyBwdYDECbJGV1KQ8E/TUPcsK5nYkg7cjKkmuJYRxJbf6eqA7r+GCapy+X2AkHheVMQZJ5qQDJ5Hq8QKIttbcEhLSEQ6hXFcUJK2AFW/0vobjLkm20SXQJe1pIXH0q3dbMFOCoAuiIVyTUGVDACoyBuWyiTUgc0tZ6ibgt0ZSxFUCEj/AdTLFyGbQbeSDe1ha4ifuFGtRAZuHpPS1tJK7XYqqhCFT7LP9idsm9xp8tHT/4fa5XICROIdmPcCH8mLbQbgvcyuTubh48VRqDuyCFjMcSiX5CUAQrAD+pnhfBRKtl8VBDIMFYAmo2JjGMZVOA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(36756003)(316002)(4326008)(66556008)(66476007)(8676002)(86362001)(66946007)(186003)(54906003)(26005)(6512007)(6506007)(6666004)(83380400001)(6486002)(478600001)(2616005)(7416002)(5660300002)(8936002)(41300700001)(2906002)(15650500001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4+8GMcisTFhM8s8uMV4vH7eZVLAk7S8prHWyO4EaB2XxrDYQ0ffHEaKTFgOw?=
 =?us-ascii?Q?3Jp66KTkCFl1kaAkYl3/GvekfqjNX27Pouf0/59oxHkiBSNxH05LSpZuFLXS?=
 =?us-ascii?Q?6u6DvUMje9VboikGMTC1KfbSxxCJBO+d0Pv9uvd3GfihYL4j0Ah9R5c6n6Kh?=
 =?us-ascii?Q?k7JNSR7jvdnkW5klT06wyZ1WVXnLkq2wjnSLxIVWWzaoItCYogQ8mBIis1Fx?=
 =?us-ascii?Q?2mXW6VhN4kZXHxVYhRxV8kjZ+Jh+roJF9wNPeJGvBsiPbAU9vzACDmkS6vMX?=
 =?us-ascii?Q?BML77eScJD45KUYdedyIfyIhGrXZ+fu2rLmIeND1AwrHC3koo+z1UHwsVM4m?=
 =?us-ascii?Q?EFen8Em5aKAh4kEkhHgIcOnTnF/LQ4Ex/dEoI4BDG9Q2PdfrEfOQ7FRku9CZ?=
 =?us-ascii?Q?xAYndrK2tVZZgjrKIEzIsucESrhD8uKdz73L/uQdPsOtCstY87zIBdaPgRZd?=
 =?us-ascii?Q?HrisDGHa4aigiNTpsvZJKex1Pn7iDOl/gPfx4S+ZvQasTYKOriWZ3Mi/Y5qi?=
 =?us-ascii?Q?ZUQraMddS4E1lmIpQZrfriHk4mLef3FOZ1nCsXUrZlsOSXFbzz1kyDN3bFLG?=
 =?us-ascii?Q?2pZzOE2Lb6eRycyjr4zcBxDgWSE5j/AdgS88XzNbpetEdt0AVRYeVKvDDgeN?=
 =?us-ascii?Q?oPs1uaPt78/1g25jcxXvvWtmLODHpnRIjNlbiBYVXLdYbriO5fZ9thbChOdk?=
 =?us-ascii?Q?MdS2xeZQ3cehFHqnHXeJmcZOhtS1D6RSAyx6vGQMiH8pMZeWSN57ODAU1iLc?=
 =?us-ascii?Q?Js6C/UEtxKgAKrOxTkJ+JtNMeF1+WlJJbAsoA9IqYjOLQNFZgMObMjnR46Xu?=
 =?us-ascii?Q?ibqc8i3oGkR22hAuy7gco/bAO0jQfxvh10lUXBlR9Ll270KeD+IZcADIMZz2?=
 =?us-ascii?Q?ocHLGSjSn6uy+NUeQWCmxIz8LK//3NgAr/ZS8FqvDsYIc+QI0IdWxteu88bV?=
 =?us-ascii?Q?b+NoPKB5OrVaxTnVNe0vtEOimlnk+NkansgUaO16mWKKML+lGQ0AgAr6g02X?=
 =?us-ascii?Q?LW4yfRj86EZGBI1MDfiYgiTlwUY5Tjxn3ivuALbrpEyBZ9fJdUbhgNumH5qm?=
 =?us-ascii?Q?wyzFRx6/3z2NHURYMPT/A6SuiYxClN9fOaBnYpHWi9jrsLIcSAgdJBeeYDcf?=
 =?us-ascii?Q?BEqKd7eKWpj9pw6LbAXqqTyd2sMIkE4OwBxSqkWsRtgDIgtl/fidFbWDfQnz?=
 =?us-ascii?Q?KBeo2VtCyDb0Vercxy/0bfq2WQ0qOugbCGX8oZwmO75z19WKF4bWaB1KayiE?=
 =?us-ascii?Q?Llf+NBlqnLKGnpm43/E8m1QKfL0DkCFC29jiMFWXd2cH71Kdxsaw4JPO9ycJ?=
 =?us-ascii?Q?JUiHe56fhmn2l0rIv/hzF0qdDgMoayud+4wxWGyj4m0DwPBqJcVVMQdxoRtB?=
 =?us-ascii?Q?gp0V+lexZLsU6Vw1i40aQIbj7AP/XnfxIGoCjwGPzzV+Ml2VRtpkT3MZYURe?=
 =?us-ascii?Q?zr9DWcG1RTAUAVqhzWxzv3QgynE7xFVGvdNWMt6umLdMSfSILalL9vfTNr06?=
 =?us-ascii?Q?Bo/AvO6dQrHRNutIqhTggrLtdwh0U2nZsFsAT1fenzPnQTo7zp35EiL+NcBF?=
 =?us-ascii?Q?9yddhqXZus0p8TrKxomV1UHvSHqQ7BdOUGmjQFBz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9128fe6a-a8d4-4058-34c5-08dafdce2193
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:44:59.6607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSiwlseL49wQFH6uMDvamSQHHANtMiAEurRev7BDXlwueAwjb98EZ2RWcN5kz7e7kjSKnyDV64U3gBGuucKB1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7793
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
Cc: Cornelia Huck <cohuck@redhat.com>, daniel@ffwll.ch, kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>, jhubbard@nvidia.com, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, mkoutny@suse.com, jgg@nvidia.com, hannes@cmpxchg.org, surenb@google.com, tjmercier@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert from accounting pages against locked_vm to accounting them to
pinned_vm. This allows struct vm_account to be used to track the
mm_struct used to charge the pages. A future change also uses this to
track a cgroup for controlling pinned pages.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
---
 arch/powerpc/mm/book3s64/iommu_api.c | 29 ++++++++++++++++++-----------
 drivers/vfio/vfio_iommu_spapr_tce.c  | 15 ++++++++++-----
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 7fcfba1..6c57603 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -30,6 +30,7 @@ struct mm_iommu_table_group_mem_t {
 	unsigned long used;
 	atomic64_t mapped;
 	unsigned int pageshift;
+	struct vm_account vm_account;
 	u64 ua;			/* userspace address */
 	u64 entries;		/* number of entries in hpas/hpages[] */
 	/*
@@ -62,20 +63,24 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	unsigned int pageshift;
 	unsigned long entry, chunk;
 
-	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
-		ret = account_locked_vm(mm, entries, true);
-		if (ret)
-			return ret;
-
-		locked_entries = entries;
-	}
-
 	mem = kzalloc(sizeof(*mem), GFP_KERNEL);
 	if (!mem) {
 		ret = -ENOMEM;
 		goto unlock_exit;
 	}
 
+	vm_account_init_current(&mem->vm_account);
+	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
+		ret = vm_account_pinned(&mem->vm_account, entries);
+		if (ret) {
+			vm_account_release(&mem->vm_account);
+			kfree(mem);
+			return ret;
+		}
+
+		locked_entries = entries;
+	}
+
 	if (dev_hpa != MM_IOMMU_TABLE_INVALID_HPA) {
 		mem->pageshift = __ffs(dev_hpa | (entries << PAGE_SHIFT));
 		mem->dev_hpa = dev_hpa;
@@ -175,10 +180,11 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	unpin_user_pages(mem->hpages, pinned);
 
 	vfree(mem->hpas);
-	kfree(mem);
 
 unlock_exit:
-	account_locked_vm(mm, locked_entries, false);
+	vm_unaccount_pinned(&mem->vm_account, locked_entries);
+	vm_account_release(&mem->vm_account);
+	kfree(mem);
 
 	return ret;
 }
@@ -229,6 +235,7 @@ static void mm_iommu_do_free(struct mm_iommu_table_group_mem_t *mem)
 
 	mm_iommu_unpin(mem);
 	vfree(mem->hpas);
+	vm_account_release(&mem->vm_account);
 	kfree(mem);
 }
 
@@ -279,7 +286,7 @@ long mm_iommu_put(struct mm_struct *mm, struct mm_iommu_table_group_mem_t *mem)
 unlock_exit:
 	mutex_unlock(&mem_list_mutex);
 
-	account_locked_vm(mm, unlock_entries, false);
+	vm_unaccount_pinned(&mem->vm_account, unlock_entries);
 
 	return ret;
 }
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 60a50ce..a58281b 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -67,6 +67,7 @@ struct tce_container {
 	bool def_window_pending;
 	unsigned long locked_pages;
 	struct mm_struct *mm;
+	struct vm_account vm_account;
 	struct iommu_table *tables[IOMMU_TABLE_GROUP_MAX_TABLES];
 	struct list_head group_list;
 	struct list_head prereg_list;
@@ -82,6 +83,7 @@ static long tce_iommu_mm_set(struct tce_container *container)
 	BUG_ON(!current->mm);
 	container->mm = current->mm;
 	mmgrab(container->mm);
+	vm_account_init_current(&container->vm_account);
 
 	return 0;
 }
@@ -291,7 +293,7 @@ static int tce_iommu_enable(struct tce_container *container)
 		return ret;
 
 	locked = table_group->tce32_size >> PAGE_SHIFT;
-	ret = account_locked_vm(container->mm, locked, true);
+	ret = vm_account_pinned(&container->vm_accounnt, locked);
 	if (ret)
 		return ret;
 
@@ -310,7 +312,7 @@ static void tce_iommu_disable(struct tce_container *container)
 	container->enabled = false;
 
 	BUG_ON(!container->mm);
-	account_locked_vm(container->mm, container->locked_pages, false);
+	vm_account_pinned(&container->vm_account, container->locked_pages);
 }
 
 static void *tce_iommu_open(unsigned long arg)
@@ -372,8 +374,10 @@ static void tce_iommu_release(void *iommu_data)
 		WARN_ON(tce_iommu_prereg_free(container, tcemem));
 
 	tce_iommu_disable(container);
-	if (container->mm)
+	if (container->mm) {
 		mmdrop(container->mm);
+		vm_account_release(&container->vm_account);
+	}
 	mutex_destroy(&container->lock);
 
 	kfree(container);
@@ -619,7 +623,8 @@ static long tce_iommu_create_table(struct tce_container *container,
 	if (!table_size)
 		return -EINVAL;
 
-	ret = account_locked_vm(container->mm, table_size >> PAGE_SHIFT, true);
+	ret = vm_account_pinned(&container->vm_account,
+				table_size >> PAGE_SHIFT);
 	if (ret)
 		return ret;
 
@@ -638,7 +643,7 @@ static void tce_iommu_free_table(struct tce_container *container,
 	unsigned long pages = tbl->it_allocated_size >> PAGE_SHIFT;
 
 	iommu_tce_table_put(tbl);
-	account_locked_vm(container->mm, pages, false);
+	vm_unaccount_pinned(&container->vm_account, pages);
 }
 
 static long tce_iommu_create_window(struct tce_container *container,
-- 
git-series 0.9.1
