Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B9FAE254
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 04:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S86Z0NR7zDqS0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 12:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.49; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ar5Woo5m"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130049.outbound.protection.outlook.com [40.107.13.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S84d6spFzDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 12:24:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGrgJXH11geTd5cl5wHh8r2ekpOt7Py4IS7NOdeWtRnAO+Z0UdCfBu2nDOTnxKvUB2Xme2Jb+G1mFXwOi2gAUrLXEPqKwMJw+sJUuS6uQ40976JSt+iIkTOPZP1Wfch06boiyVwLyGh0UuAnJLYM6hi8Y6JnxwQSiEUQpWie+IEJRBLFJA8NyaJHdDBwc24urrWwM8ObKxY/SrLrgSSQzaVZSKppgN2veUfm7Um/7bNGEotNEnOz2qeFfJs2TxGiGLwn3E7oH/ZPhabWpT3p73bI3jzoC2Pguu1O9ktq4/HKoVacpWsHv1P8RmeG4kt+5iEHgEGeS4O9GvSgGNKFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdiaonOFDubgYIr8S+S+o9VxHyYersRibCwvHrh5reY=;
 b=WQ0pbpkvSLDROtEPIu3lCjKY3221uQnpddOkoHvf1piG3+gT1rWD63jycGh8Io8MkZhW1uIJ0ob2mBhdru92oNNNuQ0D+KJlAEGr/xK0WtNtaOUKicsZ0o+28n41b5gGi33XR+wOZdoN5YxAujgYDrvFAIIs4RXfASNVPCm/NVVKeI/upEaSnqRqLoPv4K5O7eWlOLQpdFYMtQ6wpzSbTs9hrSFPBO/EsjyExDx14ZCJlCZolhMCFYO+XHlr+ugIpvg8J5mw6RRLZnlCxbXr9DnMSS9FYFW6AhVBzFQGGNqLu4crMw3DSKHWsS3imtPPqmvXvel/07tmspfEwe13uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdiaonOFDubgYIr8S+S+o9VxHyYersRibCwvHrh5reY=;
 b=Ar5Woo5muJI8egLgj7IQmIU2YpC5dRfRT7nms2UlUuELf8hB7mnrYu0hBH49BbEQBwN26o6t8yuMz5yIL6xsEZR+h7Kokp7dFvqMM64qSxBu4swjqyBSdnfCv6aJkHy/4mHz0wb7r1Sozg4YO/7qBkxtaHMo69AnKeoZbE6TxgM=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Tue, 10 Sep 2019 02:24:43 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:24:43 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: RE: [EXT] Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
Thread-Topic: [EXT] Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE
 format bitstream in i.MX8
Thread-Index: AQHVZ3pvowRNFUg35EqaOi9AfKWf6ackLjzQ
Date: Tue, 10 Sep 2019 02:24:43 +0000
Message-ID: <VE1PR04MB647982DF7060E527385CE50CE3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
 <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cb21239-7f47-40ad-f24c-08d735960a90
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6479; 
x-ms-traffictypediagnostic: VE1PR04MB6479:
x-microsoft-antispam-prvs: <VE1PR04MB64799ADBCAF5DFE92A11E5D7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(53936002)(81166006)(14454004)(7736002)(55016002)(26005)(305945005)(52536014)(76176011)(2906002)(33656002)(6916009)(316002)(7416002)(9686003)(6436002)(54906003)(6506007)(102836004)(66476007)(66556008)(14444005)(256004)(25786009)(1411001)(64756008)(8676002)(66446008)(229853002)(86362001)(3846002)(66066001)(476003)(71200400001)(446003)(4326008)(8936002)(71190400001)(5660300002)(76116006)(478600001)(66946007)(81156014)(99286004)(186003)(486006)(11346002)(6246003)(7696005)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6479;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BgrHQK+sWsfjsXE5Auklv9urfSGQdgaGrMxXpPiRhyl6hQTGxjSQD2SyrWH4+uMrCflR43kSz8MWu/OZWu309epJ2DqAPOUU9nVCeI+7wUVWBnPm8x2BHevpGVqLOEge0XeyumT+3CSN204fb/pIcHvJKImaDD3l0SYHzF+owRloDNEpimxD/iBruiu5eyj/Jaejj0lwVqN2/1Ab9KAQy3kcGfLzc0/PayMDsLbWroZOSII/2Z9HWc3kcvQP/rLKNc8EIMxTazSxUCTIEVD0Jgb9yjyesLGLQU7aeVJm19AOTuumLxb90gYxnzGlf277EHnZNZErPfyw890j3k9OA/XQwdYWRHZ+ijBvYiHE/PjWcnOlLDVJ5HQB8HuiX9Fdfotegiqyp22qQGwC2U5CAOnITUq3vPLZsjjA+D0k3gI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb21239-7f47-40ad-f24c-08d735960a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:24:43.4552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNDOFIlEyftPpeGQwGGFVDk3mFnLDoDHddpjfkXCakqBvtzHZfT+Kjm4odur2pA0ipPXri547e5wwItOLEQkXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi

>=20
> On Mon, Sep 09, 2019 at 06:33:21PM -0400, Shengjiu Wang wrote:
> > There is error "aplay: pcm_write:2023: write error: Input/output error"
> > on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> >
> > In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> > sample, but we didn't add any constraint, that cause issues.
> >
> > So we need to query the caps of dma, then update the hw parameters
> > according to the caps.
>=20
> > @@ -285,8 +293,81 @@ static int fsl_asrc_dma_startup(struct
> > snd_pcm_substream *substream)
> >
> >       runtime->private_data =3D pair;
> >
> > -     snd_pcm_hw_constraint_integer(substream->runtime,
> > -                                   SNDRV_PCM_HW_PARAM_PERIODS);
> > +     ret =3D snd_pcm_hw_constraint_integer(substream->runtime,
> > +                                         SNDRV_PCM_HW_PARAM_PERIODS);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to set pcm hw params periods\n");
> > +             return ret;
> > +     }
> > +
> > +     dma_data =3D snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> > +
> > +     /* Request a temp pair, which is release in the end */
> > +     fsl_asrc_request_pair(1, pair);
>=20
> Not sure if it'd be practical, but a pair request could fail. Will probab=
ly need
> to check return value.
>=20
> And a quick feeling is that below code is mostly identical to what is in =
the
> soc-generic-dmaengine-pcm.c file. So I'm wondering if we could abstract a
> helper function somewhere in the ASoC core: Mark?
>=20
> Thanks
> Nicolin
>=20
Yes, it refers to the code in soc-generic-dmaengine-pcm.c, if there is a co=
mmon
API, this is helpful.

Best regards
Wang shengjiu

