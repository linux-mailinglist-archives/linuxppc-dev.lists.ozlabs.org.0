Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B46DBB78
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 16:06:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtxqR71vHz3fTG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 00:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PcQ+lKN7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PcQ+lKN7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptxkv20b6z3fDD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 00:02:31 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4166061597;
	Sat,  8 Apr 2023 14:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81AB5C4339E;
	Sat,  8 Apr 2023 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680962548;
	bh=BetVWQQ1Px1KBs5A5CIK9YDSLjKUAhqlUhnTQwa8n9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PcQ+lKN74rGwX1D5L7CC8afdmO61Wr7xmapsvOnd7/6PRzFm6KqLiT9KZcP5B3JqU
	 3VdYaIvy5mPjPDSFQi0bnu7kypznqauVlK+YREwTLoTlhI/7rszE561buBRPGVctk+
	 kZH189Yv80NPvdF2QauURCZ6j7iRwuTaTvgetRD5aQj6MgF/0JgIPIUV1pS7RUKqgf
	 +I7+VmnD4DSWVCMWRZCB1jk3qJbmYmQ/r4pVkX7NW1C3oJNiBgOLWcAqL5IRwKE1dP
	 ExpM/ZopX0NGZjBbYThd3oifZiCybr/7LJZi05rpkkYz1mrGGQNodgOpjPLQYCuOkt
	 HKG7GfOKwA7Tg==
Received: by pali.im (Postfix)
	id 28365209C; Sat,  8 Apr 2023 16:02:26 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 04/13] powerpc/85xx: mpc85xx_{ds/rdb} replace prink by pr_xxx macro
Date: Sat,  8 Apr 2023 16:01:13 +0200
Message-Id: <20230408140122.25293-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230408140122.25293-1-pali@kernel.org>
References: <20230408140122.25293-1-pali@kernel.org>
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

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Use pr_debug() instead of printk(KERN_DEBUG
Use pr_err() instead of printk(KERN_ERR
Use pr_info() instead of printk(KERN_INFO or printk("

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c  | 6 +++---
 arch/powerpc/platforms/85xx/mpc85xx_rdb.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index 98cca1102e0b..d8d13438e18f 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -76,13 +76,13 @@ void __init mpc85xx_ds_pic_init(void)
 	}
 
 	if (cascade_node == NULL) {
-		printk(KERN_DEBUG "Could not find i8259 PIC\n");
+		pr_debug("Could not find i8259 PIC\n");
 		return;
 	}
 
 	cascade_irq = irq_of_parse_and_map(cascade_node, 0);
 	if (!cascade_irq) {
-		printk(KERN_ERR "Failed to map cascade interrupt\n");
+		pr_err("Failed to map cascade interrupt\n");
 		return;
 	}
 
@@ -108,7 +108,7 @@ static void __init mpc85xx_ds_setup_arch(void)
 	uli_init();
 	mpc85xx_smp_init();
 
-	printk("MPC85xx DS board from Freescale Semiconductor\n");
+	pr_info("MPC85xx DS board from Freescale Semiconductor\n");
 }
 
 machine_arch_initcall(mpc8544_ds, mpc85xx_common_publish_devices);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
index a802053b37b3..64badacf126d 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_rdb.c
@@ -92,7 +92,7 @@ static void __init mpc85xx_rdb_setup_arch(void)
 #endif
 #endif	/* CONFIG_QUICC_ENGINE */
 
-	printk(KERN_INFO "MPC85xx RDB board from Freescale Semiconductor\n");
+	pr_info("MPC85xx RDB board from Freescale Semiconductor\n");
 }
 
 machine_arch_initcall(p2020_rdb, mpc85xx_common_publish_devices);
-- 
2.20.1

