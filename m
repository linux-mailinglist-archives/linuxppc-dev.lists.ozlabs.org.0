Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9271221AF06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:54:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32LG5dNWzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:54:30 +1000 (AEST)
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
 header.s=20161025 header.b=Hs+7s5b4; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gZ5BNJzDrHb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:26 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id o8so4536098wmh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=buWzk/vVB/cujnN2jdBWDrbcMZbWLenLCz2srtZ5Lbc=;
 b=Hs+7s5b44wRfLzfD08uBz7vSuqydC7EcgvNk+wnoj/KWjp3BYs34h/cF7q9HLKnXu0
 s8mP7YQQE7ZeDBsA2rrFkK3lHT7nE17He2vBfONoz+3FaKHyyDS3ZVIysFQ++viunn95
 1DlaJITO9wcwDwV/Bo0SF1lapCozznEeoFJKCAqo5q5/Gkucjzyo0UeiLGe9IqVNaFkC
 VKhDh4iOF9REjn9DwFJky8z+ffQavQdLQyVmqSl8k31Zl700163R6ipwRkqwBSXDw/wn
 Fdc9QRU4uTmi3sL62o9nzzZGWn4EmZ2DsQ/83n3IYJ+c0TbsomeXsiewje3YfQHCbv6f
 aPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=buWzk/vVB/cujnN2jdBWDrbcMZbWLenLCz2srtZ5Lbc=;
 b=ja8rlAMdTHkanEIp0tNp3KTVygQGQvGqZlDlv3dXb3NuDnKudSKzsFg4x3XZ3SX+an
 mwEmZw4WD+xfFIw178Kda6B93WYdlUxAzpX0UOJgd5MPWXHAi8clAAw0j0gDuGsKeyoX
 n5JCNDgLRGBrjN5JmN3DJScdMGY9TmdOcHTdzKcv5lZML8ZKwIYuPe99PfFHLgxUx3M+
 pGnla6V2uRkc6b76mNBKW00s88TP1kfQpayJpwORRohIY9b9sEJotFNAnMQcYoufLynZ
 vhvxdhoHORkojQo4+HvNgel0TScwHPAmCpuKBl5y3JS38fxKdY8iBb0aW+ai8yDu6PEu
 Bk4Q==
X-Gm-Message-State: AOAM533pk6x4la3pS9DDw9J7iRJqDkr68xICdZNSzyEOZfZMxE6wYSIj
 ou7GY3i4N1QHUjnCG9zEGd6Awnn9JJE=
X-Google-Smtp-Source: ABdhPJy7FwouiE7P4bGs/jPme6Gz2RPzA1xCu8fKBDFrbtGXnImBEeYJ2YyPMEmDaODA4T/RwdvpYQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr3266969wma.73.1594358663720; 
 Thu, 09 Jul 2020 22:24:23 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:23 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/15] powerpc/powernv/sriov: De-indent setup and teardown
Date: Fri, 10 Jul 2020 15:23:37 +1000
Message-Id: <20200710052340.737567-13-oohall@gmail.com>
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

Remove the IODA2 PHB checks. We already assume IODA2 in several places so
there's not much point in wrapping most of the setup and teardown process
in an if block.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 86 ++++++++++++----------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 08f88187d65a..d5699cd2ab7a 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -610,16 +610,18 @@ static void pnv_pci_sriov_disable(struct pci_dev *pdev)
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
@@ -693,41 +695,51 @@ static int pnv_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
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
-- 
2.26.2

