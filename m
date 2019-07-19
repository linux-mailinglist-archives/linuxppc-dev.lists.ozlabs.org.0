Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AF56E0B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 07:47:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qg4d1z7nzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 15:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4QomDFQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qd265yVmzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:14:54 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC7342082F;
 Fri, 19 Jul 2019 04:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509692;
 bh=7U2BUEeK4uB+If/d2qldWdCukizqe1BKbHpDcqSTgQg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X4QomDFQVNOco1N0Ns5s7L4OwX/kec3i9LPtRxFO21Ri7/G/W9IN0DSvv4sqLqRqo
 MU+sZyj+iP7YMNgvNGuJvVGM7N+zSfN+KcRxYbrNBmkKOKt6WlibR45LCV63D4afVB
 gkswAOwfnYUeINUsaxeUcb5hLsMUC/JC4785pfVw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 15/35] powerpc/pci/of: Fix OF flags parsing for
 64bit BARs
Date: Fri, 19 Jul 2019 00:14:03 -0400
Message-Id: <20190719041423.19322-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041423.19322-1-sashal@kernel.org>
References: <20190719041423.19322-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Shawn Anastasio <shawn@anastas.io>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit df5be5be8735ef2ae80d5ae1f2453cd81a035c4b ]

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
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Shawn Anastasio <shawn@anastas.io>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/pci_of_scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 2e710c15893f..a38d7293460d 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -45,6 +45,8 @@ static unsigned int pci_parse_of_flags(u32 addr0, int bridge)
 	if (addr0 & 0x02000000) {
 		flags = IORESOURCE_MEM | PCI_BASE_ADDRESS_SPACE_MEMORY;
 		flags |= (addr0 >> 22) & PCI_BASE_ADDRESS_MEM_TYPE_64;
+		if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64)
+			flags |= IORESOURCE_MEM_64;
 		flags |= (addr0 >> 28) & PCI_BASE_ADDRESS_MEM_TYPE_1M;
 		if (addr0 & 0x40000000)
 			flags |= IORESOURCE_PREFETCH
-- 
2.20.1

