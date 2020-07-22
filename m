Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA22291B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:08:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRQG1r8RzDqwV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gWOoEZ9Y; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9c6NDYzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:40 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id t6so705233pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUAh9HWT4WXewrgkLN91a8VcpTBYXqFaYftnk7jeRUQ=;
 b=gWOoEZ9YAfQ6fD62Rc3PDB6fXiXtB5ytt1Xs6e5dYho1GtpMnh0UyXHpRtLiJJpxQG
 AI16htQDlo/1a5wnEHu894tJ7z13QogenQ82by9yVnpyeLIQ9HKXHhOOa5O6WjsqKMA6
 qszegsfNq9h0lLPdj/+Z1OfJzj48AQu2bA1NT3fgU7ijiAszaKgRxQJikMvq+K1aA7ib
 YpsY4CVr0HpJoQ5nZDA5zwVv0QzeTSb6dE+tV5F8YFdAQMTXZRQYZz7JRv8r4hZmJM52
 ulFrjKzmTE2PpLeSpLg6PCINzFkd1k8EtWNqc1lC0tBFyZUwDt99XTNs7D9I7DkXRmL6
 bN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUAh9HWT4WXewrgkLN91a8VcpTBYXqFaYftnk7jeRUQ=;
 b=pGPv+a5GJ0vpa2PfqkaBAJalXtCVQv6Eqv9zuZntOm3q5IWzNtFvJM3UgMMvqp/PNH
 4DzQH86HkDcx4zNzFE9/J++sGPrdWqh0oitgG24jlErLP9U7XZuGJGJSR/jCegiK/uIm
 HnuLtmhOxKSYcZJV+0huQDOXaeVAZEGXMyKYiCvllzBStaqPpK6K14FaMUNSoT/Ojdxk
 VYzQie/1y3GOd7EaR9M+LdAXh7hXcSAY6TDPxpek9Auo7kpwIEezyMQ2badmkZbtlgY+
 psA5J5OUxKzj0WjTMR+1RfoNDSsvDQDWXo4I1ZVSql00uwxcEM9kKsRdpFinle+aQw6j
 LVrQ==
X-Gm-Message-State: AOAM533ew01MvGffTfTJkLcAX1q4wXG8g30m87M9T0PSRaQJGIRpk432
 xyGjSutm5p6Clm1Fag2eAekLQ4PNZNk=
X-Google-Smtp-Source: ABdhPJwn41jtwRoEwey08G+IIrKzBzgSB7a/zK7sY1/Z50ADjlF22Zxhm/ZzFJOGiGWnu2aitKE1Yw==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr24672868pgc.384.1595401056908; 
 Tue, 21 Jul 2020 23:57:36 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:36 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/16] powerpc/powernv/sriov: Move SR-IOV into a separate
 file
Date: Wed, 22 Jul 2020 16:57:04 +1000
Message-Id: <20200722065715.1432738-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pci-ioda.c is getting a bit unwieldly due to the amount of stuff jammed in
there. The SR-IOV support can be extracted easily enough and is mostly
standalone, so move it into a separate file.

This patch also moves the PowerNV SR-IOV specific fields from pci_dn and
moves them into a platform specific structure. I'm not sure how they ended
up in there in the first place, but leaking platform specifics into common
code has proven to be a terrible idea so far so lets stop doing that.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
---
 arch/powerpc/include/asm/device.h          |   3 +
 arch/powerpc/platforms/powernv/Makefile    |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c  | 673 +--------------------
 arch/powerpc/platforms/powernv/pci-sriov.c | 642 ++++++++++++++++++++
 arch/powerpc/platforms/powernv/pci.h       |  74 +++
 5 files changed, 738 insertions(+), 655 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/pci-sriov.c

diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 266542769e4b..4d8934db7ef5 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -49,6 +49,9 @@ struct dev_archdata {
 #ifdef CONFIG_CXL_BASE
 	struct cxl_context	*cxl_ctx;
 #endif
+#ifdef CONFIG_PCI_IOV
+	void *iov_data;
+#endif
 };
 
 struct pdev_archdata {
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index fe3f0fb5aeca..2eb6ae150d1f 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_PRESERVE_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_OPAL_CORE)	+= opal-core.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
+obj-$(CONFIG_PCI_IOV)   += pci-sriov.o
 obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
 obj-$(CONFIG_EEH)	+= eeh-powernv.o
 obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 8fb17676d914..2d36a9ebf0e9 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -115,26 +115,6 @@ static int __init pci_reset_phbs_setup(char *str)
 
 early_param("ppc_pci_reset_phbs", pci_reset_phbs_setup);
 
-static inline bool pnv_pci_is_m64(struct pnv_phb *phb, struct resource *r)
-{
-	/*
-	 * WARNING: We cannot rely on the resource flags. The Linux PCI
-	 * allocation code sometimes decides to put a 64-bit prefetchable
-	 * BAR in the 32-bit window, so we have to compare the addresses.
-	 *
-	 * For simplicity we only test resource start.
-	 */
-	return (r->start >= phb->ioda.m64_base &&
-		r->start < (phb->ioda.m64_base + phb->ioda.m64_size));
-}
-
-static inline bool pnv_pci_is_m64_flags(unsigned long resource_flags)
-{
-	unsigned long flags = (IORESOURCE_MEM_64 | IORESOURCE_PREFETCH);
-
-	return (resource_flags & flags) == flags;
-}
-
 static struct pnv_ioda_pe *pnv_ioda_init_pe(struct pnv_phb *phb, int pe_no)
 {
 	s64 rc;
@@ -172,7 +152,7 @@ static void pnv_ioda_reserve_pe(struct pnv_phb *phb, int pe_no)
 	pnv_ioda_init_pe(phb, pe_no);
 }
 
-static struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
+struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
 {
 	long pe;
 
@@ -184,7 +164,7 @@ static struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
 	return NULL;
 }
 
-static void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
+void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
 {
 	struct pnv_phb *phb = pe->phb;
 	unsigned int pe_num = pe->pe_number;
@@ -816,7 +796,7 @@ static void pnv_ioda_unset_peltv(struct pnv_phb *phb,
 		pe_warn(pe, "OPAL error %lld remove self from PELTV\n", rc);
 }
 
-static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
+int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
 	struct pci_dev *parent;
 	uint8_t bcomp, dcomp, fcomp;
@@ -887,7 +867,7 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	return 0;
 }
 
-static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
+int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
 	struct pci_dev *parent;
 	uint8_t bcomp, dcomp, fcomp;
@@ -982,91 +962,6 @@ static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	return 0;
 }
 
-#ifdef CONFIG_PCI_IOV
-static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
-{
-	struct pci_dn *pdn = pci_get_pdn(dev);
-	int i;
-	struct resource *res, res2;
-	resource_size_t size;
-	u16 num_vfs;
-
-	if (!dev->is_physfn)
-		return -EINVAL;
-
-	/*
-	 * "offset" is in VFs.  The M64 windows are sized so that when they
-	 * are segmented, each segment is the same size as the IOV BAR.
-	 * Each segment is in a separate PE, and the high order bits of the
-	 * address are the PE number.  Therefore, each VF's BAR is in a
-	 * separate PE, and changing the IOV BAR start address changes the
-	 * range of PEs the VFs are in.
-	 */
-	num_vfs = pdn->num_vfs;
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || !res->parent)
-			continue;
-
-		/*
-		 * The actual IOV BAR range is determined by the start address
-		 * and the actual size for num_vfs VFs BAR.  This check is to
-		 * make sure that after shifting, the range will not overlap
-		 * with another device.
-		 */
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
-		res2.flags = res->flags;
-		res2.start = res->start + (size * offset);
-		res2.end = res2.start + (size * num_vfs) - 1;
-
-		if (res2.end > res->end) {
-			dev_err(&dev->dev, "VF BAR%d: %pR would extend past %pR (trying to enable %d VFs shifted by %d)\n",
-				i, &res2, res, num_vfs, offset);
-			return -EBUSY;
-		}
-	}
-
-	/*
-	 * Since M64 BAR shares segments among all possible 256 PEs,
-	 * we have to shift the beginning of PF IOV BAR to make it start from
-	 * the segment which belongs to the PE number assigned to the first VF.
-	 * This creates a "hole" in the /proc/iomem which could be used for
-	 * allocating other resources so we reserve this area below and
-	 * release when IOV is released.
-	 */
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &dev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || !res->parent)
-			continue;
-
-		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
-		res2 = *res;
-		res->start += size * offset;
-
-		dev_info(&dev->dev, "VF BAR%d: %pR shifted to %pR (%sabling %d VFs shifted by %d)\n",
-			 i, &res2, res, (offset > 0) ? "En" : "Dis",
-			 num_vfs, offset);
-
-		if (offset < 0) {
-			devm_release_resource(&dev->dev, &pdn->holes[i]);
-			memset(&pdn->holes[i], 0, sizeof(pdn->holes[i]));
-		}
-
-		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
-
-		if (offset > 0) {
-			pdn->holes[i].start = res2.start;
-			pdn->holes[i].end = res2.start + size * offset - 1;
-			pdn->holes[i].flags = IORESOURCE_BUS;
-			pdn->holes[i].name = "pnv_iov_reserved";
-			devm_request_resource(&dev->dev, res->parent,
-					&pdn->holes[i]);
-		}
-	}
-	return 0;
-}
-#endif /* CONFIG_PCI_IOV */
-
 static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(dev->bus);
@@ -1294,406 +1189,9 @@ static void pnv_pci_ioda_setup_nvlink(void)
 #endif
 }
 
-#ifdef CONFIG_PCI_IOV
-static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
-{
-	struct pnv_phb        *phb;
-	struct pci_dn         *pdn;
-	int                    i, j;
-	int                    m64_bars;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-
-	if (pdn->m64_single_mode)
-		m64_bars = num_vfs;
-	else
-		m64_bars = 1;
-
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		for (j = 0; j < m64_bars; j++) {
-			if (pdn->m64_map[j][i] == IODA_INVALID_M64)
-				continue;
-			opal_pci_phb_mmio_enable(phb->opal_id,
-				OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 0);
-			clear_bit(pdn->m64_map[j][i], &phb->ioda.m64_bar_alloc);
-			pdn->m64_map[j][i] = IODA_INVALID_M64;
-		}
-
-	kfree(pdn->m64_map);
-	return 0;
-}
-
-static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
-{
-	struct pnv_phb        *phb;
-	struct pci_dn         *pdn;
-	unsigned int           win;
-	struct resource       *res;
-	int                    i, j;
-	int64_t                rc;
-	int                    total_vfs;
-	resource_size_t        size, start;
-	int                    pe_num;
-	int                    m64_bars;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-	total_vfs = pci_sriov_get_totalvfs(pdev);
-
-	if (pdn->m64_single_mode)
-		m64_bars = num_vfs;
-	else
-		m64_bars = 1;
-
-	pdn->m64_map = kmalloc_array(m64_bars,
-				     sizeof(*pdn->m64_map),
-				     GFP_KERNEL);
-	if (!pdn->m64_map)
-		return -ENOMEM;
-	/* Initialize the m64_map to IODA_INVALID_M64 */
-	for (i = 0; i < m64_bars ; i++)
-		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
-			pdn->m64_map[i][j] = IODA_INVALID_M64;
-
-
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &pdev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || !res->parent)
-			continue;
-
-		for (j = 0; j < m64_bars; j++) {
-			do {
-				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
-						phb->ioda.m64_bar_idx + 1, 0);
-
-				if (win >= phb->ioda.m64_bar_idx + 1)
-					goto m64_failed;
-			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
-
-			pdn->m64_map[j][i] = win;
-
-			if (pdn->m64_single_mode) {
-				size = pci_iov_resource_size(pdev,
-							PCI_IOV_RESOURCES + i);
-				start = res->start + size * j;
-			} else {
-				size = resource_size(res);
-				start = res->start;
-			}
-
-			/* Map the M64 here */
-			if (pdn->m64_single_mode) {
-				pe_num = pdn->pe_num_map[j];
-				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-						pe_num, OPAL_M64_WINDOW_TYPE,
-						pdn->m64_map[j][i], 0);
-			}
-
-			rc = opal_pci_set_phb_mem_window(phb->opal_id,
-						 OPAL_M64_WINDOW_TYPE,
-						 pdn->m64_map[j][i],
-						 start,
-						 0, /* unused */
-						 size);
-
-
-			if (rc != OPAL_SUCCESS) {
-				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
-					win, rc);
-				goto m64_failed;
-			}
-
-			if (pdn->m64_single_mode)
-				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 2);
-			else
-				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, pdn->m64_map[j][i], 1);
-
-			if (rc != OPAL_SUCCESS) {
-				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
-					win, rc);
-				goto m64_failed;
-			}
-		}
-	}
-	return 0;
-
-m64_failed:
-	pnv_pci_vf_release_m64(pdev, num_vfs);
-	return -EBUSY;
-}
-
-static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
-
-static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
-{
-	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe, *pe_n;
-	struct pci_dn         *pdn;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-
-	if (!pdev->is_physfn)
-		return;
-
-	/* FIXME: Use pnv_ioda_release_pe()? */
-	list_for_each_entry_safe(pe, pe_n, &phb->ioda.pe_list, list) {
-		if (pe->parent_dev != pdev)
-			continue;
-
-		pnv_pci_ioda2_release_pe_dma(pe);
-
-		/* Remove from list */
-		mutex_lock(&phb->ioda.pe_list_mutex);
-		list_del(&pe->list);
-		mutex_unlock(&phb->ioda.pe_list_mutex);
-
-		pnv_ioda_deconfigure_pe(phb, pe);
-
-		pnv_ioda_free_pe(pe);
-	}
-}
-
-static void pnv_pci_sriov_disable(struct pci_dev *pdev)
-{
-	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
-	struct pci_dn         *pdn;
-	u16                    num_vfs, i;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-	num_vfs = pdn->num_vfs;
-
-	/* Release VF PEs */
-	pnv_ioda_release_vf_PE(pdev);
-
-	if (phb->type == PNV_PHB_IODA2) {
-		if (!pdn->m64_single_mode)
-			pnv_pci_vf_resource_shift(pdev, -*pdn->pe_num_map);
-
-		/* Release M64 windows */
-		pnv_pci_vf_release_m64(pdev, num_vfs);
-
-		/* Release PE numbers */
-		if (pdn->m64_single_mode) {
-			for (i = 0; i < num_vfs; i++) {
-				if (pdn->pe_num_map[i] == IODA_INVALID_PE)
-					continue;
-
-				pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
-				pnv_ioda_free_pe(pe);
-			}
-		} else
-			bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
-		/* Releasing pe_num_map */
-		kfree(pdn->pe_num_map);
-	}
-}
-
-static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe);
-static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
-{
-	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
-	int                    pe_num;
-	u16                    vf_index;
-	struct pci_dn         *pdn;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-
-	if (!pdev->is_physfn)
-		return;
-
-	/* Reserve PE for each VF */
-	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
-		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
-		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
-		struct pci_dn *vf_pdn;
-
-		if (pdn->m64_single_mode)
-			pe_num = pdn->pe_num_map[vf_index];
-		else
-			pe_num = *pdn->pe_num_map + vf_index;
-
-		pe = &phb->ioda.pe_array[pe_num];
-		pe->pe_number = pe_num;
-		pe->phb = phb;
-		pe->flags = PNV_IODA_PE_VF;
-		pe->pbus = NULL;
-		pe->parent_dev = pdev;
-		pe->mve_number = -1;
-		pe->rid = (vf_bus << 8) | vf_devfn;
-
-		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
-			pci_domain_nr(pdev->bus), pdev->bus->number,
-			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
-
-		if (pnv_ioda_configure_pe(phb, pe)) {
-			/* XXX What do we do here ? */
-			pnv_ioda_free_pe(pe);
-			pe->pdev = NULL;
-			continue;
-		}
-
-		/* Put PE to the list */
-		mutex_lock(&phb->ioda.pe_list_mutex);
-		list_add_tail(&pe->list, &phb->ioda.pe_list);
-		mutex_unlock(&phb->ioda.pe_list_mutex);
-
-		/* associate this pe to it's pdn */
-		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
-			if (vf_pdn->busno == vf_bus &&
-			    vf_pdn->devfn == vf_devfn) {
-				vf_pdn->pe_number = pe_num;
-				break;
-			}
-		}
-
-		pnv_pci_ioda2_setup_dma_pe(phb, pe);
-	}
-}
-
-static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
-{
-	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
-	struct pci_dn         *pdn;
-	int                    ret;
-	u16                    i;
-
-	phb = pci_bus_to_pnvhb(pdev->bus);
-	pdn = pci_get_pdn(pdev);
-
-	if (phb->type == PNV_PHB_IODA2) {
-		if (!pdn->vfs_expanded) {
-			dev_info(&pdev->dev, "don't support this SRIOV device"
-				" with non 64bit-prefetchable IOV BAR\n");
-			return -ENOSPC;
-		}
-
-		/*
-		 * When M64 BARs functions in Single PE mode, the number of VFs
-		 * could be enabled must be less than the number of M64 BARs.
-		 */
-		if (pdn->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
-			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
-			return -EBUSY;
-		}
-
-		/* Allocating pe_num_map */
-		if (pdn->m64_single_mode)
-			pdn->pe_num_map = kmalloc_array(num_vfs,
-							sizeof(*pdn->pe_num_map),
-							GFP_KERNEL);
-		else
-			pdn->pe_num_map = kmalloc(sizeof(*pdn->pe_num_map), GFP_KERNEL);
-
-		if (!pdn->pe_num_map)
-			return -ENOMEM;
-
-		if (pdn->m64_single_mode)
-			for (i = 0; i < num_vfs; i++)
-				pdn->pe_num_map[i] = IODA_INVALID_PE;
-
-		/* Calculate available PE for required VFs */
-		if (pdn->m64_single_mode) {
-			for (i = 0; i < num_vfs; i++) {
-				pe = pnv_ioda_alloc_pe(phb);
-				if (!pe) {
-					ret = -EBUSY;
-					goto m64_failed;
-				}
-
-				pdn->pe_num_map[i] = pe->pe_number;
-			}
-		} else {
-			mutex_lock(&phb->ioda.pe_alloc_mutex);
-			*pdn->pe_num_map = bitmap_find_next_zero_area(
-				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
-				0, num_vfs, 0);
-			if (*pdn->pe_num_map >= phb->ioda.total_pe_num) {
-				mutex_unlock(&phb->ioda.pe_alloc_mutex);
-				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
-				kfree(pdn->pe_num_map);
-				return -EBUSY;
-			}
-			bitmap_set(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
-			mutex_unlock(&phb->ioda.pe_alloc_mutex);
-		}
-		pdn->num_vfs = num_vfs;
-
-		/* Assign M64 window accordingly */
-		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
-		if (ret) {
-			dev_info(&pdev->dev, "Not enough M64 window resources\n");
-			goto m64_failed;
-		}
-
-		/*
-		 * When using one M64 BAR to map one IOV BAR, we need to shift
-		 * the IOV BAR according to the PE# allocated to the VFs.
-		 * Otherwise, the PE# for the VF will conflict with others.
-		 */
-		if (!pdn->m64_single_mode) {
-			ret = pnv_pci_vf_resource_shift(pdev, *pdn->pe_num_map);
-			if (ret)
-				goto m64_failed;
-		}
-	}
-
-	/* Setup VF PEs */
-	pnv_ioda_setup_vf_PE(pdev, num_vfs);
-
-	return 0;
-
-m64_failed:
-	if (pdn->m64_single_mode) {
-		for (i = 0; i < num_vfs; i++) {
-			if (pdn->pe_num_map[i] == IODA_INVALID_PE)
-				continue;
-
-			pe = &phb->ioda.pe_array[pdn->pe_num_map[i]];
-			pnv_ioda_free_pe(pe);
-		}
-	} else
-		bitmap_clear(phb->ioda.pe_alloc, *pdn->pe_num_map, num_vfs);
-
-	/* Releasing pe_num_map */
-	kfree(pdn->pe_num_map);
-
-	return ret;
-}
-
-static int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
-{
-	pnv_pci_sriov_disable(pdev);
-
-	/* Release PCI data */
-	remove_sriov_vf_pdns(pdev);
-	return 0;
-}
-
-static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
-{
-	/* Allocate PCI data */
-	add_sriov_vf_pdns(pdev);
-
-	return pnv_pci_sriov_enable(pdev, num_vfs);
-}
-#endif /* CONFIG_PCI_IOV */
-
 static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 				       struct pnv_ioda_pe *pe);
 
-static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe);
-
 static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
@@ -2559,8 +2057,8 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
 };
 #endif
 
-static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
-				       struct pnv_ioda_pe *pe)
+void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
+				struct pnv_ioda_pe *pe)
 {
 	int64_t rc;
 
@@ -2737,117 +2235,6 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
 		count, phb->msi_base);
 }
 
-#ifdef CONFIG_PCI_IOV
-static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
-{
-	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
-	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
-	struct resource *res;
-	int i;
-	resource_size_t size, total_vf_bar_sz;
-	struct pci_dn *pdn;
-	int mul, total_vfs;
-
-	pdn = pci_get_pdn(pdev);
-	pdn->vfs_expanded = 0;
-	pdn->m64_single_mode = false;
-
-	total_vfs = pci_sriov_get_totalvfs(pdev);
-	mul = phb->ioda.total_pe_num;
-	total_vf_bar_sz = 0;
-
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &pdev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || res->parent)
-			continue;
-		if (!pnv_pci_is_m64_flags(res->flags)) {
-			dev_warn(&pdev->dev, "Don't support SR-IOV with"
-					" non M64 VF BAR%d: %pR. \n",
-				 i, res);
-			goto truncate_iov;
-		}
-
-		total_vf_bar_sz += pci_iov_resource_size(pdev,
-				i + PCI_IOV_RESOURCES);
-
-		/*
-		 * If bigger than quarter of M64 segment size, just round up
-		 * power of two.
-		 *
-		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
-		 * with other devices, IOV BAR size is expanded to be
-		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
-		 * segment size , the expanded size would equal to half of the
-		 * whole M64 space size, which will exhaust the M64 Space and
-		 * limit the system flexibility.  This is a design decision to
-		 * set the boundary to quarter of the M64 segment size.
-		 */
-		if (total_vf_bar_sz > gate) {
-			mul = roundup_pow_of_two(total_vfs);
-			dev_info(&pdev->dev,
-				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
-				total_vf_bar_sz, gate, mul);
-			pdn->m64_single_mode = true;
-			break;
-		}
-	}
-
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &pdev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || res->parent)
-			continue;
-
-		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
-		/*
-		 * On PHB3, the minimum size alignment of M64 BAR in single
-		 * mode is 32MB.
-		 */
-		if (pdn->m64_single_mode && (size < SZ_32M))
-			goto truncate_iov;
-		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
-		res->end = res->start + size * mul - 1;
-		dev_dbg(&pdev->dev, "                       %pR\n", res);
-		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
-			 i, res, mul);
-	}
-	pdn->vfs_expanded = mul;
-
-	return;
-
-truncate_iov:
-	/* To save MMIO space, IOV BAR is truncated. */
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &pdev->resource[i + PCI_IOV_RESOURCES];
-		res->flags = 0;
-		res->end = res->start - 1;
-	}
-}
-
-static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
-{
-	if (WARN_ON(pci_dev_is_added(pdev)))
-		return;
-
-	if (pdev->is_virtfn) {
-		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
-
-		/*
-		 * VF PEs are single-device PEs so their pdev pointer needs to
-		 * be set. The pdev doesn't exist when the PE is allocated (in
-		 * (pcibios_sriov_enable()) so we fix it up here.
-		 */
-		pe->pdev = pdev;
-		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
-	} else if (pdev->is_physfn) {
-		/*
-		 * For PFs adjust their allocated IOV resources to match what
-		 * the PHB can support using it's M64 BAR table.
-		 */
-		pnv_pci_ioda_fixup_iov_resources(pdev);
-	}
-}
-#endif /* CONFIG_PCI_IOV */
-
 static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
 				  struct resource *res)
 {
@@ -3192,41 +2579,6 @@ static resource_size_t pnv_pci_default_alignment(void)
 	return PAGE_SIZE;
 }
 
-#ifdef CONFIG_PCI_IOV
-static resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
-						      int resno)
-{
-	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-	resource_size_t align;
-
-	/*
-	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
-	 * SR-IOV. While from hardware perspective, the range mapped by M64
-	 * BAR should be size aligned.
-	 *
-	 * When IOV BAR is mapped with M64 BAR in Single PE mode, the extra
-	 * powernv-specific hardware restriction is gone. But if just use the
-	 * VF BAR size as the alignment, PF BAR / VF BAR may be allocated with
-	 * in one segment of M64 #15, which introduces the PE conflict between
-	 * PF and VF. Based on this, the minimum alignment of an IOV BAR is
-	 * m64_segsize.
-	 *
-	 * This function returns the total IOV BAR size if M64 BAR is in
-	 * Shared PE mode or just VF BAR size if not.
-	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
-	 * M64 segment size if IOV BAR size is less.
-	 */
-	align = pci_iov_resource_size(pdev, resno);
-	if (!pdn->vfs_expanded)
-		return align;
-	if (pdn->m64_single_mode)
-		return max(align, (resource_size_t)phb->ioda.m64_segsize);
-
-	return pdn->vfs_expanded * align;
-}
-#endif /* CONFIG_PCI_IOV */
-
 /* Prevent enabling devices for which we couldn't properly
  * assign a PE
  */
@@ -3323,7 +2675,7 @@ static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
 	iommu_tce_table_put(tbl);
 }
 
-static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
+void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table *tbl = pe->table_group.tables[0];
 	int64_t rc;
@@ -3436,12 +2788,23 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
 
+	/* The VF PE state is torn down when sriov_disable() is called */
 	if (pdev->is_virtfn)
 		return;
 
 	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
 		return;
 
+#ifdef CONFIG_PCI_IOV
+	/*
+	 * FIXME: Try move this to sriov_disable(). It's here since we allocate
+	 * the iov state at probe time since we need to fiddle with the IOV
+	 * resources.
+	 */
+	if (pdev->is_physfn)
+		kfree(pdev->dev.archdata.iov_data);
+#endif
+
 	/*
 	 * PCI hotplug can happen as part of EEH error recovery. The @pdn
 	 * isn't removed and added afterwards in this scenario. We should
diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
new file mode 100644
index 000000000000..080ea39f5a83
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -0,0 +1,642 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/ioport.h>
+#include <linux/bitmap.h>
+#include <linux/pci.h>
+
+#include <asm/opal.h>
+
+#include "pci.h"
+
+/* for pci_dev_is_added() */
+#include "../../../../drivers/pci/pci.h"
+
+
+static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
+{
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
+	struct resource *res;
+	int i;
+	resource_size_t size, total_vf_bar_sz;
+	struct pnv_iov_data *iov;
+	int mul, total_vfs;
+
+	iov = kzalloc(sizeof(*iov), GFP_KERNEL);
+	if (!iov)
+		goto truncate_iov;
+	pdev->dev.archdata.iov_data = iov;
+
+	total_vfs = pci_sriov_get_totalvfs(pdev);
+	mul = phb->ioda.total_pe_num;
+	total_vf_bar_sz = 0;
+
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &pdev->resource[i + PCI_IOV_RESOURCES];
+		if (!res->flags || res->parent)
+			continue;
+		if (!pnv_pci_is_m64_flags(res->flags)) {
+			dev_warn(&pdev->dev, "Don't support SR-IOV with"
+					" non M64 VF BAR%d: %pR. \n",
+				 i, res);
+			goto truncate_iov;
+		}
+
+		total_vf_bar_sz += pci_iov_resource_size(pdev,
+				i + PCI_IOV_RESOURCES);
+
+		/*
+		 * If bigger than quarter of M64 segment size, just round up
+		 * power of two.
+		 *
+		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
+		 * with other devices, IOV BAR size is expanded to be
+		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
+		 * segment size , the expanded size would equal to half of the
+		 * whole M64 space size, which will exhaust the M64 Space and
+		 * limit the system flexibility.  This is a design decision to
+		 * set the boundary to quarter of the M64 segment size.
+		 */
+		if (total_vf_bar_sz > gate) {
+			mul = roundup_pow_of_two(total_vfs);
+			dev_info(&pdev->dev,
+				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
+				total_vf_bar_sz, gate, mul);
+			iov->m64_single_mode = true;
+			break;
+		}
+	}
+
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &pdev->resource[i + PCI_IOV_RESOURCES];
+		if (!res->flags || res->parent)
+			continue;
+
+		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
+		/*
+		 * On PHB3, the minimum size alignment of M64 BAR in single
+		 * mode is 32MB.
+		 */
+		if (iov->m64_single_mode && (size < SZ_32M))
+			goto truncate_iov;
+		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
+		res->end = res->start + size * mul - 1;
+		dev_dbg(&pdev->dev, "                       %pR\n", res);
+		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
+			 i, res, mul);
+	}
+	iov->vfs_expanded = mul;
+
+	return;
+
+truncate_iov:
+	/* To save MMIO space, IOV BAR is truncated. */
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &pdev->resource[i + PCI_IOV_RESOURCES];
+		res->flags = 0;
+		res->end = res->start - 1;
+	}
+
+	pdev->dev.archdata.iov_data = NULL;
+	kfree(iov);
+}
+
+void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
+{
+	if (WARN_ON(pci_dev_is_added(pdev)))
+		return;
+
+	if (pdev->is_virtfn) {
+		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
+
+		/*
+		 * VF PEs are single-device PEs so their pdev pointer needs to
+		 * be set. The pdev doesn't exist when the PE is allocated (in
+		 * (pcibios_sriov_enable()) so we fix it up here.
+		 */
+		pe->pdev = pdev;
+		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
+	} else if (pdev->is_physfn) {
+		/*
+		 * For PFs adjust their allocated IOV resources to match what
+		 * the PHB can support using it's M64 BAR table.
+		 */
+		pnv_pci_ioda_fixup_iov_resources(pdev);
+	}
+}
+
+resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
+						      int resno)
+{
+	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
+	struct pnv_iov_data *iov = pnv_iov_get(pdev);
+	resource_size_t align;
+
+	/*
+	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
+	 * SR-IOV. While from hardware perspective, the range mapped by M64
+	 * BAR should be size aligned.
+	 *
+	 * When IOV BAR is mapped with M64 BAR in Single PE mode, the extra
+	 * powernv-specific hardware restriction is gone. But if just use the
+	 * VF BAR size as the alignment, PF BAR / VF BAR may be allocated with
+	 * in one segment of M64 #15, which introduces the PE conflict between
+	 * PF and VF. Based on this, the minimum alignment of an IOV BAR is
+	 * m64_segsize.
+	 *
+	 * This function returns the total IOV BAR size if M64 BAR is in
+	 * Shared PE mode or just VF BAR size if not.
+	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
+	 * M64 segment size if IOV BAR size is less.
+	 */
+	align = pci_iov_resource_size(pdev, resno);
+
+	/*
+	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
+	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
+	 * In that case we don't allow VFs to be enabled so just return the
+	 * default alignment.
+	 */
+	if (!iov)
+		return align;
+	if (!iov->vfs_expanded)
+		return align;
+	if (iov->m64_single_mode)
+		return max(align, (resource_size_t)phb->ioda.m64_segsize);
+
+	return iov->vfs_expanded * align;
+}
+
+static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
+{
+	struct pnv_iov_data   *iov;
+	struct pnv_phb        *phb;
+	int                    i, j;
+	int                    m64_bars;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+	iov = pnv_iov_get(pdev);
+
+	if (iov->m64_single_mode)
+		m64_bars = num_vfs;
+	else
+		m64_bars = 1;
+
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
+		for (j = 0; j < m64_bars; j++) {
+			if (iov->m64_map[j][i] == IODA_INVALID_M64)
+				continue;
+			opal_pci_phb_mmio_enable(phb->opal_id,
+				OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 0);
+			clear_bit(iov->m64_map[j][i], &phb->ioda.m64_bar_alloc);
+			iov->m64_map[j][i] = IODA_INVALID_M64;
+		}
+
+	kfree(iov->m64_map);
+	return 0;
+}
+
+static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
+{
+	struct pnv_iov_data   *iov;
+	struct pnv_phb        *phb;
+	unsigned int           win;
+	struct resource       *res;
+	int                    i, j;
+	int64_t                rc;
+	int                    total_vfs;
+	resource_size_t        size, start;
+	int                    pe_num;
+	int                    m64_bars;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+	iov = pnv_iov_get(pdev);
+	total_vfs = pci_sriov_get_totalvfs(pdev);
+
+	if (iov->m64_single_mode)
+		m64_bars = num_vfs;
+	else
+		m64_bars = 1;
+
+	iov->m64_map = kmalloc_array(m64_bars,
+				     sizeof(*iov->m64_map),
+				     GFP_KERNEL);
+	if (!iov->m64_map)
+		return -ENOMEM;
+	/* Initialize the m64_map to IODA_INVALID_M64 */
+	for (i = 0; i < m64_bars ; i++)
+		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
+			iov->m64_map[i][j] = IODA_INVALID_M64;
+
+
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &pdev->resource[i + PCI_IOV_RESOURCES];
+		if (!res->flags || !res->parent)
+			continue;
+
+		for (j = 0; j < m64_bars; j++) {
+			do {
+				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
+						phb->ioda.m64_bar_idx + 1, 0);
+
+				if (win >= phb->ioda.m64_bar_idx + 1)
+					goto m64_failed;
+			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
+
+			iov->m64_map[j][i] = win;
+
+			if (iov->m64_single_mode) {
+				size = pci_iov_resource_size(pdev,
+							PCI_IOV_RESOURCES + i);
+				start = res->start + size * j;
+			} else {
+				size = resource_size(res);
+				start = res->start;
+			}
+
+			/* Map the M64 here */
+			if (iov->m64_single_mode) {
+				pe_num = iov->pe_num_map[j];
+				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
+						pe_num, OPAL_M64_WINDOW_TYPE,
+						iov->m64_map[j][i], 0);
+			}
+
+			rc = opal_pci_set_phb_mem_window(phb->opal_id,
+						 OPAL_M64_WINDOW_TYPE,
+						 iov->m64_map[j][i],
+						 start,
+						 0, /* unused */
+						 size);
+
+
+			if (rc != OPAL_SUCCESS) {
+				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
+					win, rc);
+				goto m64_failed;
+			}
+
+			if (iov->m64_single_mode)
+				rc = opal_pci_phb_mmio_enable(phb->opal_id,
+				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 2);
+			else
+				rc = opal_pci_phb_mmio_enable(phb->opal_id,
+				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 1);
+
+			if (rc != OPAL_SUCCESS) {
+				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
+					win, rc);
+				goto m64_failed;
+			}
+		}
+	}
+	return 0;
+
+m64_failed:
+	pnv_pci_vf_release_m64(pdev, num_vfs);
+	return -EBUSY;
+}
+
+static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
+{
+	struct pnv_phb        *phb;
+	struct pnv_ioda_pe    *pe, *pe_n;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+
+	if (!pdev->is_physfn)
+		return;
+
+	/* FIXME: Use pnv_ioda_release_pe()? */
+	list_for_each_entry_safe(pe, pe_n, &phb->ioda.pe_list, list) {
+		if (pe->parent_dev != pdev)
+			continue;
+
+		pnv_pci_ioda2_release_pe_dma(pe);
+
+		/* Remove from list */
+		mutex_lock(&phb->ioda.pe_list_mutex);
+		list_del(&pe->list);
+		mutex_unlock(&phb->ioda.pe_list_mutex);
+
+		pnv_ioda_deconfigure_pe(phb, pe);
+
+		pnv_ioda_free_pe(pe);
+	}
+}
+
+static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
+{
+	struct resource *res, res2;
+	struct pnv_iov_data *iov;
+	resource_size_t size;
+	u16 num_vfs;
+	int i;
+
+	if (!dev->is_physfn)
+		return -EINVAL;
+	iov = pnv_iov_get(dev);
+
+	/*
+	 * "offset" is in VFs.  The M64 windows are sized so that when they
+	 * are segmented, each segment is the same size as the IOV BAR.
+	 * Each segment is in a separate PE, and the high order bits of the
+	 * address are the PE number.  Therefore, each VF's BAR is in a
+	 * separate PE, and changing the IOV BAR start address changes the
+	 * range of PEs the VFs are in.
+	 */
+	num_vfs = iov->num_vfs;
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		if (!res->flags || !res->parent)
+			continue;
+
+		/*
+		 * The actual IOV BAR range is determined by the start address
+		 * and the actual size for num_vfs VFs BAR.  This check is to
+		 * make sure that after shifting, the range will not overlap
+		 * with another device.
+		 */
+		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		res2.flags = res->flags;
+		res2.start = res->start + (size * offset);
+		res2.end = res2.start + (size * num_vfs) - 1;
+
+		if (res2.end > res->end) {
+			dev_err(&dev->dev, "VF BAR%d: %pR would extend past %pR (trying to enable %d VFs shifted by %d)\n",
+				i, &res2, res, num_vfs, offset);
+			return -EBUSY;
+		}
+	}
+
+	/*
+	 * Since M64 BAR shares segments among all possible 256 PEs,
+	 * we have to shift the beginning of PF IOV BAR to make it start from
+	 * the segment which belongs to the PE number assigned to the first VF.
+	 * This creates a "hole" in the /proc/iomem which could be used for
+	 * allocating other resources so we reserve this area below and
+	 * release when IOV is released.
+	 */
+	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
+		res = &dev->resource[i + PCI_IOV_RESOURCES];
+		if (!res->flags || !res->parent)
+			continue;
+
+		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
+		res2 = *res;
+		res->start += size * offset;
+
+		dev_info(&dev->dev, "VF BAR%d: %pR shifted to %pR (%sabling %d VFs shifted by %d)\n",
+			 i, &res2, res, (offset > 0) ? "En" : "Dis",
+			 num_vfs, offset);
+
+		if (offset < 0) {
+			devm_release_resource(&dev->dev, &iov->holes[i]);
+			memset(&iov->holes[i], 0, sizeof(iov->holes[i]));
+		}
+
+		pci_update_resource(dev, i + PCI_IOV_RESOURCES);
+
+		if (offset > 0) {
+			iov->holes[i].start = res2.start;
+			iov->holes[i].end = res2.start + size * offset - 1;
+			iov->holes[i].flags = IORESOURCE_BUS;
+			iov->holes[i].name = "pnv_iov_reserved";
+			devm_request_resource(&dev->dev, res->parent,
+					&iov->holes[i]);
+		}
+	}
+	return 0;
+}
+
+static void pnv_pci_sriov_disable(struct pci_dev *pdev)
+{
+	struct pnv_phb        *phb;
+	struct pnv_ioda_pe    *pe;
+	struct pnv_iov_data   *iov;
+	u16                    num_vfs, i;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+	iov = pnv_iov_get(pdev);
+	num_vfs = iov->num_vfs;
+
+	/* Release VF PEs */
+	pnv_ioda_release_vf_PE(pdev);
+
+	if (phb->type == PNV_PHB_IODA2) {
+		if (!iov->m64_single_mode)
+			pnv_pci_vf_resource_shift(pdev, -*iov->pe_num_map);
+
+		/* Release M64 windows */
+		pnv_pci_vf_release_m64(pdev, num_vfs);
+
+		/* Release PE numbers */
+		if (iov->m64_single_mode) {
+			for (i = 0; i < num_vfs; i++) {
+				if (iov->pe_num_map[i] == IODA_INVALID_PE)
+					continue;
+
+				pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
+				pnv_ioda_free_pe(pe);
+			}
+		} else
+			bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
+		/* Releasing pe_num_map */
+		kfree(iov->pe_num_map);
+	}
+}
+
+static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
+{
+	struct pnv_phb        *phb;
+	struct pnv_ioda_pe    *pe;
+	int                    pe_num;
+	u16                    vf_index;
+	struct pnv_iov_data   *iov;
+	struct pci_dn         *pdn;
+
+	if (!pdev->is_physfn)
+		return;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+	pdn = pci_get_pdn(pdev);
+	iov = pnv_iov_get(pdev);
+
+	/* Reserve PE for each VF */
+	for (vf_index = 0; vf_index < num_vfs; vf_index++) {
+		int vf_devfn = pci_iov_virtfn_devfn(pdev, vf_index);
+		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
+		struct pci_dn *vf_pdn;
+
+		if (iov->m64_single_mode)
+			pe_num = iov->pe_num_map[vf_index];
+		else
+			pe_num = *iov->pe_num_map + vf_index;
+
+		pe = &phb->ioda.pe_array[pe_num];
+		pe->pe_number = pe_num;
+		pe->phb = phb;
+		pe->flags = PNV_IODA_PE_VF;
+		pe->pbus = NULL;
+		pe->parent_dev = pdev;
+		pe->mve_number = -1;
+		pe->rid = (vf_bus << 8) | vf_devfn;
+
+		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
+			pci_domain_nr(pdev->bus), pdev->bus->number,
+			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
+
+		if (pnv_ioda_configure_pe(phb, pe)) {
+			/* XXX What do we do here ? */
+			pnv_ioda_free_pe(pe);
+			pe->pdev = NULL;
+			continue;
+		}
+
+		/* Put PE to the list */
+		mutex_lock(&phb->ioda.pe_list_mutex);
+		list_add_tail(&pe->list, &phb->ioda.pe_list);
+		mutex_unlock(&phb->ioda.pe_list_mutex);
+
+		/* associate this pe to it's pdn */
+		list_for_each_entry(vf_pdn, &pdn->parent->child_list, list) {
+			if (vf_pdn->busno == vf_bus &&
+			    vf_pdn->devfn == vf_devfn) {
+				vf_pdn->pe_number = pe_num;
+				break;
+			}
+		}
+
+		pnv_pci_ioda2_setup_dma_pe(phb, pe);
+	}
+}
+
+static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+{
+	struct pnv_iov_data   *iov;
+	struct pnv_phb        *phb;
+	struct pnv_ioda_pe    *pe;
+	int                    ret;
+	u16                    i;
+
+	phb = pci_bus_to_pnvhb(pdev->bus);
+	iov = pnv_iov_get(pdev);
+
+	if (phb->type == PNV_PHB_IODA2) {
+		if (!iov->vfs_expanded) {
+			dev_info(&pdev->dev, "don't support this SRIOV device"
+				" with non 64bit-prefetchable IOV BAR\n");
+			return -ENOSPC;
+		}
+
+		/*
+		 * When M64 BARs functions in Single PE mode, the number of VFs
+		 * could be enabled must be less than the number of M64 BARs.
+		 */
+		if (iov->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
+			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
+			return -EBUSY;
+		}
+
+		/* Allocating pe_num_map */
+		if (iov->m64_single_mode)
+			iov->pe_num_map = kmalloc_array(num_vfs,
+							sizeof(*iov->pe_num_map),
+							GFP_KERNEL);
+		else
+			iov->pe_num_map = kmalloc(sizeof(*iov->pe_num_map), GFP_KERNEL);
+
+		if (!iov->pe_num_map)
+			return -ENOMEM;
+
+		if (iov->m64_single_mode)
+			for (i = 0; i < num_vfs; i++)
+				iov->pe_num_map[i] = IODA_INVALID_PE;
+
+		/* Calculate available PE for required VFs */
+		if (iov->m64_single_mode) {
+			for (i = 0; i < num_vfs; i++) {
+				pe = pnv_ioda_alloc_pe(phb);
+				if (!pe) {
+					ret = -EBUSY;
+					goto m64_failed;
+				}
+
+				iov->pe_num_map[i] = pe->pe_number;
+			}
+		} else {
+			mutex_lock(&phb->ioda.pe_alloc_mutex);
+			*iov->pe_num_map = bitmap_find_next_zero_area(
+				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
+				0, num_vfs, 0);
+			if (*iov->pe_num_map >= phb->ioda.total_pe_num) {
+				mutex_unlock(&phb->ioda.pe_alloc_mutex);
+				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
+				kfree(iov->pe_num_map);
+				return -EBUSY;
+			}
+			bitmap_set(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
+			mutex_unlock(&phb->ioda.pe_alloc_mutex);
+		}
+		iov->num_vfs = num_vfs;
+
+		/* Assign M64 window accordingly */
+		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
+		if (ret) {
+			dev_info(&pdev->dev, "Not enough M64 window resources\n");
+			goto m64_failed;
+		}
+
+		/*
+		 * When using one M64 BAR to map one IOV BAR, we need to shift
+		 * the IOV BAR according to the PE# allocated to the VFs.
+		 * Otherwise, the PE# for the VF will conflict with others.
+		 */
+		if (!iov->m64_single_mode) {
+			ret = pnv_pci_vf_resource_shift(pdev, *iov->pe_num_map);
+			if (ret)
+				goto m64_failed;
+		}
+	}
+
+	/* Setup VF PEs */
+	pnv_ioda_setup_vf_PE(pdev, num_vfs);
+
+	return 0;
+
+m64_failed:
+	if (iov->m64_single_mode) {
+		for (i = 0; i < num_vfs; i++) {
+			if (iov->pe_num_map[i] == IODA_INVALID_PE)
+				continue;
+
+			pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
+			pnv_ioda_free_pe(pe);
+		}
+	} else
+		bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
+
+	/* Releasing pe_num_map */
+	kfree(iov->pe_num_map);
+
+	return ret;
+}
+
+int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
+{
+	pnv_pci_sriov_disable(pdev);
+
+	/* Release PCI data */
+	remove_sriov_vf_pdns(pdev);
+	return 0;
+}
+
+int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
+{
+	/* Allocate PCI data */
+	add_sriov_vf_pdns(pdev);
+
+	return pnv_pci_sriov_enable(pdev, num_vfs);
+}
+
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 6aa6aefb637d..0156d7d17f7d 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -194,6 +194,80 @@ struct pnv_phb {
 	u8			*diag_data;
 };
 
+
+/* IODA PE management */
+
+static inline bool pnv_pci_is_m64(struct pnv_phb *phb, struct resource *r)
+{
+	/*
+	 * WARNING: We cannot rely on the resource flags. The Linux PCI
+	 * allocation code sometimes decides to put a 64-bit prefetchable
+	 * BAR in the 32-bit window, so we have to compare the addresses.
+	 *
+	 * For simplicity we only test resource start.
+	 */
+	return (r->start >= phb->ioda.m64_base &&
+		r->start < (phb->ioda.m64_base + phb->ioda.m64_size));
+}
+
+static inline bool pnv_pci_is_m64_flags(unsigned long resource_flags)
+{
+	unsigned long flags = (IORESOURCE_MEM_64 | IORESOURCE_PREFETCH);
+
+	return (resource_flags & flags) == flags;
+}
+
+int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
+int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
+
+void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
+void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
+
+struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb);
+void pnv_ioda_free_pe(struct pnv_ioda_pe *pe);
+
+#ifdef CONFIG_PCI_IOV
+/*
+ * For SR-IOV we want to put each VF's MMIO resource in to a separate PE.
+ * This requires a bit of acrobatics with the MMIO -> PE configuration
+ * and this structure is used to keep track of it all.
+ */
+struct pnv_iov_data {
+	/* number of VFs IOV BAR expanded. FIXME: rename this to something less bad */
+	u16     vfs_expanded;
+
+	/* number of VFs enabled */
+	u16     num_vfs;
+	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
+
+	/* Did we map the VF BARs with single-PE IODA BARs? */
+	bool    m64_single_mode;
+
+	int     (*m64_map)[PCI_SRIOV_NUM_BARS];
+#define IODA_INVALID_M64        (-1)
+
+	/*
+	 * If we map the SR-IOV BARs with a segmented window then
+	 * parts of that window will be "claimed" by other PEs.
+	 *
+	 * "holes" here is used to reserve the leading portion
+	 * of the window that is used by other (non VF) PEs.
+	 */
+	struct resource holes[PCI_SRIOV_NUM_BARS];
+};
+
+static inline struct pnv_iov_data *pnv_iov_get(struct pci_dev *pdev)
+{
+	return pdev->dev.archdata.iov_data;
+}
+
+void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev);
+resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev, int resno);
+
+int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs);
+int pnv_pcibios_sriov_disable(struct pci_dev *pdev);
+#endif /* CONFIG_PCI_IOV */
+
 extern struct pci_ops pnv_pci_ops;
 
 void pnv_pci_dump_phb_diag_data(struct pci_controller *hose,
-- 
2.26.2

