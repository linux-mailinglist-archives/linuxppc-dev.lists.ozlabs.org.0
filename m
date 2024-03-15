Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF0C87CA0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:39:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nI38hzkv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwyN41vk8z3dWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 19:39:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nI38hzkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwyMM37TXz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 19:38:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMAFGiRI8yEfeybDrINq34EOHxgSJtusuZ6MAtXv4zy1iE/yzLfZglUhqQc5VOkL6tUiq4E/cCxY7btPRXQPv/hBbobAkmIrg0aVMzIpu0UwL6bnnHNJ4gW2SQzmBWGTOLxAFL/L5C/4fJT6F1o5HwEiy3x1tatVtyyR3hlYCGseyHLv0Au6YK7AgFYTorDfa0IxVcHCgWnwAKLu0DX8jVO3siyB2j/pnYRKoibu0JWs0YeBkUCJavhqzp9O5k2GrJuK1ZpJ7p/ZdXMPCa2RgDAqnCEhCcN144pfE/PSiEkc/B/9dfWmHaQaWJovVZ21fI9LGHrJrT4+UCI3B+nheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgod6TWNxosVMO7ndU55HYmBUhCIdXA6d+Mp+a3cYy4=;
 b=kooMPDDXZtO9EMDgZF6ve0om7yQ09sWjy+Lknt1EF+NLFyE+iUBEcxYa0SZmBJCnLNkBpNiKowwIc1TEUhdBQ7sSURudmG7hQV5nkIwDdLKTItlqrrfuECPG0JgIXeOHGqj3w3t5yLfyysKnoE+KTq1RpM1gNab9PROpw8qf+P0IUso4b7WrMRgt5kwYMTQSQ0fNAsRkV15BsdDWjawSJC9g+68EDz3/w4ih27CEeBxdx+U5cUo38eXK/6zlxEG65nlUo0FyKIvjMdqH5lmhfk7rYS3zpsX01g1C1UqPSKtPcFSLW8C7n6LwQMQ21sMJymTtFVjrSatSe+ZFg+ftEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgod6TWNxosVMO7ndU55HYmBUhCIdXA6d+Mp+a3cYy4=;
 b=nI38hzkv5Cgn/8sbhq/GcFyNEsUAv43o6ofFICezuxJzVtZ68zVsJKX51rM2I1a9GSb1ouj7mFXz2bDZ6r7UcbKtexLsh01yKaISl/iAWuqgJlkM3ZQx4ogKirbXW9Tg2L40WMroAe6cbbPp3Jt8jVkwPez1OaZCKEpkhw5FAKDnw3G7pkO3gP/27jBiXGJtmJNkQAYzmD8aYg9iwDlVlfvrwp1xMYzLemQ3o1cI5Xl1qQfEGBKSolbsQ9W0fNuDd4rH9ZD0eLu1vDl9viYAo6rNBcnCbybt9Ywjq64Ebj2CB332qYn98NiMkDD87CDli9pU5fVmE0sTR+NRVpHEbA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.22; Fri, 15 Mar
 2024 08:38:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 08:38:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 2/2] powerpc/code-patching: Convert to
 open_patch_window()/close_patch_window()
Thread-Topic: [PATCH v1 2/2] powerpc/code-patching: Convert to
 open_patch_window()/close_patch_window()
Thread-Index: AQHadoUYgu3+KipSKkqQtIgPs6qhz7E4eysA
Date: Fri, 15 Mar 2024 08:38:09 +0000
Message-ID: <510d986a-ce2b-47dc-bf5e-7ba2e72ecf5a@csgroup.eu>
References: <20240315025937.407590-1-bgray@linux.ibm.com>
 <20240315025937.407590-2-bgray@linux.ibm.com>
In-Reply-To: <20240315025937.407590-2-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3174:EE_
x-ms-office365-filtering-correlation-id: 45fc4021-9872-41eb-d427-08dc44cb3e20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n+els9bL2sCbJ9h/Swd29obBmr01z5rCgmtf5cdUgDXoMNvi6qZMS9XW10HpwdSuYrW9zbsWN9Q40jbfSFQ0v/ZJUQd7sOOFHQekN981CEX+YnEMbYsLmzCGZ+hoXFOs7uMhR2L4mUJpmtv6dXRRTCnX+Sb/KOP7JC9+Vw5gDhsKve5QrBIb5shvygqPpYmF9YmnqpqpYBd/hHl6q6cxPO0XO0cVjtO9wJLel9nkJlIZTtX4W6H4mfFIZxWORJQF+gbBCjc+rBBAeB/d43ZqhI5V6kM4EytxihmCupkv/k4yk+4kGSXQNL48JdAtqs72Y+zMQHLMzcqxUqF+i08fgXAwqZf7hQbbnt9aATSmrbaNUUHA4FQFJT2BVZDzjlahFx0g6KFXIKJuta3j0+4O5sx2GtXArw8KRZdlTo37ApBiFphNGeGLrbjGQ++5Ahc8wiXd20goeQ6PABOhng4vyTf/+YkFK7Upd3rpGpRbnmUgOWKRyzwHBHJCaF94FaZvIotwqjDKnlUKdp334wD6EMUjF2N67Ai/dh5RdfsCMsUQ1folTZAl0pdZ3F9o6v7fXRlqqmBZeaA69pPj1Au4bT8GTRjjR/cd1pqeo4p8964GsfHsNOP/nYFNxhAus5or148k8csLht9uEUiMeVT0qdSjJ9TXhE1IOGTBeBSanY1HEd8ypb1+mj0bcFYfP/ZQzjYjCg5QK0TayIGXQrx970W1LLFBe8EG7ePGaQIG4mE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RHZEUkZ0R0RSL1U0T3RmNnQwb1MyOW5oSW80elNuWENFcWZ1QmRoRzg2VG9M?=
 =?utf-8?B?dks0OGI4M2dWUlUxM2k4dWRvN3BEWFlReVpRWUcwekVLVEtpZSt0bzJ2Qnlw?=
 =?utf-8?B?ZmFsNHIySXVkRDhDQ0VoeGJFMWwvSFltWEt6TjN6bW9vaDYzMDR6L1dodzVq?=
 =?utf-8?B?MzF3aVlBeEJuSFRDRjJQS0EvNG1rQW5NYzFqZDRFVXBVNHdma0xnamNuSEFH?=
 =?utf-8?B?Rlhvejl6a25CR0I0R3Q4bzlnV25wM2VYaG9xUi81STRZYlA5T0wzYU5lU3dE?=
 =?utf-8?B?SStuRXg5bHZzd1J6MTJHbnlONGtPNVlSRVptSmtJazRMcitRbkFXK2N6RTdj?=
 =?utf-8?B?YWJRTXJSbVNrTlFudW1RQUVMeUpnejZkdlpnRkdCQ1Vvenp5eGFSelE3bjly?=
 =?utf-8?B?MEticG1EcWUxYjhmRC9VMWFpK092aVFQVWtTcWJ2TGovTEJTSUdPNFl5ZVNW?=
 =?utf-8?B?QXZUZDFOT1M0R2tFbnRDcEM2b2xoNjdybGx4b0NYWDBmNm5FMVJoNHFoQUpx?=
 =?utf-8?B?QjFDUDdMVVpOeGZKZEpyWFBVWWpKQVlaWjZkREN5MS93bTAzK0diWE96WXVK?=
 =?utf-8?B?YlYzcWEwT2JmMDRIaFhyTkJCWlgxSHkyTXNnYnpRRG1oTTkvMnAwbk1vb1Bn?=
 =?utf-8?B?QUlGekhTdWt3a3BWbStXQ0w2eGpyYVg2T1hHeTBlU3ZsQVZ2R3lMSlFrbGMw?=
 =?utf-8?B?YmVWaW5hVzRNaXMwaUlrVEJXY2MvWkppVVdid3ZyTEpNREhtVUEwVVN2bUhP?=
 =?utf-8?B?Q0hEOXRSdjJlU3JGN3ZjL3hlaWdCVENxSll5U1NvQll3VzRmN3RGRjdkRmVi?=
 =?utf-8?B?S3dpVk90NXdrNm4ycEhSRDNIUUJMUjNSNTJJV0FSS2Z1Wjd3aUtlSHRwcmd6?=
 =?utf-8?B?UGxzd3owdU9SY0gyVFRSRitvaVdSd1JUY2dpR1FWYkNkT0dyRWt3a0RMOGpy?=
 =?utf-8?B?ZWoreUttV1Bzc2FuWENobmNpdUZhWXZubzMwa1kvZ2FQME5sTTVxa3o5NDRq?=
 =?utf-8?B?YnFjSTNBVHA5b0VWajg1cFc5Z3RGbGlCaURweXphRGY1NGoyWTZUTlEyT1pu?=
 =?utf-8?B?Yi9wY2xlY3MzQjVXSHZHcVhncTlIYjlkRFQ1V3ZVYkJkT1NNeVp6TTRBUzMw?=
 =?utf-8?B?SWpIaVVwTXZWZy84Mk5Od0JGYndiYzFTMTVrUXUyL3ExMXNoODd0NStJc25D?=
 =?utf-8?B?TktHMFRyVllqWXlZK2lWbU5nbnp5OWdBNFFvdERkTHZtcmVZR0drd2pucllo?=
 =?utf-8?B?TW9HenZJRkp1cFVoa0RmNUI2czcrcHZDZkFXT3pFMk90UnlmM0ZSQnlWN0p1?=
 =?utf-8?B?SmpzVVk0eFVOWG1FMHZ3TVkzcGhQK2U0Sk10dlNDSjNOdmN6RGZ0VHUwQzJh?=
 =?utf-8?B?M3ZyZ00rQ2RPcDBjbEZTUDMraTE1cEFWZlpFa3lTNjdROFg3azAyL2ZOU0xC?=
 =?utf-8?B?cks1TkhPeUUwcjZkRzFGcjNaL0Jmb2p0QkV0TFlmd1habTFoR3ZyTVpWVUw1?=
 =?utf-8?B?Wlg1MnB4eWVJeTc3NDlxdDFMSUVnZGlISWIxcmpuMHZEb041eTZaN1J1UG1C?=
 =?utf-8?B?S0RERENYbDRWSTZmWHdJUEFrTnhQV1hHbzM5WWVwL09DZVdXMU1jSnl1SGFM?=
 =?utf-8?B?ZlJSbzZ2Y2VibVl0QjdQQzZMVFFidE16akxFY1dmL0lZN2IrYU5GTTVacU5T?=
 =?utf-8?B?VklhWHhtWDIyWlZIc0cweVNxWEpMVDdZTEN1bEJLdUNDTTdzY3lMQjZOSUZi?=
 =?utf-8?B?T1RpU0tIY0ZtUmU1KzJpUWRQRk1WRFNJZ2pMUWJHcjErQVlEbGV6ZVlGcE1l?=
 =?utf-8?B?Z3V5VjRkREhYb2NQQmVBeHZ0cTVCOTBZVWgwcmMzOHhvaWVJM1pvTlA5V3Rs?=
 =?utf-8?B?dXFhTTFSQmpQRXF5a1lSOWliUmFid2dhRmk0eUVaYThYdzdVRnZmanlUaWE1?=
 =?utf-8?B?aURVQ2doWXBSN1loRnZ4Rzl6bURkSmlqSmpGNmhQNEYxcmd1OEw0Vjd0UnpP?=
 =?utf-8?B?ODI3cjYyZ0ZYVFlaak5Oa1lsRFdIZXB2b2Vadlk4QVp5T2RETmE4cXQzc3F0?=
 =?utf-8?B?QjJ4eU1UYklUR3FLYkVYYWI3amt0MDlvdG9xTm5rRG9wcmpHUlhuaWQ2QTBj?=
 =?utf-8?B?TWtiZXFjQVVEUDdEYUR4VFVhbEtaNTQwUzBrdjJsOGVHM21OaUNlc1pIeGhV?=
 =?utf-8?B?Y2ZlUzIvTGMvMTVQRGdVZ0xKTkZaenpKbWl4SWU1Q2lkTDhzb3Uyc1FKYlow?=
 =?utf-8?B?R2RRWDhrU1lyREcyZVZtdTRZWDd3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <486CE34238CA234A98BA89AF9125ED03@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fc4021-9872-41eb-d427-08dc44cb3e20
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 08:38:09.0957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xnnAEIUjmGtM3hobiaKq0zh3emsvK5l+3S52y6dOW0fJUQu22x99WJBBT0fvO7n/hkp6o+V7+ToMpZ8h3w2WpYJm0gqI9IxuSq4gBhfeSn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3174
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAzLzIwMjQgw6AgMDM6NTksIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGV4aXN0aW5nIHBhdGNoaW5nIGFsaWFzIHBhZ2Ugc2V0dXAgYW5kIHRlYXJkb3duIHNlY3Rp
b25zIGNhbiBiZQ0KPiBzaW1wbGlmaWVkIHRvIG1ha2UgdXNlIG9mIHRoZSBuZXcgb3Blbl9wYXRj
aF93aW5kb3coKSBhYnN0cmFjdGlvbi4NCj4gDQo+IFRoaXMgZWxpbWluYXRlcyB0aGUgX21tIHZh
cmlhbnRzIG9mIHRoZSBoZWxwZXJzLCBjb25zdW1lcnMgbm8gbG9uZ2VyDQo+IG5lZWQgdG8gY2hl
Y2sgbW1fcGF0Y2hfZW5hYmxlZCgpLCBhbmQgY29uc3VtZXJzIG5vIGxvbmdlciBuZWVkIHRvIHdv
cnJ5DQo+IGFib3V0IHN5bmNocm9uaXphdGlvbiBhbmQgZmx1c2hpbmcgYmV5b25kIHRoZSBjaGFu
Z2VzIHRoZXkgbWFrZSBpbiB0aGUNCj4gcGF0Y2hpbmcgd2luZG93Lg0KDQpXaXRoIHRoaXMgcGF0
Y2gsIHRoZSB0aW1lIG5lZWRlZCB0byBhY3RpdmF0ZSBvciBkZS1hY3RpdmF0ZSBmdW5jdGlvbiAN
CnRyYWNlciBpcyBhcHByb3ggMTAlIGxvbmdlciBvbiBwb3dlcnBjIDh4eC4NCg0KQ2hyaXN0b3Bo
ZQ0K
