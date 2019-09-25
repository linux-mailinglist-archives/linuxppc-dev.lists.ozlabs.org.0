Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E7BD6DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 05:51:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dPHw2pJ3zDqSq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:51:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.50; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="GKbaaXX0"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130050.outbound.protection.outlook.com [40.107.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPDC02YhzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 13:48:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdDA0qV6//k8DMgpbXRivbmZuXNgNGG26XdfoWtugBbx2tQIVJib4d1Z9tSsXutAXhwmOmvrrQDoYhwz33/5CRLtoAT+36v4O4BfwFx8r2qPFBIdK1dTlH2J7ljWXEGfeB6AyIS3NZi3P9NC8hiW/cgWu5p+uJwzCEf1k8q7vGvjB7D/ShKh1EG13oyp0QtAadc+Ns8MpPVe5UcPfu4hHibo/h9LZstmiRcP43Xwtn3r7gJMkHVl99FuY4iVVl32c423Dai2E73zIHahQ/jwPkF1/NeTBlWEJWYXGE8w9ihTv+8cuTMz/eWpw7Pct19434fN6GvE0RNdiBCqdF+s3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1whAhsksq7C77hpD2V0lnRaxbKTlKq/xD4XwDZx3f4=;
 b=XTIQBKI63dv/IWPy1CBEFcluknaOD2F5JraTsmUMXhxoltk0jM1oENU/IxmEcjHJ5/eQhcTUHvgm9zM9LhECiingT7mRg0Du2YDyRI813DZj2ibubiG6sVsVCtPAD4QfyklPFmgo9at7FCOsYhCL7daQRt/F22tdiFJZc5SUUerrnuV5N/p/pDGAB0o47K2RD6Z3OfanmuTEIsGFEKYerrGljNrsUcDiwjHkhn65RGTOwV9WIjvMylytKLsziNTMv59vtQ3C72daHY8Pat8AG17d28hLUWcgihkwTzDwd7PHh9UFb1rxPEbC5Ucofy4f43LBjHb84woZHokt2ji8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1whAhsksq7C77hpD2V0lnRaxbKTlKq/xD4XwDZx3f4=;
 b=GKbaaXX0AxVPexZatOBDv4CDCvXhzG0Sz3nRkNxf19eK6M6Jvvd8QKMBwSfd4sov9WpeOed7iH8oFQlnfJnTKnsGZuI2PKjWXcFjV7TDH1l37bABII7Yj4EilM6iLeA7qO+pTZMxHJukFXclZUEjnEyWfwL2pAT69dzRDZYkHB0=
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com (20.179.255.161) by
 AM0PR04MB6115.eurprd04.prod.outlook.com (20.179.35.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 03:48:20 +0000
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::5c26:3c5f:17e0:8038]) by AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::5c26:3c5f:17e0:8038%7]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 03:48:20 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Biwen Li <biwen.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Topic: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Index: AQHVcoOnKERg3NBKWEeinvrVMNtD66c6+UIwgADABICAAADF0IAABAEAgAAAioCAAAQ4AIAAADyw
Date: Wed, 25 Sep 2019 03:48:20 +0000
Message-ID: <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69fcba0e-bbdc-4e58-9ec4-08d7416b34fb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB6115; 
x-ms-traffictypediagnostic: AM0PR04MB6115:|AM0PR04MB6115:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB61159C649CE7D7D83424335E8F870@AM0PR04MB6115.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(189003)(199004)(13464003)(316002)(14454004)(110136005)(2906002)(256004)(6636002)(9686003)(71200400001)(86362001)(99286004)(66066001)(5660300002)(52536014)(478600001)(229853002)(71190400001)(26005)(102836004)(6116002)(4326008)(81166006)(8936002)(476003)(54906003)(486006)(76116006)(76176011)(81156014)(25786009)(33656002)(74316002)(11346002)(446003)(8676002)(305945005)(2501003)(66946007)(14444005)(66556008)(7736002)(66476007)(6436002)(3846002)(55016002)(66446008)(6246003)(64756008)(186003)(6506007)(7696005)(53546011)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB6115;
 H:AM0PR04MB6676.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hLvs/Yyo7BoS+hOewWFWtBfDuVr5qdDfyj7ds1ouATL33Zro9i+lhjZeFCefEgP6BOajINdkdbQm49nKJ67RigZ/czf7R1Hk21wfddbB5D2X0aDU3InrRQ7yqCIOmzCUnnYM4dI7M2/lY1EBrVMMuVcAjx0iX3yOi29cdF6J1BjNZOFekMy23caMTf1X8euA4udCmJ3jDFkp4pNiYuOEEzfxU9QgyVvhbI3dfu9WDY2NkiLySEexdZ+Erw3YWaU66QWo2rCk6/7xnxvhV+o4LE6Uj7xXL10GvlqQi1s7vpFQKEoOiDneDxxbg6gfMcY8n0CrH18Rb826GTaEV/ClSIc7fh40Z8XZ0fTQ3YBQInQQ0MIKYjQMVnV7/wXjTuwb7Bhy0rVk/+aa9xPFAv0P98cjkWotVll8/8+JkSK5faA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fcba0e-bbdc-4e58-9ec4-08d7416b34fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 03:48:20.1486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzbqAqI1a9Onnap4H+0cUuoYzidRYhxmPJ/jKJoCqA1R74gGp0DJ6C9qet6wYEmgxmLLqQak/Edy5MZCcOzKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6115
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Biwen Li
> Sent: Tuesday, September 24, 2019 10:47 PM
> To: Leo Li <leoyang.li@nxp.com>; shawnguo@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Ran Wang
> <ran.wang_1@nxp.com>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr=
-alt-
> addr' property
>=20
> > > > > > >
> > > > > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle an
> > > > > > > errata
> > > > > > > A-008646 on LS1021A
> > > > > > >
> > > > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > > > ---
> > > > > > > Change in v3:
> > > > > > > 	- rename property name
> > > > > > > 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > > > > >
> > > > > > > Change in v2:
> > > > > > > 	- update desc of the property 'fsl,rcpm-scfg'
> > > > > > >
> > > > > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > > > > ++++++++++++++
> > > > > > >  1 file changed, 14 insertions(+)
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > index 5a33619d881d..157dcf6da17c 100644
> > > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > @@ -34,6 +34,11 @@ Chassis Version		Example
> Chips
> > > > > > >  Optional properties:
> > > > > > >   - little-endian : RCPM register block is Little Endian.
> > > > > > > Without it
> > RCPM
> > > > > > >     will be Big Endian (default case).
> > > > > > > + - fsl,ippdexpcr-alt-addr : Must add the property for SoC
> > > > > > > + LS1021A,
> > > > > >
> > > > > > You probably should mention this is related to a hardware
> > > > > > issue on LS1021a and only needed on LS1021a.
> > > > > Okay, got it, thanks, I will add this in v4.
> > > > > >
> > > > > > > +   Must include n + 1 entries (n =3D #fsl,rcpm-wakeup-cells,=
 such as:
> > > > > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 +
> > > > > > > + 1
> > entries).
> > > > > >
> > > > > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers on
> > > > > > an
> > SoC.
> > > > > > However you are defining an offset to scfg registers here.
> > > > > > Why these two are related?  The length here should actually be
> > > > > > related to the #address-cells of the soc/.  But since this is
> > > > > > only needed for LS1021, you can
> > > > > just make it 3.
> > > > > I need set the value of IPPDEXPCR resgiters from ftm_alarm0
> > > > > device node(fsl,rcpm-wakeup =3D <&rcpm 0x0 0x20000000>;
> > > > > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for
> > IPPDEXPCR1).
> > > > > But because of the hardware issue on LS1021A, I need store the
> > > > > value of IPPDEXPCR registers to an alt address. So I defining an
> > > > > offset to scfg registers, then RCPM driver get an abosolute
> > > > > address from offset, RCPM driver write the value of IPPDEXPCR
> > > > > registers to these abosolute addresses(backup the value of
> > > > > IPPDEXPCR
> > registers).
> > > >
> > > > I understand what you are trying to do.  The problem is that the
> > > > new fsl,ippdexpcr-alt-addr property contains a phandle and an offse=
t.
> > > > The size of it shouldn't be related to #fsl,rcpm-wakeup-cells.
> > > You maybe like this: fsl,ippdexpcr-alt-addr =3D <&scfg 0x51c>;/*
> > > SCFG_SPARECR8 */
> >
> > No.  The #address-cell for the soc/ is 2, so the offset to scfg should
> > be 0x0 0x51c.  The total size should be 3, but it shouldn't be coming
> > from #fsl,rcpm-wakeup-cells like you mentioned in the binding.
> Oh, I got it. You want that fsl,ippdexpcr-alt-add is relative with #addre=
ss-cells
> instead of #fsl,rcpm-wakeup-cells.

Yes.

Regards,
Leo
> >
> > > >
> > > > > >
> > > > > > > +   The first entry must be a link to the SCFG device node.
> > > > > > > +   The non-first entry must be offset of registers of SCFG.
> > > > > > >
> > > > > > >  Example:
> > > > > > >  The RCPM node for T4240:
> > > > > > > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> > > > > > >  		#fsl,rcpm-wakeup-cells =3D <2>;
> > > > > > >  	};
> > > > > > >
> > > > > > > +The RCPM node for LS1021A:
> > > > > > > +	rcpm: rcpm@1ee2140 {
> > > > > > > +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-
> > > 2.1+";
> > > > > > > +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> > > > > > > +		#fsl,rcpm-wakeup-cells =3D <2>;
> > > > > > > +		fsl,ippdexpcr-alt-addr =3D <&scfg 0x0 0x51c>; /*
> > > > > > > SCFG_SPARECR8 */
> > > > > > > +	};
> > > > > > > +
> > > > > > > +
> > > > > > >  * Freescale RCPM Wakeup Source Device Tree Bindings
> > > > > > >  -------------------------------------------
> > > > > > >  Required fsl,rcpm-wakeup property should be added to a
> > > > > > > device node if the device
> > > > > > > --
> > > > > > > 2.17.1

