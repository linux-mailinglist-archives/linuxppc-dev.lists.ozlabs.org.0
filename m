Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C15103182
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:22:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hmfm6LSfzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FQQQS6x7"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVv1j3nzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:15 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id d7so12988761pls.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UgOXx6S9TlWs4CSaBgzRNY47Nwl55tQcNqssLiiYRqM=;
 b=FQQQS6x7uxYx1doZrJ0n0238q2KbYHclq2TUF1EfU1n75aw0srHxM/aUqfSdE7bnrk
 8l7UihTkY6mFXf2PpCosTSXTo+nLghOV6OcxJd9kFX3CebaPi8yqFCb3KF6/S4BlhpDc
 oWvOQ8rTsSblT8oZ2lH9By7ZX/t89z05jj+AWdmbouzP7pVh9nCHw8Fctg3xlC+9YBT7
 vl7t5gqoZzjVKfYn7Oz2VVk8qvSoWCZTTUrw8NdoRzesgZFHLLV2/NbFVuBsgcP7kjcV
 IFt7rkIKAPTB4wlkokyp811OFOxY2LcxUdtyhSfPgvthObL8mtqa+jFlqPrE/33iyl54
 wnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgOXx6S9TlWs4CSaBgzRNY47Nwl55tQcNqssLiiYRqM=;
 b=aKu2/GEBJyZbAE0Idyg4+7YFyN98cbY4OlgTDKktTsHxtXpAn10HGaXbv7U0F6KydC
 mbtpQmlI0cymLJjilnLEHrgdh43wthShT2gMncPQdnE6D6XIpjoJnI7oul+FYXR+MCtA
 zfmAqAmPghZdu9cCTxXntV6COkFKxIoerG9j5Miza1Eqhp0aazm/tU/dG7KsPTEA0JED
 4b2SENYt52P7hY5kHCv54FsaT9QZE4GyFEFKQ92H8jYL9068wy29qWyocwskRvRzM6ez
 ImhjQsYdNkC3wHxXVizxffPunvZ6/AU4G6sLjye2QgC8dpIK/s4XwhUsc+fzuGRt5BrC
 MNaw==
X-Gm-Message-State: APjAAAXQgSu+snklre7YpfKnZmgIhbwtxI3/g6dZtrMIm8WjYvXk3FHK
 /bR6Vph/Ce3xat1npIwS61Wz8TqK
X-Google-Smtp-Source: APXvYqwICgOMqzRd2Oxe1lwtm/PQO9cqWkIWjiyKpya2I/VbgKGnLI9Mn+GOn56Nm7Zw/c4W4r/2Bw==
X-Received: by 2002:a17:902:b948:: with SMTP id
 h8mr224625pls.139.1574213413011; 
 Tue, 19 Nov 2019 17:30:13 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:12 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 26/46] powernv/pci: Remove pdn from pnv_pci_cfg_{read|write}
Date: Wed, 20 Nov 2019 12:28:39 +1100
Message-Id: <20191120012859.23300-27-oohall@gmail.com>
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

Remove the use of pci_dn from the low-level config space access functions.
These are used by the eeh's config ops and the bus config ops that we
provide to the PCI core.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 14 +++--------
 arch/powerpc/platforms/powernv/pci.c         | 26 ++++++++------------
 arch/powerpc/platforms/powernv/pci.h         |  6 ++---
 3 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 49a932ff092a..8a73bc7517c5 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -331,31 +331,25 @@ static inline bool pnv_eeh_cfg_blocked(struct eeh_dev *edev)
 static int pnv_eeh_read_config(struct eeh_dev *edev,
 			       int where, int size, u32 *val)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
+	struct pnv_phb *phb = edev->controller->private_data;
 
 	if (pnv_eeh_cfg_blocked(edev)) {
 		*val = 0xFFFFFFFF;
 		return PCIBIOS_SET_FAILED;
 	}
 
-	return pnv_pci_cfg_read(pdn, where, size, val);
+	return pnv_pci_cfg_read(phb, edev->bdfn, where, size, val);
 }
 
 static int pnv_eeh_write_config(struct eeh_dev *edev,
 				int where, int size, u32 val)
 {
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-
-	if (!pdn)
-		return PCIBIOS_DEVICE_NOT_FOUND;
+	struct pnv_phb *phb = edev->controller->private_data;
 
 	if (pnv_eeh_cfg_blocked(edev))
 		return PCIBIOS_SET_FAILED;
 
-	return pnv_pci_cfg_write(pdn, where, size, val);
+	return pnv_pci_cfg_write(phb, edev->bdfn, where, size, val);
 }
 
 static struct eeh_pe *pnv_eeh_pe_get_parent(struct pci_dev *pdev)
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 50142ff045ac..36eea4bb514c 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -654,11 +654,9 @@ static void pnv_pci_config_check_eeh(struct pnv_phb *phb, u16 bdfn)
 	}
 }
 
-int pnv_pci_cfg_read(struct pci_dn *pdn,
+int pnv_pci_cfg_read(struct pnv_phb *phb, u16 bdfn,
 		     int where, int size, u32 *val)
 {
-	struct pnv_phb *phb = pdn->phb->private_data;
-	u32 bdfn = (pdn->busno << 8) | pdn->devfn;
 	s64 rc;
 
 	switch (size) {
@@ -685,19 +683,16 @@ int pnv_pci_cfg_read(struct pci_dn *pdn,
 		return PCIBIOS_FUNC_NOT_SUPPORTED;
 	}
 
-	pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
-		 __func__, pdn->busno, pdn->devfn, where, size, *val);
+	pr_devel("%s: bdfn: %x  +%x/%x -> %08x\n",
+		 __func__, bdfn, where, size, *val);
 	return PCIBIOS_SUCCESSFUL;
 }
 
-int pnv_pci_cfg_write(struct pci_dn *pdn,
+int pnv_pci_cfg_write(struct pnv_phb *phb, u16 bdfn,
 		      int where, int size, u32 val)
 {
-	struct pnv_phb *phb = pdn->phb->private_data;
-	u32 bdfn = (pdn->busno << 8) | pdn->devfn;
-
-	pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
-		 __func__, pdn->busno, pdn->devfn, where, size, val);
+	pr_devel("%s: bdfn: %x +%x/%x -> %08x\n",
+		 __func__, bdfn, where, size, val);
 	switch (size) {
 	case 1:
 		opal_pci_config_write_byte(phb->opal_id, bdfn, where, val);
@@ -753,12 +748,11 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	edev = pdn_to_eeh_dev(pdn);
+	edev = pnv_eeh_find_edev(phb, bdfn);
 	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	ret = pnv_pci_cfg_read(pdn, where, size, val);
-	phb = pdn->phb->private_data;
+	ret = pnv_pci_cfg_read(phb, bdfn, where, size, val);
 	if (phb->flags & PNV_PHB_FLAG_EEH && edev) {
 		if (*val == EEH_IO_ERROR_VALUE(size) &&
 		    eeh_dev_check_failure(edev))
@@ -784,11 +778,11 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 	if (!pdn)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	edev = pdn_to_eeh_dev(pdn);
+	edev = pnv_eeh_find_edev(phb, bdfn);
 	if (!pnv_eeh_pre_cfg_check(edev))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	ret = pnv_pci_cfg_write(pdn, where, size, val);
+	ret = pnv_pci_cfg_write(phb, bdfn, where, size, val);
 
 	if (!(phb->flags & PNV_PHB_FLAG_EEH))
 		pnv_pci_config_check_eeh(phb, bdfn);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index be435a810d19..52dc4d05eaca 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -7,8 +7,6 @@
 #include <asm/iommu.h>
 #include <asm/msi_bitmap.h>
 
-struct pci_dn;
-
 enum pnv_phb_type {
 	PNV_PHB_IODA1		= 0,
 	PNV_PHB_IODA2		= 1,
@@ -174,9 +172,9 @@ extern struct pci_ops pnv_pci_ops;
 
 void pnv_pci_dump_phb_diag_data(struct pci_controller *hose,
 				unsigned char *log_buff);
-int pnv_pci_cfg_read(struct pci_dn *pdn,
+int pnv_pci_cfg_read(struct pnv_phb *phb, u16 bdfn,
 		     int where, int size, u32 *val);
-int pnv_pci_cfg_write(struct pci_dn *pdn,
+int pnv_pci_cfg_write(struct pnv_phb *phb, u16 bdfn,
 		      int where, int size, u32 val);
 extern struct iommu_table *pnv_pci_table_alloc(int nid);
 
-- 
2.21.0

