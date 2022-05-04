Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3849E519F20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 14:20:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtbWP1S7Kz3bdC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 22:20:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtbVw3H0Cz3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 22:19:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh7EO/QgYr4ZTZVpZrj+gC/LrUDx6CfKp/b63pqIiQExFVPHMRXiznmTts+CQnh6md2rjdJCRYbKpXznYeUKHNJXBaoAfB32J2QCVnRA6ogEO2gGDFW7OxS3q8XNslqYjOiKChP/sswJ+HhyCVm+HMcKrTM9JPDumffQqp63wqNRNyzCdawEeuevUVrHXoen8g2UAsgQXqQV8M9UqxuZCJXTfjyDEx9m/n6BmA6FfjTn1osFGjNOrDgyL29RgAlKMu3E9w/D7uIyDfC7HRibVgYds+Bp/IAxyQSX1evdn9DYzAhaBbWau5mClx/iOQtBY0CSqPhovGxMSNm8yQJQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwo2sTzd1Fv2WUFh7LXhTU3vJQ6BY2HatD64yOW9Trw=;
 b=aId7uTSWMqD6/EL64/uW1m6o8rOdIvFfwE0+9i5uV4TRSwt4wt25gXH8TneH9t7XLPolAIXbG7/AcGK4GAgNR8PbG+NXtssX7dx6L81hlQRzoGzQ1lY2tA3bs+tNKn3XrbgBqp152nBYegJPALVT8gNNDhq31Gs5jlyTXcOUsWJ+1P7GaeczVRSZrBSlCUxqtxCkVLvXfwZ6d67l56hCLA3Ur6bMhuMOZwPlAV2i4uTZtYMLBEjKBE5S/7DDcwKn7OnbLSjh4WXk+Yih2EBW5rHRC4jbuKJAxtAedjUqSNtcuSDxLKNfwbzAINmA9oatqPLRq0YX5ckhG+RJcSsR7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1638.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 12:19:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 12:19:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v1 08/22] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
Thread-Topic: [PATCH v1 08/22] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
Thread-Index: AQHYP4vPBTNDUSKTeEOC4y2yFRN9Daz1Xy0AgBmEJYA=
Date: Wed, 4 May 2022 12:19:31 +0000
Message-ID: <4e8386b5-56e7-7cb9-dbe3-97b048846192@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <fb60b19f154db8132a00c2df7aca7db3e85603b5.1648131740.git.christophe.leroy@csgroup.eu>
 <1650262952.h2adiu8czw.naveen@linux.ibm.com>
In-Reply-To: <1650262952.h2adiu8czw.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81b133de-d073-4381-59c8-08da2dc857bd
x-ms-traffictypediagnostic: MRZP264MB1638:EE_
x-microsoft-antispam-prvs: <MRZP264MB16381776362B2C6CE6F450D3EDC39@MRZP264MB1638.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LiIqm6c8XwKyARKYBHYTy7DUOz+kp5QjffTmpmvULF5K9X+8P1s/N9tEJYVE6GmEKJPeGxaaaI+4L3RW6rhKqcSLyMCIHYmqRAmTp95SuGqQakR4Y51+P9nmdMDDPhAqRNIxwNsnKb6t9pSbnayFnZQZBmZmJdX84q+RDakDhpl3j4hfJGKoV29YbNU108KrdgYXwjGWu20NmXTJyjYPLP5CwkL8H3tFiOli5dlIUbUDPJB/djjFJFLYc4InxmCybCqVGfhjKhBaltbES9SVeBNU0JvtpOU/XAe6xzwSMPyKO0rD8xTmEQ4qT57ZYLcjfM918gLdyBU0ek4m9JsiqxulFz+nbIcMJaKHZaSnr807S0Betmbb+WTUyk458v+l+EmEahT4qFuzh8U26/vpAU1QSRGAHpbzOlePl+hibN2yGx5qfDfY3imBLM2ZyO/FSmnH9/SqtsBSP/A69exBcwyU1uv5sA5oeD7mDJbq7+c88Pya4dNrhDCLBabp9KhbYj/zitDn7WcbEOUNjLBgHGmj8vltoAQI78PBmRKvTi1MtQOcz2vwlU6YggschuT6PiB0wWFFY1jAD6dsliB47DykzIpriTAy10yuOgJ9RniH8MD2wE1Ndh2qydUsL09UVEaWiIVwc8VtZ7x5TvWRoPjqFk1Vqb/d5AEBLFvb+DX1EGq4How3CkvWEUpDzgG4lrZUuT4a5RdKZY0TAz2M2GWC+CXBAGmCcERczR/uyuZSyzTIo6s2+Y/nf002YPWJ9enINGBT6mRx3WykoLRzaQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(6506007)(36756003)(44832011)(5660300002)(31686004)(38070700005)(2906002)(8936002)(83380400001)(508600001)(66556008)(6486002)(66476007)(66446008)(8676002)(4326008)(38100700002)(64756008)(66946007)(76116006)(91956017)(71200400001)(122000001)(26005)(186003)(66574015)(54906003)(110136005)(86362001)(31696002)(316002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U05pd2VITzQ5UU9zOWVaVEtaLzJ5dFZ5MGRrUExZUFVlSUZKNjBHQ0ZXVVBL?=
 =?utf-8?B?RmljTXYzWDF4WHk3YTIvaHpIZTRFTEFsdkw2OU05MmhkUzJwK3lNOTNPSW4y?=
 =?utf-8?B?TmU4a1dweVdISWVrdlJYNWZCWlJ5bStROGdYMmVNTUpzSDBTRFdTNkkva0tk?=
 =?utf-8?B?c1JBZHhzM0Y0SU55MVF0L1RmckpQSHpwVzdSSTZqRFVRN3U2YjRHTDVGSWw2?=
 =?utf-8?B?NFRDUzN6dTQyVFdITjB4azJrbDBqTU4rOHdJQmd6bVZaYTlycFJSamhFZzZL?=
 =?utf-8?B?TnFhMWdTVkJPdnZBTlBrTnVKOXoxd1ZTTDF6ZEUxRFhSM0FkRTlFN0F0eStp?=
 =?utf-8?B?WWtqYWoxSms3blA2UmNoenFiSnlpSnlzM3NtS0NZQ3lpVkNRdTFUaWFwQkZN?=
 =?utf-8?B?UFhPWUxwcnBWYnpBSVBkUkZxeVdEeDZ2RjhHM2E0WGs3bnBRWGFlam50Y1Qy?=
 =?utf-8?B?WFBwL1B1S1dWMlE4ZEtqR0RTQkIrNVZnR05ldFh3TnBBaVJ1ajhiNVJMbTBn?=
 =?utf-8?B?a0g0QVBjV0wzNy9kVFNtY0YrWUl6SzFEYmNrN2dhR1pvVlRBRzZnM2JmOVFZ?=
 =?utf-8?B?MlVZQ1NTRUlJRHZsTGo5TVBneXFvQ2UwTVFxNTN1dWcrZ3p2UkFwWlV2MGxS?=
 =?utf-8?B?dUpZenRudnNtVzlUb0wrMzhQQXN2Y0E1NjR5d2VGNURiSDZCcDZ0ZEJ6cnlI?=
 =?utf-8?B?VGd6ZmhBNnJFOUdUNFB3RXh0aktYLzQ4dkc5cEg3cVhoSTR5akxPbmZYcHV5?=
 =?utf-8?B?Y3pKRW55NTVWLzc0ZkNsZFdGdmZJdnJSSUtGMTZQYTAxN0V3Z2Y5bGs5c1dr?=
 =?utf-8?B?MnRlakRBdjZsdlJXZkxMM2w0L2k4WWpKd2lrZVcwUXd1UDd1OVUraThsdnZU?=
 =?utf-8?B?Rlp3cHpzTGUyMDNwSERlSCtzb3R4R2VuWXlsU3RLclZhRmtzMFBnSHlSTFJw?=
 =?utf-8?B?U2J6Y2lRTjMzaDkwWVhFNmVXVGJmWWRhOGlKdEtGS1ROd3pYZjNkZ2xocUJq?=
 =?utf-8?B?dUtTR242ekNBVlpMQXhpRnRBV2padjV1TXNGcTYwbnd6OVdHbVM1OUVYcm1C?=
 =?utf-8?B?TytzZkQxWjkwQU9QVUhmZC9lSXNESEV1MUJ6VlNMcDVyNVBFeG9FeGVWM3FO?=
 =?utf-8?B?aTNRUzNEZ3F3T2M2S1RzMUJ2RG5LVDJHcGJXRWVwa1pQYUlxZkFwN0hZU3R6?=
 =?utf-8?B?MXlmaStrZTRLYTdabGxDVk5YM2UvWkZjM1VhcFBRSTY4c0txR251Z0hrQlJB?=
 =?utf-8?B?OU5wam1hekQxbktYQW5jN2RFS3g4STh2eVJUMTdwNEJNcVFYMXBkdXJQRUpR?=
 =?utf-8?B?eXh3R1RZc3JkK0RhOG14NmdxM2FLYW1OVWRJSFg5S1RDVGIyaVVtSzVjbHMz?=
 =?utf-8?B?VzZlOGErRTdOdE1IS0h1KzQ2bWF5OVVpVUlVaGV0UmxwS3IzSVdzRU0rZGVO?=
 =?utf-8?B?M2IxVmQ3SUZTWG9XdkxFbVB0VUJ1M2ZFUHBOZnd1TVFiRGJHeHVtcDZYTnNq?=
 =?utf-8?B?Sm1kbTl0dEZlY3J2NVE2M0p2Zmtsc0hLRVpNSFp6VlJOdWpYTG10ZnkrNk5X?=
 =?utf-8?B?OGlRMDhHOE5LcE9zd3V1R0FSREkvdkpsVy9lTTdsVEpZZ1RSOVJVM3packZl?=
 =?utf-8?B?TFhaenlXNGZDSWFKZHVYeWF4UGV4MEs0OU1wQ0hyQTFzRFpCcWRZcVRkd0l2?=
 =?utf-8?B?Q1EvWmR5VjNSQnBvR1JBN2phM1o1LzhGc0xhK1lTQTYrbGthVnpPQVl0WnNt?=
 =?utf-8?B?L0g5TThwcUs3QnQ4OXlrNXVwRmdDd3ViZUFSRjhqRHpBSmpncHh1Ujk4bjdY?=
 =?utf-8?B?aW41SGE4NXBYclF1b3g1Y0p4Q0lxaU4yTTBiUnhxT2oyUTRTbCt4QlhSRmhL?=
 =?utf-8?B?WkVneFBDMlZlUlc1cWFuZUNtM1pxb1V1WWx3UXRuaVJ3S2h0cGg4dllpVnhR?=
 =?utf-8?B?N3hLV2VZazRseVkzcDMycEdUVER0QzIzUjJWRHd1cW5RT0lPQlMrMDBRbmZD?=
 =?utf-8?B?Y3dqT1BRZEg0aFlLd0xudFEwV21WSFNaeEtjcGJiUkdBd3dSRmxadFhHSVNl?=
 =?utf-8?B?dUd0alNnclFlQ2Fya2NiRm5xQkxqTnc3NjVES2V1RStibHd6TEtZT2ZraXE2?=
 =?utf-8?B?M1FIZmU2SlV4WFBneS9NNFdGaUVXeU05b2pzNnBvbTNKb3Z3TkpHdWdCV29M?=
 =?utf-8?B?ZlpIclB5WXA4NTNOQzVhUUQ1Nnozcnptd05Zd2RyaXVyNTRHMk1RTmFNVlhm?=
 =?utf-8?B?N0JEWE11eVdUQ2IrZk1RSzJrSkZhRzJ0R1NkVCtJQ0krS2NiMFRVSVRNUE1F?=
 =?utf-8?B?ZWVjdzRISG9aOWNzekNNb0EydTNrUU0zRjk2eUp5YXg4SHJtcllkdGU4ZTlH?=
 =?utf-8?Q?u7NOBS5+MVaZyr9UM3KjaY5a/Fey21dcZDq/9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9509C3C9220B5F4FA379CCBE298AC766@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b133de-d073-4381-59c8-08da2dc857bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 12:19:31.4770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4aY6rmUu5h/GWxZnsWvpeNvbH0ItoVX786yi43l5fJ6Wz3yzNbGlTbOFsCwia8Ir/y5Pl9teeYUHs4vVTVyqZNcBguvMuBwHoWgQkwZ3cx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1638
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

DQoNCkxlIDE4LzA0LzIwMjIgw6AgMDg6NDAsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IFNpbmNlIGM5M2Q0ZjZlY2Y0YiAoInBvd2VycGMv
ZnRyYWNlOiBBZGQgbW9kdWxlX3RyYW1wb2xpbmVfdGFyZ2V0KCkNCj4+IGZvciBQUEMzMiIpLCBf
X2Z0cmFjZV9tYWtlX25vcCgpIGZvciBQUEMzMiBpcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlDQo+PiBv
bmUgZm9yIFBQQzY0Lg0KPj4NCj4+IFNhbWUgZm9yIF9fZnRyYWNlX21ha2VfY2FsbCgpLg0KPj4N
Cj4+IE1ha2UgdGhlbSBjb21tb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDCoGFyY2gvcG93
ZXJwYy9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgfCAxMDggKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFj
ZS5jIA0KPj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBpbmRleCAx
YjA1ZDMzZjk2YzYuLjJjN2U0MmU0MzliYiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvdHJhY2UvZnRyYWNlLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmMNCj4+IEBAIC0xMTQsNyArMTE0LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZmlu
ZF9ibF90YXJnZXQodW5zaWduZWQgbG9uZyANCj4+IGlwLCBwcGNfaW5zdF90IG9wKQ0KPj4gwqB9
DQo+Pg0KPj4gwqAjaWZkZWYgQ09ORklHX01PRFVMRVMNCj4+IC0jaWZkZWYgQ09ORklHX1BQQzY0
DQo+PiDCoHN0YXRpYyBpbnQNCj4+IMKgX19mdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAq
bW9kLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGR5bl9mdHJhY2UgKnJlYywgdW5z
aWduZWQgbG9uZyBhZGRyKQ0KPj4gQEAgLTE1NCwxMCArMTUzLDExIEBAIF9fZnRyYWNlX21ha2Vf
bm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwNCj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5W
QUw7DQo+PiDCoMKgwqDCoCB9DQo+Pg0KPj4gLSNpZmRlZiBDT05GSUdfTVBST0ZJTEVfS0VSTkVM
DQo+PiAtwqDCoMKgIC8qIFdoZW4gdXNpbmcgLW1rZXJuZWxfcHJvZmlsZSB0aGVyZSBpcyBubyBs
b2FkIHRvIGp1bXAgb3ZlciAqLw0KPj4gK8KgwqDCoCAvKiBXaGVuIHVzaW5nIC1ta2VybmVsX3By
b2ZpbGUgb3IgUFBDMzIgdGhlcmUgaXMgbm8gbG9hZCB0byBqdW1wIA0KPj4gb3ZlciAqLw0KPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtbXByb2ZpbGUta2VybmVs
DQo+IA0KPiBTaW5jZSB5b3UgYXJlIG1vZGlmeWluZyB0aGF0IGxpbmUgYW55d2F5IF5eDQoNCm9r
DQoNCg0KPiANCj4gDQo+PiDCoMKgwqDCoCBwb3AgPSBwcGNfaW5zdChQUENfUkFXX05PUCgpKTsN
Cj4+DQo+PiArI2lmZGVmIENPTkZJR19QUEM2NA0KPj4gKyNpZmRlZiBDT05GSUdfTVBST0ZJTEVf
S0VSTkVMDQo+PiDCoMKgwqDCoCBpZiAoY29weV9pbnN0X2Zyb21fa2VybmVsX25vZmF1bHQoJm9w
LCAodm9pZCAqKShpcCAtIDQpKSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkZldGNo
aW5nIGluc3RydWN0aW9uIGF0ICVseCBmYWlsZWQuXG4iLCBpcCAtIDQpOw0KPj4gwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVGQVVMVDsNCj4+IEBAIC0yMDEsNiArMjAxLDcgQEAgX19mdHJhY2Vf
bWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLA0KPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVJTlZBTDsNCj4+IMKgwqDCoMKgIH0NCj4+IMKgI2VuZGlmIC8qIENPTkZJR19NUFJPRklMRV9L
RVJORUwgKi8NCj4+ICsjZW5kaWYgLyogUFBDNjQgKi8NCj4+DQo+PiDCoMKgwqDCoCBpZiAocGF0
Y2hfaW5zdHJ1Y3Rpb24oKHUzMiAqKWlwLCBwb3ApKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHBy
X2VycigiUGF0Y2hpbmcgTk9QIGZhaWxlZC5cbiIpOw0KPj4gQEAgLTIwOSw0OCArMjEwLDYgQEAg
X19mdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLA0KPj4NCj4+IMKgwqDCoMKgIHJl
dHVybiAwOw0KPj4gwqB9DQo+PiAtDQo+PiAtI2Vsc2UgLyogIVBQQzY0ICovDQo+PiAtc3RhdGlj
IGludA0KPj4gLV9fZnRyYWNlX21ha2Vfbm9wKHN0cnVjdCBtb2R1bGUgKm1vZCwNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGR5bl9mdHJhY2UgKnJlYywgdW5zaWduZWQgbG9uZyBhZGRy
KQ0KPj4gLXsNCj4+IC3CoMKgwqAgcHBjX2luc3RfdCBvcDsNCj4+IC3CoMKgwqAgdW5zaWduZWQg
bG9uZyBpcCA9IHJlYy0+aXA7DQo+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgdHJhbXAsIHB0cjsN
Cj4+IC0NCj4+IC3CoMKgwqAgaWYgKGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCgmb3AsICh2b2lk
ICopaXAsIE1DT1VOVF9JTlNOX1NJWkUpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZB
VUxUOw0KPj4gLQ0KPj4gLcKgwqDCoCAvKiBNYWtlIHN1cmUgdGhhdCB0aGF0IHRoaXMgaXMgc3Rp
bGwgYSAyNGJpdCBqdW1wICovDQo+PiAtwqDCoMKgIGlmICghaXNfYmxfb3Aob3ApKSB7DQo+PiAt
wqDCoMKgwqDCoMKgwqAgcHJfZXJyKCJOb3QgZXhwZWN0ZWQgYmw6IG9wY29kZSBpcyAlc1xuIiwg
cHBjX2luc3RfYXNfc3RyKG9wKSk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7
DQo+PiAtwqDCoMKgIH0NCj4+IC0NCj4+IC3CoMKgwqAgLyogbGV0cyBmaW5kIHdoZXJlIHRoZSBw
b2ludGVyIGdvZXMgKi8NCj4+IC3CoMKgwqAgdHJhbXAgPSBmaW5kX2JsX3RhcmdldChpcCwgb3Ap
Ow0KPj4gLQ0KPj4gLcKgwqDCoCAvKiBGaW5kIHdoZXJlIHRoZSB0cmFtcG9saW5lIGp1bXBzIHRv
ICovDQo+PiAtwqDCoMKgIGlmIChtb2R1bGVfdHJhbXBvbGluZV90YXJnZXQobW9kLCB0cmFtcCwg
JnB0cikpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBwcl9lcnIoIkZhaWxlZCB0byBnZXQgdHJhbXBv
bGluZSB0YXJnZXRcbiIpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOw0KPj4g
LcKgwqDCoCB9DQo+PiAtDQo+PiAtwqDCoMKgIGlmIChwdHIgIT0gYWRkcikgew0KPj4gLcKgwqDC
oMKgwqDCoMKgIHByX2VycigiVHJhbXBvbGluZSBsb2NhdGlvbiAlMDhseCBkb2VzIG5vdCBtYXRj
aCBhZGRyXG4iLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHJhbXApOw0KPj4g
LcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4gLcKgwqDCoCB9DQo+PiAtDQo+PiAt
wqDCoMKgIG9wID0gcHBjX2luc3QoUFBDX1JBV19OT1AoKSk7DQo+PiAtDQo+PiAtwqDCoMKgIGlm
IChwYXRjaF9pbnN0cnVjdGlvbigodTMyICopaXAsIG9wKSkNCj4+IC3CoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVQRVJNOw0KPj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4gMDsNCj4+IC19DQo+PiAtI2Vu
ZGlmIC8qIFBQQzY0ICovDQo+PiDCoCNlbmRpZiAvKiBDT05GSUdfTU9EVUxFUyAqLw0KPj4NCj4+
IMKgc3RhdGljIHVuc2lnbmVkIGxvbmcgZmluZF9mdHJhY2VfdHJhbXAodW5zaWduZWQgbG9uZyBp
cCkNCj4+IEBAIC00MzcsMTMgKzM5NiwxMiBAQCBpbnQgZnRyYWNlX21ha2Vfbm9wKHN0cnVjdCBt
b2R1bGUgKm1vZCwNCj4+IMKgfQ0KPj4NCj4+IMKgI2lmZGVmIENPTkZJR19NT0RVTEVTDQo+PiAt
I2lmZGVmIENPTkZJR19QUEM2NA0KPj4gwqAvKg0KPj4gwqAgKiBFeGFtaW5lIHRoZSBleGlzdGlu
ZyBpbnN0cnVjdGlvbnMgZm9yIF9fZnRyYWNlX21ha2VfY2FsbC4NCj4+IMKgICogVGhleSBzaG91
bGQgZWZmZWN0aXZlbHkgYmUgYSBOT1AsIGFuZCBmb2xsb3cgZm9ybWFsIGNvbnN0cmFpbnRzLA0K
Pj4gwqAgKiBkZXBlbmRpbmcgb24gdGhlIEFCSS4gUmV0dXJuIGZhbHNlIGlmIHRoZXkgZG9uJ3Qu
DQo+PiDCoCAqLw0KPj4gLSNpZm5kZWYgQ09ORklHX01QUk9GSUxFX0tFUk5FTA0KPj4gKyNpZm5k
ZWYgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUw0KPiANCj4gSXQgaXMgYmV0dGVyIHRv
IGdhdGUgdGhpcyBvbiBQUEM2NF9FTEZfQUJJX3YxDQoNCldlbGwgLi4uIGxldCB0aGVuIGZpcnN0
IGNoYW5nZSB0aGlzIHRvIGEgQ09ORklHXyBpdGVtLCBpdCBzaG91bGQgDQpzaW1wbGlmeSBzb21l
IHN0dWZmIGhlcmUgYW5kIHRoZXJlLg0KDQo+IA0KPj4gwqBzdGF0aWMgaW50DQo+PiDCoGV4cGVj
dGVkX25vcF9zZXF1ZW5jZSh2b2lkICppcCwgcHBjX2luc3RfdCBvcDAsIHBwY19pbnN0X3Qgb3Ax
KQ0KPj4gwqB7DQo+PiBAQCAtNDY1LDcgKzQyMyw3IEBAIGV4cGVjdGVkX25vcF9zZXF1ZW5jZSh2
b2lkICppcCwgcHBjX2luc3RfdCBvcDAsIA0KPj4gcHBjX2luc3RfdCBvcDEpDQo+PiDCoHN0YXRp
YyBpbnQNCj4+IMKgZXhwZWN0ZWRfbm9wX3NlcXVlbmNlKHZvaWQgKmlwLCBwcGNfaW5zdF90IG9w
MCwgcHBjX2luc3RfdCBvcDEpDQo+PiDCoHsNCj4+IC3CoMKgwqAgLyogbG9vayBmb3IgcGF0Y2hl
ZCAiTk9QIiBvbiBwcGM2NCB3aXRoIC1tcHJvZmlsZS1rZXJuZWwgKi8NCj4+ICvCoMKgwqAgLyog
bG9vayBmb3IgcGF0Y2hlZCAiTk9QIiBvbiBwcGM2NCB3aXRoIC1tcHJvZmlsZS1rZXJuZWwgb3Ig
cHBjMzIgKi8NCj4+IMKgwqDCoMKgIGlmICghcHBjX2luc3RfZXF1YWwob3AwLCBwcGNfaW5zdChQ
UENfUkFXX05PUCgpKSkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gwqDCoMKg
wqAgcmV0dXJuIDE7DQo+PiBAQCAtNDg0LDggKzQ0MiwxMCBAQCBfX2Z0cmFjZV9tYWtlX2NhbGwo
c3RydWN0IGR5bl9mdHJhY2UgKnJlYywgDQo+PiB1bnNpZ25lZCBsb25nIGFkZHIpDQo+PiDCoMKg
wqDCoCBpZiAoY29weV9pbnN0X2Zyb21fa2VybmVsX25vZmF1bHQob3AsIGlwKSkNCj4+IMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+Pg0KPj4gKyNpZm5kZWYgQ09ORklHX0RZTkFN
SUNfRlRSQUNFX1dJVEhfUkVHUw0KPj4gwqDCoMKgwqAgaWYgKGNvcHlfaW5zdF9mcm9tX2tlcm5l
bF9ub2ZhdWx0KG9wICsgMSwgaXAgKyA0KSkNCj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
RkFVTFQ7DQo+PiArI2VuZGlmDQo+IA0KPiBIZXJlIHRvby4uLg0KPiANCg0KT2sNCg0KQ2hyaXN0
b3BoZQ==
