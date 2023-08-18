Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F10780615
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 09:04:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CqnArLLl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRtCK5Sy2z3cSP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 17:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CqnArLLl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::618; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=madalin.bucur@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0618.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRtBR3r08z2ytK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 17:03:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcol7bz6TZxxPdWRfOs94HMkgs0eHPRitg3PhxUeMunmqWm/bhX5tAD51V2znBO08j/ZhLGDd6LymoR79nujZEdZcPEAlQf1KjncxR+ckNiD3nfm85IijR+D1IjaYWepbk8i8kJDDK4jZpCKNLDgf/uPEMDhF/xAzUGVF3yQSxyD4+xw7uUO/kZZBnGD/04W6l+ZPg8O7twhl9rzP36i4le3G6ER0QC2XqwwrfE0tE89pdm1n5fD83xbSxHlk8kr4YY/hZWgYygiwvfo0e8QU6UnB1F3NijMxXo/eq3HUpj+fpkClCjf20tFX3q6BZcgI2eZJqrjT/VLp8gcu+iA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FhMaRVI+L12UjDNkc6o1nkCbyA9Q4fiWPa1JO+Sc8U=;
 b=AmX1Oe65brVNUl9GtKCezWEsh0ILDG/Yd6K+Fe/RKpSeFbxkJA24jLlMxKrlyGqmSBPqaB1vMPSSYzMNTQtL5ANNl9rO4VFPIWBmIEK5H5I7+Qik92ziJWgE6uc2Yg60oV6zZ2Gk2TrE1NtSRLnMu+DkGRASpzPfSPxGbD+mbJ51Gx+OOxa9PC3k5ieN7TV45IiaJRJuDwTrC/uaAVe30CgTZTVFyDKGNUJ/aKT66SlK2WZV67UUureMSu2CatLhJ+YrT34q25F/mKkUAb8hVBhfZeYbdpc6GKoEE+Im0H9IsPZd1qAEH+v1dCLQeKbtqQgfaLzDzCbdTR1d9Zkwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FhMaRVI+L12UjDNkc6o1nkCbyA9Q4fiWPa1JO+Sc8U=;
 b=CqnArLLl6o+uGQxSd4i7iYAXCHaumZeR3CUuEbQ3UXAQYYu/wCFLVooCnWMJNwsHPkRvGnh1OHqBQByzZSFKVGV1baKp05x1Z/WjkT6jUcg/7vd1WwqBfa3fhf/0CrqNe1glaxepzUYNElayEEOuWHwpKrz4nXLb8rTNTeP0zds=
Received: from AM0PR04MB6163.eurprd04.prod.outlook.com (2603:10a6:208:13f::13)
 by AM8PR04MB7937.eurprd04.prod.outlook.com (2603:10a6:20b:248::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 07:03:00 +0000
Received: from AM0PR04MB6163.eurprd04.prod.outlook.com
 ([fe80::a106:9037:70bd:c4b6]) by AM0PR04MB6163.eurprd04.prod.outlook.com
 ([fe80::a106:9037:70bd:c4b6%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 07:03:00 +0000
From: Madalin Bucur <madalin.bucur@nxp.com>
To: Yue Haibing <yuehaibing@huawei.com>, Sean Anderson
	<sean.anderson@seco.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, Camelia
 Alexandra Groza <camelia.groza@nxp.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>
Subject: RE: [PATCH net-next] net: freescale: Remove unused declarations
Thread-Topic: [PATCH net-next] net: freescale: Remove unused declarations
Thread-Index: AQHZ0RCw7zDpSuRyeE2NRFzQP6icJ6/vobbQ
Date: Fri, 18 Aug 2023 07:03:00 +0000
Message-ID:  <AM0PR04MB616349EADE70E7130954AEFAEC1BA@AM0PR04MB6163.eurprd04.prod.outlook.com>
References: <20230817134159.38484-1-yuehaibing@huawei.com>
In-Reply-To: <20230817134159.38484-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6163:EE_|AM8PR04MB7937:EE_
x-ms-office365-filtering-correlation-id: 4de93dd2-cb65-4ac3-7ace-08db9fb928a8
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hiGqF47mC6CvM3miCfR+Y68WXI2mJE3g63AKU/Q7kK9zzJPRhlx6YxhpKiuBQxNcQFup6YuGkDorEBwgMWQVP8OtoahOJpKbe4qY2atDxxDgcZvgQxAq1AzwlEB0rLzRMwUjLGcDwIxhfYX2PuBOLI4Gc84ZFZ36Sm2pEpz48pWvnlgQUcrqWZ/xWyhiEh9A6zz+D6OpegnQiFyHpRN0XEIhPVbkhA59LGx6worJ4172pg+iXmIUXT9sA4CnrEs8euOJO+wBywycwCXguAiLV1vOFFBfJoWCUHqBCK/pR5W/ewJtuYornoH3LRAxsVMYXTSdhh/J9HTlVoqZcLbg6eaOFrWAubKgDefRcZP+RB3kgb2/j3jQs5MKlYAcoyST2fMonxsUIYU68giC6ojB0FVip75Hm4EkJnPrQpBpEk4Kg6c6iD7oRZtdE3Ndj59HjB0vPWGmgW3Br+n1gvC0Y8zISoGZR/qltm9XoZe/xDGwvVo/Pm+aS5PZ6qJ6yOxkeUtrY1Kk5AkHamJnUwM18Af1uxuHltJgiGYpy3UGwk3L3PjqJb3HNPZWp/RIwJeRa8Va+Z8/8g6fpwITwbm6jqoNOehgS+wCgkqBBokEAq0SekTqwxXM7KzAm1QdqWOj
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(26005)(71200400001)(6506007)(7696005)(53546011)(9686003)(83380400001)(44832011)(5660300002)(8936002)(8676002)(52536014)(4326008)(2906002)(7416002)(478600001)(41300700001)(76116006)(110136005)(66946007)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(38100700002)(38070700005)(122000001)(55016003)(33656002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?FOMdf247UpNYyBFC/EGDGC7OqyrThy16yd4xXB18hMQ+OVggETM27++kYEKA?=
 =?us-ascii?Q?jRHECONwwAGaXn6vzrkLfThQwbUX07LQSBri3fGpg7UZE3hoWkwy7oe1ssro?=
 =?us-ascii?Q?7/kF6wd+rsriGpMebpls6LEtXWmkROw4Diais1kNlOfopLQ3+b4keNu7vouh?=
 =?us-ascii?Q?/LHxbSCjjOMLBJdBBADDGFbQinrj862ZNUULikOuqwYyWw9QdKM3CTaFiZan?=
 =?us-ascii?Q?buz9Ghe94Gzs5B3uX8Ovv6RbBavMqVggs6tDVVfO76ROKRb9A3W2uhkS7W+E?=
 =?us-ascii?Q?gCUmpzNCo9piXomUAfhFJiMkwSZKyWCh3jimd6GTYPrre95p2zzODW6MOqEM?=
 =?us-ascii?Q?ofMOdcpu+Y9FKbn03DDtKutp0M5j12daqS0HCThjny+VFUrG3bRQzUh7pJq5?=
 =?us-ascii?Q?pyh3g2G2lAYM+3TZeYhMFFumsrSHD3NSrdsr+fQQ+vt0rJANF9her5Svqs0V?=
 =?us-ascii?Q?DiPYFU1RYYoaU6Sd7BeBfmfd6KE/w/C821v/6p37Wgoer8q1CFML0AOwyfGV?=
 =?us-ascii?Q?zKpMvLAiIxJert8sm3MIdcMgidhEjE/dWPdLW2maE3J4eH8mlPlZf/Zb70Uc?=
 =?us-ascii?Q?etYp2ck07r9kR9MsPpbwW+v4PnEeqXCjXNZtPN9ykyz4oQvferLKnxMiPJe1?=
 =?us-ascii?Q?Rn+Hxzkg1iFnbivpoeH1Zqgdvf9/TT1YvAMsE4zZBv9t0cnXMKZfHOn1+8AI?=
 =?us-ascii?Q?KGfetWm9TPDkXfel7JNe8tbr2UsaKm1mkjMyDCojkdH78CNmNRHls6P521t/?=
 =?us-ascii?Q?pHq/5paq6sAj7Duli9GMXw79iDI9l5YRRzK4H0FpqNOwjVYvIyUY91RsE1OO?=
 =?us-ascii?Q?m82RCOKYvCqIlp/zvjGTAnmzum4odrQOKgVvdQzLi70Cf8HumYVH03bA7Wmv?=
 =?us-ascii?Q?gByZcmfSdm+1sD4MiSTt7uTDgFeLSndBYu7WWLGf7ZTza14WoQQGecTOvvIR?=
 =?us-ascii?Q?gk7x5zf6AbsIrhOUSNi2pC0QjZmu6R3Y1Fy/qw//6LZDwa1eRGnRMouhms4g?=
 =?us-ascii?Q?2xvFeKYF4G8g2rPxC4TRbs9dxRJRzYp+BV1QGf9+Dz2dTcq5puRAOZfrLrM3?=
 =?us-ascii?Q?4w/PbcwUuihlU+QpUovLGMccd3o+QwtKun2aXf2W1fOYEP3KDxHIqK79K23h?=
 =?us-ascii?Q?rW955jxfgBWmBJQdfIOUM60s7gJZvV128znHkJgS0XMI0IvgkHy8umvIlTIf?=
 =?us-ascii?Q?rYhlHDdtMNozC+kopMx/H8YJCDchAkon8XvSk9BDfV74KfEslFT62SBH3uky?=
 =?us-ascii?Q?IPWUd6S6cFVh2re34z5wvCJcm0mPat3ulX7RSo/MMtqo1G3H4MGeFkA5KU+z?=
 =?us-ascii?Q?vcezUfjw7U2Jyqsx7+4/7a9hjBM3T+to5W3BaUxZbTF49uLyG8C3bF1tDr3r?=
 =?us-ascii?Q?1DOpU2dwe3Aca1+ytDjwwMRjh1KCu+I9sqJBuY+4O5ryE99Be2+9WJGbfYRZ?=
 =?us-ascii?Q?WlnfLEM98zXTN8xJ/v25tectS9M5R8Efh82dWVYPauve7+qjxQmI7d0VBGfP?=
 =?us-ascii?Q?L66e+zCa5201NhRixA2/GHzLZ7ZcC1lC4dC5THvF9uPkqy8KNCh5/dm8EFiG?=
 =?us-ascii?Q?q+NX/kiHld6yDgOWjtow0bBpE+5k+mkYdFrcp4Dz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de93dd2-cb65-4ac3-7ace-08db9fb928a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 07:03:00.2852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ge/HenFhWUinTzl422yOD9MP87Cex67A92DrPMjC0ysxVK+Krq36AQRham0cxoHPMk56pga3rQMVOVZQ3UeJGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7937
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Yue Haibing <yuehaibing@huawei.com>
> Sent: 17 August 2023 16:42
> To: Madalin Bucur <madalin.bucur@nxp.com>; Sean Anderson
> <sean.anderson@seco.com>; davem@davemloft.net; edumazet@google.com;
> kuba@kernel.org; pabeni@redhat.com; pantelis.antoniou@gmail.com; Camelia
> Alexandra Groza <camelia.groza@nxp.com>; christophe.leroy@csgroup.eu;
> yuehaibing@huawei.com
> Cc: netdev@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> Subject: [PATCH net-next] net: freescale: Remove unused declarations
>=20
> Commit 5d93cfcf7360 ("net: dpaa: Convert to phylink") removed
> fman_set_mac_active_pause()/fman_get_pause_cfg() but not declarations.
> Commit 48257c4f168e ("Add fs_enet ethernet network driver, for several
> embedded platforms.") declared but never implemented
> fs_enet_platform_init() and fs_enet_platform_cleanup().
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/freescale/fman/mac.h        | 4 ----
>  drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 5 -----
>  2 files changed, 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/freescale/fman/mac.h
> b/drivers/net/ethernet/freescale/fman/mac.h
> index ad06f8d7924b..fe747915cc73 100644
> --- a/drivers/net/ethernet/freescale/fman/mac.h
> +++ b/drivers/net/ethernet/freescale/fman/mac.h
> @@ -68,10 +68,6 @@ struct dpaa_eth_data {
>=20
>  extern const char	*mac_driver_description;
>=20
> -int fman_set_mac_active_pause(struct mac_device *mac_dev, bool rx, bool
> tx);
> -
> -void fman_get_pause_cfg(struct mac_device *mac_dev, bool *rx_pause,
> -			bool *tx_pause);
>  int fman_set_multi(struct net_device *net_dev, struct mac_device
> *mac_dev);
>=20
>  #endif	/* __MAC_H */
> diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> index d371072fff60..759bb7080e22 100644
> --- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> +++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
> @@ -208,11 +208,6 @@ void fs_cleanup_bds(struct net_device *dev);
>  #define DRV_MODULE_NAME		"fs_enet"
>  #define PFX DRV_MODULE_NAME	": "
>=20
> -
> /************************************************************************
> ***/
> -
> -int fs_enet_platform_init(void);
> -void fs_enet_platform_cleanup(void);
> -
>=20
> /************************************************************************
> ***/
>  /* buffer descriptor access macros */
>=20
> --
> 2.34.1

Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>
