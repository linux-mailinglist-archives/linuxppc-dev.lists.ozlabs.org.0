Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8E6C6F76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 18:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjCJH6s4Yz3fRQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ax/yghkw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ax/yghkw;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjCDP00Hzz3f4M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 04:35:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592949; x=1711128949;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=40PiIYrpY37wYxSvYhyAFvVxdYaZvy3f8Dv2ifvyB0g=;
  b=ax/yghkwDOOeNXv6oOV9qpDDak9fcmYojfGYeEDEsRzwD+7irP6r/Vi3
   uFWG/VIedu/3Ct/LgHZj9XnSHX+YXVFH1fkdvAOigCBOI6VJO8IEwq8+H
   uEISMi+K3+aa10NlrDTQtPtao3Sgh+q4g2ntN1IfJpsLqhfl8pYGNd/bR
   5BNlHhavxQlpfPslbXg/qmavWHMEJnUMn0X6ivW5r1D+52aWfXg5VGIuc
   gVPvjNoCsPy3vEYsAI2MKsC7lAXpnw/1yVIG+RXVsuFhT2g5kgj9+o758
   sTF/gHaUDqNLjPFcp3B2ZhC0G7Lq/K4WPuLFuQtpE+W19za5fy5h7wDyK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367307987"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="367307987"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682380740"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="682380740"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 10:35:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A30B5176; Thu, 23 Mar 2023 19:36:11 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
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
Subject: [PATCH v7 0/6] Add pci_dev_for_each_resource() helper and update users
Date: Thu, 23 Mar 2023 19:36:04 +0200
Message-Id: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

Changelog v7:
- made both macros to share same name (Bjorn)
- split out the pci_resource_n() conversion (Bjorn)

Changelog v6:
- dropped unused variable in PPC code (LKP)

Changelog v5:
- renamed loop variable to minimize the clash (Keith)
- addressed smatch warning (Dan)
- addressed 0-day bot findings (LKP)

Changelog v4:
- rebased on top of v6.3-rc1
- added tag (Krzysztof)

Changelog v3:
- rebased on top of v2 by Mika, see above
- added tag to pcmcia patch (Dominik)

Changelog v2:
- refactor to have two macros
- refactor existing pci_bus_for_each_resource() in the same way and
  convert users

Andy Shevchenko (5):
  kernel.h: Split out COUNT_ARGS() and CONCATENATE()
  PCI: Allow pci_bus_for_each_resource() to take less arguments
  EISA: Convert to use less arguments in pci_bus_for_each_resource()
  pcmcia: Convert to use less arguments in pci_bus_for_each_resource()
  PCI: Make use of pci_resource_n()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                             |  1 +
 arch/alpha/kernel/pci.c                   |  5 +--
 arch/arm/kernel/bios32.c                  | 16 ++++----
 arch/arm/mach-dove/pcie.c                 | 10 ++---
 arch/arm/mach-mv78xx0/pcie.c              | 10 ++---
 arch/arm/mach-orion5x/pci.c               | 10 ++---
 arch/mips/pci/ops-bcm63xx.c               |  8 ++--
 arch/mips/pci/pci-legacy.c                |  3 +-
 arch/powerpc/kernel/pci-common.c          | 21 +++++-----
 arch/powerpc/platforms/4xx/pci.c          |  8 ++--
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  5 +--
 arch/powerpc/platforms/pseries/pci.c      | 16 ++++----
 arch/sh/drivers/pci/pcie-sh7786.c         | 10 ++---
 arch/sparc/kernel/leon_pci.c              |  5 +--
 arch/sparc/kernel/pci.c                   | 10 ++---
 arch/sparc/kernel/pcic.c                  |  5 +--
 drivers/eisa/pci_eisa.c                   |  4 +-
 drivers/pci/bus.c                         |  7 ++--
 drivers/pci/hotplug/shpchp_sysfs.c        |  8 ++--
 drivers/pci/pci.c                         |  3 +-
 drivers/pci/probe.c                       |  2 +-
 drivers/pci/remove.c                      |  5 +--
 drivers/pci/setup-bus.c                   | 37 +++++++-----------
 drivers/pci/setup-res.c                   |  4 +-
 drivers/pci/vgaarb.c                      | 17 +++-----
 drivers/pci/xen-pcifront.c                |  4 +-
 drivers/pcmcia/rsrc_nonstatic.c           |  9 ++---
 drivers/pcmcia/yenta_socket.c             |  3 +-
 drivers/pnp/quirks.c                      | 29 +++++---------
 include/linux/args.h                      | 13 +++++++
 include/linux/kernel.h                    |  8 +---
 include/linux/pci.h                       | 47 +++++++++++++++++------
 32 files changed, 165 insertions(+), 178 deletions(-)
 create mode 100644 include/linux/args.h

-- 
2.40.0.1.gaa8946217a0b

