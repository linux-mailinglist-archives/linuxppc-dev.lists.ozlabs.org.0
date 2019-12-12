Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E011D486
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 18:49:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YhBk4V8XzDr3m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 04:49:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="NgtTHc3R"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Yh8Q07j0zDr37
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 04:47:33 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Yh8C4sqGzB09bG;
 Thu, 12 Dec 2019 18:47:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=NgtTHc3R; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dsa5BH8wBHuE; Thu, 12 Dec 2019 18:47:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Yh8C3rMkzB09bF;
 Thu, 12 Dec 2019 18:47:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576172843; bh=yNBKHgBeVhxuEL0twelYE6v4UaF/ILC0FPOkeX1TzhI=;
 h=From:Subject:To:Cc:Date:From;
 b=NgtTHc3RoPnk0WOUnDHCn1qWnYvwBy/PaSWrc/aFMok2oo8B+TruqZ2Xv7knjF0yf
 T83Kl0sTcwMq+qOxRbc/QxTKdn8WUkTWU14m1pha5dl+4z0Gzcvr/664ddk/qCl1OF
 9Uud/OFNogCZcmsXZZvFgp7HBwlTCt1MzBo8nqWk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39F3D8B87A;
 Thu, 12 Dec 2019 18:47:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5kIYfMYKMeKa; Thu, 12 Dec 2019 18:47:25 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.112])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 14D2D8B872;
 Thu, 12 Dec 2019 18:47:25 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DB5E063743; Thu, 12 Dec 2019 17:47:24 +0000 (UTC)
Message-Id: <091a277fd0b3356dca1e29858c1c96983fc9cb25.1576172743.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] spi: fsl: use platform_get_irq() instead of
 of_irq_to_resource()
To: Mark Brown <broonie@kernel.org>
Date: Thu, 12 Dec 2019 17:47:24 +0000 (UTC)
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

Unlike irq_of_parse_and_map() which has a dummy definition on SPARC,
of_irq_to_resource() hasn't.

But as platform_get_irq() can be used instead and is generic, use it.

Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Mark Brown <broonie@kernel.org>
Fixes: 	3194d2533eff ("spi: fsl: don't map irq during probe")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/spi/spi-fsl-spi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 2d85c81983b1..c76128cadf0c 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -765,9 +765,9 @@ static int of_fsl_spi_probe(struct platform_device *ofdev)
 	if (ret)
 		goto err;
 
-	irq = of_irq_to_resource(np, 0, NULL);
-	if (irq <= 0) {
-		ret = -EINVAL;
+	irq = platform_get_irq(ofdev, 0);
+	if (irq < 0) {
+		ret = irq;
 		goto err;
 	}
 
-- 
2.13.3

