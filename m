Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F931E892
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:51:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lZl6JyNzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.87; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="qJTwKJck"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lNP5WQ7zDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:42:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrBCJR/pi4l5CwgpA5jeKYkdmYQ/+HUzRLqfZvrCOrs=;
 b=qJTwKJckGQKCYhdxK97k+GjKVaCkF/ppl7h3+lsuMRB8HDWNIjIOD5yqOnrjcg5chBceLf+TdxItHPiyc6k5tFS+IwUTAoVaLHUZuF74Rcnngrv4eUJxRxFNttI0o98PcvSEADIkyyPFS4uVHe7TiIFNe5aF04NbhOdWzwgAwbA=
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com (20.179.253.81) by
 AM0PR04MB4513.eurprd04.prod.outlook.com (52.135.149.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Wed, 15 May 2019 06:42:26 +0000
Received: from AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862]) by AM0PR04MB6468.eurprd04.prod.outlook.com
 ([fe80::659b:59f5:6a7e:1862%5]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 06:42:26 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V6 3/3] ASoC: fsl_asrc: Unify the supported input and
 output rate
Thread-Topic: [PATCH RESEND V6 3/3] ASoC: fsl_asrc: Unify the supported input
 and output rate
Thread-Index: AQHVCulbnhsXIguBqEy1UhZj9WFJCA==
Date: Wed, 15 May 2019 06:42:26 +0000
Message-ID: <39916109c570791be514db4a3a7793a9467d6484.1557901312.git.shengjiu.wang@nxp.com>
References: <cover.1557901312.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1557901312.git.shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To AM0PR04MB6468.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 685db196-e528-402b-df45-08d6d9007e2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB4513; 
x-ms-traffictypediagnostic: AM0PR04MB4513:
x-microsoft-antispam-prvs: <AM0PR04MB4513E8A90C5CEE5F9FB2BBA3E3090@AM0PR04MB4513.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(14454004)(19627235002)(26005)(71200400001)(71190400001)(110136005)(52116002)(54906003)(14444005)(256004)(5660300002)(316002)(3846002)(102836004)(68736007)(66946007)(73956011)(2906002)(64756008)(66556008)(66476007)(66446008)(476003)(186003)(76176011)(486006)(8936002)(81166006)(6512007)(8676002)(6486002)(2616005)(81156014)(50226002)(66066001)(4326008)(7736002)(11346002)(305945005)(6436002)(6116002)(36756003)(446003)(25786009)(6506007)(386003)(99286004)(2501003)(53936002)(86362001)(2201001)(118296001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4513;
 H:AM0PR04MB6468.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LXkL7SIfJ0ns2doBVUrp3zZDYVTy56sFGRZEXPNYSNqKUwFDPZJdQsIL/JI9y9yxlUpLrvEGpIM3gkFH397tBT1AMKIAx0KWJntzkv02ZxRxRPaZ+TUYIPG6hqf7nRomyQcXPE8q11d8wxb8BB6qy4I26zXTmlRh9QRWq4Qts7CH1wEFFiF0r3oOTQO8J5Vzo2aF+kmPrLZJoMYLNQPpRa48XTzPkSLL7wVP0jKI7C45vmo9stUzqBaQddENBZeKQoSAj6gJlLfvdIerTnp9LBmoEh4Kx0xrHtUj9wItZP9+n6FpHNDEE1gHbj2e7QILSwmasWZB5jPU1gX0gDNXUbo6FFEsE9jr4fyMNtrX7LDM6PzM0a6TKo3Km/BYAr80+KxR/sfc3sIBpyfT7Z2aBvHDvQWvbf6tHTRZ/jyyDm8=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CAEF29172E4829499F5499A0F3141F40@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685db196-e528-402b-df45-08d6d9007e2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 06:42:26.3465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4513
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

Unify the supported input and output rate, add the
12kHz/24kHz/128kHz to the support list

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index a8d6710f2541..cbbf6257f08a 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -27,13 +27,14 @@
 	dev_dbg(&asrc_priv->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS_=
_)
=20
 /* Corresponding to process_option */
-static int supported_input_rate[] =3D {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200,
-	96000, 176400, 192000,
+static unsigned int supported_asrc_rate[] =3D {
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
+	64000, 88200, 96000, 128000, 176400, 192000,
 };
=20
-static int supported_asrc_rate[] =3D {
-	8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000, 88200, 96000, 1764=
00, 192000,
+static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints =3D {
+	.count =3D ARRAY_SIZE(supported_asrc_rate),
+	.list =3D supported_asrc_rate,
 };
=20
 /**
@@ -293,11 +294,11 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair =
*pair)
 	ideal =3D config->inclk =3D=3D INCLK_NONE;
=20
 	/* Validate input and output sample rates */
-	for (in =3D 0; in < ARRAY_SIZE(supported_input_rate); in++)
-		if (inrate =3D=3D supported_input_rate[in])
+	for (in =3D 0; in < ARRAY_SIZE(supported_asrc_rate); in++)
+		if (inrate =3D=3D supported_asrc_rate[in])
 			break;
=20
-	if (in =3D=3D ARRAY_SIZE(supported_input_rate)) {
+	if (in =3D=3D ARRAY_SIZE(supported_asrc_rate)) {
 		pair_err("unsupported input sample rate: %dHz\n", inrate);
 		return -EINVAL;
 	}
@@ -311,7 +312,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *p=
air)
 		return -EINVAL;
 	}
=20
-	if ((outrate >=3D 8000 && outrate <=3D 30000) &&
+	if ((outrate >=3D 5512 && outrate <=3D 30000) &&
 	    (outrate > 24 * inrate || inrate > 8 * outrate)) {
 		pair_err("exceed supported ratio range [1/24, 8] for \
 				inrate/outrate: %d/%d\n", inrate, outrate);
@@ -486,7 +487,9 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substrea=
m *substream,
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_CHANNELS, 2);
=20
-	return 0;
+
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
=20
 static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
@@ -599,7 +602,6 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
=20
-#define FSL_ASRC_RATES		 SNDRV_PCM_RATE_8000_192000
 #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S20_3LE)
@@ -610,14 +612,18 @@ static struct snd_soc_dai_driver fsl_asrc_dai =3D {
 		.stream_name =3D "ASRC-Playback",
 		.channels_min =3D 1,
 		.channels_max =3D 10,
-		.rates =3D FSL_ASRC_RATES,
+		.rate_min =3D 5512,
+		.rate_max =3D 192000,
+		.rates =3D SNDRV_PCM_RATE_KNOT,
 		.formats =3D FSL_ASRC_FORMATS,
 	},
 	.capture =3D {
 		.stream_name =3D "ASRC-Capture",
 		.channels_min =3D 1,
 		.channels_max =3D 10,
-		.rates =3D FSL_ASRC_RATES,
+		.rate_min =3D 5512,
+		.rate_max =3D 192000,
+		.rates =3D SNDRV_PCM_RATE_KNOT,
 		.formats =3D FSL_ASRC_FORMATS,
 	},
 	.ops =3D &fsl_asrc_dai_ops,
--=20
2.21.0

