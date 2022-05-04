Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B336519FBD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktbyj1WH1z3by9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:40:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtbyC5T3hz3bWM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:40:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeBRGZxBLbqphcihXxEpbGQbd2xEyWOixIrAdPR94ko6pHgBZNG68zEP6WuqeWFjwbrnXxaIgbjEiyzGdrdbmdj2IJCfLrX9myBpp7EJGr6Ggs+5FNfzoIAGHj7hz2Tu3Azat5KRoGUgQX/TjhBGObaegt6COP91vECrFdE9bzpu1zbXQNyISj0vPAtgFWp5b3PCnQQDNbiCymGmmuwPqt/ZVwbbdO9+kH3BuM3qM8GU4QmT9QEuyAgvK8mXrnvQHIvM+HUzmCK3tX+CxZtCEDq/i1uMN6Nyds9iw0jXrfsIyzTrh2L8lg2ql0pWkBTVaVSHpopNLK6FVFCtoc1Hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHMVQzZObR+SRUaJIZoPq4dL1sRGH4nt3LSO3njT3NY=;
 b=hdnziHUywLXBGuTCNk+tX53W3tdXQZIC/iqtVPiQ0HsvtswBnLy0osqIcksA33nZZ6GgqnfsJI0c8UdBM7kAbiBHlJGziFEJfZxWiFNPs/oNyTWsZXLPPFGbIfXbt8lUAsadLExxCDS4iUhuC36bjFlYkd+UmgGOYTY9Or8nq2jWIGqM7PAeJ9Mv+hOuLm688yRWYgSYqhVQKiEqAeNip5sJJtXVtl1CK4ifcP7NME8RLKOkGqrE185tOL5CDF3lM06P55nFZQJqd815T8PGDswmTRHfIoeCLZXKhfht3plpfxgPeaiDoaIymCN/tcLrRbXMsKJJfktHe9GpUVwzPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1793.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 12:39:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:39:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v1 13/22] powerpc/ftrace: Use PPC_RAW_xxx() macros instead
 of opencoding.
Thread-Topic: [PATCH v1 13/22] powerpc/ftrace: Use PPC_RAW_xxx() macros
 instead of opencoding.
Thread-Index: AQHYP4vHVuZ/glMl802+yJRxBSA8EKz1b5EAgBl5ZQA=
Date: Wed, 4 May 2022 12:39:42 +0000
Message-ID: <4d338e24-7801-d17c-04a4-9afd2d7f9fd8@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <bf3b854ca8f6f5abd29a7b2d9f74a7724fe35e33.1648131740.git.christophe.leroy@csgroup.eu>
 <1650267275.b63dsc56ds.naveen@linux.ibm.com>
In-Reply-To: <1650267275.b63dsc56ds.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 788c06dc-debc-4320-5ac6-08da2dcb29a2
x-ms-traffictypediagnostic: MR1P264MB1793:EE_
x-microsoft-antispam-prvs: <MR1P264MB17937513646D467B38D43644EDC39@MR1P264MB1793.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRIniQo+1WPFb71DKdXWCj+6fwUzLjAFuGu24RVHRVjM3IgDHBLx2+UVPE45pdmMy3cJ879fL43TIhUoJKU6Gzr3+X3HNfY3ci9Jj0V8E6C0oTLzwGaKHBmgPXDBI1RQtRV4f/aRas/GjWigvGMWtgCCZU2VTkppxv++Lxo5aoGw+UiWHgaYbSQqVtvO0KpyQ6ryxAIyj1aB+uA8owCQG9pEgJhENoGkThZk6rM55XjsgUer+ABJVMSh+YYkcW7ON84FKWaqyC7gu6/BsNxmgCQ7PAQDJNSSPErMqYkA4BgBaSQulE0Nvy6byRCWU49BF9jkj+Oyo4S2FgAjUX7toXBlavO8jmet6I2iDAhMDLpBhbu9GDYKLO3ODqDGx1xINHWVhMdccWrvy52N2rraMvXReHZAE+KMujIUBklTBu/CDmKwAuae/rtnwiZtPAztfEAX5zqc1C5GQebdBh0hYOWn3PU8cOeKEC7DT1EZxc7ZzF+IKg7e9JvPpVmjmJDYCYTUu259ZBou5co0W2Pg0togfsN4dVLvRpjvD8x/o3fjC7uaQtrtBzmpRUgf7oheiveTo0HgrBf8dxHa7UKqIvwZ8RVF/xPJSLYfFJ2DDq9PF6V7PVKapvy5vsZJ1zqymyHfss9JvcnC7djRXBStABZxO3LHUM6FeWFODmRGB9I4sA4aO1tGITSs2ZW7BP3k7CHGFOJ7p9SUh0F57wmYCVP9K/YUq/76YAEpoOvEiOD6+UbVGCcza8jWdPWgMHn1XV1GdMCthJjHOVpDr/LZJ+8q5KeKmlnPKJapQu4qFJU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(6506007)(186003)(44832011)(316002)(36756003)(6486002)(8936002)(508600001)(2906002)(31686004)(86362001)(54906003)(110136005)(38070700005)(38100700002)(122000001)(31696002)(66574015)(66946007)(66556008)(64756008)(66446008)(76116006)(91956017)(66476007)(4326008)(8676002)(6512007)(71200400001)(26005)(2616005)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zkd5RHBvRmNsU2sxMU1zdzVKcGxyMUFBWEhia3Y3YXl3bG1ETzJvdHl3aU1p?=
 =?utf-8?B?c1VaR3Z4SVZhVnhUYVdxQ2wwQmtuOHc4RVZIRFM4QWNaMURBN0ZHQ3RtVTR2?=
 =?utf-8?B?eEdkRTlDWGtuRVdSTzhiNmFXN0tucnVqV3A1NmxreU0rbXVsOFRQRkZwN2dv?=
 =?utf-8?B?ZDZ5Y3I3VmUyZFMrS3pPT092T2htUHNHSE9kTEdpdXNFaHc3aUp5cVVNL0hJ?=
 =?utf-8?B?Uk9JeVExZFlkcVlRczhPeDgzM1IvdDhpN0J5UTJTUGVoWWV3K3cxZC91WWFR?=
 =?utf-8?B?TW9BRnJsQ1VQQWZGVUNFcVBXZk1KZEdNd05XMHRlNG1IaXNGa3RpMlhEaU81?=
 =?utf-8?B?ZnNxaXZJS2xYeXBiQXIwRUhrOWp0MnM0ZW5SSGg4WFNOK1V0YUdiRGxFN3Fw?=
 =?utf-8?B?Y01nakprNXJ4MUlBRWoybC9SeGVLTVdiRVZsVUdzWUc1RHhiaWVra2lFTW9K?=
 =?utf-8?B?L2puNjE1QkFaMXpNUUx0U3gxbGlUbjA5ZnY4OFZxaTh6Q0VaVVBHeHY1T0xI?=
 =?utf-8?B?T3k0S21xSStRV3FiK2tPSUhTekhCTm9ZZTVXSUtWMVMreE9KRmFQT2MvZHdl?=
 =?utf-8?B?anVKSmNnZm1udFJvZFNabEU2WDdldzhvMlg0Y1BHTDhFMkxxZEtoZm9EclVR?=
 =?utf-8?B?UVJyK3cwMGMwZXhudkZKbmo5MmZMb0FZemVzWEh2WXptaEkzSlpTQng2RDlh?=
 =?utf-8?B?YzQvNzVRRjhnOEt0SllRU1FRKzU4bXJjRFpCVXliV1BEbyt4L3BXeHE5RUxx?=
 =?utf-8?B?OHduR0FGUjNsVEZsSWJIV2M3Q2JobmRoTzFUMEFTZjJPY0Rad3hoOFhhZFR1?=
 =?utf-8?B?Q25hYlh4M2l5N2V3NTdLSHJnMEovbmlWb20wWjFTNzlXbGs2OHhiRHZyWXhL?=
 =?utf-8?B?SEFENlVqQXpDbFQwRENneFhrZG5LZFI4Y2V6d3djWERGR09jNXRvN3lEejRj?=
 =?utf-8?B?QkhHaHdTS1oyWGs3L29MMXBDN0EzVU1rcmJhdzUxb3ZhMGRpWG5jaWdLak1z?=
 =?utf-8?B?N0FXckZqeDBXai9nWktPd2tGeTNLRDh6WVpRZWVoM2Zyb2tLNzhCY29HeHBt?=
 =?utf-8?B?amM1dVRwMTg2M3NTeG8vd3BFaFUyWmRjUjlwNGZ4T200cC81S00zZUZEMCtw?=
 =?utf-8?B?eVhrNXM5MUp4dkJtQWs2NW1hZVhRcGtEendiRCtMMDYwRU92MkhmajBER2Qz?=
 =?utf-8?B?aXorSHBOM2VTOEtPNFZETzlWc0JxMkNkb3d0TGRpNlNYcDFqTnE1K2YvU2dR?=
 =?utf-8?B?Y0lYTnVBazB0OXdrSC9UTFozdk9jeUg4SWtnS3JIdTRNSlFmQVFYOEVIVWhH?=
 =?utf-8?B?Tm0vT1BMSHlkbUdPM0N1VElySHdzRjNSWFl1OTZLWG9CY1VxQlFFWE1qbjRT?=
 =?utf-8?B?bVcwbzcwRjNJVVFjK3ZhTWt3dnNjTTJpUFpSUE1HVWFtYlpqejdRSmxvTU42?=
 =?utf-8?B?STVkOHYrVVF0WGpDWXBkY2RxWGMrdXJ2djZ2NCtQZzNRRGZ4TWV4dHc2cDRH?=
 =?utf-8?B?NGJwODl3R3l4dmdTYSt4QXR0b3pydUdtRW5LQWtweWtzMndvdWhuYitNZzZk?=
 =?utf-8?B?TTNWYzYrV0NRTDZ6NEFjK1pqQ2NlbHN2eFpHTWlub1ZwMjd4TWxKMmcxQzhp?=
 =?utf-8?B?aGIvQ0YxazByYlg3NVZjVkxsQWszRmx2L2IxaTYrUm9vQ3F4VmlEckR5cHhh?=
 =?utf-8?B?aUgrc0cvellaVzFXSk9nZUhpMS9DQ216b1FxcVpLaFZicXVheDlQUjd4ZnhF?=
 =?utf-8?B?VWlNWTNZMVM5RDQxdUlsN0dTcGlVV0ovY1R1U3dzNEVJWjZBV2RXVlZLSUtv?=
 =?utf-8?B?SHRRcnRxS0ZVQzl6Vk5QMFJoRWM5MGlQQ2RKZ0QyaWFKN2M0TVFXYm5leEVN?=
 =?utf-8?B?ZWIxcVVTbzkyWGpxVVExSkxDVHRUTDFiSUZyb1NadlhIYU9hQmhocnM2YWdR?=
 =?utf-8?B?WEN5R1I1ZkZvRlNRM0ZkNUJsa2dHRkgyS2pZbDhZVGZXbWt6R2lqQWxjWGg0?=
 =?utf-8?B?Sk9RT1UwUmxyMU9FcW1IdGt1citMaytXaVB5aWJwdHNwRTBBSlBQRjB5Zzhh?=
 =?utf-8?B?ZVpxYUhVTkdOT1FoR01OYzBCelY2bzV3UEpIY3BUdHdBVU9mTS9BM2llbmln?=
 =?utf-8?B?dEFJc3JEU01zZC9NRkhoU0VBMjJPUVNJMEpBMnh1Tld2anplYlhzOVQwWElB?=
 =?utf-8?B?V0xTUFVhb3phN1Urc0xPTGRlR0dnVzVtM2Z4MGpFaVRLbGR5eUJZZmdORGw3?=
 =?utf-8?B?M0RQd1ZTQ2Z4YlJqM2I0Q0xJY1o3dlZkSHBoWHVZZnMxbEppaWlqZEVhazBJ?=
 =?utf-8?B?N09uWGwwckFrL29sVDJDR3dzR2NwUXgvSEU0SXpBeXZ1N1VBVlVKNnVyM2hB?=
 =?utf-8?Q?rrXiRjZWNV2DWN6ZVbbrRs6TPNWfWxqwdcL0A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5511024B399C954CB47B62750AC10CFA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 788c06dc-debc-4320-5ac6-08da2dcb29a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:39:42.5994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tst6aZTsib1O6B3iH0yxNUNYdPwsU6bNSlTXm1S6m+TY/jlFhS+Eq0xoTTK3I0gT1ybVb1UHJe+6SHyWzlgbOYXZtlT7epGqA+hWqjNoeao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1793
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMDk6MzgsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IFBQQ19SQVdfeHh4KCkgbWFjcm9zIGFyZSBzZWxm
IGV4cGxhbmF0b3J5IGFuZCBsZXNzIGVycm9yIHByb25lDQo+PiB0aGFuIG9wZW4gY29kaW5nLg0K
Pj4NCj4+IFVzZSB0aGVtIGluIGZ0cmFjZS5jDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDCoGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGMtb3Bjb2RlLmggfMKgIDMgKysrDQo+PiDCoGFyY2gv
cG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmPCoMKgwqAgfCAzMiArKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0NCj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyMSBk
ZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3BwYy1vcGNvZGUuaCANCj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwYy1vcGNvZGUu
aA0KPj4gaW5kZXggODJmMWYwMDQxYzZmLi4yODE3NTRhY2EwYTMgMTAwNjQ0DQo+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcHBjLW9wY29kZS5oDQo+PiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vcHBjLW9wY29kZS5oDQo+PiBAQCAtMjk0LDYgKzI5NCw4IEBADQo+PiDC
oCNkZWZpbmUgUFBDX0lOU1RfQkzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4NDgwMDAwMDENCj4+
IMKgI2RlZmluZSBQUENfSU5TVF9CUkFOQ0hfQ09ORMKgwqDCoMKgwqDCoMKgIDB4NDA4MDAwMDAN
Cj4+DQo+PiArI2RlZmluZSBQUENfSU5TVF9PRkZTRVQyNF9NQVNLwqDCoMKgwqDCoMKgwqAgMHgw
M2ZmZmZmYw0KPiANCj4gVGhpcyBjb3JyZXNwb25kcyB0byB0aGUgTEkgZmllbGQsIHBlciB0aGUg
SVNBLiBTZWUgc2VjdGlvbiA4LjEuMi8xLjc6IA0KPiAnSW5zdHJ1Y3Rpb24gRmllbGRzJy4gV291
bGQgaXQgYmUgYmV0dGVyIHRvIG5hbWUgaXQgUFBDX0lOU1RfTElfTUFTSz8NCg0KSXNuJ3QgdGhl
cmUgYSByaXNrIG9mIGNvbmZ1c2luZyB3aXRoIHRoZSAnbGknIGluc3RydWN0aW9uID8gTGlrZSB3
ZSANCmNvdWxkIGhhdmUgUFBDX0lOU1RfTEkganVzdCBsaWtlIHdlIGhhdmUgUFBDX0lOU1RfQURE
ID8NCg0KDQoNCj4gDQo+PiArDQo+PiDCoC8qIFByZWZpeGVzICovDQo+PiDCoCNkZWZpbmUgUFBD
X0lOU1RfTEZTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweGMwMDAwMDAwDQo+PiDCoCNkZWZpbmUg
UFBDX0lOU1RfU1RGU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhkMDAwMDAwMA0KPj4gQEAgLTU3
Miw2ICs1NzQsNyBAQA0KPj4gwqAjZGVmaW5lIFBQQ19SQVdfRUlFSU8oKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKDB4N2MwMDA2YWMpDQo+Pg0KPj4gwqAjZGVmaW5lIFBQQ19SQVdfQlJBTkNIKGFk
ZHIpwqDCoMKgwqDCoMKgwqAgKFBQQ19JTlNUX0JSQU5DSCB8ICgoYWRkcikgJiANCj4+IDB4MDNm
ZmZmZmMpKQ0KPj4gKyNkZWZpbmUgUFBDX1JBV19CTChvZmZzZXQpwqDCoMKgwqDCoMKgwqAgKDB4
NDgwMDAwMDEgfCAoKG9mZnNldCkgJiANCj4+IFBQQ19JTlNUX09GRlNFVDI0X01BU0spKQ0KPj4N
Cj4+IMKgLyogRGVhbCB3aXRoIGluc3RydWN0aW9ucyB0aGF0IG9sZGVyIGFzc2VtYmxlcnMgYXJl
bid0IGF3YXJlIG9mICovDQo+PiDCoCNkZWZpbmXCoMKgwqAgUFBDX0JDQ1RSX0ZMVVNIwqDCoMKg
wqDCoMKgwqAgc3RyaW5naWZ5X2luX2MoLmxvbmcgDQo+PiBQUENfSU5TVF9CQ0NUUl9GTFVTSCkN
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIA0KPj4g
Yi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBpbmRleCBmZGMwNDEyYzFk
OGEuLmFmYjFkMTI4MzhjOSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJh
Y2UvZnRyYWNlLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMN
Cj4+IEBAIC05MCwxOSArOTAsMTkgQEAgc3RhdGljIGludCB0ZXN0XzI0Yml0X2FkZHIodW5zaWdu
ZWQgbG9uZyBpcCwgDQo+PiB1bnNpZ25lZCBsb25nIGFkZHIpDQo+Pg0KPj4gwqBzdGF0aWMgaW50
IGlzX2JsX29wKHBwY19pbnN0X3Qgb3ApDQo+PiDCoHsNCj4+IC3CoMKgwqAgcmV0dXJuIChwcGNf
aW5zdF92YWwob3ApICYgMHhmYzAwMDAwMykgPT0gMHg0ODAwMDAwMTsNCj4+ICvCoMKgwqAgcmV0
dXJuIChwcGNfaW5zdF92YWwob3ApICYgflBQQ19JTlNUX09GRlNFVDI0X01BU0spID09IA0KPj4g
UFBDX1JBV19CTCgwKTsNCj4+IMKgfQ0KPj4NCj4+IMKgc3RhdGljIGludCBpc19iX29wKHBwY19p
bnN0X3Qgb3ApDQo+PiDCoHsNCj4+IC3CoMKgwqAgcmV0dXJuIChwcGNfaW5zdF92YWwob3ApICYg
MHhmYzAwMDAwMykgPT0gMHg0ODAwMDAwMDsNCj4+ICvCoMKgwqAgcmV0dXJuIChwcGNfaW5zdF92
YWwob3ApICYgflBQQ19JTlNUX09GRlNFVDI0X01BU0spID09IA0KPj4gUFBDX1JBV19CUkFOQ0go
MCk7DQo+PiDCoH0NCj4+DQo+PiDCoHN0YXRpYyB1bnNpZ25lZCBsb25nIGZpbmRfYmxfdGFyZ2V0
KHVuc2lnbmVkIGxvbmcgaXAsIHBwY19pbnN0X3Qgb3ApDQo+PiDCoHsNCj4+IMKgwqDCoMKgIGlu
dCBvZmZzZXQ7DQo+Pg0KPj4gLcKgwqDCoCBvZmZzZXQgPSAocHBjX2luc3RfdmFsKG9wKSAmIDB4
MDNmZmZmZmMpOw0KPj4gK8KgwqDCoCBvZmZzZXQgPSAocHBjX2luc3RfdmFsKG9wKSAmIFBQQ19J
TlNUX09GRlNFVDI0X01BU0spOw0KPj4gwqDCoMKgwqAgLyogbWFrZSBpdCBzaWduZWQgKi8NCj4+
IMKgwqDCoMKgIGlmIChvZmZzZXQgJiAweDAyMDAwMDAwKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoCBv
ZmZzZXQgfD0gMHhmZTAwMDAwMDsNCj4+IEBAIC0xODIsNyArMTgyLDcgQEAgX19mdHJhY2VfbWFr
ZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLA0KPj4gwqDCoMKgwqDCoCAqIFVzZSBhIGIgKzggdG8g
anVtcCBvdmVyIHRoZSBsb2FkLg0KPj4gwqDCoMKgwqDCoCAqLw0KPj4NCj4+IC3CoMKgwqAgcG9w
ID0gcHBjX2luc3QoUFBDX0lOU1RfQlJBTkNIIHwgOCk7wqDCoMKgIC8qIGIgKzggKi8NCj4+ICvC
oMKgwqAgcG9wID0gcHBjX2luc3QoUFBDX1JBV19CUkFOQ0goOCkpO8KgwqDCoCAvKiBiICs4ICov
DQo+Pg0KPj4gwqDCoMKgwqAgLyoNCj4+IMKgwqDCoMKgwqAgKiBDaGVjayB3aGF0IGlzIGluIHRo
ZSBuZXh0IGluc3RydWN0aW9uLiBXZSBjYW4gc2VlIGxkIA0KPj4gcjIsNDAocjEpLCBidXQNCj4+
IEBAIC0zOTQsMTcgKzM5NCw4IEBAIGludCBmdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAq
bW9kLA0KPj4gwqBzdGF0aWMgaW50DQo+PiDCoGV4cGVjdGVkX25vcF9zZXF1ZW5jZSh2b2lkICpp
cCwgcHBjX2luc3RfdCBvcDAsIHBwY19pbnN0X3Qgb3AxKQ0KPj4gwqB7DQo+PiAtwqDCoMKgIC8q
DQo+PiAtwqDCoMKgwqAgKiBXZSBleHBlY3QgdG8gc2VlOg0KPj4gLcKgwqDCoMKgICoNCj4+IC3C
oMKgwqDCoCAqIGIgKzgNCj4+IC3CoMKgwqDCoCAqIGxkIHIyLFhYKHIxKQ0KPj4gLcKgwqDCoMKg
ICoNCj4+IC3CoMKgwqDCoCAqIFRoZSBsb2FkIG9mZnNldCBpcyBkaWZmZXJlbnQgZGVwZW5kaW5n
IG9uIHRoZSBBQkkuIEZvciBzaW1wbGljaXR5DQo+PiAtwqDCoMKgwqAgKiBqdXN0IG1hc2sgaXQg
b3V0IHdoZW4gZG9pbmcgdGhlIGNvbXBhcmUuDQo+PiAtwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqAg
aWYgKCFwcGNfaW5zdF9lcXVhbChvcDAsIHBwY19pbnN0KDB4NDgwMDAwMDgpKSB8fA0KPj4gLcKg
wqDCoMKgwqDCoMKgIChwcGNfaW5zdF92YWwob3AxKSAmIDB4ZmZmZjAwMDApICE9IDB4ZTg0MTAw
MDApDQo+PiArwqDCoMKgIGlmICghcHBjX2luc3RfZXF1YWwob3AwLCBwcGNfaW5zdChQUENfUkFX
X0JSQU5DSCg4KSkpIHx8DQo+PiArwqDCoMKgwqDCoMKgwqAgIXBwY19pbnN0X2VxdWFsKG9wMSwg
cHBjX2luc3QoUFBDX0lOU1RfTERfVE9DKSkpDQo+IA0KPiBJdCB3b3VsZCBiZSBnb29kIHRvIG1v
dmUgUFBDX0lOU1RfTERfVE9DIHRvIHBwYy1vcGNvZGUuaA0KDQpJdCdzIG5vdCByZWFsbHkganVz
dCBhbiBpbnN0cnVjdGlvbiwgaXQncyBjbG9zZWx5IGxpbmtlZCB0byB0aGUgQUJJLCBzbyANCmRv
ZXMgaXQgcmVhbGx5IGJlbG9uZyB0byBwcGMtb3Bjb2RlLmggPyBNYXliZSBpdCBjb3VsZCBiZSBi
ZXR0ZXIgdG8gaGF2ZSANCml0IGluIHBwY19hc20uaCBpbnN0ZWFkLCB3aGljaCBhbHJlYWR5IGNv
bnRhaW5zIEFCSSByZWxhdGVkIGRlZmluaXRpb25zID8NCg0KSWYgd2UgbW92ZSBpdCBpbnRvIHBw
Yy1vcGNvZGUuaCwgdGhlbiB3ZSBhbHNvIGhhdmUgdG8gbW92ZSANClIyX1NUQUNLX09GRlNFVC4g
T3Igc2hvdWxkIHdlIHVzZSBTVEtfR09UIGRlZmluZWQgaW4gcHBjX2FzbS5oIGFuZCBkcm9wIA0K
UjJfU1RBQ0tfT0ZGU0VUID8NCg0KPiANCj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+
PiDCoMKgwqDCoCByZXR1cm4gMTsNCj4+IMKgfQ0KPj4gQEAgLTQxMiw3ICs0MDMsNiBAQCBleHBl
Y3RlZF9ub3Bfc2VxdWVuY2Uodm9pZCAqaXAsIHBwY19pbnN0X3Qgb3AwLCANCj4+IHBwY19pbnN0
X3Qgb3AxKQ0KPj4gwqBzdGF0aWMgaW50DQo+PiDCoGV4cGVjdGVkX25vcF9zZXF1ZW5jZSh2b2lk
ICppcCwgcHBjX2luc3RfdCBvcDAsIHBwY19pbnN0X3Qgb3AxKQ0KPj4gwqB7DQo+PiAtwqDCoMKg
IC8qIGxvb2sgZm9yIHBhdGNoZWQgIk5PUCIgb24gcHBjNjQgd2l0aCAtbXByb2ZpbGUta2VybmVs
IG9yIHBwYzMyICovDQo+PiDCoMKgwqDCoCBpZiAoIXBwY19pbnN0X2VxdWFsKG9wMCwgcHBjX2lu
c3QoUFBDX1JBV19OT1AoKSkpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKg
wqDCoMKgIHJldHVybiAxOw0KPj4gQEAgLTczOCwxMSArNzI4LDExIEBAIGludCBfX2luaXQgZnRy
YWNlX2R5bl9hcmNoX2luaXQodm9pZCkNCj4+IMKgwqDCoMKgIGludCBpOw0KPj4gwqDCoMKgwqAg
dW5zaWduZWQgaW50ICp0cmFtcFtdID0geyBmdHJhY2VfdHJhbXBfdGV4dCwgZnRyYWNlX3RyYW1w
X2luaXQgfTsNCj4+IMKgwqDCoMKgIHUzMiBzdHViX2luc25zW10gPSB7DQo+PiAtwqDCoMKgwqDC
oMKgwqAgMHhlOThkMDAwMCB8IFBBQ0FUT0MswqDCoMKgIC8qIGxkwqDCoMKgwqDCoCByMTIsUEFD
QVRPQyhyMTMpwqDCoMKgICovDQo+PiAtwqDCoMKgwqDCoMKgwqAgMHgzZDhjMDAwMCzCoMKgwqDC
oMKgwqDCoCAvKiBhZGRpc8KgwqAgcjEyLHIxMiw8aGlnaD7CoMKgwqAgKi8NCj4+IC3CoMKgwqDC
oMKgwqDCoCAweDM5OGMwMDAwLMKgwqDCoMKgwqDCoMKgIC8qIGFkZGnCoMKgwqAgcjEyLHIxMiw8
bG93PsKgwqDCoCAqLw0KPj4gLcKgwqDCoMKgwqDCoMKgIDB4N2Q4OTAzYTYswqDCoMKgwqDCoMKg
wqAgLyogbXRjdHLCoMKgIHIxMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqDC
oMKgwqDCoCAweDRlODAwNDIwLMKgwqDCoMKgwqDCoMKgIC8qIGJjdHLCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqDCoMKgwqDCoCBQUENfUkFXX0xEKF9SMTIsIF9S
MTMsIFBBQ0FUT0MpLA0KPj4gK8KgwqDCoMKgwqDCoMKgIFBQQ19SQVdfQURESVMoX1IxMiwgX1Ix
MiwgMCksDQo+PiArwqDCoMKgwqDCoMKgwqAgUFBDX1JBV19BRERJUyhfUjEyLCBfUjEyLCAwKSwN
Cj4gDQo+IFRoaXMgc2hvdWxkIGJlIFBQQ19SQVdfQURESS4NCj4gDQoNCk9vcHMuDQoNCkNocmlz
dG9waGU=
