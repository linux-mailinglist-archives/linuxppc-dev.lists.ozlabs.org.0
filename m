Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4E7BFC26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 15:00:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=gCmdUZLg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4bbn5628z3vXy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 00:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=gCmdUZLg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4bZr3dJ6z3cBs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 23:59:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkEu2yXM463FX20tUdqGNVPIJjGXwoyuNWG2Zc5Q6WWrzhfZTFm6UOuvpGUpnaDsZhOOPV68rXdzz56AwuTNr5M5pl37Zn5RLELuo+tAEfdJJ7bki27EjCWwpwnmHdQQQsczctECWB44P0QOP6HI1No0mw/5Ux5a0kBSy0YWxqrT20hq88Dc9CsNfXuorqn7tXgNEwiAedqG6uImnRqrg+CKIFTQ47ML+J1Telfi7OMW83Ed/QEBekd96geqeU9ZgSQyRAjT6MAMtkVIW6+gjgfi1/z7b7vW1DRsB7jGM4MHJYENBSmI1L7g4N1K90kNjGRT9PC6d69CBo3+agJPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsNJWx/gUNgVAn3VZnzjtHUeS0rGDcIBPpExtt5sDiM=;
 b=ZPXmPA8VQS6icuz3MlKbblHErO16gId7n/hIzWQDFsU92/a6JqYBM88O7CqFdYW8u/O71EOC35gQKw3T+0RYQ5+xka5z1Wgcln13vFNONOZ27nAXbIcXMBBssAEd22vlNjcHHcpXlvSLEAxMD0OLS7gZQuiYzUrmIb6enyCB2lgmY+3X9nKcCrV7o72uvtYLpgVb4AAHzzZNHOG+bAqBhWnmTKj6XFrWQF7a/gNPaw1Kb1ZfJD3/jJtBacTFf/zQiENqqAjZWzk87o+zhgR97V0AHrp3Fl0aGrunaDJGX4SDIZENDpRnXrLiWT8j/VSsea/znBWm11obsksAGXrpPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsNJWx/gUNgVAn3VZnzjtHUeS0rGDcIBPpExtt5sDiM=;
 b=gCmdUZLgp19cSS5XOduT4wv46WL+K+bb7psibb3I/vz1e9tKBeCkq/mCpVW5cSydICW3RdhoWhYqmLaTwA/genOut5imsXikVOYfKg/4L49LLYk82aHTAR/T6IYVaPO236mhAQe8E/M95rrnQyFuQlvBXg5dfzBtk+SnLP0Drh1awdANddSf1Bi2Kyyzo7Qx4fb16s0mmHLtGhyLlJcmyQMVsweDB6Er+LudpiCFKELWxMqkB5SbJg3GcktANiZX/TOFre2I4Mkn1jkrTTzUIwXEOtsX2oizEnI97d3Mnn6SPOHtMqrqpHDl27e+OIUnhrDZ1uy5UMwdmlsaUVBT0A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2173.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 12:59:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::165b:8c64:6165:9049%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 12:59:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/47x: Fix 47x syscall return crash
Thread-Topic: [PATCH] powerpc/47x: Fix 47x syscall return crash
Thread-Index: AQHZ+2+kjYfTmbJ1kkaEA8l3L1kms7BC/DuA
Date: Tue, 10 Oct 2023 12:59:07 +0000
Message-ID: <bea1a936-78d2-acf7-c362-59d263f98164@csgroup.eu>
References: <20231010114750.847794-1-mpe@ellerman.id.au>
In-Reply-To: <20231010114750.847794-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2173:EE_
x-ms-office365-filtering-correlation-id: 667682c3-9783-44e0-fef3-08dbc990b0b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  J9xYtp9Y8LJFODBybRavw5kYf9eqmT9eLg4anHe7S/IZ/awnAkR7B0LftsouTKicH45EvjrZesPJXfEuczoCGYepgB5yp2qxF4tNwMWQPk6Aiy36HxGxgFZRJTxbMdwF0fVMnax/bqeJBQ+NNemmg9sxzrm+Bh8+wKalbEGCUM//+aYTevMgd9hFBTXwR9NnWNES33eQGgnkQoOocYC9SVB5pejJJElDYrB3H7SQk6xF5kWg7/Q5GGRvqGWDMKVowZD59PASTD2I8+iU2+cUYEITVTVnu+DvwFn99fHiWK9DrSMvi1xSt7Bkkow92wL/h8dWmK7XLvC+zSrzaCY3xV92Fd8G0LUqhXwS7bynzkqLWdn0jFkEykfSajr/f8vUpT7Sx28m3DRWww1j1e2ZofRfyBJZolMmMeakdNUXQHm+Ejl/8Xw0CesF1pFrwzcCaHbtc7wXghPVpbGYesL58zDQpGQvrr7QbLotGHxNudo5V82zLJ+XznysIg3AQFf/IPfZGy/hCqew0MEIehlWyFrbcBLgq+vsFbd8+V3bsdpzBcwCGp8S97WoaykTm95NkGSBqsM2THrHyrleuPM3L75Tq8kmVNVI7CQmEzn6Pc8aoNMKg3IbbGHnnZUM2q9pMLMGjGg223vd45lCQcP7Gk6BcGLPYI9qGTP9mMYuAbU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39850400004)(366004)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6512007)(41300700001)(6506007)(44832011)(8676002)(8936002)(4326008)(5660300002)(36756003)(38100700002)(122000001)(31696002)(2616005)(45080400002)(91956017)(110136005)(66946007)(71200400001)(76116006)(66446008)(66476007)(66556008)(64756008)(316002)(31686004)(86362001)(38070700005)(478600001)(83380400001)(6486002)(66574015)(966005)(2906002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFhGMWNFcWs3cWdLU0xFUU9seUVDVGhmN0lhMllqTzJNV1JkbTRuWm1FQ3Ny?=
 =?utf-8?B?QjdyVTlLREtBa0Y1d3FrTE9iZzRxUGlRYmdQQ2ptQkprKzdleHdMYlNHZC9M?=
 =?utf-8?B?OThYM2ZxWTJ0QVdQZmUrRklCVmpWZDNtRFdWMzR3bUJYbkJPbFdiNmpUTUpp?=
 =?utf-8?B?Z3NLcFdWMDZuanI5UXhjMGc2Q1kvcSsvbTUwNkM2ajN6VUViTm05Y0dzNVlw?=
 =?utf-8?B?c1d4cVNHNGVuR1BOWXdyQ3loaXBOM0tGejZyTzc0Y21vcU5VL1JnMXdCdWN2?=
 =?utf-8?B?SFYzNWdNNzBjSlJHM0wwOGxMZUx5aE9LMVlvZDg3Wk82TSsvWGJveUdjMC81?=
 =?utf-8?B?Uk1SVEIxTnIrMUZwa0tCczF6c1hwL1dSYWwxS3JDVkExc0J2dVAwc2NJVnJ1?=
 =?utf-8?B?VWc0T3lJdFIvL09VVzVRU3F2SUdldXlIanRYWEZraGgwYVhxT1M3Qjk2NjVh?=
 =?utf-8?B?L1FHVUo3QUxRRS9jSmVKbUw2Z2VVWWJGK1pXb3VsYS84U3VxZ2NheU9lbUZR?=
 =?utf-8?B?ZXhEOXE4TlVOcG5kYlgvNGl5U00yS2dYaUdHc3hOaWxna0E0ZWNlaUYycXF0?=
 =?utf-8?B?NUpCZU92M0VUYVJVcHpEdU9rMU04d1UvV2lWY0RPSUxvVnFNVXNSMmU4ZnY4?=
 =?utf-8?B?WTUzSC9aVUVmZEdNd0dsbFNOZURnRDRIcmR2Rk5SRUdwZ1NDc1N0alVtY1Ny?=
 =?utf-8?B?QWhHWXFQaWZMNUdmU2hFOStsaHhQZmVuRHpxRGxHUUJrVGVCdjI5QWhXQXV4?=
 =?utf-8?B?YSt3OXVZcFB0L3p4Vit6LzJBVlRyd3pjY0tUQmJBNC83OVFCMlJUV0lERGkr?=
 =?utf-8?B?aEdJVCtZMHEvd3pXT25DWmc2S2paaFZOejVmZkFiTHRWRzIwdjFHYm1hMTdE?=
 =?utf-8?B?SFllOUd5WVhMK0x0VEY5SS9uMzdVWVdlVXBqQTVZV1dQeFMyUmlZYzVBZ3o0?=
 =?utf-8?B?WVI4ZUo1QmpCN210K2RKZEJSOVBLVnNzU2NHUkNWSnRFU0tSRGNaSEJXN0VQ?=
 =?utf-8?B?TEVrTXJENjMzdXVtNHhCQTlUTXdZMEoxU2N2WVVsYTh5ZGNJaU9FQ2gxQW9z?=
 =?utf-8?B?Sm5iUlBMenNNSTV5Yi9VaUMxSkI0a054Sk5qMGhVV2tiZTRraXFLdlA5MTJk?=
 =?utf-8?B?a2U3a2RpcWh3M1FpSVNTZFhnN0w5a0ZNVXlBVmUxMDFjWVFqaHJtM2RzQmhH?=
 =?utf-8?B?Y1pFOExrQTBlVi9XWklwaDFiMXF0dk8xckppUjk0cy8vZDVjdzExSGtDMUMw?=
 =?utf-8?B?MVdUQzBnb0JoWGNNM0NDdGZla0U3Vkd0dlJ5UnpGSW11RWlZSERsSXBTUVJu?=
 =?utf-8?B?eG9jbTB0VytOYnQxMzlQTnZGa0plZWFteTVGWkhZVzUxSkVqcWY0L21pUFps?=
 =?utf-8?B?Zi9uMTFUbXFnWEQraHljaDM3Ty85V295cnlwVHplYWQzR3BIbnRtak9MS3ky?=
 =?utf-8?B?T05UeUgwQTFDL21XT0Z1NGZHMUVSZlB3eXU2R1M3blBuY0hSOHBrRmFQTVpj?=
 =?utf-8?B?b2o2RThVTFFEUlUwRG5rT1Q5bmcrMDN2R0dWWEkxU1plZ2ZvTFBER0ZXM05D?=
 =?utf-8?B?c2U5MlVOUnBNaE9SSVlNeEVuRlRDVTZpaWJNVkZickxnL2xOdlVSSmNneUJL?=
 =?utf-8?B?c2lWM2tMR0U4ZmkxaFlLTEoybkpUendOdXV3a2Q2QkVnSHJCVi9sNHJuR1lW?=
 =?utf-8?B?RjVTQWtPdW50c3Z1clFVVVBlOVd4UHpNVTBUYTJ3cllYYmVJcCtUNkxsTU54?=
 =?utf-8?B?YUhlMGtCaUxocW8yeGhZNW1adUJCZDFIVEFOejNsUmFqUExIeXpGVXl6VVEy?=
 =?utf-8?B?UWlkS0ZhblhHQml6STRPVjlRVHlQSGpCSlZEdFFkR0lYd0pWM0Vrb0FJbklN?=
 =?utf-8?B?ZmZwOFgwWVpNNzVRQ1diTE02QXNMVklMckxuVHRsVkwzYVJZUG1ES3Yzdloz?=
 =?utf-8?B?UG5lTzA2Yk1IRHR6SXhVQ09CYkR4QS9mdzJUelB6VzcyMGYwMU9tdHZLV1Nq?=
 =?utf-8?B?b0VpaGlMaGVZYzhpdW9qeTZBcDY0WS9PRWtRSFVqWWF0Q0NCNTNKWnVXUHJi?=
 =?utf-8?B?blRjMVlpaW9FT3lha1NMeUxNSWtBbFFHU09rb01peHFtakpIMUtnaGc0MW5h?=
 =?utf-8?B?K255SEMxWWN4WnVOTHhyR3NKbEwxNDkvWWtYUjE4cFg4Q08vVUtaRnpnZ0xE?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35EF50DBE1F9544C87399AFFB8A51309@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 667682c3-9783-44e0-fef3-08dbc990b0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2023 12:59:07.9743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWPU6ZTV8hr7peRmX0EZU4rCckBKtNIPtUmDTxjl66JXIe/DKK42Xy+zVosL1GSf7WGDOohLYfXplwmRSEcqnj6eIqKn64ZGqazo46Rcil4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2173
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
Cc: "eajames@linux.ibm.com" <eajames@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzEwLzIwMjMgw6AgMTM6NDcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gRWRkaWUgcmVwb3J0ZWQgdGhhdCBuZXdlciBrZXJuZWxzIHdlcmUgY3Jhc2hpbmcgZHVyaW5n
IGJvb3Qgb24gaGlzIDQ3Ng0KPiBGU1AyIHN5c3RlbToNCj4gDQo+ICAgIGtlcm5lbCB0cmllZCB0
byBleGVjdXRlIHVzZXIgcGFnZSAoYjdlZTIwMDApIC0gZXhwbG9pdCBhdHRlbXB0PyAodWlkOiAw
KQ0KPiAgICBCVUc6IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIGluc3RydWN0aW9uIGZldGNoDQo+
ICAgIEZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4YjdlZTIwMDANCj4gICAgT29wczog
S2VybmVsIGFjY2VzcyBvZiBiYWQgYXJlYSwgc2lnOiAxMSBbIzFdDQo+ICAgIEJFIFBBR0VfU0la
RT00SyBGU1AtMg0KPiAgICBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gICAgQ1BVOiAwIFBJRDogNjEg
Q29tbTogbW91bnQgTm90IHRhaW50ZWQgNi4xLjU1LWQyMzkwMGYucHBjbmYtZnNwMiAjMQ0KPiAg
ICBIYXJkd2FyZSBuYW1lOiBpYm0sZnNwMiA0NzZmcGUgMHg3ZmY1MjBjMCBGU1AtMg0KPiAgICBO
SVA6wqAgYjdlZTIwMDAgTFI6IDhjMDA4MDAwIENUUjogMDAwMDAwMDANCj4gICAgUkVHUzogYmZm
ZWJkODMgVFJBUDogMDQwMMKgwqAgTm90IHRhaW50ZWQgKDYuMS41NS1kMjM5MDBmLnBwY25mLWZz
IHAyKQ0KPiAgICBNU1I6wqAgMDAwMDAwMzAgPElSLERSPsKgIENSOiAwMDAwMTAwMMKgIFhFUjog
MjAwMDAwMDANCj4gICAgR1BSMDA6IGMwMDExMGFjIGJmZmViZTYzIGJmZmViZTdlIGJmZmViZTg4
IDhjMDA4MDAwIDAwMDAxMDAwIDAwMDAwZDEyIGI3ZWUyMDAwDQo+ICAgIEdQUjA4OiAwMDAwMDAz
MyAwMDAwMDAwMCAwMDAwMDAwMCBjMTM5ZGYxMCA0ODIyNDgyNCAxMDE2YzMxNCAxMDE2MDAwMCAw
MDAwMDAwMA0KPiAgICBHUFIxNjogMTAxNjAwMDAgMTAxNjAwMDAgMDAwMDAwMDggMDAwMDAwMDAg
MTAxNjAwMDAgMDAwMDAwMDAgMTAxNjAwMDAgMTAxN2Y1YjANCj4gICAgR1BSMjQ6IDEwMTdmYTUw
IDEwMTdmNGYwIDEwMTdmYTUwIDEwMTdmNzQwIDEwMTdmNjMwIDAwMDAwMDAwIDAwMDAwMDAwIDEw
MTdmNGYwDQo+ICAgIE5JUCBbYjdlZTIwMDBdIDB4YjdlZTIwMDANCj4gICAgTFIgWzhjMDA4MDAw
XSAweDhjMDA4MDAwDQo+ICAgIENhbGwgVHJhY2U6DQo+ICAgIEluc3RydWN0aW9uIGR1bXA6DQo+
ICAgIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhY
IFhYWFhYWFhYIFhYWFhYWFhYDQo+ICAgIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhY
WFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYDQo+ICAgIC0tLVsgZW5kIHRy
YWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiANCj4gVGhlIHByb2JsZW0gaXMgaW4gcmV0X2Zy
b21fc3lzY2FsbCB3aGVyZSB0aGUgY2hlY2sgZm9yDQo+IGljYWNoZV80NHhfbmVlZF9mbHVzaCBp
cyBkb25lLiBXaGVuIHRoZSBmbHVzaCBpcyBuZWVkZWQgdGhlIGNvZGUganVtcHMNCj4gb3V0LW9m
LWxpbmUgdG8gZG8gdGhlIGZsdXNoLCBhbmQgdGhlbiBpbnRlbmRzIHRvIGp1bXAgYmFjayB0byBj
b250aW51ZQ0KPiB0aGUgc3lzY2FsbCByZXR1cm4uDQo+IA0KPiBIb3dldmVyIHRoZSBicmFuY2gg
YmFjayB0byBsYWJlbCAxYiBkb2Vzbid0IHJldHVybiB0byB0aGUgY29ycmVjdA0KPiBsb2NhdGlv
biwgaW5zdGVhZCBicmFuY2hpbmcgYmFjayBqdXN0IHByaW9yIHRvIHRoZSByZXR1cm4gdG8gdXNl
cnNwYWNlLA0KPiBjYXVzaW5nIGJvZ3VzIHJlZ2lzdGVyIHZhbHVlcyB0byBiZSB1c2VkIGJ5IHRo
ZSByZmkuDQo+IA0KPiBUaGUgYnJlYWthZ2Ugd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IDZmNzZh
MDExNzNjYw0KPiAoInBvd2VycGMvc3lzY2FsbDogaW1wbGVtZW50IHN5c3RlbSBjYWxsIGVudHJ5
L2V4aXQgbG9naWMgaW4gQyBmb3IgUFBDMzIiKSB3aGljaA0KPiBpbmFkdmVydGVudGx5IHJlbW92
ZWQgdGhlICIxIiBsYWJlbCBhbmQgcmV1c2VkIGl0IGVsc2V3aGVyZS4NCj4gDQo+IEZpeCBpdCBi
eSBhZGRpbmcgbmFtZWQgbG9jYWwgbGFiZWxzIGluIHRoZSBjb3JyZWN0IGxvY2F0aW9ucy4gTm90
ZSB0aGF0DQo+IHRoZSByZXR1cm4gbGFiZWwgbmVlZHMgdG8gYmUgb3V0c2lkZSB0aGUgaWZkZWYg
c28gdGhhdCBDT05GSUdfUFBDXzQ3eD1uDQo+IGNvbXBpbGVzLg0KPiANCj4gRml4ZXM6IDZmNzZh
MDExNzNjYyAoInBvd2VycGMvc3lzY2FsbDogaW1wbGVtZW50IHN5c3RlbSBjYWxsIGVudHJ5L2V4
aXQgbG9naWMgaW4gQyBmb3IgUFBDMzIiKQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAj
IHY1LjEyKw0KPiBSZXBvcnRlZC1ieTogRWRkaWUgSmFtZXMgPGVhamFtZXNAbGludXguaWJtLmNv
bT4NCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2L2ZkYWFkYzQ2
LTc0NzYtOTIzNy1lMTA0LTFkMjE2ODUyNmU3MkBsaW51eC5pYm0uY29tLw0KPiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IFRlc3RlZC1ieTog
RWRkaWUgSmFtZXMgPGVhamFtZXNAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBh
cmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMgfCA4ICsrKysrLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2Vu
dHJ5XzMyLlMNCj4gaW5kZXggOTY5MmFjYjAzNjFmLi43ZWRhMzNhMjRiYjQgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL2VudHJ5XzMyLlMNCj4gQEAgLTEzNyw4ICsxMzcsOSBAQCByZXRfZnJvbV9zeXNjYWxs
Og0KPiAgIAlsaXMJcjQsaWNhY2hlXzQ0eF9uZWVkX2ZsdXNoQGhhDQo+ICAgCWx3eglyNSxpY2Fj
aGVfNDR4X25lZWRfZmx1c2hAbChyNCkNCj4gICAJY21wbHdpCWNyMCxyNSwwDQo+IC0JYm5lLQky
Zg0KPiArCWJuZS0JLkw0NHhfaWNhY2hlX2ZsdXNoDQo+ICAgI2VuZGlmIC8qIENPTkZJR19QUENf
NDd4ICovDQo+ICsuTDQ0eF9pY2FjaGVfZmx1c2hfcmV0dXJuOg0KPiAgIAlrdWVwX3VubG9jaw0K
PiAgIAlsd3oJcjQsX0xJTksocjEpDQo+ICAgCWx3eglyNSxfQ0NSKHIxKQ0KPiBAQCAtMTcyLDEw
ICsxNzMsMTEgQEAgc3lzY2FsbF9leGl0X2ZpbmlzaDoNCj4gICAJYgkxYg0KPiAgIA0KPiAgICNp
ZmRlZiBDT05GSUdfNDR4DQo+IC0yOglsaQlyNywwDQo+ICsuTDQ0eF9pY2FjaGVfZmx1c2g6DQo+
ICsJbGkJcjcsMA0KPiAgIAlpY2NjaQlyMCxyMA0KPiAgIAlzdHcJcjcsaWNhY2hlXzQ0eF9uZWVk
X2ZsdXNoQGwocjQpDQo+IC0JYgkxYg0KPiArCWIJLkw0NHhfaWNhY2hlX2ZsdXNoX3JldHVybg0K
PiAgICNlbmRpZiAgLyogQ09ORklHXzQ0eCAqLw0KPiAgIA0KPiAgIAkuZ2xvYmwJcmV0X2Zyb21f
Zm9yaw0K
