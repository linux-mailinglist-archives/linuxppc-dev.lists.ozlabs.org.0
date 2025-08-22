Return-Path: <linuxppc-dev+bounces-11202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BDFB31D00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jx01WW5z3clB;
	Sat, 23 Aug 2025 00:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874692;
	cv=none; b=NUPJ0zEaS7oRoqpoox2bNlZu8WleG2K5jKi9xqq86b+PlVJOGOIpcZFqwMhKixhgy2rYI+TEwxrN08D9gKcLcdm4sOxULnzLhONghoQ00t6JRHWbb2hNqy7DHKGLOfnO+xbV8GfJGO5Q4O7hUJG5a0uIDSCaJpwmYcfIOFqjtZaxZ8EkFtUYrM8yykKOJl9T5SLz1YSDHCAexs+HHVjYtYek5eu6tRCtbMWipZsoDMSd9kG/CTvwcB9VgthpkD0jRa4ANNZtdwJnp6MTx0OECT8ObP5krcxjlfy+AFR1s+got/z/aBsv84SCg4/ABMSDBssAR0jWC+UGFkbTY4io4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874692; c=relaxed/relaxed;
	bh=DOktjaMzPRiKWwMF1+YgByk3SsbVfwL2Vo8CUOCr6SU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LcQiP8tXFy+NicMhWOWF/LNKm6HEu6Lk7vAV/Mk30dQ1L6E+aQZo2ZPM5jIpgySQ4QoLEH3ma4kIdW0yavINQJLRFMnLTBzLeT0O99zpMqkshUKC2c2+d0dnqtb+o43w7Ec29X5lR2ySfafaYCo63KIbrJmDiO2e5KRbyZQMFpDoKyuq8XyVp/y/cy1Z4gYPg4EAis6fAHaZyZnF6qngzs3Umw/JAeWFJHBHEct58v9lwU6aVvNWaU2BkQUOa3FVoHH9pRBPRWHIv990rfdMCvF7KBMpDj1RQd6wopqOpap+WpTge2dAnq1l98RxcPHdCAJQbvR/gzT+SbQUqspl+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLP8nQql; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TLP8nQql;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwz2Z6hz3ckP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874692; x=1787410692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HvowNzzh/OD6cGrbG0ubHIxVA4Lk6Q820KCMwB+uzto=;
  b=TLP8nQqlasazr3XWwbM5iU7FiBvzlDJSliYwdYem0WfasZG4nuXCHJJ5
   6IdSZhE8H4sh1J1avBkaxOTejjTTfcaloWdN+Xle1B3OWhl01KRomUw+M
   aEswtpK4wOs/63Pp86LA97qZ8/86sXqvBEWBcTOmsGcE2/9CVbrfh3Ql+
   vZGb3u0YJ5WARG4JSJeI/K9A0EaqeewLhj9mG0xkBQRNGHf2YRGtcr+rb
   vz1uswwk6bWU1SOCOsxHg9u/OBlizHobTNdRgF3wkFEj8/ooPHMmrk6S0
   YIvVUfPH+3rwhHvIeNtmU5D7amZZKo9delgI5qXvTEk4cHCD2R255gXJo
   w==;
X-CSE-ConnectionGUID: c4D0AwIiRH+0knlsl630rA==
X-CSE-MsgGUID: 3NYVou/4TdGecvz/egzm4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80780524"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="80780524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:09 -0700
X-CSE-ConnectionGUID: vlviQhsgTCG2Kd8H61AzWw==
X-CSE-MsgGUID: h4VZ9g4tQ6e8L99bQN0BOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168232306"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:04 -0700
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
Subject: [PATCH 12/24] PCI: Add bridge window selection functions
Date: Fri, 22 Aug 2025 17:55:53 +0300
Message-Id: <20250822145605.18172-13-ilpo.jarvinen@linux.intel.com>
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

Various places in the PCI core code make independently a decision into
which bridge window a child resource should be placed to. It is hard to
see whether these decisions always end up into agreement, especially in
the corner cases, and in some places it requires complex logic to pass
multiple resource types and/or bridge windows around.

Add pbus_select_window() and pbus_select_window_for_type() for case
where the former cannot be used so that eventually the same helper can
be used to select the bridge window everywhere. Using the same function
ensures the selected bridge window remains always the same and it can
be easily recalculated in-situ allowing simplifying the interfaces
between internal functions in upcoming changes.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h       |   2 +
 drivers/pci/setup-bus.c | 101 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1dc8a8066761..cbd40f05c39c 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -385,6 +385,8 @@ static inline int pci_resource_num(const struct pci_dev *dev,
 	return resno;
 }
 
+struct resource *pbus_select_window(struct pci_bus *bus,
+				    const struct resource *res);
 void pci_reassigndev_resource_alignment(struct pci_dev *dev);
 void pci_disable_bridge_window(struct pci_dev *dev);
 struct pci_bus *pci_bus_get(struct pci_bus *bus);
diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 223f0e025407..0c0872b85762 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -172,6 +172,107 @@ static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
 	return r_assigned;
 }
 
+/**
+ * pbus_select_window_for_type - Select bridge window for a resource type
+ * @bus: PCI bus
+ * @type: Resource type (resource flags can be passed as is)
+ *
+ * Selects the bridge window based on a resource @type.
+ *
+ * For memory resources, the selection is done as follows:
+ *
+ * Any non-prefetchable resource is put into the non-prefetchable window.
+ *
+ * If there is no prefetchable MMIO window, put all memory resources into the
+ * non-prefetchable window.
+ *
+ * If there's a 64-bit prefetchable MMIO window, put all 64-bit prefetchable
+ * resources into it and place 32-bit prefetchable memory into the
+ * non-prefetchable window.
+ *
+ * Otherwise, put all prefetchable resources into the prefetchable window.
+ *
+ * Return: the bridge window resource or NULL if no bridge window is found.
+ */
+static struct resource *pbus_select_window_for_type(struct pci_bus *bus,
+						    unsigned long type)
+{
+	int iores_type = type & IORESOURCE_TYPE_BITS;	/* w/o 64bit & pref */
+	struct resource *mmio, *mmio_pref, *win;
+
+	type &= PCI_RES_TYPE_MASK;			/* with 64bit & pref */
+
+	if ((iores_type != IORESOURCE_IO) && (iores_type != IORESOURCE_MEM))
+		return NULL;
+
+	if (pci_is_root_bus(bus)) {
+		win = find_bus_resource_of_type(bus, type, type);
+		if (win)
+			return win;
+
+		type &= ~IORESOURCE_MEM_64;
+		win = find_bus_resource_of_type(bus, type, type);
+		if (win)
+			return win;
+
+		type &= ~IORESOURCE_PREFETCH;
+		return find_bus_resource_of_type(bus, type, type);
+	}
+
+	switch (iores_type) {
+	case IORESOURCE_IO:
+		return pci_bus_resource_n(bus, PCI_BUS_BRIDGE_IO_WINDOW);
+
+	case IORESOURCE_MEM:
+		mmio = pci_bus_resource_n(bus, PCI_BUS_BRIDGE_MEM_WINDOW);
+		mmio_pref = pci_bus_resource_n(bus, PCI_BUS_BRIDGE_PREF_MEM_WINDOW);
+
+		if (!(type & IORESOURCE_PREFETCH) ||
+		    !(mmio_pref->flags & IORESOURCE_MEM))
+			return mmio;
+
+		if ((type & IORESOURCE_MEM_64) ||
+		    !(mmio_pref->flags & IORESOURCE_MEM_64))
+			return mmio_pref;
+
+		return mmio;
+	default:
+		return NULL;
+	}
+}
+
+/**
+ * pbus_select_window - Select bridge window for a resource
+ * @bus: PCI bus
+ * @res: Resource
+ *
+ * Selects the bridge window for @res. If the resource is already assigned,
+ * the current bridge window is returned.
+ *
+ * For memory resources, the selection is done as follows:
+ *
+ * Any non-prefetchable resource is put into the non-prefetchable window.
+ *
+ * If there is no prefetchable MMIO window, put all memory resources into the
+ * non-prefetchable window.
+ *
+ * If there's a 64-bit prefetchable MMIO window, put all 64-bit prefetchable
+ * resources into it and place 32-bit prefetchable memory into the
+ * non-prefetchable window.
+ *
+ * Otherwise, put all prefetchable resources into the prefetchable window.
+ *
+ * Return: the bridge window resource or NULL if no bridge window is found.
+ */
+struct resource *pbus_select_window(struct pci_bus *bus,
+				    const struct resource *res)
+{
+	if (res->parent)
+		return res->parent;
+
+	return pbus_select_window_for_type(bus, res->flags);
+}
+
 static bool pdev_resources_assignable(struct pci_dev *dev)
 {
 	u16 class = dev->class >> 8, command;
-- 
2.39.5


