Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFFD64F056
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 18:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYbYz2kQXz3bjW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 04:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Uf0F/GPE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.7.72; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Uf0F/GPE;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYbY129K4z3bNw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 04:23:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYY6g5AoPBZIwW8MLucsxIt945ijtClxxn7g3oX6uCQD2jEcLpFuuOaRK3+hvnMC7JVXCh/WdKf01cA4EokxH3dMbizyaERO9h5r13eLWK1RgcbcZhn0R5E5uI+r3ub1CqfnT/+kTJlqdZ52d32Uqn7osdARbRCIZXkwCro5MKhBTEtEv34e8SDypP8P7DIckyjiOl55guLVKH/VXiQBcEdz3juTho+FhCj72ra8NGisyTVqg4eyRtgtlTmvtp1+48/K7UMCtedD9QCIbfy10nq7gmDTnbsWVUGlvprspa+SqGNtpipimkZfwnXQP4184Qhe3OFsMF7ssZ9AWDBjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcQggFfK4LqT/PqTB9CdvrmjL+xZbE0s2ducRIvpYA4=;
 b=oS7nON6Vgf8noMYqW9++yeMQlqAgU3HatpB9vgNSokfrDLR77rogOv67rP/6QN2O3RTs8yFBxNF0oTKTFoh0clFslP9nvDx9y78Eg2ELiHjgmWrRzBFxz921pUdUqgLJcS6fQZYUdgNz33GVcak4ABUBw4nKXTi7VrgHbTZuboZOrflB/bO+H+0mNJt1D9TI0VhJhooKLl5WJOZ6HywpC+08ZCl8gpJgVEUOrU8Pt7gdWIEkZtJMWZp9XXz9/pGHgvP1tI+HIlNi0HyoGYUQHo0jiApmoTMW4W/5WxQ7CqWpY0VJ6NWw+UenBc96ROmjIZrDpaxBemehhf9Os2WQCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcQggFfK4LqT/PqTB9CdvrmjL+xZbE0s2ducRIvpYA4=;
 b=Uf0F/GPE/7amiCkrvNjIsDEfN0D+kKoJkVmHcYOweXuqqHQncOt5aT4bv/pk8Yep8L8FhpAFleatKKk+w69nCkSpLFP/ZwqPjf4gQ7+HJOcesdWz0NshUqWZKDyu1W/0IDnjbYSqEqvzNUhNshKpoSQP6QKcyGCDC8ddNPcYqzA=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by AS8PR04MB9063.eurprd04.prod.outlook.com (2603:10a6:20b:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 16 Dec
 2022 17:23:11 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::91ed:74d6:8973:1cb6]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::91ed:74d6:8973:1cb6%5]) with mapi id 15.20.5924.015; Fri, 16 Dec 2022
 17:23:11 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai
 Hu <mingkai.hu@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Thread-Topic: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Thread-Index: AQHZEWmzfhsjHClZV0OwPPo6aL1AZK5wwxFw
Date: Fri, 16 Dec 2022 17:23:11 +0000
Message-ID:  <VI1PR04MB5967C6D4386912085183FD868BE69@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20221216161537.1003595-1-Frank.Li@nxp.com>
In-Reply-To: <20221216161537.1003595-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5967:EE_|AS8PR04MB9063:EE_
x-ms-office365-filtering-correlation-id: b49368fd-0e30-4aec-f529-08dadf8a3521
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vPdTrfmKn3ZusPtFYaAfrd4lYEbBqs1dcdue0iL1TfgJEGMtXd+9fsMgYMNm0zu1trDAobql2pzK4flHJIY5RaWyGrmaJnbZU5vXw2/MRpPFweEqPanfo/QwpXomU1EfgI483O2lGdB/SpdJnfHRAveSYI6sMj/vdCgGMIfjcCG+1VUXihMUJ7YFFsSNzL8Wm+qABAx91QyL73v5FwTuCVmSC8vlU1JvxtpZYpPBVPFwAljUFiZKgM+//qgYxSz+pFsbLhY8hfJ0mq5UfkswQfzPrqpMpm8RrCGcS15/e+a8Vv0vNSdSt21BCJRC+YBaO/abBjkh2oBq2iH7mMTLDpdysXxct/3k7cgfgAOYBJamwNxuWxjUwwXEqGjS5rQdHFFj4ePrU5Zh9XAH3VxV1b/z1pLwG6ESIqP+ld7OrMRetn+V35DsuC209ESPhc3a02nKS7EleQ/XYledAuKohp34H96SLbc8sf/Br9YU8bijeA/F6VT2OW3n1S3+cG1c9orp7mo2BOBtsmJU/i63G++I8F2peUd+6iXWlvII30JrkoQZNa/dhVPuqvW8DD5U1vTo1FuaJPo+LI1lOO6tQRenEoUoBh2uNL1n0WQUVTFp582yA5nOYX4L7dlmUlEaSTqvzRKTyblRmFXRYWdGtMGjJZWlc9UNiZ4+gLrqaEKlLNTpS5qWWcz6CvrA55cHOxVHEvXq7K5ssUACm2jybrideBLdvyGGDfWlclj3FNJiiurB86pGHFrUyNeflbAi
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5967.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(478600001)(38070700005)(33656002)(44832011)(921005)(122000001)(55016003)(41300700001)(66946007)(71200400001)(966005)(4744005)(2906002)(86362001)(5660300002)(38100700002)(316002)(66476007)(55236004)(6506007)(66556008)(76116006)(8676002)(110136005)(64756008)(83380400001)(4326008)(66446008)(186003)(9686003)(7696005)(52536014)(8936002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?QR/2oPdlE/x+X/WjSMYONWUVvAtKD1G1e/SJR0bpF2N93MYTKl8brE5N9p?=
 =?iso-8859-2?Q?MvXsbzG0jHG1aDGQgAWIsivPVDGEftMAArw0hRaxNCS7BIK9KxFW9TkL26?=
 =?iso-8859-2?Q?JSWNVbLBY4pG/N5AXY02PlbILblA71lfZddkjBfIVD8kitNpbkiyymDS2B?=
 =?iso-8859-2?Q?sVGzaq5mUvfjbdx6lHRV9IIoExMPukvKujTNXKEQFnE88UqP+5hOYTURwU?=
 =?iso-8859-2?Q?p9/5RthwK5EmUw+lwiPtoGWVjd28CW8dZBsWjGcIpAq0GZnSlZbE9mPwwJ?=
 =?iso-8859-2?Q?bIXE62ZPfms/JGZsJnm3VrxTr/xUIiYgkW/kl4kNfsjw0nt4aZQzfplXNX?=
 =?iso-8859-2?Q?fpqsrq1Z49AUXMJ807t77Q2tIxM0zID0wqlRpeknQXNURjIrKjeM63uLM2?=
 =?iso-8859-2?Q?lRgDoGfXimU2WBYQch8qapEy9955aNgWusBboKs7lCEA7VALTVyZM43CBn?=
 =?iso-8859-2?Q?McBUeJ0RY5VLOguyawBxjRokefZrJTr8iVC/a02yQ3lHFEl8o+bd2oS/iq?=
 =?iso-8859-2?Q?0mYBrkIeP5rvt7skjjAuLFSSIbVSQ/FQKbeDGJRHBkp/8M3rIJ1F8rC1fI?=
 =?iso-8859-2?Q?85ixoVZbJaMbTK3DtbYP1JHB2CUOZyTe1h3/jT86Ch1c+So3wEmVl2f9uz?=
 =?iso-8859-2?Q?jkiR6ioMoNKUw4tIIEkZhtzX0IybEoli7uY1hpjDFTGVTvrnJgCRzbJAUk?=
 =?iso-8859-2?Q?bzaFWUPuZozNpelFJmzIDpy2+TICVRDsQp7y/LTPctzChFgB/SlSxo8FH2?=
 =?iso-8859-2?Q?O2iVs0UgFFhuMG13/obpTtQBJ56CGvqOFmMRUSbTQEAYHAdCeIljaRXbWt?=
 =?iso-8859-2?Q?DBkMne62DIdW9CkPUqVfUcvHm17L3X5OIpaX9Xu6lfjlsTUPWkGU/7Radt?=
 =?iso-8859-2?Q?EM+95DKKMISkepibhmnEwAz8ZOcf+1rxgohybI/YOrUWuIDTFhNCG0iXpZ?=
 =?iso-8859-2?Q?LVQEdqmdfcFEBuP3yRiOU2uYjfH8HRT/CNc9op/f7ErL8i6Nmnj4fdi3XY?=
 =?iso-8859-2?Q?520CBEPspMPs4W2rcG2g/Z5cQ2/mk4GQa49qpT9CG3f064EWgR1VVvdxdT?=
 =?iso-8859-2?Q?+JCdCy8n/u51emn84yU2dNq4sDuP7wVLxqJTXFg1/x67a+4wvObwtj/VaR?=
 =?iso-8859-2?Q?X8bvvDMbXHVfS1Vf/RpjqDq8EE7+N9KaXF6gj+ZVV9usUdBC/DyXOOg7ES?=
 =?iso-8859-2?Q?zh/o+pA/eaqxu34IR+6fQJSG4NegZ0MbAYP2PPWTk5Agij97P6JT+pLf1v?=
 =?iso-8859-2?Q?wYeT9a46Ibssn2LIi/YU8vG9rr1EuUw2g+DU2G4HCvgLtHRVfnLPNhOpBH?=
 =?iso-8859-2?Q?DaZZQHLOnJ7McpfHUBpdHf8MhLNJ6EKoIGbxwjVn2uwNZJ0S82PktIsWPh?=
 =?iso-8859-2?Q?/OHhg+7Hp3HCRwgcBC4Dpt6yaGnjxn/FtiMrcmWDwYeTddZb+6qg9OXj8C?=
 =?iso-8859-2?Q?t/eooS0qrDnSDi1VxDYAC0CaUR+8qWwtwHHbBpkDKg8AmaJk/hapyg1Xs1?=
 =?iso-8859-2?Q?SnAr4ovfBaUcEZd5u0NXqr2LrufJMl2rwMCWlSL4iMgV4cRaoKIUe98a3G?=
 =?iso-8859-2?Q?TkN+Ij8U4Bw45pi6xUFQ/xnhI4N8Qd4ykYLLeqtMs/656oZ7tGLtujAF3C?=
 =?iso-8859-2?Q?qAgWjifkbPyow=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b49368fd-0e30-4aec-f529-08dadf8a3521
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 17:23:11.5620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bR4ZuUEJLNkZEVhwy1vAUh/gbcTbylUSGLjxBgbd6PkFal5fZNQd70Xzg1Ow0SU9E6fPJilUfYOq9KpLxKdC/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9063
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



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Subject: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
>=20
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>=20
> Add PCIe EP mode support for ls1028a.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>=20
> All other patches were already accepte by maintainer in
> https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/
>=20
> But missed this one.
>=20
> Re-post.
>=20
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>  1 file changed, 1 insertion(+)
Acked-by:  Roy Zang <Roy.Zang@nxp.com>
R
