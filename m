Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884647CD88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 08:28:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJlKy0FFcz2ymt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 18:28:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJlKP1Yz6z2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 18:27:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJyUzI+L9FWFLwg9RNX42lLWpVs8jUv7wBF4HMAFow5GFp0nE7kr/gz6LU1UznzhGCsGAbZdhBbBhlLG9mrTIS1MD8DbrTSxSga2LxJG211m0RqdOv+LMoc2edzgXfhi+zkARtMbkLv8T9KqxO/0G3sB69O0fr4B9X+unv6RD56mbNPoboH9nR5NtMzeFYCQole9M5CD3CVRgp6L5rXKyJkKXeWxG9NmpX5Z3LhIp9g08E/nnekSHR9NLz6pVz3k688QRZXpW/9q1VgB82DWqIUGOskkArjTq3KXrtecYgm9BYJgaEDT0uJ4OLKRrH/54KdrH6bB0zp9hhUqWurA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk7uvIbrvTwteN4JuFMQHt4ZmoWQ/GD3fn2+jLrL6a8=;
 b=gjUQutWe2uhkFm/ikNxXsGiTg3ZvWObRAWnwBg8+vmbUNOvdsJ8OWgb444tT7PbcyYESncKD7PUoBaIAkwyYpTCziu9JRAEcBWJumfuFmZgTSmdcw3ZrsUB3II0CZq5O6L/qndJ9CBGcorPcec0Pruc5P6k1uTeugRKIqDIpeVAUn51SLjkWsoAOliFAgXYtmqoLve7nXLcNIr8tAedVNzWaiE3XIyYPgN+rlpntfsLpsKpURyJ5HQlLRGj1gh6HZZtfPGhjDFouxc4Nl16f+Qrzq6pfm6zizlFXFsNCSwBtGO4hld6+uGO5et0pMCS84TDS9bMCtPB5htUX/n1nFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2302.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 07:27:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.018; Wed, 22 Dec 2021
 07:27:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Thread-Topic: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
Thread-Index: AQHX9ozJVfpym6S03k+Oh//r03h+haw9SBuAgACLiQCAAEoAgA==
Date: Wed, 22 Dec 2021 07:27:27 +0000
Message-ID: <7ce6caf5-b16d-97de-fcc3-882a9a98437a@csgroup.eu>
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-5-guoren@kernel.org>
 <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
 <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
In-Reply-To: <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cda5e5f1-24f9-4b14-ea36-08d9c51c81d7
x-ms-traffictypediagnostic: MR1P264MB2302:EE_
x-microsoft-antispam-prvs: <MR1P264MB23021FBB96A6E8F0974C95ACED7D9@MR1P264MB2302.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 41F/3ki23B/yp8WlwWEOwQA0m1oT+gz20TdCBAvn/ALdwCIi7M08gzEoFuerONk9C+bfxORC1j7au7XRIgLgOYLXw8vQ3zGUigvZJUe+Tq4wzr/ifUFHUK2A+20XP5XhSyIBdkUy8FmZi59tjQz9R/UcOWdaCvMkTrv+Pux5fAQn26200Qc5oX1rnz5yjdyXhSPYcst4TRzscsDEy3PYGi54H6nwkBtD4V6bt/pEVfjlW7eyztNxT98736O8raNYOLReCnf9ph5JIfwU5FkJ1A0UGK1RMxGlGg09H7RF6GoWlavCVTl4jSZ2DqdnppGJ3bw/av9NahRCpWLYptW11xbp+7Z62cj7nI9m4Cgs3BE/YzO3rs8suR8vwCe/Hy7jOcdxG/r9wY9Kd4yVmpxNzQww7KGPUClwBEEWCA5e18xJU2xyi/bOXWdyP7ShHdOsMQOjpRGBxgKAQzkSJFoeP362H2+0EylxfzMCmfThhrWgtRLICzvilqEWozmxlQ4GmnmE5vHSsCJApgtt/YP4LgXcJ5JqnMQViitXMbqzyAx797MOa45hlOAFB7r+uBW6TUU9brTby8uK1k0Untqu7DNTgEjTl+bBJAThTrdFvKv9hgZFDeHExSQg+wsZ13M8eHra1dvTBYTfh24WzRIgElzME7w5N/W+Y6GcUCiWbWygJwQDc6+s8/IP/zzmb4eoGPlWc6eQQOKOzgjZX9ecFQPY1MthanXk29twVZ0kgcIHbBG2OZA56Z/4PwYWx7rdeVGoXN4L0BKZyVvXwp0ALg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(31696002)(54906003)(26005)(36756003)(66946007)(91956017)(66556008)(66476007)(508600001)(76116006)(6512007)(66446008)(186003)(4326008)(8676002)(64756008)(53546011)(2906002)(6916009)(2616005)(316002)(6506007)(122000001)(38100700002)(31686004)(66574015)(8936002)(38070700005)(86362001)(71200400001)(83380400001)(7416002)(5660300002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1M0NFR3OENRb2pTWnZYSm81Mnd4OU5oOE9tMWFmVXRqcDh4MnJSVklCUE9B?=
 =?utf-8?B?NFp5bGc4WVBPK2FNUit0T1JQbTgzYm9vUkRIc05YZG95aE5rbkxPTHZxK3RH?=
 =?utf-8?B?ckZpZWVkSlppNzBtWjR5ZTJEUGFxaXliUi9aN282Ym5yUkR6WGtQbmhidmFw?=
 =?utf-8?B?VzNaK0dyeW52RVo5bC93WE1pVUxlTDBlVEVBelBtWXdlRE5NSkJMTDhHL0hK?=
 =?utf-8?B?S3NMcXhvS0pCTnRaL2hvdUp4WnVFcWdRRTIxaG5SY0VwdUVIeTUvT0RGK1N3?=
 =?utf-8?B?VDRXcGUwSy93Y0FndVNmUy9rRzROaVl1NWJ4NW11WXV3SkJ6b01sdGc5d2dR?=
 =?utf-8?B?MXJNc3VMVTUwY2JwQnBFRWFqYlJLWk5jc09weHY4NmhkVUR0amtKR292VEtI?=
 =?utf-8?B?NTZ3a1paM2ZtYUxhUkxmZ1pPRGZXMVBqc001YXdjczVIM0ZDc2lvaWoxWDN0?=
 =?utf-8?B?KzRZR3NHbTJVd3E5OUVUeVUraG9WeGxsMlYrS0FOSUxWQjJyM2VaekpsRTF3?=
 =?utf-8?B?UTJqWjhQNS9NNkZjR2kzTHA0eFFuR0ZHYmpqV3Z4Qlp4MnUyWWZwbHg4d0l3?=
 =?utf-8?B?VXJNN251d0lVMDlxcGhHSG9Lbjk3am1ldXNSbFJVZ0t4RXZ3UkNzajRobjkx?=
 =?utf-8?B?S2xuMm93REk1Y3YzSkU5QWVTVTNoSTNFZXJHTVBrcGZUaXFFRHV1RXM0S0dj?=
 =?utf-8?B?NXNmc1FxU20vdEJlOUdQMzQ0dTFmeFZwcCtyNVZ4cHFuSTRuTUw3cS9VYzF6?=
 =?utf-8?B?TnZLTUQwVytuS3RVYlhOdUMrTVZtalUrUzk1Tm1Ba01JR3RTZ2JNSE9QWUNz?=
 =?utf-8?B?NjhrcEZqekY5bHRhOFoySzdhSVJlay9vd2ZTT3NqeFRVblAyeW0vUFFlV2hj?=
 =?utf-8?B?Y1N1ZjNaMUhycFpZQXdzeWlLWUlhOFNPcDZpb2tvVFlwRUtvQWQwUktiNUFB?=
 =?utf-8?B?TytMbE4yKzIwTlY5ZFh3aUs2b1dDbXpVZUlGS1lYK1laZGhoYjh5Zm02b2Fm?=
 =?utf-8?B?bmZzVC8wcWxxYW5KNVdDRVBEc3pvL0JTcXJQWXFSdWxjN1dHQ3NCWEtaR1NW?=
 =?utf-8?B?YUNkalJkQ3lweUhjbEJWek5hTGtXYVRXNGRlY3NaZ3JER05LYzZnQ3FpYjhw?=
 =?utf-8?B?Rkd3SmVpNzVCZU0rQ2VqV0xWKyt6dlVLNVE0M3p1MXFFdlJsY2xYWGxnUGJ3?=
 =?utf-8?B?bjM2Q1ZnTzhONUJ2RmNKaEV6akxqNll1UzBsL1ZqN3JNTlFBMm9DVXF3b0VI?=
 =?utf-8?B?Szk3S2x4UGZFQitEU01DaWYwMG1hc2xrRFdvcG9kckx4T2dHMWVpM0w0c2F6?=
 =?utf-8?B?UDJxSmdJaW1JTU5wN0hPcUhUU1FQd1ozTGZsb3hHeGtRNVpYMDNWNFZDOEtJ?=
 =?utf-8?B?Mzh2NCtvZXN5T3BPWUVXcTl5N2JDUm5PSXFnMnFOQms2ejkrbUhhMTZpNFNF?=
 =?utf-8?B?VWN3MG9CMkpYU3hCU3V4ZVRhdG5TbUgwVWN1eWtZU1kxQjlOOGQrdElJQlpz?=
 =?utf-8?B?amJxcHo2S2JtcnJoTkVzYXZOVVI3N3FYNEREQkg5M28zNXVsdHFiZGMwblRy?=
 =?utf-8?B?eGltQXdnc1Z5NndvaDl3T3VkWGszTGVUK1Nlb0hKaFIvaWZMOEE1andOSElW?=
 =?utf-8?B?N1NvT00rVjZrVStKWkszN2l2aHNaU1pNOHBKUFdCRWQrSmVDbmVlUDNHNzBT?=
 =?utf-8?B?dWdoMHN0NkRXamZFUkJBVDRNN0pNcVN1a3lNbXJWdWVJd3oxV25hS0RaNHB6?=
 =?utf-8?B?S1VoQzYxNG1OWVNjQlVBOVhPaVV0eDhTNEhZZEtLSHpUNEJEMVQ4UmNvY0ho?=
 =?utf-8?B?WHl4MHlBS2ZQOUM1eHNuUk9PMnpPU2Npd0pLeFhhV2NSZ2lEWkJMWXVaTDJF?=
 =?utf-8?B?L2xUUEc2NG9tSURWb29GYXdrL2tyMkc5ZXRxTnVReThPa0RNemJwV3FnM094?=
 =?utf-8?B?am84eVEvU3pkbG1xcmJHTGNiTVhhNzl3b1Zwd0RTazBQWThRVmpiME1xd0Vv?=
 =?utf-8?B?b3czS3hNSjUzcW1BRlZBeFhKZVNSS2Y2dFByb3l5aWNwR2tnTVdrdUVjNExS?=
 =?utf-8?B?R0FWNWhlOUIyTnAxa24rMFZPUjB5WUc5TjdOK091RlROUFJFUTY5bkMzcEFK?=
 =?utf-8?B?NVdRYUF3Ry9ubWIyd3Vxc0F4TGZwMGFRbXdYZkFDNFFwV21HY2pKa3JUTzQy?=
 =?utf-8?B?M3BIMHo0aCtqTStDVi9yQWpXK2RYVlVCTU5sSHV0cUdmVTNLbjNaeGJDMnBI?=
 =?utf-8?Q?AgwKMs5UktMzdnDA+APhOqQl60ssC84NaPs0vc/elI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <150973F15F023D499385FB7CB78E0CB7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cda5e5f1-24f9-4b14-ea36-08d9c51c81d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2021 07:27:27.7323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QkQTw0HHs02b3m1PftzS4ZFJLQrd5GUL9AxDm6IoWsMipLJvID7UXRSVHpRN+0O7NF+HFk55A1bJvNQieMLZv6vB6sOz97izp7JTTByyboI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2302
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
Cc: "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sparclinux@vger.kernel.or" <sparclinux@vger.kernel.or>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzEyLzIwMjEgw6AgMDQ6MDIsIEd1byBSZW4gYSDDqWNyaXTCoDoNCj4gT24gV2Vk
LCBEZWMgMjIsIDIwMjEgYXQgMjo0MyBBTSBDaHJpc3RvcGhlIExlcm95DQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gTGUgMjEvMTIvMjAyMSDD
oCAxODowMCwgZ3VvcmVuQGtlcm5lbC5vcmcgYSDDqWNyaXQgOg0KPj4+IEZyb206IEd1byBSZW4g
PGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4NCj4+Pg0KPj4+IFRoaXMgbWFjcm8gaXNuJ3QgdXNl
ZCBpbiBMaW51eCBzY2hlZCwgbm93LiBEZWxldGUgaW4NCj4+PiBpbmNsdWRlL2xpbnV4L3NjaGVk
LmggYW5kIGFyY2gncyBpbmNsdWRlL2FzbS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4NCj4+PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmggfCA2ICsrLS0tLQ0KPj4+ICAgIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Rhc2tfc2l6ZV82NC5oIGIvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3Rhc2tfc2l6ZV82NC5oDQo+Pj4gaW5kZXggYzk5MzQ4MjIzN2VkLi43
ZTJlY2E0ZmFjNGQgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Rh
c2tfc2l6ZV82NC5oDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Rhc2tfc2l6
ZV82NC5oDQo+Pj4gQEAgLTQ0LDEyICs0NCwxMCBAQA0KPj4+ICAgICAqLw0KPj4+ICAgICNkZWZp
bmUgVEFTS19TSVpFX1VTRVIzMiAoMHgwMDAwMDAwMTAwMDAwMDAwVUwgLSAoMSAqIFBBR0VfU0la
RSkpDQo+Pj4NCj4+PiAtI2RlZmluZSBUQVNLX1NJWkVfT0YodHNrKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+IC0gICAgICh0ZXN0X3Rza190aHJlYWRf
ZmxhZyh0c2ssIFRJRl8zMkJJVCkgPyBUQVNLX1NJWkVfVVNFUjMyIDogICAgICBcDQo+Pj4gKyNk
ZWZpbmUgVEFTS19TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+PiArICAgICAodGVzdF90c2tfdGhyZWFkX2ZsYWcoY3VycmVudCwgVElG
XzMyQklUKSA/IFRBU0tfU0laRV9VU0VSMzIgOiAgXA0KPj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVEFTS19TSVpFX1VTRVI2NCkNCj4+DQo+PiBJIHRo
aW5rIHlvdSBzaG91bGQgdXNlIHRlc3RfdGhyZWFkX2ZsYWcoKSBpbnN0ZWFkLg0KPj4NCj4+IE9y
IGV2ZW4gYmV0dGVyOiB1c2UgaXNfMzJiaXRfdGFzaygpIGFuZCBicmluZyBiYWNrIHRoaXMgbWFj
cm8gYXMgYQ0KPj4gc2luZ2xlIGxpbmUsIHNvbWV0aGluZyBsaWtlOg0KPj4NCj4+ICNkZWZpbmUg
VEFTS19TSVpFIChpc18zMmJpdF90YXNrKCkgPyBUQVNLX1NJWkVfVVNFUjMyIDogVEFTS19TSVpF
X1VTRVI2NCkNCj4gT2theSwgbG9va3MgYmV0dGVyLiBJIHdvdWxkIGZpeCBpdCBpbiB0aGUgbmV4
dCB2ZXJzaW9uLg0KDQpOb3RlIHRoYXQgaXNfMzJiaXRfdGFzaygpIGV4aXN0cyBvbiBwb3dlcnBj
LCBwYXJpc2MgYW5kIHNwYXJjLg0KDQpGb3Igb3RoZXIgb25lcyB5b3UgY2FuIHN0aWxsIHVzZSB0
ZXN0X3RocmVhZF9mbGFnKCkgaW5zdGVhZCBvZiANCnRlc3RfdHNrX3RocmVhZF9mbGFnKGN1cnJl
bnQp
