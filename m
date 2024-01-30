Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243884222E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 12:04:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mmZIPZl+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPMkF0GQWz3cVc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 22:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mmZIPZl+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPMjV1GLpz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 22:03:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI9sxT/Ce5sO/rhFFYhYFIslabruAsYFBud0eMfcKxuujjumApKQMwOnLcNS7Q9Y96Dw2R8nQDLQvbxgzb8cvdNzb7NRnYcZ8kRIJr7SL+NSMas/7P2Bv52pZqNwbUDcTnzXIo5TmLMZ9NgMOOYTZXZr6hNFXdRXvcjW8qeDZMkWcFztVPJVVRFIcxu74Cj9u1bJlofMDfsT2jd1NIf69QVvy0jXLzCSbLUZXJP7HbtTMPEcsBeoY3to1Ol0ijnIpiWyr/jprhl6jqn7x7l7xnUE2nQbkHottHasUfLFtkPumGdhyyRBCvgmM5vgFtDlZ9aDuvNVB50YLp3oFOJL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azk2mkbe4ShGrknjRNK7ASG45mSduRcb6MnmaLE11Zc=;
 b=RY7nHEdxmNVat4axemYe5Mylu0TJCIXrO01xtH2B8u4bfm41RKyS28FC6FWT53T8AEuvsWc/TpIyc9RrCRe286D5IpCnUKRzg+rb6mUaNl1dTiHTIxa4EbgP14xIFghw0CYGYJgfIkWTLOwAwTR82N6d22pZ49COh679pFNfI3TnpVh9QlyrFGWN2hNd/ZlWJIFT7N466ydwf5JuHkO04SCtzv5x68VOYnIACwbmDxlvzkGJNjCFGO7hAzEvgB2yVyVMxd4vUF0QMmbOX9IJgYmmkcuJ9mdUJrmpTN1m+5eTcv7QEbw5dWc68iKAbjA2Tx9fAKtfJSzThbpSCM9cdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azk2mkbe4ShGrknjRNK7ASG45mSduRcb6MnmaLE11Zc=;
 b=mmZIPZl+0EJY4ze5/2X9HNXv7WhL3Zixj8q2sBthCpwecWFtUT0MT/C1Rn4Yd1mmaivPK8O6r69rz9F9aFO80KWDBkF65vt18AAQ4WeS6Agp4ZPro7iBw3rOsS1RptK7Nhe+O6i/wpSPgy8I7xBGaYL+B6YkIaWCaB4PBCnDVWm1pOTAfBwLa1m8Yi/OPg7S3z0DaMjaXDHLqK1rQ5pl8Sd1W71bKBD2GflieSeVx5i6Z9ytgabYkSBz2ZQTywMQuvhVM337ay1rMx8CS4lA6JO/qX7kNqyCKpcs3nqjMeiVRvNiOYg8NyCAegcxQS2Vb5id1lB6gXY8my8OyOyiQA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2544.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 11:03:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 11:03:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Chen-Yu Tsai <wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Topic: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Index: AQHaM+yXNPEoBBWgvUqc5dink/c7D7DxdmEAgADbxgCAAB3agA==
Date: Tue, 30 Jan 2024 11:03:17 +0000
Message-ID: <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
References:  <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
In-Reply-To: <20240130091626.GA3684878@google.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2544:EE_
x-ms-office365-filtering-correlation-id: 0604520b-05a0-4df5-51a3-08dc21831088
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5TnK8+pHSyqkyGJrOHY9/EZZw3eAC3LTfR3kO2/S89g4s7HvZ7MVgXTP3WGVtxlJmqwP3GaZk3J4uVkezBXrpWD+FYxTe8lSYmGsx1ZukIPdmpDHlRW1CHMdHksr506qFKOkmwEC5lxnPVL7k7G4I8rmhKPVOw66Vai5jlf7FGvB72xRgZbMEblKyr+4445G6V0flHEmIue3kvi0vZ9LPvcpbayZA4qoAogz1OmgkytyQZlAjOzC+V/TLO5ClEolu3YAcAuvC6LUhu+mOVHV6H51NDjOcI/gEbVJEvM9HnD+8dXh7DND+dy0paeg/BeqSZW797GzRaGXyJi/f7ICosrRpFz8oLVkjxxpHMSTAfqYsqIRCqYB5LfjYXgxO7EwOD2vp4KkqSRdB2nZ11cz8rK0ASoF1fdW5uYFsuI/1xx94J0i4YXI40mc8QoxiUp88rjapDI/p1AHzLD2aZQF8YcDCCA/a4Ed7TCZbWVzaVTn8L0N7MscpjBqtbM1laGbg4PqEvDYKZ+yTZ1u5BfZKFx3/7/OzTLORK2ZZBRjQRgiG108MOyhHIfZBtoWIBiMpp1mgNSb4TC806S9RS+5KewhvIaHdZtVWrk6bdY+H8O42ni4VeXjkHAPm6HdKDgPiKj/rz/e3O0DasHT1C3j7DK04pFQLwxyhQOPW6YHyiR0vayPKmHjmDbbbmudTkin
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(71200400001)(6486002)(4326008)(2906002)(8936002)(8676002)(44832011)(31696002)(5660300002)(76116006)(86362001)(316002)(91956017)(66556008)(110136005)(66946007)(66476007)(66446008)(64756008)(54906003)(38070700009)(36756003)(966005)(38100700002)(122000001)(6512007)(6506007)(478600001)(45080400002)(26005)(2616005)(66574015)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UDJ4b0pxTlpGZ3NUckpzU1pKQTNFRXMwdEQvVEZRNmo2dkwwSGhzZkJlQUEz?=
 =?utf-8?B?RWd0YnVyelRRZksxVFpqcXM0alVxWVJjSGFJaCt5NkFRYk1jVDZOejNaVWNx?=
 =?utf-8?B?UlJpNzJxV1VVeG1uVzh6ZThsRnI4Rk5XL1U0eCtYRlZWcnNCNTFZTTdOK3Jr?=
 =?utf-8?B?VllLYkkvN3VSNTRHRXBHRWxyLytoK2tWaU9Id0pxUEZPcXd4Vyt5QzZGVHFR?=
 =?utf-8?B?M3VCM1czNjR0b2FsalhsT2FoWm8vMWUrY2ZEaXZ6VmFSNW9yZGQ0bDc4RnA5?=
 =?utf-8?B?OGxzdGNTeDN3WHU2RlpUQ05hbFMrSE9JNUJSelJLNUswZlRFWDVsd2ErNHgw?=
 =?utf-8?B?MlFtL1hwZzQvQTdBUEFUejNLOTNQNHJJUEMzamJIcmt2a0RsUERiQzdWTk9I?=
 =?utf-8?B?VUFFbjZyMXdqSURoUmtzZXA4d2FrM0tKK3BKeUw1N2grWkd2anVqK0RsZEtK?=
 =?utf-8?B?aGlsQW5LeFdqQlRnRHIrempuT2dVdUlHeHRKbDRWZGswemdSWlkxOVdXSCtv?=
 =?utf-8?B?WHM5UkMzNzBhZ2VXRVM4S2EzQWVGc0FxQ0dPbXl6WUhkam1CQ2dtMjRVZzJP?=
 =?utf-8?B?VVRpQlhxRjV6M1Rkd2VuMG9rTjhMVlgyRk9LTHlyRjZFNndTbXQwcGFjbnZq?=
 =?utf-8?B?cjJYNFFnK0tDUXFpMHJxMjh4bG5JSG0xOExVTkdvZ3JQdFM3ZVFXSjNjN3N4?=
 =?utf-8?B?UzVOMzE5SGx3cTQzbzIvY1hlZzVJTUE3TFZKSGcrT0V5SUdySUhZN1ltbWwv?=
 =?utf-8?B?S0JiTVlBUnVBNHBGTHFIVm9CRE5LdVFnekNDM25TaUpNV1F6Q0pBckhDLy91?=
 =?utf-8?B?bERBZ1E0TUh0YWlYd0Urd2IwckRjeFJBNmsyVmx4WjVqL3V1Z0tPSk1GaVk0?=
 =?utf-8?B?UWV4a2hLblBSWm5uMDRWWVhUOGZKNlNXRnJjdjg2dElHOU5tblRWa0RJeHRJ?=
 =?utf-8?B?TkJLc0pLTkF5cmVpSURHYjNFNlZOY2ZpUXNKdFM0TnhML1RNUXRsZ0tybU43?=
 =?utf-8?B?aVFjeno5SkZqcDBVc2pFNzhmUW9STjF1M3lTQXpLdlhpU284NEY3dVBGSXNi?=
 =?utf-8?B?M2xmRHJWOVVFaTJQQUZOY25idmxGMjlmVzVGUmt3cEljYkVNV2RwRFhRTUQ4?=
 =?utf-8?B?ZitiekNwRjBZTVpLeVVzcHQ5M3g1S3c4SlYvZ1FRLzdJalRVMTBVSFlvTGk3?=
 =?utf-8?B?OTBWbG9HT3AvTC9kQ2RBWGZuS1l6UFlnNlVJbUw2SE52TGNkYlpUR3QyamVi?=
 =?utf-8?B?YWZHeUdqTTQ0ZFlQTkkrWHFYcG1kQU5mU1RibG5RZzFFTmFzWWxmd0lyTTRo?=
 =?utf-8?B?WjhtaGI3NkI3TVFaS1p5T0svbk1HQlBiNm5OV0lJNXcyWmdNOXRYSlZqY1dR?=
 =?utf-8?B?ZWFKVnEvckpHbGgvSHFmVjJmU3laVkZVRVl2R2N6NXIrdkFaNWR0UWgrRloz?=
 =?utf-8?B?dzg2TGRLLzJROFFxT29Nak9TWnhaQ3dsNThVWERVbThzcDZPUEFic1dJb210?=
 =?utf-8?B?Sm5vUTRLYWo2ZGtVYVhITGxYTExmUEluZ0xZeTY3WEw3cVVRa1oyTXk2U1h5?=
 =?utf-8?B?Unh5TUszKzNRczhIcGFReUxldDNHQndtcEhCWVRZMjlDKythSFJzTTJySkN2?=
 =?utf-8?B?Qk40R1U1eGpQYW5IYmttSzZES1doMTFWZ1JCNUdUd0IvdGFDempPWVgzRHdk?=
 =?utf-8?B?YXEwT0IrenF4bmF1Z0pHSTBYNlRObXdIb2dLZ2NLa29GUGUrSGVlb2Iyd2l6?=
 =?utf-8?B?Rys1OTRGNHhyS0owSEsvVFMzRUI1SHUyNEFqSEIyQ091My9YdmdYeFUzUFhV?=
 =?utf-8?B?elJieFUwVjBCOTRLd1JnVDczb1c0UmpsVnAybWM0dEppNGcxR0YwN3ZmRnZV?=
 =?utf-8?B?WklRRWFoVnVIMTdXdVpkN3hpQ2pQUm55WkJDa0dSZ0p3eWE2dlZEaWp2MFVF?=
 =?utf-8?B?d2RHNUN5NTRrL0cydnFMeDNvQnZ6UExlT0Fhem9GK3ozWENLMzJwSTQ2SXc2?=
 =?utf-8?B?ZDBkMXdBdDN4SEtqUFhBQS9EUElCKzkvdUhMd2NmaFQzek1oWS9Kem5xclNV?=
 =?utf-8?B?ZXh4djVrUTRHOTJHbHVZcGpTUmJxeW91aTEvN0MvMW9VSzYyY3dURzFxZnpV?=
 =?utf-8?Q?yEvZZS2yGzxV3QIaSyyplVDBs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91E213081848CB4F8970AF821BA9EFCC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0604520b-05a0-4df5-51a3-08dc21831088
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 11:03:18.1158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loBICY+7DQfd6bycAGeYHjw9t/Qv5pqC0CdHA5FgUu8QzcrULCUNodCwZIVrg9XzUB5lvHsuFBq0Wm5J9/Gao6WnlYU433KJuZSXEWSo5GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2544
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzAxLzIwMjQgw6AgMTA6MTYsIENoZW4tWXUgVHNhaSBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSB3ZW5zdEBjaHJvbWl1
bS5vcmcuIEQ/Y291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgPyBodHRwczovL2Fr
YS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gSGksDQo+IA0KPiBP
biBNb24sIEphbiAyOSwgMjAyNCBhdCAxMjowOTo1MFBNIC0wODAwLCBMdWlzIENoYW1iZXJsYWlu
IHdyb3RlOg0KPj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6MDI6NDZBTSArMDEwMCwgQ2hy
aXN0b3BoZSBMZXJveSB3cm90ZToNCj4+PiBEZWNsYXJpbmcgcm9kYXRhX2VuYWJsZWQgYW5kIG1h
cmtfcm9kYXRhX3JvKCkgYXQgYWxsIHRpbWUNCj4+PiBoZWxwcyByZW1vdmluZyByZWxhdGVkICNp
ZmRlZmVyeSBpbiBDIGZpbGVzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4NCj4+IFZlcnkgbmljZSBjbGVh
bnVwLCB0aGFua3MhLCBhcHBsaWVkIGFuZCBwdXNoZWQNCj4+DQo+PiAgICBMdWlzDQo+IA0KPiBP
biBuZXh0LTIwMjQwMTMwLCB3aGljaCBoYXMgeW91ciBtb2R1bGVzLW5leHQgYnJhbmNoLCBhbmQg
dGh1cyB0aGlzDQo+IHNlcmllcyBhbmQgdGhlIG90aGVyICJtb2R1bGU6IFVzZSBzZXRfbWVtb3J5
X3JveCgpIiBzZXJpZXMgYXBwbGllZCwNCj4gbXkga2VybmVsIGNyYXNoZXMgaW4gc29tZSB2ZXJ5
IHdlaXJkIHdheS4gUmV2ZXJ0aW5nIHlvdXIgYnJhbmNoDQo+IG1ha2VzIHRoZSBjcmFzaCBnbyBh
d2F5Lg0KPiANCj4gSSB0aG91Z2h0IEknZCByZXBvcnQgaXQgcmlnaHQgYXdheS4gTWF5YmUgeW91
IGZvbGtzIHdvdWxkIGtub3cgd2hhdCdzDQo+IGhhcHBlbmluZyBoZXJlPyBUaGlzIGlzIG9uIGFy
bTY0Lg0KDQpUaGF0J3Mgc3RyYW5nZSwgaXQgc2VlbXMgdG8gYnVnIGluIG1vZHVsZV9idWdfZmlu
YWxpemUoKSB3aGljaCBpcyANCl9iZWZvcmVfIGNhbGxzIHRvIG1vZHVsZV9lbmFibGVfcm8oKSBh
bmQgc3VjaC4NCg0KQ2FuIHlvdSB0cnkgdG8gcmV2ZXJ0IHRoZSA2IHBhdGNoZXMgb25lIGJ5IG9u
ZSB0byBzZWUgd2hpY2ggb25lIA0KaW50cm9kdWNlcyB0aGUgcHJvYmxlbSA/DQoNCkluIHJlYWxp
dHksIG9ubHkgcGF0Y2ggNjc3YmZiOWRiOGEzIHJlYWxseSBjaGFuZ2UgdGhpbmdzLiBPdGhlciBv
bmVzIGFyZSANCm1vcmUgb24gbGVzcyBvbmx5IGNsZWFudXAuDQoNClRoYW5rcw0KQ2hyaXN0b3Bo
ZQ0KDQoNCj4gDQo+IFsgICAxMC40ODEwMTVdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2lu
ZyByZXF1ZXN0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmZmZkZTg1MjQ1ZDMwDQo+IFsgICAxMC40
OTAzNjldIEtBU0FOOiBtYXliZSB3aWxkLW1lbW9yeS1hY2Nlc3MgaW4gcmFuZ2UgWzB4MDAwMDAw
ZjQyOTIyZTk4MC0weDAwMDAwMGY0MjkyMmU5ODddDQo+IFsgICAxMC41MDM3NDRdIE1lbSBhYm9y
dCBpbmZvOg0KPiBbICAgMTAuNTA5MzgzXSAgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDA0Nw0KPiBb
ICAgMTAuNTE0NDAwXSAgIEVDID0gMHgyNTogREFCVCAoY3VycmVudCBFTCksIElMID0gMzIgYml0
cw0KPiBbICAgMTAuNTIyMzY2XSAgIFNFVCA9IDAsIEZuViA9IDANCj4gWyAgIDEwLjUyNjM0M10g
ICBFQSA9IDAsIFMxUFRXID0gMA0KPiBbICAgMTAuNTMwNjk1XSAgIEZTQyA9IDB4MDc6IGxldmVs
IDMgdHJhbnNsYXRpb24gZmF1bHQNCj4gWyAgIDEwLjUzNzA4MV0gRGF0YSBhYm9ydCBpbmZvOg0K
PiBbICAgMTAuNTQwODM5XSAgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwNDcsIElTUzIgPSAweDAw
MDAwMDAwDQo+IFsgICAxMC41NDY0NTZdICAgQ00gPSAwLCBXblIgPSAxLCBUbkQgPSAwLCBUYWdB
Y2Nlc3MgPSAwDQo+IFsgICAxMC41NTE3MjZdICAgR0NTID0gMCwgT3ZlcmxheSA9IDAsIERpcnR5
Qml0ID0gMCwgWHMgPSAwDQo+IFsgICAxMC41NTc2MTJdIHN3YXBwZXIgcGd0YWJsZTogNGsgcGFn
ZXMsIDM5LWJpdCBWQXMsIHBnZHA9MDAwMDAwMDA0MWY5ODAwMA0KPiBbICAgMTAuNTY1MjE0XSBb
ZmZmZmZmZGU4NTI0NWQzMF0gcGdkPTEwMDAwMDAyM2ZmZmYwMDMsIHA0ZD0xMDAwMDAwMjNmZmZm
MDAzLCBwdWQ9MTAwMDAwMDIzZmZmZjAwMywgcG1kPTEwMDAwMDAxMTIxZWIwMDMsIHB0ZT0wMDAw
MDAwMDAwMDAwMDAwDQo+IFsgICAxMC41Nzg4ODddIEludGVybmFsIGVycm9yOiBPb3BzOiAwMDAw
MDAwMDk2MDAwMDQ3IFsjMV0gUFJFRU1QVCBTTVANCj4gWyAgIDEwLjU4NTgxNV0gTW9kdWxlcyBs
aW5rZWQgaW46DQo+IFsgICAxMC41OTAyMzVdIENQVTogNiBQSUQ6IDE5NSBDb21tOiAodWRldi13
b3JrZXIpIFRhaW50ZWQ6IEcgICAgQiAgICAgICAgICAgICAgNi44LjAtcmMyLW5leHQtMjAyNDAx
MzAtMDI5MDgtZ2U4YWQwMWQ2MDkyNy1kaXJ0eSAjMTYzIDNmMjMxODE0OGVjYzVmYTcwZDEwOTJj
MmI4NzRmOWI1OWJkYjdkNjANCj4gWyAgIDEwLjYwNzAyMV0gSGFyZHdhcmUgbmFtZTogR29vZ2xl
IFRlbnRhY3J1ZWwgYm9hcmQgKERUKQ0KPiBbICAgMTAuNjEzNjA3XSBwc3RhdGU6IGEwNDAwMDA5
IChOekN2IGRhaWYgK1BBTiAtVUFPIC1UQ08gLURJVCAtU1NCUyBCVFlQRT0tLSkNCj4gWyAgIDEw
LjYyMTk1NF0gcGMgOiBtb2R1bGVfYnVnX2ZpbmFsaXplKzB4MTE4LzB4MTQ4DQo+IFsgICAxMC42
MjY4MjNdIGxyIDogbW9kdWxlX2J1Z19maW5hbGl6ZSsweDExOC8weDE0OA0KPiBbICAgMTAuNjMx
NDYzXSBzcCA6IGZmZmZmZmMwODIwNDc4ZDANCj4gWyAgIDEwLjYzMTQ2Nl0geDI5OiBmZmZmZmZj
MDgyMDQ3OGQwIHgyODogZmZmZmZmYzA4MjA0N2NhMCB4Mjc6IGZmZmZmZmRlOGQ3ZDMxYTANCj4g
WyAgIDEwLjYzMTQ3N10geDI2OiBmZmZmZmZkZTg1MjIzNzgwIHgyNTogMDAwMDAwMDAwMDAwMDAw
MCB4MjQ6IGZmZmZmZmRlOGM0MTNjYzANCj4gWyAgIDEwLjYzMTQ4Nl0geDIzOiBmZmZmZmZkZThk
ZmNlYzgwIHgyMjogZmZmZmZmZGU4ZGZjZTAwMCB4MjE6IGZmZmZmZmRlODUyMjNiYTgNCj4gWyAg
IDEwLjYzMTQ5NV0geDIwOiBmZmZmZmZkZTg1MjIzNzgwIHgxOTogZmZmZmZmZGU4NTI0NWQyOCB4
MTg6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgIDEwLjYzMTUwNF0geDE3OiBmZmZmZmZkZThhYTE1
OTM4IHgxNjogZmZmZmZmZGU4YWFiZGQ5MCB4MTU6IGZmZmZmZmRlOGFhYjgxMjQNCj4gWyAgIDEw
LjYzMTUxM10geDE0OiBmZmZmZmZkZThhY2RkMzgwIHgxMzogMDAwMDAwMDA0MWI1OGFiMyB4MTI6
IGZmZmZmZmJiZDFiZjlkOTENCj4gWyAgIDEwLjYzMTUyMl0geDExOiAxZmZmZmZmYmQxYmY5ZDkw
IHgxMDogZmZmZmZmYmJkMWJmOWQ5MCB4OSA6IGRmZmZmZmMwMDAwMDAwMDANCj4gWyAgIDEwLjYz
MTUzMV0geDggOiAwMDAwMDA0NDJlNDA2MjcwIHg3IDogZmZmZmZmZGU4ZGZjZWM4NyB4NiA6IDAw
MDAwMDAwMDAwMDAwMDENCj4gWyAgIDEwLjYzMTUzOV0geDUgOiBmZmZmZmZkZThkZmNlYzgwIHg0
IDogMDAwMDAwMDAwMDAwMDAwMCB4MyA6IGZmZmZmZmRlOGJiYWRmMDgNCj4gWyAgIDEwLjYzMTU0
OF0geDIgOiAwMDAwMDAwMDAwMDAwMDAxIHgxIDogZmZmZmZmZGU4ZWFmZjA4MCB4MCA6IDAwMDAw
MDAwMDAwMDAwMDANCj4gWyAgIDEwLjYzMTU1Nl0gQ2FsbCB0cmFjZToNCj4gWyAgIDEwLjYzMTU1
OV0gIG1vZHVsZV9idWdfZmluYWxpemUrMHgxMTgvMHgxNDgNCj4gWyAgIDEwLjYzMTU2NV0gIGxv
YWRfbW9kdWxlKzB4MjVlYy8weDJhNzgNCj4gWyAgIDEwLjYzMTU3Ml0gIF9fZG9fc3lzX2luaXRf
bW9kdWxlKzB4MjM0LzB4NDE4DQo+IFsgICAxMC42MzE1NzhdICBfX2FybTY0X3N5c19pbml0X21v
ZHVsZSsweDRjLzB4NjgNCj4gWyAgIDEwLjYzMTU4NF0gIGludm9rZV9zeXNjYWxsKzB4NjgvMHgx
OTgNCj4gWyAgIDEwLjYzMTU4OV0gIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4MTFjLzB4
MTUwDQo+IFsgICAxMC42MzE1OTRdICBkb19lbDBfc3ZjKzB4MzgvMHg1MA0KPiBbICAgMTAuNjMx
NTk4XSAgZWwwX3N2YysweDUwLzB4YTANCj4gWyAgIDEwLjYzMTYwNF0gIGVsMHRfNjRfc3luY19o
YW5kbGVyKzB4MTIwLzB4MTMwDQo+IFsgICAxMC42MzE2MDldICBlbDB0XzY0X3N5bmMrMHgxYTgv
MHgxYjANCj4gWyAgIDEwLjYzMTYxOV0gQ29kZTogOTdjNTQxOGUgYzg5ZmZlZjUgOTEwMDIyNjAg
OTdjNTNjYTcgKGY5MDAwNjc1KQ0KPiBbICAgMTAuNjMxNjI0XSAtLS1bIGVuZCB0cmFjZSAwMDAw
MDAwMDAwMDAwMDAwIF0tLS0NCj4gWyAgIDEwLjY0Mjk2NV0gS2VybmVsIHBhbmljIC0gbm90IHN5
bmNpbmc6IE9vcHM6IEZhdGFsIGV4Y2VwdGlvbg0KPiBbICAgMTAuNjQyOTc1XSBTTVA6IHN0b3Bw
aW5nIHNlY29uZGFyeSBDUFVzDQo+IFsgICAxMC42NDgzMzldIEtlcm5lbCBPZmZzZXQ6IDB4MWUw
YTgwMDAwMCBmcm9tIDB4ZmZmZmZmYzA4MDAwMDAwMA0KPiBbICAgMTAuNjQ4MzQzXSBQSFlTX09G
RlNFVDogMHg0MDAwMDAwMA0KPiBbICAgMTAuNjQ4MzQ1XSBDUFUgZmVhdHVyZXM6IDB4MCxjMDAw
MDA2MSw3MDAyODE0YSwyMTAwNzIwYg0KPiBbICAgMTAuNjQ4MzUwXSBNZW1vcnkgTGltaXQ6IG5v
bmUNCj4gDQo=
