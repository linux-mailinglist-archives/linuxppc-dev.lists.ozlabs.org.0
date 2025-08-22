Return-Path: <linuxppc-dev+bounces-11194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369CB31CF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jwF50Zwz3chc;
	Sat, 23 Aug 2025 00:57:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874653;
	cv=none; b=lSVZXHqvaiGHa4Dk35W0/lWck2iFF/gprPWynHyU0nH11z1r5LE3Yk5dvEvlnjq6FMFSN90f8jkY031ey8QwSw2yU49aFHN0nlltgvHydH3TGF81tHyBKDR8HnT5w5xXDm4t3iDrG3uBiGn3/PsrXNVa8fyP4shvS2tWXow3x2MvWccaxSyMVZUxk5c3zc79FFrykryeuvztRC8goSKGkmpGi6IOC0GpfQsRPiGn/yobAyJd9+c7gvRFBoIwRyTHDd2/EK+BKk6XwCPg+NJMGauJCiwI/zhjki/MyJ3vXvQQ8vsSMpnFvNpEL5RshGRDEgZn3VIS60svwXLGGQTBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874653; c=relaxed/relaxed;
	bh=EwmxJIs2oQ8Ql1HbTV/+/qe/KrHZzqhOI3l3X6BgujI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQy15kjK47Shm2DScYnnkGMyI4J1bYzcIUCaTupONIexQdwN5g6CdejITIBCYHgB0j0Q8K8fTviTqoGLgFI9IjejFE7So8FaV7SK91QB6VgJb9u/g9PQtxKqvrAbobiWwLxePKSJHucemfaJ3Tr90hluGhELccak6KCWJVRr2W3ziyDC8NfLrWkR0SJsorERLx7zgjufSLL5mpnOEa7ze+AQw+V9SHUTjRAtXyao/QV2+65yAPW+fdBg9+SSrqUArxSsDyyZPTS8D4kWGkkPZxtHov/AvJkO5lYuzxLdz6J/TiDnq5i39cGHsJvDJggsr3IgjCt/2dHYj0dyBLeuqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtlYBa+h; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NtlYBa+h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jwD65NFz3chn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:57:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874653; x=1787410653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h9rOaKJ78cwvTMGhAeaZehjm2lm9CqbJUu56YHFbep4=;
  b=NtlYBa+htL6MdgoPJLi7VfhE0hwfSNiTYFIMlzJX1rKZVa97CgCcogMY
   xGknrqsWaqR5yIcTH4rucnTOPwoDKzmvbs5hqinl11CaogBTlvZ9FXJNP
   hEH5IkDAoVK7kDEiWCI2Zqeig4tI/dmXytprNDkhlhBEqHJx/iSYnM4yZ
   IOmRmzmtmVgLLwmegFW+OaCKf71/ApBSDp58CEH/hZpJK0tsivX7tslSE
   mRXVcd7DITrClpXee9KN4KUrCvsWP3eh3/XTC+8pD+gRMsaepJHz1znq3
   9pQ5xsIB3GcguUdbvWkY3pHXufrTsUYv2HGHzcIuRDwLc5aI/V2JmDAkD
   g==;
X-CSE-ConnectionGUID: l/ZHGgWVQ0qNK8qB/WT6YA==
X-CSE-MsgGUID: OPeOlYtUQFKnh5UUOtJKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201341"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:30 -0700
X-CSE-ConnectionGUID: DvVLJoVkQxS29oGAHEDBlA==
X-CSE-MsgGUID: Ujk0XRTPSUO4HfTmYVIn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="168920472"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:57:25 -0700
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
Subject: [PATCH 08/24] PCI: Use pci_release_resource() instead of release_resource()
Date: Fri, 22 Aug 2025 17:55:49 +0300
Message-Id: <20250822145605.18172-9-ilpo.jarvinen@linux.intel.com>
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

A few places in setup-bus.c call release_resource() directly and
end up duplicating functionality from pci_release_resource() such
as parent check, logging, and clearing the resource. Worse yet,
the way the resource is cleared is inconsistent between different
sites.

Convert release_resource() calls into pci_release_resource() to remove
code duplication. The will also make the resource start, end, and flags
behavior consistent, ie., start address is cleared, and only
IORESOURCE_UNSET is asserted for the resource.

While at it, eliminate the unnecessary initialization of idx variable in
pci_bridge_release_resources().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 46 +++++++++++++----------------------------
 drivers/pci/setup-res.c | 11 +++++++---
 include/linux/pci.h     |  2 +-
 3 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 6bdc1af887da..b62465665abc 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -473,8 +473,6 @@ static void __assign_resources_sorted(struct list_head *head,
 	struct pci_dev_resource *dev_res, *tmp_res, *dev_res2;
 	struct resource *res;
 	struct pci_dev *dev;
-	const char *res_name;
-	int idx;
 	unsigned long fail_type;
 	resource_size_t add_align, align;
 
@@ -582,14 +580,7 @@ static void __assign_resources_sorted(struct list_head *head,
 		res = dev_res->res;
 		dev = dev_res->dev;
 
-		if (!res->parent)
-			continue;
-
-		idx = pci_resource_num(dev, res);
-		res_name = pci_resource_name(dev, idx);
-		pci_dbg(dev, "%s %pR: releasing\n", res_name, res);
-
-		release_resource(res);
+		pci_release_resource(dev, pci_resource_num(dev, res));
 		restore_dev_resource(dev_res);
 	}
 	/* Restore start/end/flags from saved list */
@@ -1732,7 +1723,7 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 	struct resource *r;
 	unsigned int old_flags;
 	struct resource *b_res;
-	int idx = 1;
+	int idx, ret;
 
 	b_res = &dev->resource[PCI_BRIDGE_RESOURCES];
 
@@ -1766,21 +1757,18 @@ static void pci_bridge_release_resources(struct pci_bus *bus,
 
 	/* If there are children, release them all */
 	release_child_resources(r);
-	if (!release_resource(r)) {
-		type = old_flags = r->flags & PCI_RES_TYPE_MASK;
-		pci_info(dev, "resource %d %pR released\n",
-			 PCI_BRIDGE_RESOURCES + idx, r);
-		/* Keep the old size */
-		resource_set_range(r, 0, resource_size(r));
-		r->flags = 0;
 
-		/* Avoiding touch the one without PREF */
-		if (type & IORESOURCE_PREFETCH)
-			type = IORESOURCE_PREFETCH;
-		__pci_setup_bridge(bus, type);
-		/* For next child res under same bridge */
-		r->flags = old_flags;
-	}
+	type = old_flags = r->flags & PCI_RES_TYPE_MASK;
+	ret = pci_release_resource(dev, PCI_BRIDGE_RESOURCES + idx);
+	if (ret)
+		return;
+
+	/* Avoiding touch the one without PREF */
+	if (type & IORESOURCE_PREFETCH)
+		type = IORESOURCE_PREFETCH;
+	__pci_setup_bridge(bus, type);
+	/* For next child res under same bridge */
+	r->flags = old_flags;
 }
 
 enum release_type {
@@ -2425,7 +2413,6 @@ int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
 		for (i = PCI_BRIDGE_RESOURCES; i < PCI_BRIDGE_RESOURCE_END;
 		     i++) {
 			struct resource *res = &bridge->resource[i];
-			const char *res_name = pci_resource_name(bridge, i);
 
 			if ((res->flags ^ type) & PCI_RES_TYPE_MASK)
 				continue;
@@ -2438,12 +2425,7 @@ int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned long type)
 			if (ret)
 				goto cleanup;
 
-			pci_info(bridge, "%s %pR: releasing\n", res_name, res);
-
-			if (res->parent)
-				release_resource(res);
-			res->start = 0;
-			res->end = 0;
+			pci_release_resource(bridge, i);
 			break;
 		}
 		if (i == PCI_BRIDGE_RESOURCE_END)
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index d2b3ed51e880..0468c058b598 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -406,20 +406,25 @@ int pci_reassign_resource(struct pci_dev *dev, int resno,
 	return 0;
 }
 
-void pci_release_resource(struct pci_dev *dev, int resno)
+int pci_release_resource(struct pci_dev *dev, int resno)
 {
 	struct resource *res = pci_resource_n(dev, resno);
 	const char *res_name = pci_resource_name(dev, resno);
+	int ret;
 
 	if (!res->parent)
-		return;
+		return 0;
 
 	pci_info(dev, "%s %pR: releasing\n", res_name, res);
 
-	release_resource(res);
+	ret = release_resource(res);
+	if (ret)
+		return ret;
 	res->end = resource_size(res) - 1;
 	res->start = 0;
 	res->flags |= IORESOURCE_UNSET;
+
+	return 0;
 }
 EXPORT_SYMBOL(pci_release_resource);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 59876de13860..275df4058767 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1417,7 +1417,7 @@ void pci_reset_secondary_bus(struct pci_dev *dev);
 void pcibios_reset_secondary_bus(struct pci_dev *dev);
 void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
-void pci_release_resource(struct pci_dev *dev, int resno);
+int pci_release_resource(struct pci_dev *dev, int resno);
 static inline int pci_rebar_bytes_to_size(u64 bytes)
 {
 	bytes = roundup_pow_of_two(bytes);
-- 
2.39.5


