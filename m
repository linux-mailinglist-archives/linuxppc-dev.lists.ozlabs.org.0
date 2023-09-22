Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F9D7AA998
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:58:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=L+XjoBJh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNPy4x0Yz3cnM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 16:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=L+XjoBJh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNP14b5cz3cdw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 16:57:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJqlRfZ5oilgc8i5OpbIKo5SAtsjelgaaZyN86LfiNLWcP/hY03zyQ8f8VJ5/dXebeiUaVDnoRZr+Yn3CNGf6Mg2YjpGhWO6Tf3Esb0Qv5dkU7ZDuHQw60ABy8gAhDC+vhyYS/Pwi3pdQqGQ5EH4ENUWTtBM/aujA1bLbP3NkgJxvH0b8GPYuqdBbL76Z/RXjYeEuXeDVA6bj3DAc833A6SOeVH66bX8KqXxYAtY3zF4rEuTDQGQNLZJ/cNOVih9AZFYFfSbN8jFZr8DfaYtb9JUIfSoYRG5VbdJLPMmRdLn6kehFRNdBvUS9RfrqECI5V9yIuW6IZVxJdxbR9oy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY6506GSeAUXbx4JSepK/6flQkj7egbTWL9I8M/o7cE=;
 b=H4VZrOfvY9Fnzq7z5hQ3lDc590H6F/Hh6azb8GW/gEm4Y6dspE+ukextJh/0JUOW+WM4QEj01lZGA6HzkBGBRjEabIzrb3f08rn6gvShD3L1HegapDgA8Mlcu4lf/06UwqVG/cEh6OzhaihnCek4wqb4Xefiz8RGV3RlID8QTkKDx2tCIkahPbe0b+xpFpPCcC+OvvUIRCmfjXEkuQoz6yDgCWMUsnhRpff497Xa1XGubszkdHBQfv8MmGTNcWQXPt+ncgZmGJsret9T7a8m4piP7cvNh61vncgNDGEphRdNHYpQlsYM4VqJwcZWBhhw+4diax5qBtquK6E8YF6a8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY6506GSeAUXbx4JSepK/6flQkj7egbTWL9I8M/o7cE=;
 b=L+XjoBJht1FqRGdiHvqgtbMH0bBueNTMBpEoRjjE3gpiLK7fkdpHWLOPeZIS9pVJQRT4ufrLSl4jawI/OT6EFFhvXwW7teTxTa1SdH4/a+z01glVabWRfVaYBmBSExUbFo6HfjM2GejL/bJcX9x7QcYKkJY3xFRrM3X44MkbA/wsDaeX94bnYdZzWYDAS73Ou9pyiodJ1QOVw6SV/PeVN7VmUSE9vR6l0nTgIgOH7DXWdevAvaLv6yvxT1TsTK59pDNDnpnTyczh1vrxeKCUy6m2YgH0+HcQ0Xcf1r8cvUAPlkItxtVQ1M5ogMA/xDvXkYLr7LNR0oZhDmS6ExYv2Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2222.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 06:56:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 06:56:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
	<deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, "David S. Miller"
	<davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Mike Kravetz
	<mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, SeongJae Park
	<sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki
	<urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
	<lstoakes@gmail.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu
	<peterx@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, Qi Zheng
	<zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Thread-Topic: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Thread-Index: AQHZ7KeOgKWYHqkhmkaEjar9bQgRYLAmapKA
Date: Fri, 22 Sep 2023 06:56:43 +0000
Message-ID: <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
In-Reply-To: <20230921162007.1630149-3-ryan.roberts@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2222:EE_
x-ms-office365-filtering-correlation-id: cf345847-89a0-4761-cfc1-08dbbb3914d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oS5t6zOfsTc9Qcc2c/1n+81Jf1Bk4p5u+3vlAZCpo6v4IHltt7jf2cQJNAtAqKwpnv0lcBC/zInJV3o16eIZodsGwowCymthCH/hu06H4xt9Jx0LhYfsWkMyzkvOMFYfSF5ZbMdeITmc9GJZlQI4H/k3f/AmdIKG1PoLm7o2OGQDejIAFmM2QTx83zWI8WggDEkzyRcbYLg/SmZ13YqEHpfADMh2mEZNa5nh43LXFuZ7S5gyADUnizqjwy6DVqCOUTr8qKLaWiPRxsc49B7m1tkeYNsNmUgOsQGCFNK4RfZmjOiDUZdEhPNIS86hHgoPUa5dmw9GiECTyxppY6JhvWRh0dBNMioy2IRt39iUkDoOfvoZRwkt9B3FvRZxxC7d2g2sg3fc5kIuE5CsuMUIRCfra7jOXU+wBSTopRDlRl4+2hEi6cqc5TbiO9MqdwclBCoARNOYna6/GXiqZxWzdeODfc8zwtliguPwJe6NISAn2S+2lUgNJRMZxpA2hrHT0DS+Z4vG+kyfg4PN9DohW0T9J40QHxPyv8ffdxhct3yrQ7EE9hjprmYHmK0Y8nzsHDFPzpOxruF3flNJlzikXL54/GPqU14ejRy0qqvFpKGNmjeewbwSivWC0LZHEYKaXNXrIZjw+GsJ9R83VLprpugzHJtPg5mRv4p4nwj9DPNP3wp4jbR6CxLRTTZRlCR3soYBS6Ctt5Sul/ImR9XBjKe6aUeG3RJpGTnBiwg3ql4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199024)(186009)(1800799009)(2616005)(6486002)(26005)(8936002)(4326008)(36756003)(5660300002)(8676002)(6512007)(41300700001)(66574015)(44832011)(921005)(122000001)(38070700005)(38100700002)(86362001)(316002)(7406005)(7416002)(2906002)(31696002)(83380400001)(71200400001)(478600001)(31686004)(64756008)(6506007)(66946007)(66476007)(66556008)(54906003)(66446008)(76116006)(110136005)(91956017)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y2RyT01kRUYvL3JLN3FOZmZSQXMyTHlXQjZUQTl1QnZtazcxdys1SUlrSE5j?=
 =?utf-8?B?dlRQdlZtSnU3cDRlMWIraUZ6YUFXcUdnZmc5bnF2WStMeURtWk9veExCQ29L?=
 =?utf-8?B?SGMyeXIzZHpIK0tGZzBWT201Y2plVWx2RmQyR0NhaEE4cHJJU2RoZVdEKzlk?=
 =?utf-8?B?S0hjajQybXFNTjhXZFkvRitiMGd3eWlFNzd3RFhhckdkSzdPZWZtbk5NR3Vr?=
 =?utf-8?B?dmt2eVZJZVlaeGVuaUt0OWVYT1plbndQUGY3RGhrbHhoVGxHNVBnSzREcnF2?=
 =?utf-8?B?bjRPbTVyaHlNbmRtOTMrSTJibS94UGticStnLzJkeHF6MkZjVGRRTnZPRCsv?=
 =?utf-8?B?QUQyZnF3QlBSWmowZVN3cThQenVzZDFJb0ZOcWRrdHQvckkwZkR4YTVxclhu?=
 =?utf-8?B?MFpwTFpwQnlrUFgwWmQ4TUtINVQwck95ZTZ6U1VFdmJYTmJ1Y0k1eU95TFB6?=
 =?utf-8?B?L2hVOGdhVWM0TGJOa1U2dXpmbGk2bmJOQWJpb0d2UEdzempIOWdnSVJpc2J6?=
 =?utf-8?B?RW1RSlZRYkhhZU8rdklvRDlqc1crL1QrN1JKdmRJS0JUckNWVzZna1d2eGM0?=
 =?utf-8?B?RjEwRGJPQnZEOVRmcU1qbThrdmtlM1NtMG03L2ZFVE45dEVranYrL2JOdkVo?=
 =?utf-8?B?NXFpNnJtRUEzMlZoWk1CN0xhOW8zQlJZd1pWMllTRmpQdnRpVDdIc3QzRDF4?=
 =?utf-8?B?bjlJSGQ5S1ljcHFPcFpheWQ1ak9nRW52M1JFTHlMai90UnpHL2laREJDYnVH?=
 =?utf-8?B?K2MyUHRMbEV3eDhIMUZmTDQ2aytDRWRMUHZ6MzdGSjNkYjI1WU5md2p0Qm1M?=
 =?utf-8?B?Q0RDak94NURuOVZxekJUY2N3UmFORjhoUmJJdUZEWlh1Nk42VTlRZWRSUlVu?=
 =?utf-8?B?NWNqckZzVWRVZEJEWXVwMk5SZW5HRFNQUE5hTWZaOUJ3UzZRek1pcGhVL3Qy?=
 =?utf-8?B?aVU3UjMzQi9RL1FpL0t5MXpWRDhoNEhyQzFaWEpJNmVpT1QzUitRd0ZxREgz?=
 =?utf-8?B?cHZwa3B6bnVNLzJiTGlXS21YazBPWnhaNEtqM29SR3lsQmdtRU5DcWxMVm5u?=
 =?utf-8?B?WjVqbFIyOFRkU0FvM3ZmclJZVW85cEFZaWpYMEYwMUt5Zkt6c3hRRHhtYlQ1?=
 =?utf-8?B?SlBwajlvWHplbUQwaG1FVk5lck9jWlpkajNEemw3aXR4YzJWZkFVNHBzaHJO?=
 =?utf-8?B?T0lwSW1zTDIxT0toOG5iOWl2UGIzU2tZZUpJZGN3eEJBNWZMeThJakU1QWdq?=
 =?utf-8?B?cG1jRHVUbkpxR2dLdzZqaFhxdU01NEdjQkVKejgvZDVLNWJ6OW5Cejg1N0Uy?=
 =?utf-8?B?T1VqYmtLWkh2L1FqZy8yMkhvZVVBMFNIYk9LTEJNMjVpTzlPSVlRY0d1dWJC?=
 =?utf-8?B?OGtiKytncGRBVE5GL09RRWQwL0xhK1pwU0JtRDhJVTR6NHJuRlNScXUyM0U1?=
 =?utf-8?B?clhmY1dVVytNUEdHNjRYYkVjcjVhbnJkN0Y5MExoYTRBMjlvYmdMOUY4MS9u?=
 =?utf-8?B?bnE5cFJSV1l1Y3NoaWh1R1llU05xNy9hNnBoSmQvK3NoZUl5M3JzOHNnaE90?=
 =?utf-8?B?Qkt0eEdEWHJSbXhDUER1UEV6bnJ0R2lwZXZwWXJkTXVJWkJhZjExT0R2dW5U?=
 =?utf-8?B?aktpTnpia1ZWWjc2OC8vcjlNb1NGQWhTVzZLN0c5OEZ2TDhUQmRkWk1jb2tS?=
 =?utf-8?B?bnVLMkgzV29zeXA5TGxITk9RU2ZNb3g4clJNem1NYnloMzhuZm5QUVN6Y1dO?=
 =?utf-8?B?MTBTU1J5WURwWExWK0ltclhxYnpWTGQ2bHVHSjFYdjlpTE11SnhmSkVHOU5m?=
 =?utf-8?B?OWlGZUs1YnF5Qi96aVdIZ1E5QmwybXRpM2FjR05abGpkN1Y2M0Frd29EUEgx?=
 =?utf-8?B?SlVkRVgvUU5jMWhEUUViclplR0JVSmZQRE9YQWNFbnVXeS9FcTRSMDkybVJt?=
 =?utf-8?B?WkZHdzBwYnM0bFdLNHBhMXJsaHlSVFN6QWlvZ0Z1T3dwUkZjaTRPdVZoVWI4?=
 =?utf-8?B?YUlTZGRmTlFrL2c1REdIeUI1bG0wZVBlKzJoVkpzTVE1dXE3TDF5dmFvRTR1?=
 =?utf-8?B?aGN0UFNXTjRCUW81VnArL0R1UkJ5SkFoS3haS1pMZ2dzQThHTy9FemNXdGpu?=
 =?utf-8?B?MUxLNW9ZdXZlN2ZRVU1hSHBiQzNwQ3dLcTh0bVNjcU05bVlOai9RVG9uUzRq?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6810E346256204499A32D392395271D8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf345847-89a0-4761-cfc1-08dbbb3914d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 06:56:43.9978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5jMNrC7pVASpvEtOYW0s/L5iKOhkC54b5wNtRbp6XutFm1iJJEreaU4G5fGVXWbBspyfm0vio3sIviViQE0LZO19YDL0id3DNiG5XkqbxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2222
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzA5LzIwMjMgw6AgMTg6MjAsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBJ
biBvcmRlciB0byBmaXggYSBidWcsIGFybTY0IG5lZWRzIGFjY2VzcyB0byB0aGUgdm1hIGluc2lk
ZSBpdCdzDQo+IGltcGxlbWVudGF0aW9uIG9mIHNldF9odWdlX3B0ZV9hdCgpLiBQcm92aWRlIGZv
ciB0aGlzIGJ5IGNvbnZlcnRpbmcgdGhlDQo+IG1tIHBhcmFtZXRlciB0byBiZSBhIHZtYS4gQW55
IGltcGxlbWVudGF0aW9ucyB0aGF0IHJlcXVpcmUgdGhlIG1tIGNhbg0KPiBhY2Nlc3MgaXQgdmlh
IHZtYS0+dm1fbW0uDQo+IA0KPiBUaGlzIGNvbW1pdCBtYWtlcyB0aGUgcmVxdWlyZWQgcG93ZXJw
YyBtb2RpZmljYXRpb25zLiBTZXBhcmF0ZSBjb21taXRzDQo+IHVwZGF0ZSB0aGUgb3RoZXIgYXJj
aGVzIGFuZCBjb3JlIGNvZGUsIGJlZm9yZSB0aGUgYWN0dWFsIGJ1ZyBpcyBmaXhlZCBpbg0KPiBh
cm02NC4NCj4gDQo+IE5vIGJlaGF2aW9yYWwgY2hhbmdlcyBpbnRlbmRlZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2JlcnRzQGFybS5jb20+DQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaCB8IDMgKyst
DQo+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2h1Z2V0bGJwYWdlLmMgICAgICAgICAgIHwg
MiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jICAg
ICB8IDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jICAgICAgICAgICAgICAg
ICAgICAgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNyArKysrKystDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaA0KPiBpbmRleCBkZTA5MmIwNGVlMWEuLmZmZjhjZDcy
NmJjNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9o
dWdldGxiLTh4eC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIv
aHVnZXRsYi04eHguaA0KPiBAQCAtNDYsNyArNDYsOCBAQCBzdGF0aWMgaW5saW5lIGludCBjaGVj
a19hbmRfZ2V0X2h1Z2VfcHNpemUoaW50IHNoaWZ0KQ0KPiAgIH0NCj4gICANCj4gICAjZGVmaW5l
IF9fSEFWRV9BUkNIX0hVR0VfU0VUX0hVR0VfUFRFX0FUDQo+IC12b2lkIHNldF9odWdlX3B0ZV9h
dChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwg
cHRlX3QgcHRlKTsNCj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpOw0KPiAr
dm9pZCBfX3NldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKTsNCg0KRG9uJ3QgYWRkIHRoZSBidXJkZW4g
b2YgYW4gYWRkaXRpb25hbCBmdW5jdGlvbiwgc2VlIGJlbG93DQoNCj4gICANCj4gICAjZGVmaW5l
IF9fSEFWRV9BUkNIX0hVR0VfUFRFX0NMRUFSDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGh1Z2Vf
cHRlX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2UuYyBiL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jDQo+IGluZGV4IDNiYzBlYjIxYjJhMC4u
YWU3ZmQ3YzkwZWI4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVn
ZXRsYnBhZ2UuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2Uu
Yw0KPiBAQCAtMTQ3LDcgKzE0Nyw3IEBAIHZvaWQgaHVnZV9wdGVwX21vZGlmeV9wcm90X2NvbW1p
dChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyDQo+ICAgCWlm
IChyYWRpeF9lbmFibGVkKCkpDQo+ICAgCQlyZXR1cm4gcmFkaXhfX2h1Z2VfcHRlcF9tb2RpZnlf
cHJvdF9jb21taXQodm1hLCBhZGRyLCBwdGVwLA0KPiAgIAkJCQkJCQkgICBvbGRfcHRlLCBwdGUp
Ow0KPiAtCXNldF9odWdlX3B0ZV9hdCh2bWEtPnZtX21tLCBhZGRyLCBwdGVwLCBwdGUpOw0KPiAr
CXNldF9odWdlX3B0ZV9hdCh2bWEsIGFkZHIsIHB0ZXAsIHB0ZSk7DQo+ICAgfQ0KPiAgIA0KPiAg
IHZvaWQgX19pbml0IGh1Z2V0bGJwYWdlX2luaXRfZGVmYXVsdHNpemUodm9pZCkNCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jIGIvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMNCj4gaW5kZXggMTcwNzVj
NzhkNGJjLi43Y2Q0MGEzMzRjM2EgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29r
M3M2NC9yYWRpeF9odWdldGxicGFnZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9yYWRpeF9odWdldGxicGFnZS5jDQo+IEBAIC01OCw1ICs1OCw1IEBAIHZvaWQgcmFkaXhfX2h1
Z2VfcHRlcF9tb2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsDQo+
ICAgCSAgICBhdG9taWNfcmVhZCgmbW0tPmNvbnRleHQuY29wcm9zKSA+IDApDQo+ICAgCQlyYWRp
eF9fZmx1c2hfaHVnZXRsYl9wYWdlKHZtYSwgYWRkcik7DQo+ICAgDQo+IC0Jc2V0X2h1Z2VfcHRl
X2F0KHZtYS0+dm1fbW0sIGFkZHIsIHB0ZXAsIHB0ZSk7DQo+ICsJc2V0X2h1Z2VfcHRlX2F0KHZt
YSwgYWRkciwgcHRlcCwgcHRlKTsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
bW0vbm9oYXNoLzh4eC5jIGIvYXJjaC9wb3dlcnBjL21tL25vaGFzaC84eHguYw0KPiBpbmRleCBk
YmJmZTg5NzQ1NWQuLjY1MGE3YTg0OTZiNiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21t
L25vaGFzaC84eHguYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jDQo+IEBA
IC05MSw3ICs5MSw3IEBAIHN0YXRpYyBpbnQgX19yZWYgX19lYXJseV9tYXBfa2VybmVsX2h1Z2Vw
YWdlKHVuc2lnbmVkIGxvbmcgdmEsIHBoeXNfYWRkcl90IHBhLA0KPiAgIAlpZiAobmV3ICYmIFdB
Uk5fT04ocHRlX3ByZXNlbnQoKnB0ZXApICYmIHBncHJvdF92YWwocHJvdCkpKQ0KPiAgIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICAgDQo+IC0Jc2V0X2h1Z2VfcHRlX2F0KCZpbml0X21tLCB2YSwgcHRl
cCwgcHRlX21raHVnZShwZm5fcHRlKHBhID4+IFBBR0VfU0hJRlQsIHByb3QpKSk7DQo+ICsJX19z
ZXRfaHVnZV9wdGVfYXQoJmluaXRfbW0sIHZhLCBwdGVwLCBwdGVfbWtodWdlKHBmbl9wdGUocGEg
Pj4gUEFHRV9TSElGVCwgcHJvdCkpKTsNCg0KQ2FsbCBzZXRfaHVnZV9wdGVfYXQoKSB3aXRoIGEg
TlVMTCB2bWEgaW5zdGVhZC4NCg0KPiAgIA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFi
bGUuYw0KPiBpbmRleCAzZjg2ZmQyMTc2OTAuLjljYmNiNTYxYTRkOCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJs
ZS5jDQo+IEBAIC0yODgsNyArMjg4LDcgQEAgaW50IGh1Z2VfcHRlcF9zZXRfYWNjZXNzX2ZsYWdz
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIH0NCj4gICANCj4gICAjaWYgZGVmaW5l
ZChDT05GSUdfUFBDXzh4eCkNCj4gLXZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpDQo+ICt2
b2lkIF9fc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25n
IGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpDQoNCktlZXAgaXQgYXMgc2V0X2h1Z2VfcHRl
X2F0KCkgd2l0aCB2bWEgYXJndW1lbnQuDQoNCj4gICB7DQo+ICAgCXBtZF90ICpwbWQgPSBwbWRf
b2ZmKG1tLCBhZGRyKTsNCg0KQ2hhbmdlIHRvOg0KDQoJcG1kX3QgKnBtZCA9IHZtYSA/IHBtZF9v
ZmYodm1hLT52bV9tbSwgYWRkcikgOiBwbWRfb2ZmX2soYWRkcik7DQoNCj4gICAJcHRlX2Jhc2lj
X3QgdmFsOw0KPiBAQCAtMzEwLDYgKzMxMCwxMSBAQCB2b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlXw0K
PiAgIAlmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyssIGVudHJ5KyssIHZhbCArPSBTWl80SykNCj4g
ICAJCSplbnRyeSA9IHZhbDsNCj4gICB9DQo+ICsNCj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVw
LCBwdGVfdCBwdGUpDQo+ICt7DQo+ICsJX19zZXRfaHVnZV9wdGVfYXQodm1hLT52bV9tbSwgYWRk
ciwgcHRlcCwgcHRlKTsNCj4gK30NCg0KUmVtb3ZlIHRoaXMgYnVyZGVuLg0KDQo+ICAgI2VuZGlm
DQo+ICAgI2VuZGlmIC8qIENPTkZJR19IVUdFVExCX1BBR0UgKi8NCj4gICANCg0KDQpDaHJpc3Rv
cGhlDQo=
