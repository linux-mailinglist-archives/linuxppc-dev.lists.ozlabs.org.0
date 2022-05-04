Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB5519FD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktc3d4gjcz3byL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktc3B1hz5z2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:44:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvFeHy1m+6JV2mT6lI/CROHPSF8vZGlpp6w8GSJlNzsclAd10KGJVfvdDS9qmOb92u0OClXsgBl+QeuvaJ3fxnsG3934Phh9lsPcbAWd+/lWWrCD1+vvvMX0gAnXak+zxutMJN3oTK0CmxmutTA2yR4pLw6TkDcPn7vnGeMdrX39sFg0HH1vFmgvISGT0ZtDcL+jBgPcCImlMG53oA8d6a3ZkzCmcLvnww6fYvQEwkFpieVD9YoEbqCgypBS6Ap5EFtDEv9uXr89/nmBErRdWUp6C+oAf3/FrEfPLg97vO6JjHk07hgGYnWaJAtO1O/uXci3hADa5uAnAAbyFqdDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF9KHTr4sxoG25kqkAI3+1NcoA8S5BRMnFwZ9U78E68=;
 b=fud8mYwVZJMTGKvohzT+bKSJO6Th2UM7S1CwGDc17pHDT5k6+ySeV1YQIGAVr2IXiQeERECDGnS6xIsKGrSloMnMlSctr8clmKIaQQJn6GH76S0Wmt1ktdLNopdkhD0hE7PIk61iz0GQmLDLiE+qNMDJRZkCrZY1svNAwCI8aiJmKD+0TsVUpMM8TlQv2oYHNxwHzoxy8BCIB8f1bzxtMp+VdB6izROwLFkMCQQSRTrMdd3BLIX3VJ6jvHLvWm6ip7tHa0xjI6XxL3zWr4KYoHHl/1YOaKBqopG0aP7fAtzhySvjmdKFb6TdntNbpBM/8D3+qPcoLTw5YNvJkTKhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3528.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 12:44:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:44:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v1 16/22] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v1 16/22] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYP4vGBnXmLAA6UESp3hfNPm0Zeqz1dUIAgBl05wA=
Date: Wed, 4 May 2022 12:44:01 +0000
Message-ID: <004a9b6b-2722-45ec-b13a-577b9dd72312@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <7ef4015badd5f1861cfc327a7641c84e0e5630ca.1648131740.git.christophe.leroy@csgroup.eu>
 <1650267933.ewyj9l63lo.naveen@linux.ibm.com>
In-Reply-To: <1650267933.ewyj9l63lo.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df130220-c825-4e65-f18b-08da2dcbc3c8
x-ms-traffictypediagnostic: PAZP264MB3528:EE_
x-microsoft-antispam-prvs: <PAZP264MB352850A163B4C4747CE09CD9EDC39@PAZP264MB3528.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UB6PtkuY3YkB65UAlhftSk8ZlTNTW3OWY0U408AGXELJL2XuD3+e+3dB+UPHHx/WeTx+oI4uXQF8ADdc0r/xLJeX45FheODmPwtVXDbe1RWqsv23iybV5CFoLEYil1fABKBehfQjQYzM+hMMybMkoJ+5rKnPjzAuOMtyjJ3jWKYHmDaZjbCNYS6eoDEtDvsziSdlPP/q9h26mGYy0qKJmBwOHAzjeFBX2pla6RZqxxeqZayz3IDTG2S+3Lp7YgE1grDYNACYwlt8n3n7H2wfZF9wYQyNKTG1VBPOehUbm5KBf2PAoTRLO6lVbqBJuRfyG0eZtqBjp10JAKoLRZtbRnSPeV+kJLW822B+D3VW2KidLKXqrgiN+B/MQsE95aR01KRenUz2cTFV7ATTfnXnpgQJbCiSOYSBTsWLZhN8UVInRc7GY1zCuVP3U9FqrxLgWOx+FV9IL64tIBsbzKFrnVxwBu5B6d0b98eIOK9VlCHSQagQaQoaQmfFRSasVa5YLLMPsrBYHCHNo07NTyKpH8vQPXEiwoofIPvC4ht7S9keFHYUd1qdCm7BgeOLOxOXe6sQWAOuToONyat7NCfp5K+/3DXICvZ4lh9OAFMKYI+xWZTkyjLk+kLYRiA/1OFNqe/WJPhTHNpXR02Xpi9jigp5MQEFg+WDhYgH7Y6hIwJp43/nZxgl9Q9234ESvqzPI6elvbuXX5YYSq1NhAejHLrkFLiFDDAzV6Oh5M8iW23+P3WSBI17/+15+evZEmb5/rDKuNbUrbrAEHVsVPNTPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(66946007)(316002)(91956017)(36756003)(64756008)(66476007)(76116006)(66556008)(66446008)(508600001)(6486002)(83380400001)(54906003)(2906002)(86362001)(4326008)(8676002)(26005)(122000001)(44832011)(5660300002)(8936002)(38100700002)(38070700005)(31696002)(6512007)(71200400001)(6506007)(2616005)(31686004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWNTS3d2RDNjcG5EcHBVanpzOGlqY2pGZGxHT2lTckxEOHlXWUxQWVVUaWIy?=
 =?utf-8?B?aVdKODdONlJOZzdrNjRMRDFsWTE0OTZaakFGNk9HVVlMd0ZaWGdBenBvVDJo?=
 =?utf-8?B?RlB5RTc5UWFJeGZEY2txcGJVbU1BL1dFZDNoaEpvYWNORzBCQ3FyeEFtVDh6?=
 =?utf-8?B?U0lCdHZTNnJ0d043U3cwdUdSN2RUMjMvb2xSbEROcW5HeWNEN3dsSjlEL3Vx?=
 =?utf-8?B?bnk2N2U0ZkZwRXV1UWxPL01BSjdvLzBHcngzVjRxclNYNktRdmc5aGQrYXgz?=
 =?utf-8?B?ZjllaWVOaTdpaG13NzFpeGtaR1IzbENsV2EvdXZKNGJPWG9EbThqNkRma29x?=
 =?utf-8?B?U0tUYWVBZURtSHdaNmQ5TTR4eUN1djA1TXIwWE43NTAzSXl5TjZoMGFpem9x?=
 =?utf-8?B?T1FCZ1JVM0YzeUtFZGJ5ZGwzK2ltdUpKenJsYjNkQTBBS0h0UlFRODNpYXd3?=
 =?utf-8?B?b01sRHJsdmpCNXBicUI4K0o5cGdpbExwNVpzcENEMGoyUWo1a1VQeEhNNU5x?=
 =?utf-8?B?WEc2OGxXQjhybmE1bmxvRW54OGdSbTRMdmFIdU8rN2NKeWVMbUJnNTJBdVV3?=
 =?utf-8?B?UjF4VHg1ZFF4Y21ISHJnUHhvKzh1NGpkQUJaZTJZWHJwc2ZqdmdWaURzTmkr?=
 =?utf-8?B?RnZBZzhya2hHdWZoZVNNYU9WWGI5MkJoQkZybUQvYVpvanh5TU1YanlEVzNo?=
 =?utf-8?B?cis0dit5a2t6UC9OMExudlUrRk1hNis3eVphVjFGWGJhbmh3US9SQk1zWVZR?=
 =?utf-8?B?UEt6eWRDai9LekI5cDUwdE9qb2NJSHVCbElOdGJmYUFKQkNWckJtMHhXY25X?=
 =?utf-8?B?bnI5Q1czMDRyYmJXMHQ4NklmVS9iMDBHZWN5c0I5ZW5BK3VZK3dyN3ZKTTRo?=
 =?utf-8?B?QVFpT0o5T0hYbm4waWYwQ2krTzBuN0FlaERCRjV6S1ZncUIxbjNBRDllQWNG?=
 =?utf-8?B?VEN5UlZEd0JjL3RwMzE5bkUzSTh6c0RUd3ZhYm9WZU0xbTE0NWNQK1o3UjQw?=
 =?utf-8?B?T2swSGtsby9PaXpZMjdLbHRaTW1KVURNVkJVMEs0R2l2eS9FZWcvbmp4bnYz?=
 =?utf-8?B?THB3dXVjVXBlR0RhbldKYWg2Mnl3TjZ6KzluQXdoZXpTVHhYdDJYb1h0T0Rw?=
 =?utf-8?B?aUQrLzlkT0lUVUM3eHRydG04N05UZEZncFpYZlFKME1Gd0VoRmtqbjNxeUdX?=
 =?utf-8?B?WVZFNHRWcnljY0lGbEdMWHJ3UjNVUlFEbUZCY1Y5RTJHWldBSkZsaW9CWWFQ?=
 =?utf-8?B?d0pvK2tkNGdJUG8wd0VyNyt2elV6Lzk3azR5ZjNCTUxFcjZMWXlKZDZVdjZ0?=
 =?utf-8?B?NUs3ZHJsRy9YQjZaMlgxL1JjRzFZdUZKRC9abUdSeXAvN0xCV0xaNllRdDFU?=
 =?utf-8?B?blBja0tUekkvZCtlM2h3aC9BQkI5OVdYM3FVaE9wWDk5T0FkVFA4VW4wRXd5?=
 =?utf-8?B?ekJTL2MxNmdaNDZUUHFYNjI2YlJMbnQ3VTRxVFRDdGxWQWRlM0MxeFdTUjRj?=
 =?utf-8?B?N2dQUkYrVXUwYnpUa3V5dUZGTzV3eXI4M2dsU3ZhU0VRN2tNRTQ4ckpnR0Zq?=
 =?utf-8?B?LzVYMWE1RHRYdXBTWUtkenQ0QndJV3BXY3pzb0M1VE1tTFV0ZEVQMXpEaG0r?=
 =?utf-8?B?MzBLZzBCZTlNL3ArVDl4cnVGMlArbTlPOFVtRzNQcHpSZkk0ZWE4M1YwVERj?=
 =?utf-8?B?OVNmQm41MFgyZm1HazZQdzJpWkJCOE1Sdjh5elFoMFNIdHg5RmNZOG9jYzNi?=
 =?utf-8?B?amErU2ZjMXpOZ3lIUFpvaWhMK2MzbHBlQ1RibjU0bWJPbWdzTjZsaUw0ZFRN?=
 =?utf-8?B?a0EvaDdPZjA0SGlZZkNwM3VVcnpMWk45bEE1YlRUbmFVdHkydEJBejV4YXVl?=
 =?utf-8?B?T1g5UTZ5ZDRKTkVNbEpaTmk0bWpUNmZZZklpRGZheGZYZVNWblZ3KzNJV0hF?=
 =?utf-8?B?T1dLV2RWQjRYZStweDFxVE03S2xncDBsTUJsK0VFekthYlBrTVhaaDFsd2dC?=
 =?utf-8?B?bFl0T0xmMUpNTytFWWFoM2o1LytDZThtK1BlNUFPRENLZjdqRldqYkRhZGFZ?=
 =?utf-8?B?S0plUlpYdk51VW5hdVdKQkhPNVg1VHRnRVBiNmRNZ2gxWWs3YmRPSDBiUktt?=
 =?utf-8?B?L1BNeWg2bEJDY1V1aktOaUoxY1NGY1VURHl6VHFMcVZmNVFFcnRXeFpEQWFQ?=
 =?utf-8?B?RE1GVmdLMldIQzhGVGJQQXdNaXNHWDZwYlZRZCtHTjRtSlFOSzNCMThLeUNU?=
 =?utf-8?B?dExIZDJLaHBnTzBZRC9jU2EzczdlRnpQU29Dd3JJcGh1aTlpSStFdHk3ZWJi?=
 =?utf-8?B?T0ZGaHhTVTQxZXkxZFN5dmErRUZjOUMydDdneHl1YjdlOWh0T2pzbDI1RnBl?=
 =?utf-8?Q?KVm6DcJM5pyjuqpnhfDfKPzS7Wk/UeDshliiS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AB4A6A0070F0B41816F75432144FF79@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df130220-c825-4e65-f18b-08da2dcbc3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:44:01.2371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E9KhZ5WOf/PM8QAAUwWqo4HzHT/qzRFb9LG24ukneI+dpti0JT7ZFsgjQLU5TV5VwT1ZWinRJOQ7k62Pkp2aJKnfILacnWB3dN457ggRUN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3528
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMDk6NTksIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IEEgbG90IG9mICNpZmRlZnMgY2FuIGJlIHJlcGxh
Y2VkIGJ5IElTX0VOQUJMRUQoKQ0KPj4NCj4+IERvIHNvLg0KPj4NCj4+IFRoaXMgcmVxdWlyZXMg
dG8gaGF2ZSBrZXJuZWxfdG9jX2FkZHIoKSBkZWZpbmVkIGF0IGFsbCB0aW1lDQo+PiBhbmQgUFBD
X0lOU1RfTERfVE9DIGFzIHdlbGwuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDCoGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfMKgwqAgMiAtDQo+PiDCoGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgLQ0KPj4gwqBh
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaMKgwqDCoMKgwqAgfMKgIDI0ICstLQ0K
Pj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jwqDCoMKgwqDCoMKgIHwgMjAx
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2Vy
dGlvbnMoKyksIDExNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaCANCj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaA0KPj4gaW5kZXggNDI2MGU4OWY2MmIxLi4wNzFmY2JlYzMx
YzUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGlu
Zy5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5oDQo+
PiBAQCAtMjE3LDcgKzIxNyw2IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyANCj4+IHBw
Y19rYWxsc3ltc19sb29rdXBfbmFtZShjb25zdCBjaGFyICpuYW1lKQ0KPj4gwqDCoMKgwqAgcmV0
dXJuIGFkZHI7DQo+PiDCoH0NCj4+DQo+PiAtI2lmZGVmIENPTkZJR19QUEM2NA0KPj4gwqAvKg0K
Pj4gwqAgKiBTb21lIGluc3RydWN0aW9uIGVuY29kaW5ncyBjb21tb25seSB1c2VkIGluIGR5bmFt
aWMgZnRyYWNpbmcNCj4+IMKgICogYW5kIGZ1bmN0aW9uIGxpdmUgcGF0Y2hpbmcuDQo+PiBAQCAt
MjM0LDYgKzIzMyw1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyANCj4+IHBwY19rYWxs
c3ltc19sb29rdXBfbmFtZShjb25zdCBjaGFyICpuYW1lKQ0KPj4NCj4+IMKgLyogdXN1YWxseSBw
cmVjZWRlZCBieSBhIG1mbHIgcjAgKi8NCj4+IMKgI2RlZmluZSBQUENfSU5TVF9TVERfTFLCoMKg
wqDCoMKgwqDCoCBQUENfUkFXX1NURChfUjAsIF9SMSwgUFBDX0xSX1NUS09GRikNCj4+IC0jZW5k
aWYgLyogQ09ORklHX1BQQzY0ICovDQo+Pg0KPj4gwqAjZW5kaWYgLyogX0FTTV9QT1dFUlBDX0NP
REVfUEFUQ0hJTkdfSCAqLw0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9tb2R1bGUuaCANCj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21vZHVsZS5oDQo+PiBp
bmRleCBlNmY1OTYzZmQ5NmUuLjcwMGQ3ZWNkOTAxMiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL21vZHVsZS5oDQo+PiBAQCAtNDEsOSArNDEsNyBAQCBzdHJ1Y3QgbW9kX2FyY2hfc3BlY2lm
aWMgew0KPj4NCj4+IMKgI2lmZGVmIENPTkZJR19GVU5DVElPTl9UUkFDRVINCj4+IMKgwqDCoMKg
IHVuc2lnbmVkIGxvbmcgdHJhbXA7DQo+PiAtI2lmZGVmIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9X
SVRIX1JFR1MNCj4+IMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgdHJhbXBfcmVnczsNCj4+IC0jZW5k
aWYNCj4+IMKgI2VuZGlmDQo+Pg0KPj4gwqDCoMKgwqAgLyogTGlzdCBvZiBCVUcgYWRkcmVzc2Vz
LCBzb3VyY2UgbGluZSBudW1iZXJzIGFuZCBmaWxlbmFtZXMgKi8NCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaCANCj4+IGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3NlY3Rpb25zLmgNCj4+IGluZGV4IDhiZTJjNDkxYzczMy4uNjk4MGVhZWIxNmZl
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3NlY3Rpb25zLmgNCj4+
ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oDQo+PiBAQCAtMjksMTgg
KzI5LDYgQEAgZXh0ZXJuIGNoYXIgc3RhcnRfdmlydF90cmFtcG9saW5lc1tdOw0KPj4gwqBleHRl
cm4gY2hhciBlbmRfdmlydF90cmFtcG9saW5lc1tdOw0KPj4gwqAjZW5kaWYNCj4+DQo+PiAtLyoN
Cj4+IC0gKiBUaGlzIGFzc3VtZXMgdGhlIGtlcm5lbCBpcyBuZXZlciBjb21waWxlZCAtbWNtb2Rl
bD1zbWFsbCBvcg0KPj4gLSAqIHRoZSB0b3RhbCAudG9jIGlzIGFsd2F5cyBsZXNzIHRoYW4gNjRr
Lg0KPj4gLSAqLw0KPj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBrZXJuZWxfdG9jX2Fk
ZHIodm9pZCkNCj4+IC17DQo+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgdG9jX3B0cjsNCj4+IC0N
Cj4+IC3CoMKgwqAgYXNtIHZvbGF0aWxlKCJtciAlMCwgMiIgOiAiPXIiICh0b2NfcHRyKSk7DQo+
PiAtwqDCoMKgIHJldHVybiB0b2NfcHRyOw0KPj4gLX0NCj4+IC0NCj4+IMKgc3RhdGljIGlubGlu
ZSBpbnQgb3ZlcmxhcHNfaW50ZXJydXB0X3ZlY3Rvcl90ZXh0KHVuc2lnbmVkIGxvbmcgc3RhcnQs
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIGVuZCkNCj4+IMKgew0KPj4gQEAgLTYwLDUgKzQ4LDE3IEBAIHN0
YXRpYyBpbmxpbmUgaW50IG92ZXJsYXBzX2tlcm5lbF90ZXh0KHVuc2lnbmVkIA0KPj4gbG9uZyBz
dGFydCwgdW5zaWduZWQgbG9uZyBlbmQpDQo+Pg0KPj4gwqAjZW5kaWYNCj4+DQo+PiArLyoNCj4+
ICsgKiBUaGlzIGFzc3VtZXMgdGhlIGtlcm5lbCBpcyBuZXZlciBjb21waWxlZCAtbWNtb2RlbD1z
bWFsbCBvcg0KPj4gKyAqIHRoZSB0b3RhbCAudG9jIGlzIGFsd2F5cyBsZXNzIHRoYW4gNjRrLg0K
Pj4gKyAqLw0KPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBrZXJuZWxfdG9jX2FkZHIo
dm9pZCkNCj4+ICt7DQo+PiArwqDCoMKgIHVuc2lnbmVkIGxvbmcgdG9jX3B0cjsNCj4+ICsNCj4+
ICvCoMKgwqAgYXNtIHZvbGF0aWxlKCJtciAlMCwgMiIgOiAiPXIiICh0b2NfcHRyKSk7DQo+PiAr
wqDCoMKgIHJldHVybiB0b2NfcHRyOw0KPj4gK30NCj4+ICsNCj4+IMKgI2VuZGlmIC8qIF9fS0VS
TkVMX18gKi8NCj4+IMKgI2VuZGlmwqDCoMKgIC8qIF9BU01fUE9XRVJQQ19TRUNUSU9OU19IICov
DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYyANCj4+
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYw0KPj4gaW5kZXggZmZlZGY4Yzgy
ZWE4Li40ZGQzMGUzOTYwMjYgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Ry
YWNlL2Z0cmFjZS5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5j
DQo+PiBAQCAtMTUwLDU1ICsxNTAsNTUgQEAgX19mdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVs
ZSAqbW9kLA0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+IMKgwqDCoMKg
IH0NCj4+DQo+PiAtwqDCoMKgIC8qIFdoZW4gdXNpbmcgLW1rZXJuZWxfcHJvZmlsZSBvciBQUEMz
MiB0aGVyZSBpcyBubyBsb2FkIHRvIGp1bXAgDQo+PiBvdmVyICovDQo+PiAtwqDCoMKgIHBvcCA9
IHBwY19pbnN0KFBQQ19SQVdfTk9QKCkpOw0KPj4gK8KgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05G
SUdfTVBST0ZJTEVfS0VSTkVMKSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIC8qIFdoZW4gdXNpbmcg
LW1rZXJuZWxfcHJvZmlsZSBvciBQUEMzMiB0aGVyZSBpcyBubyBsb2FkIHRvIA0KPj4ganVtcCBv
dmVyICovDQo+PiArwqDCoMKgwqDCoMKgwqAgcG9wID0gcHBjX2luc3QoUFBDX1JBV19OT1AoKSk7
DQo+IA0KPiBXaHkgbW92ZSB0aGlzIGluc2lkZSB0aGUgaWYoKSBzdGF0ZW1lbnQ/IFlvdSBjYW4g
a2VlcCB0aGlzIG91dCBhbmQgZHJvcCANCj4gdGhlIGVsc2UgY2xhdXNlLg0KDQpJIGZpbmQgaXQg
bGVzcyBlcnJvciBwcm9uZSB0aGF0IHdheS4NCg0KUHV0dGluZyBhIGJhZCB2YWx1ZSBhbmQgdGhl
biByZXBsYWNlIGl0IGxhdGVyIHdpdGggdGhlIGdvb2Qgb25lIGNhbiBiZSANCm1pc2xlYWRpbmcs
IGFuZCBpZiBzb21lIGRheSBzb21lb25lIHJlbW92ZXMgdGhhdCBzZWNvbmQgc2V0IGJ5IGVycm9y
LCBpdCANCndpbGwgZ28gdW5ub3RpY2VkLiBXaGVuIHlvdSBzZXQgaXQgb25seSBvbmNlLCBHQ0Mg
d2lsbCBjb21wbGFpbiBpbiBjYXNlIA0KdGhhdCBzZXR0aW5nIGRpc2FwcGVhciBieSBlcnJvci4N
Cg0KQ2hyaXN0b3BoZQ==
