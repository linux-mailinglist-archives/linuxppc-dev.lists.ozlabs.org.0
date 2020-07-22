Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4689E2291FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:20:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRgS5jyLzDqng
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:20:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=crqusWbR; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9r6zCbzDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:52 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id cv18so2467900pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hO+2WIHTQM3BvDNG7v5/SZMe2HFUf9RBriHjej/BGr0=;
 b=crqusWbR1wdXh5GCLB7p5pneeXss35sLO+hbl999b0rutyYgXOPYG53brBjPNQ+jya
 mqVIn4OsVzU4novFV5t5A7RIIJ0z6yMZZX4+ngzy+IAWEfjGcgkcQq+eOzbHFLWx+kdf
 ybFbreiIV/1NBmPTG9cWTWO8z71BcUU9mO+twyEnqgR6SS30K1r0II63kwoZFmIOauz4
 liKWreWxVEJUNfOFaaA5zxR83CKh2N5Anss/gLbrK6IKQm6Ri7swZyEhWIPhKMj3Epe0
 3QfOzglyex5D+RmtyToN1a+wXiS8p/iah176/v8CJDn7g7uo/B+bBKVj0WwBWKgASPRV
 BF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hO+2WIHTQM3BvDNG7v5/SZMe2HFUf9RBriHjej/BGr0=;
 b=tuWLDDSd1OvrQI/77OmIjR8SVkmqR9428emSyUik1cdMAnuBah5EBGhtBz65P9rOVL
 Vtn4o1EPLo9wOtlwcyn4OvHj4nYwUkKbo/eOU7AyV0Zy9xNGUixSKrTazTDFd6X846n/
 6N+eQcpYT/PWxVAjGHHfoQpawLqwkNS8FPdN24XE6RNyCSIQYIVC3eI+Ca53TStaAgaj
 7HNvsDLDjKKvlpBAPGwotz37KXYfxeoVtZ+MiTI9SuJA47EmtRzQPtvBuOw2izxJyyoA
 XhxpuJ8G4gayQHFzCLF2BbkUHgm0v/8Ph8++6b3Dpja4MF8joP77xWD6XakjxEUSBC5/
 YYAA==
X-Gm-Message-State: AOAM531hEAe6WO6RvJoHJLWGkRM9LLocyf+02KaT4OzOK8oDNRsjpUA/
 kFU7XT6mU2tMNM5344puBq4ig+JJrPs=
X-Google-Smtp-Source: ABdhPJzkTyDJoE3V8nc48bI/RogLzr4M35DHFvBL48xeUAy3jN/Hsp2xrtt6e1e1hnvg4vBH66lTNg==
X-Received: by 2002:a17:902:d911:: with SMTP id
 c17mr24621094plz.227.1595401070588; 
 Tue, 21 Jul 2020 23:57:50 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:50 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/16] powerpc/powernv/sriov: Drop iov->pe_num_map[]
Date: Wed, 22 Jul 2020 16:57:10 +1000
Message-Id: <20200722065715.1432738-11-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the iov->pe_num_map[] does one of two things depending on
whether single PE mode is being used or not. When it is, this contains an
array which maps a vf_index to the corresponding PE number. When single PE
mode is not being used this contains a scalar which is the base PE for the
set of enabled VFs (for for VFn is base + n).

The array was necessary because when calling pnv_ioda_alloc_pe() there is
no guarantee that the allocated PEs would be contigious. We can now
allocate contigious blocks of PEs so this is no longer an issue. This
allows us to drop the if (single_mode) {} .. else {} block scattered
through the SR-IOV code which is a nice clean up.

This also fixes a bug in pnv_pci_sriov_disable() which is the non-atomic
bitmap_clear() to manipulate the PE allocation map. Other users of the map
assume it will be accessed with atomic ops.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: Added a note to the commit message about bitmap_clear()
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 109 +++++----------------
 arch/powerpc/platforms/powernv/pci.h       |   7 +-
 2 files changed, 28 insertions(+), 88 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index d90e11218add..5981323cd9a6 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -453,11 +453,13 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 
 
 			if (iov->m64_single_mode) {
+				int pe_num = iov->vf_pe_arr[j].pe_number;
+
 				size = pci_iov_resource_size(pdev,
 							PCI_IOV_RESOURCES + i);
 				start = res->start + size * j;
 				rc = pnv_ioda_map_m64_single(phb, win,
-							     iov->pe_num_map[j],
+							     pe_num,
 							     start,
 							     size);
 			} else {
@@ -596,38 +598,24 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 
 static void pnv_pci_sriov_disable(struct pci_dev *pdev)
 {
+	u16                    num_vfs, base_pe;
 	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
 	struct pnv_iov_data   *iov;
-	u16                    num_vfs, i;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
 	iov = pnv_iov_get(pdev);
 	num_vfs = iov->num_vfs;
+	base_pe = iov->vf_pe_arr[0].pe_number;
 
 	/* Release VF PEs */
 	pnv_ioda_release_vf_PE(pdev);
 
 	if (phb->type == PNV_PHB_IODA2) {
 		if (!iov->m64_single_mode)
-			pnv_pci_vf_resource_shift(pdev, -*iov->pe_num_map);
+			pnv_pci_vf_resource_shift(pdev, -base_pe);
 
 		/* Release M64 windows */
 		pnv_pci_vf_release_m64(pdev, num_vfs);
-
-		/* Release PE numbers */
-		if (iov->m64_single_mode) {
-			for (i = 0; i < num_vfs; i++) {
-				if (iov->pe_num_map[i] == IODA_INVALID_PE)
-					continue;
-
-				pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
-				pnv_ioda_free_pe(pe);
-			}
-		} else
-			bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
-		/* Releasing pe_num_map */
-		kfree(iov->pe_num_map);
 	}
 }
 
@@ -653,13 +641,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		int vf_bus = pci_iov_virtfn_bus(pdev, vf_index);
 		struct pci_dn *vf_pdn;
 
-		if (iov->m64_single_mode)
-			pe_num = iov->pe_num_map[vf_index];
-		else
-			pe_num = *iov->pe_num_map + vf_index;
-
-		pe = &phb->ioda.pe_array[pe_num];
-		pe->pe_number = pe_num;
+		pe = &iov->vf_pe_arr[vf_index];
 		pe->phb = phb;
 		pe->flags = PNV_IODA_PE_VF;
 		pe->pbus = NULL;
@@ -667,6 +649,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->mve_number = -1;
 		pe->rid = (vf_bus << 8) | vf_devfn;
 
+		pe_num = pe->pe_number;
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
 			pci_domain_nr(pdev->bus), pdev->bus->number,
 			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
@@ -698,9 +681,9 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
+	struct pnv_ioda_pe    *base_pe;
 	struct pnv_iov_data   *iov;
 	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
 	int                    ret;
 	u16                    i;
 
@@ -714,55 +697,14 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 			return -ENOSPC;
 		}
 
-		/*
-		 * When M64 BARs functions in Single PE mode, the number of VFs
-		 * could be enabled must be less than the number of M64 BARs.
-		 */
-		if (iov->m64_single_mode && num_vfs > phb->ioda.m64_bar_idx) {
-			dev_info(&pdev->dev, "Not enough M64 BAR for VFs\n");
+		/* allocate a contigious block of PEs for our VFs */
+		base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
+		if (!base_pe) {
+			pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
 			return -EBUSY;
 		}
 
-		/* Allocating pe_num_map */
-		if (iov->m64_single_mode)
-			iov->pe_num_map = kmalloc_array(num_vfs,
-							sizeof(*iov->pe_num_map),
-							GFP_KERNEL);
-		else
-			iov->pe_num_map = kmalloc(sizeof(*iov->pe_num_map), GFP_KERNEL);
-
-		if (!iov->pe_num_map)
-			return -ENOMEM;
-
-		if (iov->m64_single_mode)
-			for (i = 0; i < num_vfs; i++)
-				iov->pe_num_map[i] = IODA_INVALID_PE;
-
-		/* Calculate available PE for required VFs */
-		if (iov->m64_single_mode) {
-			for (i = 0; i < num_vfs; i++) {
-				pe = pnv_ioda_alloc_pe(phb);
-				if (!pe) {
-					ret = -EBUSY;
-					goto m64_failed;
-				}
-
-				iov->pe_num_map[i] = pe->pe_number;
-			}
-		} else {
-			mutex_lock(&phb->ioda.pe_alloc_mutex);
-			*iov->pe_num_map = bitmap_find_next_zero_area(
-				phb->ioda.pe_alloc, phb->ioda.total_pe_num,
-				0, num_vfs, 0);
-			if (*iov->pe_num_map >= phb->ioda.total_pe_num) {
-				mutex_unlock(&phb->ioda.pe_alloc_mutex);
-				dev_info(&pdev->dev, "Failed to enable VF%d\n", num_vfs);
-				kfree(iov->pe_num_map);
-				return -EBUSY;
-			}
-			bitmap_set(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
-			mutex_unlock(&phb->ioda.pe_alloc_mutex);
-		}
+		iov->vf_pe_arr = base_pe;
 		iov->num_vfs = num_vfs;
 
 		/* Assign M64 window accordingly */
@@ -778,9 +720,10 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 		 * Otherwise, the PE# for the VF will conflict with others.
 		 */
 		if (!iov->m64_single_mode) {
-			ret = pnv_pci_vf_resource_shift(pdev, *iov->pe_num_map);
+			ret = pnv_pci_vf_resource_shift(pdev,
+							base_pe->pe_number);
 			if (ret)
-				goto m64_failed;
+				goto shift_failed;
 		}
 	}
 
@@ -789,20 +732,12 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 
 	return 0;
 
-m64_failed:
-	if (iov->m64_single_mode) {
-		for (i = 0; i < num_vfs; i++) {
-			if (iov->pe_num_map[i] == IODA_INVALID_PE)
-				continue;
-
-			pe = &phb->ioda.pe_array[iov->pe_num_map[i]];
-			pnv_ioda_free_pe(pe);
-		}
-	} else
-		bitmap_clear(phb->ioda.pe_alloc, *iov->pe_num_map, num_vfs);
+shift_failed:
+	pnv_pci_vf_release_m64(pdev, num_vfs);
 
-	/* Releasing pe_num_map */
-	kfree(iov->pe_num_map);
+m64_failed:
+	for (i = 0; i < num_vfs; i++)
+		pnv_ioda_free_pe(&iov->vf_pe_arr[i]);
 
 	return ret;
 }
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 06431a452130..f76923f44f66 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -239,7 +239,12 @@ struct pnv_iov_data {
 
 	/* number of VFs enabled */
 	u16     num_vfs;
-	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
+
+	/*
+	 * Pointer to the IODA PE state of each VF. Note that this is a pointer
+	 * into the PHB's PE array (phb->ioda.pe_array).
+	 */
+	struct pnv_ioda_pe *vf_pe_arr;
 
 	/* Did we map the VF BARs with single-PE IODA BARs? */
 	bool    m64_single_mode;
-- 
2.26.2

