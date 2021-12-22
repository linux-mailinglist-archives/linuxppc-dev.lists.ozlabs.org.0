Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D447D2F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 14:17:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJv4D2Fr1z3bht
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 00:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61b;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJv3f3t0cz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 00:16:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1vFnHpHkkjDsNn6S1t2AymzgXcosN9fTjGKOkw0sn4NiTDKMy5PgtWj74BV5hrQzHlE9zmBJnllY7J8K/SQDf7Z1bQLLvPgp3A9+pUszi6ucJStoqL+fjLGVkRHElLp/v43KBPnXkhmucHUMAC3oPEYgLlaJSoMO8h5Z4cqVAT70CJTj0g2BZUywOVpxqdipyomkBRGZH5i0Ba/76vHIViOtXOXge8zddH5AWlA8IO0w4VgRO+nEh1Drekvq6qinWSw0mfzhpWzOD9ogdno/iC07+5iKW80+aedAq4jRbWwO1TtOFYxGEFhakz17T5n8Wxh8yniTnlm5pDHdz4i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoHP1BqvP93q7d+Ot5Rw6w9QT2uX7CuQ+GWU3yQCdY8=;
 b=W1J9Tna6Q/TT28VLilXw1tHxmhn9hMuv8tGL2MvKlsnykoT2FqGoQQ35SwJjU1jF1KgawhvAIHSX+k3JSw+2d0oh/GfMz15881RBMmI4JMRgvF+cJwnLuBol5gBd/oamjl8izNV6+zozq/x5ejuD0L3Fae5rkZYaViaMUNVi3cKY0KLrg05iJVRZ0UBOjwm6TYUlWRh9M4ki6IZkcEt+3PWg0PhHbe1Q1NbveQnGZWXtAUPyrmFchuojxAyVSDHBaSbePsmadHOGRl7GXGhPFAWFFdF31C8U8vNeBFnQg8hZolrAY48WZDxErldbkAw2GH2yoOmVfwk4I+6G/dPBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 13:16:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.018; Wed, 22 Dec 2021
 13:16:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 06/11] powerpc/code-patching: Fix patch_branch() return
 on out-of-range failure
Thread-Topic: [PATCH v1 06/11] powerpc/code-patching: Fix patch_branch()
 return on out-of-range failure
Thread-Index: AQHX53Q7dAArItqC7kaUUigNLmTl0Kw+nT2A
Date: Wed, 22 Dec 2021 13:16:06 +0000
Message-ID: <f08d7495-0e6d-f66e-9cc1-1ef0906d050d@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
 <8540cb64b1f06710eaf41e3835c7ba3e21fa2b05.1638446239.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8540cb64b1f06710eaf41e3835c7ba3e21fa2b05.1638446239.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00b05e9e-b7a8-48b4-dd72-08d9c54d3658
x-ms-traffictypediagnostic: MR2P264MB0196:EE_
x-microsoft-antispam-prvs: <MR2P264MB0196BA15C29D2A40D4795D85ED7D9@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hfa5e0YFgtswIR8pPh7/H6MpvYalM3EDBoyFI+Yzd+2HMMC+matVlDQCJQFdEGgjM6/61FnTvLtHgdremxZjttqIUtWaIye1p4TylmZ1KfKQDVVYXt1AnM+kdR4huETsSFD7NdYUFOtKD0Jbdoody6b7N+OFPI/cQ/tFIuENwPdH/x+oWLYHD83hRMmBWa0C3/AZe03g7ZpZuwBAdW4CkqYCQTa6XHryG2YOumeCjQCPmYEMsADQKXL7jqTCmb9lWSBjqBqqki+79B7iuIxunlT9o09Gn+WOgKF1TB5L1sfpL5Iv9thtLtI6rOEGdDSJw9vvHCmPEvMzw6KqlH2vNsuIdiCzHuQKXEy+E6S/dfzLHGo9iI6o5dCnYuDQHq+FYqkQOVLB+MBcvJy3IQCaW10df+fclpGfekHYoEyj2Qyo7pNdNHY9uQ8OxgAXL9rtty1TdU6yQlHLeKBAgTLawXd5v1JXzP0vcbnrEsSQI4DlV0E6A30A3ZooO1C+12zAgzvvX8vtKZr1xpKPF0zWZ1Rn8PmzSjqmit7rJeBk+foFS1IEPS8wMqwuprNfmWKgmTKMaHuGbNi//4J7CuiltkTg9TmhnEERH72lZT0jVAzi5W4qSquWoBBZRazb2tom3hTK11n3Oxwp4tFS5FuUJhBNA8fnrfv89TdtH55I+sQoArdX+XkjSIdTfd3UnyIwzmo5hOmL5/Jy92IReqF9HySObE4OSbbyPcSP7ceZrpx8K8z+EMUHnILQ3tcxMr0ZoIVfMFcb9hJtW7KAgbYzw1o+VbcEbD7K/2ifZT4YJiUihQDYOpwBQDdde4C/o/BHa1Wg2f+/QvX05cF4QtcyFk9UeDHJ7bFOzAbbhcswf3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(38100700002)(6506007)(122000001)(2616005)(66574015)(2906002)(316002)(4744005)(86362001)(8936002)(966005)(44832011)(38070700005)(83380400001)(71200400001)(5660300002)(31696002)(186003)(36756003)(110136005)(54906003)(6486002)(508600001)(8676002)(4326008)(66446008)(26005)(6512007)(66476007)(66946007)(76116006)(91956017)(66556008)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlA3ai9SWTdYR25Uajh4OFNqNVloZ0YyalhpUGZmRVBrYVVBR0oyQUM1N1lI?=
 =?utf-8?B?a0kwZlIxOGtXbmJwQnErdkdQS2pBMm95dVBKK1F0aTJUek8zKzVURGMzakdr?=
 =?utf-8?B?aXZBNEFWZXlMbVAyeTh3NXV2ZVJndTVJTDJSSWk1VkZGc0p5UUxBUVFYSk9r?=
 =?utf-8?B?aXR5dnl5Qi84ZEcvOENiblBDMmhDN3hSd3dIdWp4Y2RMMUhoNnRUaVVEQ3o5?=
 =?utf-8?B?a3o5MzNLM0RNUjY0MkJPWjc2VXVIdG9QaFR6K2VOZzYzMUs4NzVQMzRwUUk0?=
 =?utf-8?B?VDFBam5nNFRaZDJOdG4rYXh2dktzNTlmV2pnR3cvSmJCY25BZzJVby96WVhG?=
 =?utf-8?B?RVdoaSs1NFJCeGU4cTFFOCswcHk3OTkrZkFtcnZReEJUcnRRMTRGTFNxNVZT?=
 =?utf-8?B?VkpoMTJLMWNZNy9TcTJSS2lvNkpVSUVKQkVMU2h1QnVFbjZadjBaRlFaSHlB?=
 =?utf-8?B?eTQwY1oxdFFKSWxRTXpOVWRlS2ZkM3d6d3I1cExuaXFWK09vNGRlblZJTEJn?=
 =?utf-8?B?d0hrM3FrYUhTeVFkdnZPcDgzdnlPaCtaK0NNKzlJb3BFTitNYVY1ditzMWZq?=
 =?utf-8?B?VU4vT2NjOWVWZW4xQjVyWGo2R3JsQ3pnbUlGR1NFU2xNb0p5dGNtalN2RS8y?=
 =?utf-8?B?VnhPRTVQQnBnbC9UMHJwSHR4ZDVLVk9aQ2hBemFXU1kwelQwcFdyWkowQ25E?=
 =?utf-8?B?TzBMcjlLaDA3VS9NNUhSaEc2R0JyOWZuQ01rcm8vRlZNRnpHeUtoWW9waG5H?=
 =?utf-8?B?MU5SRnBHUTNqdjNqYURFak1nOFA1bXF6NFY1ZWNiK0JBdXh0RFBnanV6MTk0?=
 =?utf-8?B?OHBzRXI0VEFJMTgwL3ViMnRTS254LzlzY0ZnWXFLT0RzYlZoand4U0FUYzI2?=
 =?utf-8?B?T0pnWnNyeGhXT0ZqZ0RUMWJuYVlrVVJHMmh0WFg1eVlGb1JVT293M2lLLzJN?=
 =?utf-8?B?L2h1T0ZSUlJNRjlBTGU4ZjVXMk15Wi9pOXFmZVp4V2FCTlo2ZHpUNFZ1OUxT?=
 =?utf-8?B?RjBpbE11OGZFNnRKcFkzc3ZPVDNwSUhvc0w4YUpFMjM3V1c1Q3d4c09aZGpr?=
 =?utf-8?B?ZUczR203bE0yN2Iwb0xKZFN5QW9McHNUQXNwVUlEakptcnZmQVJPL2lyQjNS?=
 =?utf-8?B?SW03aHhWTGNtMFZ5RVRLUWF0OEhweEZYSWUwcjlZSDJHdWJ3Q09yOVdsWkVv?=
 =?utf-8?B?WlcvVFcrbTRSd1h4SjZjS0pGak5tUXBRbmh4VGJla3JYaEJDSEF0NWRnMncy?=
 =?utf-8?B?MjJlVkp6VXhyRWhrYlcyQTQ4YjdlMGd1czR6VnFCaDhLUDFuU0JjbS9SbXZ5?=
 =?utf-8?B?Q2lZQm9RL3hybWptUlZXL09hbE0wVUdPQVVBVFpGSHg3enhwRXVyK0t2Mkgx?=
 =?utf-8?B?ekF3SkR2MWpJdHBqVS96WTlqU1NHTlNhbXkxQ0YvL3poajhWUTJad0xEdFpv?=
 =?utf-8?B?MU85akJIS1RBeko2aWNvK2FhM1JZWGhWRXhsRFIrQWhuemVZZXpBVUUzcmNv?=
 =?utf-8?B?WEZ1ZHdnZC9ONmJBL042VWswUW1WeERlV2JFTFFoM25kaFJ1U2VTUmFKWndj?=
 =?utf-8?B?QldMbTdOMFJqbTdHUzF6bkFDUWlPYlljRmZQNGpiYy9CMSswLytBaWxVbGtJ?=
 =?utf-8?B?Q2xjb0hYeElmUVJJU202d3pDVDNzZ1p2MFFLRW9UYm9CM255NEE4eUJ1ZnlJ?=
 =?utf-8?B?YzYzdVJ3dUN0SWJvbFA3bXpyQkluYVlSdnZTaE1XUDVHRmszQ2RJd3prN2FH?=
 =?utf-8?B?bDNBalJaRHZGbHdub2JVMHkwVGhVK0ttL2pqMWlmS0xVSUJINzgzVEVKTzlt?=
 =?utf-8?B?ckpRd1ZqNFVXOUQrNUk1KzQ5L21ZdTNFN0FsaDNTQ1FBbnp0Q3JRZldITHFs?=
 =?utf-8?B?WkVrZmJhc3ZLVXFQNnhrYkVjQzcwdzI3eFlLcW5WdUJ5cGoveEo3VnFuY3ZL?=
 =?utf-8?B?Qy9xS3lzR0FwSVdNTXErYTluc0RUOCtEL1J1ZjRCSVdDUkNnMGZzdkp2ZG0z?=
 =?utf-8?B?MDFtTnF6YUU1WXlIODd2OXlZMVo4YjJBeGxGUU5KT0dUWEZrTHBITGVUTDFr?=
 =?utf-8?B?amVHdGRzZ3RyWEJKbWpub0xKWW44a3RCTXhDbkpKQWtWMXdxMmM3bitkMTlr?=
 =?utf-8?B?aFJmZGxHaXZ4YUJXa3JNaThRZGovNExUb0VyMTBqOEVXV2NwMlVRZEVjTkFp?=
 =?utf-8?B?K1NpYW00c25MZDNLY1dHQ0JKZWVMc29aNStIUXdIdlh0TTVGK2NtWnpOVGU0?=
 =?utf-8?Q?rVOJLgpWC340VZLa2dhTeZDhy12yceuvXKLkNkTjfA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <402666B5709DCE40ADA86AA46BB16B7A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b05e9e-b7a8-48b4-dd72-08d9c54d3658
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 13:16:06.3488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRzfkznVVDfuhC0lNFKdGrPA7ccQTh/9Bmrl2GITNXaK+MNxpCp1SfKc+wWpgiFKr5BBphWBEmGOXGXJAXtOvkvWS0ylNpx7y2/yt8NPk0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0196
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

DQoNCkxlIDAyLzEyLzIwMjEgw6AgMTM6MDAsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gRG8gbm90IHNpbGVudGVseSBpZ25vcmUgYSBmYWlsdXJlIG9mIGNyZWF0ZV9icmFuY2goKSBp
bg0KPiBwYXRjaF9icmFuY2goKS4gUmV0dXJuIC1FUkFOR0UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCiBGcm9t
IA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRj
aC80OTQwYjAzZGUyMjBkMWRmZTJjNmI0N2E0MWU2MDkyNTQ5N2NlMTI1LjE2MzA2NTczMzEuZ2l0
LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCg0KUmV2aWV3ZWQtYnk6IE5hdmVlbiBOLiBS
YW8gPG5hdmVlbi5uLnJhb0BsaW51eC52bmV0LmlibS5jb20+DQoNCj4gLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgfCA0ICsrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hp
bmcuYw0KPiBpbmRleCBhNDNjYTIyMzEzZWUuLmU3YTJhNDFhZThlYiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2xp
Yi9jb2RlLXBhdGNoaW5nLmMNCj4gQEAgLTE5MSw3ICsxOTEsOSBAQCBpbnQgcGF0Y2hfYnJhbmNo
KHUzMiAqYWRkciwgdW5zaWduZWQgbG9uZyB0YXJnZXQsIGludCBmbGFncykNCj4gICB7DQo+ICAg
CXBwY19pbnN0X3QgaW5zdHI7DQo+ICAgDQo+IC0JY3JlYXRlX2JyYW5jaCgmaW5zdHIsIGFkZHIs
IHRhcmdldCwgZmxhZ3MpOw0KPiArCWlmIChjcmVhdGVfYnJhbmNoKCZpbnN0ciwgYWRkciwgdGFy
Z2V0LCBmbGFncykpDQo+ICsJCXJldHVybiAtRVJBTkdFOw0KPiArDQo+ICAgCXJldHVybiBwYXRj
aF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0cik7DQo+ICAgfQ0KPiAgIA0KPiA=
