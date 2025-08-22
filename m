Return-Path: <linuxppc-dev+bounces-11199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912DFB31CFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwl4L1tz3cjH;
	Sat, 23 Aug 2025 00:57:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874679;
	cv=none; b=b5VMkEqmlopwpYM7BA5og4fsiMQvFXFJTT/FmAe1MAXdzS5NzzRU6c9CTY+UEkhBGWl7UAfUYpsfghlozoSWwBP3Bx6awhf11KsSl5zpn4f3L/gUYfah93smqOdKZ2Bj8iuGWfSSnHwiISTQ6TQvpOCtC4UTvaFG+kvP5W3HuqUCJHWOvV150wpvP0/W8XAmf6iKrDwuR05d3QvLEQrQYVntiQUuTita3o2Va5lxcLQLwOpoBNBPFDitH0qGKoOpKUhjEgwbCK/SMh8mLrfZ0jUqXu7bxbNSUKRQHxMribbBGIyFa0KrAQKanasYpYgx0/Of1hWVj/1mBTKzv1sZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874679; c=relaxed/relaxed;
	bh=KGlpLmlUMHY/HGijNQUdgv7EI6CKvEfYKwpx4tdtetI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3QIrLRSZZyQKtQu1gBhQ5nANYILvWKd6UfxDgKzOuKRI6iJxLJirFLWLf8VMcHpzJjtg6ktOkImIyhuy0I5VlqxuUWT29Cjtx1ypsTXZref635HAkO+Hs+C9uoOFML2WkdF7uvYVVfbM6PUy4CLToIJQJ6mBRCwiLiUrsG50ZXAwNOyP4pN42bEd8wC8Bz5ezfD4dF4BoWC9r6HcvlZPlyDTGb/YS/Kv2FX+mkyD19yIUsDCYjvKlCmZnGpua6gNI5OJeFnJ0N8l6azatcChJ24L3cw1ZMiIGTCucD+LdtSO2dTxqt+DNMiLTyJaMdEunjZyqQOBOKk9Tm8+4kbVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXfdau9j; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXfdau9j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwk4ns1z3ck9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874679; x=1787410679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qAXdsDQW9N/Uavlh8yIRORIBMsvqG965+7HiERcw2Bc=;
  b=hXfdau9jWCFlT2TrO2m2OjtMJt56HJZ7Nk05UevwlANLviXc53cBF6vw
   zfcvtE0HtQDj7SUrjCRYm1IzrLmTZD4W7NU1G1jCIECob8vjkXXGQ4UbW
   wg9orSZU0B0Mh20p+xXLHGSv0wFagzzkEFAh84zm3sZ4J+Vl+YqZm3lvp
   Nz281R92KLDHnKx93qnpT69lG6vW7v7FduAHiQWYZ1OOqH2OLnt7XoZGa
   EuDyHQtBty2ZrFHmI7d8QG6AXAJ+kpn8n3V6Y3olO/DZCy7kfNJS9cef+
   kKCS/rYq8M0OEcWygIcMfVyxzSuWUIjpQWyPuDlNJNZWd/OTjmJbB2sIC
   w==;
X-CSE-ConnectionGUID: fCFG0CZWSe+5wphEDNEfdw==
X-CSE-MsgGUID: sfq17LyUTiCklkbkljwU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="62015797"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="62015797"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:54 -0700
X-CSE-ConnectionGUID: lzEm3K2FR72KwstWyYHG9Q==
X-CSE-MsgGUID: TakxZF6vRGWLwfxTYMc+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="173994571"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:56:49 -0700
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
Subject: [PATCH 04/24] PCI: Move find_bus_resource_of_type() earlier
Date: Fri, 22 Aug 2025 17:55:45 +0300
Message-Id: <20250822145605.18172-5-ilpo.jarvinen@linux.intel.com>
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

Move find_bus_resource_of_type() earlier in setup-bus.c to be able to
call it in upcoming changes.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 56 ++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index def29506700e..4097d8703b8f 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -140,6 +140,34 @@ static void restore_dev_resource(struct pci_dev_resource *dev_res)
 	res->flags = dev_res->flags;
 }
 
+/*
+ * Helper function for sizing routines.  Assigned resources have non-NULL
+ * parent resource.
+ *
+ * Return first unassigned resource of the correct type.  If there is none,
+ * return first assigned resource of the correct type.  If none of the
+ * above, return NULL.
+ *
+ * Returning an assigned resource of the correct type allows the caller to
+ * distinguish between already assigned and no resource of the correct type.
+ */
+static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
+						  unsigned long type_mask,
+						  unsigned long type)
+{
+	struct resource *r, *r_assigned = NULL;
+
+	pci_bus_for_each_resource(bus, r) {
+		if (r == &ioport_resource || r == &iomem_resource)
+			continue;
+		if (r && (r->flags & type_mask) == type && !r->parent)
+			return r;
+		if (r && (r->flags & type_mask) == type && !r_assigned)
+			r_assigned = r;
+	}
+	return r_assigned;
+}
+
 static bool pdev_resources_assignable(struct pci_dev *dev)
 {
 	u16 class = dev->class >> 8, command;
@@ -876,34 +904,6 @@ static void pci_bridge_check_ranges(struct pci_bus *bus)
 	}
 }
 
-/*
- * Helper function for sizing routines.  Assigned resources have non-NULL
- * parent resource.
- *
- * Return first unassigned resource of the correct type.  If there is none,
- * return first assigned resource of the correct type.  If none of the
- * above, return NULL.
- *
- * Returning an assigned resource of the correct type allows the caller to
- * distinguish between already assigned and no resource of the correct type.
- */
-static struct resource *find_bus_resource_of_type(struct pci_bus *bus,
-						  unsigned long type_mask,
-						  unsigned long type)
-{
-	struct resource *r, *r_assigned = NULL;
-
-	pci_bus_for_each_resource(bus, r) {
-		if (r == &ioport_resource || r == &iomem_resource)
-			continue;
-		if (r && (r->flags & type_mask) == type && !r->parent)
-			return r;
-		if (r && (r->flags & type_mask) == type && !r_assigned)
-			r_assigned = r;
-	}
-	return r_assigned;
-}
-
 static resource_size_t calculate_iosize(resource_size_t size,
 					resource_size_t min_size,
 					resource_size_t size1,
-- 
2.39.5


