Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DEA90635
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:53:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4698XS6JVRzDrPb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="rKVDQx+C"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Ts1hb8zDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:13 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2F4DE42ECA;
 Fri, 16 Aug 2019 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1565974268; x=
 1567788669; bh=l3eHXE9pLhN+tcQLla3CfxlNGGAg3oIbDC5gp+Gmlvo=; b=r
 KVDQx+CHtra/pktbIyYVQTcfR1M+9NygdqWjmhxZck9/kmdAoa71BDC2nAeHV5lc
 fnt3Q0wXJx14qwR81QhBpMHx3+xHsRwLE1CjrS7yp9yekxwgVrWCx6D0Cfk2YULW
 WohlZ9guaR/7LqLO0GQdRseUKOmmI9RDkXWbHBZgfQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HHRJYr_6gFhs; Fri, 16 Aug 2019 19:51:08 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9D85E411F8;
 Fri, 16 Aug 2019 19:51:08 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:08 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 00/23] PCI: Allow BAR movement during hotplug
Date: Fri, 16 Aug 2019 19:50:38 +0300
Message-ID: <20190816165101.911-1-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the firmware or kernel has arranged memory for PCIe devices in a way
that doesn't provide enough space for BARs of a new hotplugged device, the
kernel can pause the drivers of the "obstructing" devices and move their
BARs, so the new BARs can fit into the freed spaces.

To rearrange the BARs and bridge windows these patches releases all of them
after a rescan and re-assigns in the same way as during the initial PCIe
topology scan at system boot.

When a driver is un-paused by the kernel after the PCIe rescan, it should
check if its BARs had moved, and ioremap() them.

Drivers indicate their support of the feature by implementing the new hooks
.rescan_prepare() and .rescan_done() in the struct pci_driver. If a driver
doesn't yet support the feature, BARs of its devices will be considered as
immovable (by checking the pci_dev_movable_bars_supported(dev)) and handled
in the same way as resources with the IORESOURCE_PCI_FIXED flag.

If a driver doesn't yet support the feature, its devices are guaranteed to
have their BARs remaining untouched.

Tested on:
 - x86_64 with "pci=realloc,assign-busses,use_crs,pcie_bus_peer2peer";
 - POWER8 PowerNV+OPAL+PHB3 ppc64le with [1] applied and the following:
   "pci=realloc,pcie_bus_peer2peer";
 - both platforms [with extra pacthes (yet to be submitted) for movable bus
   numbers]: manually initiated (via sysfs) rescan has found and turned on
   a hotplugged bridge.

Not so many platforms and test cases were covered, so all who are
interested are highly welcome to test on your setups - the more exotic the
better!

This patchset is a part of our work on adding support for hotplugging
bridges full of other bridges, NVME drives, SAS HBAs and GPUs without
special requirements such as Hot-Plug Controller, reservation of bus
numbers or memory regions by firmware, etc. The next patchset to submit
will implement the movable bus numbers.

[1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-August/195272.html
    [PATCH v6 0/5] powerpc/powernv/pci: Make hotplug self-sufficient, independent of FW and DT

Changes since v4:
 - Feature is enabled by default (turned on by one of the latest patches);
 - Add pci_dev_movable_bars_supported(dev) instead of marking the immovable
   BARs with the IORESOURCE_PCI_FIXED flag;
 - Set up PCIe bridges during rescan via sysfs, so MPS settings are now
   configured not only during system boot or pcihp events;
 - Allow movement of switch's BARs if claimed by portdrv;
 - Update EEH address caches after rescan for powerpc;
 - Don't disable completely hot-added devices which can't have BARs being
   fit - just disable their BARs, so they are still visible in lspci etc;
 - Clearer names: fixed_range_hard -> immovable_range, fixed_range_soft ->
   realloc_range;
 - Drop the patch for pci_restore_config_space() - fixed by properly using
   the runtime PM.

Changes since v3:
 - Rebased to the upstream, so the patches apply cleanly again.

Changes since v2:
 - Fixed double-assignment of bridge windows;
 - Fixed assignment of fixed prefetched resources;
 - Fixed releasing of fixed resources;
 - Fixed a debug message;
 - Removed auto-enabling the movable BARs for x86 - let's rely on the
   "pcie_movable_bars=force" option for now;
 - Reordered the patches - bugfixes first.

Changes since v1:
 - Add a "pcie_movable_bars={ off | force }" command line argument;
 - Handle the IORESOURCE_PCI_FIXED flag properly;
 - Don't move BARs of devices which don't support the feature;
 - Guarantee that new hotplugged devices will not steal memory from working
   devices by ignoring the failing new devices with the new PCI_DEV_IGNORE
   flag;
 - Add rescan_prepare()+rescan_done() to the struct pci_driver instead of
   using the reset_prepare()+reset_done() from struct pci_error_handlers;
 - Add a bugfix of a race condition;
 - Fixed hotplug in a non-pre-enabled (by BIOS/firmware) bridge;
 - Fix the compatibility of the feature with pm_runtime and D3-state;
 - Hotplug events from pciehp also can move BARs;
 - Add support of the feature to the NVME driver.

Sergey Miroshnichenko (23):
  PCI: Fix race condition in pci_enable/disable_device()
  PCI: Enable bridge's I/O and MEM access for hotplugged devices
  PCI: hotplug: Add a flag for the movable BARs feature
  PCI: Define PCI-specific version of the release_child_resources()
  PCI: hotplug: movable BARs: Fix reassigning the released bridge
    windows
  PCI: hotplug: movable BARs: Recalculate all bridge windows during
    rescan
  PCI: hotplug: movable BARs: Don't allow added devices to steal
    resources
  PCI: Include fixed and immovable BARs into the bus size calculating
  PCI: Prohibit assigning BARs and bridge windows to non-direct parents
  PCI: hotplug: movable BARs: Try to assign unassigned resources only
    once
  PCI: hotplug: movable BARs: Calculate immovable parts of bridge
    windows
  PCI: hotplug: movable BARs: Compute limits for relocated bridge
    windows
  PCI: Make sure bridge windows include their fixed BARs
  PCI: Fix assigning the fixed prefetchable resources
  PCI: hotplug: movable BARs: Assign fixed and immovable BARs before
    others
  PCI: hotplug: movable BARs: Don't reserve IO/mem bus space
  powerpc/pci: Fix crash with enabled movable BARs
  powerpc/pci: Handle BAR movement
  PCI: hotplug: Configure MPS for hot-added bridges during bus rescan
  PCI: hotplug: movable BARs: Enable the feature by default
  nvme-pci: Handle movable BARs
  PCI/portdrv: Declare support of movable BARs
  PCI: pciehp: movable BARs: Trigger a domain rescan on hp events

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/powerpc/kernel/pci-hotplug.c             |  10 +
 arch/powerpc/platforms/powernv/pci-ioda.c     |   3 +-
 drivers/nvme/host/pci.c                       |  21 +-
 drivers/pci/bus.c                             |   2 +-
 drivers/pci/hotplug/pciehp_pci.c              |   5 +
 drivers/pci/pci.c                             |  58 +++-
 drivers/pci/pci.h                             |  30 ++
 drivers/pci/pcie/portdrv_pci.c                |  11 +
 drivers/pci/probe.c                           | 295 +++++++++++++++++-
 drivers/pci/setup-bus.c                       | 276 +++++++++++++---
 drivers/pci/setup-res.c                       |  48 ++-
 include/linux/pci.h                           |  21 ++
 13 files changed, 739 insertions(+), 48 deletions(-)

-- 
2.21.0

