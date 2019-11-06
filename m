Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB11F1F1B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 20:39:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477cKd4Nt8zF33N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 06:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=ypyy=y6=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477cHT4dlBzF5gd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 06:37:09 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205201] Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
Date: Wed, 06 Nov 2019 19:36:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205201-206035-9IdykV1CIH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205201-206035@https.bugzilla.kernel.org/>
References: <bug-205201-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D205201

--- Comment #6 from Christian Zigotzky (chzigotzky@xenosoft.de) ---
FYI because of the issue with some PCI cards (SCSI, TV cards etc):

Christoph Hellwig wrote:
Can you send me the .config and a dmesg?  And in the meantime try the patch
below?

From 4d659b7311bd4141fdd3eeeb80fa2d7602ea01d4 Mon Sep 17 00:00:00 2001
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Fri, 18 Oct 2019 13:00:43 +0200
Subject: dma-direct: check for overflows on 32 bit DMA addresses

As seen on the new Raspberry Pi 4 and sta2x11's DMA implementation it is
possible for a device configured with 32 bit DMA addresses and a partial
DMA mapping located at the end of the address space to overflow. It
happens when a higher physical address, not DMAable, is translated to
it's DMA counterpart.

For example the Raspberry Pi 4, configurable up to 4 GB of memory, has
an interconnect capable of addressing the lower 1 GB of physical memory
with a DMA offset of 0xc0000000. It transpires that, any attempt to
translate physical addresses higher than the first GB will result in an
overflow which dma_capable() can't detect as it only checks for
addresses bigger then the maximum allowed DMA address.

Fix this by verifying in dma_capable() if the DMA address range provided
is at any point lower than the minimum possible DMA address on the bus.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
include/linux/dma-direct.h | 8 ++++++++
1 file changed, 8 insertions(+)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index adf993a3bd58..6ad9e9ea7564 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -3,6 +3,7 @@
#define _LINUX_DMA_DIRECT_H 1

#include <linux/dma-mapping.h>
+#include <linux/memblock.h> /* for min_low_pfn */
#include <linux/mem_encrypt.h>

#ifdef CONFIG_ARCH_HAS_PHYS_TO_DMA
@@ -27,6 +28,13 @@ static inline bool dma_capable(struct device *dev,
dma_addr_t addr, size_t size)
   if (!dev->dma_mask)
       return false;

+#ifndef CONFIG_ARCH_DMA_ADDR_T_64BIT
+    /* Check if DMA address overflowed */
+    if (min(addr, addr + size - 1) <
+        __phys_to_dma(dev, (phys_addr_t)(min_low_pfn << PAGE_SHIFT)))
+        return false;
+#endif
+
   return addr + size - 1 <=3D
       min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
}

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
