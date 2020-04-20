Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BF21B18FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:03:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495ggJ0R8DzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:03:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495gdQ363PzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 08:01:22 +1000 (AEST)
IronPort-SDR: HSLa0KY0EqYZpP2YnzYlDsBwGT0JrMN3ZzM5XIt4FPULDl6rx5rCwTA51K49UodXsYWutANwc9
 vDCDHaY1qaFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 15:01:09 -0700
IronPort-SDR: v2mUQIi7v4D2xKtxr60yP70J2b/UTKidQjQWc+qcN/GLGbMyj6G/H9MxT9qEkCptVqixd2RvNN
 D8D5syiZFlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; d="scan'208";a="455848311"
Received: from unknown (HELO nsgsw-wilsonpoint.lm.intel.com) ([10.232.116.102])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 15:01:07 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 0/2] Honoring Native AER/DPC Host Bridges
Date: Mon, 20 Apr 2020 15:37:08 -0600
Message-Id: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
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

The two patches here force AER and DPC to honor the Host Bridge's Native
AER/DPC settings. This is under the assumption that when these bits are set,
that Firmware-First AER/DPC should not be in use for these ports. This
assumption seems to be true in ACPI, which explicitly clears these capability
settings in the host bridge if the service cannot be negotiated with _OSC.

This also fixes an issue I've seen in a few platforms whose BIOS and/or switch
firmware leaves DPC preconfigured. In these cases, the kernel DPC driver cannot
bind a handler to the interrupt and could result in unmanaged DPC link down
events.

Jon Derrick (2):
  PCI/AER: Allow Native AER Host Bridges to use AER
  PCI/DPC: Allow Native DPC Host Bridges to use DPC

 drivers/pci/pcie/aer.c          | 3 +++
 drivers/pci/pcie/dpc.c          | 3 ++-
 drivers/pci/pcie/portdrv_core.c | 3 ++-
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
1.8.3.1

