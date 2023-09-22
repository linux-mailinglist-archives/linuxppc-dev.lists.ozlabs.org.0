Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5E7AAC7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:22:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=n6RYVylW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQHD2Tgcz3hRg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:22:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=n6RYVylW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsPpV1ZQ1z3fkH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:00:49 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1B16E1BF210;
	Fri, 22 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695369647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6uqdKgSiDG4ViV4ixZAwBWMC5+BSFyshQvmKaykUU3o=;
	b=n6RYVylW9RwbxEqr/ODDkqMhTKxitspYSg5+usU6ePO9+bSQtuusVQswoXi1IMxCLsbqrm
	O1Ht/rBsicQY7vD/0sFfA85+xncfm4JYjIBZG2pa4hLsEvqDwUnLKwCuFpuYVzij5cyXbz
	dnF1vdCtBZ5x802Th4oBl/o1borNuBw9SjV3rAHIc7gJo+L37+eA+4pSi0rCxQEtx8TVfm
	sz7RKCH1k+hHMKli7Bc864HlCQqmV9LxCNcy/hNWrDkelKA6ZCq+oBUCuPd991LDKcDYcl
	NMvz9MJveBT7oAtremxd5f6Vlbs/W4t5FcRoakDsX+lz0LZ3TSqZ6oIY92c3+Q==
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
Subject: [PATCH v6 21/30] soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
Date: Fri, 22 Sep 2023 09:58:56 +0200
Message-ID: <20230922075913.422435-22-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
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
index 185e6e87a83f..b63b54ec0a3a 100644
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

