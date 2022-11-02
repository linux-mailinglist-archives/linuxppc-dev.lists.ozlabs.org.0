Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EFF616029
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 10:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2MSB13BQz3cN0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 20:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QDssPSC5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QDssPSC5;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2MRC1X8Kz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 20:44:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUTMbCnBaQXuV6WqB4e6qqy1N7Wat54+ugGOplesXTGod0u+thKR19Qifex3nmC8XkgYIqJuctNbUMJ7oCIurLJNZf0wDnmcreSTnBEUov3J4f9YAXrZqsl/Rlt/FgaAtMEM7Y9jBQCVjwx0FFolMH8BlDrRDe0FFCU8zwzpcWIJ6KwQCgOVDpNLPW28Jd0JfvdcuAT0J1r9YzsDpVGfRNgDTaEtdAzE9QchsvWl7jGOk0ltOs5YiM2GSOIqwjlocVwtqSXS2lfv6LIscQLLpYOz+lQQLgFtg8XxpWwdV8TBweKJmEQKDX9dB1xA0M6PhAOeG+L2mgVTy3jEsRGEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KljUAvK9AVNuwfmrlipaVLEDkF2HP7ju2q0X6ic3Bc=;
 b=be1d/jpRkVLzwbGXzKP/MhzqB6HvXtdIi4RMXXqGs1LGx0LEJaohP5PUl0EAXx1gxs0Nryfzo/XWTq7ajZaGtCNt8U4jzlH2W3AArxQ3TRKpXPjy1VonnWEeq5BhbBmgwRDpOIejMo1GYudiB4QHgcbM3avKyABpOJZpkQofv/sB6K7fFMpHAy5HlN43XMHLCnrH6wcLxpYx7pPxk/gJNz538X384Yf1T2F98L6xKuYvSrHIGj0EZQ2WIFffP5gFCTe/hRb3YhjOKwmh1N0FL7VMTBWweirh7J9mXL+72RXC+gYv9oVvrJ+sRgKojXNTrj+x4fS4kRZTaW/1kA4jWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KljUAvK9AVNuwfmrlipaVLEDkF2HP7ju2q0X6ic3Bc=;
 b=QDssPSC5GBLam2YBzTpusFsxhw/hq3LXKsAuWeqZ8eXe9sCj/L3+QzaWb8zom2P1H97+mZdxpDNMOIB6wuH157poqAgnuR6jdDFp+vsXBLeNfrLvrpIUrK8gPORI3qq6F3Ovy6PlpvPHUS7nvqGuOABxvST8r9pCIa8vgpqbUscJSMjy6u8jUw35vBtNj4g8naBmztTehaLaCMSzA1Fo9gYSgz7IWc7VVsfSJX9JcwOPw31Lga/IXxnuGX/F04qKbaInOqtR26HeSTbTTASDEcEpdTKLYiEHdoJqspqbJOPyL8za10oRLhMe+mWcZt8gM7yxw2v3UydQLLa2pMQVQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1812.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:43:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:43:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 4/7] powerpc/code-patching: Verify instruction patch
 succeeded
Thread-Topic: [PATCH v9 4/7] powerpc/code-patching: Verify instruction patch
 succeeded
Thread-Index: AQHY6Cx9Y71WFvUkYU6gwiA22eBm064rbtyA
Date: Wed, 2 Nov 2022 09:43:48 +0000
Message-ID: <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-5-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-5-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1812:EE_
x-ms-office365-filtering-correlation-id: 0a1c3862-61d3-438e-9125-08dabcb6bdd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CLREDdv/AnE1oMWUAdUqX7G0VYbuVy9UOVr5F2mV/fSZANlSl4iV696YHKUNgn202K5+tc7nwayqOIDRkKSlsxsczuPja5d3O51D4D/oHNCCqcmM6Drobwiw4vBVWuiNVBzzvC6+3OGlYH4EiAFcKGekU68H6ssioDeYv0gJukQGV+RIkxO58vrkcXDrFh2fHwBzre1K65p43oOKor1IeBkYFfThhzCVgjNGDdmciYnFdefJJFx5726WSm4CdP3D7i1wLrP4UyL6mk140pgOTS7oscXNz5UobWYdy2iR0g8UWdov0a/x2kT9F5DBcv69mbZ+PyI3fJK2sfkOPoRdKoAkgi55agnPSPRjk+7Ab3d2LNSltSLJ8a01V5DSCMldJOKNmlUKn1V/fxzvM1cH7IIq8HCsd4wOq5jRYD1uI7r0VR1VDSG4XQ5dDzJrtX/Q0NlublP2SnxVp4sRvMXR/QBZcwj3lVhq6aajLp9gynQanMO7/GISctF9Tj0kPP4LyDSTaPoYjKqlZeT3DPWzhvYke9hJT/LzMCRf58kr1HZbBM4GeBFQPh+4blzwJNpoEARyEIyxOVyVAiS9Hc8ubq94MO9GgwtEjFePdqbX3UpbZXI+3SLa72ZjkutAxbC2hBKccAJzeW/WH4B4GNJTDNf+nOVsBU0YT3hpIbghM77gv0wq2+PmoquY+k7aDYwuywB4KVEleOrloEW1fJAgBXW98k9q250Pn2UmZJFGoEZWTwkSsDyj8+47RZZXHP0iiZClvHxkTCY8CIZQKJyWWwPLwSwjfJWrGww5vp36EowDcjqIpf3kJitCIEG/MJNbdCkaEbidWanj2nJHl69IeA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(376002)(39850400004)(451199015)(478600001)(6486002)(38070700005)(186003)(2906002)(2616005)(44832011)(31686004)(15650500001)(71200400001)(66446008)(6506007)(64756008)(4326008)(54906003)(316002)(36756003)(76116006)(8676002)(110136005)(66476007)(83380400001)(38100700002)(66946007)(66556008)(91956017)(5660300002)(66574015)(6512007)(8936002)(86362001)(31696002)(26005)(122000001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NEY3cjRYbTFURXhnOHlHTkUvOFZYYUlEa254K2s1Q1ZMR3VES1A5b2NwY3RK?=
 =?utf-8?B?bEdKTXR4ZlNOSktQOGdEcDIyNDBlQlVQbkFzTklnRGcvNnhLdkdyMlBsYzN5?=
 =?utf-8?B?TFdwbDBRSE8vY1plUFNUZEJrOTh5c3poN1I5L3o2Y1BUanpIUjdFUVE0VENw?=
 =?utf-8?B?Tnh4YzdQVGNYM1RkVnpxNFJDTUpKMU1ONVRVamJpSFpxOFR3NFE3c2FnbmZ5?=
 =?utf-8?B?VzJCUU1hdnpoZk9nM2d0QjJOd0wwcXRjUmNMYStZdE83bFVHb0s2UGZIV0lL?=
 =?utf-8?B?Ymw4WE5wS3BTQjdMU0VHaTMvVTBFTzB0Ympqb016Y1pkaFYzSnVxOGMzTkxF?=
 =?utf-8?B?TTNFT0lyMUhYRFRKZHJQZnZCQ2Y1WitLZ2ZWcE1OUjFiVEE3RGN1WElhMm5Q?=
 =?utf-8?B?T1VrVStQUU5tM1QvY0Znb3QwQjhkUldkWG54Y1NCVnhid29zS1dacXZWQzFJ?=
 =?utf-8?B?UHNEM2M0TkN0RlQvaEVFYnl6YmlOTE1NbUMxVTkrKytlamphZGRLRUNkZzJE?=
 =?utf-8?B?RlVHTUJreW1NeG1sd2hrMFlBN1czS2IvWmFpWkhvM0xycEg5ei9XZXVLSHo2?=
 =?utf-8?B?ekx1Sml0YW41b1Q4Z2FTY0JhclVpTDJjUHl4dXp6M3VKc01ydDRZdHh0dnQ1?=
 =?utf-8?B?Skx5U2JzMHJPRi9DMnJHeCtRcjYxV1RmQzlrb2s2UjBWRFllMi9sRGRyQlI1?=
 =?utf-8?B?Um13NXhnR1gyYjBUYVZTQ213cmdaVFZJQTV2VC9Bc084L09XYjNnU2tqeElr?=
 =?utf-8?B?RHBpT1F1RUNSbXJrdXRYQjhjMjNDSmFES2pHOXgvdVViWk1GWXRXdnV1U2la?=
 =?utf-8?B?U0lRUVFoMi9hTDQzSFZPb3IvU3owcXBsY0dmcndDT2FUbmR5dGdvRGZiQktM?=
 =?utf-8?B?ZDNTeStGYTJROC92R0xtc0h4TFZyazFJNVFBSFk2TGYwNTF3TU91elZMdGhm?=
 =?utf-8?B?bGEwT3hiQjF6dENJb3hUVjRDbjA3REtvc1pMdkp1Z2RlMm9rOFlURm4vVDlR?=
 =?utf-8?B?YkJ3ZXdjOVBrMW9aSFIrZmJRU2VrWktDZENGRXlJVGNwOVJBdlUrYWVTSU5a?=
 =?utf-8?B?UzVlRE5Xb3czT2V1Mk9sWDErMDhqSStMQndXNlRGdjlUQlZxWGZic3p5Ty9W?=
 =?utf-8?B?SGU1R0RyU2ZRdFBKejd0eDZwRXprcWw5NDczQlZqU3ZZNkdLMXpSMjRVaGFl?=
 =?utf-8?B?NUkxeitHNUw1OVorS09ZczAydmNobis2TTZQSnFBV093WmljNmdJRWdWTHNj?=
 =?utf-8?B?YW9VREwwdU1CY1U0ZmhyVW5KU09lVWtjZnhTcHMwUy9GeG5PMmY3LytPOE1l?=
 =?utf-8?B?ZnhtR0UzMlRPcVg3MExqWmJBaEpaakZLaFV3eldVUXhYbmYzR2JIV3J0OFZM?=
 =?utf-8?B?VlVjeGJhaG9IRXRJbFNxaU5XRGxnWFFEYmhqaXpGQTZxT01FZkFXeU1OQkho?=
 =?utf-8?B?NG1ad1R6Y2xRWGphK3RIRDlKNWE3S011UktWRFJxSlhaVjA4WHk1REhrTWda?=
 =?utf-8?B?aTIwaDVkOXFkRlhPWnpGWWVRVEQ0bzg1NWQ0elhpaHMvVE1oYVovOU93NThU?=
 =?utf-8?B?cVdzcXhRVDdUdmQwQnY0cU9pTWkyTFNJeUZ5Mmx4VUtCNVZSRzFrZmhsL2Vu?=
 =?utf-8?B?ZVpKVS84VzlFaGJWUEZzY2tiUjJXUmNGMFZvdzhQNmp6enNISWxCQm0zRlRX?=
 =?utf-8?B?VjBLMWU0MCtVVXBEVVR1dEcya2h2U3FPV0MvZis5YlVNSHJsMDlLV1hSaWxz?=
 =?utf-8?B?ZHJKRGxyTTMwTWxNUVJaSnRodFd1T0orbmp1a1JPVFZCalBqSmJTV0VBZjF0?=
 =?utf-8?B?YS8rVUVkVkV5UVhzQms4YitsMG55cEEwTjlpTmhaRkpLN3JhcFNvOG9KQVp3?=
 =?utf-8?B?WU5IZVdFbm1BQ1Rjbjd6b29UNWg0eDNRRmEyNHlKTngrMEZJV082NzI3RXBF?=
 =?utf-8?B?eWlQZ0x3M3BPU29TSjEvclY3N0xhUVVOZTZzSnk4dGlEbm0vU1o0L0VBcHpp?=
 =?utf-8?B?ZE1EbUlKaFpjaVNOTlFDcnR6cnQ2RTk3K2kzZGxVVEJnc2Urbko4bE5icVBE?=
 =?utf-8?B?VEMwREMrSG0yZzE1RFd0dGZFSWc1VHNBdzUzZGhXNlhtbHBDbzcxK29qdWo5?=
 =?utf-8?B?alJ6VmpjSDFGbERPdkVEWk9Zc3FZR25nZk5kT1Nqb3l6cWpSeDNXT0g5UVVw?=
 =?utf-8?Q?NXujCeD1lEr/zDGYfuiqm1U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4080F4CBE9C5F54BB8EC1B93C748F10D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1c3862-61d3-438e-9125-08dabcb6bdd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:43:48.0772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oTcMebHE78lpl7g1yP9dfJTXP2xyi0SNPzLD9zZR4xpZS2YgwSIhUggwOk4Z79brshHTseEMtPzqiAf/fpE2Ji/ueTu8KLR7Y5t2uy3eTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1812
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VmVyaWZpZXMgdGhhdCBpZiB0aGUgaW5zdHJ1Y3Rpb24gcGF0Y2hpbmcgZGlkIG5vdCByZXR1cm4g
YW4gZXJyb3IgdGhlbg0KPiB0aGUgdmFsdWUgc3RvcmVkIGF0IHRoZSBnaXZlbiBhZGRyZXNzIHRv
IHBhdGNoIGlzIG5vdyBlcXVhbCB0byB0aGUNCj4gaW5zdHJ1Y3Rpb24gd2UgcGF0Y2hlZCBpdCB0
by4NCg0KV2h5IGRvIHdlIG5lZWQgdGhhdCB2ZXJpZmljYXRpb24gPyBVbnRpbCBub3cgaXQgd2Fz
bid0IG5lY2Vzc2FyeSwgY2FuIA0KeW91IGRlc2NyaWJlIGEgZmFpbHVyZSB0aGF0IG9jY3VycyBi
ZWNhdXNlIHdlIGRvbid0IGhhdmUgdGhpcyANCnZlcmlmaWNhdGlvbiA/IE9yIGlzIHRoYXQgdW50
aWwgbm93IGl0IHdhcyByZWxpYWJsZSBidXQgdGhlIG5ldyBtZXRob2QgDQp5b3UgYXJlIGFkZGlu
ZyB3aWxsIG5vdCBiZSBhcyByZWxpYWJsZSBhcyBiZWZvcmUgPw0KDQpXaGF0IHdvcnJpZXMgbWUg
d2l0aCB0aGF0IG5ldyB2ZXJpZmljYXRpb24gaXMgdGhhdCB5b3UgYXJlIHJlYWRpbmcgYSANCm1l
bW9yeSBhZGRyZXNzIHdpdGggaXMgbW9zdGx5IG9ubHkgdXNlZCBmb3IgY29kZSBleGVjdXRpb24u
IFRoYXQgbWVhbnM6DQotIFlvdSB3aWxsIGFsbW9zdCBhbHdheXMgdGFrZSBhIERBVEEgVExCIE1p
c3MsIGhlbmNlIHBlcmZvcm1hbmNlIGltcGFjdC4NCi0gSWYgb25lIGRheSB3ZSB3YW50IEV4ZWMt
b25seSB0ZXh0IG1hcHBpbmdzLCBpdCB3aWxsIGJlY29tZSBwcm9ibGVtYXRpYy4NCg0KU28gcmVh
bGx5IHRoZSBxdWVzdGlvbiBpcywgaXMgdGhhdCBwYXRjaCByZWFsbHkgcmVxdWlyZWQgPw0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyB8IDIgKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hp
bmcuYw0KPiBpbmRleCAzYjNiMDlkNWQyZTEuLmIwYTEyYjJkNWE5YiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2xp
Yi9jb2RlLXBhdGNoaW5nLmMNCj4gQEAgLTE5Miw2ICsxOTIsOCBAQCBzdGF0aWMgaW50IGRvX3Bh
dGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gICAJZXJyID0g
X19kb19wYXRjaF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0cik7DQo+ICAgCWxvY2FsX2lycV9yZXN0
b3JlKGZsYWdzKTsNCj4gICANCj4gKwlXQVJOX09OKCFlcnIgJiYgIXBwY19pbnN0X2VxdWFsKGlu
c3RyLCBwcGNfaW5zdF9yZWFkKGFkZHIpKSk7DQo+ICsNCj4gICAJcmV0dXJuIGVycjsNCj4gICB9
DQo+ICAgI2Vsc2UgLyogIUNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWCAqLw==
