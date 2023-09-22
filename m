Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAD7AAF46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 12:14:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AlO6JPT6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsSmp3XDMz3dhC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 20:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AlO6JPT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::627; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsSlt48Xdz2yTx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 20:13:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4GSs/gNgQjxuOmqAgpg4tFUNzBI5ibWPjVluM9WyQmgaUWVb3kTqqeqvwM9DxP2DpkPKBo6KTkAKVYvBcMcLVuadwRe8exhrE9k7ejzVGjPRR6Q7aeHIOgyYt9C6O56A4rImxHOd1p6KnXgz+WpsjuBbicQl5MATxcC5pKul3a8XThswbTk480JULFTQ3SPOPhOFdo8TfOoJcA7ojzLllPLrrZTNYdCC9VQAjTvuh5Q9Hf6DBdF4kx9ayiKMS7Gzj+N20jkOPKLpqvvLLuSTtKfUnl6oFSOyFptUw9ValFik0S0zLBZE9aawjB+p6lBaIYLPAugaLM0QQEIEQd0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKyKBC06DhwCRBlehBH4loXxGa8zVBJDKD5oLFAr/SU=;
 b=Cnucl7tNMLptuEmIV35T6vvXXdN3pmT7Dkg3/i/7wbbk35Nue9dhFWITqAdDec2NM4GLV5DYrQ5g0nkLu3+8OWxlikR+7aWkBCHLmjvTgnoL4kI2v5kZtiLjb3fWexVD8hlhcIfu8yZA1AoEzIS6JulmTRulw1T5oUyqvC1kjlJbSGP2SMTGsVMNS8tFIss+TngT9fcpCG5Zf3pZSH6Bc978JxXPIXES2z/KENUbRDkefnMCH7HRWVRanAU+oqju/62TkPsvj5NkxYz2U6N2V0P2DxumwuJUiIlIkARd61nAppC9HvpTDHFaIouO+yyup3oUGia9BIHCYiquSKbFGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKyKBC06DhwCRBlehBH4loXxGa8zVBJDKD5oLFAr/SU=;
 b=AlO6JPT6Y2wBHxi686V01qZFLZfm/G7PdGmO/uu9rEt+5/n7GJ2q4/i/+ab4qIZdDCJJbWtiWzVshbGaa8HyIprl6gAtOpPGeOydBNfMZk/zjISQi8SLbnW9N/QIzjIyRaXyVYqxxkSfwgw1JE+w4gqFFlq8iFmJozM+tLIYtil7liWM02hEA56axcU/UIudKhMgy611gcJpqWJmH8N0RKNTftO04M/5sr+/SxCSg4QQeCoFK0vsbFXv5Ik/UKMHD/0Q+fJyNmb8JtyuqGUYzCGNntyXd9vMxU60aku4zw6bmNw/mkdwI0pJrbww7V0wXkW2gZS3W4VIZir4QCuJEw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3015.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 10:13:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:13:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Thread-Topic: [PATCH v3 06/13] mm/execmem: introduce execmem_data_alloc()
Thread-Index: AQHZ6gIemvXxoUb2LEiShTuWJhQ1PLAl6IqAgACM8oCAABuSgIAAFcIA
Date: Fri, 22 Sep 2023 10:13:25 +0000
Message-ID: <c92ded27-6e14-7265-c76e-76f4f2238a35@csgroup.eu>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-7-rppt@kernel.org>
 <CAPhsuW73NMvdpmyrhGouQSAHEL9wRw_A+8dZ-5R4BU=UHH83cw@mail.gmail.com>
 <9b73ad3d-cfda-bce5-2589-e8674a58c827@csgroup.eu>
 <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
In-Reply-To:  <CAPhsuW4_3oYhN6LnPPyBVA4VAM=7voXKmcJNKLqiNEUboq1rnA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3015:EE_
x-ms-office365-filtering-correlation-id: b58f6d78-cab4-4847-c89b-08dbbb548efd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2zVhOMplHLhuu5ZU6pbLh0mJW/K2PZADYGflAQI6z5DccBLWAtS394Ro0MkCoEeZ1zIOF5yZW+o8IvVdIZsOEXHkd+RuXQn2aR2vK1VI8qD+ZbjIAH+ywAqhAcBem0BF+4ewPaLy6WVNqit9YxrvltyJtKy+K4DwOYbigeZKoofyfzhg2/xrXr7mZHA/EsDt5MtL3102wYSPZODWe9/MKd+UY7jyT9G3sVApUun4NSeub+XkxIoqNGQzNsTt2HdloNGIKMwHfbfU+qAaomJ3S+TM2+xP6ez9HAb193EwMKG+IOvm6JP2NyjuNn0bWdvbIgkPG5HFm2ixY3Lsr3qpl/Ztf/UbB3h1cuq2Y6T9uB0LZvomIVF4xMf0sto7cKl/2yKZgdXkKRm7MBaIfO6c3GEN8BsBYrjeKGkCnFn9JwBnkKh/PaoBgpiTipjteZM125he68ofyXmKpDc0q5UTCGyLd/QsenRGa3Ed99jfjun9V8oQ983zoA30XkMedaX46qjkKOm0CuVnhuJ7n/Hx48jLkDRb9XdMkZ0rCrhxEJgyXBKWFWhLmw1saU/bol748dgHAKKZQPRcYuM0U3tQpc2PQA3v8ZHN/bI9/81XbzSZ9XJRB77apKmnphy0mWWYCs+0gKcNu8bn0Wk2gcRtZH5PEBc6pz9DmQWRpxm9kdz8WlEB1O8Lfo99G8NQ87sQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(1800799009)(186009)(451199024)(2616005)(26005)(6916009)(316002)(4326008)(8936002)(44832011)(8676002)(5660300002)(31686004)(122000001)(71200400001)(38070700005)(38100700002)(6512007)(6506007)(6486002)(53546011)(66946007)(76116006)(91956017)(66446008)(64756008)(54906003)(66556008)(66476007)(36756003)(41300700001)(2906002)(7406005)(7416002)(478600001)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cXJJdHdSeWMzYUpyTXVWeVZuVUZ0S2tzYm9FWkQ4bitudUZYMEVvcFdoUXRX?=
 =?utf-8?B?L1dvVmZveFJBWlg3aVljOFg2RHFkWWlCQmI1RWlnb24rRk5iSThTVWRtcUQy?=
 =?utf-8?B?QWtIV3BkMktqUHNkZzlaaXlkeENqS0VLYzB4QmRZYmg2QkFEcDVlZmRvbFZn?=
 =?utf-8?B?dnNpWW9vWHMyS09abnVhTGEyb1NlNXR2dlJsbEczSnBLbndBL0hsbHMyenBG?=
 =?utf-8?B?Vmd2MUNhMDRmSlMwUGtPZ0ROK1JiVytoekF1Zlc1NG9Zd1RhNzdaZmJHMmFj?=
 =?utf-8?B?dUt4Z0k5WFg0dXJwZURZOWhPRHlNcldnYVEzYkhXaHlFTjN5RFQyRXFQYThK?=
 =?utf-8?B?REFFTUJwUWF5aFJTdWJoZjdGb2NoOGxhbjQxcFNaQUJHT1FzVXhSODlqbkhW?=
 =?utf-8?B?Smpzenl6U3U0TkFJanJFdWpCeXE1UE1xRUxjTzRURERrazJoRW02UUNJVjhj?=
 =?utf-8?B?K0lObEdLV1B4ZG1RN0l0djVTbGEyb0I0bU8rOTlIZTA0aDlVRFVqbEI3b3F3?=
 =?utf-8?B?VWZXT3E1MlVmeFFuaitjV1V6OUZjM3RRNEdwb1ZPbHl4SlI1MDBEVGJ0YXl5?=
 =?utf-8?B?eXVZMWNpSFdLd3VIOEpGUHJDY3l2SXgxaXVMcWJ0RC84QWlheWxzNUErMlgx?=
 =?utf-8?B?MVpuZ3dLVnkyek56VTNFeTBSaDFtU1FYbzBIT1gzblIxVnVhWnIxTFN1RE5C?=
 =?utf-8?B?Szh1NUp4VGd2dk4xOTBEVG93TXkyS2VrREVMOUFlaUc5NGI0RysxWERXWGFp?=
 =?utf-8?B?MFQxVHVzR2NScDNjYnYwUnhzYmZUeW8zSlU4dWFJMHovcExjeWNvdXNHQlZ3?=
 =?utf-8?B?ZUtZMURETUNTbG1hbXhGTTFvS0NmRTNBakgyandxN3NNZVBhOEgwbW9vT0cr?=
 =?utf-8?B?cTc3N1pzOFNiZnNRcmoxMmJEano1VmNQVWtCTkRra0JOMmUyU2k5SUhKTjh5?=
 =?utf-8?B?Q3VzZUdqOEMyRXIyV0xRZHpQSHR5RkxydFh1aUVaQ1ZSM1QrZGlPbEE1VjlS?=
 =?utf-8?B?QlJHWVlLZ2MyT3JHK2pRYnk5bmJaanVvMVRpSDVUUjNpQmtPdkxNWHBFZ2lW?=
 =?utf-8?B?WTU1YWR2KzY3a1p2eVVHb3BsaU1JVXV3eFZBYU04MHhlN1ZQaiswYW9WOXEx?=
 =?utf-8?B?ZmN5MTZSaW9CK1FyclBvejYva0JIR0ExTEFyaVVuU0NPS2NOYU5aeUoyeWhv?=
 =?utf-8?B?blFjYXF2ZEx6N0ZmQ1dNamsvUktMclZRYkRBL0hYeFBtY0ZkeWdWRkxBVzJ4?=
 =?utf-8?B?WGxXeEF3NnpaTkhsQy9YNGNKMVJzWEFLd2dLT05CVUd2SDMzWG1aaS9lQlRh?=
 =?utf-8?B?cUVYNCt3Qm80WTdZUGR6ZGcyS3VzZGJ3c3VXb085dVVaVE5RcXRvd2puOWdW?=
 =?utf-8?B?eXdyYkJkYkZsQmF0Q2lKaTZLQlZoaTh2RVpzblR0YittWWlQeUord1h2d0p0?=
 =?utf-8?B?OGs1Z0VHdVQ4ck5SZGFrK0s2aDhIMFBnM3VYaHNpK3c4WjdoZkhXQ09UTmpX?=
 =?utf-8?B?dmlIakxsQloycnNXTHRzTzF5MUdET21XRmhNSnRldFVTeXBGb21DVzlxYUVG?=
 =?utf-8?B?YUFhaVU1bzFtWHI0VTBCMGtGYUM4SUFxMkl1UzRnOFdGcFNNVnRGakRzQmp5?=
 =?utf-8?B?cU4vWVdqbUt3aTRsNEFGbFdjSG9DODdCV3IwYVFxa1NkajZHOXVTK3I4VkpM?=
 =?utf-8?B?azFCK1JnS3hoYnNIMmlWYzlSVDQvRTA1SXdaMHlDdjRuQ2lrZzgyMkRYN1dG?=
 =?utf-8?B?N3JHaUZSME5zdjBmRnRnMmRucHJhOWMxcTBlRThTQTRDVU1nbXc5Rkd0bll0?=
 =?utf-8?B?M25qUXdMcURQTUF1b0tvOGtGbkMyYXQ2SG5pUTVsR05Oa2NzV1Mxd0g4SHVZ?=
 =?utf-8?B?RXFJenFtM2g4TzF2WHZ1aStjQXdOTmJ3MklJUGFWenk5TnhTRzNiY2tjRG5Q?=
 =?utf-8?B?TjFzOFovSDgwQ1hoNmJaVExGL0hTMWw5T25qWlZzNDJOeHY5SW5hTk52dHZu?=
 =?utf-8?B?VWtoRDhUajFrS05Gdlg3NHpOa3hDdldjTzJidjdEcDM0VDYvdTBUKzJHUkFr?=
 =?utf-8?B?QTV4TlVWTzgxcVFLMlNZZ2VqT0FCMDRBOS9pR05MV0kwMkVBKzJ2UmlMMEl3?=
 =?utf-8?B?bUF3UDdFSFlXZEVnSndyT3VBdFYwakNjaWx3UGVxbW5kR3VpekNKSWszNk82?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <332ADFD079FF3747B57CDDB034F24190@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b58f6d78-cab4-4847-c89b-08dbbb548efd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:13:25.3175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6Mgg6k7khJTD76ZUrLoIl4imKNqlDkWAY6OY+qYmqBYwFltJ9d1l6pXLipczywMoGyPKGDwSAWYg1IRva/hUpvwX953qfea5oyV0SPcvdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3015
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-
 arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA5LzIwMjMgw6AgMTA6NTUsIFNvbmcgTGl1IGEgw6ljcml0wqA6DQo+IE9uIEZy
aSwgU2VwIDIyLCAyMDIzIGF0IDEyOjE34oCvQU0gQ2hyaXN0b3BoZSBMZXJveQ0KPiA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+IExlIDIyLzA5LzIw
MjMgw6AgMDA6NTIsIFNvbmcgTGl1IGEgw6ljcml0IDoNCj4+PiBPbiBNb24sIFNlcCAxOCwgMjAy
MyBhdCAxMjozMeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6DQo+
Pj4+DQo+Pj4gWy4uLl0NCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZXhlY21lbS5o
IGIvaW5jbHVkZS9saW51eC9leGVjbWVtLmgNCj4+Pj4gaW5kZXggNTE5YmRmZGNhNTk1Li4wOWQ0
NWFjNzg2ZTkgMTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZXhlY21lbS5oDQo+Pj4+
ICsrKyBiL2luY2x1ZGUvbGludXgvZXhlY21lbS5oDQo+Pj4+IEBAIC0yOSw2ICsyOSw3IEBADQo+
Pj4+ICAgICAqIEBFWEVDTUVNX0tQUk9CRVM6IHBhcmFtZXRlcnMgZm9yIGtwcm9iZXMNCj4+Pj4g
ICAgICogQEVYRUNNRU1fRlRSQUNFOiBwYXJhbWV0ZXJzIGZvciBmdHJhY2UNCj4+Pj4gICAgICog
QEVYRUNNRU1fQlBGOiBwYXJhbWV0ZXJzIGZvciBCUEYNCj4+Pj4gKyAqIEBFWEVDTUVNX01PRFVM
RV9EQVRBOiBwYXJhbWV0ZXJzIGZvciBtb2R1bGUgZGF0YSBzZWN0aW9ucw0KPj4+PiAgICAgKiBA
RVhFQ01FTV9UWVBFX01BWDoNCj4+Pj4gICAgICovDQo+Pj4+ICAgIGVudW0gZXhlY21lbV90eXBl
IHsNCj4+Pj4gQEAgLTM3LDYgKzM4LDcgQEAgZW51bSBleGVjbWVtX3R5cGUgew0KPj4+PiAgICAg
ICAgICAgRVhFQ01FTV9LUFJPQkVTLA0KPj4+PiAgICAgICAgICAgRVhFQ01FTV9GVFJBQ0UsDQo+
Pj4NCj4+PiBJbiBsb25nZXIgdGVybSwgSSB0aGluayB3ZSBjYW4gaW1wcm92ZSB0aGUgSklUZWQg
Y29kZSBhbmQgbWVyZ2UNCj4+PiBrcHJvYmUvZnRyYWNlL2JwZi4gdG8gdXNlIHRoZSBzYW1lIHJh
bmdlcy4gQWxzbywgZG8gd2UgbmVlZCBzcGVjaWFsDQo+Pj4gc2V0dGluZyBmb3IgRlRSQUNFPyBJ
ZiBub3QsIGxldCdzIGp1c3QgcmVtb3ZlIGl0Lg0KPj4NCj4+IEhvdyBjYW4gd2UgZG8gdGhhdCA/
IFNvbWUgcGxhdGZvcm1zIGxpa2UgcG93ZXJwYyByZXF1aXJlIGV4ZWN1dGFibGUNCj4+IG1lbW9y
eSBmb3IgQlBGIGFuZCBub24tZXhlYyBtZW0gZm9yIEtQUk9CRSBzbyBpdCBjYW4ndCBiZSBpbiB0
aGUgc2FtZQ0KPj4gYXJlYS9yYW5nZXMuDQo+IA0KPiBIbW0uLi4gbm9uLWV4ZWMgbWVtIGZvciBr
cHJvYmVzPw0KPiANCj4gICAgICAgICBpZiAoc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQ0K
PiAgICAgICAgICAgICAgICAgZXhlY21lbV9wYXJhbXMucmFuZ2VzW0VYRUNNRU1fS1BST0JFU10u
cGdwcm90ID0gUEFHRV9LRVJORUxfUk9YOw0KPiAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAg
ICAgIGV4ZWNtZW1fcGFyYW1zLnJhbmdlc1tFWEVDTUVNX0tQUk9CRVNdLnBncHJvdCA9IFBBR0Vf
S0VSTkVMX0VYRUM7DQo+IA0KPiBEbyB5b3UgbWVhbiB0aGUgbGF0dGVyIGNhc2U/DQo+IA0KDQpJ
biBmYWN0IEkgbWF5IGhhdmUgbWlzdW5kZXJzdG9vZCBwYXRjaCA5LiBJJ2xsIHByb3ZpZGUgYSBy
ZXNwb25zZSB0aGVyZS4NCg0KQ2hyaXN0b3BoZQ0K
