Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EBA21265
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 05:10:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454tbH4GWmzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 13:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.5.65; helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="D+8wIcsJ"; 
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50065.outbound.protection.outlook.com [40.107.5.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454tYl5PlSzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 13:09:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0FuCMMzpP/ODHlbwv4mvoBdANto4iRezsdTzITLA1M=;
 b=D+8wIcsJgbRuzBifCHU2ddmWnteXWLpoG0ybWKwGdV26T62Qgsmj5Vcp2lET6MIAW+h5XGmay/lzmjNtZgW/Wq3JELu6jMQx8DpO+cD9ix5BatpwnuvAhrQc421Fl8ZmECnjepBWiH0cmpueY7HzkbdYF2l92TBmxLNbXc0KEP8=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6462.eurprd04.prod.outlook.com (20.179.233.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 03:09:22 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:09:22 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Thread-Topic: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Thread-Index: AQHVDF3seZkwEu4He0GObjqY7EqttQ==
Date: Fri, 17 May 2019 03:09:22 +0000
Message-ID: <20190517030903.25731-1-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d02c888d-3473-45fe-839a-08d6da750f23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6462; 
x-ms-traffictypediagnostic: VE1PR04MB6462:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB6462A0508F4A258D203150ACE30B0@VE1PR04MB6462.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:132;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(136003)(39860400002)(199004)(189003)(71200400001)(110136005)(71190400001)(2501003)(52116002)(50226002)(81166006)(8936002)(102836004)(8676002)(54906003)(316002)(6506007)(386003)(81156014)(6512007)(6306002)(305945005)(7736002)(6116002)(99286004)(3846002)(6436002)(4326008)(25786009)(186003)(5660300002)(66476007)(2201001)(36756003)(53936002)(86362001)(68736007)(66446008)(66556008)(64756008)(66946007)(73956011)(14454004)(486006)(2616005)(476003)(14444005)(256004)(478600001)(26005)(66066001)(6486002)(2906002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6462;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yXPrYiIHXB7h/ihjvVjo49a3Sur5qGkFD4mFCZpPhJamuEUCj3eYLvH+35mZqi7Ke121MpEGOxnrRBIKCB6i1cOIW0xAkUjcdRKtBPGcMuin87icz40H358rBm1TMCLqwWXUpq3zcaftOAsTEvQZIVHl3dtXxcXxuNgZJzKy4zFMOxefRV4eDqtd7nT4JIKXOecDkaZKUfG2zO2OpAGsFq8c9NME2OEulNoTgk946fSY5QnGAbIx6b2cLcwqva+6siK2rAgSI8TLu1ZIlnMH0wRGgzQlhlZK6rYNxjkQONTBr9hls5pvagKdTU4QKWchIQz+c/eRE5fTckux96m22Hz6aPWrPtSsyaRcvEydflNac2DxbaK5XO+rZxF9xUjpxPh0j4Id6waTDtJ6XffuNtwHbHaZfbetSn9g68kqkt0=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CD952D0B5BE728489F6FFD2DDF2D3DA2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02c888d-3473-45fe-839a-08d6da750f23
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:09:22.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6462
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is chip errata ERR008000, the reference doc is
(https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),

The issue is "While using ESAI transmit or receive and
an underrun/overrun happens, channel swap may occur.
The only recovery mechanism is to reset the ESAI."

In this commit add a tasklet to handle reset of ESAI
after xrun happens

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 166 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..149972894c95 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -52,17 +52,20 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
+	struct tasklet_struct task;
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
 	u32 tx_mask;
 	u32 rx_mask;
+	u32 tx_channels;
 	u32 hck_rate[2];
 	u32 sck_rate[2];
 	bool hck_dir[2];
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
+	bool reset_at_xrun;
 	char name[32];
 };
=20
@@ -71,8 +74,14 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	struct fsl_esai *esai_priv =3D (struct fsl_esai *)devid;
 	struct platform_device *pdev =3D esai_priv->pdev;
 	u32 esr;
+	u32 saisr;
=20
 	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE))
+		&& esai_priv->reset_at_xrun)
+		tasklet_schedule(&esai_priv->task);
=20
 	if (esr & ESAI_ESR_TINIT_MASK)
 		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
@@ -552,6 +561,9 @@ static int fsl_esai_trigger(struct snd_pcm_substream *s=
ubstream, int cmd,
 	u32 pins =3D DIV_ROUND_UP(channels, esai_priv->slots);
 	u32 mask;
=20
+	if (tx)
+		esai_priv->tx_channels =3D channels;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -585,10 +597,16 @@ static int fsl_esai_trigger(struct snd_pcm_substream =
*substream, int cmd,
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
 				   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
=20
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+				   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
+
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+				   ESAI_xCR_xEIE_MASK, 0);
+
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
 				   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
@@ -618,6 +636,145 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops =
=3D {
 	.set_tdm_slot =3D fsl_esai_set_dai_tdm_slot,
 };
=20
+static void fsl_esai_reset(unsigned long arg)
+{
+	struct fsl_esai *esai_priv =3D (struct fsl_esai *)arg;
+	u32 saisr;
+	u32 tsma, tsmb, rsma, rsmb, tcr, rcr, tfcr, rfcr;
+	int i;
+
+	/*
+	 * stop the tx & rx
+	 */
+	regmap_read(esai_priv->regmap, REG_ESAI_TSMA, &tsma);
+	regmap_read(esai_priv->regmap, REG_ESAI_TSMB, &tsmb);
+	regmap_read(esai_priv->regmap, REG_ESAI_RSMA, &rsma);
+	regmap_read(esai_priv->regmap, REG_ESAI_RSMB, &rsmb);
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TCR, &tcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RCR, &rcr);
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xEIE_MASK | ESAI_xCR_TE_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xEIE_MASK | ESAI_xCR_RE_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
+				ESAI_xSMA_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
+				ESAI_xSMB_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
+				ESAI_xSMA_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
+				ESAI_xSMB_xS_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR, 0);
+
+	/*
+	 * reset the esai, and restore the registers
+	 */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				ESAI_ECR_ESAIEN | ESAI_ECR_ERST);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				ESAI_ECR_ESAIEN);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xPR_MASK,
+				ESAI_xCR_xPR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xPR_MASK,
+				ESAI_xCR_xPR);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+				ESAI_PRRC_PDC_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+				ESAI_PCRC_PC_MASK, 0);
+
+	/*
+	 * Add fifo reset here, because the regcache_sync will
+	 * write one more data to ETDR.
+	 * Which will cause channel shift.
+	 */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
+
+	regcache_mark_dirty(esai_priv->regmap);
+	regcache_sync(esai_priv->regmap);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xPR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xPR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+				ESAI_PRRC_PDC_MASK,
+				ESAI_PRRC_PDC(ESAI_GPIO));
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+				ESAI_PCRC_PC_MASK,
+				ESAI_PCRC_PC(ESAI_GPIO));
+
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	/*
+	 * restart tx / rx, if they already enabled
+	 */
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFEN_MASK, tfcr & ESAI_xFCR_xFEN);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFEN_MASK, rfcr & ESAI_xFCR_xFEN);
+
+	/* Write initial words reqiured by ESAI as normal procedure */
+	for (i =3D 0; i < esai_priv->tx_channels; i++)
+		regmap_write(esai_priv->regmap, REG_ESAI_ETDR, 0x0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_TE_MASK,
+				ESAI_xCR_TE_MASK & tcr);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_RE_MASK,
+				ESAI_xCR_RE_MASK & rcr);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
+				ESAI_xSMB_xS_MASK,
+				ESAI_xSMB_xS_MASK & tsmb);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
+				ESAI_xSMA_xS_MASK,
+				ESAI_xSMA_xS_MASK & tsma);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
+				ESAI_xSMB_xS_MASK,
+				ESAI_xSMB_xS_MASK & rsmb);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
+				ESAI_xSMA_xS_MASK,
+				ESAI_xSMA_xS_MASK & rsma);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & tcr);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & rcr);
+}
+
 static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv =3D snd_soc_dai_get_drvdata(dai);
@@ -787,6 +944,10 @@ static int fsl_esai_probe(struct platform_device *pdev=
)
 	esai_priv->pdev =3D pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
=20
+	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
+	    of_device_is_compatible(np, "fsl,imx35-esai"))
+		esai_priv->reset_at_xrun =3D true;
+
 	/* Get the addresses and IRQ */
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs =3D devm_ioremap_resource(&pdev->dev, res);
@@ -899,6 +1060,8 @@ static int fsl_esai_probe(struct platform_device *pdev=
)
 		return ret;
 	}
=20
+	tasklet_init(&esai_priv->task, fsl_esai_reset, (unsigned long)esai_priv);
+
 	pm_runtime_enable(&pdev->dev);
=20
 	regcache_cache_only(esai_priv->regmap, true);
@@ -912,7 +1075,10 @@ static int fsl_esai_probe(struct platform_device *pde=
v)
=20
 static int fsl_esai_remove(struct platform_device *pdev)
 {
+	struct fsl_esai *esai_priv =3D platform_get_drvdata(pdev);
+
 	pm_runtime_disable(&pdev->dev);
+	tasklet_kill(&esai_priv->task);
=20
 	return 0;
 }
--=20
2.21.0

