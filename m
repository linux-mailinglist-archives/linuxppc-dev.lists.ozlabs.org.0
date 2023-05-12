Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEA700B8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 17:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHt0X0Yqnz3fQF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 01:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=P/R4KHfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=P/R4KHfQ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHszg5vblz3bbP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 01:26:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+kXmdQhpJhduaCPG6iIP+3OkEVoT78hcGlSvoeJugWMEaMB9el1ffaEkLqXu1JEhklD3Wc8w9D5kihGPBllM3lNrhgBKwQIrhEGCCCdb0CdB05D0eUjgIdUotRTukzZgnT6EwFrOpqbQkAmhBx05k4s6pEpEb4BV0Vp0V1VSn2d0oSimHPlP3497kjtDtJYetdiyDZDjLG8mi3EcUbaS5VL+YyIK9ZKy1uc3NMgllDi6BTmk0TxBA536bmS9Lyot5rtLy3eaKQ6pTeiCM3ze414c6Nk3g3s2M6+BdGG9B6WBOm35VpbXRoOAujkZUBFj0yBoiod7st5Q6Zik8frVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4I7xwuXz4P7BIkIxvOoPX9iHtWI6iHPfMPkjM2QUVk=;
 b=aILLmNbHt3KZ2IDlb37k8ByUETnQJwRb5+/83QhPJEkAP091A6cpCAWaS/BlGPF1lCQRo7J0MvGB1eLcyXHMnuSP0aeeRqiTcdSPBHrSUVfMAxMMfJNifxoOE12Kj2tRzT8bi5fzZTMvdCmrv7EGOi2Z5bIQeMHpXBATdIDrMd3Eag8zhISvpHzJNcqE9sERaDwpnpr0o8++awvN7Qomdo/P0dPs7mADDwxsDnserW1lJ5eqm12VFd3J3DIHt7j1r0wbJLDVGLBqDMKdGQUSrb5kUsEu5lHSdXDQf7RxgWYTgU1WQkd82owAQ0g3Yw+1JO+QTubWhB/B/zTvMHvjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4I7xwuXz4P7BIkIxvOoPX9iHtWI6iHPfMPkjM2QUVk=;
 b=P/R4KHfQBeH9HorTQswFRZDYYiXt31rfP9KboH3h8qDYqiLKHRz8ftg0qwpa17lPaMwNQeAb0+WUplteBEaRDDNHzWvDAe8etQP19zyp9wTlPaLEIbt+rafZeXirQDqfgb+32po2sAi5QG81d1WMmd0UaRxfZaM+DrC9iy1YJcKElsY7/wnlTS8g1jIr33EDHGF0QZA79NDcNlQ959bnie9YAaxtO4ANFIFoxq58mybXrxtuIDacS84scRTFF5dnGBEDy0JJvSApOn+UENZcM66O5m0ePnx9X6Evt6SDuHTCugraj3vkeSUcbwBqbWx10HmuUTdP+j3l1Ux3/9w0fg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2309.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 15:25:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 15:25:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?TmljY29sw7IgQmVsbGk=?= <darkbasic@linuxsystems.it>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Thread-Topic: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Thread-Index: AQHZhOSpng5dBy/g3U+hblP7H6tff69WwkOA
Date: Fri, 12 May 2023 15:25:47 +0000
Message-ID: <57100be6-d379-0bc7-6d45-228cd46f9c81@csgroup.eu>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
 <a50537d1f1af34104793218acb954a61@linuxsystems.it>
 <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
In-Reply-To: <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2309:EE_
x-ms-office365-filtering-correlation-id: d57f7b11-2bc3-489c-6a2b-08db52fd297b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  YfyvLpfvJ7ThJSEV8gTIJX1aYSMmu0BrYK9JiPe6zLC7VoYMGk4REePaD6eUTiXNu/9prQkBgkRKjQnpT5jL3F2B9eZFO8vX7ncBF8uYOscAWuDsoESpxO687VTn0BiUR4hwi5SkWNPnfjz2SwVBVkPR8p7WkpfklWzkVdNVPdp8EYicGV+HQ/MKSzf6ShaQS6M/GgtozM7XjX5eElTFcm/xL+ZDe7wumlbQ/Nb1+6G8oVPtZLtBaawMtRfq97zi4fDcWyjFth3unxMxIyrYGQ2yqMfU0o4XoUFChMLv+ucIXnToPDQ09jvq63IiH7ijAb+Fxhm7oZ4T4vZScBNJ9piY6R+SXZZ3Ojq8K7zJSeNEPs8O4tOjMscZaKLJTHEVYEsypP1D3HQ5pcE4wwRKCfBxN0W0TJMTIwTA17zBDBKyOrWKZARHZRDtRqI2hNJJGw38xPGOsQFxb9sFg5bdCOG+9FU1RzphAXaX4LoJt50SNbveYNIk+O5tRmqx8BaohOaVpD8PqtGeiBaxF8iWroB4z+ahfvfJBdbpj1JaghT5DXvk8LZTKsYs0E3d3ezWybVNzrCyIhGmIe/w5ApBHWgH3qEJktMdMs6hbYnaq+Gjlcv2/vgPwHhFeNhXkIPL
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39850400004)(366004)(376002)(136003)(451199021)(86362001)(31696002)(36756003)(966005)(316002)(110136005)(54906003)(66446008)(66556008)(4326008)(76116006)(66946007)(66476007)(64756008)(91956017)(478600001)(6486002)(41300700001)(71200400001)(2906002)(8936002)(5660300002)(8676002)(44832011)(7416002)(38070700005)(122000001)(38100700002)(26005)(2616005)(186003)(6506007)(6512007)(66574015)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZmFIZWtDc0FzR0cxejlBMGgrQ2FSSW90SmU1TUNCcEpPM3hXZktCZEczQlJ5?=
 =?utf-8?B?djM1Z0xMWng1ZENYUE5IVzNIT3Uzc2x5MHRrRENtTmFMVkhNK1pINTdoVWRh?=
 =?utf-8?B?WXBLYklGc2s1dTNRMEZjNEhzNm1FTmRwSzZMNzhHMW9lWjZZLy83L1R6QSsx?=
 =?utf-8?B?M1ZmV3ZtL1hkajd6MTR2WEFUTFVINjNQOTdObmtBVE1UamJqd3B1T05YMHJX?=
 =?utf-8?B?YzVkL08wZmpIVXU1V0JQZE9qa3NQRXM3RG0rem5KdHY0MjNZM3NxTHZTUVVP?=
 =?utf-8?B?TDJEWUNUUHlNSUtkY1FvSXE0ZXR5THMwa09zNit2OENGSGw0N1Q2aHBOM0RN?=
 =?utf-8?B?OENzZnJFUVAzMXE1R1pkeHNRS1JLZ08vaEozVjNzTk1yY0FJZzRJRmYwTVNX?=
 =?utf-8?B?MHI4U2d4c1ZqL1FjVVJmNW5rVkx4cHFuUmpRK1hXNDVYdFJzRGhlVjJyL0hk?=
 =?utf-8?B?OE5PWUh1UThJTjVOTldWc2hqdDk0Skh4UmFIVU5XdG1FUzRuYzlxZ2dPdXY1?=
 =?utf-8?B?aTRQTkFhS1RSVVpBWnA4SzZEOWRsZm9vM2xQdmR2dWRXb1ZDS3RKd1lkbjlu?=
 =?utf-8?B?RGtqYWZoR0JHSFdlU1FXNnBqQi92b0t0MU9CT3dPWEdpWmlVbFJHT3hYOCtF?=
 =?utf-8?B?d3F3NnF3bkpnVmp1TnVWbHg3c0lQQzBKNzRONmFvNy9oTW5NZWJVTDZXMmsv?=
 =?utf-8?B?ZEQxRnNYMEI3ak95NVczMXNCV0RGWmw2cGVhRkhQblhZRjAxaUZTSkZVa3Bm?=
 =?utf-8?B?Z08ydEtOVHNISTQxOXBRSjFoMGZ5MGpwdGtZUEdnVGFqcE9GVmY0V084TXF1?=
 =?utf-8?B?ckwzL0xWM1k1aXhnMU9XRzExbHZzVnBCL1hKZmx3U0dLS3JIN3BvR21TTVZT?=
 =?utf-8?B?K1FaNXB1WVhONk9EODYrTFVTRGZMZVhxRVFINHgydVNrOS82WFlJTTF6T0ow?=
 =?utf-8?B?YlB0U0VUc2svY2I2eVFFb0VwUCtKTjBBTkhjdDJyUnAxaXBOSEYzZjdCRHc0?=
 =?utf-8?B?L2R2dTNQbENRbGhsRUxnMS9Kc20rQXJvaW44WGNKOWFoRXJFN0M3MmJyUkFT?=
 =?utf-8?B?d3pRQlBNT01ZNVcyTDh5SE5Vb003cDEveHpDUXRwOXlDdmk3ZHBXYlYwOUJv?=
 =?utf-8?B?Z2hJbTBSNXNvQXEzQ0tFRnBmMVJqYnY1L3ozSHFibGRCZVBUbzJGbjhsZDk2?=
 =?utf-8?B?b0YyVzlwU2FTL3pNanUvWUlJb2oxVGdUaWZVQnBmNU9haWwwUjdRb1VuVHJh?=
 =?utf-8?B?MXdWN2Y4SnZPeUlQdUtnS0c5d0VnYnFnY00wODlpNDh5UzNCcFRVTklhU0Ju?=
 =?utf-8?B?c1BuRUFrZERydm5vMnIyMWhWSGtYSnpsQU5hdzVSbFNRS1dzODczZzVjUzNH?=
 =?utf-8?B?WTF6Mk5MSFVKS1ZEaWVRRDFINzM5eGFiblgvY2NtRnFBWFJiVG9lY1ZBR2hR?=
 =?utf-8?B?WVc4OGp1MGNhTEp1RlZEc0ZHM0Jad1BpcE1IME9EazFHUkduZWRTWjR2V1Vm?=
 =?utf-8?B?K3kvM1JhRlMrNGhXV0NTc0lNck9zNnhEUlkrS09GVHE4QWcwZnpXQXg0bVNj?=
 =?utf-8?B?OTBteUJtcE54bVpRZWZIMjgwQm92VTE3dFdSTGw1WHdwOC9VV1ZnYW9aR0F2?=
 =?utf-8?B?blZDdVEySm1lcDd4MW5Fc2tnV2R6UXhjOTZLUWR2OWpzQ3M4d3FsbWd4VlBU?=
 =?utf-8?B?YXJVSXgrQkwzOXoyMkxaU2Urb1ppSE9XREljOUZQdytSVnNvVkJuRWJvcWtp?=
 =?utf-8?B?N2ZkT2xQbDUxTm5vZzhra3M2R0cwek8vNXZUNTRpdHc1LzBxSEp6NWhueGtP?=
 =?utf-8?B?RTRzVjlFdVhRL05GSXJMYi9YOUxMUklGOVhYTzVUSXFRSkR4S1FvK0Y4MUcr?=
 =?utf-8?B?eVAyM0dienBpWXQ5aEJMbGhobWRMekoxV1M2SEh2VE8vTDVxOHArOFBrUTFJ?=
 =?utf-8?B?VklPbVBEc0Fja0FHYUQ4MmZUVkp2QWd5UFpYb1hpVkF5ZnFyekt6bWtCeEd4?=
 =?utf-8?B?bnMvTGs0T0M3T3ZQOVFQYzlLT1NuSEZtbDJPam1uSWkzL1ZnZ2l4c0hKd2hF?=
 =?utf-8?B?dm5QY1hLVkJEMWpaZk5OKzVEbVMyNWJYbWxXTnhTZzJNdjhWdFQ1VzI0bDZI?=
 =?utf-8?B?Kzk2N01MVmZweUs4cUc2QkZ4UzJlZGhmc1V1bFdQQlp3S3hJMVNyZjhUYzJE?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6EDC31093FEAF439CE530AE2726C0B4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d57f7b11-2bc3-489c-6a2b-08db52fd297b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 15:25:47.8734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U9G690q/mcV5Jux31bI593/p5M2EpNZR7FeXXfIxoVA5F45CFAbsirdiP2h2uYkV+y7Eu+mjqGopMDAAa6Hca98QqVO1GiUgWmPiynAgX00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2309
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA1LzIwMjMgw6AgMTc6MTYsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxMS8wNS8yMDIzIMOgIDE5OjI1LCBOaWNjb2zDsiBCZWxsaSBhIMOpY3Jp
dMKgOg0KPj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgDQo+
PiBkYXJrYmFzaWNAbGludXhzeXN0ZW1zLml0LiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3Qg
aW1wb3J0YW50ID8gDQo+PiBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPj4NCj4+IElsIDIwMjMtMDUtMTIgMTA6MzIgQmFnYXMgU2FuamF5YSBoYSBzY3Jp
dHRvOg0KPj4+ICNyZWd6Ym90IGludHJvZHVjZWQ6IGY0ZjNiN2RlZGJlODQ5DQo+Pj4gI3JlZ3pi
b3QgbGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1ZXMv
MjU1Mw0KPj4NCj4+IEl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBhZm9yZW1lbnRpb25lZCBwYXRj
aCBtYWRlIGl0cyB3YXkgaW50byA2LjMgeWV0Og0KPj4NCj4+IG5pa29AdGFsb3MyIH4vZGV2ZWwv
bGludXgtc3RhYmxlICQgZ2l0IGJyYW5jaA0KPj4gKiBsaW51eC02LjMueQ0KPj4gwqDCoCBtYXN0
ZXINCj4+IG5pa29AdGFsb3MyIH4vZGV2ZWwvbGludXgtc3RhYmxlICQgZ2l0IHNob3cgZjRmM2I3
ZGVkYmU4IHwgcGF0Y2ggLXAxDQo+PiBwYXRjaGluZyBmaWxlDQo+PiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPj4gSHVuayAjMSBz
dWNjZWVkZWQgYXQgMjI3IChvZmZzZXQgMTUgbGluZXMpLg0KPj4gSHVuayAjMiBzdWNjZWVkZWQg
YXQgMjY5IHdpdGggZnV6eiAyIChvZmZzZXQgMTkgbGluZXMpLg0KPj4gcGF0Y2hpbmcgZmlsZQ0K
Pj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmgNCj4+IEh1bmsgIzEgc3VjY2VlZGVkIGF0IDQ5IHdpdGggZnV6eiAyIChvZmZzZXQgMTUg
bGluZXMpLg0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGF0IHBhdGNoIGhhcyBubyBGaXhl
czogdGFnLCBzbyBpdCB3aWxsIHVubGlrZWx5IGJlIA0KPiBhdXRvbWF0aWNhbGx5IG1lcmdlZCBp
bnRvIHN0YWJsZS4NCj4gDQo+IEhhcyBhbnlib2R5IHJlcXVlc3RlZCBncmVnL3Nhc2hhIHRvIGdl
dCBpdCBpbnRvIDYuMyA/DQo+IA0KDQpJbiBmYWN0LCBpdCBzZWVtcyB0aGF0IHBhdGNoIGlzIGFs
cmVhZHkgcGFydCBvZiA2LjM6DQoNCiQgZ2l0IHRhZyAtLWNvbnRhaW5zIGY0ZjNiN2RlZGJlOA0K
djYuMw0KdjYuMy1yYzUNCnY2LjMtcmM2DQp2Ni4zLXJjNw0KdjYuMy4xDQp2Ni4zLjINCnY2LjQt
cmMxDQo=
