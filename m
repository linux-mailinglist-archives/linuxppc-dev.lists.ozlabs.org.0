Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A0787F23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 06:58:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hwIuEG/V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX74c5RpRz3cBY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 14:58:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hwIuEG/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX73j6n3Cz300f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 14:57:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXsHBDmfRhHDhMAOh0Jt8xZUOgQU5NREBYML3W0X1Lafyeo64qSqZSi8goiy2YMisPfnViGhbvcehIB/tGBypSeiS0yGREYm/GCM9iz0T8B9Ze/G+2CRmu2PTM8ziPfEatRK6JtC+hUHJIR3VSbrVxbNQha+bhJlvsHE9+2cSj+zq+NZN39FblLBhYjPVFRhoIP7RF6EM9skK96QI17xlbvMdWim1u28s3HO3v3UAczTTNK1agLT89nykdAyJ0WzYxUKM2Yk2eisyx92cElsFemVC8mBD9BtSFj4EO/0YCk2bQwsOxXGYVGfqXUm82bLRZcKr5axOVURM+wqF2WG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozVq43cO/q3kxl0nTD/ZgysPujy2b0cMc6JOkoiyPUs=;
 b=STohag4ZweqBlt9+3ptHuQ/jEb0Fv3h9PFzvzQXdCUXRF1KvTQ0mI1G/lSvXnrt75L5qo/vo4QC5IE6l2w8+ZcH2Xy5+P6wt0z1CSW1oUdu1FJkknEo6Nq5apvZR+Voj7H7CViI8Mf9YZgei/EXldon8M86jY9CxXHVDYtVU84FG1pPfL/F7d3ze+pO/3drFDh5pY72qV0o3propfH8dzdDkSF+wZVXkB0VedpQ9rAdzXsaRW3sI12BcYSTHYHH6SO1WMDIrOeEuz+nZ5P2frVf9MYYTQLP+PmvNUQHq+yW+d7tt2csFSNWSLq6VqEV/axWY0Z2HpmqZbvV3Ft/Pqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozVq43cO/q3kxl0nTD/ZgysPujy2b0cMc6JOkoiyPUs=;
 b=hwIuEG/VupoOqkFU+MpJVXlQFCZ8foZpGwly0vEZ5YvyF/QYSdERxGsC0Q0O9uSq+Nl4u3gXYibn6NRi47Lnqw/AbSUanl8U/9q7QxS06FNkXwAFfTAbLoG6wS9gZM8HAH3iGwq3Z69Gg7PO7zLdPZ/tsTWIm/ZbNIJVrUWXZxmgsaJOrW/rFBMb/v3XNczAXqN/6gF/Gmm26EO3f8u9S05AmKEZ+sdFv2YyVow5Fl+dA3uKzfiEU+SnCizQabAhrC7pFLFBR/FMjeHGRXwqJm+NJGa8qvn+0yoUOwLzLcORude6q+jyId2iVmOjMH1EMpw806fWzLs0mWHYCwspCA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 04:56:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 04:56:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Thread-Topic: [PATCH] kbuild: Show Kconfig fragments in "help"
Thread-Index: AQHZ1tuDAhcovvkCmU+XTZ5bN1Nspa/6c2qA
Date: Fri, 25 Aug 2023 04:56:54 +0000
Message-ID: <42174d5e-59f0-4612-d7a1-11e830d0a044@csgroup.eu>
References: <20230824223606.never.762-kees@kernel.org>
In-Reply-To: <20230824223606.never.762-kees@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3012:EE_
x-ms-office365-filtering-correlation-id: ab83a89c-f417-4024-23d8-08dba527b405
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jP2uTRWfsf/Gal00biZ/28WN5qRj4XIquEeEcPjR96p2gHQE+ngLhE6ia7Him+QzFPHFZ1pifWDhP+RyzMve1AHGVKN6RyDq7nrb4pM7uZQXwnuawXZTIk9CLahVYvJCGyJPAZsgJyrQE2FPu8v/WiyUw36R7nfx5aanDI92cuwi95O2YYLezYLrErRwYI+6lRDeYaoyoZQYg4pgw1E+ybh+j1q6CC97cZNoCkOfCi0H2b7KRhc9Tx58YlVLA1H4l6VJ27WkzRl0CI0NZx6pUuTLYU0Sss4X6puJJY2pwwWV8Mqst5nQ5zmTvS8FJh4Y2yQmCfCiB0JaXi3OQIZt24OJ1l+4I7gJ+7PqWbNr+xjTq43IWdt/pVE/fvCGujSYXBb+UlmHFhTBsAKhEKpyEyyPcmvW4Ya3nxh04LGfX8Kx2zwlwUOrHnW0hYX7/d0rIXP/vV6rqB7oq5QZe3InCj+7327kpm8+T3WhkyWWDKwpsfjTQhukNhjw3XOzyVxmHOvz4JoaZbtBpQCViBFxVXS4zG4I8SQQURkdD1Tq48mWhBoSDMkLo4BfysRL2UVLkQWlgkwwvz7BJd8brnloyY6QweEbgBEsYJyLIp9VkTlDuMgRFjJ3qh29D7b7fKvWBrvaX6gZizvkxDQEy5ty+duso4PoOBs6qK0KkmaYYwBykV426NhLRXAlUW8ez3Dr
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(136003)(346002)(451199024)(1800799009)(186009)(122000001)(38100700002)(38070700005)(8676002)(4326008)(8936002)(54906003)(31696002)(41300700001)(6486002)(6506007)(316002)(36756003)(66446008)(64756008)(66476007)(66556008)(110136005)(91956017)(76116006)(66946007)(86362001)(71200400001)(6512007)(26005)(66574015)(478600001)(44832011)(83380400001)(7416002)(31686004)(2906002)(2616005)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QkNCZFNoeXBSSkxGMUZyWC9YNEwxMXdwTVJSOEpXVkJhbWZ4OWNqbWxpZFFs?=
 =?utf-8?B?enBRZ0dvczNOb1UwRDJaYVE0ZUdBWTRKeXlLVDFLSFFxYUdPbkorZUx1bnJY?=
 =?utf-8?B?NzhNdVhCRkw1Qkxrd3U3UWt4Z2QwYmJHeDIwVjZPUm04WTdEVVlucGd5dkhZ?=
 =?utf-8?B?Mm5KbTRVbVFCazBWd0YwclQvNXJOWFBJQVA5U2hhYWwzYm5GRFRWRWtJUkZT?=
 =?utf-8?B?dEorMVcrQlppUUFzMERYK250WHpMQnZsYkh2Vk5YMGVzT2RwdVlNeDJPQXYv?=
 =?utf-8?B?Z0Y3aFhhL1paeUE1VGhHbVF1NFBqRGpBQWlQdlV1em5kM1QxQWUrMEo5bG5i?=
 =?utf-8?B?V2g3Y0VEclcwNVZuRUFxU21vWWM4YWMwR1FvQ2pOSzk0cXRaMDg4NnN5dExv?=
 =?utf-8?B?US94ZWZjMm9iL2tXaEJaTUljTGw4YjBiM3pleGpXSHoreUZSUEhJTEU5Ykdj?=
 =?utf-8?B?c3o0c1FZNkphdDdDU2VJS1RyKzZPSzhCamxZVU03VjNIN1liVklSQ3B0Mk1J?=
 =?utf-8?B?VHZET1ZIOHFPUTBUNnJQUXo1dkhkTkZiQlFzMkFpYlJ1Undsek5OVXl0Y1RT?=
 =?utf-8?B?U1pZWmRHV1ZCL3UyZU1XQmxFZlV6WldhUnhJVEw4bVhFbE8wbkxNUklqSlpE?=
 =?utf-8?B?OWFCeGZWYzJEWFJ3M1NUcFMycDR2dmdqd2U4ZlNGeVY4QzY1a3JTZkk0TTJM?=
 =?utf-8?B?YVlFMWRzOGVaSjIwbXFwWk9aaU42T3lJZmU5WnFoa2RHaU1IbUZHV2Riajh2?=
 =?utf-8?B?NC9jMlVzNG9KWUoxYmc2Tjc3Q1FQMS95SHBkeW4zSDBSdkc0WEs4YUIyYUk0?=
 =?utf-8?B?dTZEZllITUt1dnpyd3gzV3FGTVh4U05RN2NRV2RpazY1c1hRYkN5L1VKYllw?=
 =?utf-8?B?SitGa2tqRlBqTVgvbGlIQjM4Q2NITXZ4N0xVN2l5a0xMbkJsa0YrYkU3WWVv?=
 =?utf-8?B?Mkh0QXgxQkYvS2lkM3NGV3l2bzhZRXZVVlJzaExSSWQyRStZQ05QT1h5TDls?=
 =?utf-8?B?TG5WYk1wVktWSzE0Wm1LYVFORHlpRFh6VkZiY0dSNWpXK0RjTEU5Vk8xalhO?=
 =?utf-8?B?dUgvTFlTbzlhb0ZYQWMyc2s0RERIWGRFVnZ2Zi9oc2ZMcjV2aDJpRGpaVjVX?=
 =?utf-8?B?ajlRTm1rR1FFRGxJVnJaQ0RNTmhLdmxkOGdXM1NSUVNac29ZdExIbm14d21k?=
 =?utf-8?B?VVhFMFBkc1podTRydGNYYmZHRXlRckNQMkpOMFE3N2IwdVdXRlA1VU80bFhZ?=
 =?utf-8?B?VFI0WDNDbGJUSWpVTjFLUm0zVU12MW43NnZXd1M2aS9CQW9PUE0vakowR0N6?=
 =?utf-8?B?RjkzWWVMOVN4ZWJoUGo2WUVPcjdoUmlMdS9qclQ4Nnc4bldnS2FyeS9OYncy?=
 =?utf-8?B?UlhZNmM1UytkZ0VUdEhMamdGY0ZqOEpmY2hHYTh1K2FhM0pLTEZWVlJ0aW5E?=
 =?utf-8?B?RWFLek40UTNEN1Z6dFRpOEozUDRwWmdKSHZ6c2x3c2VLRENPZElBcmZFRWw5?=
 =?utf-8?B?YTNqbTUwaVR1UnZ5ajlnSUZwVHoyems3TzJZRXJXbUlJVFZyeEpkbk81dTZ5?=
 =?utf-8?B?QTF1YThrNmR6cm9XSzdBNjRvL0NvUXQxOXpDZjZlRUpOc0lSN3pSZUJhWmFi?=
 =?utf-8?B?dDZvem5RTXY1elBKTjdvR0lxUGtGNjUwb0pJSjIzK2wwNTBLTHdUNE15NURa?=
 =?utf-8?B?NEJici81TTZOTTdBRDBSMmxncGQ2WnozSmlJcFMybEwrK2ZFWHN0NnN1bzVE?=
 =?utf-8?B?RVcxWTluUzI2ZGlRSnhVU29tbWN3RVV2K1Zsc0lxZmZOK05DckNjQzcxeDI3?=
 =?utf-8?B?NHcyRHVTaUk5ZWl4MUI1eGZZdncyVkVpc05pOTFpSnFlcWFyTGp2eG9EMVVV?=
 =?utf-8?B?bW4wQkxuQjNSZmcyZEEvMXplb2g0Vzg4OXUrQ0I5cVd5SzhHYkd4YXZpRmtJ?=
 =?utf-8?B?NXdzd3pOTWh4eEw0dnBKb1Eva3BRRndPUDZvUTRCWTdsaWpXYXNaOHNKNjA0?=
 =?utf-8?B?eWNCVmJKTjZGVTlsd21wdVpjVzM3QkR5MXZ1Vy9scTdkcFJWdHZlc3hNVXRH?=
 =?utf-8?B?YXVoU2NaTkZiaXVmWWhwaGdodk9tVkZxK0FoOEFtYXVDT2F5OFVUektxaTNQ?=
 =?utf-8?Q?fOn9tJY3HLtwjTK/7FZtezp+Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B0681B0050E094BA0D2BCEEA39F876F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab83a89c-f417-4024-23d8-08dba527b405
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 04:56:54.5261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtMJGE6htyVSGZn7j5/6W+O3w+zZmgsnP+TtKAP90njbKw0Wh5FlLt3NJ3mkqRIxEWTpbrMpxrx8UfP0GEruDD+xt+MDeXq4yS/xVu4AwiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3012
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA4LzIwMjMgw6AgMDA6MzYsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBEb2lu
ZyBhICJtYWtlIGhlbHAiIHdvdWxkIHNob3cgb25seSBoYXJkLWNvZGVkIEtjb25maWcgdGFyZ2V0
cyBhbmQNCj4gZGVwZW5kZWQgb24gdGhlIGFyY2hoZWxwIHRhcmdldCB0byBpbmNsdWRlICIuY29u
ZmlnIiB0YXJnZXRzLiBUaGVyZSB3YXMNCj4gbm90aGluZyBzaG93aW5nIGdsb2JhbCBrZXJuZWwv
Y29uZmlncy8gdGFyZ2V0cy4gU29sdmUgdGhpcyBieSB3YWxraW5nDQo+IHRoZSB3aWxkY2FyZCBs
aXN0IGFuZCBpbmNsdWRlIHRoZW0gaW4gdGhlIG91dHB1dCwgdXNpbmcgdGhlIGZpcnN0IGNvbW1l
bnQNCj4gbGluZSBhcyB0aGUgaGVscCB0ZXh0Lg0KPiANCj4gVXBkYXRlIGFsbCBLY29uZmlnIGZy
YWdtZW50cyB0byBpbmNsdWRlIGhlbHAgdGV4dCBhbmQgYWRqdXN0IGFyY2hoZWxwDQo+IHRhcmdl
dHMgdG8gYXZvaWQgcmVkdW5kYW5jeS4NCj4gDQo+IEFkZHMgdGhlIGZvbGxvd2luZyBzZWN0aW9u
IHRvICJoZWxwIiB0YXJnZXQgb3V0cHV0Og0KPiANCj4gQ29uZmlndXJhdGlvbiBmcmFnbWVudCB0
YXJnZXRzIChmb3IgZW5hYmxpbmcgdmFyaW91cyBLY29uZmlnIGl0ZW1zKToNCj4gICAgZGVidWcu
Y29uZmlnICAgICAgICAgLSBEZWJ1Z2dpbmcgZm9yIENJIHN5c3RlbXMgYW5kIGZpbmRpbmcgcmVn
cmVzc2lvbnMNCj4gICAga3ZtX2d1ZXN0LmNvbmZpZyAgICAgLSBCb290YWJsZSBhcyBhIEtWTSBn
dWVzdA0KPiAgICBub3BtLmNvbmZpZyAgICAgICAgICAtIERpc2FibGUgUG93ZXIgTWFuYWdlbWVu
dA0KPiAgICBydXN0LmNvbmZpZyAgICAgICAgICAtIEVuYWJsZSBSdXN0DQo+ICAgIHRpbnktYmFz
ZS5jb25maWcgICAgIC0gTWluaW1hbCBvcHRpb25zIGZvciB0aW55IHN5c3RlbXMNCj4gICAgdGlu
eS5jb25maWcgICAgICAgICAgLSBTbWFsbGVzdCBwb3NzaWJsZSBrZXJuZWwgaW1hZ2UNCj4gICAg
eDg2X2RlYnVnLmNvbmZpZyAgICAgLSBEZWJ1Z2dpbmcgb3B0aW9ucyBmb3IgdGlwIHRyZWUgdGVz
dGluZw0KPiAgICB4ZW4uY29uZmlnICAgICAgICAgICAtIEJvb3RhYmxlIGFzIGEgWGVuIGd1ZXN0
DQo+ICAgIHRpbnkuY29uZmlnICAgICAgICAgIC0geDg2LXNwZWNpZmljIG9wdGlvbnMgZm9yIGEg
c21hbGwga2VybmVsIGltYWdlDQo+ICAgIHhlbi5jb25maWcgICAgICAgICAgIC0geDg2LXNwZWNp
ZmljIG9wdGlvbnMgZm9yIGEgWGVuIHZpcnR1YWxpemF0aW9uIGd1ZXN0DQo+IA0KPiBDYzogTWFz
YWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4NCj4gQ2M6IHg4NkBrZXJuZWwub3Jn
DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGxpbnV4
cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnDQo+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4gLS0tDQoNCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9jb25maWdzLzg1eHgtaHcuY29uZmlnIGIvYXJjaC9wb3dlcnBjL2Nv
bmZpZ3MvODV4eC1ody5jb25maWcNCj4gaW5kZXggNTI0ZGI3NmY0N2I3Li43NmIyMmY4YTgxNzIg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9jb25maWdzLzg1eHgtaHcuY29uZmlnDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9jb25maWdzLzg1eHgtaHcuY29uZmlnDQo+IEBAIC0xLDMgKzEsNCBA
QA0KPiArIyBCYXNlIGhhcmR3YXJlIHN1cHBvcnQgZm9yIDg2eHgNCg0Kcy84Nnh4Lzg1eHgNCg0K
PiAgIENPTkZJR19BUVVBTlRJQV9QSFk9eQ0KPiAgIENPTkZJR19BVDgwM1hfUEhZPXkNCj4gICBD
T05GSUdfQVRBPXkNCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvYm9vazNz
XzMyLmNvbmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL2Jvb2szc18zMi5jb25maWcNCj4gaW5k
ZXggODcyMWViN2IxMjk0Li5mMzM0ODNmMDc3ZGIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9jb25maWdzL2Jvb2szc18zMi5jb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3Mv
Ym9vazNzXzMyLmNvbmZpZw0KPiBAQCAtMSwyICsxLDMgQEANCj4gKyMgQmFzZSBzdXBwb3J0IGZv
ciBCb29rM3MNCg0KMzIgYml0cyBCb29rM3MNCg0KPiAgIENPTkZJR19QUEM2ND1uDQo+ICAgQ09O
RklHX1BQQ19CT09LM1NfMzI9eQ0KDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmln
cy9kcGFhLmNvbmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL2RwYWEuY29uZmlnDQo+IGluZGV4
IDRmZmFjYWZlNDAzNi4uNjVhMTNiYTMyODEzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
Y29uZmlncy9kcGFhLmNvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9kcGFhLmNv
bmZpZw0KPiBAQCAtMSwzICsxLDQgQEANCj4gKyMgQmFzZSBzdXBwb3QgZm9yIERQUEENCg0Kcy9z
dXBwb3Qvc3VwcG9ydC8NCg0KPiAgIENPTkZJR19GU0xfRFBBQT15DQo+ICAgQ09ORklHX0ZTTF9Q
QU1VPXkNCj4gICBDT05GSUdfRlNMX0ZNQU49eQ0KDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvY29uZmlncy9tcGM4NXh4X2Jhc2UuY29uZmlnIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBj
ODV4eF9iYXNlLmNvbmZpZw0KPiBpbmRleCBhMWU0ZDcyZWQzOWQuLjIwZWNmNjU3NWM1YyAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODV4eF9iYXNlLmNvbmZpZw0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4NXh4X2Jhc2UuY29uZmlnDQo+IEBAIC0xLDMg
KzEsNCBAQA0KPiArIyBCYXNlIG1wYzg1eHh4IHN1cHBvcnQNCg0Kcy9tcGM4NXh4eC9tcGM4NXh4
Lw0KDQo+ICAgQ09ORklHX01BVEhfRU1VTEFUSU9OPXkNCj4gICBDT05GSUdfTVBDODUzNl9EUz15
DQo+ICAgQ09ORklHX01QQzg1eHhfRFM9eQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Nv
bmZpZ3MvbXBjODZ4eF9iYXNlLmNvbmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL21wYzg2eHhf
YmFzZS5jb25maWcNCj4gaW5kZXggNjMyYzAxNGIxMjJkLi44MjM5ZDFlNzc4NWQgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9jb25maWdzL21wYzg2eHhfYmFzZS5jb25maWcNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODZ4eF9iYXNlLmNvbmZpZw0KPiBAQCAtMSwzICsxLDQg
QEANCj4gKyMgQmFzZSBtcGM4NXh4eCBzdXBwb3J0DQoNCnMvbXBjODV4eHgvbXBjODZ4eC8NCg0K
PiAgIENPTkZJR19QUENfODZ4eD15DQo+ICAgQ09ORklHX0dFRl9QUEM5QT15DQo+ICAgQ09ORklH
X0dFRl9TQkMzMTA9eQ0K
