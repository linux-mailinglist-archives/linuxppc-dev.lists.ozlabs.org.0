Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB431AD0EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:14:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939Rx1My0zDsNq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:14:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939Pr3bsJzDr6D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 06:12:42 +1000 (AEST)
IronPort-SDR: Bj9qdzVcnmTHLXlSdwIeSTpjxyaN9/0bPNv8kFpF9XyZwWHrQmC+/qY73mwXsDRzP0EpplC/5B
 VHGxWmKkZ0ig==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 13:12:39 -0700
IronPort-SDR: r7Og5Oq2XCEbwNdn2DsqVN0NlTMRI+7z5XW0KToc2Tr/tmkoUXOe5tkG+DfeBCdZdzt5gajFsu
 V5/GechOGFhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; d="scan'208";a="257345226"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by orsmga006.jf.intel.com with ESMTP; 16 Apr 2020 13:12:38 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI/DPC: Allow Non-ACPI Native ports to use DPC
Date: Thu, 16 Apr 2020 13:59:15 -0600
Message-Id: <1587067157-2291-1-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
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
 Frederick Lawler <fred@fredlawl.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Keith Busch <keith.busch@intel.com>, Olof Johansson <olof@lixom.net>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org, Jon Derrick <jonathan.derrick@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some platforms have a mix of ports whose capabilities can be negotiated
by _OSC, and some ports which are not described by ACPI and instead
managed by Native drivers. The existing Firmware-First HEST model can
incorrectly tag these Native, Non-ACPI ports as Firmware-First capable
ports by advertising the HEST Global flag and specifying the type and
class (aer_hest_parse).

This ultimately can lead to bad situations if the BIOS or port firmware
leaves DPC preconfigured and the Linux DPC driver is unable to bind to
the port to handle DPC events.

This patch adds the check for Native DPC in the port's host bridge in
order to allow DPC services to bind to the port.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/pci/pcie/dpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 7621704..a1e355d 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -281,10 +281,12 @@ static int dpc_probe(struct pcie_device *dev)
 {
 	struct pci_dev *pdev = dev->port;
 	struct device *device = &dev->device;
+	struct pci_host_bridge *host = pci_find_host_bridge(pdev->bus);
 	int status;
 	u16 ctl, cap;
 
-	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
+	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native &&
+	    !host->native_dpc)
 		return -ENOTSUPP;
 
 	status = devm_request_threaded_irq(device, dev->irq, dpc_irq,
-- 
1.8.3.1

