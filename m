Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF34655B49
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Dec 2022 22:18:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NfcNZ3zKcz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Dec 2022 08:18:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IHEA5/at;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IHEA5/at;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NfcLG1r8Hz3bgm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Dec 2022 08:16:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 368A560B4D;
	Sat, 24 Dec 2022 21:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5E7C433F0;
	Sat, 24 Dec 2022 21:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671916595;
	bh=ySpGEUFcvdEqE4LGPb4c2lY8Vn2te6xLgnS8OF0nmEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IHEA5/atfot9gZy3MSrVLjUZNV1u4eLIfyMJ4VTqUwwR6L0CCX58gPQKK01m7lMKG
	 McfzfAATsX64wt37mCLGjeJrFzNnPC74XU+cTM1VYvLdcvbYy5huyzgo+KHYfwMyE+
	 1w8/DYuDLYZLeGWulVkzqV/hAey/Ru0ICKka7uQ5dsqeo+eN1VNpgSWHo7LHO63x+6
	 aT5HwidY+o6KZ/75N+q+uf2ZgVJaeOKx5lbLev9JODTwK1VKmP6W4S87ob9r4urd0a
	 vT86eYmdykyDQIz2v/K2QC3MrZxsbFnDED0+JMLd+n4aTBfKW30P4MPgBO5hK0ZjLP
	 WoTunWbWsXDmQ==
Received: by pali.im (Postfix)
	id 26112720; Sat, 24 Dec 2022 22:16:35 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v2 4/8] powerpc/85xx: p2020: Move i8259 code into own function
Date: Sat, 24 Dec 2022 22:14:21 +0100
Message-Id: <20221224211425.14983-5-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221224211425.14983-1-pali@kernel.org>
References: <20221224211425.14983-1-pali@kernel.org>
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

Splits mpic and i8259 initialization codes into separate functions.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/p2020.c | 37 ++++++++++++++++-------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index d65d4c88ac47..b8584bf307b0 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -45,6 +45,7 @@
 #ifdef CONFIG_MPC85xx_DS
 
 #ifdef CONFIG_PPC_I8259
+
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -55,27 +56,13 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
 	}
 	chip->irq_eoi(&desc->irq_data);
 }
-#endif	/* CONFIG_PPC_I8259 */
 
-static void __init mpc85xx_ds_pic_init(void)
+static void __init mpc85xx_8259_init(void)
 {
-	struct mpic *mpic;
-#ifdef CONFIG_PPC_I8259
 	struct device_node *np;
 	struct device_node *cascade_node = NULL;
 	int cascade_irq;
-#endif
-
-	mpic = mpic_alloc(NULL, 0,
-		  MPIC_BIG_ENDIAN |
-		  MPIC_SINGLE_DEST_CPU,
-		0, 256, " OpenPIC  ");
-
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
 
-#ifdef CONFIG_PPC_I8259
-	/* Initialize the i8259 controller */
 	for_each_node_by_type(np, "interrupt-controller")
 	    if (of_device_is_compatible(np, "chrp,iic")) {
 		cascade_node = np;
@@ -93,13 +80,31 @@ static void __init mpc85xx_ds_pic_init(void)
 		return;
 	}
 
-	DBG("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
+	DBG("i8259: cascade mapped to irq %d\n", cascade_irq);
 
 	i8259_init(cascade_node, 0);
 	of_node_put(cascade_node);
 
 	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
+}
+
 #endif	/* CONFIG_PPC_I8259 */
+
+static void __init mpc85xx_ds_pic_init(void)
+{
+	struct mpic *mpic;
+
+	mpic = mpic_alloc(NULL, 0,
+		  MPIC_BIG_ENDIAN |
+		  MPIC_SINGLE_DEST_CPU,
+		0, 256, " OpenPIC  ");
+
+	BUG_ON(mpic == NULL);
+	mpic_init(mpic);
+
+#ifdef CONFIG_PPC_I8259
+	mpc85xx_8259_init();
+#endif
 }
 
 #ifdef CONFIG_PCI
-- 
2.20.1

