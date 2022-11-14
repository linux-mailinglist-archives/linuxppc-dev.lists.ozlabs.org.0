Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A46288C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 19:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9z9w5GBkz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 05:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrlJ/TFG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IrlJ/TFG;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9z906qDGz2xkx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 05:58:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452293; x=1699988293;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x6ggnXnghcO12tbT4wtQfhiqCsVpusNaj/2IGyQVVxI=;
  b=IrlJ/TFG3N1lWyi8+WpHfynkzFYp7zuKvcz1ebTEeE6SFc62wWgwVyFJ
   fThOC/yKpimozRJfNEhrTXuD2gYm1V0LL421UTRfLDA/hsBX/YlCLPzzL
   oXsWTdtB45RTr8rapk3iujnDHd3uNwrBiI2CLIwA22tcDCCNdd+akmvBy
   JEoI/7iCXRVEzPzaxprsNx1J42gAmqPmQRzHQ7cJKxBaltn9UngEB6GC7
   SxgciEyg3hH3YZicqBbZzFiAKSK+EEQO+gaqECjMYC+duAjOVjU6OXHPR
   TI7YRM99DCSl8h2HCxnLnh4uKuJMrPrLdCEqK1wb4rQ1MWJKBcKAMWaGx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="374182117"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="374182117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 10:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="638607285"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="638607285"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 14 Nov 2022 10:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BAA212F3; Mon, 14 Nov 2022 20:58:24 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/4] PCI: Add pci_dev_for_each_resource() helper and
Date: Mon, 14 Nov 2022 20:58:18 +0200
Message-Id: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

This applies on top of this patch Mika sent out earlier:
https://lore.kernel.org/r/20221114115953.40236-1-mika.westerberg@linux.intel.com

Changelog v3:
- rebased on top of v2 by Mika, see above
- added tag to pcmcia patch (Dominik)

Changelog v2:
- refactor to have two macros
- refactor existing pci_bus_for_each_resource() in the same way and
  convert users

Andy Shevchenko (3):
  PCI: Split pci_bus_for_each_resource_p() out of
    pci_bus_for_each_resource()
  EISA: Convert to use pci_bus_for_each_resource_p()
  pcmcia: Convert to use pci_bus_for_each_resource_p()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                      |  3 +++
 arch/alpha/kernel/pci.c            |  5 ++---
 arch/arm/kernel/bios32.c           | 16 ++++++-------
 arch/mips/pci/pci-legacy.c         |  3 +--
 arch/powerpc/kernel/pci-common.c   |  5 ++---
 arch/sparc/kernel/leon_pci.c       |  5 ++---
 arch/sparc/kernel/pci.c            | 10 ++++-----
 arch/sparc/kernel/pcic.c           |  5 ++---
 drivers/eisa/pci_eisa.c            |  4 ++--
 drivers/pci/bus.c                  |  7 +++---
 drivers/pci/hotplug/shpchp_sysfs.c |  8 +++----
 drivers/pci/pci.c                  |  5 ++---
 drivers/pci/probe.c                |  2 +-
 drivers/pci/remove.c               |  5 ++---
 drivers/pci/setup-bus.c            | 36 ++++++++++++------------------
 drivers/pci/setup-res.c            |  4 +---
 drivers/pci/xen-pcifront.c         |  4 +---
 drivers/pcmcia/rsrc_nonstatic.c    |  9 +++-----
 drivers/pcmcia/yenta_socket.c      |  3 +--
 include/linux/pci.h                | 25 +++++++++++++++++----
 20 files changed, 78 insertions(+), 86 deletions(-)

-- 
2.35.1

