Return-Path: <linuxppc-dev+bounces-11215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA95B31D1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 17:00:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jyz5qFzz3d81;
	Sat, 23 Aug 2025 00:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874795;
	cv=none; b=Mw9r5cQcvxGG1ZCYpLXA7ezRGimA1PVu/0EJ/kLVyro3D47OoY4hNkWdIavZD4n18qAosVHJpRhvPP9D1Aklg7o2UGGjyDY58RifR1gc6RycaFIxDSxr1X1spW52cQtaQUN7EcMuo7LYdCudN7/fp9DwnBeB8SN/XhAYNdn6GonxiXzQYgjHtd0Ok6aFnwf8y0fNglg2cs0UUTtlhIPDhuGf8HVb2pYCmHrr7mMQzR94TYUQFoEwqH/Yd+l10J1mQPW7JSWlA8aqdc3ZVn8UylSjiLx825JF4zyyxcmkacXvaFnHbcYoQf7UloqwqnDAO4h4w4XDFUf7OfL7f09D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874795; c=relaxed/relaxed;
	bh=w5LnShtsYnF+vZoVH2G65BcGBbtuJJkt+3qXX7HRvvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ULHgZb0jM02iHAxmkl9ThwwYAtVAqV6WkVMOsOhnDC1tBAEeLsCHLmn4PMegy3tLH3FzrZTvkAVN2XV/QRdRVt1eyn/tA24ZPM+1K6mSmi6W3ro1iW3dYhHaviGwfZz3LXzjpWA0Ot7CtCJrGLaT9emDQ0c370VzUPulQ21nFzGCbwGRlbRJitFDC5ZbYYhct9VUx2U++RXg6SUkRaSaX04YUHfhjiUswbu61PNKlewTwFbHSJ9x3e9VeDUHeewYWIJxhKVfXb/5F26MTkU80eSFsokLV84Y3XDZQ3u0AmeMjPIG+gN/yNGW5TJP9cjKqis3uZF45MiQGvNemFdPBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gs9W1L2O; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gs9W1L2O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jyy6jhKz3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874796; x=1787410796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LA/Wi//KofVB6JuAktPoP6oeJFceP9LDqmAtl8M/Pho=;
  b=gs9W1L2Otzv5l+kMjK0vwtuR3lYi0N1dstlxGqDlk9I/YcmWK+ptVHIf
   EpJuhfn776qcI/KTQd7IqABmQn4qCUgZdZxUbNwMhx3+Wo8h38bye1Kj2
   tKPw6/pt3UzIMwumiD+pgFOdivXpPCX2wXIg3kNFG4TBOv07gFxV2fYq3
   D/63qkWhGAOrLNnwakb5OmGcpRbW1zCjFgH2h0e66ioaeMqkIT4JFSrfO
   8+3Cch3/m7A9T4VcnS3TAkRLZTPtgw/gx2XAWrqqHzIvo8MX0LuaojQwZ
   8CRHXmUlaJFOKcnBYnFLFux7HellYLUMeoFP7zSRMjkfstjFE8iYImUSh
   w==;
X-CSE-ConnectionGUID: RIS9SRVUQiSbnGQkoZvqkw==
X-CSE-MsgGUID: hbQMTuwORveOssr2cpDGew==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75640770"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75640770"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:53 -0700
X-CSE-ConnectionGUID: XUYJVNexT5mA6fsjbzP14w==
X-CSE-MsgGUID: V9nZCPRqR/aPpyAtr6/8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172986963"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:47 -0700
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
Subject: [PATCH 23/24] PCI: Pass bridge window to pci_bus_release_bridge_resources()
Date: Fri, 22 Aug 2025 17:56:04 +0300
Message-Id: <20250822145605.18172-24-ilpo.jarvinen@linux.intel.com>
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

pci_bus_release_bridge_resources() takes type, which is converted
into a bridge window resource in pci_bridge_release_resources().

Find out the correct bridge window for resource whose assignment failed.
Pass that bridge window to pci_bus_release_bridge_resources() instead of
passing the type. When recursing to subordinate, check which bridge
windows have to be released and recurse for each.

For now, use pbus_select_window_for_type() instead of
pbus_select_window() because non-bridge window resources still have
their flags reset which destroys the type information from the struct
resource. The struct pci_dev_resource holds a copy of the flags which
are used instead.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 69 ++++++++++++++++-------------------------
 1 file changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index f5b0274bde0a..9c69a84f2b23 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1800,51 +1800,24 @@ static void __pci_bridge_assign_resources(const struct pci_dev *bridge,
 }
 
 static void pci_bridge_release_resources(struct pci_bus *bus,
-					 unsigned long type)
+					 struct resource *b_win)
 {
 	struct pci_dev *dev = bus->self;
-	struct resource *r;
-	struct resource *b_res;
 	int idx, ret;
 
-	b_res = &dev->resource[PCI_BRIDGE_RESOURCES];
-
-	/*
-	 * 1. If IO port assignment fails, release bridge IO port.
-	 * 2. If non pref MMIO assignment fails, release bridge nonpref MMIO.
-	 * 3. If 64bit pref MMIO assignment fails, and bridge pref is 64bit,
-	 *    release bridge pref MMIO.
-	 * 4. If pref MMIO assignment fails, and bridge pref is 32bit,
-	 *    release bridge pref MMIO.
-	 * 5. If pref MMIO assignment fails, and bridge pref is not
-	 *    assigned, release bridge nonpref MMIO.
-	 */
-	if (type & IORESOURCE_IO)
-		idx = 0;
-	else if (!(type & IORESOURCE_PREFETCH))
-		idx = 1;
-	else if ((type & IORESOURCE_MEM_64) &&
-		 (b_res[2].flags & IORESOURCE_MEM_64))
-		idx = 2;
-	else if (!(b_res[2].flags & IORESOURCE_MEM_64) &&
-		 (b_res[2].flags & IORESOURCE_PREFETCH))
-		idx = 2;
-	else
-		idx = 1;
-
-	r = &b_res[idx];
-
-	if (!r->parent)
+	if (!b_win->parent)
 		return;
 
+	idx = pci_resource_num(dev, b_win);
+
 	/* If there are children, release them all */
-	release_child_resources(r);
+	release_child_resources(b_win);
 
-	ret = pci_release_resource(dev, PCI_BRIDGE_RESOURCES + idx);
+	ret = pci_release_resource(dev, idx);
 	if (ret)
 		return;
 
-	pci_setup_one_bridge_window(dev, PCI_BRIDGE_RESOURCES + idx);
+	pci_setup_one_bridge_window(dev, idx);
 }
 
 enum release_type {
@@ -1857,7 +1830,7 @@ enum release_type {
  * a larger window later.
  */
 static void pci_bus_release_bridge_resources(struct pci_bus *bus,
-					     unsigned long type,
+					     struct resource *b_win,
 					     enum release_type rel_type)
 {
 	struct pci_dev *dev;
@@ -1865,6 +1838,8 @@ static void pci_bus_release_bridge_resources(struct pci_bus *bus,
 
 	list_for_each_entry(dev, &bus->devices, bus_list) {
 		struct pci_bus *b = dev->subordinate;
+		struct resource *res;
+
 		if (!b)
 			continue;
 
@@ -1873,9 +1848,15 @@ static void pci_bus_release_bridge_resources(struct pci_bus *bus,
 		if ((dev->class >> 8) != PCI_CLASS_BRIDGE_PCI)
 			continue;
 
-		if (rel_type == whole_subtree)
-			pci_bus_release_bridge_resources(b, type,
-						 whole_subtree);
+		if (rel_type != whole_subtree)
+			continue;
+
+		pci_bus_for_each_resource(b, res) {
+			if (res->parent != b_win)
+				continue;
+
+			pci_bus_release_bridge_resources(b, res, whole_subtree);
+		}
 	}
 
 	if (pci_is_root_bus(bus))
@@ -1885,7 +1866,7 @@ static void pci_bus_release_bridge_resources(struct pci_bus *bus,
 		return;
 
 	if ((rel_type == whole_subtree) || is_leaf_bridge)
-		pci_bridge_release_resources(bus, type);
+		pci_bridge_release_resources(bus, b_win);
 }
 
 static void pci_bus_dump_res(struct pci_bus *bus)
@@ -2282,9 +2263,13 @@ static void pci_prepare_next_assign_round(struct list_head *fail_head,
 	 * enough to contain child device resources.
 	 */
 	list_for_each_entry(fail_res, fail_head, list) {
-		pci_bus_release_bridge_resources(fail_res->dev->bus,
-						 fail_res->flags & PCI_RES_TYPE_MASK,
-						 rel_type);
+		struct pci_bus *bus = fail_res->dev->bus;
+		struct resource *b_win;
+
+		b_win = pbus_select_window_for_type(bus, fail_res->flags);
+		if (!b_win)
+			continue;
+		pci_bus_release_bridge_resources(bus, b_win, rel_type);
 	}
 
 	/* Restore size and flags */
-- 
2.39.5


