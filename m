Return-Path: <linuxppc-dev+bounces-11201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7FB31CFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jww4kqJz3ckc;
	Sat, 23 Aug 2025 00:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874688;
	cv=none; b=bNnwgtzW9ONc2XR+UdAhcvLjPIFnkO1qZSw6PlnMdBzqPXI6nrFqIIXLOHM9WyD0LMcC9pagz4AmlFoCZ3xbIPFxHqQlYVBnFmq/B9Dbdr3r3uG17M8CQRiAKlXREVu26xOtBrHCeeNUGtLscC8LKngrhLEnuqGj0qWaCzJC9Yc3QpsG9iHydlo7UowAuU8KsGYeu7e9eNr/ghK+pNxCbvwscjuyNYG1VFtHWjfI9jwsaSDUTJXrQYACOK8ccLOvQcGWhgBLysDqC+U3FRSy6u4L0fMMT65fyIQMXmJL8qO0L7FinoBqua3XvFOwFgbVHBqORMsrWzHMmyyVT137KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874688; c=relaxed/relaxed;
	bh=o+TMIsxnvKswhTzetv0AiPm5m4QAvO0toPZSTHf8Fxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=elprkF07Z52huz8uga2fBuBcJB4MafP1YHuvKpyVgbqtZzoySa7FXFXiChr02tQltVSDnni+jl15YOk1RDRxodJ5vEYouywaz3qQpcsnHExhgCEX8tJAcQFXxxV570SOumZglXxPwKjL2mFmpMClrxb6O3VkRU642AdayNZTzjSenJ0E8+wIUBDMDE34nnAfhN47rEngI3qy/iPUZ9sZDe5VBOuznUQ3jUd/oj6XjB02NWet5MhsArRVTAGwTTyejtWZXalg4/EbLDZOVNaWCPY+PqCwrtT2z8Up3R9I7ZHTUaXLtjO/2GybLmsNufZicwIVwUC4hUQav2pRAK0WuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gJfYrO5q; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gJfYrO5q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwv5q06z3ckP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874688; x=1787410688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wPDvnWZ5n/ZzruRde5Pq3zT/XPnm5sbjNx2qOymBYfE=;
  b=gJfYrO5qVyoLk0r6mbp1s6xiSXe0cnUvCpSAv+KR3kQCwFf8mlr5skAu
   4aU+EcelqFCxjLvZooyM+UToOAJEbMtAG+iaH3ESI+kAqMf0dVP0ATK/F
   +AZzi65Damp+qiDBL2qqJpkFrwBH1bCzq00SEVIpCUN8p18CMK2XTtT8Q
   MSJ+cpuLYiGrxhFl+s35ugTXjnrL1fs3YCUG7KTupmJAi+kEMKE3jc4sQ
   XJtPbVCtrd7ztvOcEuttzscgYzGNd+FHexd7VdVTCvrPCUjxTQZg6ZhWi
   KtjAOVL/k2wKYK0liehfSnVrYEhdjRWGyuwDPE6MsFOMnK2I4O54TqfCE
   g==;
X-CSE-ConnectionGUID: KcE49P6qTUOQbUB5qBZv0g==
X-CSE-MsgGUID: RIZ+U2gJSR6XzWs7UmNUqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69283111"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69283111"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:03 -0700
X-CSE-ConnectionGUID: qiJ59XlaQtqa4e+Z9uM3dw==
X-CSE-MsgGUID: tW3R/pfDT4eAbXWbFFh3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169547004"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:58 -0700
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
Subject: [PATCH 05/24] PCI: Refactor find_bus_resource_of_type() logic checks
Date: Fri, 22 Aug 2025 17:55:46 +0300
Message-Id: <20250822145605.18172-6-ilpo.jarvinen@linux.intel.com>
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

The logic checks can be simplified in find_bus_resource_of_type() by
reordering them.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 4097d8703b8f..c5fc4e2825be 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -158,11 +158,15 @@ static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
 	struct resource *r, *r_assigned = NULL;
 
 	pci_bus_for_each_resource(bus, r) {
-		if (r == &ioport_resource || r == &iomem_resource)
+		if (!r || r == &ioport_resource || r == &iomem_resource)
 			continue;
-		if (r && (r->flags & type_mask) == type && !r->parent)
+
+		if ((r->flags & type_mask) != type)
+			continue;
+
+		if (!r->parent)
 			return r;
-		if (r && (r->flags & type_mask) == type && !r_assigned)
+		if (!r_assigned)
 			r_assigned = r;
 	}
 	return r_assigned;
-- 
2.39.5


