Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60B21AEF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:47:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B329m23VXzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:47:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HawvFcln; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gP5Ll7zDrHy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:17 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id j4so4543929wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w8axr51F1sA8A4/9jcxzbM3NKVaVVcq/k75455TJ9iA=;
 b=HawvFclngCA/eTJPdYRf3Iq6rh8RCy4s9XCFwXC6QAb3Hlk6rRMb3T24VAvwV9+3Wl
 by0Bm4wkQcIXmWQiz/xUtELwOCDoB/xIqo2HLvFPixwDXXlMcc1IxzQ8i/82hkg4fKic
 1BePj250SnNLF+B7uF9Zb9BBf+XkxBOBBAGKZXAeuRagw096clUvf/qpIJkC4MszqOct
 iaw3Vjfd5vKKF9/b/5otgrxhOY4j0OZj2OKGGCBN1NSgATjbicALDqCJtFn7UUrbQTS3
 ckvd0VjjmN5fKGf+gWkdsWN8rXOHDBmgaGoy9XbPID6T8MLrNLagZDQLAhs5iJ9E3d/D
 8FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w8axr51F1sA8A4/9jcxzbM3NKVaVVcq/k75455TJ9iA=;
 b=EN7n7ikVkOXPLrdCXnmILvFTY4Qzuv+9G4ErX94WNzFSa4uNObkYOh3xwrZZGl9O2o
 Dc9dN0jRMZyjYOSa+ST2vmW60hz+I7oZHtJQs0JaZ3bsevLB2iMvZvg/PJx6pSpnlNmY
 9p5LQ1MsH0aExDrTcftHr3k80wxPPE8kIP1Vudu88ieUT34l5HARh8MQGwSgYwP6PQPY
 oql6sXluHw0lanWjtji0xW5cb2eFVpCQ8QgOjIFc1VuFdoCrqyXnyBrUeFf7ZZxLghp+
 z42Lwc8npTmqClfWzhY8CsTMohBv2qKY/ZiyfDKPribBgfO353CiA66PcsxhAM4kuDe5
 P6bQ==
X-Gm-Message-State: AOAM532Uto6N8gqtqLPY7eDhwQh+lpUjevdFfQJ6CAHTL2MjrUpRm5/W
 ezUhLxUqAPegUzbUsaUMp3fpif1QVHo=
X-Google-Smtp-Source: ABdhPJxBmoeu8B38XJamWxXAVJrJ1qkiFjq1k6ckvvbVMAd1ndyUIKZe27MpWjnbUvTu+jZhKdPBiQ==
X-Received: by 2002:a5d:6386:: with SMTP id p6mr54034018wru.417.1594358654531; 
 Thu, 09 Jul 2020 22:24:14 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:14 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/15] powerpc/powernv/sriov: Simplify used window tracking
Date: Fri, 10 Jul 2020 15:23:33 +1000
Message-Id: <20200710052340.737567-9-oohall@gmail.com>
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

No need for the multi-dimensional arrays, just use a bitmap.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 48 +++++++---------------
 arch/powerpc/platforms/powernv/pci.h       |  7 +++-
 2 files changed, 20 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 216ceeff69b0..e4c65cb49757 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -303,28 +303,20 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pnv_iov_data   *iov;
 	struct pnv_phb        *phb;
-	int                    i, j;
-	int                    m64_bars;
+	int window_id;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
 	iov = pnv_iov_get(pdev);
 
-	if (iov->m64_single_mode)
-		m64_bars = num_vfs;
-	else
-		m64_bars = 1;
+	for_each_set_bit(window_id, iov->used_m64_bar_mask, 64) {
+		opal_pci_phb_mmio_enable(phb->opal_id,
+					 OPAL_M64_WINDOW_TYPE,
+					 window_id,
+					 0);
 
-	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++)
-		for (j = 0; j < m64_bars; j++) {
-			if (iov->m64_map[j][i] == IODA_INVALID_M64)
-				continue;
-			opal_pci_phb_mmio_enable(phb->opal_id,
-				OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 0);
-			clear_bit(iov->m64_map[j][i], &phb->ioda.m64_bar_alloc);
-			iov->m64_map[j][i] = IODA_INVALID_M64;
-		}
+		clear_bit(window_id, &phb->ioda.m64_bar_alloc);
+	}
 
-	kfree(iov->m64_map);
 	return 0;
 }
 
@@ -350,23 +342,14 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	else
 		m64_bars = 1;
 
-	iov->m64_map = kmalloc_array(m64_bars,
-				     sizeof(*iov->m64_map),
-				     GFP_KERNEL);
-	if (!iov->m64_map)
-		return -ENOMEM;
-	/* Initialize the m64_map to IODA_INVALID_M64 */
-	for (i = 0; i < m64_bars ; i++)
-		for (j = 0; j < PCI_SRIOV_NUM_BARS; j++)
-			iov->m64_map[i][j] = IODA_INVALID_M64;
-
-
 	for (i = 0; i < PCI_SRIOV_NUM_BARS; i++) {
 		res = &pdev->resource[i + PCI_IOV_RESOURCES];
 		if (!res->flags || !res->parent)
 			continue;
 
 		for (j = 0; j < m64_bars; j++) {
+
+			/* allocate a window ID for this BAR */
 			do {
 				win = find_next_zero_bit(&phb->ioda.m64_bar_alloc,
 						phb->ioda.m64_bar_idx + 1, 0);
@@ -374,8 +357,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 				if (win >= phb->ioda.m64_bar_idx + 1)
 					goto m64_failed;
 			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
-
-			iov->m64_map[j][i] = win;
+			set_bit(win, iov->used_m64_bar_mask);
 
 			if (iov->m64_single_mode) {
 				size = pci_iov_resource_size(pdev,
@@ -391,12 +373,12 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 				pe_num = iov->pe_num_map[j];
 				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
 						pe_num, OPAL_M64_WINDOW_TYPE,
-						iov->m64_map[j][i], 0);
+						win, 0);
 			}
 
 			rc = opal_pci_set_phb_mem_window(phb->opal_id,
 						 OPAL_M64_WINDOW_TYPE,
-						 iov->m64_map[j][i],
+						 win,
 						 start,
 						 0, /* unused */
 						 size);
@@ -410,10 +392,10 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 
 			if (iov->m64_single_mode)
 				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 2);
+				     OPAL_M64_WINDOW_TYPE, win, 2);
 			else
 				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, iov->m64_map[j][i], 1);
+				     OPAL_M64_WINDOW_TYPE, win, 1);
 
 			if (rc != OPAL_SUCCESS) {
 				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 0156d7d17f7d..58c97e60c3db 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -243,8 +243,11 @@ struct pnv_iov_data {
 	/* Did we map the VF BARs with single-PE IODA BARs? */
 	bool    m64_single_mode;
 
-	int     (*m64_map)[PCI_SRIOV_NUM_BARS];
-#define IODA_INVALID_M64        (-1)
+	/*
+	 * Bit mask used to track which m64 windows that we used to map the
+	 * SR-IOV BARs for this device.
+	 */
+	DECLARE_BITMAP(used_m64_bar_mask, 64);
 
 	/*
 	 * If we map the SR-IOV BARs with a segmented window then
-- 
2.26.2

