Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B992291DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:14:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRY13Xd7zDqpC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GnT3Q7QQ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9l5BRCzDqwb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:47 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id k1so661562pjt.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jux0qkPu0GauZI9+jV32KW0ChRLqu0PMO62D9YL1Rc=;
 b=GnT3Q7QQ4P7QDN1XSIAby5yCNf1yDgFecFzyEaaaTezeJx5x13zorNGbMsq9QlKf6o
 uYQhlpXNUr1bQuvaf9+ux8T1OMUffTJBBSiGIwqQppXOit3qgAAZACZgdPXhUncQksaJ
 mVnYhYp5BFD9I2NvCGUrHoNgaj8gTEcVX79uAA2kT9UaXggURf/3C6MIEhhNmiAytYS0
 TvvKeUvssQwnj0MyEA+Jf1gX5yvhKboL7BMGoSBPJ/I5ImuNfo5S8YoqkjxdXpiBATST
 DslA5OwvIxnXDxxFCxarWQYgUP0gicEJr/Xf3E2ubESa57MZ3VOQE8XIA94R4bnR5x1S
 gpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jux0qkPu0GauZI9+jV32KW0ChRLqu0PMO62D9YL1Rc=;
 b=rn/W0aCBaYuuBBnWfLeFv7xR1piDHj4D1cDHhf77tL5OCOzPcgJMNIX6W5BS1nuI+J
 YHIVfj4RFqWC5FtrN6TTSg7+otyxYhJB7uK0XZhYcPjHqxMrK2ftTkERS1PcwEM2eAS6
 8ilUkrdYAuC/h/SjmgfFtooXC0pwQNsEyOd2G5MP9rKryDcdYuX5BLOXZ/M0wCYSh7UZ
 412EYE1po6jw4qV5W3r8rA7Gnfgq2J5ADRWYUXdxi02+CPv8WWH3zbvTwJi1j5+4SOXf
 2fAfoIyoM5FKj0PZHGzuqbeKm8tRROzVreEBQHHOwi9yx8qpQxvF49cZPzopfH3cdKop
 aQXA==
X-Gm-Message-State: AOAM532BFV2LaVMjCQhEaUfpiAv/EhI8OsAaVYS7BQ2IOlSvDGrwfQ6U
 jlO6fbnCCzFyjC0ywuOTFtgXHvlB0og=
X-Google-Smtp-Source: ABdhPJy2yV3SerU5VO9KDXC8G7SY2+livcaRihaOyG/4afYQ/Eb4/0dIh2ven/pj+1F63057IBjHPA==
X-Received: by 2002:a17:90a:3567:: with SMTP id
 q94mr8817028pjb.226.1595401064050; 
 Tue, 21 Jul 2020 23:57:44 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:43 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/16] powerpc/powernv/sriov: Simplify used window tracking
Date: Wed, 22 Jul 2020 16:57:07 +1000
Message-Id: <20200722065715.1432738-8-oohall@gmail.com>
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

No need for the multi-dimensional arrays, just use a bitmap.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: Fixed license to GPL-2.0-or-later

    Added MAX_M64_BARS for the size of the M64 allocation bitmap rather than
    open coding 64.
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 50 +++++++---------------
 arch/powerpc/platforms/powernv/pci.h       |  8 +++-
 2 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 216ceeff69b0..b48952e59ce0 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/kernel.h>
 #include <linux/ioport.h>
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
+	for_each_set_bit(window_id, iov->used_m64_bar_mask, MAX_M64_BARS) {
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
index 0156d7d17f7d..23fc5e391c7f 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -154,6 +154,7 @@ struct pnv_phb {
 		unsigned long		m64_size;
 		unsigned long		m64_segsize;
 		unsigned long		m64_base;
+#define MAX_M64_BARS 64
 		unsigned long		m64_bar_alloc;
 
 		/* IO ports */
@@ -243,8 +244,11 @@ struct pnv_iov_data {
 	/* Did we map the VF BARs with single-PE IODA BARs? */
 	bool    m64_single_mode;
 
-	int     (*m64_map)[PCI_SRIOV_NUM_BARS];
-#define IODA_INVALID_M64        (-1)
+	/*
+	 * Bit mask used to track which m64 windows are used to map the
+	 * SR-IOV BARs for this device.
+	 */
+	DECLARE_BITMAP(used_m64_bar_mask, MAX_M64_BARS);
 
 	/*
 	 * If we map the SR-IOV BARs with a segmented window then
-- 
2.26.2

