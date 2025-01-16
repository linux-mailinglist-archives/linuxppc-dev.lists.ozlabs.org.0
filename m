Return-Path: <linuxppc-dev+bounces-5330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F6A131DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 05:04:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYTl622ZNz30RK;
	Thu, 16 Jan 2025 15:04:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::611" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737000258;
	cv=pass; b=KAK+jT/5r8kcrQBiMbx2cZGlOXGRTsNYDhMglQPUVnIn/+J32sto7ax1JbQ/OICSYmCI4BGZnRjsfpwUUTR+6QV+mrvenu8rrGaBaOQEX+geCOxn34XORAg432eq6miLP2XyppGoZD6RTk2HPfnupe+6EXQt2bBz51p0ZDDAU5tb2MggMMWEYXwvHUd9yXenFn3WWh788+hJD3nS4HOU1OCaYFrqFUcNa2/YOOc/XL/CgQqUT9BkgMwm8rYdraVd6gmEcCNjhhPnmr8DtsZVxH3kj+sdBjRKLfTLbBYXXZjUYjvEYR7SlyJKw4FCrdiAcW6etkTNNeuiJuvbtroyaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737000258; c=relaxed/relaxed;
	bh=e09UzvCjy2+a05z7kUeMjg/ll7zCLRUPCS61eOmfmZ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GokfMQt5NWde9pxkbdBu655yHchl2+FE99tYjpTeG9mXZCnWBs06HDqxaHEF5YvBZdwhtC2p5sea3q6TrMdYmCjXJGlt9Z4X0f/LcWh859if4rAWV+BqYOKgKPDDkxOEOhY8y6x8eTRnIos62ZApjV4mPKrkYTbmjrr6tPL4Z21UvCx+xpKEmBkuo52ImlY6G+SZx06sCFZGpHbv+0P5nDCn5rIKkyXisQtBWWImw2tkMvX4VV9GZhwV2ebATUgwLTSPj2z8LvUyeY4zIDVo7bKU2CGhdD2mcaPLfLgUzmn83HSRqZpZZn2upSFcQ+Tk+hg4FxhgkZEo1wG4yMbbww==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KYhPswJU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KYhPswJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::611; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20611.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYTl44pL1z2yy9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 15:04:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVO94YicnQIhhAkmg3BDvw6KBpRA/J8eccQ+r2L2m5xHQm2Z0Ecq+nsYSaAR3+6CYu03NIUYVGB9cVr25wNXeyTNpm24cOa4j7yW4p44sza2TkM1Ek5wODG7ZqXlU5NN1RG99+JUautsNOL4tBm/YhFdws474LcF6HWc5lZ80dAqoiq98uuHT7GyjP2YxH7I9uaN1tRqDeoL2rDxvXc/goT3gtULcNIocBiDqlpDSJ658yfPCntxsOtXHfv/VbpqgB9kh7wv5XrXlbafD8EnBLIhDQWH+Sj/6CSKt21CDkBNVO08HNSumvS1+1O7tkYDts57Sdna2diSNzczI1wO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e09UzvCjy2+a05z7kUeMjg/ll7zCLRUPCS61eOmfmZ4=;
 b=gg1iDAV2kgIAmYuYVyhaEc8QyhCkc+OnmBIFet1FjwMisGpdGm8iU5RMjfYV4KcKzPXj2Y+8G7lkPxRFAh+SSxGyz1bo08RpcsIhjoc49bCbKcLPMgN0AuD6ox/CLUQ6//wYwEGgCydA00Wf5PtuYtvf3oQaM/P4PKU+g+AufSQyEGaDyt95k1g6xTa9EKYFTIgvzp5KMingkqU7lKoMOT51/bNgNeKJyM3o+FnTRtnJq7175CVuGdWOAIbaAfhXWp3hWbFUvAEs44V4TTgIkCZqKOgYkdD5HMtNuyI1W+OgP3DPtx+a24p5nIhIujixGE4y4gVwapclYVBuVGeWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e09UzvCjy2+a05z7kUeMjg/ll7zCLRUPCS61eOmfmZ4=;
 b=KYhPswJUHuRFCQQU7BllNRMm9BzFRejCc+td9LbkqjN7xmHFAwoqvxr/UGu2u+7jczBC1v+ZqzSQIAwvViXIIF90eNbVVKTOLWW/uKtAc41303uPWQAhWfVAxqj1JNI2i9LRNjoGnyv2vK30TiV0/DTVbz1FgjWx5OxAuAqAvHxnwMYEocEGKqTtwN9st7aX/8VtIFeYVWSIy7fTNi096/osH0pB5TGXOMATlcDnnOaM37tpqX8x1uXe3HsNMXJwfaJB7UzdmQq+vjm4+ZeHVdOiK9BmhyOuVnmchMiar11IjPdK6zS0/EhesKjCLQDTGhYa7ItWbv01V6uimpuPXw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 04:03:54 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 04:03:54 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v2 net-next 07/13] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Topic: [PATCH v2 net-next 07/13] net: enetc: add RSS support for i.MX95
 ENETC PF
Thread-Index: AQHbZZbFHVAXua2Zbk+OQT+Myj+77LMYZqkAgAA+4eCAAA91gIAAFkEA
Date: Thu, 16 Jan 2025 04:03:54 +0000
Message-ID:
 <PAXPR04MB85106EFD7CCC559489C00401881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250113082245.2332775-1-wei.fang@nxp.com>
	<20250113082245.2332775-8-wei.fang@nxp.com>
	<20250115140042.63b99c4f@kernel.org>
	<PAXPR04MB8510B52B7D27640C557680B4881A2@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250115184105.139aed9c@kernel.org>
In-Reply-To: <20250115184105.139aed9c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DBAPR04MB7413:EE_
x-ms-office365-filtering-correlation-id: 43ca630f-d395-444d-1ab5-08dd35e2cb60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?VXBURmFoQXFPZTVrT09xN2tkc1V0ZDB5NkFtRzdJVEkzd3dxbHNyYUJhaE5U?=
 =?gb2312?B?eHJ1cklhSERrSS9Hb3JGaG9MaURsaXRnb3pBOUIxYysvTHNNRXZaOWdYOFEx?=
 =?gb2312?B?dW00NmdLVERyNkl6LzlBc25tSWJYSjFZVTdOZS8zSHBFU0R4T3RDZlF4VjQ5?=
 =?gb2312?B?U2E1OUx6d0FKcVZVUkQzTUs2K0xSdHU3WWpFVXQwbnJqNlNnOXBuYjRyNXVa?=
 =?gb2312?B?YTdySVBUOEg2M1cwK1BXeGZIKzVLc3EyYnFBUU1FQ003SE0yTU43SXhZbkpU?=
 =?gb2312?B?dGJDVDYvQUdIU1lneHlGZWhPRkpNSklwRzdMMnM2endsY0pzbjBMNVhOUVlJ?=
 =?gb2312?B?WW43cXZHZWpCVjk0dUt3Y3NIV20zYlFBd2laaVdRV0UyYUVDR09MaXVQdnRk?=
 =?gb2312?B?ZFJRSzF4bllIYjNrSjZlVFM5SkFCS3ljTnFERitzdnh2Qk5HL1llellNNWV1?=
 =?gb2312?B?bFBWaEtWVGFjRnovUzlhSUhzZ2R3QmxYTGhEU2pIakdwMjRtSkdSQUJoTDV0?=
 =?gb2312?B?dzZwMVMyeVVnTmVWTjMwL0dxWXBmb3diaWQxeXU3eG93c29yNTRWMDJEbzFV?=
 =?gb2312?B?L2I2MTJaRU52cDRKVjRHWVE1QzRodzZhK0pya0V0WS9sK3lJdXVCblN2Nll5?=
 =?gb2312?B?Z1ZWcVlBY0xtOVY3eDF0NE5QMGJlSXliQyt0S0tyck1KNUxHbVV4M1dIOUFj?=
 =?gb2312?B?aER0MTl0MnlMd1VCN20wUkFUamszUC9JYkJud3hiYkxoVmRXeEsveldpNzkz?=
 =?gb2312?B?N00zVDZPZytpNU13S1ppRlYwbTBLa2h2Z3VOaEVvb0JpR0Ivc3VxbFNxK3RQ?=
 =?gb2312?B?WnkyL0VLWnB6MFExQmNGME1lN1NDRWRSSjJ1WEN2ODVZVzFvRFZvMVlUbmJ4?=
 =?gb2312?B?STh4N2tTTnRyUTQyWXRFQjd3dUxWdnJlbFYzY2ZCcnZlS3hiRHN1clpybFVo?=
 =?gb2312?B?Y2lScGNBelpPR1NieDFvaXRZTmU0ejNoM3dpSDcrTlE2bzN5dE5CMGhEeTRS?=
 =?gb2312?B?SWFieDRQTmN3TDZNd2NMd3dhN3ZxLzZCcG9RcTF1c01LWFY2ZW8rRWVZcWhE?=
 =?gb2312?B?cUdQWGNRbFliWlRzMkM0ODJpRTNiZVMwRUFuOEJoK1dtNmpwUkxVeUF3SStv?=
 =?gb2312?B?K2doejFzd25jVmpmb0plSWRNWFNuRkpPQnBrTVdDSmFGSnZRSlpYMld0bVBS?=
 =?gb2312?B?c1NNbjcyRzcvbkIyTmhOWW1OWU94cm1IL2RzNm45eVc0cjBpWjgwTEFHeHdF?=
 =?gb2312?B?UTNBRFBTZEVQQlVBREVaNlNvcjVCdGl3U3pNN0w0dmJCMlk5WUczRXZBYzFE?=
 =?gb2312?B?cU9HK01ZK21QbGhMWUs5a0Fkc3FFdVVpUWtPWE5hY1RLam1QeGoweU1YZmVW?=
 =?gb2312?B?c2xUL3B3WWhOWU5Kd21JWVpDckg0bEpVWlNFUmxUOFdtVVQ4KzZSbG4vL2k3?=
 =?gb2312?B?YmpYeVZrQXdyNlZDWS81RmVQRk9nOU1ZZi96WHZRZkIrR3ZJcGZUZjFiclk3?=
 =?gb2312?B?YlpCRzJEMEdwNGhXcmVqS202cE51d084OGR6aXp3WEpwdzNPbUpxRWhlb1BF?=
 =?gb2312?B?TW1IUy8xdkJFNFE0bjFVSFp0dGZPTmdKRVA1UkZhck00UExMb1BNcnFNR2pq?=
 =?gb2312?B?bWxVMXVjSFhDa3k0SUVYZkxoVHFWc0FJRjdBNGtYNFU3YWtKS1BQUm5USjFN?=
 =?gb2312?B?d2dmOGRlaWpUYVYxS2VKYllaYTNGeHlQMC9jbDNVM0lqUU8zUE1IV3FPWGho?=
 =?gb2312?B?VjFrdmlkS3FXenQ3SzUrakZNZGdsc1VMeFU2SEFFSFp2dCsrMWQyU01kZ2gx?=
 =?gb2312?B?bmNaOVBaMEdCYzl4WHJzdnBlNWpRT0lEYUhoQ0R3T254ZitXWDRrem9kaXps?=
 =?gb2312?B?b3F0TmxubXRQRHppaDU2a2FIR2dBc251SzM3ekxhNzdCYVFzYVkzV2NaRXFO?=
 =?gb2312?Q?UX3+W3dphBGafyPgb9dvgWx9xWM9aYtJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Wmw2emRuZ2xqSUtKaDdxR05rQTY2TUlHUHdUdC8vWkJRZGpVK2ZmTG1YMjhK?=
 =?gb2312?B?TGxaL2tzNStSU2ZwSnRuRG03YlJVUjM2dGZ3VEg3NjgvTld3Wkg5Sy9aRFhN?=
 =?gb2312?B?WjlwQkFiVFdub0o4NEYyOUxpRi9kNjlIM3YyWTJHWHl4YncxNHVqZzRMZ3RF?=
 =?gb2312?B?ZUZ4YUJoVVVZWndZam1DWEIrdTBtZzhBOFpJelNFbjJUaS9qS1lrL012Z0NX?=
 =?gb2312?B?S0s0S29mL3RLVHBxM0JsWkxjWG1RRFpjRTRPcHJtNHRpalp3WlEwdFJFNVlG?=
 =?gb2312?B?b0d2eFVVRDY4TGQ4MUJpaFh1dWdZT3M2NGsrNDBYRUt6UitScWNveEgwWEwx?=
 =?gb2312?B?dmJhTHNUaHBTbzhRdjE4dHdhNERzOGlsRERwRGRlcDAxRk9WazlPNWVCYUdp?=
 =?gb2312?B?SnNlbWNYbi9vU1hONFNvSU05UGVLcWFiZEVxczhTeG5qR1ZJR1ZoekxnSnpV?=
 =?gb2312?B?SnJucHgrYjZuNW1ub3ZvamJDcmZhNmZFN3RTbERKSE1ZdEQ3ODRBSmVEZlRS?=
 =?gb2312?B?VVRoQmxLMlhGeUNHaWxVN1V2T2YycFhrZlFwQXBNMTB6OHh6eGhTdWg3bGJo?=
 =?gb2312?B?d1VzK09SZTJVNFY2OHlSZ2RaMjYrekRadG9ZeW10eHk1c1dscUZ6ZW84ODdw?=
 =?gb2312?B?TU5VWTNKNjJWc3llNlI3Nyt6QW0vWTRVbVgrMERYTzlHZzFBMVpkWG8rU21Y?=
 =?gb2312?B?TGtCalhuWmY3MDh2MGtTMm9WTnhVWnJidUxHVlBVdVorZVhoSW8ybTZrb3Rz?=
 =?gb2312?B?U0VyeVgxZ0VMN3A1alV1cktBaUR4Q0JmSkJTMEdoMlBLVGVaWkEvcGxGRDMz?=
 =?gb2312?B?TkEyUzlnT0h3dVk5UUpTbU5RckpyNTRxTitXY3FlV0dEQ293YVd0ZEVpbFRL?=
 =?gb2312?B?YllURFlVZTJrZE9SSkpTYitoL2p2R0xMU3NhSTB5d0hwZFhPRTh0TGxidHFi?=
 =?gb2312?B?a1g4N3d2VGRBL0UvV2ZvN2ZWQzBzL2R2V3M5YWlweGoxTmZtcmhqUExpeFF0?=
 =?gb2312?B?cWpLQ0hnZlJxaitTbHhLdTIrSGJCUHFTblFkbkY3bjRKemRjUUFsN3d0MWdQ?=
 =?gb2312?B?MkFnYUFDM0YyNVJzMTB6NWZnUitpRVpaL3dTTEZNZENpaWcwTURBKzdXeUZo?=
 =?gb2312?B?REc2UE50YnQwbWNkdkIzYkQzaGxyZmFNMlhHbTJuNnoxZWtRa2tPWnlFYzBK?=
 =?gb2312?B?Y2FGRHljY0lCRHc4bHVCaHZDQzdJYTBaZEZqYlZ1WGtoZ2JRZ3pIcUppd2Vn?=
 =?gb2312?B?NVRVRkJKNGZFZTEvSUdMWTlXbEwzelA2QXVIbW1ZNEtmVlo2WnlhbEY2SC9z?=
 =?gb2312?B?dlRMTzYzL3dzV01Ic2hVRFFTN3NsOCsrMkppbWdqMWZYK2gweCt4VUY5QUEy?=
 =?gb2312?B?NFZzWThiTmZwemVFZTdCR1NvZWdtMkhrWCtLQ09GblFOdnpOWGQxYW43YVFu?=
 =?gb2312?B?dmRDUU1zeFVDYTdWNHJ3Zmk1ZWV2dW9BZ2VsSXU1cHhsdFUxdXA2czZDTU5y?=
 =?gb2312?B?UjBIMm9zM1lmZ2xmNHpKYWdXVmdTemQxVzVxTDhGOTBGbFlnYzg5RVV1ZnFQ?=
 =?gb2312?B?dlZKQVlpaFBrUmQ1L3BwZkpWeDNlVDBDQTlZT2JWYmJYTFVjOStYM1ovQTRs?=
 =?gb2312?B?amtTVWZ5MW5iQ080L0JwMjlCRXZMWVlMcGFlRUF5Sng2WVNhSFVKdmp3ck9h?=
 =?gb2312?B?bm9OejVSZGRYbUdYTWhGNXUyNXM1RUhpZktZTVEvNHluOFhoRXcyOE9vRHlj?=
 =?gb2312?B?VlRHZ2RTSzJqbE5NS3d4Z0xaM1k3VGQ2OGM2TUI5eXNxSU5tMUlKNVhxc1dW?=
 =?gb2312?B?Qjcvblo2RUhqS01jSFFlWWpidjNzeVBLaDhRVjhYekxZY3RXZWdQcmhIWEdx?=
 =?gb2312?B?OVN3a3RiRkRRZGd0RGhQMlhNNUhlS0ZZVWV5U2VYcG1YMmx4ZEg4SEUzY0FC?=
 =?gb2312?B?ZC9yN1hrNWt4Y3ZSVEJPMmJaQ0NiSGh5NmRLNDllRVZTR3p5NDhGWHI0ZVgw?=
 =?gb2312?B?Mk04SlI5MUp4ckdGcnRKZnh5d0c3YktwQmhPUFZ1MDVVY05xTTg4TUF1TURV?=
 =?gb2312?B?YWt6aURSZ3FvT2xBR2tGekZ2OFM5dWlEM1FRWDA4R2o1NkgrWS9GRnFQS3VF?=
 =?gb2312?Q?zJYI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ca630f-d395-444d-1ab5-08dd35e2cb60
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 04:03:54.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLM/5bPdMrGfmzQuBgA0J/6Ptq6XdpDZ3Tf7ETMIwF7Ijo9T81SufYQaoXmv43MF0weu1lL7AjhiA2rqXqV9sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYWt1YiBLaWNpbnNraSA8a3Vi
YUBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI1xOox1MIxNsjVIDEwOjQxDQo+IFRvOiBXZWkgRmFu
ZyA8d2VpLmZhbmdAbnhwLmNvbT4NCj4gQ2M6IENsYXVkaXUgTWFub2lsIDxjbGF1ZGl1Lm1hbm9p
bEBueHAuY29tPjsgVmxhZGltaXIgT2x0ZWFuDQo+IDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT47
IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT47DQo+IGFuZHJldytuZXRkZXZAbHVu
bi5jaDsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsNCj4gcGFiZW5p
QHJlZGhhdC5jb207IGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldTsgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtZGV2QGxp
c3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
aW14QGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIG5ldC1uZXh0IDA3
LzEzXSBuZXQ6IGVuZXRjOiBhZGQgUlNTIHN1cHBvcnQgZm9yIGkuTVg5NQ0KPiBFTkVUQyBQRg0K
PiANCj4gT24gVGh1LCAxNiBKYW4gMjAyNSAwMjoyNDoxMCArMDAwMCBXZWkgRmFuZyB3cm90ZToN
Cj4gPiA+IFdoeSBjcmVhdGUgZnVsbCBvcHMgZm9yIHNvbWV0aGluZyB0aGlzIHRyaXZpYWw/DQo+
ID4NCj4gPiBXZSBhZGQgZW5ldGNfcGZfaHdfb3BzIHRvIGltcGxlbWVudCBkaWZmZXJlbnQgaGFy
ZHdhcmUgb3BzDQo+ID4gZm9yIGRpZmZlcmVudCBjaGlwcy4gU28gdGhhdCB0aGV5IGNhbiBiZSBj
YWxsZWQgaW4gY29tbW9uIGZ1bmN0aW9ucy4NCj4gPiBBbHRob3VnaCB0aGUgY2hhbmdlIGlzIG1p
bm9yLCBpdCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIG9yaWdpbmFsDQo+ID4gaW50ZW50aW9uIG9m
IGFkZGluZyBlbmV0Y19wZl9od19vcHMuDQo+IA0KPiBJbiBvdGhlciB3b3JkcyB5b3UgcHJlZmVy
IG9wcy4NCj4gDQo+IE5vdyBpbWFnaW5lIHlvdSBoYXZlIHRvIHJlZmFjdG9yIHN1Y2ggcGllY2Ug
b2YgY29kZSBpbiAxMCBkcml2ZXJzDQo+IGFuZCBlYWNoIG9mIHRoZW0gaGFzIDIgbGF5ZXJzIG9m
IGluZGlyZWN0IG9wcyBsaWtlIHlvdSBkby4NCj4gVW5uZWNlc3NhcnkgY29tcGxleGl0eS4NCg0K
T2theSwgSSB3aWxsIHJlbW92ZSB0aGVtIGZyb20gb3BzLg0KDQo=

