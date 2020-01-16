Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6013E3D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:04:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z9Xc33NNzDqcH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 04:04:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=GB1NXzmP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9JJ5zl1zDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 03:53:52 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9831E21D56;
 Thu, 16 Jan 2020 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193628;
 bh=Fu7OV1q2drxb3QitiI52Q3VWJ6ir4zwen08E5sQltto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GB1NXzmPM1zSipcC2WnosnizDUmGvtmNBvvTNYqemQted6f/dFwyJHG1bFIZ6Qxe5
 5lNDf/uNK/cNCfFyQR9UO+Sw2gHnWLp2hpjN07L46/acg88h7doTYJjRf2l5jbIKv3
 7OCIC+6nX6YDK2x+LYRad81v3bAQmodIg77xIjv4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 162/205] powerpc/powernv: Disable native PCIe port
 management
Date: Thu, 16 Jan 2020 11:42:17 -0500
Message-Id: <20200116164300.6705-162-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

[ Upstream commit 9d72dcef891030545f39ad386a30cf91df517fb2 ]

On PowerNV the PCIe topology is (currently) managed by the powernv platform
code in Linux in cooperation with the platform firmware. Linux's native
PCIe port service drivers operate independently of both and this can cause
problems.

The main issue is that the portbus driver will conflict with the platform
specific hotplug driver (pnv_php) over ownership of the MSI used to notify
the host when a hotplug event occurs. The portbus driver claims this MSI on
behalf of the individual port services because the same interrupt is used
for hotplug events, PMEs (on root ports), and link bandwidth change
notifications. The portbus driver will always claim the interrupt even if
the individual port service drivers, such as pciehp, are compiled out.

The second, bigger, problem is that the hotplug port service driver
fundamentally does not work on PowerNV. The platform assumes that all
PCI devices have a corresponding arch-specific handle derived from the DT
node for the device (pci_dn) and without one the platform will not allow
a PCI device to be enabled. This problem is largely due to historical
baggage, but it can't be resolved without significant re-factoring of the
platform PCI support.

We can fix these problems in the interim by setting the
"pcie_ports_disabled" flag during platform initialisation. The flag
indicates the platform owns the PCIe ports which stops the portbus driver
from being registered.

This does have the side effect of disabling all port services drivers
that is: AER, PME, BW notifications, hotplug, and DPC. However, this is
not a huge disadvantage on PowerNV since these services are either unused
or handled through other means.

Fixes: 66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191118065553.30362-1-oohall@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/powernv/pci.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 2825d004dece..c0bea75ac27b 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -945,6 +945,23 @@ void __init pnv_pci_init(void)
 	if (!firmware_has_feature(FW_FEATURE_OPAL))
 		return;
 
+#ifdef CONFIG_PCIEPORTBUS
+	/*
+	 * On PowerNV PCIe devices are (currently) managed in cooperation
+	 * with firmware. This isn't *strictly* required, but there's enough
+	 * assumptions baked into both firmware and the platform code that
+	 * it's unwise to allow the portbus services to be used.
+	 *
+	 * We need to fix this eventually, but for now set this flag to disable
+	 * the portbus driver. The AER service isn't required since that AER
+	 * events are handled via EEH. The pciehp hotplug driver can't work
+	 * without kernel changes (and portbus binding breaks pnv_php). The
+	 * other services also require some thinking about how we're going
+	 * to integrate them.
+	 */
+	pcie_ports_disabled = true;
+#endif
+
 	/* Look for IODA IO-Hubs. */
 	for_each_compatible_node(np, NULL, "ibm,ioda-hub") {
 		pnv_pci_init_ioda_hub(np);
-- 
2.20.1

