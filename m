Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC4A52B950
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 14:13:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Bj73xF4z3cDL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Bhh3NCHz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 22:13:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePVzX5anI5PRNEG/Orx7PKSDuKBhXb76ZwrdhIqKp5RMQcoVRpjYqioAsvNmFOyZ+5y1RIyRP+iA7HnjVCGygXqLobe40ugeahfm6QrX/aJqSm78qpsgbu/A4rQ5hOFFpU1zxUpIIPUdfAEMdtQjyHmmZIVIJp+mS3/fTZ5xgFfpnHyrAHVaWy6CRGAm3PjKXOBjjd1OcbWj4GbpaL0cPRkoJrgokk16lcOmAskIyQvPA6yrUP+00OLLXMb5q9loRGp2AasTIGt9kV55lDtn6asUJJXzTuxEpyaXKbMqdXOIxxh+S5ka1CSynj1XM/vrkqdZTrWIUGsUq3rMbzpRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRsqZxS6cqFZUroR0lRcJqEBJVTJ9qkAqg1bBBdLgm8=;
 b=PKfZRHnS3U9jQxXV9I/8RtjQDrWH8XNJs5UrAs40UTvAZPNE/qXIAK0/vs2r+uxICM8EyxI/i0e9uLl4ovyy3wOs78wMe4pe7Rxyb1qP3r7iBju5C5bqFAO62eawESDqEY+gAbLUP6IHhHUWi6WUbtFLrVRnzxdDWdfkZI08zOca6hrxzwJkoQ9h1O+gEqraAi07ngro4QXWKjbEXup0xJHQfqFfclbv3PJgrOThsuEzZCftNUKgH3Suy1I2f6Z8qfZzBCvSTErBKNh4PPcL/MDVaDKy+AF3d5LxEf+BXwez3DRheOMZf+c1LqIB49dFeCI03Z9bIXC/tWKLqgQpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3855.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 12:12:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 12:12:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAaGwCAAAyGgIAAAnqA
Date: Wed, 18 May 2022 12:12:47 +0000
Message-ID: <a7e47e3d-9b2b-ee12-d38c-3e6bbba83f7d@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au> <87ilq3nj2s.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ilq3nj2s.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4ef897b-5506-4485-8eea-08da38c7b906
x-ms-traffictypediagnostic: PR0P264MB3855:EE_
x-microsoft-antispam-prvs: <PR0P264MB38550A28379592959F7CCB54EDD19@PR0P264MB3855.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7CC/nnIhAdxI3glNQ0AyXe3xP3OT8RkT0nGNTM5u6O2twDuEv79szcM9Ktf/erxnyetrgCFWigP2Kh/tOELvzc1xektyCVujxO/iUpkbuKnCe4MdehAR4s9wg/RWmsfEZ9xfVIOHX0pOlM1EgXgPwlQ+Adw+6pfL56vlDm0aRXkqduDsoApLGxBOi4nNw//85vDvWrrpqH2IivORNYM0M6SucfqIfAOp27GPHOaW/+tkNDiUxcFVO1nzP/UVw4XjDd1pEgpbF3H3W6jaHvYJRHAeXYpzXTNpnTaYIZzlX8c8MMdlfR55EhBWl++8GUhXXyItM+1E9TAxPhoQp/qq4PE5lhavWDaFp4SghGMqfmAzdEpZw4sRflCKvgO8a6gE8wZuSYk+SC1VpU0IKSGOJkfzuwE0dpRb3II4GnKBTRbygDwiZq6oPulPLqwSknLU+0DGO/ZejW/KzUqVe3DXJu4egI0BCKRpv4ZD6bOfWwHt8ZDRgKoOlQ4e0eL7svWgzT2lIA632zYIY/OAwiPHo6IpUfaKle3aS9h4V0cJ65FHN+t1iFZ+4GsR3J/TtSJdTQpeXOYqwJ3ZvxThM95UcT0qGuPeyQZuegC83kmLsk99A60Nd61J8CiLEwvn0gqS9n21P9yuYWLJsMwzEethTb0I9OHamC3k7yRp5KDtIDydYQb8VbAsQX9RRGl0TUHYsSU+0ehRGtW9Cjmmddw0NkY3JARW+Tjj8qjLA5chzMqXAQmsP+3B3CLN0OuyDM53rxGar3LXi0TPGi5WLmhXXw0g4DpdbHhC/MnY7qY68sIpEtm+4J02Rri8tluYp/TbBeJHKR/c26D93ZIHz40hp1HdWf3zaF10bHoqRtbHP1E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(4326008)(31696002)(66574015)(83380400001)(76116006)(91956017)(38070700005)(86362001)(8676002)(966005)(44832011)(6506007)(508600001)(6512007)(26005)(8936002)(5660300002)(38100700002)(66446008)(64756008)(66556008)(66476007)(122000001)(186003)(2616005)(54906003)(2906002)(316002)(110136005)(31686004)(36756003)(6486002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTNBUkV5Rkl4UjNBR3V4WTBXVWMvTS9lZlJ6SU55OHBYblorN20zVkJOZkNz?=
 =?utf-8?B?M3RXZ2IycDBvcFNjWDg1VW1iY1hUUWpHMzNsT2VKMmRhMEdDOVlnTjVOWk9v?=
 =?utf-8?B?bGVCOFh3UkxEUGFkV2JhdjdsQUdaQXVVdWxYTXluWFZyVDN1SithK1lLejcv?=
 =?utf-8?B?d1lRTUVpTWpaell4aUVySXFwVVB2TlZzVVhDc29KK3o5LzZYc0FOUlhRc1l6?=
 =?utf-8?B?ZjR4ZWZKbmtVeDltS0VrSzNjd1BtTHhzelJ6dHIrRkZSRHh3UlJiOEdoMzM4?=
 =?utf-8?B?a1NSa0Z1K3UxNDY5REYwNS9FSktLM2hEdFl2M3ptaGFHamNwMlVtMFdlajJu?=
 =?utf-8?B?K0p5MngydzU0a3IzR2djdmllSnRaMXZ6UVVVVnlJelR2K3Y4cnFhamptdnB4?=
 =?utf-8?B?U0VvQm96dkFqM0tTdXBmeHk4ZHJhaXRKcEhEQ1dEUWkvR3cveEJNTE9MSnNF?=
 =?utf-8?B?VzVRc1FvWHpSYXFoTmRlOFlmYTdXQXpicU1RRmM2RkhoNll6bE51K0dUQWEv?=
 =?utf-8?B?eUY5RUZMVEJ3M0lINkNhWHdGNnIwVzJuN3dLMjhvOE1nMGo3VFRvUmpyTVZ0?=
 =?utf-8?B?dy90a2lmTCtzRys2LzN2NG94Z1c0TWhRRHMxT2Z3K2lIUDlJOE9TR2JTWEw5?=
 =?utf-8?B?R09pTHNrdUJKLzRtL0NvWDFaVWtZQkhSdlJPY292ZERvaVNubE83eUV3T3Ay?=
 =?utf-8?B?N3ZlU2FBdzEwZk9XZnp4Ky9DWTJIbDIrQnhrdjQxVlhLNHhhdXhLeUlaeE1u?=
 =?utf-8?B?UlAyRDlsRmJvbGFIWWhJdG5Hb2lnL2sxL3Vzcm8zWFZYSFo5ODVvUWtKRHdB?=
 =?utf-8?B?Z2Ivdk9LMUV1OE9RdS9YOVQrcGRwNWhmR1BVaEUvTHhqWWpEamV4QnNjemZP?=
 =?utf-8?B?RDAvakROZmhEUWtlVUNWZFRyLzVOdFhNOVh2NzlwTFVTY2NVTTdoK0NxRHJM?=
 =?utf-8?B?MUNOUkxVYlZsT0dILzZUMy8wNU1VNEIvdkxxNzVXekRVaXF5d1pmTDFIUm11?=
 =?utf-8?B?MmxIY2Mrd0FDQS9TRXhQblYzaEpSOTFobnl4d2wydFpIaC9CSHVPZVpRNFhV?=
 =?utf-8?B?S2pEWWZhTG1jNDR3czBldlJLeWNUaHpNY3luZUpONDROQzUrSjBGUHMvYSto?=
 =?utf-8?B?L05RZnd6VkwzeVVVUG81L2dSSDNDQTZnVlMxSUxoTmJnVGl0Tmx1Q3VRSUJL?=
 =?utf-8?B?UW9ZaERmQUpad3VhL3h0SUc1OEluTFkxTjI2SkIzM2NtRmRrRldiMXA0U2V5?=
 =?utf-8?B?Y040MU92aGN3cExKZVdxalJ4T1ZkeGo5QW9iRUgzT0NSMHNRSk01WWVRT0o2?=
 =?utf-8?B?K0xKanlkcFpSOTN5N215eWpoT0dFOXptZlJKb1U1UjdZYmJTRjJudnhqc2J4?=
 =?utf-8?B?a0NhSEtySmVQRkFZc0M0TkE4NVRkZ2d4cEVNNmM5L05FdW5sdnREQk8xZDRT?=
 =?utf-8?B?bFBBWnVPT1c3NFA0cjlPZTNYZThXNk80ZEJtbURtY1RmTGh2QXJEZEFwSkFa?=
 =?utf-8?B?c0FPOEtmN1pnV1lYVXo2TEFFSEt3NGRwTUwwZEw2ckhxb0w1MUcvZUYwT09u?=
 =?utf-8?B?ZFEreGVmOU0zaVU3R2N1Q3BCaGMzNDAvNmQzOGVKTmMrL1FObWNBVVozTmRs?=
 =?utf-8?B?RHI2UDlWZVRWY2Z2Vmhjd3BRV0VFOVFwQXVIejFoNStHVGZZSHFGcmZUY3lx?=
 =?utf-8?B?VmhLMEFsM2dESVQyanN6eERJTmJFeWxqZ3JxSXNDTERFNVJ3MXFuT0kwbC8x?=
 =?utf-8?B?K1VIN3lxVXJiSVZZeG9xVmxkZjl6ampKOVlSZE5NY2ZUUHlGclpZOGx3a05h?=
 =?utf-8?B?Ulp2bUg4cmVzajZpN1BkZE9PazJpUEZYU1A2ME95bWphUFQ1aTlqMDA0YUJR?=
 =?utf-8?B?cDh5b2xtcStlbDFiQmlOazRZeVN2OUxaeFAxVVlKSkx4RWdjelNWSWNHdXFV?=
 =?utf-8?B?amYwQTRJS2J4S2NJOHlsQWk5TjN2NkJOS3BuMHNCc2YzQm1HK1lPKys2YlNj?=
 =?utf-8?B?U1ozZEhzZ0tsWmdBcEQ2cER4M1hqb2d0VUltcTlQL3VhVXhMaEpJaEppTVdN?=
 =?utf-8?B?Ti9MV1RrbXg2NVdZL1psT3hMNjdDcXhlb2VyQ3A0QllTbkY4a3dOeC94MkRN?=
 =?utf-8?B?TjRpaTByU2lzK0RzR3FYVUlBT0lDUjlaYVBSOG5PbFdMUFJtcnY0K3g5OUJz?=
 =?utf-8?B?VlRlbTJtT0M1N0YvUzlJNTN5Tjh0bjFqU3JQM2FWdUNZblk2ZFhNZDd1WXFI?=
 =?utf-8?B?NHMraERGbTBhcGZZWTZOcjRDQlQzK0lBRjZGWFp0M1FOODBoTzQ1TS83dWdy?=
 =?utf-8?B?N0tpZThZUXlVcFJMdnVZTEFXb2FVK3hJUkVnZnkzQTBKZVFEK3pyMm05bDhi?=
 =?utf-8?Q?k4ap3P2uJxoDAiMLvvWIAJG+iLxjHcXPSqMjD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A78A15EFBD6C904FB76E7ECB1D499349@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ef897b-5506-4485-8eea-08da38c7b906
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:12:47.9584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdr45ku2/x1YpLISaFlcB6fYNAq0tz284wB4KcX86YGrmNlyZi1A1BmpnjBwqYs4oq5GTPqPPtcXT1yCouXLBhAVGeY7aT9c3FOeRouqftk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3855
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

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTQ6MDMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiB3cml0ZXM6DQo+PiAiTmF2
ZWVuIE4uIFJhbyIgPG5hdmVlbi5uLnJhb0BsaW51eC52bmV0LmlibS5jb20+IHdyaXRlczoNCj4+
PiBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+PiBBIGxvdCBvZiAjaWZkZWZzIGNhbiBiZSBy
ZXBsYWNlZCBieSBJU19FTkFCTEVEKCkNCj4+Pj4NCj4+Pj4gRG8gc28uDQo+Pj4+DQo+Pj4+IFRo
aXMgcmVxdWlyZXMgdG8gaGF2ZSBrZXJuZWxfdG9jX2FkZHIoKSBkZWZpbmVkIGF0IGFsbCB0aW1l
DQo+Pj4+IGFzIHdlbGwgYXMgUFBDX0lOU1RfTERfVE9DIGFuZCBQUENfSU5TVF9TVERfTFIuDQo+
Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4NCj4+Pj4gLS0tDQo+Pj4+IHYyOiBNb3ZlZCB0aGUgc2V0dXAgb2YgcG9w
IG91dHNpZGUgb2YgdGhlIGJpZyBpZigpL2Vsc2UoKSBpbiBfX2Z0cmFjZV9tYWtlX25vcCgpDQo+
Pj4+IC0tLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmgg
fCAgIDIgLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9tb2R1bGUuaCAgICAgICAg
fCAgIDIgLQ0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zZWN0aW9ucy5oICAgICAg
fCAgMjQgKy0tDQo+Pj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYyAgICAg
ICB8IDE4MiArKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4+PiAgIDQgZmlsZXMgY2hhbmdlZCwg
MTAzIGluc2VydGlvbnMoKyksIDEwNyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pg0KPj4+IDxzbmlw
Pg0KPj4+DQo+Pj4+IEBAIC03MTAsNiArNzA3LDkgQEAgdm9pZCBhcmNoX2Z0cmFjZV91cGRhdGVf
Y29kZShpbnQgY29tbWFuZCkNCj4+Pj4NCj4+Pj4gICAjaWZkZWYgQ09ORklHX1BQQzY0DQo+Pj4+
ICAgI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3Rv
YykNCj4+Pj4gKyNlbHNlDQo+Pj4+ICsjZGVmaW5lIFBBQ0FUT0MgMA0KPj4+PiArI2VuZGlmDQo+
Pj4NCj4+PiBUaGlzIGNvbmZsaWN0cyB3aXRoIG15IGZpeCBmb3IgdGhlIGZ0cmFjZSBpbml0IHRy
YW1wOg0KPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1k
ZXYvcGF0Y2gvMjAyMjA1MTYwNzE0MjIuNDYzNzM4LTEtbmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQu
aWJtLmNvbS8NCj4+Pg0KPj4+IEl0IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIHJldGFpbiAjaWZk
ZWYgQ09ORklHX1BQQzY0LCBzbyB0aGF0IHdlIGNhbg0KPj4+IGdldCByaWQgb2YgdGhlIFBBQ0FU
T0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWwgZGlmZjoNCj4+DQo+PiBXaGVyZSBpcyB0aGUgaW5j
cmVtZW50YWwgZGlmZiBtZWFudCB0byBhcHBseT8NCj4+DQo+PiBJdCBkb2Vzbid0IGFwcGx5IG9u
IHRvcCBvZiBwYXRjaCAxOSwgb3IgYXQgdGhlIGVuZCBvZiB0aGUgc2VyaWVzLg0KPiANCj4gSSB0
aGluayBJIHdvcmtlZCBvdXQgd2hhdCB5b3UgbWVhbnQuDQo+IA0KPiBDYW4geW91IGNoZWNrIHdo
YXQncyBpbiBuZXh0LXRlc3Q6DQo+IA0KPiAgICBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMv
bGludXgvY29tbWl0cy9uZXh0LXRlc3QNCg0KWWVzIHRoYXQgbG9va3MgZmluZS4NCg0KQXMgTmF2
ZWVuIG1lbnRpb25lZCB3ZSBjYW4gYWxzbyBnZXQgcmlkIG9mIFBBQ0FUT0MgY29tcGxldGVseSBh
bmQgdXNlIA0Kb2Zmc2V0b2Yoc3RydWN0IHBhY2Ffc3RydWN0LCBrZXJuZWxfdG9jKSBkaXJlY3Rs
eSBhdCB0aGUgb25seSBwbGFjZSANClBBQ0FUT0MgaXMgdXNlZC4NCg0KVGhhbmtzDQpDaHJpc3Rv
cGhl
