Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188A117067
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:29:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WnDD4NDXzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 02:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="d6D8Suox"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WnBG1WPbzDqM2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:27:33 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47WnB35rydzB09ZD;
 Mon,  9 Dec 2019 16:27:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=d6D8Suox; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RITqvsV8S1Sh; Mon,  9 Dec 2019 16:27:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47WnB34pf2zB09ZM;
 Mon,  9 Dec 2019 16:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575905243; bh=p/RN9wGhuytc2JKpwnOpBoY/ljEFeRGohPJvKHyg07M=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=d6D8SuoxckLsdzpD0AWfxhXZIVE4gghHlWtwmYhJDcMFkRIF+4Fb6oK94X1MbY4om
 9sHCkvrEZl+6IphLA+ch0Ra/EpGDmI/6hhPI+R1OnoIIegBMWbQ8N9tXj4dnD2mEWn
 DUfshjKINhnclytEX7xgdk05MMY6qXbgMy7DLE8Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D37D48B7C5;
 Mon,  9 Dec 2019 16:27:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZY9SOqlNrzzs; Mon,  9 Dec 2019 16:27:28 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E6FB8B7F2;
 Mon,  9 Dec 2019 16:27:28 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 715D563739; Mon,  9 Dec 2019 15:27:28 +0000 (UTC)
Message-Id: <8d8d893816724a4a69a21434162a589fa1eb5f39.1575905123.git.christophe.leroy@c-s.fr>
In-Reply-To: <518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr>
References: <518cfb83347d5372748e7fe72f94e2e9443d0d4a.1575905123.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] spi: fsl: simplify error path in of_fsl_spi_probe()
To: Mark Brown <broonie@kernel.org>
Date: Mon,  9 Dec 2019 15:27:28 +0000 (UTC)
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

No need to 'goto err;' for just doing a return.
return directly from where the error happens.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/spi/spi-fsl-spi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 2d85c81983b1..e991c6ff4e7a 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -725,8 +725,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	struct device_node *np = ofdev->dev.of_node;
 	struct spi_master *master;
 	struct resource mem;
-	int irq = 0, type;
-	int ret = -ENOMEM;
+	int irq, type;
+	int ret;
 
 	ret = of_mpc8xxx_spi_probe(ofdev);
 	if (ret)
@@ -741,10 +741,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 
 		if (spisel_boot) {
 			pinfo->immr_spi_cs = ioremap(get_immrbase() + IMMR_SPI_CS_OFFSET, 4);
-			if (!pinfo->immr_spi_cs) {
-				ret = -ENOMEM;
-				goto err;
-			}
+			if (!pinfo->immr_spi_cs)
+				return -ENOMEM;
 		}
 #endif
 		/*
@@ -763,24 +761,17 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 
 	ret = of_address_to_resource(np, 0, &mem);
 	if (ret)
-		goto err;
+		return ret;
 
 	irq = of_irq_to_resource(np, 0, NULL);
-	if (irq <= 0) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (irq <= 0)
+		return -EINVAL;
 
 	master = fsl_spi_probe(dev, &mem, irq);
-	if (IS_ERR(master)) {
-		ret = PTR_ERR(master);
-		goto err;
-	}
+	if (IS_ERR(master))
+		return PTR_ERR(master);
 
 	return 0;
-
-err:
-	return ret;
 }
 
 static int of_fsl_spi_remove(struct platform_device *ofdev)
-- 
2.13.3

