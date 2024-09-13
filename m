Return-Path: <linuxppc-dev+bounces-1330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A09782A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4xj7464gz2ykC;
	Sat, 14 Sep 2024 00:37:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726238235;
	cv=none; b=P1pEme6+OdXZuYzqafFnSiFcQMMxdA2e2ZC96/jwvDobhQr/0teFjtH8hJytaO+9mEIGrnhB+3M/JWYJCGsrZkQFKSWdLg0ggYzD7DGbTYntsDVxC/G1UGcWvuvJcXaCtJRsCX/0AWYhajY1QxEL1S+0rXM6ZZyIn5c5j/YTH9c7s0QC3uh35OUVGNvkhWYj1A1ElKsqgGyHtezQQTLu72jrAujG5zasdlkUyO0vtsA6iMFcQrCWpho4mvNcXxPBTWHoZqkTUvoFLk16A58nS0r/PTUOzgz5yZUdqC1IMG7/TlcUbkCPK5EYoE7CTtyBVO2IOu8k27FuE6qB1VpwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726238235; c=relaxed/relaxed;
	bh=eY3dJ1RrG9wq01AYKNZv3UO+ppNx1PRxyphf8Bit21M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQekfVg+S4i01b0VUxNbivm33aSdkNiswNP7iVl/zIEXGbBypYnw/eDaWMSxSiw8lU2J9pADkW/e9anAkm0qb7eqdCEZLQNiawjbm8dScQNSA86yS6ZbAXKrVXaL7xIZWKFc36XaVYKoVTWIrjwnP1lRdJQC+Qaj5E1clzSvZdehxcnJZAm4N6u53AF9/L/6HxPi08PkFvGL7VhFhmgYEk401d9zvEOWlQiNn3p5jwO4wOdxDpUWyAanjqXqKbhztXq60cf80gQPv8U+F+xougW7WyN45MQvUE723w2q4cH1sp3sOFUiXnLyluJJMKWp0DGfsC4K7oDN26fFFqPRyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWLNBRCx; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bWLNBRCx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4xj66xYXz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726238235; x=1757774235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TVMIEcYV4lRuU2NwGaITevK1+8W4KKh6YOoRO/qra7M=;
  b=bWLNBRCxCZa8AJOOUpwtx4xHXRHXn7NEAdgndtVTEgC6eAege6Kznp0U
   dwjl2YdsS/LPFP5Xnt4yvGSu24J79ozsW590cGAMLKgD1l6DzcWkXNyzn
   5P2c/rN8IwCucJGCxwoa6z66fHphgCU1VYBSDbdHiTdYwL04eWCpPA7BE
   WnBsgCO7PM8bs4u+bgMY1mMEUncBz7uFwMjwsk4hyI7LOWZdDMiQgeD+t
   fUa8gPkAkTh6ctHAgPWlueZaSIwFVFGwehiaQcgLMkrrT1UeP/dEyQid1
   8szal95c+83dwGj0IxL1jvKFgAMU/m80EtxSHD2XgcBEUtCjyJ7osTWMY
   Q==;
X-CSE-ConnectionGUID: VFyR3q5uRbqxrG2KBU+9hA==
X-CSE-MsgGUID: frUHtHYoQrCDE9729//M+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28886514"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28886514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:13 -0700
X-CSE-ConnectionGUID: kXh3m9yKS2+tVa+PIBJopA==
X-CSE-MsgGUID: kmnA2HQkT6ysfSaM6gHb+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68400260"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:37:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 3/8] PCI: Make pcie_read_tlp_log() signature same
Date: Fri, 13 Sep 2024 17:36:27 +0300
Message-Id: <20240913143632.5277-4-ilpo.jarvinen@linux.intel.com>
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

pcie_read_tlp_log()'s prototype and function signature diverged due to
changes made while applying.

Make the parameters of pcie_read_tlp_log() named identically.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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
2.39.2


