Return-Path: <linuxppc-dev+bounces-11204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7EB31D06
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jx91Sfgz3chK;
	Sat, 23 Aug 2025 00:58:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874701;
	cv=none; b=I8abbFJHAhrhhAldKmHoWwR1MtPOCdZgxEHSVTNVkvwcYL6uiaXL1l6f1VCT6P1y09ggcwNHUS87RnNRlXuwiSf6W6N0yM9lydC9tbzWBeLB8088C4ILZq268e1rFCtxa0Jsfs48t1vGfbkCTjgn84xuPFlLP8f4uW9ebrwS77XEIzbRkDFmTBy6opgDcuDCDd4zCDWcqzR6yFrye1w+tvDk/RjxDuqrImM76p/bBeqN11APr59Jd/8Lbx9qjCzs2bs2SPR5qBRYPyKTxGXsXsf2OvNU7kRTaabn8WtZ8IqVmF6aEms6Hcnnm9bYDdRBy8AYTYw2zo3xGu3MQA3y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874701; c=relaxed/relaxed;
	bh=oJ9kQ9QX2mrfzmekeYQKbTX8wjXZePSlaiD5fJiKhKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVIncs6OeMA6/NEWALpX3NTKHZtnNNP9615no3/HVSEBYpNKB5aIpYfQS/+WccS2onC7QAkU80f4p7L3eTcnR0OVbedeP454+q4bbeee3vMUMEEmNTd+2FjDIlt1qcv4MrOx9m60VlwjwTSHhov6wCiURsvXIo8xbr4BM8OK2TQndn2dyDyDm++dQIzl97LSm8f7vb9PFpjZNZesBNXST/IgvkQkFvIGcRZrXCdbKJk6UzzAH4Anx1Ca6+SlhUW1m4mD7vmrzX9Jg5dQHDWFkksa0oFDS+HdD98pgzC0URQPL2Z6O7ZiGuDPe9sgA2OONQdCmj44Pgj2ihH/ncKhpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2rH9VxE; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V2rH9VxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jx82cNHz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874701; x=1787410701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9B/2/rkIoDBIm4IVMedT6yw/8fy5XFXgmUft891BmJg=;
  b=V2rH9VxEpBHZGt/v52sVchXbzK5npEXGritufo/fuRoq8WRwZFm9zsSC
   WAy9EwlWmkl6wylJ+8f2uxsym3sSwIglC0DCRbVNsF1+yYJCfa58PtEAd
   bFzBwy9cGyXgGHHDSH2sGBxcteaKJGoPfNjVvICynrMfII9GgMEWNM320
   OxgnzPJidiBqtbrCvtTyW5kKRZGOVzx2L2g6HHVJ3Xo7WIhjHPOSYNwYE
   I6kDKOGx9U2d+Za99jQX6AHeD7gjnrh4b+MjHhrc17D0M5ymAB8+0U4MJ
   E7nvvofjYEN0iD52CCPWXjEHNNoX/zrIXQhrNXj+3zk60V0X53uyJHZnr
   w==;
X-CSE-ConnectionGUID: ROT6fS87QJqYtQMuKvOrsw==
X-CSE-MsgGUID: EssyUX7YTbmmiNoCBR/uqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80780550"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80780550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:19 -0700
X-CSE-ConnectionGUID: wIvH4dl9SZ6yJbAG3Hjt8Q==
X-CSE-MsgGUID: w6Fs+Ad5RZ62WfjHUtvaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168232369"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:13 -0700
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
Subject: [PATCH 13/24] PCI: Fix finding bridge window in pci_reassign_bridge_resources()
Date: Fri, 22 Aug 2025 17:55:54 +0300
Message-Id: <20250822145605.18172-14-ilpo.jarvinen@linux.intel.com>
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

pci_reassign_bridge_resources() walks upwards in the PCI bus hierarchy,
locates the relevant bridge window on each level using flags check, and
attempts to release the bridge window. The flags-based check is fragile
due to various fallbacks bridge window selection logic might use. As
such, the algorithm might not locate the correct bridge window.

Refactor pci_reassign_bridge_resources() to determine the correct
bridge window using pbus_select_window() that contains logic to handle
all fallback cases correctly. Change function prefix to pbus as it now
inputs struct bus and resource for which to locate the bridge window.

The main purpose of this change is to make bridge window selection
logic consistent across the entire PCI core (one step at a time). While
this technically also fixes the commit 8bb705e3e79d ("PCI: Add
pci_resize_resource() for resizing BARs") making the bridge window walk
algorithm more robust, The normal setup having a 64-bit resizable BAR
underneath bridge(s) with 64-bit prefetchable windows does not need to
use any fallbacks. As such, the practical impact is low (requiring BAR
resize use case and a non-typical bridge device).

The way to detect if unrelated resource failed again is left to use the
type based approximation which should not behave worse than before.

Fixes: 8bb705e3e79d ("PCI: Add pci_resize_resource() for resizing BARs")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h       |  2 +-
 drivers/pci/setup-bus.c | 40 ++++++++++++++++++++--------------------
 drivers/pci/setup-res.c |  2 +-
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index cbd40f05c39c..0d96a9141227 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -334,7 +334,7 @@ struct device *pci_get_host_bridge_device(struct pci_dev *dev);
 void pci_put_host_bridge_device(struct device *dev);
 
 unsigned int pci_rescan_bus_bridge_resize(struct pci_dev *bridge);
-int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type);
+int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 
 int pci_configure_extended_tags(struct pci_dev *dev, void *ign);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 0c0872b85762..5ef6362b5166 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2521,10 +2521,17 @@ void pci_assign_unassigned_bridge_resources(struct pci_dev *bridge)
 }
 EXPORT_SYMBOL_GPL(pci_assign_unassigned_bridge_resources);
 
-int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
+/*
+ * Walk to the root hub, find the bridge window relevant for @res and
+ * releasing it when possible. If the bridge window contains assigned
+ * resources, it cannot be released.
+ */
+int pbus_reassign_bridge_resources(struct pci_bus *bus, struct resource *res)
 {
+	unsigned long type = res->flags;
 	struct pci_dev_resource *dev_res;
-	struct pci_dev *next;
+	struct pci_dev *bridge;
+	const char *res_name;
 	LIST_HEAD(saved);
 	LIST_HEAD(added);
 	LIST_HEAD(failed);
@@ -2533,33 +2540,26 @@ int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
 
 	down_read(&pci_bus_sem);
 
-	/* Walk to the root hub, releasing bridge BARs when possible */
-	next = bridge;
-	do {
-		bridge = next;
-		for (i = PCI_BRIDGE_RESOURCES; i < PCI_BRIDGE_RESOURCE_END;
-		     i++) {
-			struct resource *res = &bridge->resource[i];
-
-			if ((res->flags ^ type) & PCI_RES_TYPE_MASK)
-				continue;
+	while (!pci_is_root_bus(bus)) {
+		bridge = bus->self;
+		res = pbus_select_window(bus, res);
+		if (!res)
+			break;
 
-			/* Ignore BARs which are still in use */
-			if (res->child)
-				continue;
+		i = pci_resource_num(bridge, res);
+		res_name = pci_resource_name(bridge, i);
 
+		/* Ignore BARs which are still in use */
+		if (!res->child) {
 			ret = add_to_list(&saved, bridge, res, 0, 0);
 			if (ret)
 				goto cleanup;
 
 			pci_release_resource(bridge, i);
-			break;
 		}
-		if (i == PCI_BRIDGE_RESOURCE_END)
-			break;
 
-		next = bridge->bus ? bridge->bus->self : NULL;
-	} while (next);
+		bus = bus->parent;
+	}
 
 	if (list_empty(&saved)) {
 		up_read(&pci_bus_sem);
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index 21f77e5c647c..c3ba4ccecd43 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -496,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
 
 	/* Check if the new config works by trying to assign everything. */
 	if (dev->bus->self) {
-		ret = pci_reassign_bridge_resources(dev->bus->self, res->flags);
+		ret = pbus_reassign_bridge_resources(dev->bus, res);
 		if (ret)
 			goto error_resize;
 	}
-- 
2.39.5


