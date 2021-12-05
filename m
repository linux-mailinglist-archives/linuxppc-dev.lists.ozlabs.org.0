Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7B3468C94
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 19:12:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6ZRR3Tmqz3bbx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 05:12:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6ZQw5hz7z2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 05:12:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkhBrjUNtPwqheybLrBTxghxBz/BE8r4Ov6yHS9ahmG80Xjq8OjN2hDPElGzS3UcUIzkC7qpwb5R+11idDiJ3eBaHzKa8nehxuIoSx6sCzCQGj42TKJnywciDn6O75WWoGCDAieRoXteqWl3tdQZ4nid/e0dgc/OMXJu5AgbHL4ssjuGR/yPziLjovDayRXqpUAks5+8JXgJwccHeFVrGDl1rPAtGJXfYADwXpfrnOzFipqSNXWiXm0+NMNx01ykaV08gtgIJgm9o7lB+q/S8wripYPaYOMKG1muwriIr/jrMDRwIfYs+u9wsEb9Qh9+8FZmhSDRRILw4e09+6+JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJeSEC/WQXq35x+d8FI8mBfiq3ObQRbSycMhyFWT+mw=;
 b=HKlg3fkeNajnsKAoI1U7H0SvyTgPktk+9g2AkAQcUh6aIdGslhaA6Hg86cDj36KsrBHMEBEjiAj+2joYDu5pQQGPI5Xt1SxPYdw4muNJdhnkR0d4Ee9EkS/9M0hweP7/EO9E1+c8kN2Hj0TEuedgu4rAUm4ZRx5qcbxOvnxDCIUW+tIFRVlfSpImRbX9EiELpStRC+U6chwLhmerir/Kjhds7nebWgFRiGfyyIvZ3QszKpuoZ4y+BojorQJHZkXtem1FPeLdbLO6NkmIbd/8Q1Nn0Uh5F8R/JX77ox1dJpoQHpOF00dmHgn8fk0CLxgf+D4nJ10+7WEJCvLoppkOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0449.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Sun, 5 Dec
 2021 18:11:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.021; Sun, 5 Dec 2021
 18:11:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIAAGRKA
Date: Sun, 5 Dec 2021 18:11:59 +0000
Message-ID: <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
In-Reply-To: <20211205164217.GA29658@sakura>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07b88c18-7750-4d86-a03d-08d9b81abb29
x-ms-traffictypediagnostic: MR2P264MB0449:
x-microsoft-antispam-prvs: <MR2P264MB044958422915F607AB1DDC25ED6C9@MR2P264MB0449.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yo6Hf4SI56R2eZb3Lsf+Kf/L5zdFSDuVP0ZKRyN6mth18Snw3wq4iAprF3jeh+x+2UQ9Pq33HyeUS/kbSkFcY03I3bT+HsseLZ+7YVf7FKAn/XidqeU8UEip3h7KAadIkX4MidVnVzwzt30oSwATvudmeb636cmjaQB+hO43lvzVrvHCQkwvbq9KziLdiRYKyPcTQh5zPiFxGiZzWYZIBS4ny0WAG7fNzMf+A3PHuWRKJXdZvf53fhbS8GAtoCWfy9g8gDFFk2ogggM+2nujQ9OiBqnxTWaLfZRJrJIFVrMntrFZfN/Tjo8uC7Y95jt3eTeJYj/q93AWu7Y2AL57TUyub+qkEtRk7mR9dhOjFx7IJ3ibXTr/5X6CfzLd6N6o2ErsviacMdiK6ITQfq9V0oZLhroco4wzZMhhbhDTWnAbLgS5k6LoAuzZRH1JYkEt6Wt5ssAdpfXHICSOsN+EdJhHuJFwRGy0Y4FeBK1KA9wekbqZSKJEUzxWK1CAADkNspbt7CAK9YBtrt8/c3cppQgz2nk7sZJ8JevNz1lebcmIQIgGS5krbJjgl0eNtCQ/olSWV7ACOTq2645d/YsKQnc4I3PjOj0k/S8vtrhPtedB50TFN8pnakTE0OiWWzDyUdzhj1AiDE7EJ7beEZgorn2/537gjFu9INUIMmTD/w0LnTsNFfhpVfphtcyBFIoF1wG2c9o7tlQldzhtIEGgryRJoBcvAzAYBHOX3RaOY9r9q9ND+ab6ZywNhSIKC39fs27qkgmptNpAr8XB07UPOw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66946007)(64756008)(8676002)(71200400001)(36756003)(122000001)(2616005)(6506007)(508600001)(186003)(66446008)(6486002)(66556008)(6512007)(66476007)(38100700002)(8936002)(38070700005)(4326008)(31686004)(86362001)(83380400001)(5660300002)(6916009)(91956017)(76116006)(66574015)(2906002)(44832011)(316002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qzc0YWNXaVl1Y1EycStuQkNxWDk3WVBtZHMxOFY3YzRXQW4rWTJhNWo2YXZq?=
 =?utf-8?B?ZkQxVFdndVc5Z0FIUE8vcnZjaTg4cVZPQllaSHBEdmVvY0JEY0M0NmFUbkNM?=
 =?utf-8?B?M3BPclJEWTRqbkRKYTRMdlVtRHdpUmZGWHZLa0FZZk9pNkZuSG1GUTJ5cmZB?=
 =?utf-8?B?eFI4VkMxYlpJY0tCMW00YktFTVRXYk5pOU5zMG9Rang2bzNQZ3Vpd29tMEVr?=
 =?utf-8?B?VkkrR3NjSkRJUG1OMkRlbW5JdnN2NkdsZHZ4RHB3WG14WFplSDJ4ZEFaREpD?=
 =?utf-8?B?elFIMEZWb2tJLzRyZVlkRkhCY3lRQk5qWmdtTC96YStxRnUzaVZaSTVMVlVy?=
 =?utf-8?B?cDM4OFpDanY3elg1SG9jWFB3Z3dWVWJhRUtLT0tWeStGblZBeDc1QWJRY2Jk?=
 =?utf-8?B?RWJqRDBLS2JseGQybVg0OG4wakhtVVRXbmwvUjZ4TVRHR1pDWE9wUDJ1ZWJ6?=
 =?utf-8?B?Z2NNWVc3a1VRMENyc0I5R1hCS2Q4TCt0QWttL1FoRHlkakJITEg1YWVGb1I0?=
 =?utf-8?B?OFVkR3Jac1hJTHdDZlZtemhldmIxU05iajhyakpKU05lZC80YzZaaGJ2cnQ1?=
 =?utf-8?B?T1lwMm5OVTRBUFdKQ1AxdWl6NHpRaDYxemNkbFNnK2NPVVFNRVFMRjNrblNu?=
 =?utf-8?B?YmFnQk5acTJFNVlWL0tNREpmU3dwYVppQmhGWXF0YmZEb0V2enh4cndVeE1y?=
 =?utf-8?B?OW9iOXdRV0xRQy9YcTUzVDM2K0VUakZtdUZMTjBXQVZYbGpQczkyb2hkaW5a?=
 =?utf-8?B?cnQ2dUZXNVJueGdTanArVHlhQ2h4NXhMaFY1bE5QUkl6REpraEIwZnhIVXhx?=
 =?utf-8?B?b3dPd0psVFNORjZIcFZEUVhtY0FXQnBLcE5UQVMyMmVqdVlJN3QySXVWRVVh?=
 =?utf-8?B?L3BDYnh4U2tnTG4rYXdBc0hicldSZ1BmZDFCNCtzRExnMi92MnJRMU94ekJS?=
 =?utf-8?B?Y3VvdkVtdzNTc3hMbUNaS3c2Z0Ryc1FVZU9OUEc3VTRwQjcwaEQxTloxQ1pY?=
 =?utf-8?B?ZmJBNXVvaWJjTDFVRjBIYVM1cmYrU0R2Qzl5ZVJ5NFhiZk93WVZsTC85c3VY?=
 =?utf-8?B?YU5QaU9ObjBoeXFBVldoaE8wbXJpYkRUbWp2ZC91Tzg1cWhuTlhHSzZoQ1Iy?=
 =?utf-8?B?ZUNLNFN6R0ljL0RvMHAxNVhhQnpSc01sU2xaK2hZcUFBMHRuaHh5WU15eFgy?=
 =?utf-8?B?NFQwbU1xcmk2cVptdUljMnFMYUFOS1luMkNXVnlVSjc4R3JzUEJFUkZjRzNL?=
 =?utf-8?B?QnRCVFpZYWVUeXk5aVU3Q3lCdi85anBJdFJTcnlnK3RrTHliYUxWTENpWlJ0?=
 =?utf-8?B?alpnUE9mam9tV1dHRlVSSU16UWtabm5admNsSVh3VWhTL2d6RVh1aE9Vd1Y0?=
 =?utf-8?B?WmVYTThxNXBlSlNhKzA5VHQxZURaTTFuMm84bWZkTUVOK2RteXhnSVYyZy9p?=
 =?utf-8?B?OUUzQ2ZsUnpJVVF2S1ZPOFR2MjhsUXFOMVlFczB0QlczZWxqaWVpanVmazk3?=
 =?utf-8?B?RFlzTzRLZ2lxaXhJakhqT005LzlKNVd2WGg3aUp4NXJrK2daeGgwSFBTWG1F?=
 =?utf-8?B?NHBuYVJqek02amwxdXhMLytCSWZVZk1mZ2JoNG53WDg0VWtMeUtJc2Q0YmZB?=
 =?utf-8?B?bmt0bGxtemVkTkNnQnZCSTB1SXJPSHluZS9IdXg4RGVjeDR4YWFhUzUvYWU5?=
 =?utf-8?B?M3JUZmFiSEdqR25ZdWQwWnREVlhwbDNSeXl2Wm9CbHNDa3QxaWdZSWVRRnlK?=
 =?utf-8?B?VGRXN2QybmlWS2hiY09vUEpGTlhoNDZHcmpIMmUraG5mOXdQZlpodGtxRHFu?=
 =?utf-8?B?N1FPMEpRNXZqTEdObWNBLzVFalhPZVdhRjFUelg0Nk9ueVowRXFUZkdOdmxa?=
 =?utf-8?B?Q013aTBMNUE3Zk1hNG9ZNkZiNkZmNUhjWTZxOFhjbHE5QjNiU3l6dkVSUjli?=
 =?utf-8?B?Wm53TGpKZ2xnYkk5Sk1JU2ZMMm1OeU9mZmJpdFUrYTNjTGorQnR1UXZZNVRR?=
 =?utf-8?B?NmtHR2NLZnh0emFwME80Y3k3dzBsbUFiTHErUWEydk9SWVo0aysvSTkxTllx?=
 =?utf-8?B?QllXZm96T2lMRXR2YmNMajdQcnVpVFZDQXRrWFVlSExObFNrTDdZK2dxdVN2?=
 =?utf-8?B?SmZJNVUwUEZobVFUalpXKzRWSVd6WldDaFYyNG03aDlFQ0VjazJaOGFVcHlr?=
 =?utf-8?B?akhaMzhJTld4R1lGajN0cG1iQ1FJRlY4bEYvZ3pPK0ZkdlFJUjg2ZGcwamJE?=
 =?utf-8?Q?5oISpbatWlULykA4na0k/q6u5gAWU2jWVpHIUxVYEc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C986E352AB141429B02B6DBAA2F1F49@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b88c18-7750-4d86-a03d-08d9b81abb29
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2021 18:11:59.7577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+K3HAqHwGZsSxPC5C2pXja4XLT3b0eFmawDBBoVrvQj4L5WJmh5bpnAh7nWKqif5PjURMA/GnaWFO9Pr2wyRp/pNAMXr1xPFgBELCt5HAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0449
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEyLzIwMjEgw6AgMTc6NDIsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIFNhdHVyZGF5IDA0IERlYyAyMDIxIMOgIDE3OjQyOjQ0ICgrMDAwMCksIENocmlz
dG9waGUgTGVyb3kgd3JvdGU6DQo+IA0KPj4gSSBndWVzcyBhbGwgdGhlIGd1YXJkIGlzIGluIHRo
ZSBjb21tZW50IC4uLg0KPj4NCj4+IC8qDQo+PiAgICAqIFNldCB1cCBvbmUgb2YgdGhlIEkvRCBC
QVQgKGJsb2NrIGFkZHJlc3MgdHJhbnNsYXRpb24pIHJlZ2lzdGVyIHBhaXJzLg0KPj4gICAgKiBU
aGUgcGFyYW1ldGVycyBhcmUgbm90IGNoZWNrZWQ7IGluIHBhcnRpY3VsYXIgc2l6ZSBtdXN0IGJl
IGEgcG93ZXINCj4+ICAgICogb2YgMiBiZXR3ZWVuIDEyOGsgYW5kIDI1Nk0uDQo+PiAgICAqLw0K
PiANCj4gSXQncyBtaXNzaW5nIHRoZSBhbGlnbWVudCBydWxlIHlvdSBqdXN0IHRhdWdodCBtZSwg
YnV0IGl0J3MgYXJndWFibHkNCj4gbm90IHRoZSByaWdodCBwbGFjZSB0byB0ZWFjaCBwcGMgMTAx
Lg0KDQpJbmRlZWQNCg0KPiANCj4+IE5vdCBzdXJlIGl0IGlzIHRoYXQgc2ltcGxlLg0KPj4NCj4+
IEknbSBjb29raW5nIGEgcGF0Y2ggcmV1c2luZyB0aGUgYmxvY2tfc2l6ZSgpIGZ1bmN0aW9uIGlu
IG1tL2Jvb2szczMyL21tdS5jDQo+IA0KPiBJbmRlZWQgaXQgd2lsbCBoYW5kbGUgY2FzZXMgdGhh
dCBuZWVkIG1vcmUgdGhhbiAyIEJBVHMuDQoNClllcywgdGhhdCdzIHRoZSBpZGVhLg0KDQo+IA0K
PiBBbHNvIHdoZW4gbWVtPTJHLCBJIGhhdmUgcGh5c2ljYWwgbWVtb3J5IG1hcHBlZCB0d2ljZToN
Cj4gDQo+IENPTkZJR19QQUdFX09GRlNFVD0weDgwMDAwMDAwDQo+IENPTkZJR19MT1dNRU1fU0la
RT0weDYwMDAwMDAwDQo+IA0KPiAwOiAweDgwMDAwMDAwLTB4OGZmZmZmZmYgMHgwMDAwMDAwMCAg
ICAgICAyNTZNIEtlcm5lbCBydyAgICAgIG0NCj4gMTogMHg5MDAwMDAwMC0weDlmZmZmZmZmIDB4
MTAwMDAwMDAgICAgICAgMjU2TSBLZXJuZWwgcncgICAgICBtDQo+IDI6IDB4YTAwMDAwMDAtMHhh
ZmZmZmZmZiAweDIwMDAwMDAwICAgICAgIDI1Nk0gS2VybmVsIHJ3ICAgICAgbQ0KPiAzOiAweGIw
MDAwMDAwLTB4YmZmZmZmZmYgMHgzMDAwMDAwMCAgICAgICAyNTZNIEtlcm5lbCBydyAgICAgIG0N
Cj4gNDogMHhjMDAwMDAwMC0weGNmZmZmZmZmIDB4NDAwMDAwMDAgICAgICAgMjU2TSBLZXJuZWwg
cncgICAgICBtDQo+IDU6IDB4ZDAwMDAwMDAtMHhkZmZmZmZmZiAweDUwMDAwMDAwICAgICAgIDI1
Nk0gS2VybmVsIHJ3ICAgICAgbQ0KPiA2OiAweGYwMDAwMDAwLTB4ZjdmZmZmZmYgMHg1MDAwMDAw
MCAgICAgICAxMjhNIEtlcm5lbCBydyAgICAgIG0NCj4gDQo+IEJBVDUgY29tZXMgZnJvbSBfX21t
dV9tYXBpbl9yYW0oKSwgQkFUNiBmcm9tIGthc2FuIGluaXQNCj4gDQo+IElzIEJBVDUgbmVlZGVk
IGhlcmUgPw0KDQpTdXJlIGl0IGlzLCBiZWNhdXNlIHRoYXQncyB3ZXJlIGtlcm5lbCBleHBlY3Rz
IGxvd21lbSB0byBiZSBtYXBwZWQuIA0KQWxsdGhvdWdoIHRoZSBrZXJuZWwgd2lsbCB1bmxpa2Vs
eSBhY2Nlc3MgdGhlIDEyOE0gcmVzZXJ2ZWQgZm9yIEtBU0FOIA0KZGlyZWN0bHksIHRoZSBvdGhl
ciAxMjhNIGFyZSBzdGlsbCBuZWVkZWQuDQoNCj4gDQo+IA0KPiBMYXN0IG9uZSwgd2l0aCBLQVNB
TiBhbmQgdGhlIGZvbGxvd2luZyBsYXlvdXQsIEkgaGF2ZSBhbiBub24gd29ya2luZw0KPiBrZXJu
ZWwgd2l0aCBWTUFMTE9DX1NUQVJUID4gVk1BTExPQ19FTkQ6DQo+IA0KPiBtZW09MkcNCj4gQ09O
RklHX1BBR0VfT0ZGU0VUPTB4ODAwMDAwMDANCj4gQ09ORklHX0xPV01FTV9TSVpFPTB4NzAwMDAw
MDANCj4gDQo+IFsgICAgMC4wMDAwMDBdICAgKiAweGYwMDAwMDAwLi4weGZlMDAwMDAwICA6IGth
c2FuIHNoYWRvdyBtZW0NCj4gWyAgICAwLjAwMDAwMF0gICAqIDB4ZWY3ZmYwMDAuLjB4ZWZmZmYw
MDAgIDogZml4bWFwDQo+IFsgICAgMC4wMDAwMDBdICAgKiAweGYxMDAwMDAwLi4weGVmN2ZmMDAw
ICA6IHZtYWxsb2MgJiBpb3JlbWFwDQo+IA0KPiANCj4gSUlVQyB0aGUgc2FmZWd1YXJkIGlzIGhl
cmU6DQo+IA0KPiBhcmNoL3Bvd2VycGMvbW0vaW5pdF8zMi5jOg0KPiAvKiBUaGUgYW1vdW50IG9m
IGxvd21lbSBtdXN0IGJlIHdpdGhpbiAweEYwMDAwMDAwIC0gS0VSTkVMQkFTRS4gKi8NCj4gI2lm
IChDT05GSUdfTE9XTUVNX1NJWkUgPiAoMHhGMDAwMDAwMCAtIFBBR0VfT0ZGU0VUKSkNCj4gI2Vy
cm9yICJZb3UgbXVzdCBhZGp1c3QgQ09ORklHX0xPV01FTV9TSVpFIG9yIENPTkZJR19LRVJORUxf
U1RBUlQiDQo+IA0KPiANCj4gYnV0IHRoZSBkZWZpbml0aW9uIG5lZWRzIHRvIGJlIGFkYXB0ZWQg
Zm9yIEtBU0FOPXkgYW5kIHJlcXVpcmUgMjU2DQo+IG1vcmUgTUIuDQo+IA0KPiANCg0KSHVtLi4g
R29vZCBwb2ludC4NCg0KQ2hyaXN0b3BoZQ==
