Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCFA562F2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 10:55:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ8Dl2h5fz3dsb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 18:55:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h/EIfkOg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h/EIfkOg;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ8Cz6Bwbz3c7h
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 18:55:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4Zm2Qo4yGyxJ30A7bMq+qBjXfJxft9e0OsSWtRdS6qFCy7vgeUREvP/SEog5DtZTI/fMF8zWqW4kPQUHjVG3aCcxDprvu0T4anRy8fCA8vgJ9sXGLJ3SW/1/8Vgo0JcBPp+lPlzPCAnSKoo/mo6XK2qvCnGNAninnoymVL1GIYNTmSCWWEodlFf41+Nmncqaoldq1xP5xkM25RApqR6fEqfGzAxD59sS2qNVaQnoM677/gjsr5DMRNGu/cxsCj9fnhjzgwT4dPGmXZarbJoip/yai4wryAZ9hKutx1s32KD2BL2nKpc9zYU8cuNFeZZb5C/3PzlJIKOXXcJJ0mJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml0AXf9dwT04QcS728BCd8cgvT8g5POAYmzDA6pF/Sc=;
 b=lATMpzkbUOgHtu6PJ7sRhPXUT8aFCc+0OhCHeqG7Jgmu7bImxWTobku4OH5UztYoGnOCLcpYdaDCunMbuL5Mvw+wIFZqW7UtPgNlAdh8RFZgnFPv5gzfftUmiGqpTOk6FnFWR6av5o3t2WJiAmxnfttVBeMs9EUv8MnGmYd2CeTxy7GoKBXVgy7do7tn8+skL7LdkjW+3XW30WTUluLkw1TzavwrVCgGogNORSWMYdwczkb7OkWhZwVG0qqA1U5NdmJuhTDMV2huf5NmLnu9KKAv8au3aTHVO7Xs44Ma5qW5GjJiO4IAb48Uudh/g+KMxmNeiolIaTfzWz6SoKYdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml0AXf9dwT04QcS728BCd8cgvT8g5POAYmzDA6pF/Sc=;
 b=h/EIfkOgCiSX33bK+vwIShRciX3M2uY+oM1bDD40pB551UnH6MI0eG6VkAlcRtTDWYlziNxtXIqNj5c4HZDORVHkeKt6267AAa78C6O7tqSboZ/pG00RWXwpQZDdvm62b0am39tN4ut5dnNikbR20DgDg0AZBE8FKsVnO6LkjEewHI5+Lf719lDDi7fyN4t5N5Ua4CzjcBVkNz344ejYlJHSsygacZgt2A82JWnZn4ojXJr0SNM/cEopy2f0Qgo5u8i8OF8TI2lIaeIGawgxkBDKB/WNP4l1ectZIbAzmba6P8CLEufKFBnfWN3OxuV6AvAlXtFGh45qb4jjpjBk3g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3905.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 08:54:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 08:54:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 08/13] powerpc/hw_breakpoint: Avoid relying on caller
 synchronization
Thread-Topic: [PATCH v2 08/13] powerpc/hw_breakpoint: Avoid relying on caller
 synchronization
Thread-Index: AQHYitZo2ef+XoeA/keVuMHbOZq9GK1pOsOA
Date: Fri, 1 Jul 2022 08:54:50 +0000
Message-ID: <045a825c-cd7d-5878-d655-3d55fffb9ac2@csgroup.eu>
References: <20220628095833.2579903-1-elver@google.com>
 <20220628095833.2579903-9-elver@google.com>
In-Reply-To: <20220628095833.2579903-9-elver@google.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 648cfb63-ec4c-47e0-92aa-08da5b3f5b99
x-ms-traffictypediagnostic: MR1P264MB3905:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gtG6f9YjRKBlyaqRfiDtMg/Hu6Rl1aXS/C0v8G2XxTAzjo/8/v+f4gojdgHUKZyQ5dIxztzPb4W6rSexgkcRiGhIV9dcxWsdTRIKNn+jFEwgXD+cjgr9iNhVyJBNnjmEnfdCbCQO+P5sTjew1ZDuHaMTF7Wvz2SY/HDbzfZCRNn4vJ8/heMNTmhRfAdUIUdxtL4QYZwkLO58CqFEPispo884Qs9OESFHRbftU7LTsuGL/DgMdrnh1DMX2AUFJpZRrnvhBryHCIAtn9a84XuGYUuCyURamk3XSjNs7pDCMC25ECpIeNuoKNXjFaxhgGdDDynhaEnPT2shGBw6CzSPIBN6aHZ2trLWUBptbh3tgfpa0Vh2gN0KJ+vMb6RJAnNmqEbe8MoQwrz+r36yrA0Bk7OfT2VTk/c6UjYrcgzXEt7+D5yLHeVK3Q/Wlz5jVLZ4N6wWB6oNuhxG2Xjmf9NlBFeHygbDjWQCDr9+DTcCyib+2j/lvNOGOvWQK64ITD/gQR0NjHn0r82WMxiDzX2fOG6cSGTSzhHudhyi6MWdQSrSRak5Zq9DlyeyISmyLfAjn9/5/hHGhWqjo1skgEDvtDkeEOMbEwz/wmhTXMX+sjDmYWECH+2+ohvc5/AwTY3TLFSJNxzO9Vzq06YHyv+t3YTAE4PJNpo7ntKrJidCPKpQMNUAHxbQKjkkoS1tzzEjnM9Mk5pg/eSQ/LgwWZOskKoZIjj96N/DqS+Uv66KLFYjDMtA0CvIAp+s7LrhGZRIvDhG0TpyLXzilw3V7Z3droRof4skxH8MuxxGud0ROelNO4CvIifqsTpie8UJV771OnVuYaxNIqQHIAAYZIjFWx5s7vwXkRtOP7Ekzb6TqmG2+apojrUSNQEpYj6UJmSSCZAK6Y+ZgJGDCZ7o4yX1c7x2RBVTrmIwJAGnpANCaDE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(316002)(71200400001)(38070700005)(54906003)(31696002)(66476007)(122000001)(66946007)(8676002)(66556008)(66446008)(86362001)(64756008)(91956017)(4326008)(6486002)(26005)(76116006)(6512007)(966005)(6506007)(2616005)(44832011)(5660300002)(478600001)(8936002)(41300700001)(2906002)(110136005)(7416002)(66574015)(186003)(38100700002)(83380400001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d05zZGpCVHZsekhYUExSaXU3Y2N6akZuc3NYOTlxQmNVWlAva3oxWFZ4YXZy?=
 =?utf-8?B?dW9udGtZY2JCcFh5cmdWd1ZPN2k1enpHOHp2UXlpbjJhQjlsZjBOanY3Mkkv?=
 =?utf-8?B?R3lrNVpxME8yc0xFSXNnVy9kVGlHejNmYVMzbmI0R2JOMXQzYlhPK05VN0ZV?=
 =?utf-8?B?Ui9pbjdXWmpEOWFLWDBPRllNdE5RcDRrS1B5V1l5US8zemNCNyt4UWhzelJs?=
 =?utf-8?B?V1ljdW9DNXpBbzVaQXFvcERKNHhXUXEvS3FqQy8rdUMxY3pEcThsSnlPTFJl?=
 =?utf-8?B?UmFPenhkQm1VVmNQRU1Yc1RUd3F4RWpOTmVXc3BpSnRuQmV5SS9ucm4yZitp?=
 =?utf-8?B?bUtBZXhjamM1VVQzVnhzZE5KSTRnRERrWGljUDR6ZDN3dVliR0ErSDkraG11?=
 =?utf-8?B?WmFZdHZ2Q2JXdnoxbWNBRGZwdUFnWDR2a3dSZWpIREQyQzF4S1FhaS9wTStM?=
 =?utf-8?B?U3BVVGRDbkhJRmFUZVZ5K1Fheks1Y3owT3RhaWFzY2s0di9WMUk3bXZGVk5h?=
 =?utf-8?B?L04valI3N29MQTFRVGpsaWRZdHV2U0tjUm5PZEZScTRCaFpUNkRodWVsaXpT?=
 =?utf-8?B?TUpqcWY5ckJxeGs2U0VlRlJsZTVYQ3hJZ0x0VWcxYWxYVHJ6cGExZ1BHZ3JS?=
 =?utf-8?B?UEJNYlVBZzZ4bWRYWURuNDVvclNTYUNYWU11Mi96YlA1K2p5d2hmNlpzQjFh?=
 =?utf-8?B?UnpBWWFOUVJwMjlSSUYwOS9CZ1BlWUVualo5VmtlMnVPUjF3K3BRNTEwSGNt?=
 =?utf-8?B?TzhvNUdsQnRpOXFHaFdUN054QVdPWVBYTEN0dTkwcjhpMG95YWwyUXlYQTh6?=
 =?utf-8?B?c3p6RU8vWjFob3RNVGdRSzVuSndRdjd4a3Q0dW53MGI5U0NXcXNTM29Nd2hw?=
 =?utf-8?B?U3RubGdKVTluRjZFbDVjRk5JQ0gwaTh6SkFpcCtwcm5INlFDUzFFSDNWVE9J?=
 =?utf-8?B?ekw5bEpTZXJaOUdMTmhQWDkvc29ib1o1VllCUG02Zll1eHNIdk9BdWtFMkRv?=
 =?utf-8?B?aXBqMGxmOEVzSVlrQjN3N0g1NyttZFlyY2ZmWjBlRjh3QUc0L1M2Z1BWL3lD?=
 =?utf-8?B?M3Ira1ZxV0xiS1MweStPeGdFYkRSVnEvZmhEd0JUWHZhWUdaaDR6SWNjcHRJ?=
 =?utf-8?B?VWlQRmRkUzc4YjAvUUc5QTlsNGNtOVUyOXBXdmFOTkY1UWo0cjNtNmZ0czRO?=
 =?utf-8?B?UnRFN0JUM0c3VGE0TEN2Rlk1UWUxUklvWlBXek5ab2IrMC90b01TdlJHTjdl?=
 =?utf-8?B?SkZHVEFVell2NkJKOHo5UGQ5bEVGU2hBZmNCUW03d1M4YktLVDFCa09uaE85?=
 =?utf-8?B?eWh4cWRYd1ZpODJLYWtHYzdPS1JmMy9aajhtS0xvZm4zRUJuenpaOEczRC9k?=
 =?utf-8?B?enVhSXBRZ09QaXdGRHdpYjh5RmxjZkE4em5OeXdFUTMxeGNjQVlnN1BWaXdW?=
 =?utf-8?B?THJnc2lYZjV5RXhFemRJamp2VnNSSndTMnQ4WWZjVVI2MVRzTTBWWVhyUHA0?=
 =?utf-8?B?MnhXZzc2TFB0V2tCelluTmIzVjk5UG9GUlZja3luNGoyNUJkSVVBWkdwKzFZ?=
 =?utf-8?B?UWZWdXJpY3JpTUNoaXdyaG5zSUNJVmRlazZaRDFaUExsL0YyNTF6RzdlYUtP?=
 =?utf-8?B?WjJVMmRLUTcweTZxeW9saVNWbWp4UDZhS3JaMXdYcWRQU1ZWOW9URUtzNVhJ?=
 =?utf-8?B?OExSckJQWE02VlJ2TGhRM2g2dXBSRUk1ZW9CaXZ1UnZUbU44VVdFTFhYNVFF?=
 =?utf-8?B?MWJJSStXdVNoOVRRaVFCUGhwRGtZdVd5QXNQbGhpaEdIM0V6TitxNk8vaXBi?=
 =?utf-8?B?eElnU1M5WGtnRUFQc2J4Nmw0WUZtTUhZdlJEelI3NGFUaHlyVmNsMDZ1VW91?=
 =?utf-8?B?ZE45N09HWTFLcGE5UmQxNTBhdnVITVcvQUd2aEE1MWZvY3FiTjFXYVNGa0sy?=
 =?utf-8?B?dkprS3hJL09BWlZnYVp4VUgwVWZoaFdQZ0dkcHhsUWxaSS80UjkvNkhrVVp0?=
 =?utf-8?B?SDlwVlpaaEtWeGlzcWRFODdSazAxOWFLSm03NVJOZlJueWVjNUtFVXJDeVkr?=
 =?utf-8?B?YitmWS9DOHFXNTVGZzNpSys3bHpYSiszQ2FhS0pxRzV3R1hxMmZSWWRReThP?=
 =?utf-8?B?NjR5d2Z0SkFSUjJUbTdNWUNtVVY3c3l1MXN5WVlRVnhmZVNRSDFXc3QwVklx?=
 =?utf-8?Q?SuWmzjV0QUyBbLIlKcenV00=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1313F1B72640054D94F22125F9DEAEA1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 648cfb63-ec4c-47e0-92aa-08da5b3f5b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 08:54:50.3892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIlfDkeBTxSkRly27JzfH1HNmArr35se3ge6DGPa7l5LflqnhAJQUiCJmCVH1I0HZgkHBzWyDHzG4yTrHxX1qdrLtXlwYkP4Db0BdE6DPJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3905
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWFyY28sDQoNCkxlIDI4LzA2LzIwMjIgw6AgMTE6NTgsIE1hcmNvIEVsdmVyIGEgw6ljcml0
wqA6DQo+IEludGVybmFsIGRhdGEgc3RydWN0dXJlcyAoY3B1X2JwcywgdGFza19icHMpIG9mIHBv
d2VycGMncyBod19icmVha3BvaW50DQo+IGltcGxlbWVudGF0aW9uIGhhdmUgcmVsaWVkIG9uIG5y
X2JwX211dGV4IHNlcmlhbGl6aW5nIGFjY2VzcyB0byB0aGVtLg0KPiANCj4gQmVmb3JlIG92ZXJo
YXVsaW5nIHN5bmNocm9uaXphdGlvbiBvZiBrZXJuZWwvZXZlbnRzL2h3X2JyZWFrcG9pbnQuYywN
Cj4gaW50cm9kdWNlIDIgc3BpbmxvY2tzIHRvIHN5bmNocm9uaXplIGNwdV9icHMgYW5kIHRhc2tf
YnBzIHJlc3BlY3RpdmVseSwNCj4gdGh1cyBhdm9pZGluZyByZWxpYW5jZSBvbiBjYWxsZXJzIHN5
bmNocm9uaXppbmcgcG93ZXJwYydzIGh3X2JyZWFrcG9pbnQuDQoNCldlIGhhdmUgYW4gc3RpbGwg
b3BlbmVkIG9sZCBpc3N1ZSBpbiBvdXIgZGF0YWJhc2UgcmVsYXRlZCB0byANCmh3X2JyZWFrcG9p
bnQsIEkgd2FzIHdvbmRlcmluZyBpZiBpdCBjb3VsZCBoYXZlIGFueSBsaW5rIHdpdGggdGhlIA0K
Y2hhbmdlcyB5b3UgYXJlIGRvaW5nIGFuZCB3aGV0aGVyIHlvdSBjb3VsZCBoYW5kbGUgaXQgYXQg
dGhlIHNhbWUgdGltZS4NCg0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1
ZXMvMzgNCg0KTWF5YmUgaXQgaXMgY29tcGxldGVseSB1bnJlbGF0ZWQsIGJ1dCBhcyB5b3VyIHNl
cmllcyBtb2RpZmllcyBvbmx5IA0KcG93ZXJwYyBhbmQgYXMgdGhlIGlzc3VlIHNheXMgdGhhdCBw
b3dlcnBjIGlzIHRoZSBvbmx5IG9uZSB0byBkbyB0aGF0LCBJIA0KdGhvdWdodCBpdCBtaWdodCBi
ZSB3b3J0aCBhIGhhbmQgdXAuDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBSZXBvcnRl
ZC1ieTogRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAqIE5ldyBw
YXRjaC4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9od19icmVha3BvaW50LmMgfCA1
MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MCBp
bnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaHdfYnJl
YWtwb2ludC5jDQo+IGluZGV4IDI2NjlmODBiM2E0OS4uOGRiMWExNWQ3YWNiIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMva2VybmVsL2h3X2JyZWFrcG9pbnQuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KPiAgICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4NCj4g
ICAjaW5jbHVkZSA8bGludXgvc21wLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9pbml0
Lmg+DQo+ICAgDQo+IEBAIC0xMjksNyArMTMwLDE0IEBAIHN0cnVjdCBicmVha3BvaW50IHsNCj4g
ICAJYm9vbCBwdHJhY2VfYnA7DQo+ICAgfTsNCj4gICANCj4gKy8qDQo+ICsgKiBXaGlsZSBrZXJu
ZWwvZXZlbnRzL2h3X2JyZWFrcG9pbnQuYyBkb2VzIGl0cyBvd24gc3luY2hyb25pemF0aW9uLCB3
ZSBjYW5ub3QNCj4gKyAqIHJlbHkgb24gaXQgc2FmZWx5IHN5bmNocm9uaXppbmcgaW50ZXJuYWxz
IGhlcmU7IGhvd2V2ZXIsIHdlIGNhbiByZWx5IG9uIGl0DQo+ICsgKiBub3QgcmVxdWVzdGluZyBt
b3JlIGJyZWFrcG9pbnRzIHRoYW4gYXZhaWxhYmxlLg0KPiArICovDQo+ICtzdGF0aWMgREVGSU5F
X1NQSU5MT0NLKGNwdV9icHNfbG9jayk7DQo+ICAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVj
dCBicmVha3BvaW50ICosIGNwdV9icHNbSEJQX05VTV9NQVhdKTsNCj4gK3N0YXRpYyBERUZJTkVf
U1BJTkxPQ0sodGFza19icHNfbG9jayk7DQo+ICAgc3RhdGljIExJU1RfSEVBRCh0YXNrX2Jwcyk7
DQo+ICAgDQo+ICAgc3RhdGljIHN0cnVjdCBicmVha3BvaW50ICphbGxvY19icmVha3BvaW50KHN0
cnVjdCBwZXJmX2V2ZW50ICpicCkNCj4gQEAgLTE3NCw3ICsxODIsOSBAQCBzdGF0aWMgaW50IHRh
c2tfYnBzX2FkZChzdHJ1Y3QgcGVyZl9ldmVudCAqYnApDQo+ICAgCWlmIChJU19FUlIodG1wKSkN
Cj4gICAJCXJldHVybiBQVFJfRVJSKHRtcCk7DQo+ICAgDQo+ICsJc3Bpbl9sb2NrKCZ0YXNrX2Jw
c19sb2NrKTsNCj4gICAJbGlzdF9hZGQoJnRtcC0+bGlzdCwgJnRhc2tfYnBzKTsNCj4gKwlzcGlu
X3VubG9jaygmdGFza19icHNfbG9jayk7DQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4g
QEAgLTE4Miw2ICsxOTIsNyBAQCBzdGF0aWMgdm9pZCB0YXNrX2Jwc19yZW1vdmUoc3RydWN0IHBl
cmZfZXZlbnQgKmJwKQ0KPiAgIHsNCj4gICAJc3RydWN0IGxpc3RfaGVhZCAqcG9zLCAqcTsNCj4g
ICANCj4gKwlzcGluX2xvY2soJnRhc2tfYnBzX2xvY2spOw0KPiAgIAlsaXN0X2Zvcl9lYWNoX3Nh
ZmUocG9zLCBxLCAmdGFza19icHMpIHsNCj4gICAJCXN0cnVjdCBicmVha3BvaW50ICp0bXAgPSBs
aXN0X2VudHJ5KHBvcywgc3RydWN0IGJyZWFrcG9pbnQsIGxpc3QpOw0KPiAgIA0KPiBAQCAtMTkx
LDYgKzIwMiw3IEBAIHN0YXRpYyB2b2lkIHRhc2tfYnBzX3JlbW92ZShzdHJ1Y3QgcGVyZl9ldmVu
dCAqYnApDQo+ICAgCQkJYnJlYWs7DQo+ICAgCQl9DQo+ICAgCX0NCj4gKwlzcGluX3VubG9jaygm
dGFza19icHNfbG9jayk7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qDQo+IEBAIC0yMDAsMTIgKzIxMiwx
NyBAQCBzdGF0aWMgdm9pZCB0YXNrX2Jwc19yZW1vdmUoc3RydWN0IHBlcmZfZXZlbnQgKmJwKQ0K
PiAgIHN0YXRpYyBib29sIGFsbF90YXNrX2Jwc19jaGVjayhzdHJ1Y3QgcGVyZl9ldmVudCAqYnAp
DQo+ICAgew0KPiAgIAlzdHJ1Y3QgYnJlYWtwb2ludCAqdG1wOw0KPiArCWJvb2wgcmV0ID0gZmFs
c2U7DQo+ICAgDQo+ICsJc3Bpbl9sb2NrKCZ0YXNrX2Jwc19sb2NrKTsNCj4gICAJbGlzdF9mb3Jf
ZWFjaF9lbnRyeSh0bXAsICZ0YXNrX2JwcywgbGlzdCkgew0KPiAtCQlpZiAoIWNhbl9jb19leGlz
dCh0bXAsIGJwKSkNCj4gLQkJCXJldHVybiB0cnVlOw0KPiArCQlpZiAoIWNhbl9jb19leGlzdCh0
bXAsIGJwKSkgew0KPiArCQkJcmV0ID0gdHJ1ZTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICAg
CX0NCj4gLQlyZXR1cm4gZmFsc2U7DQo+ICsJc3Bpbl91bmxvY2soJnRhc2tfYnBzX2xvY2spOw0K
PiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qDQo+IEBAIC0yMTUsMTMgKzIzMiwx
OCBAQCBzdGF0aWMgYm9vbCBhbGxfdGFza19icHNfY2hlY2soc3RydWN0IHBlcmZfZXZlbnQgKmJw
KQ0KPiAgIHN0YXRpYyBib29sIHNhbWVfdGFza19icHNfY2hlY2soc3RydWN0IHBlcmZfZXZlbnQg
KmJwKQ0KPiAgIHsNCj4gICAJc3RydWN0IGJyZWFrcG9pbnQgKnRtcDsNCj4gKwlib29sIHJldCA9
IGZhbHNlOw0KPiAgIA0KPiArCXNwaW5fbG9jaygmdGFza19icHNfbG9jayk7DQo+ICAgCWxpc3Rf
Zm9yX2VhY2hfZW50cnkodG1wLCAmdGFza19icHMsIGxpc3QpIHsNCj4gICAJCWlmICh0bXAtPmJw
LT5ody50YXJnZXQgPT0gYnAtPmh3LnRhcmdldCAmJg0KPiAtCQkgICAgIWNhbl9jb19leGlzdCh0
bXAsIGJwKSkNCj4gLQkJCXJldHVybiB0cnVlOw0KPiArCQkgICAgIWNhbl9jb19leGlzdCh0bXAs
IGJwKSkgew0KPiArCQkJcmV0ID0gdHJ1ZTsNCj4gKwkJCWJyZWFrOw0KPiArCQl9DQo+ICAgCX0N
Cj4gLQlyZXR1cm4gZmFsc2U7DQo+ICsJc3Bpbl91bmxvY2soJnRhc2tfYnBzX2xvY2spOw0KPiAr
CXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgY3B1X2Jwc19hZGQoc3Ry
dWN0IHBlcmZfZXZlbnQgKmJwKQ0KPiBAQCAtMjM0LDYgKzI1Niw3IEBAIHN0YXRpYyBpbnQgY3B1
X2Jwc19hZGQoc3RydWN0IHBlcmZfZXZlbnQgKmJwKQ0KPiAgIAlpZiAoSVNfRVJSKHRtcCkpDQo+
ICAgCQlyZXR1cm4gUFRSX0VSUih0bXApOw0KPiAgIA0KPiArCXNwaW5fbG9jaygmY3B1X2Jwc19s
b2NrKTsNCj4gICAJY3B1X2JwID0gcGVyX2NwdV9wdHIoY3B1X2JwcywgYnAtPmNwdSk7DQo+ICAg
CWZvciAoaSA9IDA7IGkgPCBucl93cF9zbG90cygpOyBpKyspIHsNCj4gICAJCWlmICghY3B1X2Jw
W2ldKSB7DQo+IEBAIC0yNDEsNiArMjY0LDcgQEAgc3RhdGljIGludCBjcHVfYnBzX2FkZChzdHJ1
Y3QgcGVyZl9ldmVudCAqYnApDQo+ICAgCQkJYnJlYWs7DQo+ICAgCQl9DQo+ICAgCX0NCj4gKwlz
cGluX3VubG9jaygmY3B1X2Jwc19sb2NrKTsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0K
PiBAQCAtMjQ5LDYgKzI3Myw3IEBAIHN0YXRpYyB2b2lkIGNwdV9icHNfcmVtb3ZlKHN0cnVjdCBw
ZXJmX2V2ZW50ICpicCkNCj4gICAJc3RydWN0IGJyZWFrcG9pbnQgKipjcHVfYnA7DQo+ICAgCWlu
dCBpID0gMDsNCj4gICANCj4gKwlzcGluX2xvY2soJmNwdV9icHNfbG9jayk7DQo+ICAgCWNwdV9i
cCA9IHBlcl9jcHVfcHRyKGNwdV9icHMsIGJwLT5jcHUpOw0KPiAgIAlmb3IgKGkgPSAwOyBpIDwg
bnJfd3Bfc2xvdHMoKTsgaSsrKSB7DQo+ICAgCQlpZiAoIWNwdV9icFtpXSkNCj4gQEAgLTI2MCwx
OSArMjg1LDI1IEBAIHN0YXRpYyB2b2lkIGNwdV9icHNfcmVtb3ZlKHN0cnVjdCBwZXJmX2V2ZW50
ICpicCkNCj4gICAJCQlicmVhazsNCj4gICAJCX0NCj4gICAJfQ0KPiArCXNwaW5fdW5sb2NrKCZj
cHVfYnBzX2xvY2spOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgYm9vbCBjcHVfYnBzX2NoZWNr
KGludCBjcHUsIHN0cnVjdCBwZXJmX2V2ZW50ICpicCkNCj4gICB7DQo+ICAgCXN0cnVjdCBicmVh
a3BvaW50ICoqY3B1X2JwOw0KPiArCWJvb2wgcmV0ID0gZmFsc2U7DQo+ICAgCWludCBpOw0KPiAg
IA0KPiArCXNwaW5fbG9jaygmY3B1X2Jwc19sb2NrKTsNCj4gICAJY3B1X2JwID0gcGVyX2NwdV9w
dHIoY3B1X2JwcywgY3B1KTsNCj4gICAJZm9yIChpID0gMDsgaSA8IG5yX3dwX3Nsb3RzKCk7IGkr
Kykgew0KPiAtCQlpZiAoY3B1X2JwW2ldICYmICFjYW5fY29fZXhpc3QoY3B1X2JwW2ldLCBicCkp
DQo+IC0JCQlyZXR1cm4gdHJ1ZTsNCj4gKwkJaWYgKGNwdV9icFtpXSAmJiAhY2FuX2NvX2V4aXN0
KGNwdV9icFtpXSwgYnApKSB7DQo+ICsJCQlyZXQgPSB0cnVlOw0KPiArCQkJYnJlYWs7DQo+ICsJ
CX0NCj4gICAJfQ0KPiAtCXJldHVybiBmYWxzZTsNCj4gKwlzcGluX3VubG9jaygmY3B1X2Jwc19s
b2NrKTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgYm9vbCBhbGxf
Y3B1X2Jwc19jaGVjayhzdHJ1Y3QgcGVyZl9ldmVudCAqYnApDQo+IEBAIC0yODYsMTAgKzMxNyw2
IEBAIHN0YXRpYyBib29sIGFsbF9jcHVfYnBzX2NoZWNrKHN0cnVjdCBwZXJmX2V2ZW50ICpicCkN
Cj4gICAJcmV0dXJuIGZhbHNlOw0KPiAgIH0NCj4gICANCj4gLS8qDQo+IC0gKiBXZSBkb24ndCB1
c2UgYW55IGxvY2tzIHRvIHNlcmlhbGl6ZSBhY2Nlc3NlcyB0byBjcHVfYnBzIG9yIHRhc2tfYnBz
DQo+IC0gKiBiZWNhdXNlIGFyZSBhbHJlYWR5IGluc2lkZSBucl9icF9tdXRleC4NCj4gLSAqLw0K
PiAgIGludCBhcmNoX3Jlc2VydmVfYnBfc2xvdChzdHJ1Y3QgcGVyZl9ldmVudCAqYnApDQo+ICAg
ew0KPiAgIAlpbnQgcmV0Ow==
