Return-Path: <linuxppc-dev+bounces-2093-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDD999D95
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 09:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPyWq1W6Dz3bl7;
	Fri, 11 Oct 2024 18:13:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728630791;
	cv=pass; b=hntp3OXkx/MtRhBbEPyo1IfBr5WrEYq6re7kFah2RhYP20PyKVMrzMp2yMG+EAsw6rngu+3xl0IpCdM3kpaJC+LtlS1AjPyeBTCEjWU8pVrX3xgxaknDreDH2tSoAA2oyOQaOJzQ6O3h7bM07wzjhgt6679fxOLz8mLrnDfDqbGhlyUEgkAEDhpWokIlbC+cHkn0pfCL6cZoedVH6oV3L556S083EJRPubsXoeYY2e7woTSCUJDEujP2sBpfwWLcXOiHhKiKnANhYWoGJoiV/+4g+eJRBQ+AWiIL+4hLmElkHaWIGRpGbug1tHFfLkxUk0vi3zxD/UyjBQyeGYOgdg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728630791; c=relaxed/relaxed;
	bh=jkSVaAMDJtiTlpzWJ6S3VqOVXH1Fti78ep4zOljKpXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SJwY0E5EhiTEFO1W9224HGNM+L8CoVYeW37yFPIGVj4mgiCz+0F/60EXuSaizoPUF01TmUchU8GQojXzbQZfgSIf1TDft3muKSHivCJiCaX3msyH9mPoy+aqokf+Ep2REAItT9sNhSmzQhxI1nRt9goNNCjc2+ANCpANBiUllDf7/sHoXVs9DW0/qg48B11RAxSiMYOJzbYfhS53/qqxfhJzvuiTAyage6GCsIMTwD6CcWzn6UTZCNsHz2KTaRm0U6HZ5HJ7XCKgkxsKaaVFsI1QJ1Fle/aRhEQJ6HiD5pB7Uez4SgSB/rNgdRfW+0FK9UFh7fa6usYAcvPKev3FNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jRQf5nvU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=claudiu.manoil@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jRQf5nvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=claudiu.manoil@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPyWn2Sn7z3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 18:13:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5JrvMjEvCjIcHBmj1eBALtVUQNgshc0dt+RKTjGDslo9+ogHcMnb/tYj5hhbTbIkTK1WevOi8yRu2QeqTfFVSleQZNRsdvunRPmUuZfVkwc0qdEGUlUDIZop67+LBR9uG1ct41rsaAPrtRfgPDkwLjHLeEaxF43FWY0/jgfQQRQi7J7fHV0v2MvyMM/S7t0fDBALsmoNdGEaAGE9rt3iMdb8sOw4rVbr60Y922ytMXlLg1tsuvhQW4Fvb1vsDqdigozQDRmgmiCARJEOu2lMOATDj89XADKMZWPnZwgc32ASdrT6JybRvwol4XtzCNYqHDQVcHy0VejWOAWUkn2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkSVaAMDJtiTlpzWJ6S3VqOVXH1Fti78ep4zOljKpXc=;
 b=TsaKu1kkWIjYTSM3ZOucw9zhxZwyBD5ubo2UFfoZg+zJMgutzk6CAy3hAzQ0bauoAxPkjF2cr0OR63kX8d0UuSlT1JpfZPRmWDsrjPx5JYLEVHr8OeOVNAIC3NXMPGJXnFtazp/9TvXbzbZEy8VixlDtYEht4PUORd1EMSwNC/cvtCFzqMUHu6jXjgtDM4Y/3D0OHrUM5dLmNiHfaN+WEDgULQybrlwg+QEBUnAjS18TYYBB5/zGvt1CbhKkGGtNMfa9WqeZTk3l5OZKqjmM0GR/lZ+XKX/hpeGgtP4eNyHR1mdVzCfYjYWl8bIsZ2/pEBVh6Hl9MP9tAtGrmHuamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkSVaAMDJtiTlpzWJ6S3VqOVXH1Fti78ep4zOljKpXc=;
 b=jRQf5nvUuMdZvgzXEjlNBZp4BrGEz9VISMGZ+9HmNusv3caV9IbmjDEvvfkW2mytvYKGCwKJ+kAu0G8yHp+oBWBuvQ7xs3+vPLuaSYzm3sKcVjtETX9mlNWNiDGmRQ47PayypGH9MfJsMvHjlydjt5DVfeQoMg2z6mZuyv+oCN+VPuv57xitF0zWkhmLvPaPp2F5gmnFDCxFP+whWzp65nbCz8hfyZXS/x4NHNleHCCh6SftyyiOnyTxxq8Ymonqdc7LWWGyKqCEjl+U8FnclPmCubXhsqKef4fABNBX2n1hY2btw60nwDIl5Rp31b+T+yadpVq4tQkLQzc3qI6Kjw==
Received: from AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17)
 by DB8PR04MB7100.eurprd04.prod.outlook.com (2603:10a6:10:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 07:12:45 +0000
Received: from AS8PR04MB8849.eurprd04.prod.outlook.com
 ([fe80::d8e2:1fd7:2395:b684]) by AS8PR04MB8849.eurprd04.prod.outlook.com
 ([fe80::d8e2:1fd7:2395:b684%7]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 07:12:44 +0000
From: Claudiu Manoil <claudiu.manoil@nxp.com>
To: Wei Fang <wei.fang@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH net] net: enetc: add missing static descriptor and inline
 keyword
Thread-Topic: [PATCH net] net: enetc: add missing static descriptor and inline
 keyword
Thread-Index: AQHbG4vsngPoRfYLS0GcdXcVcjZlerKBIorw
Date: Fri, 11 Oct 2024 07:12:44 +0000
Message-ID:
 <AS8PR04MB884978B9D55DCB94225480EE96792@AS8PR04MB8849.eurprd04.prod.outlook.com>
References: <20241011030103.392362-1-wei.fang@nxp.com>
In-Reply-To: <20241011030103.392362-1-wei.fang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8849:EE_|DB8PR04MB7100:EE_
x-ms-office365-filtering-correlation-id: 9dc7ba0d-6004-40b2-04c9-08dce9c41aa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bj2pCDjvpCEn7/EATu8qSBW6Z1DlcxSLBPfIboKuO75LURuyoyqHMNxoVGRq?=
 =?us-ascii?Q?5G/wGhu61LEu3FlCPWVYvE6N/DZbmbRQk8zrZYOlJHOpfF2JjwcXiaZUByxt?=
 =?us-ascii?Q?CspH1J8wzilBOp4cIlFUZ23Bz5qK5oIGt3fUZLEWxT8Ttgyn7p52ZZZ7V8yE?=
 =?us-ascii?Q?JUBwmuhPGZCSUA7Q+OFv/ENOObwsMRz4VvV52W67UYo7/EFSbt30peMW795k?=
 =?us-ascii?Q?aBpEduIwLKRgc+oeP40y1wehyw9CPkJLhoOfkb27H2J59tP2mtR/MirdThqw?=
 =?us-ascii?Q?mdoRx3DLMLDzeBIZhBinvMr+7d1VTRVBWPJTd6TxdCt8pvFMJb0bQXll0uBl?=
 =?us-ascii?Q?44owB7WB7axl7OgY7O6H4rE3Q7h1jzgoNqCdEQBhK38fEzCsNWG6fa/kg+Ce?=
 =?us-ascii?Q?k/vPTFG7fu0phQjg+Xr7tdR3Hdutna3zLVfuesMiaBmCnvxQAc/vx6eZUqo4?=
 =?us-ascii?Q?LnmoIzjo69Ny0iO6CURqKD7fkHO3+R1RUN2YoHIJzRPseU1BgHvE7WL2xiPj?=
 =?us-ascii?Q?U8ajKmqwamAoPe4v3NnRIMMeorH0XKXnPhhaSpdk8pTF2pazrEgSSTWyWwVl?=
 =?us-ascii?Q?XYbY/HTU1b5/SwI1QF/KRGuPXULV9Co+3ixAMzsoGCWHSRu7afiXlWGYn5MR?=
 =?us-ascii?Q?Ky+VRrvJT9s5LXkb1oqpZ12GKlfaUbMPDenjVlMW3+ucJ9I1pEFikl71DUNT?=
 =?us-ascii?Q?OcwcT+G1AVVa0M7/i9irifesa9oEFuLcrMiHrEUJegp9+dWpML6+7d1U8HZm?=
 =?us-ascii?Q?6drRSXU9SkuILVWVetXFAigdI1H5oQTQ8DienuLrPCR9/M0p15KuEXtAh+ys?=
 =?us-ascii?Q?jW4rqWlLI6op4G07LXO3bjH3sA7WqmxRIFk3EasVJHS9aCWGpALZj1cponVJ?=
 =?us-ascii?Q?q92P5FHbFLC+RqG97XhicQLWKSmqmnhjyGb9Kjp9BX9vYM74a9uy43QrqpYC?=
 =?us-ascii?Q?wKOE/fP9pJ0n1X6SSzR5QbXN3fU6/pMVUlxe3rMF7jPHPwrhrtFfhGP39ll0?=
 =?us-ascii?Q?cUY2tfhmMc2LkcU+eQVxNzG2wr/HIABJu8gw/5DZcACvr3m2l5MfQ59yVARp?=
 =?us-ascii?Q?gQNbPrGvpV8+jpdlNh7UGSppIUmUl47gHkAYHDi3Pg33H+JiCjJtABZKidkn?=
 =?us-ascii?Q?Ao1+VSQxtp2XcpyP1LmUTRXHsSgXqoudhs4DAveLm9RThW2jqZz/uKhLBn6r?=
 =?us-ascii?Q?BC+Wv2yE3B6L1vuVC7fhoxfJCJ7KzKPRK/hAvlVO3fdishGUffwOF1/6g4HN?=
 =?us-ascii?Q?GTWSpF9+5LA6PRlgbtjK0dR97wWgx0gaYtzmczWcH0T9TER+VsIjD8khSYkg?=
 =?us-ascii?Q?UESlcDtqluQKHxrJY6ntDhT8QmSjc/jSGR8wglSuG7ravQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TDbP7j0zTu0gAf0PxXEJ069WRRt5mYhYAu4hIF4xJYdAc1eaI3Weds7i/Gv7?=
 =?us-ascii?Q?wnr+VqupV7spIi0katgj5pcrX+T+gHwAuImsVIbxLo8ION68qP07TYylY0Fa?=
 =?us-ascii?Q?J8aEqlWrjzyNGMMj+6+VQxPS4OIKZBq4Ob9d+Pk38TLr+WkHnMzoEpLm6fNL?=
 =?us-ascii?Q?bXgS9jdPXcfmK3/3CGc6/S3mnxBENV3AIlGXGS8ClomUoCtf3/+/WUPXvtYE?=
 =?us-ascii?Q?bmeYH29a44CdAv60+Sg5LcRCvaT9q1DMUp/lYFIJnumR1G70c3i6oelw6/7n?=
 =?us-ascii?Q?dmkKcCaiVtbYo1uORtLMGEpkzTlD70H3oIiRlM3KKXW5D1jnoxlAnvqDspDt?=
 =?us-ascii?Q?Na0dBmuGnSWOMm3M7yOdkO0A3m9DJHoWiuZSp8IIB4v+UsU0UJIXW2mt/YM4?=
 =?us-ascii?Q?1QY6J9cilcvsjhwCZDOLyft11AOdGqfO1PboBdMb0ChkwrXd1YM0zFrAp1Yw?=
 =?us-ascii?Q?bZ7uo+CNXoMg3jtrvsiThM/tufy4K+UB3W1LEGBrbeyo4/6QauPcGQcdLDcP?=
 =?us-ascii?Q?b+wwRekgjvZ1CO3AbMXaKLRw7x4H2qRw8+XCapp6DBJYaTGE0czFuTk29SMU?=
 =?us-ascii?Q?ZnCEvjUWWaCSTvdkvVGuEoFcWHtZyTP1G/EYfPAl8ASZ2FRKa7MNnm6QD8Id?=
 =?us-ascii?Q?cciy4VzsWv0gV8NeD29wcPRMIpV/w0MCf/0FODZcesdLDD268tVgSb77Lm/R?=
 =?us-ascii?Q?fiHCrGB5d27U7w0QqDTKLEvGOgS3OjA1x9Sko028sxvv3yRXKzOHTHNbLHxi?=
 =?us-ascii?Q?C0BbK+QDUQtOHGDfROPoL61Essbb5qVM8fDpwi8ZkavJNNibyjVBOBZUsB1C?=
 =?us-ascii?Q?I8eNJEsGUB3XyaCFOw+75ljb89ExKjJs+ST2CyTN5nwsCqn2hfZzQXXeNWKi?=
 =?us-ascii?Q?zPM9s+UQDbHftfW2ZxD6sw8M26WLMe3pE6rGBeboPhm5KPSwxFH6D0NvERQM?=
 =?us-ascii?Q?9YgKLOD1zaRoWLQagaopu0tTjr2FNuXOYDsRbNPgDsd5ENDNfJkcs9Q60FYC?=
 =?us-ascii?Q?+oBk7jUE+ZbD3qM/UAPRJa8wixPJ09iCxFLgEjXLXqJC1BDSttcjUWcAqct6?=
 =?us-ascii?Q?1udrJUW+1jULmffLa4nDHykU39/wK7iGRhqPUwEgoMxVCw8jme8Nc8L4hm5u?=
 =?us-ascii?Q?x3lfpkYBmys93D48rj9RIoRC/GKn/IgcCbGp6zgSLLrNYufVmoapU7xFAYdU?=
 =?us-ascii?Q?FCCDlF0I0d0TNWMpcDr+E1ZjkPFzgZt3TqNlcx047cw0vlKYQXU61J4o4w5+?=
 =?us-ascii?Q?me7Q64KztFCpl+9EJmTC76dE3KoKdXZx5zlACRMzskBsKtaKOtAvr4QQUGy2?=
 =?us-ascii?Q?8IEWcDI2qTL7neNYq7rO5FOEvJ9kTlhYTBm7IuK+zxe9nGzQAsdBBqZ49HIU?=
 =?us-ascii?Q?B/vv2ykY3fOAA/3hLP4ZnwiQbEC7/SYGYB6mQcccu2tz1Wt3PhMbctOBuljv?=
 =?us-ascii?Q?ElnCgiAK3FwSrqgRhGD4YBhJ8/KKXUaVboAlII2LWp6okaVHPYR+fqhTxHz5?=
 =?us-ascii?Q?sbfh4KMLiNwj0l3RKMp5qD11yDHy+5YqfLYciqrzqnd5IkbMSw4csNdqsQr2?=
 =?us-ascii?Q?1jXOOBa+dKPJQzUzgxonGCO56p96mGGLPCt4bHFp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc7ba0d-6004-40b2-04c9-08dce9c41aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 07:12:44.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIiaBXZba/YEn/DuAZVF4lmknfVr/C6cVNtICdJyZvj+gw2tVu4WQh7lL5nk8Pfp/OCdxkyeiGxqXWzA9SMVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7100
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> -----Original Message-----
> From: Wei Fang <wei.fang@nxp.com>
> Sent: Friday, October 11, 2024 6:01 AM
[...]
> Subject: [PATCH net] net: enetc: add missing static descriptor and inline
> keyword
>=20
> Fix the build warnings when CONFIG_FSL_ENETC_MDIO is not enabled.
> The detailed warnings are shown as follows.
>=20
> include/linux/fsl/enetc_mdio.h:62:18: warning: no previous prototype for
> function 'enetc_hw_alloc' [-Wmissing-prototypes]
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iom=
em
> *port_regs)
>          |                  ^
> include/linux/fsl/enetc_mdio.h:62:1: note: declare 'static' if the functi=
on is not
> intended to be used outside of this translation unit
>       62 | struct enetc_hw *enetc_hw_alloc(struct device *dev, void __iom=
em
> *port_regs)
>          | ^
>          | static
> 8 warnings generated.
>=20
> Fixes: 6517798dd343 ("enetc: Make MDIO accessors more generic and export
> to include/linux/fsl")

Reviewed-by: Claudiu Manoil <claudiu.manoil@nxp.com>

