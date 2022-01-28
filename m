Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E7349F6ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 11:14:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlYGy2XzDz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 21:14:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::611;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::611])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlYGT0H4zz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 21:14:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahkBLrjoMtfkEhnVjBg2ryXNfAwKCq3LG+afUDx3YMBZaHax/S39yPgOCTAjsTBXp+seIBuFbEtnzI1m34r+uje5KVJl4nKfZFWLAkr1jnPy7cMcY4IHFlLHvyVGV4deXW7MOY2oRDeAs6wUuU51DGZPI7TJiM66+luLupijkwCWNE9w0VFgQ/rSBV9zQnARvzXSO4ToNHsVKZxGbrDoAMFDO3/pwZxgIyhww5w2S/PIbsxktLtv96U29CiSBSPwSSajUNLvoHOeoX9XxJ7S9kbWISN7AWerXNbvD6gmSW0BJf+/RPidbY7yuMNY9Ev7fIiuc5XrE145M//bXT2zhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqTheF5Mhc+YK+x367EBC1ZpAv/3lytUNMm8A9kss5Q=;
 b=HlFR3ypOFDy/35ML57pDcQr856QxRiWT3yM9LSZNcVw8IqMiJ/w1imEIomI1UIMJ64zlKlabE5Uf10lb/XmMylSLdtZnKC1/UV0Vk0EP2jjJk3YN19ctbjZzv2M3/m7hkJrkVuhsGDMyvmvJLzh2P3apYCJErQF6moTpIHsKjEXFZ8OwO7OWx3IN1CkBbVkM0zmEPKfIX3FU4D1PADNvN+lLp3htc/I1M/fTtSUFl/UrZNpp7wOFuAoKd3pwlfjW4UXTIderxS8AM1wdE7fZ5ZrwmebEAUmRQpq7KqtMeLJR4cZSyyl/4VPZncHYfUNfpcvz58EB4CpVEl6LZeZcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR2P264MB0669.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Fri, 28 Jan
 2022 10:14:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 10:14:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anders Roxell <anders.roxell@linaro.org>, "nathan@kernel.org"
 <nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>
Subject: Re: [PATCHv2] powerpc: mm: radix_tlb: rearrange the if-else block
Thread-Topic: [PATCHv2] powerpc: mm: radix_tlb: rearrange the if-else block
Thread-Index: AQHYFC79zIlQVYkk+Em8tbZv733hEax4NyyA
Date: Fri, 28 Jan 2022 10:14:02 +0000
Message-ID: <c6beb8a8-ecf3-1c17-f685-f5e69cd6265a@csgroup.eu>
References: <20220128100815.3231551-1-anders.roxell@linaro.org>
In-Reply-To: <20220128100815.3231551-1-anders.roxell@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1621709-298b-49b7-fb09-08d9e246e84f
x-ms-traffictypediagnostic: PR2P264MB0669:EE_
x-microsoft-antispam-prvs: <PR2P264MB06698074D3CFED10EE698446ED229@PR2P264MB0669.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UVB+d9HNcMTBMeSF8Qwjh476yek03yHuNnnkiQ/i8zgLYi+Yf6S/5umc0gkIyz/ZmpgIhTImOgoG07rxTZ642TfRGJxdVuA2o5nOCereL9G+UmS5EJ3m5v5X0W4clEaZocGydcWcYzBSV3UEdnx8At6HgccjHhIltB6R2r8Xd1IEXEa82DEAL1fRGEqciuFAL5GZcVzdnHQ5aIm6ipZEy94f0FppR/W8THTyN4KMuRS6Cfy0kVUsj1DMexLHlncI5vYAhRXBwVge7Kh1XeAHr3iTMCPcQQCsQm5gh8lwoDkZgn+XJORUuZVNI2CqblkcPE/uWzPAhrAzHorhTt28qdh0sALJMKAjODCm6+M9hXO/xCjKT0VOKdCUj371/CaP/CyEh2hvsVTg8QWMYUyw0qpUThR15f2UGRzDqkxFwHne/o6McF481PDckNLIhIrBqU2pKNpPlKTen8fqUxSzeKatCjS99JPN/WEr338dBV3pY6lEcZsLQeHdHgHlJfo37Z+X8COdy0+QDqkb2PGziBdjqueEhBPwMbWPQTEVOeDVuD6TSzGBmsDBeFcTYKZsloZ4SwikXr16sm9VrQSBcyzeXq4/t6lhkT/825nme517sDRz+pg6fQlB6L+Y6d6BiyezJpFHXs/lf/j3B0XJWfCUQxo9mEvKmSmRzRuUk55PuX8t9Y1I4cdeIZ2/4bPIlNMjGXaiMXxewZgtnNMPAUJWXooj2T2mKoqXPThMnhjbj5d5yiSuyBL/+xu1cskLzjvbFXcxMByP1+MGRAuzGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(2616005)(54906003)(91956017)(38100700002)(110136005)(76116006)(44832011)(8936002)(38070700005)(66476007)(8676002)(4326008)(508600001)(71200400001)(316002)(186003)(31686004)(66574015)(66556008)(2906002)(122000001)(5660300002)(66946007)(26005)(83380400001)(64756008)(6512007)(6506007)(6486002)(86362001)(66446008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Umcwa3NLSzg0bnNOUmpYeE5VeUw5MVJ1cGRvc1BCczFyVVRaYmtRRHgxZGt6?=
 =?utf-8?B?QlcxZGZ3STNBZGV5amozbmd4Q21Sa1g1Z2crWkp0NWo1dXlHNXhxOUZzWVpG?=
 =?utf-8?B?V0lSeGgraW12REtQUGpieEFtSVZ4S3RldFFua3IzSXBiRS9YZktDK0sxVU5l?=
 =?utf-8?B?NnBOeHNaOEdEUTlEdjIwYTVkSU9SaUo3SThTU2VaczBRRW1PcXUzN1YzaXpP?=
 =?utf-8?B?TUR2aHZVWndzc0YyQlRYUzMwVVlENzF4Vnk1UDNWdW1wWlVIMGdGMWMrYjZT?=
 =?utf-8?B?a29uTnZudUR0RDluQnB4RW56OS8wS0dzalhuVTJ0emZ5RmFzVFdrdFpFOTVy?=
 =?utf-8?B?T3FZRjZMajJYY0ROMHIvQ090OEdsa09NRVRjdklvNWVaU0czVUwvT09JeWpT?=
 =?utf-8?B?NGdpU3Q3NEdMQjR0bFZLMGxGZjN5U0dKcVl1bmNIaWpxMk53NyszekFVUGZE?=
 =?utf-8?B?cE8wSGN1bVZNNGFlNDdINlRFNy9BRlpicE51cWlUNUtaMDZFdWl2K1ZvOVJ2?=
 =?utf-8?B?MDc0RmNnQVJaRmVPWFlvUC81SDJ4Uno5a0FSMEFRSC9iaE45L0ZyVEdoa2R1?=
 =?utf-8?B?UE9iT01ZTnc2ekhHdlZFaWVLSXhMRm9YMjM3RU4xV21pZVhLUHNOVDZITmxM?=
 =?utf-8?B?Wjd0RUExcnEvcG1lUFJDVlh3eFdCVFgyNHF4ZE9EdFBTMk15cDIxM3BjUlBj?=
 =?utf-8?B?ZVN4R1lyc3dmNDhadVZDeVlVaUdyYlBYY25MYTJ4UW5XcUtsbnlPTjRVRzR3?=
 =?utf-8?B?S3A1d0czQm1GQlltNERIYXF1Y2wwb2tDQUc5WS9ENVdvR1p5R25JSTN2OXVZ?=
 =?utf-8?B?T3JwdFlBL3AzNk9ITFdUcEtwSGF2RkJYbUphQVZQbnZnYmZETk5mOUtmaE4r?=
 =?utf-8?B?TGxQVEFvV2hzblowZzdZek9GWDZaWktpTHo3a3pLcWNUbFdYNGRWVXlTd1do?=
 =?utf-8?B?YWF4RzNRdlN2aDB6VEhSWmFLVmEwZEIxV3dBbVhGelNWOTV0VFg1dUF1Ykw2?=
 =?utf-8?B?cDdpZ2FpU0pBem94cHJ3MWR6bDdzeG1PdGVlNHVxbmp5blJYSlVTVG1kOEY2?=
 =?utf-8?B?WnBsZUtnblNsK1JnRXFxOUczWjB6V3BtaENzNmpCS2dCY0FxMklGNGhFL01S?=
 =?utf-8?B?TUU0azYxYjd1c3huZHhKR3RrMWVrV0lJMnlWWEREYUZXMmliU000Q1FPazFz?=
 =?utf-8?B?VzdYZmoySFNYeXVhamI4RlpPdE9zOHRUS2xQNWZsMVFaRnppVzI1SDM0bWQ5?=
 =?utf-8?B?Z1BKY2ZCcmpybUJXMGtvYTlJWTA1Y3JOUWZPZ0ZWeUhZR05DenhRMERUS00z?=
 =?utf-8?B?VjVwSlZ4SVJnbWpia0NQYS9vZEVPQkZVT1dGaUFnRUZhYytTZFJkZU1pbzdW?=
 =?utf-8?B?K2NiTW9WL3BZV0ZtL2J0WUNVam05ODJFV3JqUGk2RDZFU2Y2NmdxYVZEZzNY?=
 =?utf-8?B?ZGM4YWx0Uit5K1ZuR3NSbTFKcDEvTXVqRFJRYnZrL1B0ZG5GcFhoUE1zQXRG?=
 =?utf-8?B?N3F3T0tCWFhwR0pYcWFVUzE5TW5LaWFpdE9Gb0hiaFBSQU1yVEkxdkEra2NE?=
 =?utf-8?B?Ym40TGpYTjdobndlMllnNFlBVUpVbE5EZWEzQk0xa3V0QWRDaEFyK1dBOG5X?=
 =?utf-8?B?aFUrTXRKOVE2VVFXdDN4M05lQnJNQTdrU1Y2UTRNaXM4Y1VBdGxXTFp3dEVz?=
 =?utf-8?B?NTNEbUxoU2poRmFqN3huTndxQXJaTWVwRGhjTVZaT3dFbkdVcmlSZExNWXo0?=
 =?utf-8?B?VEd5RWZERFl5WjNvUmx1ZVdzTFgyc3JNdWo0NC9yaHI2K2pybDMzVkZYMkp6?=
 =?utf-8?B?Ky9EM3RVM1hMQXhFYU9neGdrNjA4TWFnZEJ2RE9PWmR2V290ekR6WmY4Q2Y4?=
 =?utf-8?B?b3Vkc3ZNMG5CNnVwdFVvVUtEWGRjTURZZzlsb0JkWU03dzM1WngveFBCQ2pp?=
 =?utf-8?B?aDJUR3hCL1dZTzZRd1kzUkd0Y3pWeHRQZUUvdEZxU0V6NzVrVVpZY2dKeU1V?=
 =?utf-8?B?QmhSSkpYdExwZ3Y4Vm16bnlIUFJJK1lDYXlQNjMwSVBTZ2poeHlEQ0lEOTd3?=
 =?utf-8?B?Z1puWFpSUmllL0NoQUZtYUU3eUpGeGdtd1FOY0V3UFlPVTRKaGxSZHNGbVJP?=
 =?utf-8?B?bFdJQ2ZxMHRQY1dxb3J3M3ZYZVBSY3JtR0d6YmhIc0p6RzdkL0lhSGdsNldw?=
 =?utf-8?B?dEY4dEoxcVdtVHBseDNGekh1b3IxSzgyRzdDM0NON1lId2o3d0FnRTNzMlpi?=
 =?utf-8?Q?uJnffSFYONxjulrh7shw+Am3RB4LhjBMVqHHH3ZBQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <757FA9B44D529646AAD321882221971A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b1621709-298b-49b7-fb09-08d9e246e84f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 10:14:02.2140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gldO+5YiypfLe7u0ivqt1/PxaNgU4vCajCYJ/oYNTnIS42pvzZveUhPika3O/NOJQezI9XnlRgbtT+LE0358BvVrxfHx6AWWM6myhmlptx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2P264MB0669
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAxLzIwMjIgw6AgMTE6MDgsIEFuZGVycyBSb3hlbGwgYSDDqWNyaXTCoDoNCj4g
Q2xhbmcgd2FybnM6DQo+IA0KPiBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmM6
MTE5MToyMzogZXJyb3I6IHZhcmlhYmxlICdoc3RhcnQnIGlzIHVuaW5pdGlhbGl6ZWQgd2hlbiB1
c2VkIGhlcmUgWy1XZXJyb3IsLVd1bmluaXRpYWxpemVkXQ0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX3RsYmllbF92YV9yYW5nZShoc3RhcnQsIGhlbmQsIHBpZCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+DQo+
IGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF90bGIuYzoxMTc1OjIzOiBub3RlOiBpbml0
aWFsaXplIHRoZSB2YXJpYWJsZSAnaHN0YXJ0JyB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KPiAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHN0YXJ0LCBoZW5kOw0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgID0gMA0KPiBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmM6
MTE5MTozMTogZXJyb3I6IHZhcmlhYmxlICdoZW5kJyBpcyB1bmluaXRpYWxpemVkIHdoZW4gdXNl
ZCBoZXJlIFstV2Vycm9yLC1XdW5pbml0aWFsaXplZF0NCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX190bGJpZWxfdmFfcmFuZ2UoaHN0YXJ0LCBoZW5kLCBwaWQsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fg0KPiBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmM6MTE3NToyOTogbm90ZTog
aW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2hlbmQnIHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nDQo+
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoc3RhcnQsIGhlbmQ7DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwDQo+IDIgZXJyb3JzIGdlbmVyYXRlZC4NCj4g
DQo+IFJld29yayB0aGUgJ2lmIChJU19FTkFCTEUoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdF
KSknIHNvIGhzdGFydC9oZW5kDQo+IGFsd2F5cyBnZXRzIGluaXRpYWxpemVkLCB0aGlzIHdpbGwg
c2lsZW5jZSB0aGUgd2FybmluZ3MuIFRoYXQgd2lsbCBhbHNvDQo+IHNpbXBsaWZ5IHRoZSAnZWxz
ZScgcGF0aC4gQ2xhbmcgaXMgZ2V0dGluZyBjb25mdXNlZCB3aXRoIHRoZXNlIHdhcm5pbmdzLA0K
PiBidXQgdGhlIHdhcm5pbmdzIGlzIGEgZmFsc2UtcG9zaXRpdmUuDQo+IA0KPiBTdWdnZXN0ZWQt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IFN1Z2dlc3RlZC1ieTogTmF0aGFu
IENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnMg
Um94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9tbS9ib29rM3M2NC9yYWRpeF90bGIuYyB8IDkgKysrLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcmFkaXhfdGxiLmMNCj4gaW5kZXggNzcyNGFmMTllZDdlLi43ZDY1OTY1YTA2ODggMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF90bGIuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfdGxiLmMNCj4gQEAgLTExNzQsMTIgKzEx
NzQsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yYWRpeF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIAkJYm9vbCBoZmx1c2ggPSBmYWxzZTsNCg0KWW91IHNob3Vs
ZCB0aGVuIHJlbW92ZSB0aGUgZGVmYXVsdCBpbml0aWFsaXNhdGlvbiBvZiBoZmx1c2ggdG8gZmFs
c2UgDQp3aGljaCBoYXMgYmVjb21lIHBvaW50bGVzcy4NCg0KV2l0aCB0aGF0IGZpeGVkLA0KDQpS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KDQoNCj4gICAJCXVuc2lnbmVkIGxvbmcgaHN0YXJ0LCBoZW5kOw0KPiAgIA0KPiAtCQlpZiAo
SVNfRU5BQkxFRChDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UpKSB7DQo+IC0JCQloc3RhcnQg
PSAoc3RhcnQgKyBQTURfU0laRSAtIDEpICYgUE1EX01BU0s7DQo+IC0JCQloZW5kID0gZW5kICYg
UE1EX01BU0s7DQo+IC0JCQlpZiAoaHN0YXJ0IDwgaGVuZCkNCj4gLQkJCQloZmx1c2ggPSB0cnVl
Ow0KPiAtCQl9DQo+ICsJCWhzdGFydCA9IChzdGFydCArIFBNRF9TSVpFIC0gMSkgJiBQTURfTUFT
SzsNCj4gKwkJaGVuZCA9IGVuZCAmIFBNRF9NQVNLOw0KPiArCQloZmx1c2ggPSBJU19FTkFCTEVE
KENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSkgJiYgaHN0YXJ0IDwgaGVuZDsNCj4gICANCj4g
ICAJCWlmICh0eXBlID09IEZMVVNIX1RZUEVfTE9DQUwpIHsNCj4gICAJCQlhc20gdm9sYXRpbGUo
InB0ZXN5bmMiOiA6IDoibWVtb3J5Iik7
