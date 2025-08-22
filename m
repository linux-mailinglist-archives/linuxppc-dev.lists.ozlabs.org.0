Return-Path: <linuxppc-dev+bounces-11214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777AB31D18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 17:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jyn74Pfz3d44;
	Sat, 23 Aug 2025 00:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874785;
	cv=none; b=XSSUSWyS+Q7XEntBvrmeJJGHBHm1BVH1Fd/kKhdGLSJnq74SZs3o6rAAVGbnOLBaTGyyXoQa+t8aLgwopQz8kTrA5oC2z0gd1Dnx9BLqrFWLVhvRbqK/RVU8M41a0aTOYEu6TpG+aXKipoH0NVK0SdGHtxaNS4vieflbzDj3CV4j3fI1eDVj4MEhB6YX46N0rgaJzbTk6XSCYZARQC2oG+JfQz3GYsIyPhkqzrIQSEE8TUWZyvID2pZsWTPRBXiCE6455Yv7LqVEuGSLnsC8zqBf5eKfAAHFq42TSPeCcMKAKzPkUKACpFR/tkfdjJMkFm8DomyKYBK9m1i1lXH2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874785; c=relaxed/relaxed;
	bh=SzDWZOnQ4JSddNSW3Es8solrTpOIOkhMWlDVp38bofc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+7HWdS3DugMI0aiQ6Oti6H2E9gk4dmslHTUocTkuYHLNiQ6m77apykO3Knn25wB4oTakJOapWsX58n9K2KZvpmFqOznvW5IXvy40iYE76iuByXuNMk8DAsC50cxXzXVUS4/XAY5i44F0NIU6xlr5pWm7VJu1ygwr7IhICTJEqN4W2uFIl0ufVAlqh5h54SlDQsW9DqfqbxVGRLdB7zTP6xVNxD/jlHiR333fdGOOj1K5CirbzzOztMLGn8kGNZuC+DTTgeCJ3ENo9OoFUBNegKUiEv+J2/sK/2mqA/JfP34CjsHSxVrcz646XCmgz2lJceseaMU+eIRBWRtEL+DeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vgv03LyT; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vgv03LyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jyn0TD7z3d42
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874786; x=1787410786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HTxHAiNuvyuD34kLb+03Rz07JtALaQ3E9pcuMeDZoEE=;
  b=Vgv03LyTfm3/chZQL9Bo0k2n+s4AiOU58d5NL+xD5RK4K/PDKgFbx0Aq
   w+god+RYZgr6/AnyKwubaWYAhUDyFOBpx0pREqVC/yo5N+ik/3PEixbIc
   tWOtBHjEPz6M+v3V7H4khH1LexTY6ZjBeduIfjov4gr8BaKL4MydKCV8c
   FGmwl9FNfyz/Gjog4Jy4sa1Syo6yKKun0jSCQomK4Lx6d/+I/U6BrxKmj
   1vldp2s5j1SujQc9ksF9EvSJfSbWPReZ2i28MLA8e3PzLJRj7uVbKUtz9
   1vAOVwfkI/u+aKqfCztKUCYXJz3Za9w/z3PvvNgCj6FxbwD6QWKPTUR89
   A==;
X-CSE-ConnectionGUID: /txsrB2kQDWpln+s76V0ww==
X-CSE-MsgGUID: +51aYZ/aTKCCUMv+b8gmWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75640739"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75640739"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:44 -0700
X-CSE-ConnectionGUID: iZNsZnZnSe2zaHcSW5F1PA==
X-CSE-MsgGUID: s8iZ9QfNSsyPmEDxoDG8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172986954"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:38 -0700
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
Subject: [PATCH 22/24] PCI: Add pci_setup_one_bridge_window()
Date: Fri, 22 Aug 2025 17:56:03 +0300
Message-Id: <20250822145605.18172-23-ilpo.jarvinen@linux.intel.com>
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

pci_bridge_release_resources() contains a resource type hack to work
around the unsuitable __pci_setup_bridge() interface. Extract the
switch statement that picks the correct bridge window setup function
from pci_claim_bridge_resource() into pci_setup_one_bridge_window() and
use it also in pci_bridge_release_resources().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index ece533181ff1..f5b0274bde0a 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -953,6 +953,23 @@ static void __pci_setup_bridge(struct pci_bus *bus, unsigned long type)
 	pci_write_config_word(bridge, PCI_BRIDGE_CONTROL, bus->bridge_ctl);
 }
 
+static void pci_setup_one_bridge_window(struct pci_dev *bridge, int resno)
+{
+	switch (resno) {
+	case PCI_BRIDGE_IO_WINDOW:
+		pci_setup_bridge_io(bridge);
+		break;
+	case PCI_BRIDGE_MEM_WINDOW:
+		pci_setup_bridge_mmio(bridge);
+		break;
+	case PCI_BRIDGE_PREF_MEM_WINDOW:
+		pci_setup_bridge_mmio_pref(bridge);
+		break;
+	default:
+		return;
+	}
+}
+
 void __weak pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
 {
 }
@@ -987,19 +1004,7 @@ int pci_claim_bridge_resource(struct pci_dev *bridge, int i)
 	if (pci_bus_clip_resource(bridge, i))
 		ret = pci_claim_resource(bridge, i);
 
-	switch (i) {
-	case PCI_BRIDGE_IO_WINDOW:
-		pci_setup_bridge_io(bridge);
-		break;
-	case PCI_BRIDGE_MEM_WINDOW:
-		pci_setup_bridge_mmio(bridge);
-		break;
-	case PCI_BRIDGE_PREF_MEM_WINDOW:
-		pci_setup_bridge_mmio_pref(bridge);
-		break;
-	default:
-		return -EINVAL;
-	}
+	pci_setup_one_bridge_window(bridge, i);
 
 	return ret;
 }
@@ -1839,10 +1844,7 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 	if (ret)
 		return;
 
-	/* Avoiding touch the one without PREF */
-	if (type & IORESOURCE_PREFETCH)
-		type = IORESOURCE_PREFETCH;
-	__pci_setup_bridge(bus, type);
+	pci_setup_one_bridge_window(dev, PCI_BRIDGE_RESOURCES + idx);
 }
 
 enum release_type {
-- 
2.39.5


