Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD87B13CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:07:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kBn8KKVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx4Lh6FW3z3cb4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kBn8KKVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx4Kq3Nl9z3bP4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:07:10 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2B2272000A;
	Thu, 28 Sep 2023 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+RB2ITbfqKP6mO7lXP9MlFfW3RztOHoR8uJSPHnXIA=;
	b=kBn8KKVWRt6Su9WLKqr7PygD7rtl5q9DnOvm52upIFF1kzZSvOUo21kTOPgSX+vR+irwl1
	f9pe1jdzcypO7aNuY+AYlDIL6xwgfx+N/N08VR+qNd/1fkpUJpwuUdi1phBS3toHzU0y+b
	2kd1TPjzrfeOeTWBDXDZpSWZpF9eR7iyp6gmwISbPbQ0nCyCcY3GEnX0kc0TwT3hsgPds1
	tmv70GoSpCOBRMNG0VFATDvLxWmA7Ok06N7hdisCg0iQS1nwuKiYXhVcVCjNzFNgqsxbvB
	bMPKKDGY7TIL0vSJHYhIQpdixzUgR0WEsZR67oPxkYNvYDREbZuNA9URXQrKgw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 01/30] soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
Date: Thu, 28 Sep 2023 09:06:19 +0200
Message-ID: <20230928070652.330429-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running sparse (make C=1) on tsa.c raises a lot of warning such as:
  --- 8< ---
  warning: incorrect type in assignment (different address spaces)
     expected void *[noderef] si_regs
     got void [noderef] __iomem *
  --- 8< ---

Indeed, some variable were declared 'type *__iomem var' instead of
'type __iomem *var'.

Use the correct declaration to remove these warnings.

Fixes: 1d4ba0b81c1c ("soc: fsl: cpm1: Add support for TSA")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/tsa.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index 3646153117b3..e0527b9efd05 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -98,9 +98,9 @@
 #define TSA_SIRP	0x10
 
 struct tsa_entries_area {
-	void *__iomem entries_start;
-	void *__iomem entries_next;
-	void *__iomem last_entry;
+	void __iomem *entries_start;
+	void __iomem *entries_next;
+	void __iomem *last_entry;
 };
 
 struct tsa_tdm {
@@ -117,8 +117,8 @@ struct tsa_tdm {
 
 struct tsa {
 	struct device *dev;
-	void *__iomem si_regs;
-	void *__iomem si_ram;
+	void __iomem *si_regs;
+	void __iomem *si_ram;
 	resource_size_t si_ram_sz;
 	spinlock_t	lock;
 	int tdms; /* TSA_TDMx ORed */
@@ -135,27 +135,27 @@ static inline struct tsa *tsa_serial_get_tsa(struct tsa_serial *tsa_serial)
 	return container_of(tsa_serial, struct tsa, serials[tsa_serial->id]);
 }
 
-static inline void tsa_write32(void *__iomem addr, u32 val)
+static inline void tsa_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
 }
 
-static inline void tsa_write8(void *__iomem addr, u32 val)
+static inline void tsa_write8(void __iomem *addr, u32 val)
 {
 	iowrite8(val, addr);
 }
 
-static inline u32 tsa_read32(void *__iomem addr)
+static inline u32 tsa_read32(void __iomem *addr)
 {
 	return ioread32be(addr);
 }
 
-static inline void tsa_clrbits32(void *__iomem addr, u32 clr)
+static inline void tsa_clrbits32(void __iomem *addr, u32 clr)
 {
 	tsa_write32(addr, tsa_read32(addr) & ~clr);
 }
 
-static inline void tsa_clrsetbits32(void *__iomem addr, u32 clr, u32 set)
+static inline void tsa_clrsetbits32(void __iomem *addr, u32 clr, u32 set)
 {
 	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
 }
@@ -313,7 +313,7 @@ static u32 tsa_serial_id2csel(struct tsa *tsa, u32 serial_id)
 static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
 			 u32 count, u32 serial_id)
 {
-	void *__iomem addr;
+	void __iomem *addr;
 	u32 left;
 	u32 val;
 	u32 cnt;
-- 
2.41.0

