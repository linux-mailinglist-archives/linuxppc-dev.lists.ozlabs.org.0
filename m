Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB6117528
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 20:03:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wszf69cGzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 06:03:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.brown@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Wsvw1BCtzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 06:00:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19850113E;
 Mon,  9 Dec 2019 11:00:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6E73F6CF;
 Mon,  9 Dec 2019 11:00:24 -0800 (PST)
Date: Mon, 09 Dec 2019 19:00:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Applied "spi: fsl: don't map irq during probe" to the spi tree
In-Reply-To: <518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr>
Message-Id: <applied-518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr>
X-Patchwork-Hint: ignore
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   spi: fsl: don't map irq during probe

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3194d2533efffae8b815d84729ecc58b6a9000ab Mon Sep 17 00:00:00 2001
From: Christophe Leroy <christophe.leroy@c-s.fr>
Date: Mon, 9 Dec 2019 15:27:27 +0000
Subject: [PATCH] spi: fsl: don't map irq during probe

With lastest kernel, the following warning is observed at startup:

[    1.500609] ------------[ cut here ]------------
[    1.505225] remove_proc_entry: removing non-empty directory 'irq/22', leaking at least 'fsl_spi'
[    1.514234] WARNING: CPU: 0 PID: 1 at fs/proc/generic.c:682 remove_proc_entry+0x198/0x1c0
[    1.522403] CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.0-s3k-dev-02248-g93532430a4ff #2564
[    1.530724] NIP:  c0197694 LR: c0197694 CTR: c0050d80
[    1.535762] REGS: df4a5af0 TRAP: 0700   Not tainted  (5.4.0-02248-g93532430a4ff)
[    1.543818] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 22028222  XER: 00000000
[    1.550524]
[    1.550524] GPR00: c0197694 df4a5ba8 df4a0000 00000054 00000000 00000000 00004a38 00000010
[    1.550524] GPR08: c07c5a30 00000800 00000000 00001032 22000208 00000000 c0004b14 00000000
[    1.550524] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 c0830000 c07fc078
[    1.550524] GPR24: c08e8ca0 df665d10 df60ea98 c07c9db8 00000001 df5d5ae3 df5d5a80 df43f8e3
[    1.585327] NIP [c0197694] remove_proc_entry+0x198/0x1c0
[    1.590628] LR [c0197694] remove_proc_entry+0x198/0x1c0
[    1.595829] Call Trace:
[    1.598280] [df4a5ba8] [c0197694] remove_proc_entry+0x198/0x1c0 (unreliable)
[    1.605321] [df4a5bd8] [c0067acc] unregister_irq_proc+0x5c/0x70
[    1.611238] [df4a5bf8] [c005fbc4] free_desc+0x3c/0x80
[    1.616286] [df4a5c18] [c005fe2c] irq_free_descs+0x70/0xa8
[    1.621778] [df4a5c38] [c033d3fc] of_fsl_spi_probe+0xdc/0x3cc
[    1.627525] [df4a5c88] [c02f0f64] platform_drv_probe+0x44/0xa4
[    1.633350] [df4a5c98] [c02eee44] really_probe+0x1ac/0x418
[    1.638829] [df4a5cc8] [c02ed3e8] bus_for_each_drv+0x64/0xb0
[    1.644481] [df4a5cf8] [c02ef950] __device_attach+0xd4/0x128
[    1.650132] [df4a5d28] [c02ed61c] bus_probe_device+0xa0/0xbc
[    1.655783] [df4a5d48] [c02ebbe8] device_add+0x544/0x74c
[    1.661096] [df4a5d88] [c0382b78] of_platform_device_create_pdata+0xa4/0x100
[    1.668131] [df4a5da8] [c0382cf4] of_platform_bus_create+0x120/0x20c
[    1.674474] [df4a5df8] [c0382d50] of_platform_bus_create+0x17c/0x20c
[    1.680818] [df4a5e48] [c0382e88] of_platform_bus_probe+0x9c/0xf0
[    1.686907] [df4a5e68] [c0751404] __machine_initcall_cmpcpro_cmpcpro_declare_of_platform_devices+0x74/0x1a4
[    1.696629] [df4a5e98] [c072a4cc] do_one_initcall+0x8c/0x1d4
[    1.702282] [df4a5ef8] [c072a768] kernel_init_freeable+0x154/0x204
[    1.708455] [df4a5f28] [c0004b2c] kernel_init+0x18/0x110
[    1.713769] [df4a5f38] [c00122ac] ret_from_kernel_thread+0x14/0x1c
[    1.719926] Instruction dump:
[    1.722889] 2c030000 4182004c 3863ffb0 3c80c05f 80e3005c 388436a0 3c60c06d 7fa6eb78
[    1.730630] 7fe5fb78 38840280 38634178 4be8c611 <0fe00000> 4bffff6c 3c60c071 7fe4fb78
[    1.738556] ---[ end trace 05d0720bf2e352e2 ]---

The problem comes from the error path which calls
irq_dispose_mapping() while the IRQ has been requested with
devm_request_irq().

IRQ doesn't need to be mapped with irq_of_parse_and_map(). The only
need is to get the IRQ virtual number. For that, use
of_irq_to_resource() instead of the
irq_of_parse_and_map()/irq_dispose_mapping() pair.

Fixes: 500a32abaf81 ("spi: fsl: Call irq_dispose_mapping in err path")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Link: https://lore.kernel.org/r/518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-fsl-spi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 4b70887cf443..d0ad9709f4a6 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -746,8 +746,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	if (ret)
 		goto err;
 
-	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
+	irq = of_irq_to_resource(np, 0, NULL);
+	if (irq <= 0) {
 		ret = -EINVAL;
 		goto err;
 	}
@@ -761,7 +761,6 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	return 0;
 
 err:
-	irq_dispose_mapping(irq);
 	return ret;
 }
 
-- 
2.20.1

