Return-Path: <linuxppc-dev+bounces-11200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E9B31CFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwq04mGz3ck4;
	Sat, 23 Aug 2025 00:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874682;
	cv=none; b=i+IVaiC/m3KU1e2DqKYsvHZQujpRznDu4lC8Lg/vRxw5JDAFtmnBLBm127GbKVDWeAQCGSwzb1tvvWWdd81iNZPu4ZwKSUVlayHR5hsRASIaNXA1nEwtByNuCLAZCNbgNCphqAC/vxZj53yBkerIv6gjujXf5qj4g+18g3fMm00/gPHZnJ0TxDO/05Hb/kOFwsv8qynb1pgmMVq01TWRcwxp8IkLrF+IWN/K8SPJ+R2M9aRVYCGNtlndsytxxJ/ycfubrETmwYJTNXygVIGf58mDyKWV1JWwHINU+GG07RWexYM0Aap0TQsqqJwrMMNudfutbb7wPJL1RQp1sqR55A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874682; c=relaxed/relaxed;
	bh=RiKBsdJiGCPj0Kmp8JVVifV/aCh+uKKONLCoB09pzrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EW2noW3ptZnSL1AT2ft1yBgnfM6KwLTlbgh0HRRMzs/Aw9rZBvPQiZGJKduIw/TAIB4hRBEeQShjpmkniOhDjKAdKspxsNsESRQjgYnlxRfMkzhs20kJK9xWF6oF14wEDBH1w+DgToafrTsvIPvWSegAzWzUi0JgA/0YOuXAN6T67ONWPvxT6Z/Mw0uFgpviXVl5gSlL9dvlS9Fnx7psSkYxwxPpiNskEyItKsVePkbNkqaLDXP0hXOsdzylRpZRlRJixPKms/y2ppIYny1ED6hpvnYD8d8ewQEfSQaTlLa2qLKheTcDVekl0sd7LL0Ci3+UlVjYwMAtO+hFR/RuAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LTStVWHs; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LTStVWHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwn3gnpz3ck9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874681; x=1787410681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nKDUWjSDj08uKyvTX9DBKESYugIunl4wAuN3dhOg4bY=;
  b=LTStVWHs5GQ1Du/aFIIuUItNXjuhalqPmF9OSkY8L6tYx08A9VnULVcJ
   9T+HFEsccIQutkLf//B+dmJMZ7w7v9YJbTkh9elZiG2wjH56DYFAbYrWi
   cvIsqNP0mmsNIr76O2WErXfXljsWtGK0wj5RNT58cYwZjIhR3H9WImfu6
   DkkP6Y4EPECYoLDTOm8Z9GKiDqpj9lfOHNq5a1oJ9P6CyC4Qeg1knWv0p
   z+hxM+JSLZbnvfFuNSheehv56UlaEZgbxPJW5emU4+x06l8mF4O+cf7Kk
   Tf31223tAgOGize9ZlGbo0ZGPrnVxCB3YiD/3oCYkyysI7np5ok9vaht3
   w==;
X-CSE-ConnectionGUID: OZXHe2tRT0iH+ou858QNuA==
X-CSE-MsgGUID: aBXxvu3qQji74g+dMSr5UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201405"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:59 -0700
X-CSE-ConnectionGUID: C0xJ1+zrQqykpRB+mZXlLg==
X-CSE-MsgGUID: wUiykzbVSkaqn73XadpgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168920545"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:54 -0700
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
Subject: [PATCH 11/24] PCI: Add defines for bridge window indexing
Date: Fri, 22 Aug 2025 17:55:52 +0300
Message-Id: <20250822145605.18172-12-ilpo.jarvinen@linux.intel.com>
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

include/linux/pci.h provides PCI_BRIDGE_{IO,MEM,PREF_MEM}_WINDOW
defines, however, they're based on the resource array indexing in the
pci_dev struct. The struct pci_bus also has pointers to those same
resource but they start from zeroth index.

Add PCI_BUS_BRIDGE_{IO,MEM,PREF_MEM}_WINDOW defines to get rid of
literal indexing.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.h   |  4 ++++
 drivers/pci/probe.c | 10 +++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 34f65d69662e..1dc8a8066761 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -81,6 +81,10 @@ struct pcie_tlp_log;
 #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
 #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
 
+#define PCI_BUS_BRIDGE_IO_WINDOW	0
+#define PCI_BUS_BRIDGE_MEM_WINDOW	1
+#define PCI_BUS_BRIDGE_PREF_MEM_WINDOW	2
+
 extern const unsigned char pcie_link_speed[];
 extern bool pci_early_dump;
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index f31d27c7708a..eaeb66bec433 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -598,9 +598,13 @@ void pci_read_bridge_bases(struct pci_bus *child)
 	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++)
 		child->resource[i] = &dev->resource[PCI_BRIDGE_RESOURCES+i];
 
-	pci_read_bridge_io(child->self, child->resource[0], false);
-	pci_read_bridge_mmio(child->self, child->resource[1], false);
-	pci_read_bridge_mmio_pref(child->self, child->resource[2], false);
+	pci_read_bridge_io(child->self,
+			   child->resource[PCI_BUS_BRIDGE_IO_WINDOW], false);
+	pci_read_bridge_mmio(child->self,
+			     child->resource[PCI_BUS_BRIDGE_MEM_WINDOW], false);
+	pci_read_bridge_mmio_pref(child->self,
+				  child->resource[PCI_BUS_BRIDGE_PREF_MEM_WINDOW],
+				  false);
 
 	if (!dev->transparent)
 		return;
-- 
2.39.5


