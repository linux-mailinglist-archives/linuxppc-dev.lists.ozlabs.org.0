Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9411B1902
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:04:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495gjK552PzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:04:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jonathan.derrick@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495gdR41QbzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 08:01:31 +1000 (AEST)
IronPort-SDR: 91eEeghQaPUhiykkqBR32DZrtSqddqKvaUcjooa6aJ0ZiTaf9IVineWthj2DhwT54T2oZlTgI3
 XbSTrd4CS3Ug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 15:01:11 -0700
IronPort-SDR: B5K5EbZN/GSr4XUuymvuYRrd7HCa5RqMAPti5a6kXncsbreRaatYMRh8I0XZNELFVQPRkBhfRk
 7rLmNZUQ5B5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; d="scan'208";a="455848343"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 15:01:09 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
Date: Mon, 20 Apr 2020 15:37:09 -0600
Message-Id: <1587418630-13562-2-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
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
 Rajat Jain <rajatja@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Frederick Lawler <fred@fredlawl.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linux-pci@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Keith Busch <kbusch@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jon Derrick <jonathan.derrick@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some platforms have a mix of ports whose capabilities can be negotiated
by _OSC, and some ports which are not described by ACPI and instead
managed by Native drivers. The existing Firmware-First HEST model can
incorrectly tag these Native, Non-ACPI ports as Firmware-First managed
ports by advertising the HEST Global Flag and matching the type and
class of the port (aer_hest_parse).

If the port requests Native AER through the Host Bridge's capability
settings, the AER driver should honor those settings and allow the port
to bind. This patch changes the definition of Firmware-First to exclude
ports whose Host Bridges request Native AER.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/pci/pcie/aer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f4274d3..30fbd1f 100644
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

