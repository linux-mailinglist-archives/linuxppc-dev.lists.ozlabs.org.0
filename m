Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 830AEBD6F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 06:09:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dPhK6HcyzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 14:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.72; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="amxXwc0e"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPd62HVqzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 14:06:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bb6n6VjEO0dQsoWmkn1cMq1EbVsz3RN4DoUDm+/8cqVSxH+5yk7Rp12Aj5K75Ij0ZMOmjN5aR3jVNYtEbMDgPDP3O+r07fFZj/ntpOm5GSsK4na4W4y3KbagO4TFY6TrJshEKTZ1A5FB7Wrtbk70/yk6A6abiD6BgoMWMcs/TxVyPdQk4aUnZvYAmg8km5MsHiwQltuQnmRuBzasco22Ty4skxSyqUyLOec+gxN/h1m1PBXYpb14eYmE2D+ic42YBMJe+1+C7E+QZXbD7qFHZ6YMxB7xeAbmhsxsZpxmZAY/B6gXfJdjuUh6iLbIQgMuKkUFK6oHQ4sXWXZBoLX8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+aAt7nhmdt3SQSQbrOzsvtQHc0P7IyumRfaud9hKMw=;
 b=gfERAgAhYrsuEDnca/FBuBk4TMaH95YBo3juyFFt5bIjbTdeS03b5fjxblhuzhAmvqyxmHvw52mF6v3JcxsZyaOvdWxsmfpdAqfo54Q2nmcl12uEI1oQkobZ5XaFHfW0PkOAtB9ABBXSAfWY6BGCg9BULsKhR/7jRyKjcOacp6uY+WKBAKTfBJmNMy/l84Uu2G/+yeF2eJFKz7snXqRH+B3BBCire1YREi4wVeXAOMHymXKts8Ju9omCjRu37xCZV/OynctJpRedLpXOX10j9yUj6RkROisuueWoBlO+Q536IC3L2mUBemYiJABTh7TjIa5zMtzbJhWnlNchhyEymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+aAt7nhmdt3SQSQbrOzsvtQHc0P7IyumRfaud9hKMw=;
 b=amxXwc0ebnWGMi/MDlm0mnQP3zz72lA2DHTROBj4SQge8rOT1mXdIuqDAnEA1gcmAuB6TnLkP3jtoteWBjGKovFZJeCJZsgjYd1Vu71xJmzxEn2Zl/2I782q8/r+n1PV3p/WuzOUlX14LxAQtuFbg224vFPW1T1jmcGLsZKlU7M=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB4411.eurprd04.prod.outlook.com (52.135.136.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Wed, 25 Sep 2019 04:06:25 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 04:06:25 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Topic: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Index: AQHVcoOnab7d5ysBNkWsXmY0PrfSuKc6/L+AgAC3JZCAAAkFAIAAANMggAABmICAAAIKMIAAAb8AgAACHkA=
Date: Wed, 25 Sep 2019 04:06:25 +0000
Message-ID: <DB7PR04MB44902BADDDFD090BAF4178C68F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
 <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB449034C4BBAA89685A2130F78F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB66762594DDFC6E5B00BD103C8F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490FECDC76507AADC35948E8F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676BD24B814C3D1D67CF9F88F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
 <DB7PR04MB4490EAE9591B5AE7112C9D188F870@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB6676B8A6F7C7C3BC822B45B28F870@AM0PR04MB6676.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99222846-b610-4d78-b9db-08d7416dbbd3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB7PR04MB4411; 
x-ms-traffictypediagnostic: DB7PR04MB4411:|DB7PR04MB4411:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB44112F6DDB8FDEBDDE9FD0318F870@DB7PR04MB4411.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(199004)(189003)(66446008)(256004)(76116006)(6636002)(14444005)(64756008)(66946007)(66476007)(66556008)(6436002)(86362001)(3846002)(4326008)(52536014)(74316002)(7736002)(5660300002)(305945005)(54906003)(316002)(110136005)(6116002)(6246003)(33656002)(186003)(2501003)(26005)(25786009)(6506007)(102836004)(44832011)(486006)(476003)(81156014)(446003)(11346002)(8936002)(81166006)(9686003)(55016002)(8676002)(229853002)(99286004)(66066001)(7696005)(478600001)(76176011)(2906002)(14454004)(71200400001)(71190400001)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4411;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Aqe/6a9nd7nRCVQJLPvOehWS2Iy+uuC7bs0r/a0SULM4QpVYsawVXsuem+N4kM6WB9z7Qx8PzeKiEB2EuMTdzgS7brp/gveGnW9OxMLho9+R0GkRyQ5yPQQRRtbBFYfVOKLSnX7T/XdryU4QJ2uo588CALTlV8sULfU1n++SOQHA+W5DI/YCP3fbbNVuyK5P7D7/ndeZdrLemCfFpaA9a52W72EGJschbD9YdIiH60e2mm6pfq+k6DZtWC8lzv51ipp+SXiA4k60XNziXIHjayp18rzOEtnNHWlCfBYDjbksjLh7RuiaKI+meAvgKUr2PbA0P6QVlsR0r3XqGn+wxnud+CTXwj/rjijRaWm0PmmJAkilgxhFST1REd5Ssf7cR+YzdQa4QGlHr+7zNYBkZt5uMJcL0QW6RySdOyaNM2A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99222846-b610-4d78-b9db-08d7416dbbd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 04:06:25.3221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ugp7UjWqW6LtKiFltKiYak4qN5VSdsZQDMN1ikFN8jqHVeijQEFnoWA7Y8elRAVIGcnMqoxvCMgNYFM4EK89WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4411
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

> >
> > > > > > > >
> > > > > > > > The 'fsl,ippdexpcr-alt-addr' property is used to handle an
> > > > > > > > errata
> > > > > > > > A-008646 on LS1021A
> > > > > > > >
> > > > > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > > > > ---
> > > > > > > > Change in v3:
> > > > > > > > 	- rename property name
> > > > > > > > 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> > > > > > > >
> > > > > > > > Change in v2:
> > > > > > > > 	- update desc of the property 'fsl,rcpm-scfg'
> > > > > > > >
> > > > > > > >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> > > > > > > > ++++++++++++++
> > > > > > > >  1 file changed, 14 insertions(+)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > index 5a33619d881d..157dcf6da17c 100644
> > > > > > > > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > > > > > > > @@ -34,6 +34,11 @@ Chassis Version		Example
> > Chips
> > > > > > > >  Optional properties:
> > > > > > > >   - little-endian : RCPM register block is Little Endian.
> > > > > > > > Without it
> > > RCPM
> > > > > > > >     will be Big Endian (default case).
> > > > > > > > + - fsl,ippdexpcr-alt-addr : Must add the property for SoC
> > > > > > > > + LS1021A,
> > > > > > >
> > > > > > > You probably should mention this is related to a hardware
> > > > > > > issue on LS1021a and only needed on LS1021a.
> > > > > > Okay, got it, thanks, I will add this in v4.
> > > > > > >
> > > > > > > > +   Must include n + 1 entries (n =3D #fsl,rcpm-wakeup-cell=
s, such
> as:
> > > > > > > > +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2
> > > > > > > > + +
> > > > > > > > + 1
> > > entries).
> > > > > > >
> > > > > > > #fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers
> > > > > > > on an
> > > SoC.
> > > > > > > However you are defining an offset to scfg registers here.
> > > > > > > Why these two are related?  The length here should actually
> > > > > > > be related to the #address-cells of the soc/.  But since
> > > > > > > this is only needed for LS1021, you can
> > > > > > just make it 3.
> > > > > > I need set the value of IPPDEXPCR resgiters from ftm_alarm0
> > > > > > device node(fsl,rcpm-wakeup =3D <&rcpm 0x0 0x20000000>;
> > > > > > 0x0 is a value for IPPDEXPCR0, 0x20000000 is a value for
> > > IPPDEXPCR1).
> > > > > > But because of the hardware issue on LS1021A, I need store the
> > > > > > value of IPPDEXPCR registers to an alt address. So I defining
> > > > > > an offset to scfg registers, then RCPM driver get an abosolute
> > > > > > address from offset, RCPM driver write the value of IPPDEXPCR
> > > > > > registers to these abosolute addresses(backup the value of
> > > > > > IPPDEXPCR
> > > registers).
> > > > >
> > > > > I understand what you are trying to do.  The problem is that the
> > > > > new fsl,ippdexpcr-alt-addr property contains a phandle and an off=
set.
> > > > > The size of it shouldn't be related to #fsl,rcpm-wakeup-cells.
> > > > You maybe like this: fsl,ippdexpcr-alt-addr =3D <&scfg 0x51c>;/*
> > > > SCFG_SPARECR8 */
> > >
> > > No.  The #address-cell for the soc/ is 2, so the offset to scfg
> > > should be 0x0 0x51c.  The total size should be 3, but it shouldn't
> > > be coming from #fsl,rcpm-wakeup-cells like you mentioned in the bindi=
ng.
> > Oh, I got it. You want that fsl,ippdexpcr-alt-add is relative with
> > #address-cells instead of #fsl,rcpm-wakeup-cells.
>=20
> Yes.
I got an example from drivers/pci/controller/dwc/pci-layerscape.c
and arch/arm/boot/dts/ls1021a.dtsi as follows:
fsl,pcie-scfg =3D <&scfg 0>, 0 is an index

In my fsl,ippdexpcr-alt-addr =3D <&scfg 0x0 0x51c>,
It means that 0x0 is an alt offset address for IPPDEXPCR0, 0x51c is an alt =
offset address
For IPPDEXPCR1 instead of 0x0 and 0x51c compose to an alt address of SCFG_S=
PARECR8.
>=20
> Regards,
> Leo
> > >
> > > > >
> > > > > > >
> > > > > > > > +   The first entry must be a link to the SCFG device node.
> > > > > > > > +   The non-first entry must be offset of registers of SCFG=
.
> > > > > > > >
> > > > > > > >  Example:
> > > > > > > >  The RCPM node for T4240:
> > > > > > > > @@ -43,6 +48,15 @@ The RCPM node for T4240:
> > > > > > > >  		#fsl,rcpm-wakeup-cells =3D <2>;
> > > > > > > >  	};
> > > > > > > >
> > > > > > > > +The RCPM node for LS1021A:
> > > > > > > > +	rcpm: rcpm@1ee2140 {
> > > > > > > > +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-
> > > > 2.1+";
> > > > > > > > +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> > > > > > > > +		#fsl,rcpm-wakeup-cells =3D <2>;
> > > > > > > > +		fsl,ippdexpcr-alt-addr =3D <&scfg 0x0 0x51c>; /*
> > > > > > > > SCFG_SPARECR8 */
> > > > > > > > +	};
> > > > > > > > +
> > > > > > > > +
> > > > > > > >  * Freescale RCPM Wakeup Source Device Tree Bindings
> > > > > > > >  -------------------------------------------
> > > > > > > >  Required fsl,rcpm-wakeup property should be added to a
> > > > > > > > device node if the device
> > > > > > > > --
> > > > > > > > 2.17.1

