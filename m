Return-Path: <linuxppc-dev+bounces-15542-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E4D129E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 13:52:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqXNK5df0z30RT;
	Mon, 12 Jan 2026 23:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768165153;
	cv=none; b=l4RaHNtW1dpvwCw0ETJLilzZT63BGgS4Yv6NXTmGGBOWZ7qe3JgePTkOqg0o521I0dc0uovTk2Sat4x3VhYO2ZXO65D/G3j9zkXNe1r51N1RUlrHLkJeo35cCII76bRH4voI9rsIpnSFHqz4Vzd93VJ/xn98/7C3+YYFnErMKuVzFXwtiHQt/ojV+8qa2hH9bLczLIJ46xzLKGQ0epaQmhQkh3b0yLM499u2EHSqCT5KXNstYcWlEyX7x+QOe6bb4XEsSlXtktDRuXdUJDoAe99yL6LOfVrfjriv2AEhn5Ydnef51jCn2rWctFJrPUM1PyNa3EuhUa7Dn+XX9r6ZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768165153; c=relaxed/relaxed;
	bh=dsOnrOPJk1h2sm33TCAr8bc8lh5O+rfxt+K7WPWfLyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l81LxlAvfmk4dB756xl+sE0rr+UB1zqSQJNm6+Uwr6nHMMlPyjZagTLOU2uZphur2CXdsA5zYHhpKclXFMZSkpsc/lsRZ4Uw8qEzrXwRM0p1j4hl53b53HjZbSYRwno6w9RCi+47u94O//0VzPG/T0JkZoUmRJ4/vmFL5zjImgi2ktfKd3p0LmUd921XEUygD8hTHpvFPxIqWo3sY8A9iNxhRqw8v5aeOnSN9PRdF3GMS5u4SEggr8chImfunG8WXKXKqJBcJGBvNFSGjX9uvbM7gWzlHhA9/s243mxMftphM019eHpxd2yGgXWDrdQJahiVsXdVm7SpQzItbig97w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtG3kzGY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=francois.dugast@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtG3kzGY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=francois.dugast@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dq7D108DYz2yMB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 07:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768165154; x=1799701154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s1T9vuao+kXccuTcOMDTHHq+bj2twItjHB4YXvJcFdM=;
  b=JtG3kzGYXmq0jFZA5nRp6BiA0lll/Fbo53OMPwvEoQQGZ4aG9u3h7jx6
   aljVpAMa1G3hgbk7yim4g8dX7XJ6na7qvn8d4RWQi9SzVbvU0tcWLYDmf
   eNN7pEd1z6995kPBryjBHNXgdey0HhpyK4JnOehyaSATq/NY+SWxfupJm
   SZaEdJtte3pOKudD7VVWVBmBCjTbAgR1ucmwVev92cYaRDjHrfHwIA9Zd
   lyktn8vbVNSI0UgiH/UWk1KNRNmAijESaKOW7vCvQq/TMiX3v/mIu46Qg
   d+kYm1TFxp7yj3kJ/V5jwSVDUK584B+hl2UC9ZO/BmEo2aNUvGAuxbo/w
   Q==;
X-CSE-ConnectionGUID: /9OQ0G5SSoizFJDGaoNsXA==
X-CSE-MsgGUID: 8+vq+FTmTq+sZ+YweizXlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80904689"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80904689"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:59:12 -0800
X-CSE-ConnectionGUID: x5hfc93rT7yYrL+IWOJYbg==
X-CSE-MsgGUID: YcOO9Gc2RRmD+fYdz8alfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208419956"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fdugast-desk.home) ([10.245.245.11])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:59:04 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Zi Yan <ziy@nvidia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alistair Popple <apopple@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free callback
Date: Sun, 11 Jan 2026 21:55:40 +0100
Message-ID: <20260111205820.830410-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111205820.830410-1-francois.dugast@intel.com>
References: <20260111205820.830410-1-francois.dugast@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Matthew Brost <matthew.brost@intel.com>

The core MM splits the folio before calling folio_free, restoring the
zone pages associated with the folio to an initialized state (e.g.,
non-compound, pgmap valid, etc...). The order argument represents the
folio’s order prior to the split which can be used driver side to know
how many pages are being freed.

Fixes: 3a5a06554566 ("mm/zone_device: rename page_free callback to folio_free")
Cc: Zi Yan <ziy@nvidia.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Logan Gunthorpe <logang@deltatee.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-pci@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
 drivers/gpu/drm/drm_pagemap.c            | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 4 ++--
 drivers/pci/p2pdma.c                     | 2 +-
 include/linux/memremap.h                 | 7 ++++++-
 lib/test_hmm.c                           | 4 +---
 mm/memremap.c                            | 5 +++--
 8 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..b58f34eec6e5 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -1014,7 +1014,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
  * to a normal PFN during H_SVM_PAGE_OUT.
  * Gets called with kvm->arch.uvmem_lock held.
  */
-static void kvmppc_uvmem_folio_free(struct folio *folio)
+static void kvmppc_uvmem_folio_free(struct folio *folio, unsigned int order)
 {
 	struct page *page = &folio->page;
 	unsigned long pfn = page_to_pfn(page) -
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..a26e3c448e47 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -567,7 +567,7 @@ svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 	return r < 0 ? r : 0;
 }
 
-static void svm_migrate_folio_free(struct folio *folio)
+static void svm_migrate_folio_free(struct folio *folio, unsigned int order)
 {
 	struct page *page = &folio->page;
 	struct svm_range_bo *svm_bo = page->zone_device_data;
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..df253b13cf85 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -1144,11 +1144,12 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
 /**
  * drm_pagemap_folio_free() - Put GPU SVM zone device data associated with a folio
  * @folio: Pointer to the folio
+ * @order: Order of the folio prior to being split by core MM
  *
  * This function is a callback used to put the GPU SVM zone device data
  * associated with a page when it is being released.
  */
-static void drm_pagemap_folio_free(struct folio *folio)
+static void drm_pagemap_folio_free(struct folio *folio, unsigned int order)
 {
 	drm_pagemap_zdd_put(folio->page.zone_device_data);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..545f316fca14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -115,14 +115,14 @@ unsigned long nouveau_dmem_page_addr(struct page *page)
 	return chunk->bo->offset + off;
 }
 
-static void nouveau_dmem_folio_free(struct folio *folio)
+static void nouveau_dmem_folio_free(struct folio *folio, unsigned int order)
 {
 	struct page *page = &folio->page;
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
-	if (folio_order(folio)) {
+	if (order) {
 		page->zone_device_data = dmem->free_folios;
 		dmem->free_folios = folio;
 	} else {
diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 4a2fc7ab42c3..a6fa7610f8a8 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -200,7 +200,7 @@ static const struct attribute_group p2pmem_group = {
 	.name = "p2pmem",
 };
 
-static void p2pdma_folio_free(struct folio *folio)
+static void p2pdma_folio_free(struct folio *folio, unsigned int order)
 {
 	struct page *page = &folio->page;
 	struct pci_p2pdma_pagemap *pgmap = to_p2p_pgmap(page_pgmap(page));
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 713ec0435b48..97fcffeb1c1e 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -79,8 +79,13 @@ struct dev_pagemap_ops {
 	 * Called once the folio refcount reaches 0.  The reference count will be
 	 * reset to one by the core code after the method is called to prepare
 	 * for handing out the folio again.
+	 *
+	 * The core MM splits the folio before calling folio_free, restoring the
+	 * zone pages associated with the folio to an initialized state (e.g.,
+	 * non-compound, pgmap valid, etc...). The order argument represents the
+	 * folio’s order prior to the split.
 	 */
-	void (*folio_free)(struct folio *folio);
+	void (*folio_free)(struct folio *folio, unsigned int order);
 
 	/*
 	 * Used for private (un-addressable) device memory only.  Must migrate
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..e17c71d02a3a 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1580,13 +1580,11 @@ static const struct file_operations dmirror_fops = {
 	.owner		= THIS_MODULE,
 };
 
-static void dmirror_devmem_free(struct folio *folio)
+static void dmirror_devmem_free(struct folio *folio, unsigned int order)
 {
 	struct page *page = &folio->page;
 	struct page *rpage = BACKING_PAGE(page);
 	struct dmirror_device *mdevice;
-	struct folio *rfolio = page_folio(rpage);
-	unsigned int order = folio_order(rfolio);
 
 	if (rpage != page) {
 		if (order)
diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..39dc4bd190d0 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -417,6 +417,7 @@ void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
 	unsigned long nr = folio_nr_pages(folio);
+	unsigned int order = folio_order(folio);
 	int i;
 
 	if (WARN_ON_ONCE(!pgmap))
@@ -453,7 +454,7 @@ void free_zone_device_folio(struct folio *folio)
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
 			break;
-		pgmap->ops->folio_free(folio);
+		pgmap->ops->folio_free(folio, order);
 		percpu_ref_put_many(&folio->pgmap->ref, nr);
 		break;
 
@@ -472,7 +473,7 @@ void free_zone_device_folio(struct folio *folio)
 	case MEMORY_DEVICE_PCI_P2PDMA:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
 			break;
-		pgmap->ops->folio_free(folio);
+		pgmap->ops->folio_free(folio, order);
 		break;
 	}
 }
-- 
2.43.0


