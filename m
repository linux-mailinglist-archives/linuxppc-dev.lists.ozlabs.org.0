Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DD692A35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 23:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD7pJ4L3Vz3fBc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 09:34:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/tGDdNv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A/tGDdNv;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD7nL0gFnz3bVD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 09:33:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676068438; x=1707604438;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=pR1CO4fGX0zX/77VlHz6LJJtRsjIRqOd/EPNDg0FKN4=;
  b=A/tGDdNvrUF/TJunvyIqe2VKfmfctq+kUBTdcllhaQwGyC4IHIkriZ4m
   N7tiYWEhGIVY9LnINXr+LPeqUCixvgOqILqXHt6aAw0OO31RPeJeg52/f
   p3bck4o7JWPvZqE428q/gRay+07LC9m2Oktwj+TjeL2dxtjO6krmL4MTK
   QtA09TN82TxrLQMwCxBwTfOzPxJ9Z7E66m/gsLzVgpZi0ZuKgJp05buFT
   09WN6Q+1SLxxH8dKHBUY2eBAeEza9UyVZO+wlA2B5wlUzKNKFFgpC1Ccp
   2DHQd4fySL1NwAi3DvmtZbXukjn8jY03VOfpjO8bBvh26xG9PntqaJoq7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416766940"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416766940"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 14:33:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="700624145"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="700624145"
Received: from iweiny-desk3.amr.corp.intel.com (HELO localhost) ([10.212.70.240])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 14:33:45 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Fri, 10 Feb 2023 14:33:23 -0800
Subject: [PATCH RFC] PCI/AER: Enable internal AER errors by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com>
X-B4-Tracking: v=1; b=H4sIADPG5mMC/x2NQQrCQAwAv1JyNrC7BWm9Cj7Aq3hIs9EGlrVkq
 RRK/27wOAPD7NDEVBpcuh1Mvtr0Ux3iqQOeqb4FNTtDCqkPKYzIW8GFFUkM45AznSMPqR/Bi4m
 a4GRUefamrqW4XExeuv0XD7jfrvA8jh9tCYHMdwAAAA==
To: Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676068425; l=3060;
 i=ira.weiny@intel.com; s=20221222; h=from:subject:message-id;
 bh=pR1CO4fGX0zX/77VlHz6LJJtRsjIRqOd/EPNDg0FKN4=;
 b=3gNeuhIE1BaE04Aim9tnTthinw/4LA+7yLTjBnO8gGUzW2sdpOgvErYPebdih+13TlsLOCjpPZUv
 zSJGeLxpB7zBCh1i+fLENggLlNM8qNAkifL9PSc8Gwe1eYSJ0PZQ
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=brwqReAJklzu/xZ9FpSsMPSQ/qkSalbg6scP3w809Ec=
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Stefan Roese <sr@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The CXL driver expects internal error reporting to be enabled via
pci_enable_pcie_error_reporting().  It is likely other drivers expect the same.
Dave submitted a patch to enable the CXL side[1] but the PCI AER registers
still mask errors.

PCIe v6.0 Uncorrectable Mask Register (7.8.4.3) and Correctable Mask
Register (7.8.4.6) default to masking internal errors.  The
Uncorrectable Error Severity Register (7.8.4.4) defaults internal errors
as fatal.

Enable internal errors to be reported via the standard
pci_enable_pcie_error_reporting() call.  Ensure uncorrectable errors are set
non-fatal to limit any impact to other drivers.

[1] https://lore.kernel.org/all/167604864163.2392965.5102660329807283871.stgit@djiang5-mobl3.local/

Cc: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Stefan Roese <sr@denx.de>
Cc: "Kuppuswamy Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: linux-cxl@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
This is RFC to see if it is acceptable to be part of the standard
pci_enable_pcie_error_reporting() call or perhaps a separate pci core
call should be introduced.  It is anticipated that enabling this error
reporting is what existing drivers are expecting.  The errors are marked
non-fatal therefore it should not adversely affect existing devices.
---
 drivers/pci/pcie/aer.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 625f7b2cafe4..9d3ed3a5fc23 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -229,11 +229,28 @@ int pcie_aer_is_native(struct pci_dev *dev)
 
 int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int pos_cap_err;
+	u32 reg;
 	int rc;
 
 	if (!pcie_aer_is_native(dev))
 		return -EIO;
 
+	pos_cap_err = dev->aer_cap;
+
+	/* Unmask correctable and uncorrectable (non-fatal) internal errors */
+	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, &reg);
+	reg &= ~PCI_ERR_COR_INTERNAL;
+	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, reg);
+
+	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, &reg);
+	reg &= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, reg);
+
+	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, &reg);
+	reg &= ~PCI_ERR_UNC_INTN;
+	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, reg);
+
 	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
 	return pcibios_err_to_errno(rc);
 }

---
base-commit: e5ab7f206ffc873160bd0f1a52cae17ab692a9d1
change-id: 20230209-cxl-pci-aer-18dda61c8239

Best regards,
-- 
Ira Weiny <ira.weiny@intel.com>

