Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BE761780D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2wxD2Sd9z3cFS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:53:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kQv/IYdE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kQv/IYdE;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2wwD5x41z2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:52:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZaHiYgzSrYTlTaETK9wcZ2qI0fIZbQcPmcz+6cWVzw12ZAShYWTvTIxnw5topcQrYK92luNGNWTX1vb/EnW5BZSCCJ+cJg05rGunnhm55A4KJaEs7Yjcc/AFkYfn6ugxIAg5+uOi+5KDzzP7wVmRkQhwUh7+ihApqPdheCqJDOpyHKAUryKVmGVmIR4UcXA7yX45bdSti8cLLxbq+7e5vN3PQqToSOLhRDYcUYoEkXvHq1hF0DlpGYrtQsn8cLKAfm+ITPKsAFT/v2sRpi0COnMSTHI238GMML2396JazcMGisbs3ow1dKEDnjEDgLDfCFc9pEgic6o2RO2B2QMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwWXKPZwoHJi8CUmaGYpZUYGvcZ5V4vfo3DZRdi/a9o=;
 b=HTQyfwq0+qT+b9o8UTsTjbGDuYOelPLZ2UsC5+2CeMj/KlWLwMetrFcUWxc1vyMNrh/QWpiJSW8nbpHM1a8uF2X9ZPJ8W6/Hp+u3x4rIhkbr/sHhBOk1DVed4+xE7huVVBWVaxa3622SYuoVsBMOs68NaGVqfEt2twe+cbY4p7Tspzham1BbOmsrH5F/pHZmOOWQ+ytQFjcT1kgR0K38GrnkMbrJ5eCK2L6o5dUaQLI1EjGeN5I+xtGz6gmgr2coOoL2IvCpF18yOVFAsGizcmzmqKL7Og1UStcvomKWma2l8su5Fp59IiNUmeBY3iDlU4auf2vVs/et1yhNt/rYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwWXKPZwoHJi8CUmaGYpZUYGvcZ5V4vfo3DZRdi/a9o=;
 b=kQv/IYdEikgxMR90AOzNDYZmxCfsEiElp63ccAIcgEB1J5DAB0IFrTPsml5fGGvydXu0LET8hxzJciQXuDqeVycu/TWyZI2YUSODet1GOxB0cdzs8y4VcoiWOo/LuVPMjzPQ4wy1Zv8Eej4nyeyabVYxI4+CSSDAK95D4+iAovIm91P3Ud5PDq0lvGPJ1FoK2g4f4qm60dnYPJbRc2kPB3UZxg9VKfXkYdfxzH3xCs0eE99Z4q2UMTKCC5YY/PxZNaZg2QkzAoTYuEzGIu0NVmJ9sy7gvIJSKlwiGVnu06wwh82B8I5FVCZJ4lq79GcCxrUYTpaQvyBGsHEUSFLKDw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3089.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 07:52:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 07:52:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Interrupt handler stack randomisation
Thread-Topic: [PATCH] powerpc: Interrupt handler stack randomisation
Thread-Index: AQHY6CNnJOkSimFDhEuPBfD8dwwa164s4h8A
Date: Thu, 3 Nov 2022 07:52:24 +0000
Message-ID: <207f0093-09e4-7c91-81e0-83a5333d9fdb@csgroup.eu>
References: <20221025033807.1413688-1-rmclure@linux.ibm.com>
In-Reply-To: <20221025033807.1413688-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3089:EE_
x-ms-office365-filtering-correlation-id: 4e5111d6-4c2d-4be6-108c-08dabd70587f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Pj07DdO3p6GON+Rn0eSnt9JKMDJVaDKxIkQvXN6GumN572btHP/ZGCmhf1ogEV8EzInIQj2D2rkPEvZdabnWUKHAawVA26Z9zV76+peevd3jwgx3J86pOC77xHnNJmcSbmNK+ofpu6APttIGnj75fYjIUYgnLqE/qzGEvlmT2aOGm/9DAh402/irVHwVvAPHfNvGCos4erwz0FYPwCiBBJG5FTZgnBdmu9H23x5CcEJmZGt77caD+r49NyovxnKR/9XJRdeppVFYdNyUYlWB9i40XN8d7IaKEe6z/ECw0mH1IKOPOtquNhpygDWPeVLqYwZFe39o9m+NQq3WKvDp7sYQzZH+5HmAs33HRAj5FaSKFJ/cIj73Jr9Zmc2F4/Cj5et7x5AS76CO4fBcMUgfdpkfBbeqDLRuIfWYWyrxjURTRKgCyNXG2uEF2VCl0hDlvzCrXANJVv3I/pFjcor6R74NSbHNvL4G3dnkKLAVTIzDhOC5Ll6QdKLAmG4EzO1sLkwDm+oeLAxTrwT3A0mfiEFYZ0H+NiEoNx3OV7d5KZXYmrggTJGGlOXZy4xHzMgAIJFlSk+lVoZiwgX3EJp9yHD9QxKXZW8HWeUZ2t/ilaOVEjoYP/kSMygLKPd+bL501FyXb4/4/EHjoFzm5vystgHedx7pGE/Ak5D0E9IDCxSQyH+WkvRK3iMol+j65+n/IrnMVvj62xcc2FxCL7y7MBetbNPCjs51bP402K5CeMXP/fkhEg8y8x0e7orfOyIJpubrX1JpL98HZ06LPlgosuees1Mii5xBpSh6pyGNuCr7BgZdkFcgnuQ8JyI00FreTOMJ+8d914W396fCZcVmFNOepTopMQppdiLbEVXwxUM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(451199015)(41300700001)(64756008)(36756003)(66476007)(66556008)(76116006)(66446008)(44832011)(2906002)(66946007)(8936002)(91956017)(5660300002)(8676002)(6506007)(26005)(6512007)(71200400001)(2616005)(478600001)(186003)(966005)(110136005)(316002)(31696002)(6486002)(86362001)(38070700005)(122000001)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NU13MjFOcCtmWkRpZTdWcWNIRjcybzlUZ1ZhVzdVb25tYUxaMXlTK2pBblZN?=
 =?utf-8?B?dUdZcUJhUjlJZnR4dk1kV2NxSkJOR0o0ZklaN0VkWUNlZVJBUXIzQzR5NlZo?=
 =?utf-8?B?UGNMUkl1QjlXK0V3ZVBRblQ3TWZMS1J5NFE2VHRTNzMybVA0SnM5dWtCdlcy?=
 =?utf-8?B?b3dTcm0wS3FUVC9jcm1PMGk0Y3grQUwzeXZkcWFPZlV5WTV4cUozUXNBL3Ez?=
 =?utf-8?B?ZmZOeW1GWlFEWW5INS9RM1FOOS9TQXJLSHNUNzJmclcvV3FMUElaMFZpTENW?=
 =?utf-8?B?TmJxRm5QUCtBZE5DdnpCZ3FIRGRCS1dlS1F0VWhhdUhsZmZ0VW5XQVdxTUNk?=
 =?utf-8?B?cThyTitET3czZUpqczJxUGNUcjN0UGJEUGRmcG9WcER0ek1qSUFJcENqSWRM?=
 =?utf-8?B?LzBLY1RoM1ZzTjYyT09GVWtPVEh3VGhuQjhRclRWZExabWVjVmpUbjQ0TzJO?=
 =?utf-8?B?RWxDUHhaNThTM21XbHU5SUhLQjJUU0tneDZla2hCV2pxSjc4Y2t5elVjaWlN?=
 =?utf-8?B?bXMreEJUaldPeWt2Sm1oOWp1aHpVYTRKVWVsNG1zYTg0VDRIK1FEWGxqSEYx?=
 =?utf-8?B?dDh3NnhwczM4KzhtUml6YlRiNmVweDRNM05XUjNtaGgySWxsQTdlSE1sWWkx?=
 =?utf-8?B?WThuL2hPY1o2UytlU0l0bFh0ODBlbVdoWnNwRjBaY3UzRjVwdzkrU0REV1E0?=
 =?utf-8?B?WHFKOGp4UEUyZGFpUCs2Tm83OGplRVZJSWVmTFpNaXA3TmtSUkhGemx6S1JN?=
 =?utf-8?B?dFpaZUxWNjVsUzlxN2NVKzhqWDRQanYwdXVOVkdYUlpmY1pEOEtzWXovQW5n?=
 =?utf-8?B?S0szcU8xbTlkVlNHUVhGclBIRVlldVkwdnRIZHZmcWJaK3hROFdHWmtwbVF4?=
 =?utf-8?B?cGx5NVh6SlN0VXlEMzFvNzZWN2tzUHZjbEFOZWR4TkNkNFJsUUtiWkFDOWpU?=
 =?utf-8?B?L3A3Uk8yTHA2NG4vK0ttS2grd0gzdWRuSFRDMExER1ZqSTFIa1pva05yQ2hq?=
 =?utf-8?B?bDVweU5LMC80V1ZvdjloRHpPcExxZEVEbHRBaUdpVnM3b2dOaW42TGcyNWtr?=
 =?utf-8?B?dE9MRU1CdVZJUTF4UGRRQjhTK3g0STVaRHAvZWYvOFJxY2x6a3RYY0RqRlNs?=
 =?utf-8?B?a0x6MGloWHRZN0ZUeHU2OEdzN3ZKVmFHVTgzVm9neGNySEdncmN4elZqcEpS?=
 =?utf-8?B?SmYyRHVjOHdxaHNyLzVnRmRWWHJZc1d5a2E3eWNSMDhCeld5UXhDeElUMENF?=
 =?utf-8?B?L3gyS2tXcE0zc1hnS2lhSGlRbmJQK2Z6NjJ3UWJTYWQreWh5ajQ2RGpFMUZk?=
 =?utf-8?B?cE5FWkRjdm1YM1IrRy9xMk9YUm1IQUFtakdGU21pMCsvblJTQlNDZkZLdWpp?=
 =?utf-8?B?YTdITHBPU3d0aWxmbEp2ZEFUeStvbm1uVlBQa21TU1JhVk5acGdzTXVkNjB3?=
 =?utf-8?B?Unc5S0ozLzY2MWxYVk1aM3JuMUU0S0RGdG9TS1ZJekJlMzl3MTcxSXlZSWRW?=
 =?utf-8?B?ZEtocE9kRWk4VXAyQjVaZEZSLytoNUJkZkx3VU5wSVBYRnNTYUJWN1Iyd2FK?=
 =?utf-8?B?cTFOem1uRnRZNmZBSlc3NzYzOUR1R0grbGl0Y2RlVzlVU2MzcnB2RkRtaEpB?=
 =?utf-8?B?cHBNaW1KZ2pzaHdEY25qUGRyZGgydU9UZnNnYzU0V2ZzY0lpZENjOFg0TnhK?=
 =?utf-8?B?YW9uQ1hSZGhIZ1BaVi9yeVQ5dnJyZzNSMjBibzY5RHhyaHhKUzRtaFZCcUo4?=
 =?utf-8?B?akJCV2lJUjQwNXFWd2p4ckdnRFNlU2d1aFpuY0gzVE9GK1hHUE8ySzE2L2tj?=
 =?utf-8?B?YlNGZjRDVGZBejVLZ0RjZHVSczJzdDhlamxScWw0MGRRakFremtpZDl6Q1pC?=
 =?utf-8?B?Z0tmTEpIZ0EvRWh5elJtakMrdXF3ejBRV0F0Y2NhR3FsQm5paW8rV085ditn?=
 =?utf-8?B?UENsT0UwNkx4RzEybmxFNnFBTnFrQ3RpSVVMSmN4dUY2UHBCM25LbThtSmk4?=
 =?utf-8?B?RVlFb1FRRkxOTkdaVG5sUlVZOUs1MFdmV0hKd1p1Tlk5ZDJkOWg5RkNiODJs?=
 =?utf-8?B?UzV4M1R2czBEbmpQK052T1cwUW5lU2RHOWhublZiWEZ3SUdHbm9PTHRtM1di?=
 =?utf-8?B?Ym1nNmdmdzlVdGoxMCtzYnRTb3ZtN0xteS9US0JtRS9hcWc3aU9ibmtzZkk2?=
 =?utf-8?Q?8JwIFa2DC6Uy8qJoSp/jcDk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BD21DE2E649E64B8E1BFE5C83912DCA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5111d6-4c2d-4be6-108c-08dabd70587f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 07:52:24.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3lIhYY9GWTe4F0ZKrcH+/pytoS1NVOnb1eYGn0iK4AgdX4wfxZTf+sPqP+jAHhikd1Fu3eKaZB7JZnFwhIYsoL+qfiM8tClU4Utl2n+XjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3089
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDU6MzgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
dGFjayBmcmFtZXMgdXNlZCBieSBzeXNjYWxsIGhhbmRsZXJzIHN1cHBvcnQgcmFuZG9tIG9mZnNl
dHMgYXMgb2YNCj4gY29tbWl0IGY0YTAzMThmMjc4ZCAocG93ZXJwYzogYWRkIHN1cHBvcnQgZm9y
IHN5c2NhbGwgc3RhY2sgcmFuZG9taXphdGlvbikuDQo+IEltcGxlbWVudCB0aGUgc2FtZSBmb3Ig
Z2VuZXJhbCBpbnRlcnJ1cHQgaGFuZGxlcnMsIGJ5IGFwcGx5aW5nIHRoZQ0KPiByYW5kb20gc3Rh
Y2sgb2Zmc2V0IGFuZCB0aGVuIHVwZGF0aW5nIHRoaXMgb2Zmc2V0IGZyb20gd2l0aGluIHRoZQ0K
PiBERUZJTkVfSU5URVJSVVBUX0hBTkRMRVIgbWFjcm9zLg0KPiANCj4gQXBwbHlpbmcgdGhpcyBv
ZmZzZXQgcGVydHVyYnMgdGhlIGxheW91dCBvZiBpbnRlcnJ1cHQgaGFuZGxlciBzdGFjaw0KPiBm
cmFtZXMsIHJlbmRlcmluZyB0byB0aGUga2VybmVsIHN0YWNrIG1vcmUgZGlmZmljdWx0IHRvIGNv
bnRyb2wgYnkgbWVhbnMNCj4gb2YgdXNlciBpbnZva2VkIGludGVycnVwdHMuDQo+IA0KPiBMaW5r
OiBodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL2xpbnV4cHBjLWRldi8yMDIyLU1h
eS8yNDMyMzguaHRtbA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJl
QGxpbnV4LmlibS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vaW50ZXJydXB0LmggfCAxMiArKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9pbnRlcnJ1cHQuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1cHQuaA0K
PiBpbmRleCA0NzQ1YmI5OTk4YmQuLmI3ZjdiZWZmNGUxMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2ludGVycnVwdC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9pbnRlcnJ1cHQuaA0KPiBAQCAtNjgsNiArNjgsNyBAQA0KPiAgIA0KPiAgICNpbmNs
dWRlIDxsaW51eC9jb250ZXh0X3RyYWNraW5nLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2hhcmRp
cnEuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9yYW5kb21pemVfa3N0YWNrLmg+DQo+ICAgI2luY2x1
ZGUgPGFzbS9jcHV0aW1lLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9maXJtd2FyZS5oPg0KPiAgICNp
bmNsdWRlIDxhc20vZnRyYWNlLmg+DQo+IEBAIC00NDgsOSArNDQ5LDEyIEBAIGludGVycnVwdF9o
YW5kbGVyIGxvbmcgZnVuYyhzdHJ1Y3QgcHRfcmVncyAqcmVncykJCQlcDQo+ICAgCWxvbmcgcmV0
OwkJCQkJCQlcDQo+ICAgCQkJCQkJCQkJXA0KPiAgIAlfX2hhcmRfUklfZW5hYmxlKCk7CQkJCQkJ
XA0KPiArCWFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOwkJCQkJXA0KPiAgIAkJCQkJCQkJCVwN
Cj4gICAJcmV0ID0gX19fXyMjZnVuYyAocmVncyk7CQkJCQlcDQo+ICAgCQkJCQkJCQkJXA0KPiAr
CWNob29zZV9yYW5kb21fa3N0YWNrX29mZnNldChtZnRiKCkpOwkJCQlcDQo+ICsJCQkJCQkJCQlc
DQo+ICAgCXJldHVybiByZXQ7CQkJCQkJCVwNCj4gICB9CQkJCQkJCQkJXA0KPiAgIE5PS1BST0JF
X1NZTUJPTChmdW5jKTsJCQkJCQkJXA0KPiBAQCAtNDgwLDkgKzQ4NCwxMSBAQCBzdGF0aWMgX19h
bHdheXNfaW5saW5lIHZvaWQgX19fXyMjZnVuYyhzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CQlcDQo+
ICAgaW50ZXJydXB0X2hhbmRsZXIgdm9pZCBmdW5jKHN0cnVjdCBwdF9yZWdzICpyZWdzKQkJCVwN
Cj4gICB7CQkJCQkJCQkJXA0KPiAgIAlpbnRlcnJ1cHRfZW50ZXJfcHJlcGFyZShyZWdzKTsJCQkJ
CVwNCj4gKwlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsJCQkJCVwNCj4gICAJCQkJCQkJCQlc
DQo+ICAgCV9fX18jI2Z1bmMgKHJlZ3MpOwkJCQkJCVwNCj4gICAJCQkJCQkJCQlcDQo+ICsJY2hv
b3NlX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KG1mdGIoKSk7CQkJCVwNCj4gICAJaW50ZXJydXB0X2V4
aXRfcHJlcGFyZShyZWdzKTsJCQkJCVwNCj4gICB9CQkJCQkJCQkJXA0KPiAgIE5PS1BST0JFX1NZ
TUJPTChmdW5jKTsJCQkJCQkJXA0KPiBAQCAtNTE1LDkgKzUyMSwxMSBAQCBpbnRlcnJ1cHRfaGFu
ZGxlciBsb25nIGZ1bmMoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCQkJXA0KPiAgIAlsb25nIHJldDsJ
CQkJCQkJXA0KPiAgIAkJCQkJCQkJCVwNCj4gICAJaW50ZXJydXB0X2VudGVyX3ByZXBhcmUocmVn
cyk7CQkJCQlcDQo+ICsJYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCk7CQkJCQlcDQo+ICAgCQkJ
CQkJCQkJXA0KPiAgIAlyZXQgPSBfX19fIyNmdW5jIChyZWdzKTsJCQkJCVwNCj4gICAJCQkJCQkJ
CQlcDQo+ICsJY2hvb3NlX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KG1mdGIoKSk7CQkJCVwNCj4gICAJ
aW50ZXJydXB0X2V4aXRfcHJlcGFyZShyZWdzKTsJCQkJCVwNCj4gICAJCQkJCQkJCQlcDQo+ICAg
CXJldHVybiByZXQ7CQkJCQkJCVwNCj4gQEAgLTU0OCw5ICs1NTYsMTEgQEAgc3RhdGljIF9fYWx3
YXlzX2lubGluZSB2b2lkIF9fX18jI2Z1bmMoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwkJXA0KPiAg
IGludGVycnVwdF9oYW5kbGVyIHZvaWQgZnVuYyhzdHJ1Y3QgcHRfcmVncyAqcmVncykJCQlcDQo+
ICAgewkJCQkJCQkJCVwNCj4gICAJaW50ZXJydXB0X2FzeW5jX2VudGVyX3ByZXBhcmUocmVncyk7
CQkJCVwNCj4gKwlhZGRfcmFuZG9tX2tzdGFja19vZmZzZXQoKTsJCQkJCVwNCj4gICAJCQkJCQkJ
CQlcDQo+ICAgCV9fX18jI2Z1bmMgKHJlZ3MpOwkJCQkJCVwNCj4gICAJCQkJCQkJCQlcDQo+ICsJ
Y2hvb3NlX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KG1mdGIoKSk7CQkJCVwNCj4gICAJaW50ZXJydXB0
X2FzeW5jX2V4aXRfcHJlcGFyZShyZWdzKTsJCQkJXA0KPiAgIH0JCQkJCQkJCQlcDQo+ICAgTk9L
UFJPQkVfU1lNQk9MKGZ1bmMpOwkJCQkJCQlcDQo+IEBAIC01ODUsOSArNTk1LDExIEBAIGludGVy
cnVwdF9oYW5kbGVyIGxvbmcgZnVuYyhzdHJ1Y3QgcHRfcmVncyAqcmVncykJCQlcDQo+ICAgCWxv
bmcgcmV0OwkJCQkJCQlcDQo+ICAgCQkJCQkJCQkJXA0KPiAgIAlpbnRlcnJ1cHRfbm1pX2VudGVy
X3ByZXBhcmUocmVncywgJnN0YXRlKTsJCQlcDQo+ICsJYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0
KCk7CQkJCQlcDQo+ICAgCQkJCQkJCQkJXA0KPiAgIAlyZXQgPSBfX19fIyNmdW5jIChyZWdzKTsJ
CQkJCVwNCj4gICAJCQkJCQkJCQlcDQo+ICsJY2hvb3NlX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KG1m
dGIoKSk7CQkJCVwNCj4gICAJaW50ZXJydXB0X25taV9leGl0X3ByZXBhcmUocmVncywgJnN0YXRl
KTsJCQlcDQo+ICAgCQkJCQkJCQkJXA0KPiAgIAlyZXR1cm4gcmV0OwkJCQkJCQlc
