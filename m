Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02035A7DF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 14:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHkZ647P6z3c4c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 22:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=07Ofpyog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=07Ofpyog;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHkYJ45Pwz2xbH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 22:50:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt/nCkCC5RwLgJ69UOVTWenif3i3XmRWpF+ZmRSKKsVCLDQqJtt+8fesN/CnMSevuTO6akkEvaOdVMiKzmbfeCN7Od8yx1P57AC39Hu8d9NWA6rV4j5ty3MAhQ7OGj6mFp4JoCqpp1T839JI+PwIxyq9wkhx2T06r1vkcMgTjgS1Wl+mlKr9Gbe8khv0rmaQ328GXlUFXN6QhHuBKgz6AGHSNaody+3xfO0UG5uz30UsdLPRPiIoz+xTM5mDcP1cvdLhRhnDlOQ0ZGq76wkvOtNo/zMO1R/IoKLozOCFsWeVDBxr3Qem7imIzcrroyYJszo1vexc/2ayi3D4wLZqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhAEFqfs5nEKa+Eedmd0SSxWqfZtoNSZ/n6qOwoyQWc=;
 b=h7zl7/dlm+xWOIc6QDEe+aChsfBjJdPEm6kYU4hwMd0ypF/a1EBZchQ+/lFV4RO7CkZaRCotSCXqOFQJOlvtvfLauFq2c/AxaM5L2rWYDLbX3gylzXlzPE7UJc33ySjbZEfn9M35uRGeTpMYC2HyC+qKTKI5TxQc2ZoBj0faLmYnx973OdCmqiDqw5mQbD3xS0+++lRmZCVThC5eKf2zksRkfVvrf1hyzYyf+pykxKLAkZLBZfDanNnfMt6xUwF03DD2KeXnd7JRRcnwvct5S9KYcEnCSavKBr5OyIaVnFm7NnOw59OJO+6O8J1z1B7id8NpcHB9bhMnSdHoD2ZCkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhAEFqfs5nEKa+Eedmd0SSxWqfZtoNSZ/n6qOwoyQWc=;
 b=07Ofpyog0fZfNeZNSjVBKRdxSrj2l5qPLtUP/MKWsXzZjQUMTws+51kpcw6uqu7bzA7d+3kgx1YzMZOAPrFaGRnNO0BDVb/dTyUkJhyEk5f/l8b8X0bJHGzSwmTX2epTbvMj2TufQkEDxyZY2wWRuIflf8lPk/KVVWeyCYfCdyGcFnNKJ8Ch5AtndX4ZW6jm6ofHDBQxsS0MZVLFSondevpO3nBDTAWSpu7r+f/Vt3CDlyio1Rx2aMu6r4sOauWoGcm8fGrgV2j8pR7YSQSinrD9z+OEYNVQYLP9TA080J421o3Xg2C/O0aSCOQR9rOLTzC6v3B3SFlKED8o596kmQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1542.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 12:50:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 12:50:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Topic: [PATCH v2 16/16] objtool/powerpc: Add --mcount specific
 implementation
Thread-Index: AQHYu2u+4hgBmN2D8EicOSqvXi2Bhq3I+YuA
Date: Wed, 31 Aug 2022 12:50:07 +0000
Message-ID: <5da86617-53f1-d899-336a-53fe691e76ae@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-17-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-17-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 525288fb-4430-4eec-2e8d-08da8b4f5517
x-ms-traffictypediagnostic: MRZP264MB1542:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  YtTLhd8xhIsPs2VN3x8SRYLv7AGNzvDDoiaaYrFmFPnjyN0/ZvYoH/F8uvjSHZoipioB480PcYEuIzFLX0YEdQLFOj8RypGzvRrQDta1Fg2o8vzhEziO00M0ZVpQIc3aMD9f+hjiiL75AffMmSzdzviT5eUhTV0upNVnqoPe18J6zfLHc2xPedtcu9nvPEzwXIILq974icW9H8QZjU8P210Mj/g4+EibPIpCt8SLkczRblrYSgxd5fTWFLFXJ+2PtjHLSH+/FqsiQ+niWICqCUnQRGNacSSRAhf76JJxlDukddNJdngPQ63lqOgFzM1VusM4WqxUTkphWgHJTN8dXVRXlqeTS9Y7RJt4vsrwZbqC3Eh260szZw5BBTaNpxa5pKefUOgPHCXu6p298QpSxZBTESG9kYFqtINQ5xiZo6VGwZKWqmc4Z1qsfEkucDG9UqlgOS1K+zg4APbG9AvrAU0Q8ydyzjHk3nxy+X5w0K1c4UsDJ2IiZSvih5FUFXPNJS0TLzK6EG8vRL/S0yiKmu5vTS/CwoqZ1x8nUuW/MpjlVt4sGJfHEq7i7YYdACYmiAvf7Ia87trGe4uJ/L30JfM47JsE4CCJBhTocmIfz9z+W7RKA/uSfBgGHcV7lC6U7VQLp2v2eNk8PPGS0t5jIBrkxQial9KDLhZMnl6jzDA/VTPBp+mNjWi/29wKXXDbrDRaJDXTrKLtjR790wdZfgSKQ/0Q6VGdhT3nmNya8QMPHcSiME7ImgHZdql1tlNu1jnQonjvvP/8aoVbrIxmrRZ2MhcDhXnVjV++i4MXnZV1vNAIZ2iGzyXtPIcEN78VV3xUSjqPw5ExV7SpUgsNGA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(396003)(366004)(136003)(376002)(6512007)(44832011)(2906002)(38100700002)(26005)(2616005)(6506007)(122000001)(186003)(31686004)(66946007)(66446008)(4326008)(110136005)(66476007)(31696002)(66556008)(64756008)(8676002)(76116006)(91956017)(6486002)(316002)(71200400001)(7416002)(38070700005)(36756003)(86362001)(5660300002)(41300700001)(478600001)(54906003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K2ZuaDZzcjBtZU1jRFcxeUNGbGk4M3Uwcytrbkwydno5YVMwR202bHNtNXc1?=
 =?utf-8?B?TmxXdEtXZUw2UWJUM2dxaWZiVERWVjJKZVVzc3FuNDFyOE9MdTg5OHgyZ2Zr?=
 =?utf-8?B?OEx1SXgwU3FHTDQ4dGtlVUFFWWRGLy81SUkyeXJPTGhSYnI3VDJwd2QrUzJR?=
 =?utf-8?B?aUlTbVBmM3RxN0drVXZwWGpReTFIYXc1VFlHNStlQ2R2OE9lZ1FXSmtUNDdY?=
 =?utf-8?B?VmtnbURhTzZCMTZwSDV4Y1hBRnBRSTE4Zi90akpTSHNnZXZYeHZnenIraERz?=
 =?utf-8?B?Uk1jL0pJRkx0bGxZZWdqVEQxbFBDWHlhYzBxWHZ5ZVV0UmpmRFpJNkxSYmln?=
 =?utf-8?B?RDUyRjhJd1A1MmZ3MTJjV3pzMXgvaERYRVZDcE1DQkF3ck0waGRqTWhJamNR?=
 =?utf-8?B?aHBWTDhHVGMraHJvV1lsWHB3VEdsdDFpWHNpTjlUK0E2ZlRhNGIzSXVPa0Nr?=
 =?utf-8?B?NkZ0Y3lNVkQ0Q3B0ckVSalIwcmordFBHR1Y5VGVma3g3TENaeHJDV2laUWRq?=
 =?utf-8?B?NmVhaWdzNUhpa0hXbXZTOVpwck1aUTA0WVMwc1ZGQ29QUTNHQVY1SzU0NXpQ?=
 =?utf-8?B?b2N4eVEyR2xhRkVTeTl2SW4vWnVlYmlrUU51S04wVzQvRmN2eVB0a3B0eXBy?=
 =?utf-8?B?bUd4cjJON2Q2VTdtZDZwS0Rnd2ROeWIwNnBOS1I0Q0VQSTFZOFp0UVFvWEFj?=
 =?utf-8?B?NklxOHBhVDZxYkR3VjV6eXpVTk14blJZMTJUWU9CVU03S2lIcmNHVTQ5ZWs3?=
 =?utf-8?B?N2hCaS8rTGEvWXZnSDBCckVyZjVLZUZ0T2tYN2ltUTJNZzBwcGswYmJSS05w?=
 =?utf-8?B?UWFNNFM3QUpwc1U2dE9tYjd0RzYwRlExYlFoVFVpdFlPMWFuWVZPdEdhTmwx?=
 =?utf-8?B?aVQzSytYbHNVcjY2dWlMZEJmK3VyT29mUVJVTi9nb1FwcHVYNDNSckJ3Mm1t?=
 =?utf-8?B?NDZqclhSQ1lldHM0cUVXdTlwakFEUDVua1gxTXhIK002elZPTGFiMlc2UXMv?=
 =?utf-8?B?U2gxS1FoNTY3c2ZYckhiMTAzTUhQNndpYldhTUtVK0NwREpOZWZSQWpmYUZm?=
 =?utf-8?B?ZUNEZVpseXVGSUhxQWVrS3F1RGtHMEYrcHpqMUV1MmdnaUtKTzJYbTBScW1J?=
 =?utf-8?B?VlhGY0JTNnJDK0F2RHkxTmVhTThSa2VSeVRpYzNHOEM1UDZrT0ZkZGtRRkd0?=
 =?utf-8?B?NmtNYVE2OHpYcUFhZWgwdW9RaVptK2pUSi9pNmpjYkJXeEVXS2xoVVRMRHRm?=
 =?utf-8?B?V29wWnRLT3VPMmgwWXZhT1RHaDNMUkdDQjRQS2lUT05RZk45dURYUThwN0Ft?=
 =?utf-8?B?emR2SW91NmpSdkdiUDVoTk9HOU1wV0g2cjJoYUx1YkdIbW9NVjJKS3NTV2NE?=
 =?utf-8?B?Wk0rcEEvc1NxcWxjejUzU0Q2WWRNeDJ6em0ycVE2RjUzZ0F0bjliUTE0WmtV?=
 =?utf-8?B?RHBhYXJnL1NRSWRJTnlBMzJieVowOXBxV3ZoL2E2Njc5a09mN1lYdHRSZC9M?=
 =?utf-8?B?dUN6M1pvMlhKMGduem1BUUg2R1Y4ZzJVUWJSQkI2ZzZhT1hUYnhjSUFSTlBj?=
 =?utf-8?B?RXdTU0c5Y21OWlA5VllTaXFJZW5aTXNTaXpwU0JFM3RvS0hlWlpjZm5KRHd1?=
 =?utf-8?B?bTJYN0NnWEUxazF2RCtIYXRORWhtWFluZkJLV25HMzFXQWFySDRPZFFtSFRu?=
 =?utf-8?B?ZUNUc3p5b0l1ZUhzOTdNb1duU2dEVnBUdXlTdlljL0pGRHRZK1R3bmlHaE1y?=
 =?utf-8?B?b2k3S01xblFIdVJlRDFJd1ZjY2hnbmhsbXN4S2VRMysxc0g3NGVXcFRkS1k1?=
 =?utf-8?B?dGRjaWZqM3VDQVNDT204Rnk5ME4va1NLM2pJTmViR2x3dzhvMXQvdkVhc2tj?=
 =?utf-8?B?cElLOHM3clUrL1RGOWloWFVBT3F4MjhqM3pFaTE5RmpCQ0JyQ3Fja0lmY0Vk?=
 =?utf-8?B?U2VSWjh6R1BrYTc4Z093TGNkY2I4Ujg0YStCMnpCTmRZV0k3MFNKN05yblJQ?=
 =?utf-8?B?ajA3akt5YjMwellOYlBrbGxpRkVRajRnYmg0NGxnSFRIc3RYanRxNThDSjZx?=
 =?utf-8?B?dHBNQWZzN2NjVTJkaVZ0d25MT0JadWU4bmp2MUw3MnlnWUk4YnJVLy9iWm1F?=
 =?utf-8?B?cEtBU1NXWGFHSWZvWkdSSkQzMXBETlMrUWpuQStqTHNQQzNZZHBIMWd3NENu?=
 =?utf-8?Q?Aenai1Ayu/p0vhfoRQ1qV9g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC11111D89E2ED4B819320A122FE28A1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 525288fb-4430-4eec-2e8d-08da8b4f5517
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 12:50:07.1981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIkgclRu/u+fZ//0x422kcLAXQCRCzvEox49xVjm6cDLloaGlqhHqVp25CpZDp/1od+4MvZztQn+ZTnWj1VIhDg7KT4EWYJhtz3IfdSBBJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1542
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIGVuYWJsZXMgb2JqdG9vbCAtLW1jb3VudCBvbiBwb3dlcnBjLCBhbmQN
Cj4gYWRkcyBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyB0byBwb3dlcnBjLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+
ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvZGVjb2RlLmMgICAgICAgICAgIHwgMjIgKysr
KysrKysrKysrKysrKysrKw0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXJjaC9lbGYuaCB8ICAyICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMv
S2NvbmZpZw0KPiBpbmRleCBkYzA1Y2QyM2MyMzMuLjZiZTJlNjhmYTllYiAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
QEAgLTIzOCw2ICsyMzgsNyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBIQVZFX05NSQkJCQlp
ZiBQRVJGX0VWRU5UUyB8fCAoUFBDNjQgJiYgUFBDX0JPT0szUykNCj4gICAJc2VsZWN0IEhBVkVf
T1BUUFJPQkVTDQo+ICAgCXNlbGVjdCBIQVZFX09CSlRPT0wJCQlpZiBQUEMzMiB8fCBNUFJPRklM
RV9LRVJORUwNCj4gKwlzZWxlY3QgSEFWRV9PQkpUT09MX01DT1VOVAkJaWYgSEFWRV9PQkpUT09M
DQo+ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZFTlRTDQo+ICAgCXNlbGVjdCBIQVZFX1BFUkZfRVZF
TlRTX05NSQkJaWYgUFBDNjQNCj4gICAJc2VsZWN0IEhBVkVfUEVSRl9SRUdTDQo+IGRpZmYgLS1n
aXQgYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYyBiL3Rvb2xzL29ianRvb2wv
YXJjaC9wb3dlcnBjL2RlY29kZS5jDQo+IGluZGV4IDhiNmExNDY4MGRhNy4uYjcxYzI2NWVkNTAz
IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiAr
KysgYi90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9kZWNvZGUuYw0KPiBAQCAtOSw2ICs5LDE0
IEBADQo+ICAgI2luY2x1ZGUgPG9ianRvb2wvYnVpbHRpbi5oPg0KPiAgICNpbmNsdWRlIDxvYmp0
b29sL2VuZGlhbm5lc3MuaD4NCj4gICANCj4gK2Jvb2wgYXJjaF9mdHJhY2VfbWF0Y2goY2hhciAq
bmFtZSkNCj4gK3sNCj4gKwlpZiAoIXN0cmNtcChuYW1lLCAiX21jb3VudCIpKQ0KPiArCQlyZXR1
cm4gdHJ1ZTsNCj4gKw0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiAgIHVuc2lnbmVk
IGxvbmcgYXJjaF9kZXN0X3JlbG9jX29mZnNldChpbnQgYWRkZW5kKQ0KPiAgIHsNCj4gICAJcmV0
dXJuIGFkZGVuZDsNCj4gQEAgLTQxLDEyICs0OSwyNiBAQCBpbnQgYXJjaF9kZWNvZGVfaW5zdHJ1
Y3Rpb24oc3RydWN0IG9ianRvb2xfZmlsZSAqZmlsZSwgY29uc3Qgc3RydWN0IHNlY3Rpb24gKnNl
Yw0KPiAgIAkJCSAgICBzdHJ1Y3QgbGlzdF9oZWFkICpvcHNfbGlzdCkNCj4gICB7DQo+ICAgCXUz
MiBpbnNuOw0KPiArCXVuc2lnbmVkIGludCBvcGNvZGU7DQo+ICAgDQo+ICAgCSppbW1lZGlhdGUg
PSAwOw0KPiAgIAlpbnNuID0gYnN3YXBfaWZfbmVlZGVkKGZpbGUtPmVsZiwgKih1MzIgKikoc2Vj
LT5kYXRhLT5kX2J1ZiArIG9mZnNldCkpOw0KPiAgIAkqbGVuID0gNDsNCj4gICAJKnR5cGUgPSBJ
TlNOX09USEVSOw0KPiAgIA0KPiArCW9wY29kZSA9IGluc24gPj4gMjY7DQo+ICsNCj4gKwlzd2l0
Y2ggKG9wY29kZSkgew0KPiArCWNhc2UgMTg6IC8qIGJsICovDQoNCmNhc2UgMTggaXMgbW9yZSB0
aGFuICdibCcsIGl0IGluY2x1ZGVzIGFsc28gJ2InLg0KSW4gYm90aCBjYXNlcywgdGhlIGNhbGN1
bGF0aW9uIG9mICppbW1lZGlhdGUgaXMgdGhlIHNhbWUuDQoNCkl0IHdvdWxkIHRoZXJlZm9yZSBi
ZSBtb3JlIGNvcnJlY3QgdG8gcGVyZm9ybSB0aGUgY2FsY3VsYXRpb24gYW5kIHNldHVwIA0Kb2Yg
KmltbWVkaWF0ZSBvdXRzaWRlIHRoZSAnaWYgKChpbnNuICYgMykgPT0gMSknLCB0aGF0IHdvdWxk
IGF2b2lkIA0KdW5uZWNlc3NhcnkgY2h1cm4gdGhlIGRheSB3ZSBhZGQgc3VwcG9ydCBmb3IgYnJh
bmNoZXMgd2l0aG91dCBsaW5rLg0KDQo+ICsJCWlmICgoaW5zbiAmIDMpID09IDEpIHsNCj4gKwkJ
CSp0eXBlID0gSU5TTl9DQUxMOw0KPiArCQkJKmltbWVkaWF0ZSA9IGluc24gJiAweDNmZmZmZmM7
DQo+ICsJCQlpZiAoKmltbWVkaWF0ZSAmIDB4MjAwMDAwMCkNCj4gKwkJCQkqaW1tZWRpYXRlIC09
IDB4NDAwMDAwMDsNCj4gKwkJfQ0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gICAJcmV0dXJu
IDA7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hcmNoL2VsZi5oIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hcmNoL2VsZi5oDQo+IGluZGV4IDNjOGViYjdkMmE2Yi4uNzNmOWFlMTcyZmU1IDEwMDY0NA0K
PiAtLS0gYS90b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmgNCj4g
KysrIGIvdG9vbHMvb2JqdG9vbC9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL2VsZi5oDQo+IEBA
IC00LDUgKzQsNyBAQA0KPiAgICNkZWZpbmUgX09CSlRPT0xfQVJDSF9FTEYNCj4gICANCj4gICAj
ZGVmaW5lIFJfTk9ORSBSX1BQQ19OT05FDQo+ICsjZGVmaW5lIFJfQUJTNjQgUl9QUEM2NF9BRERS
NjQNCj4gKyNkZWZpbmUgUl9BQlMzMiBSX1BQQ19BRERSMzINCj4gICANCj4gICAjZW5kaWYgLyog
X09CSlRPT0xfQVJDSF9FTEYgKi8=
