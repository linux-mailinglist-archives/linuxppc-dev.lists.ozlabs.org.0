Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7178C0CEA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 10:54:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESiOV3CO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZm6040TZz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 18:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ESiOV3CO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZm385fWMz3cVx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 18:51:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715244709; x=1746780709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Az9fax1STcMENsVQEQmFXQ/rTEnN4aysqC/HQhN2KX8=;
  b=ESiOV3COtW0GO+KDh0WYS9hmMK+l4LP73DkQ8QmlsV3Gl/HembtCWuKt
   SJiOmpuy+SUk1DjIhO3Z4dPKVVLaT/E0vLX9e6qxRNBov0ho+/hazfJOH
   gRbgqVexql+9c13vmVUq0ZEgiw7bDRhnV4pg2W6qPNB+jkdbIeKMy/dPR
   kE4AF+u0RVTYiOYT4LpXYEhBcCQOTlGXLiN6s61abWdRIzM7RPJanrbfD
   FypQ9t5ZHTl4ujglUr+kTBglouh8C+Mr0XHqhJohW3ipl5YckeYozQlsg
   NhmIFCy33vDq4FVkFkKbpmOmEZRsiF0ezRqzZMC0US6T1llrnQdahOhBr
   w==;
X-CSE-ConnectionGUID: ThMinxLsTqmlZDiOTIAbJQ==
X-CSE-MsgGUID: W+z4/2JpRuO1itCuBaIQ4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="14104019"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="14104019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:47 -0700
X-CSE-ConnectionGUID: WNz+ekTQRHqKX3HNhu576w==
X-CSE-MsgGUID: T4JtGmhySwqhx4RJWSIPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29061096"
Received: from unknown (HELO SPR-S2600BT.bj.intel.com) ([10.240.192.124])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 01:51:39 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: linux-pci@vger.kernel.org
Subject: [PATCH v4 3/3] PCI/AER: Clear UNCOR_STATUS bits that might be ANFE
Date: Thu,  9 May 2024 16:48:33 +0800
Message-Id: <20240509084833.2147767-4-zhenzhong.duan@intel.com>
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

When processing an ANFE, ideally both correctable error(CE) status and
uncorrectable error(UE) status should be cleared. However, there is no
way to fully identify the UE associated with ANFE. Even worse, Non-Fatal
Error(NFE) may set the same UE status bit as ANFE. Treating an ANFE as
NFE will bring some issues, i.e., breaking softwore probing; treating
NFE as ANFE will make us ignoring some UEs which need active recover
operation. To avoid clearing UEs that are not ANFE by accident, the
most conservative route is taken here: If any of the NFE Detected bits
is set in Device Status, do not touch UE status, they should be cleared
later by the UE handler. Otherwise, a specific set of UEs that may be
raised as ANFE according to the PCIe specification will be cleared if
their corresponding severity is Non-Fatal.

For instance, previously when kernel receives an ANFE with Poisoned TLP
in OS native AER mode, only status of CE will be reported and cleared:

  AER: Correctable error message received from 0000:b7:02.0
  PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00002000/00000000
     [13] NonFatalErr

If the kernel receives a Malformed TLP after that, two UEs will be
reported, which is unexpected. Malformed TLP Header is lost since
the previous ANFE gated the TLP header logs:

  PCIe Bus Error: severity="Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
    device [8086:0db0] error status/mask=00041000/00180020
     [12] TLP                    (First)
     [18] MalfTLP

Now, for the same scenario, both CE status and related UE status will be
reported and cleared after ANFE:

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
 drivers/pci/pcie/aer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ed435f09ac27..6a6a3a40569a 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1115,9 +1115,14 @@ static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
 		 * Correctable error does not need software intervention.
 		 * No need to go through error recovery process.
 		 */
-		if (aer)
+		if (aer) {
 			pci_write_config_dword(dev, aer + PCI_ERR_COR_STATUS,
 					info->status);
+			if (info->anfe_status)
+				pci_write_config_dword(dev,
+						       aer + PCI_ERR_UNCOR_STATUS,
+						       info->anfe_status);
+		}
 		if (pcie_aer_is_native(dev)) {
 			struct pci_driver *pdrv = dev->driver;
 
-- 
2.34.1

