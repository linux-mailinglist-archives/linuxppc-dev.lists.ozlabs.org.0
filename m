Return-Path: <linuxppc-dev+bounces-11216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC3B31D1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 17:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jz82wLGz3d2g;
	Sat, 23 Aug 2025 01:00:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874804;
	cv=none; b=AFyZUe8eqi0i4i8HFgnDQWOZ1rHtj9zhceM0sjY4+RRIsNWwcM0hug6m57kItgFJptph5ERaXuKxsv2B+Nch1pssX6RcUrO/rGVcv9Yo7Cty1rCfY9NXhBXBzBiYCuOCYKN3vzYvX0gwL8cOZcN6g4E+ivJ3H9GOTMZsL3xhVqEcUA6xEiwn41kJ0k7WwuDxoFUfaaLM+TnQOlg3y/g5hvHnyy4JJ/bee/vM3RRS8BdigM9GYKkTZJUtA3e8KQ1yUA/NvorOrkIWkd0olqgc5joXAYccwwo3nXIvd7IgGRfG1IZ+HlUPpif8Qt4gBnj38TEvyyCRYNTYSvbdh2NiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874804; c=relaxed/relaxed;
	bh=Og7ft0TFm874SImfirlZuUVkhQJS3QTF2vjOVWz14NU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mdrtv9grFuJJL1GReDaR25NOgDR6H0+dHDFcGm8WydYEOyElwTuRRchwSnmNGwqxee2pP5Nk+Eu+4Mp+Mi5M62Vm6WITWsoXKAq7vlXjo/TNT3Dy80q51+NgnbSkCN7/kFr1caGyXDaJ9FrgG6ud6PorONuEkr+0l93Hjn4dnhlQWkGRy05AdkcuuzOcqOUOCrr5Bqa9yhE+BPBMstt69hHPcyr6AvJ7VvpfAXWzl8Ug6dtJg9Ni9ZQ2E107WAu265oEzPs0RarbMI6JfgPOXlp+uHjvUkDlXCUVVc+kuNglhmAngMncRNia9EVGE7NSfphauwWLMagfIxWu93anNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iz1jv6Gu; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iz1jv6Gu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jz73FFsz3d8K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 01:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874804; x=1787410804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EK5M2izVE5p40XIaVUFrZSmUkgoozndw/itQ2SrR1Ew=;
  b=Iz1jv6GuXqCsEWRpGydiUNbZuuyr6qalOkKB6SNI442eEyBtE6Tjke7k
   KOJonXOFUZil3q8fq8As6ZhCPRUAfrgI7sld7iG7ZenffCXykkqZJogaZ
   281Wu+PFqeMLZk41kVI7rAMK2yksZizzCtB7HqfSaDaCOmM/ehkO4N2HA
   o+Pfi5mlhX7C3LUkKjl0aXDIDunbYdBAS3RFM0nA+K6cXI3+yH8X4wxL1
   59wp5+2phz9cj2VREqH8okqdUqbOp9Tkt8H3GtsoBp4h4i7Pkm54jEc4T
   Agh+WGz6aQiliHlCPho0HhXX0TbCSFBL2JbDMKuVYQvE/Raj9CuQGroPo
   A==;
X-CSE-ConnectionGUID: khITSVwGScuCFfAaxK+Geg==
X-CSE-MsgGUID: SeYKPMZMS4qifQ6PXREW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62016121"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="62016121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 08:00:01 -0700
X-CSE-ConnectionGUID: SF7XkM7uRzyQinj/cT/aBA==
X-CSE-MsgGUID: 4p1p4yJ2RJyg+8Th6VhtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173994924"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:56 -0700
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
Subject: [PATCH 24/24] PCI: Alter misleading recursion to pci_bus_release_bridge_resources()
Date: Fri, 22 Aug 2025 17:56:05 +0300
Message-Id: <20250822145605.18172-25-ilpo.jarvinen@linux.intel.com>
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

Recursing into pci_bus_release_bridge_resources() should not alter
rel_type because it makes no sense to change the release type within
the recursion call chain. A literal "whole_subtree" is passed into the
recursion instead of "rel_type" parameter which is misleading as the
release type should remain the same throughout the entire operation.

This is not a correctness issue because of the preceding if () that
only allows the recursion to happen if rel_type is "whole_subtree".
Still, replace the non-intuitive parameter with direct passing of
"rel_type".

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 9c69a84f2b23..0fbdb031bc3d 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1855,7 +1855,7 @@ static void pci_bus_release_bridge_resources(struct pci_bus *bus,
 			if (res->parent != b_win)
 				continue;
 
-			pci_bus_release_bridge_resources(b, res, whole_subtree);
+			pci_bus_release_bridge_resources(b, res, rel_type);
 		}
 	}
 
-- 
2.39.5


