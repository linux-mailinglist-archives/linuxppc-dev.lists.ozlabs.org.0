Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A80412291E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:16:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRbM0QHvzDqQs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Efn4exzK; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9p3kDkzDqvr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:50 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d4so698677pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SYTuuE0NHLp4onXPzByawlZIwLDnubpu2XqPvZZCzfw=;
 b=Efn4exzK5yoSIhQVUw4AOwrXlNGJh3jqHSlorRqM8A+wMfarrzJQaf63gvtzYCcrRt
 nRRtpw21DXHgE/GTqaQDiSMUL3p1Ir2/wDiCou9giZhZKwoYp5q8CN1ccAW9aJZ4N1mh
 wizITlLxf2wCaVlGHIQROSDp8ORMUmG4jcVTYNnPpcEVNXXLxu4ouAPwQRw2d7/VTZE8
 cTul2zOWSDg8VQDxYtJ1egGHKA1urEs8O4FRmKbJrf3dK7i5dXcmoakUmR9+KygYTQEG
 hhOyt3L+k25Ll1itihXL8KtFR3ybCsuXEAXx2xUpu1fzb2SLXyRNyhheI84oqaKk0HaU
 8wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SYTuuE0NHLp4onXPzByawlZIwLDnubpu2XqPvZZCzfw=;
 b=qTXbeL8es5Mq+YjBqC5OgkWs1o4Bzu31e7KLpXdFStkR6/qTxnzE92aEb31BcVb26R
 Ys49iwTxrob+c65A/HWWIy/rU5YPlwhfqZ/bc5HQfPCtDyOCHIjMO8f2gPDQTBRK2Cyv
 G8qJ+y3b+W6Q8RHYitiScPTw2cJRVKI9sX8n/ySmHBEHIlzd7aVkXwR5jodv19NxluA8
 mAm92yyO9mI4JoiZML2C6YV3592AyKh5WKtnKGOzAEeDdsU0GYH3RoTR5XoNFGyTTUHZ
 HEK0byYiQ7dAitkaT4tPrPs9+eZItoecS+Z4SLa9W0yFoShL1WK+84/1XM3ULqAyuoSv
 0r9w==
X-Gm-Message-State: AOAM530hj0HcPy3Ez8kQ7s6ULR0XDCWOuzqCyiAT323yhBewkFEV+062
 YFJgY1mDRJbdTwnkL3hFsUnPCyM70Vc=
X-Google-Smtp-Source: ABdhPJzsbRHMvsSZXJU/TatZV/DDtsiT3IyQznUloyYMf+l33lX5DJuOC5DsWdompyWsQLF8m7v52A==
X-Received: by 2002:aa7:970a:: with SMTP id a10mr28826790pfg.319.1595401066302; 
 Tue, 21 Jul 2020 23:57:46 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:45 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/16] powerpc/powernv/sriov: Factor out M64 BAR setup
Date: Wed, 22 Jul 2020 16:57:08 +1000
Message-Id: <20200722065715.1432738-9-oohall@gmail.com>
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

The sequence required to use the single PE BAR mode is kinda janky and
requires a little explanation. The API was designed with P7-IOC style
windows where the setup process is something like:

1. Configure the window start / end address
2. Enable the window
3. Map the segments of each window to the PE

For Single PE BARs the process is:

1. Set the PE for segment zero on a disabled window
2. Set the range
3. Enable the window

Move the OPAL calls into their own helper functions where the quirks can be
contained.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: renamed "accordion" window to "segmented"
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 129 ++++++++++++++++-----
 1 file changed, 100 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index b48952e59ce0..d90e11218add 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -320,6 +320,99 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 	return 0;
 }
 
+
+/*
+ * PHB3 and beyond support segmented windows. The window's address range
+ * is subdivided into phb->ioda.total_pe_num segments and there's a 1-1
+ * mapping between PEs and segments.
+ */
+static int64_t pnv_ioda_map_m64_segmented(struct pnv_phb *phb,
+					  int window_id,
+					  resource_size_t start,
+					  resource_size_t size)
+{
+	int64_t rc;
+
+	rc = opal_pci_set_phb_mem_window(phb->opal_id,
+					 OPAL_M64_WINDOW_TYPE,
+					 window_id,
+					 start,
+					 0, /* unused */
+					 size);
+	if (rc)
+		goto out;
+
+	rc = opal_pci_phb_mmio_enable(phb->opal_id,
+				      OPAL_M64_WINDOW_TYPE,
+				      window_id,
+				      OPAL_ENABLE_M64_SPLIT);
+out:
+	if (rc)
+		pr_err("Failed to map M64 window #%d: %lld\n", window_id, rc);
+
+	return rc;
+}
+
+static int64_t pnv_ioda_map_m64_single(struct pnv_phb *phb,
+				       int pe_num,
+				       int window_id,
+				       resource_size_t start,
+				       resource_size_t size)
+{
+	int64_t rc;
+
+	/*
+	 * The API for setting up m64 mmio windows seems to have been designed
+	 * with P7-IOC in mind. For that chip each M64 BAR (window) had a fixed
+	 * split of 8 equally sized segments each of which could individually
+	 * assigned to a PE.
+	 *
+	 * The problem with this is that the API doesn't have any way to
+	 * communicate the number of segments we want on a BAR. This wasn't
+	 * a problem for p7-ioc since you didn't have a choice, but the
+	 * single PE windows added in PHB3 don't map cleanly to this API.
+	 *
+	 * As a result we've got this slightly awkward process where we
+	 * call opal_pci_map_pe_mmio_window() to put the single in single
+	 * PE mode, and set the PE for the window before setting the address
+	 * bounds. We need to do it this way because the single PE windows
+	 * for PHB3 have different alignment requirements on PHB3.
+	 */
+	rc = opal_pci_map_pe_mmio_window(phb->opal_id,
+					 pe_num,
+					 OPAL_M64_WINDOW_TYPE,
+					 window_id,
+					 0);
+	if (rc)
+		goto out;
+
+	/*
+	 * NB: In single PE mode the window needs to be aligned to 32MB
+	 */
+	rc = opal_pci_set_phb_mem_window(phb->opal_id,
+					 OPAL_M64_WINDOW_TYPE,
+					 window_id,
+					 start,
+					 0, /* ignored by FW, m64 is 1-1 */
+					 size);
+	if (rc)
+		goto out;
+
+	/*
+	 * Now actually enable it. We specified the BAR should be in "non-split"
+	 * mode so FW will validate that the BAR is in single PE mode.
+	 */
+	rc = opal_pci_phb_mmio_enable(phb->opal_id,
+				      OPAL_M64_WINDOW_TYPE,
+				      window_id,
+				      OPAL_ENABLE_M64_NON_SPLIT);
+out:
+	if (rc)
+		pr_err("Error mapping single PE BAR\n");
+
+	return rc;
+}
+
 static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pnv_iov_data   *iov;
@@ -330,7 +423,6 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	int64_t                rc;
 	int                    total_vfs;
 	resource_size_t        size, start;
-	int                    pe_num;
 	int                    m64_bars;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
@@ -359,49 +451,28 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 			} while (test_and_set_bit(win, &phb->ioda.m64_bar_alloc));
 			set_bit(win, iov->used_m64_bar_mask);
 
+
 			if (iov->m64_single_mode) {
 				size = pci_iov_resource_size(pdev,
 							PCI_IOV_RESOURCES + i);
 				start = res->start + size * j;
+				rc = pnv_ioda_map_m64_single(phb, win,
+							     iov->pe_num_map[j],
+							     start,
+							     size);
 			} else {
 				size = resource_size(res);
 				start = res->start;
-			}
 
-			/* Map the M64 here */
-			if (iov->m64_single_mode) {
-				pe_num = iov->pe_num_map[j];
-				rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-						pe_num, OPAL_M64_WINDOW_TYPE,
-						win, 0);
+				rc = pnv_ioda_map_m64_segmented(phb, win, start,
+								size);
 			}
 
-			rc = opal_pci_set_phb_mem_window(phb->opal_id,
-						 OPAL_M64_WINDOW_TYPE,
-						 win,
-						 start,
-						 0, /* unused */
-						 size);
-
-
 			if (rc != OPAL_SUCCESS) {
 				dev_err(&pdev->dev, "Failed to map M64 window #%d: %lld\n",
 					win, rc);
 				goto m64_failed;
 			}
-
-			if (iov->m64_single_mode)
-				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, win, 2);
-			else
-				rc = opal_pci_phb_mmio_enable(phb->opal_id,
-				     OPAL_M64_WINDOW_TYPE, win, 1);
-
-			if (rc != OPAL_SUCCESS) {
-				dev_err(&pdev->dev, "Failed to enable M64 window #%d: %llx\n",
-					win, rc);
-				goto m64_failed;
-			}
 		}
 	}
 	return 0;
-- 
2.26.2

