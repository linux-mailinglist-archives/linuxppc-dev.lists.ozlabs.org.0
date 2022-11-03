Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70636617893
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:21:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2xYd1kNcz3cJt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:21:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=f6m+jCZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.44; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=f6m+jCZL;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120044.outbound.protection.outlook.com [40.107.12.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2xXh324Xz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:20:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKqjCIoM1zD6U7RVo+xbje9tmfgmoTeSoIEMceJCPmUyZKqR7i17Q9nNzZsqj6skqtD6letsBW0p4LKjJskTGPBvxqtTHfiKHlBbxoDJbGpDQqZ3Ln3aVSQsJoOgJstN8b/0Hl746SZLpWmIy+76bZ+G/9f8fct/cbWEizJeYhMjwNlLMI6YUWH48NoAlSb4KqhjMGi1uG9XFm/l0Iky7VXrFBjTmAUb4mTq/yLe6m9CrovF8oqre3RoFSEMVA7QMIzkijGFZJroc995Cc6FsKI8pcYjl27td3ZBqcij6CDn4MRffoJrVZT7dIcuoJQeOLwgNqWjBrVJo5kTGc11hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKFx8DDy0Sj9ow13xUJIJdJ9Ujq2R0QZ0545Aq39il8=;
 b=PXfnr7lYt/EywiG1xHO/S4OQhhM5nmo4NYcAwDqR6A+l7gJKAQ/rxDNe3KhzNFi8l0eRO1MF4D1ukowIJjmP6mi18TXeNmh9LZSnvFT2wTmjMntDPWCbeezZuCladTpQ2ehtMsmLCMKHwf7CnG1zWEzlCCfwdJJcC2bA2MG8PuAz6IqF8lLFahD/PLlb7oXNJY2mhwCy8bKq9gos4Qk0JPpaNvrDRTdPyWvJRoAwuhQjQF4v59QB7khNS8Q+3LtO1pgcn+Y9kVLpqYCdaanM2paGKpbW9LPE+B49f3lZTho5rAiizjw7713GlxldScJx0og8qwoQtkTKbt9P9uhhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKFx8DDy0Sj9ow13xUJIJdJ9Ujq2R0QZ0545Aq39il8=;
 b=f6m+jCZLgAUOZhpZ7Pr7xgkv5MvlwJ698hoFpIohcThAb4KBfawnlC8mfGcFcssJxJPpx8URg77RRxzgMVM+6qchoNrwFOeDJg9jf+DX7ZwRmGf9QQ9zoo4pXoBxTO+VtvDgWlnBNX5LlCiEqGcRV17DeIeCiN05mBVbG9pYFOYW7mT/P4efsjhHcLVsl3hQdo/5aNn1bDxCAKhtTKVgD4LFoXzK4m8zIuYM6Q34qMvu5zE57HnqrVfeMVXHfE69sWMctzVLGmH2WVormjNNiloKe4T8UgexrrwICBW7isPlNTIsvND3rPNSOGXM6odPxONP+ohQ7x8CJb0kIyBcuQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2335.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 08:20:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:20:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andreas Schwab <schwab@linux-m68k.org>, Rohan McLure
	<rmclure@linux.ibm.com>
Subject: Re: [PATCH] asm-generic: compat: fix compat_arg_u64 and
 compat_arg_u64_dual
Thread-Topic: [PATCH] asm-generic: compat: fix compat_arg_u64 and
 compat_arg_u64_dual
Thread-Index: AQHY7SwHLUGwszFdb0+V/sqhAqAH6q4s3+oA
Date: Thu, 3 Nov 2022 08:20:31 +0000
Message-ID: <e384efef-460e-015b-26c0-53dd31fae45b@csgroup.eu>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-10-rmclure@linux.ibm.com>
 <871qqoyvni.fsf_-_@igel.home>
In-Reply-To: <871qqoyvni.fsf_-_@igel.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2335:EE_
x-ms-office365-filtering-correlation-id: 1f753611-d8eb-44b1-4560-08dabd744638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OzTNwC0IjJ2kWWNLD1+xu1+nbuPIRPUHTdE/da1oNZYB4tfO/QMwE11M3eAVkXOOIxmsX16ucsVWZGZN7vpcqTnPaESG8Qy5pqqLGKe5idW0cYkfx4aKa7Yu0SfV4wT8QwzuBwEC3Cj4sBmrQgR/j5iHv7MLxITuTFzyleRSEKIABkDeWsDnuM1ofizYD3+4hIXWrAwomfA0yPAkhyvDrdKAO6XYjX3P2Y795XR8zvDbHsR6gfFOQiy45oCgTAO9ARI60/0T7q136WlxGss1Pqh8+Htj3RroNQw0BdMiB5Bvnora6gemoCqp/hz/H0Sr4a9G7rELJjPpfh0VgJKSTYvJj7nFz0+B4PknlnBnJZ8w/mYaGP5EsgvhF/Pf4gunY2VYIcsOEFD36XLk6/kBvn2z11i5ezoHmeEJcQN6rdX388oMOSpc86/FI4LRAukJnaepY/uo942RZMuaucq3OHN8nJO9x+CzOgpUGNF1sm05RFvVEEGMt1OQULvJoO8GGReEQu2/slxLWgzIr/Ad8zhDHrzPfuU38XnlMEAEBEzF/gbTi1YeKhAkaplDZvrDKEGoWmAuMIZzTtQz/m6sBe0WYxyO6R0BGmiYwtqXK6+mc1jwg6RqmI0Pc6mO7zLxYpoxY+x188VmTsOrbxkyJOyblLodBNSCfAX9ZLGGUliEXq2i50evPD3CpjrU65TUUTXWrpWCpsmTRRhqE5JoYJaerxblvNVquLkR41rtDrVPVaKgHmBonUlGbvEgDOrvoPGpqKxh34LNoW2bNtFbggQizy/y6yzoOH+OHMOp84aJYZ7gGVVBl8jxW8Ah0MJ8EUu83EOz5OuXrN4FMNeDstHCEHCdYSuNJT0R65CsDs8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(451199015)(31696002)(66574015)(38070700005)(86362001)(83380400001)(186003)(122000001)(38100700002)(4744005)(5660300002)(2906002)(66946007)(66476007)(8676002)(8936002)(66556008)(4326008)(64756008)(6506007)(76116006)(54906003)(2616005)(26005)(6512007)(91956017)(110136005)(71200400001)(478600001)(6486002)(41300700001)(44832011)(316002)(31686004)(36756003)(66446008)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L1JCUjZQUExtWU8rMlRzQkc4amJnR28zTjJQcDNhbGtVSkpmQ0EvN3BnTFgr?=
 =?utf-8?B?b2FjV1h2L3N6dTVyY1psT2tOZDFwajFXQzRPZ3U4ajJjZlU0VFlaSjJQMjR5?=
 =?utf-8?B?TnF4ZDVlK2JSN2xLSk4wSlZpMThNeUd4Y00xaXo1TmtFYm9tODMrMzNQZmFv?=
 =?utf-8?B?NUMvMHlEQ3NhRXV2dVJWSGxDT1FYVnMreHkxZzdBMVhSRnJXSzYzMkhsRUpB?=
 =?utf-8?B?TFFrRjBNS3FTQXJWdDBHLzAvakdpaDRMS3F3MHk2S2ZEZG9icTFUakZWNkVT?=
 =?utf-8?B?QnB3alV0R041eWplMkpJYWE2SmJjTmRlYlB4aFNOdkFxU3FNSFY4NW55MUFk?=
 =?utf-8?B?YWtaMHJIajFoNGFJUlJnRDJGaTFacVQ1RklqZUc1WHJZNm5kZlBDUnFTQWNK?=
 =?utf-8?B?ZUJPRDBab3czTThEZkdKNVdhaG4xbENpODZINGZlVEV0aHU1NHlkSG5CNWQy?=
 =?utf-8?B?cXoyZk13ME5SVlc0TjdNNC9QbEw1VXpXVlRqZjF3Tkw3ZHVmWTkxQ1ZtMkFY?=
 =?utf-8?B?TkZmbk5KR3hEU3ZlaEZMYkxOODFtVVcrWGhzSVBXTjdpY2tXZDYrVUhOUlpF?=
 =?utf-8?B?dGtaZmIxcEp0SVpoSEZ0ZWtlV3ZnYlV4K0VxQ01kZXR4Y3prSEJ3NTlzUG0w?=
 =?utf-8?B?eFUxNytMS09zSHIyOHcrTkNQNzNsVWpEWlo2RWcyam56OVFYdXBDS2lVSnpR?=
 =?utf-8?B?VGRrT0NwNDRKbjQyTnA3cmowTUZQRTdobXNkUkNsbHl5TWFwaUJYR1JOejhn?=
 =?utf-8?B?MGZPckdOeWtJWHo5VURiSEd0dGo3WElKM3BRTUp4QW0wQ1R3VjRpazBPdWdD?=
 =?utf-8?B?WVoxakJIaWpUNk1DV3BtNTBXOGdPQ0tHL2Y0V2pBVytMSkp1Sm1ZVXhxcWIr?=
 =?utf-8?B?MzN1dkJocVN0R3RPaHBNdnJIY2JHbEs1TTJGbkcrekVOVWlaSldnMlFWMFdM?=
 =?utf-8?B?NVhSdDZOQXJaeldjakRtVm41Tk40bnBkSDQ0NzBhYkZJN3p5bHBkUVRuLzZr?=
 =?utf-8?B?ZWNpaUhwRFNJODVBaTZkM0xpQVZqaE5IZktncm1ZNGw0VFJlcE5XOU1rYUdJ?=
 =?utf-8?B?UmNBcHlMK2xsQTZZL1ZHR0x3M3RBU3F3b3N2aDFsR2lvMWZ0MW1BVDA5Z0hu?=
 =?utf-8?B?cGxqZmNJaHMwb3gycnRZT3haNGovS3lpU2JGdmpoZnBJR0s1OHpKTnJWYUhW?=
 =?utf-8?B?VFNlZER0cndxWXY4S0EzSEMrMW9heTY0eWwwdVVwQkFXVkNYR3lwSlAzUzRW?=
 =?utf-8?B?YTJNRG9NaFlNM0h4M3IyOXByUWc5NDRFcU5ubFN0c1VsbEwrUHkrWnExdGp6?=
 =?utf-8?B?czQyUWZ3K2pNakQwQWVNdE5mUERyYm42QTBNTGw4WGNjeHZIZEJLZTJYdjZy?=
 =?utf-8?B?d2J2Yk13ZlpNckxnNVl0aElxMHBFWTZoTk55MXI4Q3BDcWNEZGhXRG40NkJk?=
 =?utf-8?B?UlNrb2ExVG9FRDRTanAyRS81ZUJHRVJVRjN1SHRvYXZQdHdaZy9SMSsvb0pF?=
 =?utf-8?B?MTNyQ1A3ek5PWWZIRGVnY2hzS0FxM2lPdW9DWE5HOWFZb2kwRmNqM3BjakYz?=
 =?utf-8?B?cE44M2tDRFkzNEd0QXBtcytXRit5dThvanJ6YmRuZ0lQZ1IrSnhJL0Nkalp0?=
 =?utf-8?B?NVdKR1FjTk9sTGY4YkZoL0V1WEZob2htN1ZRSkIyd1RyVitJOENvRU91d3Vl?=
 =?utf-8?B?UjcvUkpwcm1iQjJZdzdJRDhoMk9aTnIrZUd4OHNoTDJKb2hEQUFLaHRBMjN3?=
 =?utf-8?B?OGRJR2ZtQlFmWEtBemhXR3dTNXdNa1Zza0FBamd2bXRwbzFDYWdTWHBpT3M2?=
 =?utf-8?B?NXlYU1VnblZrODNWbXRndlZTMHZGT0lSemZZL0UxZkNYU1orVVBFSkkzNTdz?=
 =?utf-8?B?SGQ3dERkd0lrRGxqUXhFZzdhOFNDclUxd1duL0FET1NNZEMyeSs4MmpJUkJ4?=
 =?utf-8?B?NXk4S09rM2doVEhIbll6NFUrYVA2RnRJbCtGQ1Q4S0JySjBzTWFyUEloVzZI?=
 =?utf-8?B?VDhkczJqSlplTHoyMWhLbGVmMUZpTTdSbFhBaWhsWERibXNqUmlMaDgweTlP?=
 =?utf-8?B?Zy9hNFlnVENTaHJNdFBFZFlXaE4waXNDMVZkcHRyNzkveHpudEVSM0k4d0ZL?=
 =?utf-8?B?ZVdmMzhHNjM2RTZONmVFTS94eGV5cmNBN0x3RC9BY2ZwWmFYUXBHMVdEeDF5?=
 =?utf-8?Q?cNmy4U0wUIj1VmU0ISYMneo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <719D5A129C790C4581EB73CE1EF26A73@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f753611-d8eb-44b1-4560-08dabd744638
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:20:31.7982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dp8UV9hReHB33jEpfMlg49xhJSKJp7NOwP3qf+xKoKOHSyUg69/zRDvohpBvOKfQnBN5NOxjd0GWmOfPN03p8T24WMV8+SiRdnGncAXF5RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2335
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Arnd Bergmann <arnd@anrdb.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzEwLzIwMjIgw6AgMTQ6MjMsIEFuZHJlYXMgU2Nod2FiIGEgw6ljcml0wqA6DQo+
IFRoZSBtYWNyb3MgYXJlIGRlZmluZWQgYmFja3dhcmRzLg0KPiANCj4gRml4ZXM6IDQzZDVkZTJi
NjdkNyAoImFzbS1nZW5lcmljOiBjb21wYXQ6IFN1cHBvcnQgQkUgZm9yIGxvbmcgbG9uZyBhcmdz
IGluIDMyLWJpdCBBQklzIikNCj4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBTY2h3YWIgPHNjaHdh
YkBsaW51eC1tNjhrLm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9jb21wYXQu
aCB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2NvbXBhdC5oIGIvaW5j
bHVkZS9hc20tZ2VuZXJpYy9jb21wYXQuaA0KPiBpbmRleCBhZWIyNTdhZDNkMWEuLjgzOTJjYWVh
Mzk4ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9jb21wYXQuaA0KPiArKysg
Yi9pbmNsdWRlL2FzbS1nZW5lcmljL2NvbXBhdC5oDQo+IEBAIC0xNSw3ICsxNSw3IEBADQo+ICAg
I2VuZGlmDQo+ICAgDQo+ICAgI2lmbmRlZiBjb21wYXRfYXJnX3U2NA0KPiAtI2lmZGVmIENPTkZJ
R19DUFVfQklHX0VORElBTg0KPiArI2lmbmRlZiBDT05GSUdfQ1BVX0JJR19FTkRJQU4NCg0KQ291
bGQgYmUgQ09ORklHX0NQVV9MSVRUTEVfRU5ESUFOIHRoZW4gPw0KDQo+ICAgI2RlZmluZSBjb21w
YXRfYXJnX3U2NChuYW1lKQkJdTMyICBuYW1lIyNfbG8sIHUzMiAgbmFtZSMjX2hpDQo+ICAgI2Rl
ZmluZSBjb21wYXRfYXJnX3U2NF9kdWFsKG5hbWUpCXUzMiwgbmFtZSMjX2xvLCB1MzIsIG5hbWUj
I19oaQ0KPiAgICNlbHNl
