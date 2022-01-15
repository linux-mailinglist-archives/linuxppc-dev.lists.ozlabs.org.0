Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC5C48F644
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYjj5lXcz30Q8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYj9398Vz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:06:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fApWc4op5C+2sJk3itGEgqgssgvP8yolQ8SkZN4fKUKhiQSN8Uc3eu0IyJrPbW0tqqBU9+pmYH+0gPi2GipfZO6YSzEJzPAKe9ZmVg9Kc/9Y999tcSSig1hblHrWElvXx+uI4+cY71s+bJr0RjhNMDTKEDWG4COuXN3KTQSCV8vefKj45aoRI6U9MPA3wJ8PsuQMqTT219WR1+PZkPGK+w1LP1nkFgw55oMyTAgyCtUilyt6SsFcByOfutmeshHHbATnfgV4RoZmu49V21hmxe8zAO/Lchg73I1EtuEEZwTotHiHoENvlpphfk+wqngsYe4YzCF4MPHtCCRDurQMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tuc3fxdD1JQoZnIPUPQ3RiSbvKs7G9aNze4dz0kZLkQ=;
 b=jJQ0wXwk4FOMh4XW6h0E009veGITjC7fznXsK/MUaw893FtQ2MvoDeY1/ctCO2qjLqXANW6MqZpsHIYF5DmrPU7opji+odL8rt8nINysyuwf1g6rl1dSqIi7DzS0W2IHo1kWQ+g7f1SkHgCdZjMcg/pdYSWMKIOh6w2DbmA8SVhLRQ3SIY9Cyf9gkRPGjA3w/4yCcJG7vNLZqreikgii7RRAcmkVmwCeZ5JIb+XiPMvAGl/BXYd/4vVenRiMBvs6LOXKJSMUXbhymqFpCBzIoYm2ZJSw0zPyL7FFpLRVFdJGo33TGAQwgqUdR9w8GQOhkBkoPGY2elbrJ0BqzMQZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Sat, 15 Jan 2022 10:05:55 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 10:05:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] arm64: Support huge vmalloc mappings
Thread-Topic: [PATCH v2 2/3] arm64: Support huge vmalloc mappings
Thread-Index: AQHX+zD+yDp+cuhsWUOBkGxD6/Q9HKxj+JQA
Date: Sat, 15 Jan 2022 10:05:55 +0000
Message-ID: <41f715ce-5597-b66a-e708-26d102668cf5@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20211227145903.187152-3-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e88415b-26b8-42dc-009f-08d9d80e9ead
x-ms-traffictypediagnostic: MRXP264MB0263:EE_
x-microsoft-antispam-prvs: <MRXP264MB0263F67A3D36B7D9890D794AED559@MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:64;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eZpCLqTNvH/z7AcMuCzWOe8LxGuVclQDqDcRslY2eeDhlpAETWkM809veQsTskbNtt8C4uniGz+ms1IRtn8qHV+mrJrD0lRfxC74ahCxit1sh/c0qzrhD6/2G3Wi47wInsIJm7o8NI5uFx0iBMsNbO6uqku0uAGfmQzOcdTdZcJXpfwG9IVk23DzfJnYLMrlTJHR/L0SsQ0nj5qUpiGaT1Pmeowzh7Tvwrhl37JCicHAOietwyWaiXjKNiVCV2g+DUfCAqmsQ9fPi3Q9yEm6rSbbpovHQf4RvNoc0NxGOr12bqK6ztKULkmcvUkLvoBozaFfjICPw5LwH0uBvxmFymFAArXeSktEbL/fav/mCusrHydOkxaBEsEKKvz3XooYnajkqdvlxeBs3V+fejrrxexAC8P2Pm+0XwoxGIX2JzaKRnx6c+LyQ5CAmCatrfcOQzpcWyg4FbHAdyaiZR6IL+USQXQYJ9uwj/x5565frPgBrq72C8xHCY/nh/ToGArOmm9Zbpamr5/uxDKAf3H6Mi3z5/68x9uqxHueSirMljP1oes/KsTLgE2CVH6wC7Las8g2E92liME1957L+It712cjEnoU1mww4aUXZcLMm6rKiCftQV1lIIxoD6s07lHSflZBTDT6lpXnwtTtOQ+I+qT8JlPUcZ90gNkwR+RJmKEPVis6L0I95uSyzesdm4NUBeZBWqz0Pev/YQBsRdDLPqtzX9Tpu8Hlcehjl7la/2bgWckwQkElfyZi/JVqCFZEGvQLeBC0l7KdA0FxjZRK+9IqvAJUatLzNj994Zwma6c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38070700005)(31686004)(6512007)(76116006)(64756008)(186003)(8936002)(26005)(71200400001)(6506007)(66556008)(2906002)(86362001)(36756003)(31696002)(2616005)(8676002)(6486002)(5660300002)(7416002)(83380400001)(38100700002)(4326008)(316002)(110136005)(54906003)(91956017)(66946007)(44832011)(66446008)(66476007)(122000001)(14583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHpVUjYxdnZ5TktURGRsT1JiTWJIOUppVSttSldIcUJDYWlhZDAvM2RBODYv?=
 =?utf-8?B?Qmo0dllieG9DeGlqS2l5M2FleHQzTlAwUlBaQUY2QnZKYytuSGRXUjh2cXZD?=
 =?utf-8?B?NVlwMGJLTFNaRXlRVnEzSlkvNEN5NUhMWnBDRnEwc0tvYWNVS1RZOUxHUzBh?=
 =?utf-8?B?RGNFeUJqL0JuSXNzNXJ2WmpQTHpQQVRlOGhjemU4MmtOdVJOOVpFQmZnT3VV?=
 =?utf-8?B?MnFUZVNycTBLQm9PNXJZUERTVWFGczdWTEppZHRlWlo4QWdmOXRUelplOCsv?=
 =?utf-8?B?YldLZVRXVW95aGxFNVJrTEY5VWVhRHB3ZTdQZmZnYWxod2VGT08vN3ZQQUUw?=
 =?utf-8?B?ZHI4V0dMM2VNSk9EbS9PMkJCWnJtRjhmdHF1Q3ZCUzhmYUFrakRpcERockhI?=
 =?utf-8?B?WXdwUmcvank0SWYzeER6TDY1cTU1Yld5Z0NzaVJ5REpkaGpLNDAwYnRGS0hS?=
 =?utf-8?B?My8ydzdidVRhWC9SUmtCS2Q0SWo5SklPSnExTnlzSzF5Tll1cGs5TEdGRi9R?=
 =?utf-8?B?QytmbHNRSk1ybHhCUGRnUmQzL3g5dzdNcFZHYmZoWUNKbGRWVVJQaUlVYlRC?=
 =?utf-8?B?R3BuWnhLaUJ6NDd6VE4wZTc5OVFvRFBmQlRSSTV2Y2NvTTBtczhCY0tzN2NY?=
 =?utf-8?B?Q1hNNnY1VXRmWFd2UVNTdEhVREdFRkdnaUtCUnJGdnV5c2hFRkhnN3dPditW?=
 =?utf-8?B?RmlqQVBZVk1wbm9CaGlGZXpnQUlIMktMZ3hwNzVFbjIrR01LV00yUWR3TTAy?=
 =?utf-8?B?Z3gxQzFuS2RFUTVBczJOT2FVdEQwY2hyOUhVcFB0RzZValhYYkhJWEpYTFQv?=
 =?utf-8?B?V2VNNHFDUWQ0Nld2SmxsZHZtZFRoMkNwUkNsWmlFSFJmZ0lySnkrS0dXU3lz?=
 =?utf-8?B?em5IeDdkNzNkdFA5Y3Zaa2tzL3VVMk1vTGg2OEhtUm9zWW4xTUx6N0wvaDBN?=
 =?utf-8?B?Q0RLNHRnQTk2MXk2ZW0yOThhTXRWSUFWSGxjVjNjTmpSTW9aRjN3a0xtK0ZT?=
 =?utf-8?B?RVM2bW8rcjRuQ3gyTDNnTFN2RCsySSsvYXRoNzZkZGg0RmMwRzlNL09jT1ha?=
 =?utf-8?B?b1A3bSt4VWxiaGNaOC84R09ucFV5aFhCVStrUXlNVWhCVGRTQUtNcG5lRFFm?=
 =?utf-8?B?bXZDM0VMaFhOaGNjaFhzS0RqcWJQeUpzVW14bnVnZVM1M1dXQkMwTzYvdXNB?=
 =?utf-8?B?U3FseGdnc2xQN2JwcVM2OTlJQkJqQjBaNHd6Wjdac2Ywd2xEOWtObU51YjdE?=
 =?utf-8?B?bGM0bWJ0UERWa2toNU11OUluVWd4MHJreTNoYkl0MjBDd09XMWtVTlVoSjlZ?=
 =?utf-8?B?QytZcnpoT29mWVVtZEM4NVBGMzRFQ1JyVGd4SkdFeVdBZUdJWHdZMEx4bmo2?=
 =?utf-8?B?bTJkQXU3K3dJQ21tcXVOWm5uVTZCV1l2dnZXYi80S3J5V29jQXEyTkRJd0Nh?=
 =?utf-8?B?ZkcxZ0NzWnFZbFpKWmwvSDRZcEFvTTQ1b2dtZGd5MVE1Rm42UGsrSytZSWU1?=
 =?utf-8?B?bERyVzFkaUZ2TExLdTNGT0JVYjBGTlpNWjdPTHpYZWsvTFVFSWZkMHdFNnVw?=
 =?utf-8?B?NmVaa3oxWm9JdnM2TjJYYUgrZzg3MWNrTVBhblhRRE9ndGNXMnFFaTZHZW1s?=
 =?utf-8?B?cEd5ZlJvaGx1RjVnZHdMNy9LOG9yd0cxakFHaEVwY05kdk1XcXZIMVRnb25H?=
 =?utf-8?B?dXlaU1B1MmN4eFhNMVFHSXlvUmVjU2R3NitUVlZudjZYY011aVdXREZ2RXVY?=
 =?utf-8?B?azY0SzJ2MlFpUlVrSE1YaVVMb1BQRnhBSEs0UTdpSngyd1dQYTREWjgyb25Y?=
 =?utf-8?B?S3JnblFxVDNLeVhrKzQ1WWZ3U2RSQzVtS0h2SnNRY3lGUUV0b2NXSGtqbklx?=
 =?utf-8?B?VnhxeFR1R0FQTHBYNVA0WGJlbU1ESHU2bnBWRUJvN3lEblkzeGFaMDdDb3FQ?=
 =?utf-8?B?Zk9vdFU4WXUrK1NuTlppano4cXlkc0g2cFZFV3BLNEVGbDVyZUN0b1kwVWVj?=
 =?utf-8?B?enR6LzRQcGlFMldzdEZaMEFCZktnVmhMMjBKRGM5dkRoNWVmbUtVVjkrempX?=
 =?utf-8?B?NGsvTVZLd1Q5VHlyaVF0RklJWjlqOFo4b0ppbStQcitsQnA2Y0hRSTNialRQ?=
 =?utf-8?B?dHg1RXo1S3hYMkFKNGQvUGN5OVpQYW1MN3lSQ1ErMC9ub214bjlDQ3phclJ5?=
 =?utf-8?B?Tnh2R3lxTHpsY3ZKOFZ2ZmU5YTRrbmJTS3F3NlgyMW5RYjF1NjFqb2lJV1JK?=
 =?utf-8?Q?MPw2riScYMFQixnsNOZIAAPGyxXltSoTUKyu9clO1A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E31213F41AEA4438CCDA4F0600EE95C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e88415b-26b8-42dc-009f-08d9d80e9ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:05:55.1631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/9LBusWJxfE71nzpP6hbqTImmq5u0/MyzkOzM15mREEmBWu1mMu41LY6R6DbXejA+vnxejCIxk6p7YCKKke1QwzIUS4HMMfNJwmUaVFtpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0263
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzEyLzIwMjEgw6AgMTU6NTksIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFRo
aXMgcGF0Y2ggc2VsZWN0IEhBVkVfQVJDSF9IVUdFX1ZNQUxMT0MgdG8gbGV0IGFybTY0IHN1cHBv
cnQgaHVnZQ0KPiB2bWFsbG9jIG1hcHBpbmdzLg0KPiANCj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8
Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IENjOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwu
b3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdl
aS5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFt
ZXRlcnMudHh0IHwgNCArKy0tDQo+ICAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAxICsNCj4gICBhcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyAgICAg
ICAgICAgICAgICAgICAgICB8IDUgKysrLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+IGluZGV4IDdiMmY5MDBmZDI0My4uZTNmOWZk
N2VjMTA2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dA0KPiBAQCAtMTYzOSw3ICsxNjM5LDcgQEANCj4gICAJCQlwcmVjZWRlbmNl
IG92ZXIgbWVtb3J5X2hvdHBsdWcubWVtbWFwX29uX21lbW9yeS4NCj4gICANCj4gICANCj4gLQlo
dWdldm1hbGxvYz0JW1BQQ10gUmVndWlyZXMgQ09ORklHX0hBVkVfQVJDSF9IVUdFX1ZNQUxMT0MN
Cj4gKwlodWdldm1hbGxvYz0JW0tOTCxQUEMsQVJNNjRdIFJlZ3VpcmVzIENPTkZJR19IQVZFX0FS
Q0hfSFVHRV9WTUFMTE9DDQo+ICAgCQkJRm9ybWF0OiB7IG9uIHwgb2ZmIH0NCj4gICAJCQlEZWZh
dWx0IHNldCBieSBDT05GSUdfSFVHRV9WTUFMTE9DX0RFRkFVTFRfRU5BQkxFRC4NCj4gICANCj4g
QEAgLTM0MjQsNyArMzQyNCw3IEBADQo+ICAgDQo+ICAgCW5vaHVnZWlvbWFwCVtLTkwsWDg2LFBQ
QyxBUk02NF0gRGlzYWJsZSBrZXJuZWwgaHVnZSBJL08gbWFwcGluZ3MuDQo+ICAgDQo+IC0Jbm9o
dWdldm1hbGxvYwlbUFBDXSBEaXNhYmxlIGtlcm5lbCBodWdlIHZtYWxsb2MgbWFwcGluZ3MuDQo+
ICsJbm9odWdldm1hbGxvYwlbS05MLFBQQyxBUk02NF0gRGlzYWJsZSBrZXJuZWwgaHVnZSB2bWFs
bG9jIG1hcHBpbmdzLg0KPiAgIA0KPiAgIAlub3NtdAkJW0tOTCxTMzkwXSBEaXNhYmxlIHN5bW1l
dHJpYyBtdWx0aXRocmVhZGluZyAoU01UKS4NCj4gICAJCQlFcXVpdmFsZW50IHRvIHNtdD0xLg0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9LY29uZmlnIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+
IGluZGV4IDNiYjBiNjcyOTJiNS4uYzM0YmJiNDQ4MmIwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2Fy
bTY0L0tjb25maWcNCj4gKysrIGIvYXJjaC9hcm02NC9LY29uZmlnDQo+IEBAIC0xNDIsNiArMTQy
LDcgQEAgY29uZmlnIEFSTTY0DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfQVVESVRTWVNDQUxMDQo+
ICAgCXNlbGVjdCBIQVZFX0FSQ0hfQklUUkVWRVJTRQ0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0NP
TVBJTEVSX0gNCj4gKwlzZWxlY3QgSEFWRV9BUkNIX0hVR0VfVk1BTExPQw0KPiAgIAlzZWxlY3Qg
SEFWRV9BUkNIX0hVR0VfVk1BUA0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0pVTVBfTEFCRUwNCj4g
ICAJc2VsZWN0IEhBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFDQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jDQo+
IGluZGV4IDMwOWEyNzU1M2M4Ny4uYWY3YjRjYmFjZTJiIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2Fy
bTY0L2tlcm5lbC9tb2R1bGUuYw0KPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYw0K
PiBAQCAtMzYsNyArMzYsOCBAQCB2b2lkICptb2R1bGVfYWxsb2ModW5zaWduZWQgbG9uZyBzaXpl
KQ0KPiAgIAkJbW9kdWxlX2FsbG9jX2VuZCA9IE1PRFVMRVNfRU5EOw0KPiAgIA0KPiAgIAlwID0g
X192bWFsbG9jX25vZGVfcmFuZ2Uoc2l6ZSwgTU9EVUxFX0FMSUdOLCBtb2R1bGVfYWxsb2NfYmFz
ZSwNCj4gLQkJCQltb2R1bGVfYWxsb2NfZW5kLCBnZnBfbWFzaywgUEFHRV9LRVJORUwsIFZNX0RF
RkVSX0tNRU1MRUFLLA0KPiArCQkJCW1vZHVsZV9hbGxvY19lbmQsIGdmcF9tYXNrLCBQQUdFX0tF
Uk5FTCwNCj4gKwkJCQlWTV9ERUZFUl9LTUVNTEVBSyB8IFZNX05PX0hVR0VfVk1BUCwNCg0KeW91
IHNob3VsZCBhZGQgYSBjb21tZW50IGxpa2UgcG93ZXJwYyAoY29tbWl0IDhhYmRkZDk2OGEzMCAN
CigicG93ZXJwYy82NHMvcmFkaXg6IEVuYWJsZSBodWdlIHZtYWxsb2MgbWFwcGluZ3MiKSkgdG8g
ZXhwbGFpbiB3aHkgdGhpcyANCnJlcXVpcmVzIFZNX05PX0hVR0VfVk1BUA0KDQo+ICAgCQkJCU5V
TUFfTk9fTk9ERSwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsNCj4gICANCj4gICAJaWYg
KCFwICYmIElTX0VOQUJMRUQoQ09ORklHX0FSTTY0X01PRFVMRV9QTFRTKSAmJg0KPiBAQCAtNTUs
NyArNTYsNyBAQCB2b2lkICptb2R1bGVfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplKQ0KPiAgIAkJ
ICovDQo+ICAgCQlwID0gX192bWFsbG9jX25vZGVfcmFuZ2Uoc2l6ZSwgTU9EVUxFX0FMSUdOLCBt
b2R1bGVfYWxsb2NfYmFzZSwNCj4gICAJCQkJbW9kdWxlX2FsbG9jX2Jhc2UgKyBTWl8yRywgR0ZQ
X0tFUk5FTCwNCj4gLQkJCQlQQUdFX0tFUk5FTCwgMCwgTlVNQV9OT19OT0RFLA0KPiArCQkJCVBB
R0VfS0VSTkVMLCBWTV9OT19IVUdFX1ZNQVAsIE5VTUFfTk9fTk9ERSwNCg0KU2FtZQ0KDQo+ICAg
CQkJCV9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7DQo+ICAgDQo+ICAgCWlmIChwICYmIChr
YXNhbl9tb2R1bGVfYWxsb2MocCwgc2l6ZSwgZ2ZwX21hc2spIDwgMCkpIHs=
