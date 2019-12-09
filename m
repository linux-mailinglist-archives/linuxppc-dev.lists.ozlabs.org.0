Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8911707F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:31:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WnH459NrzDqLx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 02:31:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QzzMHJar"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WnBG1RvbzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:27:32 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47WnB30jcyzB09ZL;
 Mon,  9 Dec 2019 16:27:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QzzMHJar; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pirj6bkoj1iE; Mon,  9 Dec 2019 16:27:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47WnB26pCRzB09ZD;
 Mon,  9 Dec 2019 16:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575905242; bh=N0p8bL00fXJy+ErpVfjWbXzgyNfzEYG+SACsDkDCgRk=;
 h=From:Subject:To:Cc:Date:From;
 b=QzzMHJarpmYmAAEoy04BpXzgodCFzryrdqc9oKudNSO5Uc2sAh12PGDvhfCmk2/E9
 wWdiVueaymGXJTAPMkKddIgU/egoIHhtIxaiIxqUcWOZgHsyK5lhPJP3MUWwNoWLTZ
 +X4hy+/soOLp6lN0uxc54wlhKr8h15ZRlXdnDSrs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19E7D8B7C5;
 Mon,  9 Dec 2019 16:27:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8vD5seeYkMw1; Mon,  9 Dec 2019 16:27:27 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B823B8B7F2;
 Mon,  9 Dec 2019 16:27:27 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 6594F63739; Mon,  9 Dec 2019 15:27:27 +0000 (UTC)
Message-Id: <518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] spi: fsl: don't map irq during probe
To: Mark Brown <broonie@kernel.org>
Date: Mon,  9 Dec 2019 15:27:27 +0000 (UTC)
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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

Fixes: 500a32abaf81 ("spi: fsl: Call irq_dispose_mapping in err path")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/spi/spi-fsl-spi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

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

