Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933C481C4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 14:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPpLL38Spz2yxP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Dec 2021 00:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=SFpEcrV7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.84; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=SFpEcrV7; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40084.outbound.protection.outlook.com [40.107.4.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPpKV5c9Hz2xXx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Dec 2021 00:00:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbzT/Mcqp6IrkcExKn8Stg1MZW4dCDhCJWsC8YPKvaYZCR32/xa11GhQ2hKctkxm1RrrCW0VF8WzDkUW18FCAjrUbSGQhREfkTUyIDYUUBQ2+Y+xwZBpiUpTDf0QvjwW8QY80O5EFr0HCFUg9yVrvSBR7ix6PxyV83+S3J2Mv4lpgPrRIj/pIUnXbngtBuArcJQKIH9tTurmWockUJA7v+1K1JLTyN+KgdmHYOUbFycJ0MOk/YfM8BzHXA2xKOZ1hs8gePNcrvgQ8ubuysR5Mki/zocVGak169fAdNtJYpHtlWg0mVdN6QQQ2yujHBkY1fZ8k8NwpxUqLUOITMcNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPScv5aVAZDucZD+LBKkeS5nyXuFniWj/F2aoqX38fI=;
 b=bNctb8qsdxf+jprZAFdcnssSxnvU5hxyryflsfpw+HmPnvnH+Ch4NEwAFOEH54IXjYPC2h0IdcD273Mdhc9OrnnXPB4ERXyGEb1uNGiKQlbuTu+yGGh3Z1p81gyNLbNdFmnqBczeawGXiyXC/s4xgCXJ+HFHqESS3HTkbEWUEaq8OfttjwOL+gV6fTK+SZQpjLPbrYfCsybLq7lC8vTZvT9SoPzmyTOVSX+hg6nx+27RscrnrDrcht06oCmjj3unRpp9GDB1GXu1J7ctkWroOdZM1MySPIPnh1bmlfU/Wc13xlyZ+cd+RuUgczqSnPY1J6DD0rdWMHOQajDy6SnJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPScv5aVAZDucZD+LBKkeS5nyXuFniWj/F2aoqX38fI=;
 b=SFpEcrV7NiaDqxMg20Xwop3wkxhWhVwQ12O9r5pyi8Rc/vqppxycrvuo6rQpfYNuisVOn6AmyiR0zHhg4xdCxxiusqc39ISOlA9w8CZxn3d/4p3Vlx2L+kN0zpUfG1NR7egHO/Yzm7Z0uqZJ+UcwwyxoJ9KxNR8EB5b9QwFn1Vs=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB5293.eurprd04.prod.outlook.com (2603:10a6:803:5f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Thu, 30 Dec
 2021 13:00:04 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226%3]) with mapi id 15.20.4823.023; Thu, 30 Dec 2021
 13:00:04 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Topic: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Index: AQHX/WognYLuoHin80+YgXjEGjdBC6xK/32A
Date: Thu, 30 Dec 2021 13:00:04 +0000
Message-ID: <20211230130003.pzwzac5xttnnksz6@skbuf>
References: <20211230104329.677138-1-bigunclemax@gmail.com>
In-Reply-To: <20211230104329.677138-1-bigunclemax@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca136a7e-8e17-4953-b473-08d9cb944c22
x-ms-traffictypediagnostic: VI1PR04MB5293:EE_
x-microsoft-antispam-prvs: <VI1PR04MB529301D2E340F3705600B880E0459@VI1PR04MB5293.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /B+ZOTW9qTGebbHRnsmZ+SvRtU5gPE26UXx1Bp5MpSnKHKh8plHl2ZEjjyw4p8wDG1FUj1KMzPWgpdVPnlhG9aQjjexYFsg9zj2MAlTMbRsWQHkd8oPdl7nxOtQmCDt6Nylic0inXZCYhOhar5RG7+GB155zycjsfOAvs2D/b++/clgzmARShlUYkidYytsVphp6u6W7qOq7x78DKlU1pux1gtWzFKEHtie87hy2tsB5uCgTdOChQmMApq6yFCPC02FgiZNUIxUmrhnanfj/Kg1KxLicWOVg8celbudUsosLL6iyutimuRglKc+E1CDdODZbemzN8/DzymnFswUAhvnVC/uan7aop7tDCCH5XnoS9Tgka/GJvAL/FeePdG8/sepcnBHYN6mUOg4gZjKSgDZ7zHloMrJjH37d41bFlUXLJ+lBIFqKCjFVVOtGBKqTIaTnZ+eEj9xn81PfSEW6R8VCVesZsN9WPEZUBoxonz3UoaBjiJN17sN4l9bAPyLcibwqBKq8IvBxS3Ix6rfe+cUXth+aKzwzeyOCAb5H0DBhWx5KUodbSat3XIrcAlRPZ23jzfDncxh14wUdjEwOTPCuc8l6cPHsJ1kHI2+cM1rYE5+pi8q0vcGQH1DWRjOEViPsFhv3PCVmY95cRG2pFDJ89VYme6FpV56RRrXwMV0ZGPlITLZ8cfoM+xZDy67jvXwnBkfEcFOA3LPZtnVmxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(38100700002)(8676002)(66946007)(54906003)(86362001)(4326008)(6506007)(6486002)(66446008)(64756008)(66476007)(316002)(33716001)(66556008)(83380400001)(7416002)(38070700005)(76116006)(9686003)(186003)(26005)(6916009)(44832011)(2906002)(71200400001)(508600001)(122000001)(5660300002)(1076003)(8936002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DTJLR9CGSjERw/QuQ8hZmhIvSAlR4IjpuQmnQ6CsbNyLMHpmeP1cjRGnGHdc?=
 =?us-ascii?Q?mELHtOyPUcTM5le46rVX8Wz33m4XvcxACjN3mXotGGxPrePelizGMGTtni+v?=
 =?us-ascii?Q?Ma++adhu5BD3C2/Sto/pTmyMObgLCA6pOH9eHZpFqB1ejitmJyV+oN/cR099?=
 =?us-ascii?Q?TCPZe4mT3HhSnibngbRqI9eDPA2gkW6rJz9RUn/1MILzCGIaWefM0iIazYEN?=
 =?us-ascii?Q?0/41b7A+0V0hwVj+z9JU4dOuGU7pMIuhg/lp3sxJ7i/ytpc+xMh2bpYW6A3P?=
 =?us-ascii?Q?LW5+Glj7F+Q13ECO70cCZCWaw3P1OQk4G3mrLCo0b5xfXbsM8v1zUy3he58x?=
 =?us-ascii?Q?aRyrFnw59nkqPfBXMDG0Wm6a+G98Y8RgGE5r4+jPC9GajsMeimvGPTqFZ6Cg?=
 =?us-ascii?Q?hZ+auMEmGsu/v+t4/QPrF+X6B5eDVLkGL8/5dyvFZ6HLqMjB1K7xEbLDkQvd?=
 =?us-ascii?Q?17+t7LRS4iwDY5M803q8bH/ackPQSTGpRCI1XnFPcP6UY498/cum6W4/YTQJ?=
 =?us-ascii?Q?8EA89dsOLQQcdFeBFKYXHhN+eVmLpte7HeJhnT+0HuVNkCKdPHjCFymb4XlH?=
 =?us-ascii?Q?IlhJw8sNa4fp87V+y+r1+iyigykOko28muYCKAnwTVY4lz/uk+1/yD+1G7BD?=
 =?us-ascii?Q?9soQ3910mGyOdCkhH8C9f2oecP5/BzdWSnAC8Xes1sH94N96POH8mhxFb+Vs?=
 =?us-ascii?Q?DdmZgkytgMzVGwdzMKrU//DItjYlZ159f2N1YfEBxQqu+rCLAfqkV8lF8KJW?=
 =?us-ascii?Q?MywUfwl4UzTWrcieXqLEu08rsMGD9y+fA1go67PIZb//8S1QQNyeTvp+MrPj?=
 =?us-ascii?Q?ekmYYf8SBZpsQdi++9tpq8i2ykSR9RuwrtCOfciXI5AxK+uSYhBYNVmAybwG?=
 =?us-ascii?Q?DOHgX1ou9vHr5YxmkVATHjrvvTxPPVJAKfzylL8Hz5TxzE/920vR/wqky3M2?=
 =?us-ascii?Q?I6D4z5Df5EvND4mLrmSLqRKBIf+Q2Kq0lktVtmBVCVOOsq7+MzdqlVVcxWTE?=
 =?us-ascii?Q?NGfdglv08yb5CUgjNtWGPcjG9os0JVIVOSuPupTPBTGmX6MmLJNi2o9K1vD1?=
 =?us-ascii?Q?4OWDKMU1W0c9VMY/X/csdGFrQ+DqEQvCuclMNrkejovhgNTneBq8sU6/Q36o?=
 =?us-ascii?Q?73PHCiLCRVOEq5QDlpBnsVuMpjITtP7qkMw1D33AKQ9ipoIfz7N2YH8ci7xa?=
 =?us-ascii?Q?sYQI3Zh8j+eRiX+0qZF1NSpLl2L7sTt1i62m+JQtNJ4ZphQU/aIn/H3EfxFB?=
 =?us-ascii?Q?kPK/ZfolokS0uThIt39ACdwqiLxAgjizkjb2J5SfVsR/sSU7SmTtnZZH2FUm?=
 =?us-ascii?Q?lNPwI4jLBjGY2oyD8JwXVfFghmfbNcpj4JXH8s10zJb3Yxwf7DtDk6jDiiEz?=
 =?us-ascii?Q?t9qv6KreuagPfU1slRU1ink0E8pezvcLqD5VaM5hJd2OYul9Ka1W1/2Dw30k?=
 =?us-ascii?Q?lpd8JR3GG4OAAOLid7eTI0lwWalxNc/Z+NvuIWGtd8j374kaU19yCnBmaFPi?=
 =?us-ascii?Q?bAT8Eci2+66UkMySfeA0tQts3g0ifR8OouCj7VojSbt/Yq/4J8x/CDpP+dOM?=
 =?us-ascii?Q?1c1uVe3BgpFd1JarDfhR2OCa1fAZpmWO8CXeBMw1HTqmnsKptSCqkuKW07KF?=
 =?us-ascii?Q?WC4X4z8gbtjMphZMUIXRnUs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FBAA796895CCB4AB23AF6019D2DA1FF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca136a7e-8e17-4953-b473-08d9cb944c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2021 13:00:04.1795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3DmOQUOjva3UCheMydB1hOJcs1uYOwIFf6+54l+4PK+5PAFP3LBLTK2DTeOSKuWatckcYKCzVLlchQZKBG48Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5293
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 30, 2021 at 01:43:28PM +0300, Maxim Kiselev wrote:
> Fix network interface names for the switch ports according to labels
> that are written on the front panel of the board. They start from ETH3
> and end at ETH10.
>=20
> Fixes: e69eb0824d8c ("powerpc: dts: t1040rdb: add ports for Seville
> Ethernet switch")

A Fixes: tag should not wrap on multiple lines.

> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---

Sadly I'm not able to confirm or disprove this change right now, because
my T1040RDB has a bad DDR memory stick, it seems, so it just randomly hangs=
.
But I'm pretty sure the Ethernet ports were properly mapped out when I
tested them.

Do you have the T1040RDB or the T1040D4RDB? Because the front panel of
my T1040RDB looks like this:

 +---------------------------------------------------------------------+
 |                                                                     |
 |  +-------+-------+               +-------+-------+-------+-------+  |
 |  | UART0 |  ETH1 |               |  ETH4 |  ETH6 |  ETH8 | ETH10 |  |
 |  +-------+-------+-------+-------+-------+-------+-------+-------+  |
 |  | UART1 |  ETH0 |  ETH2 |  ETH3 |  ETH5 |  ETH7 |  ETH9 | ETH11 |  |
 +--+-------+-------+-------+-------+-------+-------+-------+-------+--+

>  arch/powerpc/boot/dts/fsl/t1040rdb.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/d=
ts/fsl/t1040rdb.dts
> index af0c8a6f56138..b6733e7e65805 100644
> --- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
> @@ -119,7 +119,7 @@ &seville_port0 {
>  	managed =3D "in-band-status";
>  	phy-handle =3D <&phy_qsgmii_0>;
>  	phy-mode =3D "qsgmii";
> -	label =3D "ETH5";
> +	label =3D "ETH3";
>  	status =3D "okay";
>  };
> =20
> @@ -135,7 +135,7 @@ &seville_port2 {
>  	managed =3D "in-band-status";
>  	phy-handle =3D <&phy_qsgmii_2>;
>  	phy-mode =3D "qsgmii";
> -	label =3D "ETH7";
> +	label =3D "ETH5";
>  	status =3D "okay";
>  };
> =20
> @@ -151,7 +151,7 @@ &seville_port4 {
>  	managed =3D "in-band-status";
>  	phy-handle =3D <&phy_qsgmii_4>;
>  	phy-mode =3D "qsgmii";
> -	label =3D "ETH9";
> +	label =3D "ETH7";
>  	status =3D "okay";
>  };
> =20
> @@ -167,7 +167,7 @@ &seville_port6 {
>  	managed =3D "in-band-status";
>  	phy-handle =3D <&phy_qsgmii_6>;
>  	phy-mode =3D "qsgmii";
> -	label =3D "ETH11";
> +	label =3D "ETH9";
>  	status =3D "okay";
>  };
> =20
> --=20
> 2.32.0
>=
