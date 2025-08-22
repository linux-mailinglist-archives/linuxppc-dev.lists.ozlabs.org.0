Return-Path: <linuxppc-dev+bounces-11195-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16083B31CF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:57:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwM1NPVz3chb;
	Sat, 23 Aug 2025 00:57:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874659;
	cv=none; b=d/lrYZBfEKGM119hK5ET83TH7mkf62Vgoeu3BjaUBMmpPi6kjM8VGqcO4QvjriQumfwwCemCaZ3Mv1dUkIuMQJzyeSzzsWdH9DZk/qrZ/jMc8xREhDMM4C8HNgvyY6pnJ+nAhpap4wFqNiP13S/blEiQNq4rg7x+tDYPw2ayxEiBFmXHVA6kw2cIPT1vF06zWFB22Nrrk/Tja7OI59kT7ML6IMGOzslXMfIyscIIFlm7TeQ30t47iocEzIbUkI4dGEwSS22MlePjP6eWb60WRoHNa6DD78gFfQiJhVd/LG/Z0emccD8EPZH1Sc0AAtYwWy5lrZgTkOFKPX6gkywE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874659; c=relaxed/relaxed;
	bh=g5lvNM2Jt9vPH4n6NdGz8BY4LTpUdz9R/HWo3H8x0bU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GH3QA1QRLsisQgTWKVH0yxbze3udT2RKh5ewdimZBDYrcWsvoyDFq7Pk8aDZWRk+DPW9ZHAm7PHnaSbk6IV1LWlTdQxK5D69ruyf4nKgxwfZWN573KqB72rtBm/vJgrlzYNAnDFlP2RBjuaijHo50jPX5AIIakaBynG1JMdyKaPWJ8ElzYrY4nwy4cxsQTp5jl8XZjrlKUqRHIKGGhqWAEIntEGy7w6ljnVoQO1fVef0BDOiwJi3oL09vmbpUnIYxE+ybKmR01oIfDcbLKUubUPEOot4FzRhFB8fNUz9i+pMMSTpYXmIDotx381EPmAlz1fZ1j9xi23LvV1lDJ2s0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QN+U/Fq6; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QN+U/Fq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwL1t4Qz3chX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874659; x=1787410659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bSxDSi61ISCt6N4ERv3jPARPEFvmoSF1OZejWsVVizA=;
  b=QN+U/Fq6/5CGMhZrrOucW3F+JxbyBnHAgzkZ07t7ru6w49Hh3gWWjOEb
   tId8XGPz/0nWE3TYTnsI3rxPUUmCeB8aO4PlG+jWE+0z4JsJoOFcvfY84
   OObJhnUEuX/QU/gENFGNlee2iGUqTL1VoBBfvTt23S3IPcVaJMDbYAAR0
   ZOyonq2wVeGnpYTcU2fbVSD6keCi7jgA+mtalVuWCKYT53DldJNi5kTmC
   kmGi2zu66vs+Bl3akjxDz/SRBcNiSlx/fhO2ZwIxdc8jSnoKsqhz0GZEe
   IQJTCeaYuB+zSmgNTMQBFVqV+5k7wHJKFYAdyYhotm6C6iCIZk+agO6/q
   Q==;
X-CSE-ConnectionGUID: ydTBY3biQl6/w17rTBMlnw==
X-CSE-MsgGUID: GTY8qVBBQQiqQWXpnpih8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62015745"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="62015745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:35 -0700
X-CSE-ConnectionGUID: x91kP381TK+YfIUNtqcyDg==
X-CSE-MsgGUID: q2j8ygTuTqiZ23lnI0XmWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173994475"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:30 -0700
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
Subject: [PATCH 02/24] sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
Date: Fri, 22 Aug 2025 17:55:43 +0300
Message-Id: <20250822145605.18172-3-ilpo.jarvinen@linux.intel.com>
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

Under arch/sparc/ there are multiple copies of pcibios_enable_device()
but none of those seem to do anything extra beyond what
pci_enable_resources() is supposed to do. These functions could lead to
inconsistencies in behavior, especially now as pci_enable_resources()
and the bridge window resource flags behavior are going to be altered
by upcoming changes.

Remove all pcibios_enable_device() from arch/sparc/ so that PCI core
can simply call into pci_enable_resources() instead using it's __weak
version of pcibios_enable_device().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/sparc/kernel/leon_pci.c | 27 ---------------------------
 arch/sparc/kernel/pci.c      | 27 ---------------------------
 arch/sparc/kernel/pcic.c     | 27 ---------------------------
 3 files changed, 81 deletions(-)

diff --git a/arch/sparc/kernel/leon_pci.c b/arch/sparc/kernel/leon_pci.c
index 8de6646e9ce8..10934dfa987a 100644
--- a/arch/sparc/kernel/leon_pci.c
+++ b/arch/sparc/kernel/leon_pci.c
@@ -60,30 +60,3 @@ void leon_pci_init(struct platform_device *ofdev, struct leon_pci_info *info)
 	pci_assign_unassigned_resources();
 	pci_bus_add_devices(root_bus);
 }
-
-int pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	struct resource *res;
-	u16 cmd, oldcmd;
-	int i;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	oldcmd = cmd;
-
-	pci_dev_for_each_resource(dev, res, i) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<i)))
-			continue;
-
-		if (res->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (res->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-
-	if (cmd != oldcmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index ddac216a2aff..a9448088e762 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -722,33 +722,6 @@ struct pci_bus *pci_scan_one_pbm(struct pci_pbm_info *pbm,
 	return bus;
 }
 
-int pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	struct resource *res;
-	u16 cmd, oldcmd;
-	int i;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	oldcmd = cmd;
-
-	pci_dev_for_each_resource(dev, res, i) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<i)))
-			continue;
-
-		if (res->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (res->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-
-	if (cmd != oldcmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
-
 /* Platform support for /proc/bus/pci/X/Y mmap()s. */
 int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma)
 {
diff --git a/arch/sparc/kernel/pcic.c b/arch/sparc/kernel/pcic.c
index 25fe0a061732..3d54ad5656a4 100644
--- a/arch/sparc/kernel/pcic.c
+++ b/arch/sparc/kernel/pcic.c
@@ -641,33 +641,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	}
 }
 
-int pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	struct resource *res;
-	u16 cmd, oldcmd;
-	int i;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	oldcmd = cmd;
-
-	pci_dev_for_each_resource(dev, res, i) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<i)))
-			continue;
-
-		if (res->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (res->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-
-	if (cmd != oldcmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", oldcmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
-
 /* Makes compiler happy */
 static volatile int pcic_timer_dummy;
 
-- 
2.39.5


