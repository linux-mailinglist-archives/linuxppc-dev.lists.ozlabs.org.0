Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FF544742
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJdrZ6gSBz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 19:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bTcZ5SLN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::614; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bTcZ5SLN;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJdqm39vsz3bk9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 19:20:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SquZIvcuu6P6HHJVfCfQ3paZyJPVk6bBuUB93lhU9k+pc/Qy5nt/M3ENQq266XHcLyG7HQNpO6BoGLVbbZhZHru4EXwqw22WJnQalEY52i3L09FwkwytbhevgwxM3PzFd4g0yA+xwOgJYOaktUgMsqjFIEFXRiB9IYzOZjD9YhamvzFZh2uD9WSUdpfI5bhSCnGaTbAN+0Rq63HLT9KgUWqot5UI3Iqj0ucWwLORJZvXVdR2xQ4Y8jzjuugWgoSaGvOHovpbuIwX7Pog2dMBY6z0E+/7OMiqb3omsGsU7+vy23s2O5w04pmBZgCY0WQ/eN/RMxoOCgwsb29dtrgsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzLHf4v7aYBL5dtqLaie2T0BIj/FtCo+Dp5qoI33Vx8=;
 b=UptuCtGZXxFOZ5u8ZkMRjHo+WGWt2gt9P0vrmsMlqGmIo5p6rJdoQQBbntiiWJHavBKjbeTBDMLSPksTztMcFs7V3TnbyjayWW2mYjvF5b8G+uiIA+eSZ6kwX09S1a1Wy4qqN/N9LlRzg1orSCgjB12OjNmGRohyqEt02zuNcZnKWV6N8jNMoGqd7zyORv14xGZbHqal2/MMVw8kgfezGDkrDztg2AkNF+9ur5uAQm2ROpgHs60JTOhHM2WqbNUfyALWVr1qZiLqWXJbOhZ2OazQiJaae7Ok0U8xLeM7S59Cinot2b+Xjw+5ghp09Ua1a/Zk7mUJF/gKs4iQ8W/wbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzLHf4v7aYBL5dtqLaie2T0BIj/FtCo+Dp5qoI33Vx8=;
 b=bTcZ5SLN+jpG+NCt1CanEVWpwwHkVNRgeGwfu14vfiP+3OPgRQGN0BA/UBPGbGlDw6jqvxdJoYyhrWri6tyfXjE4LdCIgynV0snszBfOWDVzwkJke0WUXgumc3+nOYX63u1EFa5qs2LZYk4SpfmLmZmF3hZOhqa0nMU/dyXklzGfP8ltOQ6pZtJ671w8611rHOZC5RvHn6NzosgrAl2ceVzdtGmCdQTdkNOEAYorTh6/+woFYx8Tq5EZWG/DkhE+TYSPpXe2QVX4QytIBKys2Q/qpMIXqRgqrdFhx8NK82VUg/ChzSUFCd2PhHrSTu1FIczozSmi8SQT+NjWJZQ53g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3932.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 09:20:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 09:20:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Ariel Miculas
	<Ariel.Miculas@belden.com>
Subject: Re: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Topic: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Index: AQHYe+IpqvB83nD51k26RI1bQJ0tdg==
Date: Thu, 9 Jun 2022 09:20:30 +0000
Message-ID: <2c15d259-b2fc-44b8-75fe-f5c4fea6c009@csgroup.eu>
References: <20220602094746.262360-1-ariel.miculas@belden.com>
 <878rqfpb5f.fsf@mpe.ellerman.id.au>
 <PH0PR18MB50697FF9DE4A241F3F498F2080DE9@PH0PR18MB5069.namprd18.prod.outlook.com>
 <87o7z5ono9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7z5ono9.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad3030b-6d62-4493-a0b3-08da49f94c72
x-ms-traffictypediagnostic: PR0P264MB3932:EE_
x-microsoft-antispam-prvs:  <PR0P264MB3932D9EE950C4778F74F6424EDA79@PR0P264MB3932.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0eKPy5zPnX6N+nF9zZZpcEwDAOLyhSfguoS+xUAAWTttge3k/pqzVSsb63wOuUFj7cGm/lPWOp+7zmoRLlbAF8Kipvu0Tq6VRgaKsxzVtv7zSzhK9Eqm+zVMF/66OMiQI/OJSFGljzxxg4XxlPQKz5YssD5RCpKOMIDQd21X8/t8bTGnfiv7rtLBqyukzm7XNlnkUtePw5G7NQOGZerH/tB9QXYxZ1hqeHUcmYPunGNjbsWqrocKu8O+1sKfZ7LTwRRn12EOsGwHeWZ6SNKAzEwRuuysS5j9vWQipV4wT+lyGowKUPUHm+0lUyPMEEqA91+p+tN3n7jq/3mdFj+BNOMXNtyVwc+sBtBB5VhbOUI2dLHUeteMerTbXsAdc5sGCyMvOxs3JjnkOF7aDTV3PxSjFULVSozICko7Hm43WRmxog+UJaFT0ZWyNi1xG8Td3N+hteRj/p+tFHqlTkTP1loT7qXGA7DVb3QQ8vcHMIWhFI2m7NZpswATUs3BjMpJBHin28yC7LnEOrhHEvp0fji18Fo426r4xRf1tVs+JpEVrZDVdJs1uSnyuF2AHFFVON92rEqfVaw6gr7n3F+O/fVUuCLsQhh1Hb0ZpTZtOcYMApHJIHIZowFZ0p7mzPn4QYa7Rku+ul0uYQea5WOrmXy6GLks70TaDNdslxjNBWrDM5y3UMWC3azScP7xnURjRWWT+OLxfC4wSdbDOxW0/Xd8cUqRP8xoda1hTdA4MlDV2ns/beNWetZkvHynQwlFij/rKjkSUdD7Dq2nJLSrUWNZd4dy7pgiISeu6Q+Ee2DRIbNb8Mgjz7rZxQt3yTJBQrvGy3Owcdnk4ztzcn1cWWN7BDqQIJCwibVPh10FerXQ6d2j3/oQf4+T0uKqWxguDwupdhkwf9WtgpFfK5/r0g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(2906002)(36756003)(6512007)(26005)(71200400001)(316002)(8676002)(86362001)(5660300002)(31696002)(31686004)(91956017)(4326008)(38070700005)(110136005)(6486002)(83380400001)(66946007)(76116006)(8936002)(966005)(66476007)(66556008)(64756008)(66574015)(122000001)(6506007)(66446008)(53546011)(38100700002)(2616005)(186003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YjdjRlZTaUhDeTlIc1UvMmlncCtMcG5GS0V3UWowMW1XNUlXNFFjTlFaREk2?=
 =?utf-8?B?MG4wWVNPZDlNemJVRDZzR1JhTzkySGtTc21NeVBkVVdhVlRMQVI1QzhDWXNZ?=
 =?utf-8?B?TTNUUnc4K254RGQ4ZmZjLzBSc0hEVUxhSUtFbWxnMzFoWk5vWTZUSGFMckd1?=
 =?utf-8?B?akFhUUN6QmJGTngwOXl5OUZoZnp1dmRkTDRlUHMwV2YwZ2Q2YWNYSjhkT3VH?=
 =?utf-8?B?UWxpQmhuTUJGR055NzE1TDdPL0hPYkFtd3VVa2FITGJWQ0VaSGsvZzBkbWxP?=
 =?utf-8?B?dnB5Yy9wamttUXkvQmttNjROZjgxN1V0bzBvNEU3ZEF3NDhLVVlyeGdTTWtt?=
 =?utf-8?B?aVI0dm8zaHZmSnpCVlF3aExSNDZ2citUMkZvSHpsMGJPNDR3Smpadm42eFJl?=
 =?utf-8?B?YmNVY1l3ZUpRM3RmK0pJWlpxSTJCek1VV0FTV1B1MjlXMVZnWVVkamhTbUMx?=
 =?utf-8?B?RDIwMjZKd2JkeENnU1llV3loNWh5Wmc1c2FqMmxjcW1GQ0tFNkwrTDdkSFo1?=
 =?utf-8?B?eTc1NktOekdTT3E2MmIzanZiOW52MWpmN0hDMWVOTXMrdGFETm1sMFRlWGg0?=
 =?utf-8?B?a1lxYm1sZExCMHJ3UDM3WGZTTGp6MmYyRmVLSnp4S0UxTnJUeElTVEdHdUY1?=
 =?utf-8?B?MkxyR3Vrd1FtZmtLM0h0WmxzRFVSTk41V1pzT0NzL1h2NWMzamNyTXhSS1Ez?=
 =?utf-8?B?YWNXRFdTWnNrWEEzOUd3MmpKTVVpendiOEZGeWo0R1V0ZWlFaVA0bEVCZFVz?=
 =?utf-8?B?QzhXOVVrMkc4czY1UVk5NVJ5WFRVRWRNTDJJNk1tWWl2YUwrV2ZNVFU0eCtD?=
 =?utf-8?B?U1FlM2lFcHErUzJZMHNiZ1k1Tyt1Vm00ZytqQnBKSjlGRzc0RXY5NC9jRThD?=
 =?utf-8?B?NFpDSzlvK0dUeGcwQkFiNUJEaHNCV3RTZUE2eGM4T0xwcXBXQXJpbnd5V2tB?=
 =?utf-8?B?d0VlZGNyRW5CN0R4Qkt0U09mYXdTOXVNRm1hQzdkMkJQQmVyWittSmdCZzFE?=
 =?utf-8?B?Qk5sdDBvRlBZZDEvWFBIQkR5Z3REUlhZUXdxZHBtWjB5aHh1SldtbXo1cjdx?=
 =?utf-8?B?YnAvczAwbjI1RVRueGRnbTJvV0RDSmU0d2hEdlh3cTY4Z0tXQWVVUTU0bTVo?=
 =?utf-8?B?MFVyZFFka2QzTU95ZmI3dFU3bnAraTc2YzlxempGbzVjQUdYTEk0eTdZYTJE?=
 =?utf-8?B?WFhWVktXTVZJQWdSSmZvWE14TXZpNVora1JkLzN0dUlCbTNDMVd5WEh2aUxF?=
 =?utf-8?B?NmdseXlHcGEyUTN1Wlp1My8zRHdpUG5tUUp5NlZoUEY1b1ZQSE1uWE9kbmY0?=
 =?utf-8?B?U3g0cU1NZmc2UWpQUnhoZE5yaHFZTWJwWjJTSnNXQ1pzRkJKREJFSHFqWWUv?=
 =?utf-8?B?cC9hQmZac1phSFBwQmQ3a0QrcWJNK2w1b2cyUkVPbG5xc1I4K0poc0puMm43?=
 =?utf-8?B?dXhHTGxpVFVnU3dKMU9wVmVmanFjYmc1cUliL2lPQkRrV1kveG02eWxFZXBj?=
 =?utf-8?B?M3B4MnpYSGdTaDZEMTBSazgvTEtEVlNDd0tLa0hoRzNWZUdyVlJRS3Zjd1d4?=
 =?utf-8?B?dEczUjJ3Vm1HQzBuRnVMT1RxejBORkMxb29vd3M1cENTRlZtUzJENVF3NFY0?=
 =?utf-8?B?UEFiNFlJQ1A0VWNtcHNybGZBZEJSOVRrLy9qMUhyZlVNRzNvV2R1czFXSlcz?=
 =?utf-8?B?MzFmTEJEQzI2R0gyam5Fa3RRd3Npc1g4L0FYWFE3eGQ2RWNLWmxPR3hWTnEy?=
 =?utf-8?B?ZVJ6SGtCeDZQRjJKU2NmVDJIdFdxZUlHUnBzdUJnVDB0WmVPVTc0dUxxUmdV?=
 =?utf-8?B?d0cveE5LcGdwMkdxSk1BZUQ2YXZ2bHdrUS9TQ0Q2YlZKeWxLS3dPVklaUE5C?=
 =?utf-8?B?L2xEcGFDNmlCMmdiNnovZGZ4dkU0eWRoZjlCSUtFVzZROUYyVDMwVWV6N1VJ?=
 =?utf-8?B?OGhTNGJKZDZ4REVTWDlzdmZFTUZRaDNWekNxUmRwZ2pieHhmdWFMdVpUWER4?=
 =?utf-8?B?Y3c2WEd3aUhBUDlVaktFc3JudmdIWTJPWUFXNjBPOHFhVTVOR2cvZVB6a1Rh?=
 =?utf-8?B?WWFYR1NjalhDQ0cxOU5KSzdEZ3ZIK3Y4SjBKa0VuamZBeDhpbWtNZDh4KzE1?=
 =?utf-8?B?aGU1OWQyQzdxYnpTZkxMRGFNS0lvVE4za1l4TWJ6YzIzbnZiOGlxT2lJa3cz?=
 =?utf-8?B?VFVlY3NISzg1cHVwYmQxL2tmdVdPMHorZmZzQ2hwaDhOZmlXTUxlbUFEc3pm?=
 =?utf-8?B?dFhNb2lubisrSkROUkp0ZGNBM0NaNkpKZTZ0aW5RUUhDWjhOUVAvSlZWKzVT?=
 =?utf-8?B?QkRIazFVSFYzWjZSZ0FRYkJneEFzQkNkNE55Y3BCVVZWc3A3aXBQMTc1aUUx?=
 =?utf-8?Q?c5Pd7J0NzqRZSCMMHa2pefn0kFyzKdxoxcG8H?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1D817380C3AE348BC5A66744FBAD988@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad3030b-6d62-4493-a0b3-08da49f94c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 09:20:30.3205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CPmZbieBKf4qAOTkBKE5tnBoOi1OWQdDIm66PmTPnGZXWwse1VpAebQ5dCZJZaz64JlbEvY14dvKlwX4o20HdT6UKScY3ne958aQ3wSrBtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3932
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

SGkgTWljaGFlbCwNCg0KTGUgMDYvMDYvMjAyMiDDoCAxNjo0NSwgTWljaGFlbCBFbGxlcm1hbiBh
IMOpY3JpdMKgOg0KPiBIaSBBcmllbCwNCj4gDQo+IEkndmUgYWRkZWQgQ2hyaXN0b3BoZSB0byBD
YyB3aG8gd29ya3Mgb24gcHBjMzIuDQoNCkkndmUgYWRkZWQgcG93ZXJwYyBsaXN0DQoNCj4gDQo+
IEkgaGF2ZW4ndCBhY3R1YWxseSByZXByb2R1Y2VkIHRoZSBjcmFzaCB3aXRoIGdkYnNlcnZlciwg
YnV0IEkgaGF2ZSBhDQo+IHRlc3QgY2FzZSB3aGljaCBzaG93cyB0aGUgYnVnLCBzbyBJJ3ZlIGJl
ZW4gYWJsZSB0byBjb25maXJtIGl0IGFuZA0KPiB0ZXN0IGEgZml4Lg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCBidXQgSSB3YW50ZWQgdG8gZml4IGl0IGRpZmZlcmVudGx5LiBDYW4geW91
IHRyeQ0KPiB0aGUgcGF0Y2ggYmVsb3cgYW5kIG1ha2Ugc3VyZSBpdCBmaXhlcyB0aGUgYnVnIGZv
ciB5b3U/DQo+IA0KPiBJJ3ZlIGFsc28gYXR0YWNoZWQgdGhlIHRlc3QgY2FzZSBJJ3ZlIGJlZW4g
dXNpbmcuDQo+IA0KPiBDaHJpc3RvcGhlIGFyZSB5b3UgYWJsZSB0byB0ZXN0IHRoZXNlIG9uIHNv
bWUgMzItYml0IG1hY2hpbmVzPyBJJ3ZlDQo+IHRlc3RlZCBpdCBpbiBxZW11IGFuZCBvbiBvbmUg
MzItYml0IG1hY2hpbmUgSSBoYXZlIGhlcmUsIGJ1dCBzb21lIG1vcmUNCj4gcmVhbCB0ZXN0aW5n
IHdvdWxkIGJlIGdvb2QuDQoNClllcyBJIHdpbGwgdGVzdCBpdCBidXQgbXkgQ1BVcyBoYXZlIG5v
IEZQVSBzbyBpdCB3aWxsIGJlIHdpdGggdGhlIGtlcm5lbCANCnNvZnR3YXJlIE1hdGggZW11bGF0
aW9uLiBCdXQgaXQgc2hvdWxkIG1ha2Ugbm8gZGlmZmVyZW5jZSBJIGd1ZXNzID8NCg0KQ2hyaXN0
b3BoZQ0KDQo+IA0KPiBJZiB0aGUgcGF0Y2ggd29ya3MgdGhlbiBJJ2xsIG5lZWQgdG8gZG8gbWFu
dWFsIGJhY2sgcG9ydHMgZm9yIHNldmVyYWwgb2YNCj4gdGhlIHN0YWJsZSBrZXJuZWxzLCBhbmQg
dGhlbiBvbmNlIHRob3NlIGFyZSByZWFkeSBJIHdpbGwgcHVibGlzaCB0aGUNCj4gcGF0Y2guDQo+
IA0KPiBjaGVlcnMNCj4gDQo+IA0KPiAtLS04PC0tLQ0KPiAgRnJvbSBlYWE5YTMyZmUzOGQ4NzIy
ZDJkYTg3NzM5NjUzMDkzNjU4MDVkNjZkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KPiBGcm9t
OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IERhdGU6IFR1ZSwgNyBK
dW4gMjAyMiAwMDozNDo1NiArMTAwMA0KPiBTdWJqZWN0OiBbUEFUQ0hdIHBvd2VycGMvMzI6IEZp
eCBvdmVycmVhZC9vdmVyd3JpdGUgb2YgdGhyZWFkX3N0cnVjdCB2aWENCj4gICBwdHJhY2UNCj4g
DQo+IFRoZSBwdHJhY2UgUEVFS1VTUi9QT0tFVVNSIChha2EgUEVFS1VTRVIvUE9LRVVTRVIpIEFQ
SSBhbGxvd3MgYSBwcm9jZXNzDQo+IHRvIHJlYWQvd3JpdGUgcmVnaXN0ZXJzIG9mIGFub3RoZXIg
cHJvY2Vzcy4NCj4gDQo+IFRvIGdldC9zZXQgYSByZWdpc3RlciwgdGhlIEFQSSB0YWtlcyBhbiBp
bmRleCBpbnRvIGFuIGltYWdpbmFyeSBhZGRyZXNzDQo+IHNwYWNlIGNhbGxlZCB0aGUgIlVTRVIg
YXJlYSIsIHdoZXJlIHRoZSByZWdpc3RlcnMgb2YgdGhlIHByb2Nlc3MgYXJlDQo+IGxhaWQgb3V0
IGluIHNvbWUgZmFzaGlvbi4NCj4gDQo+IFRoZSBrZXJuZWwgdGhlbiBtYXBzIHRoYXQgaW5kZXgg
dG8gYSBwYXJ0aWN1bGFyIHJlZ2lzdGVyIGluIGl0cyBvd24gZGF0YQ0KPiBzdHJ1Y3R1cmVzIGFu
ZCBnZXRzL3NldHMgdGhlIHZhbHVlLg0KPiANCj4gVGhlIEFQSSBvbmx5IGFsbG93cyBhIHNpbmds
ZSBtYWNoaW5lLXdvcmQgdG8gYmUgcmVhZC93cml0dGVuIGF0IGEgdGltZS4NCj4gU28gNCBieXRl
cyBvbiAzMi1iaXQga2VybmVscyBhbmQgOCBieXRlcyBvbiA2NC1iaXQga2VybmVscy4NCj4gDQo+
IFRoZSB3YXkgZmxvYXRpbmcgcG9pbnQgcmVnaXN0ZXJzIChGUFJzKSBhcmUgYWRkcmVzc2VkIGlz
IHNvbWV3aGF0DQo+IGNvbXBsaWNhdGVkLCBiZWNhdXNlIGRvdWJsZSBwcmVjaXNpb24gZmxvYXQg
dmFsdWVzIGFyZSA2NC1iaXQgZXZlbiBvbg0KPiAzMi1iaXQgQ1BVcy4gVGhhdCBtZWFucyBvbiAz
Mi1iaXQga2VybmVscyBlYWNoIEZQUiBvY2N1cGllcyB0d28NCj4gd29yZC1zaXplZCBsb2NhdGlv
bnMgaW4gdGhlIFVTRVIgYXJlYS4gT24gNjQtYml0IGtlcm5lbHMgZWFjaCBGUFINCj4gb2NjdXBp
ZXMgb25lIHdvcmQtc2l6ZWQgbG9jYXRpb24gaW4gdGhlIFVTRVIgYXJlYS4NCj4gDQo+IEludGVy
bmFsbHkgdGhlIGtlcm5lbCBzdG9yZXMgdGhlIEZQUnMgaW4gYW4gYXJyYXkgb2YgdTY0cywgb3Ig
aWYgVlNYIGlzDQo+IGVuYWJsZWQsIGFuIGFycmF5IG9mIHBhaXJzIG9mIHU2NHMgd2hlcmUgb25l
IGhhbGYgb2YgZWFjaCBwYWlyIHN0b3Jlcw0KPiB0aGUgRlBSLiBXaGljaCBoYWxmIG9mIHRoZSBw
YWlyIHN0b3JlcyB0aGUgRlBSIGRlcGVuZHMgb24gdGhlIGtlcm5lbCdzDQo+IGVuZGlhbm5lc3Mu
DQo+IA0KPiBUbyBoYW5kbGUgdGhlIGRpZmZlcmVudCBsYXlvdXRzIG9mIHRoZSBGUFJzIGRlcGVu
ZGluZyBvbiBWU1gvbm8tVlNYIGFuZA0KPiBiaWcvbGl0dGxlIGVuZGlhbiwgdGhlIFRTX0ZQUigp
IG1hY3JvIHdhcyBpbnRyb2R1Y2VkLg0KPiANCj4gVW5mb3J0dW5hdGVseSB0aGUgVFNfRlBSKCkg
bWFjcm8gZG9lcyBub3QgdGFrZSBpbnRvIGFjY291bnQgdGhlIGZhY3QNCj4gdGhhdCB0aGUgYWRk
cmVzc2luZyBvZiBlYWNoIEZQUiBkaWZmZXJzIGJldHdlZW4gMzItYml0IGFuZCA2NC1iaXQNCj4g
a2VybmVscy4gSXQganVzdCB0YWtlcyB0aGUgaW5kZXggaW50byB0aGUgIlVTRVIgYXJlYSIgcGFz
c2VkIGZyb20NCj4gdXNlcnNwYWNlIGFuZCBpbmRleGVzIGludG8gdGhlIGZwX3N0YXRlLmZwciBh
cnJheS4NCj4gDQo+IE9uIDMyLWJpdCB0aGVyZSBhcmUgNjQgaW5kZXhlcyB0aGF0IGFkZHJlc3Mg
RlBScywgYnV0IG9ubHkgMzIgZW50cmllcyBpbg0KPiB0aGUgZnBfc3RhdGUuZnByIGFycmF5LCBt
ZWFuaW5nIHRoZSB1c2VyIGNhbiByZWFkL3dyaXRlIDI1NiBieXRlcyBwYXN0DQo+IHRoZSBlbmQg
b2YgdGhlIGFycmF5LiBCZWNhdXNlIHRoZSBmcF9zdGF0ZSBzaXRzIGluIHRoZSBtaWRkbGUgb2Yg
dGhlDQo+IHRocmVhZF9zdHJ1Y3QgdGhlcmUgYXJlIHZhcmlvdXMgZmllbGRzIHRoYW4gY2FuIGJl
IG92ZXJ3cml0dGVuLA0KPiBpbmNsdWRpbmcgc29tZSBwb2ludGVycy4gQXMgc3VjaCBpdCBpcyBw
cm9iYWJseSBleHBsb2l0YWJsZS4NCj4gDQo+IEl0IGhhcyBhbHNvIGJlZW4gb2JzZXJ2ZWQgdG8g
Y2F1c2Ugc3lzdGVtcyB0byBoYW5nIG9yIG90aGVyd2lzZQ0KPiBtaXNiZWhhdmUgd2hlbiB1c2lu
ZyBnZGJzZXJ2ZXIsIGFuZCBpcyBwcm9iYWJseSB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzDQo+IHJl
cG9ydCB3aGljaCBjb3VsZCBub3QgYmUgZWFzaWx5IHJlcHJvZHVjZWQ6DQo+ICAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4cHBjLWRldi9kYzM4YWZlOS02Yjc4LWYzZjUtNjY2Yi05ODY5
MzllNDBmYzZAa2V5bWlsZS5jb20vDQo+IA0KPiBSYXRoZXIgdGhhbiB0cnlpbmcgdG8gbWFrZSB0
aGUgVFNfRlBSKCkgbWFjcm8gZXZlbiBtb3JlIGNvbXBsaWNhdGVkIHRvDQo+IGZpeCB0aGUgYnVn
LCBvciBhZGQgbW9yZSBtYWNyb3MsIGluc3RlYWQgYWRkIGEgc3BlY2lhbC1jYXNlIGZvciAzMi1i
aXQNCj4ga2VybmVscy4gVGhpcyBpcyBtb3JlIG9idmlvdXMgYW5kIGhvcGVmdWxseSBhdm9pZHMg
YSBzaW1pbGFyIGJ1Zw0KPiBoYXBwZW5pbmcgYWdhaW4gaW4gZnV0dXJlLiBOb3RlIHRoYXQgYmVj
YXVzZSAzMi1iaXQga2VybmVscyBuZXZlciBoYXZlDQo+IFZTWCBlbmFibGVkIHRoZSBjb2RlIGRv
ZXNuJ3QgbmVlZCB0byBjb25zaWRlciBUU19GUFJXSURUSC9PRkZTRVQgYXQgYWxsLg0KPiANCj4g
Rml4ZXM6IDg3ZmVjMDUxNGY2MSAoInBvd2VycGM6IFBUUkFDRV9QRUVLVVNSL1BUUkFDRV9QT0tF
VVNFUiBvZiBGUFIgcmVnaXN0ZXJzIGluIGxpdHRsZSBlbmRpYW4gYnVpbGRzIikNCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2My4xMysNCj4gUmVwb3J0ZWQtYnk6IEFyaWVsIE1pY3Vs
YXMgPGFyaWVsLm1pY3VsYXNAYmVsZGVuLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBF
bGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2Vy
bmVsL3B0cmFjZS9wdHJhY2UtZnB1LmMgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1mcHUuYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1mcHUuYw0KPiBpbmRleCA1ZGNhMTkzNjEzMTYu
LmY0MDY0MzZhMGY2YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wdHJhY2Uv
cHRyYWNlLWZwdS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1m
cHUuYw0KPiBAQCAtMTcsOSArMTcsMTMgQEAgaW50IHB0cmFjZV9nZXRfZnByKHN0cnVjdCB0YXNr
X3N0cnVjdCAqY2hpbGQsIGludCBpbmRleCwgdW5zaWduZWQgbG9uZyAqZGF0YSkNCj4gICANCj4g
ICAjaWZkZWYgQ09ORklHX1BQQ19GUFVfUkVHUw0KPiAgIAlmbHVzaF9mcF90b190aHJlYWQoY2hp
bGQpOw0KPiAtCWlmIChmcGlkeCA8IChQVF9GUFNDUiAtIFBUX0ZQUjApKQ0KPiAtCQltZW1jcHko
ZGF0YSwgJmNoaWxkLT50aHJlYWQuVFNfRlBSKGZwaWR4KSwgc2l6ZW9mKGxvbmcpKTsNCj4gLQll
bHNlDQo+ICsJaWYgKGZwaWR4IDwgKFBUX0ZQU0NSIC0gUFRfRlBSMCkpIHsNCj4gKwkJaWYgKElT
X0VOQUJMRUQoQ09ORklHX1BQQzMyKSkNCj4gKwkJCS8vIFRoZSAzMi1iaXQgcHRyYWNlIEFQSSBh
ZGRyZXNzZXMgdGhlIEZQUnMgYXMgMzItYml0IHdvcmRzDQo+ICsJCQkqZGF0YSA9ICgodTMyICop
Y2hpbGQtPnRocmVhZC5mcF9zdGF0ZS5mcHIpW2ZwaWR4XTsNCj4gKwkJZWxzZQ0KPiArCQkJbWVt
Y3B5KGRhdGEsICZjaGlsZC0+dGhyZWFkLlRTX0ZQUihmcGlkeCksIHNpemVvZihsb25nKSk7DQo+
ICsJfSBlbHNlDQo+ICAgCQkqZGF0YSA9IGNoaWxkLT50aHJlYWQuZnBfc3RhdGUuZnBzY3I7DQo+
ICAgI2Vsc2UNCj4gICAJKmRhdGEgPSAwOw0KPiBAQCAtMzksOSArNDMsMTMgQEAgaW50IHB0cmFj
ZV9wdXRfZnByKHN0cnVjdCB0YXNrX3N0cnVjdCAqY2hpbGQsIGludCBpbmRleCwgdW5zaWduZWQg
bG9uZyBkYXRhKQ0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfUFBDX0ZQVV9SRUdTDQo+ICAgCWZs
dXNoX2ZwX3RvX3RocmVhZChjaGlsZCk7DQo+IC0JaWYgKGZwaWR4IDwgKFBUX0ZQU0NSIC0gUFRf
RlBSMCkpDQo+IC0JCW1lbWNweSgmY2hpbGQtPnRocmVhZC5UU19GUFIoZnBpZHgpLCAmZGF0YSwg
c2l6ZW9mKGxvbmcpKTsNCj4gLQllbHNlDQo+ICsJaWYgKGZwaWR4IDwgKFBUX0ZQU0NSIC0gUFRf
RlBSMCkpIHsNCj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMyKSkNCj4gKwkJCS8vIFRo
ZSAzMi1iaXQgcHRyYWNlIEFQSSBhZGRyZXNzZXMgdGhlIEZQUnMgYXMgMzItYml0IHdvcmRzDQo+
ICsJCQkoKHUzMiAqKWNoaWxkLT50aHJlYWQuZnBfc3RhdGUuZnByKVtmcGlkeF0gPSBkYXRhOw0K
PiArCQllbHNlDQo+ICsJCQltZW1jcHkoJmNoaWxkLT50aHJlYWQuVFNfRlBSKGZwaWR4KSwgJmRh
dGEsIHNpemVvZihsb25nKSk7DQo+ICsJfSBlbHNlDQo+ICAgCQljaGlsZC0+dGhyZWFkLmZwX3N0
YXRlLmZwc2NyID0gZGF0YTsNCj4gICAjZW5kaWYNCj4gICA=
