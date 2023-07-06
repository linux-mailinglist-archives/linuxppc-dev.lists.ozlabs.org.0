Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E47494EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 07:14:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UzbgIuVd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxPps2Y0Kz3bsR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:14:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UzbgIuVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxPny5F6Xz30hb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 15:13:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMFVOtHFIm7DLpwdqSEFwdfjVKVzqiAPNB8p3gc27ZAur77k0KnXGHkCm+JBCHRjwgVohKpAM7wGF2k46Pv/JVbtBFZxPpdVvTbdZbKsf/QgLjuwOpiVxWZVCRZ4OCK0vC03V7gjUWgWFhgPqKgD4E43vTDHpjrwi8AsqS7ev952Tos8/XT0wuSyRXT90yt1LSuQdaTnMPDwuF00/PR6O/LqzBBdN7aWlfuEEMyAMLJRzvJX38lHaNpVxKgw7k6rtWb+EjbyBbTT1fl3i8P1Gbai1o0lazAyNG55m/ZZrTJKCkiJdxkzYp0gAXHEBUtsxHORvzW84Z3QRAUghJ+Kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWwY7pAG9MLtfmb+sBB7+i1iGCGrLxjhmoFvvh0IMVQ=;
 b=ScsgJ3M/0YTkg14NQ6J9Ja6XhC2MdbAhhfQfjIqezOR7zTQqM4NN74VceS4zAvPQt4Pkfc4EekqVHmBK+1gT9uxeDWZiMMG5wr5zEHnE2bl4VsABN6tLvLdFyKEfT9O6Sk8/TT+oD8Uwx59h5MJpHCcHIg9KbtICd9NFYnQsXJ1sfazqTCCCKYMtxW/P+3k0nivO/2BcSvR/nHtHEMls0Gst8ukOcDEOTBvZ1S7NP9TfLkPZW0EOHcliMGx6noKIog+rdgXnbu6Yf/67wN85n80oQsU4SLf2reRZHF9OQ5MW2jlHdODoZoSfy1voT3j0rQdO/UQTNQrKLc2jeEqUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWwY7pAG9MLtfmb+sBB7+i1iGCGrLxjhmoFvvh0IMVQ=;
 b=UzbgIuVdxU8jBSklYYQC9iAe+0LjUH+dl3aMoqxigHCTPt6hjBfNqzgqPgegPGHOn3aEQFpalqdBRdkrd4dU38YRWY08YC8R93G9Mionwfw5y01i796CgrPyVK0c8RuujleOSY33Yb7XWj0wc7Qmm83bU7B+WWIBdIcsot0Z8+FrGzxhPQAtfABproTvl6g/iDgVfamCKNgWkXt+wqZTTChzv1nB4+6G0y9gk8A1KdBcz5NMT6RTMgLoEJ53Y2S4zOLmcbZi0J5HRE6oiyN7XMS4Su/BrN9Xa0m0nYEcqkSG8iUOx6kkNDpTWY3QLmmvykLVPa80toVawOO2U/QmQg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2083.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 05:13:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 05:13:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
Thread-Topic: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
Thread-Index: AQHZrtgK5cTbG97WIEibeUwAL5uQ7K+sM4sA
Date: Thu, 6 Jul 2023 05:13:37 +0000
Message-ID: <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
References: <20230705003024.1486757-1-bgray@linux.ibm.com>
In-Reply-To: <20230705003024.1486757-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2083:EE_
x-ms-office365-filtering-correlation-id: fca516e4-dd0d-46db-a0e3-08db7ddfc167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  YCCIyFGE2ra4FpEca8VQqIeYWOrOaKKYvxSa2xaGTdSDhMm1ZDfQxSdD8eYbvlKjwI1gtdRHHptLKi08lqY1PiHNglAK91iyBZ+AuF1PRD/HkyI76yG00E49adKOItK7v6V4lyuoB+ejS8v+IIenpvMbGNBskEBwfpArFinkUN1kuoNY1OVKX1aP2qeyihD0SEgd5F6pYYVo355VbLK01H7Pyctf1U/kAGSdoEn33ZglW8iIVwCFBDh2gwSYUtk8JVWgxrWh4uwfH9/ZJx86QGShDoO9hlBhdhbGhsBlx9w9FjiAlJP7mihUmao/kUX8lAOygiSO8QGY6cxTsP6maKFN5ATwxFffdZuoiA6l75BOszaMZnZMpRtCXqXJT9t3vq0sh7c51yA3XiOm1EqYBOSptdRD6EDswl38dK/EijrrZcTmTCUdI6eI1o6PrxyEmYickVCoRmCS5Fc0gTtu54W/Gj/WBVQz+bjMqtmAadaGtkJRJkl5gY1R6Rj+9XSzojjFQavLVEnphn2LA6pwaUgX9YIWkj4/9+Xc3VDlQKF/Fcjrd/RSIk5uHHT/fDE60bnYq93m8oc30eOBjViivYAtGEXDeTS3RmVE+Rgj5H39cBFdu/KQPy7nQ2FiJDw1QKrc4/uKK26jrvSU7fjfB9VZ+UsqLSFNYfeVhl2YOr0SsYCHzFXbmRbdG2ISBvrP
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(451199021)(44832011)(5660300002)(8676002)(8936002)(41300700001)(316002)(2906002)(83380400001)(31686004)(122000001)(76116006)(6506007)(2616005)(4326008)(91956017)(66476007)(64756008)(66946007)(66446008)(66556008)(38100700002)(86362001)(186003)(6512007)(26005)(110136005)(478600001)(6486002)(31696002)(38070700005)(36756003)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UjRZa21XL3Y2Z3BxWjhaU2FXVHRONG0wYk82bml0YUlhZWxqY2kvRlQ2aFd4?=
 =?utf-8?B?RVZvNUZWa3czTDExWTlqamVGVnRmbE0ybENiMmZ1RXhKMW1IUnQ5c1lLV0lB?=
 =?utf-8?B?MCtONDhmeEtHTnFSZzd5OGh3SG5GUkNLZWtqeVdGUWlmOWI1UE5jTUdmNzJt?=
 =?utf-8?B?eVI0ZFNJQWdVQjRnS2NmLzFod3dLS2ZyVHphRmhVS1U3aWpuUGZURmxZekNV?=
 =?utf-8?B?SkxYTi92UGpTNXpXZmN5ZUc1UXU3S2NCSEVRU3dFNFJ0UkVrQlVOMVR1ekpV?=
 =?utf-8?B?c05qUllDeERWY0h3WUltZ3dGM3VDdjEvZ2wxOGRaWDNBRG5GdUxWWDVYK3o4?=
 =?utf-8?B?SmRqT09BdXhaMUNrelFCUzVHZkpLTXI2VkhNeUZDblVxY1hHYUlvTlY5ZVBF?=
 =?utf-8?B?ekZoVGJWYXR2aGZEK3lDOU8wdlF2VXJvZHFPLzJhOGlTalRQUVk5czFtd3M0?=
 =?utf-8?B?MEJuaEJNWEFmcEF3d05YNWR4L3JUSTRIQ3Z5ZjhPQUM4cnRpbE5PaGo4Nlg4?=
 =?utf-8?B?QWNGdGlwWWYvcjlTZFBKdkIvYWIyRjZDdm1VNVlGR2Z2Y254bHdvaFdrbHBY?=
 =?utf-8?B?d0c5dXZ0ZlEvRUhBd2NCbG56UWl1MTJ2TjQ0eHYxSVdxY2NCbG04Q08xOUxx?=
 =?utf-8?B?ODJvdmg2Yk5uRlU3NnQzWldwWGhhc3FLaGFiTDB1TW44WWwwSEJOaFl4SkxR?=
 =?utf-8?B?VWliQ0FmVytjMFFURGViN2ljZkJpZ2Zra0J5S01seEQzeklka29wWU43akF6?=
 =?utf-8?B?TmI0RFlUNVh3NEZHREpkRkhkSDdJVDZVVG9JTExYUWlTZ3dLQXB6SzIrMGd0?=
 =?utf-8?B?SGRDcmV4KzFHdkgzeEduTU1pVlRKTGszeTdlTkgxTWV6K1daZFMxQ1dLckZY?=
 =?utf-8?B?MWFLUUFrUnNjNjZZZldWMHdvWDV4N3pUZmNhWU94SXFMZWF6MzFLTGpKUFdL?=
 =?utf-8?B?dmVWWTdxRkVMenRvMDdTa2YvTU80cDBqRjZkRkxBeWVldkJIZGJxbmg1NGpM?=
 =?utf-8?B?djJpejVnRi9CSHNhaExtTUFpTzc4R25BQURueEM0UWlXakhCRm5kVTJTdXZl?=
 =?utf-8?B?ZklVV0x6YTM5cWxmcGhnYUhSbk8zY2RNMHdwT01aU2ZUcVJKUDUraTByR3NN?=
 =?utf-8?B?c3A5cFNvT1VvZFg5TnRCSzk1M0VubFdreDBQQ2RmY01jQnpLVzhza1lHLzho?=
 =?utf-8?B?U1ZXenFWTTc2VVppSHRnMWtUbWtNTThRN3ExeFozTFBtSGh6VHh1ZnVta1Mv?=
 =?utf-8?B?MDBSRHZsMFp1cFliT0lIZ3JaZ21sdDEza1JXUk5QRDk5ZVY3UDBIdENDOVFJ?=
 =?utf-8?B?TlFwNytPT0JSdjFlN2h4UW5MVE81V3NtNkYzWDBGbU15ekJ5SjRSZ2JqaE5S?=
 =?utf-8?B?VVFkSGo4S2pxMkFZZDduMDFrNFVwb3g4WlBpRUNoZjBBcTkyaURGZ2l5MG5k?=
 =?utf-8?B?eWlXbWVBOEMrM0NnVGRrZVJTZXUzTFlSVGZhOHlDM0txeWgvUGtna3ZjempK?=
 =?utf-8?B?YjF5M2VFKzJsTWhBMFBIekxxVStNOE1iQm9BY0lQN1VEYmxSQXEwc2RibnNB?=
 =?utf-8?B?OXBTSHJoZ3gwVUVZei96bTJpSVQvdXZsaS9icTVPaWZGM0hmazJ3WHAzeHNF?=
 =?utf-8?B?NGFDQ3M1aUZtd3VWSVExK1JMRHZTRVJvRE9LV0c5OC9XeFF6cVNhSXpIMksw?=
 =?utf-8?B?ZzdJQU1VODFyQlJvZTkvaEh1QkowdHdTNzIya09GMjBQRkxHVnczQ0lNN2g2?=
 =?utf-8?B?bUdJNEVTMmd6cWh2MXZKSVYramNhbFJPQU9Cd1AzV0xkZndHNmkxbzN3OE1G?=
 =?utf-8?B?RW5PaWZacmE3M1V0a3VtdUVaWkU4QlpBcm15M1VpTFRtREFEc095Qi9oL0NP?=
 =?utf-8?B?NXRqazJHbHNDZzhrYU04amgwbVczTEdENVUvY09GMmdyMnh4YjVHMWpraEJE?=
 =?utf-8?B?S29UL2kzMjJPSGIwcmwwcWhGTVYyaXJKZDNYZ2ZUWk56TTdWbnhBUDlPV21Q?=
 =?utf-8?B?NXYxd0NRbmZmTTh3Q0JxNkZMakhRR2J4YVFCaHZJekRDQUcrTVkxZDl2dkZE?=
 =?utf-8?B?VWtaa0NJYnhyVzkyTnJuMWhGWjNPaS82SjVFaWxzMmtIM09jRGtzdXNxb3Y5?=
 =?utf-8?Q?Hrkj4dleBqwElCEuvm33cnvaq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70BDCCE043276642A3E0C2F44F397B99@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fca516e4-dd0d-46db-a0e3-08db7ddfc167
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 05:13:37.8557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TN3gz9s9spsymHVOh4XZZfMQAFyYelPcWFu7mPEXHnCJYszQ90V/xNb0IL67V58mRujuNcqWsn1hcBtUcbEoJTomI19nc1w1azVUBWv7/2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2083
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA3LzIwMjMgw6AgMDI6MzAsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGRyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYyBkcml2ZXIgaGFzIGEgZGlyZWN0IGRlcGVuZGVu
Y3kgb24NCj4gc3RydWN0IHJlZ21hcF9jb25maWcsIHdoaWNoIGlzIGd1YXJkZWQgYmVoaW5kIENP
TkZJR19SRUdNQVAuDQo+IA0KPiBDb21taXQgNzBhNjQwYzBlZmE3ICgicmVnbWFwOiBSRUdNQVBf
S1VOSVQgc2hvdWxkIG5vdCBzZWxlY3QgUkVHTUFQIikNCj4gZXhwb3NlZCB0aGlzIGJ5IGRpc2Fi
bGluZyB0aGUgZGVmYXVsdCBwaWNrIHVubGVzcyBLVU5JVF9BTExfVEVTVFMgaXMNCj4gc2V0LCBj
YXVzaW5nIHRoZSBwcGM2NGJlIGFsbG5vY29uZmlnIGJ1aWxkIHRvIGZhaWwuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL3J0Yy9LY29uZmlnIHwgMSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvS2NvbmZpZyBiL2RyaXZlcnMv
cnRjL0tjb25maWcNCj4gaW5kZXggZmZjYTlhOGJiODc4Li43NDU1ZWJkMTg5ZmUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvcnRjL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ydGMvS2NvbmZpZw0K
PiBAQCAtMjQ2LDYgKzI0Niw3IEBAIGNvbmZpZyBSVENfRFJWX0FTMzcyMg0KPiAgIA0KPiAgIGNv
bmZpZyBSVENfRFJWX0RTMTMwNw0KPiAgIAl0cmlzdGF0ZSAiRGFsbGFzL01heGltIERTMTMwNy8z
Ny8zOC8zOS80MC80MSwgU1QgTTQxVDAwLCBFUFNPTiBSWC04MDI1LCBJU0wxMjA1NyINCj4gKwlz
ZWxlY3QgUkVHTUFQDQoNCkFzIGZhciBhcyBJIGNhbiBzZWUsIFJFR01BUCBkZWZhdWx0cyB0byBZ
IHdoZW4gUkVHTUFQX0kyQyBpcyBzZWxlY3RlZC4NCkNhbiB5b3UgZXhwbGFpbiBtb3JlIGluIGRl
dGFpbHMgd2h5IHlvdSBoYXZlIHRvIHNlbGVjdCBpdCBleHBsaWNpdGVseSA/IA0KSWYgdGhlcmUg
aXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIGxvZ2ljLCB0aGVuIHRoZSBsb2dpYyBzaG91bGQg
YmUgDQpmaXhlZCBpbnN0ZWFkIG9mIGp1c3QgYWRkaW5nIGEgc2VsZWN0aW9uIG9mIFJFR01BUCBm
b3IgdGhhdCBwYXJ0aWN1bGFyIA0KUlRDX0RSVl9EUzEzMDcuIEJlY2F1c2Ugb3RoZXJzIGxpa2Ug
UlRDX0RSVl9BQkI1WkVTMyBvciBSVENfRFJWX0FCRU9aOSANCm1pZ2h0IGhhdmUgdGhlIGV4YWN0
IHNhbWUgcHJvYmxlbS4NCg0KPiAgIAlzZWxlY3QgUkVHTUFQX0kyQw0KPiAgIAlzZWxlY3QgV0FU
Q0hET0dfQ09SRSBpZiBXQVRDSERPRw0KPiAgIAloZWxwDQo=
