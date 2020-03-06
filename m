Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C954017B7AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:45:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yfmm1qT0zDqvx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hX0azpOc; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YfdT64FqzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:39:25 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id n24so677941pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4He9pN6HcJO9HZT8waSpEw8sQdr3ItupW8WCFQrK2yc=;
 b=hX0azpOcdMUBpxw5T99F/KcrJL/SKlE+JYGsrXDh9s385+R6eFG0qL1Pll1jiUzzTG
 ScgChfAzt3uf+6AEvZqHqaVr/m4NOL4GoBstX3N8fcvmK2Ag2gmHdMKjoa52bJML8q/v
 3tHHpdV2QENmEHj11uXvyF4RVCjdFhqiBYHP57qVnmgwt0mN3KDNq6qcBsc9WcREPELE
 hAOFHR/LzOxldc2rlmlK3nUqXum60x2u00AYEZxWBC7zDzZXNtd4YGv5XwaT55gVu3zW
 dB7YX5/erdlFjppTpBaT0W69maI70U2a7rfNDykLIsIyfLvDmZ4qB1Zjj4FngEpGMfYC
 3TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4He9pN6HcJO9HZT8waSpEw8sQdr3ItupW8WCFQrK2yc=;
 b=aQjGCo8oueJdfAHi+wva+ZzDB0t+2/oCYjH8FiHEgiQQz9Xb18zpaxACY6EUiSGmNE
 Ilhb+sJLCWnQXZmQM2FBhbySFsPgU78RsApBNXwGZgQcK3GoBgVMb7W/iGpjreaRD01R
 D3JX502FYHBqHNY1k8X52dGt7fr9sftnDjnXhmjL43AegNxXeXTazQe+edYHNlrq7M9u
 r47mHZBx+s+f8eyS5gGV3iWteyhB8R9bYHIItJaj5rh/Cp5Dt97A1OhdqbhPAyyjzUlV
 AgXp1OoCqxIrZsSp+nGu6Ak5EhOqWDnNcihMulE2f+hToi2ocFdE+VaoTMVHA3QuXeKl
 17Eg==
X-Gm-Message-State: ANhLgQ3QSkH2J4TafzjyXkt/ylve3DACxM+Adhkpzc/llZYOqFLFk5GG
 j9Chzxlu2lErdaQs6IUFt2vzHJzbCMo=
X-Google-Smtp-Source: ADFU+vtHVIpBuDYkNNHVa1FMg3iigKwSI2Pkd6HhM+uI6le63jYdGReuIKaKgm2HlJ5seTOPdQLvug==
X-Received: by 2002:a63:7a02:: with SMTP id v2mr2017832pgc.13.1583480362892;
 Thu, 05 Mar 2020 23:39:22 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b16sm6192999pff.25.2020.03.05.23.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:39:22 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/6] powerpc/eeh: Do early EEH init only when required
Date: Fri,  6 Mar 2020 18:39:01 +1100
Message-Id: <20200306073904.4737-3-oohall@gmail.com>
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

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
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

