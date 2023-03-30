Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B16D0B55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 18:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnTVC0Wp1z3fg4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 03:32:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UeetYP0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UeetYP0z;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnTPX2YD1z3fR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 03:28:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193712; x=1711729712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mMeyztJwnpsG6WpiZZE3Wzd++aYBpdo5TdtsAUuwHek=;
  b=UeetYP0z4KQE3eGjgEb1rZcZdEKa4Zt/lw25k6ICMVHP/gr5WLpuWQOv
   vHX230IkzboLjCyY0SQaC5V2mklJtqcbYRk2INBRiPU+nUZ2ThENiWsQl
   QjVZ5ibEfB6QA9H2UxZ8Z3lAFcYb+cVp+jJSkiiHMmVkMr1XHd/axlD3J
   3JHxWBMqslYXAnMN15EbgPmZAp1alUykAZS6TnuASxRudTBpBTdr4LXG/
   0kqpNQWr3EUMkEcrs+OLeQYpHrCj5mOTQr8ShpTdUC6iUyfiIoVSwlr14
   MPiOzkt1azTtcvTJEyW41A0oyLudH1otqOsj8j/Ds4aW4rMZ3DlizoKzE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427496055"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="427496055"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 09:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="684762351"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="684762351"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 30 Mar 2023 09:28:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 43047238; Thu, 30 Mar 2023 19:24:51 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v8 4/7] PCI: Document pci_bus_for_each_resource() to avoid confusion
Date: Thu, 30 Mar 2023 19:24:31 +0300
Message-Id: <20230330162434.35055-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Gregory Clement <gregory.clement@bootlin.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, "David S. Miller" <davem@davemloft.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There might be a confusion with the implementation of the
pci_bus_for_each_resources() due to side effect of Logical
OR. Document entire macro and explain how it works and why
the conditional needs to be like that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pci.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5cacd9e4c8cd..e3b3af606280 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1446,6 +1446,26 @@ int devm_request_pci_bus_resources(struct device *dev,
 /* Temporary until new and working PCI SBR API in place */
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 
+/**
+ * pci_bus_for_each_resource - iterate over PCI bus resources
+ * @bus: the PCI bus
+ * @res: a varible to keep a pointer to the current resource
+ * @i: a variable to keep the index of the current resource
+ *
+ * Iterate over PCI bus resources. The first part is to go over PCI bus
+ * resource array, which has at most the %PCI_BRIDGE_RESOURCE_NUM entries.
+ * After that continue with the separate list of the additional resources,
+ * if not empty. That's why the Logical OR is being used.
+ *
+ * Possible usage:
+ *
+ *	struct pci_bus *bus = ...;
+ *	struct resource *res;
+ *	unsigned int i;
+ *
+ * 	pci_bus_for_each_resource(bus, res, i)
+ * 		pr_info("PCI bus resource[%u]: %pR\n", i, res);
+ */
 #define pci_bus_for_each_resource(bus, res, i)				\
 	for (i = 0;							\
 	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
-- 
2.40.0.1.gaa8946217a0b

