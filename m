Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EC4A667C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:23:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3205pFnzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmvCwrjT"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tH3FfqzDqdR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:39 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n190so8891190pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfxaMc7NY0qu6L1pFCnDnLivVFylL+4EqJ5kpGw5UAw=;
 b=cmvCwrjTDoi+8QgrB694d9zJryZ0bRL9vRBetzG7JdxaYF7YyimH7DBN/BMYJrnK/U
 vGVewwP/tPP9FXvDa4tkDXP7Mq+a79F5AbDUeu84G0CUWTozzyRFUMhoELpc1v/6jwJ3
 VtZPN37Q0jw2g0cA66PjbVnI97WmMUK2LIwD47piQdYIh47WH/Dw0ldQ+LwW7lgzKSmd
 pb9AA8Hy3eO6X5e3Upp119EegCqCEPmXZVLzZQcP0cjCalOYoZLUTan2jKJGeh5jjRbV
 RdDosYDF9WRYDuNifuXHiZx1RROmsG/x4YGDh9Y703xLPuWa0AvrdbyhP1LPrWaYxE4l
 vaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tfxaMc7NY0qu6L1pFCnDnLivVFylL+4EqJ5kpGw5UAw=;
 b=jgMP7or1oR2TF0gGUO6JseUaEBy6wLqh2r18rGKR55d26JHpHZRjL8TWIUvJs2++4Q
 X0x7f9RvngWQOhAwmSdcQJKfrGKro4pMVeRkQAredwEaj6304jPECjezNrvNF3u/7zXG
 99GMLZOjJ/dPbj1N5KyEi3BGd3GOWbl56VOL5n9U+nXRcta1sqKk0e1JMyerOSYxFMhr
 UYsRGhgjLrvB5mQDl8Y1qNde8sNJg8PbrQBe9+zK63ZoE7crqE9CyfOL5B4F/TytUX3U
 +ealLXC5NXq6kVImIBBVjqXpU/cmGLRbJT8ewyu+t1LqGYwl5n9Ria68EJg8bzCW3scg
 k8FA==
X-Gm-Message-State: APjAAAXm8mx154m19X58IiLrQv0XsTPkAuTfuRr/qbUWyfWuweCAhj7b
 VdjQtOqjoRXPrHlEo0VlHvTKoU8w
X-Google-Smtp-Source: APXvYqzlmTqxXjorXfJ3UiT91Pp6Z+uAVTFoh0SEv4IDcxNpTHeJN13pid6mSjZ76aJoM1Pg+ucz4g==
X-Received: by 2002:a65:6458:: with SMTP id s24mr29180418pgv.158.1567505796497; 
 Tue, 03 Sep 2019 03:16:36 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:30 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/14] powerpc/eeh: Fix race when freeing PDNs
Date: Tue,  3 Sep 2019 20:15:53 +1000
Message-Id: <20190903101605.2890-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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

When hot-adding devices we rely on the hotplug driver to create pci_dn's
for the devices under the hotplug slot. Converse, when hot-removing the
driver will remove the pci_dn's that it created. This is a problem because
the pci_dev is still live until it's refcount drops to zero. This can
happen if the driver is slow to tear down it's internal state. Ideally, the
driver would not attempt to perform any config accesses to the device once
it's been marked as removed, but sometimes it happens. As a result, we
might attempt to access the pci_dn for a device that has been torn down and
the kernel may crash as a result.

To fix this, don't free the pci_dn unless the corresponding pci_dev has
been released.  If the pci_dev is still live, then we mark the pci_dn with
a flag that indicates the pci_dev's release function should free it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/pci-bridge.h |  1 +
 arch/powerpc/kernel/pci-hotplug.c     |  7 +++++++
 arch/powerpc/kernel/pci_dn.c          | 21 +++++++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 54a9de01c2a3..69f4cb3b7c56 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -183,6 +183,7 @@ struct iommu_table;
 struct pci_dn {
 	int     flags;
 #define PCI_DN_FLAG_IOV_VF	0x01
+#define PCI_DN_FLAG_DEAD	0x02    /* Device has been hot-removed */
 
 	int	busno;			/* pci bus number */
 	int	devfn;			/* pci device and function number */
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 0b0cf8168b47..fc62c4bc47b1 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -55,11 +55,18 @@ EXPORT_SYMBOL_GPL(pci_find_bus_by_node);
 void pcibios_release_device(struct pci_dev *dev)
 {
 	struct pci_controller *phb = pci_bus_to_host(dev->bus);
+	struct pci_dn *pdn = pci_get_pdn(dev);
 
 	eeh_remove_device(dev);
 
 	if (phb->controller_ops.release_device)
 		phb->controller_ops.release_device(dev);
+
+	/* free()ing the pci_dn has been deferred to us, do it now */
+	if (pdn && (pdn->flags & PCI_DN_FLAG_DEAD)) {
+		pci_dbg(dev, "freeing dead pdn\n");
+		kfree(pdn);
+	}
 }
 
 /**
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index 5614ca0940ca..4e654df55969 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -320,6 +320,7 @@ void pci_remove_device_node_info(struct device_node *dn)
 {
 	struct pci_dn *pdn = dn ? PCI_DN(dn) : NULL;
 	struct device_node *parent;
+	struct pci_dev *pdev;
 #ifdef CONFIG_EEH
 	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
 
@@ -333,12 +334,28 @@ void pci_remove_device_node_info(struct device_node *dn)
 	WARN_ON(!list_empty(&pdn->child_list));
 	list_del(&pdn->list);
 
+	/* Drop the parent pci_dn's ref to our backing dt node */
 	parent = of_get_parent(dn);
 	if (parent)
 		of_node_put(parent);
 
-	dn->data = NULL;
-	kfree(pdn);
+	/*
+	 * At this point we *might* still have a pci_dev that was
+	 * instantiated from this pci_dn. So defer free()ing it until
+	 * the pci_dev's release function is called.
+	 */
+	pdev = pci_get_domain_bus_and_slot(pdn->phb->global_number,
+			pdn->busno, pdn->devfn);
+	if (pdev) {
+		/* NB: pdev has a ref to dn */
+		pci_dbg(pdev, "marked pdn (from %pOF) as dead\n", dn);
+		pdn->flags |= PCI_DN_FLAG_DEAD;
+	} else {
+		dn->data = NULL;
+		kfree(pdn);
+	}
+
+	pci_dev_put(pdev);
 }
 EXPORT_SYMBOL_GPL(pci_remove_device_node_info);
 
-- 
2.21.0

