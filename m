Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD887A5F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 11:34:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fsijATBs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvn2G1QP9z3dkm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 21:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fsijATBs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvn1V5Ph9z2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 21:34:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOR8jpABZ0SehfELD2qhIM705aNLXn6JmJcHFl4m+a/xRTaOprhTb/TxLOkxTXfg0YNDVP9pFc7+E3rqWYhDD7DYYBUuJJ1tL6CFkY2EjRgUE/c9S0srT5RTTjoOxaOStMvTXZycucBUfz5Dt/owkn02J7MNS/LgfMZ81QEQGhv5v+ze4TjAxwJNkJSd3rxpNEM/ohdDEeyDs9n1KwXAIIGvsGW7hO/dG2W6QCuiyo6wq9dfqTWE+PYy6CJ4iCDYJn0SfOErn4ihl7ITDxnS248LqZMaTjSktFPtbLw21U0VQuzz0GTVYKkfXFz0lbPgatDGSR8CsquI5H6F92KfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29U355F8B/DbyAubBimBzjG89wiWUK0u/b8FSWA5J5Q=;
 b=kQKZHURP+jbXzFmSsqZ16tO2PKW4XMFgIjzn5MZv+UzzpN0ZW9XsuJb+z/0hCEA04hjOHd24QpJU5j8do5zs9CSf6DHkpkQEhXrdaxg3K00pVqq6vxhjFLr0WqH14fGnI7klH/zy6KWGOmhC6Ah7b5JqzWUYH6CdNQUV7GsBZVe7vQasDfcz3TLB8wDy3PsGfSiOWZ5Aff9DN5fa/DJFGAVHa5Vl7kSzbtAf7IgvPtjCfeTa0BXS1aU0mxb/0My2dChtvNmOs0f+3liOKkEKLcP5Tn/qDcfYnW9S43180zNnYpVrN2fFBBYtgbjU6J1DkkrV02Y0E6emRAwYZgnUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29U355F8B/DbyAubBimBzjG89wiWUK0u/b8FSWA5J5Q=;
 b=fsijATBsZMqN30Dj/1wJJn25fFM2s7nS+qQ1VJeH4R43j1un87uZphuPs0pV8NJ1ob+aS4+ck6158/RxxPZNWRXOlFRJ1Vs7HV7ipcSC56NKedw1xs/GRaTILu6R+0HPNp3EahNHH1ei2muZFXpX/nFkEC4UTOYuuKnr8yv15t+8JpSAxzhlwbZj5JZ7BsiBV5FNrHpuiK6H0tlNQwKJuwCTeqPEcCf+2mKPVlGRh/kFQGz5lSZXBYXnh2t8DupTTo5OieycdbIRu8t7M72lzLbfm5goCWP+/KzMlrUpWK76vOxYytFgtA6/iv6ZTwgcRzdXCy0NmJXq5uDmnpDGCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2424.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Wed, 13 Mar
 2024 10:33:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 10:33:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 08/12] powerpc: mm: Replace p{u,m,4}d_is_leaf with
 p{u,m,4}_leaf
Thread-Topic: [PATCH v10 08/12] powerpc: mm: Replace p{u,m,4}d_is_leaf with
 p{u,m,4}_leaf
Thread-Index: AQHadP530Ltzc2qIsUqftr2mZiCSDLE1edIA
Date: Wed, 13 Mar 2024 10:33:36 +0000
Message-ID: <0f2d0a80-0dad-4dd1-96f6-0783a5405638@csgroup.eu>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
 <20240313042118.230397-9-rmclure@linux.ibm.com>
In-Reply-To: <20240313042118.230397-9-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2424:EE_
x-ms-office365-filtering-correlation-id: 38a6620f-0668-42e5-68d5-08dc43490a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AaVtr7GQwdGHr0N0R3RHzuLYXAqWToqLWkOI68FfL2+O1F40Xm/11xUEu9iF00XFn0OmPPKjtY0DQZYkBG3mfEXGGPpojEG13Bmt4XcVXvht0jPUe7UQXMakEc7h9HD80JMfbIbd5+4Nwxpxsz8uJ4WE/7dagU5Ib2kwuqlgXWXJPMC64UV7hsLoxMsAiP+tigfx0n6RcGfz/AM13JUJLU/KC7SFJHtIUAMal++dqaJ0kKw4z1mG1LBwhhSFyUc8CREVxgBwf7Ee7qK5G2otVfXMWo6gBxHoovRJVK9SjgdO3vXQtYxlz5YE/ZmAOtdjMdVqvjuA1rQbqZiX3ENFj23ajXPpCiZ7BXbX9F/g5K9UkTsmmq6SnZ8Boipyf+ZhW/R8BEDjuH/RulHxV4selnit5C8jtSFkKlooEycpuibED6/KFUEqQblXa79rfUAIG2Wz+83uag8avQZM2BHMWo9vmdkgwUg+9xwYbU4WNjWdaVksAgG6oVR+qd79/QN88XbKiA9A8CiOxpykp3n2mngUcz4PW1BTRToB9/uFBrINpNdUm/HLwvPtTt/s9gftF0GQeWfPM4tzuxC14bEauQ56ZEienbwrK265GgeMm+8V6y2ciZkNGs0otc+BkEvNKBU7yurq+S/JxcDeyPbgGNH4pvY0evSKnHz4phH94VI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aC9vcUdFMFB0QWRENzN1Uko5N1h0QkJGK3J6VGdNVmVVeENXek1sSTgrT1Vv?=
 =?utf-8?B?RERyRS9Yam80M0ZiNWhQVzVacVFlYUs4cmFKKzlBT3lvQ254bDNZdTR4TXhM?=
 =?utf-8?B?aFdXR1p6Mk9GRi9FbGZITXJSaXNZQmVvbVVQMzVNNFVzVm5SY3ZWV3N0aURi?=
 =?utf-8?B?VTZ1Z2pmOU5NWlg4TWdKdHNGd3FXQ010cXlLSVowSzN6eXN5Vk9kTXZFcHVU?=
 =?utf-8?B?QnlMMkZhdGtteUc5eXFRS1UwT01PU0hqYVhKQTcrK0k3NzB5Q01LRitZMWJh?=
 =?utf-8?B?T2dQR016TEtFUjJMaThDRzFoWnBRbE5DUzlOSUUyeldsckxnTmd5SWhaOVg0?=
 =?utf-8?B?OEdOQlFqN2lLZzVKdG11d2RTcTlRWGdYUyttVk5uWVF5S09HRXI1NVdHZzZr?=
 =?utf-8?B?Yk1uVk5yNlVwcndlbTYyOWtOdlVXRkJRNkl1YjRyR3dlVmgxU2ZxeEFkUkxr?=
 =?utf-8?B?ZlllQjd0M3dsWUpZL0VKK0MySVBWNDVxWkVTK3IwY3pWb3piNjhUM1JEbDNx?=
 =?utf-8?B?MzdXOTRuNlNRcG9sbHZYeDJ4TWxKUUNCTHhhMUo4SHkvU2tCbFNzY0NuY29K?=
 =?utf-8?B?c3k3dzlGYVRFbW1BemlSQktscU80d01mSGJmczdYN2NXbm5XY0p4YTdYU1Qz?=
 =?utf-8?B?OGQvd1NXaGphSnBzUzdxZEU4STFpbC8xZWR2Wm9ORnFSN1VOU2dnUTFhamo3?=
 =?utf-8?B?dVJlUnZRcXBVZWJ3ekRkeURMWVFMT0M1eVdPMVdRei9Sb3N1Y004RGY3ZjFI?=
 =?utf-8?B?dXQ1bGxyRU5Menp6emhRVHk1NU5MWVVINTErcjVxbC90RUw2Z2xrQjdmY1Bj?=
 =?utf-8?B?cVFOb0RuRlJ5eGFlcUpSU09vRHFyU1JzdzBWL3BqZ054ejVZaWYwZHhPQk9i?=
 =?utf-8?B?NW5OMnpveDZlNlcvTWw5d3M3SC9sT3hjYTBPMzN1THNsRnJkNW5FSXljeWFr?=
 =?utf-8?B?T0Q2dC81M3JuQzFFN0RMWG9Edko3ckIxcmozNzRNaFlkdkZVemNJQ2hFZ2xM?=
 =?utf-8?B?disyWE5Da0l3UjZNTWJrdkVrSVRkWlVNa0h3NjBFbXlGYzFsZjdtemIxZ3NL?=
 =?utf-8?B?blRHdU9HQndia2RpUWhVRDBYZ09QL09kbGZYd3JZSTZJYlZraFB1QjBiYVVv?=
 =?utf-8?B?ZUlCRndXeUJ1VjRDQmtScGFzRnFqd1VMSDdSYWNCaFZ4bzhCY2hMdi8xSUxa?=
 =?utf-8?B?QU1YSXEyQytqaS9oNjdlUytBWEd4OGEzZmxHNDV4S2ZKNzBPcE9YSU5LbFRo?=
 =?utf-8?B?SjFFRDJ2emN2SUczWjMybGovQTR6OHpqejJsRFZETnc3dENLbFA4UjlhS0tO?=
 =?utf-8?B?K1lOcitYSzREMjJWS1ZhWFJnbG5YYnBld25IQ3lOQmx1MXNHM2pQTkd6VGhY?=
 =?utf-8?B?N0xkR282dXY5R3l5YmoveTVWL0ltZTN5Z0RiNHNVSEIrNFdNU2lGQXdMazU2?=
 =?utf-8?B?bXJjQWRyTExJbWVMcTJhZzcrcFBvWVMwTWpZVzlhSVVaNGZnRmgvVm0rR284?=
 =?utf-8?B?a2JjOEozd1BHbktxL1RqdDBEQTgzcXZvMjFFNDJvZHZMeUkwWXpKaHdIUW5m?=
 =?utf-8?B?YmZHUUttL3ZWV3k2aVgvV1owbFB3aFVtMEo5YjhsS09vZ290TGp1Szh6SXAy?=
 =?utf-8?B?dXlqaTgwQ25xOXJLR1ZnbENCRThHM3dIWDRVeGh3aU5DZTR0d0ptcVFOYlU5?=
 =?utf-8?B?aXlOK2d5Vk1zZTFmTDUxcWlqbG5yZFFoc2FwbFlHazlJa1FJVHBKYXJycXFN?=
 =?utf-8?B?cWZpUDFjR2xTNzNVblo3emNGbGIrNkZhQXEzTlFRODF5Z1lKVVZnVWhvR0lS?=
 =?utf-8?B?Qi9NSjJBb3FFY3hyWkNHUUxXUXNuVUx2Tm9PaGRSY1hFYnFhRWM2TjM5Y21r?=
 =?utf-8?B?cjZXQUwrcWdndWdxVzBqZU42VFhaK2dTVzlUdWhhWWxCVzJ3cWNaZ3B2VGF2?=
 =?utf-8?B?SVRyb1VkdmZQV0kxS3Y3a0t5MGZhcnlva2RTTmc2K0FSV3ZnRG1yanI4YXpx?=
 =?utf-8?B?WXoxNXNsRWRnbTNkc0NwV3R5YUNaZXlMWVJZZEZHeWJnWXZFN1d5VHJGalR2?=
 =?utf-8?B?NiszRmtvVlRsa0FMRjNvN01DUkc0ZlhsenpXQ1QwWHJMZkJ0c3N1SnF2NURK?=
 =?utf-8?Q?kK6oqk5/PGuF983xaVmJDyMq5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <813E46B92BF4094BA890A323BCBE0378@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a6620f-0668-42e5-68d5-08dc43490a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 10:33:36.8690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hngx+/MsGWgDSiTZeAezVvUVj+EJ29qjUVh+snDeKGxR+vpPnQNQzAOti8c410+8m6JFdoU0moS9gPFjoXz60kCaxAixNXqFu59cv6WP8no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2424
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDEzLzAzLzIwMjQgw6AgMDU6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0K
PiBSZXBsYWNlIG9jY3VycmVuY2VzIG9mIHB7dSxtLDR9ZF9pc19sZWFmIHdpdGggcHt1LG0sNH1f
bGVhZiwgYXMgdGhlDQo+IGxhdHRlciBpcyB0aGUgbmFtZSBnaXZlbiB0byBjaGVja2luZyB0aGF0
IGEgaGlnaGVyLWxldmVsIGVudHJ5IGluDQo+IG11bHRpLWxldmVsIHBhZ2luZyBjb250YWlucyBh
IHBhZ2UgdHJhbnNsYXRpb24gZW50cnkgKHB0ZSkgdGhyb3VnaG91dA0KPiBhbGwgb3RoZXIgYXJj
aHMuDQoNClRoZXJlJ3MgYWxyZWFkeSBhbiBlcXVpdmFsZW50IGNvbW1pdCBpbiBtbS1zdGFibGUs
IHRoYXQgd2lsbCBsaWtlbHkgZ28gDQppbnRvIHY2Ljk6DQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0uZ2l0L2NvbW1pdC8/aD1tbS1zdGFi
bGUmaWQ9YmQxOGI2ODgyMjBjNzIyNWZiNTA0OThkYWJkOWY5ZDBjOTk4OGU2Nw0KDQoNCg0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4NCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5j
b20+DQo+IC0tLQ0KPiB2OTogTm8gbG9uZ2VyIHJlcXVpcmVkIGluIG9yZGVyIHRvIGltcGxlbWVu
dCBwYWdlIHRhYmxlIGNoZWNrLCBqdXN0IGENCj4gcmVmYWN0b3IuDQo+IHYxMDogRml4IG1vcmUg
b2NjdXJhbmNlcywgYW5kIGp1c3QgZGVsZXRlIHB7dSxtLDR9X2lzX2xlYWYoKSBzdHVicyBhcw0K
PiBlcXVpdmFsZW50IHB7dSxtLDR9X2xlYWYoKSBzdHVicyBhbHJlYWR5IGV4aXN0Lg0KPiAtLS0N
Cj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaCB8IDEwICsr
KystLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAg
fCAyNCAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0
X21tdV9yYWRpeC5jICAgICAgIHwgMTIgKysrKystLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9i
b29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMgICAgIHwgMTQgKysrKysrLS0tLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAgICAgICAgfCAgNiArKy0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzY0LmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0NCj4g
ICBhcmNoL3Bvd2VycGMveG1vbi94bW9uLmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0t
DQo+ICAgNyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Bn
dGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+
IGluZGV4IDYyYzQzZDNkODBlYy4uMzgyNzI0YzVlODcyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBAQCAtMTQ0MywxNiArMTQ0Mywx
NCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHRlX3J3X3VwZ3JhZGUodW5zaWduZWQgbG9uZyBv
bGRfdmFsLCB1bnNpZ25lZCBsb25nIG5ld192YQ0KPiAgIC8qDQo+ICAgICogTGlrZSBwbWRfaHVn
ZSgpIGFuZCBwbWRfbGFyZ2UoKSwgYnV0IHdvcmtzIHJlZ2FyZGxlc3Mgb2YgY29uZmlnIG9wdGlv
bnMNCj4gICAgKi8NCj4gLSNkZWZpbmUgcG1kX2lzX2xlYWYgcG1kX2lzX2xlYWYNCj4gLSNkZWZp
bmUgcG1kX2xlYWYgcG1kX2lzX2xlYWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwbWRfaXNfbGVh
ZihwbWRfdCBwbWQpDQo+ICsjZGVmaW5lIHBtZF9sZWFmIHBtZF9sZWFmDQo+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgcG1kX2xlYWYocG1kX3QgcG1kKQ0KPiAgIHsNCj4gICAJcmV0dXJuICEhKHBtZF9y
YXcocG1kKSAmIGNwdV90b19iZTY0KF9QQUdFX1BURSkpOw0KPiAgIH0NCj4gICANCj4gLSNkZWZp
bmUgcHVkX2lzX2xlYWYgcHVkX2lzX2xlYWYNCj4gLSNkZWZpbmUgcHVkX2xlYWYgcHVkX2lzX2xl
YWYNCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBwdWRfaXNfbGVhZihwdWRfdCBwdWQpDQo+ICsjZGVm
aW5lIHB1ZF9sZWFmIHB1ZF9sZWFmDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX2xlYWYocHVk
X3QgcHVkKQ0KPiAgIHsNCj4gICAJcmV0dXJuICEhKHB1ZF9yYXcocHVkKSAmIGNwdV90b19iZTY0
KF9QQUdFX1BURSkpOw0KPiAgIH0NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGlu
ZGV4IDkyMjRmMjMwNjVmZi4uMGMwZmZiZTdhM2I1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgNCj4gQEAgLTE4MCwzMCArMTgwLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIHB0
ZV9mcmFnX3NldChtbV9jb250ZXh0X3QgKmN0eCwgdm9pZCAqcCkNCj4gICB9DQo+ICAgI2VuZGlm
DQo+ICAgDQo+IC0jaWZuZGVmIHBtZF9pc19sZWFmDQo+IC0jZGVmaW5lIHBtZF9pc19sZWFmIHBt
ZF9pc19sZWFmDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgcG1kX2lzX2xlYWYocG1kX3QgcG1kKQ0K
PiAtew0KPiAtCXJldHVybiBmYWxzZTsNCj4gLX0NCj4gLSNlbmRpZg0KPiAtDQo+IC0jaWZuZGVm
IHB1ZF9pc19sZWFmDQo+IC0jZGVmaW5lIHB1ZF9pc19sZWFmIHB1ZF9pc19sZWFmDQo+IC1zdGF0
aWMgaW5saW5lIGJvb2wgcHVkX2lzX2xlYWYocHVkX3QgcHVkKQ0KPiAtew0KPiAtCXJldHVybiBm
YWxzZTsNCj4gLX0NCj4gLSNlbmRpZg0KPiAtDQo+IC0jaWZuZGVmIHA0ZF9pc19sZWFmDQo+IC0j
ZGVmaW5lIHA0ZF9pc19sZWFmIHA0ZF9pc19sZWFmDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgcDRk
X2lzX2xlYWYocDRkX3QgcDRkKQ0KPiAtew0KPiAtCXJldHVybiBmYWxzZTsNCj4gLX0NCj4gLSNl
bmRpZg0KPiAtDQo+ICAgI2RlZmluZSBwbWRfcGd0YWJsZSBwbWRfcGd0YWJsZQ0KPiAgIHN0YXRp
YyBpbmxpbmUgcGd0YWJsZV90IHBtZF9wZ3RhYmxlKHBtZF90IHBtZCkNCj4gICB7DQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYyBiL2FyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9yYWRpeC5jDQo+IGluZGV4IDRhMWFiYjlmN2MwNS4uNDA4
ZDk4ZjhhNTE0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVf
cmFkaXguYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXguYw0K
PiBAQCAtNTAzLDcgKzUwMyw3IEBAIHN0YXRpYyB2b2lkIGt2bXBwY191bm1hcF9mcmVlX3BtZChz
dHJ1Y3Qga3ZtICprdm0sIHBtZF90ICpwbWQsIGJvb2wgZnVsbCwNCj4gICAJZm9yIChpbSA9IDA7
IGltIDwgUFRSU19QRVJfUE1EOyArK2ltLCArK3ApIHsNCj4gICAJCWlmICghcG1kX3ByZXNlbnQo
KnApKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAtCQlpZiAocG1kX2lzX2xlYWYoKnApKSB7DQo+ICsJ
CWlmIChwbWRfbGVhZigqcCkpIHsNCj4gICAJCQlpZiAoZnVsbCkgew0KPiAgIAkJCQlwbWRfY2xl
YXIocCk7DQo+ICAgCQkJfSBlbHNlIHsNCj4gQEAgLTUzMiw3ICs1MzIsNyBAQCBzdGF0aWMgdm9p
ZCBrdm1wcGNfdW5tYXBfZnJlZV9wdWQoc3RydWN0IGt2bSAqa3ZtLCBwdWRfdCAqcHVkLA0KPiAg
IAlmb3IgKGl1ID0gMDsgaXUgPCBQVFJTX1BFUl9QVUQ7ICsraXUsICsrcCkgew0KPiAgIAkJaWYg
KCFwdWRfcHJlc2VudCgqcCkpDQo+ICAgCQkJY29udGludWU7DQo+IC0JCWlmIChwdWRfaXNfbGVh
ZigqcCkpIHsNCj4gKwkJaWYgKHB1ZF9sZWFmKCpwKSkgew0KPiAgIAkJCXB1ZF9jbGVhcihwKTsN
Cj4gICAJCX0gZWxzZSB7DQo+ICAgCQkJcG1kX3QgKnBtZDsNCj4gQEAgLTYzNSwxMiArNjM1LDEy
IEBAIGludCBrdm1wcGNfY3JlYXRlX3B0ZShzdHJ1Y3Qga3ZtICprdm0sIHBnZF90ICpwZ3RhYmxl
LCBwdGVfdCBwdGUsDQo+ICAgCQluZXdfcHVkID0gcHVkX2FsbG9jX29uZShrdm0tPm1tLCBncGEp
Ow0KPiAgIA0KPiAgIAlwbWQgPSBOVUxMOw0KPiAtCWlmIChwdWQgJiYgcHVkX3ByZXNlbnQoKnB1
ZCkgJiYgIXB1ZF9pc19sZWFmKCpwdWQpKQ0KPiArCWlmIChwdWQgJiYgcHVkX3ByZXNlbnQoKnB1
ZCkgJiYgIXB1ZF9sZWFmKCpwdWQpKQ0KPiAgIAkJcG1kID0gcG1kX29mZnNldChwdWQsIGdwYSk7
DQo+ICAgCWVsc2UgaWYgKGxldmVsIDw9IDEpDQo+ICAgCQluZXdfcG1kID0ga3ZtcHBjX3BtZF9h
bGxvYygpOw0KPiAgIA0KPiAtCWlmIChsZXZlbCA9PSAwICYmICEocG1kICYmIHBtZF9wcmVzZW50
KCpwbWQpICYmICFwbWRfaXNfbGVhZigqcG1kKSkpDQo+ICsJaWYgKGxldmVsID09IDAgJiYgIShw
bWQgJiYgcG1kX3ByZXNlbnQoKnBtZCkgJiYgIXBtZF9sZWFmKCpwbWQpKSkNCj4gICAJCW5ld19w
dGVwID0ga3ZtcHBjX3B0ZV9hbGxvYygpOw0KPiAgIA0KPiAgIAkvKiBDaGVjayBpZiB3ZSBtaWdo
dCBoYXZlIGJlZW4gaW52YWxpZGF0ZWQ7IGxldCB0aGUgZ3Vlc3QgcmV0cnkgaWYgc28gKi8NCj4g
QEAgLTY1OCw3ICs2NTgsNyBAQCBpbnQga3ZtcHBjX2NyZWF0ZV9wdGUoc3RydWN0IGt2bSAqa3Zt
LCBwZ2RfdCAqcGd0YWJsZSwgcHRlX3QgcHRlLA0KPiAgIAkJbmV3X3B1ZCA9IE5VTEw7DQo+ICAg
CX0NCj4gICAJcHVkID0gcHVkX29mZnNldChwNGQsIGdwYSk7DQo+IC0JaWYgKHB1ZF9pc19sZWFm
KCpwdWQpKSB7DQo+ICsJaWYgKHB1ZF9sZWFmKCpwdWQpKSB7DQo+ICAgCQl1bnNpZ25lZCBsb25n
IGhncGEgPSBncGEgJiBQVURfTUFTSzsNCj4gICANCj4gICAJCS8qIENoZWNrIGlmIHdlIHJhY2Vk
IGFuZCBzb21lb25lIGVsc2UgaGFzIHNldCB0aGUgc2FtZSB0aGluZyAqLw0KPiBAQCAtNzA5LDcg
KzcwOSw3IEBAIGludCBrdm1wcGNfY3JlYXRlX3B0ZShzdHJ1Y3Qga3ZtICprdm0sIHBnZF90ICpw
Z3RhYmxlLCBwdGVfdCBwdGUsDQo+ICAgCQluZXdfcG1kID0gTlVMTDsNCj4gICAJfQ0KPiAgIAlw
bWQgPSBwbWRfb2Zmc2V0KHB1ZCwgZ3BhKTsNCj4gLQlpZiAocG1kX2lzX2xlYWYoKnBtZCkpIHsN
Cj4gKwlpZiAocG1kX2xlYWYoKnBtZCkpIHsNCj4gICAJCXVuc2lnbmVkIGxvbmcgbGdwYSA9IGdw
YSAmIFBNRF9NQVNLOw0KPiAgIA0KPiAgIAkJLyogQ2hlY2sgaWYgd2UgcmFjZWQgYW5kIHNvbWVv
bmUgZWxzZSBoYXMgc2V0IHRoZSBzYW1lIHRoaW5nICovDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L3JhZGl4X3BndGFibGUuYw0KPiBpbmRleCBlMTZlMmZkMTA0YzUuLjQ2ZmE0NmNlNjUyNiAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0K
PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+IEBAIC0y
MDQsMTQgKzIwNCwxNCBAQCBzdGF0aWMgdm9pZCByYWRpeF9fY2hhbmdlX21lbW9yeV9yYW5nZSh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwNCj4gICAJCXB1ZHAgPSBwdWRf
YWxsb2MoJmluaXRfbW0sIHA0ZHAsIGlkeCk7DQo+ICAgCQlpZiAoIXB1ZHApDQo+ICAgCQkJY29u
dGludWU7DQo+IC0JCWlmIChwdWRfaXNfbGVhZigqcHVkcCkpIHsNCj4gKwkJaWYgKHB1ZF9sZWFm
KCpwdWRwKSkgew0KPiAgIAkJCXB0ZXAgPSAocHRlX3QgKilwdWRwOw0KPiAgIAkJCWdvdG8gdXBk
YXRlX3RoZV9wdGU7DQo+ICAgCQl9DQo+ICAgCQlwbWRwID0gcG1kX2FsbG9jKCZpbml0X21tLCBw
dWRwLCBpZHgpOw0KPiAgIAkJaWYgKCFwbWRwKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAtCQlpZiAo
cG1kX2lzX2xlYWYoKnBtZHApKSB7DQo+ICsJCWlmIChwbWRfbGVhZigqcG1kcCkpIHsNCj4gICAJ
CQlwdGVwID0gcG1kcF9wdGVwKHBtZHApOw0KPiAgIAkJCWdvdG8gdXBkYXRlX3RoZV9wdGU7DQo+
ICAgCQl9DQo+IEBAIC03NjcsNyArNzY3LDcgQEAgc3RhdGljIHZvaWQgX19tZW1pbml0IHJlbW92
ZV9wbWRfdGFibGUocG1kX3QgKnBtZF9zdGFydCwgdW5zaWduZWQgbG9uZyBhZGRyLA0KPiAgIAkJ
aWYgKCFwbWRfcHJlc2VudCgqcG1kKSkNCj4gICAJCQljb250aW51ZTsNCj4gICANCj4gLQkJaWYg
KHBtZF9pc19sZWFmKCpwbWQpKSB7DQo+ICsJCWlmIChwbWRfbGVhZigqcG1kKSkgew0KPiAgIAkJ
CWlmIChJU19BTElHTkVEKGFkZHIsIFBNRF9TSVpFKSAmJg0KPiAgIAkJCSAgICBJU19BTElHTkVE
KG5leHQsIFBNRF9TSVpFKSkgew0KPiAgIAkJCQlpZiAoIWRpcmVjdCkNCj4gQEAgLTgwNyw3ICs4
MDcsNyBAQCBzdGF0aWMgdm9pZCBfX21lbWluaXQgcmVtb3ZlX3B1ZF90YWJsZShwdWRfdCAqcHVk
X3N0YXJ0LCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgCQlpZiAoIXB1ZF9wcmVzZW50KCpwdWQp
KQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAgIA0KPiAtCQlpZiAocHVkX2lzX2xlYWYoKnB1ZCkpIHsN
Cj4gKwkJaWYgKHB1ZF9sZWFmKCpwdWQpKSB7DQo+ICAgCQkJaWYgKCFJU19BTElHTkVEKGFkZHIs
IFBVRF9TSVpFKSB8fA0KPiAgIAkJCSAgICAhSVNfQUxJR05FRChuZXh0LCBQVURfU0laRSkpIHsN
Cj4gICAJCQkJV0FSTl9PTkNFKDEsICIlczogdW5hbGlnbmVkIHJhbmdlXG4iLCBfX2Z1bmNfXyk7
DQo+IEBAIC04NDUsNyArODQ1LDcgQEAgcmVtb3ZlX3BhZ2V0YWJsZSh1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwgYm9vbCBkaXJlY3QsDQo+ICAgCQlpZiAoIXA0ZF9wcmVz
ZW50KCpwNGQpKQ0KPiAgIAkJCWNvbnRpbnVlOw0KPiAgIA0KPiAtCQlpZiAocDRkX2lzX2xlYWYo
KnA0ZCkpIHsNCj4gKwkJaWYgKHA0ZF9sZWFmKCpwNGQpKSB7DQo+ICAgCQkJaWYgKCFJU19BTElH
TkVEKGFkZHIsIFA0RF9TSVpFKSB8fA0KPiAgIAkJCSAgICAhSVNfQUxJR05FRChuZXh0LCBQNERf
U0laRSkpIHsNCj4gICAJCQkJV0FSTl9PTkNFKDEsICIlczogdW5hbGlnbmVkIHJhbmdlXG4iLCBf
X2Z1bmNfXyk7DQo+IEBAIC0xNTQwLDcgKzE1NDAsNyBAQCBpbnQgcHVkX3NldF9odWdlKHB1ZF90
ICpwdWQsIHBoeXNfYWRkcl90IGFkZHIsIHBncHJvdF90IHByb3QpDQo+ICAgDQo+ICAgaW50IHB1
ZF9jbGVhcl9odWdlKHB1ZF90ICpwdWQpDQo+ICAgew0KPiAtCWlmIChwdWRfaXNfbGVhZigqcHVk
KSkgew0KPiArCWlmIChwdWRfbGVhZigqcHVkKSkgew0KPiAgIAkJcHVkX2NsZWFyKHB1ZCk7DQo+
ICAgCQlyZXR1cm4gMTsNCj4gICAJfQ0KPiBAQCAtMTU4Nyw3ICsxNTg3LDcgQEAgaW50IHBtZF9z
ZXRfaHVnZShwbWRfdCAqcG1kLCBwaHlzX2FkZHJfdCBhZGRyLCBwZ3Byb3RfdCBwcm90KQ0KPiAg
IA0KPiAgIGludCBwbWRfY2xlYXJfaHVnZShwbWRfdCAqcG1kKQ0KPiAgIHsNCj4gLQlpZiAocG1k
X2lzX2xlYWYoKnBtZCkpIHsNCj4gKwlpZiAocG1kX2xlYWYoKnBtZCkpIHsNCj4gICAJCXBtZF9j
bGVhcihwbWQpOw0KPiAgIAkJcmV0dXJuIDE7DQo+ICAgCX0NCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9tbS9wZ3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+IGluZGV4
IGEwNGFlNDQ0OWEwMi4uZThlMDI4OWQ3YWIwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
bW0vcGd0YWJsZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gQEAgLTQx
Myw3ICs0MTMsNyBAQCBwdGVfdCAqX19maW5kX2xpbnV4X3B0ZShwZ2RfdCAqcGdkaXIsIHVuc2ln
bmVkIGxvbmcgZWEsDQo+ICAgCWlmIChwNGRfbm9uZShwNGQpKQ0KPiAgIAkJcmV0dXJuIE5VTEw7
DQo+ICAgDQo+IC0JaWYgKHA0ZF9pc19sZWFmKHA0ZCkpIHsNCj4gKwlpZiAocDRkX2xlYWYocDRk
KSkgew0KPiAgIAkJcmV0X3B0ZSA9IChwdGVfdCAqKXA0ZHA7DQo+ICAgCQlnb3RvIG91dDsNCj4g
ICAJfQ0KPiBAQCAtNDM1LDcgKzQzNSw3IEBAIHB0ZV90ICpfX2ZpbmRfbGludXhfcHRlKHBnZF90
ICpwZ2RpciwgdW5zaWduZWQgbG9uZyBlYSwNCj4gICAJaWYgKHB1ZF9ub25lKHB1ZCkpDQo+ICAg
CQlyZXR1cm4gTlVMTDsNCj4gICANCj4gLQlpZiAocHVkX2lzX2xlYWYocHVkKSkgew0KPiArCWlm
IChwdWRfbGVhZihwdWQpKSB7DQo+ICAgCQlyZXRfcHRlID0gKHB0ZV90ICopcHVkcDsNCj4gICAJ
CWdvdG8gb3V0Ow0KPiAgIAl9DQo+IEBAIC00NzQsNyArNDc0LDcgQEAgcHRlX3QgKl9fZmluZF9s
aW51eF9wdGUocGdkX3QgKnBnZGlyLCB1bnNpZ25lZCBsb25nIGVhLA0KPiAgIAkJZ290byBvdXQ7
DQo+ICAgCX0NCj4gICANCj4gLQlpZiAocG1kX2lzX2xlYWYocG1kKSkgew0KPiArCWlmIChwbWRf
bGVhZihwbWQpKSB7DQo+ICAgCQlyZXRfcHRlID0gKHB0ZV90ICopcG1kcDsNCj4gICAJCWdvdG8g
b3V0Ow0KPiAgIAl9DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV82NC5j
IGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGVfNjQuYw0KPiBpbmRleCA1YWMxZmQzMDM0MWIuLjA2
MDRjODBkYWU2NiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGVfNjQuYw0K
PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV82NC5jDQo+IEBAIC0xMDAsNyArMTAwLDcg
QEAgRVhQT1JUX1NZTUJPTChfX3B0ZV9mcmFnX3NpemVfc2hpZnQpOw0KPiAgIC8qIDQgbGV2ZWwg
cGFnZSB0YWJsZSAqLw0KPiAgIHN0cnVjdCBwYWdlICpwNGRfcGFnZShwNGRfdCBwNGQpDQo+ICAg
ew0KPiAtCWlmIChwNGRfaXNfbGVhZihwNGQpKSB7DQo+ICsJaWYgKHA0ZF9sZWFmKHA0ZCkpIHsN
Cj4gICAJCWlmICghSVNfRU5BQkxFRChDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BUCkpDQo+ICAg
CQkJVk1fV0FSTl9PTighcDRkX2h1Z2UocDRkKSk7DQo+ICAgCQlyZXR1cm4gcHRlX3BhZ2UocDRk
X3B0ZShwNGQpKTsNCj4gQEAgLTExMSw3ICsxMTEsNyBAQCBzdHJ1Y3QgcGFnZSAqcDRkX3BhZ2Uo
cDRkX3QgcDRkKQ0KPiAgIA0KPiAgIHN0cnVjdCBwYWdlICpwdWRfcGFnZShwdWRfdCBwdWQpDQo+
ICAgew0KPiAtCWlmIChwdWRfaXNfbGVhZihwdWQpKSB7DQo+ICsJaWYgKHB1ZF9sZWFmKHB1ZCkp
IHsNCj4gICAJCWlmICghSVNfRU5BQkxFRChDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BUCkpDQo+
ICAgCQkJVk1fV0FSTl9PTighcHVkX2h1Z2UocHVkKSk7DQo+ICAgCQlyZXR1cm4gcHRlX3BhZ2Uo
cHVkX3B0ZShwdWQpKTsNCj4gQEAgLTEyNSw3ICsxMjUsNyBAQCBzdHJ1Y3QgcGFnZSAqcHVkX3Bh
Z2UocHVkX3QgcHVkKQ0KPiAgICAqLw0KPiAgIHN0cnVjdCBwYWdlICpwbWRfcGFnZShwbWRfdCBw
bWQpDQo+ICAgew0KPiAtCWlmIChwbWRfaXNfbGVhZihwbWQpKSB7DQo+ICsJaWYgKHBtZF9sZWFm
KHBtZCkpIHsNCj4gICAJCS8qDQo+ICAgCQkgKiB2bWFsbG9jX3RvX3BhZ2UgbWF5IGJlIGNhbGxl
ZCBvbiBhbnkgdm1hcCBhZGRyZXNzIChub3Qgb25seQ0KPiAgIAkJICogdm1hbGxvYyksIGFuZCBp
dCB1c2VzIHBtZF9wYWdlKCkgZXRjLiwgd2hlbiBodWdlIHZtYXAgaXMNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy94bW9uL3htb24uYyBiL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYw0KPiBp
bmRleCBjODVmYTNmMGRkM2IuLmQ3OWQ2NjMzZjMzMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL3htb24veG1vbi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYw0KPiBAQCAt
MzM0MCw3ICszMzQwLDcgQEAgc3RhdGljIHZvaWQgc2hvd19wdGUodW5zaWduZWQgbG9uZyBhZGRy
KQ0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHA0ZF9pc19sZWFmKCpwNGRw
KSkgew0KPiArCWlmIChwNGRfbGVhZigqcDRkcCkpIHsNCj4gICAJCWZvcm1hdF9wdGUocDRkcCwg
cDRkX3ZhbCgqcDRkcCkpOw0KPiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+IEBAIC0zMzU0LDcgKzMz
NTQsNyBAQCBzdGF0aWMgdm9pZCBzaG93X3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICAgCQly
ZXR1cm47DQo+ICAgCX0NCj4gICANCj4gLQlpZiAocHVkX2lzX2xlYWYoKnB1ZHApKSB7DQo+ICsJ
aWYgKHB1ZF9sZWFmKCpwdWRwKSkgew0KPiAgIAkJZm9ybWF0X3B0ZShwdWRwLCBwdWRfdmFsKCpw
dWRwKSk7DQo+ICAgCQlyZXR1cm47DQo+ICAgCX0NCj4gQEAgLTMzNjgsNyArMzM2OCw3IEBAIHN0
YXRpYyB2b2lkIHNob3dfcHRlKHVuc2lnbmVkIGxvbmcgYWRkcikNCj4gICAJCXJldHVybjsNCj4g
ICAJfQ0KPiAgIA0KPiAtCWlmIChwbWRfaXNfbGVhZigqcG1kcCkpIHsNCj4gKwlpZiAocG1kX2xl
YWYoKnBtZHApKSB7DQo+ICAgCQlmb3JtYXRfcHRlKHBtZHAsIHBtZF92YWwoKnBtZHApKTsNCj4g
ICAJCXJldHVybjsNCj4gICAJfQ0K
