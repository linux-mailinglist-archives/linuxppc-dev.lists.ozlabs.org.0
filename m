Return-Path: <linuxppc-dev+bounces-1337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B49782B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xkM4KLdz2yvv;
	Sat, 14 Sep 2024 00:38:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238299;
	cv=none; b=d+QFbpoxJsuBkeJSnTXyj+u6eqQtDvKQUpfsREMC/0ix8P7iy9MWD6YygCZ+mfTjNt5gL4cwjTGGQaG7YjJjHX1CTZpcaJFXEQdxAZZtltOPjb9aJ7iVIQlK+gqssOeGKzQ/GKP/uBI+/YBcLM9XXxIHrq3dll9l4XF6QiUvYwkrNPBwmhFotkvNS2UAunJ9KGw41USIABoezHf5/YN0TTqGbAyYeXIuOBZEDzDNBj+7RhkHg6DYLofaHt5LbgwcVgHwEt0SQbKUZu60by1XI3e8zXUvRC9QRIRQ9/fRWdjX/RAU/LlZlfz/29+ySJlQj2GVUhf+eWZKKEt6UIvJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238299; c=relaxed/relaxed;
	bh=cqVOG3QZUjcbX4rOm4CGj6r8Jve5GinwQRtFYmfNK1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9P/+kTZ0BCBQJPN7j8+qO2qbhWDqGicafd3zSRLtr3vVzdHthjecBN8Nvzt4LgkOTg8agHjaWdEtooyR1BAHKXHEdbxlgajYtxAzPjUrypUy+B1CHMx+CIMatlrK+mhoOOAoWRaFQtg2Yz+s5NwLUsTWPQthX/Co4Q0lowSGMA6YXB5BPCveMW2wNiZQQSnqQxjOS49I2Hjl4QN4SXcxetc5dpvye+rF93DGkr/PmtRJxsYdtHNzHRp5Jkum9VdQzWt2Z/lFDyNhik4e3glYSNEnqodgL2EEKjshLaWc24yfc83wdlHvzMEWUJggnSwHWh8qx0s2Smj7kfuDfPq4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLAAXTAs; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hLAAXTAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xkM0RKHz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:38:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238299; x=1757774299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p905XjkSjos0WgEwd4QQCME86XX012WwpCpIcSNX38A=;
  b=hLAAXTAsMhnYfxYbHyepmNWakQVm39MVnxnPm8J9yLXiz9mqFSPQHFVW
   oE3IIyay4Fw7nSMPi0lVhFaviiFNkLGasfBHUlsd5bLWkUMqvqebZgJn0
   hieYfbMLHPN+nzDa7/wCSE2AQeLwaOPJ7xNcZsokn9FNBhwvS00TTcYJa
   LD/pJTujckT9jZO/gwtgTnRmPDvM3NvB6DDc1lhBFRS+NzpPpymIebUnw
   EesUxuFz4AdieD9Ur+LQhZEHxH15BkhA665uMiRSBUOh0NCoGxwC2tEUa
   Vz10kzBAiunI+pIydr4XhMg6ljo6CXwCFangQqNXVQ0gm7cgn/ZUa4J63
   Q==;
X-CSE-ConnectionGUID: /zezDX2ZTdCXrzt4IfQo8A==
X-CSE-MsgGUID: ozjhaYc8Sbel64n0djouYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="24963029"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="24963029"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:38:17 -0700
X-CSE-ConnectionGUID: yWxhfe7nRE+e1eFl2JlU+g==
X-CSE-MsgGUID: 0SUxrdAUT9e/Xq5f8t8Jlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98764513"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:38:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 8/8] PCI/AER: Add prefixes to printouts
Date: Fri, 13 Sep 2024 17:36:32 +0300
Message-Id: <20240913143632.5277-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Only part of the AER diagnostic printouts use "AER:" prefix because
they use low-level pci_printk() directly to allow selecting level.

Add "AER:" prefix to lines that are printed with pci_printk().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 6484e3a66a41..c4ba4396a8dc 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -685,8 +685,8 @@ static void __aer_print_error(struct pci_dev *dev,
 		if (!errmsg)
 			errmsg = "Unknown Error Bit";
 
-		pci_printk(level, dev, "   [%2d] %-22s%s\n", i, errmsg,
-				info->first_error == i ? " (First)" : "");
+		pci_printk(level, dev, "%s   [%2d] %-22s%s\n", dev_fmt(""), i,
+			   errmsg, info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
 }
@@ -708,12 +708,12 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 
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
2.39.2


