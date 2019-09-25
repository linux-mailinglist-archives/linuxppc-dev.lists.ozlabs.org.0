Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F068BD6BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 05:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNsL345KzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:32:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.53; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="pSeFfacP"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNqJ21z1zDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 13:30:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZ86yfn+5qa7pJ/RBVfkGSEPeA15lfSQw/xW/PSiDYT0+3qh0HIFtr9QLjJjoFR1K02h+QkdJp5AYTpIPU5RHfIE8nh4U8Z6Qqu6wBf4kP1/Dd7XaX4T/j6nlk1QtnfvR08J+JCh/g9XvXGc0PyndUc/YpeqLZkw0A5KEjIMYZ0Vz8k72IrF/PB7TJHpMrp7m7AXcyvDQjFGpWjlMPTgEAwfCZ6zyxce/hWcKVMpKGPHG17/unHbFUUG2uyERwYl1fZmMOAkJjXTlgMiwcZ+0HwSuspf7Em0C4kVTmxuW5G4OF6UV6A2ugERuPEN9L8DRs65cOkdr29AOj/CCL3EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnGcQDmeCtgFmkIlcEFzRwG/zbzs95WlNuDD3tNtmo4=;
 b=GIvj+zul34dTvQzANx6GmvpaFSToId/KKQeLVK3iOTgxVoil3aiV0wG0maRoN/lh38hplemBeWf2jqXcLnayN/N9WgLcyEskq5id8+Ed/WMyW9lWRAqbITSpg9GVDJcGdJm8SllILAxbpBpkxRaVpBcCJc+rsZ1LTvQseOYuzHk4LWvj2ejwXihzwcmrKwm2TM7t6IiXW1BSW9Gjq80iWqFzu6s4A4vJnCZ6uR5Us+iiAkgxVvEbBkjiLmUe4Z+E/9DEhTQR4U+3CtP/+bNiZhCHYbxraSsuyBaB6OYjnD5utV+86Wc7qYHMrp0SXWJr6ih4QcECaC0nTyhXBjtrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnGcQDmeCtgFmkIlcEFzRwG/zbzs95WlNuDD3tNtmo4=;
 b=pSeFfacPf/iXRTq/BemJnfi4IH8eX1+pHasQZneHuMgjhA8Mrih6R2n6VGvniv4kdUb+QaGxCS+tGqnclsrF37zykOr+vGGiF8zCIVscv2UbZKRvWlnTKLigPCV/xEaLfUtFun5cZnTmIG3bq1UwuCVjafsLlX5UqL5qlRiFFk8=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4138.eurprd04.prod.outlook.com (52.134.108.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Wed, 25 Sep 2019 03:30:12 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 03:30:12 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Topic: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Index: AQHVcoOnab7d5ysBNkWsXmY0PrfSuKc6/L+AgAC3JZCAAAkFAIAAANMg
Date: Wed, 25 Sep 2019 03:30:12 +0000
Message-ID: <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78874108-a8a2-4278-837f-08d74168ace2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR04MB4138; 
x-ms-traffictypediagnostic: DB7PR04MB4138:|DB7PR04MB4138:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4138F2D49457DFDA316F74968F870@DB7PR04MB4138.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(199004)(189003)(66446008)(2906002)(305945005)(476003)(74316002)(6116002)(4326008)(81166006)(8676002)(64756008)(3846002)(66066001)(66476007)(76116006)(14454004)(99286004)(81156014)(14444005)(6246003)(66556008)(66946007)(6636002)(86362001)(33656002)(256004)(7736002)(5660300002)(7696005)(55016002)(26005)(486006)(6436002)(229853002)(2501003)(102836004)(8936002)(446003)(54906003)(186003)(9686003)(52536014)(478600001)(44832011)(316002)(110136005)(6506007)(11346002)(25786009)(76176011)(71200400001)(71190400001)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4138;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Imeb2s67+hrLJSOAeOCAajPt9gYM9nIIj5gO5y25R6Wwaym58w1y9InU4ik6vQvrBJJU3MH8z2IxjjRoWUoxjpCUezH5T+Y9P9np2duXmC+CRRf5fsjpPfIUmAG2fdwyOdGSi8ZbRJeYSGY2QZdnrDUZTv0QSDioQOkk6YyGoRWPhnEELUJED8STCN8Mk3hM5R+z7tiL9Ps+4FF0ytuEhr98eKLR0CzDl4m5D5zZnkKdGFZB1DiSws8wSa/xXrBJAvNVDXJP+bdeypE5G0vVArXOM77Xdz0Gqq457+WnvBrAfqC1z9HZmleNbhA2BE8P+chX+Iaf4Zc/B+Rqq+Vp51AvRUfIMoLieyJoRBwGZJnKWTr/GQiZCgNNbobEaCnUbJiBMbfqMTtXHZnyqydk7gkqKX1hF4vfev/hN6xPFKE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78874108-a8a2-4278-837f-08d74168ace2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 03:30:12.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MD1in9LD/8zv+UxBRy4b0yTClkW5uWGiC5d2Sq1IPWCVN3HzO48nsgO5lbyniVSvxfyB2SgcrSvNjuWfPqzXfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4138
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

> > > >
> > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle an errata
> > > > A-008646 on LS1021A
> > > >
> > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > ---
> > > > Change in v3:
> > > > 	- rename property name
> > > > 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > >
> > > > Change in v2:
> > > > 	- update desc of the property 'fsl,rcpm-scfg'
> > > >
> > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > index 5a33619d881d..157dcf6da17c 100644
> > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> > > >  Optional properties:
> > > >   - little-endian : RCPM register block is Little Endian. Without i=
t RCPM
> > > >     will be Big Endian (default case).
> > > > + - fsl,ippdexpcr-alt-addr : Must add the property for SoC
> > > > + LS1021A,
> > >
> > > You probably should mention this is related to a hardware issue on
> > > LS1021a and only needed on LS1021a.
> > Okay, got it, thanks, I will add this in v4.
> > >
> > > > +   Must include n + 1 entries (n =3D #fsl,rcpm-wakeup-cells, such =
as:
> > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entr=
ies).
> > >
> > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers on an SoC=
.
> > > However you are defining an offset to scfg registers here.  Why
> > > these two are related?  The length here should actually be related
> > > to the #address-cells of the soc/.  But since this is only needed
> > > for LS1021, you can
> > just make it 3.
> > I need set the value of IPPDEXPCR resgiters from ftm_alarm0 device
> > node(fsl,rcpm-wakeup =3D <&rcpm 0x0 0x20000000>;
> > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for IPPDEXPCR1).
> > But because of the hardware issue on LS1021A, I need store the value
> > of IPPDEXPCR registers to an alt address. So I defining an offset to
> > scfg registers, then RCPM driver get an abosolute address from offset,
> > RCPM driver write the value of IPPDEXPCR registers to these abosolute
> > addresses(backup the value of IPPDEXPCR registers).
>=20
> I understand what you are trying to do.  The problem is that the new
> fsl,ippdexpcr-alt-addr property contains a phandle and an offset.  The si=
ze
> of it shouldn't be related to #fsl,rcpm-wakeup-cells.
You maybe like this: fsl,ippdexpcr-alt-addr =3D <&scfg 0x51c>;/* SCFG_SPARE=
CR8 */
>=20
> > >
> > > > +   The first entry must be a link to the SCFG device node.
> > > > +   The non-first entry must be offset of registers of SCFG.
> > > >
> > > >  Example:
> > > >  The RCPM node for T4240:
> > > > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> > > >  		#fsl,rcpm-wakeup-cells =3D <2>;
> > > >  	};
> > > >
> > > > +The RCPM node for LS1021A:
> > > > +	rcpm: rcpm@1ee2140 {
> > > > +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > > > +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> > > > +		#fsl,rcpm-wakeup-cells =3D <2>;
> > > > +		fsl,ippdexpcr-alt-addr =3D <&scfg 0x0 0x51c>; /*
> > > > SCFG_SPARECR8 */
> > > > +	};
> > > > +
> > > > +
> > > >  * Freescale RCPM Wakeup Source Device Tree Bindings
> > > >  -------------------------------------------
> > > >  Required fsl,rcpm-wakeup property should be added to a device
> > > > node if the device
> > > > --
> > > > 2.17.1

