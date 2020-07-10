Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AA321AEF9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:48:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32Cb6YCHzDrL2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:48:43 +1000 (AEST)
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
 header.s=20161025 header.b=PYWE5N61; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gS0pYmzDrHY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:20 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id 17so4391380wmo.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=um5RPZtI5ikMHm5O4kgSxfjKpNY5pRZlVyV91IeyDE8=;
 b=PYWE5N61LwAHEpwyfbeGO7JeXsUhIWJ9u/GTFbtJneN5M0svfN1a+pA+Cq+hEJuwWc
 T7CHNf45l61KTJQUIDwVsKQaXRKWikLJl0DFcVzjcK0jyUHCxyRCDUB7aDjq7wqDYCkx
 8widfTFOjt35scQTjNeSY/s9VzE5Nzim6I0QKbiV4O0yAr2v26MrOuzHo7K93kAkpObH
 4qwlA1ooSk9wo6xmCiHaiU5/AEVxqgJV/nP1zV97oR8WEGSUg4sI0dghr8jlfg3R+fHL
 55fJcrAWhCFkWlvI1yoFkqkgMlHqi2qTslkjaB73WGtvc9jTkYSlWpKssbukTLqdUVjB
 4EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=um5RPZtI5ikMHm5O4kgSxfjKpNY5pRZlVyV91IeyDE8=;
 b=ubPoCklCha911LfGVD53+mXdoegIASq4dLkLL4nJa9mqiRrZ2oggNj506QhLur0BBC
 FneB6uPAA5+P1Vg/iNxjNqAPr7TL7r9GPB8EHzqmLvTBhbQvbnjcEJWOOFPEkCxiN73m
 ECbX7AzBVLWI6MVjSrPSEchVzE6OMJNGijn2qA14fHynG0UNEFVchyCBy7gSPXUvVe2Y
 7ceERTt3BtjE12+PzrJZlQ1AhFICDMd+b6/s6F81RRc6ebTjMkJHwnv+7BG6+RG4Q2Dp
 EKgt/DpKNLiAX46GOvBdhbZ5F0ZrxOf+juNZAUVj96R3dejtKYxbcqDbowtMlU739UgZ
 i7Mw==
X-Gm-Message-State: AOAM530TrmNUBan9W6tizHw6Ofqz6mNU1JLRtXU7JmPXYvwTML19nyUH
 wlilwhbcgE0zp8xik/eeswdrO1lmZGI=
X-Google-Smtp-Source: ABdhPJzrhcgv3L2aYTbKWZdNm3RCsaZBkYN8+Z1oMHns5JQdJCpA5XUZa2HeHoKk8SuzbCwofh484w==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr3296712wma.11.1594358656872; 
 Thu, 09 Jul 2020 22:24:16 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:16 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/15] powerpc/powernv/sriov: Factor out M64 BAR setup
Date: Fri, 10 Jul 2020 15:23:34 +1000
Message-Id: <20200710052340.737567-10-oohall@gmail.com>
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
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 132 ++++++++++++++++-----
 1 file changed, 103 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index e4c65cb49757..d53a85ccb538 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -320,6 +320,102 @@ static int pnv_pci_vf_release_m64(struct pci_dev *pdev, u16 num_vfs)
 	return 0;
 }
 
+
+/*
+ * PHB3 and beyond support "accordion" windows. The window's address range
+ * is subdivided into phb->ioda.total_pe_num segments and there's a 1-1
+ * mapping between PEs and segments.
+ *
+ * They're called that because as the window size changes the segment sizes
+ * change with it. Sort of like an accordion, sort of.
+ */
+static int64_t pnv_ioda_map_m64_accordion(struct pnv_phb *phb,
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
@@ -330,7 +426,6 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	int64_t                rc;
 	int                    total_vfs;
 	resource_size_t        size, start;
-	int                    pe_num;
 	int                    m64_bars;
 
 	phb = pci_bus_to_pnvhb(pdev->bus);
@@ -359,49 +454,28 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
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
+				rc = pnv_ioda_map_m64_accordion(phb, win, start,
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

