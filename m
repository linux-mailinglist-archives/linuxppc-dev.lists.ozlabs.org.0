Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E047710314F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:54:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hm2J0H9HzDqlR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:54:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qghqcI6z"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVJ1DbkzDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:42 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id z188so12496516pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83q6b8uDbaoGlx5PKrnNyybEKo2EjZeLxzgd0fncJeY=;
 b=qghqcI6zWMfIr0fM4GnEE89dW7q0htPUe1fEJo4MOMEBNiFa/OITO7oZNuqFhGTP2g
 gu3/VHoQhDQfij43fAmiY0/fjgemlZ48gDhQXEJ57UgCkj5t5NYgX/kmwiQyqn4jrG6n
 vsQ1xLO7i2Xga3ADRr6MK3VuMgdolLRZkBJFLIpaZVxcKO3UNMY6Uy8WZXWWQe1tL0PU
 VgRc4F0A6DubW2d0PhZzCtbs6loLqmCHykbLvpzW39vyU/RG4gIZpHb+ZXDMWRDiXzXP
 AYtGKnKMWJ1djb4uyuuq3AfdXqUi70BjYuPhjYnn5z3kgbVe9z2kUI4S1FJ3maMaC/xV
 oTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83q6b8uDbaoGlx5PKrnNyybEKo2EjZeLxzgd0fncJeY=;
 b=aJgN0dp/DWIwV8Nry0AUlWkdvhCplFOVlJFmXIy+NZs9xpVPt92yNhD6b2+uEN52vL
 CdLre881qAigtEUECaHE/HX4qHSA5cXvhwDRPzYecFfUGzw63gfrjctpUVTA6hRAzu5z
 Z56tET1VPwPMWktbzSth3L3qYoVjI1ixYZBl2ED1jTMkIVJrysEyPx9gYunlFkqxOPnC
 DyPGu2E0SIIgrJIUplpF+bXYEPA2VUifp72OGoVWJAzTGI7Aikzy8DuA3WNAsazset7v
 LhiluPvtJmgQHRlo+zNLN8gnaAEQ7HEZkv3HO79S45Y7Vlr1I8sXse3Mnz139A4CJOYn
 MDHQ==
X-Gm-Message-State: APjAAAUy9k1HsFvAPygf2bmkivGUSO/ozSSG6AmwDr65yXTyeHsrO1n5
 2xVMpwQSxGlICWLR4qun+S4t5oTN
X-Google-Smtp-Source: APXvYqzMvz3rKs330hfNEWoVanLvvO86NKovqfYvgMXiLAfTMsab04kJ22DtsGc3vgNbV8KTOiDsPA==
X-Received: by 2002:a63:1042:: with SMTP id 2mr169722pgq.59.1574213380675;
 Tue, 19 Nov 2019 17:29:40 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:40 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 12/46] powerpc/eeh: Split eeh_probe into probe_pdn and
 probe_pdev
Date: Wed, 20 Nov 2019 12:28:25 +1100
Message-Id: <20191120012859.23300-13-oohall@gmail.com>
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

The EEH core has a concept of "early probe" and "late probe." When the
EEH_PROBE_MODE_DEVTREE flag is set (i.e pseries) we call the eeh_ops->probe()
function in eeh_add_device_early() so the eeh_dev state is initialised based on
the pci_dn. It's important to realise that this happens *long* before the PCI
device has been probed and a pci_dev structure created. This is necessary due
to a PAPR requirement that EEH be enabled before to OS starts interacting
with the device.

The late probe is done in eeh_add_device_late() when the EEH_PROBE_MODE_DEV
flag is set (i.e. PowerNV). The main difference is the late probe happens
after the pci_dev has been created. As a result there is no actual dependency
on a pci_dn in the late probe case. Splitting the single eeh_ops->probe()
function into seperate functions allows us to simplify the late probe case
since we have access to a pci_dev at that point. Having access to a pci_dev
means that we can use the functions provided by the PCI core for finding
capabilities, etc rather than doing it manually.

It also changes the prototype for the probe functions to be void. Currently
they return a void *, but both implementations always return NULL so there's
not much point to it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  3 +-
 arch/powerpc/kernel/eeh.c                    |  6 ++--
 arch/powerpc/platforms/powernv/eeh-powernv.c | 29 ++++++--------------
 arch/powerpc/platforms/pseries/eeh_pseries.c | 13 ++++-----
 4 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 67847f8dfe71..466b0165fbcf 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -215,7 +215,8 @@ enum {
 struct eeh_ops {
 	char *name;
 	int (*init)(void);
-	void* (*probe)(struct pci_dn *pdn, void *data);
+	void (*probe_pdn)(struct pci_dn *pdn);    /* used on pseries */
+	void (*probe_pdev)(struct pci_dev *pdev); /* used on powernv */
 	int (*set_option)(struct eeh_pe *pe, int option);
 	int (*get_pe_addr)(struct eeh_pe *pe);
 	int (*get_state)(struct eeh_pe *pe, int *delay);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index c8039fdb23ba..087a98b42a8c 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1066,7 +1066,7 @@ void eeh_add_device_early(struct pci_dn *pdn)
 	    (eeh_has_flag(EEH_PROBE_MODE_DEVTREE) && 0 == phb->buid))
 		return;
 
-	eeh_ops->probe(pdn, NULL);
+	eeh_ops->probe_pdn(pdn);
 }
 
 /**
@@ -1135,8 +1135,8 @@ void eeh_add_device_late(struct pci_dev *dev)
 		dev->dev.archdata.edev = NULL;
 	}
 
-	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
-		eeh_ops->probe(pdn, NULL);
+	if (eeh_ops->probe_pdev && eeh_has_flag(EEH_PROBE_MODE_DEV))
+		eeh_ops->probe_pdev(dev);
 
 	edev->pdev = dev;
 	dev->dev.archdata.edev = edev;
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 6c5d9f1bc378..8bd5317aa878 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -346,23 +346,13 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
 
 /**
  * pnv_eeh_probe - Do probe on PCI device
- * @pdn: PCI device node
- * @data: unused
+ * @pdev: pci_dev to probe
  *
- * When EEH module is installed during system boot, all PCI devices
- * are checked one by one to see if it supports EEH. The function
- * is introduced for the purpose. By default, EEH has been enabled
- * on all PCI devices. That's to say, we only need do necessary
- * initialization on the corresponding eeh device and create PE
- * accordingly.
- *
- * It's notable that's unsafe to retrieve the EEH device through
- * the corresponding PCI device. During the PCI device hotplug, which
- * was possiblly triggered by EEH core, the binding between EEH device
- * and the PCI device isn't built yet.
+ * Creates (or finds an existing) edev for this pci_dev.
  */
-static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
+static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
 {
+	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pci_controller *hose = pdn->phb;
 	struct pnv_phb *phb = hose->private_data;
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
@@ -377,11 +367,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	 * the probing.
 	 */
 	if (!edev || edev->pe)
-		return NULL;
+		return;
 
 	/* Skip for PCI-ISA bridge */
 	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
-		return NULL;
+		return;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
@@ -411,7 +401,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	ret = eeh_add_to_parent_pe(edev);
 	if (ret) {
 		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
-		return NULL;
+		return;
 	}
 
 	/*
@@ -469,8 +459,6 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
 	eeh_save_bars(edev);
 
 	eeh_edev_dbg(edev, "EEH enabled on device\n");
-
-	return NULL;
 }
 
 /**
@@ -1673,7 +1661,8 @@ static int pnv_eeh_restore_config(struct eeh_dev *edev)
 static struct eeh_ops pnv_eeh_ops = {
 	.name                   = "powernv",
 	.init                   = pnv_eeh_init,
-	.probe			= pnv_eeh_probe,
+	.probe_pdn		= NULL,
+	.probe_pdev		= pnv_eeh_probe_pdev,
 	.set_option             = pnv_eeh_set_option,
 	.get_pe_addr            = pnv_eeh_get_pe_addr,
 	.get_state              = pnv_eeh_get_state,
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 6f911a048339..3ac23c884f4e 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -229,7 +229,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
  * are checked one by one to see if it supports EEH. The function
  * is introduced for the purpose.
  */
-static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
+static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
 {
 	struct eeh_dev *edev;
 	struct eeh_pe pe;
@@ -240,15 +240,15 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 	/* Retrieve OF node and eeh device */
 	edev = pdn_to_eeh_dev(pdn);
 	if (!edev || edev->pe)
-		return NULL;
+		return;
 
 	/* Check class/vendor/device IDs */
 	if (!pdn->vendor_id || !pdn->device_id || !pdn->class_code)
-		return NULL;
+		return;
 
 	/* Skip for PCI-ISA bridge */
         if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
-		return NULL;
+		return;
 
 	eeh_edev_dbg(edev, "Probing device\n");
 
@@ -315,8 +315,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
 
 	/* Save memory bars */
 	eeh_save_bars(edev);
-
-	return NULL;
 }
 
 /**
@@ -755,7 +753,8 @@ static int pseries_notify_resume(struct pci_dn *pdn)
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.init			= pseries_eeh_init,
-	.probe			= pseries_eeh_probe,
+	.probe_pdn		= pseries_eeh_probe_pdn,
+	.probe_pdev 		= NULL,
 	.set_option		= pseries_eeh_set_option,
 	.get_pe_addr		= pseries_eeh_get_pe_addr,
 	.get_state		= pseries_eeh_get_state,
-- 
2.21.0

