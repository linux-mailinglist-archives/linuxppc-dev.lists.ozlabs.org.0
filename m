Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2754770731
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:33:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cklFIrBl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHXrB6HS1z3cRY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cklFIrBl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHXq95yn0z3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 03:32:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpqquyRLpudXIwaouF1cD8f3HoFnz9NNaEwvcXDk7FuXbD5SqsPKj377n+oZlJqJHqcahvZaqtX3+2lEasWjVSjZrchVqTFR2h8TgQqyh8Jd2IAZRpWIopqenwxi4+QD2QJJiVqstqm5jvBd/lrGrgqbwy1izL/2N/ObmFVJvL6XKCPopSTlQEYsCQaDIjoVyA3p2gJPfe3qbIKuS+uGRhRMJvm99+ndxXwonClriKgq4BNP/stlcvIe0+4wvUm1bz7bydeo8G3VLKiR6pbxKlqKs0Wa9GpYrkLvaeiEFHZE07BBuyEfnvZZEcfuXnn6V+QvZc8tUPMXusB5mfItnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceQNnZymChzCyf5b70i8P7/a30Vc05rIQbvINyTfyeE=;
 b=YXRhdTCi7N97SN3Vjy+R/nEyA9tWoYgcyijnMbuzh5eAP/j9lPwY79brDA9R4MNSkSiwqzDqjI/n7pHlcsBpBo1QrAYG5c8yNm16IoE4k9daXG2uutqENe4vQtjMov38dbhdAtNlmnh5TfgSzABi6GPrn5tYephrYN6r2YRa86CCla2GkX+eAo6iT1BOh+jbLYsndvXMgLSENrgKThgV8XzFo3YktAeALzz2v8sNAW4ayflnRqC3Jme0EDxWDjhRhqenm049oDfeFQuIqQKBsPXPZGzcATjj5QkijhS9ZA7Xq18+vmRaUZXnvpPvjSN/M3R5Bh0UwwY7aZwQM0XbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceQNnZymChzCyf5b70i8P7/a30Vc05rIQbvINyTfyeE=;
 b=cklFIrBlQ9C69CZ2DHqGF5FbcX+irmlVJ0eSzEvEAs17PjddQpyI0i9rBuTueGXrdvNYyU3jB2ACi6nWdqXtlrx8Xd1PU/FtahaAG1ggt/VGkNTvu1uwzzSqZdEd7z4DGAryd7bpRWdXa7FIVa8/MzQjVjIlwVr8av3JgIFPEp2BBEanzoR6UHHuayr96+EVRk+KGt1BvndXo3e8/I4U9BEoM64HtJI6UJVkcWNY4wize+AHMU7GKqR8H2uzn1R1G+ywi3BR06CUl43EZXQg5GN8AnSBVgW4VRig+2GIeGtUASDeWlH2GYsr6V6aG9hR75zhg0Cn/fxAUDF/YXZamw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3115.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 17:32:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 17:32:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
Thread-Topic: [PATCH] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
Thread-Index: AQHZikaJyM9xbPYUt0+qwS9k8ugrrK/a3roA
Date: Fri, 4 Aug 2023 17:32:28 +0000
Message-ID: <8011d806-5b30-bf26-2bfe-a08c39d57e20@csgroup.eu>
References: <20230519113806.370635-1-mpe@ellerman.id.au>
In-Reply-To: <20230519113806.370635-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3115:EE_
x-ms-office365-filtering-correlation-id: a67d9637-cbe0-464b-d436-08db9510c69b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /MqhTvppQ3jtXnkVPob99l0bWOcR4oIM3vwLsIUAcUNfrGwUlhYAob5+NFiioq3Npwz+eK8rPdQPJHWDy8ofBhTpMWSZnIqBTvtM9SzKgXWwil1/eQ4/9QLhUmATIrPYBGljujMHngnB1wyKObdVJwvg0xJCEBMYfmQ4zJGRNGlg2NydxaRMLfEXbDDAl29RDwMBLg7YM//gcKGriqGELUZn/ivc33sBZe7wAZkgeAfkD6PoPoEH7QKI6Dke7egxSmY60FJkHrDrzf7A3sJ2eFPZYbl7x77yOccSzIGUYrYbf3q0aQnVqiRrCeJ/zJdrpTR1T+RjN++kWMRr2p0Pn2HpIAy1eci4DUdFHMW8S3uaNjl+rJ9KATrSlU/4BtMonIxC/6HyftOLZr7bB+huFejvPD4uGbEF5l/2l78neaiN80pydTi0pcxkjCK3CjQp019p5PzB/1BVUBmTCPgzB5LJUtuJKiNvjFsEnw8i1Q99A3/rU3Z81EbgSkj5o4FNe9N+ZvqwddfuPc5hStWWHEqDFYQieA1E5hix0Ctc7RFu6Jlw75h0WztutThQRjopU3hfAg01iLn9OP9NOGR/45h9R8NTaTWIQDv0LFvd+ztmSVzle4FMLqmoF30MZI+jVbSJC4Xg9NkyHsyuMdpRqS/0UN0W3UrZR7PfdKoLlZgo84/esgq/tY+WTGLb4Byr
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(451199021)(1800799003)(186006)(41300700001)(2616005)(66574015)(71200400001)(26005)(83380400001)(66476007)(91956017)(316002)(66946007)(2906002)(66556008)(5660300002)(76116006)(64756008)(4326008)(66446008)(122000001)(8676002)(6512007)(44832011)(6486002)(8936002)(110136005)(54906003)(478600001)(38100700002)(6506007)(86362001)(36756003)(31696002)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WlVRRlo0S1dWQnNva0NicGVYMk8vblhnOWg4U3dvbVhoWkdnUTJDYUg2QmZJ?=
 =?utf-8?B?UjdjUjMvRDdna0x6cU55SEtQMjdqRXMwWUxMTzN3dmREc2REWDVlazI4M3o2?=
 =?utf-8?B?Q2RXTm9NUUlSaldQQWp5YWNMQ3BQMTJ0aGJGeVZMdkQvZlZpd2tBdmhDZFMr?=
 =?utf-8?B?K1FFSFNPd3FXTHJWcUxrSDVYclhaUDBDdWNyUFlVNzBhdTZSUVBwQTRFUW5Z?=
 =?utf-8?B?US9sYkNqRHVWVk1LWVRtRXJvRlBQczVxRlZpRG1CWXRuVGlSS0VNaTBlRTdD?=
 =?utf-8?B?cFkvaHlIYitlMGtnNXhCQ0ZVbzA5eDZJOC9INEQ1RkdwMGxkY0VRMXFlZXFj?=
 =?utf-8?B?NU5oeVJ6bXFobi9vak1UVVlOdkNBd2dKK29iVGl0L0NkVlRpbWsrS3kzdTI5?=
 =?utf-8?B?eDFodWlvVWFaQVQ4aElsZjN6c2Z2U210alBNWHd4ajNGMGhld0YwU3hRVVZI?=
 =?utf-8?B?RGw1bzBoSDkzUjF1RWFHekxqS1NoL29zZ0VMMWl6dDVxa1IrRXp5eGZVTk5Q?=
 =?utf-8?B?bXhqVXE5cFBQTEQxcTkxZVhVakNRYmtaRDNKSDdDU3l1VXByN3c4UWhqakxy?=
 =?utf-8?B?UU9QSjVhNEtoUGptRHhFZno4TVhrY05zS0VnM2VjdTF3OEI3ZVZaN1o1L3lm?=
 =?utf-8?B?RDZSVUVNZ3ZTQkZqRElZUU83NmF5L3Q2K3d5VytBRncxcjRCWGFuN2FObEJv?=
 =?utf-8?B?cUEzRlVTekwrRGlhSWRQa2xSZlp6dWdUSTRiZEZGdDhSbXhDT2gzY3A2dnZw?=
 =?utf-8?B?dE9XUk9zM053YWhvamJ1YjNjNms2T1hUeTREcTFTVUlFdDFOTXQrOStoVCt0?=
 =?utf-8?B?MUIrTmNkYU1ablFjY3A0R0JvczFsL1lPaUVKUno1R29Pd1p5ZWRwTFA5TWNK?=
 =?utf-8?B?WmkzeldOZmpjamRWV2oySms1aXdlQzBxMHNsWFFiTDFha1RGaWtpWm9DU1l5?=
 =?utf-8?B?bmptanpYc0haTDZNT25oVlJvUlE1Slk0ejBDbU1KWm8xenlDbnBPUC80UWtB?=
 =?utf-8?B?QmpWZ2JTMi9tcGhuR2l3Yi9kNzhNQUNKbjJqRVlsYnJEUDQ4ZDZTcmpjQlIy?=
 =?utf-8?B?YkU4WjNJVFhzZTdJYlJJTlFSOW8yb2QwM1Bmb1l3aTZFSWJnNGlkbktldmJt?=
 =?utf-8?B?bVEzSUhtNzhaVURpSm1UYS9IMkttOVJ1R3Q5UmVSNlUvQ0J1MitHTlhOQnZ0?=
 =?utf-8?B?YzFWR2tyZ0FCRnU2SUM3a3gyYm1IOHArb1BBOE1hd1dnclFMd0R6UXdFTmpa?=
 =?utf-8?B?bFoydkYyWkZSbkt3R044M0dOOFhmMXJNa2lLQXE2UlFGbUdMYXptM2FRQzlw?=
 =?utf-8?B?WUowRDljb2dhakNiUzZCOGlyRzJsYkRVSHNwUVJsWkliKzRVTXl4Vkc3bFAz?=
 =?utf-8?B?eFJIREl0bGhVSHpnRmR3UHZML3llcjE2V2szV0xWWUIrVHBFTGcwNlNqKy9m?=
 =?utf-8?B?d3JwWFE1bEJDSWxta3FBQkNkWnQrN3JNYUpINXNZSVNOcC9VTnQ0bllFUnJo?=
 =?utf-8?B?QlpGOWVZdmZrNm1OYzEvR3FHbGoyelNIZTBQSDh1RGFYaXEyQ3BsWHNPcDln?=
 =?utf-8?B?VThpVVk4Z2tiUDE1SVVXTlZWU2Fub2Y4UHAvamxRMUhVNGNUNnBwcjRVY2tR?=
 =?utf-8?B?UktVeHU5ODVnWWwzOXJUYjF5RjJ5VjZEYWxld2tKNFVybXVrVDZ1aWswWDk1?=
 =?utf-8?B?SzJqS0hZVzlJT2JSNTVLaW1IQkhmRG0xbi9SR0s4dlNTMENnUi9zSHlNZkpt?=
 =?utf-8?B?Yy90ZlVyVlBJZ0U1OEQvZXZmUFBDVFZkcUlYOXc5aXdJblhzTVB1UkJZUFRP?=
 =?utf-8?B?a3o5VUxxVjAwMnFrZ3JoQUxLZHMzdFYwSTA1ajlqTjY4OHFsSklLaWRMcWtN?=
 =?utf-8?B?UnNUcURBYnB1SS9xUDNzQlpIQmhCRHJxUThRY1Nlb1drOHEwaC9sdjNtanVa?=
 =?utf-8?B?dFJpSGFYWVg4eWdSSlZvSTJQajljK1ZYNlZJaUlZaU1SOVR3c0Z0ZU5vY0ln?=
 =?utf-8?B?U0MvQm1nei9VbUZMNmJuRmIwK3lIdHVVUFE3SFUzZEdMcmVjWm0xVlo5K092?=
 =?utf-8?B?OXJvNTN5TCtPdmw0MysvOVhDRTBKRzUxT0treEpPOVg4eEdiREZoM2hJZnQ1?=
 =?utf-8?B?eDZ6a1FreU5PSVRQOSsvZzBCSTVzUWNIcEFHRjNkYVNNUVlQMXZ0Qk1PQjk5?=
 =?utf-8?B?MWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F888BC3A847F584A8EAB336437665C9F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a67d9637-cbe0-464b-d436-08db9510c69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 17:32:28.7084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1xsPJeQi5yjUjJNBsf1C5ohi2bLHQ7v4PvXbqHhnozcWAeb8HvobiyYBhZmIznWrMrSJWHYlhZTzZ8kINmz4XDCjx+Sgze7mOJaIBaQP4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3115
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA1LzIwMjMgw6AgMTM6MzgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ29tbWl0IDFlOGZlZDg3M2U3NCAoInBvd2VycGM6IGRyb3AgcmFuZ2VzIGZvciBkZWZpbml0
aW9uIG9mDQo+IEFSQ0hfRk9SQ0VfTUFYX09SREVSIikgcmVtb3ZlZCB0aGUgbGltaXRzIG9uIHRo
ZSBwb3NzaWJsZSB2YWx1ZXMgZm9yDQo+IEFSQ0hfRk9SQ0VfTUFYX09SREVSLg0KPiANCj4gSG93
ZXZlciByZW1vdmluZyB0aGUgcmFuZ2VzIGVudGlyZWx5IGNhdXNlcyBzb21lIGNvbW1vbiB3b3Jr
IGZsb3dzIHRvDQo+IGJyZWFrLiBGb3IgZXhhbXBsZSBidWlsZGluZyBhIGRlZmNvbmZpZyAod2hp
Y2ggdXNlcyA2NEsgcGFnZXMpLCBjaGFuZ2luZw0KPiB0aGUgcGFnZSBzaXplIHRvIDRLLCBhbmQg
cmVidWlsZGluZyB1c2VkIHRvIHdvcmssIGJlY2F1c2UNCj4gQVJDSF9GT1JDRV9NQVhfT1JERVIg
d291bGQgYmUgY2xhbXBlZCB0byAxMiBieSB0aGUgcmFuZ2VzLg0KPiANCj4gV2l0aCB0aGUgcmFu
Z2VzIHJlbW92ZWQgaXQgY3JlYXRlcyBhIGtlcm5lbCB0aGF0IGJ1aWxkcyBidXQgY3Jhc2hlcyBh
dA0KPiBib290Og0KPiAgICBrZXJuZWwgQlVHIGF0IG1tL2h1Z2VfbWVtb3J5LmM6NDcwIQ0KPiAg
ICBPb3BzOiBFeGNlcHRpb24gaW4ga2VybmVsIG1vZGUsIHNpZzogNSBbIzFdDQo+ICAgIC4uLg0K
PiAgICBOSVAgaHVnZXBhZ2VfaW5pdCsweDljLzB4Mjc4DQo+ICAgIExSICBkb19vbmVfaW5pdGNh
bGwrMHg4MC8weDMyMA0KPiAgICBDYWxsIFRyYWNlOg0KPiAgICAgIGRvX29uZV9pbml0Y2FsbCsw
eDgwLzB4MzIwDQo+ICAgICAga2VybmVsX2luaXRfZnJlZWFibGUrMHgzMDQvMHgzYWMNCj4gICAg
ICBrZXJuZWxfaW5pdCsweDMwLzB4MWEwDQo+ICAgICAgcmV0X2Zyb21fa2VybmVsX3VzZXJfdGhy
ZWFkKzB4MTQvMHgxYw0KPiANCj4gVGhlIHJlYXNvbmluZyBmb3IgcmVtb3ZpbmcgdGhlIHJhbmdl
cyB3YXMgdGhhdCBzb21lIG9mIHRoZSB2YWx1ZXMgd2VyZQ0KPiB0b28gbGFyZ2UuIFNvIHRha2Ug
dGhhdCBpbnRvIGFjY291bnQgYW5kIGxpbWl0IHRoZSBtYXhpbXVtcyB0byAxMCB3aGljaA0KPiBp
cyB0aGUgZGVmYXVsdCBtYXgsIGV4Y2VwdCBmb3IgdGhlIDRLIGNhc2Ugd2hpY2ggdXNlcyAxMi4N
Cg0KVGhlcmUgaXMgc29tZXRoaW5nIHdyb25nOg0KDQp+IyBlY2hvIDEgPiAvc3lzL2tlcm5lbC9t
bS9odWdlcGFnZXMvaHVnZXBhZ2VzLTgxOTJrQi9ucl9odWdlcGFnZXMNCnNoOiB3cml0ZSBlcnJv
cjogSW52YWxpZCBhcmd1bWVudA0KDQokIGdyZXAgLWUgTUFYX09SREVSIC1lIEtfUEFHRVMgLmNv
bmZpZw0KQ09ORklHX1BQQ180S19QQUdFUz15DQojIENPTkZJR19QUENfMTZLX1BBR0VTIGlzIG5v
dCBzZXQNCkNPTkZJR19BUkNIX0ZPUkNFX01BWF9PUkRFUj0xMA0KDQoNCkluIHRoZSBwYXN0IE1B
WF9PUkRFUiB1c2VkIHRvIGJlIDEyIGJ1dCBub3cgaXQgaXMgZm9yY2UgdG8gMTAuDQoNCkNocmlz
dG9waGUNCg0KDQoNCg0KPiANCj4gRml4ZXM6IDFlOGZlZDg3M2U3NCAoInBvd2VycGM6IGRyb3Ag
cmFuZ2VzIGZvciBkZWZpbml0aW9uIG9mIEFSQ0hfRk9SQ0VfTUFYX09SREVSIikNCj4gU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyB8IDYgKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gSSBwbGFuIHRvIG1lcmdlIHRoaXMgdmlhIHRoZSBwb3dlcnBj
IGZpeGVzIGJyYW5jaC4NCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBi
L2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IGluZGV4IDUzOWQxZjAzZmY0Mi4uYmZmNTgyMGI3Y2Rh
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZw0KPiBAQCAtOTA2LDExICs5MDYsMTcgQEAgY29uZmlnIERBVEFfU0hJRlQNCj4g
ICANCj4gICBjb25maWcgQVJDSF9GT1JDRV9NQVhfT1JERVINCj4gICAJaW50ICJPcmRlciBvZiBt
YXhpbWFsIHBoeXNpY2FsbHkgY29udGlndW91cyBhbGxvY2F0aW9ucyINCj4gKwlyYW5nZSA3IDgg
aWYgUFBDNjQgJiYgUFBDXzY0S19QQUdFUw0KPiAgIAlkZWZhdWx0ICI4IiBpZiBQUEM2NCAmJiBQ
UENfNjRLX1BBR0VTDQo+ICsJcmFuZ2UgMTIgMTIgaWYgUFBDNjQgJiYgIVBQQ182NEtfUEFHRVMN
Cj4gICAJZGVmYXVsdCAiMTIiIGlmIFBQQzY0ICYmICFQUENfNjRLX1BBR0VTDQo+ICsJcmFuZ2Ug
OCAxMCBpZiBQUEMzMiAmJiBQUENfMTZLX1BBR0VTDQo+ICAgCWRlZmF1bHQgIjgiIGlmIFBQQzMy
ICYmIFBQQ18xNktfUEFHRVMNCj4gKwlyYW5nZSA2IDEwIGlmIFBQQzMyICYmIFBQQ182NEtfUEFH
RVMNCj4gICAJZGVmYXVsdCAiNiIgaWYgUFBDMzIgJiYgUFBDXzY0S19QQUdFUw0KPiArCXJhbmdl
IDQgMTAgaWYgUFBDMzIgJiYgUFBDXzI1NktfUEFHRVMNCj4gICAJZGVmYXVsdCAiNCIgaWYgUFBD
MzIgJiYgUFBDXzI1NktfUEFHRVMNCj4gKwlyYW5nZSAxMCAxMA0KPiAgIAlkZWZhdWx0ICIxMCIN
Cj4gICAJaGVscA0KPiAgIAkgIFRoZSBrZXJuZWwgcGFnZSBhbGxvY2F0b3IgbGltaXRzIHRoZSBz
aXplIG9mIG1heGltYWwgcGh5c2ljYWxseQ0K
