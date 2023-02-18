Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D2369B9CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 12:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJmj257S0z3fS1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 22:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EiLsj2he;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EiLsj2he;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJmc05BMZz3c6t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 22:26:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D5EC5B82299;
	Sat, 18 Feb 2023 11:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2EAC4339C;
	Sat, 18 Feb 2023 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676719611;
	bh=vLdbEYs9J1EPtjUtdMqj8bjqBT+nhEDREqgOhl9+6dA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EiLsj2hep87sOE4NvcWDKU0XAlOcSB5+fjp1KdhxQhU1ocx5yyRBZMUVPIuCsQEOD
	 drDoJyBYkDn/2jCQ2+kdhV1BmGWGs+4BEo1CmNFTd3tiGrXobCUPqMQz1Rr2HF3/OC
	 REF52nPeqqFCfahETmtobad6+GItJbDawyv4MBLbuJitFnFjvz//q2aMFZNvEWUGS1
	 0C3CaKnXSH3lzOZQjFwDqDLlflV1cXYOCNI4hDs4lsGv1Mi7lxxaCkRc8VuPUd83B8
	 ybwsMVMBxfBza8tF10yEkX76X9NOEjBaYYDIS2C0j4TbCvpmQyIz+xLsnryMxKaZoI
	 PM/S7jcDTqLXw==
Received: by pali.im (Postfix)
	id 231C010C6; Sat, 18 Feb 2023 12:26:49 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <oss@buserror.net>,
	Sinan Akman <sinan@writeme.com>,
	Martin Kennedy <hurricos@gmail.com>
Subject: [PATCH v3 4/8] powerpc/85xx: p2020: Move i8259 code into own function
Date: Sat, 18 Feb 2023 12:14:01 +0100
Message-Id: <20230218111405.27688-5-pali@kernel.org>
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

Splits mpic and i8259 initialization codes into separate functions.
Use 'if (IS_ENABLED(CONFIG_PPC_I8259))' instead of '#ifdef CONFIG_PPC_I8259'.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/p2020.c | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p2020.c b/arch/powerpc/platforms/85xx/p2020.c
index d65d4c88ac47..1cc468dc4caf 100644
--- a/arch/powerpc/platforms/85xx/p2020.c
+++ b/arch/powerpc/platforms/85xx/p2020.c
@@ -44,7 +44,6 @@
 
 #ifdef CONFIG_MPC85xx_DS
 
-#ifdef CONFIG_PPC_I8259
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
 	struct irq_chip *chip = irq_desc_get_chip(desc);
@@ -55,27 +54,13 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
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
 
-	mpic = mpic_alloc(NULL, 0,
-		  MPIC_BIG_ENDIAN |
-		  MPIC_SINGLE_DEST_CPU,
-		0, 256, " OpenPIC  ");
-
-	BUG_ON(mpic == NULL);
-	mpic_init(mpic);
-
-#ifdef CONFIG_PPC_I8259
-	/* Initialize the i8259 controller */
 	for_each_node_by_type(np, "interrupt-controller")
 	    if (of_device_is_compatible(np, "chrp,iic")) {
 		cascade_node = np;
@@ -93,13 +78,28 @@ static void __init mpc85xx_ds_pic_init(void)
 		return;
 	}
 
-	DBG("mpc85xxds: cascade mapped to irq %d\n", cascade_irq);
+	DBG("i8259: cascade mapped to irq %d\n", cascade_irq);
 
 	i8259_init(cascade_node, 0);
 	of_node_put(cascade_node);
 
 	irq_set_chained_handler(cascade_irq, mpc85xx_8259_cascade);
-#endif	/* CONFIG_PPC_I8259 */
+}
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
+	if (IS_ENABLED(CONFIG_PPC_I8259))
+		mpc85xx_8259_init();
 }
 
 #ifdef CONFIG_PCI
-- 
2.20.1

