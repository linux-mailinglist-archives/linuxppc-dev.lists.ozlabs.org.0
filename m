Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DA69B9D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 12:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJmm52tBhz3fcw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 22:33:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bm8dQF+F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bm8dQF+F;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJmc05rkPz3cKk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 22:26:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 88F33B822B0;
	Sat, 18 Feb 2023 11:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D4EC433A7;
	Sat, 18 Feb 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676719612;
	bh=FAbayckINTcRtQEApIU4KxM0IuLRQEFTI2dIvymgGt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bm8dQF+Fektu6qZvLgRICtgM0fuRiUYW50iz2fPx+MO0GMQxxFIPOOubK3guWhQIG
	 /6CRarXi1GWgOIZM6G3fA253xCdDbabAwQZpgvgvZ9aV2gJDUyBaf0XhJ5qX9JUFln
	 jnGSH7gSEPAMZCNmPn3cWNoi8DyAmF0xTKN2WOyMB2l8cifUGGGgVNKARsuQXvjLzK
	 5+3EXz6JRk0cEDWlX0+J8JyO2mnXXjA82iVJJRv3xNRP2gu2LTmVKErVzxcmQO83tu
	 mDsorRQCR5C7sZ7WJD+P/mcwu/2ZjGAUQlfevKaA+/wOFVXPNjIz/XmE7Wk9j/fa8w
	 zk5eQkS5Zj5Qg==
Received: by pali.im (Postfix)
	id 82DCA2619; Sat, 18 Feb 2023 12:26:49 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v3 6/8] powerpc/85xx: p2020: Define just one machine description
Date: Sat, 18 Feb 2023 12:14:03 +0100
Message-Id: <20230218111405.27688-7-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230218111405.27688-1-pali@kernel.org>
References: <20230218111405.27688-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Combine machine descriptions and code of all P2020 boards into just one
generic unified P2020 machine description. This allows kernel to boot on
any P2020-based board with P2020 DTS file without need to patch kernel and
define a new machine description in 85xx powerpc platform directory.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/p2020.c | 77 ++++++-----------------------
 1 file changed, 15 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index 1033b7bb05cc..feb5507bfc89 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -151,83 +151,36 @@ static void __init p2020_setup_arch(void)
 #endif
 }
 
-#ifdef CONFIG_MPC85xx_DS
-machine_arch_initcall(p2020_ds, mpc85xx_common_publish_devices);
-#endif /* CONFIG_MPC85xx_DS */
-
-#ifdef CONFIG_MPC85xx_RDB
-machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
-machine_arch_initcall(p2020_rdb_pc, mpc85xx_common_publish_devices);
-#endif /* CONFIG_MPC85xx_RDB */
+machine_arch_initcall(p2020, mpc85xx_common_publish_devices);
 
 /*
  * Called very early, device-tree isn't unflattened
  */
-#ifdef CONFIG_MPC85xx_DS
-static int __init p2020_ds_probe(void)
+static int __init p2020_probe(void)
 {
-	return !!of_machine_is_compatible("fsl,P2020DS");
-}
-#endif /* CONFIG_MPC85xx_DS */
+	struct device_node *p2020_cpu;
 
-#ifdef CONFIG_MPC85xx_RDB
-static int __init p2020_rdb_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB"))
-		return 1;
-	return 0;
-}
+	/*
+	 * There is no common compatible string for all P2020 boards.
+	 * The only common thing is "PowerPC,P2020@0" cpu node.
+	 * So check for P2020 board via this cpu node.
+	 */
+	p2020_cpu = of_find_node_by_path("/cpus/PowerPC,P2020@0");
+	of_node_put(p2020_cpu);
 
-static int __init p2020_rdb_pc_probe(void)
-{
-	if (of_machine_is_compatible("fsl,P2020RDB-PC"))
-		return 1;
-	return 0;
+	return !!p2020_cpu;
 }
-#endif /* CONFIG_MPC85xx_RDB */
-
-#ifdef CONFIG_MPC85xx_DS
-define_machine(p2020_ds) {
-	.name			= "P2020 DS",
-	.probe			= p2020_ds_probe,
-	.setup_arch		= p2020_setup_arch,
-	.init_IRQ		= p2020_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
-#endif /* CONFIG_MPC85xx_DS */
-
-#ifdef CONFIG_MPC85xx_RDB
-define_machine(p2020_rdb) {
-	.name			= "P2020 RDB",
-	.probe			= p2020_rdb_probe,
-	.setup_arch		= p2020_setup_arch,
-	.init_IRQ		= p2020_pic_init,
-#ifdef CONFIG_PCI
-	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
-#endif
-	.get_irq		= mpic_get_irq,
-	.calibrate_decr		= generic_calibrate_decr,
-	.progress		= udbg_progress,
-};
 
-define_machine(p2020_rdb_pc) {
-	.name			= "P2020RDB-PC",
-	.probe			= p2020_rdb_pc_probe,
+define_machine(p2020) {
+	.name			= "Freescale P2020",
+	.probe			= p2020_probe,
 	.setup_arch		= p2020_setup_arch,
 	.init_IRQ		= p2020_pic_init,
 #ifdef CONFIG_PCI
 	.pcibios_fixup_bus	= fsl_pcibios_fixup_bus,
-	.pcibios_fixup_phb      = fsl_pcibios_fixup_phb,
+	.pcibios_fixup_phb	= fsl_pcibios_fixup_phb,
 #endif
 	.get_irq		= mpic_get_irq,
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
 };
-#endif /* CONFIG_MPC85xx_RDB */
-- 
2.20.1

