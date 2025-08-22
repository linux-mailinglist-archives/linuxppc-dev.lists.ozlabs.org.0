Return-Path: <linuxppc-dev+bounces-11205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BE7B31D07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jxF59xrz3clf;
	Sat, 23 Aug 2025 00:58:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874705;
	cv=none; b=H5V8gAKt81RqtCN9mJBmWal18vnaU3RKg7uBFWemA8T2Fi0xG8A1E17dUAD+RefMv+S0sTSRK6Hl34VR8T3RUXVs10GrmQ1DA45MWZod5euBYcT2L+weJNLTUj86I6e2gNOrHSoqkSGQMM/ywPP6uW/00524cmY2/Dx25wZaPJi0NwhBxVhR0ZY48VG2rlFRbjKj8Xw9URG8lrq5GMQvTQeDpN0UsALcYl34XEQqvRx2aO4d7MtABfZcUa+NBBqbBujifOdj5XpPZMEEGANmr8rHZKkZysS5V5zt5y41w2lHjYaXY4wXYspNDErtvOg1D/rwwi9yUDVOAraqHjC8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874705; c=relaxed/relaxed;
	bh=puMEaJNJgu1P3i4XhfLXkIyYtE5ZA0dKhgA4gEVbimI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esjbOLB65I3vhaQxYId9nTCMjviYoaxOfz4lijenXmkQXhohXHQoy8Ayhy6v4R4nlCJoqaB/8IY+dUxj82d/d4FQTfWp7b6Qna8lJOhjnk2hl9tZf3buG9DPkaJYwCBQnkKX8Qm7ER46FPXZ4o8MUd+B+6prnIyF0aJcUO+cxoQb/HIEcsvp1TKEuhigKffpSGZnJGK3PcKGPdlfslpwzvkF6P6hbczaHpxaI5/jofB2C+aFFFr7554zeg7Q7Olp7DTptHSe+BI7+G4vUD26dRqMGqgn0GlNt+PR/dxZSaeLKgbYYR/aU+kJhzdIwaGZ/C9828Io1SHkGW/t62XSHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EceU7khK; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EceU7khK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jxD5kwVz3cls
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874705; x=1787410705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gchIaEGGMd1rP3k9+ZAelZgSdhp5C6iJlv32uxG+nxU=;
  b=EceU7khKXO96/EmyfoWKr6F+7tqtTJQ1rdeNUlgsrRpxD2gHnmcG2e5a
   XvbdNv58DUUVgQn5JU1ZDDPenXvXoskGI9FFUclxDxAjm9Rqp3EgrwLlE
   I5DuFKVpIcKuDLNhBKJJz5D5oPQdt6PmG76DUGV2pptwQSf99wsmsW4CW
   mVoGnFGWNrgUhj6h4mZkL2Lqu1TeoxpkvpnWHBQ1cMiSl2IJhyxvxdqwm
   4sSfmLOKwcneK+23DV6sO1Yrwtg+nfc30PQl6l5ipjIoG3tf9slO1Y3Ri
   7dxoTerZfpDtuKU8A4mKTY3gRzJGCmgGsqFB9ox5hLZHpxt+mbGAk4O8m
   A==;
X-CSE-ConnectionGUID: MyMw9n0QTd2nsnbgyTIVlA==
X-CSE-MsgGUID: k8GFZPFETm2Rjpvj3fWm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69283158"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69283158"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:21 -0700
X-CSE-ConnectionGUID: ypkw906bTXqIvRPHTHdqxg==
X-CSE-MsgGUID: VaLoVjPPS6WX/H2vbHvugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169547108"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 07/24] PCI: Disable non-claimed bridge window
Date: Fri, 22 Aug 2025 17:55:48 +0300
Message-Id: <20250822145605.18172-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
References: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If clipping or claiming the bridge window fails, the bridge window is
left into a state that does not match with the kernel's view on what
the bridge window is.

Disable the bridge window by writing the magic disable value into the
Base and Limit Registers if clipping or claiming failed. To detect if
claiming the resource was successful, add res->parent checks into the
bridge setup functions.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index b477f68b236c..6bdc1af887da 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -660,7 +660,7 @@ void pci_setup_cardbus(struct pci_bus *bus)
 
 	res = bus->resource[0];
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_IO) {
+	if (res->parent && res->flags & IORESOURCE_IO) {
 		/*
 		 * The IO resource is allocated a range twice as large as it
 		 * would normally need.  This allows us to set both IO regs.
@@ -674,7 +674,7 @@ void pci_setup_cardbus(struct pci_bus *bus)
 
 	res = bus->resource[1];
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_IO) {
+	if (res->parent && res->flags & IORESOURCE_IO) {
 		pci_info(bridge, "  bridge window %pR\n", res);
 		pci_write_config_dword(bridge, PCI_CB_IO_BASE_1,
 					region.start);
@@ -684,7 +684,7 @@ void pci_setup_cardbus(struct pci_bus *bus)
 
 	res = bus->resource[2];
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_MEM) {
+	if (res->parent && res->flags & IORESOURCE_MEM) {
 		pci_info(bridge, "  bridge window %pR\n", res);
 		pci_write_config_dword(bridge, PCI_CB_MEMORY_BASE_0,
 					region.start);
@@ -694,7 +694,7 @@ void pci_setup_cardbus(struct pci_bus *bus)
 
 	res = bus->resource[3];
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_MEM) {
+	if (res->parent && res->flags & IORESOURCE_MEM) {
 		pci_info(bridge, "  bridge window %pR\n", res);
 		pci_write_config_dword(bridge, PCI_CB_MEMORY_BASE_1,
 					region.start);
@@ -735,7 +735,7 @@ static void pci_setup_bridge_io(struct pci_dev *bridge)
 	res = &bridge->resource[PCI_BRIDGE_IO_WINDOW];
 	res_name = pci_resource_name(bridge, PCI_BRIDGE_IO_WINDOW);
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_IO) {
+	if (res->parent && res->flags & IORESOURCE_IO) {
 		pci_read_config_word(bridge, PCI_IO_BASE, &l);
 		io_base_lo = (region.start >> 8) & io_mask;
 		io_limit_lo = (region.end >> 8) & io_mask;
@@ -767,7 +767,7 @@ static void pci_setup_bridge_mmio(struct pci_dev *bridge)
 	res = &bridge->resource[PCI_BRIDGE_MEM_WINDOW];
 	res_name = pci_resource_name(bridge, PCI_BRIDGE_MEM_WINDOW);
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_MEM) {
+	if (res->parent && res->flags & IORESOURCE_MEM) {
 		l = (region.start >> 16) & 0xfff0;
 		l |= region.end & 0xfff00000;
 		pci_info(bridge, "  %s %pR\n", res_name, res);
@@ -796,7 +796,7 @@ static void pci_setup_bridge_mmio_pref(struct pci_dev *bridge)
 	res = &bridge->resource[PCI_BRIDGE_PREF_MEM_WINDOW];
 	res_name = pci_resource_name(bridge, PCI_BRIDGE_PREF_MEM_WINDOW);
 	pcibios_resource_to_bus(bridge->bus, &region, res);
-	if (res->flags & IORESOURCE_PREFETCH) {
+	if (res->parent && res->flags & IORESOURCE_PREFETCH) {
 		l = (region.start >> 16) & 0xfff0;
 		l |= region.end & 0xfff00000;
 		if (res->flags & IORESOURCE_MEM_64) {
@@ -848,6 +848,8 @@ static void pci_setup_bridge(struct pci_bus *bus)
 
 int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 {
+	int ret = -EINVAL;
+
 	if (i < PCI_BRIDGE_RESOURCES || i > PCI_BRIDGE_RESOURCE_END)
 		return 0;
 
@@ -861,11 +863,8 @@ int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 		return -EINVAL;
 
 	/* Try to clip the resource and claim the smaller window */
-	if (!pci_bus_clip_resource(bridge, i))
-		return -EINVAL;	/* Clipping didn't change anything */
-
-	if (!pci_claim_resource(bridge, i))
-		return -EINVAL;
+	if (pci_bus_clip_resource(bridge, i))
+		ret = pci_claim_resource(bridge, i);
 
 	switch (i) {
 	case PCI_BRIDGE_IO_WINDOW:
@@ -881,7 +880,7 @@ int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.39.5


