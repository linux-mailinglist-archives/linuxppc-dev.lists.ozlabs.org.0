Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AB6245DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 16:30:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7QlL3Qr4z3f3L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 02:30:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fS2CRZIX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.7.52; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fS2CRZIX;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7QkN1wBmz3cFc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 02:29:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXjirV4X8kaEZrNw+zyWSzFa2wy5CLi5b5syTHdmJ2ofU1hpEnJpGlfctqhqkYP7cI9C94wZxzxMb0kO3NEaBzlh/mZybru8GEX8gkSrwThW8mTO48aITkLbqOEODwM3LUMuMJczFtITaQZZbWyJ6bGfxKCB+vURwwJWElICveXHUaf4EBJIbh/Uy/An5jESGWoD0pK7x4fNBsz0IlgCTkKT3/qXR1L+OC1KmypmmcGbsg+RaMWIxS2M4ClliU9X6/rO7Tv0iVR4J2epYLESMBjtbPVtGRvWqii0POxSkHRs/bJTVMQJDAbbZnVxb68ICvLnImUJ9MS26ylqtrJ9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axv9cFXaADDtKyJ8HMM2f1aAibXacG+5hCAihUk9JIQ=;
 b=kMhnNwXt2Eunumk9sKv7kOXkvpo4qKBff08MqUI6Yd4oRg8j5kQyzdQ9roeppYEcLbmm3VpY+aWnm8nMYsKqrFMFfIGgdPMDmGthvsWVTeQ4qr783pWWMyV7pbIG7madNYC4g5bJ85jyJNBfRzNonK4n81C3cVd3YLOKofMxuyXCbPEkgKAXJ/kYVR0YhuAsKgdUtSQtfStB/DU9dqMPCduNBad0YL7KlhEJ7dwDPfFkD2FlbwUNgLoZwFqiEpKW1RIVSWD/oXLnIeezx5MPOIW4VS6Kmv5zxt5sxCpfGU+dktZo6tMNZSvYsk+aF8/mQBDqxC60eTpuGsHtzw1y7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axv9cFXaADDtKyJ8HMM2f1aAibXacG+5hCAihUk9JIQ=;
 b=fS2CRZIXfDus5qwYJJrN32k7vZ2S59gJ3o7NSb1iq2BZSs5PddqsILVktb279q5/wq2DWw2ATWkvheawt7t0d8LSiOp0CYt2R1uTS4058HEnsmWbwrMpjweS4KPX8N6e1iovx1QUEfXtDWbyAO9RVTKPjQjpJuZHBFTcyTDZb3Q=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 10 Nov
 2022 15:29:26 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::4a73:29eb:28e3:f66d]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::4a73:29eb:28e3:f66d%7]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 15:29:26 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Thread-Topic: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Thread-Index: AQHY78g7xxgXmFEQmk+41hVlaLM4fK43OSkAgAEQPACAAAl4gA==
Date: Thu, 10 Nov 2022 15:29:26 +0000
Message-ID: <20221110152925.3gkkp5opf74oqrxb@skbuf>
References: <20221103210650.2325784-1-sean.anderson@seco.com>
 <20221109224110.erfaftzja4fybdbc@skbuf>
 <bcb87445-d80d-fea0-82f2-a15b20baaf06@seco.com>
In-Reply-To: <bcb87445-d80d-fea0-82f2-a15b20baaf06@seco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5136:EE_|AS8PR04MB7941:EE_
x-ms-office365-filtering-correlation-id: af5f223e-16d5-4caf-1752-08dac3305a29
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m9YDcbqHLCkDxaVzwrfUY1W8I8+hTf6gTQiHLfiNCe6HxvrG80J7kDzEYud145+xWpRttwhBLHs0sJ/wym9hlrs8VUUmLZsqoUN3f2Wi3SjwYHWW1HLso2q3pmy+xK30x9jmC6SGiP8l4XjuvZYud7OA36ctHILdSMZTjtuPcm90FdO87UwzugcsFUJYHl2Xdpz2yzZOAw2DbuIh3iYCOO7ku5bwgD+aDKk0motVqA9QTFobwvNEY6WU0r8TIru7plFuX/T4rxkrZQtbOB4vojjb+/pN3+JspoHw47unOIU7qOeL3kaI6LNPV+VKaSkXVIIEwCAOO9IHt/N7oqMCcJndYaF5JSzPsfSzlaxH90szgEWhXWtS5SHedHArL3ZxWULsV86W5BEnqSV+XORgnaStr7iHfwV4KydPcD9JjscS01Akz5EanQWIlLUgYZpPOhKBZ74VWiOO/oP0LT8GjYhiIdUQodZXvtuqbfNUX93KQFJsp7udTrUlusi6MLflTwk+ICLlGQy21fwpVF4aUYOJF10MM1oGbppJHkAjLSAmZC7h0Pb2h9xu40rWTVBkbzEi3lEc6e7NaEtI5Mps4OxGmn5VTGrpQF20qFmxxZbpXy5cbROaCInFiCy57uHSVdx04FXD1lUW72ciqvnX9g+/MHlpAL6HV1kLuk+J6Q+nnHRqhvh3t9UpAccLJ6hBJbCtdUFPUDGBxGbqooI02Uidp0NvZykfyGtHOA/d7Wp0oiRiEYmY8p6CBfl6jMpnqp6lvu52TJfZEVkeJRwLkS7v/zcFvZA8OIVcD0RJn3M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199015)(966005)(41300700001)(1076003)(38100700002)(478600001)(6486002)(83380400001)(26005)(8936002)(44832011)(122000001)(2906002)(6506007)(53546011)(86362001)(9686003)(38070700005)(5660300002)(6512007)(186003)(7416002)(54906003)(316002)(6916009)(66556008)(8676002)(64756008)(33716001)(4326008)(71200400001)(66946007)(66446008)(66476007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Jtp6zm59nbV0z2bxBqM094moJLXt8K3kB9GACMzmUzypi25ey3doi1a95uvp?=
 =?us-ascii?Q?oDviVDK/4VyhpLfdnEMa1CLBCVjJaFE9wg/zdE3R1ZSUtsYR8h5nFLvr6xDn?=
 =?us-ascii?Q?46d99vrmStR+LqlqbC+27/0jgfC7fmHcGyEMb1VstezycbGVdYQlEwGMV6na?=
 =?us-ascii?Q?FWGQfxWMKGr5MqUp5+Hk4v3goQQZVHU3ScfEOACni3DSAULfSsXAr6cDe42S?=
 =?us-ascii?Q?xDOISMt0dcsCisQmC/YsxSbGfztAxQ8hkd6j3hE1V0C9PCbHFHaRe7tM3pZU?=
 =?us-ascii?Q?7dCFTRAiQGF4vG9714eIwbAuh/Mt3rDOpk9IASXW3bO1NwoRENCIhOHee/yJ?=
 =?us-ascii?Q?TZukXgghSKMt5LOphV/UF1Hxy2ST2/Vd/5Xzf33onHsgM9I5U8SVLIdpABeH?=
 =?us-ascii?Q?215iDW0HPyCW5wwLWXpTj2dAcFsWeYh+dtgzOaEOajkmd4w7GtQgptZU4OGh?=
 =?us-ascii?Q?ZnWWXFM9Dv0xi9FGT24IAdalScPZwzxdpAlwp3amY+7Rsr910Ymmt7/Y2FMW?=
 =?us-ascii?Q?9EoE/rL+yd/t4xa3/duZER8ybROqQ5I7dnOnIDaV9gqNDuBynSSG668/jwQn?=
 =?us-ascii?Q?ieRtKDBprwszkhpYxfQsx03xnxN872GK1MPhrjMBe25j8VpdWFfcN7ggBPJO?=
 =?us-ascii?Q?75Gonhz5dqR1FznVhTDSKBwwAsyYv7Ny0+9ZD8SO2mHkTgEQQ1jywJZWQobw?=
 =?us-ascii?Q?HAs2W9H6qqkhpNu25G7UN9CyY0crt7WsvF2DGUOQCBQV5xJufUS1n6vN27jF?=
 =?us-ascii?Q?ve3WNhBF6nAzC4Y/TwQf2DAPRYXgzsfh9a3cOy0c+BfYQHTh6t4uiRP6Sy1p?=
 =?us-ascii?Q?znXAA5EkeR4ek2z8Wc+pB+zjMSTMqEtiB4Fqkh5ceLM2mlCqp4UVacEZAxNJ?=
 =?us-ascii?Q?UuaZMLZv58gD86nnvDw2HrRNJMhzc/HF20Ayy7vrviV20BEPsb/X4Y0qdYbL?=
 =?us-ascii?Q?u52U01RqMouqcN6h825vvMc2t6QVxSRGnCa8sF7+wqu71kjYAAR6Iaea5yZv?=
 =?us-ascii?Q?l4rEggJU7VFWEnfQETJlHMbEVLOA8tGy6J7X94f7PjN2HCYfGFl+InVkByLO?=
 =?us-ascii?Q?Xr7ffaKLXGUsgV3i2P8otQMHDabaaJRQ4XBW2L36piWlYBwRsfuZDYbkXKWd?=
 =?us-ascii?Q?x13T/a9uy7geUatnxHQWYAR7QdnIUrrgC+tIilVp314m5yPxc4oLfHxjts+B?=
 =?us-ascii?Q?UOrMDrF8l0dcHMZ2r6Qiud5BEqpV4CDfIuEFMO8qHfZMGP6Bi603ukABhprT?=
 =?us-ascii?Q?30TD8IarmwVStHV47TKgMg91FPcJgMjoHwB8iyGx9dEINsW/NLfETiwIJOqS?=
 =?us-ascii?Q?GQ0iHTzosk+rsqeQeCjg0UgjSdW6DM+6THxhmUCbaXrBmhLrsyqgMDeeOm7X?=
 =?us-ascii?Q?dcvLydQltrkd0BYN8LPOM2GsSZAM6b5GDgwLOR0+HIHi9+Xs5v1XXwFoiua6?=
 =?us-ascii?Q?BXgoIRe0uLUMZ9mXluj975covcVAVlgHYLHSxCCMpk7ohPiV1p2+n0gnwDcN?=
 =?us-ascii?Q?O190LpfJuKfkD7xExh6N7PAbEgxMarkXdPd1Xs15QEM7J1Dt2oo3h5FZ4sTs?=
 =?us-ascii?Q?nnyUc0HPHFoG0BqY2X6umFhYBXSKaycvoFXGZscMvqvMUHvdDvMUdLTrCCS4?=
 =?us-ascii?Q?ug=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6C7EBEFDBBED643865A85816D219A49@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5f223e-16d5-4caf-1752-08dac3305a29
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 15:29:26.4522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vv1hV5TZ2tO5B9SZLXGV7qMVz6olFqfi5vZmiLrBvGkTbgQJ81+v6JFrKTWyWfigHAqzTyNPoSZU8ql10BMd7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Saravana Kannan <saravanak@google.com>, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vg
 er.kernel.org>, Leo Li <leoyang.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022 at 09:55:32AM -0500, Sean Anderson wrote:
> On 11/9/22 17:41, Vladimir Oltean wrote:
> > On Thu, Nov 03, 2022 at 05:06:39PM -0400, Sean Anderson wrote:
> >> Several (later) patches in this series cannot be applied until a stabl=
e
> >> release has occured containing the dts updates.
> >=20
> > New kernels must remain compatible with old device trees.
>=20
> Well, this binding is not present in older device trees, so it needs to
> be added before these patches can be applied. It also could be possible
> to manually bind the driver using e.g. a helper function (like what is
> done with lynx_pcs_create_on_bus). Of course this would be tricky,
> because we would need to unbind any generic phy driver attached, but
> avoid unbinding an existing Lynx PCS driver.

If you know the value of the MII_PHYSID1 and MII_PHYSID2 registers for
these PCS devices, would it be possible to probe them in a generic way
as MDIO devices, if they lack a compatible string?

> As I understand it, kernels must be compatible with device trees from a
> few kernels before and after. There is not a permanent guarantee of
> backwards compatibility (like userspace has) because otherwise we would
> never be able to make internal changes (such as what is done in this
> series). I have suggested deferring these patches until after an LTS
> release as suggested by Rob last time [1].
>=20
> --Sean
>=20
> [1] https://lore.kernel.org/netdev/20220718194444.GA3377770-robh@kernel.o=
rg/

Internal changes limit themselves to what doesn't break compatibility
with device trees in circulation. DT bindings are ABI. Compared to the
lifetime of DPAA2 SoCs (and especially DPAA1), 1 LTS release is nothing,
sorry. The kernel has to continue probing them as Lynx PCS devices even
in lack of a compatible string.=
