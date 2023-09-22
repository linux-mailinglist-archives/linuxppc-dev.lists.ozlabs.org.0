Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1437AA9EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:18:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UoITgA9N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsNs21M07z3dhk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:17:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UoITgA9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsNr816v4z3dJQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:17:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Phs5wbNfo4l8A9IfYWAo0A5GsiWo6lX5NsiYJXQTBHTHgaWIGWQIA5EAl75zSxKuBanG0glSzcMrrWxsB+FFQqCz9EUogNxAkdbKZ73H+swdTt6V7HvciqnySRci8MWcb7DP9rvRdNJLW6Wos6xPXB6rOlvIYWnIwgHJDXowUvpxO+EKUDMcINy66d+ReC3QR7m5LVhZ/3UfXp0GAG7utqjo+01iQ/GfCDW8M8CJuH20olnCNNFH+ahyc9da50wXV4XviqCeZkGc8tl/3HcDj41JL37HCyOO5CKqIixTg1vxIdycAto1xHFoW2f3marjET2pf7BWYVsB/SVBmag1Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+ipTyndc3JI0IRFDOJdyzJBLPs/TJVy5KEcp3k1rHI=;
 b=YCe2iRL+JxwQf/O1jx1I5xEdVFFsDVoDrJQOrwm0Ie5iNuJvSrH/85nSxBQ8OiqXMsMgonOZbzn2nL7InUGCPYus1OaSi1qENtb0AyU2IoaoOdEGULNkYq8wcm9U8hyhNweHmZFReWtgOo2ApW4pGsfeqd41bErCUpa+IbGW61EuwtpnilIuqOiQ5LUR7Hp4TrRvjk2kqIspMOQK2PkdM889fPEJymCwPPI0Ql7FlObcA2SHhrCTH/5yeSqPjGm90gGqp/z0QaGH/8wze4J4o+OlH04AcyN4LoDwTjfcugIUwk7SXOv0l/wYzHttTag2Ip82ICanBT4gkT8Qm8QWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+ipTyndc3JI0IRFDOJdyzJBLPs/TJVy5KEcp3k1rHI=;
 b=UoITgA9NPh5ShTNW4h9R0jSDJ0BfvauVI64C6y5ilrnYCSvrybQYQQk00dDvXjZpzzrVDLq2dtdcJ/e/G/Ah4LjGuD5kTMv9r2qWuMg62yy10i2i1apj8lVlR6ke/D53tBpvYTjYUZxB21DiXXy/25TJOQzluAYleUh8X90P7xLd/7HoiWnXS+xZ5E3dtTEsYLncEa/17ZfhjJNUslyfYQBPs9vnPblxsTz9nRKIe6aNLfkSuVpsgUti/xjD2DEEggqPvyGVL/Jlu8R+QdFVycO0o+/KRrlhvdEVesaXNksCOW9OXRavVbbm0X+z9JPaDqLtfu2SKkISq0EZIs/eUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3354.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 07:16:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 07:16:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Thread-Topic: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Thread-Index: AQHZ6gIemvXxoUb2LEiShTuWJhQ1PLAl6IqAgACM8oA=
Date: Fri, 22 Sep 2023 07:16:52 +0000
Message-ID: <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
In-Reply-To:  <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3354:EE_
x-ms-office365-filtering-correlation-id: 245184b2-a1ed-4d84-6990-08dbbb3be509
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0mv5w6bZYp86Ay20dtpSMtEgaosNF8oi/Bct2RfyuLVSsswmD0PgM4Cceo1JT/TTraC2oMwO2n8iX/bXunGhhJs3L0ei1mSLv29Hj8V3xqfMXCKQNm7VaA1ilGzVD0nSs356rasjeuCOGI1LjjdMjaBynG7w7GmzxdqVPqXGO4qaOWdbYac69ZcyswnWMJ8VWx9BlmpPovEOKNk5XNrE6cG4UiBAszX2ilk4VivLJlzS6U7vpcuPgJ8brWrLCb2CCwL2zNJ3vIvDyDgC1xFf1tEpNNE67rqwxASxkKuO0f/dfT8/C0uU5rzoWtIJcdAN69oG+PhvAukBncAHZrcPTz66yIzkMpYCd9FLJZU57oNJrNYsYsXwo4geh+uG0ZxDqCycp13kXShrwao70O4/SeXmsBp0lquhDrpLvODmaJ81WnIc+6hRoer/Ccom6SwzdTpyAg4h4qCjgrebwqUvfFrmXV7Zl1NpIzzjx6wbzDYEbOuE9uDH4v6pDpaSRh0gvQGba8ZOpFNhEeCvbN0BxmZ70YBbuDxSQL3kXu2THrg7ME4F72VHPaaXLM5ECK1kRHqBF1K1IdPPsJstlvK6Dd1T4ysSRDt7mxE38nCQqipoeK0P5EOHa4dg+ObqmH/4WMEyHcSWE9cUMgu9+0tN10MukqpqMmj/rVHpp94M/6IdGLIl6FnXgIy4DkdJTnaU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(6486002)(71200400001)(66946007)(6506007)(91956017)(53546011)(110136005)(54906003)(66476007)(64756008)(66446008)(66556008)(76116006)(478600001)(31686004)(6512007)(41300700001)(8936002)(4326008)(44832011)(8676002)(26005)(36756003)(2616005)(5660300002)(31696002)(86362001)(7416002)(316002)(7406005)(2906002)(38100700002)(122000001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L1NwVVJ0bGhGa2l2Y1h5WWozTzlWRGpmSmpaMVRScm5VUklzVUgyWkFiSTVr?=
 =?utf-8?B?cm9GaERwaUFCblBRenlNYTJ3ajAwMjZzTFBCbkxFZGo1M1dRMnZad09rWDgy?=
 =?utf-8?B?ZUNYN1ZzcWwzMjh3djluSkN4bjZON1dsN2VNcVhSOHNab0dkU2toWXRCOUZV?=
 =?utf-8?B?M3MyemJNVGVQVjBaMi95VFZSTVZIWFd1cVY1cmJnTDBqRGVIRXdyWGRreUdy?=
 =?utf-8?B?NU1KNlFOVjV1ODBtVGVSNVhXR1pBdU5TK3U5STIxTXhlUUJxWkp5YXJtUXNo?=
 =?utf-8?B?Wm5PeGFXcUVhVkZTZWNlQ0JGdTVFM3hvQnBhNE8wWmdsL2s1TG5DWmRSSGNv?=
 =?utf-8?B?M29JSmZJVS9RaUcySXlMWnlWVjZselI2M05iY0RYZGtsY05qWVZZT2tPbVl0?=
 =?utf-8?B?eXVLOFZHNUdlalJiUW5vU20wUnk0anN5TFhWVmx6YWFKTU9ncXJKdG1ZOU5j?=
 =?utf-8?B?TTZiRktwK1hMQ0h6VU1mbXM1MkdQOW1DOFM4cjlhU01QRHkxWTR5NXRwNHB4?=
 =?utf-8?B?UjIvaGxrLytoOC8xTEk0RThWamFUbkNmTFJhTmRWbTBkZG5NVWR4VU1acDN4?=
 =?utf-8?B?TWNjZkN6aVVwdDBRQk8raHg4Skt3bG5rbU9sTWtOTkdEV2Jhc3ZNcEVZWDBz?=
 =?utf-8?B?WmY2YTBNcE9uNDM5K1hlbjFJc3RMSzEzSkVWTW5jYzhkVGFieWtyK21XT1c5?=
 =?utf-8?B?SXZmUTF6bmVwL1pObmx1ZDdDeEhTMC9BNk9aV1dpSmdEemJvaWpka1ZxQStk?=
 =?utf-8?B?N3pDcE1qZVdNWjVFdkg1bGdSbnlNT3AvajJicDh0dTZxRkFLc2ZkbitsaE1s?=
 =?utf-8?B?QVRSdFFNU2VKTUIzZUs5YnlVOTNxbitxbGJQMzJ3TXVydnBhdnpnQnMwU1dT?=
 =?utf-8?B?WDhHREdPLzJhd0xKS2RUTWRnSUhrU0dnRUFzb3hOVEdOeHRZb2tBYXUvRVd4?=
 =?utf-8?B?RlZMK3I4N0NuSmU5VVRMZ204azZDTWFlN2FlTkxHOTNDL1dEWGNmaWlVWFkx?=
 =?utf-8?B?VktzZFRnV2xiSTA1dG9aN0tpM3BxZUZyTjVWS1JONmV1eWJiYkF2ZTdUbEpE?=
 =?utf-8?B?Tm1adTRxTmxyOXhMZ2cwdi9xMTF6Q1hsK2xVU2xRYjYzYlcwOFZyb0tzMnlZ?=
 =?utf-8?B?cjJjU3pVeXhRVnN4TWgwUDZlNWdQazVVQ3F3Q2hTVjcvUUE0L2xHZGx4RGhI?=
 =?utf-8?B?d2REOVVZU3lkUVZ3YkVmQWNMY0JHUlpkZWk4OEt1WVR0UzRuTXJXdC96QWYv?=
 =?utf-8?B?Um9pK3BSQnlHaHN1T1A2ZGpVbnFIZnVNMHB1cVliMjBDb0NRNmV4U0VlYXZu?=
 =?utf-8?B?Smk2YVJoT25ldmV3RWN6OFdCY3Joc3RkUTd0dmo2bXVGVnNST0NNUkV2OVRU?=
 =?utf-8?B?M3hKWmFDZTM4NS9jdUUrY1UwV3hubkxvVHhlbGd5UWJxVk1BWVZMU1g2Ylln?=
 =?utf-8?B?aDJST1o1WC8rcWZBT0RsSTBldzVFTTUzeWYzR0VKcG83dE5UNXc2Mkt1M2Nr?=
 =?utf-8?B?R2dpNzhEbDZWeFh2TC96OFdvNkpUcUtiTUlYY2pFZVg0K0hmNGxnS0tmUmRk?=
 =?utf-8?B?R1k1WE1idVMxWTJqcmxxUDRxYm1IaTZnSHhpQVJCV1F0ay9RbXRkbDNQdkhT?=
 =?utf-8?B?RDk1ZW5qeXAwWWluUkNITTJqcmNxbXoveTlsVWVraFNLeVJNc1lWZTBpSXBi?=
 =?utf-8?B?dC9pS1M3c09FTmRTRytBN0poMTN3Z21MWjFidFpMZkR1eTRnZ280RkxGTXdV?=
 =?utf-8?B?Q1l0akw0R3YzVk5LVnFXdkRPd1psOGExNGZWYWcvTzI5SlhFOHIxbEJZVW8w?=
 =?utf-8?B?bDdJak5aTFRkMVhadEVWWmdqSFV2N3RPcUdCTHhiUzlrSDJuL1BiR3VweWtG?=
 =?utf-8?B?OGkyT2hCS3Q0M3hNMkYzRjJ0LyswVHlCYmtlVVdtMUdxT1IvN09FbkVQbUVC?=
 =?utf-8?B?RGtJV0pvUWRlVjVrODd4YnZoais2eEFPNmVUZzFObmEvMldNNUhsV0g1K0xP?=
 =?utf-8?B?MzBoYjRPb2FIRXkzYWRicldPZDdKd0NOQWZ6b0hqbjVOS0RNK3dUUGlRWjVY?=
 =?utf-8?B?a1BTUDFCdXBseFI3T0hnNDlja2xiVEZjRlNCZjlEQkJKb2k0UnI5V2UzNitw?=
 =?utf-8?B?dTQ1SlBkMTBVdjdtdXJyRS9NSGhlRS9UUTdNQzFyUjJxbkNZRUVoclpSQnYw?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B69B42185B2164389C8C6BDDA95596B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 245184b2-a1ed-4d84-6990-08dbbb3be509
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 07:16:52.2832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlwhPCZc6WT8Jgl2ZHbmfKpPhBw+XS/eYc26rgXKS82AVYC623sHgPIgSgPrd6uZVVIdxKxB4nFtV4jKIGsyxzX/NmJsbjhJG+S/LpwpzPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3354
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxpp
 c-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA5LzIwMjMgw6AgMDA6NTIsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIE1v
biwgU2VwIDE4LCAyMDIzIGF0IDEyOjMx4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwu
b3JnPiB3cm90ZToNCj4+DQo+IFsuLi5dDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9l
eGVjbWVtLmggYi9pbmNsdWRlL2xpbnV4L2V4ZWNtZW0uaA0KPj4gaW5kZXggNTE5YmRmZGNhNTk1
Li4wOWQ0NWFjNzg2ZTkgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2V4ZWNtZW0uaA0K
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9leGVjbWVtLmgNCj4+IEBAIC0yOSw2ICsyOSw3IEBADQo+
PiAgICAqIEBFWEVDTUVNX0tQUk9CRVM6IHBhcmFtZXRlcnMgZm9yIGtwcm9iZXMNCj4+ICAgICog
QEVYRUNNRU1fRlRSQUNFOiBwYXJhbWV0ZXJzIGZvciBmdHJhY2UNCj4+ICAgICogQEVYRUNNRU1f
QlBGOiBwYXJhbWV0ZXJzIGZvciBCUEYNCj4+ICsgKiBARVhFQ01FTV9NT0RVTEVfREFUQTogcGFy
YW1ldGVycyBmb3IgbW9kdWxlIGRhdGEgc2VjdGlvbnMNCj4+ICAgICogQEVYRUNNRU1fVFlQRV9N
QVg6DQo+PiAgICAqLw0KPj4gICBlbnVtIGV4ZWNtZW1fdHlwZSB7DQo+PiBAQCAtMzcsNiArMzgs
NyBAQCBlbnVtIGV4ZWNtZW1fdHlwZSB7DQo+PiAgICAgICAgICBFWEVDTUVNX0tQUk9CRVMsDQo+
PiAgICAgICAgICBFWEVDTUVNX0ZUUkFDRSwNCj4gDQo+IEluIGxvbmdlciB0ZXJtLCBJIHRoaW5r
IHdlIGNhbiBpbXByb3ZlIHRoZSBKSVRlZCBjb2RlIGFuZCBtZXJnZQ0KPiBrcHJvYmUvZnRyYWNl
L2JwZi4gdG8gdXNlIHRoZSBzYW1lIHJhbmdlcy4gQWxzbywgZG8gd2UgbmVlZCBzcGVjaWFsDQo+
IHNldHRpbmcgZm9yIEZUUkFDRT8gSWYgbm90LCBsZXQncyBqdXN0IHJlbW92ZSBpdC4NCg0KSG93
IGNhbiB3ZSBkbyB0aGF0ID8gU29tZSBwbGF0Zm9ybXMgbGlrZSBwb3dlcnBjIHJlcXVpcmUgZXhl
Y3V0YWJsZSANCm1lbW9yeSBmb3IgQlBGIGFuZCBub24tZXhlYyBtZW0gZm9yIEtQUk9CRSBzbyBp
dCBjYW4ndCBiZSBpbiB0aGUgc2FtZSANCmFyZWEvcmFuZ2VzLg0KDQo+IA0KPj4gICAgICAgICAg
RVhFQ01FTV9CUEYsDQo+PiArICAgICAgIEVYRUNNRU1fTU9EVUxFX0RBVEEsDQo+PiAgICAgICAg
ICBFWEVDTUVNX1RZUEVfTUFYLA0KPj4gICB9Ow0KPiANCj4gT3ZlcmFsbCwgaXQgaXMgZ3JlYXQg
dGhhdCBrcHJvYmUvZnRyYWNlL2JwZiBubyBsb25nZXIgZGVwZW5kIG9uIG1vZHVsZXMuDQo+IA0K
PiBPVE9ILCBJIHRoaW5rIHdlIHNob3VsZCBtZXJnZSBleGVjbWVtX3R5cGUgYW5kIGV4aXN0aW5n
IG1vZF9tZW1fdHlwZS4NCj4gT3RoZXJ3aXNlLCB3ZSBzdGlsbCBuZWVkIHRvIGhhbmRsZSBwYWdl
IHBlcm1pc3Npb25zIGluIG11bHRpcGxlIHBsYWNlcy4NCj4gV2hhdCBpcyBvdXIgcGxhbiBmb3Ig
dGhhdD8NCj4gDQoNCkNocmlzdG9waGUNCg==
