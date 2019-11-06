Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A9F0BC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 02:47:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4778YT2KtjzF5D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 12:47:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.47; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="TX88rd76"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4778Wc6VZtzF4qX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 12:46:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nyu7WAvctPv1lY0y1kysmHQwweStHvr+6I7xT7vzQbzN39Exmj/TEqefXZ/HMV+6tObvh8fGUb2JynY98rGP1fSaVC9cK2XjGuEskKh4sLRquUuQMIcaB0GpfnQ6PJ9IZ8gBPgXL1l1fktSSpE/8F3Zq/NXNiJFSNP6mhXrHn7bZObL37FDnPMHZAXORXCYhIdtuxMpjIeEUqqkzQl4q9764enYLshdST/Il7cNWSa+Cq/VVo15aRWh8A/UU2cvPtKJIq9iCFgZxz5ds0r8JbtsgXQky/11V9qS5GRVSzY6ackLXTvkrIvSAQf2fH7chIVddvD2Rl8zYFb1H1Qyu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7wa7nM9N4d0T0oEJEPItuNHzQLGfbTfpJXl8yWpvfk=;
 b=bo9Ttk4zZhebOwym5USwMa63QWKwt9O6T36v0GBNWd3yAEGA9Whadkb7Dng7If0VgSzq09X5KmZb8SXeiF2nm6wgoyOA3pgZO6IBTesqhv3sSRnmjioQH6YEDz6NaTUWiQt36YwDY2Z2cVjDOc6V8syw/avsI/y5REvbp2cICRzXNC+BmDWdF+54Apl3dKpyB4/Dr65qXzNaZ1cTd9qU2ryLrXATFanSw8Nkr2Bwzb/ALfcUZu8kpGJcz4YYZ7VQvGr4ZIKqOEB6FZ9Feu9rrlYkg8IfppJMUKCYd+gRU+6GZXpq6IYamszmpk8Dd7eZx+S9UKeLdBSBj8NcYn9fCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7wa7nM9N4d0T0oEJEPItuNHzQLGfbTfpJXl8yWpvfk=;
 b=TX88rd76jdfTJypdaJBSDGw+Z8FWp4cuvF0RKevwlGRyy0YNQ/sTKf3DNrHhYAgSxUtHc81nJjDKVa1p783n3wPFGKPrbISYPZiAcKPZYczeiqSC7HhKziRsBkF+wEmFqudjHDGJ5DRWWt49bhNhSPbJHo8TkL+SrXw5nSek1nA=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6493.eurprd04.prod.outlook.com (20.179.233.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 01:45:54 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9%7]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 01:45:54 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
Thread-Topic: [EXT] Re: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm
Thread-Index: AQHVlCVAtI/d9rj+CEmSVDL+wnn2jKd9W6jg
Date: Wed, 6 Nov 2019 01:45:54 +0000
Message-ID: <VE1PR04MB647993508ACCA9B7B4938D24E3790@VE1PR04MB6479.eurprd04.prod.outlook.com>
References: <6465fb7dfaa68b6693584bcfa696894628d45fe9.1572435604.git.shengjiu.wang@nxp.com>
 <20191105220614.GA12397@bogus>
In-Reply-To: <20191105220614.GA12397@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 229f2b16-e5c1-42be-6320-08d7625b0ff6
x-ms-traffictypediagnostic: VE1PR04MB6493:
x-microsoft-antispam-prvs: <VE1PR04MB6493AB16FB926743048AF416E3790@VE1PR04MB6493.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(71200400001)(76116006)(52536014)(66066001)(6436002)(6506007)(2906002)(7416002)(229853002)(5660300002)(14444005)(476003)(71190400001)(7736002)(81156014)(64756008)(66476007)(66556008)(66446008)(8676002)(25786009)(8936002)(66946007)(11346002)(446003)(81166006)(3846002)(4326008)(33656002)(305945005)(6116002)(6916009)(55016002)(86362001)(7696005)(76176011)(486006)(256004)(6246003)(54906003)(14454004)(316002)(186003)(102836004)(74316002)(4744005)(26005)(9686003)(99286004)(478600001)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6493;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 10y5g0zQRcvvjoIyPs0szyS3/QFbZ31gqRwDtVp8zi+JSTKyUZ15fqCjkCcGfgRaavzL5uvFMIvVqYPA1yQvX63ebChvHDcgaw5Ptn034BLrg1AE1uxyNISAuAjELq/oebnGcEr/9euqTFfJnE/Vylp67vKcTUOdGa7M7j9UKIzgqqfiUALSLuD4Za6bfCL26J+UhQhIOebmzxr17WJKe54t5x4LBSfGu6UZ/eoDvUgD8GIN66LdU+jykhWh0R/OaNNxQOaPkhdW8WrmihC2+Ml4Piuk3vMNYDeoBQkHudVEfMzNhQCDbQzKnUGa+J47zF5zHScKGFpKLeXovHISM3DEq+mfA49i2hs2nQpfV53D6NVwRI6yRzVBsSfCz0BqZ88tj7w8C/ct3HVy8DIwwZPGAtv1+/sVoYnKR6roNWYDGcHDLo+FoKL+UgiTYPGD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229f2b16-e5c1-42be-6320-08d7625b0ff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 01:45:54.4536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/Hmza46wY2Ax2VVN14ol+84LsrsIdcfeV6PRFpOXmNOTTfhc+gK7gmeu1Im7KoynLCJU54m4IevzxXQkF/EGQ==
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
 "perex@perex.cz" <perex@perex.cz>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi
>=20
> On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> > In order to support the two asrc modules in imx8qm, we need to add
> > compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"
>=20
> Are the blocks different in some way?
>=20
> If not, why do you need to distinguish them?
>=20
The internal clock mapping is different for each module.

Best regards
Wang Shengjiu
