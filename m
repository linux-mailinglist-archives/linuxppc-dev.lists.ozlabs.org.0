Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83451B89A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv4lc5WFjz2yXM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4l65K95z2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:17:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOB4kThTKCoF+Sfa8okPFa7HVnVb52LO/9kzTAmFCacAodlW/0kxmL8QBjRylULbTyN6YT6UZNyAOk7DJKJKigb+id+gZehe6Go+ZG/+gyD5nLpNANX2/qEjRaud4u4jC/oFyCvEASIqzjWY0qnkRHbbC/1u8S1rPtlYOcyN770chV6EC7GaFwHMBwpysjufj9L5RXfnySn4Zs0WitjR8aWjBC14ty48QAwLxONO9cHgrvjoqzxhkFyzZ13wLap5KStxDjgwq2phyZk7r/Vg3VJMxZFmmJ6RRyLpRVhSdPw/LG76YQfwx0VOJdrme3MnPvrYelpi4svaQsPampl9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLhJzfOiwk9lGAIoyWPEmNXarZeOECRSwkvgEhz/lJU=;
 b=A3RZH8ELDXp4BWfndBeEOQu1pHIZNe3PQ3P1tgI0Du5szC0WRmRXgN5QfeMeE6+gG8/+cRsiBMO/rUXRiEdbNtaBkCKV2BesgHFe/f1w4LHW7FpPZUHfzed1V8WQm9yqAA/8yynbHbiVhRsZo+FZ/Nq6OPJSDM0kyJFhAM6BNxScH3LgtqjyqX4f0HUs3tCyQxS2EDTDf2mv0b3h+X16fdcsvxX2tUuNoandX8bzCUE37yBnGh0UhF7IvZvxIRbDjyWph3MseuM61anzq4MrqFhARnUGoc76jdnY9Dr9WgS8WPpebKXXdGG0edZGfvPfx9VRXWIhqEkiclgAYKaKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1651.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 07:16:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 07:16:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for PCI
 domain
Thread-Topic: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
Thread-Index: AQHYX+CVr5cYv2XtSUm2WBz3qEQlAa0P4F6A
Date: Thu, 5 May 2022 07:16:40 +0000
Message-ID: <8ffa0287-de5e-4308-07d8-204ac2e7f63a@csgroup.eu>
References: <20220504175718.29011-1-pali@kernel.org>
In-Reply-To: <20220504175718.29011-1-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d885178-67f3-46f6-4119-08da2e6733bd
x-ms-traffictypediagnostic: MR1P264MB1651:EE_
x-microsoft-antispam-prvs: <MR1P264MB165189FBDFE5F56722DBB7F7EDC29@MR1P264MB1651.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ndLnOPJbvqZWqRRkDGnmlXp5MmRZ6o4z9AR+iPGDnea6TPMKfdeBH8H1CHSNyU6stOjUjsAUoaGH7ALqPmyd7cPzy6a6wcP6IQxV3rmFU54kFCHQ7kNY2OZR5K05WCqtx1X2TP2/hvCFgPYaBm70pD859YDy6a5kGJvCQAQprUhc+/LIiKmh5+vBgM9zJUM3bhghuC0wJZbrzn7fC3I7dDRXfMeafwpjfCyXPihUkMBlSQHlesecZbh2qCn31pEWj3RAhcQj4/UphEHKBA7ojdJ/FGktAFq6gcumHgBMEEmoFBE+CxV+JbVM7qPdo9yxfcwi0VjpkAyytCSu4iHa6654pQFYDr1w6vdQ7nG9InoKl0+RX4p33HcrDcSeVKEydqYoh7dQv5n1YyBx82cYJ2OLZw7B1t5q929h92dk4CuNQkID5QV8dY5tE8wdWEie/TDbIGgpg9Apko8B+HMEiKimt4fEPkvUYVh1JicaRtuo3+T/zEwWTzUZQpEgC57ka8mmBXcGXXkBu+9PyhNBU8vjo9eNeLbHcY5uMTILPl+qKYOWFw3thPAYLRhEVF7jYACbw9TKwPINp2BE+Vr+vuARHdAqolRkYOjtlmgOHhS5Olqj7QKLjlCjiV1/2QrDtq//II2+ZOHdtU+KbpV2Zw6nv5vSpFRFdzK2yD1wuo0GfmzjGyFtNVn7CzzAV2BjOAagb3t9JE+Cc4PoIcwo6ik4o14nhMcZsklWEXJg2caS7eb08edOUIWyApqhI9kwiRKwi0IvDnvWmAnAh9fIVw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(76116006)(71200400001)(86362001)(66946007)(8676002)(38100700002)(6486002)(91956017)(4326008)(31696002)(508600001)(66556008)(66446008)(66476007)(64756008)(316002)(54906003)(110136005)(186003)(66574015)(122000001)(2616005)(26005)(6506007)(83380400001)(6512007)(31686004)(36756003)(8936002)(44832011)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDRzMUZITnl1ZDlMd1VNZlBxN2dzWlhZcDEyOU9VWVVmTk9SL0tJNWpyM3c1?=
 =?utf-8?B?R0oyQ2FycGYzNGdGQkRlTnRXKzZDbmtPQlJ0L0VWOTFUeG5NM2FTTG9aMnFV?=
 =?utf-8?B?RWNQZlFtbnhHMUdyYmk2VUN2bDlFUFNrdFFrd0g0Sm5CbE9SamtVRFB5V0l1?=
 =?utf-8?B?QzJjK2VEdzgxbkRkY0NoUVBWR3hGSlBicVdYdlhJR1A5TWpQWVBTQzMzckdQ?=
 =?utf-8?B?TlRMU1JPMDE4SVJIdHg3UmhxTWNyUnZzTk5CK25BS1I2Rko5K1dKamw0UXJD?=
 =?utf-8?B?L3JGK0dCeGFrZjYyWmtmMitXTjJMTVY1T1FUdDZFWklBa1p0eHdNaVpFTmgw?=
 =?utf-8?B?OVhGMHh3NW1SWTdpMWJRTmR2NzgwQmh0Ymo3VWhQT1NCWlg5WGM2RXhLeE12?=
 =?utf-8?B?KzdrVnBvNzlVYTZEcTN2dDcxMHZtem92ZkFqU3hRN0V6Qy9qcVNna2VjelE4?=
 =?utf-8?B?Y2VzdU1OTHF5RURWb3FiZW1JOTdSWlFWUjF6MmNocUJpd2oxOStmMlM4Y0NF?=
 =?utf-8?B?bzlicC9CUXVGbzhKMnRIN0EwMnVrcE0relBTOEIrMERDSWYyRjByV1pnc1R0?=
 =?utf-8?B?bXcxN2Jmd05pdld1dHlHWnp2enorbmNNQ0tVUyt6bFljTUZxKy9oN3Nxc21y?=
 =?utf-8?B?bEYxa2laQVdNbTIxd2J3RVkvbmlGOFQ0NnI2STFUbWYrVXhob1ZtZUFaSytu?=
 =?utf-8?B?bEEvaWN4SUY2UWpCMmNySzJtSUFyOVpNNnkxN1JibEZOMGp1NTNwejZYTS9H?=
 =?utf-8?B?S0RLN3lWajZSUUc5Qkw0UUtEdmFJei9JNjV5YW90NTV4NnZMcE5naStXUUt3?=
 =?utf-8?B?c0FJSjhJNlpQemRRZXRhbkluY1hOdmZYOTFDTW4yTzhQYWNpQmk3azlEamZN?=
 =?utf-8?B?VGppK3BzUWk5Sk5yWTFRZWdlQS9QN0tsdloyRlJaUSt0WWU0SGhuTW5kb2ll?=
 =?utf-8?B?NU93ODBWQUtMb3NhVGRPTzZwZE9OazBpZC93TjZiZDV6RWNLWnI4WkNpaWlY?=
 =?utf-8?B?TDcwb1RhMkFGRDhpNmVoL2w1OEs2UkFuaTQxbU1zRDQwVW1lNllNYWxtbUor?=
 =?utf-8?B?bXdyZ29UdTYwTkNtd1VGYUo4MW03MlJVVmdqcVBFd3dwMjZ3ZnQ1d2EvdnBU?=
 =?utf-8?B?V1BLbG9pN1AwN20vNHMweGM1bS9wREtqUVptdnZwK28wdEIwM2Z1bGxTQTdE?=
 =?utf-8?B?cUhQNHVxRUJ6TUNQSk1pYWR1YlIwL0xpRDF4WCtXSHhmK3dYVEZIU2IyVjdl?=
 =?utf-8?B?OFU1L3g5UERpN09Sbi9IYTBlZVdpaHllNkI5ay9Hd2ZESXpsUWpqUDQxd0o5?=
 =?utf-8?B?Y0xTY25pbmlPSDA5bDVsS05vTTM2QmQzTjdoQjJzd205NEN1TzM0RXdqaHNR?=
 =?utf-8?B?VkVEclNzQVhHTnp5MThkdnI3QTJyYkE3cktYUDYyVVhRQVo2YW1VZUJTSzZP?=
 =?utf-8?B?cStVUXF1dGVoL3IyVEYwRDdRZWFiTHVrZDBKOGl1L0xKMFI0TzIrbGprYWlw?=
 =?utf-8?B?Y25adVlWMnVoc2M4UXEvM1N0Vyt0QXlZZ01mWE1lL2VFN1hic09wVk5ia2VW?=
 =?utf-8?B?ejlJNUVKQkxvMUpmaysxdzEzRC9wbVBFb09hdXhWUDVYYU5HaTdvN0YzTFF1?=
 =?utf-8?B?cG1QK1ovTnJlTG54N3NIeFlaMExBbEFyR0RzMnIveFU1aGpnT2pGY2hCTVcz?=
 =?utf-8?B?M3JidElNS29udjRSYVZnRVRXSlNTbzFpTU1rRTg5NTZOMVVWSENRNzdlczV3?=
 =?utf-8?B?amJFNlloYXhjNTlqYUZ6WExmYjdPU1NYUkJURENYMlFwem8zL1pKdFJWV1lO?=
 =?utf-8?B?QTRGcUQ0M1djcXdVQUhid1BVR2lkZG5PSklJZnZjZFlpUFBLQWVWdlA1M1cx?=
 =?utf-8?B?R0tQZjZaeEJPU2dJbEtKTjBPTGZKeWxtZm1KWlhuZ1lqK1gweFljKzFBRndo?=
 =?utf-8?B?YXVjN2JLVWNMbnp3N3NVTDY3R1FaMldpKzA5UUo2VXZIbmZ5eCs3RllVYks2?=
 =?utf-8?B?MSs2VUdUZENhejFNWTJyR1pCWGNHN0kwdkNkRGFUcExKc215WkZwRDlZRUZG?=
 =?utf-8?B?NTFXaGJscS9tVGRoQUF5M1c4TmJFRUkyTTgwajk2dllRWWNHL3JtRVdiSVBt?=
 =?utf-8?B?VFhuckxIQ05HTDhoSnQyelhBTlFsdW1PUjhmUzJmeWtTNnNGQk93TW5iMnM3?=
 =?utf-8?B?dUZKdG9mck1IRFRlQitWRU1vK3FzK1FRdlIzeFFMTUJWeXZMM3hZT0x5VGZs?=
 =?utf-8?B?NHJjSTFhTVpIRjByU3pIWldFb3laU2p2Q0ZLM1NOdzh1cjJDVUNrcFpHZFBa?=
 =?utf-8?B?Q3d5dGFUd3UxaDRQclJDMElvdzUwYkdwVXNCY05NT3pHQ3dNdGEveno5VnNi?=
 =?utf-8?Q?xnvZpoMC0u/2n3aaIZsQvO2Wcaq4zMUyMQMPW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEE3247F364C0F4FA7CC51E90C91A202@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d885178-67f3-46f6-4119-08da2e6733bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 07:16:41.0271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9AlobBx+V7072yzhEdFHN80S8NI8BIYFWnDl2tydNkp7FkYWX6olmCw9RtvhjhX58dCxXFFPzOaikGBaiX2XIyKUg5al9obUWymoJHqrGlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1651
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

DQoNCkxlIDA0LzA1LzIwMjIgw6AgMTk6NTcsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IFNp
bmNlIGNvbW1pdCA2M2E3MjI4NGIxNTkgKCJwb3dlcnBjL3BjaTogQXNzaWduIGZpeGVkIFBIQiBu
dW1iZXIgYmFzZWQgb24NCj4gZGV2aWNlLXRyZWUgcHJvcGVydGllcyIpLCBwb3dlcnBjIGtlcm5l
bCBhbHdheXMgZmFsbGJhY2sgdG8gUENJIGRvbWFpbg0KPiBhc3NpZ25tZW50IGZyb20gT0YgLyBE
ZXZpY2UgVHJlZSAncmVnJyBwcm9wZXJ0eSBvZiB0aGUgUENJIGNvbnRyb2xsZXIuDQo+IA0KPiBQ
Q0kgY29kZSBmb3Igb3RoZXIgTGludXggYXJjaGl0ZWN0dXJlcyB1c2UgaW5jcmVhc2luZyBhc3Np
Z25tZW50IG9mIHRoZSBQQ0kNCj4gZG9tYWluIGZvciBpbmRpdmlkdWFsIGNvbnRyb2xsZXJzIChh
c3NpZ24gdGhlIGZpcnN0IGZyZWUgbnVtYmVyKSwgbGlrZSBpdA0KPiB3YXMgYWxzbyBmb3IgcG93
ZXJwYyBwcmlvciBtZW50aW9uZWQgY29tbWl0Lg0KPiANCj4gVXBncmFkaW5nIHBvd2VycGMga2Vy
bmVscyBmcm9tIExUUyA0LjQgdmVyc2lvbiAod2hpY2ggZG9lcyBub3QgY29udGFpbg0KPiBtZW50
aW9uZWQgY29tbWl0KSB0byBuZXcgTFRTIHZlcnNpb25zIGJyaW5ncyBhIHJlZ3Jlc3Npb24gaW4g
ZG9tYWluDQo+IGFzc2lnbm1lbnQuDQoNCkNhbiB5b3UgZWxhYm9yYXRlIHdoeSBpdCBpcyBhIHJl
Z3Jlc3Npb24gPw0KDQpUaGF0IGNvbW1pdCBzYXlzICdubyBmdW5jdGlvbm5hbCBjaGFuZ2VzJywg
SSdtIGhhdmluZyBoYXJkIHRpbWUgDQp1bmRlcnN0YW5kaW5nIGhvdyBhIG5vY2hhbmdlIGNhbiBi
ZSBhIHJlZ3Jlc3Npb24uDQoNClVzdWFsbHkgd2UgZG9uJ3QgY29tbWl0IHJlZ3Jlc3Npb25zIHRv
IG1haW5saW5lIC4uLg0KDQoNCj4gDQo+IEZpeCB0aGlzIGlzc3VlIGJ5IGludHJvZHVjaW5nIGEg
bmV3IG9wdGlvbiBDT05GSUdfUFBDX1BDSV9ET01BSU5fRlJPTV9PRl9SRUcNCj4gV2hlbiB0aGlz
IG9wdGlvbnMgaXMgZGlzYWJsZWQgdGhlbiBwb3dlcnBjIGtlcm5lbCB3b3VsZCBhc3NpZ24gUENJ
IGRvbWFpbnMNCj4gaW4gdGhlIHNpbWlsYXIgd2F5IGxpa2UgaXQgaXMgZG9pbmcga2VybmVsIGZv
ciBvdGhlciBhcmNoaXRlY3R1cmVzIGFuZCBhbHNvDQo+IGhvdyBpdCB3YXMgZG9uZSBwcmlvciB0
aGF0IGNvbW1pdC4NCg0KWW91IGRvbid0IGRlZmluZSBDT05GSUdfUFBDX1BDSV9ET01BSU5fRlJP
TV9PRl9SRUcgb24gYnkgZGVmYXVsdCwgaXQgDQptZWFucyB0aGlzIGNvbW1pdCB3aWxsIGNoYW5n
ZSB0aGUgYmVoYXZpb3VyLiBJcyB0aGF0IGV4cGVjdGVkID8NCg0KSXMgdGhhdCByZWFsbHkgd29y
dGggYSB1c2VyIHNlbGVjdGFibGUgb3B0aW9uID8gSXMgdGhlIHVzZXIgYWJsZSB0byANCmRlY2lk
ZSB3aGF0IGhlIG5lZWRzID8NCg0KPiANCj4gRml4ZXM6IDYzYTcyMjg0YjE1OSAoInBvd2VycGMv
cGNpOiBBc3NpZ24gZml4ZWQgUEhCIG51bWJlciBiYXNlZCBvbiBkZXZpY2UtdHJlZSBwcm9wZXJ0
aWVzIikNCg0KSXMgdGhhdCByZWFsbHkgYSBmaXggPyBXaGF0IGlzIHRoZSBwcm9ibGVtIHJlYWxs
eSA/DQoNCj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4NCj4g
LS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgfCAxMCArKysrKysrKysr
DQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wY2ktY29tbW9uLmMgfCAgNCArKy0tDQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
aW5kZXggMTc0ZWRhYmI3NGZhLi40ZGQzZTNhY2RkZGEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IEBAIC0zNzUsNiAr
Mzc1LDE2IEBAIGNvbmZpZyBQUENfT0ZfUExBVEZPUk1fUENJDQo+ICAgCWRlcGVuZHMgb24gUENJ
DQo+ICAgCWRlcGVuZHMgb24gUFBDNjQgIyBub3Qgc3VwcG9ydGVkIG9uIDMyIGJpdHMgeWV0DQo+
ICAgDQo+ICtjb25maWcgUFBDX1BDSV9ET01BSU5fRlJPTV9PRl9SRUcNCj4gKwlib29sICJVc2Ug
T0YgcmVnIHByb3BlcnR5IGZvciBQQ0kgZG9tYWluIg0KPiArCWRlcGVuZHMgb24gUENJDQoNClNo
b3VsZCBpdCBkZXBlbmQgb24gUFBDX09GX1BMQVRGT1JNX1BDSSBpbnN0ZWFkID8NCg0KPiArCWhl
bHANCj4gKwkgIEJ5IGRlZmF1bHQgUENJIGRvbWFpbiBmb3IgaG9zdCBicmlkZ2UgZHVyaW5nIGl0
cyByZWdpc3RyYXRpb24gaXMNCj4gKwkgIGNob3NlbiBhcyB0aGUgbG93ZXN0IHVudXNlZCBQQ0kg
ZG9tYWluIG51bWJlci4NCj4gKw0KPiArCSAgV2hlbiB0aGlzIG9wdGlvbiBpcyBlbmFibGVkIHRo
ZW4gUENJIGRvbWFpbiBpcyBkZXRlcm1pbmVkIGZyb20NCj4gKwkgIHRoZSBPRiAvIERldmljZSBU
cmVlICdyZWcnIHByb3BlcnR5Lg0KPiArDQo+ICAgY29uZmlnIEFSQ0hfU1VQUE9SVFNfVVBST0JF
Uw0KPiAgIAlkZWZfYm9vbCB5DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL3BjaS1jb21tb24uYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcGNpLWNvbW1vbi5jDQo+IGlu
ZGV4IDhiYzljZjYyY2Q5My4uOGNiNmZjNTMwMmFlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMva2VybmVsL3BjaS1jb21tb24uYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3BjaS1j
b21tb24uYw0KPiBAQCAtNzQsNyArNzQsNiBAQCB2b2lkIF9faW5pdCBzZXRfcGNpX2RtYV9vcHMo
Y29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzICpkbWFfb3BzKQ0KPiAgIHN0YXRpYyBpbnQgZ2V0X3Bo
Yl9udW1iZXIoc3RydWN0IGRldmljZV9ub2RlICpkbikNCj4gICB7DQo+ICAgCWludCByZXQsIHBo
Yl9pZCA9IC0xOw0KPiAtCXUzMiBwcm9wXzMyOw0KPiAgIAl1NjQgcHJvcDsNCj4gICANCj4gICAJ
LyoNCj4gQEAgLTgzLDcgKzgyLDggQEAgc3RhdGljIGludCBnZXRfcGhiX251bWJlcihzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmRuKQ0KPiAgIAkgKiByZWFkaW5nICJpYm0sb3BhbC1waGJpZCIsIG9ubHkg
cHJlc2VudCBpbiBPUEFMIGVudmlyb25tZW50Lg0KPiAgIAkgKi8NCj4gICAJcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91NjQoZG4sICJpYm0sb3BhbC1waGJpZCIsICZwcm9wKTsNCg0KVGhpcyBsb29r
cyBsaWtlIHZlcnkgc3BlY2lmaWMsIGl0IGlzIG5vdCByZWZsZWN0ZWQgaW4gdGhlIGNvbW1pdCBs
b2cuDQoNCj4gLQlpZiAocmV0KSB7DQo+ICsJaWYgKHJldCAmJiBJU19FTkFCTEVEKENPTkZJR19Q
UENfUENJX0RPTUFJTl9GUk9NX09GX1JFRykpIHsNCj4gKwkJdTMyIHByb3BfMzI7DQo+ICAgCQly
ZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9pbmRleChkbiwgInJlZyIsIDEsICZwcm9wXzMyKTsN
Cj4gICAJCXByb3AgPSBwcm9wXzMyOw0KPiAgIAl9
