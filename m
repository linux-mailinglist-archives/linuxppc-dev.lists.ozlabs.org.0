Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEF6A67D3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 07:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRQ6k2Qrxz3cDc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 17:58:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lFw3mGBx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lFw3mGBx;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRQ5l2yxPz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 17:57:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAoDpRO7OUuU1bBu1rrW/qgLuD5Y2AMQR3s3Hc2Vl+hsqYLlkdyoHO/d98UZFdkC4DW2yD7iwxSm/SVxfqsBt+MQTo0OTHX+Eoz/rYnXUosdXMCOu0rtmzNFe2t6bG+OkS0E+spjfKLcbnaCp91UThILSPZRzfuJIP6IKPRTDKIBGycmHxhZG1i8wO62rYTl2UJEKYVSeR8QmnT8X2RpTHMl0tCLULifuppgv3LVYH+WL73kqjAd9kW8t1XNawHhcPIYMA5vtsXSGgRvm/LZkHIt3X2drg73RU1lzGKF55jEW90A6lUI8kbwMY/VvmDf6LbLfdDjWgGZyT5Cn8WGGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hONVGiW+FNqYMXnA6Qw1x0ps7BhfXyX0PA+cL37SJLs=;
 b=MfMrR/1jaSP024DPYKmxeTnC7HDEsnfdjZC7HWmg2F6Hs3qBlupn8hfaRkG/QhQKF/rBSlsRHxkrzs68/jNJrNyUJQ9EHe43YMqVoxp/VLbwcXpsHhBkY8vuvZ08Em4Y8CncJbR5OARyR2D/In/VDISzL9Y/VffqgIt+BkTHVd0QuAxEjnAGKtH7DfJksM9yXuc6bbONnbFSAXeCgvZQ+xprkEAlzcHHSJtlcu2A4IHGXca3+RqQyeQd3RvxVfd/PEo7SPe+2SvBuxBw59/EAHcKuVDmcMNoH/E0j8kQoX8Ck0GKqtZBL9OHJ7tZ0CKcIt8kODwTHOOscHUx98MigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hONVGiW+FNqYMXnA6Qw1x0ps7BhfXyX0PA+cL37SJLs=;
 b=lFw3mGBxQgEdtLUiC1ACCbxNge/M2BjzZ7nGjI/VawHuxi77Kwgc7zgo9BAF2INP9HEv/N2F3+PZuqDu49Wy8Fp8PG+XCIcQhQMLYLOjz+dMadT3TdcPcqec3xmeiWir6b0lWOQqlWDB0ooL7BoLjGK/ZuCf6fCg07JiVP0XYNF07dEV4NEtHDX0XUi5cjxu7qJKtiQlXrhBLdaMeoKVlHUJQK/VeTf7vhLk5I6BsE5VoLcRPZ4sFuO+pjfqf0UvwoURS2ztrkNz0DVz+w6LrjrdEeUg21NhtO/72iaqtMXW0T0RiienJqMbitCbzOyTmHqGYiM1oXceabfgy9bsTQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1572.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 06:56:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%6]) with mapi id 15.20.6156.017; Wed, 1 Mar 2023
 06:56:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V2] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Topic: [PATCH V2] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Index: AQHYGLI/wUL5xxaoK0SUFxNJIc6Ho67n5J2A
Date: Wed, 1 Mar 2023 06:56:53 +0000
Message-ID: <1ea45095-0926-a56a-a273-816709e9075e@csgroup.eu>
References: <1643860669-26307-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1643860669-26307-1-git-send-email-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1572:EE_
x-ms-office365-filtering-correlation-id: 6532c328-04b8-4be3-ae6f-08db1a2223ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NFk27X8MHY4Wn88/fZ3Vi8ANvcAGwC+fIfA240V6idTu9e7CDfLBZEKniUlUMFT8PoXqw68OYjCIKfM2laZNXzIDlhallNnWqN9yNeI63Ay7iuZj09n4G6lSakHJ85NgWs8aW+CsEmP9SXfRYwkl+aH6zFLQTmndsP910mbXcGJiR11BBYlQAyw2Z7eeUj47F2wNBp8QKHwAiZSIDNXOmxdzAdNUgChQDQG/QcnAjKdGdJPsq2aFBtI1lZv6BLbQt2GszchuQpLQjJRyLDMiKlxi7rFy6WugeUrOZ3QaairLCoVncLYIVlezcXNNiyCT2f9iBw1h6GXeyLjH9xV4+o0bW/UggSbcVaAIlvEWfMucXUQCtB8UiE7eJS1C6mz+NFQVA8kSoX2rxtdGHhlZJhepvYgZ7XqSz7L3VNhcKyVEkW9oGbwJF/l+L86gvxuRkj8vqRwpvW7ebptflmqT5jayABIqTq4yp9a44wokqh5NXINWD58ngno5kNaN9lkAn16KHhVyaYJgsgCa1evpq++eRGSibQviDpKRam/AteZWek31fYFzhHVAbpDgglR6rdNWhrrha03DE7t4AaE+mTpl8p/wyfVTGDrDNyvcRvrisuBVItuVcZVCTSbYMTvckhWC9fKM2qMp+rnbJbtJfHFR/N53yMdokdwTc2x+bFSO74KKiVL4T/fElNs/Fqm8yMk6A80rBQIu6hXapRXl+bs+p9ebs65NC2HFE+tC6Kcebsi/rHGAF2w3cKxMO9ZmvopfJvIXK3lvhfr+3olVLA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(38100700002)(122000001)(54906003)(38070700005)(86362001)(31696002)(36756003)(44832011)(2906002)(64756008)(66946007)(66556008)(66446008)(8676002)(66476007)(41300700001)(8936002)(4326008)(7416002)(5660300002)(76116006)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(110136005)(91956017)(478600001)(316002)(71200400001)(6486002)(966005)(31686004)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZHNzVjdsM05HaHByWEdzMzU1Z3hhd0F0SVVBWW1qbUFtQzY1VGtLcE5QMjE3?=
 =?utf-8?B?Z0ZGNnVPRW9ORlRjZS9ud1o4c013eUxTSmNEK3gwT0daSUV5QVV1UHZwTnNu?=
 =?utf-8?B?bEt6OTFIQ0cyQ0pzdXIrTGF2UXhFcGs2dFMxRmFreU15cHRnNVM4Q2RkMnlK?=
 =?utf-8?B?SkV1YXRSYkVKaEhWSlNkWEg5ejNieE1zc3FMalZrb09nRXNLWXEyTzFxUllB?=
 =?utf-8?B?T3JsV2RxNStPU01mc3l3OE1qc2psdnBWeUIwMmdLVTZUYXZ2OHdzM2w4Wkll?=
 =?utf-8?B?YW5zeWhtR2gyM05tc2MvdDBtSUZJUE9SWGdEWjlwTmlCQ0UxMkpaay9hb3RR?=
 =?utf-8?B?ZWNrSVNQNHdvb2tMRm9rbU1Cb2FabGMwWjFua1ZIOUZkUUZ0TmNkNy9PYUNB?=
 =?utf-8?B?ajB5L2FNc1I4N0pJUXJ2aDg0cUlEeU8zQUlGRCtXa0lOTTcwVE55aVBEMEF2?=
 =?utf-8?B?M3ZnY1ArZGlKWGlEZmt2MDBra3JMN2JXM2E0dnVRK2Mrd3kwdmJHZ3BmWXRT?=
 =?utf-8?B?dXVhaWE3UFZNNnFYVU44SGI3eTZKTE9TUUVBQXNmL3JEQjhqUVpxVEthNzh6?=
 =?utf-8?B?K3lZdzE5N1l1alVJaEJ6N1lOaTJtSUFuNzdad1NKSFJ4bUZYVWx1L0tucEpZ?=
 =?utf-8?B?SHRlLy83c0VDOCtoTzRWSExpNHRkdVg4dHRZWStzS1JabFhuQStqZlEyLzZW?=
 =?utf-8?B?M292ZFlWb1k5NDNqbTlmUFNHWjEyRzVJMGZnMTlLOWEzNGQrMXhQMzJ0aG9O?=
 =?utf-8?B?RVRwb2Q5ME5UTmw4NUllSXovb2VyNXhlWjNYU3BZTzA0QWFxV0pwK0lWR2NH?=
 =?utf-8?B?czVBSmJNRGRJV3VIQlpIbkZvS3l2SVhiaWJxMnFIY1BqaTlPSUhmUzhwMWpV?=
 =?utf-8?B?TkljTm01bEl0bjFzbEcxSElSWUZwb2dXNVo5dEI0WUxmYWNhSWtseWNMdnlN?=
 =?utf-8?B?VkwzSGYyMHhxd0VpRVZob3E2ODJqUm5BVkJWczNOY1hLbDAzMFoxTG9Lb0x5?=
 =?utf-8?B?ZnlYT3k0VXphNUx5R1BieFhZejRBQ1NJUFcyTmxidG0ycDVxSzh4SHVWeUk4?=
 =?utf-8?B?OXpsV1BkM3NZY1ZVMkViR2tpcHM4VFBnd1BCOWRUbVlIOWE5MndER2g1dHpL?=
 =?utf-8?B?RFMwNVFsK1Z1MUI1UFRIbEhqRUFGYWppNVpFalZwQWFoSWlPSlJTM3djRW8w?=
 =?utf-8?B?Y1ZBQjlpaE42VHZVZzNZSE5XNkxzcTVmNzJFcis3a2Z4V09PNmhDek55TFNW?=
 =?utf-8?B?SGxFcm1BTS9MSnR2Wis0b3NoNkxDM1RPS29uMDBWRFpZTW5pWmNyQzZlS1NJ?=
 =?utf-8?B?Q0doaHQ2YkY0K25tVE5zUE1PWENqZm5MbmRLc2RUZDExeEVqUkF1TTlobjhO?=
 =?utf-8?B?bDhFdG9ZTWJzSHhubnVDSWZGOHV1SmpZSWRRY2UvMDFKUVJ0RVNSWXVzVGIy?=
 =?utf-8?B?dWxqR3FLcmJuaVNoZkpEMkpFZ3NMaG9LUjBJeGdpbG9ZZXh1UG9ZaSs5TE9D?=
 =?utf-8?B?cFZRUlk2UlpXSEtnejRxNlgvVHhDd2ZHQ01FRk5vUFJCTUFveitISzRReC9w?=
 =?utf-8?B?WUFTMHRiOTdJQUV0eXVxZGV0QzV5VVBqNmhuSWZpSTRLMHFJU1RkMVo4TWNT?=
 =?utf-8?B?eVp4bDlQckJTbUNmYVBvK1dreHNVSFhhZ25qbmlETG5TUmtzU1lHVEJvdWJ4?=
 =?utf-8?B?YmlER0ZBSlZvbVBxRmQ1Q0x2UVdpVXBnWnBrY0lHSW9rY0U3R25sSUVzd3o3?=
 =?utf-8?B?aVdkK2VBWjlJRGFTNUQxTmFURFpFMTJpWFZ0enEzYWNkUWZoMzRJOGx4WTZw?=
 =?utf-8?B?YmRETE9kVjVPcm96NjdUUkhCS0ZWbk1EY1oyRER6SHBhcjQ0M01DbHRpT2tT?=
 =?utf-8?B?TG5LS2cxSGIzSlh2cUoxeEkvaUFzOTd2dEVzWERoelorWE1zb3BRWGhrTWIx?=
 =?utf-8?B?Yjh2Zm1xc1ZVRnJwMCtQaEIwN0hheTA4TWhSVnI4eFhxcjVQd2gzUDdqTHpZ?=
 =?utf-8?B?WWJRODZhRGh1ZUVOeDJocjg0TmIzMUs1NkJKa0w1YkJSSUVIbGdRTWo2Q2tG?=
 =?utf-8?B?V241U3FWTmFoekdFMGxJQk5wbmV4Wmg0MFpzTmhBSTlTRTRJRUdrMnpyaFZi?=
 =?utf-8?B?SGJ1NG04cWNEdW1aYUhqQlhWV0VnRkROb3V6UUl2ZWttV2NaQTBPb2FNb2pj?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFDDF7491AD66348AC4C30B8CB6B464A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6532c328-04b8-4be3-ae6f-08db1a2223ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 06:56:53.3943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEdPftePamtmS7+phMgJ6kHG+RX8sNQjEHShu0k+GCMAvn58LbvpYT99bEWS7VbIQS1y4tz00UJrhQW5wNfFL7laEkg5QUkQNf7NlcqUfMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1572
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDAzLzAyLzIwMjIgw6AgMDQ6NTcsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0
wqA6DQo+IEVhY2ggY2FsbCBpbnRvIHB0ZV9ta2h1Z2UoKSBpcyBpbnZhcmlhYmx5IGZvbGxvd2Vk
IGJ5IGFyY2hfbWFrZV9odWdlX3B0ZSgpLg0KPiBJbnN0ZWFkIGFyY2hfbWFrZV9odWdlX3B0ZSgp
IGNhbiBhY2NvbW1vZGF0ZSBwdGVfbWtodWdlKCkgYXQgdGhlIGJlZ2lubmluZy4NCj4gVGhpcyB1
cGRhdGVzIGdlbmVyaWMgZmFsbGJhY2sgc3R1YiBmb3IgYXJjaF9tYWtlX2h1Z2VfcHRlKCkgYW5k
IGF2YWlsYWJsZQ0KPiBwbGF0Zm9ybXMgZGVmaW5pdGlvbnMuIFRoaXMgbWFrZXMgaHVnZSBwdGUg
Y3JlYXRpb24gbXVjaCBjbGVhbmVyIGFuZCBlYXNpZXINCj4gdG8gZm9sbG93Lg0KDQpJIGNhbid0
IHJlbWVtYmVyLCB3aGF0IHdhcyB0aGUgcmVhc29uIGZvciBub3QgZG9pbmcgaXQgaW4gDQpyZW1v
dmVfbWlncmF0aW9uX3B0ZSgpIGFzIHdlbGwgPw0KTG9va2luZyBhdCBpdCwgSSBoYXZlIHRoZSBm
ZWVsaW5nIHRoYXQgd2Ugbm93IGhhdmUgYSByZWR1bmRhbnQgDQpwdGVfbWtodWdlKCkgdGhlcmUu
DQoNCkFsc28sIGNvdWxkIHdlIGdldCByaWQgb2YgdGhlIG9uZSBpbiBtbS9kZWJ1Z192bV9wZ3Rh
YmxlLmMgPw0KDQpBbHNvLCBzaG91bGRuJ3QgYXJjaF9tYWtlX2h1Z2VfcHRlKCkgYmUgZG9jdW1l
bnRlZCBpbiANCkRvY3VtZW50YXRpb24vdm0vYXJjaF9wZ3RhYmxlX2hlbHBlcnMucnN0IGluc3Rl
YWQgb2YgcHRlX21raHVnZSgpID8NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBDYzogQ2F0YWxpbiBN
YXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4NCj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxs
QGtlcm5lbC5vcmc+DQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+
DQo+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4NCj4gQ2M6ICJEYXZpZCBT
LiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KPiBDYzogTWlrZSBLcmF2ZXR6IDxtaWtl
LmtyYXZldHpAb3JhY2xlLmNvbT4NCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcN
Cj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IENjOiBzcGFyY2xpbnV4QHZn
ZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnDQo+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IEFja2VkLWJ5OiBNaWtlIEtyYXZldHogPG1pa2Uu
a3JhdmV0ekBvcmFjbGUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8
YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4NCj4gLS0tDQo+IFRoaXMgYXBwbGllcyBvbiB2NS4x
Ny1yYzINCj4gDQo+IENoYW5nZXMgaW4gVjI6DQo+IA0KPiAtIERpcmVjdCBQVEUgZW5jb2RlIGlu
IGFyY2hfbWFrZV9odWdlX3B0ZSgpIG9uIHBvd2VycGMgcGxhdGZvcm0gcGVyIENocmlzdG9waGUN
Cj4gDQo+IENoYW5nZXMgaW4gVjE6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MTY0Mzc4MDI4Ni0xODc5OC0xLWdpdC1zZW5kLWVtYWlsLWFuc2h1bWFuLmtoYW5kdWFsQGFybS5j
b20vDQo+IA0KPiAgIGFyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAgICAg
ICAgICB8IDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRs
Yi04eHguaCB8IDQgKystLQ0KPiAgIGFyY2gvc3BhcmMvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAg
ICAgICAgICAgICAgICB8IDEgKw0KPiAgIGluY2x1ZGUvbGludXgvaHVnZXRsYi5oICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gICBtbS9odWdldGxiLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAzICstLQ0KPiAgIG1tL3ZtYWxsb2MuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvbW0vaHVnZXRsYnBhZ2UuYyBiL2FyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYw0KPiBpbmRl
eCBmZmI5YzIyOTYxMGEuLjIyODIyNmM1ZmE4MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9t
bS9odWdldGxicGFnZS5jDQo+ICsrKyBiL2FyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYw0KPiBA
QCAtMzQ3LDYgKzM0Nyw3IEBAIHB0ZV90IGFyY2hfbWFrZV9odWdlX3B0ZShwdGVfdCBlbnRyeSwg
dW5zaWduZWQgaW50IHNoaWZ0LCB2bV9mbGFnc190IGZsYWdzKQ0KPiAgIHsNCj4gICAJc2l6ZV90
IHBhZ2VzaXplID0gMVVMIDw8IHNoaWZ0Ow0KPiAgIA0KPiArCWVudHJ5ID0gcHRlX21raHVnZShl
bnRyeSk7DQo+ICAgCWlmIChwYWdlc2l6ZSA9PSBDT05UX1BURV9TSVpFKSB7DQo+ICAgCQllbnRy
eSA9IHB0ZV9ta2NvbnQoZW50cnkpOw0KPiAgIAl9IGVsc2UgaWYgKHBhZ2VzaXplID09IENPTlRf
UE1EX1NJWkUpIHsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hh
c2gvMzIvaHVnZXRsYi04eHguaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIv
aHVnZXRsYi04eHguaA0KPiBpbmRleCA2NGI2YzYwOGVjYTQuLmRlMDkyYjA0ZWUxYSAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9odWdldGxiLTh4eC5o
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHgu
aA0KPiBAQCAtNzEsOSArNzEsOSBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IGFyY2hfbWFrZV9odWdl
X3B0ZShwdGVfdCBlbnRyeSwgdW5zaWduZWQgaW50IHNoaWZ0LCB2bV9mbGFncw0KPiAgIAlzaXpl
X3Qgc2l6ZSA9IDFVTCA8PCBzaGlmdDsNCj4gICANCj4gICAJaWYgKHNpemUgPT0gU1pfMTZLKQ0K
PiAtCQlyZXR1cm4gX19wdGUocHRlX3ZhbChlbnRyeSkgJiB+X1BBR0VfSFVHRSk7DQo+ICsJCXJl
dHVybiBfX3B0ZShwdGVfdmFsKGVudHJ5KSB8IF9QQUdFX1NQUyk7DQo+ICAgCWVsc2UNCj4gLQkJ
cmV0dXJuIGVudHJ5Ow0KPiArCQlyZXR1cm4gX19wdGUocHRlX3ZhbChlbnRyeSkgfCBfUEFHRV9T
UFMgfCBfUEFHRV9IVUdFKTsNCj4gICB9DQo+ICAgI2RlZmluZSBhcmNoX21ha2VfaHVnZV9wdGUg
YXJjaF9tYWtlX2h1Z2VfcHRlDQo+ICAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L21tL2h1Z2V0bGJwYWdlLmMgYi9hcmNoL3NwYXJjL21tL2h1Z2V0bGJwYWdlLmMNCj4gaW5kZXgg
MGY0OWZhZGEyMDkzLi5kOGUwZTNjNzAzOGQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvc3BhcmMvbW0v
aHVnZXRsYnBhZ2UuYw0KPiArKysgYi9hcmNoL3NwYXJjL21tL2h1Z2V0bGJwYWdlLmMNCj4gQEAg
LTE4MSw2ICsxODEsNyBAQCBwdGVfdCBhcmNoX21ha2VfaHVnZV9wdGUocHRlX3QgZW50cnksIHVu
c2lnbmVkIGludCBzaGlmdCwgdm1fZmxhZ3NfdCBmbGFncykNCj4gICB7DQo+ICAgCXB0ZV90IHB0
ZTsNCj4gICANCj4gKwllbnRyeSA9IHB0ZV9ta2h1Z2UoZW50cnkpOw0KPiAgIAlwdGUgPSBodWdl
cGFnZV9zaGlmdF90b190dGUoZW50cnksIHNoaWZ0KTsNCj4gICANCj4gICAjaWZkZWYgQ09ORklH
X1NQQVJDNjQNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oIGIvaW5jbHVk
ZS9saW51eC9odWdldGxiLmgNCj4gaW5kZXggZDE4OTdhNjljNTQwLi41MmM0NjIzOTBhZWUgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvaHVnZXRsYi5oDQo+IEBAIC03NTQsNyArNzU0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGFy
Y2hfY2xlYXJfaHVnZXBhZ2VfZmxhZ3Moc3RydWN0IHBhZ2UgKnBhZ2UpIHsgfQ0KPiAgIHN0YXRp
YyBpbmxpbmUgcHRlX3QgYXJjaF9tYWtlX2h1Z2VfcHRlKHB0ZV90IGVudHJ5LCB1bnNpZ25lZCBp
bnQgc2hpZnQsDQo+ICAgCQkJCSAgICAgICB2bV9mbGFnc190IGZsYWdzKQ0KPiAgIHsNCj4gLQly
ZXR1cm4gZW50cnk7DQo+ICsJcmV0dXJuIHB0ZV9ta2h1Z2UoZW50cnkpOw0KPiAgIH0NCj4gICAj
ZW5kaWYNCj4gICANCj4gZGlmZiAtLWdpdCBhL21tL2h1Z2V0bGIuYyBiL21tL2h1Z2V0bGIuYw0K
PiBpbmRleCA2MTg5NWNjMDFkMDkuLjVjYTI1M2MxYjRlNCAxMDA2NDQNCj4gLS0tIGEvbW0vaHVn
ZXRsYi5jDQo+ICsrKyBiL21tL2h1Z2V0bGIuYw0KPiBAQCAtNDYzNyw3ICs0NjM3LDYgQEAgc3Rh
dGljIHB0ZV90IG1ha2VfaHVnZV9wdGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVj
dCBwYWdlICpwYWdlLA0KPiAgIAkJCQkJICAgdm1hLT52bV9wYWdlX3Byb3QpKTsNCj4gICAJfQ0K
PiAgIAllbnRyeSA9IHB0ZV9ta3lvdW5nKGVudHJ5KTsNCj4gLQllbnRyeSA9IHB0ZV9ta2h1Z2Uo
ZW50cnkpOw0KPiAgIAllbnRyeSA9IGFyY2hfbWFrZV9odWdlX3B0ZShlbnRyeSwgc2hpZnQsIHZt
YS0+dm1fZmxhZ3MpOw0KPiAgIA0KPiAgIAlyZXR1cm4gZW50cnk7DQo+IEBAIC02MTcyLDcgKzYx
NzEsNyBAQCB1bnNpZ25lZCBsb25nIGh1Z2V0bGJfY2hhbmdlX3Byb3RlY3Rpb24oc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsDQo+ICAgCQkJdW5zaWduZWQgaW50IHNoaWZ0ID0gaHVnZV9wYWdl
X3NoaWZ0KGhzdGF0ZV92bWEodm1hKSk7DQo+ICAgDQo+ICAgCQkJb2xkX3B0ZSA9IGh1Z2VfcHRl
cF9tb2RpZnlfcHJvdF9zdGFydCh2bWEsIGFkZHJlc3MsIHB0ZXApOw0KPiAtCQkJcHRlID0gcHRl
X21raHVnZShodWdlX3B0ZV9tb2RpZnkob2xkX3B0ZSwgbmV3cHJvdCkpOw0KPiArCQkJcHRlID0g
aHVnZV9wdGVfbW9kaWZ5KG9sZF9wdGUsIG5ld3Byb3QpOw0KPiAgIAkJCXB0ZSA9IGFyY2hfbWFr
ZV9odWdlX3B0ZShwdGUsIHNoaWZ0LCB2bWEtPnZtX2ZsYWdzKTsNCj4gICAJCQlodWdlX3B0ZXBf
bW9kaWZ5X3Byb3RfY29tbWl0KHZtYSwgYWRkcmVzcywgcHRlcCwgb2xkX3B0ZSwgcHRlKTsNCj4g
ICAJCQlwYWdlcysrOw0KPiBkaWZmIC0tZ2l0IGEvbW0vdm1hbGxvYy5jIGIvbW0vdm1hbGxvYy5j
DQo+IGluZGV4IDQxNjUzMDRkMzU0Ny4uZDBiMTRkZDczYWRjIDEwMDY0NA0KPiAtLS0gYS9tbS92
bWFsbG9jLmMNCj4gKysrIGIvbW0vdm1hbGxvYy5jDQo+IEBAIC0xMTgsNyArMTE4LDYgQEAgc3Rh
dGljIGludCB2bWFwX3B0ZV9yYW5nZShwbWRfdCAqcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVu
c2lnbmVkIGxvbmcgZW5kLA0KPiAgIAkJaWYgKHNpemUgIT0gUEFHRV9TSVpFKSB7DQo+ICAgCQkJ
cHRlX3QgZW50cnkgPSBwZm5fcHRlKHBmbiwgcHJvdCk7DQo+ICAgDQo+IC0JCQllbnRyeSA9IHB0
ZV9ta2h1Z2UoZW50cnkpOw0KPiAgIAkJCWVudHJ5ID0gYXJjaF9tYWtlX2h1Z2VfcHRlKGVudHJ5
LCBpbG9nMihzaXplKSwgMCk7DQo+ICAgCQkJc2V0X2h1Z2VfcHRlX2F0KCZpbml0X21tLCBhZGRy
LCBwdGUsIGVudHJ5KTsNCj4gICAJCQlwZm4gKz0gUEZOX0RPV04oc2l6ZSk7DQo=
