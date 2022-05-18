Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76652B721
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:13:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L382245d5z3dPn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:12:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::602])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37xf3PlTz3bwH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:09:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAvMiVkpo+KdfPYgQYFeNJ0+QKiNr+pDPH0ggtAz2bsh73j5pgQGs6EQFOVQ05uohUuuQQmiAyTiRz87NzT7hQ0k6Nnfbo2+MVO38ywrByDVyA+HYBpHC9R8fHMiF6j1NGqkhJqnIk9C8rV/zABpQ0tPjqseCGbh+UBbf38IZv8iYTgpLnHZ3eVeDZrgBDMJj7a1RuyDN7szOYN/9cOwgNOQBp8g96iv/C+pqedBnHSVCjfC+QE4SBOzOUPB4Vcc66cvpcWLotrIRpE1FQ01nyyu0+FoTafY8xjQvKwJjABbsnh2Bv7g12jGc1FeqSPcGVDh38B1J4HHaZyf4AlLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf8ZgY679IFflPEDF8slUL/28XDtuykA1bSKLRnCdBE=;
 b=kMDjRJ3A6Caf7Thl/N95NAP5avbKQAW2ZCvWYUTOU8SfHKHgSnr/qbEBboxvdsX2zVCkX/KvsA+YZ2kj6GmjHP+qC38uWQrlzPza5reOAaM352dxJdNJw29ZiqF1MUDvk8WcipyJGqBo81gwDvOLWZxuO83vgM1r4W7QEv6eB7Js4sR2jo5642L5FYh+mLqCoWJpLU8JG2HXkF0dgWRa7CPAoVc2aLC1sG9kuQzAXPRiO8bmZDKCLzExkjC/B98KeeTTtmgfZwixveGj/ENiT730mhUJ3jAReetNS2+8vNxnctHw2yHu00cmO/uifajRMU3G0qGUIyOPSqhgErSU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2807.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 10:08:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 10:08:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAGdwA=
Date: Wed, 18 May 2022 10:08:48 +0000
Message-ID: <75b4b16c-ef1b-dc68-d683-7fb2de0b9c0e@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
In-Reply-To: <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d80bfce-f55c-48ea-9942-08da38b666b1
x-ms-traffictypediagnostic: PR0P264MB2807:EE_
x-microsoft-antispam-prvs: <PR0P264MB2807DEC1CC4B67FD9B8CC320EDD19@PR0P264MB2807.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wxjKgwilVoPTMnojElttU7Ap43I8WxKUdmvM7EHrh+ZGkUXratViMcclzrnK5ll/+xQ7XuXx0o2F4LHbg94PRobi/PaEL965bGH/s+zLX0iuAHunQB8N9vi5FZU4t20ZERPBZw9vqL4kwqBjVZuKhlGIK6+Sy0pxrCe6fHCrTom49yLimrGuM9b7dp/Fx/BVFdTwp9l0qBjJdAH2i1M8Ss+/pBHC4CZTiMM0u7JIlmrlSD41xkgWXreENwxuHzKLVePSzXoay+8ojk66u67Fta/lZnvz1Hbhy0antbEYzF0ky3GZdnZGZNBXFwYsoNK0T6sguvC7H7VyEgPqxsHTp9EQt2ksLODkiSJplJ6XC2vwckkvRgGuD1kddJeQlpsk4VV0qAAwerhIgQnKyV9NBTSj7aYtvrXJQ88t8mC5wSKuaCUBYO5rSt2QYGSnB5wcsQg0iIIb7pn93r1Ga0s+uetx2Q6Hgr+M22fqQ4l8S3YzHna3r2kJT/WSlDB2NTXou4osWJY0Mb8i/Qvzv5sMHEELtunqj3DvfLe8RHwVZ1x3uhPdEHTe6m9Gcw0733RinXKkOVdbCbly7jV0mSGFt2n5irf5QkFUUQ+k7L4vq2Re7xct3l7CDrFXEmzLdvFAQxq2fECnTYus10Td4CNAj6q3huMgo35HfDz4c94OTXKqS147V7sb8OfKDDINU8BPVTdhFYKfakok1nwo5RZfYJelWg9eJN6jXeQnbbpwStWIJXusfaA5t8iQivaNsYQM2681nC+Uxhx9nWYx04XpnRvqFEhHNq0mUDb6DJFWUuEJQlYZN8YrCWPStBLbFeo0V/9k2rxt2yEK6y22U7OLhAKg2w660BIQs8riS/nYWAg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(110136005)(31696002)(83380400001)(66476007)(86362001)(64756008)(66946007)(8676002)(186003)(38100700002)(122000001)(2616005)(6486002)(66574015)(2906002)(38070700005)(71200400001)(508600001)(966005)(66556008)(8936002)(54906003)(66446008)(44832011)(31686004)(6506007)(316002)(26005)(76116006)(6512007)(91956017)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eitjeXVTZ2R6MFVzdm9PZGUrbnhRY1BzczVwRGVUalFROVZvelYwNnZYekVu?=
 =?utf-8?B?L1ZtTzNwakRrZkhCVy9pMit4M3FRZ1phWHdqYTdTc3NtcThvOGozdHg3VEI4?=
 =?utf-8?B?Qy9hNWI4dGovemFBYXl5M3RyZFY5NjVUQWV0aHI1SUVOeEhDdnBxNEkyVG5a?=
 =?utf-8?B?MzQ3YytQa090dDlhSE1QWnpocy9rNGpqbEVRSHczNVVsNzQ4RW51SUUra2lq?=
 =?utf-8?B?OEVSMWNtWTdyMmk5YnZtNTJlMXkwWmY5aUNNVnFYeUQrcTc0dGIzZ1AzeEg5?=
 =?utf-8?B?ZkRkODNTSFFsSDE5Zk9VYzV4TFpYM2ZhekVuUWx4Y3FTd1gzeG14NVRJNnBE?=
 =?utf-8?B?RzJJTHE2WGRPbzQxRG5zdnBPbHE4NU5LalR0Yk5zbk00OUlCLzJzaktZSjdh?=
 =?utf-8?B?SytYT1k5MlpTeVNGeW52VU5UanU1UTd2aHpxdzduQlJkb05yTzREUGtjOFFn?=
 =?utf-8?B?K3pQSFJhOU5sbzRiZFhTYVM3bWJoS2dWZHp2UVQwTG9qVkRkVU14ekNseit4?=
 =?utf-8?B?OCtWNG5NWkNGLzV5L3NhSlMvbG82TnZHdVErWWc5ZkVIK3VLSHoxTlR2REFD?=
 =?utf-8?B?ZGZFUWlqcDkrandSYXpObVU3dlZVcmdqcHpZbFZDejlYMzgzeHB6YSsrMnZz?=
 =?utf-8?B?Z21nOE1JdkI3NzFhR0ZKZU1HT0hPdDlpbzI3Sm9tWXlCTDY0TUhyc1FvYWhW?=
 =?utf-8?B?WWNCVmpMSStQak9VaHkzTWxOMzAwdU9HRUxuR3FWcjdzOERtRVJubUNNdFd1?=
 =?utf-8?B?TmhhVStlOGo4MFZKckY4dXVOR2FLQzh4RTcrNUExZnFhczBtd290RGN2MDVM?=
 =?utf-8?B?TjViZ1krY2dXcFNaZGdQWm9qM25JQ1Z0ZGdzelQzQlVpRFRzbkRVTXVyenlz?=
 =?utf-8?B?ckJ6OTlZVC9lQ0pUZjJKQmVHV3BTdStuTDBYS3FJdWxpSDh2VUtRYWpWZ2JJ?=
 =?utf-8?B?Qy85TjJmaDU5bThKeWthMkxuYlJwL3FRNU1VdHlhbEJydjY4Tkh2aGtidmFZ?=
 =?utf-8?B?NGpoWkwvbUpCUHRFQWp5T0haeThEQnBkdlJRZVFLMW1YUHhnWk14cEZvenZ1?=
 =?utf-8?B?MFhBdFFoYjBMNlo3NE5DOU10U2czalRLMGZTbUtIRU91QXFlLzVhRnc4NmtV?=
 =?utf-8?B?d1JBUnZ4aFY2NEQyM2tNaHJjZFBGeS9WOFFRWFE1OGxWU0NHQlpPbGttZjEv?=
 =?utf-8?B?UmJNYjZqQjd1SHV4TENDR0xLcDFNdG9UbXdFM0pZZzVmcXE2WUlSVk94T2kw?=
 =?utf-8?B?ZkMxdUp3UzFhTnhqdUllTlYxUTlzWjNFdzZ3cW9EN2xkRmRNRjN3NUJBY2h2?=
 =?utf-8?B?Z2gxV3k2NHorbHJQMDE0aGJSSXBrRXRxMml3cm02TE5LR3JuSUYvZTZkNTRR?=
 =?utf-8?B?dnBUOGtlZDlMb0NpK1NnK1RHRk16YlhVYUlZK0xYS0I4RGp3bU9WT1RSTFdw?=
 =?utf-8?B?cFZuZHJOb0VWTGlZU3luZmxjMWNBSmZGV25vQ2dWTnc5V3BBeitkMS9SbE5L?=
 =?utf-8?B?RVZudFdLeUlMSGdCVFd3MkRMMW5YR2JGY1pVQ3BRY3RONzZST1hxMFFZN1h4?=
 =?utf-8?B?T3IxL3BnMUVOc2Fwa25jcE95QXR3ZHJ3dWplYXhaRFpLa2k5UHcyMlF1U1h1?=
 =?utf-8?B?UWVvc2NHSnNIV1o4SFVleHVsVWhJaUVCSUpLUjZnRHYvaXViOFZLZWdSb3BV?=
 =?utf-8?B?NXNnTHlwSXJHYzcxNHo1a0hLNVlTSmNXeDBCMUlUb3ZVcFRTVnl2RXdMWVNa?=
 =?utf-8?B?L1ZaVHMxYVF0OXl3K3Z2R1NZWmhyVXk0dHhaY0J1d0xMQnpQblZ2b2w2TGV6?=
 =?utf-8?B?M1o5OTE5M3IxN1RwQno0ZWVsNCtmZmRGajdtNVptUTkrYmI3RFF6Q3ZTN1pT?=
 =?utf-8?B?N0wrcmVxOVJGTFdRZG9nZ2F2SFVpazZKcEdmL3RsQkJDQXFPVDFYdVl6UFph?=
 =?utf-8?B?TENDcUxsUU9weEZpMUJOQVNzM3hOVFhleURIdlFiaG5Bc2xzTXAzWE9EYyty?=
 =?utf-8?B?ZjhqRms2Nmt2T2l4cUw2U0ZYZkdFRDdwRlFZdUJ0cWlsUy82MXg2K1hSclNP?=
 =?utf-8?B?NVplQ0xvTmZ6QjltWGNHRU81eFY0M0FCTDdJMnEzSklmaHlRMTUyc3hVVmdJ?=
 =?utf-8?B?NmZ6bDFxTVBVRG5PRzhlQkNTbUMvdGRFYWhLUm5seDd0c1hlOWRKSTFpWW9s?=
 =?utf-8?B?eEVHQlpoTWFBcTNSTDhxY0EyZ3BYUHZYWHZ6akVsNG5Sei8vVkhvSXBnamlX?=
 =?utf-8?B?UEJnVmd4VTU5RFpFSlJVTUJ6SEI4VG5DUjNxUjE2TFVVMnhhckE4aUpmdE96?=
 =?utf-8?B?VXhWZWNDVHZOYWQ2bWlzVFlsNVNycWd0ejUyM1dSUTUrS1NtYlA4UjJGeCt3?=
 =?utf-8?Q?JTCWS/riy78ez8UVrRt6C4J1w4UzyS198huKZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA12DE68874E064ABDB61390B8B981B8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d80bfce-f55c-48ea-9942-08da38b666b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 10:08:48.4152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28SVlp1fQnQbPfBk9M57w0kVZP2iSkj1QttKLAjYpkQ3NGxFfuHng+972801Vi9Alisuseyef/0Ztb9ZZIK2QC4PPIeUK8dXew/W6UqmwrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2807
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

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTE6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEEgbG90IG9mICNpZmRlZnMgY2FuIGJlIHJlcGxh
Y2VkIGJ5IElTX0VOQUJMRUQoKQ0KPj4NCj4+IERvIHNvLg0KPj4NCj4+IFRoaXMgcmVxdWlyZXMg
dG8gaGF2ZSBrZXJuZWxfdG9jX2FkZHIoKSBkZWZpbmVkIGF0IGFsbCB0aW1lDQo+PiBhcyB3ZWxs
IGFzIFBQQ19JTlNUX0xEX1RPQyBhbmQgUFBDX0lOU1RfU1REX0xSLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+
IC0tLQ0KPj4gdjI6IE1vdmVkIHRoZSBzZXR1cCBvZiBwb3Agb3V0c2lkZSBvZiB0aGUgYmlnIGlm
KCkvZWxzZSgpIGluIA0KPj4gX19mdHJhY2VfbWFrZV9ub3AoKQ0KPj4gLS0tDQo+PiDCoGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfMKgwqAgMiAtDQo+PiDCoGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgLQ0KPj4g
wqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaMKgwqDCoMKgwqAgfMKgIDI0ICst
LQ0KPj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jwqDCoMKgwqDCoMKgIHwg
MTgyICsrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMTAzIGlu
c2VydGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkNCj4+DQo+IA0KPiA8c25pcD4NCj4gDQo+PiBA
QCAtNzEwLDYgKzcwNyw5IEBAIHZvaWQgYXJjaF9mdHJhY2VfdXBkYXRlX2NvZGUoaW50IGNvbW1h
bmQpDQo+Pg0KPj4gwqAjaWZkZWYgQ09ORklHX1BQQzY0DQo+PiDCoCNkZWZpbmUgUEFDQVRPQyBv
ZmZzZXRvZihzdHJ1Y3QgcGFjYV9zdHJ1Y3QsIGtlcm5lbF90b2MpDQo+PiArI2Vsc2UNCj4+ICsj
ZGVmaW5lIFBBQ0FUT0MgMA0KPj4gKyNlbmRpZg0KPiANCj4gVGhpcyBjb25mbGljdHMgd2l0aCBt
eSBmaXggZm9yIHRoZSBmdHJhY2UgaW5pdCB0cmFtcDoNCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIyMDUxNjA3MTQyMi40NjM3Mzgt
MS1uYXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tLyANCj4gDQo+IA0KPiBJdCBwcm9iYWJs
eSBtYWtlcyBzZW5zZSB0byByZXRhaW4gI2lmZGVmIENPTkZJR19QUEM2NCwgc28gdGhhdCB3ZSBj
YW4gDQo+IGdldCByaWQgb2YgdGhlIFBBQ0FUT0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWwgZGlm
ZjoNCg0KQWggeWVzLCBpdCBtYWtlcyBzZW5zZS4NCg0KSW5pdGlhbCBwdXJwb3NlIHdhcyB0byBk
ZS1kdXBsaWNhdGUgZnRyYWNlX2R5bl9hcmNoX2luaXQoKSwgYnV0IGFzIA0KZnRyYWNlX2R5bl9h
cmNoX2luaXQoKSBpcyBkZWZpbmVkIGFzIGEgd2VhayBub3AgZnVuY3Rpb24gaW4gDQprZXJuZWwv
dHJhY2UvZnRyYWNlLmMgd2UgZG9uJ3QgbmVlZCBpdCBmb3IgUFBDMzIgYXQgYWxsLg0KDQpBbmQg
dGhlbiBrZXJuZWxfdG9jX2FkZHIoKSBjb3VsZCByZW1haW4gaW5zaWRlICNpZmRlZiBDT05GSUdf
UFBDNjQgaW4gDQphc20vc2VjdGlvbi5oDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jIA0KPiBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmMNCj4gaW5kZXggZGExYTJmOGViYjcyZjMuLjI4MTY5YTFjY2M3Mzc3IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4gQEAgLTcwMSwxMSArNzAxLDYgQEAgdm9p
ZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWFuZCkNCj4gfQ0KPiANCj4gI2lmZGVm
IENPTkZJR19QUEM2NA0KPiAtI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0
cnVjdCwga2VybmVsX3RvYykNCj4gLSNlbHNlDQo+IC0jZGVmaW5lIFBBQ0FUT0MgMA0KPiAtI2Vu
ZGlmDQo+IC0NCj4gZXh0ZXJuIHVuc2lnbmVkIGludCBmdHJhY2VfdHJhbXBfdGV4dFtdLCBmdHJh
Y2VfdHJhbXBfaW5pdFtdOw0KPiANCj4gdm9pZCBmdHJhY2VfZnJlZV9pbml0X3RyYW1wKHZvaWQp
DQo+IEBAIC03MjQsNyArNzE5LDcgQEAgaW50IF9faW5pdCBmdHJhY2VfZHluX2FyY2hfaW5pdCh2
b2lkKQ0KPiAgwqDCoMKgwqBpbnQgaTsNCj4gIMKgwqDCoMKgdW5zaWduZWQgaW50ICp0cmFtcFtd
ID0geyBmdHJhY2VfdHJhbXBfdGV4dCwgZnRyYWNlX3RyYW1wX2luaXQgfTsNCj4gIMKgwqDCoMKg
dTMyIHN0dWJfaW5zbnNbXSA9IHsNCj4gLcKgwqDCoMKgwqDCoMKgIFBQQ19SQVdfTEQoX1IxMiwg
X1IxMywgUEFDQVRPQyksDQo+ICvCoMKgwqDCoMKgwqDCoCBQUENfUkFXX0xEKF9SMTIsIF9SMTMs
IG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3RvYykpLA0KPiAgwqDCoMKgwqDC
oMKgwqAgUFBDX1JBV19BRERJUyhfUjEyLCBfUjEyLCAwKSwNCj4gIMKgwqDCoMKgwqDCoMKgIFBQ
Q19SQVdfQURESShfUjEyLCBfUjEyLCAwKSwNCj4gIMKgwqDCoMKgwqDCoMKgIFBQQ19SQVdfTVRD
VFIoX1IxMiksDQo+IEBAIC03MzMsOSArNzI4LDYgQEAgaW50IF9faW5pdCBmdHJhY2VfZHluX2Fy
Y2hfaW5pdCh2b2lkKQ0KPiAgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGFkZHI7DQo+ICDCoMKgwqDC
oGxvbmcgcmVsYWRkcjsNCj4gDQo+IC3CoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMy
KSkNCj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPiAtDQo+ICDCoMKgwqDCoGFkZHIgPSBw
cGNfZ2xvYmFsX2Z1bmN0aW9uX2VudHJ5KCh2b2lkICopRlRSQUNFX1JFR1NfQUREUik7DQo+ICDC
oMKgwqDCoHJlbGFkZHIgPSBhZGRyIC0ga2VybmVsX3RvY19hZGRyKCk7DQo+IA0KPiBAQCAtNzU0
LDYgKzc0Niw3IEBAIGludCBfX2luaXQgZnRyYWNlX2R5bl9hcmNoX2luaXQodm9pZCkNCj4gDQo+
ICDCoMKgwqDCoHJldHVybiAwOw0KPiB9DQo+ICsjZW5kaWYNCj4gDQo+ICNpZmRlZiBDT05GSUdf
RlVOQ1RJT05fR1JBUEhfVFJBQ0VSDQo+IA0KPiANCj4gLSBOYXZlZW4=
