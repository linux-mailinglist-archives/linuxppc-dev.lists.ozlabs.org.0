Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C110313A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:42:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HlnX0RfjzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:42:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UB8q/Yxf"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlV10xhbzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:28 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id a18so12974872plm.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EeIcyYZ07hIEz589Ge9qlHCKQ+seTNhhX79V6HyvQo=;
 b=UB8q/YxfuoVKi+LE7MmVKTTxg9Wp3In9MBkvvCp+/8Te2TtdsABz4oLiorZQz3/Xyc
 RglTwBEcoBa8EcQP1Q7f7jw/bVOYdcWv1ac//x+ApD2NBF8AKpKrYSu9Jiv+cR7CEsyH
 fVrRxnVez2H4gzewXN3AtXP8MVHEho6ds+Y7oie00E9sawohqzzOyo/WDM5fgo8TVqor
 5Ky36rGE6JCU1lbZ5n/cgJqcpxuO4QAUP8pg5posU/DBEfwJPqC/PAdCWjop2+0AJgmw
 +BXnJ2+ln6n+Xi8oFH6nnERGHyfqUJcE90lGpZOJRXDKiao//F9yduy3LZYeZkigtbCH
 qE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EeIcyYZ07hIEz589Ge9qlHCKQ+seTNhhX79V6HyvQo=;
 b=OQiHONYPuiAJ38uZNsz9r9TJn7CWsbs+XpU3w98mfcm+xrJVlKBsne/+R+3VYT6P4U
 hoyjM1ZNfjP0WUteXiq+FCsLRnHrFVWenNicfL54eLM3onE6nHlxDycJ4TI4EENgskK/
 br0vNolz6pTXjgYUDqwIw4h/6OgK/BKrtpyXh6NSGPJl0SpAdSvpTKdD4iVVBX0rBimK
 pFLqlzh6JLt681VJhGEKMFgjtNM5lr7meax6ag9RgCBh0ZKoxw/2GbzqtYFNiZLF2AaN
 86YyaUZ2+Z0AM3Wkh1DX1L5+Q6HrUlJZ/+k8mrUiUvFKM43FGvWPwUgsVcscNOquIVLZ
 BsBQ==
X-Gm-Message-State: APjAAAUT/d7rdqU7IlsFP1DyY1YXJ/T1yhsixqkAQqWHfBS6/ARfAJ4f
 TAstUT/UQRD00AoI2lLXwERa7OAR
X-Google-Smtp-Source: APXvYqwT+eZTWTWFQtQGMl+50S8WFi6MuHDIAH3BlEumIzq3j9kTKom9jbijrhVQrsZZo+8hJF4sLQ==
X-Received: by 2002:a17:90a:bb0d:: with SMTP id
 u13mr709446pjr.100.1574213366143; 
 Tue, 19 Nov 2019 17:29:26 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:25 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 06/46] powerpc/iov: Move VF pdev fixup into
 pcibios_fixup_iov()
Date: Wed, 20 Nov 2019 12:28:19 +1100
Message-Id: <20191120012859.23300-7-oohall@gmail.com>
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

Move this out of the PHB's dma_dev_setup() callback and into the
ppc_md.pcibios_fixup_iov callback. This ensures that the VF PE's
pdev pointer is always valid for the whole time the device is
added the bus.

This isn't strictly required, but it's slightly a slightly more logical
place to do the fixup and it makes dma_dev_setup a bit simpler.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 35 +++++++++++------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 45f974258766..c6ea7a504e04 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2910,9 +2910,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 	struct pci_dn *pdn;
 	int mul, total_vfs;
 
-	if (!pdev->is_physfn || pci_dev_is_added(pdev))
-		return;
-
 	pdn = pci_get_pdn(pdev);
 	pdn->vfs_expanded = 0;
 	pdn->m64_single_mode = false;
@@ -2987,6 +2984,22 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
 		res->end = res->start - 1;
 	}
 }
+
+static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
+{
+	if (WARN_ON(pci_dev_is_added(pdev)))
+		return;
+
+	if (pdev->is_virtfn) {
+		/* Fix the VF PE's pdev pointer */
+		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
+		pe->pdev = pdev;
+
+		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
+	} else if (pdev->is_physfn) {
+		pnv_pci_ioda_fixup_iov_resources(pdev);
+	}
+}
 #endif /* CONFIG_PCI_IOV */
 
 static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
@@ -3641,20 +3654,6 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 {
 	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
 	struct pnv_phb *phb = hose->private_data;
-#ifdef CONFIG_PCI_IOV
-	struct pnv_ioda_pe *pe;
-
-	/* Fix the VF pdn PE number */
-	if (pdev->is_virtfn) {
-		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-			if (pe->rid == ((pdev->bus->number << 8) |
-			    (pdev->devfn & 0xff))) {
-				pe->pdev = pdev;
-				break;
-			}
-		}
-	}
-#endif /* CONFIG_PCI_IOV */
 
 	pnv_pci_ioda_dma_dev_setup(phb, pdev);
 }
@@ -3945,7 +3944,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
 
 #ifdef CONFIG_PCI_IOV
-	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov_resources;
+	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
 	ppc_md.pcibios_iov_resource_alignment = pnv_pci_iov_resource_alignment;
 	ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
 	ppc_md.pcibios_sriov_disable = pnv_pcibios_sriov_disable;
-- 
2.21.0

