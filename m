Return-Path: <linuxppc-dev+bounces-11213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463AEB31D17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jyd66J0z3d2c;
	Sat, 23 Aug 2025 00:59:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874777;
	cv=none; b=E1vlvuH6D1IKSaSpaqPekAEsn3M6DUd8f/xwNXOVtVzQtdMXNQOKxBYjubBWHLyL5B5vZ57fpWnvbMPl3DyrsoImezvmIoz1kaUDl9XQtSNahQJkO+DHltTiqlYCsi8prCHfycyaHCGT6ieInC9S5HcPC2u1EHVzspuirNj69qAk3Tf43vJKawKDc9asejR+cpLpkTFWV7L4o6cxv8Z9ChiScamGHQ94o8GCFTVQrUEVGnYXP0V3McXa/oxjr03q4Wsl8zusNKkYTB5P/dR/HZIE5l+KOywfSyDg+BxvygAgLSrzQdNG6GupIShUmtq1uOraxZWIPMZCrzQ59MW/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874777; c=relaxed/relaxed;
	bh=LLE0uJ+gfs9YGKAsnJn3dgiI4qEht8hutCAF3/wlLvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QHCq72pveKN46bQvMib8WqKl4sacErhmufm8L+Rabxo0MLJXBCTYzALBxIHkeoDyztfDBtj4Fz2dXtBWikILx/sRQNrDwxTrsufJhZlby2Zg1tthS5dAvKQw8MdO7y9SvY4L83TIeVAma9bySqKdi6HrZ2QF414FqtRNp8L/sEF6ALhb6glN9UvCLTp6KTGCwXHA3dw1majeMfIipVlve4OihLkK7hEKVTWiarhegE9xxgcYRBA+w69RFZq7esXpsOCSrbDN7k8VzmXZpKE8Q6yng10vv4dZJWvlt6Cp+tkJ5ysACVesb6vM0HfnNXQByt7wFM+Hdw6bz4zRxcDCaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yk+a4qYt; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yk+a4qYt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jyc0Wsjz3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874777; x=1787410777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FRfssbwFVOeTRuS2nCD7Ynmj6Ps7cVzti/WfWUW/SwQ=;
  b=Yk+a4qYtaNbw1tS/DcDhjgGmWHbSGlHRZpuOe6G+J1UyxEGeFEr57jU9
   wGc5Ju5aK7u6HXZIf1OmS/2jVrrMh3Tfgy3vlJt+WbQ0J0SoiAz/3Rkji
   0gMwHfcIxV/XojTTpR3daiFBLa4ZUyLAHW26KNxQmBINrrAk9H05recRK
   Z/+5hZpaAe1I2pswiHxaWOPIAZqcqGnAWoBhaciih+dnj6r4a3NDPbh5a
   M2m+wSkuF2P92yAi9xFI983i6DhSRuyKyCwDUFeW/QMRak46B5jbJmQXz
   lMvM4csmT5kH8MwXdN63BsWa7rFDbLQBfN5AOkyF7Z54M7XoHAyD18vTW
   w==;
X-CSE-ConnectionGUID: MzNA9U92TkSGwgQeADd0fg==
X-CSE-MsgGUID: ozzKZ22wQYWz4twqeLTb5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75640711"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75640711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:34 -0700
X-CSE-ConnectionGUID: 7HgkGi3zQqKRPBeZCM3JIw==
X-CSE-MsgGUID: FNeyO842RAq2qXrusEvxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172986945"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:29 -0700
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
Subject: [PATCH 21/24] PCI: Refactor remove_dev_resources() to use pbus_select_window()
Date: Fri, 22 Aug 2025 17:56:02 +0300
Message-Id: <20250822145605.18172-22-ilpo.jarvinen@linux.intel.com>
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

Convert remove_dev_resources() to use pbus_select_window(). As
'available' is not the real resources, the index has to be adjusted as
only bridge resource counterparts are present in the 'available' array.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ee2f2c78d8c9..ece533181ff1 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -2061,34 +2061,18 @@ static void remove_dev_resource(struct resource *avail, struct pci_dev *dev,
 static void remove_dev_resources(struct pci_dev *dev,
 				 struct resource available[PCI_P2P_BRIDGE_RESOURCE_NUM])
 {
-	struct resource *mmio_pref = &available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW];
-	struct resource *res;
+	struct resource *res, *b_win;
+	int idx;
 
 	pci_dev_for_each_resource(dev, res) {
-		if (resource_type(res) == IORESOURCE_IO) {
-			remove_dev_resource(&available[PCI_BUS_BRIDGE_IO_WINDOW],
-					    dev, res);
-		} else if (resource_type(res) == IORESOURCE_MEM) {
+		b_win = pbus_select_window(dev->bus, res);
+		if (!b_win)
+			continue;
 
-			/*
-			 * Make sure prefetchable memory is reduced from
-			 * the correct resource. Specifically we put 32-bit
-			 * prefetchable memory in non-prefetchable window
-			 * if there is a 64-bit prefetchable window.
-			 *
-			 * See comments in __pci_bus_size_bridges() for
-			 * more information.
-			 */
-			if ((res->flags & IORESOURCE_PREFETCH) &&
-			    ((res->flags & IORESOURCE_MEM_64) ==
-			     (mmio_pref->flags & IORESOURCE_MEM_64))) {
-				remove_dev_resource(&available[PCI_BUS_BRIDGE_PREF_MEM_WINDOW],
-						    dev, res);
-			} else {
-				remove_dev_resource(&available[PCI_BUS_BRIDGE_MEM_WINDOW],
-						    dev, res);
-			}
-		}
+		idx = pci_resource_num(dev->bus->self, b_win);
+		idx -= PCI_BRIDGE_RESOURCES;
+
+		remove_dev_resource(&available[idx], dev, res);
 	}
 }
 
-- 
2.39.5


