Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12C21AF0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:58:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32Qr4c8vzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WhyZjUXX; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gg5YP2zDrHq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:31 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id 22so4555483wmg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkjRFynI29bb/g7nw+0ck1pCbuIqgQw3oEcHk8akdqY=;
 b=WhyZjUXX3UHMReRMimrbOcfK+VyzpIb2qhIn54HpA9YesyJbYJZLa0V7e2nxZXIbuS
 E4ZUzlgJktcNi5Ry6wf0I7FdH/C1Sl0B4loSBwh9mK8RxoLmiXJjGZoGNDYmsD9En7z8
 Ttw00HpcUM/5g93H8ZQEgepkx3CDsP/02vPCy6xNgEeYnfYuxPwYxDuFojH4YHC1rIdt
 UzwbHk1KIdJcs1MhQ+kVcM+gBHQQ8LBZ59Mv/2shh97gKJVDRa5yPtQb6qFaTzfMawn1
 VxevhkMjcyEWm6Ibq0/YxgIy0gMfB9D/wln7vpkgd4sOti8FsCzO/f1KDwfkNbWuI+Mc
 bvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkjRFynI29bb/g7nw+0ck1pCbuIqgQw3oEcHk8akdqY=;
 b=SfsPzCgYp5LDGarmeo2NikYJ8edzGxLJNa5zK1x4WKPU50ecVpCPR91BhWaNH31/Wr
 haed6zNtU877LIny+Cjl6HkWtu+VtAggyCdCRGzna7Qw6lP4MpW7yIRFbKGAY/3bz1U0
 Rf74LMeTiB0OkGuu42HZbttD2DWYFpSI2NgURKgB9rVhVVvonhPJCxGQNu/sjSeR949l
 7zoRSDdkUxhZRw2L+fG0iTPulLYL2aqy201z+ernO4okVSW64s0ex619BMV8BKeJwB4r
 38YCBieJ346szOgZkYL9fV+UedYcylRoAhx/9b7hJM9gGoh4zNmd1HUGMk87Mmv4g/vN
 ZV+w==
X-Gm-Message-State: AOAM533fjlVT9XuA8O7tnheUCAVrVm9mng2Fvhet5lkr0JN/NK3jzmSO
 d+jcqmJysYa1eYa/SCwO8NAu9FernLs=
X-Google-Smtp-Source: ABdhPJzuHwXda2RwyukBOqn/XyP8LectxotdqchHPMu1phwA46DrEDK2O5AR90xE+LK9JXPoBsGgyg==
X-Received: by 2002:a1c:398b:: with SMTP id g133mr3262903wma.76.1594358668357; 
 Thu, 09 Jul 2020 22:24:28 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:27 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/15] powerpc/powernv/sriov: Refactor M64 BAR setup
Date: Fri, 10 Jul 2020 15:23:39 +1000
Message-Id: <20200710052340.737567-15-oohall@gmail.com>
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

Split up the logic so that we have one branch that handles setting up a
segmented window and another that handles setting up single PE windows for
each VF.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
This patch could be folded into the previous one. I've kept it
seperate mainly because the diff is *horrific* when they're merged.
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 57 ++++++++++------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 2f967aa4fbf5..8de03636888a 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -441,52 +441,49 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	struct resource       *res;
 	int                    i, j;
 	int64_t                rc;
-	int                    total_vfs;
 	resource_size_t        size, start;
-	int                    m64_bars;
+	int                    base_pe_num;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
 	iov = pnv_iov_get(pdev);
-	total_vfs = pci_sriov_get_totalvfs(pdev);
-
-	if (iov->m64_single_mode)
-		m64_bars = num_vfs;
-	else
-		m64_bars = 1;
 
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		res = &pdev->resource[i + PCI_IOV_RESOURCES];
 		if (!res->flags || !res->parent)
 			continue;
 
-		for (j = 0; j < m64_bars; j++) {
+		/* don't need single mode? map everything in one go! */
+		if (!iov->m64_single_mode) {
 			win = pnv_pci_alloc_m64_bar(phb, iov);
 			if (win < 0)
 				goto m64_failed;
 
-			if (iov->m64_single_mode) {
-				int pe_num = iov->vf_pe_arr[j].pe_number;
-
-				size = pci_iov_resource_size(pdev,
-							PCI_IOV_RESOURCES + i);
-				start = res->start + size * j;
-				rc = pnv_ioda_map_m64_single(phb, win,
-							     pe_num,
-							     start,
-							     size);
-			} else {
-				size = resource_size(res);
-				start = res->start;
-
-				rc = pnv_ioda_map_m64_accordion(phb, win, start,
-								size);
-			}
+			size = resource_size(res);
+			start = res->start;
 
-			if (rc != OPAL_SUCCESS) {
-				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
-					win, rc);
+			rc = pnv_ioda_map_m64_accordion(phb, win, start, size);
+			if (rc)
+				goto m64_failed;
+
+			continue;
+		}
+
+		/* otherwise map each VF with single PE BARs */
+		size = pci_iov_resource_size(pdev, PCI_IOV_RESOURCES + i);
+		base_pe_num = iov->vf_pe_arr[0].pe_number;
+
+		for (j = 0; j < num_vfs; j++) {
+			win = pnv_pci_alloc_m64_bar(phb, iov);
+			if (win < 0)
+				goto m64_failed;
+
+			start = res->start + size * j;
+			rc = pnv_ioda_map_m64_single(phb, win,
+						     base_pe_num + j,
+						     start,
+						     size);
+			if (rc)
 				goto m64_failed;
-			}
 		}
 	}
 	return 0;
-- 
2.26.2

