Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A6B59F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 05:00:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y4Tl6r3DzF47f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 13:00:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.69; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="bkitgYed"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30069.outbound.protection.outlook.com [40.107.3.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y4Rl4JrdzF1Rb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 12:58:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQC1+axT8UQygydNuj7WQY4qJJCOa0CReEvMHSAfBP+k82amEVmzbiYD7xtyO8LbdoS++h4M/6c1LOVmEe84+kj379GV1OlSHkTk0q8gHy7t+aSL1wuSP7QA90mwp7C9A188AqPKtsQ3uwxRNkFem/dWQ6Ofj8wC9XuNhnMDyDMDcYCoMd8GHEzVg1DRP6TzEVbesGaqDNskQkfaG9PQaw18jX45DTmmWiHkK/roSuZfSkeaP6zk/O/QsZz8KC81fRbTmemWHPwGNRMqpHv79n1GnR/fc7JFafHpEvLj94PU2heJn+pHFU7VKwQ7Nu9roGRUSY/Y5ozGLpH3x+miug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqoJaGhnB2lMMf86Y3LycK/MhVQrbEPk3PU5avXHEKo=;
 b=cigAiIquiXpbfTNOvvlsnrHNQlMBBR0MdK4etMjCyLQpoT/qE6Yu/T3r1xYC8GTxWC2Imd5qe4whuZ7m8C8h+OPvZXncMSIPdghl6mGUCzmKqv+EcvcxIGaJ1cGV2y2cs8xM7dYvDFzilxnONdbHnM4O0/Zbc0tSdRuXQlJRUJAZQGzG4XowSDQTSLr19h0c6c6wyfrUbXJ3m/fgeTXty82ueeC9S1XLCYNOeCfGQZu2wvlXKymAeGk+XzUsfZp2nSLAPv1tO1w3Or7RA9nVvzzzJaOKktbgFxjlkEPfAWFxpTjjQiVWs8ehrobRtA2BZY6nX9CTm24pGB9tD8slZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqoJaGhnB2lMMf86Y3LycK/MhVQrbEPk3PU5avXHEKo=;
 b=bkitgYedlT79NKnHAJXzQhF/NkHFROYh2o5IdnJfdQwtcu9k6TgpSRO72qOJHTh6zLz7YK74NffUDD1vDiRJzfSm6mTm3/ZUjwfXP30PorUW7gBaqQKVf7F0FzoocdXo8IXQy2r1twh9Mc/Sovv6QiVJx9WIXp2hcVKAmVw8oxo=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6352.eurprd04.prod.outlook.com (10.255.118.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 02:58:17 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 02:58:17 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Thread-Topic: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Thread-Index: AdVtzNYpmL+IWzVvSN6kQwMCHfj2cw==
Date: Wed, 18 Sep 2019 02:58:17 +0000
Message-ID: <VE1PR04MB647930580E370538148FAAF2E38E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36a45189-a0d8-4e32-f152-08d73be40e29
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6352; 
x-ms-traffictypediagnostic: VE1PR04MB6352:
x-microsoft-antispam-prvs: <VE1PR04MB63523E83ADDCE1D63E419863E38E0@VE1PR04MB6352.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(189003)(199004)(4326008)(7736002)(7416002)(486006)(74316002)(66476007)(66556008)(86362001)(64756008)(66446008)(3846002)(54906003)(5660300002)(8676002)(25786009)(6116002)(66946007)(52536014)(102836004)(229853002)(6246003)(6916009)(15650500001)(476003)(2906002)(76116006)(305945005)(6506007)(26005)(9686003)(6436002)(55016002)(14454004)(66066001)(478600001)(186003)(33656002)(256004)(7696005)(8936002)(316002)(99286004)(1411001)(81166006)(71200400001)(71190400001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6352;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pel0sLltIdHk2amEO0DXCnu5rTO3qHObzJgr/xO+6i/0iA94boOkKvulH57NPpZH/yEn/bYEoeRjxsUMVkinl81bZM/CA0AQ69CdhsGOUr8mXlfu0audXof3BIPoxNxpQwE1eO1JBbnxGhBQb2BlPo2cFJNHinPvVEp8YAgM6oXzXjQmlJroZNZlE9sflY3V73wCu5x2CIMnZcGRkvY/sxSoTCJ00fmauccycaODnKlfyC8FXukzkH+VSuCfYEoaoaRJSwlBrUC/ppoFOaWdgPAldPifVAk6v6BXdCwC7WCFJtwBwDDw+JCeun6ZmmSg8YR6EFvVs9kusUErmdaiJqX1fREIgactXU/S/5eQOBZAP/ThwYVcA/pJTe+mXltlLWN561JvJ5chmmayQL2XhzQU00oJTpRrmwCW3k51Nj0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a45189-a0d8-4e32-f152-08d73be40e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 02:58:17.1457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqIqBJ6YyyHRzdynkTJWAaolGWUbgV8qygdsVKdit/Uuyk8x5/yywI5dIiJUfuo2dJwAu9q5fqT/y1E3ymShoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6352
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
> On Fri, Sep 13, 2019 at 05:48:40AM +0000, S.j. Wang wrote:
> > Hi
> >
> > >
> > > On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > > > > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > > > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE
> > > > > > format should not be supported, it is word width is 20bit.
> > > > >
> > > > > I thought 3LE used 24-bit physical width. And the driver assigns
> > > > > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
> > > > > would go for that 24-bit slot also. I don't clearly recall if I
> > > > > had explicitly tested S20_3LE, but I feel it should work since I =
put
> there...
> > > >
> > > > For S20_3LE, the width is 20bit,  but the ASRC only support 24bit,
> > > > if set the ASRMCR1n.IWD=3D 24bit, because the actual width is 20
> > > > bit, the volume is Lower than expected,  it likes 24bit data right =
shift 4
> bit.
> > > > So it is not supported.
> > >
> > > Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought
> > > they're left aligned...
> > >
> > > If this is the case...shouldn't we have the same lower-volume
> > > problem for all hardwares that support S20_3LE now?
> >
> > Actually some hardware/module when they do transmission from FIFO to
> > shift register, they can select the start bit, for example from the
> > 20th bit. but not all module have this capability.
> >
> > For ASRC, it haven't.  IWD can only cover the data width,  there is no
> > Other bit for slot width.
>=20
> Okay..let's drop the S20_3LE then. But would it be possible for you to
> elaborate the reasoning into the commit message also? Just for case when
> people ask why we remove it simply.
>=20
> Thanks

OK.
Best regards
Wang shengjiu
