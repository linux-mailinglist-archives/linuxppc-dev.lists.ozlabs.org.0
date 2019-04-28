Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 479CEB4C2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 04:29:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sBZD5zF3zDqc3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 12:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.74; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="awpz3dwy"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sBXl0Fk1zDqc3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 12:28:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aTFaAAN2IrpZHFQHhTi4WKi5LAEpnD5hXmtniBa5Kk=;
 b=awpz3dwy5JZj4XSNPtUICGFjmx3TcEQPq2o+KEizyCgQaD5FzVDeFUlLJ5p0WYK03L5j9npfp1Dy5CtVPzozJ4+DbWjuXQ3cc7eaRaph54QdbKx2Sgv7eqVQ3vdMmiNKTNbWL+YYXiWwSEQjXLG6DyNFAGSt00MignbH4stssio=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6527.eurprd04.prod.outlook.com (20.179.233.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:28:01 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.016; Sun, 28 Apr 2019
 02:28:01 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3] ASoC: fsl_esai: Add pm runtime function
Thread-Topic: [PATCH V3] ASoC: fsl_esai: Add pm runtime function
Thread-Index: AdT9aZTTCBvxnqcnTlSWnl4/zJWE3g==
Date: Sun, 28 Apr 2019 02:28:00 +0000
Message-ID: <VE1PR04MB647954050987E2A44F459752E3380@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2103ab35-c8b2-483b-4372-08d6cb812294
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6527; 
x-ms-traffictypediagnostic: VE1PR04MB6527:
x-microsoft-antispam-prvs: <VE1PR04MB6527A58376FCB48B0B8A9EB7E3380@VE1PR04MB6527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(366004)(376002)(39860400002)(189003)(199004)(7736002)(99286004)(71190400001)(86362001)(4744005)(14454004)(68736007)(229853002)(478600001)(486006)(81166006)(54906003)(8676002)(71200400001)(476003)(3846002)(6116002)(8936002)(81156014)(5660300002)(25786009)(4326008)(102836004)(33656002)(64756008)(186003)(14444005)(256004)(66476007)(6506007)(7696005)(66446008)(73956011)(9686003)(66066001)(74316002)(66556008)(66946007)(26005)(305945005)(2906002)(76116006)(53936002)(6246003)(6916009)(97736004)(52536014)(6436002)(55016002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6527;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FuDYIm6ISgNZSdKbs3rRbBHJs62eMmzyhIEoHrTLtf2CnLm0QnHpGyZKMqgrPPSGP3engutJhcyF+uhQbOxVdI35oKPKqcMO9UZtXjGHDNPg5aYfYAWZwqGEML9h8uuE0ebj2fKiYElaDr3LC1Ql4wpgbehl+EF7IyTrkcw+pyx5G2UKNtMGanNyof120rfQGgFpbnH672QXyUUwOM/UTHIOrxOp4hMi8LFg5fvuI4MHyccJGpuJXNKsSSWZNhdLwyndZMRLduyGfvg1wY+0qG3/RNV6mcuuY9n+5mVOTYJmmbb2XbWn9DqtF+6CwumuiKc9f+PXQOLT2TwTwR3+bMLfhYRkpQru/fq1whQGAaar4hVrmCt/egvDsn1A296vQTGFjS8FN0ZMI7IsLQYTmiSqKabBTXkbR3/RwPGq8Zk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2103ab35-c8b2-483b-4372-08d6cb812294
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:28:00.9874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6527
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi  Mark

> On Fri, Apr 26, 2019 at 10:51:15AM +0000, S.j. Wang wrote:
> > > On Mon, Apr 22, 2019 at 02:31:55AM +0000, S.j. Wang wrote:
> > > > Add pm runtime support and move clock handling there.
> > > > Close the clocks at suspend to reduce the power consumption.
>=20
> > > > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > > > fsl_esai_resume is replaced by pm_runtime_force_resume.
>=20
> > > This doesn't apply against current code, please check and resend.
>=20
> > Which branch are you using?  I tried for-next and for-linus, both Are
> > successful applied.
>=20
> I'm applying against for-5.2, though if it depends on a patch queued for
> 5.1 that's fine, I can just merge that up - please just resend.  I think =
I did try
> merging 5.1 though...

I think may be caused by the patch " ASoC: fsl_esai: Fix missing break
in switch statement", so I resend them both base on for-5.2.

best regards
wang shengjiu
