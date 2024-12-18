Return-Path: <linuxppc-dev+bounces-4327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9299F68B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxBD1gC5z30W0;
	Thu, 19 Dec 2024 01:38:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532708;
	cv=none; b=k4xjdh2w9mx6QfvQfXsYHTqePCHK6APKr+sIDWs0poiLhhy/nMxYUJ8aR8MZd22AeUft4ouum7n8DADir4tNk4KOeHT1n1HC4FDRa2Vzj8VJi6aYXinaBZvkxZ4P2Dr8mYxTudvvWa3oEhbDq7M6O9PBIdQr/c3UbuvGj/6fxU3IcxEHIOyT26u9v7OYsZxKHbPJqhwxnm6eE4fHyWHhpPhnmQH3aiTj0lZWq2Niq9HWOKD3moWx1pzf9htyHj/7LZi49DTOlZXCfGyS3i0tV2kmHSb5mpgmB55Io0zZBMEwli446nabyeZkjVlst1bn6AEfnGMIZ8oKl04USn7DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532708; c=relaxed/relaxed;
	bh=axVvX0VznfhaEcm2aTLZUSTbZ2bG/jfMOoJqOoKOSgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JMm8fQHqrChtxn+EOjoMD2LlWYPoWjvZPmiQhgdv9q4ern7KbBOuZyJ/ANJF3+QJr1agGBcpavR1K6QoK+veoQyD73UBsnVFRKAtZcQnPZ2lbr58Nir/IlgnGgK76RGhKo1tecNEyDNrTZjwLAHw9NFwRV4aRfGdBS3wl285hHnCGBI28KFYEVic/exC3XFoydBnuYTIcxfibUZ2+XffdobBlwyJgeksLtY0O1xitHql2rDloA3hRd1zNfapGXBR0Tt7TmgcmJtLR6fQy8z4+Dea2C5MEaIHXWELTKeCTygfiXAipQAjOTwbyDvgnYB3QhCPKU2l6grAQlV19TtkoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G2bCHnv2; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G2bCHnv2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxBC0WXrz30Vm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:38:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734532707; x=1766068707;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z7XBwv6cx/fb2OyBxd6hhF91iwJqm4GWqCEk7rKMIic=;
  b=G2bCHnv2EnuQzSUgWNrPNWDBH86x7rWWr3U3q4gsstWwoVtusWo2dMoo
   YpOIf3mNF55cVuRl+n3koXd941HJqqPW8oNxmYOaMwu3VnY1fWDRficsV
   jKXmHtCe+cL+cl9XUu+/TgDDI5AdeIDPgS2FL1b0x/Qt6i2STwDGKKztA
   9aWTb4Q0deH/qQbw9M35Nt5Xwvnm5/NwpO2B+37DFh90lUVYONABNusMj
   I1OGvZnFiXye37y/ul6gjL3tBFkx9HrGiBB41fNlDGAFIxMPegWABs7Qa
   pqIdoIokTI1zQzh0GwzZPF9q9F/qcY5xvpfd5HMV/iCH/jGpGcfKtqgAP
   g==;
X-CSE-ConnectionGUID: ucavsF0jQhSpZYVSHJlvKg==
X-CSE-MsgGUID: NM/DtCIjQhKYWsTO5TlWqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22597368"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="22597368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:25 -0800
X-CSE-ConnectionGUID: I4wnBeYUQ66x153Ycq8VgQ==
X-CSE-MsgGUID: haTFWO+SQUWKguDQNvepuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102974627"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 06:38:21 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 3/7] PCI: Make pcie_read_tlp_log() signature same
Date: Wed, 18 Dec 2024 16:37:43 +0200
Message-Id: <20241218143747.3159-4-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
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


