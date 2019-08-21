Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A400697242
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:30:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CyTD4PkYzDqPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 16:30:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bR9iERQr"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CyPY0gYBzDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 16:27:12 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id v12so729609pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3u1q9gBHHekLJtjosZFtKnjpFXDrwTcO7Z58nsRfLbE=;
 b=bR9iERQr2mB4DcarjypW+HL8vZoYsuhSMD87ibrrKYd6SpBo3LfAFKdDVG7CmAI898
 zZuaCX9DX+ar1c5bHHnp3Pbgi6xxclNFy0VYJlyoGu9p8dqOxRMsBQ6XoJ3+x83w1iio
 jRHW0qe7nJtABXq8tfSFjcqEabHJ0yF2YgxFcqUxLHlt4WrOLJ+zaJd8fl6+T+wiXakW
 BM19R+d9q8uQ4Fr07xKSVBlrayATkAA065KfaPnlFQGWW8pc7NqyDx6mNr7xs73KFfSb
 jHnoQ1wX3qYGQZIwX7ODX5lOdaesS8i+O1ddkLrkCJLTMpEtfAdoZmjEP2e+iyaanr1F
 NXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3u1q9gBHHekLJtjosZFtKnjpFXDrwTcO7Z58nsRfLbE=;
 b=e/5NLKbJ+TUR0T/B/s5u4OpMK7IYp4ZgyD3RD949F58F9PNFiTFrknqGyEio6mCHM2
 Rf7m1xrmyIoYY8B2czYE9BYZtsj5QijlxlEXaXW5zPwQzpAypDsFCly79HexMny3qvUt
 zhR6B4BmZmYCFgnMzAevybXYa0mf5f20sPzQ3rS51FCjj5FCpoq2weaYq4lVIJhbv7Sa
 AHivcfgsT56PiNCTfb6g72xazYTXYt6qbwhLTQLdZ2fERuczgZeo3Fb253iCx29muQ+B
 isnc1y0BE2inNFjV4eRHAgeYCLojXR/Xub7feqQ6Vz+LVKoFFVWWaAY+TUkXXFfht53/
 gmrA==
X-Gm-Message-State: APjAAAWKBNQLsKGQr9/VNInprFIz528wM8GRU/eQaM4P+KbRvL2caR3h
 LcpOPsBo1rSUnq77QkVcmKm7tzAC
X-Google-Smtp-Source: APXvYqz7PpB3GL8c8F6AnsO+RDo5V5AtdMJVHFzU82YT+wMb319cK6GU/G1+zhy8hEtQKvsfgzYbCQ==
X-Received: by 2002:a65:4509:: with SMTP id n9mr27726606pgq.133.1566368830879; 
 Tue, 20 Aug 2019 23:27:10 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v27sm34694103pgn.76.2019.08.20.23.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 23:27:10 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/pcidn: Make VF pci_dn management CONFIG_PCI_IOV
 specific
Date: Wed, 21 Aug 2019 16:26:54 +1000
Message-Id: <20190821062655.19735-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821062655.19735-1-oohall@gmail.com>
References: <20190821062655.19735-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc PCI code requires that a pci_dn structure exists for all
devices in the system. This is fine for real devices since at boot a pci_dn
is created for each PCI device in the DT and it's fine for hotplugged devices
since the hotplug slot driver will manage the pci_dn's devices in hotplug
slots. For SR-IOV, we need the platform / pcibios to manage the pci_dn for
virtual functions since firmware is unaware of VFs, and they aren't
"hot plugged" in the traditional sense.

Management of the pci_dn is handled by the, poorly named, functions:
add_pci_dev_data() and remove_pci_dev_data(). The entire body of these
functions is #ifdef`ed around CONFIG_PCI_IOV and they cannot be used
in any other context, so make them only available when CONFIG_PCI_IOV
is selected, and rename them to reflect their actual usage rather than
having them masquerade as generic code.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/pci-bridge.h     |  7 +++++--
 arch/powerpc/kernel/pci_dn.c              | 15 +++++----------
 arch/powerpc/platforms/powernv/pci-ioda.c |  4 ++--
 arch/powerpc/platforms/pseries/pci.c      |  4 ++--
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index ea6ec65..69f4cb3 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -223,12 +223,15 @@ struct pci_dn {
 extern struct pci_dn *pci_get_pdn_by_devfn(struct pci_bus *bus,
 					   int devfn);
 extern struct pci_dn *pci_get_pdn(struct pci_dev *pdev);
-extern struct pci_dn *add_dev_pci_data(struct pci_dev *pdev);
-extern void remove_dev_pci_data(struct pci_dev *pdev);
 extern struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
 					       struct device_node *dn);
 extern void pci_remove_device_node_info(struct device_node *dn);
 
+#ifdef CONFIG_PCI_IOV
+struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev);
+void remove_sriov_vf_pdns(struct pci_dev *pdev);
+#endif
+
 static inline int pci_device_from_OF_node(struct device_node *np,
 					  u8 *bus, u8 *devfn)
 {
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 795c4e3..24da1d8 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -125,7 +125,7 @@ struct pci_dn *pci_get_pdn(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_PCI_IOV
-static struct pci_dn *add_one_dev_pci_data(struct pci_dn *parent,
+static struct pci_dn *add_one_sriov_vf_pdn(struct pci_dn *parent,
 					   int vf_index,
 					   int busno, int devfn)
 {
@@ -151,11 +151,9 @@ static struct pci_dn *add_one_dev_pci_data(struct pci_dn *parent,
 
 	return pdn;
 }
-#endif
 
-struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
+struct pci_dn *add_sriov_vf_pdns(struct pci_dev *pdev)
 {
-#ifdef CONFIG_PCI_IOV
 	struct pci_dn *parent, *pdn;
 	int i;
 
@@ -176,7 +174,7 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
 	for (i = 0; i < pci_sriov_get_totalvfs(pdev); i++) {
 		struct eeh_dev *edev __maybe_unused;
 
-		pdn = add_one_dev_pci_data(parent, i,
+		pdn = add_one_sriov_vf_pdn(parent, i,
 					   pci_iov_virtfn_bus(pdev, i),
 					   pci_iov_virtfn_devfn(pdev, i));
 		if (!pdn) {
@@ -192,14 +190,11 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
 		edev->physfn = pdev;
 #endif /* CONFIG_EEH */
 	}
-#endif /* CONFIG_PCI_IOV */
-
 	return pci_get_pdn(pdev);
 }
 
-void remove_dev_pci_data(struct pci_dev *pdev)
+void remove_sriov_vf_pdns(struct pci_dev *pdev)
 {
-#ifdef CONFIG_PCI_IOV
 	struct pci_dn *parent;
 	struct pci_dn *pdn, *tmp;
 	int i;
@@ -271,8 +266,8 @@ void remove_dev_pci_data(struct pci_dev *pdev)
 			kfree(pdn);
 		}
 	}
-#endif /* CONFIG_PCI_IOV */
 }
+#endif /* CONFIG_PCI_IOV */
 
 struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
 					struct device_node *dn)
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d8080558d0..f1fa489 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1719,14 +1719,14 @@ int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
 	pnv_pci_sriov_disable(pdev);
 
 	/* Release PCI data */
-	remove_dev_pci_data(pdev);
+	remove_sriov_vf_pdns(pdev);
 	return 0;
 }
 
 int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	/* Allocate PCI data */
-	add_dev_pci_data(pdev);
+	add_sriov_vf_pdns(pdev);
 
 	return pnv_pci_sriov_enable(pdev, num_vfs);
 }
diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 7228309..911534b 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -192,7 +192,7 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
 {
 	/* Allocate PCI data */
-	add_dev_pci_data(pdev);
+	add_sriov_vf_pdns(pdev);
 	return pseries_pci_sriov_enable(pdev, num_vfs);
 }
 
@@ -204,7 +204,7 @@ int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
 	/* Releasing pe_num_map */
 	kfree(pdn->pe_num_map);
 	/* Release PCI data */
-	remove_dev_pci_data(pdev);
+	remove_sriov_vf_pdns(pdev);
 	pci_vf_drivers_autoprobe(pdev, true);
 	return 0;
 }
-- 
2.9.5

