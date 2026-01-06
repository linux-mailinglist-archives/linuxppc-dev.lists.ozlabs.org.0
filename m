Return-Path: <linuxppc-dev+bounces-15325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DBECF7EB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 11:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlp7K5WpYz2xPB;
	Tue, 06 Jan 2026 21:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.69.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767689580;
	cv=pass; b=IRwxcuOIpU9xJIJNrfwMeyP3emWwwjlzJhwnCoWawlKIw4UmAon9MvFlvWiGspHZv0OQrd0nl694pp8uM/PsA+8aV1E9UTGz6NC9wg0ZteQ+ZWQjsS4Wu9mM5BXDfCS2/wVcUTvNWAvPsStxJ348R/94L1FoOOEIDJtXnfa1oQn/JIJUDBvXqeokKuk82IKFMkvFurwzbwDDcJX6n+sUG6zharJJBbruXpIxdt6q2agKxrwFTayckcnFvMAZ7uX0aRkS8qui3A/0PpJgKHH18kE+aFJeKaZ5Avd0IPAKLSlLa8qZ9emY1iAVlX/x8QIsWK34pvA/qFTxKZcYcW0bng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767689580; c=relaxed/relaxed;
	bh=EMUoynHMhfrIRSseFnuJ/TRQR3P+3EYeA65IFS6OHmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iW/TB59H+aYbmHQlsKUeU4ONMzMirSHYXKQsJvKMiYcW4RfNxcTf0gGPYez/qs6mmI5rfEwIwgCizVugC/y0Q53Uv8rTWnAQ2SFd/ugqJIDThb/REu8trMGHc6Vw82h4YeOCqgKt5M51zZEJ7QiocCUGpuUB4I5GabZ/lUQ5T2lDd+8ADOjB6pvllMoJDWQDOPgayVmu73WZ7w0TDj3RoTD2EEZRL0XG3toQOd0TlNVWNdWxbliVfR1ivy0iAAO4BOxzRW9yDZvkodnRZDSGyMvr8ND3nEIRK1ssJv+VtsEU4anC+/G3CXpe1xC7NmMmvFOVk2COU4NycI1v4IdgQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HHwmlODT; dkim-atps=neutral; spf=pass (client-ip=52.101.69.32; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=peng.fan@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=HHwmlODT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.69.32; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=peng.fan@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dllLL13q9z2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 19:52:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXJVpO56QX52dBCxzHOPelIt0XV+X+jLILN75WMzLgYEag+Oa8RXIMHuiff2h8CGkiUquyHe7Q/Oci/nxm3eHnaHZ+NBccZ/x5bWFmvwCXVtgrsgm0M0Ozb2k8tryUougMdUGEUkO7jbIlom8m1/kw3eRjw1FDCTgTkJep19GT+0yp/P/Ujx5JvE44vvLHdduIeKSTkn+AjyFV+5ERqfVWaESo3FTw5SK3gc4JT/spUN0JPV9WLMnvZ7wEwNCpd9tfiOp2reNYE3niA3BL30NhzqbDq7GiRKcvn5E2ZKJf5lEuzEFFmBz4lDrxtn42L8xylUUZuVsFlnvw0rJ/X3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMUoynHMhfrIRSseFnuJ/TRQR3P+3EYeA65IFS6OHmE=;
 b=D/iHZQcFwYRl5i8Www6FpGHfSJvOiujgwEEMmLu8YHsFJJVBs/u59hOB/NoLWqKhnCo2LVdwXvnUe6mXQGbiaL9Iz4QW/jwJq8aRdPeohuXYprA5SaD+DpYhJP1gMtLeeuU1fHEyX+XNKhT3rhiHtf/RQxihBjIEihQH2hJ9gs6VbyV+Ej0MB95/Wb0ZC/7tigJUir/PdXLzE9j438RgxUH8qPjSHtrEcedutEHElaIpctyl1pFu6DE3xOM+lVamvFvu7QSyQpOEplrKXqR5xfEny0gDpmBubpsIZnYSQSLo/ngvOnn31nFm8ARCxVhUM+LmYtGB/kSoTbMkh8eSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMUoynHMhfrIRSseFnuJ/TRQR3P+3EYeA65IFS6OHmE=;
 b=HHwmlODTYzWudhaZ+rLaaLt7SLemvyAgf5TIPAdrdx1p1DYD0MKA2QkmloC+gc0a7bN+IAQNKulcZvYocA/GRqqxTxEcF9dA1qEEpZ4NI9JsH0ti0MRy0WyJbSTUBK0hX4mz1BU5ZMK7Op+LpLeDmsuYgvGHfth0uF2iFmnksxMgRqLA5/gVTbfs9T8vHuk8FUlBM2SJFhqp01gBZv/wMiGD3zMfovYAsAlQU+nfMEUCzfxEwd9nPSvCHqqLnixsKXTj91RDWEl+l1qiE7VjqKEk3i0j2UiCfTagIyXNqopzO7c74hDRQk++71pPlCbR6TqbY0M5oA1zBmybLjxrWw==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DU4PR04MB10531.eurprd04.prod.outlook.com (2603:10a6:10:55a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:52:14 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:52:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>, Saravana Kannan
	<saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Russell King
	<linux@armlinux.org.uk>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nipun Gupta
	<nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, Abel Vesa
	<abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: RE: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Thread-Topic: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Thread-Index: AQHcfkf/DLNJwajw7U2E4En1+H4e+bVE1skw
Date: Tue, 6 Jan 2026 08:52:14 +0000
Message-ID:
 <DB9PR04MB8461C2AB751FA0FA5D230D348887A@DB9PR04MB8461.eurprd04.prod.outlook.com>
References:
 <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
In-Reply-To:
 <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|DU4PR04MB10531:EE_
x-ms-office365-filtering-correlation-id: a64f1bf2-6a9f-41f3-4e1d-08de4d00e368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T0NoeU01aFRFeTcyTFRBelorckl3WStLRVBqZm5NNzdQWmFGeStQWVM5T0Y4?=
 =?utf-8?B?TU5GVVdEQXZObjUxSnJ0UVBCT1VaWUxrM0YzajRlRjU4SU9XWDJlNWNpRnJs?=
 =?utf-8?B?N0lySzdpUE4wWWhYSUd4c0oxQzFMa0FocmZpd3YvVzd3bVlyNzV4M0NJczND?=
 =?utf-8?B?em05WFdNVm1uMXBKcmxUVVBKQUtJMittQW9ibEFjZ3BZeHkvaWJqVi9WRFA4?=
 =?utf-8?B?aE1xZ1ZQdnV0c25sRExpRnB0VnpEVjdmbU82UEdlSWVpeGMwTWFveGY3Nmkx?=
 =?utf-8?B?VjFvaTBQUUJtL3FKNnlQbzBBbFZWeUFaQ24vOFFWUzJwWi9hc1lTQ0FoQzZY?=
 =?utf-8?B?dE1aOVRmSVI2QXN0bEoraVg4ZHNBQWwwRkZscmNtUXZVU3BwOXpwUXM5OE1H?=
 =?utf-8?B?amFnam94ODh0aEtQYVF1bG5aN1pnQ1hIaTBoYmRtWTNPemhNVVUvY3RFMTNl?=
 =?utf-8?B?QTRZVG53alN5SGxQV1dHQ0RYdVlMN056REN3UXpoT1RKeFZnbXJmZnZmNkhQ?=
 =?utf-8?B?WXBWZU1pSjRncWNtWWNXR2xyMHFGOWlBWWhiSHJsWHUzUXFBL3dBWm84M0F1?=
 =?utf-8?B?K2h6WFA4N2Y5OG9PUjdlekhvK3JtNGJwUWZjQ1dPV2lrRjRYeEFhZmhKOHlF?=
 =?utf-8?B?UTZaWEFYZ1NTZVdDMmxEbnFZcGxFM0Q1OEhGQlo4cE1vV3doNnpYUUVBeXd3?=
 =?utf-8?B?U3h2bTd2OThCUlJoL0hHZU5GbVlXU3Erb0dxUzhVKzFBSi9KdzQrZ2NLeFYy?=
 =?utf-8?B?UTFMejMxSFMrYXpheTA5M25QNGVqOW51TmcxL3lBdHd6VHpOc0hjbURTUTRK?=
 =?utf-8?B?TExRQ2xmL2tqQ1ZNT2JHZzlaUEs0MWdIbnJRbFlnbzFtVG1EMzJKZG9aRUd6?=
 =?utf-8?B?bHJBZ24xdnZBOFh4T0VVdGlhREdTb29kTXlid2ErMktKWUQrNDZFY0duZVh0?=
 =?utf-8?B?UTh0aEZ2U3drSlQ1WXdCNnpncmIvQjROck1HK0xXS3dMaGpKcGJHNm14UXJl?=
 =?utf-8?B?Q2tkYUgxcE4xR2VFcFRxeU45bVU0bDZaZ0VtLy9jdVV5aUJITzhLODJhOTJF?=
 =?utf-8?B?N1JIanFINEJ3UjdyODBRY24rM2lpalUvYmdQRDVNVXhhZHdKZmt0bW9TNjdk?=
 =?utf-8?B?a0VPOUgzQm5xRVpkeEg2WnpHMVFQVUtkbnB3eGc2L1NrZHplNFB6L2FGK3ZR?=
 =?utf-8?B?a2JXVExIVksxa2ErZ0I4ZExSMUI4d0gxV25uTmI2WDJsQjdlMFpUeGp1Tncx?=
 =?utf-8?B?SDkwUDlFKzMzOTNDMGlsRncyQlJCRVNEQkxpak12bklBQ1FiQTZpeTRLV3hH?=
 =?utf-8?B?K2hqN2JRYW45NDNKN3ZSWXlaOE1yWFcxK0lFbFpVcm5GRzZUemhSL3NNNkxy?=
 =?utf-8?B?SnpGNWVYZ2VKWWJtT2tCSENUdDZXSFFNSy91eWxoL0lyZzBnSFZEdHF1emh0?=
 =?utf-8?B?ekdBV3gxZEUxbkdMbXB1NlF5Z2FqVGJFcEc2SGFXTkdMSVQ1SFk2c094NEFY?=
 =?utf-8?B?TWdFQWpEaVg1SHR0RS9YZ1BYdTNlQkF2aWE5d2xDMnUzYjJTWjg0NVhkYi9x?=
 =?utf-8?B?OGFUYlh3M0EzWEFQQ2NFN3dvVEFzM2ZlSHpVdUEzUXB3REtOQkdtN2N2c085?=
 =?utf-8?B?ZXBsNmlQalplQ092THNZQzlMeWZmRFZwZ2FpM1U0VGhRUXpHR2FESUI3WjIz?=
 =?utf-8?B?c0hxUUtXUkhwOUR1RjFiWWNUK1cvWUlaMW1GZVN5eDQvVUtvdzJwM1JnaXJ2?=
 =?utf-8?B?aWQ0V0UzSzNVeHVzdnBzeDVIRnNBUTBvcXNaZjdTaVZmbDdWdGZuODRtVTQx?=
 =?utf-8?B?SWd2MGpmdWdUTlUzc2R1Qlp6dnVJdXE3TmE5Qjh6ZUo5anRuVUlNMmZKM3kw?=
 =?utf-8?B?TUdpMHFIQmlYd3NVWmZhQVUyeURMb2pYMnJqdFYzYTR0cnpKTFN5b2JRQ1FJ?=
 =?utf-8?B?d1RRSHRiWVRSaVk2WmRWZTJuNkNlL2N1dWRmUDRZTDVMSkdkNURhd1JZUEFV?=
 =?utf-8?B?dkRxTjhqbWhFeXgyOTV5QkQ3VnBMNVpCS3FyTkErcHJ3a1BOT0NackR1K2pW?=
 =?utf-8?B?aDFBd21OOGFXZ0RLNU43cGhtRlBMYnp2L1Rvdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWZKeWdtNU1mL3FvZTgzZ01xY1ZwcFVONFREYnJBeUtrb1p0YlJNYXpXRWp3?=
 =?utf-8?B?Z0ZSNmlVNnhGMmJQSWMydWhLYXR0UTFvWFBDM3dzZ1Vrcmo1UGZvWXpPQjhP?=
 =?utf-8?B?WjFObWcxbXJkRU5wdjRKMEl6RDZ4azYxRWJ5KzlSRzlhT0xZK0xjYUZacjNI?=
 =?utf-8?B?OC9iMWg5bEZDMmJXTVo4d215MmZta055OUk1K1MyNEhjVDVuUGw5YjFoV0Iz?=
 =?utf-8?B?c0tVYmpSUGlYYjByTUlWR2JDNEh2bk56T2tMMEY0ZHBpVm83ckRVbExLblhW?=
 =?utf-8?B?TFJiR3IzN3lvcXVXb2J1bUZsQXVnaHhFdjdhNldSbitRcEpXOWthUUlIa1Fy?=
 =?utf-8?B?dStUNVdYZHQ4UXNab05GWkRTYlVxUFJyM0hTdzFQR1hVUjBxaTVmK2R0bE1B?=
 =?utf-8?B?eTNOU3ZRbmYwc0x5ZXdoakh0VWo2V0dlRmQ3YTJsM0xONWdSdGdReFZmamcz?=
 =?utf-8?B?Y1pmN0g1TXQ5QWIvdThiSnNVeklVZHNoWURjS0RVY0hFUlNJK0N6VW1xQ0ds?=
 =?utf-8?B?Y3phcU5pZE9VT1VIOFBPdWcxZFlLNjROYkhQWmJ3cmI3a1FJdDZnM0tIcnZO?=
 =?utf-8?B?ckpnVmliUVU1bGRlVG1CRmpvd0xweldUSmV0K2MxT0tSaitMSnl2aVNUZ3FY?=
 =?utf-8?B?K2Y5cllrVE0yRStzaXJZUzJleEJQUzRCd1k4OEtLcHMvT0tHRWtVSE5wZnd4?=
 =?utf-8?B?alEzNjhZVGN3SXhtU1YycEpFak5sMElveUkxYmdaZ1VhZ09jVEkwMnZYS244?=
 =?utf-8?B?SisvNGw0ODVZcmprRlgyKzFEL2lwbENNWFQwVmtYSzBNZUg0OGxRZ2REU2ZB?=
 =?utf-8?B?b1pVM0IralZpaSs3ZFUvc1FVd3BHMXhOQk1OSVJVb2RZalRNRys5VXdRd3Y4?=
 =?utf-8?B?ZmkxYXk4c1R4SDNhUnJPbm1zcTJxWGpmWkhkeE5EaG41OGlkbm5pc0dxbzZT?=
 =?utf-8?B?VGFQWVM3SUNGMDR6aTIyWCtKRC9wcSs4WVRsQzY1bnM0QjdtWEtZRDZZbDE2?=
 =?utf-8?B?OVh5SUwzT0NDZHV5VDZBTEcza25IWGQ4QWgzbDY4MENIQ2hMRXUwdUpNaUpi?=
 =?utf-8?B?RWpBMExuWXYrQnFmdWZLOHA0Q3ZPZ2FDV1ovVldZcGJkSlcyM3B1NEovQy82?=
 =?utf-8?B?OURnaG83TGtNYnlVVmZJdWhERGFHOW5CTXlZL1h0T0llMG9SVlJzalNYZzll?=
 =?utf-8?B?UGRaMGNpTFFwWm1xYWJZSzF2UTU3by9PL1Y5cmVKa2V3YlAwVURIOFp1VjV4?=
 =?utf-8?B?UGxtbDg1UTFwQTFWNkdKbXRGWjR3Rnp6ZkFvYkpMdXNabFNKdU5Ld3R4alJs?=
 =?utf-8?B?V1hvSlBLL0xtazNKaStGcE1NSnM1VjVJc0pHVklMMG9RVkNSRHZnVlhMekt4?=
 =?utf-8?B?QnRJdExPM2NMQVRGR1BWNlVkYTV6UHRUaFJva2UwT29HM3ByY2RtaysxK3JX?=
 =?utf-8?B?b01lMndVS3M4WmwrUUY4V3ZkT0dNcHBWUHkwc1Q0NU5jV3A0V0x1T0cvTmd4?=
 =?utf-8?B?L2dzSmtTWnhLNk1RdzFuSHhnZGZMeU4vNlVJVitWcGFqRklacXd3UDV0LzJJ?=
 =?utf-8?B?YUw4WVJ2alV5dlBqSGl4VHV1SldqWS93dkVtU2QxSlhwZlJsMVlQUmV3QXlt?=
 =?utf-8?B?K2NLUVJ3L0gvSVNVOGVJYkJ6ZU1BT3Y3NHlCSGxac2V0bXc0WndLYjF3OXdv?=
 =?utf-8?B?aDZCVDYvM1FBZWtqK3NSSU5UaDI4MnBYSll0SE5odFQrUHZvZm5YVTUyeVVQ?=
 =?utf-8?B?Z3ZDWkRPSG9DZ1FmSmUrNWUyd2VQSXVUOEh3V0t4NWpRQW5ibm9SbjF3WjN5?=
 =?utf-8?B?T3ZXVjFIcVlzWEdOZkFIR3lmTUtOcU44NVBJYllFTDI0Mk0zdm02OXNSNGgv?=
 =?utf-8?B?QnRpT0dCazcrdEZrYVNCaGMwam1OVE0ySDBrWFNTZUZlbWlhUDI4bmRiK2h6?=
 =?utf-8?B?MVpqeE1xTFdlamd6MGtoZExFNlZmTXlnSFBWSkVqcVlJaXhWVzVmTDlGR2FV?=
 =?utf-8?B?dDJqTDhiMEhLaXk4ZXRwWmZaWTlNZ3NMTjB2VWZDcm5iYng2ejNMbmc1WXVt?=
 =?utf-8?B?YU1YTzdoemk3K0hEWEtaYUIzalpMNjVpZ0UxU2VweEpsa2h0QjlSQVRGN1dY?=
 =?utf-8?B?K0FrWk1nQjBjQlBOYXM5S1pZTG51MG9VdVFHZTlFWkpQRUk5SVovc2d5emNm?=
 =?utf-8?B?amxuY09iQ3ZVdm05TEFOVHNSdy81U2hqcEhFZ2lWL3U0dW5uMkpHWmVEZHkx?=
 =?utf-8?B?WW1MSVk3Wk1pZktzdG9sUzRRazkwUnBxZkNUK1c1dlVSSFlYVzkxRGM2dm9P?=
 =?utf-8?Q?Y27ANP7vdaaix3MNsn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64f1bf2-6a9f-41f3-4e1d-08de4d00e368
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 08:52:14.3375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/bW3oZ/xnJzTr3RKKQCtc9vafMSfju3f58kDSs3htV93QOhUOKlOzxCuE5BPIsL/gVJkGEbK54YFKX5UAk1Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10531
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBbUEFUQ0ggMDcvMTFdIGNsazogaW14OiBpbXgyNzogU2ltcGxpZnkgd2l0aCBz
Y29wZWQgZm9yIGVhY2gNCj4gT0YgY2hpbGQgbG9vcA0KPiANCj4gVXNlIHNjb3BlZCBmb3ItZWFj
aCBsb29wIHdoZW4gaXRlcmF0aW5nIG92ZXIgZGV2aWNlIG5vZGVzIHRvIG1ha2UNCj4gY29kZSBh
IGJpdCBzaW1wbGVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraQ0K
PiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiANCg0KUmV2aWV3ZWQt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0K

