Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24522D619
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 10:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDK7Q0xypzF1Wm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 18:32:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mw/6ABkd; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDJjK5rhGzF1Lf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 18:13:09 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d1so5746316plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnLIsyzKC0HoYlgbxHBeUFj5GZl5qfyBcFUWkD+4R3E=;
 b=mw/6ABkdvsSBGLiEEXMJj/D4eY+YS8B27DJj5Zx0L+p4zUPaFlj8QmxvSC2iy8YMDW
 CDKxwT4Y+inkVpixN+nxE0mqk1RtGaw10eYH0KVD0KqNUogk+hjOgGNWvBI7x/wLUZZY
 81jqC6wqkkOhWLMLhyZv6Tqlc0Q+z4PJ+vKY8uoFWBqozMu6JEf8dhWiDL4zLicBuw0r
 s/CfsSPv9JVcEfFpVjqiwDKhR89Xw5mogKqzXs0OP/kH/vcK0wzUOEB5nBmyU46+dcpL
 YkKNxswIkUbI/PbAoaGeDQ1uN1g7psewTxFxMBSPMUz/jZzRw9cPq86KQIJ8QdWVRgxP
 zJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnLIsyzKC0HoYlgbxHBeUFj5GZl5qfyBcFUWkD+4R3E=;
 b=RuLCCo7/Jy0GvozjrrTjPXY8W3iTLTdaEuWzqLFgCI+g8mj9UhSaxAqFsphIRURf8J
 XzuH9KBbr5YncvuXCZIn39Ph4lrFpy5TVQU8Fiqf7J5Y+W+7iRv2/97kBC+ae532d0eH
 9BLauFw4xsQC5XF6rrYRjB7boYgAZOCu+AuI3DizsehbW5+drU9L+Q9NJGMDByai+cny
 usmY1Da3h1JWxQL9CYie2za5Nnc+8Lm4wAQtIdueJdT32JZ7qKHPokVHYSR5hnvzF7Oa
 tWY309jWjI9r6sdWBruQAdS0wt1HwJ5ZDhAR/jKmeGaHAbLuzFDKeRvZwc+YDCH/Ue6Z
 bX5Q==
X-Gm-Message-State: AOAM530UpXJ0TaoobEO3z0PzYF7L5KuwolNYisJk/2koq6rorsDLcY8g
 H3slot3AGwXC5OYuYNsbh95azNOcnjo=
X-Google-Smtp-Source: ABdhPJzmSps48Or6eZoQuib+DOzDU8Fx9Xjuu4hezpkRWMsNuAcqJegzDB6vskqNZw8Ba37W/VR28w==
X-Received: by 2002:a17:902:8a85:: with SMTP id
 p5mr11410502plo.89.1595664787769; 
 Sat, 25 Jul 2020 01:13:07 -0700 (PDT)
Received: from localhost.localdomain ([118.210.60.180])
 by smtp.gmail.com with ESMTPSA id a26sm8647360pgm.20.2020.07.25.01.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 01:13:07 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/14] powerpc/eeh: Remove class code field from edev
Date: Sat, 25 Jul 2020 18:12:28 +1000
Message-Id: <20200725081231.39076-11-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200725081231.39076-1-oohall@gmail.com>
References: <20200725081231.39076-1-oohall@gmail.com>
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

The edev->class_code field is never referenced anywhere except for the
platform specific probe functions. The same information is available in
the pci_dev for PowerNV and in the pci_dn on pseries so we can remove
the field.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
v3: no changes
---
 arch/powerpc/include/asm/eeh.h               | 1 -
 arch/powerpc/platforms/powernv/eeh-powernv.c | 5 ++---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index f8ef27f75c37..79de8624809a 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -133,7 +133,6 @@ static inline bool eeh_pe_passed(struct eeh_pe *pe)
 
 struct eeh_dev {
 	int mode;			/* EEH mode			*/
-	int class_code;			/* Class code of the device	*/
 	int bdfn;			/* bdfn of device (for cfg ops) */
 	struct pci_controller *controller;
 	int pe_config_addr;		/* PE config address		*/
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index c9f2f454d053..7cbb03a97a61 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -372,19 +372,18 @@ static struct eeh_dev *pnv_eeh_probe(struct pci_dev *pdev)
 	}
 
 	/* Skip for PCI-ISA bridge */
-	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
 	/* Initialize eeh device */
-	edev->class_code = pdn->class_code;
 	edev->mode	&= 0xFFFFFF00;
 	edev->pcix_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->af_cap   = pnv_eeh_find_cap(pdn, PCI_CAP_ID_AF);
 	edev->aer_cap  = pnv_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			pnv_pci_cfg_read(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b981332db873..67931fe5f341 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -273,12 +273,11 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
 	 * correctly reflects that current device is root port
 	 * or PCIe switch downstream port.
 	 */
-	edev->class_code = pdn->class_code;
 	edev->pcix_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pseries_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
 	edev->aer_cap = pseries_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
 	edev->mode &= 0xFFFFFF00;
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			rtas_read_config(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
-- 
2.26.2

