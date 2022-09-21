Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B55C0483
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 18:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXknh0jkFz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 02:46:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yR5k9e8R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.79; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=yR5k9e8R;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120079.outbound.protection.outlook.com [40.107.12.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXkmt0N10z3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 02:45:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK29GWOxtqNBhD16u0RYfHXUPtu7jT3pXHQlCrnYNyoqANfI1+gV6fczYZbPM6SC35tFg3RE8qZVRWOGjVZsHG+EklaVXmzhStLJmfuBeGFdXzbK/UW5G8nFCIjPxVp56EYJYI879oByEOL5baQ2ytOG9dofy1SI7mH9AeSsI72kxbqo1Gk5+EysjID8rH8QTp9lsr//6YhlkuoOtD+9HnxpsI3DJ144DeeRs3DvhL3ZFxXkrmI67bvlVR3nAX5ojrELHUfWEJyPwvp9HaeVLQykeLhEJs/7q+/Py7kfxO2rhpoLekbTw6ogTzZjz3G2hSskhYWasCBqyF0SE7eIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfk0AnfMcNoW47Qpuj8jyMI6oYlnFxWgqe/MIVXeN0U=;
 b=Vbk0Y7P2Iu2fwCxuZ/yz7Pp444MAebYRklEqDSkblUewlS06DyS3wYYaVN8VbYrBxIl7NZPDaoTZP6TC/aOQfTp1HyMYtXu8PxDRprW8FRGf4yq7YiFAqqUr/9Bs10jsEo4FVP4qIajV9jamYzHltajkYsdpCTeXldI/fkIOmqGHDIsZQ/bo7b7Q5bsmW5gUJqCroRXbPjdDpcZTecf62FRNlNWIjVgEjPyxMHjeTnIbXPinTNU3cWhvsF8pHeJEw5lxU2xMdw6MAoCmPxsRcpeyBzQYkQHHRcfeVH7S5CTnI+gNSd1BfGgR83Yct5+GL6zTUk81g1XfRDpMd7TXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfk0AnfMcNoW47Qpuj8jyMI6oYlnFxWgqe/MIVXeN0U=;
 b=yR5k9e8RRS5KN++8INzfqp9VwZmoSq9WfEf4DJkJKPvvDc2gN3zQ+/SoVX1wout/PlE8EuZr5OBi3ialEQX8/0r49dgG6+iQxHV9UE5b0VS0abCblVrkelDwjgUpu+wV3y4FckIyOyh8HxVM31tW3fP2yOEF4w1SWVkd+PY9NaYNJFew2AQvCZhknZnEjWegBHNTkWgqAqQTm3rY6es6sRPyU2i9KR8DnhgmPcCe1tVzNq+hufPzTlJwDLOe8+brdaQC94lvRH9oTnizFxjRbVjJJhmegYBiyxpN/58KNYIZHKLY+hG+gw6PdtLE4DrtFdfqTjI1KaboX+M/ofHfag==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2292.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 16:45:13 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.024; Wed, 21 Sep 2022
 16:45:13 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 /
 G5
Thread-Topic: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970
 / G5
Thread-Index: AQHYzVtSn54TIJIlBUm8z4ZokPyvWa3qGFIA
Date: Wed, 21 Sep 2022 16:45:13 +0000
Message-ID: <07ff223f-17d3-0f15-54b2-4adac7401b1d@csgroup.eu>
References: <20220921014103.587954-1-npiggin@gmail.com>
In-Reply-To: <20220921014103.587954-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2292:EE_
x-ms-office365-filtering-correlation-id: 096555cb-f982-4128-d276-08da9bf0a7c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  z51B1g7JcO1CKKanwoja4qCH9eju4PUbpqiRM6oFVNeFe1G2uez4qF0p6fMoURwcBdy8I0VD3fZ45l9tKgs2GYyjvHRz9UOMBBUSrQKgTy3laZrB/jol7dhC9loKVT9GYdk07jsa2bG849zBEUX+kpv1/rms0A8y3mgMd8GMfNMzhQixhSPWnS40LvPBhS2LyQgIf83FFXT0EQWNkeD+ul1NIWQBIAUCkHqzLT0FkNtXSogE9ejyirfaFtpir6fAe6C6f1HdAtR2LSU5QvUa5O8n5e5LQ3jqsc8Ct5U7+y5Hv1lRYJ/1RN/w5lnIxiIdaVeBKL8sXDTYUangQGbI6hyklm7KMPvjrrbmTBfEQWVfi67Xbg3Y+KfDySeEa4TejF+2ZW0ikyp/cvxoCEtVWlm3koxv3bZGgGc8Z8ppsqcbeWqs/+VrHDxLhHEwwalrAH9RN5AvjjqncWwPTQ5ItD/EJ7Dup+qVxhc8z0nblb6HJQqhiQKKJZ8sNBLTOirYCM9jj91NKqJjtlAp9p7aWGoKyDSFDVbsd/eIh2fXXSullQ77J8UIXTc1E2cNQcBLgs67wJNaJkGFI7fuiXZq3EX/AaoglS/6IWs9ZA5BSaCeeRR0HyGtIxwJJ371IN8lflzszLjUvFO6cklr2Gpq+622pLwgJsV17znXvO7VDR9/0MSH6fiaRYxNGXoLl90sv1tMcbsLeF8fQHjjnoxM9q8Mco6BEhVfCs3HQltWlhi2/6M/Gs+EYEFn28sgzAu8rhfaSnB59Wost7e9gzup/cjLkLQxR9JCWb/oCl0mS0Kz7tAaC8K0IvVgJvX+0gam912gzZgc4E+NtSIughFfFRwYvw2WsZxeVW8nJdg5A2c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(186003)(44832011)(71200400001)(38070700005)(36756003)(91956017)(8936002)(110136005)(5660300002)(76116006)(31696002)(86362001)(66446008)(316002)(64756008)(66476007)(8676002)(66556008)(66946007)(66574015)(41300700001)(2616005)(83380400001)(478600001)(6506007)(38100700002)(122000001)(6512007)(26005)(2906002)(31686004)(6486002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YWNOTTZ6YUwycHFBSGoxVFhITWY4TXVVZnBLVkdobGMwTEJvV1EzMjBRdTV1?=
 =?utf-8?B?d2NzTXVYVWI1UnJ0Zis1M0prUCtWenBPaERTc29DZHpMdUVtU050UlNuMHVH?=
 =?utf-8?B?ZVBQVVh6OVJFQWE5VER5UFVLeVpTU0VodlczdzNVU3gxcWtGVjRsYVZvUnZ3?=
 =?utf-8?B?Qkk2Z3B2UUgvYXIxTHZzbGxpT2doUXhtN3Q4dlBWWHZTT1BraWRoVVJ3bW9h?=
 =?utf-8?B?MFZaS0ZoRmxCaGNSMk8ySVZLME80Nm9MK3BkVkFTS3A2VGVvQzUxeDRYKzg0?=
 =?utf-8?B?SFhvdjlNUUJFdCsrdXdIODV5ekNIVUJEdkhtcnh6bkdtQmlCc0xlRFZhZ2Jm?=
 =?utf-8?B?c2FCVlRFNUFHdjUvbUZ3bE9aWm9iZ3NBNGFKUXBvU2tDVzk1Rnp3NHJ4RWxK?=
 =?utf-8?B?SWJ6ajhOblVUV2Zwa2N6TVlYczJwdU1uNkpadzVMYVZGMllzaCtQcW44ZnhQ?=
 =?utf-8?B?UElySFphQXMyaWhBODZQaDdLUExDSW9wVW11bkM4L2E4eXBDMU5uTTY3MHZP?=
 =?utf-8?B?UkxFMHAzOE9EMU9IRzFFdCt1Ny85N3F0MzR4OHNGNkdtQlMwWTNCL0hhdjQ5?=
 =?utf-8?B?VFEwTEFvazgrM25YSmcwOStXNDVoazNtM2Z3VTFHekppS2ZpRDF1TXR5ZFVC?=
 =?utf-8?B?Rm1OSnVBNEM1RDQyWnFkclJWa2xwVzFLbFAzcXRWdkRNWDFYVU1ZVmxBekFB?=
 =?utf-8?B?eDZzRGxVSHdyRm8zZTBKRER0ZFNkbndtSjlwM0FpdmpUOGE0Yk5pWFpSSS9K?=
 =?utf-8?B?Tk9NM0Z2MUFHWm9LL2xwanA5Q3J5TEVFNHBuTjVtMi91T0I5VWpCWWVncm55?=
 =?utf-8?B?djFUbU9yWlB1M1A3ZlhLdHBKYXByMWJiaUVJVEwvdDg3b2xDbjlYNnFVeTlP?=
 =?utf-8?B?NzRpNWtkdDNxQ2hWWW1IOHJ2R0Y0L09SSjJabDUyZWhMSW9yTU5jaUhOZXNL?=
 =?utf-8?B?STl6L1hIZ3M0clFXV2tjOW93Vmt3d0hVWGVGUDF5OU1JQTdESmc3Z3ZHZCt6?=
 =?utf-8?B?WnJYWEVDSjc0d01mZUZTZVVHTVVQbHpFRWwrcDVkTjh3WEtIdFlTdGpMb3Jl?=
 =?utf-8?B?Vm9lZVdJcEdMTDkrZlpZb1FXcFp5YklFVVJvUGNOZWJRV1J0Sm1EeWRtZmVW?=
 =?utf-8?B?TkJkTVJSWFpUNVJ2eVRTSk55cS9RYVlwRlpGRnQwWDdwdzIwbGl6ODFNbW03?=
 =?utf-8?B?ZktpTjllOFJEZmFxNHZ2UTdoSzN4Q1JrY0YrL3VDYU4rZFJ3WGpPZTZRY01Z?=
 =?utf-8?B?Lys3ay9NNy9kSzZGMlBtRmNaMThiSTlvZC95UktHT25WSlpocUVVRStGTTRq?=
 =?utf-8?B?U1c2K25WamRRcnA5VTI3ckE3eWV5VnVJYzlmWjJnZEV5NU9zamNZNnF6blVt?=
 =?utf-8?B?aGpDYjFTRjJ1TmE3dEh5M0pIVDZ6RUVrbDY1L1YyK1RRSXRKTkVKNktkYjBm?=
 =?utf-8?B?a2VjZGZ1dmNXeVhtM3dxeCtFcEgzdnpxa2taUTVZT3NLMTlaWUVjOTlJVFdi?=
 =?utf-8?B?MG1sNXhxUDBCRjFmYlVKbGM0cGZBR0NId2o3cXdNS1YyVnNGbndlUEg5bEpL?=
 =?utf-8?B?UlkwK004L2hWNWRURlJncUVpVS9DZzBBd2paRGEwbTUrdXFFRnlIVDd1NjdW?=
 =?utf-8?B?NjJmaHEvOCtOZ3FnSEZjdDREQ3NIU0NJYWV0UmZuTU42OW1KV3YwcFpUSmpC?=
 =?utf-8?B?bC80WHhoamhQLzk4cm1sWitVcG85akhtNU9VUWt0U21lamJtd3h4dGRYczg2?=
 =?utf-8?B?Tm5qeG8rR2hGYW93OGlIRjlXcXdVYllQVGcwOW5pQ1pEd2pBZk81M3VjZjdT?=
 =?utf-8?B?bUw5QVVjYXZJbHNHVytqVWdrY3dkODR4QlhrTGQ1VVptRWUzc0hYRkVNdEFa?=
 =?utf-8?B?YUpaZEx5RWx4MUpJV0sycERYSldhZnlxWkJjc2NoZmlCQjQ4QytRbFBqTkNu?=
 =?utf-8?B?bkpJaTZDUjdVTmkxL0tTN3ZlSEZQVklQb0Y1UENhQ0RDZ0dmSExKY1hPbXRs?=
 =?utf-8?B?YWtuRWtvK1NMSGRQZnIwMDFnaTNQMlZUckFTVmhBUWVUOElMcGZGYktQd09B?=
 =?utf-8?B?S051VllYVE9idDhoMFJLZTFuT2lReDg1eis0TXFveEFJWkFHN3BTcXZIcWFP?=
 =?utf-8?B?NHAwd2FPclA5MEVrZldPTXRPUkM4cEZMQTA3MnN4bmhOQnV2ZU5lQ05XNFFk?=
 =?utf-8?Q?lJJZYgoHgmN+a5d4JZo30pg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53BA4FD17279E3429DD386C8202C85AB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 096555cb-f982-4128-d276-08da9bf0a7c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 16:45:13.5340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZ8phQgYU/vCVTRkdN4tZ97O0SNaMHzudAn2S1IBwKxrnbGv3z5kghEudNVX/+DCw9yt3XaOGXYEDOVXm5Up5gCeKCN+qENOrAQm1qYUUU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2292
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

DQoNCkxlIDIxLzA5LzIwMjIgw6AgMDM6NDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBCaWctZW5kaWFuIEdFTkVSSUNfQ1BVIHN1cHBvcnRzIDk3MCwgYnV0IGJ1aWxkcyB3aXRoIC1t
Y3B1PXBvd2VyNS4NCj4gUE9XRVI1IGlzIElTQSB2Mi4wMiB3aGVyZWFzIDk3MCBpcyB2Mi4wMSBw
bHVzIEFsdGl2ZWMuIDIuMDIgYWRkZWQNCj4gdGhlIHBvcGNudGIgaW5zdHJ1Y3Rpb24gd2hpY2gg
YSBjb21waWxlciBtaWdodCB1c2UuDQo+IA0KPiBVc2UgLW1jcHU9cG93ZXI0Lg0KPiANCj4gRml4
ZXM6IDQ3MWQ3ZmY4YjUxYiAoInBvd2VycGMvNjRzOiBSZW1vdmUgUE9XRVI0IHN1cHBvcnQiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPiAt
LS0NCj4gICBhcmNoL3Bvd2VycGMvTWFrZWZpbGUgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+IGluZGV4IDAyNzQyZmFj
Zjg5NS4uMTQwYTVlNjQ3MWZlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvTWFrZWZpbGUN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL01ha2VmaWxlDQo+IEBAIC0xNTIsNyArMTUyLDcgQEAgQ0ZM
QUdTLSQoQ09ORklHX0dFTkVSSUNfQ1BVKSArPSAtbWNwdT1wb3dlcjgNCj4gICBDRkxBR1MtJChD
T05GSUdfR0VORVJJQ19DUFUpICs9ICQoY2FsbCBjYy1vcHRpb24sLW10dW5lPXBvd2VyOSwtbXR1
bmU9cG93ZXI4KQ0KPiAgIGVsc2UNCj4gICBDRkxBR1MtJChDT05GSUdfR0VORVJJQ19DUFUpICs9
ICQoY2FsbCBjYy1vcHRpb24sLW10dW5lPXBvd2VyNywkKGNhbGwgY2Mtb3B0aW9uLC1tdHVuZT1w
b3dlcjUpKQ0KPiAtQ0ZMQUdTLSQoQ09ORklHX0dFTkVSSUNfQ1BVKSArPSAkKGNhbGwgY2Mtb3B0
aW9uLC1tY3B1PXBvd2VyNSwtbWNwdT1wb3dlcjQpDQo+ICtDRkxBR1MtJChDT05GSUdfR0VORVJJ
Q19DUFUpICs9IC1tY3B1PXBvd2VyNA0KPiAgIGVuZGlmDQo+ICAgZWxzZSBpZmRlZiBDT05GSUdf
UFBDX0JPT0szRV82NA0KPiAgIENGTEFHUy0kKENPTkZJR19HRU5FUklDX0NQVSkgKz0gLW1jcHU9
cG93ZXJwYzY0DQoNClRoYXQgZWxzZSBpZmRlZiBDT05GSUdfUFBDX0JPT0szRV82NCBsb29rcyBv
ZGQuDQoNCkkgbWlnaHQgaGF2ZSBmb3Jnb3R0ZW4gdG8gZHJvcCBzb21ldGhpbmcuIFNpbmNlIGNv
bW1pdCBkNmI1NTFiOGY5MGMgDQooInBvd2VycGMvNjRlOiBGaXggYnVpbGQgZmFpbHVyZSB3aXRo
IEdDQyAxMiAodW5yZWNvZ25pemVkIG9wY29kZTogDQpgd3J0ZWVpJykiKSBpdCBpcyBub3QgcG9z
c2libGUgYW55bW9yZSB0byBzZWxlY3QgQ09ORklHX0dFTkVSSUNfQ1BVIGlmIA0Kbm90IGJvb2sz
czY0Lg0KDQpDaHJpc3RvcGhl
