Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD572D07C1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 23:52:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cq1sd5F0mzDqdV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 09:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bp.renesas.com (client-ip=40.107.141.113;
 helo=jpn01-os2-obe.outbound.protection.outlook.com;
 envelope-from=prabhakar.mahadev-lad.rj@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bp.renesas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-renesasgroup-onmicrosoft-com header.b=hma4eloN; 
 dkim-atps=neutral
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410113.outbound.protection.outlook.com [40.107.141.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cq0wy71vgzDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 09:09:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmQwSLuvhWHC1QGCby1ezicfsFt6bnW7RhgvacPJEG16r6IXDsnWFaBV2IfREx063XP8jUoirA3A4LL1dUzQvn4AqfMWzjngPl6t/DsS76sEvLMXzEftKNmgCFH0GkbttxC4duDoQvPblfljMx/krRTnXpsrDgcaPvVs1sWHwgSlnbJq7odM1fo9CrL2S/k+dhl8uxq4CKSi7+WBIXE7N//pxh6Bh5/OkxxbWt/fiEeV/OSeUKMcAxx9G7EqScVgF6lpM85Qt2QAPazG18VBZcKlmsBW4Cmp0eMvQCiD1Sfok1q/R6/U9z0SZ2oTU5gM2Xkyq5C9zBp2bh/rqPDqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBCWCA8liMG4RrAS8XeHFIqKmlnmRbMj4R1QgaThGhc=;
 b=XiEA1OZwDJZLs53isfDasaHt+qsueMXoWJPAlul3+qTvkL3YpWL+SxJr2QnzEp81JjZTuaFJp/LPyVDJYPL0y9DVp781v2wudDHFe+Hp4aljZ4+RJ0G/pYak7dXsbK/2UyypuRpd7C+vvEdtpWGLza+z3Z+y2PlHjHD/H7gFcLjunuJzY7ccROXri8guw0S7dK0HWlBRKP+LrA3ZQmDBHiC4zTGEGGkQFHC/Mq4JMA2Dr9BEa5bKAERKl3oMIvM24MgsLyvxWrjP/3LneXt9cLGW89KAtqxtJw7wDuQbSn1wC3W89h8KUQOB9qHjmFJvpEHujjI2dCBSF423uDpWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBCWCA8liMG4RrAS8XeHFIqKmlnmRbMj4R1QgaThGhc=;
 b=hma4eloNKLn2YQV/35HUsxd8JE1SUCV/djwO2ZP7itW2shihvwy2PJJUZ2wKK81G+BNFU+sjdEJKLedpgqMsfWgNPfP0x6t/H/p3Ko/2/C7VkMaXCn7mtubI8EPpsbz9JjRtyR2EC/g6oYE/1WC+AsFK1x4+5EPgr69d+2eGzNA=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB3207.jpnprd01.prod.outlook.com (2603:1096:604:22::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Sun, 6 Dec
 2020 22:09:41 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3632.019; Sun, 6 Dec 2020
 22:09:41 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Mathias Nyman
 <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v5 09/19] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Thread-Topic: [PATCH v5 09/19] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Thread-Index: AQHWyxresVcuPKjuRkaonyGzMr8w1Knqohuw
Date: Sun, 6 Dec 2020 22:09:41 +0000
Message-ID: <OSBPR01MB50483D3B3FFA24BFDA10B80CAACF0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-10-Sergey.Semin@baikalelectronics.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baikalelectronics.ru; dkim=none (message not signed)
 header.d=none;baikalelectronics.ru; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3aa26450-ff0b-48da-1088-08d89a33a17a
x-ms-traffictypediagnostic: OSBPR01MB3207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3207FAAAAB793BBD5F70ADC3AACF0@OSBPR01MB3207.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WEFD35+EuyipVwwTNg/5nyXpCpriBgslUjyuDHNdCI96zcTedmAbbRfDOQbG9jtivtGDkD0RsDyS+rdDfRHeIHUtRCdn3T9I3nyp4YKdWlp416mi7ie09xWwCL4WXm8YPzgepf05tpjLzsc7u6tCTT8W9wr4ejXDC9mzY2g3GuqqVpYFq0iDsBG8Nzeqr3cKN08M9p1/mr6ZoVKxveAHnrcdRn6yVad/63SOx9t3jNdQHK2h2XVw5e9v5j8/Zayo93aacC90TZP4a/A44hJUFEpKYVILCOuCKvpVwEmsFC6hcN09NJc32FkExgSWI0CsR2WojVJIcnFgi6FS1LDxOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB5048.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(66476007)(9686003)(316002)(110136005)(83380400001)(71200400001)(2906002)(66946007)(55016002)(8676002)(5660300002)(4326008)(6506007)(66556008)(54906003)(66446008)(64756008)(33656002)(76116006)(86362001)(26005)(52536014)(53546011)(7416002)(478600001)(186003)(8936002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?F7PzEAXNglcbAHhFqXdiak+iyCDVGiuIZo7NKBSnphHRkkaIKHZC9LTe4CUR?=
 =?us-ascii?Q?w5a6SP7y3UrPxuOWM6mSwY6qhsjmgq9A1OMG1ub9JPPtOi+cbZMIV9IvtWwC?=
 =?us-ascii?Q?yIIG3cHJEN0Wyi8gnWLw8T9ys3VMi+3cq0Zrb8KJYrt1fFT4iRNxQ2pf5rdV?=
 =?us-ascii?Q?3Hl/Jxw+4EUdKECS8OZIzg51sgbaA+AYD5kPDVzZgf4Fqcfa00fbD6UBq6p3?=
 =?us-ascii?Q?XhtnpblLbxL0Dw9tnkBI2j0T5M0x0eznhFWGgFVRp3nZbK34XRACMp56sUK5?=
 =?us-ascii?Q?nU/C7hZQwCNuicsO3rvyDpQ5kspOZusXUAhaY0NBVvoaIPcwhFaTjN94OAI8?=
 =?us-ascii?Q?ML6XE+WRyktwOvFORDBW0u1LMrjsmSqAeMX4s/D/Qj6DEsXLuSHZertP6sy5?=
 =?us-ascii?Q?hW0mdPmSSim2399RKQkOojwT63AyCzFnkrZkjUKKaYqSgHVkqOHSwBh2pxXk?=
 =?us-ascii?Q?+YruyLqcb3RE4pia7xZRdA+FX/xDnRyjMZmLlzqnpLFKAtaymdFtOpUSZZZl?=
 =?us-ascii?Q?bT8LXA+hhUJXM9SX94r0KtSk+OnvhrEkKK+FMLqHFETWTw6PwO5QajA9Xwlr?=
 =?us-ascii?Q?sqUSH7Gwe5DJ32yjrHstAZtMNk8fxivjeaywXfBgCJeUT4yuMNEVIbHkA6Nl?=
 =?us-ascii?Q?Gifs12ZR9fcjdQ0mTBluDqx+v/KiTvtMXBulAoX//WH6PagHxr/BMJ62TdLt?=
 =?us-ascii?Q?C+GVoeU1Na3xZVVk1x3DGteIie31dN6tWLL1ZQi28ek3Zmy5ATqQC/jAtQvw?=
 =?us-ascii?Q?7FGepiq20srvS7t1uSvdlUdIRooP+5tjrgcogdemzqbQRn5xPvYRzUioZW25?=
 =?us-ascii?Q?DtwsSrGQCp4Y29OIExbgAOxVQTLhc8yFitydeF7QhMDOgJ2wngwJytu1l/ne?=
 =?us-ascii?Q?B28yDD+RMEcI7Bba/LuhxOz2i1ekg8jxIZJ0/sW3zWM56bjkXF1b4kMrzE2Z?=
 =?us-ascii?Q?v8nnqWC3hZoYNTUBTscr3Szhpyx2wpW7zKTJ18kbiYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa26450-ff0b-48da-1088-08d89a33a17a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2020 22:09:41.3337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxUmbn6Gx1Yijr2w1dIzJugdsblbey6avxMFR5E0a7cIgsUqHfETo+jWnmniczv4UqPzfn55WfI0oiCvVyQV56eRazOxpg+r5SzO2A93oAz9hVcMFq8eZ3lAtakEEOuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3207
X-Mailman-Approved-At: Mon, 07 Dec 2020 09:50:35 +1100
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
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rob Herring <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Serge,

Thank you for the patch.

> -----Original Message-----
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Sent: 05 December 2020 15:24
> To: Mathias Nyman <mathias.nyman@intel.com>; Felipe Balbi <balbi@kernel.o=
rg>; Krzysztof Kozlowski
> <krzk@kernel.org>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Rob H=
erring <robh+dt@kernel.org>;
> Chunfeng Yun <chunfeng.yun@mediatek.com>; Prabhakar Mahadev Lad <prabhaka=
r.mahadev-
> lad.rj@bp.renesas.com>; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.c=
om>
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>; Serge Semin <fancer.=
lancer@gmail.com>; Alexey
> Malahov <Alexey.Malahov@baikalelectronics.ru>; Pavel Parkhomenko
> <Pavel.Parkhomenko@baikalelectronics.ru>; Andy Gross <agross@kernel.org>;=
 Bjorn Andersson
> <bjorn.andersson@linaro.org>; Manu Gautam <mgautam@codeaurora.org>; Roger=
 Quadros <rogerq@ti.com>;
> Neil Armstrong <narmstrong@baylibre.com>; Kevin Hilman <khilman@baylibre.=
com>; Martin Blumenstingl
> <martin.blumenstingl@googlemail.com>; Ahmad Zainie <wan.ahmad.zainie.wan.=
mohamad@intel.com>; linux-
> arm-kernel@lists.infradead.org; linux-snps-arc@lists.infradead.org; linux=
-mips@vger.kernel.org;
> linuxppc-dev@lists.ozlabs.org; linux-usb@vger.kernel.org; devicetree@vger=
.kernel.org; linux-
> kernel@vger.kernel.org; Rob Herring <robh@kernel.org>
> Subject: [PATCH v5 09/19] dt-bindings: usb: renesas-xhci: Refer to the us=
b-xhci.yaml file
>=20
> With minor peculiarities (like uploading some vendor-specific firmware)
> these are just Generic xHCI controllers fully compatible with its
> properties. Make sure the Renesas USB xHCI DT nodes are also validated
> against the Generic xHCI DT schema.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> index 0f078bd0a3e5..7e5ed196b52c 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
>  allOf:
> -  - $ref: "usb-hcd.yaml"
> +  - $ref: "usb-xhci.yaml"
>=20
>  properties:
>    compatible:
> @@ -69,7 +69,7 @@ required:
>    - power-domains
>    - resets
>=20
> -additionalProperties: false
> +unevaluatedProperties: false
>=20
>  examples:
>    - |
> --
> 2.29.2

