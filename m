Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328B273865
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:14:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwPyY6wMyzDqxq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 12:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.61; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=FYSXFZfG; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwPwg454fzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 12:13:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1hV9B70ga86fxqv742WYH/VEznt5RSqqdwlHRbvyuL1E6KXgfCBQ0wxiWxOdPx3cuIm6un/a32dj2jm9q05KPJlI7AiWfB7WnefD20dsar/54jmZ45IyUIWK0Zw2seOQyObkWhgW4pQAmUzCzoIJW92dNUTo7GeOTCdBtvp1wCJthXpGg2p26Amk+tw04z2RYb0kw6f0vyLoZv/OdU79bu0JPlrWXdi4mjzBDQYG9WhuD6SEk6GeWsmP8OnY9bfKZVb9zfwhjCJVBNtFFOeDKjtXzKZdwvuDhEG4XDG17lh0u1Vkuq7GZdAwJhlavn3M23+SVdwvL3+48QnsrBghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEo25q9pYQt04nsIm3rCLBSsPUuxj95sRTnu0apEIjM=;
 b=daPTWkWBJjsmglBsHvIqv1NUqH6gKpZzm2LCBm0tzIkZHYF+qAr/BApB/eLXIRE+EIXrn+YaYLtzZ+6stT1lvJ2XD9IMkj+D3U1ijoKJBFrBcsZadm2Au/ZQHy9CnQlRWPELM5SXOVj5C4jbJYqn35w4LsvOV/7IkcBorMRRbLipuTWWyEMlhcyqFAjs7NM1vsU9tjpr3HKHhT/ScCq2DWvyyaAlfmszCz1dF95qBOUN7FP6HS3EaGgCKv/SThrWeI+2PVAXU3pQvWP/xa7Pdde7tzmc8I22vDBUOH8RD1Oc8cJBw2AlLxHSNvzv+ScbnG38zs91j7I+6hWj94NLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEo25q9pYQt04nsIm3rCLBSsPUuxj95sRTnu0apEIjM=;
 b=FYSXFZfGaUha72V58/GBkAemBVCPC5Y51C7IPdcLQWUl5d5wD+7KqDAgwfaVanW6mbYyRO/GCfsdo7IFfROLjhE5saj12S2AAObXQbsg9Uk1/Zlb8lxtM4Q3wzKXUyqRyrNB6LiqiX5bCFdhQGvFCIntb650FIifkWIq7s+DW5E=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR0402MB3448.eurprd04.prod.outlook.com (2603:10a6:209:e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 02:12:59 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 02:12:59 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Topic: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Index: AQHWjAMgWpwpgcZEfEity8vaUHwtLKlzsq2AgAA/XRA=
Date: Tue, 22 Sep 2020 02:12:59 +0000
Message-ID: <AM6PR04MB5413E0F05CD05C2C49747B4BF13B0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <VE1PR04MB6687A3E64431C16831D09C568F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6687A3E64431C16831D09C568F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9725f0a9-f665-48aa-2834-08d85e9d0703
x-ms-traffictypediagnostic: AM6PR0402MB3448:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB344860FDD721333C96D9F563F13B0@AM6PR0402MB3448.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RSxOz37c3TXEeWuh/C0EDunufckXxUpmUf+bZpDyvAlL4utPz7RcfA7iNgdf6Tf6hSZ0LBjIsJy89fWK4lWgfWzDudlaTageZLdYbgM1PUhEfL0GDkzN2wk2+0NKVPniWDyFAJVrSCJ1csyrrFnm/lC2UIn29HPmYm+ahoqaJZ/o3apgCzOxb2YSKW8Xi6ON0MAfzeQ0ppevkj4UeCqYI9E3mdT6j4xdhB6XH5jlYFwd9H21PQaE5wc7mbFvo1TwrgQnU81FP41VU6go1TLXX058KtDFMW/d2tZLrrsYZ8BEHWTCqLxhT7+0+Tmqqb/RXWOyKrGioDQ42F5ExixYJiik5plncdxQEc49tBmikxJjINTqJVG4qgKjMIyM1tPQFRPctM76glIxPOTce0ctrNaQdE1p9L1tsWs2FR5KMyqpY1Il2UZ+99QFrbFGZ12srKNiUq31IamIp/CWfEnDUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(4326008)(478600001)(33656002)(54906003)(110136005)(71200400001)(8936002)(2906002)(26005)(186003)(52536014)(316002)(83380400001)(66556008)(86362001)(7696005)(8676002)(66476007)(64756008)(66446008)(9686003)(66946007)(6506007)(76116006)(55016002)(53546011)(5660300002)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: r8hDta9RIWzkZIRa4QNeWWm0cr0Bg6waUyNPkAFLhxJsJsDDGoxr28EFeCHYEtqCZs7YN++rXX21ZuyhpeH/B4PUaZu3Vb/b6jpTiOsz6YKyMTD8/ymypPWwxOUp43D+e25638bxqNL1HET1W/FDQLUBlp78DjQDS0jOVO/1DO9/IntMQdloKtG0d6EtnwYAq7eIw66zsm62aNnPgbTSbhuxHPCdFzk3E7KQUQkAnHEd4S6w+ZoqcyUCIzBhICcGBboXHgzwhlE+WaaltvCvD8YAKdckkHLNqh3TJNWxyWvf7sC+no7Ol0MIH4xiQMjwvner6AlWQtNoX3aTW/znF+xasE7ETGhs1zNj8rRNtbGdxkVo5aZyFhDzwV4X/VTW9NWsBwn5pLkvWPWu+K1USCHyjYligsUPQKBGGj4jxo3QNhXWDhtRtfyESvuSKv5PQdGhK1+6LxamQky1iHpQ/5Z7SBQWY6YwrU5WszsElsu6epeFghfO+OQlxRJqCnPJd2vp3B8v4mtQQJBawpSJJ8fElcBlSuf9OCYyRy/IKPJxAcJ6am6EFdbyFF4Z8PTxyyN8TT9gXEKVXs3PqRxRW4SKxPk+EUAXIjtpNSyaEJdWn0ElvlF6Yzdrhj8bzFiV17RdHqtMbL0mp9t9IbZPTg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9725f0a9-f665-48aa-2834-08d85e9d0703
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 02:12:59.2009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NB82cif+P7D8OjDdrIPXy4KdDOsO+VjFwvLJzL+9RvEmGmIP6sbQKKYf2rE7tSZbMCndsDKKiuVFwmf+yoCMTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3448
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
Cc: Biwen Li <biwen.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leo, Rob,


On Tuesday, September 22, 2020 6:20 AM, Leo Li wrote:
>=20
> > -----Original Message-----
> > From: Ran Wang <ran.wang_1@nxp.com>
> > Sent: Wednesday, September 16, 2020 3:18 AM
> > To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> > Shawn Guo <shawnguo@kernel.org>
> > Cc: linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Biwen Li
> > <biwen.li@nxp.com>; Ran Wang <ran.wang_1@nxp.com>
> > Subject: [PATCH 1/5] Documentation: dt: binding: fsl: Add
> > 'fsl,ippdexpcr1-alt- addr' property
> >
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata
> > A-008646 on LS1021A
>=20
> It looks like the previous version of this patch has gotten the reviewed-=
by from
> Rob.  It would be good to be added to the patch for new submission.

Actually this patch has one update from previous version (https://lore.kern=
el.org/patchwork/patch/1161631/):
Reduce entry number from 3 to 2.

So I'd like to have a review for this one, sorry for not highlight this in =
advance.

Regards,
Ran

> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19
> > +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > index 5a33619..1be58a3 100644
> > --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> > @@ -34,6 +34,11 @@ Chassis Version		Example Chips
> >  Optional properties:
> >   - little-endian : RCPM register block is Little Endian. Without it RC=
PM
> >     will be Big Endian (default case).
> > + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware iss=
ue
> > +   on SoC LS1021A and only needed on SoC LS1021A.
> > +   Must include 2 entries:
> > +   The first entry must be a link to the SCFG device node.
> > +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.
> >
> >  Example:
> >  The RCPM node for T4240:
> > @@ -43,6 +48,20 @@ The RCPM node for T4240:
> >  		#fsl,rcpm-wakeup-cells =3D <2>;
> >  	};
> >
> > +The RCPM node for LS1021A:
> > +	rcpm: rcpm@1ee2140 {
> > +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> > +		#fsl,rcpm-wakeup-cells =3D <2>;
> > +
> > +		/*
> > +		 * The second and third entry compose an alt offset
> > +		 * address for IPPDEXPCR1(SCFG_SPARECR8)
> > +		 */
> > +		fsl,ippdexpcr1-alt-addr =3D <&scfg 0x51c>;
> > +	};
> > +
> > +
> >  * Freescale RCPM Wakeup Source Device Tree Bindings
> >  -------------------------------------------
> >  Required fsl,rcpm-wakeup property should be added to a device node if
> > the device
> > --
> > 2.7.4

