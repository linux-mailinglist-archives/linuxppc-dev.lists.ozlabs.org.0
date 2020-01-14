Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDB713AE63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:07:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xwM95SmxzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 03:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=S+UxuITg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xwGF0VsQzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 03:02:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xwG81WBfz9txb0;
 Tue, 14 Jan 2020 17:02:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=S+UxuITg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HgM0nnBSpLFA; Tue, 14 Jan 2020 17:02:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xwG80TLSz9txZy;
 Tue, 14 Jan 2020 17:02:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579017760; bh=xN6Ppzc+LMdYKzWDRSnBwvud8ZwuGgv8OWrBjgrESDM=;
 h=From:Subject:To:Cc:Date:From;
 b=S+UxuITgoSpswC3s5breEl/xE6gr4caOs/HbwtLch+p5VEZn8GzhzsaBErtCt1hX3
 qUXPik8yymwHIWSN4FxUjdVGUoP1K+AsYCo7/u95BIdeCQLIZIqLal4B1IMU18hGt9
 LbuL4FPLuiL/eYmNtFXvpt48S6PCnqDM4OzpCwBg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E11D8B7EC;
 Tue, 14 Jan 2020 17:02:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zw9swoOyGvDa; Tue, 14 Jan 2020 17:02:41 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FE008B7E8;
 Tue, 14 Jan 2020 17:02:41 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F152C6381B; Tue, 14 Jan 2020 16:02:40 +0000 (UTC)
Message-Id: <2a4a7e11b37cfa0558d68f0d35e90d6da858b059.1579017697.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3] spi: fsl: simplify error path in of_fsl_spi_probe()
To: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Jan 2020 16:02:40 +0000 (UTC)
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

No need to 'goto err;' for just doing a return.
return directly from where the error happens.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v3: rebase on today's spi/for-next and using PTR_ERR_OR_ZERO() in one place.
---
 drivers/spi/spi-fsl-spi.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index fb4159ad6bf6..3b81772fea0d 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -706,8 +706,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	struct device_node *np = ofdev->dev.of_node;
 	struct spi_master *master;
 	struct resource mem;
-	int irq = 0, type;
-	int ret = -ENOMEM;
+	int irq, type;
+	int ret;
 
 	ret = of_mpc8xxx_spi_probe(ofdev);
 	if (ret)
@@ -722,10 +722,8 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 
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
@@ -744,24 +742,15 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 
 	ret = of_address_to_resource(np, 0, &mem);
 	if (ret)
-		goto err;
+		return ret;
 
 	irq = platform_get_irq(ofdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto err;
-	}
+	if (irq < 0)
+		return irq;
 
 	master = fsl_spi_probe(dev, &mem, irq);
-	if (IS_ERR(master)) {
-		ret = PTR_ERR(master);
-		goto err;
-	}
-
-	return 0;
 
-err:
-	return ret;
+	return PTR_ERR_OR_ZERO(master);
 }
 
 static int of_fsl_spi_remove(struct platform_device *ofdev)
-- 
2.13.3

