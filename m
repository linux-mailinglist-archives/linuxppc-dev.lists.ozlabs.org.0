Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076BC79F9AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:55:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SaypOvcf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmQ4K4wn7z3cN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=SaypOvcf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmQ3R2QXQz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 14:54:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWYlB5fAZAoH6tI8VOJVTupX6Gr9to5st5Lly3iHQr+35iuphX5GXIPqFw2SV3Bzlr1n96NX6JHld4btktJAEJAKWt9Pt3KzBmrQ1NZnxt6b1L8uvtZoxAH1Qfm5U+UtyEGD5uBtjWb3hyZIQyo+nZr/b23V/WdmmVMWzxr47CBZR3beSvYbus3ORGgE8ES7KXlpVlerLMy5+dyl6noY+NBXKFKIcW/N2ONUjp7H8xIHgFE0j5ajgr3U8WRjrhmpBfF7L68q4bmwuFwFZP/Jg/he2GHO1bOXIVlcWN0liEwNB3jshqg37c/Qlqzt3V7oD4C+/iYskcTntfB5BpRk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fd69TQ5kBzcTTEJTKlj1lCa1x42HJgnDFWxyGmr5AN0=;
 b=AlEzmgbr8Xa2DS1beA5eTqHze9NprGEZqRWdR3ATpng9cv0vpFyNCNJ55xx4jDIwxCw93JX/QTg0cJSHPEgEjOKgEEWhc1qXgvmPv5rT4Of13YgUNNelbMUFn2ipnScbI+qYAIfCpJdGAJ4ElXKvMmIfjdv/52ljs/Bi/eiKmlWkK5BB2ajw6U4AmSRyo5wvyxMPJXy6k02LA08/6//77+30IdQ79x1alq/aiLvXmnt7vowuHNhyEMp6gQp4n6z2Bk6gJ7VdsRhEJE2wA/3k4nXyKtV1fFqvp1zpAdGpy3nhSo7+SJrCR0eiieoD7hRKJenvaJvp+OV2d2lkLaMPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd69TQ5kBzcTTEJTKlj1lCa1x42HJgnDFWxyGmr5AN0=;
 b=SaypOvcf2YUGHhz6yiDoL2EsGFltS8EEfngYcVtUjRPOw2OE9Cc0AgbG4vquk9eyZBStPu3d8VEZ24fuZyOlNzky6qGkXc5xafQrRBgsNXM2IwTd/6iIuD3JB/jkOLoA6KNSWA4hFGeXw2XcCmfz1xIVmATu9TsG5RTusCpqFW/lVS2+KosGYfXlYvXbl8LxejkPYqf2vPM8PNHip5/1AWah+OF5Em5mSOEm65NbMsWEXNlyr52G2YB/BZ4Jyc4Ke9Xr4Xjs4ZKxXgBAMgFR/S5HHx4NSkgiLGaIUxYacyBKbTDuZG9XBu0oGREajDQ3V0QBIvmoPbr8CDmmoe5TIw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2406.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 04:54:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 04:54:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgIAAAdaAgAubzoCAAH9ogIAAiW+AgAAbyoCAAk71AA==
Date: Thu, 14 Sep 2023 04:54:17 +0000
Message-ID: <c0cbb50f-5b0c-7b67-447a-26d79093c532@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
 <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
 <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
 <20230912021147.57c85033@yea>
 <22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
 <20230912175941.0fca47bb@yea>
 <453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
In-Reply-To: <453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2406:EE_
x-ms-office365-filtering-correlation-id: d05fd218-06ae-439f-6163-08dbb4dea702
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  g2CcD1SnSzCz4ykSfQXqkzEAFOqNDARebRVonoxYzUMvCrqDYcNliqGRypqzT/ijycCbe75MFq38FJH028Owqez3wCXKn0QdsOcrL2mqc3RwyS4Lnxx70uzU/KZBu6rcOWrj/QfQfhTL5cjv+vB3Y6RT0/wSz/KmHmvIlSWKzpUFKvw0/pWwu4Oy6QqQ6O0zcxcWa8toOCkQEiiOypmhuzVAX8M5mUsjXs6RcXnF+SY/v8/MnJ5eiS0qYuKMz8gdKUxF81izp4xWjyQD6LCeLYRMehCX851ytB3bpbbk/FijY5Qsj0Eakgoz0BVFUde1KOPcWpJ/3nGo5vACBj9TS6OzmZI9JsDVIEDwfHMvmo1E9G9oXFf0fJrIH+A5qGbBSj/oQvG03d7uyU2oSyLBljngtgf7Asxng++PIQnS+RNZOH12XTEbob104cUOK/9Sk9LANQ98RViQAfez3Of4mSi3Orfm0isyKr3WulHGuH0UP5KeJLKot3BI/CCJjQaClJ+kyXvAL/SiZ3LES3naweVqOrPKF8i4UNFJzf7G1XFVG401FUALEJLoVWtMKvY0Gl6MjQFP3aXKVL406PSiHEeD3VtDGYqb6uT2AjgSoIx5nrJRazSL4MtFsdfdJqDn14bsccsnfKT6iCxL6O74afWMZ85IK0L5SAe2SpKZppkQZNxWzDHC8IJYsQQBi26A
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199024)(186009)(1800799009)(64756008)(26005)(38070700005)(38100700002)(66574015)(2616005)(122000001)(478600001)(36756003)(6512007)(6506007)(6486002)(71200400001)(76116006)(66946007)(6916009)(66556008)(66446008)(316002)(19627235002)(66476007)(41300700001)(91956017)(31686004)(83380400001)(8936002)(5660300002)(44832011)(4326008)(8676002)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NjhoMllld0FDdHBLVEtzRGR5R3JJQ1l3UUsrN1FBSVRrYllLRHY0M2NYZVJj?=
 =?utf-8?B?RGVzS1Z5SWIyaHdHKytZU2ZQaThxaGJWR0lDeWxNL0dZMUIyYnNhM1ZGZDly?=
 =?utf-8?B?ZmpFWnFIR29ZakxNczFkaWg1azREYUF2TUUveXI0dDRqLzZ5TldGYUJuMW9H?=
 =?utf-8?B?akF2REJRZTZRRnp3VXk5dVlGQjUwUGFuVUdtR0phUVhyK0oyVE5YRkhrb2Rl?=
 =?utf-8?B?Y3JuYm55am8wT3FNWW1EbWRiYUN1UklRRXhrRW91M2wxbmQvSG9pbjBZOVhJ?=
 =?utf-8?B?bGJ3V1V0VVF3QkphelVhZUV2cm1KWkYvWFErRUNUVmwzeDBTeWpQRWlRaS9o?=
 =?utf-8?B?MVVmMDJ5N2RYU1dJa21pQWRYNWlzSmk4SllRd1FIZkJiMlRxSnIvTXlIVXFM?=
 =?utf-8?B?dlRuRmdlalQ5enpwLzFRWlRabmFlcWZ4ajZVSHhXdHUvT1RuOEpQanRaYUMr?=
 =?utf-8?B?dnVUQ3QvWlFOVm1aT1V2S2tpMU5IWGVrdkhIUTkzSEUvUDYxSmVRZjJ4eWky?=
 =?utf-8?B?MWR0Ry9MdmRnV1R2T2tGYkpFV0JHR0xWOXM5SW5WM0NkRDR3TGw0ZHRQT2Ur?=
 =?utf-8?B?emhrOWNiTGkvL0FnN0x0Yi9PUlJvNnpHQkwwYTREcitybzFwMEFuR0NqS3JD?=
 =?utf-8?B?WmdLOFk1MUx5dDYrdGRhZ3VTczhZWjRpNWxrRTEyOW82KzdGQjdrcU1JN0Qr?=
 =?utf-8?B?Q2Zxam9RdjErZ1NLY2pzdVBWUzFiMEo1VG9SVmJUQkE5SkNDT01OUkljdUdH?=
 =?utf-8?B?OUppdkhrWDV0VmFhS3B1cWdzSHNDVkNjVmNBZlgvelNESkU3LzNpMmRlQ0FH?=
 =?utf-8?B?a0cwQWRoWDFPNFNSZjlwczMxekJCRW1tby8vQXBwMEJvdEJCMXoxcVB3VEYr?=
 =?utf-8?B?SXM1SnNnMkRpZ2hLUWZ6VXBMRlhaTk9xN2lHQ2hZRHJ3V0UvdlV5Mng1N3dF?=
 =?utf-8?B?WlNlOGxRS29uUVNwNks0NytPV3R0VjFYWThVbUJNc0tyL0p5QUV5VWozY3ly?=
 =?utf-8?B?TG8wSUd6clRDZU96cW91bWpTU2xwSUFwZVlXTmRhUVdQaU5lTU1lM0NuVUNj?=
 =?utf-8?B?MW9tdlJ4b3RhcGRNdCs5NHBNTDFDaWh1Y3YxSVNqOFB3cTFpemhYY1loYTdY?=
 =?utf-8?B?bGhmeWRuZlBNVEZaNVF2Qko2QmNlK2pEaXdUM2ZIQytyQ00yNGp3eWxlY1BD?=
 =?utf-8?B?M3pJbTlOSEFoakNvWG9aQlU3NTdIY2ZMSldjcVZXNk12VUVaNS9VYnlWZ21K?=
 =?utf-8?B?UVhFTUw3aExZV2liWHBXSkcxN0MwYXY1QWFQbktKOW5SVkJqS2NJNUs5bFl3?=
 =?utf-8?B?V3pCWllmWDhSc3BScHF0a2RjMTFSdklBL2xrR1FUUjl0OVBpZno0Q2xqcks1?=
 =?utf-8?B?NGpjaWNXU1ArdW1VWW9aOXB6dXVnTlhrZ1N0Q3VldTdZK1BMSmhkSS94OXNH?=
 =?utf-8?B?Unl4bENTQW9Jbmw2Uk5Va1hCTGFqLzdoTkZsVzdsQXZnYnBiaWM1ZUVNZnVt?=
 =?utf-8?B?ZXJuM09leDZIc3pjeWNaUWJKRG5ROXp1R1NUT2NYZU5sc21kSkdITjI5cnk4?=
 =?utf-8?B?UXVpaUpLL1FVT2NtamI0WGwrR1RlR2dRN3NpRkJQR1lROGQvTXBHSDdmOFNq?=
 =?utf-8?B?UDFRR2xiOW9vUEZ6UmtSaEM5cnhjTFcrVDNhZW9VdTFyeUdVMlprUE5FYTBW?=
 =?utf-8?B?b0FXSUpjYXRVT2M5L1BvVXBhK2N4OHp0RS9PWmYwRDJXSm0rYUZEV2Naejhv?=
 =?utf-8?B?eVdVTGFYNGtMOWg4RFFqU3Z0Q3VmZlFmaTlrMHVCWGJ3eGhndE41aVNoN2ds?=
 =?utf-8?B?TXovc0hCSm5YMjlxQWJmbXJlVGFJTEVsNnhaT1RIYVAwaEZFd3AxYk5RYTk3?=
 =?utf-8?B?Sld6WmxZLzZnR3JSbU9oMHBsRGNqQzd5VnNZRTNXWFR2dEpwZml6RjRCbkVw?=
 =?utf-8?B?YUdSajRvUHNaZ210TUhSdjhWQ1d2cDVLRG83R3AydmdUSVc1bk9XRWhrRzdN?=
 =?utf-8?B?SW83TCtKWjhkVFBQSlZLcG4wOXI2bjRzaHlWQnVzV25ySGFiaW5BK3E3ODR1?=
 =?utf-8?B?d1VlMTNRWE1tSzNqblRIcEdoajdpK3hwQlN5b0NCMlZvYTg1aXFybUVTWUtP?=
 =?utf-8?B?SFNDN1dtMDJpMnpOMGJCczlNc1pTc25reXdkaiszL1duUWpOZEdhbkdKMHVL?=
 =?utf-8?B?a2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F79747CD56E8A4438CE5FF9DAE499CD5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d05fd218-06ae-439f-6163-08dbb4dea702
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 04:54:18.0309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hl3iVMYK8LjGw3s3XMW8WG7Wv/RehbvsMKAJMXBrDEzOZ3zRD9wPKRCGEVHTMc1HlEwx73BoJCpajXnk5EyNBKTIqEqGSkGYFUXm62JDzNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2406
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA5LzIwMjMgw6AgMTk6MzksIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxMi8wOS8yMDIzIMOgIDE3OjU5LCBFcmhhcmQgRnVydG5lciBhIMOpY3Jp
dMKgOg0KPj4NCj4+IHByaW50azogYm9vdGNvbnNvbGUgW3VkYmcwXSBlbmFibGVkDQo+PiBUb3Rh
bCBtZW1vcnkgPSAyMDQ4TUI7IHVzaW5nIDQwOTZrQiBmb3IgaGFzaCB0YWJsZQ0KPj4gbWFwaW5f
cmFtOjEyNQ0KPj4gbW11X21hcGluX3JhbToxNjkgMCAzMDAwMDAwMCAxNDAwMDAwIDIwMDAwMDAN
Cj4+IF9fbW11X21hcGluX3JhbToxNDYgMCAxNDAwMDAwDQo+PiBfX21tdV9tYXBpbl9yYW06MTU1
IDE0MDAwMDANCj4+IF9fbW11X21hcGluX3JhbToxNDYgMTQwMDAwMCAzMDAwMDAwMA0KPj4gX19t
bXVfbWFwaW5fcmFtOjE1NSAyMDAwMDAwMA0KPj4gX19tYXBpbl9yYW1fY2h1bms6MTA3IDIwMDAw
MDAwIDMwMDAwMDAwDQo+PiBfX21hcGluX3JhbV9jaHVuazoxMTcNCj4+IG1hcGluX3JhbToxMzQN
Cj4+IGthc2FuX21tdV9pbml0OjEyOQ0KPj4ga2FzYW5fbW11X2luaXQ6MTMyIDANCj4+IGthc2Fu
X21tdV9pbml0OjEzNw0KPj4gaW9yZW1hcCgpIGNhbGxlZCBlYXJseSBmcm9tIGJ0ZXh0X21hcCsw
eDY0LzB4ZGMuIFVzZSBlYXJseV9pb3JlbWFwKCkgaW5zdGVhZA0KPj4gTGludXggdmVyc2lvbiA2
LjYuMC1yYzEtUE1hY0c0LWRpcnR5IChyb290QFQxMDAwKSAoZ2NjIChHZW50b28gMTIuMy4xX3Ay
MDIzMDUyNiBwMikgMTIuMy4xIDIwMjMwNTI2LCBHTlUgbGQgKEdlbnRvbyAyLjQwIHA3KSAyLjQw
LjApICM1IFNNUCBUdWUgU2VwIDEyIDE2OjUwOjQ3IENFU1QgMjAyMw0KPj4ga2FzYW5faW5pdF9y
ZWdpb246IGMwMDAwMDAwIDMwMDAwMDAwIGY4MDAwMDAwIGZlMDAwMDAwDQo+PiBrYXNhbl9pbml0
X3JlZ2lvbjogbG9vcCBmODAwMDAwMCBmZTAwMDAwMA0KPj4NCj4+DQo+PiBTbyBJIGdldCBubyAi
a2FzYW5faW5pdF9yZWdpb246IHNldGJhdCIgbGluZSBhbmQgZG9uJ3QgcmVhY2ggIktBU0FOIGlu
aXQgZG9uZSIuDQo+IA0KPiBBaCBvaywgbWF5YmUgeW91ciBDUFUgb25seSBoYXMgNCBCQVRzIGFu
ZCB0aGV5IGFyZSBhbGwgdXNlZCwgZm9sbG93aW5nDQo+IGNoYW5nZSB3b3VsZCB0ZWxsIHVzLg0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi9tbXUuYyBiL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3MzMi9tbXUuYw0KPiBpbmRleCA4NTA3ODNjZmE5YzcuLmJkMjY3Njdl
ZGNlNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczMyL21tdS5jDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi9tbXUuYw0KPiBAQCAtODYsNiArODYsNyBAQCBp
bnQgX19pbml0IGZpbmRfZnJlZV9iYXQodm9pZCkNCj4gICAgCQlpZiAoIShiYXRbMV0uYmF0dSAm
IDMpKQ0KPiAgICAJCQlyZXR1cm4gYjsNCj4gICAgCX0NCj4gKwlwcl9lcnIoIk5PIEZSRUUgQkFU
ICglZClcbiIsIG4pOw0KPiAgICAJcmV0dXJuIC0xOw0KPiAgICB9DQo+IA0KPiANCj4gT3IgeW91
IGhhdmUgOCBCQVRzIGluIHdoaWNoIGNhc2UgaXQncyBhbiBhbGlnbm1lbnQgcHJvYmxlbSwgeW91
IG5lZWQgdG8NCj4gaW5jcmVhc2UgQ09ORklHX0RBVEFfU0hJRlQgdG8gMjMsIGZvciB0aGF0IHlv
dSBuZWVkIENPTkZJR19BRFZBTkNFRCBhbmQNCj4gQ09ORklHX0RBVEFfU0hJRlRfQk9PTA0KPiAN
Cj4gQnV0IHJlZ2FyZGxlc3Mgb2YgdGhhdCB0aGVyZSBpcyBhIHByb2JsZW0gd2UgbmVlZCB0byBm
aW5kIG91dCwgYmVjYXVzZQ0KPiBpdCBzaG91bGQgd29yayB3aXRob3V0IEJBVHMuDQo+IA0KPiBB
cyB0aGUgQkFUcyBhbGxvY2F0aW9uIGZhaWxzLCBpdCBmYWxscyBiYWNrIHRvIDoNCj4gDQo+IAlw
aHlzID0gbWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShrX2VuZCAtIGtfc3RhcnQsIFBBR0VfU0la
RSwgMCwNCj4gCQkJCQkJIE1FTUJMT0NLX0FMTE9DX0FOWVdIRVJFKTsNCj4gCQlpZiAoIXBoeXMp
DQo+IAkJCXJldHVybiAtRU5PTUVNOw0KPiAJfQ0KPiANCj4gCXJldCA9IGthc2FuX2luaXRfc2hh
ZG93X3BhZ2VfdGFibGVzKGtfc3RhcnQsIGtfZW5kKTsNCj4gCWlmIChyZXQpDQo+IAkJcmV0dXJu
IHJldDsNCj4gDQo+IAlmb3IgKGtfY3VyID0ga19zdGFydDsga19jdXIgPCBrX2VuZDsga19jdXIg
Kz0gUEFHRV9TSVpFKSB7DQo+IAkJcG1kX3QgKnBtZCA9IHBtZF9vZmZfayhrX2N1cik7DQo+IAkJ
cHRlX3QgcHRlID0gcGZuX3B0ZShQSFlTX1BGTihwaHlzICsga19jdXIgLSBrX3N0YXJ0KSwgUEFH
RV9LRVJORUwpOw0KPiANCj4gCQlfX3NldF9wdGVfYXQoJmluaXRfbW0sIGtfY3VyLCBwdGVfb2Zm
c2V0X2tlcm5lbChwbWQsIGtfY3VyKSwgcHRlLCAwKTsNCj4gCX0NCj4gCWZsdXNoX3RsYl9rZXJu
ZWxfcmFuZ2Uoa19zdGFydCwga19lbmQpOw0KPiAJbWVtc2V0KGthc2FuX21lbV90b19zaGFkb3co
c3RhcnQpLCAwLCBrX2VuZCAtIGtfc3RhcnQpOw0KPiANCj4gDQo+IFdoaWxlIHRoZSBfX3dlYWsg
ZnVuY3Rpb24gdGhhdCB5b3UgY29uZmlybWVkIHdvcmtpbmcgaXM6DQo+IA0KPiAJcmV0ID0ga2Fz
YW5faW5pdF9zaGFkb3dfcGFnZV90YWJsZXMoa19zdGFydCwga19lbmQpOw0KPiAJaWYgKHJldCkN
Cj4gCQlyZXR1cm4gcmV0Ow0KPiANCj4gCWJsb2NrID0gbWVtYmxvY2tfYWxsb2Moa19lbmQgLSBr
X3N0YXJ0LCBQQUdFX1NJWkUpOw0KPiAJaWYgKCFibG9jaykNCj4gCQlyZXR1cm4gLUVOT01FTTsN
Cj4gDQo+IAlmb3IgKGtfY3VyID0ga19zdGFydCAmIFBBR0VfTUFTSzsga19jdXIgPCBrX2VuZDsg
a19jdXIgKz0gUEFHRV9TSVpFKSB7DQo+IAkJcG1kX3QgKnBtZCA9IHBtZF9vZmZfayhrX2N1cik7
DQo+IAkJdm9pZCAqdmEgPSBibG9jayArIGtfY3VyIC0ga19zdGFydDsNCj4gCQlwdGVfdCBwdGUg
PSBwZm5fcHRlKFBIWVNfUEZOKF9fcGEodmEpKSwgUEFHRV9LRVJORUwpOw0KPiANCj4gCQlfX3Nl
dF9wdGVfYXQoJmluaXRfbW0sIGtfY3VyLCBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIGtfY3VyKSwg
cHRlLCAwKTsNCj4gCX0NCj4gCWZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uoa19zdGFydCwga19lbmQp
Ow0KPiANCj4gDQo+IEknbSBoYXZpbmcgaGFyZCB0aW1lIHRvIHVuZGVyc3RhbmQgd2hhdCdzIGNv
dWxkIGJlIHdyb25nIGF0IHRoZSBmaXJzdCBwbGFjZS4NCj4gDQo+IENvdWxkIHlvdSB0cnkgZm9s
bG93aW5nIGNoYW5nZToNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4v
Ym9vazNzXzMyLmMNCj4gYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vYm9vazNzXzMyLmMNCj4gaW5k
ZXggOTk1NGI3YTNiN2FlLi5lMDRmMjE5MDhjNmEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9tbS9rYXNhbi9ib29rM3NfMzIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vYm9v
azNzXzMyLmMNCj4gQEAgLTM4LDcgKzM4LDcgQEAgaW50IF9faW5pdCBrYXNhbl9pbml0X3JlZ2lv
bih2b2lkICpzdGFydCwgc2l6ZV90IHNpemUpDQo+IA0KPiAgICAJaWYgKGtfbm9iYXQgPCBrX2Vu
ZCkgew0KPiAgICAJCXBoeXMgPSBtZW1ibG9ja19waHlzX2FsbG9jX3JhbmdlKGtfZW5kIC0ga19u
b2JhdCwgUEFHRV9TSVpFLCAwLA0KPiAtCQkJCQkJIE1FTUJMT0NLX0FMTE9DX0FOWVdIRVJFKTsN
Cj4gKwkJCQkJCSBNRU1CTE9DS19BTExPQ19BQ0NFU1NJQkxFKTsNCj4gICAgCQlpZiAoIXBoeXMp
DQo+ICAgIAkJCXJldHVybiAtRU5PTUVNOw0KPiAgICAJfQ0KPiANCj4gQW5kIGFsc28gdGhhdCBv
bmU6DQo+IA0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMy
LmMNCj4gYi9hcmNoL3Bvd2VycGMvbW0va2FzYW4vaW5pdF8zMi5jDQo+IGluZGV4IGE3MDgyOGE2
ZDkzNS4uYmMxYzA3NTQ4OWY0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0va2FzYW4v
aW5pdF8zMi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMNCj4gQEAg
LTg0LDYgKzg0LDkgQEAga2FzYW5fdXBkYXRlX2Vhcmx5X3JlZ2lvbih1bnNpZ25lZCBsb25nIGtf
c3RhcnQsDQo+IHVuc2lnbmVkIGxvbmcga19lbmQsIHB0ZV90IHB0ZSkNCj4gICAgew0KPiAgICAJ
dW5zaWduZWQgbG9uZyBrX2N1cjsNCj4gDQo+ICsJaWYgKGtfc3RhcnQgPT0ga19lbmQpDQo+ICsJ
CXJldHVybjsNCj4gKw0KPiAgICAJZm9yIChrX2N1ciA9IGtfc3RhcnQ7IGtfY3VyICE9IGtfZW5k
OyBrX2N1ciArPSBQQUdFX1NJWkUpIHsNCj4gICAgCQlwbWRfdCAqcG1kID0gcG1kX29mZl9rKGtf
Y3VyKTsNCj4gICAgCQlwdGVfdCAqcHRlcCA9IHB0ZV9vZmZzZXRfa2VybmVsKHBtZCwga19jdXIp
Ow0KPiANCj4gDQo+IA0KDQpJIHRlc3RlZCB0aGUgdHdvIHZtbGludXggeW91IHNlbnQgbWUgb2Zm
bGlzdCwgdGhleSBib3RoIHN0YXJ0IHdpdGhvdXQgDQpwcm9ibGVtIG9uIFFFTVUuDQoNClJlZ2Fy
ZGluZyB0aGUgdXNlIG9mIEJBVHMsIGluIGZhY3QgYSBzaGlmdCBvZiAyMyBpcyBzdGlsbCBub3Qg
ZW5vdWdoIHRvIA0KZ2V0IGZyZWUgQkFUcyBmb3IgS0FTQU4uIEJ1dCBhdCBsZWFzdCBpdCBhbGxv
d3MgeW91IHRvIG1hcCBhbGwgbGluZWFyIA0KbWVtIHdpdGggQkFUUyB3aGVyZWFzIGEgc2hpZnQg
b2YgMjIgd291bGQgcmVxdWlyZSA5IEJBVHMgOg0KDQpXaXRoIHNoaWZ0IDIyIHlvdSBoYXZlIEJB
VHMgd2l0aCBzaXplIDogNCs0KzgrMTYrMzIrNjQrMTI4KzI1NisyNTYNCldpdGggc2hpZnQgMjMg
eW91IGhhdmUgQkFUcyB3aXRoIHNpemUgOiA4KzgrMTYrMzIrNjQrMTI4KzI1NisyNTYNCg0KU28g
bGV0cyBmb3JnZXQgdGhhdCBmb3IgdGhlIG1vbWVudCwgYWxsdGhvdWdodCB5b3UgbWF5IHRyeSB3
aXRoIA0KQ09ORklHX1NUUklDVF9LRVJORUxfUldYLCBpbiB0aGF0IGNhc2UgeW91IHNob3VsZCBo
YXZlIGVub3VnaCBCQVRzLg0KDQpCdXQgbGV0cyB0cnkgdG8gcmVmb2N1cyBvbiB0aGUgcmVhbCBw
cm9ibGVtLg0KDQpJbiB5b3VyIGxhc3QgbWFpbCB5b3Ugc2F5IHlvdSB0cmllZCB3aXRoIGFsbCBw
YXRjaGVzLiBEaWQgaXQgaW5jbHVkZSB0aGUgDQp0d28gYWJvdmUgY2hhbmdlcyA/DQoNCklmIG5v
dCBjYW4geW91IHBlcmZvcm0gdGhlIHRlc3RzIHdpdGggdGhvc2UgdHdvIGNoYW5nZXMgaW4gYWRk
aXRpb24sIA0KZmlyc3Qgb25lIGJ5IG9uZSB0aGVuIGJvdGggdG9nZXRoZXIgZGVwZW5kaW5nIG9u
IHRoZSByZXN1bHQgPw0KDQpNYW55IHRoYW5rcyBmb3IgeW91ciBoZWxwIGFuZCBwZXJzZXZlcmFu
Y2UNCkNocmlzdG9waGUNCg==
