Return-Path: <linuxppc-dev+bounces-15975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88FD3A636
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:06:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvnh205BMz2xjb;
	Mon, 19 Jan 2026 22:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768820769;
	cv=pass; b=WSk0jumfmxR4wMUQXiSSnNyYb8GOzWMLlD3iN1xQskeuZFjrJsGLitAWBFsgdxA55wjnC2YdPshd4zk+EB2tSlFRJ5NLwsOAST/eVJ1mTRAbmCVpwMrXbFxEfJS4RrbLfeaunR5aRYwsb86zz7/gn3OhfHG6TuFGPAclmn4Uxdc/pufXJ+1Vek1kAV842/zmOZoP4zp0LS6HvN7ZsG/C4FRc9wUr/WIkkHMDZFAc55uh1K3DrlGQ5XBKO5fnQqosyc6b7+WYkoBwOV+dz0M5yrXjpFZjfM6NJP6a9R3izbFJN/bChwc0+ZyYOwWMIyNLRfI8+vjcnoM17CmkQ9IRKw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768820769; c=relaxed/relaxed;
	bh=WG4txwdtT96LORT3HZ/+32KF/20UgLbQCpvh3Fbl92g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=alzIPHfgy0sK38fzDIoyO5ePOXVXO28IHLVT7/iQLMfD/MYJyjW5gP99rmZFXbWIsxgBrYJjR1cFz6JVPYKMAOJiDQSCl3RZCcgjCcct5nhLd8obSivzk7LTntjJ1274Zt5lBh7IJDqOMuRyWcDl3HXxigFPfSW4vdIPBMMvSJ91w0aHdEnM8WXYyHw0jyymUDCGDqi3Ozv2q06njmkTy4Q5ykI8+W75Q7oofJvVSMc/sWC37ZLxup0IzS4x+6zRCjwefKtDJMBNo3gZevn/4+JdqVuJJLUgVMmNQT/3FLMeqZGwjhDBV7C8b8oEBwFOBYiLyJ8YvC2VOs0TqkFPpQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=nvrOsRKh; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=nvrOsRKh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvnh00p6bz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:06:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUvSD4u9wHZjPybWQHMUuq5vttEInXC4sy+edtuBFwYJVHbvJP9tXrNhWnDMVxguqgpUUeXEc+symBiBU5DP9h1a7VPFy4bdYmuvKFotsELMw9H/GBQweZPl+uPaGTGBlDkiRiWCFlI49O7OpBnq/ezkvEh75z4W7H6Q5jIew5eg4oY7WFTJnvmQ6edquFLpL6ITo1Gch2DriNm1zuT/kx/QlxNKAriJW1isEaLhFeehF8ItRWzNzodIZP7Puh6/kKKCwf4GSA8lRePbwPQvko++FF/QjZCNdvh8WbyLZ/psoFnviiYr7z0jxleoaW2XS5L9jX6fuMRWbBZPczGl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG4txwdtT96LORT3HZ/+32KF/20UgLbQCpvh3Fbl92g=;
 b=ig9qeXDMVHhw+T8H/4XkDANtk5R0s6pfBrkqIcw7cAJrKVJiK2E3pwG3ks//80LYQ8AC4sWnMi/uzpU/KrB0lMzrwr0tv+Lck13jxrq1Fone95+imk2F+Y2KGiVV1gghG8lp2c+1k1o0BQOgC4JpOxqO7o4PknbGP7VaK/7ekb6Ml2dGOqqbyB+0nGjtaAvV4/339tVfdv6luWFNV4Ne/bVL/Vk91piThJO4z7N4/CSk9yCWWZpfNjvUackvn5x7cnxlu05KTKhQBtAZJOCjefBwps3M/9hq1fVz1YR+zqyWpN4LPnYX+oOfVUWQMJpjKhQgDEVytlWM+ueivAWn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG4txwdtT96LORT3HZ/+32KF/20UgLbQCpvh3Fbl92g=;
 b=nvrOsRKhiNm+ik97ymExDO3bU+tOVp+R/kcnvlGw1yHhKGYU3Ce58Qe33IByWfIzM0bO1etHoF3zFHfS5RFpOx1fizPGWftNn8mgmyX1TTBlKXjtE8O9QZ0A5HH4eCOVq5TPKZU4L0hVzkoY0dRcfxOizBpDuBbL2UKYrzkAhBYo7nD5wFeix0LwjEHWcn/g9HmzTGaEcDWFsa1CbUbUamAIp86tOBTg535UgxidXtCqwR+HKP5krjraiTsvGJHlGXhqnNKBdc3uZIznxDiyioOnfPW/MKcQqmW7uSg4M04zwpVfJwxO3jdB4+I/Rwz+ylXVBRe4AyHXKiHa8ksFWw==
Received: from PAXPR07MB7853.eurprd07.prod.outlook.com (2603:10a6:102:15d::14)
 by DU2PR07MB8237.eurprd07.prod.outlook.com (2603:10a6:10:276::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 11:05:44 +0000
Received: from PAXPR07MB7853.eurprd07.prod.outlook.com
 ([fe80::53e9:4397:9efb:6905]) by PAXPR07MB7853.eurprd07.prod.outlook.com
 ([fe80::53e9:4397:9efb:6905%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 11:05:43 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai
	<wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
Thread-Topic: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
Thread-Index: AQHciTASSONv2voPNEKZDYW+iluV8rVZVLoA
Date: Mon, 19 Jan 2026 11:05:43 +0000
Message-ID: <7f10bde0-238b-42fe-93e1-0c05d489f3b1@cs-soprasteria.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7853:EE_|DU2PR07MB8237:EE_
x-ms-office365-filtering-correlation-id: 39ddc08b-b214-42dd-22eb-08de574ab0d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?TmpjK1EyV09ENGJ5Z05YRlFQcmVWMER0KzNnZ0x4WTV5WXczMlN0MlBISkpJ?=
 =?utf-8?B?cXQ3cjJFQ25UcUNHSC8rTXpuMktWNVZXSnBzZ1JyRHgyY3hKVHJqalVWclA0?=
 =?utf-8?B?Vjl3Q0RxYUJjUmdFMjl0cWJXc0xtSThzM3FhYmpuYXhheTliOC9pQUN1amJQ?=
 =?utf-8?B?UXY3cXh0NWpCN2FlRndybVpaRTI4Ukh5eGZQb2ZYcUc0RkQxN2xTNWozTFg0?=
 =?utf-8?B?bFF3djBONmk3Z3M5MFhzS2ZiWnBha09wTnpWRXAvSGY0WXZnN0RjWlA2OWVW?=
 =?utf-8?B?WE5CeHV4NFJjSnlmMmNvTHRkVk9xZk11Yng2a090VXRDN041VjNhT2VWYWZv?=
 =?utf-8?B?NjEvKzgvWmY1WVV0TDRNb1FZVjhNUnRHSmx2eFJybmN5UW1NWGJaaUJ3dC9q?=
 =?utf-8?B?QTRGYjFQQzZ5MWJ4QUhNaUgyd1pKS1d2ZFh4RFkxWGJoNW8wQVB2VTk2RHVZ?=
 =?utf-8?B?RmlTeWNEQ1FUdkpoR05JeXNVOVo5RjY0N0xzRGh3VTR2RzkvOTc3dkxNZDgx?=
 =?utf-8?B?cU54YW9wQ3NLVWEzZnRkMlFWUmo3bDQyY3lSTWl1T01HVHRRbzNackh3b2g4?=
 =?utf-8?B?a0hOYkpxdE00Mi9RdDB5SmtIWTJ0TlZneU5HcnFGTUpYbFZubkJ5bXFIQ1dn?=
 =?utf-8?B?VHNWZS96MHNvWUU3L0tLL3ZuL25CR0dpMys2eW4rNWtGc1lsVERzOVhBcGxv?=
 =?utf-8?B?UDZlTHh5b3FZSzFYVUZrczhLRzJ5OFJ5dkVMdHJxZU1Bc1p6aFpPTlFVSXRv?=
 =?utf-8?B?ekFhK0laSWxIQTArSWNySjV2YWFrQzZobzMzUVJmTmtrYjlQWkxxb0NITFYz?=
 =?utf-8?B?bmZ3YlAyM3FvMTZpWWp4bFgyUUdVc0NEMElVWW1wQkV0d0VaV3F3N2hBKzZ1?=
 =?utf-8?B?ZEErWkR1WU1IdEVPQVFlMU9tUEUyeDZWdGZWQjlSd1hEWTdjUlI2NEJqaU5H?=
 =?utf-8?B?YzlwZnF1UWpoZDk0Y0NTcStmbi9jQnAyaE1kbkRySm14cEpBelM3eUdvdEcw?=
 =?utf-8?B?M3N0SXc2dDhHSFZWMVY3NlhNd2dkeXppT1ozOFg2RXVTeFZZVzZwNE16UUlo?=
 =?utf-8?B?bDVKa2Q3NmVvTWRIVlU4aGQ1dWxsU1BnOHlQTFY0RWs3bmZsM0cwN2Z0Tm54?=
 =?utf-8?B?VDkvS1JHRXNiYTFDOE5NTldZUkVyNUZmZThzdlVRU0poMlFZRmNsWVFOUFR6?=
 =?utf-8?B?SEdpYkZpZm96Q0RCa3lpS3d3Wnd4Sk5kOUdRbnhGT1orbWY3VVU2L29uY3Mx?=
 =?utf-8?B?NmY1Vkdiamc1WmNpcWxoVU1GeHhOUTNueERpSjBKejA0TE5OZFk5bXJMbElG?=
 =?utf-8?B?YmxSbzZqVjZneFlHNjZHbTdkMTNGUm8wdktwK2Y5RHh5eEFCSE9OalZOcWVS?=
 =?utf-8?B?VXowT0orZXNCOFhvTUtkWEVoY0dvYktnSkVnMFFZVTlxUFZQZEFjT3hia0I0?=
 =?utf-8?B?MUZRWTBmNXJ5d1h4SzcrY2VybE1mVlUzOFNrM0R0ZG5qRU5vK0JMVDU5M1FX?=
 =?utf-8?B?cm9QOGRBdXBFcEkzQ1YwUjhSUkt1SVRvRzYxdmlDMXE4Ynd1eVNGamN5Qk5o?=
 =?utf-8?B?SURodDNDbFQ5Ykt2cko0OGRXUWVDSG5PTloxbHdDL2RsZVk0N0FJMW1XSC9q?=
 =?utf-8?B?Nk1NZUpWTnBsS2dOaGloSlRWdG5PV3VQYmJuWUNaTmpBNUJncDFXMHZUU2lZ?=
 =?utf-8?B?K3hBQXRVZmh1NElhTk01MVg4UzRKK1BISkJYNDlTUE9oRjR2YjRpTzJxMlZP?=
 =?utf-8?B?dmx3b2hzMjFST0l5S1V6U3pHNVArWUxzcGx2VnRHNzVBN0w1Mnh6dDJLL3dv?=
 =?utf-8?B?ZnlROGNZYnM5OHZiTVVFWkdGYkt1ampBZERlMVF2cnN5YVBFQ1RnZlBJRmxU?=
 =?utf-8?B?UkI1c2NlWmZMdW13d2x0WS8wWmR4cWwyREJiNXdUQ3dLMnVDejZMVHVnS2tL?=
 =?utf-8?B?dit6OXp4RkZJN0FyTFdtdFZSWmtFaWVTek5PTnB6dW5xZWNRQ0ZOTG1BYkVN?=
 =?utf-8?B?dytqZ0o4VXdHeXBKVS9GN2pzKzZIQnJURmV0MnpiZitZekphMGhjNXdETldY?=
 =?utf-8?B?VnNJOW11SndIQlRDaEFNSVRucW8zaHg3cUoxUFVRV1A3dUhoTGJJeFpoSEdC?=
 =?utf-8?B?NUhpbEdyNzY3YnRjQ3hGVjhaYm9wMUJrVnZFMXpnVFpaTVZ1bjVNTS9memgz?=
 =?utf-8?Q?DxeRQAmAHImjz5onrs6sHmZmjcdLKVqT6Al27gIh9Iq+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7853.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUt6Q1RoUS9ZNG1XcFVhZ0pINDdISUdqVjR5a1dzbUFYREVveWVRZTViOTVB?=
 =?utf-8?B?YVgyeDVGWGNXTDF4dFJFcG1UaTExQ2FPQUk3Vk05QmVUUzVtcXBLUC82ako1?=
 =?utf-8?B?NFhTUkpvM2lQN3UzZkRaYmhTT2tibmR3MFZxekhjekpNYmpvUGJvSWFTeWI5?=
 =?utf-8?B?VkEvT1FEckVsckNZMzJuRjV1aXdyTHJqcDlaWDY4NmJwU3hBS0I2Q044MGxV?=
 =?utf-8?B?Z3NDcTI4Wldmbm9hc0R1YlBadDlRaS9NUEY3NjhrUktkNTlXL3hhemZVWUJR?=
 =?utf-8?B?YmppZFNIdUJ2TUdxTnhnOHVvL2pmNVdkZ0NRaEw5dFVqMHVIMUZabjJRbXFD?=
 =?utf-8?B?NUNXTGlMR0FDYW9aWGpNYTNwbjVRUlRBRk11V3M0WERKYU52Smx2dHVqV1pY?=
 =?utf-8?B?dEY0ZVpmZkwwZThiU25Pa0lXNnd5TmRPeHpxclV2ckJOWkRWU2JSdmUyQkMw?=
 =?utf-8?B?enJUbndIVXA5U0NuMnhCb1dseHk0UE5LcVo1NkU5cTBMWE95WnF3QTFJazd5?=
 =?utf-8?B?UW1HY0xKRllHVkY4S1RDcjM3WEJBdFpiR3RuM1dTR2ozbGNBd3pzbGdhb3ZN?=
 =?utf-8?B?aFBKU3FJMWNiVWh1TjA3dU8rbmYxM2RCWk1oTmltbjNMN1dVR1dsNDVzbVpi?=
 =?utf-8?B?cG5laUhTaG9HRVp3WEthL1gyVVdoYUN4ZWt3UDVSWklQWXdNTnBySStlaEZV?=
 =?utf-8?B?aGo4UktNME8zTGR4YmVvUzMzQXZkQWh2MHJMcUx6ODRlWlhTU1lQQ3BNbUM0?=
 =?utf-8?B?aXM3aTQxWHlzRkc5RDhFSEoybHJwa2Y5Z2dGSUNWRVZ3MVZTQjd4amZGeDU1?=
 =?utf-8?B?ZWwvMVl0UWZ0YjBTY2dQUjdkd21NMDV0T2lhVkVpZU5XNmgraTF4ZHhFelVC?=
 =?utf-8?B?cTV1bjdQbVVzVWFPNFk5bk9nZWFDTnFrK3hiQzdhYUEzdk83WkNvUjNmcjhG?=
 =?utf-8?B?QzROeXUydjRRTlZVZFVVT3ExeUwxa1ZmenRGN0JiM0pDL1UrcnhwVjhickxr?=
 =?utf-8?B?alAxSUMwM1IxNGFVM2F4TlI0Nk1kQW5BbTFjSUJnT216RkVJdDFSWFFrbGhQ?=
 =?utf-8?B?QkZEWDk4T3hyeEZ3QXZPUlJwUHlhTjJLeDNUUzVtMDN6N3FKVldlQUdVemY4?=
 =?utf-8?B?aklsclQzc24xQnJJSHpSb3VQV2tNK0V6NnVJZE5sN0VUSWpsdndlRkcyTEFa?=
 =?utf-8?B?R0lSZ0dsT3JLQ0pUeklKd05DV0Q4TzRZb3JtOHlvNktQRmlMTG4yWVYvRTdl?=
 =?utf-8?B?Tm9rZ2RxakRzT2ZZVGwzcXYwamplMW5BS2g5b3dxV0h6alBWc1BySlJWbGR1?=
 =?utf-8?B?ZUhpSXRKci9RN1liNnh0cEpLMzhJZi9OMllKV2JvQWdPQ1NwRDV5dWhmT2R5?=
 =?utf-8?B?U1pnaXBST0QwWnAwaFZhRUx1emU4WFBleUhwemFnVGtrQkRNVVFRWXUyS0lC?=
 =?utf-8?B?ZWZlMnVna2VuUWE5MzE3ajRMY0FSdE8vd25pZTJhMnIvR1p4eVcyNkFkaHN3?=
 =?utf-8?B?YlliZG5sdWR4RDQ2VE1zeGpJUElwUE1RVmxNSnRRQXJBWDdvUUtDQktxd01s?=
 =?utf-8?B?V1d3MGs0Y05vWkNBeUJxZGFoVExNMW51TWh1bTl1NndQVTlhWDBxMlVjdU9n?=
 =?utf-8?B?cnRZRUpUNlhkQWFHR3M3MTdtZ2I2UWpRTmtvM2dsSzE5bXUyMEM2ZHM1d2RB?=
 =?utf-8?B?ZjdBdEZMRHZ3d1Y5THJKaFNIUVFlc05TZGxaRWZWWS9GaXp2VXo4WHpQSzIy?=
 =?utf-8?B?eDVhN0hUblJ3YVF5ZmJQNUZvZWJvcVdVWFhDR3R5R3Rwd21pOU1Tb0lOdnp3?=
 =?utf-8?B?Zi9QcFZvTWtwdFg0US9xb2FJRWthdmZrampoRU1lK044a1FaMG9mU2h6TzlB?=
 =?utf-8?B?MENqblB1cUxqSCtJZnRCTGlwOGFGY0VPWHh5TTdiQ3JLSHZUS3dCcE9UQXZw?=
 =?utf-8?B?Tmg3clpUeWx3SStjbnlLcDVSRmRlbWdHTFU4amxYTDMyK3d2bmc1WDgwNURP?=
 =?utf-8?B?dFJsRXBodHVCRjRhbVJZZEhYQTJHbytFcVUrTXR6a1JZMnlRcmEvZWlWbmpD?=
 =?utf-8?B?N0tweFRBeFpuQzBlMzAxbktsZnEvTGxVcWlad2oxWkVhUk1pSXVRcWVnOU9G?=
 =?utf-8?B?Si9sYlhsTnZYaWtuelU1cnBmdTlIdE90L1E2TDl1QTJxZmJqOVdlTHFmcWpo?=
 =?utf-8?B?aHVNR2FUY1kvd2FzNGpsMUNjMEpEek5NVS82cXRmZ205Q0dhMmxsdTB4Y2xo?=
 =?utf-8?B?bkdsVjZ2Ym5sdVZrazlGSEZobCtYeWYzai8yNnBKdlQwSkt1VlI4ZlZHVThG?=
 =?utf-8?B?L3BQZWluTkc4SnNmSWZ5OUF3aC8rZlBoS3RoV2M4NVpYV3B4VGJONEd3M29v?=
 =?utf-8?Q?L6ONDOIp7fsNC6Kg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <988BC970E0D82F428F4B7D7D56AC8FE3@eurprd07.prod.outlook.com>
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
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7853.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ddc08b-b214-42dd-22eb-08de574ab0d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 11:05:43.8657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WwisWy2Dliubm39mf71Wnwi/WEv17MpPBHz5CV4kxuVVYGK6JOmSfk+YaMoAKGjApAKxIYDYaiJT7GX3qhVk5OwN8DoiLfn0H5xCN0MhKzqTAOa8QRU6cYi2D0+QOMnc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8237
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: PAXPR07MB7853.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: DU2PR07MB8237.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCkxlIDE5LzAxLzIwMjYgw6AgMTE6NDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgYSDDqWNyaXTC
oDoNCj4gRG9uJ3QgYWNjZXNzIG9mX3Jvb3QgZGlyZWN0bHkgYXMgaXQgcmVkdWNlcyB0aGUgYnVp
bGQgdGVzdCBjb3ZlcmFnZSBmb3INCj4gdGhpcyBkcml2ZXIgd2l0aCBDT01QSUxFX1RFU1Q9eSBh
bmQgT0Y9bi4gVXNlIGV4aXN0aW5nIGhlbHBlciBmdW5jdGlvbnMNCj4gdG8gcmV0cmlldmUgdGhl
IHJlbGV2YW50IGluZm9ybWF0aW9uLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
YXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJp
c3RvcGhlIExlcm95IChDUyBHUk9VUCkgPGNobGVyb3lAa2VybmVsLm9yZz4NCkFja2VkLWJ5OiBD
aHJpc3RvcGhlIExlcm95IChDUyBHUk9VUCkgPGNobGVyb3lAa2VybmVsLm9yZz4NCg0KPiAtLS0N
Cj4gICBkcml2ZXJzL3NvYy9mc2wvZ3V0cy5jIHwgMTIgKysrLS0tLS0tLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9mc2wvZ3V0cy5jIGIvZHJpdmVycy9zb2MvZnNsL2d1dHMuYw0KPiBp
bmRleCA2YmYzZTZhOTgwZmZjNjdjMjFlZDdiNjJiNWI2MzhlMzdmMjc0NTRlLi44OGJhMzJhNDBm
NmEyN2Y4ZmZkMTM2MjRlOTQwYWEwZWRmNDg1ODZmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Nv
Yy9mc2wvZ3V0cy5jDQo+ICsrKyBiL2RyaXZlcnMvc29jL2ZzbC9ndXRzLmMNCj4gQEAgLTE4Niw3
ICsxODYsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBmc2xfZ3V0c19pbml0KHZvaWQpDQo+ICAgCWNv
bnN0IHN0cnVjdCBmc2xfc29jX2RhdGEgKnNvY19kYXRhOw0KPiAgIAljb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkICptYXRjaDsNCj4gICAJc3RydWN0IGNjc3JfZ3V0cyBfX2lvbWVtICpyZWdzOw0K
PiAtCWNvbnN0IGNoYXIgKm1hY2hpbmUgPSBOVUxMOw0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wOw0KPiAgIAlib29sIGxpdHRsZV9lbmRpYW47DQo+ICAgCXU2NCBzb2NfdWlkID0gMDsNCj4g
QEAgLTIxNywxMyArMjE2LDkgQEAgc3RhdGljIGludCBfX2luaXQgZnNsX2d1dHNfaW5pdCh2b2lk
KQ0KPiAgIAlpZiAoIXNvY19kZXZfYXR0cikNCj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiAgIA0K
PiAtCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhvZl9yb290LCAibW9kZWwiLCAmbWFjaGlu
ZSkpDQo+IC0JCW9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nX2luZGV4KG9mX3Jvb3QsICJjb21wYXRp
YmxlIiwgMCwgJm1hY2hpbmUpOw0KPiAtCWlmIChtYWNoaW5lKSB7DQo+IC0JCXNvY19kZXZfYXR0
ci0+bWFjaGluZSA9IGtzdHJkdXAobWFjaGluZSwgR0ZQX0tFUk5FTCk7DQo+IC0JCWlmICghc29j
X2Rldl9hdHRyLT5tYWNoaW5lKQ0KPiAtCQkJZ290byBlcnJfbm9tZW07DQo+IC0JfQ0KPiArCXJl
dCA9IHNvY19kZXZpY2VfZ2V0X21hY2hpbmUoc29jX2Rldl9hdHRyKTsNCj4gKwlpZiAocmV0KQ0K
PiArCQlvZl9tYWNoaW5lX2dldF9jb21wYXRpYmxlKCZzb2NfZGV2X2F0dHItPm1hY2hpbmUpOw0K
PiAgIA0KPiAgIAlzb2NfZGllID0gZnNsX3NvY19kaWVfbWF0Y2goc3ZyLCBmc2xfc29jX2RpZSk7
DQo+ICAgCWlmIChzb2NfZGllKSB7DQo+IEBAIC0yNjcsNyArMjYyLDYgQEAgc3RhdGljIGludCBf
X2luaXQgZnNsX2d1dHNfaW5pdCh2b2lkKQ0KPiAgIGVycl9ub21lbToNCj4gICAJcmV0ID0gLUVO
T01FTTsNCj4gICBlcnI6DQo+IC0Ja2ZyZWUoc29jX2Rldl9hdHRyLT5tYWNoaW5lKTsNCj4gICAJ
a2ZyZWUoc29jX2Rldl9hdHRyLT5mYW1pbHkpOw0KPiAgIAlrZnJlZShzb2NfZGV2X2F0dHItPnNv
Y19pZCk7DQo+ICAgCWtmcmVlKHNvY19kZXZfYXR0ci0+cmV2aXNpb24pOw0KPiANCg0K

