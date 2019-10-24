Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 097B8E39B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zYtt2HfyzDqJP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:21:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="TEFT+CBm"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYhv4ZyRzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:47 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8565C43611;
 Thu, 24 Oct 2019 17:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1571937159; x=
 1573751560; bh=koaFWGbPyyMd70kSZQvFrsLHnKJvFwfZN48hcL2Dbr0=; b=T
 EFT+CBm2rb3VNnTYhkeyiZIB4CAptsv5mpJi0A8ye5o15aVDSEJXK8TIcaY5pVnD
 jW6V3Qbmb2setWD5WJWLhYXXSzGGiqGBmTk3VU/blt7/lKROENCJpZ849f1LcIk+
 AfK4Y/LQWKcJEKx7sdhzPf4IKM3SFCR1zk2WSr+R6k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrgnkNzVe_Af; Thu, 24 Oct 2019 20:12:39 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 041CD42F14;
 Thu, 24 Oct 2019 20:12:39 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:38 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 00/30] PCI: Allow BAR movement during hotplug
Date: Thu, 24 Oct 2019 20:11:58 +0300
Message-ID: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
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

Currently PCI hotplug works on top of resources, which are usually reserved
not by the kernel, but by BIOS, bootloader, firmware, etc. These resources
are gaps in the address space where BARs of new devices may fit, and extra
bus number per port, so bridges can be hot-added. This series aim the
former problem: it shows the kernel how to redistribute on the run, so the
hotplug becomes predictable and cross-platform. A follow-up patchset will
propose a solution for bus numbers.

If the memory is arranged in a way that doesn't provide enough space for
BARs of a new hotplugged device, the kernel can pause the drivers of the
"obstructing" devices and move their BARs, so the new BARs can fit into the
freed spaces.

To rearrange the BARs and bridge windows these patches releases all of them
after a rescan and re-assigns in the same way as during the initial PCIe
topology scan at system boot.

When a driver is un-paused by the kernel after the PCIe rescan, it should
ioremap() the new addresses of its BARs.

Drivers indicate their support of the feature by implementing the new hooks
.rescan_prepare() and .rescan_done() in the struct pci_driver. If a driver
doesn't yet support the feature, BARs of its devices will be considered as
immovable (by checking the pci_dev_movable_bars_supported(dev)) and handled
in the same way as resources with the IORESOURCE_PCI_FIXED flag.

If a driver doesn't yet support the feature, its devices are guaranteed to
have their BARs remaining untouched.

Tested on:
 - x86_64 with "pci=pcie_bus_peer2peer"
 - POWER8 PowerNV+OPAL+PHB3 ppc64le with "pci=pcie_bus_peer2peer".

This patchset is a part of our work on adding support for hotplugging
bridges full of other bridges, NVME drives, SAS HBAs and GPUs without
special requirements such as Hot-Plug Controller, reservation of bus
numbers or memory regions by firmware, etc.

Changes since v5:
 - Simplified the disable flag, now it is "pci=no_movable_buses";
 - More deliberate marking the BARs as immovable;
 - Mark as immovable BARs which are used by unbound drivers;
 - Ignoring BAR assignment by non-kernel program components, so the kernel
   is able now to distribute BARs in optimal and predictable way;
 - Move here PowerNV-specific patches from the older "powerpc/powernv/pci:
   Make hotplug self-sufficient, independent of FW and DT" series;
 - Fix EEH cache rebuilding and PE allocation for PowerNV during rescan.

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

Sergey Miroshnichenko (30):
  PCI: Fix race condition in pci_enable/disable_device()
  PCI: Enable bridge's I/O and MEM access for hotplugged devices
  PCI: hotplug: Add a flag for the movable BARs feature
  PCI: Define PCI-specific version of the release_child_resources()
  PCI: hotplug: movable BARs: Fix reassigning the released bridge
    windows
  PCI: hotplug: movable BARs: Recalculate all bridge windows during
    rescan
  PCI: hotplug: movable BARs: Don't disable the released bridge windows
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
  PCI: hotplug: Configure MPS for hot-added bridges during bus rescan
  PCI: hotplug: movable BARs: Ignore the MEM BAR offsets from bootloader
  powerpc/pci: Fix crash with enabled movable BARs
  powerpc/pci: Access PCI config space directly w/o pci_dn
  powerpc/pci: Create pci_dn on demand
  powerpc/pci: hotplug: Add support for movable BARs
  powerpc/powernv/pci: Suppress an EEH error when reading an empty slot
  PNP: Don't reserve BARs for PCI when enabled movable BARs
  PCI: hotplug: movable BARs: Enable the feature by default
  nvme-pci: Handle movable BARs
  PCI/portdrv: Declare support of movable BARs
  PCI: pciehp: movable BARs: Trigger a domain rescan on hp events
  Revert "powerpc/powernv/pci: Work around races in PCI bridge enabling"

 .../admin-guide/kernel-parameters.txt         |   1 +
 arch/powerpc/kernel/pci-hotplug.c             |  43 +++
 arch/powerpc/kernel/pci_dn.c                  |  88 ++++-
 arch/powerpc/kernel/rtas_pci.c                |  97 ++++--
 arch/powerpc/platforms/powernv/pci-ioda.c     |  40 +--
 arch/powerpc/platforms/powernv/pci.c          |  73 ++--
 arch/powerpc/platforms/pseries/setup.c        |   2 +
 drivers/nvme/host/pci.c                       |  21 +-
 drivers/pci/bus.c                             |   2 +-
 drivers/pci/hotplug/pciehp_pci.c              |   5 +
 drivers/pci/pci.c                             |  38 ++-
 drivers/pci/pci.h                             |  30 ++
 drivers/pci/pcie/portdrv_pci.c                |  11 +
 drivers/pci/probe.c                           | 315 +++++++++++++++++-
 drivers/pci/setup-bus.c                       | 277 +++++++++++++--
 drivers/pci/setup-res.c                       |  50 ++-
 drivers/pnp/system.c                          |   4 +
 include/linux/pci.h                           |  21 ++
 18 files changed, 965 insertions(+), 153 deletions(-)

-- 
2.23.0

