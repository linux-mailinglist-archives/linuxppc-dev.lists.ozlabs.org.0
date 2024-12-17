Return-Path: <linuxppc-dev+bounces-4260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330219F4CD9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJGK1JXPz30TN;
	Wed, 18 Dec 2024 00:54:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443689;
	cv=none; b=EqGt0m13WZIM4VPVzUgTKiwPWSRbUDf5NG+Ro2p6JWg8Rz1iwIILY0iJFDjJiD919umHfLpT/Pzn0CosZt1Cn+QBzIJzRZSQxHdrZGIDCS+roZBtHIoinTX5XmlkVOn5wNaqU6alLJP8Ewjqr4a9HfGZfpQOU1mBF4yQfJtdxfowtgPmZ79zcp8a7yuRlpUl65c2FMDFkQgw+oom/gCj3EHjFumysHyspTVaM83dWvShszd00hESeHQdpuCKtotd3C5JkvGYNk98R0m54l3GLdOCbJICN06Er3nZHheOIf4o6T/d7wpuTPpCjTsRMZRmXE3nqR+eTwet987+RXA7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443689; c=relaxed/relaxed;
	bh=axVvX0VznfhaEcm2aTLZUSTbZ2bG/jfMOoJqOoKOSgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHM2bUBv+su0CiCfb9HnXToTwmp0DAytx9h2QvCQGiJ7klopVSfh+4GiXsb8kzhw8qgXqPWUsP4YKdvIXSTB0pLHnZYZN4lDEalLkHvFHfR5aHOPNiAoIMmaBUPOg6ygpGRbJwGiY5MRl6TYfx5OBj5M7hhrrZOZN5UfSHdRA/zli29vVA36BpBcTNlf3Are9nWnebh1QAJ0ieXgOqkJd/uNgTTV9CdlkV6XoS3esLUILN0Ua4/McRd8wG7cZb9/D4+IJVbMYMXLk8mMS5H8gSmw0NsMOa0WQk3TUjasgye918VE0fyV535MQiaOmVa0xHTIQLxd2i06C/aF1qPMCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T1W9FmEB; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T1W9FmEB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJGJ09QRz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:54:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443689; x=1765979689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z7XBwv6cx/fb2OyBxd6hhF91iwJqm4GWqCEk7rKMIic=;
  b=T1W9FmEB8eZXAb+i2qtIJXjX1IDD76fAYnmM1yKSz0PBwbmmd8e+/WtB
   7EzQYy0Ac059oZIzHJEknStv7ypCe1nXQgi9LRD0HXNe56BozKRYgAT3U
   Ku7d1OFq1MiAXz7Ow7rYLX7/95KqHBl8OeuBhE5PVPjH5E134/9WQMX4S
   GHwk9fEdROycJitVskpw/1hk652qQMQhaT7L+JDe+qozNOLfMZYe/10qv
   x4b87U4PhgjxXUGtdB4q1i1F3Tacw/hel1DBL6wWnWIQTRoSXcsEa96QF
   WtO6GquqewqMdxFVAVKUDm7tH9K5X9WPPWIRHmdWoYNts1XKrhUAP75UO
   Q==;
X-CSE-ConnectionGUID: 2KK23aYMTNenU9TUWIY6vQ==
X-CSE-MsgGUID: uIxsEr6vRuaelDZhP3YWnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34907137"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34907137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:46 -0800
X-CSE-ConnectionGUID: Y0OkvrVTTeesgVIWR9z4yQ==
X-CSE-MsgGUID: x6jYpCKWTVaM1Gp47UyocA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97435431"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:54:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 3/8] PCI: Make pcie_read_tlp_log() signature same
Date: Tue, 17 Dec 2024 15:53:53 +0200
Message-Id: <20241217135358.9345-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
References: <20241217135358.9345-1-ilpo.jarvinen@linux.intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

pcie_read_tlp_log()'s prototype and function signature diverged due to
changes made while applying.

Make the parameters of pcie_read_tlp_log() named identically.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pcie/tlp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/tlp.c b/drivers/pci/pcie/tlp.c
index 3f053cc62290..2bf15749cd31 100644
--- a/drivers/pci/pcie/tlp.c
+++ b/drivers/pci/pcie/tlp.c
@@ -15,22 +15,21 @@
  * pcie_read_tlp_log - read TLP Header Log
  * @dev: PCIe device
  * @where: PCI Config offset of TLP Header Log
- * @tlp_log: TLP Log structure to fill
+ * @log: TLP Log structure to fill
  *
- * Fill @tlp_log from TLP Header Log registers, e.g., AER or DPC.
+ * Fill @log from TLP Header Log registers, e.g., AER or DPC.
  *
  * Return: 0 on success and filled TLP Log structure, <0 on error.
  */
 int pcie_read_tlp_log(struct pci_dev *dev, int where,
-		      struct pcie_tlp_log *tlp_log)
+		      struct pcie_tlp_log *log)
 {
 	int i, ret;
 
-	memset(tlp_log, 0, sizeof(*tlp_log));
+	memset(log, 0, sizeof(*log));
 
 	for (i = 0; i < 4; i++) {
-		ret = pci_read_config_dword(dev, where + i * 4,
-					    &tlp_log->dw[i]);
+		ret = pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
 		if (ret)
 			return pcibios_err_to_errno(ret);
 	}
-- 
2.39.5


