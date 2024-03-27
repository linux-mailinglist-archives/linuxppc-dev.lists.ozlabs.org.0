Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0675B88E874
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:21:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mi1raprW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4VkT5N36z3vc6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:21:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mi1raprW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vjk3Bclz3dwr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:20:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8/p9wr87i50Ds76lkZPFWHXxoEh+7pS88ygcOxDnSpSCT0Aqhe8Ei9F93pCEAA6GSbpCIYwCIua6nmEUMQfXOJ1ShfFzXUB4CSWrqGKVGUN4UcX8lwtqc3btFthDKr2mj9bI7JSpZbXfkYJ6dEXXjR3oxACOeDuo6BRSKOV3ENZdF8IZxKTDGOHOSVVbm9KYV4qJERdUntUsHEvvpvrd3qmN+8M7FsQqK1tYHMPIc3WhL/4NSWXwVhdBitQPXF0/Ytngjo5c1VrhFXWxpL1Wpehj53I1rKIJaFcw9kxVonpiexSD+lXsVUbt/aUg0E+flbsLFH0n2A/f+ORF0UKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqnUEP1kluXGjVoqETxn/yfu5jyk9rz3ONQ8dIaKlYY=;
 b=IWX0LczC7LR+IL3cv6LZlVsd72ZfkJG8UfWYrTDgcswbHMFljRlS71JkrPrOnY4j+ZFA0Fblfk8I7YMNjjekVK4uR01iO40jXIDGLbb4qs6WsufSyfMYPDZi9bkRKslnTZ5iBhhhRuiQeppph71d4+SUl9R0UdpIoUeMAoNasPv66UJ+gZtWf6C0FXEqnAmWEfaK37JOSGV7STh5ZAvQIIkIW4UvMpnqtzhHWnZ7MV3z2ZhvmGvl1C1NNVZq8cSbeqDrx0N3gPyn3Eqsn2N3BwVh1hA/89ZuuTSt9fokxAK7XUvt7Xutno+arV8WdIUHxrUK2MraSAKFpitU5O0B+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqnUEP1kluXGjVoqETxn/yfu5jyk9rz3ONQ8dIaKlYY=;
 b=mi1raprWCfd/uGIDbnMTXN9yOFTQtBH6jj6Q6kJtK72QE5L/m/Fo8DGOGvQOhjzFPC5D4ZkGwVEttAuo1Ej3nBwNqrcsj0FTihdvUEUWHiLHwHVByyzSDuBZNuEaVvcVWrXlBRAwBPFFdsf9+2zCCGwa3LZ4qrFsyKB62TB3jLbZGP7D+ArZJ5DUyL18sZvv3s3tt/WbWLgE8OIzRjQgSEzsibXNxeYK2LfBd1GI1J9c9xZs0WfhUA6MSDAZrj6tfQUI9eCOCIiuqFkDtkymBMROqR35u43NWQkxbnfgsjIGyP3kOhMus1wtxN/qur0gdP31MfWsNqHF/249r1P+fg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2630.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 15:20:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 15:20:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>
Subject: Re: [PATCH] Add static_key_feature_checks_initialized flag
Thread-Topic: [PATCH] Add static_key_feature_checks_initialized flag
Thread-Index: AQHagARrrY1q8nYis0eEb5VbnyCUVbFLtH8A
Date: Wed, 27 Mar 2024 15:20:14 +0000
Message-ID: <65caab3e-8618-4045-8bb9-75a2548d7cd7@csgroup.eu>
References: <20240327045911.64543-1-nicholas@linux.ibm.com>
In-Reply-To: <20240327045911.64543-1-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2630:EE_
x-ms-office365-filtering-correlation-id: 7953c229-e99f-42da-8be6-08dc4e7166fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bahnkPkckPelmAzmSqAXpY7EBkLiWLPkljEjlVW4Chbnq2BiWKu5P7tn+ioqTGDcOAAlzXqivKD47UTOCojsXj3OKRfTxl0bMMPO9xlih/Mu9bIWaq6g1gBnarZa6lCmBTvJDk0SVvoIy6Nylpa9HYwzCPBwxM0lwMIytizW4BmOVfd0s3ZXDvl0HReFEnAoP+7w1P2cNPI3YmqLUapxFS58XEmWZ4O8VsD/y3lPN4iz/ApzTFwB2BBlLZCCGT9SYOPh0QE0w6y5dNekGsrKozpodSfTNRs6E11dtUgDYq1t6syxAnSGg0UkeCZ9Kh4YXN+vBHs4agsVVhl/f4LEzrFS2fs50IjhQOSI+QSc9zzDjduIyEUoNmLTVJ011fA/WSkMPJxBNSfWYqjPGsNQf9dFsP263tzL7EFB37BYvfweMg9s9NHUQQMmKu2wLGYDSIIDnE6kmK050z4J+B1Wd3Xx0qHyvaMRCyZG+0/1ozRG4sBr/nvlPpD4VkK1DsRI5IPYaecrLaZRciUwMwsTr6atvevRTnXuEkgmIslldUZM72xhvqyF0KxSl0iuhsLN2vNO1xQRewjAg18Fzyoav2vV0jZm31TX0XDZl0eNWODM5CucVnkNdGXlwfRXB8vuknINtupVnHSyWHFfEwC++KNF/P0NZTki0gvfD2OHKBY2HQwYZyOKRTayqo6mkhRTGq6Pi81cKoa77rlMdvizPAht2MT0dDEYFSCu0FpkO6c=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MTE4Mjk3cGxTS2VDemk2azdPdFBKcTVFcFR2QTRkWTViVXBiRFE0UHZSUkI0?=
 =?utf-8?B?WW0xTngzV2hUUGlzQUQzcTR2Zm8xTHNZTTlHaCtjdHhzTjIrSnVCeUNIZGFK?=
 =?utf-8?B?a2JBZys2LzFLVmhneUhCUVZDeUdFU0RCOWtadnZKZTk0TGY4dkdxemp2OW9S?=
 =?utf-8?B?NjZyaERaZ1ZBQlE4OHJXZzdoSGFsZmxrc0ZUS2ZwTzhTL1l1a2VKVm0zcW9V?=
 =?utf-8?B?aGN1NklVU1ZoR3FETGY3eFRnaWxtMWZzN05hNy9IV0x4M3VzV2M1QkpKQkpY?=
 =?utf-8?B?TzE1Z0hUWlhoN2k3VWdzTlZrZG9kcjlQQjlOU2d1VENodzVralFCYzJqNkpF?=
 =?utf-8?B?c1c5R0VmZk13Q3hvQUN6d21oRit2L21WelduU3N5aTVzMWNBdHc0Vk5YUHpN?=
 =?utf-8?B?Tmc2akZVanJDYXMwRlJVdW83eUMvVTBsb0N4dFVZRzArUGo5MnVlNmZNUE1K?=
 =?utf-8?B?eU9PMVZ0LzJaYXU4M3dldzl6RFBMVFRxUXVNTkM3NmRITlVndjJDVjN5SXVy?=
 =?utf-8?B?dHFMdjZkZnEwUW5NVUtrMnlMOGQ2c2xnTHJMUXVBajBUTGdETDlPS2hwZEpF?=
 =?utf-8?B?WkhTajVZYWllZm9PM1FMU252MGZIVTM3WDlkTmo3Tk53U0s2aHdoRWxKb0d1?=
 =?utf-8?B?cU84S2dqcmFVazRHdDZUdjdrZFhXb0w5enViL3hxbUtuVEpnYk56eWplek4y?=
 =?utf-8?B?YXgrcS9rTmM3MUtFaGRnYWI2bDhUY1BRaXlHL3FhOXRORXlaUEtGcEMzRVF0?=
 =?utf-8?B?Ukx5SVRNem96T3N6OFJ2TzdOQVpCcWZobHlKK3Bkd2JoM3V0QnI4U2VjUVIz?=
 =?utf-8?B?ZCtHTm1tdVVmeVlrcDBoL0Mzb3NSN2RyRnFuUzhhbWNIM1lRQ3VyUUIvQnFz?=
 =?utf-8?B?Sy9aKzRJT0gxMnlKaFJIT3Zqc3R6cHlGYldyR3JaQ2kvaDlTZjk4ZWE0eFVL?=
 =?utf-8?B?N0R1cG56ODhFQnI4bVNVOFNGczZLUVBzd0hZNHpUU1UrcGQvMlpYL3NsUm1w?=
 =?utf-8?B?MGwzZ2x0ZHBRaDY1d3pPQm9sNE52QnVCb0plWDlEVHQ5UmpYZ09oNy9GcDdn?=
 =?utf-8?B?SzE1TUZVS2djN1JxMGlYSXREQmZyYzBtZlYvUmxOVnIybkFQUUd3eVZqK0h3?=
 =?utf-8?B?U3U0UlNGdjd2ZG8ralAyZG9JSmkydXR3R2VLOUI1TXM1RTEyNlNycTdTbkRF?=
 =?utf-8?B?ajhnTDc3OUVmWldYT1FyY0NKUjk1VFZBN3NNeGFhenhraVJZQnhNY0ErOXhF?=
 =?utf-8?B?YW1wQ2tVcHBqWFJqZDU1eDlZd1E1c0preWZCZjdFdFVlTytVSEpweHhBdURG?=
 =?utf-8?B?ZDNDK1hSTFM1TEp1UElFQi9kdkUwWXFUUEhpbGlHOCtBcDcrcU5jM1hLeWhT?=
 =?utf-8?B?S0xsalZqekNEaGpMbUlpS3FvRU1qZFNoY3h0Y1B1dnFzNXg1U3ZOTytTTXlO?=
 =?utf-8?B?a2hIQmEwYVVhelpZQnozMHhBQnZQeUF3NGVYK1BoMVV0MVhMamxjQXNyZis5?=
 =?utf-8?B?cHRmbzVrbXpSdEtOQ2s1WWhQZHdvemtmSEFEZVp5cnNnZUVtajBuNnB2L0R0?=
 =?utf-8?B?Z1U4QVZnRTlyMVBFNWcvcU5HMkVMMWNsKzJQbG1MTkFveHJGV1pVNTNlazgr?=
 =?utf-8?B?VC8yRDk4RzBIVzZhejBCc3VRaUdRdGFSOE1wOStnU0NzTHRvR0o3WEFRYTB0?=
 =?utf-8?B?RGRCSWtySndlOXVzUHdGZzNBQ1M2a1hXN1JSWWYxcWs4a09uMHRXOW1ZRWpU?=
 =?utf-8?B?VzVURGV3Nk1RbEdjVGYxL0FNRUJnbjVZK2EyOThWaFVwbDJWS3NNODBjSm52?=
 =?utf-8?B?L3NtT3kyQ1l2MkZWeXhxcjArdTBuSXpPK3FXdDIydG01cWZBK0ovNkFzQjl4?=
 =?utf-8?B?Y05ucE9QNWtWOVErZVpoUlUwY0JSS1F3Z3ZjeDFIYmkzb3VKY0FuSlhQZEN4?=
 =?utf-8?B?ZnFVTERWL0x3KzFNdmI3NzNIanprWCtxVlBrQVZacHdDY0tjS2NJSEdFVGRj?=
 =?utf-8?B?YkcrSGRIYzlrSEFCVmR2WEc4NkozVHMweld5VnZ5cVlWNGREV2dtcUh4Q3cz?=
 =?utf-8?B?OUNCdVhLUk8zaFRzNDNBNy9CNkRuTzQ0WEMybWJsKzVPU1BZUVRLS2tFRW4y?=
 =?utf-8?Q?axuNwzD/2sNacaEH7Oi+ZKtCm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26293140169A4842A4A3DB366F45D531@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7953c229-e99f-42da-8be6-08dc4e7166fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 15:20:14.5395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuSJzASvppHSw+lSgHjqU1WQhxi13j6w6kWJBGJbNc4frD356EitsT4tGMmdcVfgiL9M6ZYYVffM/37v1HPTtOv1Yi3o+/1MrB9O1OPr4Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2630
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAzLzIwMjQgw6AgMDU6NTksIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gSlVNUF9MQUJFTF9GRUFUVVJFX0NIRUNLX0RFQlVHIHVzZWQgc3RhdGljX2tleV9pbml0
aWFsaXplZCB0byBkZXRlcm1pbmUNCj4gd2hldGhlciB7Y3B1LG1tdX1faGFzX2ZlYXR1cmUoKSB3
YXMgdXNlZCBiZWZvcmUgc3RhdGljIGtleXMgd2VyZQ0KPiBpbml0aWFsaXplZC4gSG93ZXZlciwg
e2NwdSxtbXV9X2hhc19mZWF0dXJlKCkgc2hvdWxkIG5vdCBiZSB1c2VkIGJlZm9yZQ0KPiBzZXR1
cF9mZWF0dXJlX2tleXMoKSBpcyBjYWxsZWQuIEFzIHN0YXRpY19rZXlfaW5pdGFsaXplZCBpcyBz
ZXQgbXVjaA0KPiBlYXJsaWVyIGR1cmluZyBib290IHRoZXJlIGlzIGEgd2luZG93IGluIHdoaWNo
IEpVTVBfTEFCRUxfRkVBVFVSRV9DSEVDS19ERUJVRw0KPiB3aWxsIG5vdCByZXBvcnQgZXJyb3Jz
LiBBZGQgYSBmbGFnIHNwZWNpZmljYWxseSB0byBpbmRpY2F0ZSB3aGVuDQo+IHtjcHUsbW11fV9o
YXNfZmVhdHVyZSgpIGlzIHNhZmUgdG8gdXNlLg0KDQpXaGF0IGRvIHlvdSBtZWFuIGJ5ICJtdWNo
IGVhcmxpZXIiID8NCg0KQXMgZmFyIGFzIEkgY2FuIHNlZSwgc3RhdGljX2tleV9pbml0aWFsaXpl
ZCBpcyBzZXQgYnkganVtcF9sYWJlbF9pbml0KCkgDQphcyBjcHVfZmVhdHVyZV9rZXlzX2luaXQo
KSBhbmQgbW11X2ZlYXR1cmVfa2V5c19pbml0KCkgYXJlIGNhbGwgDQppbW1lZGlhdGVseSBhZnRl
ci4gSSBkb24ndCB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBkbyBhbnl0aGluZyBpbmJldHdlZW4u
DQoNCk9yIG1heWJlIHlvdSBtZWFuIHRoZSBwcm9ibGVtIGlzIHRoZSBjYWxsIHRvIGp1bXBfbGFi
ZWxfaW5pdCgpIGluIA0KZWFybHlfaW5pdF9kZXZ0cmVlKCkgPyBZb3Ugc2hvdWxkIG1ha2UgaXQg
ZXhwbGljaXQgaW4gdGhlIG1lc3NhZ2UsIGFuZCANCnNlZSBpZiBpdCB3b3VsZG4ndCBiZSBiZXR0
ZXIgdG8gY2FsbCBjcHVfZmVhdHVyZV9rZXlzX2luaXQoKSBhbmQgDQptbXVfZmVhdHVyZV9rZXlz
X2luaXQoKSBhcyB3ZWxsIGluIGVhcmx5X2luaXRfZGV2dHJlZSgpIGluIHRoYXQgY2FzZSA/DQoN
CkNocmlzdG9waGUNCg==
