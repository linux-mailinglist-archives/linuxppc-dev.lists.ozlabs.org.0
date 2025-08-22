Return-Path: <linuxppc-dev+bounces-11197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4B0B31CF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwZ478pz3cjT;
	Sat, 23 Aug 2025 00:57:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874670;
	cv=none; b=HaW06CqmXgw+Vtrl40rgFI5DmzpjEZRBUW/PqXcmzgGWzcoNLXpe2lmpJLU34BNPE3u7yHnvDznEEnG6B0oBeKFzqvOleH8o/oPwSWIpV7c8y2xh+WzlxLqYK/fx8lQf91AhnoSXni6zIMDsETDXmKlmjApdXwMlrOA4AsL8BqvOsB6xS7lL5/wKJDX+d9zWGIzihp/gDxdEXw453/6qv1+MVBXjnw/nl52I48vw/aTb2UBH1eYmAT+8MpzVlaY9+1PVl6pRGxLSTa79BVVmBqvAecWNopTrJc8ibW5zvZ0tLpcBh9OP3UuNyVy9rcSgI4vkHyilzNax5iqjb3+ClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874670; c=relaxed/relaxed;
	bh=9MLx/T9NtwRKV+XTCbOjgjiTV19qf3cDzE/LYh1/LJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1bHH3Bwba5toogr/aGyOU6EQ0m17sc73sFAMtNKdXPxPMBjDKIe6BHthVfqNTg68nTq/iA4+JYysnz4mZBi36aUSOytoITpTUoOx6wzzGMztvP0jpeCv9f5p8YlUyOYqAZkRyJT3rxENSKJCq77K5jNyXhotqA8Gyq7JqKBE9T6NRtbvZnu2BI+k1WeEJL4KWDmcg2kdR9SPqdW5MnsDzGaF5y2yH0dtYo3ChxJHYzpy7QAlEnnwOO3ec5qB+vCwmT6Q7nFwpt2hVz2G19fU63Z91H4dG40WbZeQvgAvswJTBMyJ40cJ5TVfdxTwQk8U/B5ihxFe9i4ze47DCijGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NeEuII7b; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NeEuII7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwY4h8nz3cjH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874670; x=1787410670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jBXSW/HvE/oTFKPyIiL0xTmEeLPgXFT+lohCoGdRapA=;
  b=NeEuII7bM/T8F2UmdmxbsEiFZzyjTHmqPdziXZKbZEqzuJ9iY95t7X5P
   WnkQ9Dd5/JDUY9aR+LZCxDKtMHvfAJ0nxRwdKmAs6Mg5SqOWBpIXRU9nX
   k8FIBqXzqAHDMDvrJJY/QESAZyEU4dYoBMxlofz97U8FsdIndVG56vGnK
   6CWEGuQYYkLiOt+foRfgwkL3LU3LMrX3kPxhoe+bcITNBOffTGHzE+Ifl
   ad0hmzIVVF0T1AQMZufq4siscshZ4wUgjnxqeSffnh4oJfdcdyZH2y1iU
   x3O4BwK+8sI5wEfyPwOBbLtWseeTpWhnlsmGRS9Kr8MbCVVF5BLvxxKn3
   Q==;
X-CSE-ConnectionGUID: WZUUGz7+TuaOSxmtpgKLnQ==
X-CSE-MsgGUID: uWaSqbhNSBCRvu1p788Myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62015782"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="62015782"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:45 -0700
X-CSE-ConnectionGUID: ixYcXxcpSP2pUy6rUGsbsQ==
X-CSE-MsgGUID: FOhRjr0IQkSfd3SUorEZlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173994552"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:39 -0700
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
Subject: [PATCH 03/24] MIPS: PCI: Use pci_enable_resources()
Date: Fri, 22 Aug 2025 17:55:44 +0300
Message-Id: <20250822145605.18172-4-ilpo.jarvinen@linux.intel.com>
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

pci-legacy.c under MIPS has a copy of pci_enable_resources() named as
pcibios_enable_resources(). Having own copy of same functionality could
lead to inconsistencies in behavior, especially now as
pci_enable_resources() and the bridge window resource flags behavior
are going to be altered by upcoming changes.

The check for !r->start && r->end is already covered by the more
generic checks done in pci_enable_resources().

Call pci_enable_resources() from MIPS's pcibios_enable_device() and
remove pcibios_enable_resources().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/mips/pci/pci-legacy.c | 38 ++------------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 66898fd182dc..d04b7c1294b6 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -249,45 +249,11 @@ static int __init pcibios_init(void)
 
 subsys_initcall(pcibios_init);
 
-static int pcibios_enable_resources(struct pci_dev *dev, int mask)
-{
-	u16 cmd, old_cmd;
-	int idx;
-	struct resource *r;
-
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	old_cmd = cmd;
-	pci_dev_for_each_resource(dev, r, idx) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1<<idx)))
-			continue;
-
-		if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
-			continue;
-		if ((idx == PCI_ROM_RESOURCE) &&
-				(!(r->flags & IORESOURCE_ROM_ENABLE)))
-			continue;
-		if (!r->start && r->end) {
-			pci_err(dev,
-				"can't enable device: resource collisions\n");
-			return -EINVAL;
-		}
-		if (r->flags & IORESOURCE_IO)
-			cmd |= PCI_COMMAND_IO;
-		if (r->flags & IORESOURCE_MEM)
-			cmd |= PCI_COMMAND_MEMORY;
-	}
-	if (cmd != old_cmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
-		pci_write_config_word(dev, PCI_COMMAND, cmd);
-	}
-	return 0;
-}
-
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
-	int err = pcibios_enable_resources(dev, mask);
+	int err;
 
+	err = pci_enable_resources(dev, mask);
 	if (err < 0)
 		return err;
 
-- 
2.39.5


