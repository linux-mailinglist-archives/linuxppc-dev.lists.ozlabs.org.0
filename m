Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1E74DC38
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:21:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IKmKe0kC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R09m46Z65z3c33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IKmKe0kC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09l96d8Mz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 03:21:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W92rku/CcLFKdOt2KVbjgoKYJjpw8nsl3RSl+gajOlcNqxcNPl6qX7Luw9AKtl/Vr0CdAbHQeZXiQ8e6SYsIFQwGcQtHSDGpI9aMfL2q8cTSFFUVDXxTGEkOtF5ANDhGaLaLf3AJA8Vw5jZbaoMVDV0IxxxvsOTV8S54AFeDt6PthQEc0W9LU6a6eVP714pJC+vgemZsnVCnl2uaLX+iq0Z09aqmNQhWmQiwG6wpTgr7fE7GnPQfg2q8bLKI1wBO5ugU/teRyofb/6vskT63U23WGEUw4CLPBIt61JcfSLM7y3hFcqBgcaQN1/nwf9Pfc7/kSB9bChtJgWpdJdAbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDkqTCGe9/nSlGzRE7kHGFarbwYE635zB80hLEpkLKs=;
 b=MKhUjoVPdJkxLYVLhVLVhPqRCFaj946rCTvrrPp85xFBavjTsNgrgLCPT3vLlqTooMHT+j57NNdI+O1HkMItbcOV9YBCxvcv8ZQIzS81G2elnCqpZ03l2n0PovY5enp+61/i4p0/TmEOf4C19dryHZIGmVxj/QB8qN5Zra/tt83ghFYpO0xlmv6S8mchuOhsj1q6HamAPPWDR6452HdxGJNvxEBwH33tm+yzxzWAvZhL3BBwSHbtQTdVmmEzOMXM5d8skAazHcjZMlEIru+ruq7vVWI6l7C+/b3kSg/z8+qEix1gqDkcsiNDsPR5HJLr2QvO/cVoyJoSXpUV7N86Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDkqTCGe9/nSlGzRE7kHGFarbwYE635zB80hLEpkLKs=;
 b=IKmKe0kCX/ZU4oHMMJ1Z64QbWc8hxYVcZpoR4s4Led2HrgU/yGIlUUhyilbkdvPBCqW9DNduwfMhZQ0SO7wz2AqbMmS4i46BPImjao8xBaP3XMEur451BA0j1+0DTbH0uwFKQb1+c4AOSA4sAA1eYf9hXcc7i+WQs92+eG2sBsSND9QNHSpKwy/SOphQ+8WMP5RLROfmrcW0k5eRKWK9Skcch6rI3qToYSvwZAggWYS5MTHxhvUXFb+K5rhjSmShb6awphDeXm0rTB9w9pE2DYqjbNUjf0ca4KZl3SjDymAumn/AkmzNqcEkWkbFPlaEBIpNQaIBc+AvGLQys5pEMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2956.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 17:20:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 17:20:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v4 03/13] mm/vmemmap: Improve vmemmap_can_optimize and
 allow architectures to override
Thread-Topic: [PATCH v4 03/13] mm/vmemmap: Improve vmemmap_can_optimize and
 allow architectures to override
Thread-Index: AQHZs0jj5ciqoc31K0+cLkjZjpjLea+zPywA
Date: Mon, 10 Jul 2023 17:20:49 +0000
Message-ID: <baba8fee-07dc-251e-3e26-a860d67c26a9@csgroup.eu>
References: <20230710160842.56300-1-aneesh.kumar@linux.ibm.com>
 <20230710160842.56300-4-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20230710160842.56300-4-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2956:EE_
x-ms-office365-filtering-correlation-id: 13f95ceb-7078-4585-c052-08db816a01c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yeSbVJCpoYRM4VR7cKK+JbZVpPJjhQ8hw+rjw2ps6lXFR45YY5i61ogibLx/g5CoypV8G/sP2gIb1jVrNdOJAnSGlTgGSDfdzfFp8KFShGMsSdsGtv2Ji4DFrhSiXj7dBg+6cIyLYU72VWhQ7IHleyr7la8u54YgnqjG0FNGEyiM3KfqRyJncir/l0ApaI2nTc3I1amW79yFTcPzONNuVmWYoU10i7xHF9UDMyHS6sAeWsIlcPdARonSbZr7wJXqG6fyPzz3QjlOQVLbW3aTugHETXbPFo+LO6tIRE97MEHSpBEwSmvVBlbgBNMByEreU9a7HF1fJDNFfUYXwpNBIiMFc3o7yhXWJtFgsuaa9ld7AZmSI674OCFn9S+QkoGODxHpfqJfkndpolFnRk5NVnGt8C8Oy25tmTgm/HgugNlbgW5q8lUhbmA8awI2v9QDU5rY/XiMcjzXbWqwVAcwro9XNZDqpfXeuJlijuUPDbPCPNzwsGsjMNXtR/CKdhcZG0h2GT/4iAj23Ux2FE1hY8rUkKRN0icmyWKhxPz+3Mc/GxTQadvfkdYYoFMGsIdNlngCreOWtphvL18uMuMoA9BSGbeHNFb+YsTF0SVbxfr+0f4t2jDYJ3iFM/MDpq5V4qxmGOT5CJd3cId6L0PdLD4NIc07DRAIXVKpN43IMqe+GyN7UXeq024IY8H9iV6I
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39850400004)(136003)(396003)(451199021)(86362001)(38100700002)(38070700005)(31696002)(31686004)(36756003)(6486002)(76116006)(110136005)(54906003)(71200400001)(91956017)(122000001)(26005)(186003)(6506007)(6512007)(2616005)(44832011)(7416002)(5660300002)(316002)(2906002)(66556008)(478600001)(66946007)(8936002)(8676002)(83380400001)(4326008)(64756008)(66446008)(66476007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bUtRKzRBTkxlYzcyZEc1YUJaZlRZZEJMbUtrYVhENzVJZTNmYWtKd2VzYmFN?=
 =?utf-8?B?SDB2ODFxOVJkZW4wWE42YVpoZkZFWlRHdzFmY0lsdDZlWmk5RlRiY1ExRXZM?=
 =?utf-8?B?dmo3ckFnUVp0N3pEQjdxQVl2dDJJYzJiV0hvQWF4KzdmYXQxRTNsaHVnNnNC?=
 =?utf-8?B?bDdtL1dSN0Z2VnBLSUFuUUpOMG1Pc0dvc3hmVTFjR2Ztb3RpM0lIVWZYS2NH?=
 =?utf-8?B?Q3JFN3hJUzhpdkFXK0FaZG84aEpYc3k0UTZ5L2xJMVlMU0lQK0ZiOWtDQldV?=
 =?utf-8?B?VWRrYWZMalBUbzNCYW9aUXdmOGR2OS90M21PVXVscEhWVXNWUDJqd3R1Rmsr?=
 =?utf-8?B?ckhqQUVpWVZPZVpMTzRic3gwaWJTSVRtTGM2MHBNa2RuLzVoZkZZZktmWlhq?=
 =?utf-8?B?NloyeVZ0d1NyWnBwekcxUnBLTHFmOVdtTTNDelVla3A2NXZBSkdEOUZBeSs0?=
 =?utf-8?B?TmJmY2dBYmtvcTBQbmFGZVpmUWJNQ2JVMEJxK204dnFkd1JpTGhkOStRWGxs?=
 =?utf-8?B?MnRrMVpDN0dwQkpCeDE1akp1WXEwdVBML0VHd1hNaUltejhoU3Z5ekwzVmRh?=
 =?utf-8?B?V2dOWmZTY1lXLzVZclFsUjR0ejNpWEhDYUhjN01GeTVsa3BqRjBjdE5EZTJw?=
 =?utf-8?B?LzBvUnJOQjMxNDFYSThrVlQ4Ni92OFNES2pCRDlXMGhRejZrVEFsdTdrNzBB?=
 =?utf-8?B?ck5PMDBPK2Z4U08rUkVGOU5kVEdrakRlN2JvYzdGVmd1K1VmUEJlMlRlRFoy?=
 =?utf-8?B?UEhlQUx4V1Z1REV2TlR0MTFkZEljOE1iWVh1RHZWV00vNE5aQU12b0RNT09W?=
 =?utf-8?B?Y1luSE9MbnlWWmNTbUNFYjJWc0xjY3hXMXA4RUpJZXJpeGpoSnp1Y1ZQR0xT?=
 =?utf-8?B?ZGR2OXBPekpWVXdxSDl2dHprZEFDWVlXdUtZZkR6WVpZWm5JTUpCcXFtam9L?=
 =?utf-8?B?TERScW5WNHFOT0EzdDlEZnhxRnN2bXNkMjRVM2hURi9IWmgwUEF0eC9oaTdX?=
 =?utf-8?B?eWVsRXVncmZoVGtwQmVXYU9vSzljL3lJVkFxaDJvR3V2Titlc3ZLOUw5Wm5B?=
 =?utf-8?B?T2E0Z05BYnF1eG44eFFHRFQwaVAxaytMZ3hnNjA3b2t4aUpMd3NLbXBZOHM5?=
 =?utf-8?B?SGxiSmRYQmRWUmdEaTBKY0lKeXY1WlhSeHVuL1VnVGxLQXQzSUVzZkphektt?=
 =?utf-8?B?K05OaUI1Zmt6Rk9HWG5xMlIzb2dkVDdnRFdBbUxYblBlb21vazFCKzN1L1py?=
 =?utf-8?B?eTBOa2NyVG9ZUmp3OGlMRkFGSlYxM21SVkRXVnU1N1VXcHJLSThET2ZhZ28z?=
 =?utf-8?B?cFBYUW1Xa3l5V0hUNm1MbS9WZXZ5aGFaWUU3cFZ2dlFSTXg5ekd6MFpyR3pv?=
 =?utf-8?B?T2NkNzB4TGRMN3pTS0cxRmMyWWJoMGFoOUQrWVJzUmEyczdrMlhhcllBNnZF?=
 =?utf-8?B?L0Fka21xUTRaVWZlWlBGK0gzbU1qZHgwWWlXb21YbGtRSUIyeFR0R0l0eHU0?=
 =?utf-8?B?ZUliWkIyOE41dG43djJ2Nk9uWlI0TU9ITjd5bS9mdzZzK083VUtSekJkd3Zh?=
 =?utf-8?B?TFFKcU51UFJoZWpMdXZDOFNmaWl4YmNmRjNxNTdjOTBHcUZJTnFzb0JHYTdL?=
 =?utf-8?B?Zk9sbkxKVUZhNFBaVWJrLy9yZnBxM0RvRVJuVmRKSTQzVFV6VWtkUW9ac3RL?=
 =?utf-8?B?Q3dKYmh4Y2QwVTliVDVvT1BhMFJNMjRpNklnMkFHVWtoTXdyMTY5R2VYcmpE?=
 =?utf-8?B?VjhpdS9nMWcyVnBTOFdtT1o2WEdWQVkzM0IwSGgwOSs5SDNqd0xNTHh2MDZL?=
 =?utf-8?B?NmphRjQ5dkQvNDdOb2xGeHIvYXJTQlVocUI5M0p0YWx6N2h4MmwvUmVwaW9Q?=
 =?utf-8?B?cGkxNGFOalhRNUNmRXZwZ1RlMlRHa2tobDZNZHp6cm1paWxTdC9XQVoxS0tG?=
 =?utf-8?B?NFVtSWEvaUVMQkhUaGdIc0dCZ1I2cXphQUYzYkR5emw3RlFCYWhwYlAzcHdE?=
 =?utf-8?B?TUFuOGdvUER0NGVUeVZhWWtUZlJtUkdabzNaR2JuUU5PUFZsTHBacjBLa0JO?=
 =?utf-8?B?c0ttZzBiUUZEemt2dzJvRFluNVR2QWgvK2RmdEg5WmFEbjd6dUFSUFE5Qlkr?=
 =?utf-8?Q?2OGmPl50OwlzdRgJ0hWGZtWRS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7DE341B1C3E8246BF61C323B11F2E68@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f95ceb-7078-4585-c052-08db816a01c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 17:20:49.8609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZn7gchBxPRjUihpSgqO/MhUxLPWcPFtmMD73wALqrRfBNHPOxbLM9/O9g8SFWtYQ/4LnppVhEGarFv80CUljgPn3UGo5EYKyodms79z5sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2956
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjMgw6AgMTg6MDgsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gZGF4IHZtZW1tYXAgb3B0aW1pemF0aW9uIHJlcXVpcmVzIGEgbWluaW11bSBvZiAyIFBBR0Vf
U0laRSBhcmVhIHdpdGhpbg0KPiB2bWVtbWFwIHN1Y2ggdGhhdCB0YWlsIHBhZ2UgbWFwcGluZyBj
YW4gcG9pbnQgdG8gdGhlIHNlY29uZCBQQUdFX1NJWkUgYXJlYS4NCj4gRW5mb3JjZSB0aGF0IGlu
IHZtZW1tYXBfY2FuX29wdGltaXplKCkgZnVuY3Rpb24uDQo+IA0KPiBBcmNoaXRlY3R1cmVzIGxp
a2UgcG93ZXJwYyBhbHNvIHdhbnQgdG8gZW5hYmxlIHZtZW1tYXAgb3B0aW1pemF0aW9uDQo+IGNv
bmRpdGlvbmFsbHkgKG9ubHkgd2l0aCByYWRpeCBNTVUgdHJhbnNsYXRpb24pLiBIZW5jZSBhbGxv
dyBhcmNoaXRlY3R1cmUNCj4gb3ZlcnJpZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2gg
S3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KV2h5IHJlbmFt
aW5nIHZtZW1tYXBfY2FuX29wdGltaXplKCkgdG8gX192bWVtbWFwX2Nhbl9vcHRpbWl6ZSgpIGFu
ZCBrZWVwIA0KaXQgd2hlbiB2bWVtbWFwX2Nhbl9vcHRpbWl6ZSgpIGhhcyBiZWVuIG92ZXJyaWRl
ID8gSXMgdGhhdCBiZWNhdXNlIHlvdSANCmV4cGVjdCBvdmVycmlkaW5nIHZlcnNpb24gb2Ygdm1l
bW1hcF9jYW5fb3B0aW1pemUoKSB0byBjYWxsIA0KX192bWVtbWFwX2Nhbl9vcHRpbWl6ZSgpID8N
Cg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L21tLmggfCAyNyArKysrKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4gICBtbS9tbV9pbml0LmMgICAgICAgfCAgMiArLQ0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gaW5kZXggMmRkNzNl
NGYzZDhlLi4xYTIyMzRlZTE0ZDIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaA0K
PiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gQEAgLTM2MzksMTMgKzM2MzksMzIgQEAgdm9p
ZCB2bWVtbWFwX2ZyZWUodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsDQo+
ICAgCQlzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCk7DQo+ICAgI2VuZGlmDQo+ICAgDQo+ICsj
ZGVmaW5lIFZNRU1NQVBfUkVTRVJWRV9OUgkyDQo+ICAgI2lmZGVmIENPTkZJR19BUkNIX1dBTlRf
T1BUSU1JWkVfVk1FTU1BUA0KPiAtc3RhdGljIGlubGluZSBib29sIHZtZW1tYXBfY2FuX29wdGlt
aXplKHN0cnVjdCB2bWVtX2FsdG1hcCAqYWx0bWFwLA0KPiAtCQkJCQkgICBzdHJ1Y3QgZGV2X3Bh
Z2VtYXAgKnBnbWFwKQ0KPiArc3RhdGljIGlubGluZSBib29sIF9fdm1lbW1hcF9jYW5fb3B0aW1p
emUoc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAsDQo+ICsJCQkJCSAgc3RydWN0IGRldl9wYWdl
bWFwICpwZ21hcCkNCj4gICB7DQo+IC0JcmV0dXJuIGlzX3Bvd2VyX29mXzIoc2l6ZW9mKHN0cnVj
dCBwYWdlKSkgJiYNCj4gLQkJcGdtYXAgJiYgKHBnbWFwX3ZtZW1tYXBfbnIocGdtYXApID4gMSkg
JiYgIWFsdG1hcDsNCj4gKwl1bnNpZ25lZCBsb25nIG5yX3BhZ2VzOw0KPiArCXVuc2lnbmVkIGxv
bmcgbnJfdm1lbW1hcF9wYWdlczsNCj4gKw0KPiArCWlmICghcGdtYXAgfHwgIWlzX3Bvd2VyX29m
XzIoc2l6ZW9mKHN0cnVjdCBwYWdlKSkpDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCW5y
X3BhZ2VzID0gcGdtYXBfdm1lbW1hcF9ucihwZ21hcCk7DQo+ICsJbnJfdm1lbW1hcF9wYWdlcyA9
ICgobnJfcGFnZXMgKiBzaXplb2Yoc3RydWN0IHBhZ2UpKSA+PiBQQUdFX1NISUZUKTsNCj4gKwkv
Kg0KPiArCSAqIEZvciB2bWVtbWFwIG9wdGltaXphdGlvbiB3aXRoIERBWCB3ZSBuZWVkIG1pbmlt
dW0gMiB2bWVtbWFwDQo+ICsJICogcGFnZXMuIFNlZSBsYXlvdXQgZGlhZ3JhbSBpbiBEb2N1bWVu
dGF0aW9uL21tL3ZtZW1tYXBfZGVkdXAucnN0DQo+ICsJICovDQo+ICsJcmV0dXJuICFhbHRtYXAg
JiYgKG5yX3ZtZW1tYXBfcGFnZXMgPiBWTUVNTUFQX1JFU0VSVkVfTlIpOw0KPiAgIH0NCj4gKy8q
DQo+ICsgKiBJZiB3ZSBkb24ndCBoYXZlIGFuIGFyY2hpdGVjdHVyZSBvdmVycmlkZSwgdXNlIHRo
ZSBnZW5lcmljIHJ1bGUNCj4gKyAqLw0KPiArI2lmbmRlZiB2bWVtbWFwX2Nhbl9vcHRpbWl6ZQ0K
PiArI2RlZmluZSB2bWVtbWFwX2Nhbl9vcHRpbWl6ZSBfX3ZtZW1tYXBfY2FuX29wdGltaXplDQo+
ICsjZW5kaWYNCj4gKw0KPiAgICNlbHNlDQo+ICAgc3RhdGljIGlubGluZSBib29sIHZtZW1tYXBf
Y2FuX29wdGltaXplKHN0cnVjdCB2bWVtX2FsdG1hcCAqYWx0bWFwLA0KPiAgIAkJCQkJICAgc3Ry
dWN0IGRldl9wYWdlbWFwICpwZ21hcCkNCj4gZGlmZiAtLWdpdCBhL21tL21tX2luaXQuYyBiL21t
L21tX2luaXQuYw0KPiBpbmRleCBhMTk2M2MzMzIyYWYuLjI0NWFjNjliNjZhNSAxMDA2NDQNCj4g
LS0tIGEvbW0vbW1faW5pdC5jDQo+ICsrKyBiL21tL21tX2luaXQuYw0KPiBAQCAtMTAyMCw3ICsx
MDIwLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGNvbXBvdW5kX25yX3BhZ2VzKHN0
cnVjdCB2bWVtX2FsdG1hcCAqYWx0bWFwLA0KPiAgIAlpZiAoIXZtZW1tYXBfY2FuX29wdGltaXpl
KGFsdG1hcCwgcGdtYXApKQ0KPiAgIAkJcmV0dXJuIHBnbWFwX3ZtZW1tYXBfbnIocGdtYXApOw0K
PiAgIA0KPiAtCXJldHVybiAyICogKFBBR0VfU0laRSAvIHNpemVvZihzdHJ1Y3QgcGFnZSkpOw0K
PiArCXJldHVybiBWTUVNTUFQX1JFU0VSVkVfTlIgKiAoUEFHRV9TSVpFIC8gc2l6ZW9mKHN0cnVj
dCBwYWdlKSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIF9fcmVmIG1lbW1hcF9pbml0
X2NvbXBvdW5kKHN0cnVjdCBwYWdlICpoZWFkLA0K
