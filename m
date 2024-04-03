Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746A89782C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 20:25:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=feFdmZMH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8tVB2vCRz3vbJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 05:25:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=feFdmZMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8tTF36Jjz3dgN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 05:25:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhW4+nmBLqqna4098qwL3tgPfjVq5VK4KLaRsevWBqgooMgmUT4BhNfXAB/ZCwslFIZM0JMScMTrKdH09LUZlCoE2YZKe/MsWsC+l/W0HmRiEDbpIL46MvVvEYOeczZJKtIt0udzM/766PG+x77iRc/Bo51+4lmV+we/sra7PY1wEKcC9mh4POHqcWJwPbZuYqsSa4/LBsVzP31x4L+Jn6IKqQbnqcczlSRe462XD9JwEZo+yQzg6pYK5WCAFam5YcQ3jlcHJz1ZYZWgpeJsuLRW1P3OSBvNB1CYsUOYpRY7vFLeSXtuF64l243MQpHyfXBf4XQUNXAnxBaG2zS49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTz+6hCXNIk4Jg+sE/i/CR2zBxILUFdtOCrBgDRiuxg=;
 b=JptbXlE1FnreEefHx8TR1xmBKmR80TD0unlrPsFvAH/b7ldB/yG3G7Qo/Wu7IacUblrc+r/+ivGUOt9hegmi17o6VlxTKXZtWZvUj+/2qqnLpTvObwzc6FkRHiK64T59qJ0PTpKZFRYt2TZOT8jCZYfCfyUEBzq7+VyYNo9sGM6aOXRND5Y5K5tlFuv+AE8/C25xqfcZJBEI9cCetlEuDBAIumex0MuxtzdmGcL+4DvTuO2rMiobP2FeppvEh71mkdWfxktn8NHNK66KbvO+8Q/RLiny2fMr27DI7jTZ7cbKWVlrjhE04pyvtvrTamSVusA0KBZigG9s4BNKGLDznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTz+6hCXNIk4Jg+sE/i/CR2zBxILUFdtOCrBgDRiuxg=;
 b=feFdmZMHE4Z/Rw/lkjLv3UMoJS//XjJok5YSDgAc2e4Jb95G6MwP+jIZV2QMamQlnxfI4EuJydTvihGIqFpGen2F1jfEFLpnJHI/e/yKYRR4VIcTHiBcLlCVAMfMOIExOGKzbD5Hz0LnuIlkw9bRAwwXwF3d2ZkyfMUsD22lzzBfFUeihxYIIRWkRjlTmt4tDbnNsNcqcrGLaQIHiZO0Zdin8i6gsE2xBsy+CWFYtf4v0+gjnELbS6+i8euCuE2ksdlYd0qJfG/M2RF3H6xiEThsGpkHw0Kc7pUq3d9YZ+RFha06HEuznKTdo+L6RP8p/fsnz7XnZtxMOQTFJ1WutQ==
Received: from PAZP264MB2991.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::13)
 by MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 18:24:38 +0000
Received: from PAZP264MB2991.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c605:a17e:814a:efab]) by PAZP264MB2991.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c605:a17e:814a:efab%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 18:24:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Topic: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Thread-Index:  AQHafsSUDf1gEqeQdEWjl7G6IxKzM7FIoteAgAAuSYCAAU5AAIABPcCAgAB1KACACxhWgA==
Date: Wed, 3 Apr 2024 18:24:38 +0000
Message-ID: <dee0b89b-8daf-4003-b26f-f612b14012e0@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325161919.GD6245@nvidia.com>
 <6e16e042-0143-4a52-b4b7-09cf0022bc3e@csgroup.eu>
 <20240326150118.GI6245@nvidia.com>
 <9703878c-c0b0-48ff-a356-d43e8f7391f3@csgroup.eu>
 <20240327165754.GM946323@nvidia.com>
In-Reply-To: <20240327165754.GM946323@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAZP264MB2991:EE_|MRZP264MB1750:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yiM03H3r3DDatlak8ZRejnMVseOt3U6/gzbWgLwmQ8s7/kaQG1Ot26e3Fw0ouT3RYtU3nbbFga6c6y+soaa7Fd0D01vYG5arV5hs/MaXdnEptLTSScej7Y7l9oMQAbAdiCzdPcVvF5vm0qJaRO9bAT5W2Get2DcC052Vih5Fmji6ozY/5aRf0i1kepDu3T91LtctQbm4c23amFZjSXOoqKk+fSUJw7QTesUSFSzDvmDV5DVftoS3la17p1HPHdPnv6PawGh7AaasM4MxWtlgvSZnkZCRSQj82949nT1cJ1zZPxoDfqrYv9n9P5cA2qg2wtt3m8qnCFU2SVliqXX9mmxIVRgK7wKwWPhlP1ZqyDebDWu+YyuSN5em/H6zJnI+10v4Z+ZndpSItzNqGbnFs61BjLAFdrMOuroxsNZHbf4JdmplLOYXz+43ORRCC3S38mEY1ybbS2ETPjVoy2ewApSePaENkDBZt92ujqeLWuxcnxU/MNl0X/ccGvxo6zNJSKQTHQr1L/doVBv3oFVHnpVOP6c7ifSNmqT5zTRf10COWYp2uP4Xsv5yTRDMQw/nmsCkcRacOeLqBKeJYD9T9TZb7q5H++plCglYfZKstCV9PKZBNjIUTVD6+SYOtN6PvK3ghe1SuFZt2EObCDsXhIzTHBb/SDGww2xSVYy9ZgA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAZP264MB2991.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aENGblhqMFd2bW52ZitZRUQ5LzE2Yk84TkNXRCtvTDBoSEltVjhsNEY0WVYy?=
 =?utf-8?B?d0QvZ1dmQ1U3YkJKUGV1cENNSDN4QTlxV05KWU1KL1QvZERzMUxIODcwcE1s?=
 =?utf-8?B?c1ovWE1xWW5oSGRrWVpoMzhUb3ZiR20xUzBCNXNoSzVxVFhEalB0cVo4RlR0?=
 =?utf-8?B?YXd4YWowclRRbDFrYjF5RndMU2dDYytZQ3ZIUDVBNDFKalVOckJNeVcvVEhl?=
 =?utf-8?B?R3YwdHgvNjZzaHFEVXJrNDJ3dzY2eUJkdmU2K0lGaEJpNTl3S2dOcWtoSXE3?=
 =?utf-8?B?SXFnNEc1TUg3ZnRoaytmWWhtcFA4NGZReDFSZDBvUTMxVnNoWDQxMFVHQjQ5?=
 =?utf-8?B?dC84ZytJdDN2R1lxOUNVTnpMa01IRUdqNDdXeGVQYld5SmFrVlBKUkxpbFFx?=
 =?utf-8?B?NkV3OFFkU0swbnNqN0JSb21Cd0lzcTVSMWpqVk1FMkxRUGdjc0RWT2NpbUtO?=
 =?utf-8?B?SzdoYWhIZ1RYelErUWZLTFZHS3JYY2tCYW1DeW9mVnFRNDBRN1Q5a2ZnbzNB?=
 =?utf-8?B?SDJCZTEvNmhoTVVzWUJZSmlBTXR6ZHlZenRqc0xQQU81VzFCbzI4L1Izbmhx?=
 =?utf-8?B?ZTA4RWdycklrbnc5UEh0a0Z4TkNSbllESkQxbG5SN0YxUTBoSlJqdHAxb08w?=
 =?utf-8?B?VUZkbFJSOTFpbm8wNjd2cVpMcWFPYmJWV2Q1U2g4K2UzVXBlcUZSR2tDMFRw?=
 =?utf-8?B?NFh6VFBDZ1hXc3VoWXAza3pHTzZBaHNQRmptVk1OZ0NkYUk1dE5YVWNJckNN?=
 =?utf-8?B?QU1CYVp0Y2Y3S2hTZXJ2U0lTRElNdjZuTCtJZ2RPQkloWk53MGlCelVxeTRi?=
 =?utf-8?B?dktJdmozWHFZb2o3NnA5dk53b0FMdWxZNVB4YU85REVhY1lMRy9hU1YyOHF6?=
 =?utf-8?B?eTlNTjRQMHhWUmcxZHgvd3FXenVWcStTOTVRb1NSOG9zSHNycUdvMHE3V3gw?=
 =?utf-8?B?bXpSdEdNYSt4dDJCSVBkTVRLbkM5SE9CMXlwc3NOK3VaY2R0Q2NYMWtqZnBJ?=
 =?utf-8?B?WXI1N2tZQmRGYmlsRXVJdk1mN1h4eHRmV2lMdGptRVI4MVJPMjU1enlYNHlP?=
 =?utf-8?B?N3lvaC9ZZVp1N0VBQ2pYZTQwdVRZaStoZFRKMGRxb2c3Vi9aWHFtMUlHUXNh?=
 =?utf-8?B?eFhGK2Z0akd5YS9SbzAyYjc2dkJRMVg0UFZnS1ZINGh4dHVZdnI3OE4wNzdV?=
 =?utf-8?B?SFZ4c1JPRVJyY25kT0ttQ01HNjdPYnUvNlVWeUthdENTYXp6dFhsMDFQdnkx?=
 =?utf-8?B?My9hTEhSNW5HSGpuZU1peUEwM0Y2N2FYVlJaNllkdk5sL3hMSjhINjVzelo0?=
 =?utf-8?B?RjhRMDl2a1JxUkcxUWZsUzZYdmNnTkYvckJKNVA1eERFcy92RjRlUUg2c3kz?=
 =?utf-8?B?dHB3U0h2L2MrYU03MEYrWVpRL1NtcElsSi9JZlJsVmljSUp0TFBGVnB3WGxa?=
 =?utf-8?B?cXN2UzdLdC9JZW1EMGprV29lK1J1UEIzcG1TZHc3N2pYb0JVMy9seUhzQURJ?=
 =?utf-8?B?Sk1tUjNwSlRObmJoOTUxK2s5OTZTblQ2eS93Z29ranhqV2tDQ0lRZ3MrbGlM?=
 =?utf-8?B?S3g3OENqVDVWaTM4dmowRFYzSndHb3dLc2h6SitNZUhZTUxYTmlPcU5MNld4?=
 =?utf-8?B?VGJ6dzFaZG1XYzdISlNwcE9zTHl1SytZeGw0aGlqSlZKVEgyMi94ZndXRHlv?=
 =?utf-8?B?Z3RlZFBRRzcvN2twdXdBYzZ5a0JWYUpWK3BEVXRnOWFybVhadk5iM3orS2R2?=
 =?utf-8?B?aDJFdDNEWnMrbE4wc0VreVI2TWhJNkh0T2xTMGZhd0wxbHNFNEtaeEYrYXcx?=
 =?utf-8?B?SE1Td2E1YWRBY2hheno0eENub01FUk5CVnhXSzZXaDJaUnhheEhobC9Id1pz?=
 =?utf-8?B?SU8yR1UxMytLZEVER2RtTndJUnhNMjg3RGZ6bkNnQlBrSzFMVnh2VlkrOEhF?=
 =?utf-8?B?aHZOT09nMDNFem1LZzJvcUxvQWxmWmpWZkJhYVZWaXhPaUR5ZHluUTRoUlk2?=
 =?utf-8?B?R2I5ZFhKam5rcTdlbE5wOG1CblQzVTFZcHI2RFBoZ0RSaks4NFdJSmlIM2NY?=
 =?utf-8?B?Vk9jYVR0K2VGSDgyaGcvVVk1UDlyUGpYcGZZbnNwQkhEU1ZMWStNVll0TXkx?=
 =?utf-8?B?TVRURW5DeTl6cDcvci9MS3V2Nmk3UStFNDBONm12TnRKUVFUR3RNMk93a3Vh?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BB4263FAC587E45AE71EA7D05DEBFF6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB2991.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14dd3c6d-66b9-4f46-bf52-08dc540b525b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 18:24:38.2786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/+gjQlVIeqVhQTzhWTpvhAOQ9V4tquTCTG0OdXGQzYFnweMOX4dfyzQZgN4OZJJkXVDmrNEToYR4bnqn6MZG/61YJ81tvHBdG6o87SMAYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1750
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAzLzIwMjQgw6AgMTc6NTcsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIE1hciAyNywgMjAyNCBhdCAwOTo1ODozNUFNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4+IEp1c3QgZ2VuZXJhbCByZW1hcmtzIG9uIHRoZSBvbmVzIHdpdGggaHVn
ZSBwYWdlczoNCj4+Pg0KPj4+ICAgIGhhc2ggNjRrIGFuZCBodWdlcGFnZSAxNk0vMTZHDQo+Pj4g
ICAgcmFkaXggNjRrL3JhZGl4IGh1Z2VwYWdlIDJNLzFHDQo+Pj4gICAgcmFkaXggNGsvcmFkaXgg
aHVnZXBhZ2UgMk0vMUcNCj4+PiAgICBub2hhc2ggMzINCj4+PiAgICAgLSBJIHRoaW5rIHRoaXMg
aXMganVzdCBhIG5vcm1hbCB4ODYgbGlrZSBzY2hlbWU/IFBNRC9QVUQgY2FuIGJlIGENCj4+PiAg
ICAgICBsZWFmIHdpdGggdGhlIHNhbWUgc2l6ZSBhcyBhIG5leHQgbGV2ZWwgdGFibGUuDQo+Pj4N
Cj4+PiAgICAgICBEbyBhbnkgb2YgdGhlc2UgY2FzZXMgbmVlZCB0byBrbm93IHRoZSBoaWdoZXIg
bGV2ZWwgdG8gcGFyc2UgdGhlDQo+Pj4gICAgICAgbG93ZXI/IGVnIGlzIHRoZXJlIGEgMk0gYml0
IGluIHRoZSBQVUQgaW5kaWNhdGluZyB0aGF0IHRoZSBQTUQNCj4+PiAgICAgICBpcyBhIHRhYmxl
IG9mIDJNIGxlYWZzIG9yIGRvZXMgZWFjaCBQTUQgZW50cnkgaGF2ZSBhIGJpdA0KPj4+ICAgICAg
IGluZGljYXRpbmcgaXQgaXMgYSBsZWFmPw0KPj4NCj4+IEZvciBoYXNoIGFuZCByYWRpeCB0aGVy
ZSBpcyBhIGJpdCB0aGF0IHRlbGxzIGl0IGlzIGxlYWYgKF9QQUdFX1BURSkNCj4+DQo+PiBGb3Ig
bm9oYXNoMzIvZTUwMCBJIHRoaW5rIHRoZSBkcmF3aW5nIGlzIG5vdCBmdWxsIHJpZ2h0LCB0aGVy
ZSBpcyBhIGh1Z2UNCj4+IHBhZ2UgZGlyZWN0b3J5IChodWdlcGQpIHdpdGggYSBzaW5nbGUgZW50
cnkuIEkgdGhpbmsgaXQgc2hvdWxkIGJlDQo+PiBwb3NzaWJsZSB0byBjaGFuZ2UgaXQgdG8gYSBs
ZWFmIGVudHJ5LCBpdCBzZWVtcyB3ZSBoYXZlIGJpdCBfUEFHRV9TVzENCj4+IGF2YWlsYWJsZSBp
biB0aGUgUFRFLg0KPiANCj4gSXQgc291bmRzIHRvIG1lIGxpa2UgUFBDIGJyZWFrcyBkb3duIGlu
dG8gb25seSBhIGNvdXBsZSBmdW5kYW1lbnRhbA0KPiBiZWhhdmlvcnMNCj4gICAtIHg4NiBsaWtl
IGxlYWYgaW4gbWFueSBwYWdlIGxldmVscy4gVXNlIHRoZSBwZ2QvcHVkL3BtZF9sZWFmKCkgYW5k
DQo+ICAgICByZWxhdGVkIHRvIGltcGxlbWVudCBpdA0KPiAgIC0gQVJNIGxpa2UgY29udGlnIFBU
RSB3aXRoaW4gYSBzaW5nbGUgcGFnZSB0YWJsZSBsZXZlbC4gVXNlIHRoZQ0KPiAgICAgY29udGln
IHN1dGZmIHRvIGltcGxlbWVudCBpdA0KPiAgIC0gQ29udGlnIFBURSBhY3Jvc3MgdHdvIHBhZ2Ug
dGFibGUgbGV2ZWxzIHdpdGggYSBiaXQgaW4gdGhlDQo+ICAgICBQTUQuIE5lZWRzIG5ldyBzdXBw
b3J0IGxpa2UgeW91IHNob3dlZA0KPiAgIC0gUGFnZSB0YWJsZSBsZXZlbHMgd2l0aCBhIHZhcmlh
YmxlIHBhZ2Ugc2l6ZS4gSWUgYSBQVUQgY2FuIHBvaW50IHRvDQo+ICAgICBhIGRpcmVjdG9yeSBv
ZiA4IHBhZ2VzIG9yIDUxMiBwYWdlcyBvZiBkaWZmZXJlbnQgc2l6ZS4gUHJvYmJhbHkNCj4gICAg
IG5lZWRzIHNvbWUgbmV3IGNvcmUgc3VwcG9ydCwgYnV0IEkgdGhpbmsgeW91ciBjaGFuZ2VzIHRv
IHRoZQ0KPiAgICAgKl9vZmZzZXQgZ28gYSBsb25nIHdheSBhbHJlYWR5Lg0KPiANCj4+Pg0KPj4+
ICAgIGhhc2ggNGsgYW5kIGh1Z2VwYWdlIDE2TS8xNkcNCj4+PiAgICBub2hhc2ggNjQNCj4+PiAg
ICAgLSBIb3cgZG9lcyB0aGlzIHdvcms/IEkgZ3Vlc3Mgc2luY2UgOHh4IGV4cGxpY2l0bHkgY2Fs
bHMgb3V0DQo+Pj4gICAgICAgY29uc2VjdXRpdmUgdGhpcyBpcyBhY3R1YWxseSB0aGUgcGdkIGNh
biBwb2ludCB0byA1MTIgMjU2TQ0KPj4+ICAgICAgIGVudHJpZXMgb3IgOCAxNkcgZW50cmllcz8g
SWUgdGhlIHRhYmxlIHNpemUgYXQgZWFjaCBsZXZlbCBpcw0KPj4+ICAgICAgIHZhcmFibGU/IE9y
IGlzIGl0IHRoZSBzYW1lIGFuZCB0aGUgdGFibGUgc2l6ZSBpcyBzdGlsbCA1MTIgYW5kDQo+Pj4g
ICAgICAgZWFjaCAxNkcgZW50cnkgaXMgcmVwbGljYXRlZCA2NCB0aW1lcz8NCj4+DQo+PiBGb3Ig
dGhvc2UgaXQgaXMgdXNpbmcgdGhlIGh1Z2UgcGFnZSBkaXJlY3RvcnkgKGh1Z2VwZCkgd2hpY2gg
Y2FuIGJlDQo+PiBob29rZWQgYXQgYW55IGxldmVsIGFuZCBpcyBhIGRpcmVjdG9yeSBvZiBodWdl
IHBhZ2VzIG9uIGl0cyBvd24uIFRoZXJlDQo+PiBpcyBubyBjb25zZWN1dGl2ZSBlbnRyaWVzIGlu
dm9sdmVkIGhlcmUgSSB0aGluaywgYWxsdGhvdWdoIEknbSBub3QNCj4+IGNvbXBsZXRlbHkgc3Vy
ZS4NCj4+DQo+PiBGb3IgaGFzaDRrIEknbSBub3Qgc3VyZSBob3cgaXQgd29ya3MsIHRoaXMgd2Fz
IGNoYW5nZWQgYnkgY29tbWl0DQo+PiBlMmIzZDIwMmQxZGIgKCJwb3dlcnBjOiBTd2l0Y2ggMTZH
QiBhbmQgMTZNQiBleHBsaWNpdCBodWdlcGFnZXMgdG8gYQ0KPj4gZGlmZmVyZW50IHBhZ2UgdGFi
bGUgZm9ybWF0IikNCj4+DQo+PiBGb3IgdGhlIG5vaGFzaC82NCwgYSBQR0QgZW50cnkgcG9pbnRz
IGVpdGhlciB0byBhIHJlZ3VsYXIgUFVEIGRpcmVjdG9yeQ0KPj4gb3IgdG8gYSBIVUdFUEQgZGly
ZWN0b3J5LiBUaGUgc2l6ZSBvZiB0aGUgSFVHRVBEIGRpcmVjdG9yeSBpcyBlbmNvZGVkIGluDQo+
PiB0aGUgNiBsb3dlciBiaXRzIG9mIHRoZSBQR0QgZW50cnkuDQo+IA0KPiBJZiBpdCBpcyBhIHNv
ZnR3YXJlIHdhbGtlciB0aGVyZSBtaWdodCBiZSB2YWx1ZSBpbiBqdXN0IGFsaWduaW5nIHRvDQo+
IHRoZSBjb250aWcgcHRlIHNjaGVtZSBpbiBhbGwgbGV2ZWxzIGFuZCBmb3JnZXR0aW5nIGFib3V0
IHRoZSB2YXJpYWJsZQ0KPiBzaXplIHBhZ2UgdGFibGUgbGV2ZWxzLiBUaGF0IHF1YXJ0ZXIgcGFn
ZSBzdHVmZiBpcyBhIFBJVEEgdG8gbWFuYWdlDQo+IHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBmb3Ig
b24gUFBDIGFueWhvdy4uDQoNCkxvb2tpbmcgb25lIHN0ZXAgZnVydGhlciwgaW50byBub2hhc2gv
MzIsIEkgc2VlIGEgY2hhbGxlbmdlOiBvbiB0aGF0IA0KcGxhdGZvcm0sIGEgUFRFIGlzIDY0IGJp
dHMgd2hpbGUgYSBQR0QvUE1EIGVudHJ5IGlzIDMyIGJpdHMuIEl0IGlzIA0KdGhlcmVmb3JlIG5v
dCBwb3NzaWJsZSBhcyBzdWNoIHRvIGRvIFBNRCBsZWFmIG9yIGNvbnQtUE1EIGxlYWYuDQoNCkkg
c2VlIHR3byBwb3NzaWJsZSBzb2x1dGlvbnM6DQotIERvdWJsZSB0aGUgc2l6ZSBvZiBQR0QvUE1E
IGVudHJpZXMsIGJ1dCB0aGVuIHdlIGxvb3NlIGF0b21pY2l0eSB3aGVuIA0KcmVhZGluZyBvciB3
cml0aW5nIGFuIGVudHJ5LCBjb3VsZCB0aGlzIGJlIGEgcHJvYmxlbSA/DQotIERvIGFzIGZvciB0
aGUgOHh4LCBpZSBnbyBkb3duIHRvIFBURXMgZXZlbiBmb3IgcGFnZXMgZ3JlYXRlciB0aGFuIDRN
Lg0KDQpBbnkgdGhvdWdodCA/DQoNCkNocmlzdG9waGUNCg==
