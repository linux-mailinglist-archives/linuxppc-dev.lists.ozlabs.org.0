Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27F570571
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 16:22:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhR101z3Kz3fD2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:22:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KhfFMyfK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KhfFMyfK;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQzc4Lkhz3cdZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 00:21:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzmf+f1XngyOKYpFo04sTeH0nzL/Jcn9txIOuiP2QWvL1W8cy6mFx41N3IjBg/l2wGOvufyWLjcZPyqm+D++eBSq9Q8nsguNg9dkUY0i6NVoxYX3R+ONfmVbmSNC/4x08JID4Xr330LWwSzY/I5nEIM6MoBLSVVrMAbs5hiG/fC6Kbh7tOHE0Q60YatYHSkkacet3EBUFHs126r+4cClhPdwizlmK1GYJzaDnRb07FKK5xlMB95Y2PSmtVAecDk74zVOug9+OG7Gm5LNERw3GACDcbmuh6kjLgTjlBqDxLkhtwlGo/J2UJM5tIDRfv0KPKuEYxyKXQXXqEGR9hUL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYGU6cMUJSqZZXKnlGWr6sMa6JNY1VYGfQuRjoERZCo=;
 b=W0GDZkAGDk7tNEPH9lN9K809BIFnG6K6Nhh7DPi/YwDgeozB22A4v5g2+XpBvdWXAc8FvKneFojUPNsP6vBMQTsQYM7m3f38z/tw/B6VpGYOyKGvHieTmozAhXGVjBjQBZtwmFJAXss8E2YOmEKAJj80ZRCsNDG/X9pXqBRFlqOB4Iava96chlJ+QK+SJrQlgypYPI8JHhlNklQ8OTC6sMOqTUYktN18tf6F4gdRPYEL9KtVbyzUz6suhd2MZ9FwBPNxaLTa+V3q2u9I/A8VZ+VOPU4WzBipUD6uyRzUPWmvyilPa3WyMJq7g5Xkr0tHTE29Mr1XRyIaMFyA+wMqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYGU6cMUJSqZZXKnlGWr6sMa6JNY1VYGfQuRjoERZCo=;
 b=KhfFMyfKabt+mETs1CskkzM8gCfQeGxiiBjJiiCzUZwPUKC/fkBQxf9UxvOGk6Zor+7JKY4ynHUBU9acy7SNPnVgZjnR0iclyrDoeCaVNgoSxtu144TMdsbax7qdY/lJpBiHTydHQ0al2KI81yjs9CGJ3P+TknP7Pm9Pi0b5fRy8FaGDmSs3UAee92l1t3TSP5eWeGkFtYvYqMsFJSz0R073GFBv+O+JQJuBWHfJ8qT7v4Q/mdYx+K5/4Awzi0YUK4yJCzTgwdwrqT6WIE8HJ+WaqgE2AYSsl5KUgAR3mE+RY+CuoKStbieddRMLyhsvvPlPNN0uLh8+naHzvAw0sA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3675.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 14:20:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 14:20:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAASqgCABox+AIABDLsAgAASsICAAgwAgIAABUiAgAFV1gA=
Date: Mon, 11 Jul 2022 14:20:57 +0000
Message-ID: <7347a1fa-b3b4-b00f-9d76-3091bb66c4e7@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali> <20220708171422.mpbhb4ejarwnce6m@pali>
 <358f5a57-5eee-56af-fe73-f5d11cfad98e@csgroup.eu>
 <20220709102305.t2ouadn6zscp2m7i@pali>
 <c77df184-c79c-8d81-0327-9eaefb71c890@csgroup.eu>
 <20220710175727.ee52xoqfwlphjxv5@pali>
In-Reply-To: <20220710175727.ee52xoqfwlphjxv5@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8276147d-5fd1-4676-da47-08da63489262
x-ms-traffictypediagnostic: PR0P264MB3675:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nfJk6WNdb+najsVncHlq/r+vWc/KJ64Dy07fwa5R+/vNlsQHktvVRGsvmCY2SEinGA3Bv6GF2MDdA4v6RSJ7QB7w8sfD0IVaznCSCy6Qu+ljNAWwZtCUf7M62LXjGKGCXMMQfJZ483rrVAjqLjLyDIdgKSOxA0GjtPKaU/R1AbDvRdjeWLO39i28JuYqMKngU+KtpqBfTutfUcnkFt6i61zIPqXgVSYSGoQl9kMQEXqKopGsf3fRpbZLilwtUvITpkkOmsMFcWyxFOMlJVV/S9XAHK4uJDqpYNHeQ4FemPADYdSrIo9nKCy+qHnBlMDLwQuiUWzNAQDdGiH7lxrrw6QURwgQYOQrbEbUseqfqGWJ7nXiDROS5V4WeH96yNJa33Z8seMtEPlt6Nsyzgt5S6BBsOBjL2D6NIcCZfqyToaz6L5FjO6K1wPQMlKhmdOTGMvpTV24T0ME1K0OQYsbGE0auXc+6uyCGfg67r+DYrZ1rO+yrTNhDtFkM+oAet6/ax1gIQTDLytNpByXsoKsQ73K5VtwwZ1yc8cptPjk6GHu24Vw4lWLggu1H1gUS4RmgPK0PfTQz1fzP8R9nvG7JH/6XqxjAzRPIdyhqSr78OV31/50S8C8/gTROhxfydFkpTwoQeFFKSjvof3IEOS9+AtUy0WSKTLmHrw3ZqHDE+wrn2NV2oziRK/nfNRlaUsTl3xsTsbpceIxMv3WdudrPECN1SvNE2tfAsQ4SMO/+Takmn6AuJhKK3W81bdCJTV0p8P8O4y1NYQcJmZT2K6z2dEIxJVAWNcrlKFCIXtw5wbRnCgBWc4SjfNvv6Umvi8S6QMNKb/izBAWsLyzB4gq5PwOgFdOveAc63TyMdu+VGfGOYEv3aN6/kHFIey3D6md
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(66556008)(66446008)(478600001)(2906002)(41300700001)(186003)(66476007)(4326008)(64756008)(36756003)(8676002)(71200400001)(54906003)(31696002)(6486002)(86362001)(6916009)(91956017)(76116006)(66946007)(6506007)(26005)(6512007)(316002)(83380400001)(38100700002)(31686004)(2616005)(38070700005)(44832011)(8936002)(5660300002)(66574015)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QnFwajFSQ2RGWnRLekF0SDh4Q1M4ZGVxMkFzREZKN21TNWxZYXJEWkROWGNG?=
 =?utf-8?B?QWNhdVR3N01DdFZQanBnaWxnWlBaM2FBblpBQnQxR0E0MXJWUUExWlh1SXpp?=
 =?utf-8?B?VjYyQXowTzhjV0V5Y1h5NGR2TUNNeUcrS0FWZzZ3aHVuamFtdnd1VnYxL3Vh?=
 =?utf-8?B?LzlPWGZYcHlNM043c0MxcHdMQWtQK1g1UmNTeUhOTXNaTlFtZWJPZ3hLcFk0?=
 =?utf-8?B?dnRHUGpiNjNMaVZxM3R1Z2F4KzR3YWpGN2UxUFJJazJGNWs4WXB3c0xVR3Y3?=
 =?utf-8?B?V1A2Rk1zQUpiVmp3MmkvUWFpSXNWbXJ2amFyVjJkbWloSkpnYnFmcDNaOG5o?=
 =?utf-8?B?b01iSXBKNEtnZ0VvVXBIUVh4dHVWaU5MZ3dkVkdxSmJQSWRYc0hBR1BGMUc0?=
 =?utf-8?B?dDBScjZvYUFwbU5UQjFES2NIZlhOWEhaVHJyNk1IcHZndEpQSTI2TWpCSEVX?=
 =?utf-8?B?dEJyWXZiK1k1V2NuWGxubFBZcGZtSTdCN0hadzErbFVUYTZWQWFrcEZtbjB1?=
 =?utf-8?B?UnhXNk8rTjVQUTlzRkhaR1RPOWgybFNBOVJRMGFqd1d6UlFSYlRsZ3dJWTV5?=
 =?utf-8?B?US9DRUFaRUVOZHBWS1JHdjloZzVFWXpyVXFQcFYvS3ZLQW83bFVwNFVQM2R2?=
 =?utf-8?B?WlNhMTRIREZVTkRvU2FwdGU4a2V6OHkvclRVU3NMWkZtTUl3K3Nsa1BRWVVu?=
 =?utf-8?B?ZFB6bE4xK0dMb01vTVovRG1qellsZ255ZFJONDhtRjE4WUFReVBVVmxITC9i?=
 =?utf-8?B?TTdyVjFmOEc2WTlPRVJLeDdiNmo1QjYyMmgxMzQyME5xZkFWdmJPeHlxMXI4?=
 =?utf-8?B?Szd3WlRqVE1ia2JQWlV3dzV3MlZ0dFpVbEg0WkVKTC83UC91T0grT1lVV2hX?=
 =?utf-8?B?Sk9sd29qamZNR3pnVzFZUDUxcDdORXA5dDJFK0QxWFR3WHd0NnpCU2RuYmkz?=
 =?utf-8?B?WHVUY3lQQUk3L241QlRaSktSaDMwbnB2WnF2K1RuY3h4ZW4yNVJYMjR3ck54?=
 =?utf-8?B?dG02d2RKb3dPbGYyTy80M1lKekliaWVpa3RXQlVRaUNEci9jendzcENXNTdp?=
 =?utf-8?B?bDYya0JnS250Wi9aRm5mdHZVOFROd3p0Sk02THFyM1NpRVhSMitJbmt0S1oy?=
 =?utf-8?B?YmkwRU5uMGxUUVNtZDlJSXRGcUpPczlsNlZsQmpTaG1sbEQzU2RQRDNWM2hI?=
 =?utf-8?B?dHVxdUppTnVBUWdxNURCYXBqT2trcnFDN3laZVdQdzY0Q3kxRHVCakVEaVFj?=
 =?utf-8?B?YlN5bVRPa1JjMFhpNlF1WWtrQjZmMUJsb29KV2xaTDZ5MG5aUlJVRGVKbmcw?=
 =?utf-8?B?amxiZW0vYnEySjk0aUNhNEJveDk4UTErOE81WlFyeTV4MzY2RjVVK2VsRTZ5?=
 =?utf-8?B?eTgyZ2JyRkkwZ0taVDA4Zko1VjhrTmp0YThnVEUzdmtBYXFpWEtGRlJJTXdz?=
 =?utf-8?B?Q0M3aXp1RlhQdlhRcFFnVjFuYnRSTHBDZmVGdXRlaWhidmxQK3JuS3RxeU4w?=
 =?utf-8?B?bFI4TW4xYlRndFlXT0k2VnV2SWEzbVFiWm5BdDBEWDdaOWEvQ0ZHeEVnWVRI?=
 =?utf-8?B?US9Hdmd6MmorU2lJYkFqNmltUEFTZEVJQW45UnJmbUVXZFg1aUtTRnJrNzd3?=
 =?utf-8?B?a001a3B0SXdENkdmSWJ2bzZ6OGM5OVlyTjNiNUM1VVJzZHUxc0ZoNkdrYStl?=
 =?utf-8?B?akxjUkl3Q2VXZTBRTnl3d0dvTTIydmpVakxrbnozbzFwc1R2bHRIZU5vS0F3?=
 =?utf-8?B?TzBvam1IOHZIZ2haRkF5bzBzQnlnY1RTS2dwVmJrUnFLdG9qdTM0VW9CMXFn?=
 =?utf-8?B?eU5NSlMwd2kvNXk0VVdkNUlxWmVLbmZ5eVF0ZWZTWUMySkpnajlqVE5tZXBt?=
 =?utf-8?B?MkNCdE44UG9sblpGQ0h3YTV5VnVMSWVrS3BubE1FTUJ6Z09ueDM3OU10U0Nk?=
 =?utf-8?B?Z0hmcG9sdDFveWlhU1UzdG5pL2ZZRjg4dHF5bmdSWE1wNU1lVVZEeU5nME9m?=
 =?utf-8?B?N0kvRlZSOGZYQXA1U1JZdHhDSms0YzdTWHJPOEdERXFRM09DdWhQK1IrUkdD?=
 =?utf-8?B?WW5TOW9la1YrN3NWWUtEMEljbG4ydGxhOWFGajFlL2hoSThRc05NckxDdGJF?=
 =?utf-8?B?bHhZRFAzVDkzS0o0WEprSGh0eUlKZm8wSXk5RmNRT0hndlNpU21HUlJrVW00?=
 =?utf-8?Q?84p/Qqxq/+mVvTa/d3kkO9E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80C346E499C9734185E79EC2FFCD297D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8276147d-5fd1-4676-da47-08da63489262
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 14:20:57.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lm/PbkVr0hLj0MDuJv9LljmyYDrcI3gvCwRoa1hrLwNgakpCUgH+UwZglkHYIgR3Q64CmA6XNo3zZq7dBuQFMmkrrxyImIhjIGEK/by7D1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3675
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjIgw6AgMTk6NTcsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFN1bmRheSAxMCBKdWx5IDIwMjIgMTc6Mzg6MzMgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+
IExlIDA5LzA3LzIwMjIgw6AgMTI6MjMsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+Pj4+PiAg
ICAgDQo+Pj4+PiAtaWZkZWYgQ09ORklHX1BQQ19CT09LM1NfNjQNCj4+Pj4+ICAgICBpZmRlZiBD
T05GSUdfQ1BVX0xJVFRMRV9FTkRJQU4NCj4+Pj4+IC1DRkxBR1MtJChDT05GSUdfR0VORVJJQ19D
UFUpICs9IC1tY3B1PXBvd2VyOA0KPj4+Pj4gLUNGTEFHUy0kKENPTkZJR19HRU5FUklDX0NQVSkg
Kz0gJChjYWxsIGNjLW9wdGlvbiwtbXR1bmU9cG93ZXI5LC1tdHVuZT1wb3dlcjgpDQo+Pj4+PiAr
Q0ZMQUdTLSQoQ09ORklHX1BQQ19CT09LM1NfNjQpICs9IC1tY3B1PXBvd2VyOA0KPj4+Pj4gK0NG
TEFHUy0kKENPTkZJR19QUENfQk9PSzNTXzY0KSArPSAkKGNhbGwgY2Mtb3B0aW9uLC1tdHVuZT1w
b3dlcjksLW10dW5lPXBvd2VyOCkNCj4+Pj4+ICAgICBlbHNlDQo+Pj4+PiAtQ0ZMQUdTLSQoQ09O
RklHX0dFTkVSSUNfQ1BVKSArPSAkKGNhbGwgY2Mtb3B0aW9uLC1tdHVuZT1wb3dlcjcsJChjYWxs
IGNjLW9wdGlvbiwtbXR1bmU9cG93ZXI1KSkNCj4+Pj4+IC1DRkxBR1MtJChDT05GSUdfR0VORVJJ
Q19DUFUpICs9ICQoY2FsbCBjYy1vcHRpb24sLW1jcHU9cG93ZXI1LC1tY3B1PXBvd2VyNCkNCj4+
Pj4+IC1lbmRpZg0KPj4+Pj4gLWVsc2UgaWZkZWYgQ09ORklHX1BQQ19CT09LM0VfNjQNCj4+Pj4+
IC1DRkxBR1MtJChDT05GSUdfR0VORVJJQ19DUFUpICs9IC1tY3B1PXBvd2VycGM2NA0KPj4+Pj4g
K0NGTEFHUy0kKENPTkZJR19QUENfQk9PSzNTXzY0KSArPSAkKGNhbGwgY2Mtb3B0aW9uLC1tdHVu
ZT1wb3dlcjcsJChjYWxsIGNjLW9wdGlvbiwtbXR1bmU9cG93ZXI1KSkNCj4+Pj4+ICtDRkxBR1Mt
JChDT05GSUdfUFBDX0JPT0szU182NCkgKz0gJChjYWxsIGNjLW9wdGlvbiwtbWNwdT1wb3dlcjUs
LW1jcHU9cG93ZXI0KQ0KPj4+Pg0KPj4+PiBTbyBiZWZvcmUgdGhhdCBjaGFuZ2UgSSBnb3QgLW1j
cHU9cG93ZXI5DQo+Pj4+DQo+Pj4+IE5vdyBJIGdldCAtbXR1bmU9cG93ZXI3IC1tY3B1PXBvd2Vy
NSAtbWNwdT1wb3dlcjkNCj4+Pg0KPj4+IEkgZGlkIGl0IGxpa2UgQXJuZCB3cm90ZS4NCj4+Pg0K
Pj4+IEFuZCBzZWVtcyB0aGF0IGl0IGRvZXMgbm90IHdvcmsgYW5kIG5vdyBpcyBmdWxseSBvdXQg
b2YgdGhlIHNjb3BlIG9mIHRoZQ0KPj4+IG9yaWdpbmFsIGlzc3VlLiBOb3cgSSdtIHJlYWxseSBs
b3N0IGhlcmUuDQo+Pj4NCj4+PiBTbyBJIG5vYm9keSBjb21lcyB3aXRoIGJldHRlciBzb2x1dGlv
biwgSSB3b3VsZCBwcmVmZXIgdG8gc3RpY2sgd2l0aCBteQ0KPj4+IG9yaWdpbmFsIHZlcnNpb24g
d2hpY2ggdGFyZ2V0cyBfb25seV8gZTUwMCBjb3Jlcy4NCj4+Pg0KPj4+IEFueSBvdGhlciBzdWdn
ZXN0aW9uPw0KPj4NCj4+IEkgc2VudCBhIHBhdGNoIGJhc2VkIG9uIHRoZSBUQVJHRVRfQ1BVIGxv
Z2ljLCBkb2VzIGl0IHdvcmsgZm9yIHlvdSA/DQo+Pg0KPj4gQ2hyaXN0b3BoZQ0KPiANCj4gUGVy
ZmVjdCwgaXQgd29ya3MhIFRoYW5rIHlvdS4NCj4gDQoNClRoYW5rcy4NCg0KSSBzZW50IGEgc2Vy
aWVzIGluY2x1ZGluZyB0aGlzIHBhdGNoIHdpdGggeW91ciBjb21tZW50cyB0YWtlbiBpbnRvIGFj
Y291bnQuDQoNCkNocmlzdG9waGU=
