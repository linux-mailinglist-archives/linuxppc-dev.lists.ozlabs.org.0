Return-Path: <linuxppc-dev+bounces-11193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35CBB31CF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwD5pcsz3chg;
	Sat, 23 Aug 2025 00:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874652;
	cv=none; b=k24stZIGjOSgnF8CCOgpaUXIGFGwdPZdgANdhQvp+5XDsNUsFX2QBXj1I8Dmc5+CDV1Nd/S9XR5iirXTdL2zvGHvNaK7bPUZ+BrdjaeW3Ynay4ZiI+2mFlTJTOxWqaA8x7UZiMPcib+T/2/IWvf60pMmWC0ocKI5KauWeK515BpCFEHbDz5N6robeuM3/ee0706EP3Nw++dcKy6jqw3PnWM5t7qRoQNUzd6h/QJ77LoDizGZVxO39HC0TI37ZJBItLWqIvbDBUfKK8DSTvd3EKofSF0vhkPekTzWdK8GIYnPKYxPKRN+txYMMdBFMG7+NAsOLYI40oWNyxddF8t68g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874652; c=relaxed/relaxed;
	bh=f162Q5sI14IO1/TzpZ9nb+/GoXoElPOzIpvr/gD/qYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzf5sT6XHF6FTRT/qgVp4hlceP0AwY8+iCP3cq8J8udkgqPqXSfBfc4m1zh7dGDuZP/ASXV9BL8i02UExsBY+bdLX+c47FhasXFc/6r6lYBdh8w+2a6hK5SAB9k36ydmDv9WUB3iu5U9F/LIdyVYGuCROaTac5J14u7x+C53F9lRi3VkwR+CgWOvNtKiAKUyGIMzuDjTqUPS2t8OMPMiC+cQwjio9iAAZpvxr5pLPCrYXEgM9hhMGouB6z0R06SxjuSSiBixzcW8v39jFL7on0V+aBr90FOldxF4Oy0BusuZZNcKxi+29bN7t4WJzxrBZhJscwTn1G4a/KnCpwqxKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ntDzt0CK; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ntDzt0CK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 23 Aug 2025 00:57:31 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwC6Nydz3chc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874652; x=1787410652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x5WvhX4O8xfwMKYkjxN13ooXO03C+az2T3Yal0pKgnU=;
  b=ntDzt0CKAhsnZpnFy98uS4UbEXB5Wtc9tgkGPrxn+Gvqqiblwnr+U5kX
   qBSXIUmpsGPVQ7rdjDaAaU97JaeM9nKaTo9rI8O/B6OVkaf6/Hf+p8eEB
   6geH8kdqWCYPser7BL4u5rQmJ2MJIJ19VeXJM6YBUl3brmArKPrahBar7
   NTsm9wZ28NErsB485Q7TZopidkAF+dA/3PB1W+l6zSh/Wuy8rVdR2IktU
   rhDvML9IKlkAGvl7760UBXG6vmfzrboV9PFEMjvux9ihJu60hRMWB2K+N
   b+YtBJ56tfFfj+vj6tkuCE0Y1zk2SrAEy2uyUDNhSCLSVECQwpOyqksZQ
   w==;
X-CSE-ConnectionGUID: 6yMmetIYTdm2yobNFPZx6g==
X-CSE-MsgGUID: 9bYrW1c2SM+Irg51id55jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62015722"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="62015722"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:26 -0700
X-CSE-ConnectionGUID: 0i+eI+8LQqmInl7HncQ8ZQ==
X-CSE-MsgGUID: YUBpK2JcQ7ytQJraYVvkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173994430"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:21 -0700
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
Subject: [PATCH 01/24] m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
Date: Fri, 22 Aug 2025 17:55:42 +0300
Message-Id: <20250822145605.18172-2-ilpo.jarvinen@linux.intel.com>
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

m68k has a resource enable (check) loop in its pcibios_enable_device()
which for some reason differs from pci_enable_resources(). This could
lead to inconsistencies in behavior, especially now as
pci_enable_resources() and the bridge window resource flags behavior
are going to be altered by upcoming changes.

The check for !r->start && r->end is already covered by the more
generic checks done in pci_enable_resources().

The entire pcibios_enable_device() suspiciously looks copy-paste from
some other arch as also indicated by the preceding comment. However,
it also enables PCI_COMMAND_IO | PCI_COMMAND_MEMORY always for bridges,
it is not clear why that is being done as the commit e93a6bbeb5a5
("m68k: common PCI support definitions and code") introducing this
code states: "Nothing specific to any PCI implementation in any m68k
class CPU hardware yet".

Replace the resource enable loop with a call to pci_enable_resources()
and adjust the Command Register afterwards as it's unclear if that is
necessary or not so keep it for now.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/m68k/kernel/pcibios.c | 39 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index 9504eb19d73a..e6ab3f9ff5d8 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -44,41 +44,24 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
  */
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
-	struct resource *r;
 	u16 cmd, newcmd;
-	int idx;
+	int ret;
 
-	pci_read_config_word(dev, PCI_COMMAND, &cmd);
-	newcmd = cmd;
-
-	for (idx = 0; idx < 6; idx++) {
-		/* Only set up the requested stuff */
-		if (!(mask & (1 << idx)))
-			continue;
-
-		r = dev->resource + idx;
-		if (!r->start && r->end) {
-			pr_err("PCI: Device %s not available because of resource collisions\n",
-				pci_name(dev));
-			return -EINVAL;
-		}
-		if (r->flags & IORESOURCE_IO)
-			newcmd |= PCI_COMMAND_IO;
-		if (r->flags & IORESOURCE_MEM)
-			newcmd |= PCI_COMMAND_MEMORY;
-	}
+	ret = pci_enable_resources(dev, mask);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * Bridges (eg, cardbus bridges) need to be fully enabled
 	 */
-	if ((dev->class >> 16) == PCI_BASE_CLASS_BRIDGE)
+	if ((dev->class >> 16) == PCI_BASE_CLASS_BRIDGE) {
+		pci_read_config_word(dev, PCI_COMMAND, &cmd);
 		newcmd |= PCI_COMMAND_IO | PCI_COMMAND_MEMORY;
-
-
-	if (newcmd != cmd) {
-		pr_info("PCI: enabling device %s (0x%04x -> 0x%04x)\n",
-			pci_name(dev), cmd, newcmd);
-		pci_write_config_word(dev, PCI_COMMAND, newcmd);
+		if (newcmd != cmd) {
+			pr_info("PCI: enabling bridge %s (0x%04x -> 0x%04x)\n",
+				pci_name(dev), cmd, newcmd);
+			pci_write_config_word(dev, PCI_COMMAND, newcmd);
+		}
 	}
 	return 0;
 }
-- 
2.39.5


