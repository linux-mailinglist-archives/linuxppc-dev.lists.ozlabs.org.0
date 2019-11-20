Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CEF103156
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:59:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hm9713bnzDqZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IYKWjXHd"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVQ2tY6zDqft
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:50 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id o14so3431540pjr.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYC37pirM36JrowhYInIuPZJM919chnsDhkxWMOx6nw=;
 b=IYKWjXHdyajMJUygVyBBHOuPTmsbJqm3322cjvqYFmC0BX6jbX+7ppBO2nIEJuXi1L
 8ufAPLb60H+B9p2BaqIIngSv/YatQs+gi87zpda43TzuRyJ1yalcXrSriuCGmE8S7Tar
 hqShc0vl+nq1GcNy6p7THGOzYmq81tR0MfrQUHY63ZroiH19MrCypsCBPiKWp2JRXu9u
 w2ZqmuCB9d/oQ2knZvZ3hL2EGK+wH7AbXg0m2OETZ1wTwW/UoJEkYhJZ+CA+BhbQ0zkj
 MQNtAOugHbPx9+gsMpPPKM7lODN3IUBfSnqFZRpHE6VSFHVitetrr2UUyHUoZmbxw1oq
 8zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYC37pirM36JrowhYInIuPZJM919chnsDhkxWMOx6nw=;
 b=QahNM+8GkVuba/JZKUUTEM8x8zkgd/bhC+T8nWdylGsFoK3rOULqU28gPdmAcUCEmB
 NSIBu3zxwwrww+GlD24a5a8aiduLEtzEW0GMIZXFHabgjXQDMA0aRu0nwI+iP/HLirlm
 +XUBtmqbZdoSbcg9izXa5N6jvwSLVUtpJdM2POPiNxa2IW+hHFY3kRu8WuTnkR+TN73t
 hoHKoT6MSRXops2wEqrcVlcqFRKgCKATbmB+RlAiXl5/aLLcfhUPD3G18uzIywdXFIHi
 0osuI7dKGh3Ak5D1kSqyG08UBv7lctF1o0lR/5dvLcVXOe6nb8RYouNpJEjDLpeZg1qd
 thhA==
X-Gm-Message-State: APjAAAVS5bDIwGnUA3I/4RKoM21BpL73TD95aOyWCqBsFCqNH1Hwklaq
 uwCTZRjZrn4UGna1AhAsE58MZ+dZ
X-Google-Smtp-Source: APXvYqzrTNXJwF46aVsxY1aMn34IcVYRP5y6vhUtnnsglOFavnQ3XM0Lfa/Ben/d4CertFSxfMLklQ==
X-Received: by 2002:a17:90a:353:: with SMTP id 19mr726530pjf.128.1574213388032; 
 Tue, 19 Nov 2019 17:29:48 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:47 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 15/46] powernv/eeh: Use pnv_eeh_*_config() for internal
 config ops
Date: Wed, 20 Nov 2019 12:28:28 +1100
Message-Id: <20191120012859.23300-16-oohall@gmail.com>
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

Use the pnv_eeh_{read|write}_config() functions that take an edev rather
than a pci_dn. This allows us to remove most of the explict uses of pci_dn
in the PowerNV EEH backend and localises them into a few functions which we
can fix later.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 153 +++++++++----------
 1 file changed, 70 insertions(+), 83 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index aa2935a08464..aaccb3768393 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -278,27 +278,73 @@ int pnv_eeh_post_init(void)
 	return ret;
 }
 
-static int pnv_eeh_find_cap(struct pci_dn *pdn, int cap)
+static inline bool pnv_eeh_cfg_blocked(struct eeh_dev *edev)
+{
+	if (!edev || !edev->pe)
+		return false;
+
+	/*
+	 * We will issue FLR or AF FLR to all VFs, which are contained
+	 * in VF PE. It relies on the EEH PCI config accessors. So we
+	 * can't block them during the window.
+	 */
+	if (edev->physfn && (edev->pe->state & EEH_PE_RESET))
+		return false;
+
+	if (edev->pe->state & EEH_PE_CFG_BLOCKED)
+		return true;
+
+	return false;
+}
+
+static int pnv_eeh_read_config(struct eeh_dev *edev,
+			       int where, int size, u32 *val)
+{
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
+	if (!pdn)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	if (pnv_eeh_cfg_blocked(edev)) {
+		*val = 0xFFFFFFFF;
+		return PCIBIOS_SET_FAILED;
+	}
+
+	return pnv_pci_cfg_read(pdn, where, size, val);
+}
+
+static int pnv_eeh_write_config(struct eeh_dev *edev,
+				int where, int size, u32 val)
+{
+	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+
+	if (!pdn)
+		return PCIBIOS_DEVICE_NOT_FOUND;
+
+	if (pnv_eeh_cfg_blocked(edev))
+		return PCIBIOS_SET_FAILED;
+
+	return pnv_pci_cfg_write(pdn, where, size, val);
+}
+
+static int pnv_eeh_find_cap(struct eeh_dev *edev, int cap)
 {
 	int pos = PCI_CAPABILITY_LIST;
 	int cnt = 48;   /* Maximal number of capabilities */
 	u32 status, id;
 
-	if (!pdn)
-		return 0;
-
 	/* Check if the device supports capabilities */
-	pnv_pci_cfg_read(pdn, PCI_STATUS, 2, &status);
+	pnv_eeh_read_config(edev, PCI_STATUS, 2, &status);
 	if (!(status & PCI_STATUS_CAP_LIST))
 		return 0;
 
 	while (cnt--) {
-		pnv_pci_cfg_read(pdn, pos, 1, &pos);
+		pnv_eeh_read_config(edev, pos, 1, &pos);
 		if (pos < 0x40)
 			break;
 
 		pos &= ~3;
-		pnv_pci_cfg_read(pdn, pos + PCI_CAP_LIST_ID, 1, &id);
+		pnv_eeh_read_config(edev, pos + PCI_CAP_LIST_ID, 1, &id);
 		if (id == 0xff)
 			break;
 
@@ -313,15 +359,14 @@ static int pnv_eeh_find_cap(struct pci_dn *pdn, int cap)
 	return 0;
 }
 
-static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
+static int pnv_eeh_find_ecap(struct eeh_dev *edev, int cap)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	u32 header;
 	int pos = 256, ttl = (4096 - 256) / 8;
 
 	if (!edev || !edev->pcie_cap)
 		return 0;
-	if (pnv_pci_cfg_read(pdn, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
+	if (pnv_eeh_read_config(edev, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
 		return 0;
 	else if (!header)
 		return 0;
@@ -334,7 +379,7 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 		if (pos < 256)
 			break;
 
-		if (pnv_pci_cfg_read(pdn, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
+		if (pnv_eeh_read_config(edev, pos, 4, &header) != PCIBIOS_SUCCESSFUL)
 			break;
 	}
 
@@ -382,15 +427,14 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 
 	/* Initialize eeh device */
 	edev->class_code = pdn->class_code;
-	edev->mode	&= 0xFFFFFF00;
-	edev->pcix_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_PCIX);
-	edev->pcie_cap = pnv_eeh_find_cap(pdn, PCI_CAP_ID_EXP);
-	edev->af_cap   = pnv_eeh_find_cap(pdn, PCI_CAP_ID_AF);
-	edev->aer_cap  = pnv_eeh_find_ecap(pdn, PCI_EXT_CAP_ID_ERR);
+	edev->pcix_cap = pnv_eeh_find_cap(edev, PCI_CAP_ID_PCIX);
+	edev->pcie_cap = pnv_eeh_find_cap(edev, PCI_CAP_ID_EXP);
+	edev->af_cap   = pnv_eeh_find_cap(edev, PCI_CAP_ID_AF);
+	edev->aer_cap  = pnv_eeh_find_ecap(edev, PCI_EXT_CAP_ID_ERR);
 	if ((edev->class_code >> 8) == PCI_CLASS_BRIDGE_PCI) {
 		edev->mode |= EEH_DEV_BRIDGE;
 		if (edev->pcie_cap) {
-			pnv_pci_cfg_read(pdn, edev->pcie_cap + PCI_EXP_FLAGS,
+			pnv_eeh_read_config(edev, edev->pcie_cap + PCI_EXP_FLAGS,
 					 2, &pcie_flags);
 			pcie_flags = (pcie_flags & PCI_EXP_FLAGS_TYPE) >> 4;
 			if (pcie_flags == PCI_EXP_TYPE_ROOT_PORT)
@@ -839,8 +883,7 @@ static int pnv_eeh_root_reset(struct pci_controller *hose, int option)
 
 static int __pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
 {
-	struct pci_dn *pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
+	struct eeh_dev *edev = pci_dev_to_eeh_dev(dev);
 	int aer = edev ? edev->aer_cap : 0;
 	u32 ctrl;
 
@@ -944,10 +987,9 @@ void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
 	}
 }
 
-static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
+static void pnv_eeh_wait_for_pending(struct eeh_dev *edev, const char *type,
 				     int pos, u16 mask)
 {
-	struct eeh_dev *edev = pdn->edev;
 	int i, status = 0;
 
 	/* Wait for Transaction Pending bit to be cleared */
@@ -965,9 +1007,8 @@ static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
 		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
 }
 
-static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
+static int pnv_eeh_do_flr(struct eeh_dev *edev, int option)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	u32 reg = 0;
 
 	if (WARN_ON(!edev->pcie_cap))
@@ -980,7 +1021,7 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
 	switch (option) {
 	case EEH_RESET_HOT:
 	case EEH_RESET_FUNDAMENTAL:
-		pnv_eeh_wait_for_pending(pdn, "",
+		pnv_eeh_wait_for_pending(edev, "",
 					 edev->pcie_cap + PCI_EXP_DEVSTA,
 					 PCI_EXP_DEVSTA_TRPND);
 		eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
@@ -1003,9 +1044,8 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
 	return 0;
 }
 
-static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
+static int pnv_eeh_do_af_flr(struct eeh_dev *edev, int option)
 {
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 	u32 cap = 0;
 
 	if (WARN_ON(!edev->af_cap))
@@ -1023,7 +1063,7 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
 		 * test is used, so we use the conrol offset rather than status
 		 * and shift the test bit to match.
 		 */
-		pnv_eeh_wait_for_pending(pdn, "AF",
+		pnv_eeh_wait_for_pending(edev, "AF",
 					 edev->af_cap + PCI_AF_CTRL,
 					 PCI_AF_STATUS_TP << 8);
 		eeh_ops->write_config(edev, edev->af_cap + PCI_AF_CTRL,
@@ -1042,20 +1082,18 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
 static int pnv_eeh_reset_vf_pe(struct eeh_pe *pe, int option)
 {
 	struct eeh_dev *edev;
-	struct pci_dn *pdn;
 	int ret;
 
 	/* The VF PE should have only one child device */
 	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
-	pdn = eeh_dev_to_pdn(edev);
-	if (!pdn)
+	if (!edev)
 		return -ENXIO;
 
-	ret = pnv_eeh_do_flr(pdn, option);
+	ret = pnv_eeh_do_flr(edev, option);
 	if (!ret)
 		return ret;
 
-	return pnv_eeh_do_af_flr(pdn, option);
+	return pnv_eeh_do_af_flr(edev, option);
 }
 
 /**
@@ -1244,57 +1282,6 @@ static int pnv_eeh_err_inject(struct eeh_pe *pe, int type, int func,
 	return 0;
 }
 
-static inline bool pnv_eeh_cfg_blocked(struct pci_dn *pdn)
-{
-	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
-
-	if (!edev || !edev->pe)
-		return false;
-
-	/*
-	 * We will issue FLR or AF FLR to all VFs, which are contained
-	 * in VF PE. It relies on the EEH PCI config accessors. So we
-	 * can't block them during the window.
-	 */
-	if (edev->physfn && (edev->pe->state & EEH_PE_RESET))
-		return false;
-
-	if (edev->pe->state & EEH_PE_CFG_BLOCKED)
-		return true;
-
-	return false;
-}
-
-static int pnv_eeh_read_config(struct eeh_dev *edev,
-			       int where, int size, u32 *val)
-{
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (pnv_eeh_cfg_blocked(pdn)) {
-		*val = 0xFFFFFFFF;
-		return PCIBIOS_SET_FAILED;
-	}
-
-	return pnv_pci_cfg_read(pdn, where, size, val);
-}
-
-static int pnv_eeh_write_config(struct eeh_dev *edev,
-				int where, int size, u32 val)
-{
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (pnv_eeh_cfg_blocked(pdn))
-		return PCIBIOS_SET_FAILED;
-
-	return pnv_pci_cfg_write(pdn, where, size, val);
-}
-
 static void pnv_eeh_dump_hub_diag_common(struct OpalIoP7IOCErrorData *data)
 {
 	/* GEM */
-- 
2.21.0

