Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 584CA118C5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 16:19:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XNy82NwzzDq7j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 02:19:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mhTKaRrQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XNw062T2zDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 02:17:20 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47XNvw0kVZz9txNv;
 Tue, 10 Dec 2019 16:17:16 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mhTKaRrQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id O5V_lEMKmRWo; Tue, 10 Dec 2019 16:17:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47XNvv6k9vz9txNq;
 Tue, 10 Dec 2019 16:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575991035; bh=Af0DPms5UVaYySKeJ9tzwgtYBkAXclcjA+E2An46M1Q=;
 h=From:Subject:To:Cc:Date:From;
 b=mhTKaRrQR2cvIytxVGXv7Am6lG18lbR13OjpPxIYkimM1/ZjNdk1eAoHR3sKLt5lB
 TiiYNshd7X6zZK1Itr0SDx9fa+B5iBOtFN20Rvclpdi4DA9bzfvSqciiRE29dKhKHz
 4henJ/7s7a17k+Jh1dd42UUyNlZc/TkabHV8SqvM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 527558B818;
 Tue, 10 Dec 2019 16:17:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Gt6OA9HvVgrP; Tue, 10 Dec 2019 16:17:17 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A34A48B754;
 Tue, 10 Dec 2019 16:17:16 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id E46996373D; Tue, 10 Dec 2019 15:17:15 +0000 (UTC)
Message-Id: <1cdd0a26d7e1545f32c8bc4dc7458ebecdd6aaed.1575990944.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 1/2] spi: fsl: don't map irq during probe
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:17:15 +0000 (UTC)
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
Cc: devicetree@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

To avoid build failure on SPARC which has a dummy version of
irq_of_parse_and_map() but not of of_irq_to_resource(), get this
driver dependent on OF_IRQ.

Reported-by: kbuild test robot <lkp@intel.com>
[v2: adding dependency on CONFIG_OF_IRQ]
Fixes: 500a32abaf81 ("spi: fsl: Call irq_dispose_mapping in err path")
Cc: stable@vger.kernel.org

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/spi/Kconfig       | 2 +-
 drivers/spi/spi-fsl-spi.c | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 870f7797b56b..fba933f31d40 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -378,7 +378,7 @@ config SPI_FSL_CPM
 
 config SPI_FSL_SPI
 	tristate "Freescale SPI controller and Aeroflex Gaisler GRLIB SPI controller"
-	depends on OF
+	depends on OF_IRQ
 	select SPI_FSL_LIB
 	select SPI_FSL_CPM if FSL_SOC
 	help
diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index e2d878397efd..2d85c81983b1 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -765,8 +765,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	if (ret)
 		goto err;
 
-	irq = irq_of_parse_and_map(np, 0);
-	if (!irq) {
+	irq = of_irq_to_resource(np, 0, NULL);
+	if (irq <= 0) {
 		ret = -EINVAL;
 		goto err;
 	}
@@ -780,7 +780,6 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	return 0;
 
 err:
-	irq_dispose_mapping(irq);
 	return ret;
 }
 
-- 
2.13.3

