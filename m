Return-Path: <linuxppc-dev+bounces-11207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8FB31D0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jxW1J3Tz3ckk;
	Sat, 23 Aug 2025 00:58:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874719;
	cv=none; b=jPk8wQyznxZ45WTVT7FP1eRgf7PTNqiVB3C5TaG5jOgh0uKD/ThoFPrFblEpSb2Tno3O4iPONtCz5vZv3wGYIkMJVdZZcxYYQP2+FXLoOkWJajeDTF99nKFx6mSwDiVuuTHhOQnfKjtkNg05Pv+J9LcAmG4gfGSDgHW67Yd2TDd7wJuYa4m6rd8Zrt6TBJYa7qgI6z2cjelP6oWndt2u5P6eyQarkSJ3lx6282drZVCVZEGtc6sry8itJ0FGn+Up/uPkHMLaiP5gtLYULcnsEp5SXTIrum9Brzlwztlr5Z/GkHZZjoisubrTgKTEJRmg11/WlUXYYym2uo8OerMtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874719; c=relaxed/relaxed;
	bh=SURGPdFvYue38XkxvBibHx6bGJB/1I329JXhABvssKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQkesYb/CB2yK9baUinuNF71GV8HX3V/zhBSMjUgU1S4cBCOZJPnvfqJs2GsNABQEFud/o82CoMflZOIL0E/xHdc6EovbFy4OVmYGWh6RQMw74WE/3srr7jwa8H1k93Tln8kaVQALV48ZG+fJeGrrqJc/uFVpTR88Xeo+2ncXzmYZHknBAWNCzuAd42DQa6wRa9jtfjx9o9j66URLXUYRBHf3Sxsr2mh7R3rqSxQuIQeD/2KaXEpMxBq7rRv6QiHL3qRgMHWvduJlQhgqQ+WybE+Ws8iAyRn2CO3+ECnFT0OL4l0FR9e4+VbyefRg+i8glq46oyKmrJBwSR8G/Hrsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ThCMslVx; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ThCMslVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jxV24Qzz3cmr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874719; x=1787410719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IncNjxzu3JkPyYz1f41Ws3Cm/NTK625NvqtomTkiAzw=;
  b=ThCMslVxB2pX4QME+dXrAzg96pzCdR/wj0QIG0tWXosk8SdZYGLqshVU
   AKf3Rg5dldVDhVViLHWNGt+OsUdn5lzaoXG+JQoV7WyxeaPwC/6E/OqOn
   xOM7Pdyx4tN66eTs9Nv1CXCCd6U3bq1BNEvEQ3AoOHtUQsdkGcW85xRrC
   1HmpeYnIliJX1fKjtUEaDvRGRYN/s6Odf4innSqnxDjvsRlW2Jkwh1A2J
   N009LumaKHZhpnWeiBjG7JFROSPlszFIfsmgNuKEhSoWeeAWlF/slfG+6
   4jIjXsCY8QJz27swXn6abzmLrUqVTO2K7bXFujA/aY9xIuy9Mb0ULub5C
   w==;
X-CSE-ConnectionGUID: PcPxukUwQP2gByg+W3yE7w==
X-CSE-MsgGUID: WzOByyqGQPCOYcadluvutQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80780598"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80780598"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:37 -0700
X-CSE-ConnectionGUID: e71T9w9/S8qvdwNwD4fkug==
X-CSE-MsgGUID: syw70RfbT6SQFg/yaKO71w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168232478"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:31 -0700
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
Subject: [PATCH 15/24] PCI: Use pbus_select_window() during BAR resize
Date: Fri, 22 Aug 2025 17:55:56 +0300
Message-Id: <20250822145605.18172-16-ilpo.jarvinen@linux.intel.com>
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

Prior to a BAR resize, __resource_resize_store() loops through the
normal resources of the PCI device and releases those that match to the
flags of the BAR to be resized. This is necessary to allow resizing
also the upstream bridge window as only childless bridge windows can be
resized.

While the flags check (mostly) works (if corner cases are ignored), the
more straightforward way is to check if the resources share the bridge
window. Change __resource_resize_store() to do the check using
pbus_select_window().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci-sysfs.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 162a5241c7f7..ce3923c4aa80 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1562,13 +1562,19 @@ static ssize_t __resource_resize_store(struct device *dev, int n,
 				       const char *buf, size_t count)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	unsigned long size, flags;
+	struct pci_bus *bus = pdev->bus;
+	struct resource *b_win, *res;
+	unsigned long size;
 	int ret, i;
 	u16 cmd;
 
 	if (kstrtoul(buf, 0, &size) < 0)
 		return -EINVAL;
 
+	b_win = pbus_select_window(bus, pci_resource_n(pdev, n));
+	if (!b_win)
+		return -EINVAL;
+
 	device_lock(dev);
 	if (dev->driver || pci_num_vf(pdev)) {
 		ret = -EBUSY;
@@ -1588,19 +1594,19 @@ static ssize_t __resource_resize_store(struct device *dev, int n,
 	pci_write_config_word(pdev, PCI_COMMAND,
 			      cmd & ~PCI_COMMAND_MEMORY);
 
-	flags = pci_resource_flags(pdev, n);
-
 	pci_remove_resource_files(pdev);
 
-	for (i = 0; i < PCI_BRIDGE_RESOURCES; i++) {
-		if (pci_resource_len(pdev, i) &&
-		    pci_resource_flags(pdev, i) == flags)
+	pci_dev_for_each_resource(pdev, res, i) {
+		if (i >= PCI_BRIDGE_RESOURCES)
+			break;
+
+		if (b_win == pbus_select_window(bus, res))
 			pci_release_resource(pdev, i);
 	}
 
 	ret = pci_resize_resource(pdev, n, size);
 
-	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_assign_unassigned_bus_resources(bus);
 
 	if (pci_create_resource_files(pdev))
 		pci_warn(pdev, "Failed to recreate resource files after BAR resizing\n");
-- 
2.39.5


