Return-Path: <linuxppc-dev+bounces-487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3753995E49A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2024 19:36:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsLZc0T7qz2xcw;
	Mon, 26 Aug 2024 03:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2612::602" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724607383;
	cv=pass; b=nWZqmPzXHOWyK0hBPxlchAYeDIu6AGezZRhh+3NHzNFchESCmQcJIusREwrcEmNENQAiFVUAfb6nctZkjjJErWJBPwPlBN/ASSjtyYqJ4Wyb/4F+TsWBUpGLRKEvLUi21qr3ElsItg7Pd0tIxdQf+YMEt4vSZXt/LMR9ZjH6thiKxIID0dn4dL5YX/+s0aqOb18VJ4fru1MBiJeRtRwgyQp12zt8oQ6WjlrjZzJKQlvRyVCIBxSq08VJSC8h4qEOTYkhO8wkpNt4tiXiErkoog2PKSkst6JL1wbTeZxJUfc23xhAhBHUYgQ1iZHFO9f0PLgbtayfWtvfGD7Cfo/D3w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724607383; c=relaxed/relaxed;
	bh=kxQ1SZWshgWjco7/HIYDrUWI56VnrhYr+OwdoKh6rqg=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=eKkUWM5u; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2612::602; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=eKkUWM5u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2612::602; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20602.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsLZZ5Sztz2xZY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 03:36:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0dzaD7+RA/GiymYNit+O8SzxFFWBCZ7F3N+HA0WrTSqH+jcvPxdcB82UcYF3pxnnvyRXr3kKcxLg0e7rRbg8HuDtzmbWOIZ06QqmW/NyNR8DF3huS2WQG3cbS5kvZeLOEPJ2g+fxq0CgoF+74S9S5oBP/V2gwVDe8zu08qWTsjwla+A417mjxVajDfHXbFv8uVlWi24P362+YzdDuFzF4px9tMKSxWOlwjoXYJlztZvkjIXkBCa6XTaSYiA3D/TbcTSgC05VEjxlKzxjv6hHJ5QJrZBADZdYTW4tb4uM6BPVeDR5e+8hNJzbhFYNXH8kTEoQoOhvb2zzLrNJJ4Obw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxQ1SZWshgWjco7/HIYDrUWI56VnrhYr+OwdoKh6rqg=;
 b=ZvfkdLI9Y/0grdmn/hHKmiYoJadhETDsKC1Owv0gjUcSSyeVhA8C2yQmIpzDJFktk5/A/XaJIFO7lvxRYayGVOWc6nxmzsBafa+PaKABKqhWevCzJS63NlRONFXcH9s3fxAjOWop6z6RGGzMzYlPPtZLmU2vQQaLhpC1WY/6hLE4dNedOXIUKvR1vpMIS3OlxXv60uMEPiKxOiX3bClef00DABTGlfvz/OiMOV3GsjjdIu+6Pwydttdpa5SheZ1i+17b0YQPEWJ7lTsAmb8eQNTQN8VdMJpSGRHFchW+thnbhnG2NfWMCWKZnCdym4zMhM8I3gQ4BBTu/3BAlO6yJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxQ1SZWshgWjco7/HIYDrUWI56VnrhYr+OwdoKh6rqg=;
 b=eKkUWM5u/rsivlBmGdSLGU/vpXbVhJURGDIt9ooqhZkN181hYYDWWT0OnF4bPiTBB4+rgQSMzS0rRhw2uHNGxHEt+enoqF8/21iKpuQaiXq9cqV2+utaxvPRTRb/S3T7PUaULWqACH5y12d8oWwoIS2637xKosl69Fei6+tuIqnbXE7AzRyMbSQUFKncLXrG49C/5nxUe+VqIp27rmHNpgRq0wja9XTtTKp5qR/107qlQO983bXqRIwpPsgREypEVlNcCAqp6uV0OxGqa4TrA+KR3du8IVJENLueZLAsasKZU1vndvfIOTrk38c3mv6K2pWOp9OZn8pJWmD1f81rHA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AM7PR07MB6788.eurprd07.prod.outlook.com (2603:10a6:20b:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Sun, 25 Aug
 2024 17:36:00 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7897.021; Sun, 25 Aug 2024
 17:36:00 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
CC: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: perf build failure with v6.11-rc4 (commit 4bbe60029319 ("perf
 daemon: Fix the build on 32-bit architectures"))
Thread-Topic: perf build failure with v6.11-rc4 (commit 4bbe60029319 ("perf
 daemon: Fix the build on 32-bit architectures"))
Thread-Index: AQHa86lfUT4P+U1NSkONeDsXumYtILIxe08AgAbH2wA=
Date: Sun, 25 Aug 2024 17:36:00 +0000
Message-ID: <29368a80-3766-44ee-bfe6-fe367cfda531@cs-soprasteria.com>
References: <83384a02-60f9-489b-8e58-a5f3b65992b8@cs-soprasteria.com>
 <CA+JHD92KFi5HMBAenm7cv8V2_z0ZnQmg5eenZ48zFs=DoWPoEA@mail.gmail.com>
In-Reply-To:
 <CA+JHD92KFi5HMBAenm7cv8V2_z0ZnQmg5eenZ48zFs=DoWPoEA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AM7PR07MB6788:EE_
x-ms-office365-filtering-correlation-id: 7ce8acbb-f4aa-4d96-26a5-08dcc52c6287
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MCttam01QVAwWU1HOCtXSFNTeEZkZHc4TDlxWWVuc3lvY2RJWHZJbEx5am5w?=
 =?utf-8?B?eExvY202UEkvalMrVkQ4UzRMck9YYXl4RDIxYTVvNXRnRTFkTVhuUFBsUU9V?=
 =?utf-8?B?UUNyMWlJUUcrQmwrODZBeElaNEZuYUh5cHMvNHRLbEdXdjBib0ZIc052TVVP?=
 =?utf-8?B?UXpMTFB3OVZQVVRYbXB5UUNpQlpKaGZ2MUxqWGtwemxCcFVGU3JXQ1lUektT?=
 =?utf-8?B?bW92UVlHUVlQOGRpSUgrMVBrNDhIVm54Y3IxeklKODIydXZpU1Bxb1ZxTUFk?=
 =?utf-8?B?Z1JmL1VpZ2c1NmdTVEoya1g0OXpoVDZQRThTNis1ZzRBNEx3SU5xYkZmVnBB?=
 =?utf-8?B?TXdFWFFTQXlQQmMrQmY5bnVhUDdMVnFSV0hKdmE1K202RUdLQXBSSjY2N1Uw?=
 =?utf-8?B?NFFWSTQ3Wm8rQ2o3K1pQQTBNOUI1cGpZS0haNGtwbm9ZR1NFVjBTUzJlNVM2?=
 =?utf-8?B?bHFRSEtMd1hLSVBpdnQ1cWIvbWVQOGJWN3ZQTTRUZ0dUSElQa0dSWVo2RS9M?=
 =?utf-8?B?ak1Ya0l6ZEszY0g2czRoa0prUnVKV0xwcTdNM3FKSWgyaFBBQ21JSFdMZ2Ri?=
 =?utf-8?B?aXhHTGFndmJON3dkM3VoYXA4bU1VSVV2aUs5QjBQRWVwWElwZ2dyaTBZeUti?=
 =?utf-8?B?OWMzcG40bFZrdjQvb21LMjg1NGZiYXBGR2IwTjQ4T3VUUGdYUks2VXd0T2Uy?=
 =?utf-8?B?UHpNbjI3bzhnYVg0alZSQVUxaHpmVExXd0dJL0VnRHZPb3hGeTJCaUhiNk9N?=
 =?utf-8?B?NmVPc1dKaDJqY2tsWW9OSkVrZDFESmNHdG5NNnk2RTN3b3lRU044azJJZllX?=
 =?utf-8?B?NEN6OHEyVXBEaVQxYlBJck42cTZRRXpPcUNEazYvdWJYZXRDclArWjlIZzJP?=
 =?utf-8?B?azcxdm00N3F1d2Y2dGNqOE82REo5a2ZKaFFIUUM0VGtHc0JkNzB0K2plQTEr?=
 =?utf-8?B?OERWQUZlZzZxdmRuSlpRTVBRcDM2Q0RMbnZxWFpSazhaeElVUnJ4a2RBaWVn?=
 =?utf-8?B?YXBQKytLSVJFWlphTFpnSFFwaSs5c0k5bGc1SUdLTEg2aVVjV1RRSGxPd3ZP?=
 =?utf-8?B?QlA0WmFEZitYSWpsQ0lmRzVLa2xPdXR5TkUrOS8rdFVxMWFYak5GRFVBQ2FS?=
 =?utf-8?B?cnZTV2txOFIzK2dlOVB2a3JxRHFlSmIxYlJndXBqVDd4MHBnUGJIa1E4UGYy?=
 =?utf-8?B?bWVhdjB2YXVodlF4ejNKcXhjazZrNjUwL2trTXkwNmRWdStvVTNicEhGNjE1?=
 =?utf-8?B?VTZFL3NBaHZ6Uk9aUkJRTkZrTzk1L1RuZ2h3RGxzUXpnWFdFMWkwa1lKbTlh?=
 =?utf-8?B?cmovTTVYRDllN0ZMbW1KRU42RlBhSDI2NExZMlRrcXpGVklodGpPUjVTOFhw?=
 =?utf-8?B?VCs2RjRRdnJMcURLbXh0Qnl5aFlyd3BHK01QMnhnZ3pPd0NEakJmYkY5VHM1?=
 =?utf-8?B?ZTNsTWlTYVF4VUFlVTBMTkQ5K0NBeE5LM2JyVWRqa3NSMHRQSDVJbmtWa0ts?=
 =?utf-8?B?WmMvMTU3WmsvT3FteElaSUd5eW11aEFuMjdzUjc1dTNqaDgrenFYRmp5T2N6?=
 =?utf-8?B?bWdkaUdabzNCc2E5U3E5dWlqdzBzNGZ0em5uRHZ4RGd6U3ZwMGtnSW9zMDdT?=
 =?utf-8?B?MGpTWERsNlAzOXlFeWxaNjY4WmwyZ1VPNitqRHhQTzZ0RzFyd0M0SGRxK0or?=
 =?utf-8?B?bGdNT0h6VDNHZmhXQlFmZ0JYN2JQaG1KVVlmVk9QQTVKamJ2dEU0Y1pHTE15?=
 =?utf-8?B?enJSUlkvU2t1NitXOEZ4WDk3Y25ad0RTN3RER0JrcHFJWW1qanBFYUtRaTY3?=
 =?utf-8?Q?j/5OAwtOz7sWzgO0ZYZJ+SSjO3pi6U0RNkwY4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1F1ZHZ6LzlacWRVZSsrQUxYa1g3M3ZDM2pTZU4xcndKQldtN1hQRnh5dVJC?=
 =?utf-8?B?anBUNkZScEd6SGxaanBZL2JleXN1YmRyZ0tQdjQ5TmJhU2dUVEJCQ3UxeGlk?=
 =?utf-8?B?cEtJTGs3U3ExcG9uc2RZcHRLYXFHQ3J6STc0N2hYcXU3RUVhODB3eCtmcSth?=
 =?utf-8?B?cWVVMnhoM25Sb3RYb0E1ckhNb1UvaUY2N28wUkd2czdBWmprZVVWSG5JNjd1?=
 =?utf-8?B?M2lyQm1KSk1jZDJvNkNNR2RkN3JDendieDQ3b2s2Wjh3VC95YnhqZjJ4TWhj?=
 =?utf-8?B?anRaaXBaUVJLdzdTOHBpek9rV1lYUFZrZFlNR3BnY2lVbU1vZURsT3oxQzht?=
 =?utf-8?B?S3dCWTNwZ0ZpU21vS043cHZNSHdLa3grY3prRkJIZ1AvM3dWMXZCTGlaTnJx?=
 =?utf-8?B?MHM2SU5Ram11dlhTT2JTMkhjdWEzVGZRNFF1RVFadWdoVVVIc0d1eXNpRUF1?=
 =?utf-8?B?cnRROW9ZOWhvQk1EdExsUUF3NFgzeEdDbzZLOWZrOUlzYVZZdzU0bDJtaWE4?=
 =?utf-8?B?M090dEV3aEtPNWIvTzNhUk1zNmFPUVdhOHk1ZWlxRmVGdWtCVzR0M29TQ0Zk?=
 =?utf-8?B?TmRoVkpacFJ4N0pSUXBPLy9JU0gxc2pqbU1Fb2hXQzFUWXBKSUhwZ2hxNjJ6?=
 =?utf-8?B?NDg5UDhrVzUvU3Z6YTdMZVBPYU1HbXdGQkhJd1VaSlNiS2lhYkgwRjlPOHAz?=
 =?utf-8?B?MFpSYlFYakNrc1U0a0Y5Tjd0OWd0anVmR3lBZ2oybjVvQUE1RTM0ditjRys2?=
 =?utf-8?B?alZvaC9SQU00MzI1OXhwamVIc0pPVWQ1dTk0TVhGRDUzUEt6L2ttc0x5NVdX?=
 =?utf-8?B?L0ZRR20yWDFYUFl2bHR0WExpWmMyR0llM3hPL1FUMmNNcWRUczhQTjBvSy8r?=
 =?utf-8?B?cUl2OFFKaS9lTmFOM2Iva21DYlV3ZEFRTVMzYkNLT1R3bmdidHNOV3ZwZW9N?=
 =?utf-8?B?OEgzU2tiZ1E5T3lrbTZQS1hITnRYdDBlM2lmNEF5cVdIRWxicjdva00xTk1F?=
 =?utf-8?B?S1hNb3ZkdjFjYWdRN0RTT3lWcEJHN2NiNmV1L2dpMnBtNEptejBxZkw2YTBL?=
 =?utf-8?B?M2NJdGErdnBrektZRE1ob3lkUGNiYXZuYm9MWVFFdk1EdUkxdElzeCswSzhi?=
 =?utf-8?B?ekszTmVNeUNhTjk3NFJuT0NENy9FUjdaNTBWNFowYllsbzZEMmFuNVRqUlkz?=
 =?utf-8?B?N1BzbXEvN0I2T3NWc1lNT3VuUVZJZHN4bDZJZDFBTVN5QmJ6TUcrdng0MkRS?=
 =?utf-8?B?OVRjR2FvSnYxZWlnREpqalpPNUJVRHVrLzNWN3NGd2FRbnUxZUx0Sm82Ui9a?=
 =?utf-8?B?YUptOXZlRURVdlkzZXZtRUt0cHQ5MzRSWG1DVlh3em45clkxMVl3V09wL2Ra?=
 =?utf-8?B?Y1pWdW0vbWhzaTd2ZEdFSmkxRVM1cVRpZmFhTzYybFEzR08vRi9mMG5DU0lm?=
 =?utf-8?B?dFZuYThaN2lJYW9Oc3pYclBBTnV0Q2NRY2N2aTJIQUp5QTlMSnp3dFpjeldZ?=
 =?utf-8?B?eDBGVUtHZHAzNElXUW1zYW5sWUFrM3lmZVc1MEl0THBzQVVueVFzWm1MSGRz?=
 =?utf-8?B?MW55Z3BXWWNsRWlDdnZYS21Rd2lnbVRlZUdzNHNCdThpSWx1OVRTZ0tLWHVu?=
 =?utf-8?B?TTlVN3VBYWFaYTh1N2FxL1ppcWJlbGxlbi8zUDVuN2ZTdUM2UVo2UHloR3pP?=
 =?utf-8?B?UXFnS0hIc1NaVHBkaThnNy9VVzMxRXphYVFMQTI4MDh5R2hLaUpkYnQ2anlQ?=
 =?utf-8?B?a2tNL3QwQk1KeEdkOU1vUHB0Q25oM3BhNWZFUjZQM0k2U2Q0RlFTNkNXYmVI?=
 =?utf-8?B?T01vNTlINGpRSXl4Z1JkanlzNkEwNHdYaVRmNzZ5TERtT3o1S0dONUw4TjZy?=
 =?utf-8?B?UWFWOUJMY3htYlIrSzA5MCtya04zbUlRYStoclNwU0ZBMGE5N2JtNTFpYysx?=
 =?utf-8?B?NE1tcG81eFpLeS9WeFY3eGtZRUdVa1hpR3krdzBJampVdlRjNUI5OXZ1M1RQ?=
 =?utf-8?B?QkltdVRyTlYyaXVtOXZ3djlHOUx6VlpXVHhkT1FQbHRGa3I1K2hrdWhlbE1N?=
 =?utf-8?B?K1hYNkVTcFZxYVFhWk5GQ2dWQ3BHY0tDaUVXL0dOWE1Ydi9zdGx2N0Fobm5s?=
 =?utf-8?B?ekt0Y3NpaUlNNkxjQkdIdzAxY0RmTDhkR1M2UzVnNUFQdXI3M2RXYk44ZGdJ?=
 =?utf-8?Q?h9W02LkgIaPWXe+EFcnvxt4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0518FBB98C35F3419A3E7D64570977BE@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce8acbb-f4aa-4d96-26a5-08dcc52c6287
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2024 17:36:00.1675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fjbgmef6dLPWFJVTAKjIza5383vwlbHFU+Qmt6lkC4dBNOsoj3C3Uyi4gAHVVESeurqmeWqIlyaUoAy1767Iw11DFVAjICA4lie/CPkQDEShMh66GAXlhTRUsCCcldl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6788
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AM7PR07MB6788.eurprd07.prod.outlook.com

DQoNCkxlIDIxLzA4LzIwMjQgw6AgMTI6MDMsIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyBhIMOp
Y3JpdCA6DQo+DQo+DQo+DQo+DQo+IE9uIFdlZCwgQXVnIDIxLCAyMDI0LCA2OjA24oCvQU0gTEVS
T1kgQ2hyaXN0b3BoZQ0KPiA8Y2hyaXN0b3BoZS5sZXJveTJAY3Mtc29wcmFzdGVyaWEuY29tDQo+
IDxtYWlsdG86Y2hyaXN0b3BoZS5sZXJveTJAY3Mtc29wcmFzdGVyaWEuY29tPj4gd3JvdGU6DQo+
DQo+ICAgICBHb3QgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9uIHY2LjExLXJjNCwgc2Vl
DQo+ICAgICBodHRwczovL2dpdGh1Yi5jb20vY2hsZXJveS9saW51eC9hY3Rpb25zL3J1bnMvMTA0
ODU2ODAwNDEvam9iLzI5MDQyMzAyNTE5IDxodHRwczovL2dpdGh1Yi5jb20vY2hsZXJveS9saW51
eC9hY3Rpb25zL3J1bnMvMTA0ODU2ODAwNDEvam9iLzI5MDQyMzAyNTE5Pg0KPg0KPg0KPg0KPg0K
PiBDYW4geW91IHRyeSB3aXRoDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC9jb21taXQvP2g9cGVyZi10b29s
cy1uZXh0JmlkPTYyMzZlYmUwNzEzMWE3NzQ2ZDg3MGYxZDhlYjM2MzdhOGRmMTNlNzANCg0KSXQg
d29ya3MsIHRoYW5rcy4NCg0KQ2hyaXN0b3BoZQ0K

