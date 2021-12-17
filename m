Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 538ED4788EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlcH0Nzjz3drd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlYP1BwDz3cSq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTa5D0z+VKJbV0fqCnhmV5uVHNl1aPBOfL9nAvmhJiC6JECosrveVSKd+OQvxNcjFixB4p7hPTKpWGrJFKhNmuqCd3FncRAOgXS1ILCB/s0zPoPILY//S4LRWcwuh5JCBvrLQu3HJH217Gr6h/rzixpENUWHcMPdd8dgErCJFZCKlaqIP6Xk2RqPTnW5a5DSQptyLQpwBa994wLZC7/Auj3ubl6oiRDInacX54EBZniPij0geLgT4ml2DsPD8yf+jZ8EEZ81ILd+9rRHW3UJ66m64iAwzR5mZFSC9x1ODpsKPQB3BJVIYUkVYIeYLIGpSM2z83tBeR7t0U3wyL0w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMqQpMVPJWiGmTGtq2QUJHhfhL+o8r8GMswJlhxDXUU=;
 b=RPFAEwgr4TGjHk+GiQ9VpWQ2sSRkILP6FM7jeAroCZM915gpJaPXkcDet3HPs9UQhYvXCl/28lVtSJHhBDzq7KsYRtumEBV0pZBKMAl/NS6IQxGNvkq2zFXbBaJrn7QLWMoPGm3unHc1MS/SbC2YoqLcY4KcqDuDpolFeioP/dUdtdB5cEqW0icij8wcE9rwMIHDgJd8KqtX3yPXU1xDXqjgykSeyKWcXTUKezDT70dg9pdgt6mURQrT3YXTMZeBDGWnKV1W6zjht2QUOKUegWCTc/HpwSqcn8TA55EkqtWVZ72B5d/6vdW8BP7DvGeC+hrkV68p2V2a9wmtO6Xogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 05/14] sizes.h: Add SZ_1T macro
Thread-Topic: [PATCH v6 05/14] sizes.h: Add SZ_1T macro
Thread-Index: AQHX8zC07qMBhzOyKkm4HzYDjm34Jg==
Date: Fri, 17 Dec 2021 10:27:33 +0000
Message-ID: <94272ef87ad071d6d11e20bc5249608012714613.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec3499e0-e8bb-4fa7-77b1-08d9c147d697
x-ms-traffictypediagnostic: MR2P264MB0194:EE_
x-microsoft-antispam-prvs: <MR2P264MB0194FD896AEAFD49E617AE3BED789@MR2P264MB0194.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QXqZIp/tz7ghfLES5BumSHj6rEaaKbSVCt/BWJubkEvOPRqSxjg1icGsK9qOrqO4a+dNGtgFzBRkyeLtrOr3fQvYS5zhel4DBhiztb85x8fPIjBqqNzLybIg2YYumtIdUZyU3tpZqXg3qo1fMiFM/+urJ+bhO6EOodFy2zbeU23Gh15V749Ot9/gUcc9TWRcDnJ91Ojz6zw0Ji2VKnkeZH8LvwIkg1H1XH//Mh7MfL1FTwhWgRWtZ+vR6j0bddoFrTd9/l0FH8XAq2eklyK0jMcCg7LpqR57uz00x4lx6jK2as7YluOeq3weJNyTaz8XF8r7Hsu59v400G3STWcNwNmca+VHhqlpxZMd9wjp1bgE0oyaR6Se8ZRLZjkHoq+Cgs4Hlh+4Gng4jbLpOiQRzbOLdHscOAHQuyEYUoRKnY4xwk1wcamjHNq2BEJM/j97V+xBiC60G6DQT9wb8EygXen6j5SaSkxPWF03yqY4F6dTie1z/MghNJf6c/zDn4P3d0sdtGLPLmdrTFy+m/hW7OkR6aFYpSr/fi7dswUCFxFUibNB0FsZawP4zT/RKpNozEP6s0vklQWsfKH0meswkqzIZsgfUo+me1v5gF6SSWDMb46tWJhUHZ1p0ocG+loJxkZSRZdP8j7Trthu/KX1rSRE8nr0HKhrI8vyHehhC/MBasLLSyRBixYWwzAShp30RlVj6qO/8MJSOyCDgIfDMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2906002)(66476007)(66556008)(7416002)(36756003)(316002)(38100700002)(186003)(44832011)(6506007)(66946007)(91956017)(6486002)(26005)(508600001)(4326008)(76116006)(2616005)(8676002)(8936002)(66574015)(66446008)(71200400001)(83380400001)(110136005)(64756008)(38070700005)(6512007)(54906003)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmt4bkdDUzNaSmxDWFlZZzIzSUMyeFNsOXFQQUlLWVE4U3dBNDJpRy8vaWdS?=
 =?utf-8?B?bmF0SVQ5endrZGNyQm5KT0g5VXdlTHRzTitaenhSNCtGU01SNWgwRlpvTVVh?=
 =?utf-8?B?TGt4M2ptQmdJbE1KaDlLYzhEQnZOaHdQY1JucHJuS0hsYk55SFhRY3c0Q2dG?=
 =?utf-8?B?a0s0R0VEeHZQN2hFU2JWOXllTzlPVjh3a1pWS29HL0RxSmpJa2IvRXhlTnBV?=
 =?utf-8?B?Q0RvZ1JrZm9nRm50Y2Jqb2tDYi9RWFlqLy84RVl2UTJGMFNybmNSNmpwaDM1?=
 =?utf-8?B?K2RtM1dmM3NiYTZLL0ljMmpDc09Fak1ad2VBaUJmQndVeks2QXZOeStrcmlE?=
 =?utf-8?B?UTJPbmo4TnZJTkJGZ3QvQ3pXTnQyZ0loQ05iaUV0MVNmT3RKclY4cFRpLzVE?=
 =?utf-8?B?YzNiSUlHZFdVMEY2YmFxbGR5SHM5VnpZTFdnbVNyeHZKY3NGUGJRSjNOOXdV?=
 =?utf-8?B?djVTRDh2TWlhakNtcVBIRjl4ZERqRFNTeFp1bmtYWEpiYjI2LzN3dUhDOVp5?=
 =?utf-8?B?eUJFcmlUeStZWUlHODZ3UmdqQXB5TW55ZDJWQ0JpODVpb3ZVTk93endhOXAw?=
 =?utf-8?B?aW1xTURGeDJEcGxZbHE1dEV3TkhHaU5EcmwwTTBtSkROakZ6WWpoamhoR2l6?=
 =?utf-8?B?S2VTcTQ2ajZaazJ4NGp1akFlclljY284a09SNlA2cDN6Vy9oZnBnaTIrYjVF?=
 =?utf-8?B?Nzc4V0lsYnRUUjE3OVp0MzZQK0NQOEx4RWN4WXBTVnRybFlvQUxFR0NkN1ZM?=
 =?utf-8?B?RkFHa1grcXVtQmdwTGVGaUh6dWNNWW5pWVBFY05QaXNEem9XYWQzV3NQTW1T?=
 =?utf-8?B?T2FNN1Q2SWVPSis4a1orVHZVQitrVDNPNEFxWW1QTk1XUzJCRUY5VHRkMlBR?=
 =?utf-8?B?SGJxbDhIZTVjTzU3ZmRXbWUvMjZWaml0UFhta1N0dFJ3WGNpcUtkdUlWMkU3?=
 =?utf-8?B?UTRHSVR5dlFzWVFGRkxHcDJJdHpSbHB1QmRUdFR0VWUySTdtdXpzeG9icks4?=
 =?utf-8?B?c00rTU83UzRYdFg4eHVleXdVeGtTRitQTldiVlI5ZFVrbWdkQStoSWJWYzZ6?=
 =?utf-8?B?NE5ncGQvaS8xOStwSzlIYzNYek94dEdOaFRmNDZKZDBSZ3o5YzVRWGVHMFUv?=
 =?utf-8?B?M3hSdXJsUjMzZ3FqcUI1ZHNkcHVqRlZKQjRyVldacHVGd0ZpQjdBSUdHaHFK?=
 =?utf-8?B?aU5KMWtSQW9DaHFoUnhqNFdYWkVHYXlONVdCS1c4SjBCZ3Zrek1MaGNTeVIy?=
 =?utf-8?B?Y2hSVk1kQk5qV1dEREVqM2RlZk9xRHA5WEU3YkhiUVNCK0tJUEd1ZWNSdzRJ?=
 =?utf-8?B?QStNUThSeWE3NUlMTk5VV3BYQkl3UWZTZXE0QVJDL3FZSEt0WWhvRmVJSkZD?=
 =?utf-8?B?ZjF2b0d4VUpLR2tkVk5pVU16V1ZjVTZGaW5hMlQ3Z2gxYVZ0eGgvZTljYnFp?=
 =?utf-8?B?M3dGR2QycklRQVAyQ25UYmFaa2pGa052QlVyZTloR0JJdTBybEg2T0ZXZjVU?=
 =?utf-8?B?RUZEN1hvZnJJazBPek5icFdUMVIyTHV5Sks3VFJUa09tUW9mRWdiQkJsdnZy?=
 =?utf-8?B?SkdldFBOK0xvaDV0cysvZjNsdTE5Z3AyQnR0V2hLYnMxNTE0cFVzVWQ5NnBX?=
 =?utf-8?B?L2ZrUmhzaDdJWDFEYkNHNUlrYkZHTW4vaWoxOW5Bdk9MZWJ5R0p1UmtlMDFJ?=
 =?utf-8?B?cWtPdGpMQ21rUnFSWS9XUHMwVUxGdTB1ZWdIQkgwMXM3WnhVL2crNkFObGNF?=
 =?utf-8?B?RDNiTjk3T3ltR0xDcnJqQ3E3NGQxRFAzT1VxZG55eC9oV0dka2kxSGVzcXJy?=
 =?utf-8?B?Z0VOL2UvTkRhWWlvbE1Td093eW8xYTkycEFpUVF2RXpadXRyL2xkVGNWVk5D?=
 =?utf-8?B?SCtKNGRiNmFXZGNNM09tVStuM21rLzU4VnJWTlJSZVUxRFZCY3hwRFlMNkxB?=
 =?utf-8?B?U1JqQ21leVBWVlp4V2V6VE1kWEJEZ2RYalYzTlovZ2o2RDNIMm9hZzc3RHhw?=
 =?utf-8?B?bzFnTk83ZUdvQ2RzU3doZnNpSnFkV0hCSW15VFdFNjdLaGpUL0RaSmtpekxy?=
 =?utf-8?B?OXhuTFhmTUhlbm42bVQrQWUyU29DQmxnek9Xc1hDaG0yeG5EZExtczlpZ2lm?=
 =?utf-8?B?a00yNW9qcTF3dlNoQzZDcjAxSW9Mblp0MTVZeW55b3phOEx3aTJ6K3UxQ3k2?=
 =?utf-8?B?emQrckkxWmxDWjRqS1FBTGxmTlNPSkdiVm96aE9sTi9IQUVjTUx4VW10RWxt?=
 =?utf-8?Q?3gS+5g6cZ9oAr5vJbqeGteKUlFKrfV3nJtyZzIzYOo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB8A183F878AF241AD0749A509E3BB90@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3499e0-e8bb-4fa7-77b1-08d9c147d697
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:33.5944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQsTU+Kvc2ZuvHR/XJoPoyWNv4pI4tpUTaXIJgF8mpcT+eR8EBtXaPuqa7GkjIM5YndhsXpMKCz+o0Tp8qZuapJUn4aHhRR/mh81rdRpLSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0194
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
Cc: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>,
 "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Toan Le <toan@os.amperecomputing.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VG9kYXkgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUuYyBkZWZpbmVzIFNaXzFUDQoN
Ck1vdmUgaXQgaW50byBsaW51eC9zaXplcy5oIHNvIHRoYXQgaXQgY2FuIGJlIHJlLXVzZWQgZWxz
ZXdoZXJlLg0KDQpDYzogVG9hbiBMZSA8dG9hbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KQ2M6
IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NClJldmlld2VkLWJ5OiBLcnp5c3p0b2Yg
V2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4NCkFja2VkLWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVs
Z2Fhc0Bnb29nbGUuY29tPg0KLS0tDQogZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUu
YyB8IDEgLQ0KIGluY2x1ZGUvbGludXgvc2l6ZXMuaCAgICAgICAgICAgICAgfCAyICsrDQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS14Z2VuZS5jDQppbmRleCA1NmQwZDUwMzM4YzguLjcxNmRjYWI1Y2E0NyAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMNCisrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpLXhnZW5lLmMNCkBAIC00OSw3ICs0OSw2IEBADQogI2RlZmlu
ZSBFTl9SRUcJCQkJMHgwMDAwMDAwMQ0KICNkZWZpbmUgT0JfTE9fSU8JCQkweDAwMDAwMDAyDQog
I2RlZmluZSBYR0VORV9QQ0lFX0RFVklDRUlECQkweEUwMDQNCi0jZGVmaW5lIFNaXzFUCQkJCShT
Wl8xRyoxMDI0VUxMKQ0KICNkZWZpbmUgUElQRV9QSFlfUkFURV9SRChzcmMpCQkoKDB4YzAwMCAm
ICh1MzIpKHNyYykpID4+IDB4ZSkNCiANCiAjZGVmaW5lIFhHRU5FX1YxX1BDSV9FWFBfQ0FQCQkw
eDQwDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zaXplcy5oIGIvaW5jbHVkZS9saW51eC9z
aXplcy5oDQppbmRleCAxYWM3OWJjZWUyYmIuLjg0YWE0NDhkOGJiMyAxMDA2NDQNCi0tLSBhL2lu
Y2x1ZGUvbGludXgvc2l6ZXMuaA0KKysrIGIvaW5jbHVkZS9saW51eC9zaXplcy5oDQpAQCAtNDcs
NiArNDcsOCBAQA0KICNkZWZpbmUgU1pfOEcJCQkJX0FDKDB4MjAwMDAwMDAwLCBVTEwpDQogI2Rl
ZmluZSBTWl8xNkcJCQkJX0FDKDB4NDAwMDAwMDAwLCBVTEwpDQogI2RlZmluZSBTWl8zMkcJCQkJ
X0FDKDB4ODAwMDAwMDAwLCBVTEwpDQorDQorI2RlZmluZSBTWl8xVAkJCQlfQUMoMHgxMDAwMDAw
MDAwMCwgVUxMKQ0KICNkZWZpbmUgU1pfNjRUCQkJCV9BQygweDQwMDAwMDAwMDAwMCwgVUxMKQ0K
IA0KICNlbmRpZiAvKiBfX0xJTlVYX1NJWkVTX0hfXyAqLw0KLS0gDQoyLjMzLjENCg==
