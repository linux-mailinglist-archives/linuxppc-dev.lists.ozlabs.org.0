Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444DAE239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 04:09:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S7kg1bjRzDqQ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 12:09:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe1f::60f;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Qj4vouVd"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S7hp5k52zDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 12:07:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK3vwYP5aKcm8APEU033xN0XCpozCmmiloOXQdLcZzefAoF7dugdbBF3esZHkylLj1FPaSPi3ODWbfDw/EjGqostRbkKppaW6ncilV8tVkO2Tc5BbC6/2tsuwUNYlgfybFPBbsqxi9ZfqefN/65fdsmzzdMwpb73eSqEmelcV7a8KFfyvvYfuJTxOyXsXU0M23sp0JxTBOihn0Lp2CdLESxcr1reIZBcfKlUO/aZstJ0CPBncQIB6J0dJ9sNR5ZQe3oJ/bfmD7odoq3b5qVe/2iO+6PUDaxhQeVCNx2PUGOVTtUhdU3DKUXFcgNFG8+fTyRr9jdrBNVGQEvIXNqJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0Q7M29zjUZiT5VpAvxff+oGDKk7ik9Lw9CnBST1wwI=;
 b=I6JaEcmuxgpNsCv4hsGDQ9uK+1ZWDhXLr6R+cSu9R0DUnMm9yIBC8TwcXTKJmKG3ZlCTWrPij1H/3kzrhpP1iZv3vzeyWpydxjjmA8ldFJIvUbq5JXL5H8HMC/N8VIewAvwZ+P873AzUuCOUbWGyzwJPLHb7hoRh8F5SJGLy+5IfDuWfN3RkaJ5x7r7Si0MiWcnHVTSZ0ZknWvje0yg7rWB7xhP6LzchjurDTTgKrAmA1+myv6GfMnWVIADUTOWD7WofH/MURIARY5vxls3BOWgRW/lJI0OPn8NXz0gxuFL9HO2uhXqdMK341coZ9rwhAbn8mJHVfrv2/U0UFF9SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0Q7M29zjUZiT5VpAvxff+oGDKk7ik9Lw9CnBST1wwI=;
 b=Qj4vouVdNXOyqLOfRZQwhAsyFV/y+VzfTMYdHUNfZ52xVMSK1kMRHRx9ovENmQu6Ua41xRFS9WpvZ4ix1MLncMRZAtnYuFAHoLV0EpMBvB5Uqt81XP6QDp4VPo76wLysgJMoURbJuJNV7XaAEsyb8yKELBh9xaR5S/13Gj7eBIE=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6590.eurprd04.prod.outlook.com (20.179.234.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 02:07:25 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::5049:d7e5:95ff:3d53%7]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 02:07:25 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Thread-Topic: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Thread-Index: AdVne99A50iblB+wSvqDBZhWvxbm4A==
Date: Tue, 10 Sep 2019 02:07:25 +0000
Message-ID: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ae50c49-f1ff-4ac3-b35e-08d73593a00f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6590; 
x-ms-traffictypediagnostic: VE1PR04MB6590:
x-microsoft-antispam-prvs: <VE1PR04MB65902D2856F523D4870B2AC6E3B60@VE1PR04MB6590.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(189003)(199004)(8936002)(4744005)(7696005)(53936002)(256004)(9686003)(55016002)(52536014)(66946007)(64756008)(66446008)(86362001)(316002)(478600001)(14454004)(66066001)(66476007)(6246003)(6506007)(7416002)(2906002)(1411001)(25786009)(4326008)(33656002)(229853002)(8676002)(71190400001)(74316002)(6916009)(476003)(81166006)(102836004)(81156014)(26005)(5660300002)(186003)(6436002)(99286004)(76116006)(7736002)(66556008)(71200400001)(54906003)(305945005)(3846002)(6116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6590;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bYlrU4jnp+IhudtYAD+U46GCMO1594Vx4x+JE2i8l91iZdPkkkooLDxSh6dw61Plhc59/2B+dRLYkQr4x+U+Y9AH9KIGmQ5NntNVArskF7IKnoQW43AwycNgqtO6wHsJUEzbcrFimE/xRybbThFR22R5e2nXieB3i1hijsZuqsGn6TEDk+HXo1H47gaq1R1qBg0L2LN+8KJAHsw4eJTMqCGKyfOm99haE5//C3kT5fwkWuN0+oCDA3pLviABGpoePTdf79a9UpyGAq+gmz66D7BgoXrUuy1AaGP7iDeZeXuwKa3nVYi/G5e3O8N6Yd6rfEuIj6oxiv2amL7+xYoq1190purGoSbIpqkAjdNr/V/zELf57sdeMb5o74+wSPAfblk8tpNZZC9g5xn65T53VaDwPWLDjdxyZd+kujnvLAQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae50c49-f1ff-4ac3-b35e-08d73593a00f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 02:07:25.6593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPNe9BqE5f0XnhyrPG9gsKCspaCiihaWFCbmdx1ZmkaeZAhffgemDSxnHS/numxbnd+zDr/ixd907k52KgQpQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6590
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
> On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > should not be supported, it is word width is 20bit.
>=20
> I thought 3LE used 24-bit physical width. And the driver assigns
> ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit would go
> for that 24-bit slot also. I don't clearly recall if I had explicitly tes=
ted
> S20_3LE, but I feel it should work since I put there...
>=20
> Thanks
> Nicolin
>=20

For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if set t=
he
ASRMCR1n.IWD=3D 24bit, because the actual width is 20 bit, the volume is
Lower than expected,  it likes 24bit data right shift 4 bit.=20
So it is not supported.

Best regards
Wang shengjiu=20
