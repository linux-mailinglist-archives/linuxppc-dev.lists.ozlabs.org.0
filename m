Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CB47F868
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 18:37:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMSgF0kLdz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 04:37:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMSfk5Ch0z2xD4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 04:37:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHXLtFDGm8oHw6KhzNvGZj6Znx1Y9Vf1KNUWQ5zwJHeCNOBy436EFYHL9tuLC/SEgdJ3AaRownl7QDwZyyhoPBA2Rog3XOMUttzL5voBVSFsdy++S/EC1h6qXYQM/lzpPkzJ6DieXubEvD8LVlA+SzACOS5sjM2Wnijjt7LorrozYoib1O3PLymDFb1KrCfMHhsS95MPWsGxlzAWeCIispEmX1YaSKmRl5diXbScuE+U68j+VGUryT0yZik5AH7v4eTqiMy3hCFg6KGvvSi1/h0vF0tnGYvNMON1pPFyk0PsbM/dJtF3WgIrfmnZvcDwO3qmJAcdWJwfQ3ip6I+aTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI2REbDuBG8jO4lVLL1V0gBrxenblaZyg1pRYPb5s+c=;
 b=IlGz/8iy1i2BD+JpGruBkxF24pu0nzcqyyW7+NLYZQ2IdVVhRL+XDt551rtdbPr/Sp1H8L7Qn86uYDXU7GEb0OxiJ57KA6YDYeSxq8IxR1BG21YMIFARG4kRnUJNEz4UHGmCx/bwBMYs5IIMOzVsix8XwR1k3Y1U9MKCI2vxW0GceAPTBoXOXGonYCBoJseWOfHjNdqfxK2cULBC94O6dGB8b2KrY5IwWMADvREAT2hvPlULMiWAm2ZoeSUhi2D8ArUP9u34/nKKGD9xVqbC389+CtBjcdNVqNy0FP05/+itqY8hk77qJ+0Ysg4klWNB0vUMviXL1qm1LOkKqRsx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.19; Sun, 26 Dec 2021 17:36:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 17:36:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] mm: vmalloc: Let user to control huge vmalloc default
 behavior
Thread-Topic: [PATCH 1/3] mm: vmalloc: Let user to control huge vmalloc
 default behavior
Thread-Index: AQHX+jLwrp8KH+lFZU682OcqJ3skPaxFCfiA
Date: Sun, 26 Dec 2021 17:36:59 +0000
Message-ID: <6c4bd989-268e-5899-09a7-ac573bd8b4d9@csgroup.eu>
References: <20211226083912.166512-1-wangkefeng.wang@huawei.com>
 <20211226083912.166512-2-wangkefeng.wang@huawei.com>
In-Reply-To: <20211226083912.166512-2-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 700c2a74-fe36-4d6e-dc86-08d9c89651cd
x-ms-traffictypediagnostic: MRZP264MB2103:EE_
x-microsoft-antispam-prvs: <MRZP264MB2103B86F259868FD2E586839ED419@MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u4N4nljK0q4y72AiGjAYi8AsDG+lISVAkKhqOnV2JtVBO29lW4frJPf8XCaqRxfx88H1YTM43cNodN/rSx4ZsQvSbx58icrG6fN3ya7o+c6eV8kLAI/UgoaB97N/3ShEaERml0UG7wZdx3EB9xUlya3X+yWojDSMy7LrcCnIyNx9jGtVzb2zwGedfhmdZk0xgGYznRkR6A8eVnXy3k60JnmVl8IcHY3BLuHCV+n/PDx1zuiGHnns5SXtsmAc5isXx8BJ0hiV4f7AGzVjVY5jQ1FCC+OM+3D+AhGxVBxUxVdtKcgHTC8g6SlBZQZtmc939FUhLlSF+Ce0pQQFYhoy+bx3QiQHvja3cC9ZWtcK+Ls8gy/6UjJgOmNnfwzwNSwQtheDSYYX3bYQohVlN1YhD1hYvLFzKSmri4udg8caWmDTxMiek7lMs4+rsQCrEJbpPJpobLva/n1A5e1Mx0iWudd65P/EZHhDpsoyhpPOz7j92Q75vpttLJKt2gDAvK8k/n2VIVrGP1DcG+GCwDR462JcUpi/b+IHegmSjbXDHj1GanRdbXS/NzXlxgR+L35vel80QtGIP0ooJcK1PICZELjVktlBqNufNpgKRXuxMzzA+MncqbxNDdD6zy6519XIIiL38fsKL++bYw678KDkrBIGJmFouK/1xlHOXgEI7eGFYq9oRvYwFpQF3z95rYHKReyanyitY4tqfW+VJPNXeKqc9528vVfX2LJbzZucgCoULVsSNkKKvNCGGK12xaXICbDIe6XtfVIkRs8WdDhmjBY7HYUKHcd8Fk/cN5jEZKE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(508600001)(8936002)(36756003)(38070700005)(6506007)(38100700002)(122000001)(8676002)(5660300002)(7416002)(44832011)(26005)(186003)(2616005)(86362001)(66574015)(66556008)(54906003)(6512007)(2906002)(110136005)(316002)(83380400001)(71200400001)(66946007)(91956017)(66446008)(66476007)(6486002)(76116006)(64756008)(31686004)(4326008)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGRJa0Q4aW5rZmdHdmgvdVJsK3hXeWRMMDg2aVUvSzhqUUM1NmZobjYvOUp4?=
 =?utf-8?B?K1crZVdxRnVLWFpZMElhc2ZOWjJ5UFR2TllsNHJxYTZ3TW9QcjBiSkhVMndI?=
 =?utf-8?B?NTU2S1NuRVZDZ0JYTGhnYm9mNDRTMElXa21oRHlwd0wrN3pHZDYwMElNcDZ3?=
 =?utf-8?B?aWVyUEpQOUlIOWdwNHdGMHM3QzJINnRPVkgzb3hQb1Zyai93YnBzMzZIQWZG?=
 =?utf-8?B?bHVVcVZTRFRrR1pib1JyT05QUFZreUhZRU1ITE9SQ1ZYRitwYjZpYkU4TU0y?=
 =?utf-8?B?VTNaaDRkWC95cmd2L2RiSmQ2WVFHcmZkYU9MQ0FSOE9vaUJPYnRveHQwUTJO?=
 =?utf-8?B?WXYvdG8yTWp2KzdsTXNqWGU1dHV3QmhXWmVKOXFBUDl5NFVNVVNGN1h1UnZj?=
 =?utf-8?B?MGxwaW5uaU9nVXR1Ump5Q0Voc0xrZ1NRb2xUVENDSEQ3aFV6c1E2ZUQ1cndz?=
 =?utf-8?B?SzJrYmw3TmdidmNvZmgybGdGNEtPY3VnOTRjVm9rejFjOFVFZklMUGZQYStR?=
 =?utf-8?B?M3VyZDJKQldiY3hWTC9QZldpeXRpWTBIR2xUNUh0RlNvZjhtVEJheWhvTnBy?=
 =?utf-8?B?eDZCeU1CVllLUWZNSlRjUEVEdndPcnFkc243bzNYVXp4SUlTYzRTRk1sZjRh?=
 =?utf-8?B?cEFFbjFOY1dqSVUyMGNncWNQRGlxYUwxRmZ4OCtGNkdMLytSREhnUml4L0c5?=
 =?utf-8?B?S1Z4c0dqMEx6bWVuOFFkSVNaNmpxaWVGMnFtK1cwTVdIbUQxR1gva0UzYVZ5?=
 =?utf-8?B?MkU5WFg2d2xibWQ4MFBWeG1lbThWOWFUZlBydy9UZlozclM1SDF4QjBHYUZ6?=
 =?utf-8?B?c0cvUUpYbXdWVUU1dGdHRmJmWUhoRE9nUWJSeGpIc0ZyVWFVNU0xN3MwZURX?=
 =?utf-8?B?V3JVbUxpUXRQeE41Y1RsaHJkQmh1NkR6Tng0ZEhZVzkvSUovTzlOZEFFRG0x?=
 =?utf-8?B?M0Y1czE5bmwxRlBYZXNtYzU0WTU0bzJHNW4xZEhDRFNxVjdFazcvTkZrRnhS?=
 =?utf-8?B?Q2l3T1VaNjQvbnFwQ0xvRlFxWVJ6V2ZhSUhGb2VNL0VIWDRjTjRYWWRqUTJT?=
 =?utf-8?B?aGM4czJnYzljbERROElsWXhIQ0VhT3BtZ1N2a045cFJZQ2JiZUlDRHdnT2pS?=
 =?utf-8?B?dkc4UTdjeGU1MTdoTHFyMTFtQnd6eHJDc3JOSFB5MjgzZkFkZWE2UmFpZzVx?=
 =?utf-8?B?RjZOTCtteVk1RmtLMG5qMkpCUUtzQUltT3kyY2liWUJKZURxWHFhZHRUWHVh?=
 =?utf-8?B?RVJjYnNKT2xnL05uQzBhcmoxYjdzM3JuOEkzWTVSaWE0Y1ZTY0tqUCt3NHlT?=
 =?utf-8?B?WEgwZTZmQkxwNUNyUk8xVlFRdHQySHY1ZTZVSkw5SEhZaUhiSDBudzNJOWJz?=
 =?utf-8?B?RTIvSFRiTS82Rnd4UmpwYVhma2o5Nmdsd3hWS2pTR0d0WHdNSkR4YTNPbnhS?=
 =?utf-8?B?bHVqUWM0ZnFyUm1td1I1YlVPWW1HVnF5R3JiRkRpWTJRNVU3K2NORWtrYUFI?=
 =?utf-8?B?ZjhieWRQZ0h6MkdPOUhNRlBZWHVnOWJXaFV0ck9ITTN0NUE3QUZOR1JTZmU3?=
 =?utf-8?B?b3M5SjVVZ3VFakw2YmZtUUpKcVhQamNKcllHNkJQQmpRcmZlL3c4SXp6NUZp?=
 =?utf-8?B?SnpiWlF3aVRvY2l1ZTM2bDl0aW41N3M3aVNwVlJQVGZMcnVOaWRjT3BVczI1?=
 =?utf-8?B?RC9wcmpaRTQyZWk1R1l4cHViODBqRzN6Q3BXTGdTdzlQaTgzV2FzWlRzUUxI?=
 =?utf-8?B?WEtpdzZjRWJxbU0vUlNEaWh5VFRIeGxXT1ptUjBsRUtQeG5zbUYxQk5pK2k0?=
 =?utf-8?B?c0hHWjZoeEpFNU1uc3pzOXp3R0FsZmVFMnBaRGgrcWt1eWpONU1BYkpvUWc3?=
 =?utf-8?B?TnR5UFYwTm94QXZZNFppek1sRlZ0ZnJVMDJuWVVZNkxmOVkrbjZwZ2NRQVVM?=
 =?utf-8?B?MnlRL3Q4eEtnbDJGQkZSR3VqUkRUK2lqUjZVamMwd1JxdjZJVnZ2cVhNUGtl?=
 =?utf-8?B?eEVMRjVoaEtoN1VyZUVCQ1ltcFVmcU9MUEVlTmxSaS9lWm9aVEhxSnZUVXJl?=
 =?utf-8?B?SFd3c2pacHE3NzJvY1hsUVk1RG9ObmRrcVVMYm9qQ1Q3T0c1b3BFbnhGUmRL?=
 =?utf-8?B?cnltNDdZTUsxRGsyM2o5cFZveWhGLzE0YXRmMUxQNHdGSzlFSU55NHNJKzVH?=
 =?utf-8?B?NVJ3K1Z5NnpiZkx5MldFSmpvQTBlVlE1SEZzWG41amdsakU2bDh2ei9SM01Y?=
 =?utf-8?Q?EmLbo0wcSLrpKHA4LcvK4hSaSzKExDGU1KCxj3eRUg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E594DBDB4C8EE049844FF9716FF04C93@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 700c2a74-fe36-4d6e-dc86-08d9c89651cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 17:36:59.1792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJXb7V5fRlaZF5p5738vMwf1KnA6JXnwwZrnrrpBdC1ujVlOT1yzDr2Q0gBFcJLuQctxK67zt0RfdtNThKQP3u+NLd3mwxTx7vZ5fsz7aBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2103
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzEyLzIwMjEgw6AgMDk6MzksIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IEFk
ZCBIVUdFX1ZNQUxMT0NfREVGQVVMVF9FTkFCTEVEIHRvIGxldCB1c2VyIHRvIGNob29zZSB3aGV0
aGVyIG9yDQo+IG5vdCBlbmFibGUgaHVnZSB2bWFsbG9jIG1hcHBpbmdzIGJ5IGRlZmF1bHQsIGFu
ZCB0aGlzIGNvdWxkIG1ha2UNCj4gbW9yZSBhcmNoaXRlY3R1cmVzIHRvIGVuYWJsZSBodWdlIHZt
YWxsb2MgbWFwcGluZ3MgZmVhdHVyZSBidXQNCj4gZG9uJ3Qgd2FudCB0byBlbmFibGUgaXQgYnkg
ZGVmYXVsdC4NCj4gDQo+IEFkZCBodWdldm1hbGxvYz1vbi9vZmYgcGFyYW1ldGVyIHRvIGVuYWJs
ZSBvciBkaXNhYmxlIHRoaXMgZmVhdHVyZQ0KPiBhdCBib290IHRpbWUsIG5vaHVnZXZtYWxsb2Mg
aXMgc3RpbGwgc3VwcG9ydGVkIGFuZCBlcXVpdmFsZW50IHRvDQo+IGh1Z2V2bWFsbG9jPW9mZi4N
Cg0KDQpJcyB0aGVyZSBhIHJlYWwgYWRkZWQgdmFsdWUgdG8gaGF2ZSB0aGUgdXNlciBiZSBhYmxl
IHRvIHNlbGVjdCB0aGF0ID8NCg0KSWYgdGhlIGFyY2hpdGVjdHVyZSBzdXBwb3J0cyBpdCwgaXMg
dGhlcmUgYW55IGdvb2QgcmVhc29uIHRvIG5vdCB1c2UgaXQgPw0KDQpXaHkgbm90IGp1c3QgZG8g
bGlrZSBQUEMgYW5kIGVuYWJsZSBpdCBieSBkZWZhdWx0ID8gV2h5IHNob3VsZCBpdCBiZSANCmVu
YWJsZWQgYnkgZGVmYXVsdCBvbiBQUEMgYnV0IGRpc2FibGVkIGJ5IGRlZmF1bHQgb24gQVJNNjQg
YW5kIFg4NiA/DQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZl
bmcud2FuZ0BodWF3ZWkuY29tPg0KPiAtLS0NCj4gICAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMudHh0ICAgICAgICAgIHwgMTIgKysrKysrKysrKysrDQo+ICAgYXJjaC9wb3dlcnBj
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBtbS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKw0KPiAgIG1t
L3ZtYWxsb2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKysrKysrKy0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBh
cmFtZXRlcnMudHh0DQo+IGluZGV4IDJmYmE4MjQzMWVmYi4uNDEwNzEzNjA5N2E2IDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0K
PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0K
PiBAQCAtMTYyOSw2ICsxNjI5LDE4IEBADQo+ICAgCQkJSWYgYm90aCBwYXJhbWV0ZXJzIGFyZSBl
bmFibGVkLCBodWdldGxiX2ZyZWVfdm1lbW1hcCB0YWtlcw0KPiAgIAkJCXByZWNlZGVuY2Ugb3Zl
ciBtZW1vcnlfaG90cGx1Zy5tZW1tYXBfb25fbWVtb3J5Lg0KPiAgIA0KPiArDQo+ICsJaHVnZXZt
YWxsb2M9CVtQUENdIFJlZ3VpcmVzIENPTkZJR19IQVZFX0FSQ0hfSFVHRV9WTUFMTE9DDQo+ICsJ
CQlGb3JtYXQ6IHsgb24gfCBvZmYgfQ0KPiArCQkJRGVmYXVsdCBzZXQgYnkgQ09ORklHX0hVR0Vf
Vk1BTExPQ19ERUZBVUxUX0VOQUJMRUQuDQo+ICsNCj4gKwkJCVRoaXMgcGFyYW1ldGVyIGVuYWJs
ZXMvZGlzYWJsZXMga2VybmVsIGh1Z2Ugdm1hbGxvYw0KPiArCQkJbWFwcGluZ3MgYXQgYm9vdCB0
aW1lLg0KPiArDQo+ICsJCQlvbjogIEVuYWJsZSB0aGUgZmVhdHVyZQ0KPiArCQkJb2ZmOiBEaXNh
YmxlIHRoZSBmZWF0dXJlDQo+ICsJCQkgICAgIEVxdWl2YWxlbnQgdG86IG5vaHVnZXZtYWxsb2MN
Cj4gKw0KPiAgIAlodW5nX3Rhc2tfcGFuaWM9DQo+ICAgCQkJW0tOTF0gU2hvdWxkIHRoZSBodW5n
IHRhc2sgZGV0ZWN0b3IgZ2VuZXJhdGUgcGFuaWNzLg0KPiAgIAkJCUZvcm1hdDogMCB8IDENCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcN
Cj4gaW5kZXggZGVhNzRkNzcxN2MwLi5kNTliMjIxYmUyNjQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IEBAIC0yNDYs
NiArMjQ2LDcgQEAgY29uZmlnIFBQQw0KPiAgIAlzZWxlY3QgSEFWRV9TVEFUSUNfQ0FMTAkJCWlm
IFBQQzMyDQo+ICAgCXNlbGVjdCBIQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFMNCj4gICAJc2VsZWN0
IEhBVkVfVklSVF9DUFVfQUNDT1VOVElORw0KPiArCXNlbGVjdCBIVUdFX1ZNQUxMT0NfREVGQVVM
VF9FTkFCTEVECWlmIEhBVkVfQVJDSF9IVUdFX1ZNQUxMT0MNCj4gICAJc2VsZWN0IEhVR0VUTEJf
UEFHRV9TSVpFX1ZBUklBQkxFCWlmIFBQQ19CT09LM1NfNjQgJiYgSFVHRVRMQl9QQUdFDQo+ICAg
CXNlbGVjdCBJT01NVV9IRUxQRVIJCQlpZiBQUEM2NA0KPiAgIAlzZWxlY3QgSVJRX0RPTUFJTg0K
PiBkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcNCj4gaW5kZXggMzU2ZjRmMmM3
NzllLi40YmE5MWMwMzU5YmQgMTAwNjQ0DQo+IC0tLSBhL21tL0tjb25maWcNCj4gKysrIGIvbW0v
S2NvbmZpZw0KPiBAQCAtMjYyLDYgKzI2MiwxMyBAQCBjb25maWcgSFVHRVRMQl9QQUdFX1NJWkVf
VkFSSUFCTEUNCj4gICAJICBIVUdFVExCX1BBR0VfT1JERVIgd2hlbiB0aGVyZSBhcmUgbXVsdGlw
bGUgSHVnZVRMQiBwYWdlIHNpemVzIGF2YWlsYWJsZQ0KPiAgIAkgIG9uIGEgcGxhdGZvcm0uDQo+
ICAgDQo+ICtjb25maWcgSFVHRV9WTUFMTE9DX0RFRkFVTFRfRU5BQkxFRA0KPiArCWJvb2wgIkVu
YWJsZSBodWdlIHZtYWxsb2MgbWFwcGluZ3MgYnkgZGVmYXVsdCINCj4gKwlkZXBlbmRzIG9uIEhB
VkVfQVJDSF9IVUdFX1ZNQUxMT0MNCj4gKwloZWxwDQo+ICsJICBFbmFibGUgaHVnZSB2bWFsbG9j
IG1hcHBpbmdzIGJ5IGRlZmF1bHQsIHRoaXMgdmFsdWUgY291bGQgYmUgb3ZlcnJpZGRlbg0KPiAr
CSAgYnkgaHVnZXZtYWxsb2M9b2ZmfG9uLg0KPiArDQo+ICAgY29uZmlnIENPTlRJR19BTExPQw0K
PiAgIAlkZWZfYm9vbCAoTUVNT1JZX0lTT0xBVElPTiAmJiBDT01QQUNUSU9OKSB8fCBDTUENCj4g
ICANCj4gZGlmZiAtLWdpdCBhL21tL3ZtYWxsb2MuYyBiL21tL3ZtYWxsb2MuYw0KPiBpbmRleCBk
MmEwMGFkNGUxZGQuLjNiNmY5OTc1MzgxNiAxMDA2NDQNCj4gLS0tIGEvbW0vdm1hbGxvYy5jDQo+
ICsrKyBiL21tL3ZtYWxsb2MuYw0KPiBAQCAtNTgsNyArNTgsNyBAQCBzdGF0aWMgY29uc3QgdW5z
aWduZWQgaW50IGlvcmVtYXBfbWF4X3BhZ2Vfc2hpZnQgPSBQQUdFX1NISUZUOw0KPiAgICNlbmRp
ZgkvKiBDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BUCAqLw0KPiAgIA0KPiAgICNpZmRlZiBDT05G
SUdfSEFWRV9BUkNIX0hVR0VfVk1BTExPQw0KPiAtc3RhdGljIGJvb2wgX19yb19hZnRlcl9pbml0
IHZtYXBfYWxsb3dfaHVnZSA9IHRydWU7DQo+ICtzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQg
dm1hcF9hbGxvd19odWdlID0gSVNfRU5BQkxFRChDT05GSUdfSFVHRV9WTUFMTE9DX0RFRkFVTFRf
RU5BQkxFRCk7DQo+ICAgDQo+ICAgc3RhdGljIGludCBfX2luaXQgc2V0X25vaHVnZXZtYWxsb2Mo
Y2hhciAqc3RyKQ0KPiAgIHsNCj4gQEAgLTY2LDYgKzY2LDIyIEBAIHN0YXRpYyBpbnQgX19pbml0
IHNldF9ub2h1Z2V2bWFsbG9jKGNoYXIgKnN0cikNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAg
IGVhcmx5X3BhcmFtKCJub2h1Z2V2bWFsbG9jIiwgc2V0X25vaHVnZXZtYWxsb2MpOw0KPiArDQo+
ICtzdGF0aWMgaW50IF9faW5pdCBzZXRfaHVnZXZtYWxsb2MoY2hhciAqc3RyKQ0KPiArew0KPiAr
CWlmICghc3RyKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCWlmICghc3RyY21wKHN0
ciwgIm9uIikpDQo+ICsJCXZtYXBfYWxsb3dfaHVnZSA9IHRydWU7DQo+ICsJZWxzZSBpZiAoIXN0
cmNtcChzdHIsICJvZmYiKSkNCj4gKwkJdm1hcF9hbGxvd19odWdlID0gdHJ1ZTsNCj4gKwllbHNl
DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICtlYXJs
eV9wYXJhbSgiaHVnZXZtYWxsb2M9Iiwgc2V0X2h1Z2V2bWFsbG9jKTsNCj4gICAjZWxzZSAvKiBD
T05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BTExPQyAqLw0KPiAgIHN0YXRpYyBjb25zdCBib29sIHZt
YXBfYWxsb3dfaHVnZSA9IGZhbHNlOw0KPiAgICNlbmRpZgkvKiBDT05GSUdfSEFWRV9BUkNIX0hV
R0VfVk1BTExPQyAqLw==
