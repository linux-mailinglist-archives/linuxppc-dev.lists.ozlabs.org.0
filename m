Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FE48CB4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 19:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYxVH4t1mz30DM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 05:51:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PGZt5QpI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.51; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=PGZt5QpI; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYxTQ4qG9z2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 05:50:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzAjSejkubqMFb6p1jg6QxuQtuPAOIqfIDMSMY7DbxGOinVdQRpcIE3B3onecZoomuGOCmmm3KD8IZOHeFSFZF8qskKHqn8VMJpjJkrOIQmIwmyRi5fNUMuRsb5UR+cTP3Wc1vLe1L71sidRTdQX3YGPKbEkLzAFSHlzKVZdetaueNZqadssQ01xKmrasnvD5h3sL1CGML8eezR3UJilbt00Rb7PKiK5QUTM4K6Rgmo0BLnAL75D56Iga3LGzIF6WVSHOwgmvJl7MJqdvOhZBnT9qa58reaypBnN19HWhzbUs1eCT0DjKj08Pyf56G9gzt5+zHag6A3NkorBaHwmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2yHzROI6UYxP0UDeqstPApfK3kbLs8Ke5H81at1z8o=;
 b=JmH4NiHsSin/nWj+KUZY4u4CtI3PwyOThlG/evwcmxwujdSQRIEs1NSIFoTxIeKHI/Ni4bz2C6+nrNiQuD4AENraXMDHb4GMW/Nx7k7x0DUmDD8fQk53s/OU7NEnAYSYLZKIrUayzbJ3ac7nhhDPe75oeV4LTLlE0MWbkNmE1bIoRnrDmlclZszzYDnm1tVC0c2NBAbAF6kX4JqzTwnJjZb9/afg/Ts3V28BJNRfHACqtZPbxtxBsNbIsKBcvplW8L/zIE0lmX37dUdlpP7GrQOUpu50Xb9qO/XIrF5W+Ci6HGFLU/Oh4SZLYJ2R8w0iMjFtcx5BEkrbOgrdhGuZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2yHzROI6UYxP0UDeqstPApfK3kbLs8Ke5H81at1z8o=;
 b=PGZt5QpIoBZ1LHl/VArNPlTiL9vAZHUplpFcb+JnpQGCs/X7Q9l4jjArBSRsThs3oDkpOFH4aiAO4Llp6pXmhltB5lMZdPdrXzOrDJWrO1qRNVlvNt73SP7ZOO+BkbfWYQNKZQlb8P0hjWZZKZJbc7jyC1KXLQrpG2P4pBH+d+A=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0402MB3550.eurprd04.prod.outlook.com (2603:10a6:803:3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 18:50:11 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 18:50:11 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Maxim <bigunclemax@gmail.com>
Subject: Re: [PATCH v2] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Topic: [PATCH v2] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Thread-Index: AQHYBxIPym2G7xq+TE+bIvwtYjnm9qxfvE4A
Date: Wed, 12 Jan 2022 18:50:11 +0000
Message-ID: <20220112185010.onk35fvuho6qldea@skbuf>
References: <20220111152947.6zvt7j7366wsg6o2@skbuf>
 <20220111173723.26212-1-bigunclemax@gmail.com>
In-Reply-To: <20220111173723.26212-1-bigunclemax@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74bac946-cf90-4daf-e2f4-08d9d5fc5ce8
x-ms-traffictypediagnostic: VI1PR0402MB3550:EE_
x-microsoft-antispam-prvs: <VI1PR0402MB355087CF90BDF18C5F5B872CE0529@VI1PR0402MB3550.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WnlYlo8FLOX2CLLwN+38PlrDjFp7AWhfrYtRi5S/Jcs9Id78f/O7ZquAqGVbYquZlhsUWHaxwTMBf6LlTSqNRj8P45VOnGMyqJ9uCavpeXiPuRGe6COX9JvTMvkdUjPG4xMNt2cqvKGAqcgxO7pYmMz567gMHipaBUwXon+Rk0oSmL2rnWlxr9zWjpd9lqNewMXvxEAWxglhod3TVtSzl+xKzSFk5WB4JBjTK5ecIb4AiMCwDwJAvpX+zZkR16ta3cpt8G5VSIS/E2oGfmDZ/Urg9Uic4Grxwi8RYotHff6zHl1xMfsOfZhvbfVFe/3t3iDHodJ3vu0mHA4GtfKISM5kUY/z+y4tUPRPUgWTPpIHd83G+lDl2RD6ZMJaYmAdzwR7lPo9B3To43Mdw67y3taDc8dlds1qtdpRoKYA2lHzobF/eLnwGz/ATpSWtDYHV5F5TWb0wk35UbotDOlRt3eKr+UmGnb5Xkx9t1a4dtAOHWowye0AKPIrYwNisZfm3hZgrXdIusl5M3gsmwFj8Tr+xZWbPPXWFBMpY3cuuim0swtQfLQfLVTDE/S8dSG7pu1DRkoNc6xm3Z8S1mvG21F8kI6RTsm5Q1coWnsx1gpAxuf1+WslB24PVo9xCmge/FPWM1rpxPCPH2h9eNRqNWcnQaZPxDSIFWvh54cBvG5LGBtbUDh54vE60OLYbU1H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(5660300002)(66476007)(508600001)(26005)(66446008)(122000001)(38100700002)(4326008)(316002)(8936002)(76116006)(54906003)(186003)(91956017)(66946007)(1076003)(64756008)(33716001)(7416002)(6486002)(66556008)(6916009)(6506007)(8676002)(4744005)(9686003)(71200400001)(6512007)(38070700005)(44832011)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ta4LXGMjI1xEK9e83Z0Q6otbMmjOMNvIMEABTy3kaFfA2oufuieDbloNrSf1?=
 =?us-ascii?Q?KxYu4JCAFNvL9nCvoJe7YdFmnDY4fKc7H5jbDwMRfld5oUQGsyAvZX4H6IVq?=
 =?us-ascii?Q?cfANjIc1DlFiMVsYwe0WZhr+ikZ7ofDH6B6GRq6yRpLMItZ32vZGLmEAJveW?=
 =?us-ascii?Q?/5FSfw2Yn5PbirB5FORgrfHYDWOtV2yBheJJM3sfh+Q9l2n631zJ9HGf4I+3?=
 =?us-ascii?Q?goDjOa3PAXFzskuKj8pu50MeIzLkONWIw+gMRZ4iNaANA3YDzbB5ux+til85?=
 =?us-ascii?Q?SGejtirvGiH4gln7fp6Zhivk5krt3Th+XuVb61/3vhDVq8LDfmm0NqME1seL?=
 =?us-ascii?Q?UsZXBt8qLbhNoBBCEFzGF9Dlc79UT6emyCUSbguIuDwgjV+5y27gr8yMyEaY?=
 =?us-ascii?Q?Sx/B/O7AJwQfQ6NDqHozjIfj9K6ywuv2WJKMMJuf0CS4rrQmOfjeYRJgnIKW?=
 =?us-ascii?Q?P2CxJFWtP9rvqd+LJ+IFZJ/lynIPXfmrfNYHD1DnZ16VUBnj8aQDGV/35O/Q?=
 =?us-ascii?Q?V/Tr5kmrWjDOxVN1nGe90fimKQpd1fIjxzxilPBZErUqP1WLS/uPo27wjWhe?=
 =?us-ascii?Q?7y1IqoB7XJVl4ZNioVbRL7gaVAdT2Z/XWeaXHZT5ojj/sNSIZqW27MEwVxjZ?=
 =?us-ascii?Q?EiveDcWTftCh0cSlfVWT2pOSoc1gwJo5cae8rJ6FhCUD5kLwfxkw95UdxW70?=
 =?us-ascii?Q?OsIGF7ggGNmdALeYg7pexd8MZ6V2y8AvyMouU2jJ37TdzXrQKvEm8XMSLK4W?=
 =?us-ascii?Q?s9FkbLnfO5fpQGdiVR6wFz7cL5p+9QQ/JVc7PdGLNQwZ8HNGw7XViyINZTJn?=
 =?us-ascii?Q?qRAT76z0Op+i6lBsjQ7EloRfiZ6h28i5ATV4tibLAbAP4CfJVW9zrpXDT9HF?=
 =?us-ascii?Q?mM2Emzp/YPp7tMot5ysoGOYDm/hi7Oz2jOY8rs5N/8PRKsV0yMDtQNo3m6P7?=
 =?us-ascii?Q?nQZFxIhWMUg0Y2gakoN2V/iALXU5R5bGmxdwrmweppjGxXp+1FnYR0IbKIUw?=
 =?us-ascii?Q?16XqF0/oEtOJ/Nbz2v4Kfs5hzM2H/0mj6BUqh5ei3QAUEb67h6pUPGeJftFX?=
 =?us-ascii?Q?86AAV3FHltqxUlZfPmngQ0JSlUyXtqA5IECFeJM1lke7HQ6anHAQxFmAkw0k?=
 =?us-ascii?Q?6gxMv3/T3h3K4GHl/QnunavllHO0R6yvL8oD1/p02kgwOR9jnCFOM6m8kLBg?=
 =?us-ascii?Q?8hxvPNEMqnP4K521IySQi1H6EzwPjk662lQx0TfsMhBmXyIJ2SWzhh4FeUEl?=
 =?us-ascii?Q?dij3EUmBtgC6E/g2GOkKCpW73kbNv2OIEHFLYyiOtupx+Zaf26cYPS+U8fM4?=
 =?us-ascii?Q?zHoZWJy5mM+TpSErpInvxU2rJHwr+1GhUyApKmT9Zq8V1AloKwcLxhZ/3upc?=
 =?us-ascii?Q?zmOR97hyWMiusrzAITV/V6zcrPPha575xgpMW3lPbUSYqzdRuHvhrLWKVM6N?=
 =?us-ascii?Q?XoakVjTNbjSxdM7EdSrXkgyjaiyi1p+EnQEtCeGNj3dNpr09Tqu44poY8ZKy?=
 =?us-ascii?Q?N26BB20S3a+3pcC4OLm6QX5i+9T/GmNI8ZglpttUqzGMDoap38IbljGfZ9xh?=
 =?us-ascii?Q?fiJGV7N3nz5PeUgs+rbYefMI1doV0djLl/WKum9zND8/+zcOxVTTb/pLsfOE?=
 =?us-ascii?Q?biS+BrKwSmWGknRLfPuQh50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAD58E329BB59B44BDAAC8AF177595D2@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bac946-cf90-4daf-e2f4-08d9d5fc5ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2022 18:50:11.6252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkmioZiFAIeLItgQ3cwgbnKP8EiYN80/cZQUbylkK9uL/mhO2E3Uengcmk8nBO3xamOtgdD8VAclVMNIcrSWhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3550
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 08:37:23PM +0300, Maxim wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
>=20
> On board rev A, the network interface labels for the switch ports
> written on the front panel are different than on rev B and later.
>=20
> This patch fixes network interface names for the switch ports according
> to labels that are written on the front panel of the board rev B.
> They start from ETH3 and end at ETH10.
>=20
> This patch also introduces a separate device tree for rev A.
> The main device tree is supposed to cover rev B and later.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---

Fixes: e69eb0824d8c ("powerpc: dts: t1040rdb: add ports for Seville Etherne=
t switch")
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>=
