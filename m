Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33885B3AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 08:11:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kRK9cyTJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tf9ZN58Zwz3cZH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 18:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kRK9cyTJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tf9Yf6xVLz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 18:11:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORD4RaEw6HewD3OnGH2SEllcCrdhS2/Vyl2ZvB2aJFrXQC+KxaTERIf4s/bqbq+MR3fi+xTBFkVMN/pbsCHSKTDpePQ9NZvW1fOp3KV6c6I5sispgFzrV+OTe1K6F1EoGnYyYFyBhib/ektXxqvOUBuNhFsc9AoPsMdOZ4s5Okjccs6pMfUF368EQEkt//sXL70lri3Sanj68Du9YsS+5D1WZSx2ssThNbUzNDIjvSQD08eHBjcCXDA2kc6kFVcUrq8Ku3WPGSy9sgVSplV5bInRlwNyet9e0rppDkXT154MiUBIgV653bopvIEcxoeRkf/IqfAQ7Slbi8O8M/PaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgSizQQlai3mdowrj8OonW3AFl1Kf+CSNtC+mvWaQM0=;
 b=mwAwCsAAqIaxcg4GJQQ2M0tyIemc/VEyNtKu3/A/sJG/RnXfp8dtfH2akpTElPPsfC22Euf82Dn1Z3bFNjdTdkUz8teOGIwU5mIdRSTbv7rrsLXV3wmj42PrXjIXQcuYgvGMcsvLQA2upla9vNgSIC+QuGsSd713JRUDCN+XUrIh+ARVVl5fVghBitWKfjQ/pRjcYWY6bdyDQ63n9l1mPVL6QiQ/8uTjdI749YRQASRWUjPt5hFU3Dt+2JBNSuQnbCUARjpUORzr33PjS+y2JUDL3BTwTLweuVu5NxwyvOZEjEwhJ4KlISvzywMg83L/Lmce5bC19ezU26QGuzbCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgSizQQlai3mdowrj8OonW3AFl1Kf+CSNtC+mvWaQM0=;
 b=kRK9cyTJwFtJfqhlq0jHT2MPVpTKyZ+vvi//hOyex/fywHHp53EiZw367UDH29z+bWw/UCVb9SOFSeYwUDjoymnPHxtfIFLA2WP0ZU2/eLIeVzZOXYDcAvPpcNKcH/SliYbfDhN8MFSu3JP8orcM/x2v5qTikBUqMWuHB33XH+53l0sI33/Q6BGSNCKfC1+czlNjolOYxMaUlR26UUrMgGgR9KxiiHSerxx1o2TnGQJFDOANQBDMzXr5eDC99NkQb7Ritpp2BBLBvvzuQ6k1aCiViPKGQOrTrZjle8TW9LX6fjteKEc/O/XH+OFFYOXaEhWJXrHaRyjJn2vQ4Qw9ZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1718.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 07:10:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 07:10:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 02/12] powerpc/pseries: Restructure hvc_get_chars()
 endianness
Thread-Topic: [PATCH 02/12] powerpc/pseries: Restructure hvc_get_chars()
 endianness
Thread-Index: AQHZ/AUlFYrfIReJFEa2MUHb5KPuu7BibpyAgLExQIA=
Date: Tue, 20 Feb 2024 07:10:57 +0000
Message-ID: <37a78bec-e598-478e-8a0a-3c4d9d9345db@csgroup.eu>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
 <20231011053711.93427-3-bgray@linux.ibm.com> <87bkcg9rno.fsf@linux.ibm.com>
In-Reply-To: <87bkcg9rno.fsf@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1718:EE_
x-ms-office365-filtering-correlation-id: 4645e13a-65f4-4fd3-d61c-08dc31e3160c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pY/K+tst+jEM9nP5hoeIgC+zUk/taNeMXid8TYU6g/hqoG1L9cAE5C8BS5eXK1CvFfhcUvNUsC8wRDBbjY9IJf/Ecb02NESCK83bF1eG7X1KM/3QKXVJ+a+jjsFVaLxyYA0nHS7Vif3a0ow8RtMxrtfiHUM8hQ9ZwI74ZNSs50skZUCJuEGz4y9xMbAX7E7/OhGJ/spakPBxAeu/JqKHKoJGNb5d8hhtFhT9ALpkGPBweHcvlysClbMka+exKsg4gs/DIIx88wedCloa6GZmmKesn+XaU4dZPTkn8AGCEkhj/svLCAEo52mTkvnQqb1707QgR8PGDDVaESaj9rAWkNsq60zeU0STwvkcpXisbuSKfF4ENIN1wxs1QMPJMNlta3o7/WH5PdWLMO8ctcEqCG1bC0RiF5WdeTO21slTrz2CRoxam1l1xHXZW26q1R6aGbegtS9m/0+S9UJkbE/9yGiNmWJafayN8viOxwJLEqWYaVZjOcgkTnWdT1JYItN4pOby550s2GM7aSLMqEaF9RJjmMF2ba80dTTXAgMGwfE2o8VHpfxmAU3YXWRbT9WeVh0eSO6q1sq7DSvCTFCgaS32buKUUjOLxK0Ptd1uGX42U7O8hc4w9SF2tdZWUkW6
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mml4cVhDU0NJUGM1QU1ybEFJVWN0Yml5elhrdy9saUR2TGJJQ3B0dHZScGND?=
 =?utf-8?B?RjJXZ0NBbVdWNGpzMTVZVCtOTU42eXNMaEdTTDJPNUpSQWNsTG16WER3bytV?=
 =?utf-8?B?cW1JdnZHZzEvcTd3MkZPTU5ScitqbUZWeldTdkpuNWFyMlZpcUpFejF5cTJn?=
 =?utf-8?B?ZHo0M3c4bGVSMWhKMzNuRkZqM1ZXSGE3U0N2bnlENFdHNVFFV2JhTzNLQTU2?=
 =?utf-8?B?RThHeUJpTlkwekZaZ3ZINFlsNjZNYXRaZXJMcy9kaytBWThRVTRydjM1Tjdk?=
 =?utf-8?B?ODJsSUs2NVA1Z3dGNStQNnJSNTdxQngyZ2JkVzMvN0dnQTRoZGQ1YVM0M2wv?=
 =?utf-8?B?cmNpL2FNSEtFb2FzdjQyOVFVQjRoQWY3a0R0b01LT00xVkNWNmxCeG5SeDZC?=
 =?utf-8?B?aWNscnlaSUhIYkdHVkJOdmFuQWpLNW4xSnppajhzM3BtTmJEbDZ0WHJ5WjIv?=
 =?utf-8?B?V28xeko4K1dYM3laU3FyLzVrc253amV3L1FoR0x5TUlPZUVLdG55a2lLTWlz?=
 =?utf-8?B?aFJzZTljSFpQK1lPODR0bVlYK2k1RmpnNFpWVjhIR1VYMTljOWNma1l0Uk1y?=
 =?utf-8?B?MURhbThUeFkrODh1VkRhc0c4Zkc5M2R4SVF3NVdRR2ZQSEFmUHZSSGFNeDBZ?=
 =?utf-8?B?TjhmNUdMVGlwem1meW5NQmRPekt0Q1F0MnYwdGY1RFJCL0ZkempVUUJuSUdM?=
 =?utf-8?B?a1BXWGUweDB6dDZzQmQrVmVwMW4rZWFKK214RXVXV1Z6OFZnZXY0enVSS0ha?=
 =?utf-8?B?czViaVdTYmx6L0FXdkdwQXdqT2FrM21PZGxsdWxrcTErd0VsQkxNRzRFOFF3?=
 =?utf-8?B?WGNlQkx6U0dVaEs4ZWg5MjI4QytDMFBMSUk0cG9NT3lPU0NFUS9lbVlqT0lU?=
 =?utf-8?B?c0t3aGVscWV3YWUwSzRlQU9oQVQvdi9NTm9nRWlKTHlLT3lVY3Uxc25ORUJU?=
 =?utf-8?B?VjVsRHB0UGszU0oreHY5eWxPM0haUmk2bG9RYW1ZQ050RzNhTnlZNmszQ3h3?=
 =?utf-8?B?VC8yWGdLSVhSbDlhcWdTRGwrd0ZkT3dKY1BETlhhT1RhYm1LNis3MnU2aGt3?=
 =?utf-8?B?bmxEa0pQRnBxMzJLVFF5UkRraGFoVUUwQzB1aFJuaXlYR2tuVkRya09iYlBQ?=
 =?utf-8?B?bWVhZjRiSTBXdGRFQ2RQdmdHK2ttNGVSOU9kUG9WWXVaNm95aHd2cHh6SWk2?=
 =?utf-8?B?ZGU2a0d2NlFMb3BNK3NKTlpLK0FybFpuVzhkSFJGMXpFcG9CZGxTRHZCaEti?=
 =?utf-8?B?QXhYZHUybkRVV0hmSVRHOGwzWVkrenpNelFsSi81cEJqWlpXMlBFb1NjaWVi?=
 =?utf-8?B?N2lDdEQwZFh2TWVsSjZqaVpYVjJBY0NZWUlONjZONVNIWjdvUWtQa05GVWtB?=
 =?utf-8?B?NUlYR3dFbnRSNEh2RmQ1SmRmTFlrcS9RMEhnY2hkTVRSMElrQVVuMktqWlg0?=
 =?utf-8?B?WGtQaWtmNytpb0hucklpZGx0alRYNlhDalBoV0JIYWRDRmhmN05QZDREWm9Z?=
 =?utf-8?B?NkE5V1JkOVlwVzhtVU40Zmo3RGYzbkV4aVhQT1VKVHhhNVZrUTdTSjdEaHhm?=
 =?utf-8?B?a0w3dU1qZ3BVZ05hakFJTXcxTktFSzhCV1pReGtDbHBBY2diMytXUVI5eXRq?=
 =?utf-8?B?REJHME1jSVFxdFVCdVFKV1NHeGJzN1QySGkyNjdwNFlQQlJ4VVBGdlFva055?=
 =?utf-8?B?UEhzWHpsdE1qVDRzUnZraGhjY2VWY2NUZFVhNDRsNnpmUUN0Ujh4VEJkbVhx?=
 =?utf-8?B?SFZjQ0ZQVVJrcmdoUTFQODlOWW5WVDliM0FjbkFNMkt6ZGVrZm82VFVtNVdL?=
 =?utf-8?B?aTR4dDZRbkhwVm1ZdW1RZWdTM09SNGVob1RkMXM2ZkhIWUNESERKdHREdGNE?=
 =?utf-8?B?eUxxYXpTZk5lWTFialNEZ096VlhqNW1qZmUxeVIxd2VjdGdRRFFFZUJ0cDQ5?=
 =?utf-8?B?NVhTdFpiNkJLbXZSMUI4bzRXL1ArbGFXblIrY2N4SzdobWxCcmJ3T1RIb3ZK?=
 =?utf-8?B?UXgyY1V0ejZsNHUwekJPVm1PUmtYMmZTOU44UmdoWTNWbFg1QUt6bzdNcGVs?=
 =?utf-8?B?eSs5SytIS3pneU5XV09hcms0bjBwNlErV0NTdVdpdnE5czR6MkJOOHZWOCtZ?=
 =?utf-8?Q?lWx9noFHDuBO6zVXJq6MUJIhO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E9C5DF18DA9DF49998BF52722EE4973@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4645e13a-65f4-4fd3-d61c-08dc31e3160c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 07:10:57.6449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLZ4WQ3d0Sldd6n/gQ5BRFErd87ZMZuzdphzlAzQ2uj9/EwWPDTKV9SVHkOGqQUYob29lc8e0tJFa3FU+eBPrhomXEu6sC0cC2b8cPQuctE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1718
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TWljaGFlbCA/IEFueSByZWFzb24gZm9yIG5vdCBwaWNraW5nIHRoYXQgb25lID8NCg0KTGUgMzAv
MTAvMjAyMyDDoCAxNDoxNiwgQW5lZXNoIEt1bWFyIEsuViBhIMOpY3JpdMKgOg0KPiBCZW5qYW1p
biBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPiB3cml0ZXM6DQo+IA0KPj4gU3BhcnNlIHJlcG9y
dHMgYW4gZW5kaWFuIG1pc21hdGNoIGluIGh2Y19nZXRfY2hhcnMoKS4NCj4+DQo+PiBBdCBmaXJz
dCBpdCBzZWVtZWQgbGlrZSB0aGUgcmV0YnVmIHNob3VsZCBiZSBfX2JlNjRbXSwgYnV0IGFjdHVh
bGx5DQo+PiByZXRidWYgaG9sZHMgc2VyaWFsaXplZCByZWdpc3RlcnMgcmV0dXJuZWQgYnkgdGhl
IGh5cGVydmlzb3IgY2FsbCwgc28NCj4+IGl0J3MgY29ycmVjdGx5IENQVSBlbmRpYW4gdHlwZWQu
DQo+Pg0KPj4gSW5zdGVhZCwgaXQgaXMgdGhlIGJlNjRfdG9fY3B1KCkgdGhhdCdzIG1pc2xlYWRp
bmcuIFRoZSBpbnRlbnQgaXMgdG8gZG8NCj4+IGEgYnl0ZSBzd2FwIG9uIGEgbGl0dGxlIGVuZGlh
biBDUFUuIFRoZSBzd2FwIGlzIHJlcXVpcmVkIGJlY2F1c2Ugd2UNCj4+IHdhbnRlZCB0byBzdG9y
ZSB0aGUgcmVnaXN0ZXIgdmFsdWVzIHRvIG1lbW9yeSB3aXRob3V0ICdzd2FwcGluZycgYnl0ZXMs
DQo+PiBzbyB0aGF0IHRoZSBoaWdoIG9yZGVyIGJ5dGUgb2YgdGhlIGZpcnN0IHJlZ2lzdGVyIGlz
IHRoZSBmaXJzdCBieXRlDQo+PiBpbiB0aGUgcmVzdWx0IGJ1ZmZlci4NCj4+DQo+PiBJbiBkaWFn
cmFtIGZvcm0sIG9uIGEgTEUgQ1BVIHdpdGggdGhlIGxldHRlcnMgcmVwcmVzZW50aW5nIHRoZSBy
ZXR1cm4NCj4+IHN0cmluZyBieXRlczoNCj4+DQo+PiAgICAgIChyZWdpc3RlciBieXRlcykgQSBC
IEMgRCBFIEYgRyBIICAgSSBKIEsgTCBNIE4gTyBQDQo+PiAgICAocmV0YnVmIG1lbSBieXRlcykg
SCBHIEYgRSBEIEMgQiBBICAgUCBPIE4gTSBMIEsgSiBJDQo+PiAoYnVmL2xidWYgbWVtIGJ5dGVz
KSBBIEIgQyBEIEUgRiBHIEggICBJIEogSyBMIE0gTiBPIFANCj4+DQo+PiBTbyByZXRidWYgc3Rv
cmVzIHRoZSByZWdpc3RlcnMgaW4gQ1BVIGVuZGlhbiwgYW5kIGJ1ZiBhbHdheXMgc3RvcmVzIGlu
DQo+PiBiaWcgZW5kaWFuLg0KPj4NCj4+IFNvIHJlcGxhY2UgdGhlIGJ5dGUgc3dhcCBmdW5jdGlv
biB3aXRoIGNwdV90b19iZTY0KCkgYW5kIGNhc3QgbGJ1ZiBhcyBhbg0KPj4gYXJyYXkgb2YgX19i
ZTY0IHRvIG1hdGNoIHRoZSBzZW1hbnRpY3MgY2xvc2VyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+PiAtLS0NCj4+ICAgYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2h2Y29uc29sZS5jIHwgNiArKystLS0NCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2h2Y29uc29sZS5jIGIvYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL2h2Y29uc29sZS5jDQo+PiBpbmRleCAxYWM1Mjk2
M2UwOGIuLjY0NzcxOGExNWU3OCAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvcHNlcmllcy9odmNvbnNvbGUuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
c2VyaWVzL2h2Y29uc29sZS5jDQo+PiBAQCAtMjksMTEgKzI5LDExIEBAIGludCBodmNfZ2V0X2No
YXJzKHVpbnQzMl90IHZ0ZXJtbm8sIGNoYXIgKmJ1ZiwgaW50IGNvdW50KQ0KPj4gICB7DQo+PiAg
IAlsb25nIHJldDsNCj4+ICAgCXVuc2lnbmVkIGxvbmcgcmV0YnVmW1BMUEFSX0hDQUxMX0JVRlNJ
WkVdOw0KPj4gLQl1bnNpZ25lZCBsb25nICpsYnVmID0gKHVuc2lnbmVkIGxvbmcgKilidWY7DQo+
PiArCV9fYmU2NCAqbGJ1ZiA9IChfX2JlNjQgX19mb3JjZSAqKWJ1ZjsNCj4+ICAgDQo+PiAgIAly
ZXQgPSBwbHBhcl9oY2FsbChIX0dFVF9URVJNX0NIQVIsIHJldGJ1ZiwgdnRlcm1ubyk7DQo+PiAt
CWxidWZbMF0gPSBiZTY0X3RvX2NwdShyZXRidWZbMV0pOw0KPj4gLQlsYnVmWzFdID0gYmU2NF90
b19jcHUocmV0YnVmWzJdKTsNCj4+ICsJbGJ1ZlswXSA9IGNwdV90b19iZTY0KHJldGJ1ZlsxXSk7
DQo+PiArCWxidWZbMV0gPSBjcHVfdG9fYmU2NChyZXRidWZbMl0pOw0KPj4gICANCj4+ICAgCWlm
IChyZXQgPT0gSF9TVUNDRVNTKQ0KPj4gICAJCXJldHVybiByZXRidWZbMF07DQo+Pg0KPiANCj4g
VGhlcmUgaXMgbm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2UgaW4gdGhpcyBwYXRjaC4gSXQgaXMgY2xh
cmlmeWluZyB0aGUNCj4gZGV0YWlscyB0aGF0IGl0IGV4cGVjdCB0aGUgYnVmIHRvIGhhdmUgdGhl
IGJpZy1lbmRpYW4gZm9ybWF0IGFuZCByZXRidWYNCj4gY29udGFpbnMgbmF0aXZlIGVuZGlhbiBm
b3JtYXQuDQo+IA0KPiBOb3Qgc3VyZSB3aHkgdGhpcyB3YXMgbm90IHBpY2tlZC4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4N
Cg==
