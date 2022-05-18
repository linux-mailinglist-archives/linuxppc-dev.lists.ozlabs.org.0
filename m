Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD8352B671
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 11:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L37LB1FTFz3cGF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 19:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37Kh0vp3z3bdP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 19:41:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPZbV6VnGugSWHMDpC+oPxCPC5LQGQXhx0007E/n9PN87hjXLG7WHP2p9Z8X3mhFS3AfNHOIDWwvOo7fB+CpFE7hsjlj1ky8Oe1fH/UYogKa0LJQ/ejdqDgDSThRVuBz4PaqR0if4jtYj71dic70m2DAK8iws3l/i4lxzTVZxjEBVozmzJFBwhpaK7Bf/OCbQA4dui+vFn0Po/IqzXrprusxpb9JlRuGKBj3X+rCkOAnfbaqfFQDnw7eTbf7VUz4vxDsq9lefw/2P1gmhkS056snudr6lzr0DroG1kgOVuFGgxvYH/1ARs/zisyPxJnDhvG8iw5fR2pH7XQgPrGrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nGigPjmqHrzdJyiLYLTumic6Vy3nJTQJdoR16sIHm4=;
 b=ZOgxqiKjMMjJUaecywaRuZRWN+lFFY6g4dxWMTAsmQDirFN6Uf3EbpRWAuvL2GqWslI8eCGxg96pnjvHMDdpJ6bM8lnl3Cu8m6Lva2nWL/eefo3ZxGlddnXVSepuMjpt6Xx7HJYriP/sitUDJcG5U2t7DNvCWZPL3c7P8j37fMrcrgkI9X0N0y9QjRhQo7Yx1diLIUOtemrNe/dBFyAZgK3+SCSBQ2sGt1JB4uNQ2dXXRkh37zE1YZdpd0X1/f8KlmYCbdvVNyD9I3pOa4JuEf29aYwvhzwslDxM2itjonoX8ZqiisMCo1xqeyUH1Fn+34x6UokbuRSnLBiZU5BiKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1427.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 09:41:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 09:41:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
Thread-Topic: [PATCH 1/2] powerpc: Add generic PAGE_SIZE config symbols
Thread-Index: AQHYYH7uKAhvQ4voMUuG99eSqREKbK0kdcgA
Date: Wed, 18 May 2022 09:41:02 +0000
Message-ID: <c6cbd41c-4cef-d4d7-324a-b4c3e2498262@csgroup.eu>
References: <20220505125123.2088143-1-mpe@ellerman.id.au>
In-Reply-To: <20220505125123.2088143-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a7464a8-ec5c-40b2-93c0-08da38b285e3
x-ms-traffictypediagnostic: MR1P264MB1427:EE_
x-microsoft-antispam-prvs: <MR1P264MB1427CDD86A80AC1299386B0BEDD19@MR1P264MB1427.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BpOoehP7SWw4hn/7qxzmYdd8XnYIlV8h9Bv+i1b18VGvcJDvAaaXxhbVXoLtTB8A9yS59zoiGvEyK4ClS8vy3tFcPQ+nmijuLJAbZDihrKrJEaLfbjNnIKoWVdwNyQVwWmnUV+jvzs+AY4GSTNjtb+AIpNO1AGHhWlK7WgSFAwOej+undMG0wzBq+paWEGYLK2nO2zDxwp7wUcHrd40RPF90SG6QovLQBBN4ZLSpa0tmSnOPcPaUPr0Ck383zhdXH2lszkl+RndZdgPDImGFljy+ATv09IPF8r4NkGFql7uX7H9N5hRotVTOCO8iaFceMKOanm/oIp/W3OU3gHRmO/eVuAqZYjyea/7jZWP43N0F8yC5mQlBY/H/SQSJaFNsyq8bRq6+3BoeP45I3Wj5n5/KAP+62Gj2RasPfGTT3ckemApKqpnytLf3BXoAmDdzWbPunJiF/Rz+pdgTWwW08JOt9krp+A5W6DQfddb/ezCpSfjFN6772qCgiNGLiU4NQ/1nLB0dmCEKBE4qM3EPvoE+ayTnAZvw8CPtpqO172QdU9Gfss2/uPzcqR+CAMRLCQpVenjtPzDZZmMdYqINyQTI+WtkDfrxbCVQK9N/Z+DkGbAMHbZ/gC85+2i7Xdg8f2MsYaLFGStQQD/wnTYtfxAV+gmBsg1owIL0lGhphfjx9GoFfSnomC5QW4iIWqRq4wDOZtuAMMtnPozSnD58EFh25avc0RqXdtAvE7yLuLqKJAMzXASkVBS4Wyc1po2UO1oFClFPAOSGrQmfxB6MdZFYKF/H+TWuCQR+nDiKZ9g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(86362001)(31696002)(26005)(8936002)(38070700005)(110136005)(6506007)(38100700002)(5660300002)(71200400001)(6486002)(44832011)(316002)(4326008)(2616005)(122000001)(66946007)(66476007)(64756008)(66556008)(76116006)(66446008)(91956017)(36756003)(8676002)(508600001)(6512007)(31686004)(2906002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTZRekJuTlE5bHBQTytzK3l2eWlWMUNMbGo3dWJ3YnVHRFExYzVCNTdsdW9Z?=
 =?utf-8?B?bUNqM1lqZ0RCZHh0bUZ1eG9md2RFaUtzVTkydlhNSGZ6VDBKdVh1d2JWYkdt?=
 =?utf-8?B?eUNwTVZ5dFgwcmhQcyttNW5zaksxbXFndXFPcXk4RklUN1BSMU5sQmI2NWZw?=
 =?utf-8?B?N3gwMzhXR0xEOGhmeHdqUU1sRmNLVUlJV1B1Yko1dU16VnNIeWZwSm8yLzNM?=
 =?utf-8?B?OEVkdURqZEprelBFdUNwT0lYdmtCT3d2Skt1bUVHb29YSkZ0UDg2bTlnUmg3?=
 =?utf-8?B?ekRWU21scS9BdTFZeW1HZSs3SWxUbjBVcmVmTllGbVBEYW9qNlF6UHBUeFI4?=
 =?utf-8?B?SERMT2FCOUNXWnFNZVdhdkQxTGRpSGpaNFRubERvSHdIYmw1enBDekw0WHUr?=
 =?utf-8?B?aWtTRFVaRHY0VW1MdjdtZzFFQWdjT0xyT3VwSG0wK1psdUFOQTR3aXd0WDZD?=
 =?utf-8?B?R3ZqZ0NYSk1IUEVpMUxaTDFXQWNnMEhNNWtndkVSSjU3ZE1ITTZlRktHTkRO?=
 =?utf-8?B?dWZZVnpVWTJxQ1FrdllMNm1zeHY4SE5sSlRjYXlreXVWOGw1THAydlFJTVhO?=
 =?utf-8?B?dEtuUFczbWFRYmVDNW9OUkhkbEZFdXdobWd0aGk4OTVyOXlTUzB5RjJoSEwx?=
 =?utf-8?B?cG9SZ3QzTGpncEZXbDlKSWRPc2pVbCtBclFSNmxDNTBwQ3dwYTEyS0FuSlYy?=
 =?utf-8?B?aFJIOFR4OGk3UWpoZFNlZXhQR1F5OGtNNDEydWM4a3FVbW5wQURhdEYzWEpY?=
 =?utf-8?B?MTZkSmdURG13L0h5M3hwSnFwS2E0N1dSMEU4emIzVkJBeHhaTEcxOFlzN3Fr?=
 =?utf-8?B?OG5lRk5yMEJkV2JJbmFpOGtrRXBacVp2S2lCV2FTMk5lTkxJbWZTd2svNm5T?=
 =?utf-8?B?NnZSYXJxbXlzcEFaQzQwbEZQZU4rVnBIMngrOVFFUlN0RlZVTkprUlRVcFJl?=
 =?utf-8?B?Z3hYSnVSTkdYanhuU28vNDd0ZzhXZDR6OCtENlFueEF5VEhhUTduSHBJSUo2?=
 =?utf-8?B?eklGSlBrcjl0UGVRQU5YZnoybmRVaFJXNnJaZ0szQUcyUzRxSDRnWjlQQ3l5?=
 =?utf-8?B?bnh5d3RMQTE4eUZDMWNveExCa3lEYnlNWXdNcUFPYXJ6UFF2d2RJelhWRFNq?=
 =?utf-8?B?SFZtTlJLNFI4SlNFZGhqWmtXY2lyVnBpS1JIZjJzTTFHa1lVcVVsWkRFRkpu?=
 =?utf-8?B?OGthVlpjUi9TaE9keS9aUDRDa1BjVWErMjVaWEhUYnZOckhQcXVaQTlreTV4?=
 =?utf-8?B?REl4THcvaU5HaVUzMzRiZDhJMEZQZlBnVnpPeU9jS1R1OGpWTU1rQmdFY2ZY?=
 =?utf-8?B?OVR1WFBDZlg4RGt6bjZVcmh5RHpyYXhUQXNraXdYS1lPa0JuV2o2Z3hsdmpY?=
 =?utf-8?B?UjJyUTI2aU9TUXR1aTVHOGw4SWczVUFaT3EzempQL0U0WnZJRmxUd1lMdDR0?=
 =?utf-8?B?SjlSZy9hYlZlRDY3SGxpeTEyMEtVUUxNYTExZ2hHK3pIL3RYcWNTczFZUzU1?=
 =?utf-8?B?L2NKTkNIMHFkR0tsb3VNYkR2VFFhdkdwMFY3NjBCSENHWFRmTHdmYzM2RVdJ?=
 =?utf-8?B?eHptUVZuazFsTFZVQmZZd3VqZEh0M1dNeWwycEdHNC9iVEhsNWh6TzBHZVdh?=
 =?utf-8?B?TTU3d241dWNiVkxjM25zbHVwVDJFbUVObW1nQmVPcHRQcUd5dllhczMvMWZX?=
 =?utf-8?B?ejMxa3IralNGVlRJL3d2a0lhenlLbDk4aUFCM2lHTnhvdFF4cU15d3pxNkFV?=
 =?utf-8?B?Mm5MWG9odTVGTDRMbGFZaTBuSUVFcGZaZXJxRVdzNmlkOXBwTmRCMnowSG9J?=
 =?utf-8?B?bUpUakxjYnRLeDM5V1ZjcHZRMW1ITXpXQkVQNE5JRVFhSUg2STVRTVRVcXdN?=
 =?utf-8?B?YVdpakZVdTg3ejVxK09ad3NIRmE3eFpFN2lzT2szdnlDemxVaXRFUC84d1Jh?=
 =?utf-8?B?dkJCMHJHbldSVVlQL1BiMTdRejF3NGtqbVZGeWY3VEZERDdjY1IybTBjM0RM?=
 =?utf-8?B?TWMrTE10TE9ORHdjdEU1dk0yUnFiS2d1d3FEZTdHaERBRzRpTDgwOC92NVRv?=
 =?utf-8?B?RDZGR09hS3IyN09RbFUwTzk4NThZaXI3czZXV2xHYlVNaGVCRFFnLzlyNjgw?=
 =?utf-8?B?Y1pMR0JqWTVVazBlY05TOEk5TmRqZ3BQZDdiYUZxSGJGcEUzaHM3KzI3cFlO?=
 =?utf-8?B?Q2JibjIvdlpWNVBGSlg1WXo1dXRHSVhZRjhKcWJSU0VOUzFwWmJ3bGJqUWNl?=
 =?utf-8?B?TktPbGRwa2tiN1N0RnRoSys3UHZnbkVQWWVzc1hnN0F3WVYzc3pPYmQwdmU0?=
 =?utf-8?B?bE1GSEQ2cE1OeW5GRGlLRW4vcVBRUHV4ZEJCU2FpTyt2clVTejVwVVdBeFkz?=
 =?utf-8?Q?oqaFOQMR33W2FzZhwGEbIZX/GkAicVLmneifp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E57E5340590D3641B32C77F8B07ED8D6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7464a8-ec5c-40b2-93c0-08da38b285e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 09:41:02.7339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNpHfguAgDZ88wopRNm/HiUytiE3jj60nNTudkPn6T7rmiJ59G0WnPg326l1sRDEXIgvnPOZH67WdWybUKmhfABQK3RNTsIZGRAmpyR1JDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1427
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA1LzIwMjIgw6AgMTQ6NTEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gT3RoZXIgYXJjaGVzIChzaCwgbWlwcywgaGV4YWdvbikgdXNlIHN0YW5kYXJkIG5hbWVzIGZv
ciBQQUdFX1NJWkUNCj4gcmVsYXRlZCBjb25maWcgc3ltYm9scy4NCj4gDQo+IEFkZCBtYXRjaGlu
ZyBzeW1ib2xzIGZvciBwb3dlcnBjLCB3aGljaCBhcmUgZW5hYmxlZCBieSBkZWZhdWx0IGJ1dA0K
PiBkZXBlbmQgb24gb3VyIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBQQUdFX1NJWkUgc3ltYm9scy4N
Cj4gDQo+IFRoaXMgYWxsb3dzIGdlbmVyaWMvZHJpdmVyIGNvZGUgdG8gZXhwcmVzcyBkZXBlbmRl
bmNpZXMgb24gdGhlIFBBR0VfU0laRQ0KPiB3aXRob3V0IG5lZWRpbmcgdG8gcmVmZXIgdG8gYXJj
aGl0ZWN0dXJlIHNwZWNpZmljIGNvbmZpZyBzeW1ib2xzLg0KDQpJIGd1ZXNzIG5leHQgc3RlcCBz
aG91bGQgYmUgdG8gZ2V0IHJpZCBvZiBwb3dlcnBjIHNwZWNpZmljIHN5bWJvbHMgYW5kIA0KdXNl
IGdlbmVyaWMgc3ltYm9scyBpbnN0ZWFkLg0KDQpXZSBoYXZlIChvbmx5KSAxMTEgb2NjdXJlbmNl
cyBvZiBpdC4NCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMTYgKysr
KysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPiBpbmRleCAxNDVhZjAyZGYzZGMuLjAyOTk0MzYxY2M3YSAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTc1
OSw2ICs3NTksMjIgQEAgY29uZmlnIFBQQ18yNTZLX1BBR0VTDQo+ICAgDQo+ICAgZW5kY2hvaWNl
DQo+ICAgDQo+ICtjb25maWcgUEFHRV9TSVpFXzRLQg0KPiArCWRlZl9ib29sIHkNCj4gKwlkZXBl
bmRzIG9uIFBQQ180S19QQUdFUw0KPiArDQo+ICtjb25maWcgUEFHRV9TSVpFXzE2S0INCj4gKwlk
ZWZfYm9vbCB5DQo+ICsJZGVwZW5kcyBvbiBQUENfMTZLX1BBR0VTDQo+ICsNCj4gK2NvbmZpZyBQ
QUdFX1NJWkVfNjRLQg0KPiArCWRlZl9ib29sIHkNCj4gKwlkZXBlbmRzIG9uIFBQQ182NEtfUEFH
RVMNCj4gKw0KPiArY29uZmlnIFBBR0VfU0laRV8yNTZLQg0KPiArCWRlZl9ib29sIHkNCj4gKwlk
ZXBlbmRzIG9uIFBQQ18yNTZLX1BBR0VTDQo+ICsNCj4gICBjb25maWcgUFBDX1BBR0VfU0hJRlQN
Cj4gICAJaW50DQo+ICAgCWRlZmF1bHQgMTggaWYgUFBDXzI1NktfUEFHRVM=
