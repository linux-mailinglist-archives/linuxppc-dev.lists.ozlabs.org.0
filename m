Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59936BED83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 16:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdTN15VVKz3f4n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 02:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HUybq7LF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::60a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HUybq7LF;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdTM11f5dz3cfX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 02:58:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+6lzEMikAVURkH7BCxIBkfbLcQ/dkoCf1QviQXLGZ59uyGobXWBJegJqg1Q1yVDH9n1kLlLspd8qbVJfrt7I0NYZdPi22Weo4NcRdkng6DkWmEY4h0hix3yGz/EUAlyKP9Bmy6KlBNt0ANNsyUNP3jqtfBVQzDM21h2qWmgfd7PHyI5IfQK6EDQYTmFca3VSI2bjBS2yu5juSkI+u9voPnnqk/Peiu08G9chbEU50ybgQQXnJiJ/i/MOIMiK3dCYkLlbQI6dDtuazKhR3jADLSvvrzTvHSFjDa8HbJSISS8mj3NRA8UWlszlbzPoeu66YxAdeq9qZHEEoZrCn+dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGxGmGTmu+GYUuGqycgFd2V+IPyqxT6/I/kNf+g0i2s=;
 b=lHytNmRMQ62Z31KaW9mSzY+K6IdG6ny7X04vCNf4QWn7EicCSugqeHYDVCvxRsJFs/DxfahJWXQMyR0DKnBJeqbXAS9pcKQdOmQ5ap/eDHWTL0gzVXk8Ifp1Fqapu18m84y7qPA4ZE4TQawDsG1Uqfh846vRgE0wg1/BRQ2rKscBONL+xHNXZakZwsOE1DereQLGCji//W5cGpKnlgn9LBob6Q7JDwpLaybTJYyMsgLj6ah3jeDhkRW0mrhfh6OF/+iToFZ7Xd8RmdZuP5faur3pxMOBMxArcC3U4yez7NPvoV2Agiamgbr/aodORyuf2Fc1io77TE+VRs21173FGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGxGmGTmu+GYUuGqycgFd2V+IPyqxT6/I/kNf+g0i2s=;
 b=HUybq7LFi1q/gxJbFQ+ZaaziW66zulqCl1/vNHrmLWcf2b9uiAaqv2CFEdtyTYe9/RLH3zQLKbnIzxLz/d40+hQHzsGd6klYcnP6HZTtJ/oeoTftEElkDi4xTvRmUn1H1/i8GmSGqbh6fOLbrpd71H8zMZ5absEdJNPQlPHKglA=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7540.eurprd04.prod.outlook.com (2603:10a6:20b:283::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 15:58:13 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5%4]) with mapi id 15.20.6178.029; Fri, 17 Mar 2023
 15:58:13 +0000
From: Frank Li <frank.li@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/1] PCI: layerscape: Add the workaround for
 A-010305
Thread-Topic: [EXT] Re: [PATCH 1/1] PCI: layerscape: Add the workaround for
 A-010305
Thread-Index: AQHZJr5WwkFDleZU9E2wO25hi20GTK77GsyAgARoY6A=
Date: Fri, 17 Mar 2023 15:58:13 +0000
Message-ID:  <AM6PR04MB4838BBCA8E49EE13C9545F4388BD9@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20230112194433.1514149-1-Frank.Li@nxp.com>
 <20230314203249.GA1673140@bhelgaas>
In-Reply-To: <20230314203249.GA1673140@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|AM9PR04MB7540:EE_
x-ms-office365-filtering-correlation-id: 7a136f06-49b2-4d4a-979a-08db27006a28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aEEtd0ZT3BLbFkP6BGIM7ECPRMyJ8Qg9p1HqXyBNltxmJ0Dy/2PtSxj5FzknHjH5vGymFmsn6kQfRkt0FC+U/+zuYUPOzI8qW5ucLdso4nHUnNyXZ1FqF0dVIE821pHmq0XAJImv9hlX2u/+kDDmjOzXTH3ImUUf834KoKY0OJbR/Zy7R+NXATkk3AUUbKGelag8/mUftyeiIytlro/xf4eoAnbH0qS5mJ76/2IB+awaJ0Oi0ww8Ri+CSeNnoZdlFevUNJpvMBjtgnoHzmLF1h0Zfj90xTT6YxecHvL8fkyQzmt3Jp2OmCWnLO5J1ouCDb2EMcagtlEQ+c+H+tc6bOdok4Kb5bcs4/ClKNLPdTS0uEc/hqIZAiFbD10kt/2OOkfXRu77a4Fu9vFv0MPg83B/7sR3NIcM13YyWn61jmQhz+1LzIeA3JJlHAogi5TgdurZ7vcfPVa5EwQwssNA3YsdUYt/DQ8OPQd4jOGQpJ2UgrpZm7nNQFDKTE8IvAr+qitTJG/Vjlsltk+X6OUIofq9Dzu4PMy4OauNnzsXmTzz06sFAM8ViH3bVhTuk9+Ta6kChR/TqjvwMuBxMlWrlTO8AgxyD7ZpZNhUBNxYlJb+Czmi3ng/mC56Yv5x75Fe0DeJhRbDi0iSGcpBKG7BhY7MjjVwvSaEPCAs5PclVLAkA02RlpVtMEVksB3BnWGM9IY6IKxwT2hGnrNlj59zn5BN7x8u4nx8m/idn4HzDxw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199018)(66946007)(2906002)(122000001)(76116006)(9686003)(186003)(66476007)(66446008)(64756008)(66556008)(86362001)(38070700005)(478600001)(7696005)(71200400001)(41300700001)(33656002)(966005)(316002)(54906003)(55236004)(55016003)(38100700002)(6506007)(26005)(8936002)(4744005)(7416002)(5660300002)(6916009)(52536014)(8676002)(44832011)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?Nxwgwk+9ArkF9L9F7s0aDfk4qrIjwVZLdhaMP1JEz8520T+urBM4Utbh8V?=
 =?iso-8859-2?Q?UzOO69emyPR2njIQU+DboHV6SLTkz6zjTY5l+vap33eA/dkbLkRQonotbP?=
 =?iso-8859-2?Q?hIVAQi5iZbumU6ysmnZOSG8tA2yuBGLm45aweouE3jo08oYAaS3hextusw?=
 =?iso-8859-2?Q?kA65KxtbZ/60WfdJP7JYIoPXdZrKtsYPaJ+EWGSS5Ba5Czv3wQQGnQ4cPp?=
 =?iso-8859-2?Q?YyD0u58DT/kyzV72qaPFPM3xIk7ozcttA3TJ5RlMOt02LwC8RaSOwIe1bJ?=
 =?iso-8859-2?Q?D6MaMa4+NuM/DJS29iF9gp6qXSGrDxZ4ZxPE8bS1VbvGsYHDGNxTPAulvn?=
 =?iso-8859-2?Q?qzuAlZ+havODWIZkAoqdxx3bv0Av0gF4EUbyMaDj/vjMyQhZYn3rGVci7s?=
 =?iso-8859-2?Q?FMt/HRaSvNHszQEtAXvXJTss7j5E9o1OeRnQZ/1R/iG6RMhtdP+rOxjyc8?=
 =?iso-8859-2?Q?DAJnMWgyQhkLyXP1Ofp4igsTWv6CesjSLvQ0PHZ/Xwj725mSyzCGuGGhM1?=
 =?iso-8859-2?Q?/ZhGXvCFa69v5MaIIc/BkJccM2CSU/cmzwp3/s1KE4Nice0qwh6NdqJ/OB?=
 =?iso-8859-2?Q?JS6ia+kR/WJU0z6UI87XPBgsWvOFy+NaAaGifTzNAx6E+UJwn0w4pn3pKs?=
 =?iso-8859-2?Q?AQJy8SgbARb5UsumbqWtNSs6/obFjG2k1QKQ42IXZd32PBG1ku+MFQwpNx?=
 =?iso-8859-2?Q?JUo/OsklLuAjb7i2OdhtRs32WmVwTLJXPZzYSD61b9FxrFQBpYkm2KvLJH?=
 =?iso-8859-2?Q?AdDhKYerBvW1O2ufTLDCEys8FOZS6TAoGy4jZmtQKphjH18GHW8dfZVrcg?=
 =?iso-8859-2?Q?VRmxcWWeoBe1LfDSFt0OuoEOdQ7UB6S+DGou3K0SDZbt4ZYdHKuOfSfMVl?=
 =?iso-8859-2?Q?y4yRF6Yc7kGBFlwlwv+dvkfflrmkwlj55Vif3pX1CocyasnL/f5NF7uxgP?=
 =?iso-8859-2?Q?DZ1cFNQv1yvt+fPbmZ3wnn4gMGVJtwlAIefrpNvKkutrYbUz3LjJbwpBmF?=
 =?iso-8859-2?Q?Wm+2tkIddC5avfFxXyuSbrRVc4yTJHkHzveuZUY+mzeg36jZcf3liRJWy+?=
 =?iso-8859-2?Q?cL7aCu5GnXdgYoZDPqeGT+vn+LhCdkxdYYYp2QqDt+9srZOU1sEVmBDNVG?=
 =?iso-8859-2?Q?MdHmF+TKwF+1VMH4SGsmL1tO8MQLQUAJR2jqROfLnTxv3HazhaAP4iuY5I?=
 =?iso-8859-2?Q?VnxDaQL7shKrA1rIywG0nceOvQlMIS2Fk4bM4Y68EtYjS+LtUMCcTqVxu1?=
 =?iso-8859-2?Q?jB+ZIPiPfXkfWHZRfKwPCOYEkPA2Uxr/FfZo98IatSoiXMZ31TrNTBvgnp?=
 =?iso-8859-2?Q?yCpE/1UnwBrFKzakQelZvFdDtXYbmSfBsFp4QBoMt2Iw+Os6RPd/XKUaSb?=
 =?iso-8859-2?Q?YNYhwXdFXgNBoetRDoQ3SBl1TZFLngrjiDp+R63xEmB3OREYr1brk6yqz5?=
 =?iso-8859-2?Q?xD7E2Cnu/6o9qDcRlyroUHe9NO6Vwfbxewc/FaucSmEJUzR89/Gh1Oua2J?=
 =?iso-8859-2?Q?uKuI6TYqUnyT7Bmtvmrsq//7zac/LtdYZNdE819No3y4sZr+quX+ogWtP+?=
 =?iso-8859-2?Q?zZmr7k9T2X9c6WlLRSwqBJ/5rGO/xpizu4SynhcoChYqzEtc0yzoTdnihr?=
 =?iso-8859-2?Q?UnQWZn04bYhoSTnYQaOtGZEKaalp2jKxvQ?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a136f06-49b2-4d4a-979a-08db27006a28
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 15:58:13.7273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sceIb6xYcu1BPGyAg1WH4HPAFTzobGl2UxHHJprNdYHg9kTXKqEogITo15zSqNfXvP++jxiQ6Z0Rh9LHdmo3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7540
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
Cc: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Rob Herring <robh@kernel.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, open list <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> >       pci->ep.ops =3D &ls_pcie_ep_ops;
> >
> > +     pcie->big_endian =3D of_property_read_bool(dev->of_node, "big-
> endian");
>=20
> Somewhat surprising that 6c389328c985 ("dt-bindings: pci:
> layerscape-pci: Add a optional property big-endian") added this
> property a year ago, but it has been unused until now?
>=20

No, it also for pci host part. Zhiqiang send patch=20
https://lore.kernel.org/lkml/20210407030948.3845-1-Zhiqiang.Hou@nxp.com/

Not sure why bind-doc accepted, but driver code patch have not accepted.=20

The same case happen at https://lore.kernel.org/imx/20230209151050.233973-1=
-Frank.Li@nxp.com/T/#t

I tried repost the missed part. But no any response over months.  The above=
 one is just one line change.=20

> > --
> > 2.34.1
> >
