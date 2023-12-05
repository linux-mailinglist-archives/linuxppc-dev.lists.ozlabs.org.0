Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F4805894
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:25:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bPHz/aVw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl49b0yVJz3dJ9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 02:25:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bPHz/aVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl44x4L2Qz3cVr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 02:21:36 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3195C40013;
	Tue,  5 Dec 2023 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fr/+FFqEM69Z2xWv6TIr9xG1wPePBXpVB6jujvPjf7w=;
	b=bPHz/aVwC/l9kXBOINLG0e+ZPXA9XHiKjq0rnAjQ2+3dlqMaRErm0OukHPYatzh1mF5cuT
	xUOWmmJvUJcMfn0vtmLYO7kmuYgxcR9gL5qj3GfUHzOZdBfBA9n5zsgQzY2OHZ+9PaXB5l
	3NHkcCug1z3oVRxFjDCsWNUHEDRomYRB2+/ExIpGqEyIiNOfxwzJimFlw2p52LZ3517Zoy
	lgV6itCytQqdL+PVPuZat9ohMt+yiEqmAOxnYfAJXzLbd2XiWwWFFUoEE0jKg13qzMUQXp
	JLqNpqH1Ni6iD9zqObm+BzheDazJbmyHYobb7VddhIXrGjEu7bpDfVNDhw0Gew==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 05/17] soc: fsl: cpm1: qmc: Remove inline function specifiers
Date: Tue,  5 Dec 2023 16:21:02 +0100
Message-ID: <20231205152116.122512-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The inline function specifier is present on some functions but it is
better to let the compiler decide inlining or not these functions.

Remove inline specifiers.

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 4b4832d93c9b..27f2f16deac9 100644
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
2.43.0

