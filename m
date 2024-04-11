Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B108A0B12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 10:23:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z6yc7E2n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFXlc1W3Rz30Pn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Z6yc7E2n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFXkq4mgwz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 18:22:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUMojlN+HnqOc3T9OLzzTLaqEcnI8zTCYfsDTFHplUHWyUzn6e0y/Y9BMpEQz9IDlRoEk14DHgPwUsjI9XPJE2NlIXWkfvPw/ovPo5MsyjSDea+RXGY/eXmMrJiVzrcnQgkyCNl3CI+A20D2cYkMtgF7PrX/97rqNm7eevrXKH3DsFZgGR7SfyRbw5q0i2zOBgbota5kykGqBi/m4G0OYqpgMVnykHFPRSk8sjg0NUS+8f4wKo+q8oK/SYwzvxzuu4A8lCt7KC1JH7ugOdOYTXYMZSV9In+EQiscioQ0V/rRukJ2lzSQFXYil+OewQ6ydkbph+dt/TBihL4DJJCUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99byordJLQuq/MnRFJ7FpXR0Yk4ikCyNE2wZlGTzWaE=;
 b=XsIwlc18DwnjprxQK1x/iL4sibhlHw7SiICyOA8gcbHHdVO2ideU2V9n2yDkPcD3FFSImbCSb8oKp+I5xVc4btzAAP0/+hqyOk0dpGrhfvONknIBjY/gbz4ogjEP5Y5VwAi2aX6m9TLTQvQswGkwL6o1tCgejiopjH31cJzCo5QEjk19ieJUJMEkUYlrYYfWZbJYOjIIH1WlfPbrsCapV+uIzVg7wG1lgxBOvbKymt+DS93YKN9hmBnbZn2VDKYSyHhKgyDSblDPek4KgZnnM4z8x5W+Tte8WvQZz4F/xo3GpsbDfZgtrq2ukRRloHEBMrAl6LHDLUO8Fx52vhk9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99byordJLQuq/MnRFJ7FpXR0Yk4ikCyNE2wZlGTzWaE=;
 b=Z6yc7E2ntupQXIN/ibYCd8Twyj4kE+e/IHr225ao4nglF+xwwqa44xxsxgu3H+P/P2QINuabZ8DwEYUNfdbFd9SdiS45LYmWOs+uduOj9RfqAYQrlcLsDcK4glCvbXChit8mzpmGy3EIzksjIX8q1Ozirbrh3ry61RWPyXCac0f9FDpFM6DHJjaW9HTOW+UiPleagvUDqkbRbjnlNKkESM1ctVRm8/x9kHBRVGbnXGj4M20T80WYLeDC3m9+SQoMUUCcKuwxVadr7BmLi45YOxSMWOPX/IKx+6K/QISJ/4JOpmG1j1iG1V0QV9pvlvoetg7ASLWXWyskfWwPgsVoCg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2588.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 08:22:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 08:22:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
Thread-Topic: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
Thread-Index: AQHai1xRYzjVdYtCeEepwMKzYWvQLLFipl4AgAADMgCAAA/YgIAAAq+A
Date: Thu, 11 Apr 2024 08:22:35 +0000
Message-ID: <ff9d7032-a3b6-4ecd-ac26-d7d4a06a5c7f@csgroup.eu>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
 <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
 <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
In-Reply-To: <a434248a-1e9f-4f4f-8f90-d36d8e979f53@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2588:EE_
x-ms-office365-filtering-correlation-id: 9e518b61-287b-42da-7d27-08dc5a008abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  t6TUMKX8bISKumWAVk2RJRCVJZUYzbOJ4XSD/qfwUVLxXuB8jb9dqoPbOnA5991LCKSO7hyI1+/n4LmCu3uI7BlW9jgcdpPzkYfS6o233zTvVsXZ1mEd+ywzLoM2UnRH6VVespoaPn6lsYeS89wZAsdnW+SAYTHy31Mk1+0Uujeux+bLVAWh0cbTm/HvTjl848YxcYMwpMiQUWqgziVgZQt23kDX5AqDzucJSlArrgukR7NKRgZq7/LW5UAdjxzhEb2vMFXvGgWcfKt6iuDnC1d8YlQTtCKPqVyNaBhQ5Mc0d0wCbfHWN4lqhfYbfAnbJjDDZxsVrKkjLo5KV//tbI9VIixj5dlnzZeRCQG871wyhlLMe1tDgNoubeO5FHmk4bsWnmWfODRgrfNEO56AxE5lLKtIIXj8q31LQkDp93l0t1uy/7uer5SVD4SVxD/70x6H48RItAsQ93IZ1DvcVlpHWMC24VXzF2Du88p6Q9220MytoqGO8fdYW9EtLk9jJmbqP5gyeo2ye9kIPv51/OjMjnkTvxKA9AvSQ/L4GBEOAVzR6881ZeoIkDs8Z+Tq2LKcOXOk6FoA3Jipp2ANDMFjgVs5sQzICqEC2ywmQhSyu6RPtLeWM30+j8+36skyZiRvTpzPUt5cm1Q4Yx2JLZ1yMmlZ0/rloHXoF+d+XmU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R1ZUMmt5YU9lRjlNWVBkUlFmTWdBLy9MSGJTeG1VbmYvNnlvcTdTaUJTL2Jj?=
 =?utf-8?B?ay9id1ZGMEZXTUloRHc5T2tMTzVwbXFLSlV5SUxKd1pDZlFueVRvcnkvUFpm?=
 =?utf-8?B?OE16dGJaRjJtNjFDU3hqdGZCdFhiY3RzOU01UE84b1R2WHJqbnV1bmE5d0k5?=
 =?utf-8?B?dGl6aGNlK2NiSVNrYTFpZjRsWlkyYzBneHFYYlNCdmgxTUpVelhNckE0em1n?=
 =?utf-8?B?cldKeWVpanZ5eWRmd3g0UmF6RCtQUWhpdGN0NzlVNG9pKzl0V2FQWU96TVF4?=
 =?utf-8?B?cGcrVXdMTnVrYStrWDNZcHBYdFJDTlZaZG11alh4Mmx4NkROTjhWdUwvR2Zq?=
 =?utf-8?B?UVhEbnBOTy8vOEFHN0RJay8yTXhQSUNXbW03YWY1M2hDV0hFbTN1bmthYTRF?=
 =?utf-8?B?SDdtdm8xY09YQjVmRHFjT2xScDZFakttc3NpYXRuOHpwenNBT1luaXNwMU10?=
 =?utf-8?B?SW9vcE1jcUhOMlN2QnVFbzBBazU4MVRrNWI1Vzh0OStueERUYS9UOE1xWlRo?=
 =?utf-8?B?dkV2Sy9yTExCSXo1MjBNQWE3bnZwUXlaTnJobkNjV2tPSWVjcVRudnptS0FF?=
 =?utf-8?B?Ym0wR0pJSHQ5NGlmbHhLcnVmdENPUG84aTFXaGw3bnkwRC8reFRhQjQwNm9y?=
 =?utf-8?B?dnM3UkRmSkdYa0Q4MzEvOXFWTlNhdEZiSzdRTkI4Ni81N2xjQ1pJUmR5YzU5?=
 =?utf-8?B?a2ZBbmN4dEwwSmR4c091b1RocHBlUUZzNllKMzBTNTFwa2x1YUhnNGVBdFhB?=
 =?utf-8?B?bS9Ta0t6NjR3ODBTcVJZVkt0NFhTaTlNbWdLc3dIc2FMRmdIMmFpdEFPUTB2?=
 =?utf-8?B?d0RpcDJhVStUTkZhbzNxNVNCMVhmTjVublhuYVlNL250anorUStzWHRNMitv?=
 =?utf-8?B?V1QxRmJwdVQ0cnlkUDNGNUU1RjMzWGtrdU1DSXdheXIrckd2UGNqVmlwb1lR?=
 =?utf-8?B?N1lOdlNFNHRKWGdmU20zR1JGYnRpM0JPVW9oblArSzNXa2FyVVptWU51MXF2?=
 =?utf-8?B?WmxjRmVlcUt5WGNSZDBBQzhROExSZ0hoZUZ5TGpWWE9FN0diU3BDcjVTTjFx?=
 =?utf-8?B?UUo1aDEvdXNKYmFDWDlpZitud1lURk5EeFg5dk5pUkxaQW9KdndaajkvRS82?=
 =?utf-8?B?N3NCZ0EwRktZUlVqMVl4eUIxajJBRGxkcGlMb1ZSUStKMVlFOXg5MXVITzZY?=
 =?utf-8?B?Z0tJUDNQTWRwaDZmREhVb25yK3BNWktOOVhPQ2M5S1lrWDdVWTk5aXdHL3pB?=
 =?utf-8?B?c1ZpOVhVMUdKMjdSanJCZVYzU3BPV1pZaXFZNy9tazljZE5TSmZGelArYXBy?=
 =?utf-8?B?QkxQek9zVDdpYVltak9mQXBVZEc4T0xWM1QyUFdBRE1odWJrUEY2UTlYdTlR?=
 =?utf-8?B?MTVaaUVOZEZWNjBrM0Q5YStaY1UyNFFqTkZiKzdrSWU3aUw0cHJyWHlyK2xW?=
 =?utf-8?B?SjV1U3o5SkpyaGZqTE45U2lnZkllS0FqdU9SY1NwakRydUVPU29Ha0g4Vlo3?=
 =?utf-8?B?NkFPYlRDcjFwMUZMUlZtT0svQ1hYVDl5T0xWRG8vT3lLYzV3cXBCSFhITGVa?=
 =?utf-8?B?MmpoR24xR0Y0eTJRNXJVWlk5SE50UnVucVVKNm05WlRhTisvNUMxeFZGZFJy?=
 =?utf-8?B?MFFORFFIMHNzcmVSclJqRkJzcktkcFRCMlhpNGovSFoxdGk3QUNnZ3BpVkRN?=
 =?utf-8?B?bmxMcjQrUzB4TUFLVzlYYWZHZGtPNVAwRHZFSWJGVTBlZkh0VnN6eDZxVEt0?=
 =?utf-8?B?S3RWcld0WVhUM0dMWjBUTmVyYjhjcjRLMTdXYk5PR202Z0xzMzBjQWxxbGhl?=
 =?utf-8?B?RzlHeGZMTFZKS2FjU2FYRDJxQlEyWnJRdHNxQ0tZMnY5akJjd2YyQm90YlVU?=
 =?utf-8?B?djkraW5IZ05aaHlwQ2RZVGsrdGRkbWpHWUo1dmpZOFlJbi9GcTF3WW5NUmla?=
 =?utf-8?B?U1FoaDlaYnFCZHh2dnBGNFhETC9QTm9rZHBNKys3aXdSSE95eDE4Qk9JditX?=
 =?utf-8?B?OG4vRitZd2R2ZFd0NHJsUU5uTE1SQnBiWnpiUTFCLzV6NGNQck1JR1o0YldK?=
 =?utf-8?B?T3FIMHkydWI1ZFZJZkJaUWJOUFVZc3FieEY4MkpVcDE4RThYZ1UwYUtUNWVi?=
 =?utf-8?Q?xrKNQBGOuC325PDoO4ms+1XBa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CE8263CDE2D3A41A7E732A851462DD4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e518b61-287b-42da-7d27-08dc5a008abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 08:22:35.3828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SEL614yGy9Hm6h7Jg1glRz6zG+lZzNlIxwHgQ0iXmIEjf5+gAbZwvSD8asbHFQCA0u6x6BMa3tMyDrD4AGOXnsWpc1U07JwmTn3r5FqcWZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2588
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "x86@kernel.org" <x86@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA0LzIwMjQgw6AgMTA6MTIsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxMS8wNC8yMDI0IMOgIDA5OjE2LCBBZHJpYW4gSHVudGVyIGEgw6ljcml0
wqA6DQo+PiBPbiAxMS8wNC8yNCAxMDowNCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4+PiBPbiBX
ZWQsIEFwciAxMCwgMjAyNCwgYXQgMTc6MzIsIEFkcmlhbiBIdW50ZXIgd3JvdGU6DQo+Pj4+IEJV
RygpIGRvZXMgbm90IHJldHVybiwgYW5kIGFyY2ggaW1wbGVtZW50YXRpb25zIG9mIEJVRygpIHVz
ZSANCj4+Pj4gdW5yZWFjaGFibGUoKQ0KPj4+PiBvciBvdGhlciBub24tcmV0dXJuaW5nIGNvZGUu
IEhvd2V2ZXIgd2l0aCAhQ09ORklHX0JVRywgdGhlIGRlZmF1bHQNCj4+Pj4gaW1wbGVtZW50YXRp
b24gaXMgb2Z0ZW4gdXNlZCBpbnN0ZWFkLCBhbmQgdGhhdCBkb2VzIG5vdCBkbyB0aGF0LiB4ODYg
DQo+Pj4+IGFsd2F5cw0KPj4+PiB1c2VzIGl0cyBvd24gaW1wbGVtZW50YXRpb24sIGJ1dCBwb3dl
cnBjIHdpdGggIUNPTkZJR19CVUcgZ2l2ZXMgYSBidWlsZA0KPj4+PiBlcnJvcjoNCj4+Pj4NCj4+
Pj4gwqDCoCBrZXJuZWwvdGltZS90aW1la2VlcGluZy5jOiBJbiBmdW5jdGlvbiDigJh0aW1la2Vl
cGluZ19kZWJ1Z19nZXRfbnPigJk6DQo+Pj4+IMKgwqAga2VybmVsL3RpbWUvdGltZWtlZXBpbmcu
YzoyODY6MTogZXJyb3I6IG5vIHJldHVybiBzdGF0ZW1lbnQgaW4gDQo+Pj4+IGZ1bmN0aW9uDQo+
Pj4+IMKgwqAgcmV0dXJuaW5nIG5vbi12b2lkIFstV2Vycm9yPXJldHVybi10eXBlXQ0KPj4+Pg0K
Pj4+PiBBZGQgdW5yZWFjaGFibGUoKSB0byBkZWZhdWx0ICFDT05GSUdfQlVHIEJVRygpIGltcGxl
bWVudGF0aW9uLg0KPj4+DQo+Pj4gSSdtIGEgYml0IHdvcnJpZWQgYWJvdXQgdGhpcyBwYXRjaCwg
c2luY2Ugd2UgaGF2ZSBoYWQgcHJvYmxlbXMNCj4+PiB3aXRoIHVucmVhY2hhYmxlKCkgaW5zaWRl
IG9mIEJVRygpIGluIHRoZSBwYXN0LCBhbmQgYXMgZmFyIGFzIEkNCj4+PiBjYW4gcmVtZW1iZXIs
IHRoZSBjdXJyZW50IHZlcnNpb24gd2FzIHRoZSBvbmx5IG9uZSB0aGF0DQo+Pj4gYWN0dWFsbHkg
ZGlkIHRoZSByaWdodCB0aGluZyBvbiBhbGwgY29tcGlsZXJzLg0KPj4+DQo+Pj4gT25lIHByb2Js
ZW0gd2l0aCBhbiB1bnJlYWNoYWJsZSgpIGFubm90YXRpb24gaGVyZSBpcyB0aGF0IGlmDQo+Pj4g
YSBjb21waWxlciBtaXNhbmFseXNlcyB0aGUgZW5kbGVzcyBsb29wLCBpdCBjYW4gZGVjaWRlIHRv
DQo+Pj4gdGhyb3cgb3V0IHRoZSBlbnRpcmUgY29kZSBwYXRoIGxlYWRpbmcgdXAgdG8gaXQgYW5k
IGp1c3QNCj4+PiBydW4gaW50byB1bmRlZmluZWQgYmVoYXZpb3IgaW5zdGVhZCBvZiBwcmludGlu
ZyBhIEJVRygpDQo+Pj4gbWVzc2FnZS4NCj4+Pg0KPj4+IERvIHlvdSBrbm93IHdoaWNoIGNvbXBp
bGVyIHZlcnNpb24gc2hvdyB0aGUgd2FybmluZyBhYm92ZT8NCj4+DQo+PiBPcmlnaW5hbCByZXBv
cnQgaGFzIGEgbGlzdA0KPj4NCj4+IMKgwqDCoMKgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L0NBK0c5Zll2amRaQ1c9N1pHeFM2QV8zYnlzalE1NllGN1MtK1BOTFFfOGE0REtoMUJoZ0BtYWls
LmdtYWlsLmNvbS8NCj4+DQo+IA0KPiBMb29raW5nIGF0IHRoZSByZXBvcnQsIEkgdGhpbmsgdGhl
IGNvcnJlY3QgZml4IHNob3VsZCBiZSB0byB1c2UgDQo+IEJVSUxEX0JVRygpIGluc3RlYWQgb2Yg
QlVHKCkNCg0KSSBjb25maXJtIHRoZSBlcnJvciBnb2VzIGF3YXkgd2l0aCB0aGUgZm9sbG93aW5n
IGNoYW5nZSB0byBuZXh0LTIwMjQwNDExIA0Kb24gcG93ZXJwYyB0aW55Y29uZmlnIHdpdGggZ2Nj
IDEzLjINCg0KZGlmZiAtLWdpdCBhL2tlcm5lbC90aW1lL3RpbWVrZWVwaW5nLmMgYi9rZXJuZWwv
dGltZS90aW1la2VlcGluZy5jDQppbmRleCA0ZTE4ZGIxODE5ZjguLjNkNWFjMGNkZDcyMSAxMDA2
NDQNCi0tLSBhL2tlcm5lbC90aW1lL3RpbWVrZWVwaW5nLmMNCisrKyBiL2tlcm5lbC90aW1lL3Rp
bWVrZWVwaW5nLmMNCkBAIC0yODIsNyArMjgyLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHRpbWVr
ZWVwaW5nX2NoZWNrX3VwZGF0ZShzdHJ1Y3QgDQp0aW1la2VlcGVyICp0aywgdTY0IG9mZnNldCkN
CiAgfQ0KICBzdGF0aWMgaW5saW5lIHU2NCB0aW1la2VlcGluZ19kZWJ1Z19nZXRfbnMoY29uc3Qg
c3RydWN0IHRrX3JlYWRfYmFzZSAqdGtyKQ0KICB7DQotCUJVRygpOw0KKwlCVUlMRF9CVUcoKTsN
CiAgfQ0KICAjZW5kaWYNCg0K
