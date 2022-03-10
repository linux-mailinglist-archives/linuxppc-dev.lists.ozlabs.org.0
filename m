Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678534D415F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 07:52:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDfrJ379Pz3bW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 17:52:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDfqm0RrNz2xTh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 17:51:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBuXVjSTHlasDSLgH6B4wa/kf+G2tXFN8nB6Prg0VTQjQDLafRUt96D7fApLrdCMUYjllYqsAMEPiJD+RNzC8pVDyw/2J0Bzcdb1SGELwXb1FdLDB3JlwAt3PuMNo6ICkr5ex1a14AaTQpYUYZ1r6zCR1Dpo97p56jqVU8lBfng0M6/GTGfsHh7RF62YPFPS9W9Iko6+0wU6U56tdlMyqq2wNeV/bUB+Rhf+msX/SUnLbYX80jE/GPd/0Gsvf3D//H5b7KAD/p8FiSaUWC/btEvRfMWq2xbLi9TG5pNHWXwBNOQ0JM1Sz1nQWJC+lvxDXr9/IfJdj4CrFv+NLurgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYOMEuunB7J1YEarpC1L5wNZl0vYnWj5PxOJLI9l0i0=;
 b=N1ks0I9UCT6uA9Xu8XoO92JUAKv3+UhpItfCsLoYFYUMPRwsp95VWAPW+ddZPY6MB2U9KUE/r8IlYiO5O+XavbLGf8nk9I/ZS0gIA7NarJzecefRRE/pNcEjEeN9N+2BsG1hHyd5PuK6TP/7ii6DsTq6P283rk3ANsdY1jKT3ez7cYzp/HWvATGUfVP8Ir1AhrIUkkxE6+G7tXJOaApyrg3mzyI3Ch4UH1ch00m98L1XBjSQAK8+BP3dtzDonCIvVXiGPDp0WFm3G0PWPPG2t/hb51QoGvO7EZ0/bTc70d6Hp3a81SQ6PMaOMCxjXLzNbf0jjhLNQbh6UkY8A2dS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR2P264MB0400.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 06:51:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 06:51:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
Thread-Topic: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
Thread-Index: AQHYM91qt7fUMOkc8kuu86XXaXpzE6y4LsWA
Date: Thu, 10 Mar 2022 06:51:20 +0000
Message-ID: <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1646847561.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c96ae8a-a98f-4544-c439-08da02626250
x-ms-traffictypediagnostic: PR2P264MB0400:EE_
x-microsoft-antispam-prvs: <PR2P264MB0400237BB3EB38B35FB20EB4ED0B9@PR2P264MB0400.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5PY5wsyjSqQhQ9AhX4nrZNgfrN8NyNn0jOqa+T1b2Uq8rO0/ypZ/X4HddSXGlOB1Ye1m3PHBDUjDXHnlqzVLapMv1lEeZjMe4WDzGG6X+aBsC5SI/47TCK/+6ie7KTCYV82YhwFUjTVKK2t3SnmABiXIrGP9yrWOoKqAmeyeSlEn6uPZYI64Qs0YYiXiBOAA7Tv+GvrOyK89NFIdcdyoDPB5+iYdhbnMX6VIErIFYfwaxrree64ydGuwb4V7s80n1sYweS+MCjMY2UM9XosMNvs8vY369U31YJgQUYrWI9K5VgLfyLydp1VqRM/u2vunMg4Etd5Be6Petq0R68pCZzo/sJocfu3MF4v6/dPRWN8YUtYWE8+wqaDi3iTS0n5MMyO5MQnnh2B+eb1a61h8ib6dg2J8CyKurRqcKKxnbbpblP6k4GGCTZKx1RTjMgzRR1PM4/BwrxuDd2NIl6G428IBrksBbxz35UxAR+LKqaSVXDRU9AI3ZBWUbi+1r/k2Ub/acEtiiwfnvaJqVJY0e2IcFOd7gVjcM6m0GfstoGvxgXmQ9vrUJUKYJZp8XeZTgrXNBvcAQCyKEJ7azJEAGXzBbm83Zp5E/m3n3paH1WLiG6GPJ8V3wFT5LMwVwFTLHotRIp4tnjxGYtCh+q22uI7oQYzsuI7y0w2ufE9HpPtJvlU6cidJ4q8Srt6D8eXQKYQOPilzFhXm57nuzebVbsIHqvSyW4XdR9Xc6xxCoCS/ze0KwS2IZd2UJb0b1zOKhHamy4zxcaM66W65WfJMkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(2906002)(38100700002)(54906003)(66574015)(110136005)(2616005)(186003)(71200400001)(66556008)(316002)(38070700005)(26005)(6512007)(66446008)(508600001)(31696002)(6486002)(86362001)(7416002)(44832011)(64756008)(122000001)(83380400001)(5660300002)(36756003)(8676002)(31686004)(4326008)(8936002)(91956017)(66946007)(76116006)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGVXNktQeVFmclpCd3ZCNmVBSEdqbFhqVVdLWXluVVBlYVlmSG1xRGgxOTVr?=
 =?utf-8?B?cnA0ZFZGYm1yQWZ1MTg2U1VPM0Jwa093QTdVRUpOSzh1SHRZdFpjRGtkQ2NU?=
 =?utf-8?B?bXhvNGt0a21qVVlYVXdHV3hCSklpRnJ5eXljK2d6N2YrSG9DNDc4aVNXeXZx?=
 =?utf-8?B?MW13MlJMdDRVVUEzSFVNV3p2ZWpteHRXUkNnUG5RQTgxZE4reTFVWitRc0NX?=
 =?utf-8?B?dThnMjdzNS9nKzMvVUd0ZXhBS3A2aVA2QTQvM1NiU2FLc09mNzFkVlVCWUV3?=
 =?utf-8?B?eEUwMUtUcndWRVBXYlNFTmNpQ21PZ1owUWJzTlhRUGc2K2p0em1HWHdWUGJt?=
 =?utf-8?B?a3R2QWE2QnZGZnIzTnl3U0VSdFowZ0E5dnlaOGlFRktUTjE1TmNWdk5lRG5r?=
 =?utf-8?B?OUZjMmMrVWp1YVlUYmxROU9vVkNIaE1jY1lWdGsxRHljdDRZV2pLYnJ1VDZC?=
 =?utf-8?B?SnNPQUN3NDlGT2JHUk1PVUhHMDFReXV5OW5CU20xRTNIcnpsNWZic0ZNSkhG?=
 =?utf-8?B?Z3ljSWpiTDIwZnVYV3hOWEROQ3VvMzd6U1dwb3gwS1VGbm9VYnVnVkl3blZO?=
 =?utf-8?B?WDBzaUd4MWZUTCtDNFo4MkhWdnRzVHNNVytDcVRoczRCT0dIbkZpYUY4bkRV?=
 =?utf-8?B?bUxVd2lYeURHeVVtc1lFN2FjYlpEbzd5OEl0cm1OZlhHL1M1YVh3VUhjc0cv?=
 =?utf-8?B?dzVjbHdYaHNpcVpjTStWTzRJL0M4WHFlRVZabGNDd1Fhb1kxWUR1Q3BoMEhH?=
 =?utf-8?B?Rm45U3UyRHdCdE80TUVVZUZIVW0rVkx5cEtUdVUvUTZQQ2dlNElaOEJjTW1h?=
 =?utf-8?B?S25aTDg3YmlxVmNVNDJIWWJ1T2ZQZFprelNHbTVxT1N2alUwMTZncUxvM2Ev?=
 =?utf-8?B?MUFXM3hGT09MSmV6QTNFYitIUUxMZldydEJBNitpK2JwK2JzQk43Y1RFQTJK?=
 =?utf-8?B?YXFmUWpmR0pyaDhuRkQ1SG50MXVIeGM2a3BiMEF0VHJ6VmUzajRtZHg4cXBy?=
 =?utf-8?B?UDBrZkE2R2VkTUF5Ny9FaTVKZU5VUjdnTzIwRS9kZ2FxcGorMlI5OHNxNUht?=
 =?utf-8?B?NVNhSEZQQmp4KzhHQUR1R29xYW9GRTQrMHFaYmM5SW9PZjM1RlBwUTVkZE1K?=
 =?utf-8?B?SjhUUlZHS2swTEcwSklQOXlSMVVTd1lqelZoVmxEWEFWQUErWEd4UE9MQlA1?=
 =?utf-8?B?cUdJRkxobmZYeTNobXhnT0RlNDBDeXpvNlB5VEMvUXBLVVVXOUJMVFJ3WWtO?=
 =?utf-8?B?aU14NUtUR29BSXI2VEFOQytSYjJabEJKTks1SjBicUE4bDJjUDNXRFNUNGQ2?=
 =?utf-8?B?SmxuYUgvZktoRVpraFI4Q1dDTi8vbVR4RUZYL1RJTThrdnJoRWZVVlpVbGxp?=
 =?utf-8?B?eWM1TEtjVjVwQmk4ODAyYjhsbzU1RW5kRERoNWMwRDJhb1VYcUtlNHR5eDdC?=
 =?utf-8?B?cmZBMFFsbFIyTXZZUENyV3YzcWttZCtCd0gwQUxjMGxlcUdwRHRLQ0p1bVpL?=
 =?utf-8?B?aXZhSHUvNEdxR0R4YWs2NFRFaWk2aVdXYjg0aHlJbndEMUNIVzVhaHM3cy9y?=
 =?utf-8?B?Y1lac21FR0RPblp5NHM0UkNFN0pGUi82QXlPNEt4eE1taGRULzJDNGhqQ1I1?=
 =?utf-8?B?R29VekVuUm9lQ2N1M0RkbkgzSk9jYkFDSGN6V2tRZml1MkYvRTl0TTlmcTQ1?=
 =?utf-8?B?UnlnZTNpSXR5bit6aDZPSVJSeWtQc3hWVVJqdC8xamtyZjNoWHBxZUNkTGJ4?=
 =?utf-8?B?N2tWQm02ang4NnE3YTVkdXRGdVpaYWdsbVFFaFhZUXJSOVB5MDZBVnpSMmpl?=
 =?utf-8?B?KzZCZkFXeXcza2hoVHR2OGN2MURnSFZyR3VhcXlDdXJRaVBWRloyR3RFMFpY?=
 =?utf-8?B?UFd2aDAxRlFWb1M0MEhZVEpPV0VYNXk3THVGd1dVQU54elhlY0I5OURRQm84?=
 =?utf-8?B?NHUrQUJBZXRMdTBkalJNQWZCdmFtRUgzb3BBRENPNDQyMm50QlFFZWNncTdU?=
 =?utf-8?B?NHg3RzAxdnhjcjRtcHJ1TEJrbHEwSnNNYU4xSVJXMmpRZGlCOG9TSXQwSVF4?=
 =?utf-8?B?ekJiamc1dTlKcDZDQWVGcWpiYkQ1OUFySmVvRWY2QVdQUnlOdGVIUTlRODF0?=
 =?utf-8?B?WjlqZjI3aG1GOTJsYXBwRzllcEhjVW92ei90WisvazMwQmRpZmUwNXB1bFcx?=
 =?utf-8?B?UkZycG1JQUU1TytsSVZUUWRvVk90dElnbm4xLy8xV3RFbytYamRjOERReVpU?=
 =?utf-8?Q?6cf9R1YyLlf63ahllxAMQM5ePlPjnX80l76H0RAh6I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0B5D5A4CA43584A94D4CADA23B1C9E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c96ae8a-a98f-4544-c439-08da02626250
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 06:51:20.5232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oiqwk6PanS9f/EbL6VwKiwV97Stz1jiGWUFn52mclsiQqRrQtL/4C5bzg0jh9iMLSyqpnpK0bYt+Q3B5pb39IaF2F4NujpU0IMEVSTkWqBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2P264MB0400
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTWljaGFlbCwgaGkgQW5kcmV3DQoNCkxlIDA5LzAzLzIwMjIgw6AgMTg6NDQsIENocmlzdG9w
aGUgTGVyb3kgYSDDqWNyaXTCoDoNCj4gUmViYXNlZCBvbiB0b3Agb2YgcG93ZXJwYy9uZXh0IGJy
YW5jaA0KPiANCj4gVGhpcyBzZXJpZXMgY29udmVydHMgcG93ZXJwYyB0byBkZWZhdWx0IHRvcGRv
d24gbW1hcCBsYXlvdXQuDQo+IA0KPiBwb3dlcnBjIHJlcXVpcmVzIGl0cyBvd24gYXJjaF9nZXRf
dW5tYXBwZWRfYXJlYSgpIG9ubHkgd2hlbg0KPiBzbGljZXMgYXJlIG5lZWRlZCwgd2hpY2ggaXMg
b25seSBmb3IgYm9vazNzLzY0LiBGaXJzdCBwYXJ0IG9mDQo+IHRoZSBzZXJpZXMgbW92ZXMgc2xp
Y2VzIGludG8gYm9vazNzLzY0IHNwZWNpZmljIGRpcmVjdG9yaWVzDQo+IGFuZCBjbGVhbnMgdXAg
b3RoZXIgc3ViYXJjaGl0ZWN0dXJlcy4NCj4gDQo+IExhc3QgcGFydCBjb252ZXJ0cyB0byBkZWZh
dWx0IHRvcGRvd24gbW1hcCBsYXlvdXQuDQo+IA0KPiBBIHNtYWxsIG1vZGlmaWNhdGlvbiBpcyBk
b25lIHRvIGNvcmUgbW0gdG8gYWxsb3cNCj4gcG93ZXJwYyB0byBzdGlsbCBwcm92aWRlIGl0cyBv
d24gYXJjaF9yYW5kb21pemVfYnJrKCkNCj4gDQo+IEFub3RoZXIgbW9kaWZpY2F0aW9uIGlzIGRv
bmUgdG8gY29yZSBtbSB0byBhbGxvdyBwb3dlcnBjDQo+IHRvIHVzZSBnZW5lcmljIHZlcnNpb25z
IG9mIGdldF91bm1hcHBlZF9hcmVhIGZ1bmN0aW9ucyBmb3IgUmFkaXgNCj4gd2hpbGUgc3RpbGwg
cHJvdmlkaW5nIGl0cyBvd24gaW1wbGVtZW50YXRpb24gZm9yIEhhc2gsIHRoZQ0KPiBzZWxlY3Rp
b24gYmV0d2VlbiBSYWRpeCBhbmQgSGFzaCBiZWluZyBkb2luZyBhdCBydW50aW1lLg0KPiANCj4g
TGFzdCBtb2RpZmljYXRpb24gdG8gY29yZSBtbSBpcyB0byBnaXZlIGxlbiBhbmQgZmxhZ3MgdG8N
Cj4gYXJjaF9nZXRfbW1hcF9lbmQoKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KV2hhdCdzIHRoZSB3YXkgZm9y
d2FyZCBmb3IgdGhpcyBzZXJpZXMgPw0KDQpQYXRjaGVzIDEgaGFzIGJlZW4gbWVyZ2VkIGluIFBD
SSB0cmVlLg0KDQpQYXRjaGVzIDIgdG8gNSBhcmUgY29yZSBtbSwgcGF0Y2ggNSBiZWluZyBhIGZp
eC4NCg0KVGhlbiBwYXRjaGVzIDYgdG8gMTQgYXJlIHBvd2VycGMuDQoNCldoYXQgd2lsbCBiZSB0
aGUgbWVyZ2Ugc3RyYXRlZ3kgPyBJIGd1ZXNzIGl0J3MgYSBiaXQgbGF0ZSB0byBnZXQgaXQgDQp0
aHJvdWdoIHBvd2VycGMgdHJlZSwgc28gSSB3YXMganVzdCB3b25kZXJpbmcgd2hldGhlciB3ZSBj
b3VsZCBnZXQgDQpwYXRjaGVzIDIgdG8gNSBpbiBtbSB0aGlzIGN5Y2xlLCBhbmQgdGhlIHBvd2Vy
cGMgb25lcyBuZXh0IGN5Y2xlID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gDQo+IENoYW5n
ZXMgaW4gdjg6DQo+IC0gTW92ZWQgcGF0Y2ggInNpemVzLmg6IEFkZCBTWl8xVCBtYWNybyIgdXAg
ZnJvbSB3aGljaCBpcyBhbHJlYWR5IGluIGxpbnV4LW5leHQgYnV0IG5vdCBpbiBMaW51cyB0cmVl
IHlldC4NCj4gLSBSZWJhc2VkIG9uIHRvZGF5J3MgcG93ZXJwYy9uZXh0DQo+IA0KPiBDaGFuZ2Vz
IGluIHY3Og0KPiAtIFRha2VuIGludG8gYWNjb3VudCBjb21tZW50cyBmcm9tIENhdGFsaW4gKHBh
dGNoZXMgMyBhbmQgNCkNCj4gDQo+IENoYW5nZXMgaW4gdjY6DQo+IC0gTmV3IHBhdGNoIChwYXRj
aCA0KSB0byB0YWtlIGFyY2hfZ2V0X21tYXBfYmFzZSgpIGFuZCBhcmNoX2dldF9tbWFwX2VuZCgp
IGludG8gYWNjb3VudCBpbiBnZW5lcmljIGh1Z2V0bGJfZ2V0X3VubWFwcGVkX2FyZWEoKQ0KPiAt
IEdldCBiYWNrIGFyY2hfcmFuZG9taXplX2JyaygpIHNpbXBsaWZpY2F0aW9uIGFzIGl0IHJlbGll
cyBvbiBkZWZhdWx0IHRvcGRvd24gbW1hcCBsYXlvdXQuDQo+IC0gRml4ZWQgcHJlY2VkZW5jZSBi
ZXR3ZWVuIHx8IGFuZCAmJiBpbiBwb3dlcnBjJ3MgYXJjaF9nZXRfbW1hcF9lbmQoKSAocGF0Y2gg
OSkNCj4gDQo+IENoYW5nZXMgaW4gdjU6DQo+IC0gQWRkZWQgcGF0Y2ggMw0KPiAtIEFkZGVkIGFy
Y2hfZ2V0X21tYXBfYmFzZSgpIGFuZCBhcmNoX2dldF9tbWFwX2VuZCgpIHRvIHBhdGNoIDcgdG8g
YmV0dGVyIG1hdGNoIG9yaWdpbmFsIHBvd2VycGMgYmVoYXZpb3VyDQo+IC0gU3dpdGNoZWQgcGF0
Y2hlZCAxMCBhbmQgMTEgYW5kIHBlcmZvcm1lZCBmdWxsIHJhbmRvbWlzYXRpb24gaW4gcGF0Y2gg
MTAganVzdCBiZWZvcmUgc3dpdGNoaW5nIHRvIGRlZmF1bHQgaW1wbGVtZW50YXRpb24sIGFzIHN1
Z2dlc3RlZCBieSBOaWMuDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0KPiAtIE1vdmUgYXJjaF9yYW5k
b21pemVfYnJrKCkgc2ltcGxpZmljYXRpb24gb3V0IG9mIHRoaXMgc2VyaWVzDQo+IC0gQWRkIGEg
Y2hhbmdlIHRvIGNvcmUgbW0gdG8gZW5hYmxlIHVzaW5nIGdlbmVyaWMgaW1wbGVtZW50YXRpb24N
Cj4gd2hpbGUgcHJvdmlkaW5nIGFyY2ggc3BlY2lmaWMgb25lIGF0IHRoZSBzYW1lIHRpbWUuDQo+
IC0gUmV3b3JrZWQgcmFkaXggZ2V0X3VubWFwcGVkX2FyZWEgdG8gdXNlIGdlbmVyaWMgaW1wbGVt
ZW50YXRpb24NCj4gLSBSZWJhc2Ugb24gdG9wIG9mIE5pYydzIHNlcmllcyB2Ng0KPiANCj4gQ2hh
bmdlcyBpbiB2MzoNCj4gLSBGaXhlZCBtaXNzaW5nIDxsaW51eC9lbGYtcmFuZG9taXplLmg+IGlu
IGxhc3QgcGF0Y2gNCj4gLSBBZGRlZCBhIHBhdGNoIHRvIG1vdmUgU1pfMVQgb3V0IG9mIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0g
TW92ZWQgcGF0Y2ggNCBiZWZvcmUgcGF0Y2ggMg0KPiAtIE1ha2UgZ2VuZXJpYyBhcmNoX3JhbmRv
bWl6ZV9icmsoKSBfX3dlYWsNCj4gLSBBZGRlZCBwYXRjaCA5DQo+IA0KPiBDaHJpc3RvcGhlIExl
cm95ICgxNCk6DQo+ICAgIHNpemVzLmg6IEFkZCBTWl8xVCBtYWNybw0KPiAgICBtbTogQWxsb3cg
YXJjaCBzcGVjaWZpYyBhcmNoX3JhbmRvbWl6ZV9icmsoKSB3aXRoDQo+ICAgICAgQ09ORklHX0FS
Q0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQNCj4gICAgbW0sIGh1Z2V0bGJmczog
QWxsb3cgYW4gYXJjaCB0byBhbHdheXMgdXNlIGdlbmVyaWMgdmVyc2lvbnMgb2YNCj4gICAgICBn
ZXRfdW5tYXBwZWRfYXJlYSBmdW5jdGlvbnMNCj4gICAgbW06IEFkZCBsZW4gYW5kIGZsYWdzIHBh
cmFtZXRlcnMgdG8gYXJjaF9nZXRfbW1hcF9lbmQoKQ0KPiAgICBtbSwgaHVnZXRsYmZzOiBBbGxv
dyBmb3IgImhpZ2giIHVzZXJzcGFjZSBhZGRyZXNzZXMNCj4gICAgcG93ZXJwYy9tbTogTW92ZSB2
bWFfbW11X3BhZ2VzaXplKCkNCj4gICAgcG93ZXJwYy9tbTogTWFrZSBzbGljZSBzcGVjaWZpYyB0
byBib29rM3MvNjQNCj4gICAgcG93ZXJwYy9tbTogUmVtb3ZlIENPTkZJR19QUENfTU1fU0xJQ0VT
DQo+ICAgIHBvd2VycGMvbW06IFVzZSBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhKCkgYW5kIGNh
bGwgaXQgZnJvbQ0KPiAgICAgIGFyY2hfZ2V0X3VubWFwcGVkX2FyZWEoKQ0KPiAgICBwb3dlcnBj
L21tOiBVc2UgZ2VuZXJpY19odWdldGxiX2dldF91bm1hcHBlZF9hcmVhKCkNCj4gICAgcG93ZXJw
Yy9tbTogTW92ZSBnZXRfdW5tYXBwZWRfYXJlYSBmdW5jdGlvbnMgdG8gc2xpY2UuYw0KPiAgICBw
b3dlcnBjL21tOiBFbmFibGUgZnVsbCByYW5kb21pc2F0aW9uIG9mIG1lbW9yeSBtYXBwaW5ncw0K
PiAgICBwb3dlcnBjL21tOiBDb252ZXJ0IHRvIGRlZmF1bHQgdG9wZG93biBtbWFwIGxheW91dA0K
PiAgICBwb3dlcnBjOiBTaW1wbGlmeSBhbmQgbW92ZSBhcmNoX3JhbmRvbWl6ZV9icmsoKQ0KPiAN
Cj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAgICAgICAgfCAgIDQg
Ky0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2h1Z2V0bGIuaCAg
fCAgIDQgLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11LWhhc2gu
aCB8ICAgMSArDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9tbXUuaCAg
ICAgIHwgICA2IC0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3NsaWNl
LmggICAgfCAgMjQgKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAg
ICAgICAgICAgfCAgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGFjYS5oICAg
ICAgICAgICAgICAgfCAgIDcgLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgg
ICAgICAgICAgICAgICB8ICAgMSAtDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Byb2Nl
c3Nvci5oICAgICAgICAgIHwgICAyIC0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2xp
Y2UuaCAgICAgICAgICAgICAgfCAgNDYgLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS90YXNrX3NpemVfNjQuaCAgICAgICB8ICAgOCArDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9w
YWNhLmMgICAgICAgICAgICAgICAgICAgIHwgICA1IC0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYyAgICAgICAgICAgICAgICAgfCAgNDEgLS0tDQo+ICAgYXJjaC9wb3dlcnBjL21t
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstDQo+ICAgYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L01ha2VmaWxlICAgICAgICAgICAgIHwgICAyICstDQo+ICAgYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L2hhc2hfdXRpbHMuYyAgICAgICAgIHwgIDMzICsrLQ0KPiAgIGFyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jICB8ICA1NSAtLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL21tL3sgPT4gYm9vazNzNjR9L3NsaWNlLmMgICAgICAgIHwgIDcxICsrKyst
DQo+ICAgYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgIHwgIDM0
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9tbWFwLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDI1NiAtLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL21tdV9j
b250ZXh0LmMgICAgICAgICAgfCAgIDkgLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gvdGxi
LmMgICAgICAgICAgICAgICAgICB8ICAgNCAtDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9L
Y29uZmlnLmNwdXR5cGUgICAgICAgIHwgICA0IC0NCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaS14Z2VuZS5jICAgICAgICAgICAgfCAgIDEgLQ0KPiAgIGZzL2h1Z2V0bGJmcy9pbm9kZS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNiArLQ0KPiAgIGluY2x1ZGUvbGludXgvaHVn
ZXRsYi5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArDQo+ICAgaW5jbHVkZS9saW51eC9z
Y2hlZC9tbS5oICAgICAgICAgICAgICAgICAgICAgIHwgIDE3ICsrDQo+ICAgaW5jbHVkZS9saW51
eC9zaXplcy5oICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsNCj4gICBtbS9tbWFwLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDMgKy0tDQo+ICAgbW0vdXRp
bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgMzEg
ZmlsZXMgY2hhbmdlZCwgMTg1IGluc2VydGlvbnMoKyksIDUzNSBkZWxldGlvbnMoLSkNCj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3NsaWNlLmgNCj4gICBy
ZW5hbWUgYXJjaC9wb3dlcnBjL21tL3sgPT4gYm9vazNzNjR9L3NsaWNlLmMgKDkxJSkNCj4gICBk
ZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL21tL21tYXAuYw0KPiA=
