Return-Path: <linuxppc-dev+bounces-8476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE6AB1A1B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 18:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvDdw3Vdfz3bkL;
	Sat, 10 May 2025 02:16:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::621" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746807396;
	cv=pass; b=MYCzWvld8DpW8X55ph3gVLtw4v2PNobbBm6qHmhpbDTRG/LCxZe/UvlqWuiJ57wnniXIeufUEEylODTKTI1ybkTFu2K9Z+ieZmMiEetCZ023f+VF981PH6rFB2aY+dSiqs4jjNkPuGo7cZTuUXfoqVYoFpHvKyn/cxAYrz7S1QS1wt9Pk75Kk3PjNu1VuES0J23woXDdzt/j4r1Dtam3KALTWGKaOTpv4VeSS+JqTpkoi7GE8iJslouIwhhZYEz3QGO4QcY6cZ6JZAeyLWShURPwD3oktszq4Y4m25vSxErjgiMJ/0JkA0alcFk843wXsh90EKAx/FYNNY4Fv18CUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746807396; c=relaxed/relaxed;
	bh=J82X5I27FlqWXsCWECr+Bpu+792GyGuzgeCFimbpQbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CFtipGPzJaymozUuTOAwYBbMgmkk0IaPZ6l/MGU0l7DFXX3zP3sZa+g7XrVLsJs9WaSB12xLSRZ+756Y+lEy/YPJIdY2Q8sFG+9MUEe8/qEcSXfkt1ODeeqUeJDA7J8TNrXhQPecDFr9l+LuBmCfv+8NFbOixuzJaONpEPtpsAOSy76XGLobnSevgWGqk9usFf/dsFZZhW1LO8l1rRZjWmG3ereUcUqoP1tw8vqa3JW9jBadbOioIdKFAWMbczXKOoXrLPy7ONeuX1aHO0yJ1ho1olXcawpYUyBeG6fM6AV3/+MgzoSPvWwJHHvBssj27goVBfEIZM9vwEUO5iWxeg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=DGKSOGkb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2612::621; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=DGKSOGkb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::621; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20621.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvDdt4MpJz30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 02:16:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbYuOukCXTep8df3FwYc06u8CqLRp0JIpA4xAIi0AQtu9pFSout1AOJSgxx19ZtH8maY8tdzPp1AKQDt9y/OqmrTgv+9zMWLLFtZcESR7JtMPT5cc0+MGUTI/4UIvqsPZtoYf9WZUIUHaHlP97mFXst2I4a8xA24l3xZddrdJcwR5ISgwz72YfEl6FkA4puSkJO9ZuR/s4Eilqwgjgt0nCRGYzqRWZPormTfVKvYIxDf7+f9mQQ8PdV7JVrXJPH8uA/PGFEJvXqHhQjChADsEJEu9lXWOG2Q/qYEgNXhkHRw0aW+PQXsNr8CKRSiQvMRXoKe6xZmSUX5BUbg6X9ABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J82X5I27FlqWXsCWECr+Bpu+792GyGuzgeCFimbpQbk=;
 b=RrqfT50XvVcnciIJk+Y8YbHaf7stXcam/7ySHvfWL1fHpJeF/tzQNPnaAAXvvzRp2Wyg+fJgM/9DydmHUYcP78z7XsMptR6tkTjGZ3zo3vc9QLOhb7HTLgJGQky+SdxX+fcUrXYOvZf9wpMx290/18pEdIzOosM/X20azO6ISSNNncQr/Ul2+M/M4tI2lgcGWoh8z2OVfZF9O4LZHDfV+gjA657Wvw39a7jEXNjPbta7xxYNr0ZkCpw0WB3X9UN0c2QVLYkKEaMGD1Fl0U8wByOcWx7v9D7/FAzXb47BzgMGMwOSXsW7cIGWKqXPCNSVm1V+ZUIzIIf68txKPZYDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J82X5I27FlqWXsCWECr+Bpu+792GyGuzgeCFimbpQbk=;
 b=DGKSOGkb4aIrKJ7L99SN+yA6zViLsZW5rhhNXawZwx4C35DRuPjphAqwyR28WvSgDthEjHGaZixbOmlB4rbAyWAJ95E0LxSoTTiKAYqtt3njHpNGKRIB8yOwhwP8ZEidzf5mHZxJVy0Lj4/+npexC5FqUEp0weuH9lW40EqjZBPk2slbVenP90ebRR3fhW9lV6hVeETljQVcDSkIzwBmIOZq7CyKqc2DCeV4lHQnocaJ93gjyacTTnOaPaC6IcpCz/yeh/JbfM4eajDt/DySlk8y9FrXCd4v95yH4UU/dkZpMmt/BXHPtECzdX8X9nxZUUUHEb7QTmDfYviPVzHwTg==
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com (2603:10a6:208:ed::33)
 by PAWPR07MB9757.eurprd07.prod.outlook.com (2603:10a6:102:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 16:16:13 +0000
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a]) by AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 16:16:13 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "qiang.zhao@nxp.com"
	<qiang.zhao@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
	"nathan@kernel.org" <nathan@kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Tom Rix <trix@redhat.com>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Topic: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Thread-Index: AQHbwO6lOHu/cjJjuEiG7w06sAiN8bPKeX8A
Date: Fri, 9 May 2025 16:16:13 +0000
Message-ID: <f2fe43f3-fb71-4e07-a7c9-2cf151fcdbd1@cs-soprasteria.com>
References: <20230320125202.1721775-1-trix@redhat.com>
 <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
In-Reply-To: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB6196:EE_|PAWPR07MB9757:EE_
x-ms-office365-filtering-correlation-id: 1db67d4f-884a-403b-8d35-08dd8f14d19c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WlM3M1VpekVWb2RlMitCWmQ3ZjlDb0MvaTBzS1l6cHkvRDNKMmVaWE4rWlE2?=
 =?utf-8?B?L0g4NUswUHR3QWJYekg3T0hUaWhnMDE5YjVXS1p2S1c4YklJanhoc1cyU3NG?=
 =?utf-8?B?Y2VmV0lzdVFWTTBKVTlIVUdOenVWZy9OUXlQckQ1TDFnSGZ3a1k3clg1OS9l?=
 =?utf-8?B?eW1scmprbmh2UDZWeTErZVo1ZjJaUzdvS01aLy9PcFpUS2FtaCs5VUlVK3NP?=
 =?utf-8?B?TVVRMjRCMGVHMjE0dTAxWGdOMXpPbGpPbTNnUDQzdURTK2l1U2NuNHFMcG9l?=
 =?utf-8?B?cyt0ME9IREUwNnlPQk1yVmdJNGYwa3VNa3J3cDNicGZwR2R2OW9OQ1ZSY203?=
 =?utf-8?B?SXdYa1pDNUt0dUwzcVJOV3JBU0F3UXFTWFVTazRxRWtCSWorN1hBa1lZakhZ?=
 =?utf-8?B?Y0JJU2ZlcGlvdWtkSmJ0enBmeE1nU2pOazN4MVkvSWZQSnpIcmtkMzBJdk1V?=
 =?utf-8?B?bkxHbDkzdEVMWUxkN29KRDNLUVV1QS9BR29zRHZiTERjTFVDZ2J6MEF5ditF?=
 =?utf-8?B?RzJuKzBESXVrb1dJSlBvcXUrdDR5bk9SVkZzRkw5WTFEeEFGSXhFbkVmei8x?=
 =?utf-8?B?OEhudHo1UGhKMFZFWnp0QUw0NURBak81Wk9yb1JTU0dETldEQm1oWUFqNFBS?=
 =?utf-8?B?SStpb2loU0xHVWl3c2tKSXphVFZUakxMVFNqK25ZbzRBVWpSRTNRY0hLL2dT?=
 =?utf-8?B?NTUyRVdkcmVTV3B6Tk9uN0lmRm9zZnQ3QS9zSnRQbHdOQ1EzS2RHODEramU0?=
 =?utf-8?B?L3A5UjZmWnNqOC82aVFxS3RURVFRZ0lKVCtDWDNaWmdKRzU1T2kzNFBjTFZy?=
 =?utf-8?B?ek1IdWxVS2IzNXdlZVMrcC9vSTNjWEIzcHVWT2M2bWlLNDFkQzZ6eEpUZTNv?=
 =?utf-8?B?TWRaaklnZG1zM2FtL2JhVXZvTXF4ZURGYmZWaDB4cU91bjZzeXNaSFlybXV5?=
 =?utf-8?B?VEVPK2YwYTlENkF1SVJWTUdCOVdPWndKcG9FU0lmUkh3NUFKYXVzYStsd04r?=
 =?utf-8?B?SHpRNVowUlZ0NDJwd2k1TG9EUFJFRlcyY0oyb1dReFYyV2RBNFpZR1I2L2R2?=
 =?utf-8?B?UExJTThLQzdBcXVqeDhxUzZlVXNWYktnOGJJNUFqSnV0ZC83c2dEaEZaNWlT?=
 =?utf-8?B?T2JZQ2o2RW1TMW1mSWY4UFp2ZG1DSmJIN0U5T2UvQ0wwbGxLQ0RmVkk3MWdB?=
 =?utf-8?B?QkUyZ0t3bUZCdkFZY1pQZmtGSVJIUFA0aW5OSklVMUQzcTdJekZCbm40VlNt?=
 =?utf-8?B?VG8xNExtOGs1WVpBa2o4VGlibU1qSHdub1ZaQUswN3FkRmdtTnVKVFJTT29t?=
 =?utf-8?B?Wng5WGVERXhQcHNXSGdDQkkxQmt3OHlmNGxVZllxcUFNWWhiSHRYYS93MXF4?=
 =?utf-8?B?S2F0SE5TNlBVR05KOWx4T1BJMnZYUGc0cmNIQy9ZTldHL0pmR0Zpc203cVN5?=
 =?utf-8?B?MCtSLy9xNHVxS1Y1RjFHUTZYUk5abDRibnlWYXA0NHpDdHBTV1RNbFVWWHc0?=
 =?utf-8?B?RzBhdGVzWXpkK0pxY1h3blpiUTE4NjlDYU1EK1hCTkhzakh2REZJei9oZTFQ?=
 =?utf-8?B?U1dzLzN0SW85RzZlL21CVExSSXlhWS8wLzZSNFlzMWg4NERaOHZBaEQxK1RC?=
 =?utf-8?B?UDRkbjFCamtoMkVSSFhReVUrdUNEMVpDNUk5TkVxTlBsTTl5WnM2MzFOS0FS?=
 =?utf-8?B?MDNxY01aT0cyUHdDT1ZQZHNYc0hLSkpJdkJpMFdZaEQ0eUpUMUZweCtvYWZX?=
 =?utf-8?B?UVRadUtJTzVHb2NlMVNnOTR3Mm5JclJ3TGtnTWhTaDl5R3FZMmZETW81bDJC?=
 =?utf-8?B?UlR4MkZoM0dNY0RVMktXQXdJbFMzbGFHQXFjQll6aWdoSXpjd0pCbjVaZWNP?=
 =?utf-8?B?MlZmV1pPRy95bVJ3SHNrSyt6Zys2d205T2dJcVFNZDNYRzhPNVJLWTg2UkF6?=
 =?utf-8?Q?csFPPe2orqw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB6196.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFZ6TUJLZ2MyVW9PVU14d1JwckpseEpmVHJxMlBZcVZpSzVjK2FuVk9wNDFa?=
 =?utf-8?B?NXd6U0ZVWkQ3L1l0ek5ZRU1qOHg3TVpGWW85eDlzNWpFS2dCZmdXYTBlQUhl?=
 =?utf-8?B?NzVKZTJnQ0hCenRPNk5MYnhxTWN1S25ic0srb25sMFVYZXY0aVR3eEYveEo5?=
 =?utf-8?B?RGdrTTQySkh4OVNrREVvZGw0VnV6SFR3R2VrZmZyaDdJQUtCTFFtcTdqaXpY?=
 =?utf-8?B?SlBZelVzWDZtbTZLR0hDZmJsTmhJdUtOQUdGY0Rvc202VExjOWNsVWVzUENh?=
 =?utf-8?B?dlFsZnlibmhHc0JuRGtBZVpaRTRaWERYMUlKbU55YUhTc3JzaUZWYm41ZklD?=
 =?utf-8?B?azVDMVVqYUFlZStFQkhZODNrbzQvbVRJNFZMUVU5WWlKMy95bFFhVGU0RUN6?=
 =?utf-8?B?WTlWZUVvMENJV2lwdWZxdFgyaS9XMGZTR2xxWnptUkZCS0FrK3A5dlA2b2d3?=
 =?utf-8?B?NDFMTFBSS3hLYzBwRnQvc2orcFlKN2FSNnAvWkhIRk13WlAza2c3N3FaRHB0?=
 =?utf-8?B?OGtROTFBVnhQeWUrQkFVWURKV3A5OSt0L3EvalJPTmNUcXFUMUQxUUpvUWlB?=
 =?utf-8?B?U1dMei81UGtLWk0zY0hhVExRMmdNYnlxL1YvWVZWclhiZVFnbWIwS0xJak5v?=
 =?utf-8?B?ZU1OYWZoeFBLcTVuWjVEdmdFbDg1ZXQ1QTk2aTVyRVhxMk5jSi92dzZ6S3cv?=
 =?utf-8?B?V2dxUGdRSDJkcXNsNHVzeVpYSi9vR0ZnYndrdE83TmZ0QlEyVFBEa2Y5SFAx?=
 =?utf-8?B?dysxeDZtaHFpRTBSZVNFaVVtblJoSEtSeUlleDZ2NWlicUZhZmdmcDhrN3hl?=
 =?utf-8?B?ZCszcmhZSTJnMWVYNnNrKzdjVFlVUWU4U1Z4bDdWMlBqMXMrMEl6WE9PR0xT?=
 =?utf-8?B?WnVmam9oZTd5U2hUWm0xWEVxRDVPb3ZyT3NUbDZ3NUVnaVQ5U1BuZ2p5OERX?=
 =?utf-8?B?aUtwSVNZQnkvWlJTcFhqZlNNbUNkdGt6bFQrcTZLVVI4WWU2STg2NkZLVGQ2?=
 =?utf-8?B?YmpWVy9EVHJmZndUb2lZcUo4NG4yMzRNOXZPNkxvZGhuaWo2aFZjV29odHBM?=
 =?utf-8?B?MkFteFJNbXhsWE1ZdEtON2ZXenRzUi82dUJ6VGlqbDRIMlFyLzNKNS9nMER1?=
 =?utf-8?B?T1lKNFdvTUhnRktpTFVEb2VPcWhnTUM1dm9hY29FNjhkby9pdThBUHRiT2lm?=
 =?utf-8?B?TmZQdUlESjRhMG1iazU2dXh5ZGFUU3doNUltWVlXYUdsT0tydmZrREdNc1lC?=
 =?utf-8?B?YkZxVGE1MmNFb2VwZEo3M29BZDBBd3ozajM2RCswQkpsM2NNT0NqOTNTSmw5?=
 =?utf-8?B?VEZ5Z0JtUDlHaWpUV0RycXBhMlc5ZG52bjMvblFSVUZQMVJzeTlDYlRLenBR?=
 =?utf-8?B?ODY2ZUpoc25nanBTa05XUlBnYVRDNG5OTHdPQXVEdVg1c0ZlSE1VUWZuT215?=
 =?utf-8?B?eGFvb21nU01OSitpdThiSDZMVWVHRnllTWN2SlpEbWVMM3N1R0lDZlNWM3c3?=
 =?utf-8?B?TjVFbXh0NjBIeklLR1lQcm1TUFJYWXZ3bXZ1UGcyckd6UG14aTFqdkdLQi9B?=
 =?utf-8?B?VVFqUkxxSzl2OHJHWGQyS2xXdXN4MzdKTURYeFJBQmJiRmpwckR1Q1VtL3BO?=
 =?utf-8?B?TWUrTlVudFQ2SVNKNkxhdmhIb2RKZ0kvTS85eGVybXQ4SGpMbE9pYTZaWm5t?=
 =?utf-8?B?Z2hHVkIxdG0wdGwwL0svM1YvL1ExOUtiVWpzcW9MTm1jMFBVbkl4TUpRYkdP?=
 =?utf-8?B?YkJ6eVNmUnBSNGRTWU1iZUtoVyszVVNtWUE4VTlIMWVIZ0dQY1JQZVpZNDJm?=
 =?utf-8?B?VXo0eDFlQnozQ2dtazhvVG50bFlacWhJUzdVeExDRmp2a2JyY1hYclV3U2lj?=
 =?utf-8?B?YzlWRnA2NnhTdGZ2WEY4L3BJTGNjL09GYmRTdndNVHd5bXFGK1lYOUNoWTlL?=
 =?utf-8?B?T1JXTnFwWlZQWGRwL1pMQ25zUXE0N0xITW83VWtWYXRmcHV1UkFlN2JxeFB0?=
 =?utf-8?B?R0hZdzJkVS9qK1BYaytVUlpXWXZJSnUxak5id2ptK05oNFNNeTlTMStOV05G?=
 =?utf-8?B?NERtTTAvS3BCSVlkQUlMM01nSFcwSTU2QzRvaEpLaE1xcmZhOEtnTkJ0Z2Rt?=
 =?utf-8?B?L1RUZ1ZwMUNtMjg4bzZCNVpOR1VwaW9RU2Q3UkZCNXZnVkVZOVd3R0l0bWxX?=
 =?utf-8?B?b1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4E6A612CA0D5C43A9596EBBDCA5E05F@eurprd07.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db67d4f-884a-403b-8d35-08dd8f14d19c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 16:16:13.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUR5NI8comwudil804isnwXx0V0vZwYHtj/Gp+Hh2Q2GjPNNzPuyiPwjNPkq08P92Q2v/G4O2DgrUxqfKjcNg2yFlQ1uVUTfhMsH2V8Qa1nW5QFoq3tNufFq+OWeXnoS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9757
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAWPR07MB9757.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQoNCkxlIDA5LzA1LzIwMjUgw6AgMTY6MjgsIEtyenlzenRvZiBLb3psb3dza2kgYSDDqWNyaXQg
Og0KPg0KPiBPbiBNb24sIDIwIE1hciAyMDIzIDA4OjUyOjAyIC0wNDAwLCBUb20gUml4IHdyb3Rl
Og0KPj4gY2xhbmcgd2l0aCBXPTEgcmVwb3J0cw0KPj4gZHJpdmVycy9zb2MvZnNsL3FlL3FlX2lj
LmM6MjM1OjI5OiBlcnJvcjogdW51c2VkIGZ1bmN0aW9uDQo+PiAgICAncWVfaWNfZnJvbV9pcnEn
IFstV2Vycm9yLC1XdW51c2VkLWZ1bmN0aW9uXQ0KPj4gc3RhdGljIGlubGluZSBzdHJ1Y3QgcWVf
aWMgKnFlX2ljX2Zyb21faXJxKHVuc2lnbmVkIGludCB2aXJxKQ0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeDQo+PiBUaGUgdXNlIG9mIHRoaXMgZnVuY3Rpb24gd2FzIHJlbW92ZWQg
d2l0aA0KPj4gY29tbWl0IGQ3YzI4NzhjZmNmYSAoInNvYzogZnNsOiBxZTogcmVtb3ZlIHVudXNl
ZCBxZV9pY19zZXRfKiBmdW5jdGlvbnMiKQ0KPj4NCj4+IFsuLi5dDQo+DQo+DQo+IENvbW1pdCBm
cm9tIDIwMjE6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNjE5MDAyNjEzLTE4MjE2
LTEtZ2l0LXNlbmQtZW1haWwtamlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbS8NCj4NCj4g
ZGlkIG5vdCBhcHBseSwgYnV0IHRoaXMgYXBwbGllcy4NCj4NCj4gSSBhbSBhbm5veWluZyBoaXR0
aW5nIHRoaXMgd2FybmluZyBvbiBldmVyeSBXPTEgYnVpbGQsIHNvOg0KDQoNCkFja2VkLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCg0KDQo+DQo+
IEFwcGxpZWQsIHRoYW5rcyENCj4NCj4gWzEvMV0gc29jOiBmc2w6IHFlOiByZW1vdmUgdW51c2Vk
IHFlX2ljX2Zyb21faXJxIGZ1bmN0aW9uDQo+ICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2tyemsvbGludXgtZHQvYy9kNDdmMTIzMzM3NDU5N2MzNDg2OTZjM2RhMjE0MmNjOTJhMzZmYzkw
DQo+DQo+IEJlc3QgcmVnYXJkcywNCg0K

