Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94F54C0D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 06:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNCHY1w74z3c9g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 14:38:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ioEkd0nH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feab::821; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=ioEkd0nH;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn20821.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::821])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNCGl58bWz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 14:38:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=in5GsPwxiBfe8+69xHKta3kVQH5SS9gAQL423htksFqgGJy52/xlCLaYZmC/vRE+GRH5gS2HOdAhARAPvbdvtYsufXT+8EMPQJt/8RSuxjBaRFTRilNL1P2rL7FbBDjH5O5UNOhuDIFV15/tJlaCwk+0RMhQhd7EflTVTR3f8rKJ5AiWEoPq0iwTe2dJI11hP9sZ7Qx9JFAnPs4luiVK5iwj7PFuHccIyCDa6NASDDJ6IlbgCmJPoX36SJOobVg8uhAhqfG2f+aji230tqpaQrLl7jzksSQDltGUa56kBH6zwWtF3QwsV2OFZc0+7JpftGnfZXH4r2yEIe9/Od9hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE6PuGEnY/Km1F5coy5BJCbr3V3bMoXrnriJjalRQbo=;
 b=GXe4StHQIckld8pKLDmu3XUtEWxGH9S37TgLuTM/DoJf4P5+47YrXnboRCyq8B2Jc1+uEZlzw7xhOYRZH0ik06mFSYvfJvf4Jd2ZLvFOkOdhLZwTTfs8bj60L39I6aggeTR0XvEyS2ZuYATeS6xyDg4ZAbF+LLGAyuajzTUeZJpkp+ChI0wmwoXl5ni+OF5XXl08Mv47L+AxmH23LXXuZktFgyWBrYHvzyjWqLTQRGDsSsz82AbLGDUq1IsrZQcpwm98hiz4MJoxsX7HfQGSfhhxqSS1T30inUB9HuOERC3LQlHDUmz1C4C9zYmnBagBtunJtxamO567hUE/RZIUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE6PuGEnY/Km1F5coy5BJCbr3V3bMoXrnriJjalRQbo=;
 b=ioEkd0nHYAU8N1Zi4IlxP/i9q6BGr5CcvxMYYzsLx4rxcp1MXV6rzGqADMnV9l8vqqQLi0C9pIUrHzVZo4/RMION0FFb6Cqa9CeDEL5EU3OaojWKPtDAMEngHPxWI+nAIZVIFFRCIMJ35VLSB7lG0Ewl74rRDiwqPsoXPaNmvH+ULsLjbFsrVdNBXR6jp5J4TbDs1x0oZwlxS1N4fvBoPd28MxVRJsGR/3k/XUbKQlyVPrenU80D71UzESyA/lfXaDZzlIlOnisust/syLqwQzHnAFIj7DLbSRu6RGBhHKzXkaNGOyfjO6j5yS7MzbzYc3EHu5GxTCgyhCIUYTbacA==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by HK0PR01MB2468.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.21; Wed, 15 Jun
 2022 04:37:40 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 04:37:39 +0000
From: Wenhu Wang <wenhu.wang@hotmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>
Subject:  =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMS8yXSBwb3dlcnBjOm1tOiBleHBvcnQgc3ltYm9s?=
 =?utf-8?Q?_ioremap=5Fcoherent?=
Thread-Topic: [PATCH 1/2] powerpc:mm: export symbol ioremap_coherent
Thread-Index: AQHYe+vtQWCn89Rsl0KhPJBUgnnCnK1Ov92AgAEqSWI=
Date: Wed, 15 Jun 2022 04:37:39 +0000
Message-ID:  <SG2PR01MB295141BF75DF5939CF9ACFA09FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB2951EBFD4C4EB2A2519FF4199FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <8735g7cym2.fsf@mpe.ellerman.id.au>
In-Reply-To: <8735g7cym2.fsf@mpe.ellerman.id.au>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [kaZ0MUbuvQAPZe+CK3RkelPPfC8pcFui]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28bdb4fc-80f8-4e94-1a5d-08da4e88c78b
x-ms-traffictypediagnostic: HK0PR01MB2468:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m9O7wIlhhmzSTsM6+pf/P2N7q9h7syBs2wptN7RI+J24Cm92wzlXNLvUjllQ7RtmNF2Vwg5UHd5IpRppkSo4Poa1cCsXfDbdBsRkICOKEB0vQs/1RxXTkIH2paQkH9XhrF7e17aoCPb84OeKVKJ3W5fayfl65a+3Qb4abmyfOea36i0HvAz7nMRMxqTexhSy1YdGIovDbbTaQASHJlRLy4YxoXUhGXRkHVVdDe0ud+h5CU+LN94Pf0tgjA6dSCYlH2AkHBAZsX4ElPfw5dniAzuHnJkXXfeVMoQOHpZzt8wVyBg2Y0pkZck3972PiGeo2dhHOOEn76RYYUBviKi1geXIcM7d1Bn07IVq3MiUx7bKcrwIKgrbMX9Q+KTunbxXadYWxGZvGw3TrkqI70rs6YAT85TbVDzFn+AsZAE2M6MJoNoF0Ka/Nnjchb9SRSocBiASU6AExFiNNX0MmoDyae3pKMJ/uUKlW/licGlRdJJ5JSMJEgdTEzhKvoTkzRmloHM1N43hE+mI8nFjtke+1l9ZOZmPGosBSOwFaceiYRWxDTcexAZ58mzqIw0wRvpFSFAhidDx59e/KULcnVwZuA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dzZzRkIwMXpwOEdEOXE2c0hPaEU3VnQ3ZkJMUFNScjNsNVpKQUltOVYrVFdi?=
 =?utf-8?B?cFkvbktyaTloZEROUjJWd21Jd0QzMHhQeE5iZks3bUd2ZDdoUUZFL1llK3FP?=
 =?utf-8?B?OW9NR3YwbWE2Z2FxWkxVQ3dVLzljWTV2Vi9kVGN6VC9pUExpNkRoRkUrTG14?=
 =?utf-8?B?aTRObk93eW9QNTJKV0ZaOEFCRnZlWm5FZTZ5dFNFZlI3T1AzN0EwTGZRZnMz?=
 =?utf-8?B?SFl6OGpLd3ZWT2VLREpYRUxYYlRtd3dlQ0NKYnZMMnd5NEZ1YTZpc1piWUxo?=
 =?utf-8?B?cmNvb0J3SlBMZVplMUJ3QUhEckk1bHEvcHZKSExJZlN0QU9ieEpjd2cyMktC?=
 =?utf-8?B?RWJvODdWTnAzMTRTTFByYy9URTBtbHRiNE03RUc1S2Q1dUNWZ0ZSS21leUVm?=
 =?utf-8?B?WXF4VE03c3IvVEphZE0yVi9WL2RDYkQ4V3RxWStwRXBFeWZwdU1BQnFtTzY1?=
 =?utf-8?B?TWZaTEFHM001ZDJHUVBxUkgzWFhIRzl4aW0zNTVhTzhmTFNmclZBNmZwbDNR?=
 =?utf-8?B?REZBWGgxM1RqWDNUN3BwakM1YW1qN1FFM2cxMVRIZW1hWG53ZEswdGlEaGp0?=
 =?utf-8?B?VVJpY3I5a2xHQWFQeTJxUmwyUlB4WFNZNU94Q2JjekNTQ00zakpzTUQzOWUz?=
 =?utf-8?B?TVhEcGswaW5ROTRMODBMMkl2M3hpSU5Qd25KRXUrTkFzZHIrSHdpL3hBY0Rh?=
 =?utf-8?B?QmNsUEcxMWM2SEloc1VKWURDK050aVVjRFJlU3pPM0tVZ1VmTFROUW5vNGNF?=
 =?utf-8?B?UTdKRjduQkVIcU0xeExYejJ5NSszMmhqWi9pbS9SMlNDWVJ2SFNYMnI3UEpi?=
 =?utf-8?B?M1VESTErb3o3VndURnlqdnRYemJtakxVbEdRN1VoN0N1VFRCcmw4Uk1ndzNa?=
 =?utf-8?B?VnNZMmZaRnlMZUJreHhQRXdkamVBSVN4cnMrOEJvUVc5eHhzWW1nbGlKb0dU?=
 =?utf-8?B?d0UwVCtKakZBZXJBSGtINGZBM0VUMnpjbWRtQXNoaXJzc3pOYzRnK0g2Tktp?=
 =?utf-8?B?UHlkc0YxdWpYOXBuUE1NcHRoSnJiVVNNWHZhYXFCdlZXSGNwSUZ5R2JwMHR5?=
 =?utf-8?B?UkFsdU5HVGdIZW5GbUVuSHU5R0s4aDlpREpPbFhqT1JpN3JFNStqTmNWVDRV?=
 =?utf-8?B?cDdkQVBGTis1ekMra0xMSVVmMUpka2YwQk1UVjdCQnZTWEZ1K1ZDTkRvRTVk?=
 =?utf-8?B?QWlDNXF0S1gxRXJrWUxLQzcySkhhZjdrMVhiMTVZUVE2VkM1UnV5NUhxUGts?=
 =?utf-8?B?dloxbFlsSTEycVBRcytDMytSZVFyLzJXZmlxRFZHRUNEVjJLOFVzaUhCcFlp?=
 =?utf-8?B?dm5lY0hhaEovNXp2SllVZkQ1eGNvS3hYZ1NmOXVIVEdkd2dUZlpHdFBoV042?=
 =?utf-8?B?OEdENWdTdmdmWjRqTmdxcm51UGdIbjkrODlyN0hLRVpScEY2aTJhSERwWmFN?=
 =?utf-8?B?NW1PR1A0UEJ6ZnNKaGd2U1BwQzVYcjVhdkFNcjhmeGdEUVZKRXI3WnhQa1VR?=
 =?utf-8?B?L3N4OW9JTmNLc0U3bHdSc3U3WmI5T1Q1VVh4R3U2WXdxM2pOYzBWRnZZazNL?=
 =?utf-8?B?R3JETmI4QytYbkp5bmNhNFROdklaK3RNSXB0ZlExdmZjN1haaDlVbzJ2V05h?=
 =?utf-8?B?alJYd2h0MU54bWFQbS9WMUZlRkIxbHV6UTVNSXpRNWEyVkpuLzZnVU1SV3VY?=
 =?utf-8?B?c0JzR3NKUnY5OTBYQk1GNG9BQngzbmtDTThxaUJGOEZQSVowMHluUjZKUWFB?=
 =?utf-8?B?eHR1YmlBNXhkQjJwdDYzVFAwejVqNHIxWTlwRE1vcDBYMStaRTdGWHJ6QlJ3?=
 =?utf-8?B?K3I0WVZsRmVwdHNNdDhrK2lGTnZENWJjMXp3RGFBdCtneXl4bkpwcUVmUnVo?=
 =?utf-8?B?ckhrZExoM05TUFQ2bWl6WkR4Z3VhSzF3U3Z5NmFFWG9ObGhSckYvZ0MyQ1BF?=
 =?utf-8?Q?r81OmP+q8Ms=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bdb4fc-80f8-4e94-1a5d-08da4e88c78b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 04:37:39.6335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR01MB2468
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

PuWPkeS7tuS6ujogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+5Y+R6YCB
5pe26Ze0OiAyMDIy5bm0NuaciDE05pelIDE4OjQ1Cj7mlLbku7bkuro6IFdhbmcgV2VuaHUgPHdl
bmh1LndhbmdAaG90bWFpbC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUgPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4KPuaKhOmAgTogbGludXhwcGMtZGV2QGxpc3RzLm96bGFi
cy5vcmcgPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPjsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IFdhbmcgV2VuaHUgPHdl
bmh1LndhbmdAaG90bWFpbC5jb20+Cj7kuLvpopg6IFJlOiBbUEFUQ0ggMS8yXSBwb3dlcnBjOm1t
OiBleHBvcnQgc3ltYm9sIGlvcmVtYXBfY29oZXJlbnQgCj7CoAo+V2FuZyBXZW5odSA8d2VuaHUu
d2FuZ0Bob3RtYWlsLmNvbT4gd3JpdGVzOgo+PiBUaGUgZnVuY3Rpb24gaW9yZW1hcF9jb2hlcmVu
dCBtYXkgYmUgY2FsbGVkIGJ5IG1vZHVsZXMgc3VjaCBhcwo+PiBmc2xfODV4eF9jYWNoZV9zcmFt
LiBTbyBleHBvcnQgaXQgZm9yIGFjY2VzcyBpbiBvdGhlciBtb2R1bGVzLgo+Cj5pb3JlbWFwX2Nv
aGVyZW50KCkgaXMgcG93ZXJwYyBzcGVjaWZpYywgYW5kIG9ubHkgaGFzIG9uZSBvdGhlciBjYWxs
ZXIsCj5JJ2QgbGlrZSB0byByZW1vdmUgaXQuCj4KPkRvZXMgaW9yZW1hcF9jYWNoZSgpIHdvcmsg
Zm9yIHlvdT8KPgoKWWVzLCBpdCB3b3Jrcy4gSSB3aWxsIHVwZGF0ZSBpbiB2MiB0byB1c2UgaW9y
ZW1hcF9jYWNoZS4KSSB0ZXN0ZWQgYW5kIGNvbXBhcmVkIHRoZSBvdXRjb21lcyBvZiBpb3JlbWFw
X2NhY2hlIGFuZCBpb3JlbWFwX2NvaGVyZW50LAphbmQgZm91bmQgdGhleSBlbmRlZCBzYW1lIHZh
bHVlcy4KClRoYW5rcywKV2VuaHUKCj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9p
b3JlbWFwLmMgYi9hcmNoL3Bvd2VycGMvbW0vaW9yZW1hcC5jCj4+IGluZGV4IDRmMTI1MDRmYjQw
NS4uMDhhMDBkYWNlZjBiIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vaW9yZW1hcC5j
Cj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9pb3JlbWFwLmMKPj4gQEAgLTQwLDYgKzQwLDcgQEAg
dm9pZCBfX2lvbWVtICppb3JlbWFwX2NvaGVyZW50KHBoeXNfYWRkcl90IGFkZHIsIHVuc2lnbmVk
IGxvbmcgc2l6ZSkKPj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGlvd2Ff
aW9yZW1hcChhZGRyLCBzaXplLCBwcm90LCBjYWxsZXIpOwo+PsKgwqDCoMKgwqDCoMKgIHJldHVy
biBfX2lvcmVtYXBfY2FsbGVyKGFkZHIsIHNpemUsIHByb3QsIGNhbGxlcik7Cj4+wqAgfQo+PiAr
RVhQT1JUX1NZTUJPTChpb3JlbWFwX2NvaGVyZW50KTsKPj7CoCAKPj7CoCB2b2lkIF9faW9tZW0g
KmlvcmVtYXBfcHJvdChwaHlzX2FkZHJfdCBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2ln
bmVkIGxvbmcgZmxhZ3MpCj7CoCB7Cj4gLS0gCj4gMi4yNS4x
