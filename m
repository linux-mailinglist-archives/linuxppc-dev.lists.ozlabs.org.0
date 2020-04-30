Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5F1C0604
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:18:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ClXF54ctzDrFl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:18:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cl7B2ymDzDqvx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 04:59:50 +1000 (AEST)
IronPort-SDR: n1KqXHUnO9SiWU7GLPn6RJsAPeBCBeI7O3nhFLT5iI3RvmZLaEziR2NL07GHf2fTeo6jk/+OUf
 BYV3vq1RwRJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 11:59:40 -0700
IronPort-SDR: xIousQdCakj5qzDffySPNPf1vENkrFZqPZ4ULQbIhtimZt+hZabOaIuFeH/zX6RrqwAJhcgQvi
 4WAg5L+SjLQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="303360012"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2020 11:59:39 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v3 2/2] PCI/DPC: Use _OSC to determine DPC support
Date: Thu, 30 Apr 2020 12:46:09 -0600
Message-Id: <1588272369-2145-3-git-send-email-jonathan.derrick@intel.com>
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

With the addition of DPC to _OSC [1], OSPM is able to negotiate DPC
services from Firmware. ACPI Root Bus enumeration sets the Host Bridge's
Native DPC flag on negotiation of those service. This patch changes DPC
probing to check DPC control as determined by _OSC, by checking the Host
Bridge's Native DPC member.

As most older platforms won't have DPC negotiable by _OSC, this patch
doesn't attempt to change behavior that assumes if OSPM has negotiated
AER by _OSC, OSPM will also want DPC control.

[1] https://members.pcisig.com/wg/PCI-SIG/document/12888

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/pci/pcie/dpc.c          | 3 ---
 drivers/pci/pcie/portdrv_core.c | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 7621704..9104929 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -284,9 +284,6 @@ static int dpc_probe(struct pcie_device *dev)
 	int status;
 	u16 ctl, cap;
 
-	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
-		return -ENOTSUPP;
-
 	status = devm_request_threaded_irq(device, dev->irq, dpc_irq,
 					   dpc_handler, IRQF_SHARED,
 					   "pcie-dpc", pdev);
diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
index 50a9522..f2139a1 100644
--- a/drivers/pci/pcie/portdrv_core.c
+++ b/drivers/pci/pcie/portdrv_core.c
@@ -256,7 +256,8 @@ static int get_port_device_capability(struct pci_dev *dev)
 	 */
 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
 	    pci_aer_available() &&
-	    (pcie_ports_dpc_native || (services & PCIE_PORT_SERVICE_AER)))
+	    (pcie_ports_dpc_native || host->native_dpc ||
+	     (services & PCIE_PORT_SERVICE_AER)))
 		services |= PCIE_PORT_SERVICE_DPC;
 
 	if (pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM ||
-- 
1.8.3.1

