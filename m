Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8199059F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:18:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697m14LhvzDrTn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:18:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="jaA1W4c9"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697js0gM1zDr9Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:16:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 73F3642ECD;
 Fri, 16 Aug 2019 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1565972186; x=
 1567786587; bh=N8kmDhJ6lbdeM1ACqFmDDfwOrCd6RU5x+mQv5WXi/e0=; b=j
 aA1W4c996q1aTTaToBA+ZFUG5DHknYoqbzdg+43C291Mfj0LJyfMVE+BFneYazug
 4R8lab0p5GbAAWBOAVkTgEcCl1la8lvLj5Cee8XelwRPfN5JRiSJkAztJey73DAP
 3EqOQMbU8l3Wpt1xiZ8BaUMGIk5miL7ypywcvR4Vs0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5z3Sscc6o3i; Fri, 16 Aug 2019 19:16:26 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9BF81412D2;
 Fri, 16 Aug 2019 19:16:26 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:16:24 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 0/5] powerpc/powernv/pci: Make hotplug self-sufficient,
 independent of FW and DT
Date: Fri, 16 Aug 2019 19:16:09 +0300
Message-ID: <20190816161614.32344-1-s.miroshnichenko@yadro.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow switching from the pnv_php module to the standard pciehp driver for
PowerNV, if the platform supports it: it can be a server working on top of
the skiboot with the [1] patchset applied.

Add the ability to discover hot-added devices which weren't added to the
Device Tree (by the pnv_php via an explicit OPAL call when a hotplug event
was intercepted) by direct access to the bus.

Sync the changes in PCIe topology (bus numbers and PEs) with the skiboot.

Tested on POWER8 PowerNV+PHB3 ppc64le (our Vesnin server) with:
 - the pciehp driver active;
 - the pnv_php driver disabled;
 - the "pci=pcie_bus_peer2peer,realloc" kernel command line argument;
 - controlled hotplug of a network card with SR-IOV works;
 - activating of SR-IOV on a network card works;
 - [with extra patches for movable BARs and bus numbers] manually initiated
   (via sysfs) rescan has found and turned on a hotplugged bridge.

[1] https://lists.ozlabs.org/pipermail/skiboot/2019-August/015140.html
    [Skiboot] [PATCH v3 0/5] core/pci: Track changes of topology by an OS

Change since v5:
 - Activates on "ibm,supported-movable-bdfs" property in DT from skiboot
   instead of the "pci=realloc" flag;
 - Removed the code refactoring patches - will send them separately.

Changes since v4:
 - Fixed failing build when EEH is disabled in a kernel config;
 - Unfreeze the bus on EEH_IO_ERROR_VALUE(size), not only 0xffffffff;
 - Replaced the 0xff magic constant with phb->ioda.reserved_pe_idx;
 - Renamed create_pdn() -> pci_create_pdn_from_dev();
 - Renamed add_one_dev_pci_data(..., vf_index, ...) -> pci_alloc_pdn();
 - Renamed add_dev_pci_data() -> pci_create_vf_pdns();
 - Renamed remove_dev_pci_data() -> pci_destroy_vf_pdns();
 - Removed the patch fixing uninitialized IOMMU group - now it is fixed in
   commit 8f5b27347e88 ("powerpc/powernv/sriov: Register IOMMU groups for
   VFs")

Changes since v3:
 - Subject changed;
 - Don't disable EEH during rescan anymore - instead just unfreeze the
   target buses deliberately;
 - Add synchronization with the firmware when changing the PCIe topology;
 - Fixed for VFs;
 - Code cleanup.

Changes since v2:
 - Don't reassign bus numbers on PowerNV by default (to retain the default
   behavior), but only when pci=realloc is passed;
 - Less code affected;
 - pci_add_device_node_info is refactored with add_one_dev_pci_data;
 - Minor code cleanup.

Changes since v1:
 - Fixed build for ppc64le and ppc64be when CONFIG_PCI_IOV is disabled;
 - Fixed build for ppc64e when CONFIG_EEH is disabled;
 - Fixed code style warnings.

Sergey Miroshnichenko (5):
  powerpc/pci: Access PCI config space directly w/o pci_dn
  powerpc/powernv/pci: Suppress an EEH error when reading an empty slot
  powerpc/pci: Create pci_dn on demand
  powerpc/powernv/pci: Hook up the writes to PCI_SECONDARY_BUS register
  powerpc/pci: Enable assigning bus numbers instead of reading them from
    DT

 arch/powerpc/include/asm/ppc-pci.h           |   1 +
 arch/powerpc/kernel/pci_dn.c                 |  95 +++++++--
 arch/powerpc/kernel/rtas_pci.c               |  97 ++++++---
 arch/powerpc/platforms/powernv/eeh-powernv.c |   2 +-
 arch/powerpc/platforms/powernv/pci.c         | 205 +++++++++++++++++--
 5 files changed, 331 insertions(+), 69 deletions(-)

-- 
2.21.0

