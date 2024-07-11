Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D492F256
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 00:55:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=UgDxiQPB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKqnp0Bg4z3dL8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 08:55:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=UgDxiQPB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=oss.nxp.com (client-ip=2a01:111:f403:c201::; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=madalin.bucur@oss.nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKb7n4W9pz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 23:25:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWO0lBrOsD+UMXzxHDKh3HFNeQGqHf/oPLI3IkPq+yrQk1a0+i792qvp4Y352xrxJ3b8QMLM0P9l07210PLIsFapfY179dedjbEoUsgg8lwL1jsgU1s8aQHIFXHiyhecAekybfQOtMt5iuJFqO49I6enNIqgfUB9l8buQEnq6MfrJKjb3+4d1IJaCzvnVL3M7FmKl2lEnwR7Hp8Or+4H48yAKbth373DMMsMwSkM2ePlTsBeqYy6iWSfRj7DICQDqoMXH3kyv9tYF510UWMBriL/910cO0VKEsJWMDbt3Zp8G1749LvwO7/vMeu7P6C1ZG41PLu+pkDm8nMjKbVVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqUA3wjYeDilgJqc9hq0LR10xrF4Se59Vj+gkNzPvxE=;
 b=d10r+X3qPVBtCmaWw7caZ5tKNM5EbmNyqxm/WgaHtoBYS0W+qySGZfrDn7QNOGn3sEFl7SofxhvGosWITMoNDufoa9rgA3aQMEg9gLuVcgmu0YBXNigbCaFCwxIaX1bQS7SATSraQpHOSWgOIUSY1IQg6Fp0bBtz1QTXafY98E9Waop+EOuJ/F0O0LBuyB9VauWhovjLQs72f9FsAUWdlVqHWKn3YT/f84dds99MRHY07aAlpJFRR5VD4jximHvP36rYCRNpBJtAqZ3ftMtJub8gA46zf1z8L0YcpT2ZTGZOA8pK0H8SfQJVNUzUUi5eNtxnZa3WBE2/UsEf1FkPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqUA3wjYeDilgJqc9hq0LR10xrF4Se59Vj+gkNzPvxE=;
 b=UgDxiQPB6W0R5w0q4sTf3XK9pwg/eFh0MGFj1HrYh9mM4tyYRqEGJSRJg2wQDPB5Gf7MsxhmIocsPrp8Qa4BOXvY32uZt01nadvzONUQAKwm+m4HvbUhfRFFbYLhsbeivVldDRKk7D+FKf72KkrniLIEhJATzNDL5M3RGluZcqI=
Received: from DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 13:23:54 +0000
Received: from DB9PR04MB8185.eurprd04.prod.outlook.com
 ([fe80::7cbd:347b:1bfd:fb35]) by DB9PR04MB8185.eurprd04.prod.outlook.com
 ([fe80::7cbd:347b:1bfd:fb35%5]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 13:23:53 +0000
From: "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH net-next 0/5] Eliminate CONFIG_NR_CPUS dependency in
 dpaa-eth and enable COMPILE_TEST in fsl_qbman
Thread-Topic: [PATCH net-next 0/5] Eliminate CONFIG_NR_CPUS dependency in
 dpaa-eth and enable COMPILE_TEST in fsl_qbman
Thread-Index: AQHa0x0der10ldsDfUGubdQCvalI0rHxhJZg
Date: Thu, 11 Jul 2024 13:23:53 +0000
Message-ID:  <DB9PR04MB81850CAA8C2AD7CA03D9E76BECA52@DB9PR04MB8185.eurprd04.prod.outlook.com>
References: <20240710230025.46487-1-vladimir.oltean@nxp.com>
In-Reply-To: <20240710230025.46487-1-vladimir.oltean@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8185:EE_|AM7PR04MB6936:EE_
x-ms-office365-filtering-correlation-id: dfe02133-e6ab-4273-815f-08dca1acb59f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?gU+PcZ+CSWW8g3xd1xkX2mqtQJPXWWzbGHo8a/GfoEaKz83tXTuTk8IJ2igz?=
 =?us-ascii?Q?FXVsWLp4mqQuOO8tvszg0mRAqL7fFe5U8hZSlt+nSo9tWDy5WFYUOb3OI+Ni?=
 =?us-ascii?Q?dDuT1khjZr7mtiodKg/4ok2iVr/oeHPLdDsBrOiwruFkvzg0tY3OfzyRLOAB?=
 =?us-ascii?Q?kqmgzq7o8dKm/5FH92TGapmLJeXhzoGkf+Hx/gQCbJVtLFrdIL3kCxjnruiN?=
 =?us-ascii?Q?jhxY32J3ruO7A59HJ1IoRAvbSVxGBmOBO5maKLJTsNEpYY4p9zulIL4zzq7Z?=
 =?us-ascii?Q?haVjyZj1o93vbnTC0pmwsbtHx2RZgx6+IeZB9slqsN4+b5dH7ErmGQE6DjHX?=
 =?us-ascii?Q?IZtdqz/zU2uT8DUF2UPYknE0zUXAJRlMg18ZSzwfTTitwpF2U1jGcrFcJN/P?=
 =?us-ascii?Q?LmX5dSBYQ/aQ8UqvewH43YdPkGsiSHmZwxq1bman8rKN2QUueLULM1soIsd4?=
 =?us-ascii?Q?mo9N6eXvsfvjkvpAOcmmx+42Z1wvtSGWTgUOywoTahsM/FRYZICNSiqV3KD0?=
 =?us-ascii?Q?7t7yss/qldTNAgrKbC43zys6OO3H7zESTZed221vfs0K5dG5rr1r8LdY09Lk?=
 =?us-ascii?Q?E97j+lolCwra9DEopOs9g1sLkXPV3ONQ/Ne0EX9cQESvF6OMGBASN8d2JMWq?=
 =?us-ascii?Q?gQeCgyZvjeB9S0O2QpFw1pUOs2Fx6lEd6QeliPtBgPqvsj1mYwHXJTJwxt9n?=
 =?us-ascii?Q?jpzKoArH77OGlRPuZidH0cxFJbHAhJDJbq9h49KLhMhMvr01FZvo/QINCWB7?=
 =?us-ascii?Q?LdcM1y7kPIetnNAwBjoM6iGVRcJ+2+E0lQ40PDZmEb5YRzo+poqiDBTRisqs?=
 =?us-ascii?Q?MenenYayRnyi9MyU3mqZctrZCV77CFMLPL2oB1R/HCXr0G7n37WpQMBZsQuv?=
 =?us-ascii?Q?6bqFpXEaK/09DG+sMhePPLo6tAW7mFc4sUBPKpPzJZMeH4NNkNNJJ760NoqR?=
 =?us-ascii?Q?uP2UIQMRvOUnSG4+Bsu6bWierVFLyzXzvmmRE2h0cC4IwpJLehdHC+OQ1JHN?=
 =?us-ascii?Q?4LpJBkar4Fd6vgK7FwRdwiq16Ut427mFUzCtMoGHG+tVOeXMMa8VNX3gT9QW?=
 =?us-ascii?Q?e/xhbAHJP7RCxXqU66mwX5GetaIP+rUTVUk+aJEtLQQcm3jxJEppcFQyYro9?=
 =?us-ascii?Q?7HQIR6RCjQZw9WDstcnz2o47Oi163eMRwgs5289LRg5lDCEIbGeJ8vnIF3Gx?=
 =?us-ascii?Q?JmD+jds9FzyRBXuy8XoFK8wm8IKhh8BoJl/oiwRRj1owTETFMtw2+wdj167H?=
 =?us-ascii?Q?ZF/uPEGghz+bNe8l0MK/o4ptMKAXqPj1VPj3a7X+kkJMAzL8FqaB7DRhkQM3?=
 =?us-ascii?Q?5YilJN+ehFXF5i9OWO4PRfgzI4U1i8jWXJiTuTK3a39bApUWKd3eVfKi9txu?=
 =?us-ascii?Q?Sfo9F1A=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?hot9YoOwdTDQNY+Cj8aXooDOSRnKT3E3NMgfRDn9ncBxXI0+MLtLpX1Cptni?=
 =?us-ascii?Q?WvZy2bArT7q+yiAxEag6hsyrxrSAvlIPA8+4h0Ct5ojDk5KTeWRp2O5RYWC7?=
 =?us-ascii?Q?gxabpxE0miE/bhByH4SZGQhnOpBvmp4Q6fWGd0LUUtVJnp70KjYO+hwnZd/6?=
 =?us-ascii?Q?Y7n9u6ccxJdw3nsgNcfgjDuEPR+6JAm3QTzP5ABSAgqdK9wkYanmEFDAZlXh?=
 =?us-ascii?Q?U7U4TNQy4g4RWpWo67t/hCjOOYX4u4IayyJT0l/hoDTnKS0SQ2/5lcQ5VSDF?=
 =?us-ascii?Q?5wFpBLzsKUjkUpWx9NWMP9fibpeu9TQhBhyoYid9zMWZG6CI7+vadY0ItXuF?=
 =?us-ascii?Q?JfKALvdmy6MqdIJbLeEgfb/CYYdEoj6dJnLQy6SXvJbM31Y8g1PQNHKy6TmT?=
 =?us-ascii?Q?iPHokMRzUPxh8KS+7oxdxDLzQw3udBeoKDzTqmmnZ4CunOpOmbF6x/PAHr5A?=
 =?us-ascii?Q?4gVsN4DxBrPVvpZnY+ulQpIzxSoZQ3P3rZPYTOi5UUXW8eDeFxjwXsfCIM06?=
 =?us-ascii?Q?gZP2+7ZsKTUY+yspxgtPtzYaf80/V4PeWjbrxoOF3RdUPXSkn4M4/9qSMr1M?=
 =?us-ascii?Q?KUqZEZZiLc0T9X1BzCpbbnG+SVMM/RDZRoAT49saUeDdoOYxJYCVL3HLZoDt?=
 =?us-ascii?Q?1vHJrQxugexOISK6Pu+KrfYniwCeRih1Pw1Eqt4tr8L+UY6DO100PRXOAP3b?=
 =?us-ascii?Q?sMGagvTnnaIP5zaFPVRonjKkMEb++P9xgU0EFOuTAqOtItXc4OQUmgJs7ezH?=
 =?us-ascii?Q?ePG/gm1Zv4dqeQAdVNTq0Nlt29X+r9z/C8c7HxLZk7gSbXULTetq9SlNToDv?=
 =?us-ascii?Q?Kki3IhfRc3W8+sMVn7mofjQD+iQFIcy75bchPRFSQTiEARhEzcQeQijt/jvl?=
 =?us-ascii?Q?XevzyWjHOP9n80xLe+45oLJWCA0QExYl8E31Ojbo5ntXFfYKbfTiPVhsTNa8?=
 =?us-ascii?Q?/Fxoszqq16Ba8zbd9V9VyWly0Y/s7QICdMQRve9IH+TrrrbcHTE9d1CXSOCZ?=
 =?us-ascii?Q?RQe81utR3/3faKxwvLh/OGuthMJ5m4vIrq4j54nX/YXaQ8b/Pb3KmIR6rIv4?=
 =?us-ascii?Q?XLdfP6SkTEvHFoIECKQ0k6BBm1146vaPLKP3wjqtI2Y24PQcfDnz9BL5otVg?=
 =?us-ascii?Q?sOiuOVY+/8ALVp+RiT/CBacfEbhd8i//zYMSPdILOJ+kEVYaeqU7cJa9XIik?=
 =?us-ascii?Q?kdMq4RqwCFoVzvGeydxEDIq7vnT4/spT3ruQc2HIw8nOPHom1tk4sSXrZm7x?=
 =?us-ascii?Q?U50Y6BBsQAACI7VezszAVArfgd4aZIvjfrTTICU4q6M0cYPjnISElSQIKv/t?=
 =?us-ascii?Q?gqPb2SwNulEcVgIe2RJlu7elK+soWdZxDGi/2DO+1cmDyXhnoU0lVXY0prQ7?=
 =?us-ascii?Q?iU1T4P+gyUADL27Fy+CPs+yaWLFEtkoRDukyubDNDIy6DzCg35lsACvi/d28?=
 =?us-ascii?Q?QD268rWIdjVqfLw7k6QyRfaaBTascCw/Ut8qOlhb+KAgYyHu5kcKjoprvgJH?=
 =?us-ascii?Q?B+0QunK0BOLP3Ktmw1ndj3FXV4PxrlFpdN0QSam2C+RcX1EqViFzOpdcv0ok?=
 =?us-ascii?Q?8ts6iIwrDFuOyV5J8KHzQiV0IaL3M1y6/m3J5FJ8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe02133-e6ab-4273-815f-08dca1acb59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 13:23:53.3187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dM/RVcbmp/cDkkAbh4rFOT7h8aoNShf2xIACPB6iLdCRt3/xhse3JSqb/y4iVfnsxiLtHJd+xUv7ElOU5gxSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
X-Mailman-Approved-At: Fri, 12 Jul 2024 08:54:28 +1000
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> Sent: Thursday, July 11, 2024 2:00 AM
> To: netdev@vger.kernel.org
> Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Breno Leitao <leitao@debian.org>; Herbert Xu
> <herbert@gondor.apana.org.au>; Madalin Bucur <madalin.bucur@nxp.com>;
> linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-arm-
> kernel@lists.infradead.org
> Subject: [PATCH net-next 0/5] Eliminate CONFIG_NR_CPUS dependency in dpaa=
-
> eth and enable COMPILE_TEST in fsl_qbman
>=20
> Breno's previous attempt at enabling COMPILE_TEST for the fsl_qbman
> driver (now included here as patch 5/5) triggered compilation warnings
> for large CONFIG_NR_CPUS values:
> https://lore.kernel.org/all/202406261920.l5pzM1rj-lkp@intel.com/
>=20
> Patch 1/5 switches two NR_CPUS arrays in the dpaa-eth driver to dynamic
> allocation to avoid that warning. There is more NR_CPUS usage in the
> fsl-qbman driver, but that looks relatively harmless and I couldn't find
> a good reason to change it.
>=20
> I noticed, while testing, that the driver doesn't actually work properly
> with high CONFIG_NR_CPUS values, and patch 2/5 addresses that.
>=20
> During code analysis, I have identified two places which treat
> conditions that can never happen. Patches 4/5 and 5/5 simplify the
> probing code - dpaa_fq_setup() - just a little bit.
>=20
> Finally we have at 5/5 the patch that triggered all of this. There is
> an okay from Herbert to take it via netdev, despite it being on soc/qbman=
:
> https://lore.kernel.org/all/Zns%2FeVVBc7pdv0yM@gondor.apana.org.au/
>=20
> Breno Leitao (1):
>   soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
>=20
> Vladimir Oltean (4):
>   net: dpaa: avoid on-stack arrays of NR_CPUS elements
>   net: dpaa: eliminate NR_CPUS dependency in egress_fqs[] and conf_fqs[]
>   net: dpaa: stop ignoring TX queues past the number of CPUs
>   net: dpaa: no need to make sure all CPUs receive a corresponding Tx
>     queue
>=20
>  .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 72 +++++++++++--------
>  .../net/ethernet/freescale/dpaa/dpaa_eth.h    | 20 ++++--
>  .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 10 ++-
>  drivers/soc/fsl/qbman/Kconfig                 |  2 +-
>  4 files changed, 65 insertions(+), 39 deletions(-)
>=20
> --
> 2.34.1


For the series,

Acked-by: Madalin Bucur <madalin.bucur@oss.nxp.com>

Thanks,
Madalin
