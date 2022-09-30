Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9B5F0490
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf0Fy5sggz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:10:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h+GNxNlH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.80; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=h+GNxNlH;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90080.outbound.protection.outlook.com [40.107.9.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf0FD3qXfz306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:09:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AG8DeA9UZg4kBXHtKVTFcMr0i+tVvCxhvJhufdxuhewjgiXRvXVFVGptUeAPS2GhMQxyMoA00euf/1qty2iinB1LgRGlts/prRaaMg4L3OBTik42BjnFK51vWNoMjEHa8R21L1JhmWL5tWU0hw8o2X7IE90lLzr6sqPooygR9ExP1BMDmTgD6ZhvETop9t4xHbTMidWM720Qum3XNjWo0q2bgFOeCVuY09kPP4N4PRUZRUWxJ9TlCC0OaZqenE+YmkAztr/ccNJj4sZxT4551dRBrpEbamKBzIVTtPiSLK8rG8JOt0yV+nIbpcKe/1ptItl7ob74yDbBkPihFFgQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5dLLIXEg79hA1OeGPRA6/z4Ygg5SoKsbag/+pYQ9Go=;
 b=T2Olx0cvXQIkT2q2VOU7psq+cukXHXkuF9ChGqFKSl0NvcvzHyBp2KVPeciNYgiLoPsza4qsk8msLTKuA3LQH6cLZeSdUj9YARHh5+losv0pX1yhfhkYxPtuYmCBx7KmBfr2I7g09NYaiRssp1CvqWZTWjebemr4LxT0fYRbH5nEfFwRiTrig9mIjUfejjtI0h/NujE/QTABooy/fUbGc8aOxPkZvnwpH9pUKX3PKLDcoabNfB25BCFZ7rulbjlf8WswyKay2j87kpjW74LpQXy4OkQr9b5gJkjUeH5ZS/A0TBIMordkdCSQYmRbj6lHVyp11jTbcfkfjEZAu+uY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5dLLIXEg79hA1OeGPRA6/z4Ygg5SoKsbag/+pYQ9Go=;
 b=h+GNxNlHRM2E2xWSbEm4A8OKfKNvc9jWp6Tu8LN5Oj+4t0Y3NpBOkNjECeRAWarnaNKOYooCr56UlmHCJ62h4tbslVTELumd/l/pTy5Iy5P5I6Thwq0nxUBM6N3uCfzFO+Sj4C83hoWBiZT5taQskMSyN5/7Kf0UYx2EqQ/fteGf9TchiGSoiCHa8s6qCJctuAXPM6SWK371z7sMe4BBhSAYf05wjnxi1zwIfU8GBmy/ABvfKKiCQcrcOw9IKx6LtCia7gqnCQQiMfZUMuNjh88SntNSbnwmQPfO+CJACbnxNIr8VZWL8MeBRFcacXtvpXoBEkFm79c9Dc7k+0SjoA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:09:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:09:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: ruanjinjie <ruanjinjie@huawei.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "Julia.Lawall@inria.fr"
	<Julia.Lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] powerpc/mpic_msgr: fix cast removes address space
 of expression warnings
Thread-Topic: [PATCH -next] powerpc/mpic_msgr: fix cast removes address space
 of expression warnings
Thread-Index: AQHYveDna/zRu+vsIUGdBuZd+gzo0q33qqSA
Date: Fri, 30 Sep 2022 06:09:30 +0000
Message-ID: <4d3b7f83-498e-deb2-ce2a-c17d4b22a078@csgroup.eu>
References: <20220901085416.204378-1-ruanjinjie@huawei.com>
In-Reply-To: <20220901085416.204378-1-ruanjinjie@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3195:EE_
x-ms-office365-filtering-correlation-id: 3421d8cf-1200-4f5c-2e23-08daa2aa565a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DYznzQntgryVW+uBQ4YczqgUXlQS3httM4UmDTardrTogoyzyVQ6drxs2y2FkzPJwMkeQjM5vV11jvNqAjLf2MuMHBNH7LnQ5KITMm4SPMXmpPGL/YEaChJL2YG1pzZqYzlqWmCyh9DDKScNGy59gOPB8rQnDnc1b0G0YdCi3SHCigLJ0WEtR6U9AKK3DOvzj79JwCq0bOGJYzCytcp2OSM/NPjM8nSMOUKFMBA5JbaAA426psqdk+tZomEE9nhVnuQsmmUYj5nCAZlGhPPyMI4SNNpRS+rJan9R8hugcs66dMrhg3FWPuPCLsZfzy85PkAzX4ZZ0zKK+lN3UakqmomLlITFNgjXJ3qOadVsyx2oZidnUx8RoEaIkeX2bn/jEepGEuwnZ0kDHqB/CBptbXJEEioSDazgKsWcsimU3hdTY6Wjt9yBRi98lsywHFqDt1SGWMUk+QVNOZpVx/FiI6wTutZzwcCu5AmZkcSotuybvAFwMlf1jqwkGPYiHhgKNYIOVNU/YWP+22j18ekCGkkcSDnGcd+c6vIs4LoQI2kiyypB0UhcF5icXDKAdGBihs69wrLyWX6GiYZGyES3GP/rFufyuHL5/YWWSFD0Z8jbe1Hc7NdTOEIIvCTcZbpPWaUiDfj6BkT9syT1Uk1It8ob6m/H+1BGAkowa6fD8McLEa+Ky23g1MjpIVQHitDuq2mM368oA0MI75WqE7hUKQeAVbGpqYD1OO3Ta4jZk9RRZ0gW0OYlOwUxto8tnvD2tKV9OoQOZnCew0U40v9RxB1WZJe1tOjmQfKdT+kpKXo/Nk3bkuNpnGgxAzlpOMrFJqw9OtoGxg4h+XLbVLzVEg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199015)(122000001)(31696002)(36756003)(38070700005)(86362001)(38100700002)(66574015)(186003)(2906002)(5660300002)(44832011)(26005)(6512007)(478600001)(6486002)(2616005)(83380400001)(6506007)(66476007)(76116006)(64756008)(66446008)(8676002)(66946007)(41300700001)(31686004)(66556008)(316002)(8936002)(71200400001)(91956017)(110136005)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YmVRWkk3U1JGZzVJTXVUc1hTeGtHamNYUzU2NVByU3NpVXZFMXN6bzJyRkpX?=
 =?utf-8?B?eHlwTjVManRMSEVPSUJadUlId1MzT1hDa0dSU3pxb1dnd2JBU09Kbm1qOVlJ?=
 =?utf-8?B?dDlLcmpYL0ZuVFg5NHZadkwrZ0NKcGN4c3B0Q1ZML2M1WTl3bTZlVmVSbGVt?=
 =?utf-8?B?NXdZZVJyN3RINmlzVkhzbFNndER5eVpFbTlkN3gvQU1vUm9Ga0JsbmNEbnlZ?=
 =?utf-8?B?UG1Na2tSUHlKRTZJRzhublFiSCs1eXd0YjVxT0ltV1p3SXo5eno1N0ZnN2tB?=
 =?utf-8?B?Y3RUOFFkNDNNcmNoR1NoM0dHcXh4MnJhSDI4R2t6M1pJSzhRK2Yra00zN2hJ?=
 =?utf-8?B?Z3U1anl0Lzg0V0tDcmpXcGxVbDBkc3JwVW93dTlNSFh4MTd2MFNFWG9seitv?=
 =?utf-8?B?Z3ZvQy9YTUNWeWhsYzM3OVdvZmlpU0N5TmNPdG9IbDdNaDFtQ1hhUmIrQy9E?=
 =?utf-8?B?d0pGbUJMdHBtU3d1UTExMFJaVUhkV0VMcHAyajZwbHZqM0xwUDdFYWg1M09a?=
 =?utf-8?B?SlNGVUFVMmkyZjhGN2dZQlZ1RW1YTXB1LzNQdW1UaTBtS1BzMGRQTGZLK2FE?=
 =?utf-8?B?TndjcmNscldpWEhyOHcyMjFiVFh1bStBNWNQc0hrdU9YV3FweThiNEtCZnlK?=
 =?utf-8?B?d0plMXB0bFg3UkdYazhFZkl1S3lxcDV6MmxGTmphT3c2VGtGcHVBUjM4UWEy?=
 =?utf-8?B?QlRYczJuVnQ0U0t5NzdtNlN6K3Q3WEtLc3VSV0xnSHRCUzFrVlZ4MWpkVGp3?=
 =?utf-8?B?NHpqTHNjM3JMcnB1bm85akpFV0U5YWx1ekdsNEl6a3BBMStxT3pkcURRRCtI?=
 =?utf-8?B?ejNuUU1pVGFhYjUwMDVrZGY1S0plSXo5QlBGKzAraFllUjBOblZUZEpBbjhq?=
 =?utf-8?B?bnBLMU4wZkY1VmR0OU4yRW9mWDNoMi9HSDJPblM3cUdvSzdSUWtnaDdkWXFG?=
 =?utf-8?B?WkllZkxSalZaWVFKTjlKL2tQeU8ydzVFN2k4Vmh5TUJVVFhaVWE4VHJLekJo?=
 =?utf-8?B?YWFKUFB5WS9EZzNCTjljZ0dlRDhNNVp6Ynl3OVNtNklOWUhGb2tLUTE2bnhO?=
 =?utf-8?B?VEttcXpRaVpiTVlkQUtUK3NPMzE4NisrMlhaeDBzSi8yUmFVQXFweWNJVjZw?=
 =?utf-8?B?NFp6VW54MjlnQzk2S3V6SkJ0YSszWUswSnNiQnRhTHM0aDZwbUNmdEh6Q3Rk?=
 =?utf-8?B?U2o0Mmgzcit6clZjdStkZmRBdUpDRU85cVNkL2NHeEVpcmNaMkpHZmkzMHor?=
 =?utf-8?B?MmVVUzBqTXdBRXdia05vYXFmTC9PbVhtamNUekhuaUVXVVIwaFloa05jeTVo?=
 =?utf-8?B?ZGtoaUVRblZhNDZuZVd0cDl4VXpDZE0yaEFpWHFRdUdML1g0Q0NsK0lGVER2?=
 =?utf-8?B?ZTZOYmNWbkNVenZ5UkJjUEhidllvMzFCdjNPblQxK1o1bzRZaHBPN1RudlB6?=
 =?utf-8?B?TTBYWHZ5amZ6ZGFteXJiOVZYeVR1VlVVY2VrSkNHczdZNUl2a2ZxUXA4VkhD?=
 =?utf-8?B?cG5tM0RXc0l4UFVlQjJQY0FYQU4yUjc0eFNjZHhseHJrVFZ2QmVyUit5QWxl?=
 =?utf-8?B?K2UyN1A0ZGdubWpUTmF5U0Jpb3RHaXk0TmVuMTB3MDhQendqdFdrK2lZY2ph?=
 =?utf-8?B?OFRZV083YktaUkRlQ25OM3MxTUNkY25acHZDL2F1bjdYTWVLcVdMZEZ6QWIw?=
 =?utf-8?B?UURRQXVHbDZiWXBwY0VWMFFMcU4zY0poZWJ6bld4L3J5MStVbVB5Qlh5cWpE?=
 =?utf-8?B?b2FJRDhIbVBzdkQ5N2JjNm9Calk3ZWFoYVp4cmF1SlQ3dFRyV2JFeXB1aGRj?=
 =?utf-8?B?eHg2MXNUYm9VbU1IaTBGaFZGZnhCc1dyd3NvRUtTaHZNTllpR01aNmJQV2lB?=
 =?utf-8?B?ZDJ1QWFtNXRZTlJsRTNLYmE5blIyZ1Iwc3NHZk1CZnY3QjVic2V4aHpQak5h?=
 =?utf-8?B?YTVvUG90RWdKK1V1NGEzWnBRY01HQzFrdGNNTjBpSWtQM0FCUlgzdStBdzRM?=
 =?utf-8?B?QmhYaTNyMDNJWWx5N0pEUDFaZTRRc1RtTWlxbGVpbVYydXBPOXlqWlJhTzRN?=
 =?utf-8?B?czZmSnJnUWtLdXpSc0l2Sm8zbXRyMUl0MTdMZGFnS1ZEK2lEL2JwQllYYTRx?=
 =?utf-8?B?elF1TW91M3lKQVY3R2ZvSWMyclVCNkNPV2tSQmVtOFgzVm93SmFad25uYS9l?=
 =?utf-8?Q?xtqGF2BKBQ3NP1pzSxArLLg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAC8ACA7BF01124AA1DF521721BB08FE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3421d8cf-1200-4f5c-2e23-08daa2aa565a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 06:09:30.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cuODClhqDOHAPI8wUyBEE0Hny87ZDfM0euWrn4ejnhnEAcP0do2E2KOf4deRkkuhU5hku3qcOT7y3gxK/E2YxvSDFylzcSvGELd0b7AFLvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3195
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

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMTA6NTQsIHJ1YW5qaW5qaWUgYSDDqWNyaXTCoDoNCj4gW1Zv
dXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgcnVhbmppbmppZUBodWF3
ZWkuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gV2hlbiBidWls
ZCBMaW51eCBrZXJuZWwsIGVuY291bnRlciB0aGUgZm9sbG93aW5nIHdhcm5pbmdzOg0KPiANCj4g
Li9hcmNoL3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jOjIzMDozODogd2FybmluZzogY2FzdCBy
ZW1vdmVzIGFkZHJlc3Mgc3BhY2UgJ19faW9tZW0nIG9mIGV4cHJlc3Npb24NCj4gLi9hcmNoL3Bv
d2VycGMvc3lzZGV2L21waWNfbXNnci5jOjIzMDoyNzogd2FybmluZzogaW5jb3JyZWN0IHR5cGUg
aW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQ0KPiANCj4gVGhlIGRhdGEg
dHlwZSBvZiBtc2dyLT5tZXIgYW5kIG1zZ3ItPmJhc2UgYXJlICd1MzIgX19pb21lbSAqJywgYnV0
DQo+IGNvbnZlcnRlZCB0byAndTMyIConIGFuZCAndTggKicgZGlyZWN0bHkgYW5kIGNhdXNlIGFi
b3ZlIHdhcm5pbmdzLCBub3cNCj4gcmVjb3ZlciB0aGVpciBkYXRhIHR5cGVzIHRvIGZpeCB0aGVz
ZSB3YXJuaW5ncy4NCg0KSSB0aGluayB0aGUgYmVzdCB3b3VsZCBiZSB0byBjaGFuZ2UgTVBJQ19N
U0dSX01FUl9PRkZTRVQgdG8gMHg0MCBhbmQgDQp0aGVuIGRyb3AgdGhlIGNhc3RzIGNvbXBsZXRl
bHk6DQoNCgltc2dyLT5tZXIgPSBtc2dyLT5iYXNlICsgTVBJQ19NU0dSX01FUl9PRkZTRVQ7DQoN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IHJ1YW5qaW5qaWUgPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3N5c2Rldi9tcGljX21zZ3IuYyB8IDIgKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jIGIvYXJjaC9wb3dlcnBjL3N5
c2Rldi9tcGljX21zZ3IuYw0KPiBpbmRleCA2OThmZWZhYWE2ZGQuLmNiYjBkMjRmMTViYSAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3N5c2Rldi9tcGljX21zZ3IuYw0KPiArKysgYi9hcmNo
L3Bvd2VycGMvc3lzZGV2L21waWNfbXNnci5jDQo+IEBAIC0yMjcsNyArMjI3LDcgQEAgc3RhdGlj
IGludCBtcGljX21zZ3JfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiANCj4g
ICAgICAgICAgICAgICAgICByZWdfbnVtYmVyID0gYmxvY2tfbnVtYmVyICogTVBJQ19NU0dSX1JF
R0lTVEVSU19QRVJfQkxPQ0sgKyBpOw0KPiAgICAgICAgICAgICAgICAgIG1zZ3ItPmJhc2UgPSBt
c2dyX2Jsb2NrX2FkZHIgKyBpICogTVBJQ19NU0dSX1NUUklERTsNCj4gLSAgICAgICAgICAgICAg
IG1zZ3ItPm1lciA9ICh1MzIgKikoKHU4ICopbXNnci0+YmFzZSArIE1QSUNfTVNHUl9NRVJfT0ZG
U0VUKTsNCj4gKyAgICAgICAgICAgICAgIG1zZ3ItPm1lciA9ICh1MzIgX19pb21lbSAqKSgodTgg
X19pb21lbSAqKW1zZ3ItPmJhc2UgKyBNUElDX01TR1JfTUVSX09GRlNFVCk7DQo+ICAgICAgICAg
ICAgICAgICAgbXNnci0+aW5fdXNlID0gTVNHUl9GUkVFOw0KPiAgICAgICAgICAgICAgICAgIG1z
Z3ItPm51bSA9IGk7DQo+ICAgICAgICAgICAgICAgICAgcmF3X3NwaW5fbG9ja19pbml0KCZtc2dy
LT5sb2NrKTsNCj4gLS0NCj4gMi4yNS4xDQo+IA==
