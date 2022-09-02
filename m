Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CB5AAA69
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJs0y2fDWz303m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:44:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pqmGe5EP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pqmGe5EP;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJs0B1CLpz2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:44:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFQuqtHRIJnW4L+i2QKCrYsrtkgBf6acFNEpZn3GabNLKnr81TeRvRgzKS2Ppnpnh86YQSFjSC1jin3IMtNlPZi/TBeUsH05M9kbJuf7ws2rfgKg9zbYNyXthnE8gHKD5Sfd5PPyUfQ6uB+k/51DbMafOeVFfOXqtcrsqdMdOLkp7vgh1TCMMF0Gor3GCI6ipQhxQrE5qp/xsB/VjNMhW4pqVDDZ91E94i+Chi0Nr8xnZwbkxsR1L0QlNnri2/eQCFe3GlKZdDAB0whO7elf22rvVRvxzObxpFV84ccUNuXwsDt1/cXgZCfKNqmwNnarIEfFVrrrQbnCB4dyIwrffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuogpeKNtwJkC0S2BSKGZQ97Aah9bmH4w9hHO0n+tm8=;
 b=l5/KhWeqNvoAqSol0un3UYnQBNLJZCR/AJ8fhyJGUqdCMXnhyMW08r5Ztrj58KZhG9abdHgrx/FfNj6CMgiJHOgrVzexMY9ejEWDkJ7+2g5gp6naMEIHeX9vFeeIxg8RUzmoFuGSqO1Zk5Ep7L53GbWKqI6ykqINVyqGGI3gu/tF1aOzzG48SE1Mfo2eAtRP+O0fjc/Da7kbLHJPR5EhUwKeRQv11+TxXTCYSUXM9pBPMVp5oFFbgA+qEEUcubiMNLsYoRREDh398bbKcIg7dS7Sj0pi2n0ctpM2fbJ9p0ktA2tVn0zdgkweigDS+l5yU/uBZzk5MLaANE5Y7NuvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuogpeKNtwJkC0S2BSKGZQ97Aah9bmH4w9hHO0n+tm8=;
 b=pqmGe5EPSjVYYVqVIRyicac5uMD5+h2apya4LdYaEljsoFXPSm8Q/QuZXZSrH+KawYc55mxXufjQfmXIfuVZTnTqYF44epufgbU+6TrDHMfREwgUudbXyeCXNA/ZR73e5jKU5EXJQFhnSFO3rGNhssQae2RnrtR3AF8jor2ZcxXNJBBI0YItsWeVV7zluO1+3pMk7pmrgMhm0rGWe+qtySoxq+Ysk+HY0LWegCyOn0hD/PuzHV6xAn+NvYGyqj1FGxGYCN72Ub37Vm05PZVqG/7yMw3T8AJPgRDRgM4z6UkPKbBKO2U5lnINpOpOb5Z0+7YlnkqS5CgOLMF3VU3/sQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 08:43:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:43:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/math_emu/efp: Include module.h
Thread-Topic: [PATCH] powerpc/math_emu/efp: Include module.h
Thread-Index: AQHYvU1fVuBGpeT/bUClAFoMJyinta3KEF+AgADsP4CAANkDAA==
Date: Fri, 2 Sep 2022 08:43:49 +0000
Message-ID: <ae2ee2d8-ec0a-d0ab-2c5a-b9a8c7579093@csgroup.eu>
References: <20220831152014.3501664-1-nathan@kernel.org>
 <efd56f3e-bc8c-5da5-559d-e0bc6b21fa5b@csgroup.eu>
 <20220901194705.GI25951@gate.crashing.org>
In-Reply-To: <20220901194705.GI25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffa52bb3-b808-4ad7-f87b-08da8cbf41b1
x-ms-traffictypediagnostic: MR1P264MB3060:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Bx6BzAMTof6DktWvjH7yyImJIu2XRs2ddIKjtk5BRVjAr3D+t57USaTFXDckGaPbu8vYYchIOdbOzZY5v/vBEigQ0yY9TSeLOYXCyFaVe+feB8S9ehCekCHRb5vOT+yS9kJHrRfVRgxKMqxiGLRJGPw7kj25yy5HvS5kI8u+0XBvlfoQIG0wJN/4ghq3x7scO0p3N3Mm4aStUbqKydx7fMrZ9xQ3O7dOJLidrfOJ+Qq1q3qPPibsi5oJOUqp9O2UNXDO9iym3L8x0kZuPpf0mEGc49Enf7Y8fCvvOEBsVed9RWkS+Z4PxGTbPiQ4/w1Z/Aqtl29T3GLPUpDytJR8qsvpdmHRxzU5lJqmS+MsIEoKwbxiTJ/okzXGdIEiH9Z4eRBraTLOm4kqd2sDf28JvqbSBDuwlcgYXsNh0TV3gM/vbuWjJiY0oq1toVrBC4COl5azMKvuKn2GBX5qTUNfN/0p0ezjvDmJ53FubC5f/mqHwjXOy7JwTWEug/SVnQAw8jO7FXsk2pMhGxLyI1f8d8ARE12fg090L+GF4083oKsHMGKUkPLTIg24S9ggd9bYmM2V4PhXtbt2aqo/xNCxkiMEEYdFi9aOkEls6n3jaOt17zWEEZ4JsVX1PRei9RMf29Cay629XUdhDSkp8+7j2RwAxJ5rCSDL0oQ+wJXemHg4vMKXY2nFR2zmONA54hqws7yP7Tu3PxKYY4po7LmFhflU6d3mGpEZBriQQEvYFqNB154ZWzL+BQBY7E8ZeA9pd8uYBEeYPM7a8ZUP6UrCGDFrFmW57HpIvMW4iteoo1dHr6e7FPiwKzvTW464kNODcEQPkRTIpUTbNm7X7TMrbPRn7lgYF+pXbp/DQ3FxE9A=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(31686004)(38100700002)(6916009)(122000001)(71200400001)(36756003)(83380400001)(38070700005)(316002)(7416002)(54906003)(5660300002)(41300700001)(4744005)(8936002)(186003)(2616005)(66574015)(44832011)(6486002)(6506007)(31696002)(86362001)(6512007)(2906002)(26005)(478600001)(64756008)(91956017)(66556008)(8676002)(66476007)(76116006)(66946007)(4326008)(66446008)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cmFuZm1wR0Fta3ZLSW05ZlVtQnppS3dNQS9DaVJKU3I0aW9kbU5yUnA1VERP?=
 =?utf-8?B?bTBXRVNUSjhZOW5Ta0l3Y2h4UUp2UEJ0QW1lVGJQR3dxTXBRcnhoTTlHN1lL?=
 =?utf-8?B?aUVEUzZkY1ZLakVkZ0tjNzdsbE9pQmZMeGxWRm1KQ1FPUGZHUHlMZzFPNHdh?=
 =?utf-8?B?Vm9lNW9JczZuZUFIMFhEZjJRaWcxK0VqcjZ0Zi96VXFkUDJLM3orTW9oYWlZ?=
 =?utf-8?B?c29EUHdOUXYvUEw3SW9rNWxqTTJqWUN6d2Zxa3BuMGM4VHFIVkpFa1hKM3ZQ?=
 =?utf-8?B?QkV4bE5JdmVBamVMZkc5OWdIN1c5c1R4OG9qeTZER3RVZFVYTStiQW5RUjJv?=
 =?utf-8?B?b2R2OVl2RlRUa3RGUExOQko2SUJxdkFtZ2pkWE53cmx0c0tXQWIwakorVEZS?=
 =?utf-8?B?ZTlnampManRUZEZ1SzJoSEx2blcrVXRUNmROa3R2SHl4S1VEckI0WmU0SGNW?=
 =?utf-8?B?cStaVStRa2VyZjF2a2IrejlNQVYrUGhyMTcyb2FLS0tGWWw1b3RwQmoreEtp?=
 =?utf-8?B?V2xVQ3NmK0N5T25pQXUxNUV1VUZwQUlpdFpDUVNOeUpPY0ZuZzYzbk1JSS9k?=
 =?utf-8?B?RWJhSUhHOWxOMGpsb0JYTmZ6UGFQWkFhNE9Ha2lRV0V3alRqbEJtRE9ORFRj?=
 =?utf-8?B?UFF1bW8xQ0Zsano0Y0NuclFTbGdwYS9qb3IwcWRoZ0JCYmR4bElnNHordEx3?=
 =?utf-8?B?SWdDRDBySG9NUHJzQ0syVlNHczhXTUphN3pwUmZpWTNyZ0YwWWxtWDExR1Rw?=
 =?utf-8?B?c3ZIbEwwdFZsa0doL1JsN05lM3BuWlRyV1dvMUJ1dVEwUkhVV0ZMOE01K3JF?=
 =?utf-8?B?b05IL0l2ZXFjVHBJdHptM01hRUVoOVM4SG1yV0liSzUxQXZvSXI4cm5RTVlv?=
 =?utf-8?B?OUV1cGRzUzdFV1NUOG9aL2ZIV2lDUFpDY3M0YVpoSFFFamUvSUp3OUtQQm5m?=
 =?utf-8?B?bmxiN3RpM2cyeWhGcGRIaEZhbzZKRGRlQnp1ZEovY2EwRElDTkd0UDk3OUZs?=
 =?utf-8?B?bm43SnRJbFZITU92OWF2VVNZVHdQK2JjYnp1dnBrd2NKS1ZaYTN4eHhUTzNJ?=
 =?utf-8?B?NGNwZWVURmJPU3ZZbllnRlZJQTBmZWJJRGRrSE1iTjdCSTZWWFQ4OGxDSHE4?=
 =?utf-8?B?R2xQRjFoWjBFVXE4V3lybWg3d0ZZSXJQdGNMR1lUZC9VdHR3WmswMVBkTTlM?=
 =?utf-8?B?Y05UdlMweXVkWE9OREV4N213cHZGc2ZMWDl5elVpcVdZWU1Sc2o2a2UzRmdn?=
 =?utf-8?B?aE5jZ1dsS1hmRSswb3d0RHRxSEFjUEoyRWxjMEZpUVhrYWJUeUppTC8xRmlF?=
 =?utf-8?B?bWtGTHFBSDNySVlvdHVUV1hKRXFlR0M4TC9YeXVBSXNzenBhVDRrQU84NFZW?=
 =?utf-8?B?UkFBc2VTcVFWYTliYzRyUEs5OHhSVWRvRkEzMXg4UTVMVHh3T0V2Und0RGl2?=
 =?utf-8?B?RHNONlM2OGp5VnJMbG5DR1hDQTFmcDB3NldpTWluVUM3VXkvLzVhZkhURkRp?=
 =?utf-8?B?djVMU294QVRSWi82SENZd0ZoUk1yQWpJYkQ1Q2h3c2JhUjNZMXA0azE5NzVZ?=
 =?utf-8?B?ZTBKdDhmUTFlSm81RHdQMVYrbHNia2t3TWdFNlBjUkRLMXE2NmhCcTZyU1pO?=
 =?utf-8?B?bVhkL05kbDJlYXlMTmxkeVFFekJQODdzME4zaitBcFVIRFZMSkpyNE93WWcz?=
 =?utf-8?B?d2l4ZzFzZGgzMFpmeWZGZmZhM0ZBcVVURDRkZUYrNTBoT2FGSVVsc2ZFdzI1?=
 =?utf-8?B?M1MveTNjK3VhVnVOWWJscCtDbjNkeWdBTXM2SlVtQnlOMXU5azZvNHVYRFpK?=
 =?utf-8?B?dStXU2kzMyticklYeDdHTHA3UWtLMzNiSkhUem1WdkE4bHRKYjFJWXJYdHVr?=
 =?utf-8?B?K3RsOGtjNm1NNENJRlhuRk92ZDdkWFFzK20rMW5YY0pSZnZXYzY5eGp4VnQ1?=
 =?utf-8?B?MGdvOW5nUnJia3pLd01YSUVDc1ZJYVVaLzBXS3hRKzVaVThGK1ZKT2dwWE14?=
 =?utf-8?B?Z3IxK3lvNW1teExhMEJmRWtHOWNoZWk5MFBIK0MzNkgyRXpybXUzbzRWdTcz?=
 =?utf-8?B?STlUNFlEOE1Pa3o1SGc5QmR0K2lQNXNvQkdOSkl6S01TM3FuUDFNSjFxN000?=
 =?utf-8?B?NXdkeXNkTGMvdTIxaDdLR2JzQW9mUHA3am5lNU1OQXIwc3pnM0tKaGVlVzM3?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF55D5A8E394804A99E225A262959DEA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa52bb3-b808-4ad7-f87b-08da8cbf41b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 08:43:49.4702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xvTjGBA7Igc8akI+P2gOwWzk2maFwISvqOTgCNnQVq/oOQ/Jz5XyEDVYTM+uN3aKqdjveOVDyepZ0jxAZgApP5u9BPBCE4eiiRC1wC1VMDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3060
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "patches@lists.linux.dev" <patches@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMjE6NDcsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBUaHUsIFNlcCAwMSwgMjAyMiBhdCAwNTo0MTozM0FNICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gSSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aCBhIEdDQyBidWcgcmVw
b3J0Lg0KPiANCj4gV2UgbmVlZCBhIHN0YW5kLWFsb25lIHRlc3RjYXNlIGZvciB0aGlzLiAgV2hl
biB5b3UgaGF2ZSBjcmVhdGVkIG9uZSwgYXQNCj4gbGVhc3QgOTglIG9mIHRoZSB0aW1lIHlvdSBk
aXNjb3ZlciB0aGUgYnVnIGlzIGluIHVzZXIgY29kZSBhZnRlciBhbGwuDQo+IA0KPiBXaGljaCBp
cyBhIHZlcnkgZ29vZCB0aGluZywgaXQgbWVhbnMgdGhlIHByb2JsZW0gY2FuIGJlIGZpeGVkIHNp
bXBsZXIsDQo+IGNoZWFwZXIsIGFuZCBhIGxvdCBmYXN0ZXIgOi0pDQoNCkVhc3kgdG8gcmVwcm9k
dWNlIHdpdGggYSAuYyBmaWxlIHRoYXQgaGFzIGEgc2luZ2xlIGxpbmU6DQoNCm5vbl9leGlzdGlu
Z19tYWNybyh4eHgpOw0KDQoNCkFwcGFyZW50bHkgdGhhdCdzIGR1ZSB0byB0aGUgLXcgb3B0aW9u
IGluIGFyY2gvcG93ZXJwYy9tYXRoX2VtdS9NYWtlZmlsZToNCg0KCWNjZmxhZ3MteSA9IC13DQoN
CldhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBkMmIxOTRlZDgyMDggKCJwb3dlcnBjL21hdGgtZW11
OiBVc2Uga2VybmVsIA0KZ2VuZXJpYyBtYXRoLWVtdSBjb2RlIikNCg0KSWYgSSB1bmRlcnN0YW5k
IGNvcnJlY3RseSBpdCBtZWFucyAnaWdub3JlIGFsbCB3YXJuaW5ncycuIFRoZW4gaXQgc2VlbXMg
DQpDTEFORyBkb2Vzbid0IGhvbm9yIHRoYXQgcmVxdWVzdC4NCg0KQ2hyaXN0b3BoZQ==
