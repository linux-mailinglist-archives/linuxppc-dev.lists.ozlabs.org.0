Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A64355AA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 05:40:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JZLF20V5zDqLN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45JZJq5NJwzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 13:38:51 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id B779EAE8000F;
 Tue,  4 Jun 2019 23:38:16 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/pci/of: Fix OF flags parsing for 64bit BARs
Date: Wed,  5 Jun 2019 13:38:14 +1000
Message-Id: <20190605033814.127962-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Shawn Anastasio <shawn@anastas.io>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the firmware does PCI BAR resource allocation, it passes the assigned
addresses and flags (prefetch/64bit/...) via the "reg" property of
a PCI device device tree node so the kernel does not need to do
resource allocation.

The flags are stored in resource::flags - the lower byte stores
PCI_BASE_ADDRESS_SPACE/etc bits and the other bytes are IORESOURCE_IO/etc.
Some flags from PCI_BASE_ADDRESS_xxx and IORESOURCE_xxx are duplicated,
such as PCI_BASE_ADDRESS_MEM_PREFETCH/PCI_BASE_ADDRESS_MEM_TYPE_64/etc.
When parsing the "reg" property, we copy the prefetch flag but we skip
on PCI_BASE_ADDRESS_MEM_TYPE_64 which leaves the flags out of sync.

The missing IORESOURCE_MEM_64 flag comes into play under 2 conditions:
1. we remove PCI_PROBE_ONLY for pseries (by hacking pSeries_setup_arch()
or by passing "/chosen/linux,pci-probe-only");
2. we request resource alignment (by passing pci=resource_alignment=
via the kernel cmd line to request PAGE_SIZE alignment or defining
ppc_md.pcibios_default_alignment which returns anything but 0). Note that
the alignment requests are ignored if PCI_PROBE_ONLY is enabled.

With 1) and 2), the generic PCI code in the kernel unconditionally
decides to:
- reassign the BARs in pci_specified_resource_alignment() (works fine)
- write new BARs to the device - this fails for 64bit BARs as the generic
code looks at IORESOURCE_MEM_64 (not set) and writes only lower 32bits
of the BAR and leaves the upper 32bit unmodified which breaks BAR mapping
in the hypervisor.

This fixes the issue by copying the flag. This is useful if we want to
enforce certain BAR alignment per platform as handling subpage sized BARs
is proven to cause problems with hotplug (SLOF already aligns BARs to 64k).

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This code is there for ages (from 200x) hence no "Fixes:".

Ideally I want to enforce /chosen/linux,pci-probe-only in QEMU as
at the moment:
- pci=resource_alignment= alone does not do anything;
- /chosen/linux,pci-probe-only alone does not cause the kernel to
reassign resources;
- pci=resource_alignment= with /chosen/linux,pci-probe-only is broken
anyway.

---
 arch/powerpc/kernel/pci_of_scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 24191ea2d9a7..64ad92016b63 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -45,6 +45,8 @@ unsigned int pci_parse_of_flags(u32 addr0, int bridge)
 	if (addr0 & 0x02000000) {
 		flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
 		flags |= (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
+		if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
+			flags |= IORESOURCE_MEM_64;
 		flags |= (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
 		if (addr0 & 0x40000000)
 			flags |= IORESOURCE_PREFETCH
-- 
2.17.1

