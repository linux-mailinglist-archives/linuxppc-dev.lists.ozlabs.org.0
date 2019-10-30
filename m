Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B9E953F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 04:22:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472v0P21dgzF3l9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 14:22:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.52; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="oA7XHMkn"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472ty63sFMzF3jr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 14:20:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJsjcYu0Jg9nFaDd2BEbu4hvCNRpynhiCUb7if0B4GqdJmw6V2nrImZCJikC2vxrLVYylnAN0UJMZHaZ5gLS3fb4z5OBWFwSwu6U9CxpeES9jYcv/LXLcrTThryPbjvl1BmKZiX5pSvrPYDFDOvAiHZ+e4OqPp1mgvwIUQvpc//DRLoBzg2BR8wTLukAuFTYHXo3rH3T6CrBR80KxGm5wojofrUiXc6FDNMP5AtbR9qbvgVFSggbA2ZZIEsDF7/1nUlURGcOPmlUfZtWdyNM1AMrV5O3GG5vLhNY036t3mlxUEcb/H6tZXZMm0Z9Q6p8d4fTFq6qV8T9q8vfJDsXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLNSISLapK4Z2YP3UBIQrnOMNr128jRtjyOSl7lUNaI=;
 b=DkUBOITUFz6VxD2Rthr/nKOAB1baOxGZ0ze0QhY5tKdhIFTtuElPOauE62cvhqkp4zK1zErdb1W0IXfwJmMNzsyPnEAXoZllsIjN32yitsdmMOQkZ3ooI0ko6rzv5MayriNeIyN9MtJ4gef4vU5cR/ef8JdKUB8ezLSZ1ZJn7cqb9QNQEIUf+1TRXUmCTF7tXzk2MMZI7/dmSw8navRyn3jdtbmGXtFhkNdlhROPdKHGwc1oFZ4JFEYK6Ie1GQa0E5X0hmZm9KLo27uzMRo4c7d84PIDnA3CrqPRKCc7tu7MElANfCVrWJuXGje4QF9ilkT8WTfyM4sHxUhN6weQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLNSISLapK4Z2YP3UBIQrnOMNr128jRtjyOSl7lUNaI=;
 b=oA7XHMkn4VvW+ocI0cv0bRbITYmucILWsHIsE+FcH61zhJnoq4epfe9jj6+eCUmP8xFdDDKERiQaik1YTbE5Pl2B4mo+czo3dy3kHNei1pCm6hXZMZw/lMkruTjjhH5jGWJO4OB5Bqbt+WBZkPpgfofEtjCMdfNo6trFRivoRdc=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6493.eurprd04.prod.outlook.com (20.179.233.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 30 Oct 2019 03:20:36 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Wed, 30 Oct 2019
 03:20:36 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
Thread-Topic: [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
Thread-Index: AdWO0NDdBvdDnhxySQ6SCTWiiQjucg==
Date: Wed, 30 Oct 2019 03:20:35 +0000
Message-ID: <VE1PR04MB64795758EBC0C898FBFFB3A5E3600@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6f04f17-b62b-4b2e-ccfa-08d75ce821a8
x-ms-traffictypediagnostic: VE1PR04MB6493:
x-microsoft-antispam-prvs: <VE1PR04MB6493EB7A5287BC8F9B0F2A0CE3600@VE1PR04MB6493.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02065A9E77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(189003)(199004)(4326008)(186003)(14454004)(6246003)(102836004)(6506007)(6916009)(26005)(7696005)(81166006)(7736002)(25786009)(7416002)(305945005)(74316002)(33656002)(8676002)(3846002)(99286004)(2906002)(478600001)(9686003)(55016002)(6116002)(486006)(81156014)(476003)(54906003)(66946007)(66446008)(76116006)(229853002)(1411001)(71190400001)(66556008)(6436002)(5660300002)(64756008)(316002)(66066001)(71200400001)(256004)(66476007)(14444005)(86362001)(8936002)(52536014)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6493;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K5Nr/IcHptbGJkbZh0SiL9H0DjEfXMpYaQ5G7bn19/F4Qlj66aarfUV9Pjqo65IHfV7cyLBZOBLv2a9tdBP3BF+KKXvckQZaNkPI05/dqJx29A2k2LVyN+N20ZO9xw960Fn60TbbmYHixqa3T3u4x5XYPIdDg512y+B6hMFrS/IKnbBGs5Y0FZL7chpzu4w1G3XysepQu0QX33aaf2U3s+4YWBhHOy+8U7tqx1rizn5N8NhzSLzEN6O+a9glFtE+aPrDkM/a3D9KoycHGZ/X6Amr3XwYrveyt5zTOzVkPBXJZeQPQbPsMUubLDalMySYZmdFXZICMqyc+GVCIOEGOPsJIm0+T6esYZr8GHk8zGssA1JfbVv/DhSEtl7B/nHX0r8Cdgo31RRLNsXbDpuDjVbBjId11O31rmrXNVgUH8UqnRt6MojBX5wqxs1efo4+
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f04f17-b62b-4b2e-ccfa-08d75ce821a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2019 03:20:35.8965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yZUwQQ7tZOe4eZ8YIDA/7FOdBpwyMF191F0HCRuJc1KCIf4eF9JrVa1nS7NOejTRrXsreo0TOYuj74m/8h0zhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6493
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

>=20
> On Tue, Oct 29, 2019 at 05:17:09PM +0800, Shengjiu Wang wrote:
> > There are two asrc module in imx8qm, each module has different clock
> > configuration, and the DMA type is EDMA.
> >
> > So in this patch, we define the new clocks, refine the clock map, and
> > include struct fsl_asrc_soc_data for different soc usage.
> >
> > The EDMA channel is fixed with each dma request, one dma request
> > corresponding to one dma channel. So we need to request dma channel
> > with dma request of asrc module.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c     | 91 +++++++++++++++++++++++++++++-------
> >  sound/soc/fsl/fsl_asrc.h     | 65 +++++++++++++++++++++++++-
> >  sound/soc/fsl/fsl_asrc_dma.c | 39 ++++++++++++----
> >  3 files changed, 167 insertions(+), 28 deletions(-)
>=20
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c
> > b/sound/soc/fsl/fsl_asrc_dma.c index d6146de9acd2..dbb07a486504
> 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -199,19 +199,40 @@ static int fsl_asrc_dma_hw_params(struct
> > snd_soc_component *component,
> >
> >       /* Get DMA request of Back-End */
> >       tmp_chan =3D dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > -     tmp_data =3D tmp_chan->private;
> > -     pair->dma_data.dma_request =3D tmp_data->dma_request;
> > -     dma_release_channel(tmp_chan);
> > +     /* tmp_chan may be NULL for it is already allocated by Back-End *=
/
> > +     if (tmp_chan) {
> > +             tmp_data =3D tmp_chan->private;
> > +             if (tmp_data)
> > +                     pair->dma_data.dma_request =3D
> > + tmp_data->dma_request;
>=20
> If this patch is supposed to add a !tmp_chan case for EDMA, we probably
> shouldn't mute the !tmp_data case because dma_request will be NULL,
> although the code previously didn't have a check either. I mean we might
> need to error-out for !tmp_chan. Or...
> is this intentional?
>=20

Yes, intentional. May be we can change to=20

        if (!asrc_priv->soc->use_edma) {
                /* Get DMA request of Back-End */
                tmp_chan =3D dma_request_slave_channel(dev_be, tx ? "tx" : =
"rx");
                tmp_data =3D tmp_chan->private;
                pair->dma_data.dma_request =3D tmp_data->dma_request;
                dma_release_channel(tmp_chan);

                /* Get DMA request of Front-End */
                tmp_chan =3D fsl_asrc_get_dma_channel(pair, dir);
                tmp_data =3D tmp_chan->private;
                pair->dma_data.dma_request2 =3D tmp_data->dma_request;
                pair->dma_data.peripheral_type =3D tmp_data->peripheral_typ=
e;
                pair->dma_data.priority =3D tmp_data->priority;
                dma_release_channel(tmp_chan);
        }

Best regards
Wang shengjiu
