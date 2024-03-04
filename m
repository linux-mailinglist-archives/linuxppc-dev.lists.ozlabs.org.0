Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973B870952
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:17:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kaLL/xOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpRkH0983z3vbW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kaLL/xOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpRjV3gxMz3cCG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 05:16:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5vBJlJCiP5gHemKGOsRnkTTL+Rs8/l18xixho6M3vKjfXmBAZ2F18dWz3MZPOBXoMcSdNW8tOsBH1o45nFJLEFyhA2js7Cvu3vY7gurW4YMU0/6AUnMquo/sM6kExoIQw+tNMoUk2r6Y5m8dNR51aa0cphtXbj8Gn1EUn1q/AfVX8L9xjw7UDW5DHAlI7V7QnWhIGZ0Ohjz4x6kovU4OObDKf8rgRlQdp4jv3pi/s+FMoihiCRFHctI4+f/hZU3rwy5B5kw+EUcl5na5cB8x8Wgv3v6/WA4qXHAjqCLQzR3turqdDio51ThQRPbFytBKH6wFOfTSYZ9mJMVIOiTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWBE5SJWvgXMqF5k4NXQYMybo73+vZzE2gGxaOwOuP0=;
 b=a8b56zaKGL1R3zJLjg4a1RLIpXNhaWQn7uL68uTEz0oGN42zUSdeIquJN0QUOhQ3iwBq8rvEY119/C4MlQuXOQE5wKVURPNOviietzzyAsGV2H4H68PEHr7rLi0wMSUhGvQgpG6i+SR2dD5IpOF+DGh3CLKudaAuO1VI6f5BMFjDdlP9zZ0UtcYZUbk2mIj8bdBNb5RnXZpHlaV3DGpMGmaKl5hTmcFmcrvayBPodgY0yO/C209Iw7IP3eAgRB/CUTghBf0IA5FNOSVC5pqqQVcLGakKmm5rATwbFWB6fSRDAT4KWmTDChVpUQ5Qd58yoCWubPwlaFvADJP5iVG/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWBE5SJWvgXMqF5k4NXQYMybo73+vZzE2gGxaOwOuP0=;
 b=kaLL/xOXkLsdNrw1X+wVfH8CqnJ8u5uXA4aSsgHjClWYiN9B/mqicZvrnRKbJ2Yq9uPuMqi+mFVWAO2NieIuAc87cPGazrODrgb0qqXgSAw2Lz2b9kuCguU8otyKcTsc7CT25Q7Ay1B4KH+tS4L+po0Hqj7T+6dNoBvyD3Wk6lTmkqk4wG3v545dfqw9BH2P4OvL8UuonFtLTlUM4Lp3x+0WKTYAgDUQPzkLo5bODRaXcenldj3FSkMMTX4kGlHXAjQns1MDRN6ZONu365mHJZSDw60p35n/zAs8w7tC2hW7nCzySL68XZ/LupcQxm1p9O+W3VCCa4BVxdT/ffmK+w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2444.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 18:16:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 18:16:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nayna Jain <nayna@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/pseries: fix max polling time in
 plpks_confirm_object_flushed() function
Thread-Topic: [PATCH] powerpc/pseries: fix max polling time in
 plpks_confirm_object_flushed() function
Thread-Index: AQHabgElOFO+3VFlnkiTtQXL/aTeb7En5CEA
Date: Mon, 4 Mar 2024 18:16:27 +0000
Message-ID: <21b1ddc4-fc5d-4069-9998-6fd1a51171d4@csgroup.eu>
References: <20240304065326.787453-1-nayna@linux.ibm.com>
In-Reply-To: <20240304065326.787453-1-nayna@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2444:EE_
x-ms-office365-filtering-correlation-id: 9f85a51f-bdef-45b7-490f-08dc3c77354c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fkXr63JuaksFeVCTxlGlNg4oygIYoKMDYFquvXh0r1am6fqmqQi893gjFLaFPQliFIzzmjNP1IRKM7uPr0QiqmXhWw0F/0AAXJ4At9x98B7W4x3lkUNadK3zRlgqf1iqY7KX2E000dqXINrefpdp3cmaU+1TRRmW/mUNj78YCI9ewB6NHNLkIM3DwuI1MG2pDJyD14YPQgKy1XasBXxKjwKhCswriTYkVm4Xq/wjmk6MjCWigwri6YKzpC1SWpRV60BnKAgWiBba80lVoNwnnH5ztesEYRGaBIBfTK9naDfORAzBqhuVydJRdpFJVmr8rMFeqT8JR6WYgv+YaEcm7p6nMZZrqYeIduT5PoDP7jbtflolvU0AShTu3znob23o2c5J0zAVoBwFG2dgiqhGo1bkt+Ny5vw9eL8cSu504ZNAX8EGf6HgRAOHCDJFgCmtvAi9Hnh8v8uKF8m9sKJvbw39kjjveuncJJ3LfxF+Ci59yOEIChFVT/Jgj76k9K/Jkrvl3ik/gMsdJfucu3KS6favpSRkWOsq0wA0Al1eH3tZWK3g2s8MWAw4aguApmeS9P0rvpqgAjgYJz+R93gW7KFmM0ZQY6k0AVayEHohlbhWDp7ZVHKB/h9SceR4lFdXbejAHkUqz+87aVtyqAAvhvRdy9FtoKKkoyWsr5IqzBPu55keRaqstszktitJZ9n22tPXzfo4Ncly/ACMg8wG2ZJDBxHOGgHMbR1X+PwTnxU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bVk4THhvU0ZTcUZuVnNuUklTYUUvSEQyd1VZbVBpc0JIYjlBZFNOMmdnN0tW?=
 =?utf-8?B?d2l6dFBLU2NKVW15MUMwK3JwR3JjK1FNeEI4eUcramR2L2s1S0dxekRmdnFL?=
 =?utf-8?B?L0srTG5WU1lZY0wvTDVOM2Fvb0pLZk5GRElWcERGZ1huem9kWDlVbnZEVkxV?=
 =?utf-8?B?aW4zWUNZN095SW5pV1ZLc3cwNVkxcnV1a0p1L1BONzNKaVhFTWtBUmY2SDhs?=
 =?utf-8?B?VVpCZTdLMk9CVzFlcWxsanE4ZWdrUHcrZWxXSDFnNytPekZ0TTNCTG1JdGRM?=
 =?utf-8?B?aUswM2NHcHU5RTBuNVBWcTN0aktCNjFnYkFnL01rbUlYNGt6QVE2eEdLQXZR?=
 =?utf-8?B?b20zellZQkdOYlR3bi9ua1FxRy9VdmRtaERyL0lTNlFVWDJEbkI0OHlyNnpV?=
 =?utf-8?B?a0tnNFhRWDhkd01JeUg4RTZReE8rZkpyMlNpSlJjVllvcmlJSWl1L3RWRW41?=
 =?utf-8?B?bUtoN1ZsYndDK1lHQ3VMQ28wTU95MXFxWSsxMmM4OTQybUZLdVlaUVpscElZ?=
 =?utf-8?B?WSt5OFZSUlJ1NXRJQnprMUxoU0hTQkVxRDJmVWJzTW5iYzdXdEFUSTBsMTJK?=
 =?utf-8?B?ejc2TFpHRTd4WTRXUkhZNUk3TVl6KzljLzdDUVNwTFNZT1VQV3Rkak9DVG9V?=
 =?utf-8?B?WmJrVG9oNjBIc3B6OEd4NXFRUUs3MHBhZ1B5QU0vcVN3R0tXV1ZVVjBKUnpl?=
 =?utf-8?B?L3cxK1pDZlJMM2pLNzJKbjdXdS9HK0FQaFJWb082YmlTMWJHOUN5RXYvWnhK?=
 =?utf-8?B?ZTBqcG14L2JvWENKMWVVaXVUZDFlK2I4UytjM3AxVlE5cDNBYlRwN1h3M0xx?=
 =?utf-8?B?NE9waEtaUEpsRUhLd2s0YTNBQjd5dVZVd25kc3lRYTNhczF1ZlZqRkZ2MTVY?=
 =?utf-8?B?WnVlbW1aRStxWFZ3VnlsYmpZYWZCaTVGalgrUnBJOUwwRklKay9uUHVmYitz?=
 =?utf-8?B?SUxSZW40N01md1NIWmVDcktDUXZta3RvMU9xMHRiUjI2QTltNXdtOEUvUFVm?=
 =?utf-8?B?YlJmM1hEaXpCakQvMEhtSTQzUnpDbkNRVWIxalZhOHVVTjlmRkZQWm5PM3BX?=
 =?utf-8?B?R1E5d1kvSjhIbVF3Rld3VWlBdkhoOUpuS3lVMEtsNVVrdmN6S3ArSjlkeC9X?=
 =?utf-8?B?WGFHVGRFZ3EvMjRGQjFMbmlzd3RyWmNXSmEvUTFvNWhHV09TTXNBYmxXT1lw?=
 =?utf-8?B?c1ZjWUlGTTRUYlE3K2NWeWhqdVZ1YmdSQlF5c1ZEQThkZWUyV3hGbWJ1RFZh?=
 =?utf-8?B?NHRZcUF5YXY4UWMyMDJRalJMdGZKTXdZOThRWWZXNFZRTzQ0OWc4RWpVMU15?=
 =?utf-8?B?Mm5XTVRFMTBxSG1mOU5jeXkxNVNhalNXMmd4ZWtJWjhtVW9pSmttakdpTkhU?=
 =?utf-8?B?dXZ1R1FmWHlOUlE0eWNPTG9KYVBLODNDOGNoRnF5bFdBZ0d0d1FYSDJ5aSsr?=
 =?utf-8?B?SE9va3U5dlA2QVZ0RXlJUUxmT0YvTDd1YXUyUis0aXFqKy9yT1c3WGNXMUQ3?=
 =?utf-8?B?YUUrMmF2M0g4SndJaDZDOXQ0N25tN2djRVFnU3dJY1hIS3hBS2hDVzRGblp6?=
 =?utf-8?B?TUZWNUpoTEE2NXZVTmVMK1F0Wlo1Ull5NlZLZ0RVNnRvd3hha1JqWmFRdE8y?=
 =?utf-8?B?RWtwZDhOdGxOS3A4S1oxSm1sVmc0SWdrY0NGV1Q0bXJBaFdUdlVMQ1BwMTJM?=
 =?utf-8?B?bit3azVkbEMxa25DK25WODdONTBDNDZlQjU0SHNtdGdkWjBGdjFNOHI4ZzJp?=
 =?utf-8?B?U0wwMjE0amVISExXN00wamM0czRNZnUyaWxlU2NtUkpjOEtPNHZPMFVUQXhp?=
 =?utf-8?B?bGVYOUhHV0UwTTFob29MbDU3cG55Ri9IdFAvbnlUWnRIUVZBSXBKQTJXTU9n?=
 =?utf-8?B?eEtIOEphcXZCSzJweUlrcVQ3c0pEMWFJQk1BVUl2dXdjWm0weVF0aGJLVFNJ?=
 =?utf-8?B?ZW5ZVjZ1WGpPaGFFa3VldFRqWDNjaFY4WDMyQWFhcVZpNWU2MXN0OWE0VTc4?=
 =?utf-8?B?L2lwaHFOdGtUOHZtKyt2aEEyVTIvQXd1ZDJyUjFQQVZ4NThMOHR1OCtLdmQ4?=
 =?utf-8?B?emROUDdLRG9zaFcyd2RWekFvcEQxT2ErRU9xSU5HSVRPU2EyT0xuWU15NnlR?=
 =?utf-8?Q?YBo99Rj0pJ+eUCmM90HXE1DsK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54D7A9AE9D39EA449D3E5A08B67B98A3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f85a51f-bdef-45b7-490f-08dc3c77354c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 18:16:27.2314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oswUHz5OMawl/N4fAQ8JoIGhyUKvPWuWvJeZAEQkpL9riLu9aDHlc9m5N9EXK/fGkHQILuCfF2lsCMY2POwBO9tDppi1gL8bRzxQsfMnBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2444
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAzLzIwMjQgw6AgMDc6NTMsIE5heW5hIEphaW4gYSDDqWNyaXTCoDoNCj4gW1Zv
dXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbmF5bmFAbGludXguaWJt
LmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IHVzbGVlcF9yYW5n
ZSgpIGZ1bmN0aW9uIHRha2VzIGlucHV0IHRpbWUgYW5kIHJhbmdlIGluIHVzZWMuIEhvd2V2ZXIs
DQo+IGN1cnJlbnRseSBpdCBpcyBhc3N1bWVkIGluIG1zZWMgaW4gdGhlIGZ1bmN0aW9uDQo+IHBs
cGtzX2NvbmZpcm1fb2JqZWN0X2ZsdXNoZWQoKS4NCj4gDQo+IEZpeCB0aGUgdG90YWwgcG9sbGlu
ZyB0aW1lIGZvciB0aGUgb2JqZWN0IGZsdXNoaW5nIGZyb20gNW1zZWMgdG8gNXNlYy4NCg0KSSB1
bmRlcnN0YW5kIHdoZW4gNTAwMCBtc2VjIGJlY29tZXMgNTAwMDAwMCB1c2VjLg0KDQpCdXQgd2h5
IGRvZXMgMTAgbXNlYyBiZWNvbWVzIDUwMDAgdXNlYyA/DQoNCldoeSBkb2VzIDQwMCBiZWNvbWVz
IDUwMDAgPw0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFJlcG9ydGVkLWJ5OiBOYWdlc3dhcmEgUiBT
YXN0cnkgPHJuc2FzdHJ5QGxpbnV4LmlibS5jb20+DQo+IEZpeGVzOiAyNDU0YTdhZjBmMmEgKCJw
b3dlcnBjL3BzZXJpZXM6IGRlZmluZSBkcml2ZXIgZm9yIFBsYXRmb3JtIEtleVN0b3JlIikNCj4g
U2lnbmVkLW9mZi1ieTogTmF5bmEgSmFpbiA8bmF5bmFAbGludXguaWJtLmNvbT4NCj4gVGVzdGVk
LWJ5OiBOYWdlc3dhcmEgUiBTYXN0cnkgPHJuc2FzdHJ5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0K
PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wbHBrcy5oIHwgNiArKystLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wbHBrcy5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BscGtzLmgNCj4gaW5kZXggMjNiNzcwMjdjOTE2Li44NzIxZDk3ZjMyYzEgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wbHBrcy5oDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wbHBrcy5oDQo+IEBAIC00NCw5ICs0NCw5IEBADQo+ICAg
I2RlZmluZSBQTFBLU19NQVhfREFUQV9TSVpFICAgICAgICAgICAgNDAwMA0KPiANCj4gICAvLyBU
aW1lb3V0cyBmb3IgUExQS1Mgb3BlcmF0aW9ucw0KPiAtI2RlZmluZSBQTFBLU19NQVhfVElNRU9V
VCAgICAgICAgICAgICAgNTAwMCAvLyBtc2VjDQo+IC0jZGVmaW5lIFBMUEtTX0ZMVVNIX1NMRUVQ
ICAgICAgICAgICAgICAxMCAvLyBtc2VjDQo+IC0jZGVmaW5lIFBMUEtTX0ZMVVNIX1NMRUVQX1JB
TkdFICAgICAgICAgICAgICAgIDQwMA0KPiArI2RlZmluZSBQTFBLU19NQVhfVElNRU9VVCAgICAg
ICAgICAgICAgNTAwMDAwMCAvLyB1c2VjDQo+ICsjZGVmaW5lIFBMUEtTX0ZMVVNIX1NMRUVQICAg
ICAgICAgICAgICA1MDAwIC8vIHVzZWMNCj4gKyNkZWZpbmUgUExQS1NfRkxVU0hfU0xFRVBfUkFO
R0UgICAgICAgICAgICAgICAgNTAwMA0KPiANCj4gICBzdHJ1Y3QgcGxwa3NfdmFyIHsNCj4gICAg
ICAgICAgY2hhciAqY29tcG9uZW50Ow0KPiAtLQ0KPiAyLjMxLjENCj4gDQo=
