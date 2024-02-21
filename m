Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC585D875
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 13:56:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lN7G9R9G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfx905KJTz3cy9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 23:56:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lN7G9R9G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfx8F3Xy7z30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 23:55:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEa4CDKQJzMMh6P6ggeqfhSZCXeXioyWdA4MpR+HEecqiG5feaDNMYSz+SpBywK614cXQfo1N5LYE6P5+1wsN2Pbr+1xGk34ni8iu8qttytadIHJmls8BhE1ovxfJ6KCCldsOYXX0yiFCcfcLnsmdg6YTANS1e8CrOu/t5MH8/cOY3ERGxSY/XqArdWLLd5cLrbDDrjKTcQIHcKeB3xiYC5AVPyfyEbd0IOTyxPGPKMcQF8rCsEHH/wf2HXkS2vhPFl3mI5y6wRrtDN/UvgXPw4Yl4GXolVcB88eqb+RMSIok6JaJWVUtGPcfC5SOlde5m8amUgKYDcSmaXx8EZLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCMnmjjxQZvsMfTFd0+u5eFer7WLn4D+mLCNf7FgdQk=;
 b=QMmsW7nukCKw2tRPS2voL+qfYyG4q4YcBlnDMJmZXeZXZWTh8N+s+RiJ/sTjpsb+bl5uOFneJmV7ID2A5oqEtv0uepybCazFonpfpGTSA4T/pSn3aNj8krLdRalZNlE/5gVtmYtiTow9U+A3rEaeKVhf4gYbrerZnHV4X+xqVL4Vp6//VAq1aavEmJLb9NjueB9EjM/eMYMJVVn0MIR0XG+ZMj03GJ+9ict56g37Uk/qfezFB7Duv1SmtObohnYF4bt4VxHwNRTy5obF0anDOyIgIMLMNM0U545KoT2CXQnpmz6hPPJhtoDvlj1Vf2IkkOvyT9Cv2vgltjP6FiGJLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCMnmjjxQZvsMfTFd0+u5eFer7WLn4D+mLCNf7FgdQk=;
 b=lN7G9R9GyWcfR8E0GAfTURkW4iiQe58DvSIMUdD2ba5fftUBG5MBqTXiK8Vgg7s1wC3rle3rcyBbEq1HOXHcLWRvrH79W21RsZ75QgjeP+6GykOkxYAEbpOD3fBGikc3Rn/uPUpj5aAqsYo03lW6czvLJbiGxYGlxfw5r8G7PhqBhj2InzzXpWbik9iGjpaapjD5/PCtoo/T6e4E/s0bczxS4qCR8iCHMYiCpdFekLzhQcqNw59nNtkMXLgXSl4IQvtMVip1RHkTMQgxiyYUe5RDnAdhPiegdx7bkLL6hxn7oe4cVoGjpR5klsmHrqsD9h4Bsx2Yb5JxIWxifh81XQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2920.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 12:55:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 12:55:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc: Don't ignore errors from set_memory_{n}p()
 in __kernel_map_pages()
Thread-Topic: [PATCH 2/2] powerpc: Don't ignore errors from set_memory_{n}p()
 in __kernel_map_pages()
Thread-Index: AQHaYMFgEY7XRkHGtEax26FM0Hg11bEUvDGAgAAMrAA=
Date: Wed, 21 Feb 2024 12:55:04 +0000
Message-ID: <eefeb056-bc71-46ad-90b3-b07c392f5903@csgroup.eu>
References:  <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
 <20ef75884aa6a636e8298736f3d1056b0793d3d9.1708078640.git.christophe.leroy@csgroup.eu>
 <878r3eauig.fsf@mail.lhotse>
In-Reply-To: <878r3eauig.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2920:EE_
x-ms-office365-filtering-correlation-id: c90cb76d-7018-4c05-4456-08dc32dc5308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dTaXlL2X8udJSTMa5+2hA5l0gwCSE1CHYj/lvCPp6C/2o7x7YO8iGKPi9aKvbh2B9odgj9kIbSq/4RYmDFwh0vFUfT+mHgxKI9yM+HvN46Oj+NfhfJaDFl+moU9HG4P8l0fAlbORA6EK8J0x2f9hPI9uRX8eZoQg+/zAlrGrxE9kVGoS5f+q4HFy9eSNDM1vM/jmtaF0wejtx9M+Pbk0FO3vroElFAjw4PZN/EdCu1w665inWG7g2Ye8KTcI8dXNtxaIXbcHPCegXvexTDnZyViV1XplfT7CnY/SP0TwKBHgafv89ABt0Gxtm6vi6NaQF/4jQodVys2R4BSnvmUUXxgifLlej5AfHbP2BRB8wuXjNP5liZ6cNlrr1xQaVVA5Fo+QWHSLF3uCfT25NlSnQeCSo5+joWYZhhfZkct3Ax72AHis6feZQtMzlCZE4H19hrpW1mcKgWOBiOL1kMpgJz5QJiwC4WBkug1kzu9tV2n9stSSq0HZF9FCFDm8NMvxK90knOenVj1ej+Wkpm4nUdnQWauk6vG7XGurcobj+AX1JSkdF7grwdM9DhEIvGVz7erFd09PqzspBRKvu95/N9a9ZbEvc77ZyXPQLtsOQT0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c2RiZ1E4TStlcndmcnZJWHc3YUJiMFhDa0xnbUVjWlNTa1VNejlncTM3TGNz?=
 =?utf-8?B?aHRzOXFNdXZGT1BObURWbHkyTTEzSkJZYW9VNTNtcTFucXZvUXZXa0FyS0cw?=
 =?utf-8?B?bjQvVzdMMENEWGFJWkI3T3p3M0VoeDdNUlRNR2R1OVVvcHRsem5GSzhod0Ru?=
 =?utf-8?B?VE5MYm9YZHB3MG90azMyNHo2NjVlUDBCUVFDK1UrRWRHZ0xCWHVzSlVCbVQx?=
 =?utf-8?B?aHQ4RGRIRDc3dkpPRVh1YmdkVzMzMmppT0lqbU1hckdIOXF1bG9UUmgwaFUx?=
 =?utf-8?B?aG1IdkVkRTVQa2poQllEcTBRL09yWitRNlM3S2M2alJYbTQvNzZINktMRE01?=
 =?utf-8?B?NEl2dEhnWTJXR1ErMmhHTTVyR2lFTmdqcEx6OGJNRnZJK0ZYMWtiMmg3NTZx?=
 =?utf-8?B?T08yazJmeDBhWHJTNDV1dFF6OVgrblUwa1pNTmhoSklEaTVnK3kwNkdtVlVa?=
 =?utf-8?B?NHJtWGNXWkJQMWVTZzJlVjJCZEp6WWNqbURVL0pFT3FVeWwxTjhLTUE5K0dl?=
 =?utf-8?B?dExVQlJHdDZLamxHV25kdDF2Wm9kZXR3UDBJZkh6TEtOY3AzeWx3dmhMZUlK?=
 =?utf-8?B?Q1hpVnRESGpLV1RvRkVPWDkxTUZjOGtXR0U1aFVodzNkTmpid3RIbldMNnB4?=
 =?utf-8?B?L3UwWTIrdzdEL2ZPeDVqZ0IyTW84cUFWbkI4c1BERzk1bzdRc1hHSjJYb1pX?=
 =?utf-8?B?NkpDeHpFamkveG4xWjllV2k5WWxkWm1VSVhwa0tlVE1iVVJ5QUQwdEI4WmxY?=
 =?utf-8?B?Z0VpMDRZNTg1R0Z5NDJnWGMrTWMrdUtqTm1NMHhHV3ZHcEo1WWpjcGpxT2RP?=
 =?utf-8?B?bzRuLyswSXNaWjUwRkpnT3grSThrcFpPdm9ycHMwRW1SVnhRcTRDdkZicklL?=
 =?utf-8?B?U3NNdmtnN25Rd1krdGFpSTJDL1hLK2Z0WHhZYVIxQ0NpNSsrZW9aT0Niemph?=
 =?utf-8?B?RUw4ZnNVWjh5TmtES2RScjZrVE9raElyT2RzQWw2YkhnZUtVZ0UvQlR1MWd4?=
 =?utf-8?B?NGRtMFZjZmxKZndqRFJsZ2Z5aWh1ekdFQjRaTGJrSVpUYW5zRWpvdkd4MFlJ?=
 =?utf-8?B?dlJka0RCWnIvYnB1TlUxMGFXbmNJTkFNd2tyeGR4Q1FRUU91ZFB3cy9nT1BL?=
 =?utf-8?B?Y3VYNVBFYVdyWFVlZ200RnRNNGRNb0RLNlBhU2wxL2F3MzRzT0R5cEZLVFc3?=
 =?utf-8?B?NnpiVTFROXl4cy8ycnZJYkZWNmdBVjRWcEQvK0JXNUUyL0pxYlNZbUlpMGZN?=
 =?utf-8?B?R05nZUZqT1YyUzRUcDFLRHZYMVBqWXJWVnVtaG1CQjRKaHJFNjBuWmVCRlNx?=
 =?utf-8?B?WTc5RTY5V2JEU0ExUnl0dThPTmxvMC9vUVdkcThxVTUwQmJiNklXZk1jV25T?=
 =?utf-8?B?bGVsRks0NHA5ZkRqZExpQzRkQ3ZMck9hUWxjL1FuOTN3ZDhSUTc4S2tJMDg2?=
 =?utf-8?B?ZmhCOHVLRjUzeldNWGFiRWNYamhHaTlyVU01TjZwWUs5cVhnMXRqaDlYaVRI?=
 =?utf-8?B?SDhyU1RDN2hTVVFoY21aNmo3N1ZyQUFYN2tyZTNCanFIWC9wak13R0RoVldm?=
 =?utf-8?B?SUtwL2FEUmt3TDlWNXhoOEpwWE90RUxsRXV2V1hoYXN5WSsrTWpvRXBwRkw5?=
 =?utf-8?B?cEt6b2lQNW5WZ3dscE55eERhYmZrK1VIOStPL0ZEbWZRVlhmU1haNkdPQmpH?=
 =?utf-8?B?bzZadmE1YTYxcXdLTVdrNURhaXdGSFk2WFd5MUVHK2JDVFRmOXV2dXBLcG96?=
 =?utf-8?B?TXdRU3dsMTNKaFhxaG9ZdDBMY0lkT2R6b0t2UUlyeW5mRWt4dzcySFVBNHJu?=
 =?utf-8?B?K3I1SHBQajQvRnd4LzFvME8wNDVFYWpnTEJuUTNGeEkwbE1nenlydGNsenp3?=
 =?utf-8?B?bjdVTm9lc2p4VmVydG9PMUx2aXZFMWQxTFhZMXlWTW8rRGM5OHhDYisxcUhu?=
 =?utf-8?B?dmp5M05OcWJTLzZDQko1K3ZOMXFFdlU1N2hhU2xNWHFSMTAxRWFpRFFqeVlr?=
 =?utf-8?B?d2RTYjI3VUZ6bWV3NzFoNVk4Z3d2M2VLNWNVWWtoVFNha0tnT3YyaTMyUUpL?=
 =?utf-8?B?TGFaUGhXbk5mZ3FVaHlnZnA4eUpOMjJGK08wMjRWVGRENm5OY09uUFlIMVFh?=
 =?utf-8?Q?SLMlfgHhak+o6iDO6XTsglhoC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE633E0A3BE3B04F9C5BB2C181D837C6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c90cb76d-7018-4c05-4456-08dc32dc5308
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 12:55:04.6391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWGpQkvIk23UmaV5jEjLsOQ99u8+p7b/tK6qGjHe9iB2W0GftuhVuC+77pm9fsfkwiuGraIHOyQ6rZt5u12+p2G2vizGAwk3sKp/HMTakEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2920
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAyLzIwMjQgw6AgMTM6MDksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBzZXRfbWVtb3J5X3AoKSBhbmQgc2V0X21lbW9yeV9ucCgpIGNhbiBmYWlsLg0KPj4NCj4+
IEFzIG1lbnRpb25lZCBpbiBsaW51eC9tbS5oOg0KPj4NCj4+IC8qDQo+PiAgICogVG8gc3VwcG9y
dCBERUJVR19QQUdFQUxMT0MgYXJjaGl0ZWN0dXJlIG11c3QgZW5zdXJlIHRoYXQNCj4+ICAgKiBf
X2tlcm5lbF9tYXBfcGFnZXMoKSBuZXZlciBmYWlscw0KPj4gICAqLw0KPj4NCj4+IFNvIHBhbmlj
IGluIGNhc2Ugc2V0X21lbW9yeV9wKCkgb3Igc2V0X21lbW9yeV9ucCgpIGZhaWwNCj4+IGluIF9f
a2VybmVsX21hcF9wYWdlcygpLg0KPj4NCj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQ
L2xpbnV4L2lzc3Vlcy83DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9oYXNoLmggfCAgMiArLQ0KPj4gICBhcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaGFzaF91dGlscy5jICAgICB8ICAzICsrLQ0KPj4gICBhcmNoL3Bvd2VycGMvbW0vcGFn
ZWF0dHIuYyAgICAgICAgICAgICAgICB8IDEwICsrKysrKystLS0NCj4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4gLi4uDQo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BhZ2VhdHRyLmMgYi9hcmNoL3Bvd2VycGMvbW0vcGFn
ZWF0dHIuYw0KPj4gaW5kZXggMTZiOGQyMGQ2Y2E4Li42MmI2Nzg1ODU4NzggMTAwNjQ0DQo+PiAt
LS0gYS9hcmNoL3Bvd2VycGMvbW0vcGFnZWF0dHIuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL21t
L3BhZ2VhdHRyLmMNCj4+IEBAIC0xMDYsMTcgKzEwNiwyMSBAQCBpbnQgY2hhbmdlX21lbW9yeV9h
dHRyKHVuc2lnbmVkIGxvbmcgYWRkciwgaW50IG51bXBhZ2VzLCBsb25nIGFjdGlvbikNCj4+ICAg
I2lmZGVmIENPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQw0KPj4gICB2b2lkIF9f
a2VybmVsX21hcF9wYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IG51bXBhZ2VzLCBpbnQgZW5h
YmxlKQ0KPj4gICB7DQo+PiArCWludCBlcnI7DQo+PiAgIAl1bnNpZ25lZCBsb25nIGFkZHIgPSAo
dW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSk7DQo+PiAgIA0KPj4gICAJaWYgKFBhZ2VI
aWdoTWVtKHBhZ2UpKQ0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+PiAgIAlpZiAoSVNfRU5BQkxF
RChDT05GSUdfUFBDX0JPT0szU182NCkgJiYgIXJhZGl4X2VuYWJsZWQoKSkNCj4+IC0JCWhhc2hf
X2tlcm5lbF9tYXBfcGFnZXMocGFnZSwgbnVtcGFnZXMsIGVuYWJsZSk7DQo+PiArCQllcnIgPSBo
YXNoX19rZXJuZWxfbWFwX3BhZ2VzKHBhZ2UsIG51bXBhZ2VzLCBlbmFibGUpOw0KPj4gICAJZWxz
ZSBpZiAoZW5hYmxlKQ0KPj4gLQkJc2V0X21lbW9yeV9wKGFkZHIsIG51bXBhZ2VzKTsNCj4+ICsJ
CWVyciA9IHNldF9tZW1vcnlfcChhZGRyLCBudW1wYWdlcyk7DQo+PiAgIAllbHNlDQo+PiAtCQlz
ZXRfbWVtb3J5X25wKGFkZHIsIG51bXBhZ2VzKTsNCj4+ICsJCWVyciA9IHNldF9tZW1vcnlfbnAo
YWRkciwgbnVtcGFnZXMpOw0KPj4gKw0KPj4gKwlpZiAoZXJyKQ0KPj4gKwkJcGFuaWMoIiVzOiBz
ZXRfbWVtb3J5XyVzcCgpIGZhaWxlZFxuIiwgZW5hYmxlID8gIiIgOiAibiIpOw0KPiANCj4gVGhp
cyBkb2Vzbid0IGNvbXBpbGUsIGl0J3MgbWlzc2luZyBfX2Z1bmNfXyBJIGd1ZXNzLg0KDQpEYW1u
LCBJIHdhcyB0b28gcXVpY2sgd2hlbiBJIHRvb2sgaW50byBhY2NvdW50IGNoZWNrcGF0Y2gncyBm
ZWVkYmFjaywgDQpzb3JyeSBmb3IgdGhhdC4NCg0KPiANCj4gU2VlbXMgbGlrZSB3ZSBjb3VsZCBr
ZWVwIGl0IHNpbXBsZXIgdGhvdWdoLCBpdCBzaG91bGQgaG9wZWZ1bGx5IG5ldmVyDQo+IGhhcHBl
biBhbnl3YXksIGVnOg0KPiANCj4gICAgcGFuaWMoIiVzOiBjaGFuZ2luZyBtZW1vcnkgcHJvdGVj
dGlvbnMgZmFpbGVkXG4iLCBfX2Z1bmNfXyk7DQoNClN1cmUsIGxldCdzIGRvIHRoYXQuIERvIHlv
dSB3YW50IGEgdjIgb3IgeW91IGRvIHRoZSBjaGFuZ2UgZGlyZWN0bHkgPw0KDQpUaGFua3MNCkNo
cmlzdG9waGUNCg==
