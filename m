Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFAD1C0594
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:05:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ClFz2QvKzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:05:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cl7864spzDr08
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 04:59:48 +1000 (AEST)
IronPort-SDR: zAS/21zbAGk4HlHv67lExeMQECv2BwL+QbLbvSBn9Hbowl9hdiZGZR9flxGQ8tEBIw9/zCABCR
 OW6dFcyQGWJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 11:59:39 -0700
IronPort-SDR: BlYZtidfD65fncyjXHDrpSCg2JPoKFEZmaEJHKVFahiz9xGTdY1EfI2WfTFBkrkhIfaS48FEMM
 Zxv56zbw3LhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="303360008"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2020 11:59:38 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v3 1/2] PCI/AER: Use _OSC to determine Firmware First before
 HEST
Date: Thu, 30 Apr 2020 12:46:08 -0600
Message-Id: <1588272369-2145-2-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1588272369-2145-1-git-send-email-jonathan.derrick@intel.com>
References: <1588272369-2145-1-git-send-email-jonathan.derrick@intel.com>
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Rajat Jain <rajatja@google.com>, Frederick Lawler <fred@fredlawl.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Alex Williamson <alex.williamson@redhat.com>,
 "Patel, Mayurkumar" <mayurkumar.patel@intel.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jon Derrick <jonathan.derrick@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After a5bf8719af: "PCI/AER: Use only _OSC to determine AER ownership",
_OSC is the primary determiner of ownership of Firmware First error
handling rather than HEST.

ACPI Root Bus enumeration has been modified to flag Host Bridge devices
as using Native AER when _OSC has been negotiated for AER services.

This patch ensures the PCI layers first uses the _OSC negotiated state
by checking the Host Bridge's Native AER flag prior to HEST parsing.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/pci/pcie/aer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index efc2677..f3d02f4 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -314,6 +314,9 @@ int pcie_aer_get_firmware_first(struct pci_dev *dev)
 	if (pcie_ports_native)
 		return 0;
 
+	if (pci_find_host_bridge(dev->bus)->native_aer)
+		return 0;
+
 	if (!dev->__aer_firmware_first_valid)
 		aer_set_firmware_first(dev);
 	return dev->__aer_firmware_first;
-- 
1.8.3.1

