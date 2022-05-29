Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC985370F2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 14:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9yg21ydwz3bnX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 22:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9yfY6VPvz2yJF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 22:34:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKk8zGnVc64xQKsO7EGCyzDrqUbusA6IJdPc9snnl+6CoIqqCovoDLeSyC09iaP+LkRXaVkdsVZT9yyisZ8ZKNyyajbzJf4hVi2UBFobp21nHsPDlm9XvF8VMlNtLdHHmnUp+g9PLJAZt1CG64vRQAmWyFiyc0gae/pIq5ixMBdpt0Q7BITQWTeIixhXDYoa6kFB8HLg8RpuDhjdfavZAeUiK51+5aqGFM6NXSetC/DbiuqrBV6XxYVOvlS7uyoXfdjL0glKW+2pfS9a/p/unatkIEzpMjsuZLcg1zjmcXSMcsrXzDSBgtMw0a7y5MhbAOiWkRK40V0cxKLPmcZmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KL9Z+pW4zMmtDriNUVusyrnIeK9dsJ77DPTTTjZ9gE=;
 b=Dehfg+5sUt/B1joatUrdpVOs/4Y1Peg4yvMmh/oBWpppQBZJZt5ECMLJY7YLvSX65o7wZe/tXHE7+2JWLDHvLUDECqo8r9m9IKJAkQyKkl80T6mAPZuiO63zeExe81nRSNqj0zVszBhBlAWizCp6GVQKDlbqgox4TvxNQlttuwaAZRVlwj+DbDhlSe7CyXbAJbKIR3/O28utg3i370BLMaSnfRZpwmW5eC84SdFFFplKwAEpOkVFXABwmok9AhjR+gFYo1O1yb44CXf9BGyraxCQpacXXTDgDCJSpZgho5LAzdwS/w9KwsAaEtfkNrJcz/8WZFLA3h9bVJ8qL7nYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3457.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Sun, 29 May
 2022 12:34:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Sun, 29 May 2022
 12:34:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
Thread-Topic: [PATCH] powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
Thread-Index: AQHYb+eO5T+CdOK+6keMDKao2zJJZK010QQA
Date: Sun, 29 May 2022 12:34:19 +0000
Message-ID: <78e2321b-fc57-408c-30d5-44cf420afbb9@csgroup.eu>
References: <20220525032639.1947280-1-mpe@ellerman.id.au>
In-Reply-To: <20220525032639.1947280-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23d7020a-407c-414c-633a-08da416f8da6
x-ms-traffictypediagnostic: MR1P264MB3457:EE_
x-microsoft-antispam-prvs:  <MR1P264MB34579AA4B59E70A27E7FADA3EDDA9@MR1P264MB3457.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ll47eAqQ2kNEEcwQw9CJ5iK3Hd6KLvY08K9tId3658TaSQuG1VFhs+QqrCBoCrgE90yVw3k43UyXKB0pvNe0nCtFHFSGaoELlO+c2INXCQCMUnOxeYaK2mKyoJ7j8Pv4t7R0k4D66Yb1sYCG+DsfVFQHGMQ/f4vlm3XW+clpZinJHyc9k8/2VAif+iJ36JxiJgJrGj90wiRcVUC4qmOkNcA/ab1Gafy7WizTmp+13BwXdIGW2X2bjXmwnkFNDcVvI2jyCo1gvbdw/WKj4X5SQ7S6dJa249MF+UxWmtBQ6Og5NngM2uVQvXZacQv1HuF8w97NerC2kgso+T8Ii/DVlJQ5/X1nZoZkbxfGzX4E8m+4Vw76QYaNrc1qR49OoQpB2UmVU7mNynR4cWIfqzeeDG8fGjFatN0HLQmRJcbl0KAeVu3c5y/Ap3r6EKTB1xkteErPJzPtuwElLpI+YBbjIVt9vZd6HXl2O0J3EEsswVOD46GzRWGtEYa1QGsh1WkPMRJjwVdd1Fn2MM2Z4tZLC/eY/xRxQ8bZud0n6w+l4VtsbEzB3es7KyrumbREOU3aiqlH33cWYsywvfF3WiLfAhV0jJoY4LSueJ1KdvvmUfg3/TNG4swDcTywdX7xoG2/NavNR/nluA+bKeMQUQVori8u7XRefpqOTwG2EpPoOYpywUGR+JuJAXT5105dFpk8VOqtYX5eJftgnrvJiPG/GrD9r3cM55SM/vrMYzTg/+Gi98SN9QuJ0+XgVTI2x/U6zvVDzUXHHX9afR5kCo242A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(4326008)(71200400001)(8676002)(38070700005)(110136005)(316002)(66556008)(36756003)(122000001)(38100700002)(66476007)(91956017)(66446008)(86362001)(26005)(508600001)(66946007)(6506007)(6486002)(6512007)(31696002)(76116006)(64756008)(8936002)(31686004)(186003)(44832011)(5660300002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V0xMRjduQjJBUnpSRnF2alZMTlhWakJ4cld0aUJYcll4NDZJQWs0eG12czAv?=
 =?utf-8?B?YkhCdHVPZmZiVDJEUWwxUm1VUXExTFNjT1BBUE9MTnJpc1NyL1ltRVhtTlhJ?=
 =?utf-8?B?dHNCdGVHWC9peVJPU2ZKaEJuTVg4bzBUMlFqS1ROSWxjKzRxOHhKWHMxZ3VW?=
 =?utf-8?B?OFpaYm5yN3lRU09yLzhiNHVPMEJVSEs5VUVDUlFLeVduK2VDOFlMTHJROEZt?=
 =?utf-8?B?aWM3bEUvdG1GbHZ6MTBvS205bGlJcHZWK0gybUNSOUttN2Y2aDcrWllPVmhh?=
 =?utf-8?B?Q3BwWDB2TW9ybDZJZEFFcmhUbzRxWlhkZEh1bnBwUEEreU1vazRkOUNhNEFM?=
 =?utf-8?B?Mmg2UGo5OXJTdXkrSTRvczU3U0QwK1lZNkI4ZndYUThheTBXbXJjemRNSi9J?=
 =?utf-8?B?ZzkwM29uVWxhNGVGNVJBWXJ1bU1vY1lyeWZnMmVNN3R6WDI1V2VFMDJWNDVV?=
 =?utf-8?B?NFNESnNJcG1saHA3TTg0MFc4ZW04MVNaRTdUcGh3NE42K1pSNkRwaS8zc2hj?=
 =?utf-8?B?REVKaUIyeW5yS29jdEtBRkx6N3B1R0hVVWJnQmZKa1lnT0pwb0R4K3cwRHJi?=
 =?utf-8?B?L01XdnlvQ2phQW9wcDZvelhMeUJCbGJvZlRHby84N3FJdlBQMk5ka29HNGZQ?=
 =?utf-8?B?SmQ4MkNKaGNlbWZzU3Fac05vajZSdUlUa0pMU3g3RjdtRHhlaUFUa2hoblJE?=
 =?utf-8?B?am9IYWFNMHpiL3pTMXpGc0NNakxnSWhDdHZja0o1OUVodUwwVjYwN2d1Zm5o?=
 =?utf-8?B?MEV2cUlUQWEySlVTSkhyQ1lFWklzalpDeEhEdmVVb2M2T3BBdUswRHZ6WFUx?=
 =?utf-8?B?ZkE2QnRJczhwc0NNTzN6KzFSdnRaUEthVE5OOGNyRzBkRzZ2Nlo3dTRqQWNv?=
 =?utf-8?B?ZTR4cGpScmhXOGEwaVZ5WGordTVYdHF3N01UNmN0bHQ1SVh2Y3phOHFBSHZz?=
 =?utf-8?B?b24xbHFLbWhRN3BiUzFaU0NaM3pPQStnRExOcHhpdmR5U1U4eVp0NEFiYTYz?=
 =?utf-8?B?T3gzVXd5aks3Rk4rZ2EzTzcvcTFvKzlZYytueTJYQWI2TlhPak00YzRmVGth?=
 =?utf-8?B?Nmlvd3VreG1wQ0lHUnRVQngvWVlRZDMxek5jY0gzcVZoRlBhZGI0UGRaS0ZJ?=
 =?utf-8?B?Tm5ObWxkRTdWbHpKUkZqMExLMUhmZ1drWmdNcm1qbENjRWRrUTNKdzBpcS8x?=
 =?utf-8?B?TUtCdnE1ZGhJZFJyT1lpbjMyMWFQYnl4YU05em5NRkxtT3REMitPdHNDbUFr?=
 =?utf-8?B?Q1ZWcFNtMEthVExBMFVPbmFZeTB6MWRSUVRJK2hiYTJGZlNQSGV3ellacjNL?=
 =?utf-8?B?RW91anU0RVN0K1IydVJxQVBnbmhKNWhoclhqbFdST1dEVXJXNTZqei9YMWtT?=
 =?utf-8?B?aGVXUzBhZHZaYUJzQThJUWN2aStHV0l4aUZwYzhOQ3NIaHhpcEdIRWRHL05B?=
 =?utf-8?B?NlJzWFBRZnJqTENrN1ZRaU14dGI3a3JJUmJ6eDJCK1N4cmo1R3lFMWdOR1Vn?=
 =?utf-8?B?bzRhZUVTNlRnRy9GVWZuVHVxU3BxR1NzOWJLU1ZVc2Y5YkJKMS81cHZlcXV1?=
 =?utf-8?B?THdQZFNyQlRaekFueit6Tmt1aGJsNzhEVFdNeXlTMTRDNE1GZFIvRkc5UjNR?=
 =?utf-8?B?Z0dWNTZ4QTlhemIvdnNIV2lXcVJDZEEya2lhYUZOM2ZzajM5LzkxVUh4ZFl2?=
 =?utf-8?B?TlpjTFd0L0h6UVgyTzBTRUc0b2tOMmJJRFZnMjlDOUdLR3BoZUMxUkx6UFJo?=
 =?utf-8?B?WDhjT3ZpNmxtMGhDM1FDdXIxT3Y4azdYWU02RFlrNi9URjR6cjhibmZMWEw4?=
 =?utf-8?B?TVE1Nmtpc2duM1BSQWlBbE5tNmZaV1VIQXpZcExVa2wyWHFPVWF5dmlMWUM3?=
 =?utf-8?B?MGl4RGo1aWppQ1VPYWJhbzdMRkhBYmpzU2d1c0E0cnVrck1aTU52U0lMaFFv?=
 =?utf-8?B?dk1nU000N1NYWC9QOTIwbXNwQUpwY3hsWENreHZyUTYzbzVVeDR3WGgxUkhw?=
 =?utf-8?B?ajRiSzVZQ2VKMk1MN29SazN2TnM2UnpXOFdnQlhtcU5FbjBWSC8vY0VZQkNF?=
 =?utf-8?B?cU1RU3FKVytiQ0pWUGJUeHg5WGNoZnpieExSVU5icmJMZ1FBbHJjLysvYTFI?=
 =?utf-8?B?LzFvbFFBcENFdndscGI2Nzg4QzRPYUdCRWlKRFEzcWo1TUhWa3FqUTRLN200?=
 =?utf-8?B?QkxNdHpscUROeTNKZU9OY1AyTVhjT2h4endyMzRTcDJwYmpRQTFEdkxlV3hK?=
 =?utf-8?B?Nk5xT0RBM0FrdHBGQ2FrbkYyZUF1MVRxWW1lUzczV3FrYkhxdktsd1VQVEl5?=
 =?utf-8?B?UFpJWUhOMy95a0l1amFiR2NQZEN0MzlvL21GaUtieGd2QitXQW1xVGZLUGt5?=
 =?utf-8?Q?5MaYWFsW2dgJ8ZXKVIeIHfwTfgd4FDPFFQMA3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE268D8DAFF7A24BB51A4DFEB014D3F8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d7020a-407c-414c-633a-08da416f8da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2022 12:34:19.9857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuaW+ok1BTJ/uX3l8AQmVSDrTf5Lkr/fBXGa8z3kz9dOfcD/4tSxrBNwzPrt/RCKAx52EVNtHp1i2RdGUQvfMqh8/cYeneOCtSSXI9fu1vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3457
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA1LzIwMjIgw6AgMDU6MjYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gVGhlIEhBVkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLIG9wdGlvbiB0ZWxscyBnZW5lcmljIGNv
ZGUgdGhhdCBpcnFfZXhpdCgpDQo+IGlzIGNhbGxlZCB3aGlsZSBzdGlsbCBydW5uaW5nIG9uIHRo
ZSBoYXJkIGlycSBzdGFjayAoaGFyZGlycV9jdHhbXSBpbg0KPiB0aGUgcG93ZXJwYyBjb2RlKS4N
Cj4gDQo+IFNlbGVjdGluZyB0aGUgb3B0aW9uIG1lYW5zIHRoZSBnZW5lcmljIGNvZGUgd2lsbCAq
bm90KiBzd2l0Y2ggdG8gdGhlDQo+IHNvZnRpcnEgc3RhY2sgYmVmb3JlIHJ1bm5pbmcgc29mdGly
cXMsIGJlY2F1c2UgdGhlIGNvZGUgaXMgYWxyZWFkeQ0KPiBydW5uaW5nIG9uIHRoZSAobW9zdGx5
IGVtcHR5KSBoYXJkIGlycSBzdGFjay4NCj4gDQo+IEJ1dCBzaW5jZSBjb21taXQgMWIxYjZhNmY0
Y2MwICgicG93ZXJwYzogaGFuZGxlIGlycV9lbnRlci9pcnFfZXhpdCBpbg0KPiBpbnRlcnJ1cHQg
aGFuZGxlciB3cmFwcGVycyIpLCBpcnFfZXhpdCgpIGlzIG5vdyBjYWxsZWQgb24gdGhlIHJlZ3Vs
YXIgdGFzaw0KPiBzdGFjaywgbm90IHRoZSBoYXJkIGlycSBzdGFjay4NCj4gDQo+IFRoYXQncyBi
ZWNhdXNlIHByZXZpb3VzbHkgaXJxX2V4aXQoKSB3YXMgY2FsbGVkIGluIF9fZG9faXJxKCkgd2hp
Y2ggaXMNCj4gcnVuIG9uIHRoZSBoYXJkIGlycSBzdGFjaywgYnV0IG5vdyBpdCBpcyBjYWxsZWQg
aW4NCj4gaW50ZXJydXB0X2FzeW5jX2V4aXRfcHJlcGFyZSgpIHdoaWNoIGlzIGNhbGxlZCBmcm9t
IGRvX2lycSgpIGNvbnN0cnVjdGVkDQo+IGJ5IHRoZSB3cmFwcGVyIG1hY3JvLCB3aGljaCBpcyBh
ZnRlciB0aGUgc3dpdGNoIGJhY2sgdG8gdGhlIHRhc2sgc3RhY2suDQo+IA0KPiBTbyBkcm9wIEhB
VkVfSVJRX0VYSVRfT05fSVJRX1NUQUNLIGZyb20gdGhlIEtjb25maWcuIFRoaXMgd2lsbCBtZWFu
IGFuDQo+IGV4dHJhIHN0YWNrIHN3aXRjaCB3aGVuIHByb2Nlc3Npbmcgc29tZSBpbnRlcnJ1cHRz
LCBidXQgc2hvdWxkDQo+IHNpZ25pZmljYW50bHkgcmVkdWNlIHRoZSBsaWtlbGlob29kIG9mIHN0
YWNrIG92ZXJmbG93Lg0KPiANCj4gSXQgYWxzbyBtZWFucyB0aGUgc29mdGlycSBzdGFjayB3aWxs
IGJlIHVzZWQgZm9yIHJ1bm5pbmcgc29mdGlycXMgZnJvbQ0KPiBvdGhlciBpbnRlcnJ1cHRzIHRo
YXQgZG9uJ3QgdXNlIHRoZSBoYXJkIGlycSBzdGFjaywgZWcuIHRpbWVyIGludGVycnVwdHMuDQoN
Ck9uZSB0aGluZyBJIGhhdmUgYWx3YXlzIHdvbmRlcmVkOiB3aGF0IG9mIHRoZSBwb2ludCBvZiBo
YXZpbmcgYm90aCBhbiANCmhhcmRpcnEgc3RhY2sgYW5kIGEgc29mdGlycSBzdGFjayA/DQoNCl9f
ZG9fSVJRKCkgZG9lc24ndCBzd2l0Y2ggb2YgaGFyZGlycSBzdGFjayBpZiB3ZSBhcmUgb24gc29m
dGlycSBzdGFjay4NCg0KZG9fc29mdGlycSgpIHZvaWRzIGlmIGFscmVhZHkgaW4gaW50ZXJydXB0
cy4NCmludm9rZV9zb2Z0aXJxKCkgY2FsbHMgZG9fc29mdGlycV9vd25fc3RhY2soKSBvbiB0YXNr
X3N0YWNrLg0KDQpTbyB3ZSBoYXZlIG5laXRoZXIgc2l0dWF0aW9uIHdoZXJlIHdlIHN3aXRjaCBm
cm9tIGhhcmRpcnEgc3RhY2sgdG8gDQpzb2Z0aXJxIHN0YWNrIG5vciBmcm9tIHNvZnRpcnEgc3Rh
Y2sgdG8gaGFyZGlycSBzdGFjay4NCg0KU28gd291bGRuJ3QgaXQgYmUgZW5vdWdoIHRvIGhhdmUg
b25seSBvbmUgY29tbW9uIGlycSBzdGFjayA/DQoNCmNocmlzdG9waGU=
