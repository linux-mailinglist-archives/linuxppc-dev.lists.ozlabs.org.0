Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22EA89520A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 13:39:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VSrWZLOV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V85XC5RXMz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Apr 2024 22:39:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VSrWZLOV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V85WW1WThz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Apr 2024 22:39:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua1CApTFOLIpYL5rClqO8KjA458zG/sFsA+edQCdpIrvP6KX+yqc3R/Y688qkNIhwksLKOLcovhvyC3JpzTgklvwV0MVzXTUIqZo8ZSrGJJibSXTn0JtqvYPL3xEONzFT2+EUTMlfPhZ9LuhZK4fpJMtlSyjcsjSJfQkSyg+v0DPJCeMpgW2qTe+h8WR631c9cfXG2jjrMfJj1ph2zcHLS2Yjl/6+xgr1M746cClCRQNdaYj+TsUkIGUQycNbr4qG+4e7876HQDk38CMW00WC/IsqFZGGiXr7RQYoIEjy9yY8hy8DqXS2B4Un3+6/OgZKNJCNYkTeiS6tnhQU+CROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkhX3YUH220x4ieoIsN8ysN9m7IzlVyrpk3wHBnwcms=;
 b=cwP+OQ6WxdiMUfan3N717SKI7O9TMY3wEg/BNP+AnCjnG6bvYlWfKRSakX8dHe5wcjj52apEpjq7nBUQzLXZou7u7dMv2b1/vAlC8L6DCPtfa5Ix9H6h1DIHITDOmj0sZqYlBTtyqe3nhtm/oEfnx9s+/HpgHaTEysb8tpFbSQ4vCUWw1mqw/W/KefQk9XqzjN2hvfo+B4hiJEHTcHToj2mYrlUxD5Oogfz00ZZNd+/pL7jse2VzrZUfuaGp5XbuNLAHHHRi90XwDLBGBsBUoLR06VCGoofl9OIzPh93nTz/VM1XwCbGdUjXVLv5ryUvvdgzVWzvhxY0jcrJGl4gIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkhX3YUH220x4ieoIsN8ysN9m7IzlVyrpk3wHBnwcms=;
 b=VSrWZLOVzWThGUT3lGc5uyMOHDhTzaluoFJIvmGwX1r7i6so3TltRYwdcx2EL/EKMpWJ/PoNQxhmzhsKSISNNkukZGTqzNvgz8GoZHGM1uSaXgtM6xGzhrTNu0lhn0XO2uVSOPeSAfyg7yed50v36z0f45eBcQ5PbYnvTVeICFctQqsEM2NuGpkdFYJd8sjX2fSjl125g2XC0PpxLaM6+tdWMyOGywPlN6fkKv3tJSHjjMsGk4B1bpZvHs/hnWss0Z9iiQZZ9TmZpXPJv7D464vfheK4X5yRSHnF0MMHk7fBxMrhxQnj6VpqfbQDGNjg3ILa63tlHAqUREGbGvKfxA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2417.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 11:38:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 11:38:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] powerpc/bpf: enable kfunc call
Thread-Topic: [PATCH v3 2/2] powerpc/bpf: enable kfunc call
Thread-Index: AQHahOzPSmXgb1dmZUGdXT3+CtmTaLFU2tcA
Date: Tue, 2 Apr 2024 11:38:57 +0000
Message-ID: <9a513a9e-df5c-43ec-93c1-c85660399877@csgroup.eu>
References: <20240402105806.352037-1-hbathini@linux.ibm.com>
 <20240402105806.352037-2-hbathini@linux.ibm.com>
In-Reply-To: <20240402105806.352037-2-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2417:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qslpML1TQRY3px8SRD4Ecf/wkyv1nvIpHhUeKJh7GB88gMTSi7WX/AGN5vudGCpi/E3i7r4fN02kIv9XpDWmLPFLgrdrsOmIHfElrixvFW+9JvwFxXB9RXWAoRZlmVPh2OBa6AgvusxqBfP6eZvJMQZmfaaHMvPex6bLQsv5+U414BuruXbQD9Dx2WGNtAYfsx3JLny8TXyvRo8dA73HPzftZtpR783txiBZwifkKUvkv5rbJocc/txh+5ircWdVb9Q+uTPoB1A/xZaPOzojsThcgV3/K0FAaSJlLsBR4hHRLhNOw64NAnMUJdTfU1vgVfdPdpxOgWgLB7X1KKEvNU6Z0Y2c3BJoV0WOpEepthVtNeP4nIrx1SZvEdCtR0MNBbF4+vcttjuG0RxQkjuVL48bTcGTwY/lZFagpzrsQibgqiD8yCTmJLr4tMHEy7se8JP1kvWlQcmKf0DvBF+Oodq+nf/qK1qdKhp1neKE/QXm+9YVaAdZD9Q4X1kcP7ROME6oEtx2RssZJTn297589zemycuEV+UwtNNX7XWUMBNBVcXguPtvfFDOltisXjxTQV8LKPWJdiS1a0ZNnZRHQGHj0aFoxubgy5Fu3ZuCPfYeBxnkUU8F2QNhahV8lyIZodrdxSEKUA/YAbjXwHO8E6SKuD5CA2YdpWUbqP4VWm8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Nm9uUTl6WVlScEQ4RkhNdzZaYWFtT3o5RWUrS0JibmNEaWt6aktHUGVqdkJU?=
 =?utf-8?B?YXdrRCs5dHZYWVhuQjFPSWVWRUEwbUdTMnErU2kvdno2ZjNPbUZTNEJQM0c1?=
 =?utf-8?B?UmczcHFiWWhrMWpuc0dRbDVET1JqS3BuVmVJSE5PN0JtU21IQlhNdWRUY1BI?=
 =?utf-8?B?MVhVQjM3RTRvOEJMcHlsUVN4Z2xkR05nbUVGeXpCQXZac2lxRjlXeURwL1JF?=
 =?utf-8?B?L3pCTlIwNCtaM3pJbW1PaE5OaVlCY0RwcmxvZGs2MUJHOW1xcEFCNVBtcXJM?=
 =?utf-8?B?VGhOMTA2Y0JCQ24rLzcwamlRWTB1NmNHeGNHS1FkS3J6eXFrbWpHWGFKYWlv?=
 =?utf-8?B?SHFFeFdYZ0FwQ1lUdEdKOE9sc05MdG9VSUxMd3dBWUdURk9abldjQ1dKL2pN?=
 =?utf-8?B?QU90RmNSaHVFWDc1ZW5UdW82SHpjTDZnUFVWczVXRzJlaFd2Q0JCc3FJaFZy?=
 =?utf-8?B?UmlncGdyR2V4QWtTeXFoWkcyLzdsdkNaRU5HT1hrem1pNlBtVC9UdmhNb0JT?=
 =?utf-8?B?bk5JemJaOE54M0J5aXFnUDVsL3dXMUhRbENnRVhOME0rdWNFS1ErcHIzZGpo?=
 =?utf-8?B?TlRhWktoZHBiRWRnYnl6Yy9sU1BJTHVCbzRjUGV1eXFIdjlqV3gzWFJDK2Rj?=
 =?utf-8?B?bEw5YmZUVTlqcnlYV216bTNWSnJQakM4UjdRY3FwMWFKdCt0MEw5RmRyL05O?=
 =?utf-8?B?Y2huZW0wcjI4cEtUTHI5bzRRTTkrTUdURTlJSGJ3bVQxeU9JWVpUZm53SUFQ?=
 =?utf-8?B?anEvUmhEdnZ5L292TldqdXFMYzlrcHJKRWYrUlVIR3lienYyT0hlTUN2cW5r?=
 =?utf-8?B?V293Q1NqQ0pxbmZGNU41WGlSRXZjd1JncmROSEhkRW9yNGJ0VThZM1R1cW5W?=
 =?utf-8?B?eC85Qnd1RmRLVUtwcDgveTBEeVlPZEo4cEJJaFpORFVENkdkbkQxbCtlWUho?=
 =?utf-8?B?YWlNbVh5VC9MOG1JZ3pLRlFqMzlDRXpHS2xmOHNUVEVlQko1bTE5ZVptNUNh?=
 =?utf-8?B?MGFmc2N5Q1NhUFAxWk1hQ3luNDVDK2tmQzUzakIxeHNLSzIrOUtHSFRtdFBk?=
 =?utf-8?B?NnU2SjRzYXRackoyUVdFTU9zVEh1WGNyWFJ0Y0IvVjNxQTA1eWwxTktsNGxa?=
 =?utf-8?B?NWkyaG5vY3g0Tk1SQXhZc3lxRW5yNkVHa0QvQjZyTVdiSHY3WEkwNmZBVFBX?=
 =?utf-8?B?SUFZRDVUczhPdTJkd0g3bGlVb1ZwT1ZKM3UyMnNvT045MW1RMDhmUFJKb1BW?=
 =?utf-8?B?YnhGK2E4ZHg0MGtrL1N0Mnl6Z0U4UHFiNUd1Yk9yT09lYVNreFpVNUlJenVs?=
 =?utf-8?B?MWc2dTA0NVFDcnF5OGhHS0hDZGVBOEFiTkZzREt5Wm42V21rLzVZNXh5cFk4?=
 =?utf-8?B?M0tpM1BZdjlrTkUvV2ZJMUFqUVNrNUszS09lTDhnUU52dTV3OFR1T3ovL0pF?=
 =?utf-8?B?d2EvallwMWRyQXZkK1JMS1czdHhhL0ZiT1NOUEs4dnA0cVFZcnA4bFJtOGRG?=
 =?utf-8?B?YkJQcEMyTUF3OC9FMnd0OHN5aXlKV1d5Wmp0Y3RmTDRibG00ck5ZTFNUVytE?=
 =?utf-8?B?QUxuenNxWUF4ejkyRjV3VUU3d1NSTU8rQzZGSVQrTmRSRkE3Qk9VWGc2azdh?=
 =?utf-8?B?NFZ6N2p6a0ZsdXpvS0VUK2dXK09DRWZRYklYZTRSQ3VSWGRtVjB6bUN3Z3R5?=
 =?utf-8?B?QTMwd3BrQ3lPeHYydjc3alFmVmM5S0k1aDlFTWVZWmVvTDJ4S2hVaHFTMXB5?=
 =?utf-8?B?UHBwcy9DL0tycTdoOGFjQlhIUVlXOGM1WDlNYkRzd2tKUTc2cjFCc1FEWkZn?=
 =?utf-8?B?bkMzeG1FYW9RbW9TbHNYcHFkTzlIRXdTOVFHN3h5THRDK3lzVVkwck9LSi93?=
 =?utf-8?B?WGFRUXJHMjFXKzErTXZldGwzSGlVYVNBM1oxTHl1UzNWdTFuaHdlSC94cDdY?=
 =?utf-8?B?bE56MkRpbEw5REhhOG00UzJqMyt6L0FBOGZ0RUZrZnltWnBmMGtGSHpXUUsx?=
 =?utf-8?B?b1pQR0dpeXhOVmNzVjloMGRnditZdWdqdFRWM3NaRkl5RjMvNWhYbVIwTmZk?=
 =?utf-8?B?V1M3bXhnaTFldndpS1RoKzVuM2QxaDI5cHMvRC96dVpGTGtpb2VJTXRwNEl4?=
 =?utf-8?B?MlpFRSsraTJNNWgrNnA0WUd4R1g0akI2Z0NkMVphUXhBR284bEJnNWFqanov?=
 =?utf-8?Q?4nDGLcio/xs9Vc9QrAbXZNB10QJsjHbtJKQXHCKAhqDU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3007014B16F0B14896B16AB52C518A50@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a79db1de-651f-4ca1-edf6-08dc53097b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 11:38:57.2593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EhmnOQS7FiS+QfSX89o6np/SYp/KPhkyJg1JNTww0DalWCPesmTSXA3+f0G/Y+F/derefj0cFTJ9JNmME/QhUBKkpbnJ5O2WctGz8c6zc9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2417
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA0LzIwMjQgw6AgMTI6NTgsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBD
dXJyZW50bHksIGJwZiBqaXQgY29kZSBvbiBwb3dlcnBjIGFzc3VtZXMgYWxsIHRoZSBicGYgZnVu
Y3Rpb25zIGFuZA0KPiBoZWxwZXJzIHRvIGJlIGtlcm5lbCB0ZXh0LiBUaGlzIGlzIGZhbHNlIGZv
ciBrZnVuYyBjYXNlLCBhcyBmdW5jdGlvbg0KPiBhZGRyZXNzZXMgY2FuIGJlIG1vZHVsZSBhZGRy
ZXNzZXMgYXMgd2VsbC4gU28sIGVuc3VyZSBtb2R1bGUgYWRkcmVzc2VzDQo+IGFyZSBzdXBwb3J0
ZWQgdG8gZW5hYmxlIGtmdW5jIHN1cHBvcnQuDQo+IA0KPiBFbWl0IGluc3RydWN0aW9ucyBiYXNl
ZCBvbiB3aGV0aGVyIHRoZSBmdW5jdGlvbiBhZGRyZXNzIGlzIGtlcm5lbCB0ZXh0DQo+IGFkZHJl
c3Mgb3IgbW9kdWxlIGFkZHJlc3MgdG8gcmV0YWluIG9wdGltaXplZCBpbnN0cnVjdGlvbiBzZXF1
ZW5jZSBmb3INCj4ga2VybmVsIHRleHQgYWRkcmVzcyBjYXNlLg0KPiANCj4gQWxzbywgYXMgYnBm
IHByb2dyYW1zIGFyZSBhbHdheXMgbW9kdWxlIGFkZHJlc3NlcyBhbmQgYSBicGYgaGVscGVyIGNh
bg0KPiBiZSB3aXRoaW4ga2VybmVsIGFkZHJlc3MgYXMgd2VsbCwgdXNpbmcgcmVsYXRpdmUgYWRk
cmVzc2luZyBvZnRlbiBmYWlscw0KPiB3aXRoICJvdXQgb2YgcmFuZ2Ugb2YgcGNyZWwgYWRkcmVz
cyIgZXJyb3IuIFVzZSB1bm9wdGltaXplZCBpbnN0cnVjdGlvbg0KPiBzZXF1ZW5jZSBmb3IgYm90
aCBrZXJuZWwgYW5kIG1vZHVsZSBhZGRyZXNzZXMgdG8gd29yayBhcm91bmQgdGhpcywgd2hlbg0K
PiBQQ1JFTCBhZGRyZXNzaW5nIGlzIHVzZWQuDQo+IA0KPiBXaXRoIG1vZHVsZSBhZGRyZXNzZXMg
c3VwcG9ydGVkLCBvdmVycmlkZSBicGZfaml0X3N1cHBvcnRzX2tmdW5jX2NhbGwoKQ0KPiB0byBl
bmFibGUga2Z1bmMgc3VwcG9ydC4gU2luY2UgbW9kdWxlIGFkZHJlc3Mgb2Zmc2V0cyBjYW4gYmUg
bW9yZSB0aGFuDQo+IDMyLWJpdCBsb25nIG9uIFBQQzY0LCBvdmVycmlkZSBicGZfaml0X3N1cHBv
cnRzX2Zhcl9rZnVuY19jYWxsKCkgdG8NCj4gZW5hYmxlIDY0LWJpdCBwb2ludGVycy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEhhcmkgQmF0aGluaSA8aGJhdGhpbmlAbGludXguaWJtLmNvbT4NCj4g
LS0tDQo+IA0KPiAqIENoYW5nZXMgaW4gdjM6DQo+ICAgIC0gUmV0YWluZWQgb3B0aW1pemVkIGlu
c3RydWN0aW9uIHNlcXVlbmNlIHdoZW4gZnVuY3Rpb24gYWRkcmVzcyBpcw0KPiAgICAgIGEgY29y
ZSBrZXJuZWwgYWRkcmVzcyBhcyBzdWdnZXN0ZWQgYnkgTmF2ZWVuLg0KPiAgICAtIFVzZWQgdW5v
cHRpbWl6ZWQgaW5zdHJ1Y3Rpb24gc2VxdWVuY2UgZm9yIFBDUkVMIGFkZHJlc3NpbmcgdG8NCj4g
ICAgICBhdm9pZCBvdXQgb2YgcmFuZ2UgZXJyb3JzIGZvciBjb3JlIGtlcm5lbCBmdW5jdGlvbiBh
ZGRyZXNzZXMuDQo+ICAgIC0gRm9sZGVkIHBhdGNoIHRoYXQgYWRkcyBzdXBwb3J0IGZvciBrZnVu
YyBjYWxscyB3aXRoIHBhdGNoIHRoYXQNCj4gICAgICBlbmFibGVzL2FkdmVydGlzZXMgdGhpcyBz
dXBwb3J0IGFzIHN1Z2dlc3RlZCBieSBOYXZlZW4uDQo+IA0KPiANCj4gICBhcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXRfY29tcC5jICAgfCAxMCArKysrKysrDQo+ICAgYXJjaC9wb3dlcnBjL25ldC9i
cGZfaml0X2NvbXA2NC5jIHwgNDggKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYyBiL2FyY2gvcG93
ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMNCj4gaW5kZXggMGY5YTIxNzgzMzI5Li5kYzdmZmFmZDc0
NDEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiBAQCAtMzU5LDMgKzM1OSwxMyBA
QCB2b2lkIGJwZl9qaXRfZnJlZShzdHJ1Y3QgYnBmX3Byb2cgKmZwKQ0KPiAgIA0KPiAgIAlicGZf
cHJvZ191bmxvY2tfZnJlZShmcCk7DQo+ICAgfQ0KPiArDQo+ICtib29sIGJwZl9qaXRfc3VwcG9y
dHNfa2Z1bmNfY2FsbCh2b2lkKQ0KPiArew0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0KPiArDQo+
ICtib29sIGJwZl9qaXRfc3VwcG9ydHNfZmFyX2tmdW5jX2NhbGwodm9pZCkNCj4gK3sNCj4gKwly
ZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpID8gdHJ1ZSA6IGZhbHNlOw0KDQpZb3UgZG9u
J3QgbmVlZCB0aGUgdHJ1ZS9mYWxzZSwgdGhlIGZvbGxvd2luZyBpcyBlbm91Z2g6DQoNCglyZXR1
cm4gSVNfRU5BQkxFRChDT05GSUdfUFBDNjQpOw0KDQo+ICt9DQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRf
Y29tcDY0LmMNCj4gaW5kZXggN2Y2MmFjNGI0ZTY1Li5lYzNhZGY3MTVjNTUgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wNjQuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvbmV0L2JwZl9qaXRfY29tcDY0LmMNCj4gQEAgLTIwNywyNCArMjA3LDE0IEBAIHN0YXRpYyBp
bnQgYnBmX2ppdF9lbWl0X2Z1bmNfY2FsbF9obHAodTMyICppbWFnZSwgc3RydWN0IGNvZGVnZW5f
Y29udGV4dCAqY3R4LCB1DQo+ICAgCXVuc2lnbmVkIGxvbmcgZnVuY19hZGRyID0gZnVuYyA/IHBw
Y19mdW5jdGlvbl9lbnRyeSgodm9pZCAqKWZ1bmMpIDogMDsNCj4gICAJbG9uZyByZWxhZGRyOw0K
PiAgIA0KPiAtCWlmIChXQVJOX09OX09OQ0UoIWNvcmVfa2VybmVsX3RleHQoZnVuY19hZGRyKSkp
DQo+ICsJLyoNCj4gKwkgKiBXaXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2Yga2Z1bmMgZmVhdHVyZSwg
QlBGIGhlbHBlcnMgY2FuIGJlIHBhcnQgb2Yga2VybmVsIGFzDQo+ICsJICogd2VsbCBhcyBtb2R1
bGUgdGV4dCBhZGRyZXNzLg0KPiArCSAqLw0KPiArCWlmIChXQVJOX09OX09OQ0UoIWtlcm5lbF90
ZXh0X2FkZHJlc3MoZnVuY19hZGRyKSkpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4g
LQlpZiAoSVNfRU5BQkxFRChDT05GSUdfUFBDX0tFUk5FTF9QQ1JFTCkpIHsNCj4gLQkJcmVsYWRk
ciA9IGZ1bmNfYWRkciAtIENUWF9OSUEoY3R4KTsNCj4gLQ0KPiAtCQlpZiAocmVsYWRkciA+PSAo
bG9uZylTWl84RyB8fCByZWxhZGRyIDwgLShsb25nKVNaXzhHKSB7DQo+IC0JCQlwcl9lcnIoImVC
UEY6IGFkZHJlc3Mgb2YgJXBzIG91dCBvZiByYW5nZSBvZiBwY3JlbCBhZGRyZXNzLlxuIiwNCj4g
LQkJCQkodm9pZCAqKWZ1bmMpOw0KPiAtCQkJcmV0dXJuIC1FUkFOR0U7DQo+IC0JCX0NCj4gLQkJ
LyogcGxhIHIxMixhZGRyICovDQo+IC0JCUVNSVQoUFBDX1BSRUZJWF9NTFMgfCBfX1BQQ19QUkZY
X1IoMSkgfCBJTU1fSDE4KHJlbGFkZHIpKTsNCj4gLQkJRU1JVChQUENfSU5TVF9QQURESSB8IF9f
X1BQQ19SVChfUjEyKSB8IElNTV9MKHJlbGFkZHIpKTsNCj4gLQkJRU1JVChQUENfUkFXX01UQ1RS
KF9SMTIpKTsNCj4gLQkJRU1JVChQUENfUkFXX0JDVFIoKSk7DQo+IC0NCj4gLQl9IGVsc2Ugew0K
PiArCWlmIChjb3JlX2tlcm5lbF90ZXh0KGZ1bmNfYWRkcikgJiYgIUlTX0VOQUJMRUQoQ09ORklH
X1BQQ19LRVJORUxfUENSRUwpKSB7DQo+ICAgCQlyZWxhZGRyID0gZnVuY19hZGRyIC0ga2VybmVs
X3RvY19hZGRyKCk7DQo+ICAgCQlpZiAocmVsYWRkciA+IDB4N0ZGRkZGRkYgfHwgcmVsYWRkciA8
IC0oMHg4MDAwMDAwMEwpKSB7DQo+ICAgCQkJcHJfZXJyKCJlQlBGOiBhZGRyZXNzIG9mICVwcyBv
dXQgb2YgcmFuZ2Ugb2Yga2VybmVsX3RvYy5cbiIsICh2b2lkICopZnVuYyk7DQo+IEBAIC0yMzUs
NiArMjI1LDMyIEBAIHN0YXRpYyBpbnQgYnBmX2ppdF9lbWl0X2Z1bmNfY2FsbF9obHAodTMyICpp
bWFnZSwgc3RydWN0IGNvZGVnZW5fY29udGV4dCAqY3R4LCB1DQo+ICAgCQlFTUlUKFBQQ19SQVdf
QURESShfUjEyLCBfUjEyLCBQUENfTE8ocmVsYWRkcikpKTsNCj4gICAJCUVNSVQoUFBDX1JBV19N
VENUUihfUjEyKSk7DQo+ICAgCQlFTUlUKFBQQ19SQVdfQkNUUkwoKSk7DQo+ICsJfSBlbHNlIHsN
Cj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzY0X0VMRl9BQklfVjEpKSB7DQo+ICsJCQkv
KiBmdW5jIHBvaW50cyB0byB0aGUgZnVuY3Rpb24gZGVzY3JpcHRvciAqLw0KPiArCQkJUFBDX0xJ
NjQoYnBmX3RvX3BwYyhUTVBfUkVHXzIpLCBmdW5jKTsNCj4gKwkJCS8qIExvYWQgYWN0dWFsIGVu
dHJ5IHBvaW50IGZyb20gZnVuY3Rpb24gZGVzY3JpcHRvciAqLw0KPiArCQkJRU1JVChQUENfUkFX
X0xEKGJwZl90b19wcGMoVE1QX1JFR18xKSwgYnBmX3RvX3BwYyhUTVBfUkVHXzIpLCAwKSk7DQo+
ICsJCQkvKiAuLi4gYW5kIG1vdmUgaXQgdG8gQ1RSICovDQo+ICsJCQlFTUlUKFBQQ19SQVdfTVRD
VFIoYnBmX3RvX3BwYyhUTVBfUkVHXzEpKSk7DQo+ICsJCQkvKg0KPiArCQkJICogTG9hZCBUT0Mg
ZnJvbSBmdW5jdGlvbiBkZXNjcmlwdG9yIGF0IG9mZnNldCA4Lg0KPiArCQkJICogV2UgY2FuIGNs
b2JiZXIgcjIgc2luY2Ugd2UgZ2V0IGNhbGxlZCB0aHJvdWdoIGENCj4gKwkJCSAqIGZ1bmN0aW9u
IHBvaW50ZXIgKHNvIGNhbGxlciB3aWxsIHNhdmUvcmVzdG9yZSByMikNCj4gKwkJCSAqIGFuZCBz
aW5jZSB3ZSBkb24ndCB1c2UgYSBUT0Mgb3Vyc2VsZi4NCj4gKwkJCSAqLw0KPiArCQkJRU1JVChQ
UENfUkFXX0xEKDIsIGJwZl90b19wcGMoVE1QX1JFR18yKSwgOCkpOw0KPiArCQkJRU1JVChQUENf
UkFXX0JDVFJMKCkpOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJLyogV2UgY2FuIGNsb2JiZXIgcjEy
ICovDQo+ICsJCQlQUENfTEk2NCgxMiwgZnVuYyk7DQo+ICsJCQlFTUlUKFBQQ19SQVdfTVRDVFIo
MTIpKTsNCj4gKwkJCUVNSVQoUFBDX1JBV19CQ1RSTCgpKTsNCj4gKyNpZm5kZWYgQ09ORklHX1BQ
Q19LRVJORUxfUENSRUwNCg0KV2h5IG5vdCB1c2UgSVNfRU5BQkxFRChDT05GSUdfUFBDX0tFUk5F
TF9QQ1JFTCkgPw0KDQo+ICsJCQkvKiBSZXN0b3JlIGtlcm5lbCBUT0MgKi8NCj4gKwkJCUVNSVQo
UFBDX1JBV19MRCgyLCAxMywgb2Zmc2V0b2Yoc3RydWN0IHBhY2Ffc3RydWN0LCBrZXJuZWxfdG9j
KSkpOw0KPiArI2VuZGlmDQo+ICsJCX0NCj4gICAJfQ0KPiAgIA0KPiAgIAlyZXR1cm4gMDsNCg==
