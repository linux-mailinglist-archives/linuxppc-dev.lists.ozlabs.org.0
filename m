Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCD1C058F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 21:03:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ClCN1ZnVzDqxH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:03:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cl772ZyCzDr0r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 04:59:41 +1000 (AEST)
IronPort-SDR: fSGIicWOanAymLpRUwLIP6qYIxgJ9WYj5ZmrVFPGUH7tg0fWD31wArz9mKxDTNs5wIFJBpenp0
 ajiYOx//5BtA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 11:59:38 -0700
IronPort-SDR: Ed+FWXPB3/MF2qsCgTd4joebR2FBMhxVdTEyzI/OAOvXfeDcNp7KT2BZTm4cXqjJfPT7ZdCKVg
 OutbuaWtcmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="303360005"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2020 11:59:37 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
Date: Thu, 30 Apr 2020 12:46:07 -0600
Message-Id: <1588272369-2145-1-git-send-email-jonathan.derrick@intel.com>
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

Hi Bjorn & Kuppuswamy,

I see a problem in the DPC ECN [1] to _OSC in that it doesn't give us a way to
determine if firmware supports _OSC DPC negotation, and therefore how to handle
DPC.

Here is the wording of the ECN that implies that Firmware without _OSC DPC
negotiation support should have the OSPM rely on _OSC AER negotiation when
determining DPC control:

  PCIe Base Specification suggests that Downstream Port Containment may be
  controlled either by the Firmware or the Operating System. It also suggests
  that the Firmware retain ownership of Downstream Port Containment if it also
  owns AER. When the Firmware owns Downstream Port Containment, it is expected
  to use the new "Error Disconnect Recover" notification to alert OSPM of a
  Downstream Port Containment event.

In legacy platforms, as bits in _OSC are reserved prior to implementation, ACPI
Root Bus enumeration will mark these Host Bridges as without Native DPC
support, even though the specification implies it's expected that AER _OSC
negotiation determines DPC control for these platforms. There seems to be a
need for a way to determine if the DPC control bit in _OSC is supported and
fallback on AER otherwise.


Currently portdrv assumes DPC control if the port has Native AER services:

static int get_port_device_capability(struct pci_dev *dev)
...
	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
	    pci_aer_available() &&
	    (pcie_ports_dpc_native || (services & PCIE_PORT_SERVICE_AER)))
		services |= PCIE_PORT_SERVICE_DPC;

Newer firmware may not grant OSPM DPC control, if for instance, it expects to
use Error Disconnect Recovery. However it looks like ACPI will use DPC services
via the EDR driver, without binding the full DPC port service driver.


If we change portdrv to probe based on host->native_dpc and not AER, then we
break instances with legacy firmware where OSPM will clear host->native_dpc
solely due to _OSC bits being reserved:

struct pci_bus *acpi_pci_root_create(struct acpi_pci_root *root,
...
	if (!(root->osc_control_set & OSC_PCI_EXPRESS_DPC_CONTROL))
		host_bridge->native_dpc = 0;



So my assumption instead is that host->native_dpc can be 0 and expect Native
DPC services if AER is used. In other words, if and only if DPC probe is
invoked from portdrv, then it needs to rely on the AER dependency. Otherwise it
should be assumed that ACPI set up DPC via EDR. This covers legacy firmware.

However it seems like that could be trouble with newer firmware that might give
OSPM control of AER but not DPC, and would result in both Native DPC and EDR
being in effect.


Anyways here are two patches that give control of AER and DPC on the results of
_OSC. They don't mess with the HEST parser as I expect those to be removed at
some point. I need these for VMD support which doesn't even rely on _OSC, but I
suspect this won't be the last effort as we detangle Firmware First.

[1] https://members.pcisig.com/wg/PCI-SIG/document/12888


Jon Derrick (2):
  PCI/AER: Use _OSC to determine Firmware First before HEST
  PCI/DPC: Use _OSC to determine DPC support

 drivers/pci/pcie/aer.c          | 3 +++
 drivers/pci/pcie/dpc.c          | 3 ---
 drivers/pci/pcie/portdrv_core.c | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

-- 
1.8.3.1

