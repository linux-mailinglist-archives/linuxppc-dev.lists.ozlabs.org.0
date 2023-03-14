Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AA6BA034
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 20:58:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbkqh2tmlz3chy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:58:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M3wOuRIv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::620; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M3wOuRIv;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbkph1D3vz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:58:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KET6+gJ6+AZOZJB1/cZ9Q118GmvEzC0KaQyJ7IC+vNtBfoYFWjmhtQnKPGk2/t7Ptv6rvTw26YU8mRqlPHoUrqExm+6WAceEeklUvQoPJgK4vCiy0V9YZMfGlUHiqYVe5lTLKc/MMVbO14azsMOLlS8zVDpI2f1nXhqGh+xk50WM8ZlvAW49xWTl251NzhG19qPPbkwvrnJyxPgVChNfq8j8d7eCgJok10f93EE6pmHYyQU3iQ3FObBSZEqVFALZnfqYVhXwsy3C0szRDIDp5RrJH6wwCrz6Og5Qq5MGlzpuRuesoVhlMweOJ4rih1OV1qVROpDDaswFmDoce9LUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLnwXcIx9pcs/o58kqV1+entzOi4YK7u7umLd03Wgd4=;
 b=KrsgcKdcKEwzNbjySbCciY+HDs//PbitQz5E1IHR6M/1q6I2ueh720eUmZy0df/xsadnlJCkX2HRuXBHRoDApTXKl0U8ST7qAe7/ScIltZ1VgLhNV6ncYLY5SIgEySLyxvjc/XCfK8MofStStrEryo1pOMEVy2jaijy9GiOU3DrKs7E3UhlF03H9Ap42JdF+gUc9tVk37/6C9AxZE6FdQl+iWFHhHJb0M1+kj1M/wKYlxqlRyh10Nh/T25h/fHulmzAr2whEx2j3BrKmyufk7Q5r/8z8r+Dos9GL4JFT4CORFscx8/iOe+xLMjtkfOhrkPS6z0a7tsJNNksGyt5IKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLnwXcIx9pcs/o58kqV1+entzOi4YK7u7umLd03Wgd4=;
 b=M3wOuRIv9FrDFvTNtvwgcMV40aMjw0D61jzkk46nx3YonVQb4sXSjxcxbE1JdH9UzImmEj+57Ia8puhlnfslnwcEOwMktRk022ivBACDyr951a2cEdydwyHezVwy463bGiTAESeiRPAVPki67zVjmLn3X+oEfuOxZ/VOdWxXb+I=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 19:57:43 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 19:57:43 +0000
From: Frank Li <frank.li@nxp.com>
To: "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Thread-Topic: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Thread-Index: AQHZJr5WwkFDleZU9E2wO25hi20GTK68DjRggBLZEQCALCl70A==
Date: Tue, 14 Mar 2023 19:57:43 +0000
Message-ID:  <AM6PR04MB4838A918AE988237FF6EE6AF88BE9@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20230112194433.1514149-1-Frank.Li@nxp.com>
 <HE1PR0401MB233120D46B7AA9F23AFD51C688D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
 <HE1PR0401MB2331FFC2DB890713521DC46788A29@HE1PR0401MB2331.eurprd04.prod.outlook.com>
In-Reply-To:  <HE1PR0401MB2331FFC2DB890713521DC46788A29@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|PAXPR04MB9124:EE_
x-ms-office365-filtering-correlation-id: 23572e3a-a41c-48a9-29fc-08db24c65ff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2rhiusJv7R3/LhCL5Yev9Qdv56HBd5C2VHuRdcnskI1jIlk7glPba8i2QZmyX8g20Iu/6136TeZnwvOIRpD7Hrnp4vlH0kvfzhcLKEjPJBvzDwhyncMlbug2+PxER945PenyOcSBr2Ab4jWx3Jt8vzB4Z0eA7EFRGebbVNcXpp5lg/C+Z4fcJRB4OMgRyZ5a4vqXiUwLWAOaiIa8db3KmI4B88F1RFxcoKdMlVncycPbrVC3etlpvkoPXWYwws5GxUzeFcgpi5+EqR0Q4vcJBgPqH5vOw/We/aCW0c7QVAkuegsCCjwCgU6UTyC+xSIgcYrQWLpcJReP5wW6W9bcEJxU1V/GEpnVYPgvi2WeA+4C35orBc85KxHggHr4+e5KjYwWjZrgf7CKYoFFlwVdwJde/kuPcKn/rPOc7vaCiRl/zsCNQk8BCl/mwqMv5W4LBNOaxcar0wzPD5DsP5QDE+QNXXujD61p2cTmea4YTTp8zymRvK1MisReZvhwdI8XD9Kd97JoOOyOmizmZafQTvLYl9BbQCp7p3NLC0HZkmV2MjZeu9+Sc8dhtsGvyS8+QPOWX9DJ+NeCHLSh2lTl7moJ2OtYx6zLFfT54Ucvk8sSpw8FSDesJLmxk7ebLh4TioC2DA4uxyHygpMF1IFzq36zBaxBfsxuXOLF4ybLbYTk7dsBhmTL+spApdy1VOI+pb7Usm72/JKS4ewga1Vhmb4PzV9g5BRB+mZ1xjvHW7c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(6506007)(44832011)(7696005)(26005)(38100700002)(66446008)(4326008)(921005)(66556008)(64756008)(66946007)(76116006)(110136005)(478600001)(8676002)(122000001)(66476007)(316002)(9686003)(186003)(4744005)(5660300002)(55236004)(41300700001)(8936002)(86362001)(71200400001)(33656002)(38070700005)(83380400001)(52536014)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?+gslsVAL/MOfYRQX1m9WsESciu1PMaHqYbnqc5P2oiXdEBzj/NeO99pNIw?=
 =?iso-8859-2?Q?g9wTCTjyrrm2HyW9oE0+e4N86rQD98XkdHx5MMc2PGiLVWyVbyXBunvbvI?=
 =?iso-8859-2?Q?nid6QFRdLyAEz8ftU9rDXIEG2nTOzi4wLcCtFbmN1MapwTDbdSJJ7XrJXa?=
 =?iso-8859-2?Q?FjUvabOnog+lOEyAWTNk6P24I6aFm9mdvlQi1tkiXalkHGT/rOdJ5Lu8EO?=
 =?iso-8859-2?Q?ydREafSLWDUcyT2rtJJcsDSAc4W4+vLVSLRlKdWD0+2+qawv+JzDFPGRNa?=
 =?iso-8859-2?Q?R4fW/8fexOfKzgqIco/a5WmODc5gpCt36Ho4sumh3G8zvULCbORJilxvWC?=
 =?iso-8859-2?Q?MvwXc7duBWD4k0nkQ8564yyScH+OjNDzf4dRCo3oaptQLiRNfAA405u87e?=
 =?iso-8859-2?Q?TDgGOCmT9hXCWSH0Z3f9MszILj9Uq9I/8DcS1GyKeTjbq/3eNWdkeTN+/u?=
 =?iso-8859-2?Q?hhDNRDLiMfMktMN0dVNVRGErozF06YG3zLVCEHmZmjuj1kMw3f+8B81TxL?=
 =?iso-8859-2?Q?vTEBKmCnOZszEJyQvl4ypKP1TleoZ8XJFZDKx6FBSpEePqvgt149F/K7bG?=
 =?iso-8859-2?Q?6neFRoIQY025dLflpHoJgIikavOh/ZuFcnasXhKWOzJtE2Ck8Gx1HzHfVN?=
 =?iso-8859-2?Q?TveTt4sdU5uf6Uo5h2ccZPopvmL1s7Gg1icyiH2lGfHp2yedfv/IKJpNXq?=
 =?iso-8859-2?Q?YOnl+0AIgjxC3kmoaj1wltj9SHZ5Ole9132tOBd0lNlTaww51xElNv7tp+?=
 =?iso-8859-2?Q?jWdlALRIebZG0MdmCxFNY5n3ZM9160dnuLNYceyse+uAsbHjuiwpmFc1vk?=
 =?iso-8859-2?Q?RKcgGs0PY6+Z41ojc8UnOZjgg5VLEViTX2tjR9K79rDOknj4JPEvL+P00q?=
 =?iso-8859-2?Q?Z8o4VUpQYYKLe2a0VTv4+ox0NPPnJJpO0fLxfZaincoWcOEYNjm0W55lTW?=
 =?iso-8859-2?Q?QfIHE6ICczgy9bxkhO29umEoHWbJ3bUtCa43FosIelROXai9TrRTXlVXK/?=
 =?iso-8859-2?Q?fTFJKfGe2/IkbEjp5dTg14Bvqhiy6GCEZGhI65CjOGTafQrQCplK7dRr89?=
 =?iso-8859-2?Q?0YZ55Ydt2vhryc1nlJO5of985/tGSvnIaEsscUBOQuxQ8domo50ebndlIj?=
 =?iso-8859-2?Q?442JNJe/4T0dvdzonno95Ln6zbuw8XeXrJ7IkVFXwBr/PnAW/yLShpy33g?=
 =?iso-8859-2?Q?Bcomx5f3BeOYStAvccJ7CMOrjIYrgKdAbBeMXUb/X2bOMRoaBhXerQQAIi?=
 =?iso-8859-2?Q?zzN3hKT3lAU4ZhJJnkYiJsw6D87mY9S6kAZvibKFGxR7jyI2iYkBBewO/c?=
 =?iso-8859-2?Q?nTus9OMO5FPvonoOp/n4khdKy9iswjY8768bAtxjhqNj0DPNVvizXr86gL?=
 =?iso-8859-2?Q?yinJvgH4mkrsVoD/B/g/w4PnMPsBJuolICZFR8E00hlGdRkOljUzAw940+?=
 =?iso-8859-2?Q?OnhI/SRnHp246E/H6a/lqFIYObEdVfzuqqfj+JSViJRFLbbGh2oSdwD4xz?=
 =?iso-8859-2?Q?JfI2y/fxkt4Njlm9gziSexht/YKveV4mnP/Q7pqQQt5kxefbmfwdpxPVv9?=
 =?iso-8859-2?Q?cEs7bCgqWTQFtzUnSD2VYOIstOnCxiHRQ/fqw8arn9GSVFTKhhV8kmZLWI?=
 =?iso-8859-2?Q?dBhVbM9fQlwlM=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23572e3a-a41c-48a9-29fc-08db24c65ff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 19:57:43.4131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiJ86czRvqv4Wn5peNPd77muJLEEbyF7fpULUqnGL2EJdatwHsN7b8kXPTYArLYU7WlYqd0w63TRdw8s4ENK0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9124
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>=20
> > -----Original Message-----
> > From: Frank Li
> > Subject: RE: [PATCH 1/1] PCI: layerscape: Add the workaround for A-0103=
05
> >
> > > Subject: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
> > >
> > > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> > >
> > > When a link down or hot reset event occurs, the PCI Express EP
> > > controller's Link Capabilities Register should retain the values of
> > > the Maximum Link Width and Supported Link Speed configured by RCW.
> > >
> > > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >
> > Ping
>=20
> Friendly ping.

Ping.  No feedback for over 1 month!

>=20
> >
> >
> > >  static struct platform_driver ls_pcie_ep_driver =3D {
> > > --
> > > 2.34.1

