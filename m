Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060075A5B13
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 07:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGwkx5px9z3c16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 15:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tQBQIPU0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tQBQIPU0;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGwk8582dz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 15:25:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aClyTQgQthmA++lXmTi9OF+ydBxDQdeNx+j7fa1YiO+lIbu7ExfX58Sr9iqe6r0sFMZVc0Vv4DDxK1jv0vOHB2qtX1vKiXSvWK2TX2gvNcyEMMJZMg5LinU0kdhvHN23tgqUvrO1Hycw1BdeUPZNQwtQi0jKM2J3yNM3kZvxEYk5G8oqgEIzIsPCqejG9FEeCxtZG6WyQ4TMs7jZLITg0mojgM4duq4u2DsPCeraQotXvMFw9C+nT0BIO3qnsP5fHkGP4C6B8VEYbrCbtypU/LBL/jAkDkPHrAke3rSRofb0sTnHNmmM2w6pCJQRljNJYYmjjkvjvo5/trnkZyaBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFRPbvSwtQSoxp8B1mCQJpVjKnKK0Wfu5IXYOlMIT6Q=;
 b=hQiGP2aypbQO8Ufkx+D7Iwol8cY6oYvljQ9j9qDximCmWmFNovVaXPy+Qc+rlwSFt75WcarjX716m4lVnizPluAI9ZJWXnO5j9DPodfTzF+rujvv82/MZ8HxEYYyWk32Zh2CLjg0MDeXWITzqVeUzN6KryXRpR4xkMlwfCV+sdCw/DCOFdfnSrjWpLpX1dHXL5BknjGlQXZc1kTyzPBuY4k91/L1qNnWhjaap8Nu4dbu6vzJyMVP5pGFtMeYzL6aGKTs37pH06KN7PXhyBSId/OhENZ/uSPzs1DP4tMwfRSlmc/ITKZiq5MM0+vEMjiCMtPD3bAfrnGpj4zUcroJXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFRPbvSwtQSoxp8B1mCQJpVjKnKK0Wfu5IXYOlMIT6Q=;
 b=tQBQIPU0U7XbcBrW3cy0vzjuhf2fzAxtmtU0qCagpwuQzmsGykofmfzqpign6h+CCKo+XGAg8W5KZ7VpDtDUcuElKWxUYc1c8bqSIZy8+pxM2qXP1HNqRD30NncbVR8BDh1YYlU3pRX+PrP3mj0eDXn6aGeln+PUntX1MY24q1PbHz6KqAHuoOPvYKsC97w4sXUp7eJfZGNK2xGmzXEGU1BpHrqpWWWxBJdMIbcdTIqHm63HJuBf7qEKN5l6TmRkb4JFAt2GJMwp3j37M1+pte1DhwgfFlfJ+j0bb8Q2d4Vag1CWrrFyxQ4LHaA1HHcKRoMwIhGob2eYrvG+H4TAfQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3922.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:24::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 05:24:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 05:24:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Topic: [PATCH v2] powerpc: Fix irq_soft_mask_set() and
 irq_soft_mask_return() with sanitizer
Thread-Index: AQHYtw7tEe9N/+CAqU6ZnvEJZB4bTq3G8M2AgAACxIA=
Date: Tue, 30 Aug 2022 05:24:59 +0000
Message-ID: <e022754d-b4d3-bc9f-cc79-2cf556180459@csgroup.eu>
References:  <c0b486e782b6695092dcdb2cd340a3d44c8c266d.1661272738.git.christophe.leroy@csgroup.eu>
 <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
In-Reply-To: <CMJ3VICKD1CI.SVFJOKYJPKZQ@bobo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50992f34-5596-42bf-c73b-08da8a47fb5e
x-ms-traffictypediagnostic: MR1P264MB3922:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +wdqOHxTXSWYdpp/dzKckO70hWyfvL2kAqw7ARYqPbj3sPo2PpudeFlzCFmE8rYrzIvbzgMEcn6VVYb6htWXDlsOZJ00hqm3fTxspBeebrF8qKj5x8m2hgd8rihcuOc+T11DkpGayRl87rZMXG58+I8L2kT39AtKx/iAVtXNpCqh5Snn1xiobQ1r3V3UJLS8HgMEOpIvBW99AEY9SKqj52PGB26SkVM9fXQn0hPEzLLPxRxDgRI9fH0NH2KOl0IzAiAM9rWKhC5m8mmOSYsknGVTYVVJ+avD2d5Uqkufju6WE+opvgcjD+15jJA0uRUgOUAtzDclHtAiPrEzuK94a63GtfhI8CBvmkSpVdxvG6YbIQAOUNjKFl2uyGkeUmwfCCQD9mDH5soMn1QyjNjtVRRqfV8o7pt7FOK4nt8WNOVTsx9ERN6KvNKpVtLMwHVCA2W86zWpWg3mZedWrm71lS4O5k6PzbjbYRODa97iHqPMf0AgpYlA+/r+CNo3mECx1svb+sVRvy98xKvTXNOYkFBNXkebH0xmdftl8fhr3h90V6+m08jg2TSoiq4lgHM+RgLjC18tLyrKjjMd8hCH8oWijS2QXjhVvEUxPUWMekq5TK4o7J4qZwFxom2rQkNYc9nGKXX6SQZVgBXJOXK+/OMKu4HFwpdO4/c8Ugl5IOCsjvDMsNJAPZi+DPAWUVU+MusvdSekrhVq44XXWps+2E0RT8x6OfAbfnXnlPO0ALXqZCagOb8HRia8Bi0LYvk4fwwUKvV5wdnO5YMUzbwofJH+m0K7CTM40OJJQvSMJidI/gRVcaPA3aonujC8qLIQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(26005)(6512007)(122000001)(36756003)(110136005)(316002)(38100700002)(71200400001)(54906003)(38070700005)(8676002)(31696002)(66446008)(6486002)(6506007)(41300700001)(66946007)(4326008)(8936002)(91956017)(66476007)(64756008)(66556008)(76116006)(31686004)(186003)(5660300002)(66574015)(478600001)(2906002)(83380400001)(44832011)(86362001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MVZTOVlvMWpOSmp2eVhtcktJdlVTbmRvLzFJVXZ5M2Y4K1BzRXdzTW5vMjA1?=
 =?utf-8?B?eW4xVlFtWXQ4am1XOVBNK252VTBSVUxlS3d6K011T0k1ZGtEVDNZNDJiY2tC?=
 =?utf-8?B?VlB2d21sa1hmV0hyMWwvV29qd1h1eXpaKytrMFVucW5pQ09mdXJvcWFPRHl2?=
 =?utf-8?B?RU55NjZ5RGNMa283NFZZVTl4V0REU3VXMFU1eEtQWjl5bVpXcTRTZXhDK21U?=
 =?utf-8?B?MXZaL3JsU2w3eFIxbjdnaWdubzRDQThXMlhkR01OOEtvNGNQUWVodE1HYm5a?=
 =?utf-8?B?ZzZKSitXTFFXSHhlOGxid2VrY2VraGpwNWNubjdWTStFcDNVSSs2NVlmOFN6?=
 =?utf-8?B?ZzNsY0NZWmtQQTlQVnB6eGZ3WURxaEFEYk1VbG41VEJDVUZoL1BxZzgvb2VZ?=
 =?utf-8?B?T251WUExYWRSUy8xWXRPRzdMWkQrWlF6QVlzdGlPeE1TV0w2KzVJbnpXZFRU?=
 =?utf-8?B?RHcxS2ZOalhCbGtvbDFINHdWaExncE1rZWwwQllYaE93Sld6MElqaVREVXAv?=
 =?utf-8?B?RmRaR21UTmx1SElKM2oybXZ6N1FvQ3k1OEJHWDk3NklCRHY3U1MrajJ5NmlW?=
 =?utf-8?B?dzJEVzgyMmw0QklhL05sSk1HY2NKbURUYllIc3VhTGh0YzFFR0J1KzdpdXZo?=
 =?utf-8?B?Vy8xTEZOS1B0Zzg2N2t4cVRVOHdqOHg1Y0ZNMU10SnY0amtiZG5tVFIrNTdG?=
 =?utf-8?B?aG42Y2tvQktQR1ZsbWRhZS9JMkJFNGRST2JoaW5BVVBBbitsZmtacVJpSWxq?=
 =?utf-8?B?VmpzUkJXSlN5eGpSZWRxRlRBT01YMDZwa2JVU2owY1RHdmRWeXRJeXZNMjl2?=
 =?utf-8?B?L21ramRzL2pjSUk4anJIcG9VVHpUUGFwOTlGZGQ2UDhoUmxTWUUxZUczRGY3?=
 =?utf-8?B?Nis1emRvdjByMTJLZlY2SWNGZ2xjUlhqR21nSHY0NjVhZDJoa29uOUVtL0RK?=
 =?utf-8?B?bUdyWEFxWEJFN3YvREV2RERkZkZhMGJlSE1VSWNJTTM4WmpJZ2FsdE9TNi9L?=
 =?utf-8?B?UnlXbDJyYjRkSVUrVkdYaEVEZFJDR05kbmFNTUtmbDBVM0MzM01pOUk2aXdF?=
 =?utf-8?B?ZE91RXUrSDBJS1A5Yksxd1g0Q1Nxb1NiYXhnanBxcTJ6TXJuWkNMb3g2dnU5?=
 =?utf-8?B?aE9jVWpSVTBrNjNMREI2Q1gzV3dpc2gwdHlQUWdMTmptTUlKbVVzZkJEbUVl?=
 =?utf-8?B?V1kycEVyVUNqclBDVzBqNmZZVU1aR1h2UlpxZ1RzNnJENnMxS0pKUFdvMFFv?=
 =?utf-8?B?YjI0VkZFRTNhaTFHR1crVnNqS2kyMGtxLzFUV2oxZTdScVVuWFNxblRwbmFC?=
 =?utf-8?B?RHNpbE9KdFFzd2dyclN3SUd3Tlh2ZG9VOE5xZUJQWlVZN1h3a0J6ZTlNMmxj?=
 =?utf-8?B?SThyc3dlQnY3SnFyQmlLL0QvTUMzeDVUUFEzLzFxUE0zaytxZDRTUXhJVWd3?=
 =?utf-8?B?a0JlMUZIV291T3FuVFdrYmlQYU1jRlk2cEdMUXUwbXNVb3ZxREtTUmRpc0ha?=
 =?utf-8?B?OWUvbTlybE5IUEc4djZkcHd5ejZ2WU44WitEeHZub2tDaWpBU2gwSC9zVEhv?=
 =?utf-8?B?bjM4cVpVNDQ3V3pwWW1NWCtmNDlDZU5SUGR5b0Y4a3lDaGcvTEtSVHp3L1R1?=
 =?utf-8?B?cnl3Q01SYVZtU21NNGZSeUJJTmJ2RTkxQzAxYWh2TS9vbUpUejZMS013dUQ1?=
 =?utf-8?B?RUp3alR0TW9VWWZacmIxRUNmWHZoWVF3ZVQ3dkJnT3F1MjJYaEFZZFZDSG9m?=
 =?utf-8?B?ajJjNElDM2NhN05PUXlrMWRGTXNYdHNETnhLdGFSeERPTlBTYU83TEVubndj?=
 =?utf-8?B?Q2Ezb0g2MlhiY2NGeEFJSllYVWJSQXRRUE5XVGUzRkRucDBFdkYzM1VXZ3Z0?=
 =?utf-8?B?NXJxM0hPQjI3eHBjSkk3Y2JhL1cvb2krNjFod0JnRDFTaG4wY2pVajhwaDJE?=
 =?utf-8?B?LzloTGlBS1NJSTBIZGFnR1VRNVRRMklBVmc1N3BPUnFFQ2lKL09BdGUyYUVp?=
 =?utf-8?B?U2w5a0VGTDFHUDdqbU1IK0pJL3A3K2QrY3ZqWEVUcFhhMG5jSnZPSVUvRm1o?=
 =?utf-8?B?cGhHb24xV2dLMy9IaXBkSTEyNWtlV0hhWTM5OUFRNnRuTHFKTjJPc2hkY3JM?=
 =?utf-8?B?UFJiSm0rOXc0TFJmTDV6RjJkTDJjNThuNEVac1VrM0U0N1RxQ200V2FTRmtF?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <333064452DFE2143AB2071D2F81BACE5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50992f34-5596-42bf-c73b-08da8a47fb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 05:24:59.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +nBAxmThmJOvtsUZK1jGss1jHMVuwmoWnbpklzEcRYnKRoxpYulT9r91NosQQk6KY5bQ1FVTA6g2Fi2IfqAjO6yZCwFfhds+ervr3+WFVjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3922
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzA4LzIwMjIgw6AgMDc6MTUsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQgQXVnIDI0LCAyMDIyIGF0IDI6MzkgQU0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+IEluIHBwYywgY29tcGlsZXIgYmFzZWQgc2FuaXRpemVyIHdpbGwgZ2VuZXJhdGUg
aW5zdHJ1bWVudCBpbnN0cnVjdGlvbnMNCj4+IGFyb3VuZCBzdGF0ZW1lbnQgV1JJVEVfT05DRShs
b2NhbF9wYWNhLT5pcnFfc29mdF9tYXNrLCBtYXNrKToNCj4+DQoNClsuLi5dDQoNCj4+DQo+PiBJ
ZiB0aGVyZSBpcyBhIGNvbnRleHQgc3dpdGNoIGJlZm9yZSAic3RiICAgICByOSwyMzU0KHIzMSki
LCByMzEgbWF5DQo+PiBub3QgZXF1YWwgdG8gcjEzLCBpbiBzdWNoIGNhc2UsIGlycSBzb2Z0IG1h
c2sgd2lsbCBub3Qgd29yay4NCj4+DQo+PiBUaGUgc2FtZSBwcm9ibGVtIG9jY3VycyBpbiBpcnFf
c29mdF9tYXNrX3JldHVybigpIHdpdGgNCj4+IFJFQURfT05DRShsb2NhbF9wYWNhLT5pcnFfc29m
dF9tYXNrKS4NCj4gDQo+IFdSSVRFX09OQ0UgZG9lc24ndCByZXF1aXJlIGFkZHJlc3MgZ2VuZXJh
dGlvbiB0byBiZSBhdG9taWMgd2l0aCB0aGUNCj4gc3RvcmUgc28gdGhpcyBpcyBhIGJ1ZyB3aXRo
b3V0IHNhbml0aXplciB0b28uIEkgaGF2ZSBzZWVuIGdjYyBwdXQgcjEzDQo+IGludG8gYSBudmdw
ciBiZWZvcmUuDQo+IA0KPiBSRUFEX09OQ0UgbWF5YmUgY291bGQgYmUgYXJndWVkIGlzIHNhZmUg
aW4gdGhpcyBjYXNlIGJlY2F1c2UgZGF0YQ0KPiBjb3VsZCBiZSBzdGFsZSB3aGVuIHlvdSB1c2Ug
aXQgYW55d2F5LCBidXQgcG9pbnRsZXNzIGFuZCByaXNreQ0KPiBpbiBzb21lIGNhc2VzIChpbWFn
aW5lIGNwdSBvZmZsaW5lIC0+IHN0b3JlIHBvaXNvbiB2YWx1ZSB0byBpcnEgc29mdA0KPiBtYXNr
Lg0KPiANCj4+IFRoaXMgcGF0Y2ggcGFydGlhbGx5IHJldmVydHMgY29tbWl0IGVmNWI1NzBkMzcw
MCAoInBvd2VycGMvaXJxOiBEb24ndA0KPj4gb3BlbiBjb2RlIGlycV9zb2Z0X21hc2sgaGVscGVy
cyIpIHdpdGggYSBtb3JlIG1vZGVybiBpbmxpbmUgYXNzZW1ibHkuDQo+Pg0KPj4gUmVwb3J0ZWQt
Ynk6IFpob3V5aSBaaG91IDx6aG91emhvdXlpQGdtYWlsLmNvbT4NCj4+IEZpeGVzOiBlZjViNTcw
ZDM3MDAgKCJwb3dlcnBjL2lycTogRG9uJ3Qgb3BlbiBjb2RlIGlycV9zb2Z0X21hc2sgaGVscGVy
cyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+IHYyOiBVc2UgPW0gY29uc3RyYWludCBmb3Igc3RiIGlu
c3RlYWQgb2YgbSBjb25zdHJhaW50DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2h3X2lycS5oIHwgOSArKysrKystLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2h3X2lycS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h3X2lycS5o
DQo+PiBpbmRleCAyNmVkZTA5YzUyMWQuLjgxNTQyMDk4OGVmMyAxMDA2NDQNCj4+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19pcnEuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2h3X2lycS5oDQo+PiBAQCAtMTEzLDcgKzExMywxMSBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgX19oYXJkX1JJX2VuYWJsZSh2b2lkKQ0KPj4gICANCj4+ICAgc3RhdGljIGlubGluZSBu
b3RyYWNlIHVuc2lnbmVkIGxvbmcgaXJxX3NvZnRfbWFza19yZXR1cm4odm9pZCkNCj4+ICAgew0K
Pj4gLQlyZXR1cm4gUkVBRF9PTkNFKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2spOw0KPj4gKwl1
bnNpZ25lZCBsb25nIGZsYWdzOw0KPj4gKw0KPj4gKwlhc20gdm9sYXRpbGUoImxieiVYMSAlMCwl
MSIgOiAiPXIiIChmbGFncykgOiAibSIgKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2spKTsNCj4+
ICsNCj4+ICsJcmV0dXJuIGZsYWdzOw0KPj4gICB9DQo+PiAgIA0KPj4gICAvKg0KPj4gQEAgLTE0
MCw4ICsxNDQsNyBAQCBzdGF0aWMgaW5saW5lIG5vdHJhY2Ugdm9pZCBpcnFfc29mdF9tYXNrX3Nl
dCh1bnNpZ25lZCBsb25nIG1hc2spDQo+PiAgIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDX0lS
UV9TT0ZUX01BU0tfREVCVUcpKQ0KPj4gICAJCVdBUk5fT04obWFzayAmJiAhKG1hc2sgJiBJUlFT
X0RJU0FCTEVEKSk7DQo+PiAgIA0KPj4gLQlXUklURV9PTkNFKGxvY2FsX3BhY2EtPmlycV9zb2Z0
X21hc2ssIG1hc2spOw0KPj4gLQliYXJyaWVyKCk7DQo+PiArCWFzbSB2b2xhdGlsZSgic3RiJVgw
ICUxLCUwIiA6ICI9bSIgKGxvY2FsX3BhY2EtPmlycV9zb2Z0X21hc2spIDogInIiIChtYXNrKSA6
ICJtZW1vcnkiKTsNCj4gDQo+IFRoaXMgaXMgc3RpbGwgc2xpZ2h0bHkgY29uY2VybmluZyB0byBt
ZS4gSXMgdGhlcmUgYW55IGd1YXJhbnRlZSB0aGF0IHRoZQ0KPiBjb21waWxlciB3b3VsZCBub3Qg
dXNlIGEgZGlmZmVyZW50IHNlcXVlbmNlIGZvciB0aGUgYWRkcmVzcyBoZXJlPw0KPiANCj4gTWF5
YmUgZXhwbGljaXQgcjEzIGlzIHJlcXVpcmVkLg0KPiANCg0KbG9jYWxfcGFjYSBpcyBkZWZpbmVk
IGFzOg0KDQoJcmVnaXN0ZXIgc3RydWN0IHBhY2Ffc3RydWN0ICpsb2NhbF9wYWNhIGFzbSgicjEz
Iik7DQoNCldoeSB3b3VsZCB0aGUgY29tcGlsZXIgdXNlIGFub3RoZXIgcmVnaXN0ZXIgPyBJZiBz
bywgZG8gd2UgYWxzbyBoYXZlIGFuIA0KaXNzdWUgd2l0aCB0aGUgdXNlIG9mIGN1cnJlbnRfc3Rh
Y2tfcG9pbnRlciBpbiBpcnEuYyA/DQoNClNlZ2hlciA/
