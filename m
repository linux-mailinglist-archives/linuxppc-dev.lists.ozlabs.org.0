Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E111133D511
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0DyD727Lz30Gn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 00:43:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=kuYteeS3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.51; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=kuYteeS3; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0Dxk4dkrz302X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 00:42:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPBSy1LqOfu76ryZzTEMnCx8xVWjRlaNG5SwZhvNeQwveD/SO15npXwdH+K7z5WeJ8Pu+Jpg116YGQtj38isNHJa5QlqZ3Kj9fvjPmQmO8IZ6bUsTxsFTPSCK+FYxfMpjbuZvpILWbipSVmj0XuCWnV/6XD4RyZl9XbGaPcj2YbEDQyEDTc3j1EP90DFF7+N201krhz+kqhX9r+VV82MITABsisgHfltqyHWeCC3jU6fSMPX8NIXyk1roVhD5zNa5bkikcQJSNm1bK+s1i6sYtr9DSrvs2slRHWNuz835eOBk7Tepnt4QVr8OCaw78GVmuhPD6bs9cUEWYooMn+1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bxnomuRnr3d8aL6eAxir281HmvHwBgMNP122tKlgvU=;
 b=YX5J+/3QgwMBtssHLg6PScDnDxgWiSunhrqSCYr8V1JfMSy7doPadkUBpgN4NEjaR2KFDk2BQEbDcdND3rIrXfCJ3vvKjq5zp1IpTygPnLHkANjjaofQHYiesMNY5aIRvEjGt4pPCVOOwcdg5z50E+EmTG8NNMw4yzJe3D82HM5L+AfaYb2R0KxFi2U+oNyLl2b5+2vRd1MYR6ezwUmF3IkI+2hy5uW/egeiytB2EWdb1QsRJbORD6zREtkDlYmR78F1YnIBcb2JLZoMoN6VPdU1yfZAF4i8svCzRpYs/7TTUH7eHOEGdirOPNNCKqIOofM8vf10e6QgG6IRqdsWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bxnomuRnr3d8aL6eAxir281HmvHwBgMNP122tKlgvU=;
 b=kuYteeS366ln9h7e3918g9JQzBMQFP2g7urlROGhV5faxRtPsyFV/6uTEzJ4sNQiLx6KPYKb6kUDOmqlb7DD9HvmfqQQCjvIA1KW9qXqMVM2h1yGJBf+p3Ryh1v+4qItXi84+ZnmbyOmCZYPKtXBqQTVO+rmbI//nYZ/day98sY=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VE1PR04MB7296.eurprd04.prod.outlook.com
 (2603:10a6:800:1aa::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Tue, 16 Mar
 2021 13:42:40 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::10e2:8a8c:5ede:ae88]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::10e2:8a8c:5ede:ae88%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 13:42:40 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Mark Brown <broonie@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Thread-Topic: [PATCH] ASoC: fsl_sai: remove reset code from dai_probe
Thread-Index: AQHXGkiO/IcTGUCwTk23NBZTUp1HP6qGk5mAgAADy6A=
Date: Tue, 16 Mar 2021 13:42:40 +0000
Message-ID: <VI1PR0401MB22721D0D266207472B3C7829926B9@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <1615886826-30844-1-git-send-email-shengjiu.wang@nxp.com>
 <20210316125839.GA4309@sirena.org.uk>
In-Reply-To: <20210316125839.GA4309@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.126.12.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aeefd0dd-a0eb-4584-a52d-08d8e8815e9d
x-ms-traffictypediagnostic: VE1PR04MB7296:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB729691A4883B75786C2C821B926B9@VE1PR04MB7296.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T4Yqr/SBGMoER213J1CEeT1ANgPknQlgvfFbrRAlWk3W7X/s2MbY+yoYPAJJZ+NyXqKeHBTY4eoFuZ7d1mIHlJCWu2g4zDeoKfgVCE1b8+oeGJBblVRfmtKvqP5SCMcSUmFQCfu/WRc+VfMVEFOLjJR1JD4tnHFLnNy4Xydwh9KGUUXVxr1TX2RF8hcEYa0A7TaieH7mKj0RhcjFIwGaSTbRf2yyGlNS0/S4joz6EqWDGw/ny1CEnHPH6fLZt94W+6aXD51M9DPvliZXVzScjMsBuIW8LndlQ4DQQamcH11qFQAqsaUghHoguzrC3y21T0ibuI0a3fZfaigXpclKKkDPAPkCdOL3Ue2J+U1rHyCnDOqKLf3wTQt60gxkzPgGGaLt5n9csQUOIx414jumYY0dAmAThcHlz+i6RYXD7ESgNO0hz5M/+E1xK5F9LxI88wc1M+GqTO5Io2WHPC80wDN3ynicgopDZc4nB8WC+SafwwDQL6xpoY7BNYhYRukifLPJH5JThLdQbtcYpAa5PIBZLCWm31C+j78qxrA5iV1fCPUXqNfclokAlPkkAAg1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(52536014)(44832011)(7696005)(76116006)(33656002)(9686003)(6636002)(83380400001)(66946007)(66556008)(4326008)(86362001)(71200400001)(6506007)(8936002)(64756008)(110136005)(66446008)(2906002)(26005)(186003)(66476007)(4744005)(54906003)(8676002)(5660300002)(7416002)(316002)(55016002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hfjy2XEaVKAaGyfwBVwR5Cw+cU9wSIUuEca5yCFKKmAU4nHXw8M71gwKKfh9?=
 =?us-ascii?Q?njB61xHMyx5TWTRMY5pZfbxVHYeJeOTZNGLnBbAo59IzVhN+bzkRSrXCCnFX?=
 =?us-ascii?Q?3eBzoADdjZXrPuXcAZgpP3l7/s9BPx3IVmdkctde43VHkhfHOI5UWxJawsGd?=
 =?us-ascii?Q?B+s2/45MFHCSISCrBz28EhnXWjmn3Wa1vz0kKEEfpMKviTy0uhnyVa1oC7s2?=
 =?us-ascii?Q?FE9NQkhqZFeqiEslO/GB7LIqm0vyTxaK3Zg2VYhw0Tc4D82kOsXUxlqegZdU?=
 =?us-ascii?Q?V/ipVrU1ptBQI/7bNAdaKf2YQfiRR7Zfw0OGDLKeMKi9/NCAZk5g38wpxBZW?=
 =?us-ascii?Q?bWA3xiKmpN5gsDlYZhPOt0uAGSx86TFE2m8Voe6egAXhRZ2vzJIdlGUNSMMj?=
 =?us-ascii?Q?LjqqPItM0lBnHHtCkmEkf8+Sid5K3GKSiQ/uxP7069uOu6Pl4VgnkdaL5JRV?=
 =?us-ascii?Q?N49cLSzzs+EVg+Kb63u9Ygx4lLNSDiYyiB8INKoD9kJTe1Q7AtfOA+M2JoIy?=
 =?us-ascii?Q?QTncrT0IWSdueQE6LDYwUVjUOkhEjFe9v+ShePDZ8DSKUNiXZsUCqJIAPi/S?=
 =?us-ascii?Q?0DBJor44gikd7MfV76PcOMUuGixXgdkB2l3MoZvQto7aC/WywQuK3tkGOolz?=
 =?us-ascii?Q?d+546ONWR2sIkFo3dRhYMwJiTkEGuZZ4SQkFSz55JB7XHbZebNd3w5eKKCBU?=
 =?us-ascii?Q?4v+5yT+HsNBaiUZMe5MoEZa2yrCz+xab5+OVt9Q/UdXRPkUnhj7uVOUZTdWZ?=
 =?us-ascii?Q?L6jBo++/k+y8kxr5ZgvzZ+JKzAtUfxe/tkylTgk00a2WTWLbXnG8wf+Vpoq5?=
 =?us-ascii?Q?76mmb1cuzYQmSBKxQBsVlzoxM6xNXvyJOXr2EaOiaVzOqoSUfRAoDUwthvmD?=
 =?us-ascii?Q?WkAGH4VZz7Ypmu80nmH2kr1Xf3g0CnXvRJYDF8kJ/9wyPCHX31064o/SivAV?=
 =?us-ascii?Q?UPpVunvcOWDKyQpUNiPnIx5fAdLaH2R3cweJzXsnhNk8cmGGNDBciRTwtBnr?=
 =?us-ascii?Q?xvWqR2RzLjQ2P6vyCjbPyEPknE22qlyMiz0yG6Uuczov9WOTmWMQNt9d1M/A?=
 =?us-ascii?Q?DDJuf7IBtTGuu7n+mOnvG6tbe90oenNbaFczob4pCp3182znauv66kZ24mlG?=
 =?us-ascii?Q?D4b5GQirAwQ8ZrWMhRzjqj/ay6RG3KdHB2nx5dvtqZeyQylbRvO/FsnkbqeY?=
 =?us-ascii?Q?E9uvPr+oELtj8ZdvCl6wsYR4H5CztQix5WNrx90fogZ/pNt3XBfPSWpaKCkZ?=
 =?us-ascii?Q?/1s5QgU0K/m1N1e4OiISu8OwJ0HPjo3Pcb4mk4RZMYO0MI7DO+F0cSaCEK8n?=
 =?us-ascii?Q?k9KtKfqN5t12LPMd3YrJy7Sf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeefd0dd-a0eb-4584-a52d-08d8e8815e9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2021 13:42:40.7290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lah2H7zyNW1KAVpUbfozMD72/ONGSy9c7R1cnMcfE31Gm03xhDwLdvae2W/H4hLVNA+kHEbQpCKfeN9/PuzzNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7296
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
 "festevam@gmail.com" <festevam@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Tue, Mar 16, 2021 at 05:27:06PM +0800, Shengjiu Wang wrote:
> > From: Viorel Suman <viorel.suman@nxp.com>
> >
> > SAI software reset is done in runtime resume, there is no need to do
> > it in fsl_sai_dai_probe.
>=20
> People can disable runtime PM in their configurations - do you not still =
need a
> reset on probe in case there's no runtime PM?  It'd probably make sense t=
o
> factor the rest code out itno a function though.

Hi Mark, Shengjiu,

To me it makes sense to manage the clocks and reset from the same place.
Currently we have the clocks management moved completely into runtime PM
fsl_sai_runtime_resume and fsl_sai_runtime_suspend callbacks.=20

/Viorel

