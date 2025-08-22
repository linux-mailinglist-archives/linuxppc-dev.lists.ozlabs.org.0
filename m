Return-Path: <linuxppc-dev+bounces-11210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95587B31D10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jy31lvjz3cyc;
	Sat, 23 Aug 2025 00:59:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874747;
	cv=none; b=CMRs/waxcdamydspbl8cczqlpW+lOlnd2hyW9usdBBwbQkgpIDfHMq/FlWjmzvL+oBSaj0TBAxH8+GQL00T2Bazx/o2YecQlbdUpR2cpUS4AKP3kLwhdc08I5gTs8zz7vlpLVXkPOs5NJjIenZNXJlJIvZ0u0mKB8EEJMnsxVbseN7dwGSYbDLn93NVB6beMzti0fr7MEvZ691UmTyh8+XyM7k94TGa36kK/iyni/HE8CF1Ovw2Q/eNFuSqBLBNLZbjQbbLTglpNQeU38BAzwiHI3LcvyNRVhmhhR7L15jh9zmoynk4mreqxauAd3K04LqRcBbowN175YQnVosiMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874747; c=relaxed/relaxed;
	bh=PD8iAzltoCvsyhV9OIZVM4HA0u6a90U5wcbuo+5vojk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a3j9ZcDIDqCLoksjptke9V1C4tgylExnonzm4F4wpAKEMVzxZQFgtzdfJtZ5sLOhuDuwRTwqZyagH8ozxAtn0ZeBZqsNniPY4bqkjYkLRK4+nckETDBBnafw52ukvhcVMkxA89ZL5MDBvvrb8d7QRAqu1wMlOB/UF5yNU4vtz7Dv5hSTTE6QYshWiCBlBa0ktXW+p/7R1knAboVWyU5WVwUXbrIMoIWC/dUPeghWAXiDC3SG2MyWOdHzDknOKGld/HC0x4g3yRAbs5/HsrI4koVSadw6s81n6t2JQDc7waLhkLu6vBrhdKwEIKfKAm0mlu9QuDu+jKct4XJoKgOEnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkJ9PsOV; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkJ9PsOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jy232L9z3cyb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874746; x=1787410746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zEebpfWhIu4kEBCI6/4Upo0OygKQhbBhWc3ZzCti864=;
  b=mkJ9PsOVXdAaozT1RBSommaNGg7ABxoTwdyNGl8mSaBDjdqJRZzpfc61
   AMfpBPtA2+pwHFgF4iRchDuygWMil48dUh1enuL/hLvE2RGwtFr/1WzB9
   VISKGI4uz2mNJGFXI0E5Yic+OmKHYUQc+Wq2sVcYCHdwRrvny4oJsS4KP
   IKul4wU1BEzUBs3trjdJKSwvUGG7LEeXKcW9je0NC7CPYKGbWIWDxs1v5
   fRWz6Z42sTaSdghZD52YwU/humaYWs85b4ebA+JfzSGRhRFgdN+AK37PN
   Q7T7qqpi+qyVj+kAqCkasxFRA2L7Ovf4/cRsvwNgLOAakpB8suJYYGBY8
   w==;
X-CSE-ConnectionGUID: p6cE9QPgTxirKFngGkekWg==
X-CSE-MsgGUID: SBk7xZ04TvayVM0w4ZyCiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201550"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201550"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:59:04 -0700
X-CSE-ConnectionGUID: LJ5O817yQ/6u/ta8++jQNg==
X-CSE-MsgGUID: DLoNXUW9R/asIEjMWY+u8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199695276"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:59 -0700
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
Subject: [PATCH 18/24] PCI: Use pbus_select_window() in space available checker
Date: Fri, 22 Aug 2025 17:55:59 +0300
Message-Id: <20250822145605.18172-19-ilpo.jarvinen@linux.intel.com>
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

pbus_upstream_space_available() figures out the upstream bridge window
resources on its own. Migrate it to use pbus_select_window().

Note, pbus_select_window() -> pbus_select_window_for_type() calls
find_bus_resource_of_type() for root bus, which does not do parent
check similar to what pbus_upstream_space_available() did earlier, but
the difference does not matter because pbus_upstream_space_available()
itself stops when it encounters the root bus.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 63 ++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index dac0f0f0360b..281ca5c73c97 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1221,19 +1221,20 @@ static inline resource_size_t calculate_mem_align(resource_size_t *aligns,
 /**
  * pbus_upstream_space_available - Check no upstream resource limits allocation
  * @bus:	The bus
- * @mask:	Mask the resource flag, then compare it with type
- * @type:	The type of resource from bridge
+ * @res:	The resource to help to pick the correct bridge window
  * @size:	The size required from the bridge window
  * @align:	Required alignment for the resource
  *
  * Checks that @size can fit inside the upstream bridge resources that are
- * already assigned.
+ * already assigned. @res (its type) is used to select to correct upstream
+ * bridge window.
  *
  * Return: %true if enough space is available on all assigned upstream
  * resources.
  */
-static bool pbus_upstream_space_available(struct pci_bus *bus, unsigned long mask,
-					  unsigned long type, resource_size_t size,
+static bool pbus_upstream_space_available(struct pci_bus *bus,
+					  struct resource *res,
+					  resource_size_t size,
 					  resource_size_t align)
 {
 	struct resource_constraint constraint = {
@@ -1241,39 +1242,39 @@ static bool pbus_upstream_space_available(struct pci_bus *bus, unsigned long mas
 		.align = align,
 	};
 	struct pci_bus *downstream = bus;
-	struct resource *res;
 
 	while ((bus = bus->parent)) {
 		if (pci_is_root_bus(bus))
 			break;
 
-		pci_bus_for_each_resource(bus, res) {
-			if (!res || !res->parent || (res->flags & mask) != type)
-				continue;
-
-			if (resource_size(res) >= size) {
-				struct resource gap = {};
+		res = pbus_select_window(bus, res);
+		if (!res)
+			return false;
+		if (!res->parent)
+			continue;
 
-				if (find_resource_space(res, &gap, size, &constraint) == 0) {
-					gap.flags = type;
-					pci_dbg(bus->self,
-						"Assigned bridge window %pR to %pR free space at %pR\n",
-						res, &bus->busn_res, &gap);
-					return true;
-				}
-			}
+		if (resource_size(res) >= size) {
+			struct resource gap = {};
 
-			if (bus->self) {
-				pci_info(bus->self,
-					 "Assigned bridge window %pR to %pR cannot fit 0x%llx required for %s bridging to %pR\n",
-					 res, &bus->busn_res,
-					 (unsigned long long)size,
-					 pci_name(downstream->self),
-					 &downstream->busn_res);
+			if (find_resource_space(res, &gap, size, &constraint) == 0) {
+				gap.flags = res->flags;
+				pci_dbg(bus->self,
+					"Assigned bridge window %pR to %pR free space at %pR\n",
+					res, &bus->busn_res, &gap);
+				return true;
 			}
+		}
 
-			return false;
+		if (bus->self) {
+			pci_info(bus->self,
+				 "Assigned bridge window %pR to %pR cannot fit 0x%llx required for %s bridging to %pR\n",
+				 res, &bus->busn_res,
+				 (unsigned long long)size,
+				 pci_name(downstream->self),
+				 &downstream->busn_res);
 		}
+
+		return false;
 	}
 
 	return true;
@@ -1395,8 +1396,7 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 		b_res->flags &= ~IORESOURCE_DISABLED;
 
 	if (bus->self && size0 &&
-	    !pbus_upstream_space_available(bus, mask | IORESOURCE_PREFETCH, type,
-					   size0, min_align)) {
+	    !pbus_upstream_space_available(bus, b_res, size0, min_align)) {
 		relaxed_align = 1ULL << (max_order + __ffs(SZ_1M));
 		relaxed_align = max(relaxed_align, win_align);
 		min_align = min(min_align, relaxed_align);
@@ -1411,8 +1411,7 @@ static int pbus_size_mem(struct pci_bus *bus, unsigned long mask,
 					  resource_size(b_res), add_align);
 
 		if (bus->self && size1 &&
-		    !pbus_upstream_space_available(bus, mask | IORESOURCE_PREFETCH, type,
-						   size1, add_align)) {
+		    !pbus_upstream_space_available(bus, b_res, size1, add_align)) {
 			relaxed_align = 1ULL << (max_order + __ffs(SZ_1M));
 			relaxed_align = max(relaxed_align, win_align);
 			min_align = min(min_align, relaxed_align);
-- 
2.39.5


