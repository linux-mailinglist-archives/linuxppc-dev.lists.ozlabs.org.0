Return-Path: <linuxppc-dev+bounces-11208-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF6B31D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 16:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7jxh26wFz3cht;
	Sat, 23 Aug 2025 00:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755874728;
	cv=none; b=O8hos81uCPfsKB5oDmAuIffsKcfPSMU4hD1BOmzEzvtqg5afiByrhs4/8VQgC4P/C4OJxH65iyllExnhuHz1msJw7IDnK46D0d/wqrKJf2PTOZO6Bh/3iKUTJQzkCsNbG5HYQXgFgsGQJUvgS0dM4kjJXAkdG5ylwM4SwyJjKWGnYLXLhNNJqZFUWs++JUUFpFsJO4TDlUdFixoFowG5LDKXBmtcl6/YOUQRisNTPu1IHguM+POWL7SSHS6+kh74wt+gzkh3pydPBQvMfvqu/CvywB0tJahoZilxjhgSdbzvDWKSSWKRdAl0xKhWM6jKvGX7kAxZUYvTl58tNqZXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755874728; c=relaxed/relaxed;
	bh=jKcU7Wt3/tMJXSDyxGlK5AOfk8HkC6R/msbD+zbNEV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKsQPquet2QEDMh7H8AyacfcQJbQrN2Myy8kBL29SGtKu7JWTwmXWbavx8bX1sCRQUWlv5STH3mGFplsZPkxKXn8YRSPW3UfanVCLB0zZ6b8T7PN6EGtU4LDnVz5iLBh0SCVOs3fZ5THvaC+gyeun2efAUCJVH5AfrkpW6fddoAkxpR26rO/3sSwysNwzD0k82tCQu3f/2PrNvOTvqtbaZ4XLOlpmzY/AzJMMIvwV1jTsuSmAoUKXSfkvjCE4WvhHnn2M8zU2i1ocnXYpgb1s/v7la7gF65C6VZ+wZidMbUnjGpDx0eo40GRVU4NqIAwHfMpDDG2sNcUrQrlRPxraQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOFu5rrm; dkim-atps=neutral; spf=none (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOFu5rrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7jxg3Mv7z3cnT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 00:58:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755874727; x=1787410727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hKKkyDwuMgQSuHsgEQCnHOBtmnEIBd1H4fruJqqsGtc=;
  b=ZOFu5rrmgR3EPRBaXYI8JTEMCBSQwpjf+eRc1zi9UxGKWcCxoBT5gPsL
   1hUbwfblEF0a04GVdjJ5TAlAP3Nm95FYGSzojBaCGPOqvL+cFx3cFrdoO
   JOiwU8kLjc1Rmgy39H7Nbj7q2gmyv9/q9NP0BSFZlit8aTMsJ/9MGG1O2
   amTLBjj/A8bSspSKrwn7u4QTmNXsRcoVziJjNQ3kCOiUbMgu2NHo/Y5HI
   hlboD1V0MNagUSjvfBukzTxm3ZNsXDaBUoyAF2hBdIHbSFrYZ1LnNdCfl
   jodWLi51KVDBNYJ6GkxarhJcbcIQgU2TsDLSxn9PjoR9wmpqOFi50oCt3
   g==;
X-CSE-ConnectionGUID: SQymmGkETfGlTHsihYO/zA==
X-CSE-MsgGUID: ZexOT1UXReujC5VkjLibFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57201498"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57201498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:45 -0700
X-CSE-ConnectionGUID: oPGWRSQbROyBWCGWWqNJgg==
X-CSE-MsgGUID: SJBAxeC5SDOdrWApIXnu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="199695252"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.115])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 07:58:40 -0700
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
Subject: [PATCH 16/24] PCI: Use pbus_select_window_for_type() during IO window sizing
Date: Fri, 22 Aug 2025 17:55:57 +0300
Message-Id: <20250822145605.18172-17-ilpo.jarvinen@linux.intel.com>
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

Convert pbus_size_io() to use pbus_select_window_for_type().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/setup-bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 55289cd58e2c..3f2776f7a1b2 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1122,8 +1122,7 @@ static void pbus_size_io(struct pci_bus *bus, resource_size_t min_size,
 			 struct list_head *realloc_head)
 {
 	struct pci_dev *dev;
-	struct resource *b_res = find_bus_resource_of_type(bus, IORESOURCE_IO,
-							   IORESOURCE_IO);
+	struct resource *b_res = pbus_select_window_for_type(bus, IORESOURCE_IO);
 	resource_size_t size = 0, size0 = 0, size1 = 0;
 	resource_size_t children_add_size = 0;
 	resource_size_t min_align, align;
-- 
2.39.5


