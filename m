Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA42776180
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:45:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=B2eJjBrD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLWX04r1kz3cQP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=B2eJjBrD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLW9D15Vtz3c5Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 23:28:47 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 6B80D40014;
	Wed,  9 Aug 2023 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691587725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKoPv036RC0ux4I34NtLKPGM96CkWE1vmgdCaUi+1T0=;
	b=B2eJjBrDGWvPQpVXcbWXnlqYO0UN/zSBJaeSfKt/DOEq825FH6369L/vg1mXWt/dpQwxp2
	3msa0SNzFxSPp3AQnv6fgpM8tej0z3Tr4Hi59w/eF6iUY0n7lFnTRZ8qTkZvaoi4tNhPkv
	4zATom48wbuKKCY9xVf3wyasqy2T2KiIatlL6Xe48atCZx3oBovEkIeq9plrcD7cKQJMfC
	g6n82T/2qAY3acPNbyjoOymYvZhPX2IANgHUnzu7/+1VkrpvHrLqrrT8YX391qCWH7sqsu
	VGfj8eb3eUlnWY4si/j11ylF9rWLSPhG+p+Xd1B/ZuSEhmuA2axkQMTlDxrRVg==
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
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v3 18/28] soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
Date: Wed,  9 Aug 2023 15:27:45 +0200
Message-ID: <20230809132757.2470544-19-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809132757.2470544-1-herve.codina@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Timeslots setting is done at channel start() and stop().
There is no more need to do that during setup_chan().

Simply remove timeslot setting from setup_chan().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 00408da14cb4..b67e73ad7c1a 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -723,30 +723,6 @@ static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
 	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
 }
 
-static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
-{
-	struct tsa_serial_info info;
-	int ret;
-
-	/* Retrieve info from the TSA related serial */
-	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
-	if (ret)
-		return ret;
-
-	/*
-	 * Setup one common 64 entries table or two 32 entries (one for Tx
-	 * and one for Tx) according to assigned TS numbers.
-	 */
-	if (chan->qmc->is_tsa_64rxtx)
-		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
-
-	ret = qmc_chan_setup_tsa_32rx(chan, &info, enable);
-	if (ret)
-		return ret;
-
-	return qmc_chan_setup_tsa_32tx(chan, &info, enable);
-}
-
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
 {
 	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
@@ -1323,10 +1299,6 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
-	ret = qmc_chan_setup_tsa(chan, true);
-	if (ret)
-		return ret;
-
 	/* Set channel specific parameter base address */
 	chan->s_param = qmc->dpram + (chan->id * 64);
 	/* 16 bd per channel (8 rx and 8 tx) */
-- 
2.41.0

