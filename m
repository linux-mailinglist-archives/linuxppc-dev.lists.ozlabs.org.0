Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D299D229218
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:27:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRr515b3zDqNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:27:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=baF9Gsbh; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBRB236fNzDqw9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:58:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g67so690784pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JOM6RKmhGC8xksQhcfeat+pOB/Cl07/L2Xe4srt3kGI=;
 b=baF9GsbhbMYNtpKFxNbugAuGdLzP5EZ5GfQOGntUbpGEUJMil84gmd0IjdjMW+syy8
 0CnWHUGJnP9mwrhMGey0YFGh4d42gjpc10zfnMODW11tqxM2nusx/DG7pfZBiXJ/pGPm
 U33b7pHen0JSEJX4uCNP7IehgEwhezGW7Xx5xioLGDGIPmh6euDSR7ymc6foJZoW9lh7
 ol3XKTt4q94Yxq/+NGpPV8l2cG7WsncqBU6kRMtTTg8TLeI2LkU4j3UdV/2gOPlywcFk
 AH8J/oaaY9hpWJ1hLoSu5TCXBNCsHSN2WDrmKt+czTO6FgfjV9kBs0+ZZQhmspPKfcCx
 /YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOM6RKmhGC8xksQhcfeat+pOB/Cl07/L2Xe4srt3kGI=;
 b=bhQjbKqYZigr7r2xFbeSmEBaMF/FcHjFsCh9Oh31rkFZcIUaRhZYQjOxrwbKlVOCBO
 h4dZ158X9XAgFsLTYyYKkHPLwNWKvSUFSi4jNSAu6o1Z2D2h2Q3Dy1fT8+Yz/J9NzUL5
 Ex9UawfGiS9CdZgQPiCvtu95obiC8bLli9iLwsEhyIOhDL4bWoMiV1FQKweSiOBhxVXm
 RoOjFSF5z1ljHNt4DZGG4BMK5DmwP5jXW3YXF+y2GSC+Eg/fUvDwmYw8DgHw231GfMcn
 BTjh8mLSdR7zKPdxeeoHzIwKr9+XwwIUo4jVHcDgeGCaRfDSQ9uF6aYbDWtGhhxSEPY4
 q/rw==
X-Gm-Message-State: AOAM530RI8y4gEUUf1CV/+cKQkpcBfZXJZNTOo1BuKdcXqV6hJRDf06D
 znmKnTK7PwPbT0K7BRD34/b4VMfuP8Y=
X-Google-Smtp-Source: ABdhPJw0BAA0NkfNqI8MgoesPVaPl0pdWS3xKLRf8r+9fLRvWmLtUpR8GRYduPiMLMd2XZJKBQ918w==
X-Received: by 2002:aa7:955a:: with SMTP id w26mr28145936pfq.137.1595401079170; 
 Tue, 21 Jul 2020 23:57:59 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 15/16] powerpc/powernv/sriov: Make single PE mode a per-BAR
 setting
Date: Wed, 22 Jul 2020 16:57:14 +1000
Message-Id: <20200722065715.1432738-15-oohall@gmail.com>
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

Using single PE BARs to map an SR-IOV BAR is really a choice about what
strategy to use when mapping a BAR. It doesn't make much sense for this to
be a global setting since a device might have one large BAR which needs to
be mapped with single PE windows and another smaller BAR that can be mapped
with a regular segmented window. Make the segmented vs single decision a
per-BAR setting and clean up the logic that decides which mode to use.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Dropped unused total_vfs variables in pnv_pci_ioda_fixup_iov_resources()
    Dropped bar_no from pnv_pci_iov_resource_alignment()
    Minor re-wording of comments.
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 131 ++++++++++-----------
 arch/powerpc/platforms/powernv/pci.h       |  11 +-
 2 files changed, 73 insertions(+), 69 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index ce8ad6851d73..76215d01405b 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -146,21 +146,17 @@
 static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 {
 	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
-	const resource_size_t gate = phb->ioda.m64_segsize >> 2;
 	struct resource *res;
 	int i;
-	resource_size_t size, total_vf_bar_sz;
+	resource_size_t vf_bar_sz;
 	struct pnv_iov_data *iov;
-	int mul, total_vfs;
+	int mul;
 
 	iov = kzalloc(sizeof(*iov), GFP_KERNEL);
 	if (!iov)
 		goto disable_iov;
 	pdev->dev.archdata.iov_data = iov;
-
-	total_vfs = pci_sriov_get_totalvfs(pdev);
 	mul = phb->ioda.total_pe_num;
-	total_vf_bar_sz = 0;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		res = &pdev->resource[i + PCI_IOV_RESOURCES];
@@ -173,50 +169,50 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 			goto disable_iov;
 		}
 
-		total_vf_bar_sz += pci_iov_resource_size(pdev,
-				i + PCI_IOV_RESOURCES);
+		vf_bar_sz = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
 
 		/*
-		 * If bigger than quarter of M64 segment size, just round up
-		 * power of two.
+		 * Generally, one segmented M64 BAR maps one IOV BAR. However,
+		 * if a VF BAR is too large we end up wasting a lot of space.
+		 * If each VF needs more than 1/4 of the default m64 segment
+		 * then each VF BAR should be mapped in single-PE mode to reduce
+		 * the amount of space required. This does however limit the
+		 * number of VFs we can support.
 		 *
-		 * Generally, one M64 BAR maps one IOV BAR. To avoid conflict
-		 * with other devices, IOV BAR size is expanded to be
-		 * (total_pe * VF_BAR_size).  When VF_BAR_size is half of M64
-		 * segment size , the expanded size would equal to half of the
-		 * whole M64 space size, which will exhaust the M64 Space and
-		 * limit the system flexibility.  This is a design decision to
-		 * set the boundary to quarter of the M64 segment size.
+		 * The 1/4 limit is arbitrary and can be tweaked.
 		 */
-		if (total_vf_bar_sz > gate) {
-			mul = roundup_pow_of_two(total_vfs);
-			dev_info(&pdev->dev,
-				"VF BAR Total IOV size %llx > %llx, roundup to %d VFs\n",
-				total_vf_bar_sz, gate, mul);
-			iov->m64_single_mode = true;
-			break;
-		}
-	}
+		if (vf_bar_sz > (phb->ioda.m64_segsize >> 2)) {
+			/*
+			 * On PHB3, the minimum size alignment of M64 BAR in
+			 * single mode is 32MB. If this VF BAR is smaller than
+			 * 32MB, but still too large for a segmented window
+			 * then we can't map it and need to disable SR-IOV for
+			 * this device.
+			 */
+			if (vf_bar_sz < SZ_32M) {
+				pci_err(pdev, "VF BAR%d: %pR can't be mapped in single PE mode\n",
+					i, res);
+				goto disable_iov;
+			}
 
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
-		res = &pdev->resource[i + PCI_IOV_RESOURCES];
-		if (!res->flags || res->parent)
+			iov->m64_single_mode[i] = true;
 			continue;
+		}
 
-		size = pci_iov_resource_size(pdev, i + PCI_IOV_RESOURCES);
 		/*
-		 * On PHB3, the minimum size alignment of M64 BAR in single
-		 * mode is 32MB.
+		 * This BAR can be mapped with one segmented window, so adjust
+		 * te resource size to accommodate.
 		 */
-		if (iov->m64_single_mode && (size < SZ_32M))
-			goto disable_iov;
+		pci_dbg(pdev, " Fixing VF BAR%d: %pR to\n", i, res);
+		res->end = res->start + vf_bar_sz * mul - 1;
+		pci_dbg(pdev, "                       %pR\n", res);
 
-		dev_dbg(&pdev->dev, " Fixing VF BAR%d: %pR to\n", i, res);
-		res->end = res->start + size * mul - 1;
-		dev_dbg(&pdev->dev, "                       %pR\n", res);
-		dev_info(&pdev->dev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
+		pci_info(pdev, "VF BAR%d: %pR (expanded to %d VFs for PE alignment)",
 			 i, res, mul);
+
+		iov->need_shift = true;
 	}
+
 	iov->vfs_expanded = mul;
 
 	return;
@@ -260,42 +256,40 @@ void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
 resource_size_t pnv_pci_iov_resource_alignment(struct pci_dev *pdev,
 						      int resno)
 {
-	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pnv_iov_data *iov = pnv_iov_get(pdev);
 	resource_size_t align;
 
+	/*
+	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
+	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
+	 * In that case we don't allow VFs to be enabled since one of their
+	 * BARs would not be placed in the correct PE.
+	 */
+	if (!iov)
+		return align;
+	if (!iov->vfs_expanded)
+		return align;
+
+	align = pci_iov_resource_size(pdev, resno);
+
+	/*
+	 * If we're using single mode then we can just use the native VF BAR
+	 * alignment. We validated that it's possible to use a single PE
+	 * window above when we did the fixup.
+	 */
+	if (iov->m64_single_mode[resno - PCI_IOV_RESOURCES])
+		return align;
+
 	/*
 	 * On PowerNV platform, IOV BAR is mapped by M64 BAR to enable the
 	 * SR-IOV. While from hardware perspective, the range mapped by M64
 	 * BAR should be size aligned.
 	 *
-	 * When IOV BAR is mapped with M64 BAR in Single PE mode, the extra
-	 * powernv-specific hardware restriction is gone. But if just use the
-	 * VF BAR size as the alignment, PF BAR / VF BAR may be allocated with
-	 * in one segment of M64 #15, which introduces the PE conflict between
-	 * PF and VF. Based on this, the minimum alignment of an IOV BAR is
-	 * m64_segsize.
-	 *
 	 * This function returns the total IOV BAR size if M64 BAR is in
 	 * Shared PE mode or just VF BAR size if not.
 	 * If the M64 BAR is in Single PE mode, return the VF BAR size or
 	 * M64 segment size if IOV BAR size is less.
 	 */
-	align = pci_iov_resource_size(pdev, resno);
-
-	/*
-	 * iov can be null if we have an SR-IOV device with IOV BAR that can't
-	 * be placed in the m64 space (i.e. The BAR is 32bit or non-prefetch).
-	 * In that case we don't allow VFs to be enabled so just return the
-	 * default alignment.
-	 */
-	if (!iov)
-		return align;
-	if (!iov->vfs_expanded)
-		return align;
-	if (iov->m64_single_mode)
-		return max(align, (resource_size_t)phb->ioda.m64_segsize);
-
 	return iov->vfs_expanded * align;
 }
 
@@ -450,7 +444,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 			continue;
 
 		/* don't need single mode? map everything in one go! */
-		if (!iov->m64_single_mode) {
+		if (!iov->m64_single_mode[i]) {
 			win = pnv_pci_alloc_m64_bar(phb, iov);
 			if (win < 0)
 				goto m64_failed;
@@ -543,6 +537,8 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 		res = &dev->resource[i + PCI_IOV_RESOURCES];
 		if (!res->flags || !res->parent)
 			continue;
+		if (iov->m64_single_mode[i])
+			continue;
 
 		/*
 		 * The actual IOV BAR range is determined by the start address
@@ -574,6 +570,8 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 		res = &dev->resource[i + PCI_IOV_RESOURCES];
 		if (!res->flags || !res->parent)
 			continue;
+		if (iov->m64_single_mode[i])
+			continue;
 
 		size = pci_iov_resource_size(dev, i + PCI_IOV_RESOURCES);
 		res2 = *res;
@@ -619,8 +617,8 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
 	/* Release VF PEs */
 	pnv_ioda_release_vf_PE(pdev);
 
-	/* Un-shift the IOV BAR resources */
-	if (!iov->m64_single_mode)
+	/* Un-shift the IOV BARs if we need to */
+	if (iov->need_shift)
 		pnv_pci_vf_resource_shift(pdev, -base_pe);
 
 	/* Release M64 windows */
@@ -738,9 +736,8 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 	 * the IOV BAR according to the PE# allocated to the VFs.
 	 * Otherwise, the PE# for the VF will conflict with others.
 	 */
-	if (!iov->m64_single_mode) {
-		ret = pnv_pci_vf_resource_shift(pdev,
-						base_pe->pe_number);
+	if (iov->need_shift) {
+		ret = pnv_pci_vf_resource_shift(pdev, base_pe->pe_number);
 		if (ret)
 			goto shift_failed;
 	}
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 41a6f4e938e4..902e928c7c22 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -243,8 +243,15 @@ struct pnv_iov_data {
 	/* pointer to the array of VF PEs. num_vfs long*/
 	struct pnv_ioda_pe *vf_pe_arr;
 
-	/* Did we map the VF BARs with single-PE IODA BARs? */
-	bool    m64_single_mode;
+	/* Did we map the VF BAR with single-PE IODA BARs? */
+	bool    m64_single_mode[PCI_SRIOV_NUM_BARS];
+
+	/*
+	 * True if we're using any segmented windows. In that case we need
+	 * shift the start of the IOV resource the segment corresponding to
+	 * the allocated PE.
+	 */
+	bool    need_shift;
 
 	/*
 	 * Bit mask used to track which m64 windows are used to map the
-- 
2.26.2

