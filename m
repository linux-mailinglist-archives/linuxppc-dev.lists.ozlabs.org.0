Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94087B0FC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 15:26:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TffZ2xrVzF4PX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 23:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KiF7jdV2"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TfbB5WLlzF4P8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 23:23:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Tfb303vKz9txv7;
 Thu, 12 Sep 2019 15:22:55 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KiF7jdV2; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3l9hidgtpDqN; Thu, 12 Sep 2019 15:22:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Tfb265vvz9txv6;
 Thu, 12 Sep 2019 15:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568294574; bh=GWQvbjCjgyL+nAOZxJ2VN1zz+9BZT/jEtfKDn8v4Dp0=;
 h=From:Subject:To:Cc:Date:From;
 b=KiF7jdV2ipOuWwvY7Wt9aFx1d7OAGmhXmUORNCcxTXSnCXjYHJ/uSqb6famBvVFKg
 SDWv/GSNcmQeHwX0Y25MBZ1Iu/XzI1eYJsLRMGRcGp4Ns1m0jvnsuMMLDZNlLhN1OK
 Bo56jpmm70Dc4WZNp99O/GNhf7pxT2NDDtLu8bPI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 59C008B933;
 Thu, 12 Sep 2019 15:22:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zQArg0OTCtUj; Thu, 12 Sep 2019 15:22:56 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D99268B921;
 Thu, 12 Sep 2019 15:22:55 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4AFF06B736; Thu, 12 Sep 2019 13:22:55 +0000 (UTC)
Message-Id: <c27168ef054f3a52edcf0ff91652700d53b3e32d.1568294563.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: add __init to cpm1 init functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 12 Sep 2019 13:22:55 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functions cpm1_clk_setup(), cpm1_set_pin(), cpm_pic_init() and
mpc8xx_pic_init() are only called from __init functions, so mark
them __init as well.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/platforms/8xx/cpm1.c | 10 +++++-----
 arch/powerpc/platforms/8xx/pic.c  |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/8xx/cpm1.c b/arch/powerpc/platforms/8xx/cpm1.c
index 8b8c30dad87f..5a47b3ead01a 100644
--- a/arch/powerpc/platforms/8xx/cpm1.c
+++ b/arch/powerpc/platforms/8xx/cpm1.c
@@ -130,7 +130,7 @@ static const struct irq_domain_ops cpm_pic_host_ops = {
 	.map = cpm_pic_host_map,
 };
 
-unsigned int cpm_pic_init(void)
+unsigned int __init cpm_pic_init(void)
 {
 	struct device_node *np = NULL;
 	struct resource res;
@@ -312,7 +312,7 @@ struct cpm_ioport32e {
 	__be32 dir, par, sor, odr, dat;
 };
 
-static void cpm1_set_pin32(int port, int pin, int flags)
+static void __init cpm1_set_pin32(int port, int pin, int flags)
 {
 	struct cpm_ioport32e __iomem *iop;
 	pin = 1 << (31 - pin);
@@ -354,7 +354,7 @@ static void cpm1_set_pin32(int port, int pin, int flags)
 	}
 }
 
-static void cpm1_set_pin16(int port, int pin, int flags)
+static void __init cpm1_set_pin16(int port, int pin, int flags)
 {
 	struct cpm_ioport16 __iomem *iop =
 		(struct cpm_ioport16 __iomem *)&mpc8xx_immr->im_ioport;
@@ -392,7 +392,7 @@ static void cpm1_set_pin16(int port, int pin, int flags)
 	}
 }
 
-void cpm1_set_pin(enum cpm_port port, int pin, int flags)
+void __init cpm1_set_pin(enum cpm_port port, int pin, int flags)
 {
 	if (port == CPM_PORTB || port == CPM_PORTE)
 		cpm1_set_pin32(port, pin, flags);
@@ -400,7 +400,7 @@ void cpm1_set_pin(enum cpm_port port, int pin, int flags)
 		cpm1_set_pin16(port, pin, flags);
 }
 
-int cpm1_clk_setup(enum cpm_clk_target target, int clock, int mode)
+int __init cpm1_clk_setup(enum cpm_clk_target target, int clock, int mode)
 {
 	int shift;
 	int i, bits = 0;
diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
index e9617d35fd1f..f2ba837249d6 100644
--- a/arch/powerpc/platforms/8xx/pic.c
+++ b/arch/powerpc/platforms/8xx/pic.c
@@ -125,7 +125,7 @@ static const struct irq_domain_ops mpc8xx_pic_host_ops = {
 	.xlate = mpc8xx_pic_host_xlate,
 };
 
-int mpc8xx_pic_init(void)
+int __init mpc8xx_pic_init(void)
 {
 	struct resource res;
 	struct device_node *np;
-- 
2.13.3

