Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7B21AF04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32Hy2HGwzDqpy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oSfngKiD; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gX31qMzDrJC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:24 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id a6so7665967wmm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TBp/iCn0n7Y1l7vt8/uMkbtGvCDuCAapXCRyx2TQ8Cs=;
 b=oSfngKiDcKvwlkWCLvK0q3GIyo+tCITRdGcNP2sC31BnZGd4YQvS4PesDuzlWWodqX
 aFFHd4eViULTLwUgzlh/VQRYlcyFdAOYvnjg9b/+EHERQmxWbqjKS5hIpcgFRhuivLxq
 HG7RkeUcqSMH0zXSUX+R2nHKTAKaG2HELaL1SBx16e9s1ZStmk9QBRhQpjKrI3TmGEaG
 0/Ko7G1CtWgXbaao2dsF6JTVbDeSbrvNQYWq1mcDUqu5ry1lwl7duNynniah6A++/O86
 PqQUkXINRXvM/3g6uxIdSO9950qKbGH36/hJDaV61ec8XIteneaZzvuoCYMo8QXOz9QD
 2Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBp/iCn0n7Y1l7vt8/uMkbtGvCDuCAapXCRyx2TQ8Cs=;
 b=E6gzlGwlcU+ibGefzRHFeWoX0ZlYe4RcNINeVw8wprYbiU4gToTwM4xHteP0CF0nTq
 6NSZsf2raM8V3o7ZU0HUqhDItk/NllRI3MM5dHedNhPrq8kIWHGeOqw2IADNiUkdK3cD
 tYS/SoJzrcF2x/yEuXFnckV1V8q5ExBxbh79MYY1VfUgYQrWpvT5kE8p8cj7eAQpbkNs
 QXb8/Gup+8u6nurtQVIVZI/jx1jXpH19PUbeWtUyZQ3RsNbhreuDDbGmkX5JapG1bEtV
 XLgff9YSG8a/DKj+SbjoNUKjY+YsflqqgQ+lHT0ezDQShtOXDo0HenEqsUWVJ79xsc/R
 dsOw==
X-Gm-Message-State: AOAM530vX7ZYF6hRyUhGGGEVLtkiOyt6EgaIgZX6jNVbvPKspL5B6lh1
 WDSTQ8YcoCCtqPcEICi1+lLQOV+Dmdk=
X-Google-Smtp-Source: ABdhPJyWe7w6uicFmWZ2XkeyKKIcBOwOdiaC7+HAcJZHip6P1vFEpA5NlU6hIb6FpiaBoWJFO71n0g==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr3565383wmb.56.1594358661450; 
 Thu, 09 Jul 2020 22:24:21 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:21 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/15] powerpc/powernv/sriov: Drop iov->pe_num_map[]
Date: Fri, 10 Jul 2020 15:23:36 +1000
Message-Id: <20200710052340.737567-12-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 109 +++++----------------
 arch/powerpc/platforms/powernv/pci.h       |   4 +-
 2 files changed, 25 insertions(+), 88 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index d53a85ccb538..08f88187d65a 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -456,11 +456,13 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 
 
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
@@ -599,38 +601,24 @@ static int pnv_pci_vf_resource_shift(struct pci_dev *dev, int offset)
 
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
 
@@ -656,13 +644,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
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
@@ -670,6 +652,7 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 		pe->mve_number = -1;
 		pe->rid = (vf_bus << 8) | vf_devfn;
 
+		pe_num = pe->pe_number;
 		pe_info(pe, "VF %04d:%02d:%02d.%d associated with PE#%x\n",
 			pci_domain_nr(pdev->bus), pdev->bus->number,
 			PCI_SLOT(vf_devfn), PCI_FUNC(vf_devfn), pe_num);
@@ -701,9 +684,9 @@ static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 
 static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
+	struct pnv_ioda_pe    *base_pe;
 	struct pnv_iov_data   *iov;
 	struct pnv_phb        *phb;
-	struct pnv_ioda_pe    *pe;
 	int                    ret;
 	u16                    i;
 
@@ -717,55 +700,14 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
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
@@ -781,9 +723,10 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
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
 
@@ -792,20 +735,12 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 
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
index b4c9bdba7217..13555bc549f4 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -238,7 +238,9 @@ struct pnv_iov_data {
 
 	/* number of VFs enabled */
 	u16     num_vfs;
-	unsigned int *pe_num_map;	/* PE# for the first VF PE or array */
+
+	/* pointer to the array of VF PEs. num_vfs long*/
+	struct pnv_ioda_pe *vf_pe_arr;
 
 	/* Did we map the VF BARs with single-PE IODA BARs? */
 	bool    m64_single_mode;
-- 
2.26.2

