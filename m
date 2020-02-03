Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110A1502BD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 09:41:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1XG4rQnzDqJX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:41:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cpgQaUa3; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1P83GSqzDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 19:35:40 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id x185so7188357pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 00:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IHYBiRDIUYSPFG0aMcXkE2+n56hoafBKpFLgi9jucC4=;
 b=cpgQaUa3pLHnkHIDEqLx8DhPB6wa/253DsPf2YZ67lpuXJqpLFQmUl0+qv+Mh4XQpS
 TRSYlALnIU9DlvMniyfk5VzqOywA3R8Dw7WWIHnhuXNDv2ttBuFyVsIR2vWDVHQUXvb7
 pTmbyQFl6GekhlTXZeuHQtwJYfM/ljI7wA/EZrpJ8IYkfjlqZGHUORqlvdh9x2P9208+
 VY1hKC4eu/85oYx3bAcdgKYv7NZfN7q0/1l1wVF1e9Fb8w+P4Ozetm/VrcI1B90BM3cz
 k2pQzFQ949X1hq5P3d62WOKJX3AMUTqAjUz2DaiUtH4GfVY7FPq9pjfdmw1nACR+fSVK
 AffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IHYBiRDIUYSPFG0aMcXkE2+n56hoafBKpFLgi9jucC4=;
 b=m8PqqnxncLpK6nRhujfxm1f/CHv6KeOp/vvrgpE7oY5aiacjvfBff3BXnkWUKpfiPT
 jXyuN0hFMh1eWb/k6iDJomQMuX2rRtjQtARg9xmjwRn4TDLwnmP8rLz0Xiw6ToUi7XZQ
 dKE+/QAWug0n/G7vFC96CYsVRp2CNlMDu3FAgdkxy4SJuefSUDZV8gAX6lvprd0J503Q
 R/3ULCwQtJR27/W2OjiRw5Y+GefJGhD5+gAJqE6P8q9AKhWksXn1B5t+NFnJfJihX2PL
 t/FsVraIH0pTyWHHAmlKLVxOgZ/AMXay3jJeVaPR0gfJA3mRF3r748arQLNQQsmRc0fP
 Bw0A==
X-Gm-Message-State: APjAAAWIEKabsc3WEi0kVHaBYvRlWo0J/l5n92WZDHAMjoAwFLwWcpkW
 1mPGq6DRQ7PCEN/h2FjNU7/WdVgH
X-Google-Smtp-Source: APXvYqwU0oBlyc7wcqsuAX1xQU7IaBliBhHfN858auzGtip1IxfnK8lUCJwyOcQMhc6QsxRiwQSgTA==
X-Received: by 2002:a62:6381:: with SMTP id x123mr23476476pfb.75.1580718937675; 
 Mon, 03 Feb 2020 00:35:37 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q63sm19849132pfb.149.2020.02.03.00.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:35:37 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/eeh: Remove eeh_add_device_tree_late()
Date: Mon,  3 Feb 2020 19:35:17 +1100
Message-Id: <20200203083521.16549-3-oohall@gmail.com>
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

On pseries and PowerNV pcibios_bus_add_device() calls eeh_add_device_late()
so there's no need to do a separate tree traversal to bind the eeh_dev and
pci_dev together setting up the PHB at boot. As a result we can remove
eeh_add_device_tree_late().

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

