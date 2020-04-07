Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD701A032B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 02:10:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x7900DHxzDqJk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=z8sFap4/; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x6z426h8zDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 10:02:08 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46F1620857;
 Tue,  7 Apr 2020 00:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586217726;
 bh=XQEArXGItVvaQZkfpdMmLcNNI8l93bdzj2TABmVv/Ek=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=z8sFap4/lh1WkI/Es3d7UcZwc4KOfNBSaHBUJJ7m3MZUFQ30KhQA7I6JtBH/rwy9x
 cnpZAe+qKcOFi0uHPq0/QZip5obMf7C6aLg99aiY2ULLxcfYqh7lwoGU5ViI3dPc9F
 fBEHYkYwdfzWZZ80zw8QC2A3M2iqXNlmY0JFHnEw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/32] soc: fsl: dpio: register dpio irq handlers
 after dpio create
Date: Mon,  6 Apr 2020 20:01:29 -0400
Message-Id: <20200407000151.16768-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407000151.16768-1-sashal@kernel.org>
References: <20200407000151.16768-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Grigore Popescu <grigore.popescu@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Grigore Popescu <grigore.popescu@nxp.com>

[ Upstream commit fe8fe7723a3a824790bda681b40efd767e2251a7 ]

The dpio irqs must be registered when you can actually
receive interrupts, ie when the dpios are created.
Kernel goes through NULL pointer dereference errors
followed by kernel panic [1] because the dpio irqs are
enabled before the dpio is created.

[1]
Unable to handle kernel NULL pointer dereference at virtual address 0040
fsl_mc_dpio dpio.14: probed
fsl_mc_dpio dpio.13: Adding to iommu group 11
  ISV = 0, ISS = 0x00000004
Unable to handle kernel NULL pointer dereference at virtual address 0040
Mem abort info:
  ESR = 0x96000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
[0000000000000040] user address but active_mm is swapper
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 PID: 151 Comm: kworker/2:1 Not tainted 5.6.0-rc4-next-20200304 #1
Hardware name: NXP Layerscape LX2160ARDB (DT)
Workqueue: events deferred_probe_work_func
pstate: 00000085 (nzcv daIf -PAN -UAO)
pc : dpaa2_io_irq+0x18/0xe0
lr : dpio_irq_handler+0x1c/0x28
sp : ffff800010013e20
x29: ffff800010013e20 x28: ffff0026d9b4c140
x27: ffffa1d38a142018 x26: ffff0026d2953400
x25: ffffa1d38a142018 x24: ffffa1d38a7ba1d8
x23: ffff800010013f24 x22: 0000000000000000
x21: 0000000000000072 x20: ffff0026d2953400
x19: ffff0026d2a68b80 x18: 0000000000000001
x17: 000000002fb37f3d x16: 0000000035eafadd
x15: ffff0026d9b4c5b8 x14: ffffffffffffffff
x13: ff00000000000000 x12: 0000000000000038
x11: 0101010101010101 x10: 0000000000000040
x9 : ffffa1d388db11e4 x8 : ffffa1d38a7e40f0
x7 : ffff0026da414f38 x6 : 0000000000000000
x5 : ffff0026da414d80 x4 : ffff5e5353d0c000
x3 : ffff800010013f60 x2 : ffffa1d388db11c8
x1 : ffff0026d2a67c00 x0 : 0000000000000000
Call trace:
 dpaa2_io_irq+0x18/0xe0
 dpio_irq_handler+0x1c/0x28
 __handle_irq_event_percpu+0x78/0x2c0
 handle_irq_event_percpu+0x38/0x90
 handle_irq_event+0x4c/0xd0
 handle_fasteoi_irq+0xbc/0x168
 generic_handle_irq+0x2c/0x40
 __handle_domain_irq+0x68/0xc0
 gic_handle_irq+0x64/0x150
 el1_irq+0xb8/0x180
 _raw_spin_unlock_irqrestore+0x14/0x48
 irq_set_affinity_hint+0x6c/0xa0
 dpaa2_dpio_probe+0x2a4/0x518
 fsl_mc_driver_probe+0x28/0x70
 really_probe+0xdc/0x320
 driver_probe_device+0x5c/0xf0
 __device_attach_driver+0x88/0xc0
 bus_for_each_drv+0x7c/0xc8
 __device_attach+0xe4/0x140
 device_initial_probe+0x18/0x20
 bus_probe_device+0x98/0xa0
 device_add+0x41c/0x758
 fsl_mc_device_add+0x184/0x530
 dprc_scan_objects+0x280/0x370
 dprc_probe+0x124/0x3b0
 fsl_mc_driver_probe+0x28/0x70
 really_probe+0xdc/0x320
 driver_probe_device+0x5c/0xf0
 __device_attach_driver+0x88/0xc0
 bus_for_each_drv+0x7c/0xc8
 __device_attach+0xe4/0x140
 device_initial_probe+0x18/0x20
 bus_probe_device+0x98/0xa0
 deferred_probe_work_func+0x74/0xa8
 process_one_work+0x1c8/0x470
 worker_thread+0x1f8/0x428
 kthread+0x124/0x128
 ret_from_fork+0x10/0x18
Code: a9bc7bfd 910003fd a9025bf5 a90363f7 (f9402015)
---[ end trace 38298e1a29e7a570 ]---
Kernel panic - not syncing: Fatal exception in interrupt
SMP: stopping secondary CPUs
Mem abort info:
  ESR = 0x96000004
  CM = 0, WnR = 0
  EC = 0x25: DABT (current EL), IL = 32 bits
[0000000000000040] user address but active_mm is swapper
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
[0000000000000040] user address but active_mm is swapper
SMP: failed to stop secondary CPUs 0-2
Kernel Offset: 0x21d378600000 from 0xffff800010000000
PHYS_OFFSET: 0xffffe92180000000
CPU features: 0x10002,21806008
Memory Limit: none
---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Grigore Popescu <grigore.popescu@nxp.com>
Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/fsl/dpio/dpio-driver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 70014ecce2a7e..7b642c330977f 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -233,10 +233,6 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 		goto err_allocate_irqs;
 	}
 
-	err = register_dpio_irq_handlers(dpio_dev, desc.cpu);
-	if (err)
-		goto err_register_dpio_irq;
-
 	priv->io = dpaa2_io_create(&desc, dev);
 	if (!priv->io) {
 		dev_err(dev, "dpaa2_io_create failed\n");
@@ -244,6 +240,10 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *dpio_dev)
 		goto err_dpaa2_io_create;
 	}
 
+	err = register_dpio_irq_handlers(dpio_dev, desc.cpu);
+	if (err)
+		goto err_register_dpio_irq;
+
 	dev_info(dev, "probed\n");
 	dev_dbg(dev, "   receives_notifications = %d\n",
 		desc.receives_notifications);
-- 
2.20.1

