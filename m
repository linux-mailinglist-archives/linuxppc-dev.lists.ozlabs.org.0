Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B276BA040
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 21:01:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbktG0X0Bz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 07:01:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M1g1Gn87;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::61a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=M1g1Gn87;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pbkrk4H2Zz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:59:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8piWPJVhQMSzEVLXO+pp7xFJ4kedig6f5ky/0e5MJbM+vXaCuftKMiIDBgeMcJWXWj2GiRO55nE+eCkJkBBkMEp801HnTfxpZLmMhD0hg+DfYX++EkOUT+k33FbgpEk0hA2gDAqiZBQNQ1As4ogku+Nclh6Po4wj6KqPd7JC/ILALXH1tdi11gV/buIODLHBT5u4yraue1cNoj4aS9j3/CEytK2b/FILIdJbcCEsPhhtWQpamvy0rS9/IE6yJfsBywHgbzPEgW+PUGfaf/PYidysYCHi4MFZ3wPuoCIbVF6SsyEXtg4rYIcp/JdfptBR0qbHZakn6pusCmYzK4XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJy0QG0OsJpYmzZMMH9kR2tsGdGcoz+c2FR8gYn+PYg=;
 b=hkqiAKGj/Kg9eTC/ZrJ+WXBqj6YmPnN/e91qfl0OYgnYnXWOVoAmBQmP7gUIbSP4rG5j8q7lYgJrlISP6vMLYYCWjI088n2oFwJU1+LUVlCscXxeutE6LPrA0SF4eRQuUp7Wlb8up4rb1UhfTdHOQahBv5IamygX2PqI/y8m4ZhLOIG+CVhyhFir0fyUwFv8v5uBaHFA1fpQ77HQ+2H7UxcqYKO6aX4qN+LArxt4mK5l4upLO6V9nUJ1zX2fmcEAfx/KK+lE0ydMN9OIoyGqKxKMDXNfsmF9SgVQ7xg9AzR+O1oRdUSh/Ui8m4WMg0FTeepC4tlDdlFM9HZeyF8Q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJy0QG0OsJpYmzZMMH9kR2tsGdGcoz+c2FR8gYn+PYg=;
 b=M1g1Gn8764WPBID+dbyxaWguT8gFvHJ4kK1ktFCjXvr1TxNJC3Ixl3BphxdKjit5c3bQGDVXfUD4ShYwZ8lS2erKatqvz3/TVcFhlVpiRlxGY6iW/DhZYKyG6G8gk6DVhacMlSEB2Bjv2f6eyMJyYKbrLkdblg0VDWnozGQjcfY=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 19:59:31 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::fb2a:a683:b78e:b9b5%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 19:59:31 +0000
From: Frank Li <frank.li@nxp.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, "helgaas@kernel.org"
	<helgaas@kernel.org>
Subject: RE: [EXT] Re: [External] : [PATCH v3 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Thread-Topic: [EXT] Re: [External] : [PATCH v3 1/1] PCI: layerscape: Add EP
 mode support for ls1028a
Thread-Index: AQHZPJi/wYJCGtANx0aZ13DX5flOpa7InnwAgDJG+kA=
Date: Tue, 14 Mar 2023 19:59:31 +0000
Message-ID:  <AM6PR04MB48384886D192DE5339D7B91688BE9@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20230209151050.233973-1-Frank.Li@nxp.com>
 <ebda03df-ad02-c89e-882b-03f7514c3d92@oracle.com>
In-Reply-To: <ebda03df-ad02-c89e-882b-03f7514c3d92@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|PAXPR04MB9124:EE_
x-ms-office365-filtering-correlation-id: 79148b94-2122-42ca-026a-08db24c6a077
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gBFqVnciBnjJarHNTiXkUrGSncxTORdmgaU91HS0tVdzzwTT/PXeyPHX8/YYC8cwhdd8HHR+04qWh/LWFnVOfP+j+vvXOwWLxt8nzVJyBSeipYhVeXqXGpiBpG/qLx8VzfaZ+lJUY2uZ4XKqSDI2utwIox/scVRjGLw+hdpwCVYTIT0J9BNIeLuWcKJQgdCgfJOaI65ZL1J+IaqfHCrf7As4LyDG8u0oJXU1/dJMVbdSE81rGzuiJuPj2ALFlMo+JtoaDm5u6BtjUetlx2NjhXtU8Wfxi7onA8iVpEW8cnfDjF6H0odOIAtDEw/iNNzlC0o/y0MiHB/yDUV0sRPNY+4JqJrjU3adLoPsSxIZ3cQ9rOwaZtHx2vO8ExH/ZPrH+bERweH/weENeH9xegUm0AAdWzTQwusNS98FBJ3MbD20KZD+/LPfd/2+T0fDMmjpca3xjdnjCu8cT9CWNE4UurfSR2DC9007JouPPlItKSdEIsgBDyGtR2bTZwQr5JNn3g8Iyfbr40BpvGF4UrZUASq6MnQY3h6GcWRgtLPzZbBhHA3BM4/P8Cq9eYR0C4hHs8Q7ekIPEx+lH3Yd8+b8QKWEc2h3CEBTpd9NUHSdawnzlaoVbFAw1JqDKXefAngZaQViO1RHUUjSM1QXmphCaEoyN2+mwNRr/eYn7UQi0HkWwBSNz3E2B0ffdVspNYX1br8PGEFWwYKoTF4lR5Gayg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(451199018)(6506007)(44832011)(7696005)(26005)(966005)(38100700002)(66446008)(4326008)(66556008)(64756008)(45080400002)(66946007)(76116006)(110136005)(478600001)(8676002)(122000001)(66476007)(316002)(54906003)(9686003)(186003)(7416002)(5660300002)(55236004)(53546011)(41300700001)(8936002)(86362001)(71200400001)(33656002)(38070700005)(83380400001)(52536014)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Zy30y2bN4LUOmF90yqgB4yU6j3WckVa5thTzxzixJJzbk7KpGvZ3agUluoVD?=
 =?us-ascii?Q?byfCGGsWxzdl9AA7zHePPy5SsRf1/219QGvwVqtJSui69NR1cAc3/cABv1Kj?=
 =?us-ascii?Q?t/wWwzTLpN6XKphpSkXbjUYpcyWabWfCJpNpXDiCCGaJhygcY17vRZWTPuCX?=
 =?us-ascii?Q?/8GLUinWilwxM8/7dYwGyiKJhcr3/r9nXCGQ/mqVg5ZyadsNF9oje8r4jYpJ?=
 =?us-ascii?Q?osLgOVLMXbJROZr6P+/8n+kH3ile595qqOQOpH1uc+c/hKLnvfC41FuIw1Yk?=
 =?us-ascii?Q?+IdqIgfEarIyMnsErPHSoK3mU3UCNz0aKagGFfz3mhlrbK6Cip8XR3s6VRPE?=
 =?us-ascii?Q?ew3Rjj3f9nN3BQl+xK7y84YtXsN62mQ5NJfTg1SGqsG+hAUF24iXeDBmrL1n?=
 =?us-ascii?Q?sArJ0FrsfVXGrAkzauS4oAyZQpQVeH42GggVIw9hEl2a4EgZnHsPXIo9fUIL?=
 =?us-ascii?Q?6TDoGoVK+zfBoNlevOZzxhhh/NucreP+24Ytaup0LJKQiQ4fk+xf5C3rAPsb?=
 =?us-ascii?Q?wHX3QbKU57T/g6E51gjLLiIvYyPIukXtjUe7Yk1ywhmhcGm4yKj6LzrJ1yFm?=
 =?us-ascii?Q?vJtWcfXEvPXYc/zI2imyJV4yV5CSDvgnaA3a0Xhg1ERMddF40LxUF9rbyGgP?=
 =?us-ascii?Q?AjqJDVckXhesM6LcYKRDzszqO09hak1Cp7ftNqq+S6LByat+fztut7EXfKnj?=
 =?us-ascii?Q?ilV+/HT7dzQIeFlf/q8VYAqtmXT+nPQLxmjJudE5r0qPo3BT4Ycsw9tUyrDW?=
 =?us-ascii?Q?I4pMJpfxRKZ7RJpk9T6O2/00zYYWL3e9xE6PjULbl0vn+p4sXy2U5NXN37hF?=
 =?us-ascii?Q?VR+XJKAiWtCBQ+3I28CsMdlQ13wwr1SA9NDgzXdR14cOORlFuk0BUvFIjpOW?=
 =?us-ascii?Q?5m0mUn2qI9KVt4VmsuBzn9AmiKg2OcWJXKY3f2/T57wKsrAEw1joP4cWSIYA?=
 =?us-ascii?Q?RALPsHefRJOjjL8wAYp2sDCdWUt4nOE0BjAgvS4F8563Q5dHCE0SZmGpJpyq?=
 =?us-ascii?Q?yXKdlH31e4s5TGESd7+aaYVIcZ8hnpkTq8pJcp3uWqVvpmyqUr+AjaC3h+b+?=
 =?us-ascii?Q?joyJohUy03VS/W9ON0JGCFDEc2PDpFzbqHedoEm268CXgg4HpcwOm7FkUDGc?=
 =?us-ascii?Q?iK0HlOWJ/bUfI5QGqmHdYsB8tP5SFuxHzKxWz+R6V5xveZ+rl4I/fDVbrVdX?=
 =?us-ascii?Q?/efIF2ycxKZj4/uxCvilquMlwjUXa1FkuPJWQBKIY6OV456aj2t6MzfrqDvm?=
 =?us-ascii?Q?pbnSZHjfT5lIVYu3MdHjjjFqD3wwJ9QzLtf/v+n+tkoM9+BqtX3jz5qULwS1?=
 =?us-ascii?Q?IxwYXd1OChFIZDyMopY9qZR6cK6M14VhnpxfNt/UMGJo4qJxECpeqBTGlE57?=
 =?us-ascii?Q?xlZg5FCuLKswsr6ERXpb7QqRp5KBkME9iXEgoreGRMdkW/NxZAswToEz41Ct?=
 =?us-ascii?Q?4WsmIXagX3ZNS6JPLKUaNaaMWxuat343uvJE6fBaOk3j5nuufipVTfacRbnc?=
 =?us-ascii?Q?N7+H2hwTwgb5SEKfZSMpdAfiRiT7LvBCjmx1Wfg06AvlwDgaoFp+IOFIZQeH?=
 =?us-ascii?Q?ull83/548MigU6xdUPo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79148b94-2122-42ca-026a-08db24c6a077
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 19:59:31.6710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awFwztBYBe+pTgEh8l1PE6XUwdyf3evtyEqXV7TTes5slR4T/Q75s8SyDBskOytyH9M2594F1xG3Hr5hydM4EQ==
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "kw@linux.com" <kw@linux.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>=20
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>=20
> On 2/9/2023 8:40 PM, Frank Li wrote:
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> >
> > Add PCIe EP mode support for ls1028a.
> >
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp>
> > Acked-by:  Roy Zang <Roy.Zang@nxp.com>
> > ---

Ping!
there are no feedback for over 1 month.=20
Just 1 line change.=20

> >
> > Change from v2 to v3
> > order by .compatible
> >
> > Change from v2 to v2
> > Added
> > Signed-off-by: Frank Li <Frank.Li@nxp>
> > Acked-by:  Roy Zang <Roy.Zang@nxp.com>
> >
> >
> > All other patches were already accepte by maintainer in
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Furlde
> fense.com%2Fv3%2F__https%3A%2F%2Flore.kernel.org%2Flkml%2F2021111
> 2223457.10599-1-
> leoyang.li%40nxp.com%2F__%3B!!ACWV5N9M2RV99hQ!NR9EU4fPDwxdyrb
> 9tdBm9VNIMHSlw6dLgXCAPDSrm7ftWVNrh6JldLGzzrKyiE0xRlP5OdiGBN7PCf
> 9gRaA%24&data=3D05%7C01%7CFrank.Li%40nxp.com%7C1d32974e205b4a8591
> 9f08db0ba30b9b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6381
> 16567129733840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sd
> ata=3DhGKffPqpE%2Ft66x71Y47ocGbIuFH7vpjLadlAXbnyBOw%3D&reserved=3D0
> >
> > But missed this one.
> >
> > Re-post
> >
> >   drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > index ad99707b3b99..c640db60edc6 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > @@ -110,6 +110,7 @@ static const struct ls_pcie_ep_drvdata
> lx2_ep_drvdata =3D {
> >   };
> >
> >   static const struct of_device_id ls_pcie_ep_of_match[] =3D {
> > +     { .compatible =3D "fsl,ls1028a-pcie-ep", .data =3D &ls1_ep_drvdat=
a },
> >       { .compatible =3D "fsl,ls1046a-pcie-ep", .data =3D &ls1_ep_drvdat=
a },
> >       { .compatible =3D "fsl,ls1088a-pcie-ep", .data =3D &ls2_ep_drvdat=
a },
> >       { .compatible =3D "fsl,ls2088a-pcie-ep", .data =3D &ls2_ep_drvdat=
a },
