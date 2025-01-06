Return-Path: <linuxppc-dev+bounces-4679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46077A01DC7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 03:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRJTZ5LVyz3013;
	Mon,  6 Jan 2025 13:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::629" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736131570;
	cv=pass; b=U7Ech7FUIqPprxMBaXFssK0B7MLH8RtY5bio5iNA91oZUOHEMbIdrqqdgJRUoHlvTklnWdDCCqstcOPnG8wMelbeI/vzND8kUkfQ97wNHwmIUA9aj+jxOXdN3f3CwN0tK5VTQh2nUcq7a7PFHQ0cBBIUZvy/CVr4gTPerq7upg8rkQjt52cO9GrcSjmLeTNQjE4Cw5GKVejoWJBubzDFT1oD6GMYkyM+rdyJRD3EtNW/76NSkRsp2B2BejX8UTR9NN5x7IWth+BjOy80NBjAQ3I8pvpT73k5bg3VCqv9DUTkolWq2+AKHol8HwDKjqahEnGyazXJjdKiqXMdmhSk3A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736131570; c=relaxed/relaxed;
	bh=ruEDSCum9xValD/8fje29AdFDnXw69Zf56J/1DXr/w4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C+4rmvqVcxcZJ28A7FgU/6uo2tWpGQV+PkSv8GIbYi8kXpuTPQwOXlXehBSP/Ln2/4d+kGATfuV8no6zbD8qD+4Desu1uGzBVF0L2O02FdOaHxeZCZhTGDsfeB3t2IislEqSJ6vL1D0a4TOuF44i+bf5HnXKfbiqOkayBAi2GWf/yqZej8Urw1keozBy4Y0Utavyc97UNIVmCwrv5kmDzmr+oEkwmFkTHdZD+LSKGHnIdY1LTbo8C8ptgNgu1hFAD/lOqg4kHLyaR5BhXRKkGu0ApCYNaCdDIuCnoSBYD2IRKzToeejfr6uFdxdyVm9JoCadNdiu9wwXcbk+CjsKPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YZxH7891; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=YZxH7891;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::629; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20629.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRJTY2QgYz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 13:46:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjSRhGXTTkuU3DXyrjQmVL04zE325aU3i4yzOmzRQNyJRw7s3MdCanxoEa/UjwDNqAOCxjVgAU7vGvlOtiN3F5TodzX+u/NJiBOxn455TCzUJgV8cdEC0NGrlRrYnBFOTWdxivtD0vs0sQe+kYFVxrUa6zMPDctHiLDaaej4odsgY3oVitZ2bB8i41JkpLIcguI0SKITI4L1i83tG2AF9yf9812fHV6fdH+7NIzgBO5vVkbjx+jl24pU1DD11x8o6eeisCWj6Nz+iPP9x2jPI/uN9HrobJweVMkt+sTIq44Sc0dt55rqRlaFt7Cn4uLogs8/VfBnzKAyQ63J9jdMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruEDSCum9xValD/8fje29AdFDnXw69Zf56J/1DXr/w4=;
 b=s4nfcVYav4lk9xSpjT3kGT1ImjJy4kdJYeQUPZEohMsnS+LZcaaM6Z0OtuEkCTBhb1p9Q9JlQG9kd1tg9TAz070yVhOoKBslT2i5b9SKXxrQkyZSC/iEWsUw27bgAEjjQuhinQ5eVyQVe8RjII8RKLzFqGN6Sr1ZYvpatuvYyE35Rw0r4SBxs9Ht2oIeL3V8VsT2pVo/8KUz/EJe9KYdKD1F7iSY71Gnlz0EAu7rNubKQ5u4rTR/8VB6QPvoYApmFxtjvM0xLP6k+zUI/ULXQd/8RyF7NpBouAj2MeT/Cwnjm0s5A9Al4eelwPue5inBKTuHyKejfaIdvlwVDP/7RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruEDSCum9xValD/8fje29AdFDnXw69Zf56J/1DXr/w4=;
 b=YZxH78915l9q/g0cZahBk7FQC/sqnM+OJo5eEExBf8BXmvfI2vNywjG93ds+4S7yNmL5kKM18qLBI+TK1Yug5VPjb1Y1FznCicwYJreq3Q5z0K4R/c04/qKDQrmWolBlfsvcgwbBuv9dyq8IkQSgIoSgHRuifmbz5uvz1wB50EC2leI+QnnrNspAsdyx0L+pN8HTnjTeCA2UspoqkV9bwyq2j3WGhDugAn/VaaINj07E6VwXWVUDMZFRsoUweNbEb9A1IXIIRUX5DXtUhJxyKwKcyvgfFZtCFnOzERz/OyW/gVW8Uun8nHmaUgcSVR86DOaUArRNUA3NxmkoW8eDug==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.17; Mon, 6 Jan
 2025 02:45:45 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 02:45:45 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 01/13] net: enetc: add initial netc-lib driver to
 support NTMP
Thread-Topic: [PATCH net-next 01/13] net: enetc: add initial netc-lib driver
 to support NTMP
Thread-Index: AQHbXafxW8MqA7bx7kqd2V4Q9Gz5GrMFO4aAgAPM3kA=
Date: Mon, 6 Jan 2025 02:45:45 +0000
Message-ID:
 <PAXPR04MB851069DEC17319C96837BE9B88102@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
 <20250103060610.2233908-2-wei.fang@nxp.com>
 <829ccd93-8b4e-4dd9-bd15-58d345797aca@lunn.ch>
In-Reply-To: <829ccd93-8b4e-4dd9-bd15-58d345797aca@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DB9PR04MB8493:EE_
x-ms-office365-filtering-correlation-id: 4b329604-b56d-41d9-7e98-08dd2dfc37fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/r1FhjH9kILmIMlxNO/cHjnKOn0EcNWD854/2L/WHXGgGDI58CITQR3VeV6c?=
 =?us-ascii?Q?u2+nfNlVLR0ZCBGaEzJxGat+9HrIG8xenP4aG2uQ7+jdL0tiYUqYN62/H+mR?=
 =?us-ascii?Q?7YHFDq5O6xi54WY9LllXWiY9gZjN/BX7M7FvB+ujeRpqrKQ+V2yzbl9/fqBo?=
 =?us-ascii?Q?N6jLaGaFM8NwG9ByeQBAGbgp8PyBNpy7vnPrYhnCVMLOjpFnQnE3+QwWQ+YI?=
 =?us-ascii?Q?YPWqBfrE0dUayCR/XRvpDR5son87yHXaOI2CdrLm6dL2YiafwhWJq/gyxZXx?=
 =?us-ascii?Q?kYRkjV/Iv7E45TYk1kyl0SSm0kDKYetVEw81VVLyHkatIh3Obf/zw89op/aw?=
 =?us-ascii?Q?O/sq1typHcJej/XeG/+/oHJHusMGbF+7GsChyp0bPw9jubTJmALNqf+np63V?=
 =?us-ascii?Q?2vXdgTD+24RtIv27qsomkBgyMiUhd1kNqS8hJ0NHofxdVFWBVL45xHvG8vPQ?=
 =?us-ascii?Q?CkkQOxkOgfkIvrjkIcc/nRy208OFZKwBZu6y/J+vyGg78AdFihROTOhVdiLy?=
 =?us-ascii?Q?9rlygUt2raWWfrujmkHZrT1UYoFizBz29xCH7BgwDGdnpuF+W8EaGiq9TDYf?=
 =?us-ascii?Q?hzTgN2RZpOVwmtfw3CLrEToY28ateXguL/xgDaNs8JvfVB2xUkh2e/blRWx5?=
 =?us-ascii?Q?uHdus17mXqWwL42ZNseG+OgH64WT8oj76qOCvx9Im5QAve516FbWv1xEqrUM?=
 =?us-ascii?Q?oiByJgSWO/JxM8ujSnSnksrONn3cD2RLwiFVlUyYmXyzc5l/a2diYjzViqU0?=
 =?us-ascii?Q?Cjez1JXXiqXm4bbgP8NuFoLxhlhUOHTa/mzX/gcPKsFj02v1xbdoRUKucX03?=
 =?us-ascii?Q?XEJ4EYL3YReEdiigRg8sUhZQmGkT3EIpr1xJ9xV8OHsX8MUbkGDegRHnzW5F?=
 =?us-ascii?Q?6Alyx3hh14FlA0TXc2tDA+pl/mXXWGXy8MkapxaovimWabq+ZlqAMR8MO6Ca?=
 =?us-ascii?Q?bxPq9YW9EkGvH93jEZNh/CW+xaCusgGVJgQh68V+jiEVbbVBE3/mSRdDBZbg?=
 =?us-ascii?Q?8K8HgQ/ieXMFrwgT8mzxKjiXssozkzQR6Pr7x5ad6T4WHAeMXtVPpvigQlSx?=
 =?us-ascii?Q?UXX9QRuAQyKOMEQ6M+fa01d94MxhjGAreBZMSz9vpp8B83bJK26J+azB17vf?=
 =?us-ascii?Q?OzEwiAgjgLsj6LP8wRSVjcVJgqRmtUAPtVVx9Q7FCmK3QtgRVlQ1/8K8AYLi?=
 =?us-ascii?Q?5+pzjGgvCKL3zbMtjTAlINZBAbWYG3NTpyE3RxMkpuBBIIBYlUPdHM0vuXNU?=
 =?us-ascii?Q?HE5bfLHZpLwVHGBfffThrsxJp3jBbO4YimGSt+/gfmegzdGqs2M8qqjhBMu1?=
 =?us-ascii?Q?ZQbYZ9rmv3wcCJm/doA8AAyX/2HFhtK4vfPF0YaA3nxKbQNd+8cKFbTZHfFS?=
 =?us-ascii?Q?6bq84DOgZ8xisoLTOY4tM2WJ6bzDaNtojjUXgF/hwPTwC2mAILAUQOWCgRfe?=
 =?us-ascii?Q?zB97rl9UGyPhJOY5ySXWyeOXpZ11lSe0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fIXKDNXa/m3kg1oX3qtUabfKaR0h/unAwTemdBPQ5GjGPdLq1SxWvYoW14ed?=
 =?us-ascii?Q?NXK6+O2kXgATL1yy7o+19ybNdNoj1So8mpVsT+/9gX0jZVLF3YAQoQR3NPx1?=
 =?us-ascii?Q?GCD1pKhaDcu/GFF0EWPLJJ+WN1PSGrtSqywaQCGcT1xlXVggTuuxelb4sBfW?=
 =?us-ascii?Q?iXFwJ2fRXyN46gnrP0wy1bFF1+DGRF3Ejmbw5bKwkQAnlnBLA8tjgPX3rChG?=
 =?us-ascii?Q?C90hS3BMnAi9u9kdlh9wWw04pOl7Xug5k2OTitGnEIh7gfCd8HBGzFBRlUUe?=
 =?us-ascii?Q?jiDWwLIQfgM1dQRtsoqS5sSni6gpX1ifqidJAAAtdM5jQSIhOTEWph0fQqy8?=
 =?us-ascii?Q?+YRmT35ZkQU0Bj7kklF4NEmAJoI9dV1zY7YDLSGX6ZQV8MDLelZppYPmHnAG?=
 =?us-ascii?Q?FCbCr78aGSVnCClfvMsWaLxT62X4/THUdjAhP1QYJGGEwklvUxlU3tFdXnVH?=
 =?us-ascii?Q?1Hxx052qOl0WsXvS2VdpQa+g4b6Ts4arWWEIzPF5lFga0qN4p5PtLi9kE0TT?=
 =?us-ascii?Q?tL8Yrdd+E5zNuXl3EMJAIWxteY+sMbMPAl7SDqIea3FTVwLEFE3mQicYZlid?=
 =?us-ascii?Q?9+H91RsViXcP0C8bI6OgbNrfDDbY9g/2JWohYDct010x+jJhZ4BMvWZfOuw/?=
 =?us-ascii?Q?egdC5nrMYsMs86p9xbCWJPKxUpM5p4A4k1HfyyvPDdi20G5osIOGuDV/Bz0p?=
 =?us-ascii?Q?V58ZM0/ZefoH4cgwRIBQMGg/4qxXdd6HftmfAcmJqFYJMJIJluUFTgyTt+I/?=
 =?us-ascii?Q?rfAFJ6z4H4Q20L/VvX5D2PmsWO1wHyXXRtHUk4fTlug2UIZbozD6MAUtJPg3?=
 =?us-ascii?Q?PQp4swULzpA0zEnGM0yfpzQVtunhZ+PsfGSI0rchFWV7uJiDlMrz3xxw6fMZ?=
 =?us-ascii?Q?Te4tWt5HNoiZU6bfxlCbRScJoOQLHwV7BZoaP0WG+D3tPRFT4IHzPi2ucODG?=
 =?us-ascii?Q?2sTc3WiJKbVUbFGdNCDgcKnRzbCPAidCKT1l8QjHLUHHVAUf+pHhEyQz2hOr?=
 =?us-ascii?Q?ldKgRePB4ZubrcTnHig1+V3JG6jhBVc8UBMyav1AyYoKbpuueJ+t1vSv0oZo?=
 =?us-ascii?Q?vivZSaPeLITJ8V34doaegjQXjZBuD3A3vxn/O8M0yfI0sdx4PjAiXdQASNAZ?=
 =?us-ascii?Q?fJvjmdNm8LcMR/8TbjPKuRjEhXwlEmZ16NNeXNBY3OlCHTLZaln31cNTO9yH?=
 =?us-ascii?Q?MIxVdZXqKFVDepSiauda98pKBnZ3vtcTAxBoOem8gkSNYkZL1vSTEjlGe/bv?=
 =?us-ascii?Q?zFb2wTkHNECiUpn6QsKvhu3OmY6jXx4ELq9XVwLKPH0YbpBNEHPFlTJV3Bfp?=
 =?us-ascii?Q?XjJb/xc3wt7ZCim9lBV8jWRdVANOls506DAKbuPDj6brQcXmscoRFgcq3Yob?=
 =?us-ascii?Q?5kZghj3piWMnpwzwDElHFo1V7HPakcfiN4pKCM2PBujk0KoWy7E+5qVOc8y5?=
 =?us-ascii?Q?h9UL/68jhkuMq+IHoNkfO0OU9mG5AexeZ66hymkX2eIidhX0MK4Ef+IJ8naY?=
 =?us-ascii?Q?R3Ks6ncnBP5oAggQjhqk4xtO8QWXG2iCL8B/M/vvQ8P8mgsdyWlwFln97WxQ?=
 =?us-ascii?Q?M33/l8+Whsk+zOXfHp8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b329604-b56d-41d9-7e98-08dd2dfc37fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 02:45:45.0640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6DHWNV0XWvxE1BfeIpdKOcmnO3ksveOyMXSajGyn+ZpIV9YQbkYMJQ4bP9AsQCdR/Zkj36n24QMkBlqgHmLlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> > +#define NTMP_FILL_CRD(crd, tblv, qa, ua) \
> > +({ \
> > +	typeof(crd) _crd =3D (crd); \
> > +	(_crd)->update_act =3D cpu_to_le16(ua); \
> > +	(_crd)->tblv_qact =3D NTMP_TBLV_QACT(tblv, qa); \
> > +})
> > +
> > +#define NTMP_FILL_CRD_EID(req, tblv, qa, ua, eid) \
> > +({ \
> > +	typeof(req) _req =3D (req); \
> > +	NTMP_FILL_CRD(&(_req)->crd, tblv, qa, ua); \
> > +	(_req)->entry_id =3D cpu_to_le32(eid); \
> > +})
>=20
>=20
> These are pretty complex for #defines. Can they be made into
> functions? That will get you type checking, finding bugs where
> parameters are swapped.

The problem is that different tables have different types of 'req'
parameters. Of course, since the headers of these request data
are the same, we can force these pointers to be converted to
common type pointers, but I think the forced conversion has made
this pointless.

>=20
> > +int netc_setup_cbdr(struct device *dev, int cbd_num,
> > +		    struct netc_cbdr_regs *regs,
> > +		    struct netc_cbdr *cbdr)
> > +{
> > +	int size;
> > +
> > +	size =3D cbd_num * sizeof(union netc_cbd) + NTMP_BASE_ADDR_ALIGN;
> > +
> > +	cbdr->addr_base =3D dma_alloc_coherent(dev, size, &cbdr->dma_base,
> > +					     GFP_KERNEL);
> > +	if (!cbdr->addr_base)
> > +		return -ENOMEM;
> > +
> > +	cbdr->dma_size =3D size;
> > +	cbdr->bd_num =3D cbd_num;
> > +	cbdr->regs =3D *regs;
> > +
> > +	/* The base address of the Control BD Ring must be 128 bytes aligned =
*/
> > +	cbdr->dma_base_align =3D  ALIGN(cbdr->dma_base,
> NTMP_BASE_ADDR_ALIGN);
> > +	cbdr->addr_base_align =3D PTR_ALIGN(cbdr->addr_base,
> > +					  NTMP_BASE_ADDR_ALIGN);
> > +
> > +	cbdr->next_to_clean =3D 0;
> > +	cbdr->next_to_use =3D 0;
> > +	spin_lock_init(&cbdr->ring_lock);
> > +
> > +	/* Step 1: Configure the base address of the Control BD Ring */
> > +	netc_write(cbdr->regs.bar0, lower_32_bits(cbdr->dma_base_align));
> > +	netc_write(cbdr->regs.bar1, upper_32_bits(cbdr->dma_base_align));
> > +
> > +	/* Step 2: Configure the producer index register */
> > +	netc_write(cbdr->regs.pir, cbdr->next_to_clean);
> > +
> > +	/* Step 3: Configure the consumer index register */
> > +	netc_write(cbdr->regs.cir, cbdr->next_to_use);
> > +
> > +	/* Step4: Configure the number of BDs of the Control BD Ring */
> > +	netc_write(cbdr->regs.lenr, cbdr->bd_num);
> > +
> > +	/* Step 5: Enable the Control BD Ring */
> > +	netc_write(cbdr->regs.mr, NETC_CBDR_MR_EN);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(netc_setup_cbdr);
>=20
> I assume there is a version 3 in development, which will need a
> different library, or at least different symbols. Maybe you should
> think about the naming issues now?

I think that version 3 will not exist for a long time or will never exist.
The reason for developing NTMP 2.0 is that NTMP 1.0 cannot be
extended, so its table format is fixed, but for NTMP 2.0, its table
format supports extension. For the same table, multiple versions
can be expanded.

>=20
> > diff --git a/include/linux/fsl/ntmp.h b/include/linux/fsl/ntmp.h
> > new file mode 100644
> > index 000000000000..7cf322a1c8e3
> > --- /dev/null
> > +++ b/include/linux/fsl/ntmp.h
> > @@ -0,0 +1,178 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> > +/* Copyright 2025 NXP */
> > +#ifndef __NETC_NTMP_H
> > +#define __NETC_NTMP_H
>=20
> Does this header need to be global? What else will use it outside of
> drivers/net/ethernet/freescale/enetc?
>=20
Yes, this library will be used by NETC Switch driver, although there is
no NETC switch driver in the upstream yet, this is already in the plan.


