Return-Path: <linuxppc-dev+bounces-11209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2FB31D0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jxs6s0Rz3cp1;
	Sat, 23 Aug 2025 00:58:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874737;
	cv=none; b=hHr+IMtxJ0MPhI0WTiGfPAcUeGNbzWd0wqoi1nZC2juev3nsqLDhJsYJcUJR+0z2qt3H3nVS9am9yUbEsTzj0HZ7ptack3sIM4wYrPyOwbM0RX8s2GgfN6Ex6pE3xF6EsDZ8b/NdnCD+z6TI5Uhx7J7csKa0T6DxwiiCzUnZY41fyU/UhX5ZCHpsglQcwh0tRCrFMjjSC7Ky8EmPLJl4dfj/F+RGedvX4NEQck2jVPJX7IqzuXvcY79pdRzEZRB5B+xmS7634E1IdZOMZz/zDmXrc3yh2461k+muMGvOowFpaKU0vHFsTfTwdIP0ENVrlO7EO4w4wSuV4vndSmuF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874737; c=relaxed/relaxed;
	bh=wlCkJBSf4etx1fNbOMaSAZkDpwtWoVIIuGBCzMvzrLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/v0Nf4kcsYndSuO8HZN0smup37KtsHSbJXmdHxkfiNxwq+DwdJgu2XOdwrnV/whoBNf4NV8IymW7YXPMId5pw//0lfl9LwjaQ+KmihYsVk+vZH+Z6MdjvlcOdp6rSQguAAUIio7C1O5ZGDoYm8fzZxeOdEdwudB9AxXBxwUC+Tc1SEXbnc21ggT+7kLuHoTm7BBc/KzR4rDPpfhr4GsMJTxWlIQxIpYHqJ8EAKMdJx+46jCKalkmQ7AVang2LI2EXVOrn93S7J245BlfWcA19pVdYB6b/2DG96Az03BTfDSx5mvYu+mUB63wEXzXEvxv76+WMFUsoBNNAnpqqImKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sth9ZNjQ; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sth9ZNjQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jxs12J4z3cnT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874737; x=1787410737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X8NhfOVVPeUuaZ7xzX5xjJ3Kbd+6Ye2qksEkgXo7VC8=;
  b=Sth9ZNjQoNDvY8Ex3Rr23pWZaOJoHKdcCF1se4l0cjSwjvL5k7yhb7Z3
   j1wPYe4z9UjBUkfN3dPhQckK5BUFDhiDIy9aAA+lomePtfhqCfxHc+Om6
   3oL5voX+pj4pDY5SbSiLvmjGlA3WAvrjGY2rtaEzUsWBykd3eVKZRUiWH
   v4SQRaCvTKktskiByv5HSUIdMvOgsvvwpiZVToiTokeHl8P8QrMzfeR5L
   FDSkwrflVL7qOjOXbbkQq3ko4g547qsLwoeJp45RKrgN9BanpzpQ9YYE/
   wmn3AK4OzFdRwu+rQrPmuNAPQBrPFUZfmrNNb/Sh0yJ/0xvcxjleHs73I
   w==;
X-CSE-ConnectionGUID: IERG+Qi8Rl2eeoZo4FkozA==
X-CSE-MsgGUID: UqdKRoMoS7aZEBSF9lCxvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201523"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201523"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:55 -0700
X-CSE-ConnectionGUID: czktQPQuQrqYykt9N0PyQQ==
X-CSE-MsgGUID: P1NLfDMUSq2nPtJmAVVs0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199695258"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:50 -0700
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
Subject: [PATCH 17/24] PCI: Rename resource variable from r to res
Date: Fri, 22 Aug 2025 17:55:58 +0300
Message-Id: <20250822145605.18172-18-ilpo.jarvinen@linux.intel.com>
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

Resource is going to be passed in as argument aften an upcoming change.
Rename the struct resource variable from "r" to "res" to avoid using
one letter variable name in a function argument.

This rename is made separately to reduce churn in the upcoming change.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 3f2776f7a1b2..dac0f0f0360b 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1241,24 +1241,24 @@ static bool pbus_upstream_space_available(struct pci_bus *bus, unsigned long mas
 		.align = align,
 	};
 	struct pci_bus *downstream = bus;
-	struct resource *r;
+	struct resource *res;
 
 	while ((bus = bus->parent)) {
 		if (pci_is_root_bus(bus))
 			break;
 
-		pci_bus_for_each_resource(bus, r) {
-			if (!r || !r->parent || (r->flags & mask) != type)
+		pci_bus_for_each_resource(bus, res) {
+			if (!res || !res->parent || (res->flags & mask) != type)
 				continue;
 
-			if (resource_size(r) >= size) {
+			if (resource_size(res) >= size) {
 				struct resource gap = {};
 
-				if (find_resource_space(r, &gap, size, &constraint) == 0) {
+				if (find_resource_space(res, &gap, size, &constraint) == 0) {
 					gap.flags = type;
 					pci_dbg(bus->self,
 						"Assigned bridge window %pR to %pR free space at %pR\n",
-						r, &bus->busn_res, &gap);
+						res, &bus->busn_res, &gap);
 					return true;
 				}
 			}
@@ -1266,7 +1266,7 @@ static bool pbus_upstream_space_available(struct pci_bus *bus, unsigned long mas
 			if (bus->self) {
 				pci_info(bus->self,
 					 "Assigned bridge window %pR to %pR cannot fit 0x%llx required for %s bridging to %pR\n",
-					 r, &bus->busn_res,
+					 res, &bus->busn_res,
 					 (unsigned long long)size,
 					 pci_name(downstream->self),
 					 &downstream->busn_res);
-- 
2.39.5


