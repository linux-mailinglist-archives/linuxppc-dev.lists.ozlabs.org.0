Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20D471964
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 10:08:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBf2Z3mMbz3cP5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 20:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62b;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBf216X8Dz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 20:08:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2BSJd5OzAPGSRxu7SiHjQdvYP6zfIFrFNzLtorOuZAjROgTCJqn2uJ/Q1ly0AZdu8e00NNJOOgDjAmmm2p+SzrGkuFzZJtLrsH7l50JLC4PV1vOb0fX9DXyqbqbbua+ooux0dLrSbf8BLEiWniHFgXgpINbVakrhG3iOxxLdMDWeUYKIhyA5lyD+383iUEC/i8dFoH48QxJqH+AI+U3PEyS4YAm6oc3Z/3U4M67RlSmUwEGhNDwxxMPXHRC/1oWTMvHZRotu8kqIm7zH0f+jJJ3yYPKJ1ggGJKB2iGXrVvt2BWXFbxqwrA30iZDKwGPRxDlXcKUl60lumaYBU5GAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWCx5nCXK1f3RfL5IaM6WXSmcZgTH4V3Az295Zi84jw=;
 b=Tlzbo+ypEVCtlh3s30Cm5ArOZrUZWhVQBT9eT+L/ENMhZLSSwdm24lZWBf2gtaqXsX7phSLEkIy7VcuLW4NJFRpyEnZheXulhj913Yp2FuHNB0ppzKs9DBpgbR0LLRqWedVgVwD7axh185aM+oGITEN5QxYGNuRnbfEMBqG/+XdLvbtL1WNa7YDzqv2ZRz6I/vtTSBYld/mkb7diN3DLK7C6qRFaFfp16Ufny68EQ2Mx3QFQsbJ/UHzuWLjoYK5EMTUnFGILiBZReWTEeKyJESDH0hzNAsODoZdLkYOfWdjhZB8dqo/0ABez7jl7JUQr201CPItMaoibFujZtU82Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1857.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sun, 12 Dec
 2021 09:08:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.017; Sun, 12 Dec 2021
 09:08:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] powerpc/code-patching: add patch_memory() for
 writing RO text
Thread-Topic: [PATCH v2 1/2] powerpc/code-patching: add patch_memory() for
 writing RO text
Thread-Index: AQHX7vRf937AUV+0L06m9OdZqTQ6q6wukZuA
Date: Sun, 12 Dec 2021 09:08:00 +0000
Message-ID: <9a3a5e5d-ee90-4290-abc9-31be2716e6a1@csgroup.eu>
References: <20211212010357.16280-1-ruscur@russell.cc>
In-Reply-To: <20211212010357.16280-1-ruscur@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14a265d0-5d12-4576-0cf7-08d9bd4ee59f
x-ms-traffictypediagnostic: MR1P264MB1857:EE_
x-microsoft-antispam-prvs: <MR1P264MB185708520FB8C61E4F42881FED739@MR1P264MB1857.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdRc2x4yRKeMviqsN4eZs7pkoSio08mH776Y2EPDEQYn0RVjJyJDKV5vrE50SOp4SZr+NAuof4jxdg8MMMKnnhXfKUbWxGwX54Sy5cG2IC7FwengFVavBzjL8B7+w6rBHP7U/QrC7BgOq3Rq0nz5OrRq/KDhflnLCQDbncEhOv+keuQOd0B3DC7s/lPM03OejwTACFUECtUB47Aws0oLeSrmq/RGUNknA2W4FJ4o6KZWD5bOoMtTSB43XFKBaHfr+iH00kmRJTAzHBpoCxEORzYFt+MTdu2gDAxo203RsgoV9UM51LLtkIHztKLT1Ys5GnsPRn9hcCBY+5RoNQMvn61E4O0OHV9PGxSDxsiViVw2xZojuEyDTJmv5AWc18ZWaJXlRS0g1k0+dtsQ2COIep08lcQ4o9R9KgNpMu0lwU/LK/tX+tbDfhNKv2T+THwI3tsMmNbcCV3l9Hn2Zt24eFzwcJHHarfKpV7SfbO50Le6G3OduFgJ/xK8Fb1thR7DxtgSC9IcSxaulV3uzgsHzlo9dGciX9n6zjd4g1mk64sPOJKNpSVyi3kwXWjrQ+4MXeWN0TirCxPNrKYiorHFuFEr1nB7RtTqp6Ai8+5w+e2QB+yCQU0wW0Ch4t4F49yO+AJ0uvAktCcCgoii1wBIpzTOsgdwmDOUfErOQogY8Wt2X5FBTdDH24gf+Xw+c4RcGyQINn8Dd1N17LtNZMPJCI3O1DgiACEoYS92QJQbTr1zLqs8aUvAoV4f4BPhZ5tysimT/ieKxEDqRa8QIpuXIP1hXMEUi4AEsgtvIty6x2/9J2/s5bKVHYGdxQY+YzwESwMiIKDYQ6gEHshrdkTmszFwrXmSiS3OMBzia8mF0hA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(36756003)(83380400001)(54906003)(91956017)(6512007)(26005)(86362001)(6486002)(966005)(31686004)(2906002)(508600001)(76116006)(4326008)(38070700005)(122000001)(66476007)(66556008)(8676002)(2616005)(64756008)(8936002)(44832011)(71200400001)(5660300002)(66574015)(31696002)(66946007)(66446008)(316002)(110136005)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUkwZm54L0ZqeW9QRyt6RldKbG1vVmlEcXNaOVgvaUxkWW9abXprNDByYjVX?=
 =?utf-8?B?NnI3V0JzZDZBbWwrS2xYSUdjMnlDdjRBQlEwb1NqU2V5QmtkSk5Ea2RWN21o?=
 =?utf-8?B?V0xTcXdoVjZ5TE9DMjVzMEM0cCtrK1NrZEt1aVNTN3lyMWtmTUI5SVJoWE5H?=
 =?utf-8?B?bnBKcHYrM2FraHdIUDV4aUpScW1PZDlHekxwVmJoYklabC8vQng0NTRONjdt?=
 =?utf-8?B?N1JOMVM5V3JLSForRzVHaDN0dE1ieGlRa1Fta0t2aVE0SmhqT05uQk1YK1Fp?=
 =?utf-8?B?Wk5QVGpwNU4yemF1dlFyWnpjdWNWaHRIUzhFQ2kxeWVtRk1GNUd6M25XV0xD?=
 =?utf-8?B?d0dJbU9uV1dRd3JhRGVsQ0JUbUtMUTlTOVlUckgrMlJyelYrS2Z3b2NSaXRU?=
 =?utf-8?B?U1JkL3JqN1JOUnNCRlNuU1MxOFdBdnQxNDg3NWIzbnMvY3hLS2lvZWhGR2Jz?=
 =?utf-8?B?azJnVzZOUnVuMjZLRGZCWmhGVDNHOGhiL2ZMc0l6VHdTcCtJYklza1luK2JQ?=
 =?utf-8?B?Sm1taDU0K3JpeTVuWi9JNUJ0anhsck4yZUdweEJ1eEJUWkxndHpzZ0F5LzVx?=
 =?utf-8?B?ZmFPK3ZkUzBmZmR0ZVNHNGR0OGZrclZaSWUrdGd1KzN5TkdCamwwUW1rbElM?=
 =?utf-8?B?L0tEbUJveTJQMHBDMHJmbWFkSzR2UjJQTG5aeWZrczNrT0VJcHZiT2dQT3N6?=
 =?utf-8?B?ZU4wNWNMclhMWDRXU0R1c21pNmwwRGs3dEx4THR6d0p4N1BNMGwyZWxlbE1E?=
 =?utf-8?B?UzQ0eHBWaWtYZGZJOWh6eWZLZG4xQUJ5WC9Ya0c1NlJnb2dkZUxhbFFWelhv?=
 =?utf-8?B?ZnE2dmk4UUhlMXdvaU54eDJlVDZkeFFVWDRFUjkwNHQyNmZiNHduU0Frbnkz?=
 =?utf-8?B?dWZOanI4bEpaWWRnU1Y0NTlDWUNyS0Y5WDl0UHZ1UitMSW5lZktoWnlBUkhm?=
 =?utf-8?B?SXZKSWFqZkpJcTZqQVNKQjc1OW9pVEQwWjQra2t1WUV2WGFqNWR2cEZSUFZX?=
 =?utf-8?B?TGY3SC9Vb2xIQXUwZmVFR1QwNGFpWlRySUUzbkRPVTlETkE4ME9IRlhzbVpa?=
 =?utf-8?B?VGphUTcwby96cENKenlCTDFpZmlKYXpUK3ozTUNoTFVJUjk1R3B0RnVPMzgr?=
 =?utf-8?B?aTlFYlZva21KNFRRM2xNNVVHT09wclRTbzgzSFBuN1NiUkhiNXY3RVladjl2?=
 =?utf-8?B?c091Z2UwWmZCM0FGcGt6bWUyRjlaUC9xcGtsNlFZRWpqdCtQSzB5dlhSWHhU?=
 =?utf-8?B?OUdKMk1HZVcxdmp1S1gyaWxScm9OcEdacU41YTVJNWphQ0ZZeVVsakhhQjEz?=
 =?utf-8?B?OVJ2ZkEyZlpIejNNWXgrQkwrNi95RnFySDdVYXZQT1V5TllBY3VIdWtuL0pC?=
 =?utf-8?B?bHVJUUd3bnpYNEpEMmJyTDdLcnhuZUFHRjVFM0tXcXpNOWxqS3BwWGphY29q?=
 =?utf-8?B?bFZZTnliaTRYYmZMSnRTM2FUSUJoeFhlZVBMUWwvQWYvTWFkODV5VCtnb29s?=
 =?utf-8?B?a01kcVExblNZbDNPMHNvTHpCNWtxbmpFbDRTd2ZxZ29uNFRRZE5lajM3QVRh?=
 =?utf-8?B?akUya1F6aFN3V2kxTGVFR2hIcmpzYnBWUnRRYjZHb0hqWUt3VnA4YTlkS0hP?=
 =?utf-8?B?VWtYcVpwcWhBT3NsdU42MW05cFBZQ1o4eEZZR0t5d0NocEtJc2J0OERoaFRq?=
 =?utf-8?B?bWdMbGtudUxrVHAvWGhuUkxPQ1RZUkJiM2xDY1Z2TWdvWmFBaWtEYWFvNUk1?=
 =?utf-8?B?OEZ5SHNnM015NFVLaVhuS1dMYjZmVXNPdFQ5M3plVzhLbFJENmprRmd0akJr?=
 =?utf-8?B?RHN5U2xkWEdsRzJiYUFxRjd2aWs3NUd0czdONjVVbXpkVXdicDBTSjk4TzBW?=
 =?utf-8?B?RC9YWGZBcU5oeVJadExvRUNCRS8zN1RWY3N6TXg2MWh3ZUNLWlFPMGUxWnJQ?=
 =?utf-8?B?TGhvSXNMV2Z5SGdHR3c1cDFPdVM1U1ZJNHhlRGJTWThvNkNpMnR6NHE0RWxG?=
 =?utf-8?B?YVhtdW1ld2NydjJ5NWI1T0JvZHM5dWM1VHAycDNlZE1xWisxcGJVTDdheDFy?=
 =?utf-8?B?amlkWlZ6K2dCZ3JURkNLaS9wcTYvZ1RsRG5zc1ZtbTJheFo0N1p4VFQxMXBv?=
 =?utf-8?B?aVo4YVl3QmhhMHVMWi8wbVZ5UzhVaEJPU3EwcUVYNWJ1UG5qbTFlblR3Mmp2?=
 =?utf-8?B?ZnpNc3BMaE4vR2R3SjFyUHQ3cE1neDhNS2ZSd1VhZXJTdEU2SVV1Z2I5WTNB?=
 =?utf-8?Q?Ybvt2S2gQ2Aeiga249nM9RnwRnQ3tyEUrYUDBDX6YI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <396B1F31A9F26540BAFFC60195D326F2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a265d0-5d12-4576-0cf7-08d9bd4ee59f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2021 09:08:00.5657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/d+EOgSFu23ObJJFa0k3RglsQ7PmdJH8Zlsyw0bPzS8H8kVyD8BHVGOan5+dps9ooE0kk1R51maF4FxAHQVIbR47WYM9NcqM05yLSLX9UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1857
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "joe.lawrence@redhat.com" <joe.lawrence@redhat.com>,
 "joel@jms.id.au" <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzEyLzIwMjEgw6AgMDI6MDMsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IHBvd2VycGMgYWxsb2NhdGVzIGEgdGV4dCBwb2tlIGFyZWEgb2Ygb25lIHBhZ2UgdGhhdCBpcyB1
c2VkIGJ5DQo+IHBhdGNoX2luc3RydWN0aW9uKCkgdG8gbW9kaWZ5IHJlYWQtb25seSB0ZXh0IHdo
ZW4gU1RSSUNUX0tFUk5FTF9SV1gNCj4gaXMgZW5hYmxlZC4NCj4gDQo+IHBhdGNoX2luc3RydWN0
aW9uKCkgaXMgb25seSBkZXNpZ25lZCBmb3IgaW5zdHJ1Y3Rpb25zLA0KPiBzbyB3cml0aW5nIGRh
dGEgdXNpbmcgdGhlIHRleHQgcG9rZSBhcmVhIGNhbiBvbmx5IGhhcHBlbiA0IGJ5dGVzDQo+IGF0
IGEgdGltZSAtIGVhY2ggd2l0aCBhIHBhZ2UgbWFwL3VubWFwLCBwdGUgZmx1c2ggYW5kIHN5bmNz
Lg0KPiANCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHBhdGNoX21lbW9yeSgpLCBpbXBsZW1lbnRp
bmcgdGhlIHNhbWUNCj4gaW50ZXJmYWNlIGFzIG1lbWNweSgpLCBzaW1pbGFyIHRvIHg4NidzIHRl
eHRfcG9rZSgpIGFuZCBzMzkwJ3MNCj4gczM5MF9rZXJuZWxfd3JpdGUoKS4gIHBhdGNoX21lbW9y
eSgpIG9ubHkgbmVlZHMgdG8gbWFwIHRoZSB0ZXh0DQo+IHBva2UgYXJlYSBvbmNlLCB1bmxlc3Mg
dGhlIHdyaXRlIHdvdWxkIGNyb3NzIGEgcGFnZSBib3VuZGFyeS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFJ1c3NlbGwgQ3VycmV5IDxydXNjdXJAcnVzc2VsbC5jYz4NCj4gLS0tDQo+IHYyOiBVc2Ug
bWluX3QoKSBpbnN0ZWFkIG9mIG1pbigpLCBmaXhpbmcgdGhlIDMyLWJpdCBidWlsZCBhcyByZXBv
cnRlZA0KPiAgICAgIGJ5IHNub3dwYXRjaC4NCj4gDQo+IFNvbWUgZGlzY3Vzc2lvbiBoZXJlOiBo
dHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvaXNzdWVzL2lzc3Vlcy8zNzUNCj4gDQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaCB8ICAxICsNCj4gICBhcmNoL3Bv
d2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyAgICAgICAgIHwgNzQgKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmgNCj4gaW5kZXggNGJhODM0NTk5YzRk
Li42MDQyMTFkODM4MGMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9j
b2RlLXBhdGNoaW5nLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0
Y2hpbmcuaA0KPiBAQCAtMzEsNiArMzEsNyBAQCBpbnQgY3JlYXRlX2NvbmRfYnJhbmNoKHN0cnVj
dCBwcGNfaW5zdCAqaW5zdHIsIGNvbnN0IHUzMiAqYWRkciwNCj4gICBpbnQgcGF0Y2hfYnJhbmNo
KHUzMiAqYWRkciwgdW5zaWduZWQgbG9uZyB0YXJnZXQsIGludCBmbGFncyk7DQo+ICAgaW50IHBh
dGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgc3RydWN0IHBwY19pbnN0IGluc3RyKTsNCj4gICBp
bnQgcmF3X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgc3RydWN0IHBwY19pbnN0IGluc3Ry
KTsNCj4gK3ZvaWQgKnBhdGNoX21lbW9yeSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNp
emVfdCBzaXplKTsNCj4gICANCj4gICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcGF0Y2hf
c2l0ZV9hZGRyKHMzMiAqc2l0ZSkNCj4gICB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
bGliL2NvZGUtcGF0Y2hpbmcuYyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+
IGluZGV4IGM1ZWQ5ODgyMzgzNS4uMzMwNjAyYWE1OWYxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUt
cGF0Y2hpbmcuYw0KPiBAQCAtMTcsNiArMTcsNyBAQA0KPiAgICNpbmNsdWRlIDxhc20vY29kZS1w
YXRjaGluZy5oPg0KPiAgICNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4gICAjaW5jbHVkZSA8YXNt
L2luc3QuaD4NCj4gKyNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPg0KPiAgIA0KPiAgIHN0YXRp
YyBpbnQgX19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmV4ZWNfYWRkciwgc3RydWN0IHBwY19pbnN0
IGluc3RyLCB1MzIgKnBhdGNoX2FkZHIpDQo+ICAgew0KPiBAQCAtMTc4LDYgKzE3OSw3NCBAQCBz
dGF0aWMgaW50IGRvX3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgc3RydWN0IHBwY19pbnN0
IGluc3RyKQ0KPiAgIA0KPiAgIAlyZXR1cm4gZXJyOw0KPiAgIH0NCj4gKw0KPiArc3RhdGljIGlu
dCBkb19wYXRjaF9tZW1vcnkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3Qgc2l6
ZSwgdW5zaWduZWQgbG9uZyBwb2tlX2FkZHIpDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyBwYXRj
aF9hZGRyID0gcG9rZV9hZGRyICsgb2Zmc2V0X2luX3BhZ2UoZGVzdCk7DQo+ICsNCj4gKwlpZiAo
bWFwX3BhdGNoX2FyZWEoZGVzdCwgcG9rZV9hZGRyKSkgew0KPiArCQlwcl93YXJuKCJmYWlsZWQg
dG8gbWFwICVseFxuIiwgcG9rZV9hZGRyKTsNCg0KSXQgaXNuJ3Qgd29ydGggYSB3YXJuaW5nIGhl
cmUuIElmIHRoYXQgaGFwcGVucyBiZWZvcmUgc2xhYiBpcyBhdmFpbGFibGUsIA0KaXQgd2lsbCBw
YW5pYyBpbiBlYXJseV9hbGxvY19wZ3RhYmxlKCkuDQoNCklmIGl0IGhhcHBlbnMgYWZ0ZXIsIHlv
dSB3aWxsIGFscmVhZHkgZ2V0IGEgcGlsZSBvZiBtZXNzYWdlcyBkdW1waW5nIHRoZSANCm1lbW9y
eSBzdGF0ZSBldGMgLi4uDQoNCkR1cmluZyB0aGUgbGFzdCBmZXcgeWVhcnMsIHByXyBtZXNzYWdl
cyBoYXZlIGJlZW4gcmVtb3ZlZCBmcm9tIG1vc3QgDQpwbGFjZXMgd2hlcmUgRU5PTUVNIGlzIHJl
dHVybmVkLg0KDQo+ICsJCXJldHVybiAtMTsNCj4gKwl9DQoNCkkgaGF2ZSBhIHNlcmllcyByZXdv
cmtpbmcgZXJyb3IgaGFuZGxpbmcgYXQgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0yNzQ4MjMmc3RhdGU9Kg0KDQpFc3BlY2lh
bGx5IHRoaXMgb25lIGhhbmRsZXMgbWFwX3BhdGNoX2FyZWEoKSA6IA0KaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC84NTI1OWQ4OTQwNjllNDdm
OTE1ZWE1ODBiMTY5ZTFhZGJlZWM3YTYxLjE2Mzg0NDYyMzkuZ2l0LmNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldS8NCg0KV291bGQgYmUgZ29vZCBpZiB5b3UgY291bGQgcmViYXNlIHlvdXIgc2Vy
aWVzIG9uIHRvcCBvZiBpdC4NCg0KDQo+ICsNCj4gKwltZW1jcHkoKHU4ICopcGF0Y2hfYWRkciwg
c3JjLCBzaXplKTsNCg0KU2hvdWxkbid0IHdlIHVzZSBjb3B5X3RvX2tlcm5lbF9ub2ZhdWx0KCks
IHNvIHRoYXQgd2Ugc3Vydml2ZSBmcm9tIGEgDQpmYXVsdCBqdXN0IGxpa2UgcGF0Y2hfaW5zdHJ1
Y3Rpb24oKSA/DQoNCj4gKw0KPiArCWZsdXNoX2ljYWNoZV9yYW5nZShwYXRjaF9hZGRyLCBzaXpl
KTsNCj4gKw0KPiArCWlmICh1bm1hcF9wYXRjaF9hcmVhKHBva2VfYWRkcikpIHsNCj4gKwkJcHJf
d2FybigiZmFpbGVkIHRvIHVubWFwICVseFxuIiwgcG9rZV9hZGRyKTsNCj4gKwkJcmV0dXJuIC0x
Ow0KPiArCX0NCg0KSSBoYXZlIGNoYW5nZWQgdW5tYXBfcGFnZV9hcmVhKCkgdG8gYSB2b2lkIGlu
IA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRj
aC8yOTk4MDRiMTE3ZmFlMzVjNzg2YzgyNzUzNmM5MWYyNTM1MmUyNzliLjE2Mzg0NDYyMzkuZ2l0
LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCg0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9
DQo+ICsNCj4gKy8qKg0KPiArICogcGF0Y2hfbWVtb3J5IC0gd3JpdGUgZGF0YSB1c2luZyB0aGUg
dGV4dCBwb2tlIGFyZWENCj4gKyAqDQo+ICsgKiBAZGVzdDoJZGVzdGluYXRpb24gYWRkcmVzcw0K
PiArICogQHNyYzoJc291cmNlIGFkZHJlc3MNCj4gKyAqIEBzaXplOglzaXplIGluIGJ5dGVzDQo+
ICsgKg0KPiArICogbGlrZSBtZW1jcHkoKSwgYnV0IHVzaW5nIHRoZSB0ZXh0IHBva2UgYXJlYS4g
Tm8gYXRvbWljaXR5IGd1YXJhbnRlZXMuDQo+ICsgKiBEbyBub3QgdXNlIGZvciBpbnN0cnVjdGlv
bnMsIHVzZSBwYXRjaF9pbnN0cnVjdGlvbigpIGluc3RlYWQuDQo+ICsgKiBIYW5kbGVzIGNyb3Nz
aW5nIHBhZ2UgYm91bmRhcmllcywgdGhvdWdoIHlvdSBzaG91bGRuJ3QgbmVlZCB0by4NCj4gKyAq
DQo+ICsgKiBSZXR1cm4gdmFsdWU6DQo+ICsgKiAJQGRlc3QNCj4gKyAqKi8NCj4gK3ZvaWQgKnBh
dGNoX21lbW9yeSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNpemVfdCBzaXplKQ0KPiAr
ew0KPiArCXNpemVfdCBieXRlc193cml0dGVuLCB3cml0ZV9zaXplOw0KPiArCXVuc2lnbmVkIGxv
bmcgdGV4dF9wb2tlX2FkZHI7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0KPiArCS8v
IElmIHRoZSBwb2tlIGFyZWEgaXNuJ3Qgc2V0IHVwLCBpdCdzIGVhcmx5IGJvb3QgYW5kIHdlIGNh
biBqdXN0IG1lbWNweS4NCj4gKwlpZiAoIXRoaXNfY3B1X3JlYWQodGV4dF9wb2tlX2FyZWEpKQ0K
PiArCQlyZXR1cm4gbWVtY3B5KGRlc3QsIHNyYywgc2l6ZSk7DQo+ICsNCj4gKwlsb2NhbF9pcnFf
c2F2ZShmbGFncyk7DQoNCkRvIHdlIHdhbnQgdG8gZG8gc3VjaCBwb3RlbnRpYWxseSBiaWcgY29w
aWVzIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCA/DQoNCj4gKwl0ZXh0X3Bva2VfYWRkciA9ICh1
bnNpZ25lZCBsb25nKV9fdGhpc19jcHVfcmVhZCh0ZXh0X3Bva2VfYXJlYSktPmFkZHI7DQo+ICsN
Cj4gKwlmb3IgKGJ5dGVzX3dyaXR0ZW4gPSAwOw0KPiArCSAgICAgYnl0ZXNfd3JpdHRlbiA8IHNp
emU7DQo+ICsJICAgICBieXRlc193cml0dGVuICs9IHdyaXRlX3NpemUpIHsNCg0KSSByZWNvbW1l
bmQgeW91IHRvIHJlYWQgDQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL2NvZGluZy1zdHlsZS5odG1sP2hpZ2hsaWdodD1jb2RpbmclMjBzdHlsZSNuYW1pbmcN
Cg0KQXMgZXhwbGFpbmVkIHRoZXJlLCBsb2NhbCB2YXJpYWJsZSBuYW1lcyBzaG91bGQgYmUgc2hv
cnQuIFVzaW5nIGxvbmcgDQpuYW1lcyBpcyBub24tcHJvZHVjdGl2ZS4NCg0KWW91IGNvdWxkIGp1
c3QgY2FsbCBpdCAid3JpdHRlbiIsIGl0IHdvdWxkIGFsbG93IHlvdSB0byBrZWVwIHRoZSBmb3Io
KSANCm9uIGEgc2luZ2xlIGxpbmUsIHRoYXQgd291bGQgYmUgYSBsb3QgbW9yZSByZWFkYWJsZS4N
Cg0KPiArCQkvLyBXcml0ZSBhcyBtdWNoIGFzIHBvc3NpYmxlIHdpdGhvdXQgY3Jvc3NpbmcgYSBw
YWdlIGJvdW5kYXJ5Lg0KPiArCQl3cml0ZV9zaXplID0gbWluX3Qoc2l6ZV90LA0KPiArCQkJCSAg
IHNpemUgLSBieXRlc193cml0dGVuLA0KPiArCQkJCSAgIFBBR0VfU0laRSAtIG9mZnNldF9pbl9w
YWdlKGRlc3QgKyBieXRlc193cml0dGVuKSk7DQoNClJlZHVjZSB0aGUgc2l6ZSBvZiB5b3UgdmFy
aWFibGUgbmFtZXMgYW5kIGtlZXAgaXQgb24gYSBzaW5nbGUgbGluZS4NCg0KPiArDQo+ICsJCWlm
IChkb19wYXRjaF9tZW1vcnkoZGVzdCArIGJ5dGVzX3dyaXR0ZW4sDQo+ICsJCQkJICAgIHNyYyAr
IGJ5dGVzX3dyaXR0ZW4sDQo+ICsJCQkJICAgIHdyaXRlX3NpemUsDQo+ICsJCQkJICAgIHRleHRf
cG9rZV9hZGRyKSkNCg0KU2FtZSwga2VlcCBhIHNpbmdsZSBsaW5lIGFzIG11Y2ggYXMgcG9zc2li
bGUuDQoNCj4gKwkJCWJyZWFrOw0KPiArCX0NCj4gKw0KPiArCWxvY2FsX2lycV9yZXN0b3JlKGZs
YWdzKTsNCj4gKw0KPiArCXJldHVybiBkZXN0Ow0KDQpNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gcmV0dXJuIEVSUl9QVFIoKSBvZiB0aGUgZXJyb3IgcmV0dXJuZWQgYnkgDQpkb19wYWdlX21l
bW9yeSgpLg0KDQo+ICt9DQo+ICAgI2Vsc2UgLyogIUNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCAq
Lw0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBz
dHJ1Y3QgcHBjX2luc3QgaW5zdHIpDQo+IEBAIC0xODUsNiArMjU0LDExIEBAIHN0YXRpYyBpbnQg
ZG9fcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBzdHJ1Y3QgcHBjX2luc3QgaW5zdHIpDQo+
ICAgCXJldHVybiByYXdfcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgaW5zdHIpOw0KPiAgIH0NCj4g
ICANCj4gK3ZvaWQgKnBhdGNoX21lbW9yeSh2b2lkICpkZXN0LCBjb25zdCB2b2lkICpzcmMsIHNp
emVfdCBzaXplKQ0KPiArew0KPiArCXJldHVybiBtZW1jcHkoZGVzdCwgc3JjLCBzaXplKTsNCj4g
K30NCj4gKw0KPiAgICNlbmRpZiAvKiBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggKi8NCj4gICAN
Cj4gICBpbnQgcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBzdHJ1Y3QgcHBjX2luc3QgaW5z
dHIpDQo+IA0KDQpDaHJpc3RvcGhl
