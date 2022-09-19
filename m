Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0445BC374
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 09:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWGGp4bCnz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 17:17:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JMFt5ity;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.45; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JMFt5ity;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90045.outbound.protection.outlook.com [40.107.9.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWGG34Ncvz2yXH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:17:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI67pWuptUh2zijM+fLKMiB601g4ZYxXyvCeFf0urrg5bXAdybeSZ/av9DwUaVqYGpDNrNnXeMf6MKvPCKpFG3tVdCiHKJeXbppZ4H7grkqjCCpaRPN41GRHSXnhMcEAJrtmNy5J+AtUO0waqLgFxso+KvrTlUFdnpn0a2FrlYv02Qo8PGrcdXRRfZIQdH7mmoucRI1akxa8OYoAMXThRk/M0USTIqGk1MzFNnR092Txeec6rRXtmTrad19IiwWoKilU+PgQ9pWYU7gN6vjr/5CAVIA+KeTD9qpPB/7OQiKGFCDv/cj8aDTko3bhwATMkMZ8JaOYEVhzh9jpY1Xerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urjQ0YoiID9LNtTqPCckQFp3fWQEabi9W18k+7QkJk8=;
 b=eJriVq/nZg5DWGY24Xw70qRv3ig3Rmb69ya2q5FSnvmC1x1Ss6XPyDdk4yHlU8X09TvJixlp80ZVPaIVAMFc1OtTT21ppyZsrkoNK6AYSZlLMUM55BrveADADclqBPvU7UvrzH34nQlekQRuOKZnxZfiwlKnQS4lubo4HJJRws7kn/d5J6prpsZ3/knB9ApfZsaHm4GWvUlJK3AeYjjae6dJ/f0ew5TjRQfo0qawl25TvOL0RHmvyAniXYI5j+hJfJAF3HbcPsvvddIR1QDF526+E5eOvmLYmESP/ZYSQLdNsPhLLmWpnvWhJ002ijR5zp+znRuCrHKrg3+Fh/sQqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urjQ0YoiID9LNtTqPCckQFp3fWQEabi9W18k+7QkJk8=;
 b=JMFt5ityCNTJOPKBcnM/bU8koO6zq6uKluq53ds0DqAeAwc+MzDg8xwLA2sbrdw9ZlhgJIhzK0gvT91/ZRg+lRYZtEj5ZlLkFWaLA0rDiFRUOH5PvKW7F2LyrceyT4QeFrv5kViPQcIQ0TjxTZwa2z/Fke4MzIxrlq6qaA7p+VsRV/17w8hh8yGQe0NE0qXmIEFDoXHQK+x2f1IoSEsWVc/LVCQhbKVpptHxqN50KTFZZGVQdz5EPSEJZSGVqZXnZns2AhvqN7uDmdwIqw9T4kfNbWoDP/Nf1PsIKknYDE6XOjayLlp7GlvzczGXKvgiMswovv9OBCcNRl22MQ27Zg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1578.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 07:16:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 07:16:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHYyZT3TDSTBbnSJ0CIZQGPG79aSK3mSCqAgAAMh4CAAAe9gA==
Date: Mon, 19 Sep 2022 07:16:54 +0000
Message-ID: <f3ff19a1-4e78-0201-0241-ae8e0b9baa1e@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
 <20220916062330.430468-2-bgray@linux.ibm.com>
 <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
 <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
In-Reply-To: <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1578:EE_
x-ms-office365-filtering-correlation-id: a22a9c1c-76c2-4551-04e9-08da9a0eee5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CLzQcRpm4z0n4iSApJNmFc01lJIRQQk5bO+jZGBK39btzSQl4ENE0RSHSIO2YUbSYkgSWfufL0U7d13Bw393VlMTZqLRtJ6sE0xdHvq5vTQUd2elRz8FTr4xT97g/DhNLbmVGDKVNffsTEJMC75KDv5DKd9XscOyyCr5G6PyjhXG9Zg8hd+n7smHjJ3qG9ERvZ7Py9ktKm02Svl1+dHtl58we8qBnjyrfmvRGasmI6+pY1lxMC+L4riOKLf2MuYBXb7qr3br8V1iDs7HJ6gmO3C++5rcELTse2bHacY8U5ZFu+QcJEl6ZtG3pLV5/onL6BgeLXbs8IAsRCUEtx9AWHCaP137SbCUY5kmIJiZ0pqn5aFVdLj4s63tpxgnqlmNq0Ll3DkwCteGBRRNCzWWsQdIR7C/C+g+wiZphVuuqrN4KA9tbjYD7WugC7df+DUVZtP+zQHaj01McSxgp8T4M9cYyVgAuZxhvSGYL8JkSd4WNkIMSVh2cRrlipBDaei8s10/nGbckb+rMMSBZBujXBXJUZ7tpLavLubhYLq4H14j7qQkELjjF9kCxUQB+kKYfSQ9/FK8B7fFECxk+hAZ/5x9xH4Q1uQ33JeYKBIH62kpexY6UJyXKPhpqmewdqWUJV051ByPL8uZP+uVvg88wXtOptwAPXax5NEV6CatPNZd7uuhMyp4PUCfBeuJgL6vDXnQkCTJ2pllkSrkBubrcxkWC8G4oWeOodXTlwb6RJFBzzOsrSp7yjuy8dcjPJbBY+Z/NtHPWT8eAwUFZN+LGYelAo5ryT6dFngxfOfLW0LfMl58uVAHnrL65wj6x7MQuriK9nAB7VoLbWJFdSFkmp8GuDNdSeJOPwhhhVf12IM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(451199015)(38070700005)(316002)(91956017)(31696002)(110136005)(64756008)(66446008)(66476007)(4326008)(8676002)(66556008)(76116006)(66946007)(54906003)(86362001)(71200400001)(26005)(6506007)(6512007)(186003)(66574015)(2616005)(83380400001)(36756003)(122000001)(6486002)(38100700002)(478600001)(44832011)(8936002)(7416002)(5660300002)(31686004)(41300700001)(2906002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z1ZyNTVlbDg3WXhFTjE0U0x1d1o3Y3dBVjBFSi8vV0RvL3lVTmJST0sySVBT?=
 =?utf-8?B?ZmszdTdGcFQ3bWlCbUFTWUlsSzl2QWl4b0N4cnJPdnNnd0F3SHVscmk3azJx?=
 =?utf-8?B?YmpNZWZCbG1xK3JTN2l3OFJTYTFJd1B5MmFPa2x2czlINXRJVHlDbzhLZXpr?=
 =?utf-8?B?MmR4VlllL3RUcjZoV3hCNTlZblZkN3JjY09xclBqTm81S2F5eEJJc0t6VE4x?=
 =?utf-8?B?b1hEdW8zdllQUGdLYWFkaWFYUUZlYVI4eVZzL1BWeWl0bG1uYWZMM0hDelFs?=
 =?utf-8?B?KzR0ZEJPRVlSNjB5dkFBVUkrdlVWNXRyTnBFV1U4b3JxN1BzeGNlajJ5OUhZ?=
 =?utf-8?B?Skw1U0RiWXY0S2Rtb1dwWDNpWldwMlFOallDZk9VT1dpbVZEbDNqYUx2RnFL?=
 =?utf-8?B?c0hLc2pVRVlia1FjUEw4KzE4eDBUcjdMTGNta2Q5SzNTV2VOUGpkdlZhSGlh?=
 =?utf-8?B?Y3RXM0c5WWN2amNtVmFzWHJHTWdQQ3BPdXdyK2JlSnIxVzVBbWgwSnRST294?=
 =?utf-8?B?STZPaXRwdlVmazY2ak5zWldnanAxQnczVmRCNmcrdmRvcjAxTnR4aDFzMUtG?=
 =?utf-8?B?d2k2Yk1LWGpjaEVQQ3J2azFjYzYxeGxrRzA1aWYzNk9QcFJVUVhXK2wxY2Vx?=
 =?utf-8?B?cERwcERrOHlNSzV0dHo4VmM3bFJ3Y1JBaGszL0VYbEhzeDFGKzZlR3pKd2tt?=
 =?utf-8?B?bUE2TURWL09wVnByVjhzdVlZVElYT1VaellWTXdVbjlQMTNPdlVaam9Oc054?=
 =?utf-8?B?QUMrL1RGbUc2SFlVb1JFU2VHUGpoSHEvMWI0ZDlOLzZHNFNPaEhpRTJpK29R?=
 =?utf-8?B?V2hpcHZSRXdiZUlVODNjWFpyTjhzaVYwZjRqRm1RWWJDRWtuOGhIVkFFZUZz?=
 =?utf-8?B?UWd0WHYzR2F0WTlsTEFaamJIaXp5ZVkyRVdvMFVZd1I3OWtYeGNLQzBsanFN?=
 =?utf-8?B?dVI3b3IxVTd5MFVyUm5IL3VDT0RWeDdhVXhnK0JTTXF6cE1yWFJKOVFNZDBo?=
 =?utf-8?B?TTNLRjNud1hwQllHOTFEbzU3MUFGa3dCTmgzdmFwcWFDS1NjTExRVXBzM1hX?=
 =?utf-8?B?TzNzeDhCSnBYNW9rd01OellCOFQ1a3ZwREV3anJJMnh2WWVNR2UybU83azBY?=
 =?utf-8?B?aXJUMXArUjVPemxEWEVVclI5elRLZkVhV3hsMmE4MDVMd2gvdEVwZVo1TVhG?=
 =?utf-8?B?SG5XRkVnQlVIUTN0aEl1Vk1lbHJvcUx5SnArQjgxOGM0bDRRck5RZ2Z6YzJ4?=
 =?utf-8?B?QWgwejkyWTR6eUNjYnFxY3lRK2dlVGgvd0dsaTE4TTl3aE4rTTVjMFVQc1NW?=
 =?utf-8?B?UzdrRHllRG90VW9mcnhrWDFrUG52OE1Zb1VrWG9SaG0yTHBUelJXcElOdkwy?=
 =?utf-8?B?RWJZa05tRmdtSlRjaEVEUVFiS3NCV0hmWk5CZVZmeUp6ekhSZ2h4NjBEeDZ3?=
 =?utf-8?B?K3JzanVrZFZIM3lWYThWaHRNcDFIZVgxTXk2WVFEWDRnOG5vMHhIMlp3cDAy?=
 =?utf-8?B?c3AzTU5nUVZTdGYveTNIdDJTWDZObTROTkdBd1hva3hqa1NTOWxYUGJid2Vj?=
 =?utf-8?B?a3lER0NGQ3VXekN6U09NS0lQK1dqNnJYbzZEQlF6K0R2Nkg2blBJWFhRbTIv?=
 =?utf-8?B?c0VNMVZnd2pZdUJYN1JkL0FJMkpVaTJaK0ZYOHY4YklLeG1BV0Y2Z1RLRm1Y?=
 =?utf-8?B?dWUwUHd3THRMTVBMQks0eW51ZmdYVkJqTjBubCtLT2ZuaWFNcFFzVUMzOENW?=
 =?utf-8?B?TWJxamZvQ04wWkVTU2ozU0htWSt1dVJ5c0hOQU9vOWk3RmZqQ2RwZmFmbnd4?=
 =?utf-8?B?RWdPeEQxWWl0T09aZDRtRUkrckJZUVJ2R1M1VGZ5VCtsRVhFUjM4RDBiczBj?=
 =?utf-8?B?SzFLTzN1a3ZhenNGRVBycllUMHlJd1pnaWdlbFBVd0RUWXpEY1NKTGRRYVdJ?=
 =?utf-8?B?amxISUxsUFNEVE1QU1FtQUl3WG9JR0kramNFSFNjUjAzbTBiWURmdUljSlhw?=
 =?utf-8?B?dHRqYVJ5bnZkZTB2Z0hTVmFkTTZhTkJxU0s1NGFZRjRPTlY0U0NaRmsxL3JS?=
 =?utf-8?B?NkxPcW1oL2gzcFNJZ3JKTExVTTE0Z2Q1M2xFRlFMaFNUeTdwUGpuS3NHNStT?=
 =?utf-8?B?TTBxNEV1T0drcElNYzBMelFhblBuRFcvYlBsT0wyUUpkeUo4SlcwNkZIUW9n?=
 =?utf-8?Q?vp8xWQIaCm1S14vy0R/yHrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2C83FEA164064469CE44E8672DC298D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a22a9c1c-76c2-4551-04e9-08da9a0eee5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 07:16:54.5130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hkal8Wcd/Nko3NELdWWSdxfbSDnxjXmOqlqs8aHT6D71X4kzyJNNS/viz1ulaHO2LOuC/ZheXB+HxkV2RPavhJX038a05bjtG73xMzUDSGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1578
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMDg6NDksIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCAyMDIyLTA5LTE5IGF0IDA2OjA0ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4gV2l0aCBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gsIHRoaXMgcGF0Y2hlcyBjYXVzZXMg
YSAxNSUgdGltZQ0KPj4gaW5jcmVhc2UNCj4+IGZvciBhY3RpdmF0aW9uL2RlYWN0aXZhdGlvbiBv
ZiBmdHJhY2UuDQo+IA0KPiBJdCdzIHBvc3NpYmxlIHRoYXQgbmV3IGFsaWdubWVudCBjaGVjayBp
cyB0aGUgY2F1c2UuIEknbGwgc2VlDQo+IA0KPiANCj4+IFdpdGhvdXQgQ09ORklHX1NUUklDVF9L
RVJORUxfUldYLCBpdCBkb2Vzbid0IGJ1aWxkLg0KPiANCj4gWXVwLCBmaXhlZCBmb3IgdjINCj4g
DQo+Pj4gK3N0YXRpYyBpbnQgX19wYXRjaF90ZXh0KHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNy
Yywgc2l6ZV90IHNpemUsDQo+Pj4gYm9vbCBpc19leGVjLCB2b2lkICpleGVjX2FkZHIpDQo+Pg0K
Pj4gSXMgJ3RleHQnIGEgZ29vZCBuYW1lID8gRm9yIG1lIHRleHQgbWVhbiBleGVjdXRhYmxlIGNv
ZGUuIFNob3VsZCBpdA0KPj4gYmUNCj4+IF9fcGF0Y2hfbWVtb3J5KCkgPw0KPiANCj4gV2VsbCBw
YXRjaGluZyByZWd1bGFyIG1lbW9yeSBpcyBqdXN0IGEgbm9ybWFsIHN0b3JlLiBUZXh0IHRvIG1l
IGltcGxpZXMNCj4gaXRzIG5vbi13cml0ZWFibGUuIFRob3VnaCBfX3BhdGNoX21lbW9yeSB3b3Vs
ZCBiZSBmaW5lLg0KPiANCj4+IFdoeSBwYXNzIHNyYyBhcyBhIHZvaWQgKiA/IFRoaXMgZm9yY2Vz
IGRhdGEgdG8gZ28gdmlhIHRoZSBzdGFjay4NCj4+IENhbid0DQo+PiB5b3UgcGFzcyBpdCBhcyBh
ICdsb25nJyA/DQo+IA0KPiBQcm9iYWJseSwgSSB3YXNuJ3QgYXdhcmUgdGhhdCBpdCB3b3VsZCBt
YWtlIGEgZGlmZmVyZW5jZS4gSSBwcmVmZXINCj4gcG9pbnRlcnMgaW4gZ2VuZXJhbCBmb3IgdGhl
aXIgc2VtYW50aWMgbWVhbmluZywgYnV0IHdpbGwgY2hhbmdlIGlmIGl0DQo+IGFmZmVjdHMgcGFy
YW0gcGFzc2luZy4NCj4gDQo+Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKHZpcnRfdG9fcGZuKGRlc3Qp
ICE9IHZpcnRfdG9fcGZuKGRlc3QgKyBzaXplIC0gMSkpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAtRUZBVUxUOw0KPj4NCj4+IFdoeSBkbyB5b3UgbmVlZCB0aGF0
IG5ldyBjaGVjayA/DQo+IA0KPiBJZiB0aGUgcGF0Y2ggY3Jvc3NlcyBhIHBhZ2UgYm91bmRhcnkg
dGhlbiBsZXR0aW5nIGl0IGhhcHBlbiBpcw0KPiB1bnByZWRpY3RhYmxlLiBUaG91Z2ggcGVyaGFw
cyB0aGlzIHJlcXVpcmVtZW50IGNhbiBqdXN0IGJlIHB1dCBhcyBhDQo+IGNvbW1lbnQsIG9yIHJl
cXVpcmUgdGhhdCBwYXRjaGVzIGJlIGFsaWduZWQgdG8gdGhlIHBhdGNoIHNpemUuDQoNCldoeSB3
b3VsZCBpdCBiZSB1bnByZWRpY3RhYmxlID8gT25seSBvbmUgcGFnZSBpcyBtYXBwZWQuIElmIGl0
IGNyb3NzZXMgDQp0aGUgYm91bmRhcnksIF9fcHV0X2tlcm5lbF9ub2ZhdWx0KCkgd2lsbCBmYWls
IGluIGEgY29udHJvbGVkIG1hbm5lci4NCkkgc2VlIG5vIHBvaW50IGluIGRvaW5nIHRoZSBjaGVj
ayBiZWZvcmUgZXZlcnkgd3JpdGUuDQoNClJlcXVpcmluZyBhbiBhbGlnbm1lbnQgdG8gdGhlIHBh
dGNoIHNpemUgbWF5IGJlIHByb2JsZW1hdGljIHdoZW4gDQpwYXRjaGluZyBwcmVmaXhlZCBpbnN0
cnVjdGlvbnMgKDggYnl0ZXMpLiBBbGx0aG91Z2ggdGhleSBhcmUgZ2FyYW50aWVkIA0KdG8gbGll
IGluIGEgc2luZ2xlIGNhY2hlIGxpbmUgaGVuY2UgYSBzaW5nbGUgcGFnZSwgdGhleSBhcmUgbm90
IA0KZ2FyYW50aWVkIHRvIGJlIGFsaWduZWQgdG8gbW9yZSB0aGFuIDQgYnl0ZXMuDQoNCkFuZCB3
aGlsZSB5b3UgYXJlIHRoaW5raW5nIGFib3V0IGFsaWdubWVudCwgZG9uJ3QgZm9yZ2V0IHRoYXQg
ZGNic3QgYW5kIA0KaWNiaSBhcHBseSBvbiBhIGdpdmUgY2FjaGVsaW5lLiBJZiB5b3VyIG1lbW9y
eSBjcm9zc2VzIGEgY2FjaGVsaW5lIHlvdSANCm1heSBoYXZlIGEgcHJvYmxlbS4NCg0KPiANCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSA4Og0KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19wdXRfa2VybmVsX25vZmF1bHQo
ZGVzdCwgc3JjLCB1NjQsDQo+Pj4gZmFpbGVkKTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPj4NCj4+IElzIGNhc2UgOCBuZWVkZWQg
Zm9yIFBQQzMyID8NCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHBhcnRpY3VsYXIgbmVlZCBmb3IgaXQs
IGJ1dCB0aGUgdW5kZXJseWluZw0KPiBfX3B1dF9rZXJuZWxfbm9mYXVsdCBpcyBjYXBhYmxlIG9m
IGl0IHNvIEkgaW5jbHVkZWQgaXQuDQoNCldlbGwsIG5vdCBpbmNsdWRpbmcgaXQgd2lsbCBhbGxv
dyB5b3UgdG8gcGFzcyB0aGUgc291cmNlIGFzIGEgJ2xvbmcnIGFzIA0KbWVudGlvbm5lZCBhYm92
ZS4NCg0KPiANCj4+PiArwqDCoMKgwqDCoMKgwqB9DQo+Pg0KPj4gRG8geW91IGNhdGNoIGl0IHdo
ZW4gc2l6ZSBpZiBub25lIG9mIDEsMiw0LDggPw0KPj4NCj4gDQo+IE5vdCB5ZXQuIFBlcmhhcHMg
SSBzaG91bGQgd3JhcCBwYXRjaF90ZXh0X2RhdGEgaW4gYSBtYWNybyB0aGF0IGNoZWNrcw0KPiB0
aGUgc2l6ZSB3aXRoIEJVSUxEX0JVR19PTj8gSSdkIHJhdGhlciBub3QgY2hlY2sgYXQgcnVudGlt
ZS4NCg0KTm90IG5lY2Vzc2FyaWx5IGEgbWFjcm8uIFdPdWxkIGJlIGJldHRlciBhcyBhIHN0YXRp
YyBfX2Fsd2F5c19pbmxpbmUgaW4gDQpjb2RlX3BhdGNoaW5nLmgNCg0KPiANCj4+PiArDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgYXNtICgiZGNic3QgMCwgJTA7IHN5bmMiIDo6ICJyIiAoZGVzdCkpOw0K
Pj4NCj4+IE1heWJlIHdyaXRlIGl0IGluIEM6DQo+Pg0KPj4gIMKgwqDCoMKgwqDCoMKgwqBkY2Jz
dChkZXN0KTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgbWIoKTsgLyogc3luYyAqLw0KPj4NCj4+PiAr
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKGlzX2V4ZWMpDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGFzbSAoImljYmkgMCwlMDsgc3luYzsgaXN5bmMiIDo6ICJyIiAoZXhlY19h
ZGRyKSk7DQo+Pg0KPj4gU2FtZSwgY2FuIGJlOg0KPj4NCj4+ICDCoMKgwqDCoMKgwqDCoMKgaWYg
KGlzX2V4ZWMpIHsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGljYmkoZXhl
Y19hZGRyKTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1iKCk7IC8qIHN5
bmMgKi8NCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlzeW5jKCk7DQo+PiAg
wqDCoMKgwqDCoMKgwqDCoH0NCj4+DQo+PiBPciBrZWVwIGl0IGZsYXQ6DQo+Pg0KPj4gIMKgwqDC
oMKgwqDCoMKgwqBpZiAoIWlzX2V4ZWMpDQo+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsNCj4+DQo+PiAgwqDCoMKgwqDCoMKgwqDCoGljYmkoZXhlY19hZGRyKTsN
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgbWIoKTsgLyogc3luYyAqLw0KPj4gIMKgwqDCoMKgwqDCoMKg
wqBpc3luYygpOw0KPj4NCj4+ICDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7DQo+IA0KPiBXaWxs
IHRyeSB0aGlzLg0KPiANCj4+PiArc3RhdGljIGludCBkb19wYXRjaF90ZXh0KHZvaWQgKmRlc3Qs
IGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IHNpemUsDQo+Pj4gYm9vbCBpc19leGVjKQ0KPj4+ICt7
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgaW50IGVycjsNCj4+PiArwqDCoMKgwqDCoMKgwqBwdGVfdCAq
cHRlOw0KPj4+ICvCoMKgwqDCoMKgwqDCoHUzMiAqcGF0Y2hfYWRkcjsNCj4+PiArDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgcHRlID0gc3RhcnRfdGV4dF9wYXRjaChkZXN0LCAmcGF0Y2hfYWRkcik7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgZXJyID0gX19wYXRjaF90ZXh0KHBhdGNoX2FkZHIsIHNyYywgc2l6
ZSwgaXNfZXhlYywgZGVzdCk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgZmluaXNoX3RleHRfcGF0Y2go
cHRlKTsNCj4+DQo+PiBXaHkgZG8geW91IG5lZWQgdG8gc3BsaXQgdGhpcyBmdW5jdGlvbiBpbiB0
aHJlZSBwYXJ0cyA/IEkgY2FuJ3Qgc2VlDQo+PiB0aGUNCj4+IGFkZGVkIHZhbHVlLCBhbGwgaXQg
ZG9lcyBpcyByZWR1Y2UgcmVhZGFiaWxpdHkuDQo+IA0KPiBJdCBtYWRlIGl0IG1vcmUgcmVhZGFi
bGUgdG8gbWUsIHNvIHRoZSBfX3BhdGNoX3RleHQgZGlkbid0IGdldCBidXJpZWQuDQo+IEl0IGFs
c28gbWFkZSBpdCBlYXNpZXIgdG8gZG8gdGhlIHJlZmFjdG9yaW5nLCBhbmQgcG90ZW50aWFsbHkg
YWRkIGNvZGUNCj4gcGF0Y2hpbmcgdmFyaWFudHMgdGhhdCB1c2UgdGhlIHBva2UgYXJlYSBidXQg
bm90IF9fcGF0Y2hfdGV4dC4gSSdsbA0KPiByZW1vdmUgaXQgZm9yIHYyIHRob3VnaCBnaXZlbiB0
aGlzIGlzIHRoZSBvbmx5IHVzZSByaWdodCBub3cuDQo+IA0KPj4gRGlkIHlvdSBjaGVjayB0aGUg
aW1wYWN0IG9mIGNhbGxpbmcgX190aGlzX2NwdV9yZWFkKCkgdHdpY2UgPw0KPiANCj4gSSB3YXNu
J3QgY29uY2VybmVkIGFib3V0IHBlcmZvcm1hbmNlLCBidXQgZ2l2ZW4gSSdsbCBtZXJnZSBpdCBi
YWNrDQo+IGFnYWluIGl0IHdpbGwgb25seSBiZSByZWFkIG9uY2UgaW4gdjIgYWdhaW4uDQo+IA0K
Pj4+ICt2b2lkICpwYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXpl
X3Qgc2l6ZSkNCj4+DQo+PiBXaGF0IGlzIHRoaXMgZnVuY3Rpb24gdXNlZCBmb3IgPw0KPj4NCj4g
DQo+IEJ1aWxkIGZhaWx1cmUgYXBwYXJlbnRseSA6KQ0KPiANCj4gSXQncyByZW1vdmVkIGluIHYy
Lg0KPj4=
