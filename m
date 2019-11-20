Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7F103169
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:10:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmPD1jYqzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mU9jfH7w"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVd4cKpzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:01 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id z4so13323959pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/hKqIdoQPfVNzbNnhz1junE6/5i/iNhAZp2u2Kve0c=;
 b=mU9jfH7wEdjJLn6z5Zv9hTgXQxWhtEX18Mdpsc6tTAdy00RQi9FoMHeMNiIzUvM5EF
 GxtToVx0aX92YlcCno9eyK8ponOREyv4XI/7/NSnkTt3/71gKLyzXbVY19+B42tTuqLK
 RixR8zAtEe7b2nAYe5yXhaue8VqywaYNNBHR4udJhfxf4+KTQFdZrhhAvgO9vthg2eci
 HBwo9cAQ8xBEstJrEduqHH8HF4/RCfns/VHvb52liijGEYGVuiDBeFUD670R2VNM+env
 m8Qb8Ttso6iTC3AVKPUEYsMN37MMLZoSRyq6kXT80WXiPpsOJX8V0OknQw/Q3EL/oEqh
 /F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/hKqIdoQPfVNzbNnhz1junE6/5i/iNhAZp2u2Kve0c=;
 b=Wx0VWEX9uyDTZG0KBivKaTK7O4P3qLd4zxLBfEhrok1+Sfj24ubzmPtn9ub5h9d/3u
 H6uMh+QxPpLSA++7DYYvArBLLHxewx1JnNsnuJDJjBZc7SK7C6Z2y4pJVDWUM1DDlFH9
 nndmtP6+vJjG3QoQB8uN77MsvN1wmVox7puefCB/ppwX4SHerYYKYVKw/aMu1zUU15hq
 SkgmoEYAl9EXSbPSriwUmgDuhijknWJLwef+bKaF5bSmRYR4yTFHCmEM8vmMTHTkaq9m
 H5kEAzeWJjTa8CMfs6HKn0HhHEdHHVWJRYMKUe/9sXVOzffD+OH/iMZbrdq3NO4vI5Mt
 4DVQ==
X-Gm-Message-State: APjAAAVg8STLMS7YI4ayjuS7Sq33rgmXLWr5REU+Lzn3YZ7NR30M5qr7
 FV40plltb4qCOlj///AiyZNZSd+i
X-Google-Smtp-Source: APXvYqw1qFjYXw+2BGCkNgi6jwz1OONVm1ujZbGxWiJdIiFAKA2wIA5WGoS7oeevXtam2JFuKU3jfA==
X-Received: by 2002:a62:20e:: with SMTP id 14mr725554pfc.153.1574213399322;
 Tue, 19 Nov 2019 17:29:59 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:59 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 20/46] powernv/eeh: Look up device info from pci_dev
Date: Wed, 20 Nov 2019 12:28:33 +1100
Message-Id: <20191120012859.23300-21-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most of what we fetch from the pci_dn is also in the pci_dev structure. Convert
the pnv_eeh_probe_pdev() to use the pdev fields rather than the pci_dn so we can
get rid of pci_dn eventually.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 26 ++++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index b79aca8368c6..6ba74836a9f8 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -372,7 +372,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	uint32_t pcie_flags;
 	int ret;
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
+	int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
 
 	/*
 	 * When probing the root bridge, which doesn't have any
@@ -392,18 +392,18 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	}
 
 	/* Skip for PCI-ISA bridge */
-	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
 	/* Initialize eeh device */
-	edev->class_code = pdn->class_code;
+	edev->class_code = pdev->class;
 	edev->pcix_cap = pci_find_capability(pdev, PCI_CAP_ID_PCIX);
 	edev->pcie_cap = pci_find_capability(pdev, PCI_CAP_ID_EXP);
 	edev->af_cap   = pci_find_capability(pdev, PCI_CAP_ID_AF);
 	edev->aer_cap  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ERR);
-	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
+	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
 			pnv_eeh_read_config(edev, edev->pcie_cap + PCI_EXP_FLAGS,
@@ -443,14 +443,14 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	 * Broadcom Shiner 4-ports 1G NICs (14e4:168a)
 	 * Broadcom Shiner 2-ports 10G NICs (14e4:168e)
 	 */
-	if ((pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
-	     pdn->device_id == 0x1656) ||
-	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
-	     pdn->device_id == 0x1657) ||
-	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
-	     pdn->device_id == 0x168a) ||
-	    (pdn->vendor_id == PCI_VENDOR_ID_BROADCOM &&
-	     pdn->device_id == 0x168e))
+	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
+	     pdev->device == 0x1656) ||
+	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
+	     pdev->device == 0x1657) ||
+	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
+	     pdev->device == 0x168a) ||
+	    (pdev->vendor == PCI_VENDOR_ID_BROADCOM &&
+	     pdev->device == 0x168e))
 		edev->pe->state |= EEH_PE_CFG_RESTRICTED;
 
 	/*
@@ -461,7 +461,7 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	 */
 	if (!(edev->pe->state & EEH_PE_PRI_BUS)) {
 		edev->pe->bus = pci_find_bus(hose->global_number,
-					     pdn->busno);
+					     pdev->bus->number);
 		if (edev->pe->bus)
 			edev->pe->state |= EEH_PE_PRI_BUS;
 	}
-- 
2.21.0

