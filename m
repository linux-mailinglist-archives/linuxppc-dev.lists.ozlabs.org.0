Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3DE6E9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 10:01:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471pcR5lD8zDqnn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 20:01:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jPPkZL9o"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471pSV178wzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 19:54:50 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id u9so1749156pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0Avz0Tu7xGXTMueLduwreUTtk3OeBAu9BGY0062r5s=;
 b=jPPkZL9oZ+4BBGtNUSParTCdoxGMTcmV/DOHFtVKBM3djJukwwTI4vexOF3xR0d2HK
 AfzmuPuaeriVHEIOcl2ZkiSMIqu3aynaAXfTOm0LnATEdO5e8ZzX5weS/CRzuCjhc+3j
 CID7lxWP5wEiNXC86dNOf5HflyUqUNc4THfshMLo5c17+U+glm1wrCe7bEVa15xpYppP
 UjmbSMBNaoAuOC9q+Y1tqdZGzIKAeupnhs1dfjmIBBaVNCqI+nXU7L05EaPtfsTY7zIB
 2zzVKtE8EvYEcg22LyTe0hAHXw67J2dFe+4AuT1ACeZR4KW8ACdq8g1egfTJHgvBB/H+
 alEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0Avz0Tu7xGXTMueLduwreUTtk3OeBAu9BGY0062r5s=;
 b=NbH3KcyCSY6M334A/IebG3kFQtXMDGoT9vR3AT+rBhJPmetbTFixfdPWwPo+ZG2eY1
 zuiLIFFXn07YMk2qrlj2UNJNd8qRaIaMd04aAduxTNvRCsopI7/JqBNro4mTVctaOF1S
 0qLyg7ORRV/KxlsJ3ji5MWl3ppP4gjpj+Af66NspKQGMNG0ZVvs15nd+5e4x2FGmdEuH
 RW/3yit9Ltlr0obLW1qOn1wEBuFohmXCtCrXHZItpzqzf6lpLPukxhcl/nY8mkFVPSeU
 QckA6zjjEXzl4Jhk/SDDrZNSx0QRiYrWiRD5779hpyP8cINiL+5W9+0mT9b36cJhXHlB
 ZtGA==
X-Gm-Message-State: APjAAAXKibiYPJhR4kuPA61Ls6rm2ecgb7TUM2dqNsUdnZFu/1NYx+7c
 4uEW4oDwAyy3SosnA+k3vRbL37KyPXs=
X-Google-Smtp-Source: APXvYqxwWQ+V7hAAVr6qKOUlkaphE8bJSOrJP3OgpvivebAwlApw//DL8Q8ukOBbelij4/ESEo60Tg==
X-Received: by 2002:a65:628e:: with SMTP id f14mr19910357pgv.114.1572252888010; 
 Mon, 28 Oct 2019 01:54:48 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id l24sm10046115pff.151.2019.10.28.01.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 01:54:47 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/pci: Remove pcibios_setup_bus_devices()
Date: Mon, 28 Oct 2019 19:54:24 +1100
Message-Id: <20191028085424.12006-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028085424.12006-1-oohall@gmail.com>
References: <20191028085424.12006-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, shawn@anastas.io
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the previous patch applied pcibios_setup_device() will always be run
when pcibios_bus_add_device() is called. There are several code paths where
pcibios_setup_bus_device() is still called (the PowerPC specific PCI
hotplug support is one) so with just the previous patch applied the setup
can be run multiple times on a device, once before the device is added
to the bus and once after.

There's no need to run the setup in the early case any more so just
remove it entirely.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/pci.h    |  1 -
 arch/powerpc/kernel/pci-common.c  | 25 -------------------------
 arch/powerpc/kernel/pci-hotplug.c |  1 -
 arch/powerpc/kernel/pci_of_scan.c |  1 -
 4 files changed, 28 deletions(-)

diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 327567b..63ed7e3 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -113,7 +113,6 @@ extern pgprot_t	pci_phys_mem_access_prot(struct file *file,
 					 pgprot_t prot);
 
 extern resource_size_t pcibios_io_space_offset(struct pci_controller *hose);
-extern void pcibios_setup_bus_devices(struct pci_bus *bus);
 extern void pcibios_setup_bus_self(struct pci_bus *bus);
 extern void pcibios_setup_phb_io_space(struct pci_controller *hose);
 extern void pcibios_scan_phb(struct pci_controller *hose);
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index b89925ed..f8a59d7 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1000,24 +1000,6 @@ int pcibios_add_device(struct pci_dev *dev)
 	return 0;
 }
 
-void pcibios_setup_bus_devices(struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	pr_debug("PCI: Fixup bus devices %d (%s)\n",
-		 bus->number, bus->self ? pci_name(bus->self) : "PHB");
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		/* Cardbus can call us to add new devices to a bus, so ignore
-		 * those who are already fully discovered
-		 */
-		if (pci_dev_is_added(dev))
-			continue;
-
-		pcibios_setup_device(dev);
-	}
-}
-
 void pcibios_set_master(struct pci_dev *dev)
 {
 	/* No special bus mastering setup handling */
@@ -1036,13 +1018,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
 
-void pci_fixup_cardbus(struct pci_bus *bus)
-{
-	/* Now fixup devices on that bus */
-	pcibios_setup_bus_devices(bus);
-}
-
-
 static int skip_isa_ioresource_align(struct pci_dev *dev)
 {
 	if (pci_has_flag(PCI_CAN_SKIP_ISA_ALIGN) &&
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index fc62c4b..d6a67f8 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -134,7 +134,6 @@ void pci_hp_add_devices(struct pci_bus *bus)
 		 */
 		slotno = PCI_SLOT(PCI_DN(dn->child)->devfn);
 		pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
-		pcibios_setup_bus_devices(bus);
 		max = bus->busn_res.start;
 		/*
 		 * Scan bridges that are already configured. We don't touch
diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index f91d7e9..c3024f1 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -414,7 +414,6 @@ static void __of_scan_bus(struct device_node *node, struct pci_bus *bus,
 	 */
 	if (!rescan_existing)
 		pcibios_setup_bus_self(bus);
-	pcibios_setup_bus_devices(bus);
 
 	/* Now scan child busses */
 	for_each_pci_bridge(dev, bus)
-- 
2.9.5

