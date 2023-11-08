Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAA7E5E7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 20:25:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EJWUjvvt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQZml5qNxz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 06:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=EJWUjvvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQZlr2zTkz3cQr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 06:24:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwMe9LIUrRY+MtHLNfmphTmkrn9/0XCazHhu4wdNh4rJEZ7it1WQ6p1xo6X7Ay3xKOOb/ZHiKCE2Fjt8Cf4uGZ4CJ72iFeIYKOoYuhrEVg3A4w76ahlAW4zp/YdzOYuZg9LTYUZvwGFV9iQTvs1mar/1MBjMRj0jxIkIswbSWMCloxHPxEIOs+kB0CgH39XzRwkoOgD6rCkQiOfYuN4E1zD2hRUYOcwsD7rZsAg2klZQAdaJIP86ANTRwGhKohQC6RtYxWe8EazdJzKzFwpsZeQqb5zI4BqP0NrHzyeY5hS+2jCfQNW3rN1pZStJmkvU6Nc2P6pGxBATHOhZLivQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DwVb8YhuxsuY/xYee1qwV/5adninlJEEhT+pd7LjBg=;
 b=BGwWet8GYCndVDesaKhXAtVYcAvmI9tpOxj1ImsAInO62+y5qjQzJETNsFKIG8nq+oVdTRkYVAPNDdNGbSwlMKspS6Nq++sMqRe873DQYINNR6FFXfNfpxLcpHLQREbtnG0Pm4E4vhpnXoEvlNFx1Q69T0XYnkOdU1gk8DcC4GDdaMecJsQm1tpgz85eDsCwMZNcqHDlzQMY+1RSr1kPz7rMSyLpyPYC1+czvIFwBYJip24WgamdFNEsSEObi18mLLlnrdGyYRU9EuRJV0/RXjYWBx5DII45kKzWxpq9myd+fdpZezGt+Yjkb9r1kkfCT0WWa6lVyCCroR7ZIQTVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DwVb8YhuxsuY/xYee1qwV/5adninlJEEhT+pd7LjBg=;
 b=EJWUjvvtSiBUxYpMhRFNmYHpP17LmJjp37alMl4WFOCh7LCXM1U2B48Vjve/6OiJPiWT8GfpWG4BA+AtL9Mnz8qyZGRCotJjDb4JTHZPwCqQF+amt4YGKYSQbjL8F979/3AlJSzcREBxYiaxmzCPx1+MxYLDaVAmu9+hFmsY9tu9v1+hVKO5jgvbnainUWLzbFtQIX4iFfiwICQrNvQTjM8984slp5cXXMDSz9G8thHWToj7y3l5bU20ak4G/PiBf9YKZ66QS1cHfFeDdsX6MHIjWt5V1pLjNA+W95P09O0d8DSSYv36Wrt6zXhs/IBTiiNDOkcFhCUYM/4mO1a7ng==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR1P264MB3430.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.18; Wed, 8 Nov 2023 19:24:19 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e5c9:fb7b:3f79:6420]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e5c9:fb7b:3f79:6420%4]) with mapi id 15.20.7002.007; Wed, 8 Nov 2023
 19:24:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Linus Walleij
	<linus.walleij@linaro.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Fix signature of pfn_to_kaddr()
Thread-Topic: [PATCH] powerpc: Fix signature of pfn_to_kaddr()
Thread-Index: AQHaELdeM9zt+kl/UkGgrMvMv/szTbBuXTMAgAJzsoA=
Date: Wed, 8 Nov 2023 19:24:18 +0000
Message-ID: <f759f7c1-7795-f444-f531-c76a9f0ef8a2@csgroup.eu>
References: <20231106-virt-to-pfn-fix-ppc-v1-1-93197a7ccab4@linaro.org>
 <87ttpyw1ez.fsf@mail.lhotse>
In-Reply-To: <87ttpyw1ez.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PR1P264MB3430:EE_
x-ms-office365-filtering-correlation-id: 3ae0d7ee-435c-4331-e18a-08dbe0904df7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gZThWTyJ3paxmqA6uvKwg3FspBlYA3cwqygCWgWJQKQO9nkd/X+E7LB/KKCk6KOJhNi6G+mtuoWfV7RPWPO2Ts7xNvN+46+aVwMGe1EJUThcJpzoGcIh7qBFhYEqXPTD2nEv8U0XQuQoQmSEb7u1MYoJnaz6GrniXQF0URUQiDgKYJg3zewHQwgxRot7PFVMShoYMRuQ9yIz/8cW+wD/4/W4s8ZoAVXKaBbbKRXiYui+6lTQ8RZE3ZccohqS1xsH6ZtWgkVvieOIUFizHVl5ODCZPrWT1qsFHerr0VPeMAoXibQ42GoJFeBVqIRhQ2sUJf0BVsC9+gkrARbWY4sUbplcnMm6CcFD7uTm6ZhZj0Q3xsdXIGITyKoCllSln3IrfAm/Dmtrgf8gB+gy5MttnXldZjy4I6ev1uZuYU7ty/3rKNl5z/f7Qf8A4NiE7TXvft9YyE//FWAyxqOnmS8jfkkX/RB1+JI1m1butoomS/UwlAsia/hn4GoeUHUwIjtP0eIGhrqvCkDXC2TKp5u69hqIjalI0gD17lzx6u2r016FVCEZnoJ9hnUK/B9vNMnDbUNs9ncdixQtmu8mawJ6xfdVySwEf+kEeqGOH6FWYe43vCF+aG333Dap+Y3q4oj5L8Pam5uTnZkkNQIUPv+CclqY4qwxtMHYd5mKrZwMFGKgue9OJcpKdBf7WwO55J0foxiGrMc0peDN45yLUjwKVA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(8676002)(31686004)(6486002)(478600001)(966005)(4326008)(2906002)(8936002)(5660300002)(41300700001)(110136005)(91956017)(64756008)(54906003)(71200400001)(122000001)(316002)(38100700002)(86362001)(83380400001)(31696002)(6506007)(44832011)(26005)(66556008)(76116006)(66946007)(36756003)(2616005)(66476007)(66446008)(38070700009)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RkJjcWlNaXNVbnkxSzRMYlc0bzd3VE93dkRIcTJWTWNyNkJuWXMySUtrak9S?=
 =?utf-8?B?ai9IS2dyU0E0SUFwY3piYlByMzlCRER6dHVkMkl5a2NmVXA2bHBacXRQMzhI?=
 =?utf-8?B?VDYwMXMyS2c3c1NZYUlFU2VSSTlSMlQzZkRsQ21zUVpiV2c5blIzZ09QYVpL?=
 =?utf-8?B?aVJqc0YyVkJlbmhXR2hlV3N0bGI1RVR0bW0yeFRTa29SK3YyYmt2Mk12NG1Q?=
 =?utf-8?B?VkFMTHVadFhnTStCcDA3N0hQMHgxNWJkd2RRd0orcysrS2FtUmd4Y21BcTBi?=
 =?utf-8?B?b0QwSnZVMjhOL1RxUTdNZGNRK2gwREN1eURBUUZBYnZCMm92VFhCMUJTaUs1?=
 =?utf-8?B?YjNyNkdBajRTMFEzRG1KTDJzMkJiTmVadVhoYmUvTzRNcWVmL3J4SnBnUjVl?=
 =?utf-8?B?a2pLcndrRk04am1MTjRNOXdzNVVpT0x0am5zd2Jkc2Q3RW5RMURrT1NNdFpk?=
 =?utf-8?B?NFNxbWtQQWpsd1d3dGRMSnZDNW9QYkRlZEhCOHdDU016OEg0RjlLcU02Vm15?=
 =?utf-8?B?ZFg4QjNZWiszcDFWcU9JUGhUNmJJRUNUUTZnVFpWeDZZWlE1ZGhZVkZPalJs?=
 =?utf-8?B?dTFtNnFnZkhiYjRvSzN4dlZ2V2lrb0FJSDg1KzVneHBwUVpXbmdIQ09GYkJs?=
 =?utf-8?B?MlMzemI0eUtCRU0vYzdpYUpqWVM4eGZUajVBbktGUlhrbXNGN1N2dEU3dnU3?=
 =?utf-8?B?VXpuRXNjYjdJM3VSeG4wZy83WTdYTS9nR0kzdjRqMFZxRGFhekJCRXRLeTM3?=
 =?utf-8?B?UHVmUmJ3MUJBZVNCTC9LZjNnUGNleVZ1N3NYTVZCRW43VDRxTjdYVGNJL2JS?=
 =?utf-8?B?bG5YRjVuY29QQ1hVMnI2bHQyUFpUSnNBeFBlN2tjNTlKOEFUMmJBZzdZZlBS?=
 =?utf-8?B?YVlMNTdvd0Y5aEU3Nk1pOS9yajNrbGZCTXZ0SENBU2tJWVBsOC9VVU9vTHZP?=
 =?utf-8?B?VWZCUFB3Nk0zY3ZBOUtLMG0vcDB0b2JFMnJFcWNNNVdISjZJRFJhQW5DWEFk?=
 =?utf-8?B?eDJMR2IxT0RRMnA1Rk1HUG8wcmV1S010M1BIdVlPKzcxOU5CQkg1NHFoTnpC?=
 =?utf-8?B?U3VERE0vK2xubnE3bmdsMWFpRjdTU1pIVW83aVdLRjVMK3NKVFIwVXVSeC9R?=
 =?utf-8?B?aHhPNXVKTXFBVUQxeGtKalNFdUJMWVZ6UTZySVJhRkhGVGw0L0RsY3Fld1Rk?=
 =?utf-8?B?TEtnbHZzZzFmQ1Y3K3FLcUVCTnB2T3I1bzRUNlltRkp3eHY0OUk0N2o4RzRv?=
 =?utf-8?B?bWNhTThHUHFic0VjNnlXYVNvMmpPRHJ3WEd2WXN0N2Z4VEg3ZHJzb0VIY2R2?=
 =?utf-8?B?QkUxcGZzT2lXZXlYZFAyL1hpZTNXdVNaMFBEZnZLWjFaL2xPVVcxTnAzU0V3?=
 =?utf-8?B?K0dCOGNQK2hCa2pCREg3eVpud3psVi9MTVdEbXJNVDEvV1ovbVhrWnIyajdh?=
 =?utf-8?B?REp4allEWmN0VGtXZ2YzamFPMDZ5S0dia3ZoTFpTVEhocDdlSlozckk2Zmpq?=
 =?utf-8?B?aU05OE41VG1IMU9wZmhlMGFKbTNGVVBRcmVkMXJTQnhmeDJBblFqLzhDc1VR?=
 =?utf-8?B?akExeFNwa0JpLzVoUThFREI4YWNHY3A1OUM1aXhkTndXbFY2ZEpmRUNockdz?=
 =?utf-8?B?Tmg4M0lBTkpqa1h5TlRpalM5NzAyaDdzVnQ2Q2c4Kzd5d3NlbGdzL0VIYjdC?=
 =?utf-8?B?Rk82SStaUkMxdVM0OEZyaXgrd1dTekczeTZ4M0Njd0R3ZnQrZitNeUhVTlJo?=
 =?utf-8?B?cjZKbWVDbE50RTJXOUxMclZrNHp6S1hFT2kzS1NzUDZSQ3phSFIyYlp5emhx?=
 =?utf-8?B?YzYwR0k4aDNVL0lIRUlBSW5hY01Ed05ZRlNyODd2SEdjRjBxaGtxYmx0N0Rj?=
 =?utf-8?B?STdiT2M4WlUvRHJQVkJ1SW9NVmVRcDl5OE13WjdmOFk3aURmYmh2SFVFRk5t?=
 =?utf-8?B?S0NGd2ZCNjJ5aTNvTTdiNkIvNXFWOE02RTU4TEtheTQ0aFpFNm15Z3VSRENK?=
 =?utf-8?B?UGVsM29NYkx4WFV2TTY1c1daSm5mUGxIT0w4NFlMUGdjdnZjTVozdzFEVHJw?=
 =?utf-8?B?eHNnWWs2Wk0zT05SRVg4NWo0NUtLZDZhTzFQQ2k0NnJ1TXNkVzQrSmFIaG9M?=
 =?utf-8?B?Z0tkUW5iTW1SQzcxNm1lUEdiTGtqYjJsSXo3YnYxcFdXWGVOWXd6anJLZDhI?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C21D789BB6617C4E87FBBBF8D16DDAFE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae0d7ee-435c-4331-e18a-08dbe0904df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 19:24:19.0307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/laF2jsvb9zXug3+l2JLT9/aNRmVzkQDPstnIdxV5kXDkSD3lKZwCsCeyHw/u112RtAiKSti//jzq540lvs27r1fcx3UouzeDWVLjf/rtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3430
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzExLzIwMjMgw6AgMDY6NTcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+PiBU
aGVyZSBpcyBhIGNvbnN0IGluIHRoZSByZXR1cm5lZCB2YWx1ZSBmcm9tIHBmbl90b19rYWRkcigp
DQo+PiBidXQgdGhlcmUgYXJlIGNvbnN1bWVycyB0aGF0IHdhbnQgdG8gbW9kaWZ5IHRoZSByZXN1
bHQNCj4+IGFuZCB0aGUgZ2VuZXJpYyBmdW5jdGlvbiBwZm5fdG9fdmlydCgpIGluIDxhc20tZ2Vu
ZXJpYy9wYWdlLmg+DQo+PiBkb2VzIGFsbG93IHRoaXMsIHNvIGxldCdzIHJlbGF4IHRoaXMgcmVx
dWlyZW1lbnQgYW5kIGRvIG5vdA0KPj4gbWFrZSB0aGUgcmV0dXJuZWQgdmFsdWUgY29uc3QuDQo+
Pg0KPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4g
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMTA2MTk0
MC40cEJybTQ0dS1sa3BAaW50ZWwuY29tLw0KPiAgIA0KPiBJJ20gc3RydWdnbGluZyB0byBjb25u
ZWN0IHRoZSByZW1vdmFsIG9mIGNvbnN0IHdpdGggdGhvc2UgYnVnIHJlcG9ydHMuDQo+IEl0IGxv
b2tzIGxpa2UgYWxsIHRob3NlIHdhcm5pbmdzIGFyZSBhYm91dCAweGMwMDAwMDAwMDAwMDAwMDAg
YmVpbmcNCj4gb3V0c2lkZSB0aGUgcmFuZ2Ugb2YgdW5zaWduZWQgbG9uZyB3aGVuIGJ1aWxkaW5n
IDMyLWJpdC4NCj4gDQo+IElzIGl0IHRoZSByaWdodCBidWcgcmVwb3J0IGxpbms/DQo+IA0KPiBU
aGUgY3VycmVudCBzaWduYXR1cmUgb2Y6DQo+IA0KPiAgICBzdGF0aWMgaW5saW5lIGNvbnN0IHZv
aWQgKnBmbl90b19rYWRkcih1bnNpZ25lZCBsb25nIHBmbikgLi4uDQo+IA0KPiBzZWVtcyBPSyB0
byBtZS4NCj4gDQo+IEl0IGFsbG93cyBjb2RlIGxpa2U6DQo+IA0KPiAgICBjb25zdCB2b2lkICpw
ID0gcGZuX3RvX2thZGRyKHBmbik7DQo+ICAgIHArKzsNCj4gDQo+IEJ1dCBlcnJvcnMgZm9yOg0K
PiANCj4gICAgY29uc3Qgdm9pZCAqcCA9IHBmbl90b19rYWRkcihwZm4pOw0KPiAgICB1bnNpZ25l
ZCBsb25nICpxID0gcDsNCj4gICAgKnEgPSAwOw0KPiANCj4gICAgZXJyb3I6IGluaXRpYWxpemF0
aW9uIGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5
cGUNCj4gDQo+IA0KPiBIYXZpbmcgc2FpZCB0aGF0IGl0IGxvb2tzIGxpa2UgYWxtb3N0IGV2ZXJ5
IGNhbGxlciBvZiBwZm5fdG9fa2FkZHIoKQ0KPiBjYXN0cyB0aGUgcmVzdWx0IHRvIHVuc2lnbmVk
IGxvbmcsIHNvIHBvc3NpYmx5IHRoYXQgd291bGQgYmUgdGhlIGJldHRlcg0KPiByZXR1cm4gdHlw
ZSBpbiB0ZXJtcyBvZiB0aGUgYWN0dWFsIHVzYWdlLiBBbHRob3VnaCB0aGF0IHdvdWxkIGNvbmZs
aWN0DQo+IHdpdGggX192YSgpIHdoaWNoIHJldHVybnMgdm9pZCAqIDovDQoNCkkgdGhpbmsgdGhl
IHJldHVybiB0eXBlIGlzIHJpZ2h0LCBhbmQgY2FsbGVycyBzaG91bGQgYmUgZml4ZWQgdG8gYXZv
aWQgDQp0aGUgY2FzdCB0byB1bnNpZ25lZCBsb25nLg0KDQpBcyBhbiBleGVtcGxlLCB0aGUgb25s
eSBjb3JlIGdlbmVyaWMgY2FsbGVyIGlzIGthc2FuLCB3aXRoIHRoZSBmb2xsb3dpbmc6DQoNCglz
dGFydF9rYWRkciA9ICh1bnNpZ25lZCBsb25nKXBmbl90b19rYWRkcihtZW1fZGF0YS0+c3RhcnRf
cGZuKTsNCglzaGFkb3dfc3RhcnQgPSAodW5zaWduZWQgbG9uZylrYXNhbl9tZW1fdG9fc2hhZG93
KCh2b2lkICopc3RhcnRfa2FkZHIpOw0KCS4uLg0KCWlmIChXQVJOX09OKG1lbV9kYXRhLT5ucl9w
YWdlcyAlIEtBU0FOX0dSQU5VTEVfU0laRSkgfHwNCgkJV0FSTl9PTihzdGFydF9rYWRkciAlIEtB
U0FOX01FTU9SWV9QRVJfU0hBRE9XX1BBR0UpKQ0KCQlyZXR1cm4gTk9USUZZX0JBRDsNCg0KSSB0
aGluayBzdGFydF9rYWRkciBzaG91bGQgYmUgZGVjbGFyZWQgYXMgdm9pZCogaW5zdGVhZCBvZiAN
CnVuc2lnbmVkX2xvbmcsIGFuZCB0aGUgY2FzdCBzaG91bGQgb25seSBiZSBwZXJmb3JtZWQgaW5z
aWRlIHRoZSBXQVJOX09OKCkNCg0KDQpJbiBwb3dlcnBjIHdlIGhhdmUgdm1hbGxvY190b19waHlz
KCkgd2l0aDoNCg0KCXJldHVybiBfX3BhKHBmbl90b19rYWRkcihwZm4pKSArIG9mZnNldF9pbl9w
YWdlKHZhKTsNCg0KIEZyb20gbXkgcG9pbnQgb2YgdmlldyB0aGF0J3MgdGhlIGNvcnJlY3Qgd2F5
IHRvIGdvLCB3aXRoIG5vIGNhc3RzLg0KDQoNCkNocmlzdG9waGUNCg==
