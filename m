Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D68C0CE9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 10:53:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fcz7cy1U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZm5C5TxWz3d8W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 18:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fcz7cy1U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZm303HGnz3cTL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 18:51:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715244700; x=1746780700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x4dIzXYEipKi3Isu0hz9w8cL6pi9eY1H3hezd3SqTJA=;
  b=Fcz7cy1UJuXngu5ApssS+OcP6rsWjqAwjJt2L991BPSzRgXZXcXQ8bDR
   s5kODPMm7hJsf17r5hgx1CMEfcZ7oBSbHW23F/DV3QL8s7uiHBeyieRrf
   uiM9gfzjv/L7GjYIaV/PKM8sk8c2R7rhgmZqHBHnHq5HWIr5J7oOICm5u
   9ZG/kr5JKUbo7dEBajG2lZC4J/pUgfYqc3oM2nXn2cas1axozKE3tenu+
   78eD3u6BvdBGmchIgEo2XQvL4ddPZln/FIghGYK0mMj2Wn0sHV789iKCm
   IjA21fYurqLxT0MiiEhG2BbDPKOrOPgVDNwW4KVYThElu5gh96dhxdZZt
   g==;
X-CSE-ConnectionGUID: fFHX4YeaTsyDxB1mntsQrw==
X-CSE-MsgGUID: uQv2oCQvR02o7HrgyroluQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14103976"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="14103976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:38 -0700
X-CSE-ConnectionGUID: LmVUfqKhRPKjkUX+lp2Ygw==
X-CSE-MsgGUID: YpL0sfrtSUGqENeVH4941g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29060917"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.124])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:31 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v4 2/3] PCI/AER: Print UNCOR_STATUS bits that might be ANFE
Date: Thu,  9 May 2024 16:48:32 +0800
Message-Id: <20240509084833.2147767-3-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
References: <20240509084833.2147767-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, jonathan.cameron@huawei.com, bhelgaas@google.com, dan.j.williams@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When an Advisory Non-Fatal error(ANFE) triggers, both correctable error(CE)
status and ANFE related uncorrectable error(UE) status will be printed:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr
    Uncorrectable errors that may cause Advisory Non-Fatal:
     [18] TLP

Tested-by: Yudong Wang <yudong.wang@intel.com>
Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 drivers/pci/pcie/aer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f2839b51321a..ed435f09ac27 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -681,6 +681,7 @@ static void __aer_print_error(struct pci_dev *dev,
 {
 	const char **strings;
 	unsigned long status = info->status & ~info->mask;
+	unsigned long anfe_status = info->anfe_status;
 	const char *level, *errmsg;
 	int i;
 
@@ -701,6 +702,20 @@ static void __aer_print_error(struct pci_dev *dev,
 				info->first_error == i ? " (First)" : "");
 	}
 	pci_dev_aer_stats_incr(dev, info);
+
+	if (!anfe_status)
+		return;
+
+	strings = aer_uncorrectable_error_string;
+	pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:\n");
+
+	for_each_set_bit(i, &anfe_status, 32) {
+		errmsg = strings[i];
+		if (!errmsg)
+			errmsg = "Unknown Error Bit";
+
+		pci_printk(level, dev, "   [%2d] %s\n", i, errmsg);
+	}
 }
 
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
-- 
2.34.1

