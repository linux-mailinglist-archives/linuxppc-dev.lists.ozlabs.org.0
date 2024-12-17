Return-Path: <linuxppc-dev+bounces-4265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6159F4CE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 14:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCJHC5400z30f4;
	Wed, 18 Dec 2024 00:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734443735;
	cv=none; b=P0TA7HIMXwzicXC/at0MTKJ27hmIFxyUNdAOXExVvhgly5aqLqN3Ssv1gI7k8AhXLOfnvObWTpMFLvGSsvHEkoendvFTpAwHNAW2lbMLx8y+aYwcA10vq/Ms8imPmRo8QWfTqmYZIXzOmrn7fP95Ir7V0U9C17lUYmpup2oF0UWX5ULoJ7DPQvDx9K/XhV5FO2KtCy0mj71VTZuzQrn9IvQm8mK+7USRHTQtHpcQKTN713rG2ZEcR4hoPQRL0OqJArp2gYedpIqJ2ETJkPNoCP1C/XQrj1PVlElPzbA/BqZ/xslqCEvaONpQomZU4QzBO7Sltui/WbjUPkwpF7M/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734443735; c=relaxed/relaxed;
	bh=/akz1K1SDta7Sq3d3e+B15NERfTOJp21EKbH5HcZKOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KmaPapPDe9qxVYLS9xz4Jc6DcAxa6lCqK5ZD759q3LDbZU8YWlyMkNhUyppX3IctL4eyFEo5QDS+0tGR0QL6dWEs8R3GKJsnfJ9pwnlSLrjqo3LwiaIVAy1m1LKCOruWl3u69i+yZothg6DvT/YK7FfgoD7Yw4fgYmz0Z9H0/qhuf02f4bJTmN3wfVVC3pt55xgomI2kYTg74Ipa6e/wt7sOgYg+Nf1IPMZKcixGDb/rY37+uEi9npvBQY8Ew2WemBSksVNWDtP51KcjplfOZhq6GBXAcjQw8QmB4baJMKKXUBBneW154u/lbzmyqRn6uiy5JvX4kyQpSjiHQwmC5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4Q5CUky; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4Q5CUky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCJHB3TsTz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 00:55:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734443735; x=1765979735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xoqRzVI0W8mzrozTSiloHUP8vgerlWiV4vwFpAgGE2U=;
  b=S4Q5CUkyWp+UtuCuZ/QP09lJYTNsV2s5gfr5HQZ+gCp/EZKSYjq3e2r8
   oIIygG7i/y4iMjHcefMLxUUD5yh05F5ZmxL8fEmsmAG46M+n/ExB/U9gG
   qT1M1f1Z4OrW6lE90jCB8zm2xRFR1siUvZRTpfihjrGON8HtcjHr1qjwn
   TMv+x17YG2LiU4XW7s/wn6ifrunjIhuNB1UZTsXb5tlAjhWur69fCOxPH
   bARQhXXT9MnzAB545ichS5roaWhH/ed7DAA854d7SABCNPxAI4HV24YRe
   qyrZZbIzeUrwO2+sqQ1++vM4mHobSfZouWReDW8TSKxIve5G8D5O77Zzn
   g==;
X-CSE-ConnectionGUID: 0zEcoxZBTXaBXGj4eE3zKg==
X-CSE-MsgGUID: D8OJnHIATM6qEFEHYnec5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34748439"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34748439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:55:32 -0800
X-CSE-ConnectionGUID: zressglESBKhDC5JuZ8yNw==
X-CSE-MsgGUID: nnSQZx3+RD2pqwVzlaO1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98109607"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:55:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 8/8] PCI/AER: Add prefixes to printouts
Date: Tue, 17 Dec 2024 15:53:58 +0200
Message-Id: <20241217135358.9345-9-ilpo.jarvinen@linux.intel.com>
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
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Only part of the AER diagnostic printouts use "AER:" prefix because
they use low-level pci_printk() directly to allow selecting level.

Add "AER:" prefix to lines that are printed with pci_printk().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/pci/pcie/aer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ece8cb88d110..1c251ac65d1b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -686,8 +686,8 @@ static void __aer_print_error(struct pci_dev *dev,
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
-				info->first_error == i ? " (First)" : "");
+		pci_printk(level, dev, "%s   [%2d] %-22s%s\n", dev_fmt(""), i,
+			   errmsg, info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
 }
@@ -709,12 +709,12 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 
 	level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
 
-	pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
-		   aer_error_severity_string[info->severity],
+	pci_printk(level, dev, "%sPCIe Bus Error: severity=%s, type=%s, (%s)\n",
+		   dev_fmt(""), aer_error_severity_string[info->severity],
 		   aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+	pci_printk(level, dev, "%s  device [%04x:%04x] error status/mask=%08x/%08x\n",
+		   dev_fmt(""), dev->vendor, dev->device, info->status, info->mask);
 
 	__aer_print_error(dev, info);
 
-- 
2.39.5


