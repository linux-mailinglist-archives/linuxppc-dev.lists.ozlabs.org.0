Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82537A92CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 10:49:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=o85cVxyV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrpx33Tqkz3cMW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 18:49:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.a=rsa-sha256 header.s=selector1 header.b=o85cVxyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bang-olufsen.dk (client-ip=2a01:111:f400:7d00::705; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=emas@bang-olufsen.dk; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20705.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrpw85Vlgz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 18:48:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMvYVEBnrHVPniP5jiugv7rCFf5PrmvQIGms5MfsrCpwtcCJFkLtYgtGcrooaVZhnTtvh9afoSaBu5Hg48FfDM7WECHHU+R5oUGdFb/JH3a60hWfqZRkystNYcbXTc0uTMxUhlcQHfOFhFVrjCVTWfxd/iIhEWQHRBbCW7W0etjFfnNrtHArb1fXQtP9/iJRr+YBYbxpEiM4iK5K9x0z+YQNP+v1v09UzIK2tJWqg5a9i7pHPQEvnm38vF44u5VPllnS2L+YoWj6KZUmevdVzzi/cm8sXT7WdmqAwMOEXVa/GI0EeC3GSN34YiFUCpdLoiW5UwjIKLdRZLa+tXhsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktPzSandCF1k+JmGpXOzF4lv/gNJ+ONZHvfH7KB0g34=;
 b=c5Xiq/I3pTg63/TQIlaGRoe1d2yv2B/SfcIKQvdmB0zBPEhuZyNQ3/lRvce3gp6e8eGBxvUe77OomE/q1Z+oi1Cm5fg7HMK9zAcYPr3+NhQAcBOnJKGdt1n9AgoOwyjjJZNIeX3+n7FDDDv7rDcYOayrjWqHsr5zWY/EHKmXBmD+/heibuhCR445m1KI5YwoJ8CxzO1hw/5tqbChHdVhTbJppodULn57WGluh4I/Q6pW0l0VhrBZPB4rMvQZDqB4TP/o++NUz7BxYZXMtk5anV6wx93YmXS31l/fnod3alkCWeVRt6pb+8bDmgMuUzdprKmFv4O+UcbkQt+EIVJ+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktPzSandCF1k+JmGpXOzF4lv/gNJ+ONZHvfH7KB0g34=;
 b=o85cVxyVTRxn5LjxQSid1/z0AtlWM9u3oHECQARI6veV80v2RKcKuDxL66dStsKbDqrRhWKr+zKqxNlig9Ps0taXyd+zehNPRoMkHGWPhenvXD9uW9xIzjBhlLVhYFhJ6c5c7GQkUefJ7SDhb2mVmtcLj4MYrmp0t5ylzctA2n0=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AM9PR03MB7491.eurprd03.prod.outlook.com (2603:10a6:20b:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 08:48:20 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::f713:9ac0:d7f4:81b9]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::f713:9ac0:d7f4:81b9%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 08:48:20 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matus Gajdos
	<matuszpd@gmail.com>
Subject: [PATCH] ASoC: fsl_sai: sw reset consumer on pause/stop
Thread-Topic: [PATCH] ASoC: fsl_sai: sw reset consumer on pause/stop
Thread-Index: AQHZ7GhfBDCmthKGcUygRV9quVAdvA==
Date: Thu, 21 Sep 2023 08:48:20 +0000
Message-ID: <20230921084808.840381-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AM9PR03MB7491:EE_
x-ms-office365-filtering-correlation-id: 488263ba-e8e4-488f-efa9-08dbba7f81c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5ILcAPEGPZXYDPE6agip+cGkF9uKUk18/rJoQnHOfXZGHzckzUK+0qoKMHDO9LP8dvb/ImX2SHBCmcf2bZYs2OhqdFMNMONtwDqxGyu+wPVrXRhDKxQkpr0Z3POjCPmf5bvPKZcV2C+g29piBXegaE12Db4ybu6d7QcYF3TXz9hJIndC46FMnj4xDEYpsf1q9h8dQX/2ie+Al07F+GX3CDFaBEnzsF6+DXWpe4s+dKkbjMw+AXjikV//2rKQRlUy/ODcY5TwavcNH1JeZ8XE/9KcFN/19ogaFaT73ClqZgOJYaXHcQX3eBNWB9bMcgfXrDtS/4HduKwGskL4lFJDikhqGXFe7PIeh0woJaycQgyg/uxOVWdCShbguecSM/tqZBCu0SbeZ2aS/TT0FBBshXq+rDTgR8jaczK+g3LEHz28ig2nJVN8sPbcV9m1ObsdEk8ugzNX9AWmzIVHFRjm6hwn2Cabm6fdTVkQjNYCfYJUSGZzLjhJOi9fkWyfUdd75CSPFLx8+0RLUWse7TGPyGyvwqDOpAYR5ZKk5I79o5vcw8LVvXnC5EjR1ue0EktpDiShhxMgddL6u/y9+0YkiWbogmDpRzv8DKJo7cgoe/zioBHcI9u3GpcfSI6j037Z
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(136003)(376002)(346002)(186009)(451199024)(1800799009)(71200400001)(6512007)(6486002)(6506007)(86362001)(36756003)(122000001)(38070700005)(38100700002)(2906002)(2616005)(7416002)(66446008)(1076003)(478600001)(8976002)(83380400001)(5660300002)(8676002)(66476007)(4326008)(26005)(64756008)(8936002)(91956017)(316002)(110136005)(41300700001)(66556008)(76116006)(66946007)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?6qTTMKNv9DjLMqJYlUy3QlyBpz0cr3uZ2E8FYyTzXKB/HuwDaKnNIIc1Xe?=
 =?iso-8859-1?Q?jRhyBiOX6ZITmJlR/5So5r/j5HHmN38cBeLudK9QmrdOzF/kupV9CXXn1B?=
 =?iso-8859-1?Q?0dvdm3oKQGu+HLGhtI2ac/EPbc8CRkWxpvIy/mxc8yQOo3Tmxmg7j4Ezry?=
 =?iso-8859-1?Q?KtM5h2RKvmWFAGv9RPOMerfttQKBo80c7qZAkUwvoWlCi99fXgRGWENGXs?=
 =?iso-8859-1?Q?jdLh9BACHNYxZLQLcZuumHNKI4nbSP3tiL1pcMsW8ZP33b3YVlePzS9M9Q?=
 =?iso-8859-1?Q?PsyzwQ18GTUzPTV3zgi/gGinpaORVLhou1siwEe4b0DoqVUbcTY9fjqKvT?=
 =?iso-8859-1?Q?yrZB0ML5Bfuihsfswman2y14efI4O484TqLRYI13wKxuNQKEjjyAF4RClm?=
 =?iso-8859-1?Q?46pSUzOCpYhaXcA+SK+Q8HtgHd4gQCPLfAqcMhQmTdxcEYSchEfZIwwcCF?=
 =?iso-8859-1?Q?h3xs07ty1YrZk8pYLi+5gOWHGIRvZ5tqNQof06C7S04+nyoHLzl0hmqnO1?=
 =?iso-8859-1?Q?/BHocNv1edhb8CyaFzNgM74s4HnH1hvhsQqZW0eP+plddKJdlST7Ngclnm?=
 =?iso-8859-1?Q?q1mbthMNl7l3FGS+uhOH2jF7njaaZx6ENHLSGWeozVDKewDrJxHdp5IY5U?=
 =?iso-8859-1?Q?Mbj2zcYac02R1CN7tq5DDCIA3cEgWj0c1PcfswK34d/eaYuNhvaoBSC9Dc?=
 =?iso-8859-1?Q?uUV/g/gFUrgi7seYxHfQVCwuyPM8AgIKRvwUC3voVxr2T+VxHMwIsJYChG?=
 =?iso-8859-1?Q?roGHO12+NMUBxe7Zhb+qgA+dokpXpYOtxA0wIoCx8m+37PXinShWSuFGjQ?=
 =?iso-8859-1?Q?x0T3LHBzTN8FlItdzxjNE/lY1dX/rkAGJnQMMwcgrlY3QL438+csR1abeM?=
 =?iso-8859-1?Q?lRRQFWmId0jA5lxIjDr0LLRx77+C8F3U0aRI1+hcJQezxw1TLLTabXMTqU?=
 =?iso-8859-1?Q?cS1zeR3QgsLzqvRtzGwRr95ICpVp9iEX4erTe3LRyLPAlsZKPUDunsw8QG?=
 =?iso-8859-1?Q?LeRJk4KpVVhG0WScUsAv8jR1GkUTR854nqJE/mzNicRsPw1OGUmGrmjZg0?=
 =?iso-8859-1?Q?OIvQeCupL6eIvQJ2v0ErcSPLQ9IdVBIJweiMB2Nx1ufvOO2xbws9Bt+XK6?=
 =?iso-8859-1?Q?2nmSM22epwhIxuDdHXzN3/LUVslJPepFv6Op67IcU5JoQ4lseBq/2VzfVZ?=
 =?iso-8859-1?Q?tJ9WtdCY6zcXSqPETSIeLDa6npoMMWhA3klXbPf/8/ZwxHFnD9/Pbb729m?=
 =?iso-8859-1?Q?QvaMLD4mDASRuRWB3fjUGWOWVAsWNo3n8xWUXqtJnrGCjLrjriYvPdkyaG?=
 =?iso-8859-1?Q?NK8/VDkiaBaLYXI/+u4bXdOQnO8EN25WGI+LJnGRYd14NCtDQqCTXIVpvY?=
 =?iso-8859-1?Q?mmVP4tfh2OJ8T/CmamgKrsXf7r/5zjnwvqytIQFBpzai74HqvMKvsP/pMM?=
 =?iso-8859-1?Q?bMS01qWXhtsIbdZQgrlAQvWncQyNyKOBmBhYkjuCIvCJuYZmUQzdNtD6s9?=
 =?iso-8859-1?Q?aVM27dOjGOGG0GdbcktNmo+CGV94rzdufGANFUWcaYfw3f44bm+fuwPX2T?=
 =?iso-8859-1?Q?oB05txV0yTTRCwc2LqFzexdiLyabnYNkm4qRc7p1zwJGg4Ny2tckh2eb+K?=
 =?iso-8859-1?Q?RDLwZ2/GmSYqoBDu+rt26tVSNR8mGIx2MmaAnhgrh/b7JjEvZ1PBXDIw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488263ba-e8e4-488f-efa9-08dbba7f81c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 08:48:20.4043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3PFDxcwAGNr758Lw43a+H/lEV/kN2/Y+3eLHN8F/uTgSd4GGSRpHRF3Qt8uckUYOQBoO29Z7I05xBBRTpKcEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7491
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When in consumer mode with BCLK disabled (FSL_SAI_CSR_BCE =3D 0) the
FIFO's can still contain data when resumed. It might also be possible
with BCLK enabled but just less likely.

When the FIFO's still contain data on resume it can cause channel
shifting on e.g. XRUNS. A Software Reset will reset the FIFO's and make
sure channels are aligned.

Fixes: 269f399dc19f ("ASoC: fsl_sai: Disable bit clock with transmitter")
Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1e4020fae05a..1da5c17cd329 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -730,13 +730,18 @@ static void fsl_sai_config_disable(struct fsl_sai *sa=
i, int dir)
 	 * anymore. Add software reset to fix this issue.
 	 * This is a hardware bug, and will be fix in the
 	 * next sai version.
+	 *
+	 * When in consumer mode with BCLK disabled
+	 * (FSL_SAI_CSR_BCE =3D 0) the FIFO's can still contain
+	 * data when resumed. This can cause channel shifting
+	 * on e.g. XRUNS. A Software Reset will reset the
+	 * FIFO's and make sure the channels aren't shifted.
 	 */
-	if (!sai->is_consumer_mode) {
-		/* Software Reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
-		/* Clear SR bit to finish the reset */
-		regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
-	}
+
+	/* Software Reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR);
+	/* Clear SR bit to finish the reset */
+	regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
 }
=20
 static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
--=20
2.34.1
