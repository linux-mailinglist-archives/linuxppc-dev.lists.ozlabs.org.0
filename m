Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6325103180
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:20:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmcY3hBBzDqn1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:20:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sUy8mUyv"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVr5lllzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:12 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id a18so12975829plm.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8U2I25fBo+RTdyXptoH8t1ZtEn4P7D17j2WymyD/E0=;
 b=sUy8mUyv/biQUuX5ItnQg2bmeGV+sP18Mh2Lm/W+he2L0vwgyxQHsrjdqJtIenU6Ll
 ciHUD9+SndDCioIKg0qjcsflb4CvXUlvEwa9qOnP4b8rL+UwFEuexOUQvRkfeB/IAb/t
 R+hZK4xC2gl3xBjELjvtDxAs718QpoYn/iTbRdYOM2uhvkdkgHygs6+cQTp69q3XJeSw
 zZMsveRONrIAzhGrE6NQ40euCK/lo2vU/l2V6cXJJIN+EvTGuCINBGBqg2xyaQWv8M8Y
 +hO5wlvdJifwAA35OzSpqE+xy8AQA//EjlsdyQCZSqCydv9daGRSSh+4HCMV0iETCtcu
 Ju6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8U2I25fBo+RTdyXptoH8t1ZtEn4P7D17j2WymyD/E0=;
 b=lSCtP49SkK5+5kwTx0QnMS5bo2BxaCT0Nl0Qfak8+QRRirPIPnN17h7UgHQsLEHR6o
 uTSr0UfsIg9ITE0/ToOqZoU+29TsJtEjRfAPIQBimv/Qmre0g9par05utPB2ncnUFuYd
 OUlojqCybZo7JDTYZtOFab+dxMVWm3HCExVcUitnV7Mhinkbc1yTBYtmMQDIacxP0la6
 vHrOlUWyo4w300bIP/9omCKxUDgV9CqZpakmL8i+eijthxIB/h/rZdIGHOjwRBz2Q1Hf
 g1cMs7uFvzKegGn3peI765rzUrqt2R2PD1Pxn5wgCKKZsMhT51AjZHSXmMiDv5Jjfkcu
 j4tw==
X-Gm-Message-State: APjAAAWFbsBj/0t3UXK8IaDpzvfycizsVtFvC/O9Kojp4P8Sp99IcmFN
 s/6L0thVggpNNAbW/lLZqhF+1fTl
X-Google-Smtp-Source: APXvYqz9X9jXNKXtJ5MddqDgrOgQ4XNqA6TWVji5/lKH/y4itF9v2wezFq9YX9OmBMdsaeMf+dDD+A==
X-Received: by 2002:a17:90a:bb0d:: with SMTP id
 u13mr712886pjr.100.1574213410752; 
 Tue, 19 Nov 2019 17:30:10 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:10 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 25/46] powernv/pci: Remove pdn from
 pnv_pci_config_check_eeh()
Date: Wed, 20 Nov 2019 12:28:38 +1100
Message-Id: <20191120012859.23300-26-oohall@gmail.com>
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

Despite the name this function is generic PowerNV PCI code rather than anything
EEH specific. Convert to take a phb and bdfn rather than a pci_dn.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.c | 32 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 6170677bfdc7..50142ff045ac 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -591,9 +591,15 @@ static void pnv_pci_handle_eeh_config(struct pnv_phb *phb, u32 pe_no)
 	spin_unlock_irqrestore(&phb->lock, flags);
 }
 
-static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
+/*
+ * This, very strangely named, function checks if a config access
+ * caused an EEH and un-freezes the PE if it did. This is mainly
+ * for the !CONFIG_EEH case where nothing is going to un-freeze
+ * it for us.
+ */
+static void pnv_pci_config_check_eeh(struct pnv_phb *phb, u16 bdfn)
 {
-	struct pnv_phb *phb = pdn->phb->private_data;
+	struct pnv_ioda_pe *ioda_pe;
 	u8	fstate = 0;
 	__be16	pcierr = 0;
 	unsigned int pe_no;
@@ -604,10 +610,11 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 	 * setup that yet. So all ER errors should be mapped to
 	 * reserved PE.
 	 */
-	pe_no = pdn->pe_number;
-	if (pe_no == IODA_INVALID_PE) {
+	ioda_pe = __pnv_ioda_get_pe(phb, bdfn);
+	if (ioda_pe)
+		pe_no = ioda_pe->pe_number;
+	else
 		pe_no = phb->ioda.reserved_pe_idx;
-	}
 
 	/*
 	 * Fetch frozen state. If the PHB support compound PE,
@@ -629,7 +636,7 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 	}
 
 	pr_devel(" -> EEH check, bdfn=%04x PE#%x fstate=%x\n",
-		 (pdn->busno << 8) | (pdn->devfn), pe_no, fstate);
+		 bdfn, pe_no, fstate);
 
 	/* Clear the frozen state if applicable */
 	if (fstate == OPAL_EEH_STOPPED_MMIO_FREEZE ||
@@ -642,6 +649,7 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 		if (phb->freeze_pe)
 			phb->freeze_pe(phb, pe_no);
 
+		/* fish out the EEH log and send an EEH event. */
 		pnv_pci_handle_eeh_config(phb, pe_no);
 	}
 }
@@ -735,7 +743,8 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 			       int where, int size, u32 *val)
 {
 	struct pci_dn *pdn;
-	struct pnv_phb *phb;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
+	u16 bdfn = bus->number << 8 | devfn;
 	struct eeh_dev *edev;
 	int ret;
 
@@ -755,7 +764,7 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 		    eeh_dev_check_failure(edev))
                         return PCIBIOS_DEVICE_NOT_FOUND;
 	} else {
-		pnv_pci_config_check_eeh(pdn);
+		pnv_pci_config_check_eeh(phb, bdfn);
 	}
 
 	return ret;
@@ -766,7 +775,8 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 				int where, int size, u32 val)
 {
 	struct pci_dn *pdn;
-	struct pnv_phb *phb;
+	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
+	u16 bdfn = bus->number << 8 | devfn;
 	struct eeh_dev *edev;
 	int ret;
 
@@ -779,9 +789,9 @@ static int pnv_pci_write_config(struct pci_bus *bus,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
 	ret = pnv_pci_cfg_write(pdn, where, size, val);
-	phb = pdn->phb->private_data;
+
 	if (!(phb->flags & PNV_PHB_FLAG_EEH))
-		pnv_pci_config_check_eeh(pdn);
+		pnv_pci_config_check_eeh(phb, bdfn);
 
 	return ret;
 }
-- 
2.21.0

