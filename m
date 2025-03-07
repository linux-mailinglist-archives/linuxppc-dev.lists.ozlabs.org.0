Return-Path: <linuxppc-dev+bounces-6790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDDBA55D12
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 02:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z87pJ4P09z2ypV;
	Fri,  7 Mar 2025 12:23:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741310600;
	cv=pass; b=ink/w9os6RpmXlB9gnYTe2O489HYNlEVcd0cVyA+KDi9/SMrjqOc8Wq5H6jIK9RYy4oHuCEbSd/nWKqgpZH+ZrO1oo1dbLQdAJ19ggsySu59bEDOD6JCHrztJSq2BkXIUlw3Y3I2O/fFRYVVWbf1UQdCdEv+u0niDqBjJ3Tt+cWPzvSTezbnrFRVp4u9G8zEpNmVsRXN5MJHLqBI8DNKRvWaNyion8C8zc+WeoiPYcmMYdY3uXrhK5PYVLfwbxZmEEKHE6DpIt5MiwNFmv2g5gsys+bIe56ZNcBQhFG0+MXKfU6TygPmTv830UArdCxbHIOndD6Tf+kUL+IcjYgGaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741310600; c=relaxed/relaxed;
	bh=pJjBeHxzjFwWxgEBzpZIbQjekxtvStJTrJ6RL1kSpdI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=niW8BCpW5FJ5fcahjaGeqxbnNBOj2FflKKyW0UI/R8h3UG2wujohonBPP0vQmiaDD+/y/yHgUkllGUjrWCP4djp3MbnTF+OACKOrXmBakml5pBSalnjtYquo7uRcy12HYRMNjpdZT48takhxEkVgpu0NJPBLkNVt/vAx3leE/FtRsz0bTJcsbeIfO/OJa9DgzZobWJc3kgfp1MYWU+oFhh6FfoCoM9rbNycGzB/qLbPLJj0q1C1XywHZY5xZZDKx8rs7O2YWm55QXTvgvQLvVZSwDaBARxNSrOX9zLqCm3E7WhLYg05bdJuC8/hgIa93odOdRRJRd8+rdVOvkeN4Iw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KiIy6gKa; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=KiIy6gKa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z87pG4H0Qz2ynj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 12:23:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRRTVSHXC0783YgNF47E1biYxi1Dby/oBUgSRMMeImow/A9BwH9GY/G3fRz7Ri8/rpyBPx4Mht/jFMDVFvn8TP5GcB01qaEWvvFfjeNUXr0wz+D/9FxqoQ/yknAzdCDfyWjo4EoT0zvO7NntvggmBMRkNuMuZPMHYcq9FXjlfagSZySIfG/Mm+WDj1YHQdCAsYtpT5bPCZtFNY18Zp+E+Om5LKbxK4zTZjTxqMG18srbYSwVa2Iv87REg6MgpSTd1HTAgEOlNJC3m3lRiN6sYIAzyxONzTcfEq3AecS2uI/RItkKWcCtwgqreUvguMZbdkVcdFd+zWgYv79Iuml8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJjBeHxzjFwWxgEBzpZIbQjekxtvStJTrJ6RL1kSpdI=;
 b=HRkS0s7ejif0R33RBAMbIe2WZUk3TJhCFqZWDSKlu2OXlbH6USFDa5MuYq+2rmVwuPezIVtsQTsW4f3ddMMvNlWeKRKPJqNdtX5m59kIZ3TTSbw4UO5N5nfTSlwqpSg7HEozjkQwhJLPg7ZyH5kEXfqJE4+lQ7rAmsl1HozYm2cFi4hVOBPAlJx6vW15icycu6IWr8q7wo4LNRsQJYwsyVmbAh8hwQueJhWsv0vmBwvNedvOaUDqwgU+a2rLxMSt4B3Ui7weMDgSS4p3P3SdVmXiTPHespl3pMKsZc3LejAYlmK8YgAWC2IEITn325UgussRzuYMWTccCK3+qgBQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJjBeHxzjFwWxgEBzpZIbQjekxtvStJTrJ6RL1kSpdI=;
 b=KiIy6gKa410F9cSJFZ0/CB4ib3Wndp+CdiFHxjhSZbLPUcQwdlU11rqjbaRbqmjkfkCeENeWScUIlKIbPHUJn/Kf7AaPRCj5U1ZENZ48/AUQPYosKDI3yhKykyS6SITbIzdrp7aOavGw4vLA9+ukjwPDaA1YXLoEAi0uHQjeMHgmwR/NjGjKZCtbnqFvc/4BxcZAiRSnxorNZhvhBDmuVtR6UzzXHqTrZEifqyFSwhUrZglMF0iEucE9eUzwUuvLXMllLVfMgPpRdKYslBC8kLYWBSDc6Wt8cyYfcgOJOQCTGAxnakS3fxsfNhgc1yPbZ1BtEaAQj73UHFJkw0py2A==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 01:22:54 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 01:22:54 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>
CC: "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Topic: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
Thread-Index: AQHbjNiUnJr64KQ/6U+S+BkcuzmRlLNmLr2AgAC2AjA=
Date: Fri, 7 Mar 2025 01:22:54 +0000
Message-ID:
 <PAXPR04MB8510638FA6F61973C620BEAE88D52@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
 <20250304072201.1332603-5-wei.fang@nxp.com>
 <03492277-b7e8-4cd1-b92e-699ee0d7dc85@redhat.com>
In-Reply-To: <03492277-b7e8-4cd1-b92e-699ee0d7dc85@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PR3PR04MB7420:EE_
x-ms-office365-filtering-correlation-id: 90eacbb5-a4b3-465f-88df-08dd5d169625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SFI4dVZhSHdmY2daNEdsTDNsQ0FJSzN4M0RlVERsWU5KOEM4ZytoTzhlb1FZ?=
 =?utf-8?B?ZkVnTmMrS0RHTWdZYmRITEowS3RsR1pmSFFmY3B1WlVRS1ZSaEV0SGhVamk5?=
 =?utf-8?B?ZVpETXhIVmJVRnpYNG9yMW1hdm5WL0R4N2QveGlPQWU4SktvWnBOWkVMWFhq?=
 =?utf-8?B?NXpwTndZQ3Y3S3J2UVVhOTJXTWo0ZGVuMXJ4ekRCckxEcVU5RjUxeFdiSUZZ?=
 =?utf-8?B?ejFjZzBSN1VOeEFUN040RlNoemx2MlpYV1V4TTIrZjRNc3pHRHMvbFdCOVNB?=
 =?utf-8?B?NDNnekk2NmIzUWw4OXkyUUhTenJGVVBRcEdsVW9GRlpJSTZLVmY4OXY4YTZm?=
 =?utf-8?B?blp5cENpUWRLNDNvWUhzdjM5ajR4ZEJRcTBNeC92cFZPWm44SHVKM256UlU3?=
 =?utf-8?B?SDY3Y2tUdmlha3V4bERoSjdodlpOWFpHYy9qQ1pWWEk1ck05WWFHUW10cDJY?=
 =?utf-8?B?b3ppT0JWaW1iejB3c0M4ODkwMEFXdnFGMTJIckNYQ1BwdCtXL0lJdjY0MXY1?=
 =?utf-8?B?WlNrUkZiVFJBSnM5K3pDOWNrR0R1WlIwU1BHbEYxcjVXMkhyVTJhaDg2dEVQ?=
 =?utf-8?B?YzczLzNJR0ltdWltTGljSlJGNk9lbjQrWEZ2aE5mYzAxM1M0M1MzOU5nYVZ2?=
 =?utf-8?B?OWJqTzBwQUZyRmQ4dHhNbXNYdlR0WW0rcG8zR3hyRm1WMktMSHJibnV5WWMy?=
 =?utf-8?B?VklhQmM4UXBqV1V5NjJlTXN4eXNDRFdXTzdCemVGR3JLRXdsc1pXTEE0QVBk?=
 =?utf-8?B?VCsvaWlURkJvdDVoMCt1cFk1QU9PM0drbDBsU0g4VUVEWFBvYVB4MVVaeXlS?=
 =?utf-8?B?dG1rRHhyWThBQXBlOGJNTEtJMjQ0R0s1MCsyNUVIdTI3a002UStTN0tieEcz?=
 =?utf-8?B?VDdzQ2ZaZDdjMUFNclh4R2F3ZHozTDhkQVN4dThXQkJuODQ5VjZwcFRrTjlV?=
 =?utf-8?B?cXRXK29RYlVoUVd0MmFvckVKeU9tWSsxdjJkTG0xNWtVQWdvVVJ3Z0dZVXVx?=
 =?utf-8?B?SUZJZVVTMDBwWGZRUG8rR0k1L0ZuNHdCU2had2FVT0RLMVFtSDZrQ2RNNlhz?=
 =?utf-8?B?VE00bXdVOVJmSzR2cWVjc0JTeFp6ZWJjeFJ3a0R4c2Y1UTFMeXdTWDZuQkdO?=
 =?utf-8?B?eU9ncmdPSjNuN09RdjFVNGcvWTdKcGRoa0d2T0FtWVVRS25CRExwbzIra0Vw?=
 =?utf-8?B?SHpJNHFnaHNRSnFwcnBDTnJpbmE3a0xLUnN0bGlzM0dnZG5EWXZEVHNWblps?=
 =?utf-8?B?eng5dERmOStHeUNqZUVieE4reWJaVWxoMVd1dHNyNGRjbjM5K1VyY0N0MG1n?=
 =?utf-8?B?WFE3MG9VZUYyZHZ2NW16TXJXQVIrR3d3cXg5Zlo1eVA5WEtOSW1RM1dJREY3?=
 =?utf-8?B?eGg5RHlvRWtMWlI3S0QrVUxPK05RcG1DRWxJM3k4dXdQYmtkaVl5NkFpd0xj?=
 =?utf-8?B?elQ0YkQyb0Jpb2h3ZkFuaytic2VheFE2eXMrTFNUdE5QZDh1UnE0N2srUFZD?=
 =?utf-8?B?dkZCMWZWbk9LcTZsYmR5YjkxTWQ4a2dsM1ZzOEl6dk1HVlVTcmxnUERhWkNQ?=
 =?utf-8?B?THA1aUNGSk5wNytPWmp2YkpualhGNW1DQlZwR2poVVdaQkhOMHVpdW9mcmpT?=
 =?utf-8?B?enB4MXJtM3JuTGFmdS9KSDd4eG9TcmpjRGVRZG42VzRoSUc0SHNWMFArN2gr?=
 =?utf-8?B?b1kwMUgyMVl3eHFBL1ZhY2NEY1d1U2U0cUd3Z3NaQmVNeHFFYXNnRG5WR0N4?=
 =?utf-8?B?ajhVQlhuTjk4TVB1azA4MWNPblVtT1owcHV0bzVYcHJtY0VGSHlTQk52NUFD?=
 =?utf-8?B?MzVpL3lTb3FuOFAzZm9SRTgvZVVsU0ZxR1l0VXdCdTdrU1Z2aG84bnpyaVlH?=
 =?utf-8?B?dW1NYjhLOUE2MEFFUHVHc0M2UkxtK3dxQnJqdHRXT2RMNWlkYnNhYkc4dzMx?=
 =?utf-8?Q?7LK1rlzoAdOR1mnvtOYWYjsqiX3P3OkQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0k3b29lOFd1U1hDd0txNnVkdEhVWGttQno4bFZOS1RSVk9FYWN4aENzT2da?=
 =?utf-8?B?TGhwck5SclhNSmNQNG00Unh1MldOTitGOFVFaUN5N3RaNElkZlFLQ2U4RzVn?=
 =?utf-8?B?SHdpNGV1MW04UjV2NHdlR29OOS9OYkFIcHczUHRtNk94OUMrNU5BeVVGdFlo?=
 =?utf-8?B?ODZhaS9QY3F5cTl2OVFMMlUzYUxEQlNTWGFHaWNsaWkzOTNnTkVrTVJveTIv?=
 =?utf-8?B?QVIyRVQzZU5YMWw4dWVKRnZWSnhyK1FoKzRqazU5dG5nUytVSWFtMVBCM0VL?=
 =?utf-8?B?emVaVERmdnZLOHEzYXdhazVqRndSaDIxSGwvaEhPeGRKdW5jUFhxUVJTVjQv?=
 =?utf-8?B?WlRhbHhlSWVFd0swSFpndkRsdUZNRjU1cXBCUDZrL2xpdXlobDBtQi9tcEhV?=
 =?utf-8?B?VVVoZk5teGlpVXhKY0QrUGlMRWs0WnQxSU9tZktBYmlWb3FzRFhnYVBSUFJU?=
 =?utf-8?B?US9mWVlSZVJYUTdrRTFPRHlQZG5XRU1tVjI5cVM3T01kU09VMXFybHhSU01X?=
 =?utf-8?B?SlJlc1lzTU84R1ZhamtrNGpGVW13Zkc3SVdSZGNVeFRMVHhsbXhBZU8rbzNw?=
 =?utf-8?B?eCtTTkExZmRvaFgyUnJlLzhPMWRNY2hxQVgvbDlYQTJ6UHFVTURDaStNVmhy?=
 =?utf-8?B?eUtDaVdFT3NzMXlpaXY2Y2ozQU1SMnNUZkhSQzBwY3RRYk84TllManQ2cU96?=
 =?utf-8?B?YW83Q1dTczhPRWg2cmkzTVhhMFRqeXN4ejUyVVRJUG4wZmNXdDF5VUNySlVG?=
 =?utf-8?B?TkhWSXQydzlHckYyNXAzQnBWMTc1Sk56WXc2a3UvRm5DcUo4eS9RY1BxUi8v?=
 =?utf-8?B?VWJaU3lFeWpVRVk3M1dFS3lYcWFHZ3pEYzZ6ZnMzWE1EV0VicGxBVWFvMk5o?=
 =?utf-8?B?ZzdUdXd2Qm44UklGZ3Z0OHducWhhQVFKRUdHSXVCK3FzT3VHc3dTYzhLc3I5?=
 =?utf-8?B?QzhodVZpZ2JVTzR4NG83bU4vc2x5Z2JNSjA0Yk1iUEJPNXJPVE1IMWs5Qzln?=
 =?utf-8?B?bERNNXA0Y0k2Z3FoeGkvM3hwb3VuYnBtMVRoQnpQanMwRUpESDJLZ2hVYkEz?=
 =?utf-8?B?cUVtVEI5OUpEUkxFZ1RqaDBtc25yUmU3WGFKY1JNYTJYbFNEeEE4NHNLdHdt?=
 =?utf-8?B?Skx0ZlYrS2NRMHAyem50d3phNnZpM1o1WWUxcnRHOHp0OFBOWkxZUGVoT3Aw?=
 =?utf-8?B?VnFheDczRWZCM1dHQmY4bmZhNUE0RGlvdWxudlJrSm9FR3BXZlpnK0RHbGZW?=
 =?utf-8?B?NE9KZUc0cnd2STJDYmJRakRpb25uc2lkU1dJcStETDZtUy9XUVArYkU2b0NP?=
 =?utf-8?B?N2dmVXBaQWpXQ25ZaWZBdlAxVU9EaEhYVGZJRVJPa1VFeXEreTRpbUZnZ3NS?=
 =?utf-8?B?VjVYT0g5TW1PUVNLU0hpNUMrU3F3QXZjYXlaQjZRbTdKUkU0aVlBVUUzYVF5?=
 =?utf-8?B?WHI3Qmh4L0tpR2tyU29saFBmRlpwb1U4SGxvM0JhSVhiZ0dIWnFJdHVUT3Ir?=
 =?utf-8?B?dDU0MDdSZUUrT1pUMkMxb2xPV2dZYUVueVhnTFIyS2hjcFJFRHFHTEY5L1dF?=
 =?utf-8?B?WU5SWTExTDdEeStIL3QwMWJqR3RrS1ROM3dZSy93NVhEcks5Q2UwVm00Umsv?=
 =?utf-8?B?ZWJBMmFpRnBhRTFNTE1YVG9PV013blE5eG9FTTlnVGJxWTQwRy94Uk50aUx4?=
 =?utf-8?B?R3diaTdlWGsyR2MrSGE4RitVdktsSU50RGxQMFNaOVNRcW9sK0Z4ZDU0eSts?=
 =?utf-8?B?dzk2SHN1YU5Yc05VVktNQjdRblJ4QjRuL3RZRHNHaWozNW52eVc5WjNkRDJ4?=
 =?utf-8?B?TnFpbWhYMFNVbWZFcXp1eG9CWjdKY3ZNdGdUTm00NkVpbkRwWEtxbGlCa25I?=
 =?utf-8?B?YlM1Rzd5MGszdE93Y3B3bkdZeTRmN3UvK09FT3ZVL0VpaUg2Y2JERnVWejk3?=
 =?utf-8?B?TFlCTEtPUGdHUmxqcXhEVTNsSys0aWF3S1lZeExVYkNyNjZZcVBTZmNRTHhW?=
 =?utf-8?B?Rkl5UlNLR2VCRS9XMzkyM1RUVTY4TzdMTEhEdXhQVDNZSG52RjdjUVE3RGFp?=
 =?utf-8?B?QTQ2YXRqRlZGd3NzZHRJVEUwM1BwV3VDSXFscG5MV2NnYXB2bVh5L0pkWHF0?=
 =?utf-8?Q?pfKQ=3D?=
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
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90eacbb5-a4b3-465f-88df-08dd5d169625
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 01:22:54.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iu+AjWhYBur+9JvBjX6ZTEn1JJt9cP/0WsMwBZBRP3ji+4PFRs3mb7L6UEhOlJIBoBtKrML+J4YULnX0mJMSWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

PiBPbiAzLzQvMjUgODoyMSBBTSwgV2VpIEZhbmcgd3JvdGU6DQo+ID4gK3N0YXRpYyB2b2lkIGVu
ZXRjX21hY19saXN0X2RlbF9tYXRjaGVkX2VudHJpZXMoc3RydWN0IGVuZXRjX3BmICpwZiwgdTE2
DQo+IHNpX2JpdCwNCj4gPiArCQkJCQkgICAgICAgc3RydWN0IGVuZXRjX21hY19hZGRyICptYWMs
DQo+ID4gKwkJCQkJICAgICAgIGludCBtYWNfY250KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZW5l
dGNfbWFjX2xpc3RfZW50cnkgKmVudHJ5Ow0KPiA+ICsJaW50IGk7DQo+ID4gKw0KPiA+ICsJZm9y
IChpID0gMDsgaSA8IG1hY19jbnQ7IGkrKykgew0KPiA+ICsJCWVudHJ5ID0gZW5ldGNfbWFjX2xp
c3RfbG9va3VwX2VudHJ5KHBmLCBtYWNbaV0uYWRkcik7DQo+ID4gKwkJaWYgKGVudHJ5KSB7DQo+
ID4gKwkJCWVudHJ5LT5zaV9iaXRtYXAgJj0gfnNpX2JpdDsNCj4gPiArCQkJaWYgKCFlbnRyeS0+
c2lfYml0bWFwKSB7DQo+IA0KPiANCj4gTWlub3Igbml0OiBoZXJlIGFuZCBlbHNld2hlcmUgeW91
IGNvdWxkIHJlZHVjZSB0aGUgbGV2ZWwgb2YgaW5kZW50YXRpb24NCj4gcmVzdHJ1Y3RvcmluZyB0
aGUgY29kZSBhczoNCg0KT2theSwgSSB3aWxsIGltcHJvdmUgaXQsIHRoYW5rcy4NCj4gDQo+IAkJ
aWYgKCFlbnRyeSkNCj4gCQkJY29udGludWU7DQo+IA0KPiAJCWVudHJ5LT5zaV9iaXRtYXAgJj0g
fnNpX2JpdDsNCj4gCQlpZiAoZW50cnktPnNpX2JpdG1hcCkNCj4gCQkJY29udGludWU7DQo+IC9Q
DQoNCg==

