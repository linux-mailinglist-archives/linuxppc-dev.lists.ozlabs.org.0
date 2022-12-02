Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5A640DC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 19:47:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NP24M4HcDz3bfN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Dec 2022 05:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0kjIs8T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0kjIs8T;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NP23P1zH1z2xml
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Dec 2022 05:46:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekOPUcMLA0OBLQL4JmGJoU5tmWG+GBZ/87IvWgoCftAuXViUlp1BEkCfuYg/ubgZI87/gl1RGaGSAlXsCqrkr+TB5J0sufASg6BBZnneTq+nyE9+NlgVfZXFVQCoFq71+evkFQMjVWt6KF7/8x9iMfKcHHQ2ehlMLKbIB7LAPv0dbGtVVFwf0ZpNr/KXZV822JckYxsXlzLQyWR8VDRtmUCwxQV5BpIL66yO/+x4z5ACaGl0VKNriNhfgxzroWh06hv28WRHb7Q+RHnG5bDOkB0Aa9wxQxF3GPs3uqPB8EMlJ3qrSQrFBuv1UUK7D7xE+SwoD8Pmclc8rxL4gDLq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EM6Ql/NoP43Wnft8I0jTdiFlwcni8B2x5lRKLEIZhY=;
 b=Ma2Pg5/LtGdfix+WtMGFH3MAS14p1jKB/bFjFzMig2AV29LFCq6ZB/M/5ixmRCcnfycvCOcfRvblXH5iJb0PxZZeAvi7+gmI2AWXcsGbP/w0S8or6mHE5tqAeXcZXIWrxSyeokP/Y2UYlXVGD0MFJok2Sq7kXWVHErCGq1ojEDBnsJTjwsN3UJm8fg3eyvIb7crPTlOQ6lY8rd/3QXES3fl/9TqPQWwJ+x6ypHetqhP+YKSm//aawYmnErXA7/luSD6D7MnmudLDHLGVHlZeqEAayiEvjSOrlyAii9E5xYJ3xktW3DF6ZmGA5SHpOau0XOPIR/nnyg9GLTUC/lezpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EM6Ql/NoP43Wnft8I0jTdiFlwcni8B2x5lRKLEIZhY=;
 b=p0kjIs8T1TsXPHzNmcS6GE3o9zmAx5omr3DLiGB9GQBtfBdZ0VyKDsT0QEkwRpZzXnJZQl+zv7+0rE4kp7/pCb1WtOQlkHqGgLGSFDJVpwmFFR2mpnO9fMT4WnrAfbmWQKBrEu40INlZ/G+0g2/hjlY7167aYZ+6VWSyLXyzwbe6KFNepZAl1zF/dgGj4Cbm3wRFdUNTHG0146Hl/Fnp3AQWcixoJ/dL7oiaaNyk3ON13W2WbHhrwIcwpaZz/P3Jw/IkM021iFup1ZPrK/L4QwngXnDCi623TZ6mlzlvwPjPCCrtFMHClVm7L6ddbZ+ukPzZy8zX0/GrRdIzsEphDQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2419.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 18:46:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 18:46:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Topic: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Index:  AQHYtABEs/XtKdJlskKmHA1duRa+Xq3xsPoAgAAA5QCAH4SHgIAAYvgAgBmQ94CAJtUoAIAJlT2A
Date: Fri, 2 Dec 2022 18:46:18 +0000
Message-ID: <5bf1f2fc-a1de-d873-7d1b-0058ff8b9aa2@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-3-pali@kernel.org>
 <fd9c174e-2c89-7e11-9e68-d6044b7eab21@csgroup.eu>
 <20220926094706.km22rqzuuulvfssq@pali> <20221016110529.76bcgq2v2h4pg2of@pali>
 <3111f16b-2e6d-c46f-67e9-6cb5fada4cc7@csgroup.eu>
 <20221101232503.qymzj7dypsehafvj@pali> <20221126162550.r4rhg5ud2e5vxzot@pali>
In-Reply-To: <20221126162550.r4rhg5ud2e5vxzot@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2419:EE_
x-ms-office365-filtering-correlation-id: 53d1b751-0fd0-4e68-a5da-08dad4958003
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JcBzO8eV0esb6or+PdOb/VMprf1fiIeTY3/sQSY8/ZDXFUt6yIkuCIdF+oIR2W2Mas+SeK62OjOu7kqko9VnJpToqBe5O5/82OQhuf8yCzO60CSQJKn7hImgLj6rwPpjajhfXZQE46tFelXV7uzVvoEyaujLd2DFbUbVJOmYsVmcvCmDmNCrseZUoUkvAS14iGwFWOXnUSvhuW350B4rpYhfTHv5iAvPReepXPGf9+z9Lw2b5FfiIyl6akEE/DA4HBEdKVNNcYkHUiSNiJ85iCppTdButlJAlfKCODvJISkSNQIFLHinEaUhjSQJdXgfDon5aBmv7pzpgVwxnlOH8Ejdj2g7WiwB+irl9pXC9PCI3Gnt3DjAl+JwAMhc/mfAkepHvaTggNAaR6ghhx9/OpcaLFyJnQ/HVzgqldq1LXlAAO/M/KIBjy1qvjMhJGLAkQ24ufJrZqzhSDHUWbgjEVJaLo7fgsTCJBtclrHHtk+ijNoTweTKQzRAHu6EO5oyq8NzTCap8GO3Snj/EOxjZNSBjKgLBmeYR4bH+yZf7EsNcJw4TS24NkhhUmrQf3GpxgQ069aKPrP+dwi9r0/3f5Mpznt9IUdgjGDuAwxzyfcx52D3uBUYzdCfF5R6ckZvllwNRCNFFxVHbGcEJbvipXVsY5X7hFMGRTZIYLiZNG3l9fBQlOtStj8MtQY0ygYgAFpMUzklqXmF6nkVt3OKVDpWlGSh5v3ubD4JtfsA+QzzQt1RmfIpFv/CGOvuzXGG
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(36756003)(38100700002)(38070700005)(86362001)(31696002)(6916009)(54906003)(316002)(31686004)(8676002)(71200400001)(478600001)(91956017)(6486002)(26005)(6512007)(6506007)(83380400001)(122000001)(64756008)(186003)(41300700001)(2906002)(76116006)(66556008)(66476007)(2616005)(66446008)(5660300002)(4326008)(66946007)(44832011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?amFva2VjNGI4SjlwWlZwdzJKK3QxYjVGS0N1RnR1YWZrZEgyV25NZzYzelhK?=
 =?utf-8?B?TnBRa2pUU0dSblkwMWdBRnB5eEsyVkgxVkRuWlJ4dURONTA3S0V5RzE4RmZW?=
 =?utf-8?B?U3kyeDdwaGhtbkRlNEZ1RVpMbktIeUxWTWhDdjNPS3NLVitGM211b3FlYXkv?=
 =?utf-8?B?OTR6NzJsWkxjc0tWR1BOUEhnZkhmK0JydUNZUytydjhQK2RBTTdnSlVTbVZU?=
 =?utf-8?B?TUtDZlA3c0x6NGV4SytFQ3pkazNQd1VKQitJQk5zY29nVWtoeGNjSGVpdXoz?=
 =?utf-8?B?VTFWdzVxdVBVVFpXcFUvQndkRTQvT2J1SXBUa3JrZmp1bmlTVGxld01wVC9J?=
 =?utf-8?B?aXQxZG5NRDZYMG9NRkVLRGJ6RlJFUHJrQ3BKL2FrUjBEZ0Fmek1BbXZjYUVw?=
 =?utf-8?B?VlZYZjRBQWRxanZxTkdYYnMyMUpla0JoVXdGT3BZZjNBaGR3YzRnaGFiVUxu?=
 =?utf-8?B?dE9CTXg1ZEJyUjVjRUVBUk9UdktQL1MrUnNZN0ViVHY4YzJBSHpreDJxYTMx?=
 =?utf-8?B?dmF1MkFxeEZ5ckd4ajBwZVB3NkI4UXQwNWFCTUVGKzdadDdDWDFNd0Z4VUF2?=
 =?utf-8?B?UmlyNnFLQnR4SHd4MWhSV1BHeStMT1FvSTNBOEJLVHZPZUxoZzZ3QW4zSDlY?=
 =?utf-8?B?WTFnbkgzTm1GNWFRNjU0N0lOVUhJUFphdFd1bEFlMGdDM3BRc3VxTWJEM3FT?=
 =?utf-8?B?c1J0blpxa3VJYnp6dk9GODlSaWt0ZERVampKRlNFTS9UcDZMQ2htSXZTMmlX?=
 =?utf-8?B?TlgrSUNzV2s5azZBektXaG5uRnF4bHMzaUF1K2VkT3FTZUJVNnlBQjlyRW04?=
 =?utf-8?B?L1FlL2I5K1h5MndlTmZPZE13aVZRS3BRSUFGZmMwbzdISGhBS01RcHBmNzha?=
 =?utf-8?B?UTZTajF3bFlIbmlOcWorWkppTHF2UDVudE1xU3NXVmlKOVU0MG5BUngvanh3?=
 =?utf-8?B?Vzd0dlU1d3pVT2pGRXhzY1RnUTZFY1VWMnh5aDhJQXAvZmd4Y05KZUZCVEow?=
 =?utf-8?B?VUFLYXhIQVdueUtsMlJJK0hUZjZrUkR6Slo2UWtrU1dtK3RLRzFRSVREeHlY?=
 =?utf-8?B?Ym1qMk0zTHN4cHNTOElVRlZYdE9vSVpmTGszaUxhNnlwYUNiTis5ZVVlV3ZD?=
 =?utf-8?B?aC9LcDhDS2E5TjV0NmpxejdrT0JjemsyN2FvbmhQMUFHenZsbUl3ZTRhaDJP?=
 =?utf-8?B?WjBxNWVmTDZNVXd3TlBUMzB4UElSa2FVMVhLRGJ0ejVlY3lWdWt0K0Yvek9Z?=
 =?utf-8?B?aWNJemUxOWNmSGQ0bjg5SmJwMU5uQzQ5bVExZmNYRHQ3UFFQOU9KMEJ4cjha?=
 =?utf-8?B?UmNiR2RwbUJxMHh5ZTBnMm1tYUlrVkFROEc3dEdqNXBrZDhxL04xaEtCeUtD?=
 =?utf-8?B?K3ZDd2pIYkFEQ2hXRTJnRjZSSkhaVGQvdTNwNDhReEw3U21NYndxclRtVlUr?=
 =?utf-8?B?Q2dVdjZobnhuSjJFdmo4UENxWFZtRDYvU1lITmlzcnIwSjBTQ2NzRU9ra1k1?=
 =?utf-8?B?MmdydEpYZ2l0R0U2ZjZ2ZHVvSVFUcnZwNGM0SS9qalpjTnhTRnRWb0p0eENm?=
 =?utf-8?B?aGNCL3ptMmZmcHVkZFNFRWxYVEZqOHZvbitzUTBDeVplRHE3MWxnejY4elI2?=
 =?utf-8?B?ZytQYWYwY1lqb0p3MTZYdUZudTkvT29JYW1vaGxnc083YWFESkd4NzhoWCty?=
 =?utf-8?B?RVZrckl0aTd4dTZKS084Rkl0cjI3RE5kN3pKR2ZMNXh3ZWcwc3RDUENKNDJV?=
 =?utf-8?B?Nm9mWkZFVnB5ZVorcHhQSVYrWmloRWxtcUswWWtMYXN3Sy82bldyN3NkRHhR?=
 =?utf-8?B?T2dGakN0a3ZkWE55bEhNbEV2aDhWVHo3STJNUmcwRDZXalVIS0RmbEs3SVJQ?=
 =?utf-8?B?VUZMWWtudnNCR0w0VHVpQnRjSG4rNTFNQ3l6dVNFakJ0ZFluWENxNDhxeFJ1?=
 =?utf-8?B?WXhYRnc0bSswQ3NWZ0RPVDlzVGxkS29pVDU0MHNneUZOek45eFN5TFhwN091?=
 =?utf-8?B?M2VIZFZSYWNVY0lTWXpBWnMxSklnRjJXZUE4OGsyZFpGTzhlaWpTVmJVb2ZY?=
 =?utf-8?B?MG5jTkVYMGlOZW5CUThmc3REKzBFTjdqclh2RERZenp4TjVTQVN1YkZ1SHpS?=
 =?utf-8?B?MndEZTN1VkQ1djBBeUZMUUQ5Z0wydWNTNmxtUklKN1IwWVNYYTBaWlQ4S0Zq?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <037E6C4B9F4F744FA485ADCDF8177DF1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d1b751-0fd0-4e68-a5da-08dad4958003
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 18:46:18.9128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dIt7A1fq7gBkTJi8XVbXXGlXItb5ZW8XuciFwhUxItd7+PT1LjPQWbTLutfauujWkork/jRZUYPi4LUMk6ALTh68G7wz1ASZO/VJYQNx1Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2419
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzExLzIwMjIgw6AgMTc6MjUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFdlZG5lc2RheSAwMiBOb3ZlbWJlciAyMDIyIDAwOjI1OjAzIFBhbGkgUm9ow6FyIHdyb3RlOg0K
Pj4gT24gU3VuZGF5IDE2IE9jdG9iZXIgMjAyMiAxNjo1OTo1MyBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4+IEhlbGxvLA0KPj4+DQo+Pj4gTGUgMTYvMTAvMjAyMiDDoCAxMzowNSwgUGFsaSBS
b2jDoXIgYSDDqWNyaXTCoDoNCj4+Pj4gSGVsbG8gQ2hyaXN0b3BoZSEgRG8geW91IGhhdmUgYW55
IG90aGVyIGNvbW1lbnRzIGZvciB0aGlzIHBhdGNoIHNlcmllcz8NCj4+Pg0KPj4+IEknbSBBRksg
Zm9yIHR3byB3ZWVrcywgYnV0IGFzIGZhciBhcyBJIHJlbWVtYmVyIEkgZG9uJ3QgaGF2ZSBhbnkg
bW9yZQ0KPj4+IGNvbW1lbnRzLg0KPj4NCj4+IEhlbGxvISBXaGVuIHlvdSBhcmUgYmFjaywgY291
bGQgeW91IGxvb2sgYXQgbXkgZmVlZGJhY2sgdG8geW91ciBjb21tZW50cz8NCj4gDQo+IFBJTkc/
DQo+IA0KPj4+Pg0KPj4+PiBPbiBNb25kYXkgMjYgU2VwdGVtYmVyIDIwMjIgMTE6NDc6MDYgUGFs
aSBSb2jDoXIgd3JvdGU6DQo+Pj4+PiBPbiBNb25kYXkgMjYgU2VwdGVtYmVyIDIwMjIgMDk6NDM6
NTUgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4+PiBMZSAxOS8wOC8yMDIyIMOgIDIxOjE1
LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+Pj4+PiBGdW5jdGlvbiBtcGM4NXh4X2RzX3Bp
Y19pbml0KCkgaXMgbm90IHVzZWQgb3V0IG9mIHRoZSBtcGM4NXh4X2RzLmMgZmlsZS4NCj4+Pj4+
Pj4NCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4N
Cj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNxdWFzaGVkIGludG8gcGF0Y2gg
MS4NCj4+Pj4+DQo+Pj4+PiBObyBwcm9ibGVtLiBKdXN0IHRvIGV4cGxhaW4gdGhhdCBJIHNwbGl0
IHRob3NlIGNoYW5nZXMgaW50byBkaWZmZXJlbnQNCj4+Pj4+IHBhdGNoZXMgYmVjYXVzZSB0aGV5
IHRvdWNoIGRpZmZlcmVudCBmaWxlcyBhbmQgZGlmZmVyZW50IGJvYXJkIGNvZGUuDQo+Pj4+PiBB
bmQgSSB0aG91Z2h0IHRoYXQgZGlmZmVyZW50IHRoaW5ncyBzaG91bGQgYmUgaW4gZGlmZmVyZW50
IHBhdGNoZXMuDQoNCkl0J3MgZmluZSBmb3IgbWUgaWYgeW91IHByZWZlciBrZWVwaW5nIHRoZW0g
c2VwYXJhdGUsIHVwIHRvIHlvdS4NCg0KQ2hyaXN0b3BoZQ0K
