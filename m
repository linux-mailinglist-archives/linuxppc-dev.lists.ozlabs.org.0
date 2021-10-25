Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDFE438ED5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 07:30:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd3SW4HPlz2yPZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 16:30:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MmrK4SC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::61b;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=MmrK4SC8; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd1qp4ph2z2xtF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 15:16:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiYZX9ihTF5gC8tDmb1h8Qk0G5/epf+HyVYBFML+L/7+l5tkBtxP/0A3anbWv+C69uG5oz9fdX1dl6nr/zVG4KEMQyHr8Th2ZtWvlUDVGPMxdZIFkRmRMkfiwq1nyMfXjEVwADDYeASH22qCpc3s7wP7EYUUQ3n248J9aRLQ7+xAiWgt0iwtRWY+O8HC7u4enyLE7Nnva1T4mkS8G2ktdPQ1HD/NABLN15N1uFrBwUM01/DJnq8RQ/Xm9F29zdbVXUn6FbIW+AqktNwkv7aSGajmakd94h+UHrRJeJfIMlassUPH/VIKpcGsja3xWrZflWOKbNghEzOTLWUZ+L2wBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYKui8OHx31/7iCQf1coqYRPaEbN7enw5II1ywR1GG4=;
 b=Sj29RRPIWxHS4Sb7GLG9cGXR3vwFM+LFeFRVWfjL//3CN34iWA0F5dz8jJ4Ryr27obq2Sj6P/HTcZYwsHkZV9HJbGpD2NbRy2W4n+lEUSvwuvmaAM96mvn5vETNhI8bXu0tN+KEMXtjP/5IkVfyDkNO0ELKEP+4FuvgLM9K+aEtf8M1t/cZC1Lu+mfVkeLK4evVccMQtHnWDda21gkWlQvs4gM5VoPzEhoamNVJF0wQ5+KGE5nf8DFdWkiHW3T4XsGQDZzin1Clg6kohfNPhDPzPFSjMsuCK5aJmIzp5al97Ge5galFDZNl4WxFlXX3tEmMWrgbOhVTtt4biy4fL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYKui8OHx31/7iCQf1coqYRPaEbN7enw5II1ywR1GG4=;
 b=MmrK4SC8CPnH8DC0umJrot7AJnPP/T5x0Tf0+QcbhQLI7vevp45PB/nv6njimQJkuZpvxw0Lv3Kk1wERT3/E/7z5PxhEBXJdoUA2VzHAxsrlGupP7++BJR1TDoE0Mk9o8y+f7EGqGHMjJUA5qQkkRfmBFbhRVySucgweYzJ+yW6o7LAnCdu7KWhYWnLBvdHBAIBPFyrv0MBVHLMqqYlMx7RJNoEDSsN1Q4EnUWjsV0OSRoatjHvnH+Tg0rawNbyZAZvYyFti5ADgoWcPH0j9Ai/PCMHVZ8KQagWFXM81iXzak05+iIF7n4Uj/ARY4qk02zBn/mBz4pk69UL8hSCVsw==
Received: from MW4PR03CA0078.namprd03.prod.outlook.com (2603:10b6:303:b6::23)
 by DM4PR12MB5197.namprd12.prod.outlook.com (2603:10b6:5:394::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 04:16:29 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::df) by MW4PR03CA0078.outlook.office365.com
 (2603:10b6:303:b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 04:16:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 04:16:28 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct
 2021 04:16:27 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <akpm@linux-foundation.org>
Subject: [PATCH] mm/migrate.c: Remove MIGRATE_PFN_LOCKED
Date: Mon, 25 Oct 2021 15:16:08 +1100
Message-ID: <20211025041608.289017-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ff8d703-b5be-4d7b-ed91-08d9976e37b7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5197:
X-Microsoft-Antispam-PRVS: <DM4PR12MB519776988AFA03F4567E4F69DF839@DM4PR12MB5197.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uorYDd/tlo+/l7fezdGzS1JTaAw008ijJx1xk8Jwyndycm3m40lTt1dmqKfYYOft2F+UMCFu/1JEquaNMeBVLH3CBtXVF5t4xReFYsJxljxwgVmCJv3Q8DOetcpp9aC5rUmlZEmsnBuDlgkqGYHtraOXD+9fCc7XsSDKPT+LMuxJUfQvCNrB8yAmUNBQH/kpdn4+Jlk8pshLbASaZlsU0QLCLpCrlZYIQplODzGxgXI/c+NWiTfluehj6uh0dvYZSiJexzE7C2121cjLNJsm6LahhpkGv9lbi2JVgYr6rWmRYZul9uD5lf8bYqttCqmrfF81Y5BLoCdGNyVPCwOHAS58JytLuvqQdfl9gYve+1oMdxKxiStRc4ZbTNGcYAs89e+4VIBVpsWzUYZTgS+IOouqON0AQ+cR6X5jVYotUH4dq8pCvWUybEYVULP19jlI7TsF2Zdyl6WwqOVfkx7HkjwNoMg5124VxWMSr9IyNg+GW723ET6xcFHesj6Vzk9qL+b5hRFueHTN+8DthivngQ5JoZhH1bWjb6zRN75bAIiLy9zip6WitNfh0k2lmFNi1XZQX5rxhHlougV7FpSE1fhUoM8blVodDYrAJ8e1je+D4CIDUWPO4XR+ImLLOC5Njfxjv4TLxCR2ukadEW4BdGmfMEmeSAHE+sj5sUTurbBpTDYfSaQMW5jfLnJ139yrNxemnpOZkgrwLQCH6+9uDA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(54906003)(7636003)(16526019)(186003)(1076003)(36756003)(7416002)(2616005)(8936002)(83380400001)(70586007)(426003)(70206006)(86362001)(316002)(82310400003)(8676002)(508600001)(6916009)(107886003)(36860700001)(6666004)(4326008)(336012)(2906002)(47076005)(356005)(30864003)(5660300002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 04:16:28.4554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff8d703-b5be-4d7b-ed91-08d9976e37b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5197
X-Mailman-Approved-At: Mon, 25 Oct 2021 16:29:42 +1100
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
Cc: rcampbell@nvidia.com, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Felix.Kuehling@amd.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, ziy@nvidia.com, jhubbard@nvidia.com,
 alexander.deucher@amd.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bskeggs@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MIGRATE_PFN_LOCKED is used to indicate to migrate_vma_prepare() that a
source page was already locked during migrate_vma_collect(). If it
wasn't then the a second attempt is made to lock the page. However if
the first attempt failed it's unlikely a second attempt will succeed,
and the retry adds complexity. So clean this up by removing the retry
and MIGRATE_PFN_LOCKED flag.

Destination pages are also meant to have the MIGRATE_PFN_LOCKED flag
set, but nothing actually checks that.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 Documentation/vm/hmm.rst                 |   2 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |   2 -
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |   4 +-
 include/linux/migrate.h                  |   1 -
 lib/test_hmm.c                           |   5 +-
 mm/migrate.c                             | 145 +++++------------------
 7 files changed, 35 insertions(+), 128 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index a14c2938e7af..f2a59ed82ed3 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -360,7 +360,7 @@ between device driver specific code and shared common code:
    system memory page, locks the page with ``lock_page()``, and fills in the
    ``dst`` array entry with::
 
-     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+     dst[i] = migrate_pfn(page_to_pfn(dpage));
 
    Now that the driver knows that this page is being migrated, it can
    invalidate device private MMU mappings and copy device private memory
diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index a7061ee3b157..28c436df9935 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -560,7 +560,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
 				  gpa, 0, page_shift);
 
 	if (ret == U_SUCCESS)
-		*mig.dst = migrate_pfn(pfn) | MIGRATE_PFN_LOCKED;
+		*mig.dst = migrate_pfn(pfn);
 	else {
 		unlock_page(dpage);
 		__free_page(dpage);
@@ -774,7 +774,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
 		}
 	}
 
-	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	*mig.dst = migrate_pfn(page_to_pfn(dpage));
 	migrate_vma_pages(&mig);
 out_finalize:
 	migrate_vma_finalize(&mig);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 4a16e3c257b9..41d9417f182b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -300,7 +300,6 @@ svm_migrate_copy_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
 			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
-			migrate->dst[i] |= MIGRATE_PFN_LOCKED;
 			src[i] = dma_map_page(dev, spage, 0, PAGE_SIZE,
 					      DMA_TO_DEVICE);
 			r = dma_mapping_error(dev, src[i]);
@@ -580,7 +579,6 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 			      dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
 
 		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
-		migrate->dst[i] |= MIGRATE_PFN_LOCKED;
 		j++;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..3828aafd3ac4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -166,7 +166,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 		goto error_dma_unmap;
 	mutex_unlock(&svmm->mutex);
 
-	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	args->dst[0] = migrate_pfn(page_to_pfn(dpage));
 	return 0;
 
 error_dma_unmap:
@@ -602,7 +602,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
 	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c8077e936691..479b861ae490 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -119,7 +119,6 @@ static inline int migrate_misplaced_page(struct page *page,
  */
 #define MIGRATE_PFN_VALID	(1UL << 0)
 #define MIGRATE_PFN_MIGRATE	(1UL << 1)
-#define MIGRATE_PFN_LOCKED	(1UL << 2)
 #define MIGRATE_PFN_WRITE	(1UL << 3)
 #define MIGRATE_PFN_SHIFT	6
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index c259842f6d44..e2ce8f9b7605 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -613,8 +613,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		 */
 		rpage->zone_device_data = dmirror;
 
-		*dst = migrate_pfn(page_to_pfn(dpage)) |
-			    MIGRATE_PFN_LOCKED;
+		*dst = migrate_pfn(page_to_pfn(dpage));
 		if ((*src & MIGRATE_PFN_WRITE) ||
 		    (!spage && args->vma->vm_flags & VM_WRITE))
 			*dst |= MIGRATE_PFN_WRITE;
@@ -1137,7 +1136,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 		lock_page(dpage);
 		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+		*dst = migrate_pfn(page_to_pfn(dpage));
 		if (*src & MIGRATE_PFN_WRITE)
 			*dst |= MIGRATE_PFN_WRITE;
 	}
diff --git a/mm/migrate.c b/mm/migrate.c
index a6a7743ee98f..915e969811d0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2369,7 +2369,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		 * can't be dropped from it).
 		 */
 		get_page(page);
-		migrate->cpages++;
 
 		/*
 		 * Optimize for the common case where page is only mapped once
@@ -2379,7 +2378,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 		if (trylock_page(page)) {
 			pte_t swp_pte;
 
-			mpfn |= MIGRATE_PFN_LOCKED;
+			migrate->cpages++;
 			ptep_get_and_clear(mm, addr, ptep);
 
 			/* Setup special migration page table entry */
@@ -2413,6 +2412,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			if (pte_present(pte))
 				unmapped++;
+		} else {
+			put_page(page);
+			mpfn = 0;
 		}
 
 next:
@@ -2517,15 +2519,17 @@ static bool migrate_vma_check_page(struct page *page)
 }
 
 /*
- * migrate_vma_prepare() - lock pages and isolate them from the lru
+ * migrate_vma_unmap() - replace page mapping with special migration pte entry
  * @migrate: migrate struct containing all migration information
  *
- * This locks pages that have been collected by migrate_vma_collect(). Once each
- * page is locked it is isolated from the lru (for non-device pages). Finally,
- * the ref taken by migrate_vma_collect() is dropped, as locked pages cannot be
- * migrated by concurrent kernel threads.
+ * Isolate pages from the LRU and replace mappings (CPU page table pte) with a
+ * special migration pte entry and check if it has been pinned. Pinned pages are
+ * restored because we cannot migrate them.
+ *
+ * This is the last step before we call the device driver callback to allocate
+ * destination memory and copy contents of original page over to new page.
  */
-static void migrate_vma_prepare(struct migrate_vma *migrate)
+static void migrate_vma_unmap(struct migrate_vma *migrate)
 {
 	const unsigned long npages = migrate->npages;
 	const unsigned long start = migrate->start;
@@ -2534,32 +2538,12 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
 
 	lru_add_drain();
 
-	for (i = 0; (i < npages) && migrate->cpages; i++) {
+	for (i = 0; i < npages; i++) {
 		struct page *page = migrate_pfn_to_page(migrate->src[i]);
-		bool remap = true;
 
 		if (!page)
 			continue;
 
-		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
-			/*
-			 * Because we are migrating several pages there can be
-			 * a deadlock between 2 concurrent migration where each
-			 * are waiting on each other page lock.
-			 *
-			 * Make migrate_vma() a best effort thing and backoff
-			 * for any page we can not lock right away.
-			 */
-			if (!trylock_page(page)) {
-				migrate->src[i] = 0;
-				migrate->cpages--;
-				put_page(page);
-				continue;
-			}
-			remap = false;
-			migrate->src[i] |= MIGRATE_PFN_LOCKED;
-		}
-
 		/* ZONE_DEVICE pages are not on LRU */
 		if (!is_zone_device_page(page)) {
 			if (!PageLRU(page) && allow_drain) {
@@ -2569,16 +2553,9 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
 			}
 
 			if (isolate_lru_page(page)) {
-				if (remap) {
-					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-					migrate->cpages--;
-					restore++;
-				} else {
-					migrate->src[i] = 0;
-					unlock_page(page);
-					migrate->cpages--;
-					put_page(page);
-				}
+				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+				migrate->cpages--;
+				restore++;
 				continue;
 			}
 
@@ -2586,80 +2563,20 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
 			put_page(page);
 		}
 
-		if (!migrate_vma_check_page(page)) {
-			if (remap) {
-				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-				migrate->cpages--;
-				restore++;
-
-				if (!is_zone_device_page(page)) {
-					get_page(page);
-					putback_lru_page(page);
-				}
-			} else {
-				migrate->src[i] = 0;
-				unlock_page(page);
-				migrate->cpages--;
+		if (page_mapped(page))
+			try_to_migrate(page, 0);
 
-				if (!is_zone_device_page(page))
-					putback_lru_page(page);
-				else
-					put_page(page);
+		if (page_mapped(page) || !migrate_vma_check_page(page)) {
+			if (!is_zone_device_page(page)) {
+				get_page(page);
+				putback_lru_page(page);
 			}
-		}
-	}
-
-	for (i = 0, addr = start; i < npages && restore; i++, addr += PAGE_SIZE) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
-
-		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
-			continue;
 
-		remove_migration_pte(page, migrate->vma, addr, page);
-
-		migrate->src[i] = 0;
-		unlock_page(page);
-		put_page(page);
-		restore--;
-	}
-}
-
-/*
- * migrate_vma_unmap() - replace page mapping with special migration pte entry
- * @migrate: migrate struct containing all migration information
- *
- * Replace page mapping (CPU page table pte) with a special migration pte entry
- * and check again if it has been pinned. Pinned pages are restored because we
- * cannot migrate them.
- *
- * This is the last step before we call the device driver callback to allocate
- * destination memory and copy contents of original page over to new page.
- */
-static void migrate_vma_unmap(struct migrate_vma *migrate)
-{
-	const unsigned long npages = migrate->npages;
-	const unsigned long start = migrate->start;
-	unsigned long addr, i, restore = 0;
-
-	for (i = 0; i < npages; i++) {
-		struct page *page = migrate_pfn_to_page(migrate->src[i]);
-
-		if (!page || !(migrate->src[i] & MIGRATE_PFN_MIGRATE))
+			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			migrate->cpages--;
+			restore++;
 			continue;
-
-		if (page_mapped(page)) {
-			try_to_migrate(page, 0);
-			if (page_mapped(page))
-				goto restore;
 		}
-
-		if (migrate_vma_check_page(page))
-			continue;
-
-restore:
-		migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-		migrate->cpages--;
-		restore++;
 	}
 
 	for (addr = start, i = 0; i < npages && restore; addr += PAGE_SIZE, i++) {
@@ -2672,12 +2589,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 
 		migrate->src[i] = 0;
 		unlock_page(page);
+		put_page(page);
 		restore--;
-
-		if (is_zone_device_page(page))
-			put_page(page);
-		else
-			putback_lru_page(page);
 	}
 }
 
@@ -2700,8 +2613,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
  * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE
  * flag set).  Once these are allocated and copied, the caller must update each
  * corresponding entry in the dst array with the pfn value of the destination
- * page and with the MIGRATE_PFN_VALID and MIGRATE_PFN_LOCKED flags set
- * (destination pages must have their struct pages locked, via lock_page()).
+ * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
+ * lock_page().
  *
  * Note that the caller does not have to migrate all the pages that are marked
  * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration from
@@ -2770,8 +2683,6 @@ int migrate_vma_setup(struct migrate_vma *args)
 
 	migrate_vma_collect(args);
 
-	if (args->cpages)
-		migrate_vma_prepare(args);
 	if (args->cpages)
 		migrate_vma_unmap(args);
 
-- 
2.30.2

