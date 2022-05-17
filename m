Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F085F5299B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 08:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2RT253Tnz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 16:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2RSZ2yCDz3bZP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 16:45:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Znvtm8FU4zxqduE0lkoXKuqV+WHmDGFhrRirRzexuOHUcf5GKdHXiOoSgX5SYQFCBQJNEZGu8o9QD4+wIejmULTV3ZaHyM7K2HFLW7JerHMh1CoaR58ky8Ar493tbVu/cScmXenYip1c2XCFu0hYnj2muol7DM9nhFmv+QUbKkFY2gWDJybuWyoNNBXVx+WzwvU9cthIVquFLWio8/l5ThUPPj9BncU5l9NsgNmQbkCZOp/6GItopNKAKJ+xIppokTZq7Bkq7vejsKb8hcQ8cUqgyt0bYM0jiaSU5F+WOCbaHHkzc/UExMPbeYWHnJSVoRKIkmgiyLU7GEsDBgJeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VD0oth6E2gKGzTrWhcFqgARYaK7eYvVhG20BeOLEXQ=;
 b=OS38tV7PCosYzO7AqVJKc2lD7Bd2qX2QkIH0dw+Roue/dtsoX6cau78i9R64EB1VnbW57voWjMd11w8TGnC8swLWa7NWAxb3/KRoyJPry6Wr+o+GGF4on4Ii/02tQ389SI/H6DtdC5aPk+loyOLT0V1y/8aqH4Py+nVHm4oufjY1JFnGIiS5ZJOsTH3dsRZnO72CIIJyl4ynXZmcMkgCnHc/HtEvguVx1O6etEGL3f3S+x/qz4ZdPezsqROraEunmdVVyeUZVbTXdhni4lMW6NtQkmiQvfTJqdMEZo/ZYLjXBbrAH63wwM0TL1/e5HfHb6vTOHjbmfUHNbZNTudXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1894.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 06:44:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 06:44:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <patch-notifications@ellerman.id.au>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Topic: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Index: AQHYPgMuEw69Ny4KjUGygXqB4JUsF60gESMAgALl+4A=
Date: Tue, 17 May 2022 06:44:36 +0000
Message-ID: <f1481139-9ed6-3e00-e73e-87d4319c614d@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
 <165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au>
In-Reply-To: <165261053687.1047019.4165741740473209888.b4-ty@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8ca0d9a-adb9-4e31-ddcc-08da37d0b5ce
x-ms-traffictypediagnostic: MRZP264MB1894:EE_
x-microsoft-antispam-prvs: <MRZP264MB18945A3B39DA012C48B7D836EDCE9@MRZP264MB1894.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LerpMP8cGHbwSL5GxtPlrkmsVJIJa5uT3Ab4DEExnEMywKP2pj2cn1seHm2w5vsDLybVC/dem3mv+Bg35u2uCnsHJ89JZrU+wvPipOqtUd2MxbzyJWRnpY1ppFKWuhwDDDZt+1LiX3vFI/29s0xoDf/MSZ3wVs7CNXMGGdIPpfGZ8x8j2LJXOL+zBkJ1qpKAkAi3qYZWft7JaMYsb3dvfEj80ZZGYZEs/0oVjxEuIIZGCcvkwd21X3RMrmNgf23lMaPhefqZdoCwuB9/+GGiM+BYsSpPpKR/k/dBQ8CXCmZ9LoAjbj0sLEXLE52hE79VzsqtbS67ijPM0zsMOeuYkZeUKx/Zy5gfHwVGwRMwymgWHpcmgRPMlZZNxNDP+ssEyxTafVs96VSy+ys5zCVLOGKYRGVr9Vz4DJsCkepBCeZGBxAxQopEeUZLQgJkf7YzAxCxOu9s87hqdAwnAn7ZhdJg+aGIsqDKcA2AGvOejcZ+igNgQBfKBLRC3i7bxBEGuf08draCSFPWHgnFAoDBPVwfMtUgthAuy5SCQ400oY4WOHu/DHjgSaSnf/gaEn/uveIei+MVMvaXclAi0Nyxdv0fGq2B8JzOEFBtPp66+7fHG0rSK2aeCGddeefW8/mYKs0LBGc0aFiemWjW0BCP55Ay/2gDtUzrtyujnL/xZNRtHQQQio+vxKm1gEeJKyQkePwhQpeV6VdrlehuOyjYz2+vaWE5FmazCbV7RR25jFv4G2dTgj6zzoC3ytdqB5AEKunr5LVz1HCVuKcBG9ZNC1Gj2D7nM2Psb5NQNFVFY9tcCoIGyAQdMenczPmIjWKtpnef7+JtN6DQx7xcfCkwp9g/0p/rx1IDvSdCR8xIAgI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(54906003)(76116006)(64756008)(2616005)(31696002)(83380400001)(31686004)(86362001)(4326008)(36756003)(66556008)(6506007)(38100700002)(5660300002)(110136005)(91956017)(66446008)(66574015)(2906002)(6512007)(26005)(38070700005)(186003)(8936002)(508600001)(66476007)(316002)(122000001)(71200400001)(8676002)(966005)(44832011)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0hxSk1xMUxlMEkyM0RHV1BXbC9Bb2QrcTFlNGxvME5xcVRsTFFPbHNQRGpK?=
 =?utf-8?B?UXpROXBFZjRmQm5zMjFaOVJyYVJ0MGZqMVdTQTk5Z0VRQzl6QVladkJ3OWJU?=
 =?utf-8?B?RjRDU1hmUTB3T21tSFEvcFdHY1dyYnh4dGd6VE9CWmpFSlY0ZE9tSjAyK1Bt?=
 =?utf-8?B?NG1JYVFZTFVpMWRGSVpLWG05Qk5yWHovN01IVlBQclRiODk1ZW1MSHdpV05x?=
 =?utf-8?B?RTZ4WS9hYkNRb2QyekE3dThkaDB2dnUyR2FnYVMxQU1nbFN2NGVBTjRKM0xs?=
 =?utf-8?B?NUt6N2FNS2drWXRJdVhacWtobXczTkk4bml2ZlRaNGZPN1VqdUptSUE0cFlv?=
 =?utf-8?B?M2ozcXFoK1I5ZSt2dXh2ODJSRjkvSUh4LzNsTXF1TFFXN3FSY3R1WVRuam5O?=
 =?utf-8?B?enJjN09QRXF2ekZlR2lRREtmRlNjYkw5MERLanJSL3RDRzlERjhiV1VleWVk?=
 =?utf-8?B?K3VJQzRoRExuYkhVTmc3em8rVmhVZHVFWlk5YnpXamljekJ6WFVBVHRWRFVD?=
 =?utf-8?B?bWlqVys0SGFndzl3QThXOVpmd0J2WENKMjFjVys3WTMyVFBMd3p3ZE9kUlpp?=
 =?utf-8?B?dy9zU1p0RlF3UWtMZnNjTm1Rei93bGJ1d3pnMDhGbE5pZGxRU2szVEdjMFZD?=
 =?utf-8?B?SHkrYkQyWDRoc0FqZS9oMURBZW5OODVRbzE0Tk5uVGZ5OFd3VDBhUnh2V1VJ?=
 =?utf-8?B?TnZpejlTeDFlUFlpN2J6V2pYbGRJbGFJU0pmbFNUVEpLRVJuajZUTUtGcEV3?=
 =?utf-8?B?VmdsZ0ZmZ2dTd1FCbGFzMkcrZXFodUdmOFk1VlJZVnp3WXdOSmZqLy9XVGJS?=
 =?utf-8?B?cXU2eTRXQlVVckhNVEYyeG5GMGZmR2ZuTEdiYlhEenRTRzZ0V2FFNDdIZ2Rt?=
 =?utf-8?B?WGwvUXJBZkgybGRNeEVWOEIxMnZ2eDZwemZHVm53cEx5YS9NbmZEUWlXQkdT?=
 =?utf-8?B?TlJDMzUvemlXMmZ4MGd3WjhYalJWQTZGOTYxQmdPa3loSlpWdWV4cGtucjIz?=
 =?utf-8?B?cjhSZFVGSGNxWFN3MVRHZmEyc3VaL0NVNVZ4SlZpanQ0S2xIOWM3NUcwVGNn?=
 =?utf-8?B?YXk4RUptUWIxaHcwRzR1UmtQYytnRWw3NU9DZ0VDNzIrSFNMNVlOOTBhQnVa?=
 =?utf-8?B?ZEdxaVNOMW1hTTMzaHp4b1RUSDJKRE5IUmhFUnJLaVNxem5weUZsSnRjY1V4?=
 =?utf-8?B?eHE0WDkrZzhJZ2ZmbDJLVmZXS1lCVFA5cmtoOTdJRmtKTVNxQ0k2cmpzMzVV?=
 =?utf-8?B?Y2l6SFFJT2ZCdGdxb1lQTFBuWTY4THNFa2ZoSE5yVVNIMGY3VlpWRGlWZmR5?=
 =?utf-8?B?a25JbExKNzY3VXFNclE4Z3ZZZ1c5UjhudXlLY1I5N3RlRFpwNXFsKzFOTldr?=
 =?utf-8?B?L0ZkRllKenhNYUNMVXNJSEUwTGJMdXFuVEFQQUxKb1Fmc0VjQWx0YUtUcG1l?=
 =?utf-8?B?T2tWb01TVnlIUmdYOUg4VURSSzF2ZUZwZ1FLNDdkZmJja1ZORzJYdzJOUkJL?=
 =?utf-8?B?NHJ2bEo2Yk96Y1liVzE0UHpoT1ZvK1dTWGg4RDZVTEwvbE9EczA5TE81OXVh?=
 =?utf-8?B?eEp3VkUrQm85eXR0aW44akRjeFMrT2VWRUNyN1FjQ2M4WkVLaVAraHMrWnpL?=
 =?utf-8?B?TGdxdXJub0IrNGxOSXkwS3hlclFBem55RUZKQ1M3Zi9DWXNFSTd2c0UzMFFE?=
 =?utf-8?B?MTdncUM4Q1hyQjV4WUFIbXVRc2ErVnJSQkY2cmp4T3c2QVNjM0R5QU9DMDdE?=
 =?utf-8?B?UGNpUmhRaWlYa2xsQ2hUVmZvL1pkdjgyMG5ZdTVhY3kwU28yZHcxZ21OV0Z1?=
 =?utf-8?B?U1h0MmM2NTVLZUFVRDE2Y21GMFpkUFdRVEx4K1Y2ZXF1VjhnTHQzaDZJaG9y?=
 =?utf-8?B?bXBhNnl3cFR6QjlDSE1SOW16MXBYMjR4dUxkdEdvQzFvYWd0YzlpcE94ZU9V?=
 =?utf-8?B?SlA4a05HOHI3c1l6M3VneWpReUVDSmNpWWV0bWFLMHhCbFpJRHRJT3lkY1Bt?=
 =?utf-8?B?VHJINncrNHhXMlRPMHR3SjFvTDV1YmdsME1YanVZaERYZjFpZFhIMmxrRjlm?=
 =?utf-8?B?bVdGcmo3UlVnb1hQaEZuY21wa3ZkdEYyYTZIaElGTVd6cjBkSWdCQXpSbmpH?=
 =?utf-8?B?QzMxT0RHZmpBR1NPZjZLZTY5VTk1RURZZCs3M0ZoN2tiMkVDNzVBS3k3RDNa?=
 =?utf-8?B?OHJHeFQ4WURhclcvZndMR2dWS0JwY3EyM0RNbjd1a0Nab0h1TTZLbUNPWjRT?=
 =?utf-8?B?RmUwNFpEeHdycDcxOWRxeGFXUEswc21hTi92cXJ6SE8vWjRMS0JJaC9rNE9K?=
 =?utf-8?B?RFFUTWFDZ0lpM2JHRk0xU05aalJKdGN5V2htV1QvZGovMGF2dHUyNkIzWXVS?=
 =?utf-8?Q?RuXxga6tPLEAOePUSIWJD4+cPI9kPscyffo8t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <395949EBB031604E8B4EC1E7D23245CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ca0d9a-adb9-4e31-ddcc-08da37d0b5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 06:44:36.8836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E4k16vtiKTY+7JWPEdP8yW0/Zasmid0TD94LWkUHz3SmwaSRJ/JDZuh3XOPYwFaayjlUECBGkhaztMGh7hJrCFCRxUObtAZWG95Uk9IKnNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1894
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

DQoNCkxlIDE1LzA1LzIwMjIgw6AgMTI6MjgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gT24gVHVlLCAyMiBNYXIgMjAyMiAxNjo0MDoxNyArMDEwMCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+IFRoaXMgc2VyaWVzIHJlZHVjZXMgYnkgNzAlIHRoZSB0aW1lIHJlcXVpcmVkIHRv
IGFjdGl2YXRlDQo+PiBmdHJhY2Ugb24gYW4gOHh4IHdpdGggQ09ORklHX1NUUklDVF9LRVJORUxf
UldYLg0KPj4NCj4+IE1lYXN1cmUgaXMgcGVyZm9ybWVkIGluIGZ1bmN0aW9uIGZ0cmFjZV9yZXBs
YWNlX2NvZGUoKSB1c2luZyBtZnRiKCkNCj4+IGFyb3VuZCB0aGUgbG9vcC4NCj4+DQo+PiBXaXRo
IHRoZSBzZXJpZXMsDQo+PiAtIFdpdGhvdXQgQ09ORklHX1NUUklDVF9LRVJORUxfUldYLCA0MTYw
MDAgVEIgdGlja3MgYXJlIG1lYXN1cmVkLg0KPj4gLSBXaXRoIENPTkZJR19TVFJJQ1RfS0VSTkVM
X1JXWCwgNTQ2MDAwIFRCIHRpY2tzIGFyZSBtZWFzdXJlZC4NCj4+DQo+PiBbLi4uXQ0KPiANCj4g
UGF0Y2hlcyAxLCAzIGFuZCA0IGFwcGxpZWQgdG8gcG93ZXJwYy9uZXh0Lg0KPiANCj4gWzEvNF0g
cG93ZXJwYy9jb2RlLXBhdGNoaW5nOiBEb24ndCBjYWxsIGlzX3ZtYWxsb2Nfb3JfbW9kdWxlX2Fk
ZHIoKSB3aXRob3V0IENPTkZJR19NT0RVTEVTDQo+ICAgICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3Bvd2VycGMvYy9jYjNhYzQ1MjE0YzAzODUyNDMwOTc5YTQzMTgwMzcxYTQ0Yjc0NTk2DQo+
IFszLzRdIHBvd2VycGMvY29kZS1wYXRjaGluZzogVXNlIGp1bXBfbGFiZWwgZm9yIHRlc3Rpbmcg
ZnJlZWQgaW5pdG1lbQ0KPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wb3dlcnBjL2Mv
YjAzMzc2Nzg0OGM0MTE1ZTQ4NmIxYTUxOTQ2ZGUzYmVlMmFjMGZhNg0KPiBbNC80XSBwb3dlcnBj
L2NvZGUtcGF0Y2hpbmc6IFVzZSBqdW1wX2xhYmVsIHRvIGNoZWNrIGlmIHBva2luZ19pbml0KCkg
aXMgZG9uZQ0KPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wb3dlcnBjL2MvMTc1MTI4
OTI2OGVmOTU5ZGI2OGIwYjZmNzk4ZDkwNGQ2NDAzMzA5YQ0KPiANCg0KUGF0Y2ggMiB3YXMgdGhl
IGtleXN0b25lIG9mIHRoaXMgc2VyaWVzLiBXaGF0IGhhcHBlbmVkIHRvIGl0ID8NCg0KQ2hyaXN0
b3BoZQ==
