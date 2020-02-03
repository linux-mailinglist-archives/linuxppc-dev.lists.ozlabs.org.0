Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF541502C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 09:44:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48B1Zl5z6zzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=baQhf3Rp; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48B1PC0xSFzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 19:35:42 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id m13so6087171pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Feb 2020 00:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NPYhJk8azotk3oLYBlyaA07APyiwDJKpjs86BTeZack=;
 b=baQhf3RpC5lQkpkqAWhKPcmd7l6vDTUAyB3KxDGOBCGsNVIac09Z8qEq1B5CDRbng1
 E0X4SdqzxjBxOSayDsl4kDVa2wGJQmfiOw0quazpDRXjrs7R7JN4PewXclT7mr8NguVk
 kYq7ibvBVHJrY/BppV+Fq3/RaDVtTFMw5EZ735yr+wyt3I42z/PiIRI9CcwVlKLzJ+KQ
 uSRMhAVdpo04k5BzNBM9Fc7Y+zWtmQqrew7OaS/fUBa1d2vox04UC0YSyfMeultUUsR9
 UnpszhFPlLkC6xWFAD2RWDCy65lLpicStuJvJ6fy+dEFz8Z4gHRvhSrqcXFbVNoiirL+
 eoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NPYhJk8azotk3oLYBlyaA07APyiwDJKpjs86BTeZack=;
 b=sc52QtBqtavkcPL9WhSDPTKL1MO07u4K1oi5oFHvUAUXrAEjssDsJnGtT/rW3z0vcm
 JbvXGYbD7jxWzXEf7YS6ubptBEIyJwM12iW5kUqCUY9VGCwiOY+3hyhnZhr2SiqIRCBt
 CpgVzXYu7slIF2ULVddRPLBTMPgEWm9eQUtRl1rdQRMkgkFDYxJgXyxh5MTnFxSChgoL
 +RKJ/3O+Tcc+bQ4CD1mO8DSF+TeZXm0ei2P2V/9Gu+Gei/H50YzrBHqXVLMApb309TBN
 AfIAojQ51B9vNR0pY2WZkh9DksdKjNPOmaY3WxMVToZYy1UyQOeclLsQXWs+dUbKUXLC
 dApQ==
X-Gm-Message-State: APjAAAV8GyjVX6xVwmZLDTHJk3ubKA05BsVg9BTMvK2jPB4gKIGZuEX2
 0d0Nvm7G8AwgcCtvr9VHXM/S3U4B
X-Google-Smtp-Source: APXvYqyDVcx0+tviPk1vz7EqfSU1RcF6zVVYPsXosGuzNltiisi6S6qEu6Kc1oMNP1nrAZlUJId9sw==
X-Received: by 2002:a17:90a:9dc3:: with SMTP id
 x3mr27914382pjv.45.1580718939958; 
 Mon, 03 Feb 2020 00:35:39 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q63sm19849132pfb.149.2020.02.03.00.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:35:39 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/eeh: Do early EEH init only when required
Date: Mon,  3 Feb 2020 19:35:18 +1100
Message-Id: <20200203083521.16549-4-oohall@gmail.com>
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

The pci hotplug helper (pci_hp_add_devices()) calls
eeh_add_device_tree_early() to scan the device-tree for new PCI devices and
do the early EEH probe before the device is scanned. This early probe is a
no-op in a lot of cases because:

a) The early init is only required to satisfy a PAPR requirement that EEH
   be configured before we start doing config accesses. On PowerNV it is
   a no-op.

b) It's a no-op for devices that have already had their eeh_dev
   initialised.

There are four callers of pci_hp_add_devices():

1. arch/powerpc/kernel/eeh_driver.c
	Here the hotplug helper is called when re-scanning pci_devs that
	were removed during an EEH recovery pass. The EEH stat for each
	removed device (the eeh_dev) is retained across a recovery pass
	so the early init is a no-op in this case.

2. drivers/pci/hotplug/pnv_php.c
	This is also a no-op since the PowerNV hotplug driver is, suprisingly,
	PowerNV specific.

3. drivers/pci/hotplug/rpaphp_core.c
4. drivers/pci/hotplug/rpaphp_pci.c
	In these two cases new devices have been hotplugged and FW has
	provided new DT nodes for each. These are the only two cases where
	the EEH we might have new PCI device nodes in the DT so these are
	the only two cases where the early EEH probe needs to be done.

We can move the calls to eeh_add_device_tree_early() to the locations where
it's needed and remove it from the generic path. This is preparation for
making the early EEH probe pseries specific.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/pci-hotplug.c | 2 --
 drivers/pci/hotplug/rpaphp_core.c | 2 ++
 drivers/pci/hotplug/rpaphp_pci.c  | 4 +++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index d6a67f8..bf83f76 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -112,8 +112,6 @@ void pci_hp_add_devices(struct pci_bus *bus)
 	struct pci_controller *phb;
 	struct device_node *dn = pci_bus_to_OF_node(bus);
 
-	eeh_add_device_tree_early(PCI_DN(dn));
-
 	phb = pci_bus_to_host(bus);
 
 	mode = PCI_PROBE_NORMAL;
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index e408e40..9c1e43e 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -494,6 +494,8 @@ static int enable_slot(struct hotplug_slot *hotplug_slot)
 		return retval;
 
 	if (state == PRESENT) {
+		eeh_add_device_tree_early(PCI_DN(slot->dn));
+
 		pci_lock_rescan_remove();
 		pci_hp_add_devices(slot->bus);
 		pci_unlock_rescan_remove();
diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
index beca61b..61ebbd8 100644
--- a/drivers/pci/hotplug/rpaphp_pci.c
+++ b/drivers/pci/hotplug/rpaphp_pci.c
@@ -95,8 +95,10 @@ int rpaphp_enable_slot(struct slot *slot)
 			return -EINVAL;
 		}
 
-		if (list_empty(&bus->devices))
+		if (list_empty(&bus->devices)) {
+			eeh_add_device_tree_early(PCI_DN(slot->dn));
 			pci_hp_add_devices(bus);
+		}
 
 		if (!list_empty(&bus->devices)) {
 			slot->state = CONFIGURED;
-- 
2.9.5

