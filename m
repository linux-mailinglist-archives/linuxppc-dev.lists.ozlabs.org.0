Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1916D5C10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 11:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrN2V01VVz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 19:37:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=OBZ8CgLA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::60c; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=camelia.groza@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=OBZ8CgLA;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrN1c2NYbz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 19:36:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfLWXUDnDGKtl6AHYu3ZNc1V5G9bjsxkkAbyCPnY0vmUOYjxPvOvLJoe/BsvJVrqsXazYmiE4glFUS+7a5TxX/orFArG+km8UjqA/qIrHkui3BzKvuljfmu7E2hR4fusOmsx3KQPDdfkoX/h80tfEoe8hQGBQmYHViboSKoT5ZL3r72aTwZoj3GOeaWlYFhNWcR4S7bmDbxjO9h2ayrZi/U5PJ1IYvKosOP7dC1p9lcbMRemuDLr2/1mSORbGgTGZs1tahiPFYTM93J7ttIj3gAWoZUAT94+2due96nwej/qvsyDkTo1hjzsL+0VbHzXaBCjwr0Tn/z8Q7Cx37lZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v80m2RcHj4jEuBgv+LeEQzRouf1BoCH1zYfb5FzVVVo=;
 b=CVVsJgJK5qP76IlSA97AlHLQBF/JvXw4FurgDos/1wc5/r8V8zTu+oqtg+OU8yxB3LtR8r69o0C3gv1nP7F5BHo4Hxh1PUrquUuCXPdMPgF1WuMAAzshT6k0MNVwfm2jQrTINp2PZ4nJ2OQsDpVKrk8hhYcfUGRnTCQ4fXMaGxpklYV4fWql2JPvtBb+Jan/buYUmJM0LNYxdYR5YmwDqQmXQn7KXBlDzNOgBtocli0jiIre5Co7RJU6oCpUvnqpWmQfHgup/4+hmgYuTy7nVk66nHPtQiMXvXXkvkSkCiieRpMu/51iPl2lQV4jjySwPOwOFkujl3yiAcC0TOA0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v80m2RcHj4jEuBgv+LeEQzRouf1BoCH1zYfb5FzVVVo=;
 b=OBZ8CgLA15OCabnuC5ha/yvnbyoM+olvE3HqMYKM+9r9AaKAcySTRzqi96sjpmLFUYyqU8W2ebpZJCsuosbYwLnO/QOZ6W8ceZ+1fVVrJEynsG7p5EBChUItQenSqIVjfuATVNKRPZo09kHCwwew+Z0/mv4rACRKTBD9Cb6JOyM=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AS8PR04MB8932.eurprd04.prod.outlook.com (2603:10a6:20b:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 09:36:01 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f3bf:4013:3fe8:d452]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::f3bf:4013:3fe8:d452%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:36:01 +0000
From: Camelia Alexandra Groza <camelia.groza@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, Leo Li <leoyang.li@nxp.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Thread-Topic: [PATCH v2 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
Thread-Index: AQHZY+OE1RJmUmy5N0SD/8fbwuxDUq8a6ZaA
Date: Tue, 4 Apr 2023 09:36:00 +0000
Message-ID:  <VI1PR04MB58070B4CEC732B16F7787F9EF2939@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <20230331151413.1684105-1-sean.anderson@seco.com>
 <20230331151413.1684105-2-sean.anderson@seco.com>
In-Reply-To: <20230331151413.1684105-2-sean.anderson@seco.com>
Accept-Language: en-GB, ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5807:EE_|AS8PR04MB8932:EE_
x-ms-office365-filtering-correlation-id: 7dcbab4e-95cd-4ff3-52ab-08db34f00092
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zn6uP8SPbdxY6yTeCMQiH/gL5LQla3rttR5e+kF4CUoM2aUqnVj0d/ZpJJnlMQKRv1IXz4CDueFZGSpabGWxrtQkF+rRioOl0pf7Jr3ZSsMFXhkBdPxxHC321DxM/xHs2Ys1PDxob95x5JpQqyj0VdGttD1qT8RjN1TYlJwzRIWwEAZT9GDz0hCko8DdFiHsqkImEARsfHsf92UAx0CjL4CiCuuTZD5I0yQbPog6rDSMUDnXavOgAx1QwFFVLRHW/40YgHKIQJcGFOTCWy+yXLnNp050FDSRvEDaDPLZjKOA0c1iEqInlI4kKPDTuK1df0Hk/TdLY3PchAaapR4SkPBFq1jN6Z+BMHUjMqZP9Li8bq8ySpTSpik5H6j68bj2Nol5iufdLTDJ1t+FGPLyOJ9o1n3EGUuzgtOJSkXOCIfa6rTRGxvbMz0mYb6veKGWkf7ym0G4B89GE94J6VEEARrY4UN6AojsJ1iibSbLOF0vGnc0zHqlgI8UH521/t3HTyjSoCtaHLh4wx16jRG4iSuyILnp9ePFeXFFE3RTMNyRI14QHPZ3+AtIU73PW8NKH6x57kK9scqL4vmyUugmtTt/cODp/UYWHRK2rCYiuoI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(478600001)(316002)(110136005)(54906003)(52536014)(8936002)(5660300002)(38070700005)(86362001)(4326008)(33656002)(2906002)(55016003)(8676002)(64756008)(76116006)(66476007)(66446008)(66556008)(122000001)(38100700002)(41300700001)(55236004)(6506007)(26005)(9686003)(53546011)(66946007)(966005)(83380400001)(186003)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?17p2dJ/RGF7uZb0P9RGFhLo+h1s3/8bvKwvzluH2yFqq1D2yM1BkStHvYynm?=
 =?us-ascii?Q?eyM0JmCSbNrKhzPOVpVJF+PiwLHPMhEHVXOoGNNWIZUZ1QARxFMFFXRd0bfi?=
 =?us-ascii?Q?Nm08AUgIKi7Cp/zV0WLjAybm5G0/riRMiskLvgOzXWt3tCvTdlKezI+Re/Qw?=
 =?us-ascii?Q?UD4XmiXcNmwb5dUyhTWY6xnt7+DT/YLCQJRls55u1eGITV9sJsnSZrOV94sk?=
 =?us-ascii?Q?Ddu15W11YLzWF+x8LlNWX7NpIHX2r+Ban1yklhfsVe6ClhTTwVmQ3td7tD71?=
 =?us-ascii?Q?hX8WL93OM9QQ+vp27rcGxSKhDKgu08pSadg5FTB1275SZ62Xe/91CbmvTgNQ?=
 =?us-ascii?Q?6Vo40ZoHh9pqpQtrfHiM0KH/YUJk7ap/rPphZgRym9RY9Gffs55iRdHZqsBE?=
 =?us-ascii?Q?SJHJrSxvv7ZnWekRqz7UECiB9WoopP/NrWDyuU6voBE0hUZS3d+Ocs9L0CfQ?=
 =?us-ascii?Q?hfjtIfZNW1oH4uWY69jYiV5R3E09LZfVoP7T4ACgNvb8K0NSocaps/rqAg6n?=
 =?us-ascii?Q?WwDyN7pWvdjPFRK0MeSQ1b2baojFjlvizulKJNmz+BKCWdaJorqwOGA2RtCh?=
 =?us-ascii?Q?AWpO+az8WlIn7K/S7cdBgCLyv+0aDcCpwQGWmFi7C7ZV7WKJSa8RjXC2mT3f?=
 =?us-ascii?Q?Yl2VX7hjhaGgU9+mJgrIG49J4sWVzfF714vABzG3pEFQppOZWZWw/nsbuCUN?=
 =?us-ascii?Q?MJhw7yYYj8cWwhuCdzUgSzELU+fNMN+OeG9qZCXvCxydrVHvT84xjuBEU1IH?=
 =?us-ascii?Q?rAT+//HyJt+mChzlv3nHFi+2yeeeZ7Qjx1VB+xEiVUuEUtiaraAKHujn3qgm?=
 =?us-ascii?Q?1+m0SxDW/b5rCh3IZgiUIM/M22GLfaMkIOYTbJYSvu6RvrjS3nMHwdeWDSdL?=
 =?us-ascii?Q?111uEbNLaWaJqDRxIZdhk1OrZRFyHMwycR9O9S+tLH32r846OJ5HpEPeUd6z?=
 =?us-ascii?Q?4xRemXdypi1ioWdG/KwzZzVZY6zFoAfP6KnyMTtLqPzti9xeIYz5tOi8Nbwx?=
 =?us-ascii?Q?EfMKepf6WVZFA1iMXjpu0b359CFG0I0e/JGzEndxzmOfOEmQaKcunlkk/xIN?=
 =?us-ascii?Q?ku7nWS6xT02VggtBeUMrr31I9gXbIWElK9Cmrf+2/1WReCuTf8rhRUsHNjJB?=
 =?us-ascii?Q?skco4ASQys4pJRNG6qFVJb1QrXez2uvjeHHBPiKZo/tIVR3fiWJhMHLeUtnS?=
 =?us-ascii?Q?8LMgOWVgoShBRezbdRg1vRwCw67YxM/Vx1vSWcjV8fyHvH67ONLbOqm2WKYQ?=
 =?us-ascii?Q?8LEXvPIAu6FYqsbfpXhNWCoTsBJxOYL9+2IXozU1TmukPjZAJKwtFIkddKDx?=
 =?us-ascii?Q?sFre7AzwTtJJA4VdzEF/QGwugcS23MfoeG2cZzx2TRqnLpSF6p3+BD7JE7P6?=
 =?us-ascii?Q?nH3NpIH4U5JY0ATUDvPNzdAQ9joPbnhMaQE9NVsPa8Tpk8fl8OtmPnGGOMs2?=
 =?us-ascii?Q?epu5dLFNm2RJKiQzoTrJ0MH9y6FruRlNzdKYRTVsZZi8Uder9YKXlfGxnw3k?=
 =?us-ascii?Q?cL9tcrDpDOESUMGi5l9zeXcV8Ik1yKkdaaiTqr65Qcn+fcXgTqvsw+hjY70f?=
 =?us-ascii?Q?TDNrnAONfKl65CIKr4R0Y2nPv+wBTuUyhILZ4gyK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcbab4e-95cd-4ff3-52ab-08db34f00092
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 09:36:00.8990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQb0kIazjDo2V4eAyrgkt6Cu4R5CgqphsTCEOmVW0RFqbM42zpRBlW6skRumVSDiIWu6i+PaY5vRJqJcP6CZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8932
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
Cc: Sean Anderson <sean.anderson@seco.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S .
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Sean Anderson <sean.anderson@seco.com>
> Sent: Friday, March 31, 2023 18:14
> To: Leo Li <leoyang.li@nxp.com>; linuxppc-dev@lists.ozlabs.org; linux-arm=
-
> kernel@lists.infradead.org
> Cc: Scott Wood <oss@buserror.net>; Camelia Alexandra Groza
> <camelia.groza@nxp.com>; linux-kernel@vger.kernel.org; Roy Pledge
> <roy.pledge@nxp.com>; David S . Miller <davem@davemloft.net>; Claudiu
> Manoil <claudiu.manoil@nxp.com>; Vladimir Oltean
> <vladimir.oltean@nxp.com>; Sean Anderson <sean.anderson@seco.com>
> Subject: [PATCH v2 2/2] soc: fsl: qbman: Use raw spinlock for cgr_lock
>=20
> cgr_lock may be locked with interrupts already disabled by
> smp_call_function_single. As such, we must use a raw spinlock to avoid
> problems on PREEMPT_RT kernels. Although this bug has existed for a
> while, it was not apparent until commit ef2a8d5478b9 ("net: dpaa: Adjust
> queue depth on rate change") which invokes smp_call_function_single via
> qman_update_cgr_safe every time a link goes up or down.
>=20
> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
> Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Link: https://lore.kernel.org/all/20230323153935.nofnjucqjqnz34ej@skbuf/
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
