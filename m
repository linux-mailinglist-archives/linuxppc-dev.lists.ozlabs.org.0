Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75456C859
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 11:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lg4YB1mQFz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 19:27:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=f8I98sL7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=f8I98sL7;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lg4XR4J9Vz3bm5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 19:26:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J61D7mjzAAAPXh4kbZWjdHqz5A2NlqbsVdP2SQhfNDhLbx2hkdjybX9ZzbICxPn08cPBAYEoqiwzEMZtlNsCJ5tmMjLlr/7b/MY6IOUles1IvHHVIfyVsq6Q8y162ukWN2XAv+nLcEpE4bslKfqkPxs0B4HYgpCDgI+pDeYKdr92ZK9KuVjz3tgRPg1jSYEP9PQJxp86QzFvANiYsGwVKm25LJFs2C8UgVChg5mbnfofhRH2BV/PLahf/s9isInUR2TkS9jQ1rAoRj5RGG5vMB6EMumIcUt3UJPQTy9yUSyKQCXxNe1Rjzh9EVrQNVg8x7JFTdWqpHIV1znsII+00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVuZ5r4VICuaUKbd8Zdt65czPtAUH+Ib6KgkqwEomNU=;
 b=mo8crkb4FYdMW+A1GMI06mWt6UX4Pd4xXxT64qAdFvJna1SE2KT0806vnzcvclRT/V3gQp5LkBBdaRAYrkIey2GLEfsmtqpNU3FLidk/IpddnKvdxfqVty10CDDKdJb6HDb+NnZq8skxdFGTBzf9Q+J/6+hST+bYCl5DBYlYpXS0bEO8mlVnLHYG5XfPC6AbQBAfFVwTArgx/vk67Fl1FGOyfkgbmioAQObiiM1Mdx3jPS6TSN0LRgr9DlLqBe2F5+6x6bJIAC1O+vK31LUJuFFSZEl2BI9kn56303Lw2Mqd5z5mUgBLfu9VzBv4OI0h+9O2WmNp0U9pLQKJIlmzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVuZ5r4VICuaUKbd8Zdt65czPtAUH+Ib6KgkqwEomNU=;
 b=f8I98sL7Cso6+8sunkJCsfuAXYRKZclhUzk2z1LvzhlYgG0g1UTLdhwsgRDJDeAZYUNGaWdyT1NOua1wUXev1JR5jnLrpAGnZPWJtncxWtDND5/X/n2Y1ICcHYNN6+GhANmSR8ak6IjzXorW1P3Q8sr9G8ex96av+pcHBepyaXmn00Ewj7Rx3/+Q2LdVGIZobuOlS83xAQeLeG+637J0d0yJtS0hJ5WS0eADnrYjncjeY0mFslPB/TgGm1Y4pI/2crxJSPZwh7LDRQUkSwNlNd4wkyd+NZFFy2qdI2WIMztA/0nUY0CaX7l70L2evkTRDIusR386gzM6mGIFz8VcqQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1913.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Sat, 9 Jul
 2022 09:26:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.023; Sat, 9 Jul 2022
 09:26:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAaen4CAAC/3AIAA4BYA
Date: Sat, 9 Jul 2022 09:26:11 +0000
Message-ID: <d9339bb9-2410-bea5-7502-1c7839707f4e@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220708171227.74nbcgsk63y4bdna@pali>
 <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
In-Reply-To:  <CAK8P3a3YMqGEjRr+ZD4Enm4pnuNNZOaeXqpY=PDXAP7w3P7y4A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4eeb34af-adf6-490f-650b-08da618d1001
x-ms-traffictypediagnostic: PR0P264MB1913:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2B2uRhjZxXRGEY2Vv4N8H4klomKjIF4VpXDjwS4LOcCfZALg5Hj5wwa5F0om7TKD6B9AfBPEYkozqjW2Zpwqknr/jVQj6+T6oKFUN3q5wEbsxvcNB1a0DflubxJA/P91GfCRvCunF4x+/B4Z2e0b7pldlTz+BN3UN1XrgPuR5IkVNc5oF8qyCWVCIey3wbsa/5WGONXtgRxsqpnhg6LqfBPrgruu5z+tAB2CiEw+iP42ASP3MueBQa/vbWhlKfrNntO6ycmHJv0ExieRdXWz9i7hbB3DiOvvasGGQOVEBaZdYu2fuqcOysHaIY7OrXWmMMry0Fq3VC8AYLzZjEEtdg3yWe0gppUVnBnUHOF8xf1BVBbdZjBft+liUCon5wjSsC5hoH0OeWXcVgQbufGaX3nUAYOZ5bwfb/IJVtSqDIjN0mX+f/OEfRjjhlsTJiWiz+m2zeGktFGR/M1xMoKC+k39iYnH/zge7Ot/CGGCYZDjfIjNixlHcV1XzMTgUNY02AKbbiifvGeTf4UVBGOsefhm1h3uFQQiV8lHKbDYiBivcbvS7cZH+Hdn3EkW7rQO928XGIgPdUhjuuPpiLzTqahrJ6B8LTKK/OIbgd53aanldzYFHovsDDpZadAP3VTN87mNGp6YidlF2+cjP+bgiyrKk9b8b085YQldcEbNh+i8lrBYj6pV3TZuA+4LGEXvxNDH9Ll8i0qy7tlM5ScXtNEtZOP41N1ruNI5cx2MCXmEO/dVwafICR5MzXBT8kUeo5/X9PvXaAtGvHsLdlchNF9qeHSIgyHVcmHA+wgfEBfnx513VK0mxzHD4BSfBWKZw2/avuwCoDujYsE4gi36oxRVoQFm9hUJrE81Pehyo5W5ujwr7SQ0AD80Zd2sYT/QeH29OUJs6dzzmSkj/Djhrx4JLjxi1itR0k+opRgob0A=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(44832011)(66476007)(66556008)(66446008)(316002)(66946007)(91956017)(110136005)(64756008)(36756003)(83380400001)(4326008)(31686004)(71200400001)(8676002)(54906003)(5660300002)(8936002)(76116006)(478600001)(6486002)(966005)(2906002)(41300700001)(6512007)(26005)(2616005)(66574015)(6506007)(186003)(53546011)(38070700005)(31696002)(122000001)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a2xlMXpaeVRTSUJiaVg0R0oyR3ZJQk9lUTBRYUJRMWg5ZjRQZC9sY0VUNHdI?=
 =?utf-8?B?RWZvcEt5WUd4dXhpWGFmMmIzanMvd00yd3BDNDgzL3VvczM0M1M4VWh5cEgz?=
 =?utf-8?B?eDNDN1VSNjBUWTN6UUNJTHB0S3l4S2I2ZzF0ODIvVWdRZEo4UDd0SklhOUpn?=
 =?utf-8?B?Q0x6NUwra2xJQUIxSGFjREtRSUFzQnRMd2k3RE40RlhHQzdxak1LSFR3UlBl?=
 =?utf-8?B?Qk9EY0lIZnc0bTVIVXBZQmNFdDZLZHh1STloVlI3dEMrVjJzZHI4VjZ6dmc3?=
 =?utf-8?B?b3p4WWZuWHh1TGFBdGpmdnZMdWRrUzFjNGlBbk14bzZJNGlwUzdrLzYvc3di?=
 =?utf-8?B?WkVSVHZzZCtnNG1wTTV2R1pxcE1EOU5IQXVHMnA2ODFHL0ljSmFsaGtadmtK?=
 =?utf-8?B?MWQ3TlhOSzRzMEJmRlY2UDZoUEtXeHgyV2tRYW1iYlpMZk1SV3pPU2xteDFT?=
 =?utf-8?B?bGNVQ21HMnRlMjRJYjFpT0x4ZThuYys5bjljWGNyVXhTMHRhL2QwSCtIWFBt?=
 =?utf-8?B?cTJjdVFoU0RudnQ1ZFo5dGNEeU5FVkxoVVFYbnpuTjZFRWhJWXB3bUFkN3Yv?=
 =?utf-8?B?bWVVWWF6R0NtQjFZdEp3cU9JQlFvZVVjQUNVbjI2L0ZrSmgxQmlWUEppSnlv?=
 =?utf-8?B?SjlQY1hJSFplN2hydFNiR2tKQ2RKempDdlprUStRb0tYbUFQU3hwbVpDT0pJ?=
 =?utf-8?B?eHVab3J0UnI0bDUrRFpiR01acGRxMGZLZG16Uk9HUkNSekEwY0tmRUNXc2p0?=
 =?utf-8?B?T0V2UUViRGRwYWwzNWFZYmxlc0d5QmF1N2VmU2N0WFRHMXdUZGpGWnczTkdS?=
 =?utf-8?B?dm1vd3owT25HL3lSTmR6cjR4UloxSUlITWUyTXRSNjlhbVEyVDRaNmRaK2V0?=
 =?utf-8?B?RHFDb0RxVjhwamNxQ21aOVJNenp4ZW43R2FXdld1ZG5PQW9MVEZPUjQ0WWNZ?=
 =?utf-8?B?ZlR1cCtaY1lITnZwVVV3RHBaM3IxeG9aVzJEOWJWMUc0cmkzWG1BL0tsa3ls?=
 =?utf-8?B?Nk9Ndnp0NTQ0L2IySXFJd2h1UkVRZmFVUGZQUmFjM3FPbmpYRit4dXE5T1ZR?=
 =?utf-8?B?SnkxY1pjbjBvTCtEYjJLTW9vSFRDMEtHOFArSjd0aGJNWXJnOHIrei9mQ0dY?=
 =?utf-8?B?QTB0YVZlZDVoZkNDcFYrSWJNbjFOQW5BTzQ3S0ExTjExL0F6RFFZV2xWOWZv?=
 =?utf-8?B?SzkzRjY3MmlVaFBWUW9HU0p2Vm1OSU5GTGR4UkNTQXhLYjhRaU5UTE4xMTQ1?=
 =?utf-8?B?S3dZbE90STRnLzNaamVXeTdIcE5RdlR5SnU4NVNmS0J1eHBlSGJ6N0F5SHo4?=
 =?utf-8?B?RXZYNnFqSk5uWHRTbFAzWEFneVRYZURkNkpHb0FLTStpdGxDRmVxKy8zM2RU?=
 =?utf-8?B?cExYckJ3NkJhWkhXajFTYTFRaG5YWkJReXE2NjlFMGJzRU5BUTFjSVZ6Vkph?=
 =?utf-8?B?TnhPZVNXMEU1ZGlNQzBoOXBVYUpSL2xiQS9OYTZQdUR6ejZKSGhCZksrQmZQ?=
 =?utf-8?B?N2NMWGJyVVB6VmV2enZjUllURDJMd2JYUXkwUzZnT3ZHMkhiZTRIMkNLNmp3?=
 =?utf-8?B?Y3BzNXUwNlY1am1OUjIwN09rbVcvWWkyaHhyRktwYkhmZWc4aGxYQXNjUHpH?=
 =?utf-8?B?R1lxbzZPbStBbmdiczgwVkp2NFY0T2ZFdDI5clRDaGRpZEpIUzBBWjhTdXNV?=
 =?utf-8?B?M3FqenQ5YWw4ZXhKNy9iNzZEZ2JyMHZ1Z0Z0ZE1ESDFiYklRN2N5ZTZJd2Nu?=
 =?utf-8?B?Tk5LM3phQWhZZlpINDZaNzBOYnFCN2tYRjZoY2o4b0pmVE5rSkJDVkZ3VHV6?=
 =?utf-8?B?eG5HOW9CUHlOVFhaU3hIekQ5R1JacEJEYXhteHQ4d29WVE5aZnY2a1Q5K1dl?=
 =?utf-8?B?NnB1N2U0dzFUZ2lUeThxMWdXQ2FNbWY3dXVEVlZRdm1QazFJTjZiVVhTR0NJ?=
 =?utf-8?B?Qm53UGRCSnBFVUlZTHhqR2NweXhTTHJTazY3b0dkYkZMWkpkb1VHVGxXb2lz?=
 =?utf-8?B?R0ZMNXZPS2YvK2Q2WG9Lam1JVTVLU1E0YWV3NXlJNG1OV1R5WGtsM1FSNUVl?=
 =?utf-8?B?dzZvTEdDbWlDbVRweTF5QitwdlRrTEtRVVBqY3I2dnhXWkp6dTArQlVpbVls?=
 =?utf-8?B?K1dqN0NmUS9uQ0ZKQmY0OXBwc1orU1Q0dU4ya0JWdDdsSU1VMFp6bHpjQ1dJ?=
 =?utf-8?Q?QACJtc0g68nuo6Db9bQK6vU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42402662CB6F494480E82A47443BDF2E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eeb34af-adf6-490f-650b-08da618d1001
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2022 09:26:11.2687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Pqvxg19yBiXRX+GhYRQFUDeziKZqya4P2Ro+2zL7OnWYP/qQ7qtfvAIIkVAMeg6Tjjszjas6vFegdIeeGGZLYWFTI9V5yvq5hvv2+PY1IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1913
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA3LzIwMjIgw6AgMjI6MDQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gRnJpLCBKdWwgOCwgMjAyMiBhdCA3OjEyIFBNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbmRheSAwNCBKdWx5IDIwMjIgMTQ6MDc6MTAgQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4+PiBBbm90aGVyIHByb2JsZW0gSSBzZWUgaXMgdGhhdCBhIGtlcm5l
bCB0aGF0IGlzIGJ1aWx0IGZvciBib3RoIEU1MDAgYW5kIEU1MDBNQw0KPj4+IHVzZXMgLW1jcHU9
ZTUwMG1jIGFuZCBtYXkgbm90IGFjdHVhbGx5IHdvcmsgb24gdGhlIG9sZGVyIG9uZXMgZWl0aGVy
DQo+Pj4gKGV2ZW4gd2l0aCB5b3VyIHBhdGNoKS4NCj4+DQo+PiBTdWNoIGNvbmZpZ3VyYXRpb24g
aXMgbm90IHN1cHBvcnRlZCwgc2VlIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0
eXBlOg0KPj4NCj4+IGNvbmZpZyBQUENfRTUwME1DDQo+PiAgICAgICAgICBib29sICJlNTAwbWMg
U3VwcG9ydCINCj4+ICAgICAgICAgIHNlbGVjdCBQUENfRlBVDQo+PiAgICAgICAgICBzZWxlY3Qg
Q09NTU9OX0NMSw0KPj4gICAgICAgICAgZGVwZW5kcyBvbiBFNTAwDQo+PiAgICAgICAgICBoZWxw
DQo+PiAgICAgICAgICAgIFRoaXMgbXVzdCBiZSBlbmFibGVkIGZvciBydW5uaW5nIG9uIGU1MDBt
YyAoYW5kIGRlcml2YXRpdmVzDQo+PiAgICAgICAgICAgIHN1Y2ggYXMgZTU1MDAvZTY1MDApLCBh
bmQgbXVzdCBiZSBkaXNhYmxlZCBmb3IgcnVubmluZyBvbg0KPj4gICAgICAgICAgICBlNTAwdjEg
b3IgZTUwMHYyLg0KPj4NCj4+IEJhc2VkIG9uIHRoaXMgb3B0aW9uIHlvdSBjYW4gZW5hYmxlIGVp
dGhlciBzdXBwb3J0IGZvciBlNTAwdjEvZTUwMHYyIG9yDQo+PiBmb3IgZTUwMG1jLiBCdXQgbm90
IGJvdGguDQo+IA0KPiBUaGlzIGxvb2tzIGxpa2UgYSBiYWQgZGVjaXNpb24gaW4gS2NvbmZpZyB0
aG91Z2gsIGFzIHRoZXJlIGlzIG5vdGhpbmcNCj4gZW5mb3JjaW5nIHRoZSBydWxlOiBJZiB5b3Ug
d2FudCBzdXBwb3J0IGZvciBFNTAwTUMsIHlvdSBoYXZlIHRvIHNlbGVjdA0KPiBQUENfODV4eCwg
d2hpY2ggaW1wbGllcyBFNTAwIGFuZCBhbGxvd3Mgc2VsZWN0aW5nIGFueSBjb21iaW5hdGlvbg0K
PiBvZiBFNTAwdjEsIEU1MDB2MiBhbmQgRTUwME1DIGJhc2VkIG1hY2hpbmVzLCBidXQgZW5hYmxp
bmcNCj4gYW55IEU1MDBNQyBiYXNlZCBvbmUgYnJlYWtzIGFsbCB0aGUgb3RoZXJzLg0KPiANCj4g
SWYgdGhpcyBpcyBhIGhhcmQgZGVwZW5kZW5jeSwgSSB0aGluayBpdCBzaG91bGQgYmUgZW5mb3Jj
ZWQgYnkgbWFraW5nDQo+IEU1MDBNQyBhIHNlcGFyYXRlIHRvcC1sZXZlbCBvcHRpb24gaW4gdGhl
ICJQcm9jZXNzb3IgVHlwZSIgY2hvaWNlDQo+IHN0YXRlbWVudC4gSG93ZXZlciwgaWYgdGhleSBj
YW4gYWN0dWFsbHkgY29leGlzdCwgdGhlIGhlbHAgdGV4dCBhbmQNCj4gdGhlIE1ha2VmaWxlIG5l
ZWQgdG8gYmUgZml4ZWQuDQo+IA0KDQpXaGlsZSBsb29raW5nIGF0IHRoaXMgZGlzY3Vzc2lvbiwg
SSBkaXNjb3ZlcmVkIHRoYXQgd2l0aCBHQ0MgMTIgZnJvbSANCmh0dHBzOi8vbWlycm9ycy5lZGdl
Lmtlcm5lbC5vcmcvcHViL3Rvb2xzL2Nyb3NzdG9vbC8gSSdtIHVuYWJsZSB0byBidWlsZCANCmEg
Y29yZW5ldDY0X3NtcF9kZWZjb25maWc6DQoNCklmIEkgc2VsZWN0IHRoZSBHRU5FUklDX0NQVSBv
ciBlNTUwMCAod2l0aCBhbHRpdmVjKSBJIGdldDoNCg0KICAgQ0MgICAgICBhcmNoL3Bvd2VycGMv
a2VybmVsL2lycS5vDQp7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6DQp7c3Rh
bmRhcmQgaW5wdXR9OjM1MzU6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBgd3J0ZWVpJw0K
e3N0YW5kYXJkIGlucHV0fTo1NjA4OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZTogYHdydGVl
aScNCg0KICAgQ0MgICAgICBhcmNoL3Bvd2VycGMva2VybmVsL3BtYy5vDQp7c3RhbmRhcmQgaW5w
dXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6DQp7c3RhbmRhcmQgaW5wdXR9OjQyOiBFcnJvcjogdW5y
ZWNvZ25pemVkIG9wY29kZTogYG1mcG1yJw0Ke3N0YW5kYXJkIGlucHV0fTo1MzogRXJyb3I6IHVu
cmVjb2duaXplZCBvcGNvZGU6IGBtdHBtcicNCg0KDQpJZiBJIHNlbGVjdCB0aGUgZTU1MDAgKHdp
dGhvdXQgYWx0aXZlYykgb3IgZTY1MDAgSSBnZXQ6DQoNCiAgIENDICAgICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9pby5vDQp7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6DQp7c3Rh
bmRhcmQgaW5wdXR9OjM4MTogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6IGBlaWVpbycNCntz
dGFuZGFyZCBpbnB1dH06NDQ0OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZTogYGVpZWlvJw0K
e3N0YW5kYXJkIGlucHV0fTo0ODA6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBgZWllaW8n
DQp7c3RhbmRhcmQgaW5wdXR9OjUwNjogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6IGBlaWVp
bycNCntzdGFuZGFyZCBpbnB1dH06NTUyOiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29kZTogYGVp
ZWlvJw0Ke3N0YW5kYXJkIGlucHV0fTo4MTc6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBg
ZWllaW8nDQp7c3RhbmRhcmQgaW5wdXR9OjgzOTogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6
IGBlaWVpbycNCntzdGFuZGFyZCBpbnB1dH06ODg1OiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29k
ZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxMTA2OiBFcnJvcjogdW5yZWNvZ25pemVkIG9w
Y29kZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxMTMwOiBFcnJvcjogdW5yZWNvZ25pemVk
IG9wY29kZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxMTc0OiBFcnJvcjogdW5yZWNvZ25p
emVkIG9wY29kZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxMzkzOiBFcnJvcjogdW5yZWNv
Z25pemVkIG9wY29kZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxNDE3OiBFcnJvcjogdW5y
ZWNvZ25pemVkIG9wY29kZTogYGVpZWlvJw0Ke3N0YW5kYXJkIGlucHV0fToxNDYxOiBFcnJvcjog
dW5yZWNvZ25pemVkIG9wY29kZTogYGVpZWlvJw0KDQoNCg0KQ2hyaXN0b3BoZQ==
