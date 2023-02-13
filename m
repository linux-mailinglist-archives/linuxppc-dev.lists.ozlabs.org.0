Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE031695160
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFwP054H2z3cF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:07:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=sEt/QjVU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e1b::610; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=sEt/QjVU;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFwN61bnbz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 07:06:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4+TZUcYB95c4qXnXCl4UTKrjzslTjG4jyJLRofWkLPRirY0aa2gn0ubb0uZR3obU1Lg+ipLrGoFSlVv2LhXk8+AShViXZxCXZTkGDQYZz7BCzK+vZkHXCeWb+CrDFL9frnnBIE+5dtYkItyXjWEN+wFxiFFJV+KJPowJtDItJljmX3PlPFdlh6Dslam6gARIAz07zHUwtrv3JELFsJ4cllQRUmWFDMXkpR3n4A5yyKRmJrZqZyzMljIgNO/AbgoxcENvUc91R2SI+owihnLKQN4E9loPmt3udTOE4jVg10G+vU3XHgulvRKdVoii0JLYRvABCBxMaI3zYyYKT1uZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06TEoIA72djlRCL6kFBOdwYdDv66p7jxat0Wl7JPuwc=;
 b=NgRq8cPaMrICeBmMLIuBkEq2TJgCtTYmhnbuB+woHxttTot7gsCJWw5WfRRmuITt6SNy+MT4TmPS8beiBCgI6RTQZ8mqpUVayNRSrVSXXiIRY2HHhvTEIzzcMiztGaf+Joqc+h/ot+1859lO/sEjzOeNsJTXOtw6do3U1w1j0j8VjNKU6udPV3XgvNbsxzk/A0YtGQkv6ZWsAInbRhA5SQDZWEqaMiwKicn7+vxodNmuvanaHRopDe/AzIcAa32cpp/XLsvWCbx4LYtvbR4KA0zNXlG90yhCOYRuOsoxBoGc9DBtfpZ9pdE9BHQNuUe9gcOCw9nFb++4OLfvXDV+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06TEoIA72djlRCL6kFBOdwYdDv66p7jxat0Wl7JPuwc=;
 b=sEt/QjVU8fx/jbTs+d7kSjeualxWM8Rm5Di5bAfrShzrr7Env1/ivwG3P9QfBX/i5miLC1UYPtkTSW+xwAh3vMLDzueoGDDwEiy2QUrQwvNSaY/Scd3tWC+f7SLipyNbEThm8/oZYHWYBxJ7WjWdiBQqEnF0mjfyLgyhQMPCVH88QsEFceETKzQj4FBq3LWQ7qQ9eqJ71t7pWiNCAWL90aTSRIpTcLBS9s270LxJz+32EksF+eGxJremIoFHTIq1zxTVhxbhAxn5i9ewFHVz/tobwKNEdKFn/pHnMLShXWIVEiPGvBszV9HnKz8Ix20obGr1iguRQkk63PDlMjP2qQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 20:06:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 20:06:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood
	<oss@buserror.net>, Sinan Akman <sinan@writeme.com>, Martin Kennedy
	<hurricos@gmail.com>
Subject: Re: [PATCH v2 4/8] powerpc/85xx: p2020: Move i8259 code into own
 function
Thread-Topic: [PATCH v2 4/8] powerpc/85xx: p2020: Move i8259 code into own
 function
Thread-Index: AQHZF90EtKTKHD5mTUqgm4K5FfUPDq7NnZMA
Date: Mon, 13 Feb 2023 20:06:27 +0000
Message-ID: <0953ffd2-dddc-2706-66ab-d6913eff19df@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20221224211425.14983-5-pali@kernel.org>
In-Reply-To: <20221224211425.14983-5-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2189:EE_
x-ms-office365-filtering-correlation-id: 6fbfd007-6480-4277-6d7d-08db0dfdca59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rXlTtQhUmOKBhrkYM9pGdk80SyTyxqMMtx71Iz9OeG60Dml/JRrpjSEvnNgIDiXIX7hYKmsCzgrLQcdyCl55gkNNCRNt6kaDC+hIE/B9MqSXELyLRaKCzZMrOwM5KH16djFuTn1tsIdQbN7gu+qseb/J6RVKRG1419+Z+bvr1CxkDg/Ghi3D6R/oMxMmgMRgyGALqX0tZuHKQxA8STM3nTIc3nc56W6JC2/p7BVWUwZ/jPDD5wq97kzc2ASdB3ZHGtacZUVxXHNzNGHdjcVzOWkA+nBWHG5yvdkVdmEJKh29lISGo1XsEUnCa727dQHVFOqs9U+8xfQd3v0j31S93pYFfw8kBOJWTU5B5cnZpDCMs7lNwuRwx68gjVdotagzVpgQRwVapPArsevuCzvpdnJXw20rdIbDx7fpwKr7jaUKywfqoWWD2tQzYh6wZTRd5yCw6bQV5LJOsNfGFcMc4LOlcV9ZzgY+I2l3lYi84Nitdq4bnQ+ushFXABMSWDue5ABUIGNCM1iY12yFYYlJehyurGEvEAqbwymAnDXPbE8wTuHwYLfj5M/BMqchBPhGkugD+M/WVz3bCq6P/U2hSdzqSR7qSvLB32OE/1kYdGc/l19OYXm++sNfMBeUIrtbdxUwU5q8KoMfVdc0RDYjr+TxXrxU2YfCMdrVBSSkON1h+dmm0vKkp6O0T0yTvkcP6rdceelc3CcleS+RdUMWDcMOb+iJ3i/KgxEKG5mr2rVPzilwjPp8fvSGxapSVp52+cI+Hr4Wgwefi/6FL/s8cw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199018)(44832011)(86362001)(31696002)(2906002)(38100700002)(122000001)(31686004)(110136005)(71200400001)(6486002)(6512007)(26005)(186003)(6506007)(36756003)(38070700005)(76116006)(91956017)(66946007)(83380400001)(54906003)(316002)(41300700001)(4326008)(8676002)(2616005)(478600001)(66556008)(66476007)(66446008)(64756008)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WTdQZldQa0VnS3I1bktOZVFCbkhaQytScUNQV0RqQ0REanVYbm1XUlhtbEhO?=
 =?utf-8?B?VnBNeENzZFhKVktTWjk2VFNaMnZuVjJWRTA3SXNpQmlxMUJVOURUcWdBdDUr?=
 =?utf-8?B?Y0NkU3BEbGFDUkYyR3JZQzgxcjFoRUZUNHlNTWRQdCtwT3cxdkliZVg1R1lw?=
 =?utf-8?B?eURiRVdTT01yamhPcldrQVBtMWVYdSt3N2xhakRhaDBUV0ZsVFhFMTNHejZa?=
 =?utf-8?B?dkpMRUFCa011enlsVU9sQ0xXeWMrNjNJRnpCa1FVMnh1Q0xGWndic2g4T1Rt?=
 =?utf-8?B?WHZoSHhoNUw0RlZRQVA5WUVPWW41cU1mQlc1ZUwxc0xZN2h2Y01WMXhIaU9L?=
 =?utf-8?B?QmFjVDNFb0kyRlpxeDdxUG9aamw0RUtLQm1OZ0RuL21lY0dWY2wwTFpGWlJD?=
 =?utf-8?B?R3FETmR3YUYrbDdERjdQUU8yZHN6YmsvYVpndWVaQXRiaURic3VQU1ZTaisy?=
 =?utf-8?B?eE1aelY1cXJZMGhURWpjZitkdUpNeGhLSTdGaU9LODl6Vks3RDZLMzB3cHNp?=
 =?utf-8?B?N2ZKWVdFNEsxenJyazBNVnRRdGNNNU1DeW5jcE0raE55RmxLaS9kREU1WHZo?=
 =?utf-8?B?Wjh0ejl4a0NSenB3NDJ4ZmNCN1ZLTGpUL2ZWRjNsNHZDYW5MeFR6dFFTcDA3?=
 =?utf-8?B?ZXQ1eGRBMWVUenVrbUFMZUdiZGpZdlNGYXY4b3RJVGdQM2Y1SWZEd1A0WTQz?=
 =?utf-8?B?Y2liT2pkNHR6NTBKWUk2MmVKNU9RcGIvK3lyVXY3Sm1XejVDZTlkZDZYMDI1?=
 =?utf-8?B?N2o5QTRWMkI5THk4UTRBb0RsY1M5YURiQU1yR1p0dWF3YitHRXhCYSs3bmlT?=
 =?utf-8?B?SUxUMThlSVladEtSdHQ3dXdOSms4YS9uakYrbFNDbktGTWVsc3VIbjFYOTF6?=
 =?utf-8?B?MWk5Zlp3em12aHkydWxyajRFZ0ZnTHltSE9VZkZMQVlqK2NOK3FjVy9jQzRC?=
 =?utf-8?B?SzNWYjlZMi9YKzdlTHJLSDJlUHhVYjRGZUZsS0o2MzhDQmZPZmRmaXpXZzYw?=
 =?utf-8?B?bmlnVSsxbERsb0Zhd0Y2U01ySVpCR2MwOGthemZOYjN1MjNmc2E5T0pUS1M0?=
 =?utf-8?B?TTE1VEI3NzF6SmdPQjI3aW9WdnhoVHVraHNrQ3MvZXk2UVo5NHlQM2ZFSEtL?=
 =?utf-8?B?enJ3ZGZZL3dQemQ4dEVyMUFadlhlU0wvWlRQdkN3b0NWZmVkcWU5eFl3MkVs?=
 =?utf-8?B?TU1zRUF5dFhGVGRYUC90dDloSVJ6L2tSZnpRdHFSbWNmUU1PQUZPRjJGQVJB?=
 =?utf-8?B?S1haS21nc2hzQk5GeFVpdEczbzFOK08xbnFrbmU0Z0dxeEFCR0llMVRzaUhu?=
 =?utf-8?B?eVllVm5qMlg2NTdYeWpoVWZZWEoyaTd1VDBRMHYySU4ybGViYm1nTnppaU16?=
 =?utf-8?B?U013ZUN6S1R1U1JRY296ajVwMTRJZFFjMEE0cC9hWG03RlJXYndjZVBZd1Jk?=
 =?utf-8?B?QUJLVXpDejJmam9VcVo4TDBxaGNaanhRZWFxM0VZb29FWmpuL2NhZzNqUWJz?=
 =?utf-8?B?K3Z1b2xlZXBPTmRzZ2FweEVKcklkSkIzRGs5RmsvSUpFbnFhNDVwclNveFFV?=
 =?utf-8?B?MllscG1qZ05mZXBIdHJJM2VvV1NxbGMzNkV6VXFsTHl0RjZPU0pIRWlrK1Jr?=
 =?utf-8?B?SnpKK0hMMVltOHdMZ3k1T3ZIM0s1T2JWZWhQYXdVRWQrVFAxR3gvNW1CR1Mw?=
 =?utf-8?B?eWVlYTFnb2VaM0c1UTFweFkxYmJxNFNzWlEycERYUGRudDc4allPSGhzbC8r?=
 =?utf-8?B?YnVITkxVOWR3eGRNRVY3MHljS0k1eHpoYm5pRFFiR0NXWnNZQ3NSOHpNUDRw?=
 =?utf-8?B?S015eEl2d0hNYU9aaVEyRmRhM1pubVkwblRCdDA5VGVQSDBRWXVNaTR2V3Q4?=
 =?utf-8?B?ZW1VSGRXc2k4WHJoaTRUU2N0WGFEeVJieGJWRTBzTDlrUGUydkt4VitSMk51?=
 =?utf-8?B?NDVYcFpEMThacTI1WEZ3OFRjRklJdnNNWXVuNTNVaWE5TWZEKzFMUDhDVUpP?=
 =?utf-8?B?c0h6YzA3OXpjcDZoZ3V3N29VQjN4aEVzRXJaWFlyQUIwdXYxU0IrOTdxYmY0?=
 =?utf-8?B?bHd0S1V2T2c3dnlaSkd5Tzk0V2VwT1RkVDhBR3BUVXBkU3U1NzBqYkhDMnBu?=
 =?utf-8?B?aUtheXhEeGdMT1ZHTW5CbEw5VndTMWo1RGlrUHExNGI0SytyS2I2ZnVRdElj?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <368940C70DA1334793F323F514C72E2F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbfd007-6480-4277-6d7d-08db0dfdca59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 20:06:27.5489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJ3h4Ac0BLMo+EyWGa+DH9amn01pxo5uahgK4WAidZ2fyaH3afXxZHA47jpClaJLfidN0UI5+GmLUYQQrO6b8HO4aH4Pa2fSrNPcqEDoQoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2189
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

DQoNCkxlIDI0LzEyLzIwMjIgw6AgMjI6MTQsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IFNw
bGl0cyBtcGljIGFuZCBpODI1OSBpbml0aWFsaXphdGlvbiBjb2RlcyBpbnRvIHNlcGFyYXRlIGZ1
bmN0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9wMjAyMC5jIHwgMzcg
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgv
cDIwMjAuYw0KPiBpbmRleCBkNjVkNGM4OGFjNDcuLmI4NTg0YmYzMDdiMCAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMNCj4gQEAgLTQ1LDYgKzQ1LDcgQEANCj4gICAjaWZk
ZWYgQ09ORklHX01QQzg1eHhfRFMNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1BQQ19JODI1OQ0K
PiArDQo+ICAgc3RhdGljIHZvaWQgbXBjODV4eF84MjU5X2Nhc2NhZGUoc3RydWN0IGlycV9kZXNj
ICpkZXNjKQ0KPiAgIHsNCj4gICAJc3RydWN0IGlycV9jaGlwICpjaGlwID0gaXJxX2Rlc2NfZ2V0
X2NoaXAoZGVzYyk7DQo+IEBAIC01NSwyNyArNTYsMTMgQEAgc3RhdGljIHZvaWQgbXBjODV4eF84
MjU5X2Nhc2NhZGUoc3RydWN0IGlycV9kZXNjICpkZXNjKQ0KPiAgIAl9DQo+ICAgCWNoaXAtPmly
cV9lb2koJmRlc2MtPmlycV9kYXRhKTsNCj4gICB9DQo+IC0jZW5kaWYJLyogQ09ORklHX1BQQ19J
ODI1OSAqLw0KPiAgIA0KPiAtc3RhdGljIHZvaWQgX19pbml0IG1wYzg1eHhfZHNfcGljX2luaXQo
dm9pZCkNCj4gK3N0YXRpYyB2b2lkIF9faW5pdCBtcGM4NXh4XzgyNTlfaW5pdCh2b2lkKQ0KPiAg
IHsNCj4gLQlzdHJ1Y3QgbXBpYyAqbXBpYzsNCj4gLSNpZmRlZiBDT05GSUdfUFBDX0k4MjU5DQo+
ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2Fz
Y2FkZV9ub2RlID0gTlVMTDsNCj4gICAJaW50IGNhc2NhZGVfaXJxOw0KPiAtI2VuZGlmDQo+IC0N
Cj4gLQltcGljID0gbXBpY19hbGxvYyhOVUxMLCAwLA0KPiAtCQkgIE1QSUNfQklHX0VORElBTiB8
DQo+IC0JCSAgTVBJQ19TSU5HTEVfREVTVF9DUFUsDQo+IC0JCTAsIDI1NiwgIiBPcGVuUElDICAi
KTsNCj4gLQ0KPiAtCUJVR19PTihtcGljID09IE5VTEwpOw0KPiAtCW1waWNfaW5pdChtcGljKTsN
Cj4gICANCj4gLSNpZmRlZiBDT05GSUdfUFBDX0k4MjU5DQo+IC0JLyogSW5pdGlhbGl6ZSB0aGUg
aTgyNTkgY29udHJvbGxlciAqLw0KPiAgIAlmb3JfZWFjaF9ub2RlX2J5X3R5cGUobnAsICJpbnRl
cnJ1cHQtY29udHJvbGxlciIpDQo+ICAgCSAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUo
bnAsICJjaHJwLGlpYyIpKSB7DQo+ICAgCQljYXNjYWRlX25vZGUgPSBucDsNCj4gQEAgLTkzLDEz
ICs4MCwzMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbXBjODV4eF9kc19waWNfaW5pdCh2b2lkKQ0K
PiAgIAkJcmV0dXJuOw0KPiAgIAl9DQo+ICAgDQo+IC0JREJHKCJtcGM4NXh4ZHM6IGNhc2NhZGUg
bWFwcGVkIHRvIGlycSAlZFxuIiwgY2FzY2FkZV9pcnEpOw0KPiArCURCRygiaTgyNTk6IGNhc2Nh
ZGUgbWFwcGVkIHRvIGlycSAlZFxuIiwgY2FzY2FkZV9pcnEpOw0KPiAgIA0KPiAgIAlpODI1OV9p
bml0KGNhc2NhZGVfbm9kZSwgMCk7DQo+ICAgCW9mX25vZGVfcHV0KGNhc2NhZGVfbm9kZSk7DQo+
ICAgDQo+ICAgCWlycV9zZXRfY2hhaW5lZF9oYW5kbGVyKGNhc2NhZGVfaXJxLCBtcGM4NXh4Xzgy
NTlfY2FzY2FkZSk7DQo+ICt9DQo+ICsNCj4gICAjZW5kaWYJLyogQ09ORklHX1BQQ19JODI1OSAq
Lw0KPiArDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQgbXBjODV4eF9kc19waWNfaW5pdCh2b2lkKQ0K
PiArew0KPiArCXN0cnVjdCBtcGljICptcGljOw0KPiArDQo+ICsJbXBpYyA9IG1waWNfYWxsb2Mo
TlVMTCwgMCwNCj4gKwkJICBNUElDX0JJR19FTkRJQU4gfA0KPiArCQkgIE1QSUNfU0lOR0xFX0RF
U1RfQ1BVLA0KPiArCQkwLCAyNTYsICIgT3BlblBJQyAgIik7DQo+ICsNCj4gKwlCVUdfT04obXBp
YyA9PSBOVUxMKTsNCj4gKwltcGljX2luaXQobXBpYyk7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdf
UFBDX0k4MjU5DQoNCkNhIHdlIG1pbmltaXNlIG51bWJlciBvZiAjaWZkZWYgQ09ORklHX1BQQ19J
ODI1OSBieSB1c2luZyANCklTX0VOQUJMRUQoQ09ORklHX1BQQ19JODI1OSkgaW5zaWRlIGlmL2Vs
c2UgPw0KDQo+ICsJbXBjODV4eF84MjU5X2luaXQoKTsNCj4gKyNlbmRpZg0KPiAgIH0NCj4gICAN
Cj4gICAjaWZkZWYgQ09ORklHX1BDSQ0K
