Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AED17B7A2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:43:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YfkN2cvlzDqht
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j6unKTZy; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YfdS6XlKzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:39:22 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id gc16so1396102pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqqQNAc5iVTrlztjwhopsgVBZ4WLgOMFIv3API3eM4k=;
 b=j6unKTZy7a7ux16jJK9fn/NwlLSjvFWoFkZuzpSUVKVQpJd+zjgalGt+tIY3EJc4OG
 75R5Xnst3Vq8hCEQTbxcEHTHwfhk31p8dpSIQ1BTm5uqps50RuB+Q4Mx2oiM3TqyLAIt
 CjbJlGpoG0UatzekMDLAYwKvHtZvMS5zzeYEXT0Cgsmu4MVtxSvujSDY9zrg8pOdSh24
 YdaKlH6GI6QLeb7M5+Sz+CcuwEdJMQbT60fiXDFx/Q52POWbIyelfyt5WCAKJD9txBXT
 MI2YnGZR3WKcQmGehxse0e9KTyLztRXXdk3TDRRIUyitxELaOjrsnu0iyvt29AmY7lMi
 i1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqqQNAc5iVTrlztjwhopsgVBZ4WLgOMFIv3API3eM4k=;
 b=D0v1eQXF7Dokg1HU8FFksm75OycII3QPizOcfkzfTTvwYO+oH1WrCUbfcleQ+eAGtv
 82CSecJd2+bZanupFtzGv7Gv45CjaeUydipu4UUU47sdfUhj5J38yNQ4+qiXNab6Q03i
 hUQxDvUctYuH/+1gqDXVvHQ9Vy93/FKxXOePIL0ph7I3UpSYGDC5aNDiUPESqbIS23J/
 BYOpPfW/G2bGNNTAlJQZgQyG5c2cwYHjA+EG3sBKnoAQmcBAGQy/Bw+M9qCGS/cAnH3p
 A1myYpSFHstI6knU2qv3d0kJO8Vjcr3PjrnehDVH126ZCSL+9JBsEUlx2iyYi7NiCQNq
 sbiw==
X-Gm-Message-State: ANhLgQ3ZNik0kv3GDVDXh4V9mqqvTSU0KLlRkn4B42M3Pm+hEhPHCKpz
 NNjkTDNiWbjWXcZdvOZe7jozOpoH4Ro=
X-Google-Smtp-Source: ADFU+vu1JW8lvbr4q0oWAqsa3DCenNhANYcGd/2LVx+yCxDKwVr86ynf/W2uWqM+cPp55ZgOVxNkLQ==
X-Received: by 2002:a17:902:eb0b:: with SMTP id
 l11mr1778773plb.240.1583480360750; 
 Thu, 05 Mar 2020 23:39:20 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b16sm6192999pff.25.2020.03.05.23.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:39:20 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/6] powerpc/eeh: Remove eeh_add_device_tree_late()
Date: Fri,  6 Mar 2020 18:39:00 +1100
Message-Id: <20200306073904.4737-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200306073904.4737-1-oohall@gmail.com>
References: <20200306073904.4737-1-oohall@gmail.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On pseries and PowerNV pcibios_bus_add_device() calls eeh_add_device_late()
so there's no need to do a separate tree traversal to bind the eeh_dev and
pci_dev together setting up the PHB at boot. As a result we can remove
eeh_add_device_tree_late().

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/eeh.h    |  3 ---
 arch/powerpc/kernel/eeh.c         | 25 -------------------------
 arch/powerpc/kernel/of_platform.c |  3 ---
 arch/powerpc/kernel/pci-common.c  |  3 ---
 4 files changed, 34 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 5a34907..5d10781 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -304,7 +304,6 @@ void eeh_addr_cache_init(void);
 void eeh_add_device_early(struct pci_dn *);
 void eeh_add_device_tree_early(struct pci_dn *);
 void eeh_add_device_late(struct pci_dev *);
-void eeh_add_device_tree_late(struct pci_bus *);
 void eeh_remove_device(struct pci_dev *);
 int eeh_unfreeze_pe(struct eeh_pe *pe);
 int eeh_pe_reset_and_recover(struct eeh_pe *pe);
@@ -365,8 +364,6 @@ static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
 
 static inline void eeh_add_device_late(struct pci_dev *dev) { }
 
-static inline void eeh_add_device_tree_late(struct pci_bus *bus) { }
-
 static inline void eeh_remove_device(struct pci_dev *dev) { }
 
 #define EEH_POSSIBLE_ERROR(val, type) (0)
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 0878912..9cb3370 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1214,31 +1214,6 @@ void eeh_add_device_late(struct pci_dev *dev)
 }
 
 /**
- * eeh_add_device_tree_late - Perform EEH initialization for the indicated PCI bus
- * @bus: PCI bus
- *
- * This routine must be used to perform EEH initialization for PCI
- * devices which are attached to the indicated PCI bus. The PCI bus
- * is added after system boot through hotplug or dlpar.
- */
-void eeh_add_device_tree_late(struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	if (eeh_has_flag(EEH_FORCE_DISABLED))
-		return;
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		eeh_add_device_late(dev);
-		if (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE) {
-			struct pci_bus *subbus = dev->subordinate;
-			if (subbus)
-				eeh_add_device_tree_late(subbus);
-		}
-	}
-}
-EXPORT_SYMBOL_GPL(eeh_add_device_tree_late);
-
-/**
  * eeh_remove_device - Undo EEH setup for the indicated pci device
  * @dev: pci device to be removed
  *
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index cb68800..64edac81 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -80,9 +80,6 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	 */
 	pcibios_claim_one_bus(phb->bus);
 
-	/* Finish EEH setup */
-	eeh_add_device_tree_late(phb->bus);
-
 	/* Add probed PCI devices to the device model */
 	pci_bus_add_devices(phb->bus);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 3d2b1cf..8983afa 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1399,9 +1399,6 @@ void pcibios_finish_adding_to_bus(struct pci_bus *bus)
 			pci_assign_unassigned_bus_resources(bus);
 	}
 
-	/* Fixup EEH */
-	eeh_add_device_tree_late(bus);
-
 	/* Add new devices to global lists.  Register in proc, sysfs. */
 	pci_bus_add_devices(bus);
 }
-- 
2.9.5

