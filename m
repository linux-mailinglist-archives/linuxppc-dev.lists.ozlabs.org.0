Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0222920C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:22:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRjm6dMmzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KVX7tUqV; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9v3w7RzDqw1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:55 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id 8so669446pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1d7vh3QCDTZ6cLHO+NmAHiM61hWNbjISBFEEsGtYTM=;
 b=KVX7tUqVi4JmqA4Vwg9Ee6Z+j54N43DPZCaI4QARd/xMZhrID2xLiYbVLFpDiTtS+q
 qYozlnV9EcWaGyZ4xmZS3RQovtGFPjMe767Pe5BC3jlKnd2rML3JWu1TusW/h3z4MXKK
 3ov/s76JpFFEKgabcDPS4YBqB+x9RHksAKFePPe1g8mau2L70/MiZ70wIQ+pcvx1yxfz
 ur9h6vH1Wu1q82NtZDm9lFc9W+Z7ne8RqnM5kewF6MWMkzIgqPiKaf2l+HUPOUE6qMi4
 sn3rfh1qVKdbMfpBCbrPM6C/OFDalbYY2xvGYSHElJrpSGR1Wxa+wtKJ+HXiaHwH36+3
 UynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1d7vh3QCDTZ6cLHO+NmAHiM61hWNbjISBFEEsGtYTM=;
 b=Ek6DjLXwZqAS2yAPPpVZSwWWbpQJdg76YlW6SkpuQf7JQf1bwA6PW7yMAldyglO3zX
 UiCDHPztphngv9MEOrRUpsMC7raYhbF6lrHvTOruYRscrCk+T6xDbhRCD8bqXEjplBgj
 jnsdvuhVTonBfowddaB74Ysi8LpnGZwZt6mW0pVe2va8iw/k9MQcqJNFW47fS9ZiMJsG
 3GT8Tb/sLymPYH/x53dOnlrQOH3S6o5S8qlQdB5F9QGwNwfGgH7WN9iOeURcXWbjQJcW
 yjqNTX26zLt5hs2zvlLwP6DQMvWilS85GHbnMtEFvZ3UeIbMBOUh+OEGxrPcWaF2ObDE
 iffQ==
X-Gm-Message-State: AOAM531yO04MCnLTDZEKn/k+YYuKZKYTaLGID7cKRWY9x5VcRgIREkQf
 zlvhwIxu/NyxV+GM5hDnAD/huXdqb8w=
X-Google-Smtp-Source: ABdhPJy8QJnSaZCOJCWnoCB3n77b1KhVGnGJsHDTXrELy7iR4v1vNBuBpFlge1qePg3+/Sj8pEqk9g==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr7878780pjr.132.1595401072523; 
 Tue, 21 Jul 2020 23:57:52 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:52 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/16] powerpc/powernv/sriov: De-indent setup and teardown
Date: Wed, 22 Jul 2020 16:57:11 +1000
Message-Id: <20200722065715.1432738-12-oohall@gmail.com>
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

Remove the IODA2 PHB checks. We already assume IODA2 in several places so
there's not much point in wrapping most of the setup and teardown process
in an if block.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Added a note that iov->vf_pe_arr is a pointer into the PHB's PE array
    rather than something we allocate.
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 86 ++++++++++++----------
 arch/powerpc/platforms/powernv/pci.h       |  5 +-
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 5981323cd9a6..b60d8a054a61 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -607,16 +607,18 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
 	num_vfs = iov->num_vfs;
 	base_pe = iov->vf_pe_arr[0].pe_number;
 
+	if (WARN_ON(!iov))
+		return;
+
 	/* Release VF PEs */
 	pnv_ioda_release_vf_PE(pdev);
 
-	if (phb->type == PNV_PHB_IODA2) {
-		if (!iov->m64_single_mode)
-			pnv_pci_vf_resource_shift(pdev, -base_pe);
+	/* Un-shift the IOV BAR resources */
+	if (!iov->m64_single_mode)
+		pnv_pci_vf_resource_shift(pdev, -base_pe);
 
-		/* Release M64 windows */
-		pnv_pci_vf_release_m64(pdev, num_vfs);
-	}
+	/* Release M64 windows */
+	pnv_pci_vf_release_m64(pdev, num_vfs);
 }
 
 static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
@@ -690,41 +692,51 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 	phb = pci_bus_to_pnvhb(pdev->bus);
 	iov = pnv_iov_get(pdev);
 
-	if (phb->type == PNV_PHB_IODA2) {
-		if (!iov->vfs_expanded) {
-			dev_info(&pdev->dev, "don't support this SRIOV device"
-				" with non 64bit-prefetchable IOV BAR\n");
-			return -ENOSPC;
-		}
+	/*
+	 * There's a calls to IODA2 PE setup code littered throughout. We could
+	 * probably fix that, but we'd still have problems due to the
+	 * restriction inherent on IODA1 PHBs.
+	 *
+	 * NB: We class IODA3 as IODA2 since they're very similar.
+	 */
+	if (phb->type != PNV_PHB_IODA2) {
+		pci_err(pdev, "SR-IOV is not supported on this PHB\n");
+		return -ENXIO;
+	}
 
-		/* allocate a contigious block of PEs for our VFs */
-		base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
-		if (!base_pe) {
-			pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
-			return -EBUSY;
-		}
+	if (!iov->vfs_expanded) {
+		dev_info(&pdev->dev, "don't support this SRIOV device"
+			" with non 64bit-prefetchable IOV BAR\n");
+		return -ENOSPC;
+	}
 
-		iov->vf_pe_arr = base_pe;
-		iov->num_vfs = num_vfs;
+	/* allocate a contigious block of PEs for our VFs */
+	base_pe = pnv_ioda_alloc_pe(phb, num_vfs);
+	if (!base_pe) {
+		pci_err(pdev, "Unable to allocate PEs for %d VFs\n", num_vfs);
+		return -EBUSY;
+	}
 
-		/* Assign M64 window accordingly */
-		ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
-		if (ret) {
-			dev_info(&pdev->dev, "Not enough M64 window resources\n");
-			goto m64_failed;
-		}
+	iov->vf_pe_arr = base_pe;
+	iov->num_vfs = num_vfs;
 
-		/*
-		 * When using one M64 BAR to map one IOV BAR, we need to shift
-		 * the IOV BAR according to the PE# allocated to the VFs.
-		 * Otherwise, the PE# for the VF will conflict with others.
-		 */
-		if (!iov->m64_single_mode) {
-			ret = pnv_pci_vf_resource_shift(pdev,
-							base_pe->pe_number);
-			if (ret)
-				goto shift_failed;
-		}
+	/* Assign M64 window accordingly */
+	ret = pnv_pci_vf_assign_m64(pdev, num_vfs);
+	if (ret) {
+		dev_info(&pdev->dev, "Not enough M64 window resources\n");
+		goto m64_failed;
+	}
+
+	/*
+	 * When using one M64 BAR to map one IOV BAR, we need to shift
+	 * the IOV BAR according to the PE# allocated to the VFs.
+	 * Otherwise, the PE# for the VF will conflict with others.
+	 */
+	if (!iov->m64_single_mode) {
+		ret = pnv_pci_vf_resource_shift(pdev,
+						base_pe->pe_number);
+		if (ret)
+			goto shift_failed;
 	}
 
 	/* Setup VF PEs */
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index f76923f44f66..41a6f4e938e4 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -240,10 +240,7 @@ struct pnv_iov_data {
 	/* number of VFs enabled */
 	u16     num_vfs;
 
-	/*
-	 * Pointer to the IODA PE state of each VF. Note that this is a pointer
-	 * into the PHB's PE array (phb->ioda.pe_array).
-	 */
+	/* pointer to the array of VF PEs. num_vfs long*/
 	struct pnv_ioda_pe *vf_pe_arr;
 
 	/* Did we map the VF BARs with single-PE IODA BARs? */
-- 
2.26.2

