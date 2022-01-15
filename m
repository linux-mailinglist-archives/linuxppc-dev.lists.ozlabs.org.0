Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2A48F646
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:08:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYlJ6xR3z3c9c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:08:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::620;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYkp2p84z2y7P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:07:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvu7F9yMNgtpyGmVKBClQ1fd8QJ9mYFUCsZH85GJ7xqV6cvLDxUNRCxjYgC4jmyzGlXRt9hlKEIjCQSFhfH4awDFMYZQdalKyLXYVsNbTPDDcVen0FDLbbXnKUZyl+s1Ts/42YxyoisI1IC5U7sdN7uzp9dNWe2V1RW69caobNlezBOcj1MB4jmVAb0wHQi6uoCaS0Ji/Z2IKolyBuMPTMPZzGjJl0wxRjcmCp9S8h5aAxftJA7eVO1GdforlETgqWAu373O8640F1+4oATA75ks1DgdpABvEAUb6jncuZXIJYFEWJz+aLpixFuP5BOneDOZW7zEn9DHXloCsY2pNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFqMUP3+evs1v5PDtlNK1RZnQU1wZYhNrqsUcEi+6zU=;
 b=T+g+ZdQZ2rF506sZm7phIOpqwGCjnj/dw/0ybSREJQKX4x9By19+RQmKJMsRh1UTTsDb4wrh27XXjhLnA5d/BS0CjTh2rok0X/AWsLA7Pen/3JwpnHV3sL1oijWVNDb+KG0gCvYYrwuA/j/eM5hq3CRe8hKBgTbYJhKAx+rhpaSqkS/KRPbjvockfWqHAqMPS3geWgklJGA7G3nHlwb92yjKVUWP+HsvmqsujXyyiIKfb8kv0MIlu9zJw4la+dqJq0LSDL+mXn0krQA7bqrBmo7laLmX+4cJ0JTnX3NZqOLYzwb2wnGVTAUokC+M4TITkSZY5oDvckcR4xCHxLADGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Sat, 15 Jan 2022 10:07:26 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 10:07:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/3] mm: support huge vmalloc mapping on arm64/x86
Thread-Topic: [PATCH v2 0/3] mm: support huge vmalloc mapping on arm64/x86
Thread-Index: AQHX+zD+bhDnruiMs06lmjMePUFX/qxj+QGA
Date: Sat, 15 Jan 2022 10:07:26 +0000
Message-ID: <c2ca11b4-2802-3353-a9d4-a3108bfc9708@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7ddf42b-c5f7-4acf-8800-08d9d80ed505
x-ms-traffictypediagnostic: MRXP264MB0263:EE_
x-microsoft-antispam-prvs: <MRXP264MB026395399046BC5AEA376AB5ED559@MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T2tRmZ5y7iR6Z7WUqXOPKyvTpT0QZFPn5Z2badpVpPsEMtdHl2mzbPwdCRAomj6A7By5wQjuTikZPrcE/aOJrO75my3t68Q7TAAhUQAyJE9VN2bFiIcS+ukyAMCr7HfoQNSBwjNbBFmfS9ACvCBlxa/IISIrO2FORX7jFimLPVzTblBGRtQCH4+Egv6D2c4aVt0cHZAJU43qNeFANRr8W6KQeUTfPlx/pwF1hXjKKhB7AGFy0GZ2tr99wl/SBPLkOyVtZX19hqh/FKhbXtZcyQ78PpxEtkFjyxo1BKeB3eVg3E5oDjMAkD8lilU+rWNk7k8j0egsOZ15A+5p5Gjtw03cW/eUHUIqKcm5Md9Vn4mG4tSc8BuNZMX9PmSSTbBC0+raDdXE+3RV4A7xl31UvRmOe/ElkMknroZ3nlyfnIHxyEFjLqmviMvNL2xvcB6ZDqWlM8JCTa2D1j6oNhmdP78yY2ZKClZ8swAOqFJsUzgdjJcOwevWFOmYLKL9LrOejNoYKpAb+Lq89V2B8ivNm/368OTTGh1w60nU454c2iM8TA3IzRyzrXSTyQele3xEhCaJvnOAd+B3SEHrM7pAgEkAvVuh0RXg8eKn1CKIa8BFsJNIHqyDzBp+i56imUe9GXXVKb8kg48FF9x2B37qKzRmjH9QvvNYdypnKPvpsVXGacyz1A/t0NNRoCBJeN/QYtPHoU35YW5YR706LNk2dmFCa9upIUuaBNL+8bfNRxTMLhWv9nUuRvr03B2oth9RzAgESFTe2lox66DKFef9eRACWsa86OnACHlT2LPgq2Ed5ecTS/ARnmj6P+hDHwcqU57/yrq24kuQrNJB0W86mlaLaPgBZHCDc3cs8WI9fDDZFfgPRWCeZjVkbTU4sKTZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38070700005)(31686004)(6512007)(76116006)(64756008)(966005)(186003)(8936002)(26005)(71200400001)(6506007)(66556008)(2906002)(86362001)(36756003)(31696002)(2616005)(8676002)(6486002)(5660300002)(7416002)(83380400001)(38100700002)(4326008)(316002)(110136005)(54906003)(91956017)(66946007)(44832011)(66446008)(66476007)(122000001)(14583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjF6cVo5K1dxOExVbkZSYWpjTXRGN1ZXUmE1MnR6SExIMmZMK2gzaFBQd0FN?=
 =?utf-8?B?V1VxTGNwbVNrYUY5YXBMVW1PM1A3aVVYbExhc2ZOTG94a0NJVEhPcHdSWUJ6?=
 =?utf-8?B?cUtXMnJPMFU3MmpOWVM3OS9Dd2I1YkZUS2w2NGlZQzkySXF4M3hTR1U2R3ZE?=
 =?utf-8?B?UmUwblR2SmJidDVTSHkzUGgxT0xHRWc5VTM2WHl4cEhiaEhOQ0N4WlBUNlli?=
 =?utf-8?B?MEwrOEljV1VaL1d6RHBGbTZaZHJRd1kzeWZNTy8vMkpRaDRJMHdPTlVYamZt?=
 =?utf-8?B?TGZTZWxDeFJtYVJBeDBnMHhiek1GR0lRdkx3c2xxZFhTUlJHQXppVXpuZ0Z4?=
 =?utf-8?B?dkUyYjI5eTZYVk0xTjdDU2ZVRklGTmxWcm1RK2lFeVdqRUpvMWk1WDIyWGIz?=
 =?utf-8?B?QlR4clhnVm9pd091VDJ1dzhhNnk5bUtyeCtDOUltUTI3MlRrK1ZLNXNpRkVj?=
 =?utf-8?B?WjJnUW5pU294V1hPSW1kdHNBOEh6SzVJRXZmUW5HOHVoOTJ1dDRBZ25xSms1?=
 =?utf-8?B?c09KbzRkSVhkbHNZRkQzOXJWUytOek03eFo3ZmcrcG4zQmY5dW43YVNmdEhJ?=
 =?utf-8?B?aHpkMUhMV0xaU1poZ2Fic015cUNkWlY0bmFWZlNtRlZPRTJHdE9vR0pDY081?=
 =?utf-8?B?ODNwNXpla2RqM2xqU3VGUE1GenpuN1NkTVA4QSs5S1kyeUVlc2xBOTJpU3Zr?=
 =?utf-8?B?aG1IV2tGejdHaXUxR3ZFeDhOWHYvWkozdjBFVkFITVB5cGZKQ0ZpN2dNR2h4?=
 =?utf-8?B?bDVERGFxaHI0b1krTFNIbUpSM2FxMzZLNFJDeis0Nk1rYlZpTjVtY0JCMHRK?=
 =?utf-8?B?SUloV2pDcVppVUN3WlBDVThBbUJmRmliemM4Y1d5MEJlVzZ1MWc3UjNjRmtj?=
 =?utf-8?B?TU9aSXBIWmlmRVBDWHNmemZOWloyT0dpbzZMTFFwaDBLNFRCTm9zenAwdlY2?=
 =?utf-8?B?dGFpYUFsSnpmZjdmSThxVVBoZHBBeC9ZNmk2UkxNeDBEOXJjVjM1cHNFNnpV?=
 =?utf-8?B?ZituQjFCMldzeDczdUFzM0ZSUkdxOUxGYXowa1RiUUM2bnJxWTdQSUppcVNF?=
 =?utf-8?B?WWo5bGpGRHordDhhaEpWN2xIMUFPVXAwYXdYN1U3NFR0MVp4UldZU25SUjhj?=
 =?utf-8?B?bnMyaTNzRnZHNjRIMFU1bnEzVGtOdStBU0s2em9tNmRoSDQydThCNzlMdkhX?=
 =?utf-8?B?TW8zcTlkMUxLcnpLVTZ4b1g5cjBLVkRYT0hXN2dEcHg4VEpEaEMrbU05L2Nx?=
 =?utf-8?B?eDJNemFRWUc0RzFkSTRSYTZybk5tRTBLWHJyaURBMnlQT0VXUzhpNEx6ZURh?=
 =?utf-8?B?cit2a1o1cm9FOFdpcHIvYitFdU9KRlppSUNHS2x5NGJ5OVF2OWNHN09ia3NU?=
 =?utf-8?B?OS9PQ0FCcDhvN1YwZFppaFVUVHg1aDlxOUJnb2lQVHNHVlNKRjE0RmVqUjRl?=
 =?utf-8?B?T0I3RGlrTUNRUjB1UW82QWNML3lWOXZEWWt4MTFISDQ2THQyN0paWDNBOXB3?=
 =?utf-8?B?MUhCNEVNQTVERXBSVCtJMVRpRHJmWkMvU21nSzIrVFJuSEkya1NsbmlWTzMv?=
 =?utf-8?B?U05xd1Q0WW4vcVQyVUNyS3g3QXlmTjZucTg4eHVnVHFpbjVzUWtSbnVRSEFi?=
 =?utf-8?B?d3p3bzF1ME9PZVVYdURzbldFWkw2djNRTjNiSkpPK2dTSTJ5THdLUm9rYWIv?=
 =?utf-8?B?bDE5SU9Sb25kNDJJc1FVU1ZZOVdYcitaOU5pbllIUGE4VXZZTXk0UUwwMlIz?=
 =?utf-8?B?WGJhSytzenVWd3Zrdi9WNGlPa2xvQjRLdy9IbjJZZWlLYk4vb0llTE9ud0ZW?=
 =?utf-8?B?KzFsZDFJVGJJRnJQZzhOWVJOand1SXJIODVQOU9FWkFheWI2a1NKYWRWaGtu?=
 =?utf-8?B?Yzd3Nm9MblMyMkZuclBNSWFTdHc3SUgxWFI1Y21saHNOM21PSnNmelA3aDNN?=
 =?utf-8?B?aXBXV0ZVUVZ1WC8rQm41a0I3Ly9TQ0NlSVBhZUQwZkNTWVR0YllaNVBjUWNW?=
 =?utf-8?B?ZC90ZDlDSW9sZ2NnSmhMbnFxNTV6djhTUzZBek5GQXBYMkhVZVhCZUlnVlVE?=
 =?utf-8?B?Slg2Mi9wVXk2QmlhMUFLbVZzSlUycHFXd1JneUZEd2hIUmJWMGR3TXRmL3RX?=
 =?utf-8?B?dlAwY204V3JKVnFrQ0Q1VHVtQ01LMGtEMEpFdmI3QUxvY3hCWThHdDRudVRI?=
 =?utf-8?B?N0RCQnp6RFBiaXBTZ1JuQ01YdHFWZ0xnWnR3NXVydEh5RStoc0lHa041S2Zs?=
 =?utf-8?Q?Khc+UfCl/HzcV9mTi2GFcFaTKbNuan6TlSX4BQxT4w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <749A60F9B95A64439CDA8AF79B3D5496@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ddf42b-c5f7-4acf-8800-08d9d80ed505
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:07:26.3721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmKztRceGjVVb+44LyZWakbyTPzaEI86Amw0PmN7o5fsyZHaiYjzhUWqmiNkPdHlLYpqtE4vEMDLhHxiMpR7z1MFc3pFGamkq6dezI1f31g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0263
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzEyLzIwMjEgw6AgMTU6NTksIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IEh1
Z2Ugdm1hbGxvYyBtYXBwaW5ncyBpcyBzdXBwb3J0ZWQgb24gUFBDWzFdLCBidXQgdGhpcyBmZWF0
dXJlIHNob3VsZA0KPiBiZSBub3Qgb25seSB1c2VkIG9uIFBQQywgaXQgY291bGQgYmUgdXNlZCBv
biBhcmNoIHN1cHBvcnQgSEFWRV9BUkNIX0hVR0VfVk1BUA0KPiBhbmQgUE1EIHNpemVkIHZtYXAg
bWFwcGluZ3MuIHRoaXMgcGF0Y2hzZXQgaXMgdG8gZW5hYmxlIHRoaXMgZmVhdHVyZQ0KPiBvbiBh
cm02NC94ODYuDQo+IA0KPiBUaGVyZSBhcmUgc29tZSBkaXNhZHZhbnRhZ2VzIGFib3V0IHRoaXMg
ZmVhdHVyZVsyXSwgb25lIG9mIHRoZSBtYWluDQoNClRoZXJlIGFyZSBzb21lIGRpc2FkdmFudGFn
ZSwgb2ssIHNvIGFyZSB0aGVyZSBhZHZhbnRhZ2VzIGFzIHdlbGwgPw0KDQo+IGNvbmNlcm5zIGlz
IHRoZSBwb3NzaWJsZSBtZW1vcnkgZnJhZ21lbnRhdGlvbi93YXN0ZSBpbiBzb21lIHNjZW5hcmlv
cywNCj4gYWxzbyBhcmNocyBtdXN0IGVuc3VyZSB0aGF0IGFueSBhcmNoIHNwZWNpZmljIHZtYWxs
b2MgYWxsb2NhdGlvbnMgdGhhdA0KPiByZXF1aXJlIFBBR0VfU0laRSBtYXBwaW5ncyhlZywgbW9k
dWxlIGFsbG9jIHdpdGggU1RSSUNUX01PRFVMRV9SV1gpDQo+IHVzZSB0aGUgVk1fTk9fSFVHRV9W
TUFQIGZsYWcgdG8gaW5oaWJpdCBsYXJnZXIgbWFwcGluZ3MuDQo+IA0KPiBCYXNlZCBvbiB0aGUg
YWJvdmUgY29uc2lkZXJhdGlvbnMsIHdlIGFkZCB0aGUgZmlyc3QgcGF0Y2ggaXMgdG8gbGV0DQo+
IHVzZXIgdG8gY29udHJvbCBodWdlIHZtYWxsb2MgbWFwcGluZyBkZWZhdWx0IGJlaGF2aW9yLiAg
TWVhbndoaWxlLA0KPiBhZGQgbmV3IGtlcm5lbCBwYXJhbWV0ZXIgaHVnZXZtYWxsb2M9b24vb2Zm
IHRvIGVuYWJsZS9kaXNhYmxlIHRoaXMNCj4gZmVhdHVyZSBhdCBib290IHRpbWUsIG5vaHVnZXZt
YWxsb2MgcGFyYW1ldGVyIGlzIHN0aWxsIHN1cHBvcnRlZC4NCj4gDQo+IFRoZSBsYXRlciB0d28g
cGF0Y2hlcyB0byBlbmFibGUgdGhpcyBmZWF0dXJlIG9uIGFybTY0L3g4Niwgc2VsZWN0DQo+IEhB
VkVfQVJDSF9IVUdFX1ZNQUxMT0MgYW5kIG1hcmsgVk1fTk9fSFVHRV9WTUFQIGluIGFyY2gncyBt
b2R1bGVfYWxsb2MoKS4NCj4gDQo+IFRoaXMgcGF0Y2hzZXQgYmFzZWQgb24gbmV4dC0yMDIxMTIy
NC4NCj4gDQo+IHYyOg0KPiAtIERlZmF1bHQgeSBmb3IgSFVHRV9WTUFMTE9DX0RFRkFVTFRfRU5B
QkxFRCwgbm90IG9ubHkgc2VsZWN0IGl0IG9uIFBQQw0KPiAtIEZpeCBjb3B5L3R5cGUgZXJyb3IN
Cj4gLSBNYXJrIFZNX05PX0hVR0VfVk1BUCBpbiBtb2R1bGVfYWxsb2MoKSBvbiBhcm02NC94ODYN
Cj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDIxMDMxNzA2MjQw
Mi41MzM5MTktMS1ucGlnZ2luQGdtYWlsLmNvbS8NCj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW1tLzE2MTYwMzY0MjEuYW1qejJlZnVqai5hc3Ryb2lkQGJvYm8ubm9uZS8NCj4g
DQo+IEtlZmVuZyBXYW5nICgzKToNCj4gICAgbW06IHZtYWxsb2M6IExldCB1c2VyIHRvIGNvbnRy
b2wgaHVnZSB2bWFsbG9jIGRlZmF1bHQgYmVoYXZpb3INCj4gICAgYXJtNjQ6IFN1cHBvcnQgaHVn
ZSB2bWFsbG9jIG1hcHBpbmdzDQo+ICAgIHg4NjogU3VwcG9ydCBodWdlIHZtYWxsb2MgbWFwcGlu
Z3MNCj4gDQo+ICAgLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAg
ICB8IDE0ICsrKysrKysrKysrKystDQo+ICAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBhcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDUgKysrLS0NCj4gICBhcmNoL3g4Ni9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIGFyY2gveDg2L2tlcm5lbC9tb2R1
bGUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ICAgbW0vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysrDQo+ICAgbW0vdm1h
bGxvYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysr
KysrKysrLQ0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkNCj4g
