Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6ED567EAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 08:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld8st1fbfz3c3m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 16:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y0mwfAsC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.49; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y0mwfAsC;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90049.outbound.protection.outlook.com [40.107.9.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld8s415Xcz3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 16:34:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5nwkvGXkkD1GQYrBGYlHyPp7cpczPHrdln/T/XdTOxAjtQt4hk8Jb4mFqgjYxQh2klEYD2JCcR6wsvuwNAg3u1alAItwTWioSHevzIWqVH19JXyDwQ/d7NB1V2Fxm/UfFOohMCDd7Xz3SvBoQrycBHutL4qNtlhrSzMpKjXciPPhlqpIeJZCS2RR8cAnplRtC8YFENNe32aWI4DBFtiD3e630vPFI0O32c+WeuAw5sg87KIaYO6VJKtdg1PZpygnx1KaG+sX+1wTJtnCuOT4hc2Bw6RxS2tuwvlBssh1quW7k6PgKGeFeSumPjZo0tEGImCr7vP6aP//N6UdRiuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FETxS6m5pMpiAywRCkHcdMZcm3B6ihvtY5VkyyCMqzo=;
 b=dDgrXlmOKSATL+8cPKHX7do8kOo0F5KTzJmbyLeI1qjr1K6MaBatyPkpVGTgkylXkY9Lh12Lnu9DuhJiOeYWndR0aSCIdE6iF8kGbJ1ZWyk9G4RkoV2QHUZGf3cNVh6FbbwbCnLGth9SSvKB6zt4VdtJcPQLT/hy2qNXs9b2qGS3fdswsJtR9Yu/m/hLKZ0Ri9BOo9r5mMGZwq8U6+gSCr4ACERbL5/D44b3rxVmki8XZWGFgZJJTbSuKXixJ/RZi2yFuJtMfTjLLKn/utFr5OVux320d2vaOLwgqhrvCUkWvu7hlkbd3a+wTWCE2Syt039/t/vY9Zyz8BcsmQ3OUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FETxS6m5pMpiAywRCkHcdMZcm3B6ihvtY5VkyyCMqzo=;
 b=Y0mwfAsCpEudFGvnxfZBlpT1iR4hCrXl38R+aD5GKZ5h3h/tkE40jsjeiz9W/j5ScQ999uvtHxektv9k96QTu57qeIqsNfTrXojC04fzdpGdq5gEui2UACfuTwlsUptfq8+ifOyOtN64ALPspNYvUWfHkNFhFY7fVO0eD+75OVUdailTqZqheoJ3ilvRVJvz8udIXM2/hXQ2roiQWpBywPXAwhavnIYYjzvV7Frrst1kmpBCmeoevu/H1dNRjFxN/9QXxhw6r7vP4pam63yG/T4+ZwtyqiDtBLuXr7NC4yvFJaWAM1HgGlou1cIHIBzYfaAakCL2uwj3yjYvWMELUA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3208.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 06:33:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 06:33:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Thread-Topic: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Thread-Index: AQHYjECZjgPlbSCGyESOucXho+/+Za1w4i+AgAAKCQA=
Date: Wed, 6 Jul 2022 06:33:54 +0000
Message-ID: <85fff3f6-373f-3e6a-325e-0fa8ad46273a@csgroup.eu>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
 <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com>
In-Reply-To: <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 035ff66d-cb88-481f-8aa8-08da5f197f89
x-ms-traffictypediagnostic: PR0P264MB3208:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BtUgJokN2UjIYsv2Oq2No+1DwYbjdwj371vou3mEDEDT/UXm1hLFFvTGEOFen2HDd5mINYq7BU7FGIFYanENYZaOIJSz5RhnJRc7m5ktavW35Ls6xj1czy0/jP9JHTiZe91Wrp45Azb/xTRY+O7It8lywoGDnsQ9N/kG44p/vtlfN8BqT5gm4QuYfmJnZnrGUzyz+b2KltxpzmVJqAEDUSkmROUFwDBTcNexCEOuneW9igsYt8nLUId97rytHAvMIjjLOrzUql/gADf9/EIJwsBW8M6hld5/o3HaGZ/cz4LQ6aPR6/dKFAH+Rr0+nkSy44fPvdo2vGossgdjyilynbzVcX705WxPZmWPTgM5UAP/8S8CmW4hLo788Tx9/BxrstWECQ6on4ZjssEuHKljkCXdNXQigiB3+W2qb9ZCGSHA7pxoojxCFGnXWeiAqvIId4DGdBetShiLFzNaFWNm1R7sfLf6mnTfJ74Fuv6a+tuWQTepCOW3eRUxdWpoKrhJ7eZB4ade7WkyYz9TQVb4/Mg+oLp3tx7YvjnOksD/A+/wd01RG7cT0L7crlQ6K15eMZ/j1nwRUHLnZiTW01ifJFFqnilXMWvl52I0YQ1mSNpdzAwvfFKVLNp5oOqqyXugiZ8VRY3EaMMqU13SohUiu4WcWVvH/vTxgWOft8NCxvbntXfeMN/Plk/3bqMBHys6OcbmmIshuGLB7HGpknPopw9RG9H6mANZcrWz+EKu08tbmEIjwMsVhDsVFKKSP10MgO9+8aVZ7F9sL0Xl+gLpDi5MDLR4gjuj633U5sqY2olKYfUpZ5iCbaWcxIi1Urxpm8uYR4AdIrB8Sa95EdspXQSs4HeyduPjOysk95AFZAVjiwb833bzh6/FgCgbslDS+l0HptkAx5Mo0ikH4pc85KCIrJTd47Zs7ReMSI67IAQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(66476007)(83380400001)(186003)(66574015)(71200400001)(76116006)(66946007)(66556008)(66446008)(64756008)(8676002)(4326008)(31696002)(86362001)(478600001)(6486002)(966005)(7416002)(8936002)(5660300002)(44832011)(26005)(38070700005)(122000001)(38100700002)(2906002)(41300700001)(2616005)(53546011)(6506007)(110136005)(54906003)(36756003)(31686004)(316002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SXpzeDByN0VIcHRaNkx5dk16UCsrL0FBdjMxa1RHa2h4WjExY1YwVDNiNURU?=
 =?utf-8?B?SVpEVFlCMkZreG1VVzc3QUFTUW9MOENiNzMxbCtOVkc2N0RFNkk2bmtSR0hI?=
 =?utf-8?B?eFBkU015Q1dJL0ZVazBUZWN4OXRkdkdTRk8xbHRIWFQ3a1B0eldPeWRxRkhs?=
 =?utf-8?B?aVQ4S0wwcUJEWmlRY1g0KzU2RGRDN1p1WHJCSFgwdXdPb245QnFCYkRCSTZG?=
 =?utf-8?B?RkhhNmpxMDFiRDB4TGZLNXZYUEtyS1o3RmdUNW95N0ErWDREZC9Tc0VOd2hG?=
 =?utf-8?B?ZitEOTg5elJlL1M2ZU1JWm0raU9ybXdOWk9vTE9NN1RuL0hob0Yrd3gzS2Ny?=
 =?utf-8?B?MmhBUWJRYnpjeXg3cWdxUWlJQ3hmempLRnVJYTBFTlJaaGViQ04xZUtVdms4?=
 =?utf-8?B?Z080MTh0bTNpV0xvY09lYmZONFViZE9yWWdkempJWU45NXp2WDc4TEpvN1kr?=
 =?utf-8?B?Nmw2Z2hRQzZVMUN2czVCOUtPcjl5RDhJVlVkTnNmWXNWSmVZK1IrY1ZIQWtK?=
 =?utf-8?B?eGVUdVJjb3hmbldpWTdlMFlwK1hjUE11cDlQcy80NWlPeUZpNXdXR0ZSZ1JX?=
 =?utf-8?B?REZiUFkrd3lURzZJYWdpMFFDcC9QRUZxTE1qUVVNWGZaVmorblpnOEFNYnpo?=
 =?utf-8?B?b0pjdVU0ZzVydTB1TFlmUUlhS3FEQ3dMN3JnYllBaEI4dk84aGZQSXBCZDZx?=
 =?utf-8?B?SnF1ZFJXTTFyTWxrTHhpS0NmTzVXeUpvbUVLMGFEckIvSVQwcmIzeFZUZzd2?=
 =?utf-8?B?SmJYNUJiN09wdFdqNVliQ1FnR2VkbkRLYmR0OWNGb3B3MHR3SEpISWVmdXFr?=
 =?utf-8?B?TkltcnVGdldDOWY1clowNmVkRGlldDF2MkRQZ0pPMnVYQ0xXdnVBeVhpT21J?=
 =?utf-8?B?eVF3bkprNTBaWG03NjNCVVBDYU0wdUNQSktjTVlOeWRPS1d4L0p1M1ZQK0pF?=
 =?utf-8?B?T2dQVzlpZDN3TkxoUjZBT1llWWQvZ3BMSUlPRW1KTDdsMlFkTU4xeWNtOUgv?=
 =?utf-8?B?RHVZbGFaZEFuMk9PNnRmTStmbHNxZDhOWHNhQUZtTnB4b1ppWHVRdmQ3bXJZ?=
 =?utf-8?B?Q3N2TUdXQkUvS2pVWTlBMVJiQ21IZjIyWGpVVEVvWEZqTVBwdGExQVNRR05G?=
 =?utf-8?B?SzFiNmtnWXRhQXJwVmpkdFNyRVVYM1VkMVpCdlRqd2FDSjFFM1VUYm12MU5X?=
 =?utf-8?B?LzJRU1hPaTVBMlRYc2puVWVFMlhkUVJhQUgrZVdqMGRiNmVGNWU0ZmVGL0hy?=
 =?utf-8?B?VzN1M09DUmMvS1hFUXhJUnNNanhkQjUvbU5oVHBUUnhhNmZYbTQxZjZSSEZv?=
 =?utf-8?B?OG9Va0ZTbmZVY1R2Z0I2eGM1dzRTYW5VV093elpUWDhOTVBFcDBFM1ZOYmNj?=
 =?utf-8?B?RUFpajlra24xN1Rvb1E2RFlRZHA1N3lIU2NLRWIyaExOOW5yRE9CR0hkcHJM?=
 =?utf-8?B?YUlzN2NWakdTb0kvQkIzVFloNzV1aEdNNlpPdi9DUFAvbWpIdGN1UHJSK2Rk?=
 =?utf-8?B?MlJJUzRjMUxmQ1BIMERldUx6bmI4b1BnZDlSbVRlK2VqNS9PWFJOc25UbTA1?=
 =?utf-8?B?bkxKM241Yi84QVV3MmM1dWgwTFlmK0w0bEZHa2VuWWsvN2w5a3hFQnh0VUFu?=
 =?utf-8?B?dFBZS0dFek0vSFJ5cUFpL0FKQUt2alFCaEEvSXArdDZlMFJHb01EYUVQMXgv?=
 =?utf-8?B?UVpGMUVlQ3pVUDh0OGhsSXJ0VWVjSEFVYlQrRDdFNUlJZVVDaWg3MUpDdTVR?=
 =?utf-8?B?N3RpbENrU3drVWlpaHBESXJyaEFybzQwNy82Q0F2OGttS1RPVTBWbjRVN1VO?=
 =?utf-8?B?Q00vZGFtQXBHelk0akZ1WlBWVDQrNFduU2Q2dXFkMXJyaVBxZ1VsTVFQKzBQ?=
 =?utf-8?B?WWpmOXplUkhQcm92ZlE5RnErWHFHZnVOemE0aTRxWU1aMVU5OTJTbEluWkhs?=
 =?utf-8?B?a1BnRnJTZVByUWhhN0M2UkRpR3U3aHlkbGl6Qzhqd0g0a04wbTFjTkY0bkk3?=
 =?utf-8?B?eHJLbExHbFlxZlFPZlE1TEMxdDNMNDZMNTJzTmFnS3AyUVVIZzN4aVVERTVq?=
 =?utf-8?B?TlY2Z2RyWXIwSzR1MmNCV0tCVGxzWG51SmEzNzNQNXlXQzFXT3cvU3VUZjM0?=
 =?utf-8?B?NkFPTXhRM1FCVlFSK2FSMlYzWS92Z0VUKzV5S1NFZFJ6T1FpcThaZVppTWt5?=
 =?utf-8?Q?ZqcqhNm74t7bkEKHHZpTpH4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <024B59B09062C9438A9C98D87CECC38C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 035ff66d-cb88-481f-8aa8-08da5f197f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 06:33:54.4731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trJHFUP1UEVPyGTWKmCTFXGQO56/cYvxhz8GRWjO7ZIdLBMEE5Mer7Im/LPKBxf/OjDC5cbYdyNcITTz6Vxn4OWjv/8rtUTA4/EQEWk2TWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3208
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.i
 nfradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA3LzIwMjIgw6AgMDc6NTcsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IA0KPiANCj4gT24gNi8zMC8yMiAxMDo0NiwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6DQo+
PiBfX1NYWFgvX19QWFhYIG1hY3JvcyBpcyBhbiB1bm5lY2Vzc2FyeSBhYnN0cmFjdGlvbiBsYXll
ciBpbiBjcmVhdGluZyB0aGUNCj4+IGdlbmVyaWMgcHJvdGVjdGlvbl9tYXBbXSBhcnJheSB3aGlj
aCBpcyB1c2VkIGZvciB2bV9nZXRfcGFnZV9wcm90KCkuIFRoaXMNCj4+IGFic3RyYWN0aW9uIGxh
eWVyIGNhbiBiZSBhdm9pZGVkLCBpZiB0aGUgcGxhdGZvcm1zIGp1c3QgZGVmaW5lIHRoZSBhcnJh
eQ0KPj4gcHJvdGVjdGlvbl9tYXBbXSBmb3IgYWxsIHBvc3NpYmxlIHZtX2ZsYWdzIGFjY2VzcyBw
ZXJtaXNzaW9uIGNvbWJpbmF0aW9ucw0KPj4gYW5kIGFsc28gZXhwb3J0IHZtX2dldF9wYWdlX3By
b3QoKSBpbXBsZW1lbnRhdGlvbi4NCj4+DQo+PiBUaGlzIHNlcmllcyBkcm9wcyBfX1NYWFgvX19Q
WFhYIG1hY3JvcyBmcm9tIGFjcm9zcyBwbGF0Zm9ybXMgaW4gdGhlIHRyZWUuDQo+PiBGaXJzdCBp
dCBidWlsZCBwcm90ZWN0cyBnZW5lcmljIHByb3RlY3Rpb25fbWFwW10gYXJyYXkgd2l0aCAnI2lm
ZGVmIF9fUDAwMCcNCj4+IGFuZCBtb3ZlcyBpdCBpbnNpZGUgcGxhdGZvcm1zIHdoaWNoIGVuYWJs
ZSBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9ULiBMYXRlcg0KPj4gdGhpcyBidWlsZCBwcm90ZWN0
cyBzYW1lIGFycmF5IHdpdGggJyNpZmRlZiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UJyBhbmQN
Cj4+IG1vdmVzIGluc2lkZSByZW1haW5pbmcgcGxhdGZvcm1zIHdoaWxlIGVuYWJsaW5nIEFSQ0hf
SEFTX1ZNX0dFVF9QQUdFX1BST1QuDQo+PiBUaGlzIGFkZHMgYSBuZXcgbWFjcm8gREVDTEFSRV9W
TV9HRVRfUEFHRV9QUk9UIGRlZmluaW5nIHRoZSBjdXJyZW50IGdlbmVyaWMNCj4+IHZtX2dldF9w
YWdlX3Byb3QoKSwgaW4gb3JkZXIgZm9yIGl0IHRvIGJlIHJldXNlZCBvbiBwbGF0Zm9ybXMgdGhh
dCBkbyBub3QNCj4+IHJlcXVpcmUgY3VzdG9tIGltcGxlbWVudGF0aW9uLiBGaW5hbGx5LCBBUkNI
X0hBU19WTV9HRVRfUEFHRV9QUk9UIGNhbiBqdXN0DQo+PiBiZSBkcm9wcGVkLCBhcyBhbGwgcGxh
dGZvcm1zIG5vdyBkZWZpbmUgYW5kIGV4cG9ydCB2bV9nZXRfcGFnZV9wcm90KCksIHZpYQ0KPj4g
bG9va2luZyB1cCBhIHByaXZhdGUgYW5kIHN0YXRpYyBwcm90ZWN0aW9uX21hcFtdIGFycmF5LiBw
cm90ZWN0aW9uX21hcFtdDQo+PiBkYXRhIHR5cGUgaGFzIGJlZW4gY2hhbmdlZCBhcyAnc3RhdGlj
IGNvbnN0JyBvbiBhbGwgcGxhdGZvcm1zIHRoYXQgZG8gbm90DQo+PiBjaGFuZ2UgaXQgZHVyaW5n
IGJvb3QuDQo+Pg0KPj4gVGhpcyBzZXJpZXMgYXBwbGllcyBvbiB2NS4xOS1yYzQgYW5kIGhhcyBi
ZWVuIGJ1aWxkIHRlc3RlZCBmb3IgbXVsdGlwbGUNCj4+IHBsYXRmb3Jtcy4gV2hpbGUgaGVyZSBp
dCBoYXMgZHJvcHBlZCBvZmYgYWxsIHByZXZpb3VzIHRhZ3MgZnJvbSBmb2xrcyBhZnRlcg0KPj4g
dGhlIGN1cnJlbnQgcmVzdHJ1Y3R1cmluZy4gU2VyaWVzIGNvbW1vbiBDQyBsaXN0IGhhcyBiZWVu
IGV4cGFuZGVkIHRvIGNvdmVyDQo+PiBhbGwgaW1wYWN0ZWQgcGxhdGZvcm1zIGZvciB3aWRlciBy
ZWFjaC4NCj4+DQo+PiAtIEFuc2h1bWFuDQo+Pg0KPj4gQ2hhbmdlcyBpbiBWNjoNCj4+DQo+PiAt
IENvbnZlcnRlZCBwcm90ZWN0aW9uX21hcFtdIGFycmF5IGFzICdzdGF0aWMgY29uc3QnIG9uIHNw
YXJjMzIgcGxhdGZvcm0NCj4+IC0gUmViYXNlZCBvbiB2NS4xOS1yYzQNCj4+IC0gQ29sbGVjdGVk
IHRhZ3MNCj4gDQo+IFRoZXJlIGFyZSB0d28gbGludXgtbmV4dCBiYXNlZCBidWlsZCBmaXhlcyBm
b3IgdGhpcyBzZXJpZXMgKGxpc3RlZCBiZWxvdyksIHdoZW4NCj4gdm1fZ2V0X3BhZ2VfcHJvdCgp
IGdldHMgcmVkZWZpbmVkIHdpdGggIUNPTkZJR19NTVUuIFBsYXRmb3JtIHZtX2dldF9wYWdlX3By
b3QoKQ0KPiBpcyByZXF1aXJlZCBvbmx5IHdpdGggQ09ORklHX01NVSBlbmFibGVkLCBvdGhlcndp
c2UgdGhlcmUgaXMgYSBnZW5lcmljIGZhbGxiYWNrDQo+IHN0dWIgaW4gaW5jbHVkZS9saW51eC9t
bS5oDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA3MDUyMjE0MTEuMzM4
MTc5Ny0xLWpjbXZia2JjQGdtYWlsLmNvbS8JW3h0ZW5zYV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjIwNzA2MDU0MDAyLjE5MzY4MjAtMS1hbnNodW1hbi5raGFuZHVhbEBhcm0u
Y29tLyBbc2hdDQo+IA0KPiBJdCBkb2VzIG5vdCBzZWVtIENPTkZJR19NTVUgY2FuIGJlIGRpc2Fi
bGVkIG9uIG90aGVyIHBsYXRmb3JtcyB0aHVzIGV4cG9zaW5nIGEgYnVpbGQNCj4gZmFpbHVyZS4g
QnV0IGp1c3QgdG8gYmUgb24gdGhlIHNhZmVyIHNpZGUsIHNob3VsZCBhbGwgdm1fZ2V0X3BhZ2Vf
cHJvdCgpIGJlIHdyYXBwZWQNCj4gYXJvdW5kIHdpdGggI2lmZGVmIENPTkZJR19NTVUgPyBJbiB0
aGF0IGNhc2Ugd2lsbCByZXNlbmQgdGhlIHNlcmllcyB3aXRoIGFib3ZlIGJ1aWxkDQo+IGZpeGVz
IGZvbGRlZCBiYWNrIGluIGFzIHdlbGwuIFBsZWFzZSBkbyBzdWdnZXN0LiBUaGFuayB5b3UuDQo+
IA0KDQpBcyBmYXIgYXMgSSBjYW4gc2VlIGluIEtjb25maWcsIENPTkZJR19NTVUgaXMgdXNlciBz
ZWxlY3RhYmxlIG9uIHRoZSANCmZvbGxvd2luZyBhcmNoaXRlY3R1cmVzOg0KLSBBUk0NCi0gTTY4
Sw0KLSBSSVNDVg0KLSBTSA0KDQpBbmQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBvbiBYVEVOU0Eu
DQoNClNvIEkgZ3Vlc3MgQVJNLCBNNjhLLCBSSVNDViwgU0ggYW5kIFhURU5TQSBzaG91bGQgaGF2
ZSBpdCB3cmFwcGVkIGFyb3VuZCANCiNpZmRlZiBDT05GSUdfTU1VICwgb3IgaGF2ZSBpdCBpbiBh
IGZpbGUgdGhhdCBpcyBub3QgYnVpbHQgd2hlbiANCkNPTkZJR19NTVUgaXMgbm90IHNldC4NCg0K
Q2hyaXN0b3BoZQ==
