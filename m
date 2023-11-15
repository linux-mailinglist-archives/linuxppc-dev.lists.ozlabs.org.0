Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17C7EC670
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 15:56:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ds8aX/2a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVmSp0JSJz3vn0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 01:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Ds8aX/2a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVm735Nr6z3dB5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 01:40:47 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7CB69FF80F;
	Wed, 15 Nov 2023 14:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700059245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrONI359XUSSSWTsnWUC/Z1/MsIumk+sm8QSdIX4Vog=;
	b=Ds8aX/2a4PMrNHcZ+hZiG2CINeOYjj0nhkqc+0vCCY6jFcp41C3rsrXPhbVkfpXxizM8nh
	U3j5dxMwkF7ZrqWoZsAa8zNMmFLPYPWekTtIEUt2YRMCc02tvFfjrVVaGyb11s9puxPUZK
	ufefZrvXJ57QOSaBKRgMhxnuyO30UOcHAU14LAPCJwJa0QAh8OF0eQseECYjhXg0zptmOc
	NUb/OdniA74XMzW5FyZImjfbGCYzJ5hwRQaQHdYsayWRxWQxcEjkEqpuENJLolhM244OEN
	d51HlfTvWUcNAivSFL/Vm85YXgGHcvS9ohMtuD+sCAMsbPVCui1g3pxm/hqJGw==
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
Subject: [PATCH v9 18/27] soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
Date: Wed, 15 Nov 2023 15:39:54 +0100
Message-ID: <20231115144007.478111-19-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
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

Timeslots setting is done at channel start() and stop().
There is no more need to do that during setup_chan().

Simply remove timeslot setting from setup_chan().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e56aea5803bf..73903ce31695 100644
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

