Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C11502BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 09:39:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1Td4KQWzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kZUuTQRU; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1P7360YzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 19:35:38 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id l24so7431038pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 00:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ghiI/Rp5ZeFZOc5JwLDM+xSpBbhusEyITziyaG/aezg=;
 b=kZUuTQRUAakT71LT5D6bpKoTOx1G4qUeUtSMtcHJ7HhoL/H4A9Ker/U3cZZ3iWbKDf
 yK5ngOPpKFkWm67FTzs5/3WyCMWfe+1kJplCry9d9SF36sxxoDcZMrsZ2ymGjzIqobQa
 +iSnClXVI+ISzeTNjsWZyZNPpQcL06+TQ6xdORmQpwvxb7CnmKetTDGSGTpvufJ8iSwf
 jFoczgOkyhqc0lJnPmsysF8orEOjwLHpdKEEA00aDaHq2M6K2Ak8+f+yj4A16yX0YU/N
 iP+d6/Ct8KH+n2GrXZJhfH9mwHbGyOK+LGECrdo7W0wC+aqEHVTW7/HSVPLtUoA28CLI
 Wv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ghiI/Rp5ZeFZOc5JwLDM+xSpBbhusEyITziyaG/aezg=;
 b=qjJagDuXr+F7vHNqpiBVyBeRh4ZduYDfEZk1sQzRv7/dOWAazB40r5BQ7za2DRsytX
 3jVMNQyfU1Xjo/EB8H4jigx7zepy/o8A8YDe0+HGg7N6ZSRurmHuGxmsHLOa0yO75i8y
 emni9YqHVpelgrXFnyzkeFQJ67Vf1EtawZ2W55eINVMKnuV09lzs4zjL/es1ioqi7dRH
 K1bs3LbMMWk3+iqh+eZkXaEA5RADJes4/YNed/8smrrvc74FuSbeFgBnY0sEPN3CKoVe
 YddxGVUw76ewCEH1uCE5mctMDs1MA7U7+fAdhOqIb4jsXbXo5BbcNrl1smg6J67YeBkO
 RLQg==
X-Gm-Message-State: APjAAAXEQOiF1Swu12U+G4PwFlKLo6MWF3Ye9CI4R2CEJtZnVjB5z5jQ
 G2FpBryyeI2TxXGzpU7S80F9iuA1
X-Google-Smtp-Source: APXvYqwauiiy5s7dxssjwy8Metfx20P7Fq179cg8Z2Rm64mnv7BrIdbgKeZ+LY1JKe+wpPVbLCEijA==
X-Received: by 2002:a63:cf08:: with SMTP id j8mr24011195pgg.292.1580718935351; 
 Mon, 03 Feb 2020 00:35:35 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q63sm19849132pfb.149.2020.02.03.00.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:35:35 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/eeh: Add sysfs files in late probe
Date: Mon,  3 Feb 2020 19:35:16 +1100
Message-Id: <20200203083521.16549-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200203083521.16549-1-oohall@gmail.com>
References: <20200203083521.16549-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, tyreld@linux.ibm.com,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move creating the EEH specific sysfs files into eeh_add_device_late()
rather than being open-coded all over the place. Calling the function is
generally done immediately after calling eeh_add_device_late() anyway. The
two cases where it's not done there (OF based PCI probing and the pseries
VFs) don't seem to have any issues with the re-ordering.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h               |  3 ---
 arch/powerpc/kernel/eeh.c                    | 24 +-----------------------
 arch/powerpc/kernel/of_platform.c            |  3 ---
 arch/powerpc/kernel/pci-common.c             |  3 ---
 arch/powerpc/platforms/powernv/eeh-powernv.c |  1 -
 arch/powerpc/platforms/pseries/eeh_pseries.c |  3 +--
 6 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 6f9b2a1..5a34907 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -305,7 +305,6 @@ void eeh_add_device_early(struct pci_dn *);
 void eeh_add_device_tree_early(struct pci_dn *);
 void eeh_add_device_late(struct pci_dev *);
 void eeh_add_device_tree_late(struct pci_bus *);
-void eeh_add_sysfs_files(struct pci_bus *);
 void eeh_remove_device(struct pci_dev *);
 int eeh_unfreeze_pe(struct eeh_pe *pe);
 int eeh_pe_reset_and_recover(struct eeh_pe *pe);
@@ -368,8 +367,6 @@ static inline void eeh_add_device_late(struct pci_dev *dev) { }
 
 static inline void eeh_add_device_tree_late(struct pci_bus *bus) { }
 
-static inline void eeh_add_sysfs_files(struct pci_bus *bus) { }
-
 static inline void eeh_remove_device(struct pci_dev *dev) { }
 
 #define EEH_POSSIBLE_ERROR(val, type) (0)
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 17cb3e9..0878912 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1210,6 +1210,7 @@ void eeh_add_device_late(struct pci_dev *dev)
 	dev->dev.archdata.edev = edev;
 
 	eeh_addr_cache_insert_dev(dev);
+	eeh_sysfs_add_device(dev);
 }
 
 /**
@@ -1238,29 +1239,6 @@ void eeh_add_device_tree_late(struct pci_bus *bus)
 EXPORT_SYMBOL_GPL(eeh_add_device_tree_late);
 
 /**
- * eeh_add_sysfs_files - Add EEH sysfs files for the indicated PCI bus
- * @bus: PCI bus
- *
- * This routine must be used to add EEH sysfs files for PCI
- * devices which are attached to the indicated PCI bus. The PCI bus
- * is added after system boot through hotplug or dlpar.
- */
-void eeh_add_sysfs_files(struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		eeh_sysfs_add_device(dev);
-		if (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE) {
-			struct pci_bus *subbus = dev->subordinate;
-			if (subbus)
-				eeh_add_sysfs_files(subbus);
-		}
-	}
-}
-EXPORT_SYMBOL_GPL(eeh_add_sysfs_files);
-
-/**
  * eeh_remove_device - Undo EEH setup for the indicated pci device
  * @dev: pci device to be removed
  *
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 427fc22..cb68800 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -86,9 +86,6 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	/* Add probed PCI devices to the device model */
 	pci_bus_add_devices(phb->bus);
 
-	/* sysfs files should only be added after devices are added */
-	eeh_add_sysfs_files(phb->bus);
-
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c6c0341..3d2b1cf 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1404,9 +1404,6 @@ void pcibios_finish_adding_to_bus(struct pci_bus *bus)
 
 	/* Add new devices to global lists.  Register in proc, sysfs. */
 	pci_bus_add_devices(bus);
-
-	/* sysfs files should only be added after devices are added */
-	eeh_add_sysfs_files(bus);
 }
 EXPORT_SYMBOL_GPL(pcibios_finish_adding_to_bus);
 
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 6f300ab..ef727ec 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -48,7 +48,6 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
-	eeh_sysfs_add_device(pdev);
 }
 
 static int pnv_eeh_init(void)
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 893ba3f..95bbf91 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -68,7 +68,6 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	}
 #endif
 	eeh_add_device_early(pdn);
-	eeh_add_device_late(pdev);
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
 		struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
@@ -78,7 +77,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 		eeh_add_to_parent_pe(edev);   /* Add as VF PE type */
 	}
 #endif
-	eeh_sysfs_add_device(pdev);
+	eeh_add_device_late(pdev);
 }
 
 /*
-- 
2.9.5

