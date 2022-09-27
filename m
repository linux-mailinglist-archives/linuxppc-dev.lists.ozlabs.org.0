Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B95EC6A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMhd3Nxvz3fBS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:39:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0rbIy7lf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.55; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0rbIy7lf;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120055.outbound.protection.outlook.com [40.107.12.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMgq4GVCz3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:38:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLNVS4B2SMPD1Pl9F576fYsqHoTXKNe9zHpu4ZxiV2UDeHkO/WhQufvmpwHOIkSBpZotb3moijbL30GTeWdFzFgGLiZHf1NBI/swLV1VNAVU1QUG6kQwVzDa90LxXLX1cLVxsJTMR4UJL+7LeC43dcvpgwmGXoM3I1Llm7lg4dsazUMjdo+hXORSlxFjkUJoSTN3KsVtRkEeAWWMgq0M/9cbJVV+9WyxRoBG0qMOlW09LMQ8/ZFoGiTq5yWR024JjXUmFgRY9u8B1tcpBDeugwAl9UJ0JkCMFq3pTnvHv16VPThERwLv3wKEzsI/q+IFI32y0jWapasSJ+W0ATBuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep5ZJll6Y/PqNcGPpiPMo1dMrvv+I2fnQGluAXqn+us=;
 b=gke1JijZJEyn/f9pBfaPvsivPqadC9cotv8PBDnAV2gLV/9mApscpbNVc2GpUQkHLkj8XlCUYLJhciUNF/GnD7lCrDEWOTmX6uDX2xaVUOsRn7pp8S9axhQj7x/yaTWjYOJzL9gbD0Dwk0dnZnMvzLr2pcyEZRNJSa1CR4gZOGol5t/Gj2GKsaanlBlyMziUYQwr73cCuwJbkqnNmPT/9HfcOUmARbAcp4myRYwjhJTKuNPksiilMcn8wWyVqymhFZ3C3J+3nCDhWoqG7LrUVMVcngubBtnSq38BVX6OlmgtdNCaQaJ+5klKuxGyd8h6KvkL6q4sxi6SmgvNYvoo8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep5ZJll6Y/PqNcGPpiPMo1dMrvv+I2fnQGluAXqn+us=;
 b=0rbIy7lfLr3rpgBSVeGbBt0Cdocb/T9PJP9Okb+TyOl1pIlW0HfqBJF8KMtYlfEjRPfZcHtIJDHtl4/0mcO+xfcPPvT9F+yU2yjtpyYxtk5kMNV2qq7NsVLSz7TsusfxPNxXxUaVLlG0jZMLV6BYMLlNkmYgUuqkQswdgx+zkuwZFsRmCvM9i0yWn/MQcAKZK2Bcn8qV4oMgq3OMYiG9837FxXZzrdLeZlXHc46ng3tOZFbMXvq08dw3jcpuWF7rv1PP69hi6xYEIk/qwLYy2QwJbzxzirV9ZiETTtguLwLU3UBdyXiGm/XV60JwenW2qgTxsZ0WkO9wg4NWJs88Iw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1876.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Tue, 27 Sep
 2022 14:38:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 14:38:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Topic: [PATCH v1 0/4] Kill the time spent in patch_instruction()
Thread-Index: AQHYPgMuEw69Ny4KjUGygXqB4JUsF630gZEA
Date: Tue, 27 Sep 2022 14:38:25 +0000
Message-ID: <00996701-5123-3d2c-e95f-6de881d3354a@csgroup.eu>
References: <cover.1647962456.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1647962456.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1876:EE_
x-ms-office365-filtering-correlation-id: dd2389dc-350b-4731-1f3c-08daa095ef73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uLj0F+BgjivjDY4PRge0fPUeL9MRoGfOUwYwkFi4+EaSmvkLTU9lgzEuzV7Qm8Iyp3IWWNoGHxOvivRsGjkSY8K7D6dgeA/LvVmgOvaMjePggcJnMB3gIHkoukThhSbBvmwSc5I26NtM+isoOag6UpHCLUypOR+9x+6ifANdn31KSlX544JIVug/KTsRmRzKWVSGW+XuZ/yOyNyHWNplWG6eBGMQoGkL5/YrGLH/WsTxFHkUzCBRHfYHcOH6FreouyKoZpnjQdGTv4EWbao4V5CJlImuR+/KzA3dMp9KVwENaXnC8pNKmXqWt9pLh2VOD9co9pEdQZwOlbmv/rIH5vEpmdsC9ah7FMa6LxAMrzgfW2Lr70R0NXbDiCzDYdjhRO8WN5Z8uUfCKprrEGvLmArrCKxLZD5cgkF39hIIcxbbdrOyEYMlMQIeeQuOb9kLzbEpW1rmRHk6HxTBolcsYR6i4+tnSjqi9YbieBd1Jj7Igk6VUC+nrvaOCL+b7/alzoK7U/KNQvxQmeX1VO6uYeagQRYv+axmpZdligmlBPLCYdc1vbMCQK6pm2BLD859sEXtCSqFvms8Ly9vJ5VqPVVri7gEoASsO2XmYDoGIXHuy8Zp0CcgCUK3y8nNg3kA+zv9Yt9m+vPhYLuwDISo1cehSJQp9OIkbwg1fWnv6LA/Y/K9NTEkIQnzp8XxcA1vroZZknDhEUQjkteJH+1grzfBWE0wPPO82c3jwGA0PWoJt5rxC/udGFAfUNKfh7zxs8PyIZyQm+9oOZrEbHbZH2wgIwxMmRhPN2CBprK3nVc63aeNo1ua8Ux6CqO3dfbJDSICbwbMnPmK6wzHEmra3Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(31686004)(186003)(26005)(66574015)(2616005)(6512007)(83380400001)(91956017)(6506007)(38100700002)(54906003)(76116006)(8676002)(66556008)(64756008)(4326008)(66476007)(66946007)(478600001)(36756003)(41300700001)(6486002)(316002)(31696002)(2906002)(44832011)(86362001)(66446008)(8936002)(122000001)(5660300002)(38070700005)(71200400001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TTZuQmlpd05kZzMwK3JnWThJbzRpVm1PNEZua3hYWGZPV1pOZGxBekZiMXo1?=
 =?utf-8?B?QzRXL1JkWGpvMldGWk1sOExYd3hRSVp5alNGcTdVd1ljUjdEaVJ3TVBmMTZ2?=
 =?utf-8?B?MkMxNkNUMXNjWHNzQzNyV3BucStDMDNTYWR3U3ViWHZaaGxwalArOTY4NGZS?=
 =?utf-8?B?MDFNdzhDWFBQaEYyQzFYbU85SC96Z0t1MG1vbFMxNDhENThtSktKaFpPNG9k?=
 =?utf-8?B?Wi9Td00reWZVMWRsWFRucW5OVjBGZUhrbkNLY3EzdTFwSnVKT2VONzJTVlRI?=
 =?utf-8?B?ZzM2QTZqeFFySXhUTC9sN01hL3RwWjUvNVdBeCtOdDgveEZleEx5K0RtR3FR?=
 =?utf-8?B?bFE3d3ZIT2RUYzlneDBYRHhJYkhxV2lQNElCWnVUcDVsOEdaTGZRN2syZ05H?=
 =?utf-8?B?aDM3UVg2NnRsempnZE5BbkVrQW1leEM5RExFUEJUK0t2U0huekNNN3VocWZm?=
 =?utf-8?B?a0N4amlyY2hnUnBCd1VTN1BQNkdaWm8xa2FQbVVwQXg2cXRuYkFPRGNMbHg2?=
 =?utf-8?B?RlBCWmljUThORkN6ak9nb1l1V1B3eUNBSnAyRGlFV0xQYlVOa0JmSXhucEU0?=
 =?utf-8?B?UWNPb1o1S2lUQ3B0SlUyNjM2d3FmVUZlTVh4aEdHWXpnWHorbTQxeGlZWE82?=
 =?utf-8?B?WGNVdU4vODArcnhFZ3pBWFQ1ZVlUdzZGa1B2MUlaek44N0N3Y25tL0I2ekVG?=
 =?utf-8?B?UDNwcDlRbmdYL05WU3Z4OWFuZksyeVlUZU9NVE43eWN3M3QwbnM5N0Q4cDU5?=
 =?utf-8?B?RmpRR2lEbzdrNVZyeDhlVGxoM2gxbVU1TDFiSlY2Q25yaEV0Vm80cnlOMlFM?=
 =?utf-8?B?aThIeEl6QnhrN2U1UERyRmhtMm9TdU52UEp5N2lDTDZZZVg4Qy83aTZacHNR?=
 =?utf-8?B?am5iUDEyV0g5VWZxaTU3RDZxRzVySVJxYXBlNTF5MThFTFlPdHN2ME9hOUp4?=
 =?utf-8?B?cmNQWHlNTW1ZTk11eDJRYkxBclhpWkFjOFNBUHJKR2dUcFkxend3TDhHSFpQ?=
 =?utf-8?B?bGZXaWtlQWFLNWtKU0EvenI1dk9ZUVdxZ3cxM2NVc2Zzc3pnZkVENXgydUVV?=
 =?utf-8?B?QllZRmc4bUkwUGVKSjUyS0s3VWlsSTI4bGlLTUcvN0lMSGZqdzFRdFpaSzNt?=
 =?utf-8?B?OCtYU1daMXpFaFlFUWpEWG92eWRLbDZUT242QmUxNGF3WXdGRm94c1FlVGFh?=
 =?utf-8?B?MW5vMnB2SjFPb0JCcytzSHBHaVBWQWozN05UTnlNc0hxVEtLWUYvN2dmbDU4?=
 =?utf-8?B?UWxEWXc2WWVWUUZNcCtGWWZJWkZlYmVsUDhsUXZjOUtCSG1vOWNVZkpsVUpE?=
 =?utf-8?B?UTNGanN4SEUwYkJBelpIYkZnNit1NlBUaHZ5RWN6OWlicXQ5WDN4Sm50eUpu?=
 =?utf-8?B?RlVBRC9HZERYaDBleHNJQ0d2bi9EMVRrWVB0MDBkdUhDTGRESEpxMkg4NEsv?=
 =?utf-8?B?VFQ3VmpYSE9WN29vYis5VE1TQm1tNlh6Qk1NQlRnREJyMUYvY0R1VTZsUTlw?=
 =?utf-8?B?MXRRU2F1U1NmYlVObjNxbng4WFM3TTZzWGZuYStxcFZRNVNSWElIaDBweWpS?=
 =?utf-8?B?c1lOcTUxRFpTSjZuRDlhSkltVjBlMUIxVVFwNk1YWnZZRkNVVmR6citOWjgz?=
 =?utf-8?B?MXN2VkVnVFNiVzlIQ0dTbFJLL0RGRi9zVzdmUDZsZDlOYk1zT2hrRWxKODVh?=
 =?utf-8?B?VUFpaTYweW5FTVZQc1lsNERUZlVSZzdaN29ZSHBUOFRnR1JIZVZPamhET2ZJ?=
 =?utf-8?B?NTdYRS9wRVB6NG03U3prWTRGLzY1Ty9XWU9HUklpbUwwdTNoM1RQeThWMkJR?=
 =?utf-8?B?MCtJb3lIV0FOS2lhSDhITDdnZTU2TTdLdHBYZkhORThvcXJMM0VQWjJYMkhH?=
 =?utf-8?B?WEpBditOSlE5Y1AwVHNPSHNBYW9kTkxwOThGQlB1d2NUUkd6Z1pVSmdCSmJi?=
 =?utf-8?B?RXF1L2FSU2lBM0tvbHR6S3Q0TGl4VEtDaVl0UjdhODFaN0tBUlFESnM1WkJy?=
 =?utf-8?B?QjlSdTRvMmRLZHA1bENKelZEd0VFMXVWT0Nya3hKdFpyK2dCL0l3SmtsZ1d2?=
 =?utf-8?B?RmFtSjhRdDNXa1RUOUNVY0ZyNHdBeVB6czM1alNYWnUvUkh0ekRTNDdZZThp?=
 =?utf-8?B?bVcxYXBjakFmSTNoeDVLanhFcHh6ZXo0U0RDUjdTNmNCZy81SCs0aVJOanI2?=
 =?utf-8?Q?2WOs/5tw9bSi2oqkb9pibXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C000D6471734E142A49C8C037425881A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2389dc-350b-4731-1f3c-08daa095ef73
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 14:38:25.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3L7uQDqvkxOg3V3BZGX9HqsXEY4FTKxagbkN+RdhYPuyKUV+oh4YZ+kohnA3LcSqeGRKFNtab3gTIG5liH30SdO/N3RoFh6Ha+U2jCevWh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1876
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

QXJnaCAhISBMb29rcyBsaWtlIEkgc2VudCBhbiBvbGQgYWxyZWFkeSBhcHBsaWVkIHNlcmllcyBu
ZXN0ZWQgaW4gdGhlIA0KbmV3IG9uZS4NCg0KSWdub3JlIHRob3NlIHgvNCBwYXRjaGVzLCBvbmx5
IGxvb2sgYXQgdGhlIHgvNiBvbmVzLg0KDQoNCkxlIDI3LzA5LzIwMjIgw6AgMTY6MzMsIENocmlz
dG9waGUgTGVyb3kgYSDDqWNyaXTCoDoNCj4gVGhpcyBzZXJpZXMgcmVkdWNlcyBieSA3MCUgdGhl
IHRpbWUgcmVxdWlyZWQgdG8gYWN0aXZhdGUNCj4gZnRyYWNlIG9uIGFuIDh4eCB3aXRoIENPTkZJ
R19TVFJJQ1RfS0VSTkVMX1JXWC4NCj4gDQo+IE1lYXN1cmUgaXMgcGVyZm9ybWVkIGluIGZ1bmN0
aW9uIGZ0cmFjZV9yZXBsYWNlX2NvZGUoKSB1c2luZyBtZnRiKCkNCj4gYXJvdW5kIHRoZSBsb29w
Lg0KPiANCj4gV2l0aCB0aGUgc2VyaWVzLA0KPiAtIFdpdGhvdXQgQ09ORklHX1NUUklDVF9LRVJO
RUxfUldYLCA0MTYwMDAgVEIgdGlja3MgYXJlIG1lYXN1cmVkLg0KPiAtIFdpdGggQ09ORklHX1NU
UklDVF9LRVJORUxfUldYLCA1NDYwMDAgVEIgdGlja3MgYXJlIG1lYXN1cmVkLg0KPiANCj4gQmVm
b3JlIHRoaXMgc2VyaWVzLA0KPiAtIFdpdGhvdXQgQ09ORklHX1NUUklDVF9LRVJORUxfUldYLCA0
MjcwMDAgVEIgdGlja3MgYXJlIG1lYXN1cmVkLg0KPiAtIFdpdGggQ09ORklHX1NUUklDVF9LRVJO
RUxfUldYLCAxNzQ0MDAwIFRCIHRpY2tzIGFyZSBtZWFzdXJlZC4NCj4gDQo+IEJlZm9yZSB0aGUg
c2VyaWVzLCBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggbXVsdGlwbGllcyB0aGUgdGltZQ0KPiBy
ZXF1aXJlZCBmb3IgZnRyYWNlIGFjdGl2YXRpb24gYnkgbW9yZSB0aGFuIDQuDQo+IA0KPiBXaXRo
IHRoZSBzZXJpZXMsIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCBpbmNyZWFzZXMgdGhlIHRpbWUN
Cj4gcmVxdWlyZWQgZm9yIGZ0cmFjZSBhY3RpdmF0aW9uIGJ5IG9ubHkgMzAlDQo+IA0KPiBDaHJp
c3RvcGhlIExlcm95ICg0KToNCj4gICAgcG93ZXJwYy9jb2RlLXBhdGNoaW5nOiBEb24ndCBjYWxs
IGlzX3ZtYWxsb2Nfb3JfbW9kdWxlX2FkZHIoKSB3aXRob3V0DQo+ICAgICAgQ09ORklHX01PRFVM
RVMNCj4gICAgcG93ZXJwYy9jb2RlLXBhdGNoaW5nOiBTcGVlZCB1cCBwYWdlIG1hcHBpbmcvdW5t
YXBwaW5nDQo+ICAgIHBvd2VycGMvY29kZS1wYXRjaGluZzogVXNlIGp1bXBfbGFiZWwgZm9yIHRl
c3RpbmcgZnJlZWQgaW5pdG1lbQ0KPiAgICBwb3dlcnBjL2NvZGUtcGF0Y2hpbmc6IFVzZSBqdW1w
X2xhYmVsIHRvIGNoZWNrIGlmIHBva2luZ19pbml0KCkgaXMNCj4gICAgICBkb25lDQo+IA0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfCAgMiArKw0KPiAgIGFy
Y2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jICAgICAgICAgfCAzNyArKysrKysrKysrKysr
KystLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vbWVtLmMgICAgICAgICAgICAgICAgICAg
IHwgIDIgKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0KPiA=
