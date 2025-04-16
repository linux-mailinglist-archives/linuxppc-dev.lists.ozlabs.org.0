Return-Path: <linuxppc-dev+bounces-7679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E509A8AF94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 07:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zcq5C725Tz3bmN;
	Wed, 16 Apr 2025 15:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744780607;
	cv=pass; b=U2m2c8Er+u/ZukDOwQ9hfEloooqFgvZA+nQcEqtSYhZ3abd9ddyQ4aqv8W6YLN6cC3NJSXTydzMSS59nAMsYprM33AEHd7NMJheWnKy3d8uWuiL+O62KqNjkBXLsS/9lcDRi733Va5rMzw0ixVCyc2UynDWplVtsA0BPvXa5QNUR02l7vP8oNr+6fZkZ/FN7XQW7U8MlwKlUSeKlrgLkemsw4qPLXxEyOVl9i4KNYPpeVjtRqAdSfRiuMIivDMmm+vump08vpFxrbCdiW8sO0KpVpDtNfNnqJLBpwMICUMwMFX5Lo2eTlCKWdwkU6tPt2nKP76Lm+zX/luNSeqTSwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744780607; c=relaxed/relaxed;
	bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jUsC37YpYnkgvw0fKIBPG9hoOnY12fbxNUJhqELdbba2RhXEJ3U6sTzkkGCyNk2sxn8hgd9c6ZB5eRR/3QUFeuLwrCMja98jHAAcBRiVnLNB97F2y4iDKymtu/57pVZubz9C80lGg0wPiB3Ud1kaIuqssebdGOFNDPGeKdk3Qk4DMTVfp2OxW/0rGvfAjG+WMzOHQmCbuoMsPVehfsxiaYit4JFniqLM6+bZWKSZ2yx5bYuOFvOWFkNavlX8I2sK2yPwp8CRRka38WurehMfJHuMY/jwba+CiKyx6fIKFxURkUiSxKdfL8wgwNOTVunfSVQgj6CEgkL/cA1Km0VYJg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RlMTnpAu; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RlMTnpAu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zcq592KQ7z2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 15:16:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5Ox3i251IOgTda8m4JJpPBIWeP+TkiHs66RdMuKsY5wHzDIb9N5hiHg1ssRMLfwb0spn0itGXk0xPVN2CmDOf3Had9spRsHmVmzEfD0ghNh5SkZH3coauw6IZpSYZ1F5z6mn29kS2sye6RnqBhifdn0QCwXN0lw8xK0/SlKiEi3fjGxCz97HJPISM7lZJiCbciCZvSHuNu2YKhT6IHsw+KcfQjI6lO21RstmSwCLeltfFgWGTueqA/6Y3J0s0k/hLWU6IZ3XhIMDuW1z6U5TALY0ZivQwuDHreOjwHhYivYaSKgLREytWvut6e8K7HPU47n+9ttqCqOaCDb5Je3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=;
 b=QXWKBLs5CqpgJVNBeNCNq2XTHE8jqLHH/bdCF61ooKyOAdkRRXwap2JLSI+chHfvK334RTEB11FvasjX7q7mNcpVpRcm8bqntEcVH527t8oC1W4+3ouFQGFo+P7+2I+v3kArU4Il5bGplBdm5SaCGxsHFFCwIq7dqUdDxCHfNDqWR6iZEiB7ECvM+GsydNyuY5w/82xDYcxar1x/jsPK2B1oRAm/+/bXodIQkYgi+9Cath6sGcz1c8AbU5emlsADqfIm6X059UVod7XrGNa2QPdAyEfnK1h0iWBVAADQwXC+2KgYy6Mq5wjqm4Yu/cI0kStJR42eXGnFMi0PFA5PoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSK/mul7K81VZyWxDXbRLiNfHBnI2TvagRlvuYgM3bw=;
 b=RlMTnpAuvmYHyFr+Pri81Hrs0pFRYFTtaY1Pea/OP6/1SZ8sKf/On5vu6dWG85eZjzz07cIfzOltZGl9gjv6q+tBzjNqvsftyrUN9Nh9TH4zW62AJdO/0JivhyuVP7xyFqJjB3CcVlDBZZ1M1T2jvt/sWnj3i3oxUqkKIbFhqwKCQCA82bo6hEPLQ8WX1cpuqJb+qSA6waGUBQoZUE4FwFBFqMKY4d2E7h41hVPDG2Wj/CGFBeIggOY7/V9Zllka9guEsOYdhC0nviuM5wsjmg7PPikURNBsJ+vXH8TEqgXji9RsPkTLyrtTiuVpeA117DuDPF02nUIPhN5rImoFLA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 05:16:15 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 05:16:15 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Thread-Topic: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Thread-Index: AQHbqsrnhddQYwLh8EmRihJXUf5Sm7OlrZwAgAAZnDA=
Date: Wed, 16 Apr 2025 05:16:15 +0000
Message-ID:
 <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
	<20250411095752.3072696-5-wei.fang@nxp.com>
 <20250415204238.4e0634f8@kernel.org>
In-Reply-To: <20250415204238.4e0634f8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DU2PR04MB9116:EE_
x-ms-office365-filtering-correlation-id: e79cdbb0-7df9-489d-a8bc-08dd7ca5cfc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?TXQ1VGRsOGplbDRabXdpamRrSVB3THR5blVub2FQZnFnTlkwdWpFczJ4dzRR?=
 =?gb2312?B?K3U4TE55cEpCUDR1T1AyZWRnN1Y0c0VzNEdVbDRMQzI2UzVLbytUaGdZVWlO?=
 =?gb2312?B?N1U5dDRucmRDYjM1SUZQQTFmRndhQS8zKzhaa3pNaTlQS1BRNXBaY29ncmlZ?=
 =?gb2312?B?aW1HNFkvQktYSENJQVF2a25QS0o1S002YmJiQ2dsd2QwV1FEbjgrM0tTaDVS?=
 =?gb2312?B?K0hlTDU0RjFGV0JQTU1RZC9mbW5PS0Y2OW9FK2EvaGdxZVAzbnFMN2J3M2lC?=
 =?gb2312?B?Y1NSSmRtcGNlaWNTZVNtamRqeFJFa0tsLzVzNXBWZ0I0ck9wTFppR3luaFJa?=
 =?gb2312?B?dGR6R3NlVGpGUU54V0JxekRxM3pBeE1aZXRtME93RmNxTmVjeVZHQTJ5TDZ4?=
 =?gb2312?B?eUgvQTBDQ0lkTTJBM3R2Snc1VEpnTkN4WTZubU81SFRsbXZ1WFA0WWI3eEhw?=
 =?gb2312?B?T3RxMFpGUGNOQU11b3VpZklpazJkQVVmM2o0UGh4WDArbzdYc3FzcTF4bWxm?=
 =?gb2312?B?SVN1S2tuekkyVDB3bjBISFUxREovc2JOSVh0Tk9YUjVBZTRWd1IxNTVqUFN4?=
 =?gb2312?B?K1NGdUdHdC9JVkc1VE9rZS9hSFBRaDA1NHlaZWdpdDlCK1phQ2piRU1YYmx6?=
 =?gb2312?B?YmVtRkJsVlFMNVhyaThEczZKUnp4NDhFb1JYSzlMT1AveXlGZCtjU25wN0hP?=
 =?gb2312?B?TjJMTTRRamVjQTZOMFpEaE5CNFpLdHJTZXdaUG5qODYwUmJxM3g0SFdLM1hZ?=
 =?gb2312?B?MitVMWFEZk1TRkJTZXpKZGRXeVNLVlREY2dqNERIRk04WDN0YmFrZXdTbTVi?=
 =?gb2312?B?VTYyQldkVDlWSVA0WlJNWVlCcHdNdXVpaHVVUkJGaDJkNmRiYlR2ZTNEQzVD?=
 =?gb2312?B?SXBjSTZPYng1Z2tId3ZCcWpqYmo3YXVjekI5K2JIeTdlaDF3MXB5clAycllG?=
 =?gb2312?B?WjYwZFRUVG1jUDVHRUpFb2VtQkJRTE1rcXZia25Cak53VFdZaGkyUGhhZGpH?=
 =?gb2312?B?SlliZ0wrcmk4RkFNanhxZmQ1dVMydE9TamJRZlQvQXhZeW44anpGazI0ems4?=
 =?gb2312?B?TmhMOWFIUkJFSWkzSkhqQWJLbWVyQ3lKbml5anFlOXUvcG1BZXFrczBvSGsy?=
 =?gb2312?B?b092cEpzc2hJZ21JcVBQbUxuVDlwSE5HejhPMmp0QVl4aERGZWdnQzhveFlG?=
 =?gb2312?B?QS9IRU4zSDEvMS9hd21rbWlTVy9pR3JTY2d2TDRjZFZGRXJTNkhYUm5xUyt3?=
 =?gb2312?B?d3l2ZmdHSllrM0RCUE9LV0ZyQmFZQ0ZLTUU1RHVGWk9YRVJhQXdHU0t5TlZT?=
 =?gb2312?B?S3huSlBNeklscVE1dXJrVHJUZGFOajMrU2FiT2d1Tnhib2NBMVZnbjFDT1F6?=
 =?gb2312?B?T0lXanFhQWk3cUJrc0xRV25mTFUxUk1xcU9VakpRam11UEhiaWFnOXFNK3RH?=
 =?gb2312?B?amxDYVBKM1IrMkc5bWZnb3JSMTd4QW43UFVKZHVuTkVobDAxWkhUeDFRSGg5?=
 =?gb2312?B?eVIzbkdOR21YM2RXN1NZTittYmVYbUZpVGNrYUVFTzZ0T04wVkViS3FRbmFZ?=
 =?gb2312?B?Sm5kRVVKdjZyTmRwWlo2WHVCTlBBQTA1Qkl1QU1UcTZTSEIxdHpwenFKOFRC?=
 =?gb2312?B?bm83MHVMU2dUa2EwYUI2ZWw3RENSdEhtb0VzM3d3ZnJ4b2graVdGSzUvWXJY?=
 =?gb2312?B?a3RmcTFLUVBDY1A0aHg2TFhwcU8wZDZHeG1GNnlZV0FhU2JpZndwb3ZwVjBw?=
 =?gb2312?B?ZjhxenR6TGNrTi90bmZobEp5T1p4c3hIOGJzMGZMZThZZEYxRFNSc3gyZ3NV?=
 =?gb2312?B?K2tTem1JbzAvNTJHdG8wZk9DVXhCejFScFpmL2IzWkh6eGJrZElGeXZ4YVVw?=
 =?gb2312?B?S0ZXVFd4NDRpdnA1ZFZETnF4VHoxaVZJK0VRNUtZNklYdEVaQ2ViblptN3NE?=
 =?gb2312?B?cVgyZVJhUUJNNEx0RkRWdDF4UTF2TnBhVm0vei9EUnU5NUZmNGNuaEw4aHB3?=
 =?gb2312?B?QnE1OGJYMU13PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ZnJ4czVJYzR3QWNyWThaVFVIY0V2aG00NHF4NFUxZllobGdleE9TK1VTYjBJ?=
 =?gb2312?B?cngzeFJ5TGRqR1BObi9NWUdmNlhkVUwzWHY5YnRXMXZocVhkR09ialFZdVJy?=
 =?gb2312?B?ZU5BY0pPc3oyRElpcXFtN2NHMmhVMmZnTTl2Y0NJUk43aC82MGo1b0JmcGdZ?=
 =?gb2312?B?MU51cG1hUDVZZ0dGem5vVmdXZy9iL2hlbWNFT3RjR3l5NjdnOVpOZm5NY1Nm?=
 =?gb2312?B?UjljaDZDNGtSRXlsS1h4Z0IwTjNVRkNUdkxIazlUZzMrYTBqOGdpSC95UDJ1?=
 =?gb2312?B?Vmc0dWt3S3pLMnBoL2dTbnZZcjJCN1Q4MnZLTm9DcVNlNThNSHpIWXVkVkVr?=
 =?gb2312?B?MDJGalc0Sjd1NmhkTGNabjVvRmF1Z2pCcGFBamNEUmZlZGhmK3Eva3E1YW15?=
 =?gb2312?B?UDVDZ0NRUThjZVR0Y3dkZ2ZrMGNqaCtkUXNvckVmVXlOUktSVmt1OGV2aGUr?=
 =?gb2312?B?RFF6OCtsU1J0Y00vOEt2L3lDR0ZCUG1TUUt2WVNLTzIxdGRFMFh1Rmc2SFhZ?=
 =?gb2312?B?Qm4vSUNnRjhKeS9OdC9iSm5QN1gyelQ1NWliMmZwSERNS1dBWG84VGlDeTN5?=
 =?gb2312?B?U0x5VXhtV0E4ekZISk1qR2dvVHpJK1dWdXV5bVpMZ01pSHpnS2hlL0NWOGxz?=
 =?gb2312?B?ejFQalQ3eGFlalUrM2x6S0QrNjdQU3dpU1ZWSS9JeTByc2x5UUs4REJqYi9R?=
 =?gb2312?B?WEcxOER5N09rR09wbDZYMmJOQUQxOGUzL0ZYUFBoV1dpYjl5NTV4b0xwLytL?=
 =?gb2312?B?SjlyckRiUzZmNkZSUjZhWk53S0JTSnhGcjZ6dzhoeXVHMlFQYjIvWUdzK2la?=
 =?gb2312?B?V0M3R1BZV2pqZFVtTEUvVGlraUFXbXE2MlAydmZjckloTnlIMkk5S0Y5ZkpC?=
 =?gb2312?B?OXNVNi8yVXlLVWp4OCtwZC8rMnJiTTVVRk1icGo2SHY5M085S2tzRVBjMGQw?=
 =?gb2312?B?cU85ZUs2ZUZyM1NuU2FaZnl6N3lEL1prSGYwZmZydDJPVzBHek0yTUJxbXJq?=
 =?gb2312?B?K3lmY0ViUDFCRVBkQk9sYnpaczJSejA5eTczc1hLdUtHWlM0T2xMYytXRnJi?=
 =?gb2312?B?MnBSNkNDSXJ4VmFUL1R4b1pnUU85NURKdlc4cDVGMVIxbWdoRzE3ZCs2cWE1?=
 =?gb2312?B?SjBnelZQcjZ0VWNhM2lnbThLZTFFTDJFTTNnZmZTNVBQNmVyTERBRUNYU3Jz?=
 =?gb2312?B?M2RtNm1SQnJuUk9XK2pjTzkwUE5PTXdzMlNhZFpIZG1wV0dDTTZjZTlRVXF3?=
 =?gb2312?B?aXRCamRrdWphMytZZ215Q2l6N3JZRnhPRGNxL1FZUjROS3dxVnlwRGtZcGpa?=
 =?gb2312?B?clhLaWkzZ0FwSkkwSGY2am85MEZYU3d0a3YwOXpIQW9ubUVhLzd5STk3TFFR?=
 =?gb2312?B?SjlZbHBVdk01UUNHMnZKRUw1RDgyRGRsd1BkR1BCQzVGeXBzd21GQVFUME9W?=
 =?gb2312?B?eFlFY3l6cGJob0Z6aWlPTW5BZU1aU3ZrYWdrNnl5bzJ0dEU4d2lENWJEei9w?=
 =?gb2312?B?UVlOUmRBMk5jeC9mRVg5ZW5hUG9acEhicG1nTWlkNU84cndGZmdzWnZvUFFx?=
 =?gb2312?B?ZnZiR1o4Q1lhVHVqaWViaFQ3Wk1ib3E0WndtUWcrWDJiQ3lYbVgvbTM0R2R5?=
 =?gb2312?B?dXJxbWRMTnFnVFNFRi92cFlnM29yWFpFT3JVSG0zZjFqUU96eG9jRys1T0VG?=
 =?gb2312?B?Vk96dkM4bVJRSkxtK1ZVY29Jd2RUc1cvSUJwQ25nSnJxWW5HdUxrMkRHNFBK?=
 =?gb2312?B?TjZ6cTU0cXkwUE5BaWR5VGFUK2FPZ2c3WDRrVmN1c0tVd2lsenRlQU5WQWNo?=
 =?gb2312?B?bk05bURDdnJ6TUdvR09pQnRIdjBqdEtyZUNldjVyQ1A4WVBqRmJrb2lwMWg1?=
 =?gb2312?B?YTVqRHBhVXFKdkJiMkV1d3pud2dBeUVVeUhpNmh5aDJBQjBzOWczVE1EcExP?=
 =?gb2312?B?ekNIL1g4U3FMd29KY3dKM2Nrdm9EN0lPWlhUdVM2NUxPR29lMjRFYkxtRmRq?=
 =?gb2312?B?NGdXRWpwVXB3TGFHeVZMaElpK3pMamcxeUZzaDhjUngva1hPeEYxbmRhUFV3?=
 =?gb2312?B?SDlTeGlTYS96UUpTTXBUZWN5Q1JRRlBKd0xJZ3JwZzRHSnZVQUpGYmptSW4v?=
 =?gb2312?Q?OVR8=3D?=
Content-Type: text/plain; charset="gb2312"
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
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79cdbb0-7df9-489d-a8bc-08dd7ca5cfc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 05:16:15.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+28x+E8nSpYtambauNXrJBpJtQYo0VDFqkQSAoNRpiGr9f1QkFiUnXtGMcVObN6dR31jmOX7BodO3BvmWo/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWt1YiBLaWNpbnNraSA8a3Vi
YUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI1xOo01MIxNsjVIDExOjQzDQo+IFRvOiBXZWkgRmFu
ZyA8d2VpLmZhbmdAbnhwLmNvbT4NCj4gQ2M6IENsYXVkaXUgTWFub2lsIDxjbGF1ZGl1Lm1hbm9p
bEBueHAuY29tPjsgVmxhZGltaXIgT2x0ZWFuDQo+IDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT47
IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT47DQo+IGFuZHJldytuZXRkZXZAbHVu
bi5jaDsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsNCj4gcGFiZW5p
QHJlZGhhdC5jb207IGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldTsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4
LmRldjsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IG5ldC1uZXh0IDA0
LzE0XSBuZXQ6IGVuZXRjOiBhZGQgTUFDIGZpbHRlcmluZyBmb3IgaS5NWDk1DQo+IEVORVRDIFBG
DQo+IA0KPiBPbiBGcmksIDExIEFwciAyMDI1IDE3OjU3OjQyICswODAwIFdlaSBGYW5nIHdyb3Rl
Og0KPiA+ICAJZW5ldGM0X3BmX25ldGRldl9kZXN0cm95KHNpKTsNCj4gPiAgCWVuZXRjNF9wZl9m
cmVlKHBmKTsNCj4gPiArCWRlc3Ryb3lfd29ya3F1ZXVlKHNpLT53b3JrcXVldWUpOw0KPiANCj4g
SSB0aGluayB0aGF0IHlvdSBuZWVkIHRvIGZsdXNoIG9yIGNhbmNlbCB0aGUgd29yayBhZnRlciB1
bnJlZ2lzdGVyaW5nDQo+IHRoZSBuZXRkZXYgYnV0IGJlZm9yZSBmcmVlaW5nIGl0PyBUaGUgd29y
ayBtYXkgYWNjZXNzIG5ldGRldiBhZnRlciBpdHMNCj4gZnJlZWQuDQoNClllcywgeW91IGFyZSBy
aWdodCwgSSB3aWxsIGltcHJvdmUgaXQuIHRoYW5rcy4NCg==

