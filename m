Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAD2904426
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 21:01:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=jVIqDKmP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzJ1M73wPz3dSR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 05:01:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=jVIqDKmP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2600::600; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2600::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzJ0d00Bkz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 05:00:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW/myq7dORsGzHFVmfNLdFUYov0lGqI8GFPXSU73QsP47q2D/M6c55z87pBuOlMA7s8CkyNhsfNVEvcnH5FlR3kX7VbSyz7GW3b7Rn+sRuXt70yX3uH2ZJiS+WwUhbiMzycrHe6HDmGoMlPVxhjFNpP3n39BBOJ7BVdxp37wgKHM+Q7J3IWYg58w1HC79rE3aLK9t7r94vuz72VVes+xb8HwzvOig0g1xp7gamddyN4XUkZKKtlYzT6CSFYhW3OMzJsImjmzbEKnF/ovIR7lB6x4yZNQlhPu//m7w7rjEmaOvRq4X2rMs3qgzd/PGemG+YnDs10mgd9R4yaIxSgDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMy5oYBzv/2r9FDp980KWZBy97qylndMCRAFh6q4ldE=;
 b=jijaY8sSFcpahFUwmBmyz10w5+kquUj6AmCOhDBX19Ghq/dB2Ic9/5zOUjejrRdzs8ts7PPrBeF1SZWhwwlwISKCnfgAhHujX2uKG2X1MNO4JYop5AqYbG8Utni/fKUMw2d9UzFaJuR2hw0wQpCMTSmu50lT/4CG3h3XCXNlkMGjFuBg3D6CbsHRZkQ7nQ4/RENGUL/DGD0X4OJbx/SV3eJutFBaD8Oyw+vbIapHv8pYhqtpxjTZQKcjwicuKSyeLEwhR+GVPb2czXt9SXJuNZo09UEo7rTA8KSM4V1/aope+OYdtSHMAsOYC8qDfo4x/bWH1fThmAOG61/1WDHpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMy5oYBzv/2r9FDp980KWZBy97qylndMCRAFh6q4ldE=;
 b=jVIqDKmPBfsnrC0U7bWfvtRuoKYMDIoBBbiJ4hLJNDnZzB7LEjLXq0tg0i4Nad39becpwumU92dXo6U6x/Ru2N8b1eh0g8pWi2XkcsJotIDA/qiaItlJTDHDkZQ/R5uzdqu34MbMd6TwvFNz8mBAZP+JDBepoLx+28WQx+OVh576EAhKAMD43bOQJmdYOxSysqi2UInMGaP54lBOHB8mgQ2gNXKUvtf2cAA3+d5/0xrZsGJywJqq+euj0p1J0QXxEvnNI5cGARKJr/ICa8VAnSPqvbITLq/HggEedlqRi37bhzBYhmc6zH+UIKvwv3H03pcpDjRcapZMf9fgP53HKA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAXPR07MB8030.eurprd07.prod.outlook.com (2603:10a6:102:131::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 19:00:16 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7633.033; Tue, 11 Jun 2024
 19:00:14 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Topic: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Index: AQHau+KLGQQ/eNTTsES+mAG/hC7cQrHCnGsAgAAOUYCAAAMmgIAADheAgAAvcAA=
Date: Tue, 11 Jun 2024 19:00:14 +0000
Message-ID: <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain> <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain> <ZmhrIdh3PLzvZU07@x1n>
 <Zmh282yJjxc7zqbL@localhost.localdomain>
In-Reply-To: <Zmh282yJjxc7zqbL@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAXPR07MB8030:EE_
x-ms-office365-filtering-correlation-id: 385eb1d5-8c69-4be5-725b-08dc8a48ba42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info:  =?utf-8?B?RE1KSkVJOHdjcWV2VTlIR3N2ZzhtMjVDdml3NWZna3VyeXFKY2tBL0g2YXpH?=
 =?utf-8?B?aTV2VHU3K0JSYnp4VTNtZVQwZjFUYzlsQnVwZk9GZEZHc0pUaFF5TExJc2RD?=
 =?utf-8?B?dEtsL0NCM3JJTUZnd000RG1nR3ByTGNrNmNmRGRJVWZiZXoycHo5YkdnRzhS?=
 =?utf-8?B?eXRBOE9CaFVXV1RwLzV2Z2hlTUFCTmdhYU1qQklibEs1OERhNW9DS3NGR0Z0?=
 =?utf-8?B?bGJ5SUozMVFpa1M5Z1BNN3A2anR6UFpoOTJuZFJuOXdJUm85WDg5WlJLSWpn?=
 =?utf-8?B?dCt4dnVONjZrTnFGQnJBeWFKcDR6c2I0czExdldPVXNGUE4vSnMycVlFZlBQ?=
 =?utf-8?B?a01xSkwrM2hmdm1sWEZEdG04TUpjSHlSOUloME05MUJ2cTkyZitKL0tiblZF?=
 =?utf-8?B?NG1VQ3JVQzh5emNSVjFrNXZGdmNoTWl2dGF6QXdwY1hhMTlET2IrdXMwemVW?=
 =?utf-8?B?NlBWTVI0UTNKODhxeFR2azBNWmpESVZvazRHNFZ4NUNxTHBJWEF1TzFFUTA2?=
 =?utf-8?B?VDFjWWtLQUd5RUFIOWhOUXBFSTgxaDgzcnFKR0ZzKzZHY0M3d0JPYzBGZERk?=
 =?utf-8?B?UnRoYkpRTlc0L3B2USt4WFAxMmJxZ3ZtanUzc3pYTUZySStnNkl1aXNKejAr?=
 =?utf-8?B?K1N1b2FRUVVUQi9JVUhUOGFQSGJZT1BiczRnMy81elFnaC9UVHVBNmRzZWlQ?=
 =?utf-8?B?OXVlTHBXZFVXaGhZdHNwcENhWWJwbG9DbFlCTndNb3ZyYkZsZFp0bzAxUk40?=
 =?utf-8?B?b2FFc1RPRDF2ME5jSll0Qi9sUlA2Znh5SWdMbzUvY3VYdktvK25kZEpWTmMy?=
 =?utf-8?B?dnRVdHloa2pLMEJEQjhhb1IyV09pVWlXNng4elhiUGg1L2YzTjRPRmRsOGMv?=
 =?utf-8?B?enhVWmJpczkrS2EwVWpsWHhPVWtzengyejdmK1BWckl2NmNHbkt3cnh0OWti?=
 =?utf-8?B?SERubFZVRW1wVWpHS3pSdG5nM3ZCZlZxQ0dxUG5RNGtRTGFtczJ2cmdzbEI1?=
 =?utf-8?B?NEM3YVc0RVM5bHpIWmpNdDJmMU15RHZ1dDVwYUs5V2swTFVwZ3U4ZFRHTVhQ?=
 =?utf-8?B?RUFrTVExN1hrSTJreVVOQTRkTlhQMGozeTJGNTd6Y29Pekpxam5zeC9DSnBo?=
 =?utf-8?B?dVEySDcwZWNFbk55Sng5cnNmbVg3cXBzK1Y5ZnBBN1daM0lNVElzdVYyR3RP?=
 =?utf-8?B?M25pMFd0NU5LNHpyVWxqcWgxaitxaHNOek5TYXVPcUJSZUM2NlAzbHBhMnNm?=
 =?utf-8?B?RzF4MWdzOVN6SUdrUzJkN3RyRzhqZXQweEhVTS85Ry9vdmRMZzYyWWZxdnBz?=
 =?utf-8?B?YmRVMGg2MUFQR1hiRGl0UDZJbGluUzV3eTdFaXZOYlA3QXk1Y3kyS21JV1dN?=
 =?utf-8?B?SDdwdk9PbjlXQ3FvQlFDT0dicmxoK2x6b09kR1NqdnVYendQSTlLdFdaZWdB?=
 =?utf-8?B?ZlU5eDI2WUR4SCtuUEJyLzJIMitSMkltQzQ3RkVURHpDZXlqYWw5aHdBQWo1?=
 =?utf-8?B?OVdaSjVVUSszODJjZ1dwUzhXM0hEY200akFQTFR1RCtuSUp4L2svaW5TZmRJ?=
 =?utf-8?B?RXE0THlzU0ZZcHhwN3Voczd1M1lHN2E2RmNRVEtJV3BCKzVOYndTUGR0aEpk?=
 =?utf-8?B?QW9RZ3pmOGh4bzZhVWdSSGswcHNVQTdwakZqNGVsZHQ2UFVaR2gzMjFXR0dS?=
 =?utf-8?B?MXpqZVZHUHBDaGtvUjAyaXN4ZHZVaVovbFBTTTFzNDBHcVJkaVkzWlZ1aTUz?=
 =?utf-8?B?bGRYQXY2SGl0K1pka1AwRitmaWIvY1dZS3QxcUlFUU1PTzVhWnZsTEVDOE1y?=
 =?utf-8?Q?fI/E9pfxHJZMg9Z9xZ3YeqCYEb2IvcTwwl33U=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eWxBODg1Z3BLZTBvWkdtMGg2Q1Y2R3YwSzFNeVEyeHBmOHZIbGZlbTBWdjR2?=
 =?utf-8?B?QVUrTFpsb21XQ25LeE1lSlFhdDFoYmJURDM4YUYrK3ZtbUd0Ym0vYlJpak9K?=
 =?utf-8?B?ZlF6aDhwNXc3K0lEa3FvVjFxK3k1d1VhcEwzOFliajhzelpqbS9TWnUxMEZ1?=
 =?utf-8?B?L3hQMldhWFhidjdMR1U0Zjl3WlYyb0JwSENXaW1aa1I4R3RZUm9lUGlKMUt1?=
 =?utf-8?B?bVZncW9iUndyNStKZzBUWGNLWk96V2VlWjlZcW5MVlpmZjdjRGV1Z2hNWWpK?=
 =?utf-8?B?VksvS2xqUlE3U2RBWTlTcmozR1NxMHR2aktqN1pvWTJTM29LQXZ1VGl2cTlK?=
 =?utf-8?B?bHliNFVCbDgxOFBjL1c0cTBIbEloZE9sV3MzTlVkTU13YnpNZ21jOTAweTd0?=
 =?utf-8?B?WjlVNFY5OXYyb09lM3N2TURJa1dsQVZycVU1MktwTExaSVJSdjRyZkYvY0JL?=
 =?utf-8?B?c1ZUaVJMd1hvZlY1eEpaTmNnbXF3Q2JaL3FlVllPOWtSeFdYN01yK2FscVNz?=
 =?utf-8?B?NEVkNUsvWXRsWkhTcjduN2xhcFArV0FGYUxDaHdtbVk5YjQwNHFMd0JaSG1v?=
 =?utf-8?B?MCt6eFpDTjVBRkZsTUE2cEtRdGxQakh0d3pKU3pUT1hjL3RRc20rNU9EdmhP?=
 =?utf-8?B?MDhOSEVFalBwRDFWakt0NU4waVhzQkZUbUFBU3UrTS9JV2VGRzhVVTkzbjZo?=
 =?utf-8?B?bWJMeGdSbFYvUE9GTW1kcDdtc284OFJOcDNkL2JSNURsUEJFeXNyRHRGUGJu?=
 =?utf-8?B?SWI0aFNOdlZiMkN3QytGRmZTRi9rUGZYUU13c1pRN0N0REphK1R5Y2N1dGU1?=
 =?utf-8?B?am9wTURXWEI0TDVTOG9zNVd3OVFlMlVBeTNwc25DOUVzOTkwZEhyREo3c3A3?=
 =?utf-8?B?bGFldXdlREx6YkQ4d1pmMkFTWkNENEU2MHF6WENFRi9kc3p3Wlo1ZGZ1RWtk?=
 =?utf-8?B?RWxaVDk2VTBIMFVUaGIzNWhYaWRGWFBoRm5RR3NxazkwY1NxOHZCNU9sZHdI?=
 =?utf-8?B?UU9rcjgwWUt2cVBVTVd6SzN2WFNoNk56d04zMjhHYXc1aUNqbDY1ajk1THJL?=
 =?utf-8?B?RzVqQm5LK3laRjFlVkc2cVBoTzRFaUdRU0c5VlcwNDJnMVVqNjEzczZuU1ZO?=
 =?utf-8?B?YXo1WVVSditVVnQ2eXIyR1JoLzEzQmVlZDUwUWJPWC9QYlRMRzZLMUpYOTl6?=
 =?utf-8?B?am9BNHVMM1JwSHA5MFhtMG5Ccm04K1VoNmlUejJGZkxWQU1ab0NNMzJKTTN0?=
 =?utf-8?B?QklZN2Q1cHVBTUYweG9ibTdXSWdZcDJ2ekZ3cnR0OUg4OTF1L3pGblhJck9a?=
 =?utf-8?B?dXlvS3J6TEczbkZEQzNJNjdvVnBSSmdScjEzNWlEaG14TkpSaXhxYjg2NUNa?=
 =?utf-8?B?SDI1MWoxQVFydy9sNm1vTDB0VVpzZXZFdGZRQzlUdDk1MUZleUdHSXJEWmlN?=
 =?utf-8?B?L1phRk1iRFozRmM4V2s5UHJKdm5USzZZcWh6S25pK0ZGOSsxVVhqNmRxUkVV?=
 =?utf-8?B?aGtVMmJ4blJsZFFmdDBQU1grQ2Z4TlRjem1scm5Xc1cvSTRXcTFJSmF5aFhV?=
 =?utf-8?B?Y2hYaW5jSE1VazVoeXdwSmxOc2kxSEVnL2ZHTWJTa3RJZTZheWkwN1JVZ2d5?=
 =?utf-8?B?YVRKb0tBemc2WlZKVlRaUzVFcWNDdkhmQjZFOFRMMlBvRk9jdWMxRVdva2g3?=
 =?utf-8?B?S1kxMFZJMzF5QlBFQzVxTjNIbnJ1SlhjTVdNMUQwcWpnOHVuTjV0Sm9Yc1o2?=
 =?utf-8?B?QjloRjZPZ25jWUNjTUNYanpEcWljaW5aOGhOWHBUUVNGQzhTTGZ2aWczVjFR?=
 =?utf-8?B?UGtiaCtQVitQY0w0by9NWjVXRnY3WnFqNThXRExmL3lsOHJFK0ppbUFYL3pa?=
 =?utf-8?B?WFlFTWgzcjFJYUN5NTZnMlJaYVFpcHJSald0M3FzQWx5ajBsRU9TYitKUHlu?=
 =?utf-8?B?YnZOWVdacVIvcHZNMlNQK09sNWlpS29reXlWdHRSc2daZUtYYVQvREcrbW9i?=
 =?utf-8?B?MEJaR1pwTzFNL1JqVEQ1M2pSN055T1M2WUdOZVlwQkNMMTRlZG4ycGFhbjVj?=
 =?utf-8?B?UFkwVkxrSEZkNkl3Vkt1Ly9OcFB4b3BjZ2xVNWxVOHc3eURnV0lIWTExNTlH?=
 =?utf-8?B?b1ZkZUpYa25KRC9aVGZlcDYvcGJCQ0krZGYyRktrdGNxUlNqZkRxeHAyQmlj?=
 =?utf-8?B?ZTU5Z0picSt3Wm0yWjZFclVyL3kybWJGRTNDakdDRHprdzRjWERUUk5OQ3lV?=
 =?utf-8?Q?NXau6amcHe4xnUrCJ+hz7/gytDLkZKZCTI+zNoQ/xM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0211D96FCC08541BDB0956928B358D2@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385eb1d5-8c69-4be5-725b-08dc8a48ba42
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 19:00:14.6683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxUfp5cEt5+pt/Pl6+LdcW7tNmnvC3wAPdVRWJ973M5Uno8AhKR16BbKtotpjh2gSFehK+tkP9ZIK+wkbpcNIis0MTm/aRG3qx92o/eQOR9EeRm/u2y2ob7ogBo2xNSQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8030
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAXPR07MB8030.eurprd07.prod.outlook.com
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA2LzIwMjQgw6AgMTg6MTAsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG9zYWx2YWRvckBz
dXNlLmRlLiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50ID8gaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFR1ZSwgSnVu
IDExLCAyMDI0IGF0IDExOjIwOjAxQU0gLTA0MDAsIFBldGVyIFh1IHdyb3RlOg0KPj4gT24gVHVl
LCBKdW4gMTEsIDIwMjQgYXQgMDU6MDg6NDVQTSArMDIwMCwgT3NjYXIgU2FsdmFkb3Igd3JvdGU6
DQo+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBkbyBub3QgaGF2ZSBzcGFyZSBiaXRzIGZvciA4
eHggdG8gbWFyayB0aGVzZSBwdGVzDQo+Pj4gYXMgY29udC1wdGVzIG9yIG1hcmsgdGhlbSBwdGUg
YXMgOE1CLCBzbyBJIGRvIG5vdCBzZWUgYSBjbGVhciBwYXRoIG9uIGhvdw0KPj4+IHdlIGNvdWxk
IHJlbW92ZSBodWdlX3B0ZXBfZ2V0IGZvciA4eHguDQo+Pg0KPj4gUmlnaHQsIEkgcmVtZW1iZXIg
SSB0aG91Z2h0IGFib3V0IHRoaXMgdG9vIHdoZW4gSSBpbml0aWFsbHkgbG9va2VkIGF0IG9uZQ0K
Pj4gcHJldmlvdXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLCBJIGRpZG4ndCBjb21lIHVwIHlldCB3
aXRoIGEgZ29vZCBzb2x1dGlvbiwNCj4+IGJ1dCBJIGd1ZXNzIHdlIHByb2JhYmx5IG5lZWQgdG8g
Z2V0IHJpZCBvZiBodWdlcGQgZmlyc3QgYW55d2F5LiAgV2UgbWF5DQo+PiBzb21laG93IHN0aWxs
IG5lZWQgdG8gaWRlbnRpZnkgdGhpcyBpcyBhIDhNIGxhcmdlIGxlYWYsIGFuZCBJIGd1ZXNzIHRo
aXMgaXMNCj4+IGFnYWluIHRoZSBvbmx5IHNwZWNpYWwgY2FzZSB3aGVyZSBjb250cHRlIGNhbiBn
byBvdmVyID4xIHBtZHMuDQo+IA0KPiBZZXMsIHdlIGRlZmluaXRlbHkgbmVlZCBmaXJzdCB0byBn
ZXQgcmlkIG9mIGh1Z2VwZCwgd2hpY2ggaXMgYSBodWdlDQo+IHN0ZXAsIGFuZCBvbmUgc3RlcCBj
bG9zZXIgdG8gb3VyIGdvYWwsIGJ1dCBhdCBzb21lIHBvaW50IHdlIHdpbGwgaGF2ZSB0bw0KPiBz
ZWUgd2hhdCBjYW4gd2UgZG8gYWJvdXQgOE1CIGNvbnQtcHRlcyBmb3IgOHh4IGFuZCBob3cgdG8g
bWFyayB0aGVtLA0KPiBzbyBwdGVwX2dldCBjYW4gd29yayB0aGUgc2FtZSB3YXkgYXMgZS5nOiBh
cm02NA0KPiAocHRlcF9nZXQtPmNvbnRwdGVfcHRlcF9nZXQpLg0KPiANCj4gQENocmlzdG9waGU6
IENhbiB5b3UgdGhpbmsgb2YgYSB3YXkgdG8gZmxhZyB0aG9zZSBwdGVzPyAoZS5nOiBhDQo+IGNv
bWJpbmF0aW9uIG9mIGJpdHMgZXRjKQ0KDQpXZSBoYXZlIHNwYWNlIGF2YWlsYWJsZSBpbiBQTUQg
aWYgd2UgbmVlZCBtb3JlIGZsYWdzLCBidXQgaW4gUFRFIEkgY2FuJ3QgDQpzZWUgYW55dGhpbmcg
cG9zc2libGUgd2l0aG91dCBhZGRpdGlvbmFsIGNodXJuIHRoYXQgd291bGQgcmVxdWlyZSANCmFk
ZGl0aW9uYWwgaW5zdHJ1Y3Rpb25zIGluIFRMQiBtaXNzIGhhbmRsZXJzLCB3aGljaCBpcyB3aGF0
IEkgd2FudCB0byANCmF2b2lkIG1vc3QuDQoNCkJpdHMgbWFwcGVkIHRvIEhXIFBURToNCg0KI2Rl
ZmluZSBfUEFHRV9QUkVTRU5UCTB4MDAwMQkvKiBWOiBQYWdlIGlzIHZhbGlkICovDQojZGVmaW5l
IF9QQUdFX05PX0NBQ0hFCTB4MDAwMgkvKiBDSTogY2FjaGUgaW5oaWJpdCAqLw0KI2RlZmluZSBf
UEFHRV9TSAkweDAwMDQJLyogU0g6IE5vIEFTSUQgKGNvbnRleHQpIGNvbXBhcmUgKi8NCiNkZWZp
bmUgX1BBR0VfU1BTCTB4MDAwOAkvKiBTUFM6IFNtYWxsIFBhZ2UgU2l6ZSAoMSBpZiAxNmssIDUx
Mmsgb3IgOE0pKi8NCiNkZWZpbmUgX1BBR0VfRElSVFkJMHgwMTAwCS8qIEM6IHBhZ2UgY2hhbmdl
ZCAqLw0KI2RlZmluZSBfUEFHRV9OQQkweDAyMDAJLyogU3VwZXJ2aXNvciBOQSwgVXNlciBubyBh
Y2Nlc3MgKi8NCiNkZWZpbmUgX1BBR0VfUk8JMHgwNjAwCS8qIFN1cGVydmlzb3IgUk8sIFVzZXIg
bm8gYWNjZXNzICovDQoNClNXIGJpdHMgbWFza2VkIG91dCBpbiBUTEIgbWlzcyBoYW5kbGVyOg0K
DQojZGVmaW5lIF9QQUdFX0dVQVJERUQJMHgwMDEwCS8qIENvcGllZCB0byBMMSBHIGVudHJ5IGlu
IERUTEIgKi8NCiNkZWZpbmUgX1BBR0VfQUNDRVNTRUQJMHgwMDIwCS8qIENvcGllZCB0byBMMSBB
UEcgMSBlbnRyeSBpbiBJL0RUTEIgKi8NCiNkZWZpbmUgX1BBR0VfRVhFQwkweDAwNDAJLyogQ29w
aWVkIHRvIFBQIChiaXQgMjEpIGluIElUTEIgKi8NCiNkZWZpbmUgX1BBR0VfU1BFQ0lBTAkweDAw
ODAJLyogU1cgZW50cnkgKi8NCiNkZWZpbmUgX1BBR0VfSFVHRQkweDA4MDAJLyogQ29waWVkIHRv
IEwxIFBTIGJpdCAyOSAqLw0KDQpBbGwgYml0cyBhcmUgdXNlZC4gVGhlIG9ubHkgdGhpbmcgd291
bGQgY291bGQgZG8gYnV0IHRoYXQgd291bGQgaGF2ZSBhIA0KcGVyZm9ybWFuY2UgY29zdCBpcyB0
byByZXRyaWV2ZSBfUEFHRV9TSCBmcm9tIHRoZSBQTUQgYW5kIHVzZSB0aGF0IGJpdCANCmZvciBz
b21ldGhpbmcgZWxzZS4NCg0KQnV0IEkgd2FzIG1heWJlIHRoaW5raW5nIGFub3RoZXIgd2F5LiBM
ZXRzIHRha2UgdGhlIGV4ZW1wbGUgb2YgDQpwbWRfd3JpdGUoKSBoZWxwZXI6DQoNCiNkZWZpbmUg
cG1kX3dyaXRlKHBtZCkJCXB0ZV93cml0ZShwbWRfcHRlKHBtZCkpDQoNCkF0IHRoZSB0aW1lIGJl
aW5nIHdlIGhhdmUNCg0Kc3RhdGljIGlubGluZSBwdGVfdCBwbWRfcHRlKHBtZF90IHBtZCkNCnsN
CglyZXR1cm4gX19wdGUocG1kX3ZhbChwbWQpKTsNCn0NCg0KQnV0IHdoYXQgYWJvdXQgc29tZXRo
aW5nIGxpa2UNCg0Kc3RhdGljIGlubGluZSBwdGVfdCBwbWRfcHRlKHBtZF90IHBtZCkNCnsNCgly
ZXR1cm4gKihwdGVfdCAqKXBtZF9wYWdlX3ZhZGRyKHBtZCk7DQp9DQoNCldvdWxkIGl0IGRvIHRo
ZSB0cmljayA/DQoNCk9mIGNvdXJzZSBpdCB3b3VsZCByZXF1aXJlIHRvIGNhcmVmdWxseSBtYWtl
IHN1cmUgYWxsIGFjY2Vzc2VzIGFyZSBkb25lIA0KdGhyb3VnaCBwbWRfcHRlKCkuDQoNCldvdWxk
IHRoYXQgd29yayA/DQoNCg0KDQpDaHJpc3RvcGhlDQo=
