Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE687810B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS74957dqz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS70G1S3Cz3ckw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:40:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6zq0k5bz9vhr;
	Fri, 18 Aug 2023 18:40:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3sU6JfKIHrC; Fri, 18 Aug 2023 18:40:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6zl1B1vz9vhJ;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F1E78B763;
	Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WAQGydDBpqb7; Fri, 18 Aug 2023 18:40:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CC5C8B774;
	Fri, 18 Aug 2023 18:40:01 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGduIu141961
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:39:56 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGduB3141960;
	Fri, 18 Aug 2023 18:39:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 05/28] soc: fsl: cpm1: qmc: Remove inline function specifiers
Date: Fri, 18 Aug 2023 18:38:59 +0200
Message-ID: <5e4f6d8ae6c6f4e51fdc8d6b8cdbdd42bbdbfcf9.1692376361.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692376360.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692376734; l=1927; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=kk1Ixhq/BCVZyT9VsSP1IQf1Jw/ahn3zn+6m9m/YV/k=; b=M13QAt9aKgtJFw7MZl2TkKG6g2k3N0uDUJTk2EdWY9JLBRDZmNcT9oDY3wzhySPbXAyFxNXoY x7esQx7fdcsCaW8Ax7sFVrnxgjZrj6JI8RD7HBT011D+N3DB98fNoye
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Herve Codina <herve.codina@bootlin.com>

The inline function specifier is present on some functions but it is
better to let the compiler decide inlining or not these functions.

Remove inline specifiers.

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 2d2a9d88ba6c..459e0bbd723d 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -218,37 +218,37 @@ struct qmc {
 	struct qmc_chan *chans[64];
 };
 
-static inline void qmc_write16(void __iomem *addr, u16 val)
+static void qmc_write16(void __iomem *addr, u16 val)
 {
 	iowrite16be(val, addr);
 }
 
-static inline u16 qmc_read16(void __iomem *addr)
+static u16 qmc_read16(void __iomem *addr)
 {
 	return ioread16be(addr);
 }
 
-static inline void qmc_setbits16(void __iomem *addr, u16 set)
+static void qmc_setbits16(void __iomem *addr, u16 set)
 {
 	qmc_write16(addr, qmc_read16(addr) | set);
 }
 
-static inline void qmc_clrbits16(void __iomem *addr, u16 clr)
+static void qmc_clrbits16(void __iomem *addr, u16 clr)
 {
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
-static inline void qmc_write32(void __iomem *addr, u32 val)
+static void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline u32 qmc_read32(void __iomem *addr)
+static u32 qmc_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void qmc_setbits32(void __iomem *addr, u32 set)
+static void qmc_setbits32(void __iomem *addr, u32 set)
 {
 	qmc_write32(addr, qmc_read32(addr) | set);
 }
-- 
2.41.0

