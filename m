Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A63A985B497
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 09:10:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=B1cVd1PP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfBsn47GYz3cL0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 19:10:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=B1cVd1PP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfBs42Zp7z3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:09:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkkY/3NuTWeKNftSi3SzMgItzDS5ZQvtyllB1G/KosFd5n+Hm1wLotN3Yg7nAx8qiNIWob5UHDfi0/UtJSQ2kXACfpwWJ90Ppn15zjfRO8rtiKj30JB7FC5KAOQNlAvy4HawhTqmhr5bCHYRiV3iiX39Irb+Ollj3M1VDvCKVMwPsYO92Kd8g2eUnqMMp1leF2UKA/7G7KF/MOaEVYkIvXJgt3INy1KiOx0+3onIvwREka25/IUD4nSkoEVRRfA2qqaxInDNjXk7DwKX9rKvGUUxb1D2qKCWAuqF0SuB/dRiJfRFSyICK3Mcd5le0p+W6c/eFcrlI+YJqL+g2q1LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjMX3Hetc4EzixWHj19yWVXpjcdUxSyklZLrt0s8k5k=;
 b=H3TyGXhoHfZ95y//Y6e0ijYEdfXXvv6cEM47jI8uHuC/JuFPUUjJkYTRfuzrn+b73GocB2OyXROt5078w87CE8DfA1Pr0h/H+NRbZX4wsU4Lc180MEp13FPTXPSV/aYp2sENR3Hqe98dIxfITrnGyzhovI1ibyWJ8gvlo6RTgAp5xbinfji4XVaSzcJFMcBfI7ba8Xww3KvPOiD1l46VnhSPF2l60ZJRytKHfFezUXt+vLPY++wmiOU08mZJESA2vRn7Yc0Qqy6WzDygZ1Ep7RMpk4LoGzMg9qbY3L6yoAuFLP4khl6R/2hCPmIaVa6sbYPmBY5sTKM3QyFRfKssYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjMX3Hetc4EzixWHj19yWVXpjcdUxSyklZLrt0s8k5k=;
 b=B1cVd1PP5YfgH6+JXfoE2cLgkH9dUSqKbdm23YXskvISaB2wQMeXoZYS/sdA6lQbAFe3OcgEbHtXwBjunHWIN8Kzeg4ka7BGJkhxWVoJuNOQzkaOcRZJRLQlwduftBj1bGo65DRgKK3bIskiUkA373Csa4ghe0c+LSVo3uAJ8wAoXZe5jXOCNWAb+SNZW9m8SZdPoPZdo7lqrn+XauOLF2k6+g2QezTPqhPz0QqHu5cIms0NfNw2718XnSSblcUc+G9GdYyosyYkG6I2xDBXfoO/h0AbTdGzAVkhy/wbbypPaISF84Al6hkPYaKiyZqgOh3kEkWsgUqb+VIcDDs4IA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2102.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 08:09:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 08:09:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/1] hvc_console: Allow backends to set I/O buffer size
Thread-Topic: [PATCH v1 1/1] hvc_console: Allow backends to set I/O buffer
 size
Thread-Index: AQHZKRuyuUEDYLdqhEyjyml7cU78pbEVVgSA
Date: Tue, 20 Feb 2024 08:09:25 +0000
Message-ID: <acbee0b8-3fed-4273-b26c-54667622f2a2@csgroup.eu>
References: <e5709458-5675-2f69-2d59-f380bfbd70b3@infradead.org>
In-Reply-To: <e5709458-5675-2f69-2d59-f380bfbd70b3@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2102:EE_
x-ms-office365-filtering-correlation-id: 8596259c-57cf-4a44-835b-08dc31eb40da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iaLLNJdlilyTev1PRxyfJ4l1Wc1mSYUZLBz/Ith1ZYIcjifRjgUUxLkxnmrhPQeS809Qc7lMWpDNWqauFbfbjygZJCK2QRLWPqv2E7tG1OBzgcwxaf11JWMPKHQRog94cZDJ7W0p/stTpMe3s1xtJV65pq58z1xFLFQGhGUdvZ1aOJQXaHCwO+oSFRcL1Tkye+kaK0nk/EXMyEkWN0C/eD6L5EgPe8BNZReJgNnwWlulr6YVn9cWpsBj/HYf5rW53gfohvmtqReRh7kVP9bH7fId9T9YOeGpwd/5EabjlfeKWNf/JaUvjJ2lo82YXe2aaeVoe3c0OEBNM5kb9B7KyMO05j/2vOVovgtEwIn9ta8VSs65aFY6Onzpz4+tAaV6K9O3jgDNoel0fVqq4x1VJ9uhMI+9DDG6CU0Q7OPZl4n1PqSCksdGGgQ/V0tHDqnWt57BbuIQ2+ZsYYPJQLkUTfnHDhoY47ZMFNOxxoeTF8mh5sWBscRtbjsCI7wrSTmTJrUo+qT0hj4cS1brKHSRa+rG1M3pccav4iXIi3MI+5R7Nwvnr88r0UCfaB63gWOED8AXHHCqTWqCmGgLqM6llTZCYf/zd/tXcLht9YHQKnvVCNXnVxxxMMJGZD90H3Go
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cmoyNW1QcW1ZUmNKdGFldElhRnNYTDgrMWJPUWxONS9nVGEzOUFZQ1ZFN1dX?=
 =?utf-8?B?M1R0eWpkTmUyakVxL2R6WENQV0orMFM0dGxsc3lnYWswUGVlbEYreDNNTjZm?=
 =?utf-8?B?VnBiZDdiVi9Zamx3aGI4WEJBUjdlTU1JNjl6U0lOc2JHOURWSUVNOHRmcnAx?=
 =?utf-8?B?cDFwNkRMRDNDNE9FaTg4dUR6N3RGeUozdjJRcm5tMllvb1B5NWcxNHNQdWlL?=
 =?utf-8?B?YkJnaTBkU2M0UXkxZDdmMDc3cnJkUG94cG5oZU9ySFM3QzczaFl0Zzl5c0JB?=
 =?utf-8?B?NWhWa1VUUHJkUVovd2phYkk1R2dvYUN2YUM4TjY0bDVRZ0Yvc2RPUXcxMnpW?=
 =?utf-8?B?MGdTY1FZOWZ4T0VXMXlwOXF0bkFMelhNcEhvTWNQRjJUNXpoaEhqdVpkcVhp?=
 =?utf-8?B?SUJzRWo5Qktrdlk3R2ZjYmI0NkZENFlwbjdUb2pSbjhKNllGbWlPRnl5OEpw?=
 =?utf-8?B?TWpHS09DRjNrQURLdTU5VVNLb2ZLcTM4N3BmT2V5ZnZRbHFVNnY3TjBieU1w?=
 =?utf-8?B?dVNOTVJrVHNrRTN3dXJLWmVVM3d0T0krSVFkSHFzeEZ2KzlDR2lGWmNLUS8x?=
 =?utf-8?B?QWpVeUdiM1k1NTgvTjg1TFloOHhSa2d0N2dha3dkNlViU1g1bFFtT2NFb0pQ?=
 =?utf-8?B?Qk13Q3pGQlRkWFV1akVKdlRKd1c5cGt2T1JKaHN5dGFoWmp5aG03MVZYMkIx?=
 =?utf-8?B?OHR0T1ZMSmRvYVRXQThhZkZjeW9rT2lIL1RyUm00S0hFMkxrSFkxVzljbDN3?=
 =?utf-8?B?NU9FTm1EVExyZkhzUXFpckFOQ01pTTcwdmlrU3JKaVdmWFBIcXJibHhQSFk0?=
 =?utf-8?B?cjlFM3YydE5nUVJRMlA5UzFha0ZVMFZsa2dEYkQ1MXdWSU9COTdmYUxiSnNR?=
 =?utf-8?B?bDhPZGxvOFlrSXJMYTV0eXltVTJxQ3ZDKzlhTmp0Q2lYcUtUWkNvV1lTc1Nq?=
 =?utf-8?B?cTR4a3h3S2NLeXNQYXZ6c1E2S1ZtMmhvOHdESXJBN0wyUytiSTRQSmQxOTlL?=
 =?utf-8?B?NitiR3ArNi93MEZnaUJta2ovY01GcWRJdGRaUUU0MlhIWm9xMU1UeXRROHl3?=
 =?utf-8?B?VVJUa3dML2IrY3dob1g3aWF2VTFGZ3JtSlhRN2xsU1p4bHloNC9wYnF5Q09F?=
 =?utf-8?B?VUJDNS80U2txaW1hendqckxmM2pGbTEwdXNpTjUwbVdld0JnL2V5L3p3WmtJ?=
 =?utf-8?B?ZXM1aU1LN0ZIRzM3SHYzR28rZVpQWnhHaHdGK2hHZTZOcGxSVDdmOEo5NFhY?=
 =?utf-8?B?ZHN5cG00U1JBc0NzMExHT2RxVGoxQ0E4VUZEYUVCbDNFaU13YmZ2WjJJVWYw?=
 =?utf-8?B?cDZGOTBEdm4rcjBjckxOejVpMEFMRU52cHZSNmxWZkY0Z2NEb3JtNS8rNjVE?=
 =?utf-8?B?aDloTlJYMUJLdmdUWG1KL0NnOTM2YVJzZzNxbGFVTmFJRlNiNG9iL014VjNF?=
 =?utf-8?B?WE1Hc29NTGE5Lzh0dm9DMGRRS3hCS1RndFZBUDE0TndOMmhwNDA3MSt3bVgx?=
 =?utf-8?B?SnBxQU9Uakxrc1Y2M2RPQ1VSL0h4Q3RaanpuMTZ0RzlpZFowQWRqUktLTGR4?=
 =?utf-8?B?OU42UU03TDhweVNBTkVBaVN0aWhqT1J6SXFTOVd6UFgzemdkT3IydnBTUDUr?=
 =?utf-8?B?L2UwRTZ5WGFDaGV6dmtwdzJJUENhVHFYeDExVnRDYkFIMzdOVVRGWnhmNGk2?=
 =?utf-8?B?bmVWT2F3ajBnRXU2Ky9nT2JrSzQ3Z2lMY0k3NExGVTR0bXlEUDBUYVFQUlpZ?=
 =?utf-8?B?UzFRczZ0MFB0aCtjOUVJdXY0TUJXcUN3SkVBZXVDSUl2c0huT3pEYVhpcEZw?=
 =?utf-8?B?Sms3TDZrbUlYcVl6VDZtOERTZnd3S1oybmIxcnpMRW8xQ0c1Nk5YdHdDcmhE?=
 =?utf-8?B?b1dSZWxKRE9iK1hIZlBvRFBOWkJ3OG9JNlMzZUFnUjVsNTlFcjdSUm1DWTNz?=
 =?utf-8?B?bVlMQnRJb29TTnRmZlREdVExVm16dzM3aDFydG1MUDZ1eVQ2NDRwdEQ0SVNm?=
 =?utf-8?B?QXJZMzYrSTlhdmxjeVFnMmVqS3d4ejJ1Si9PMUR3TmRPY3c0Qk1MK2EybTQ3?=
 =?utf-8?B?S204bHlOeElDdjFCNmxPbkRTbEJyOGUxV2xoTmxoRUZMWExIc1FyTTQ3Mit4?=
 =?utf-8?Q?exaUD5QLJFANox5BT83tIIsZB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C60C727820D934DBB56B78A72F2126A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8596259c-57cf-4a44-835b-08dc31eb40da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:09:25.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEeRAm7WEMd1VnvguCU5+qPJHk9VEGsi8hE2XoIPRPGcb3l5pE7E/Y3YRuRc5bphV2pR8MsZIhtOG1U6KE0MeNlCe1a1ikZxXwLRmWcdzuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2102
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDE1LzAxLzIwMjMgw6AgMjA6NTYsIEdlb2ZmIExldmFuZCBhIMOpY3JpdMKgOg0K
PiBUbyBhbGxvdyBIVkMgYmFja2VuZHMgdG8gc2V0IHRoZSBJL08gYnVmZmVyIHNpemVzIHRvIHZh
bHVlcyB0aGF0IGFyZSBtb3N0DQo+IGVmZmljaWVudCBmb3IgdGhlIGJhY2tlbmQsIGNoYW5nZSB0
aGUgbWFjcm8gZGVmaW5pdGlvbnMgd2hlcmUgdGhlIGJ1ZmZlciBzaXplcw0KPiBhcmUgc2V0IHRv
IGJlIGNvbmRpdGlvbmFsIG9uIHdoZXRoZXIgb3Igbm90IHRoZSBtYWNyb3MgYXJlIGFscmVhZHkg
ZGVmaW5lZC4NCj4gQWxzbywgcmVuYW1lIHRoZSBtYWNyb3MgZnJvbSBOX09VVEJVRiB0byBIVkNf
Tl9PVUJVRiBhbmQgZnJvbSBOX0lOQlVGIHRvDQo+IEhWQ19OX0lOQlVGLg0KPiANCj4gVHlwaWNh
bCB1c2FnZSBpbiB0aGUgYmFja2VuZCBzb3VyY2UgZmlsZSB3b3VsZCBiZToNCj4gDQo+ICAgICNk
ZWZpbmUgSFZDX05fT1VUQlVGIDMyDQo+ICAgICNkZWZpbmUgSFZDX05fSU5CVUYgMzINCj4gICAg
I2luY2x1ZGUgImh2Y19jb25zb2xlLmgiDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZW9mZiBMZXZh
bmQgPGdlb2ZmQGluZnJhZGVhZC5vcmc+DQoNCk1vc3QgcGF0Y2hlcyBpbiBkcml2ZXJzL3R0eS9o
dmMvIGFyZSBtZXJnZWQgYnkgZ3JlZyB0aHJvdWdoIHRoZSBzZXJpYWwgDQp0cmVlLCB5b3Ugc2hv
dWxkIHNlbmQgdG8gaGltLg0KDQpBbmQgSSB0aGluayBpdCBpcyBub3QgY29ycmVjdCB0byBzZW5k
IHRoYXQgYXMgcHVsbCByZXF1ZXN0Lg0KDQpDaHJpc3RvcGhlDQoNCj4gLS0tDQo+IA0KPiBIaSwN
Cj4gDQo+IFdpdGggdGhpcyBwYXRjaCB0aGUgYnVmZmVyIHNpemVzIGFyZSBzZXQgYnkgZGVmaW5p
bmcgcHJlcHJvY2Vzc29yIG1hY3JvcyBiZWZvcmUNCj4gaW5jbHVkaW5nIHRoZSBodmNfY29uc29s
ZS5oIGhlYWRlciBmaWxlLiAgQW5vdGhlciB3YXkgd291bGQgYmUgdG8gaGF2ZSBLY29uZmlnDQo+
IG9wdGlvbnMgZm9yIHRoZSBidWZmZXIgc2l6ZXMuICBTaW5jZSB0aGUgb3B0aW1hbCBidWZmZXIg
c2l6ZSBpcyBzbyBjbG9zZWx5IHRpZWQNCj4gdG8gdGhlIGJhY2tlbmQgaW1wbGVtZW50YXRpb24g
SSB0aG91Z2h0IHRoYXQgdXNpbmcgdGhlc2UgcHJlcHJvY2Vzc29yIG1hY3Jvcw0KPiB3b3VsZCBi
ZSB0aGUgYmV0dGVyIHdheS4NCj4gDQo+IC1HZW9mZg0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdCA1ZGM0Yzk5NWRiOWViNDVmNjM3M2E5NTZlYjFmNjk0NjBlNjllNmQ0
Og0KPiANCj4gICAgTGludXggNi4yLXJjNCAoMjAyMy0wMS0xNSAwOToyMjo0MyAtMDYwMCkNCj4g
DQo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICAgZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dlb2ZmL3BzMy1saW51
eC5naXQgZm9yLW1lcmdlLWh2Yy12MQ0KPiANCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDhmM2NkMWUwNTg5ZjEzNDM4MGY4MGExZjU1MWM4MjMyZWQwYmMxZjI6DQo+IA0KPiAgICBo
dmNfY29uc29sZTogQWxsb3cgYmFja2VuZHMgdG8gc2V0IEkvTyBidWZmZXIgc2l6ZSAoMjAyMy0w
MS0xNSAwOTozNjoyMiAtMDgwMCkNCj4gDQo+IA0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9odmNfY29u
c29sZS5jIHwgMTkgKysrKysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L2h2Yy9odmNfY29uc29sZS5jIGIvZHJpdmVycy90dHkvaHZjL2h2Y19jb25zb2xlLmMNCj4g
aW5kZXggYTY4M2UyMWRmMTljLi5mNzgwOWQxOWUyY2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dHR5L2h2Yy9odmNfY29uc29sZS5jDQo+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9odmNfY29uc29s
ZS5jDQo+IEBAIC00MiwxMiArNDIsMTUgQEANCj4gICAjZGVmaW5lIEhWQ19DTE9TRV9XQUlUIChI
Wi8xMDApIC8qIDEvMTAgb2YgYSBzZWNvbmQgKi8NCj4gICANCj4gICAvKg0KPiAtICogVGhlc2Ug
c2l6ZXMgYXJlIG1vc3QgZWZmaWNpZW50IGZvciB2aW8sIGJlY2F1c2UgdGhleSBhcmUgdGhlDQo+
IC0gKiBuYXRpdmUgdHJhbnNmZXIgc2l6ZS4gV2UgY291bGQgbWFrZSB0aGVtIHNlbGVjdGFibGUg
aW4gdGhlDQo+IC0gKiBmdXR1cmUgdG8gYmV0dGVyIGRlYWwgd2l0aCBiYWNrZW5kcyB0aGF0IHdh
bnQgb3RoZXIgYnVmZmVyIHNpemVzLg0KPiArICogVGhlc2UgZGVmYXVsdCBzaXplcyBhcmUgbW9z
dCBlZmZpY2llbnQgZm9yIHZpbywgYmVjYXVzZSB0aGV5IGFyZQ0KPiArICogdGhlIG5hdGl2ZSB0
cmFuc2ZlciBzaXplLg0KPiAgICAqLw0KPiAtI2RlZmluZSBOX09VVEJVRgkxNg0KPiAtI2RlZmlu
ZSBOX0lOQlVGCQkxNg0KPiArI2lmICFkZWZpbmVkKEhWQ19OX09VVEJVRikNCj4gKyMgZGVmaW5l
IEhWQ19OX09VVEJVRgkxNg0KPiArI2VuZGlmDQo+ICsjaWYgIWRlZmluZWQoSFZDX05fSU5CVUYp
DQo+ICsjIGRlZmluZSBIVkNfTl9JTkJVRgkxNg0KPiArI2VuZGlmDQo+ICAgDQo+ICAgI2RlZmlu
ZSBfX0FMSUdORURfXyBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXyhMMV9DQUNIRV9CWVRFUykp
KQ0KPiAgIA0KPiBAQCAtMTUxLDcgKzE1NCw3IEBAIHN0YXRpYyB1aW50MzJfdCB2dGVybW5vc1tN
QVhfTlJfSFZDX0NPTlNPTEVTXSA9DQo+ICAgc3RhdGljIHZvaWQgaHZjX2NvbnNvbGVfcHJpbnQo
c3RydWN0IGNvbnNvbGUgKmNvLCBjb25zdCBjaGFyICpiLA0KPiAgIAkJCSAgICAgIHVuc2lnbmVk
IGNvdW50KQ0KPiAgIHsNCj4gLQljaGFyIGNbTl9PVVRCVUZdIF9fQUxJR05FRF9fOw0KPiArCWNo
YXIgY1tIVkNfTl9PVVRCVUZdIF9fQUxJR05FRF9fOw0KPiAgIAl1bnNpZ25lZCBpID0gMCwgbiA9
IDA7DQo+ICAgCWludCByLCBkb25lY3IgPSAwLCBpbmRleCA9IGNvLT5pbmRleDsNCj4gICANCj4g
QEAgLTYzMyw3ICs2MzYsNyBAQCBzdGF0aWMgaW50IF9faHZjX3BvbGwoc3RydWN0IGh2Y19zdHJ1
Y3QgKmhwLCBib29sIG1heV9zbGVlcCkNCj4gICB7DQo+ICAgCXN0cnVjdCB0dHlfc3RydWN0ICp0
dHk7DQo+ICAgCWludCBpLCBuLCBjb3VudCwgcG9sbF9tYXNrID0gMDsNCj4gLQljaGFyIGJ1ZltO
X0lOQlVGXSBfX0FMSUdORURfXzsNCj4gKwljaGFyIGJ1ZltIVkNfTl9JTkJVRl0gX19BTElHTkVE
X187DQo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ICAgCWludCByZWFkX3RvdGFsID0gMDsN
Cj4gICAJaW50IHdyaXR0ZW5fdG90YWwgPSAwOw0KPiBAQCAtNjc0LDcgKzY3Nyw3IEBAIHN0YXRp
YyBpbnQgX19odmNfcG9sbChzdHJ1Y3QgaHZjX3N0cnVjdCAqaHAsIGJvb2wgbWF5X3NsZWVwKQ0K
PiAgIA0KPiAgICByZWFkX2FnYWluOg0KPiAgIAkvKiBSZWFkIGRhdGEgaWYgYW55ICovDQo+IC0J
Y291bnQgPSB0dHlfYnVmZmVyX3JlcXVlc3Rfcm9vbSgmaHAtPnBvcnQsIE5fSU5CVUYpOw0KPiAr
CWNvdW50ID0gdHR5X2J1ZmZlcl9yZXF1ZXN0X3Jvb20oJmhwLT5wb3J0LCBIVkNfTl9JTkJVRik7
DQo+ICAgDQo+ICAgCS8qIElmIGZsaXAgaXMgZnVsbCwganVzdCByZXNjaGVkdWxlIGEgbGF0ZXIg
cmVhZCAqLw0KPiAgIAlpZiAoY291bnQgPT0gMCkgew0K
