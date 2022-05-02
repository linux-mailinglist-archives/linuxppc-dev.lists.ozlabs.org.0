Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785E35171A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 16:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsQb92PgTz3brk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 00:34:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsQZh0Dfdz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 00:34:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQqSzA9sOTzbjCQPnXFOtfzhZm+lKLZv7xbv/2HM08J5yPM4lu8Cz/GdexCXwtjKGhGh7aq6IuaSN1grZndn5Aa66LjSewUy/JzUMgegSgU7Tlc6nU1W1TO69MfVGDVeXyGCPoRIDYmos3DgHKg6U+BQnZwGpk2m8veDf8SC+A8Oqw/K7HmVCsgFc04xOlXA4q3/6jwya37GkVwIyTuHVSgLhRLDrcbFf+B4nGt47g3VFaeaZTim0SGw5WthVkreKpGFhRlJDbwvZGYo9rbs1ZVKq7hh/6mkbVWupCcwKsDdeTMXzTYWEBPDRwMdXMvXsy9RLjimytmpy09w7rbj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUcaJebibjievZfSADZNSc0a296RkMxyOMoRAZxDjB4=;
 b=kOWLljmCdBJrsLZiknSLMUjdhu4ZgsboNS0rogLgxYJCUKRBqhicJnht3gB82YjaY63dgJHE60SIXnbI0wh1NMEzx7pQy4t76OIe3jNOyohbOIG1gkiPiy93KeO51vtOEX4NKO7RyX3iYNXxS4OzMdrDA0axS74W0hIbXYryCmCagS7erXReKXx9isJKxHN8AOTUl0RXkxIy/eTj4oVzkQJysv31g9yIy7C5mpzx5N0/QhMH5Y20KuHiyws8ZpX5lUG60a6nD8l9U/cwBxApIEGDaY3gqcqNpNxu4Thhsj0P49ictJlQ30EmP+Xs+tsnMOVXRreA/uWPFc1SOsK89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2615.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 14:33:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 14:33:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wan Jiabing <wanjiabing@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, David Sterba
 <dsterba@suse.com>, Max Filippov <jcmvbkbc@gmail.com>, Alex Elder
 <elder@linaro.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tty: hvcs: simplify if-if to if-else
Thread-Topic: [PATCH] tty: hvcs: simplify if-if to if-else
Thread-Index: AQHYV7u1qrOz0UycOE+om5s6zsiWyK0Ls8eA
Date: Mon, 2 May 2022 14:33:44 +0000
Message-ID: <123409e8-e7ad-0256-9c83-2778dbf03219@csgroup.eu>
References: <20220424091310.98780-1-wanjiabing@vivo.com>
In-Reply-To: <20220424091310.98780-1-wanjiabing@vivo.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abf9cadc-71a0-4a65-6384-08da2c48c297
x-ms-traffictypediagnostic: PR0P264MB2615:EE_
x-microsoft-antispam-prvs: <PR0P264MB2615DA9D03BA451162E1950EEDC19@PR0P264MB2615.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: onYLWoUJYlO5TriJ3zM0Kq8UQLEi5rR+IYhMlOeTOFmpZTaU/daRTLw+jCDkl7sAwPDxmwzQZR/XlsHM8n2yy0jPtAD02Vv7KPc/tbWirEFQr6pXEN2zOFJTiLPuR5m5bOoaoVZMIJDtQ7w+FelNzvnzM+on4SOXpAuPHZHWOcSZncD5ndJAmyzPBPJ0uKYB9oVboN9FCW0SF3hUL0xPXSr1kEZoYofrw6tFsx9l04MxDpI6xucxSxwvUfawhxLzndJzPEEYyvJk/UAo/Pu783yHusnzx4HlEiOtA6OHZoK90C+gO43VoAGg286tfvMFch5e4t6xKc+r09K4cmJ5jjdsltq0RlAtZwTT/p3GwDSXSSBZsKawf2BqHOpgOUJHj18xOKakCfSnIAvDLkz49UDh5/SbUmk/k0wOXioHhtWVFKsoa/eeJQhU+XSKDGHxA5senCwVc50P31WMMHZpCXREFP258zO4EaRhKwbD8rHO9h+RnwOtNDeS+GPozLSH82l1qphNYUazmiUt14/p8NENPp31tzpNnOOH1JqaCFKM7vwVICmBIXRTMgvV67u3ZE5ycepEDedprlm8kL52tlKFuiLOfvyz8idmF+uR3zs4CCvjBPMFitfZgQjvv79LaHrNNPvjM1RBlUqeeSye55P/IMGlYZHq8TYv4fKUVoIGfJabh+LTYaDXKcRM/SB0kSyumLM/bxCgmVv55o1VFhkIHe4icxr6ewhRpkupn04V2TN0bHng4ACSDncl1LVjpmtgIsFeFgy3cxJyGXQQAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(91956017)(83380400001)(76116006)(8676002)(66476007)(66446008)(64756008)(66946007)(66556008)(66574015)(31686004)(4326008)(2616005)(110136005)(186003)(316002)(2906002)(31696002)(86362001)(26005)(6512007)(6506007)(71200400001)(36756003)(5660300002)(44832011)(38100700002)(508600001)(8936002)(122000001)(6486002)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkZUNmlCZFJLVnhaYUR2VEgvanhJSm1YN3Jlb3llbmk0VXRvTUxRZDRydDFZ?=
 =?utf-8?B?cUZ6WVdvdExDbHlhSUdSNUVaN3VWMzU5R1BkbXB6MHFSeHpzVzFWa2JvQXIr?=
 =?utf-8?B?cVRBQlBZYUY4UFJZTTh6dHN3aXBDNDBkcFgxN0hrNmRiNWQ4ME1XdjlLS3k1?=
 =?utf-8?B?QUFpSkFwc3o4c25qMW90eDhFVTNvWFdocnlBWXpYUEpIdWhnMURoUS9rTXdq?=
 =?utf-8?B?MDdYWDNudjBOSDVSQjdoUWVndjBjU3VSZElvRzBxWkJSN1hoczZjY2Zab2JE?=
 =?utf-8?B?VmlUSTQxci8vd3pQNm9ZSEd6QW14V29nMWlveVpSNW51V3pjVFdYWXFuU0R3?=
 =?utf-8?B?MHVFTEVqaW9uc1BBWWY0MmxZN3A2SGgrNnhpN1NhTi9DYmRHNkdBYXppMXZo?=
 =?utf-8?B?L1RRZklXaFZyWXh5cXVzV3lEbFVReS9xalErd1FybU02dERmVm9ja0NGTzJ4?=
 =?utf-8?B?bTQ3eUY2aUpRZEZqbXU2T3hTSmIwMkk5bnlweFJENEdSSXVySlhMOUVSZmov?=
 =?utf-8?B?NWxVMkFEVldJeG50RkMwSUh6d3E4YkxNYXpDZytXMHk0dGtHZnVpaUhwTXpt?=
 =?utf-8?B?Wlp0ZGlTTk5yWFgvN216UTAvMm1Ob3A3dGt3VFdwMkpKWW9WZ1JOSUdCYlI2?=
 =?utf-8?B?OFR4S0dQYThyemhvVkp4dGV6dWkxNkxYVHRsRDJBUVpHVy9VVjBnMGRTZEcx?=
 =?utf-8?B?ZENnNFdPMVJ2VHRRK3pQT1BEZEI3SmZXTllKa09rV01xMzRUSCtBRFAzRmxU?=
 =?utf-8?B?UWFGQjd4M2ppS3ZpUVZRM1RMYXNpYTdzQXRDYkRsRWJYSm0zTHRwU0ZyMHZ3?=
 =?utf-8?B?TGRjSHpPTGh0Z2VWSVhkeFlLdXhzTDFNaThsdERtSEd5dGphcTExU0tNenU5?=
 =?utf-8?B?VS9EMDl0RTFKNW5sVEJEaWR2Z3pZVXBSM0JzbFRGQWlHQVNNell2M3l3Sndu?=
 =?utf-8?B?OFRNQUFCellDUVJNcUFLT09GdEorMjR4NzR6b2QyTXEwUVcyU1dIcWNsZkhS?=
 =?utf-8?B?UitQbFpoZ2xFcStrcWZsdTI3YmtZZ3ZHV2E0eGJVY1ZjZXBnaVY0eThRenBM?=
 =?utf-8?B?Tjd5cmQ0ekt1N2FoVHArK0dQbEROS1JDZ0xJYVUyQVFmKzNrYVRiNlRmSkFz?=
 =?utf-8?B?czY0Y0kxdG04QTlJQnJZNmt6ZjRZMkdqZzVXSTc5VkxLRU1yanBCUjRNbUJv?=
 =?utf-8?B?MXEwdXNleE9VbU16cFlrWXMxSVVMR0t0b0o5elRqSzg1aWtDMEkza2VKUUta?=
 =?utf-8?B?azI3QXB3RXN6ZjkwYklSdVQxWnhMWDg1VCs1K2NDNjQxbm96VEQ0a3Jib1V0?=
 =?utf-8?B?b1JXUk1qTDRHdXZ5LzRCNktoeTFkakEzc3hnTzR6c2JzckdYT0YxOEptS1l3?=
 =?utf-8?B?Z1JmcnJJMlZpeEJmTnhiK1UzN09Rb0FUSjNZNWlFelZIZjlmVk5qVUxwNzNO?=
 =?utf-8?B?ejZHUE1RWHhVTTlhQWFKWFM4TU5pNFVOMURnTzhIZ09leG4ydWdYT2pkVkFX?=
 =?utf-8?B?b1dEV25wb0hocCtDcWpxNVpnUFlJcmdBVWhsQ0ZZYllPVGJBS0diRTMyUzV3?=
 =?utf-8?B?R2UwamZ4aHM0VUxudDRZV29OWktUWlJEdVNxdUhESTdUY3JUeURkQWlFVmli?=
 =?utf-8?B?OWxETXJVb0Z2TVk4Z2laVnVLVnovU1VyYnVPUWYrRlJDUUZ6QTBJL3dEa3Np?=
 =?utf-8?B?b1lRdnFhdHoxV1JXYnVCY3VEanRWZ1VPeDRMVFdYdFduck5QSDV4YmtCTlZL?=
 =?utf-8?B?bVBkV1JtdmpPdmxmTnIwb1U3ZmlCZDhHOFJBbzIyS1Q4Vkw3QzVpZ3owKzlL?=
 =?utf-8?B?MzkreTZoRkRidU1rZzNvOUsxL1NYQ0M2V29XQ1ltUlBSemdFOW80ZXRqSE16?=
 =?utf-8?B?eXZ0d2JwTG9yOVhjaFNFcFl0SFFmTGtmVUEzeUZ1VEtBWWUxRTI3blE5Um1S?=
 =?utf-8?B?cWw1bFRSQVZGWHhzZ0tQbkU0Sk1ReTg3VklLaXNsS3lKbFdGVmMydEZVbmpp?=
 =?utf-8?B?NFgzdmJaVC92elM2K25FVlZlODc2S1VBYUtUTXQwSldxcVM2bUxhMCtYWmIr?=
 =?utf-8?B?OG1kOWhwejZOMFhkSGpnZjFlTGZ3bmpzOXE0aUdETjJ6SHA0dDRxSzVLdnZa?=
 =?utf-8?B?dnlLOUNlaXBzdnVZSDFQa0tuYVlNdkhydHc2S1FyWHMxSUVFenRBYUcvdlZx?=
 =?utf-8?B?UUdZaU83RHJRSXZwTnY2Q1NDaDdURGdqQ2dlTUlzTWRNQmFGWURoZlB5a0Y1?=
 =?utf-8?B?clFZWkRnd0NsZVdsMHJzTHU3SWd2VDdaYWhabEtZTTAzNk1tdnRITE9PZEUr?=
 =?utf-8?B?M0VMeGtHZ0R2RWhaYkx3YWpDekdaRnd1NEJ2dC9HZWVQbTFzQ1RiakNnZ2xG?=
 =?utf-8?Q?bcWmEIvnlMJzCgYoRLKLIGvcb9J37/4D4r2Li?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A3EC9E803FEE14484DEA6E6F3A76B5B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: abf9cadc-71a0-4a65-6384-08da2c48c297
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 14:33:44.0159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rN8nIdfFoCbTlCdUOnTiFATU6VVU4Kkt31rujZU56WPIuoBV3oBx2EILKSXoDGaf1V+xXWGDK3bEtNFqXquL0QbwX4V9RAflKYM84r1xwzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2615
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
Cc: "kael_w@yeah.net" <kael_w@yeah.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA0LzIwMjIgw6AgMTE6MTMsIFdhbiBKaWFiaW5nIGEgw6ljcml0wqA6DQo+IFVz
ZSBpZiBhbmQgZWxzZSBpbnN0ZWFkIG9mIGlmKEEpIGFuZCBpZiAoIUEpIGFuZCBmaXggYSBjb2Rp
bmcgc3R5bGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYW4gSmlhYmluZyA8d2FuamlhYmluZ0B2
aXZvLmNvbT4NCg0KDQpEaWQgeW91IHJ1biAnY2hlY2twYXRjaCcgb24geW91ciBwYXRjaCA/DQoN
ClNob3VsZCBiZQ0KDQoJaWYgKHNvbWV0aGluZykNCgkJZG9fc29tZXRoaW5nKCk7DQoJZWxzZQ0K
CQlkb19zb21ldGhpbmdfZWxzZSgpOw0KCQkNCg0Kb3INCg0KCWlmIChzb21ldGhpbmcpIHsNCgkJ
ZG9fc29tZXRoaW5nKCk7DQoJfSBlbHNlIHsNCgkJZG9fc29tZXRoaW5nX2Vsc2UoKTsNCgkJZG9f
bW9yZSgpOw0KCX0NCg0KDQpIb3dldmVyLCBhcmUgeW91IHN1cmUgdGhhdCB0aG9zZSB0d28gdGhp
bmdzIGFyZSBnb2luZyB0b2dldGhlciBhbmQgYXJlIA0Kd29ydGggYW4gaWYvZWxzZSA/IERpZCB5
b3UgbG9vayBhdCBjb21taXQgDQozM2YwZjg4ZjFjNTFhZTVjMmQ1OTNkMjY5NjBjNzYwZWExNTRj
MmUyID8NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvdHR5L2h2Yy9odmNzLmMgfCA1ICsrLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9odmMvaHZjcy5jIGIvZHJpdmVycy90dHkvaHZjL2h2
Y3MuYw0KPiBpbmRleCAyNDVkYTFkZmQ4MTguLjliN2U4MjQ2YTQ2NCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy90dHkvaHZjL2h2Y3MuYw0KPiArKysgYi9kcml2ZXJzL3R0eS9odmMvaHZjcy5jDQo+
IEBAIC01ODEsMTAgKzU4MSw5IEBAIHN0YXRpYyBpbnQgaHZjc19pbyhzdHJ1Y3QgaHZjc19zdHJ1
Y3QgKmh2Y3NkKQ0KPiAgIA0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZodmNzZC0+bG9j
aywgZmxhZ3MpOw0KPiAgIAkvKiBUaGlzIGlzIHN5bmNoIC0tIEZJWE1FIDpqczogaXQgaXMgbm90
ISAqLw0KPiAtCWlmKGdvdCkNCj4gKwlpZiAoZ290KQ0KPiAgIAkJdHR5X2ZsaXBfYnVmZmVyX3B1
c2goJmh2Y3NkLT5wb3J0KTsNCj4gLQ0KPiAtCWlmICghZ290KSB7DQo+ICsJZWxzZSB7DQo+ICAg
CQkvKiBEbyB0aGlzIF9hZnRlcl8gdGhlIGZsaXBfYnVmZmVyX3B1c2ggKi8NCj4gICAJCXNwaW5f
bG9ja19pcnFzYXZlKCZodmNzZC0+bG9jaywgZmxhZ3MpOw0KPiAgIAkJdmlvX2VuYWJsZV9pbnRl
cnJ1cHRzKGh2Y3NkLT52ZGV2KTs=
