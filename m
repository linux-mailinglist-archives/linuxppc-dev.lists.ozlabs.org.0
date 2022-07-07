Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD70569DFA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 10:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldqqn1CW4z3c3w
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 18:50:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gh2b7x/G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.88; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gh2b7x/G;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120088.outbound.protection.outlook.com [40.107.12.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldqq24glvz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 18:49:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC9SdJ5UafEpk6rIAmn3aiAO3oCrRQdMr9wi4U2aPkMCPlQu8F2wqCEZXVAOVdfyY+89hSvi46fi3ajo45Z6UGqtd6FZvxM3yXNzuXdOOTb+CoJcRToaooCy8KgaMTZEG8ijEEXG41Zk/AxNUiEzWJ5DyRf0PQ3DmxSte7BWrn6omVtk/M6tb8UXPzy3M4vhWiHg8DKC1iR+X2+ezhyR7fdYPjki6QwFeMXBJrTd1QJsWzHTdob+IQTy02KwfBjPt1f3D5ievEAsuPtDUqgku4+y3nbYL7qMr2OIiDqQPqU5DizqY2j/pio/xVMD9LPqVyalRK7PdM9XFjJxu+F5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9WEuMWi2t5RpxVOiUnUraT9O6fQAm+283D6/XZQDgk=;
 b=Hgl+q4c7/R6AYid6S88PidTKZT4+guz1olgND4kYTwjXOFMcSp1AAS5PuyxRLRwKJlSund7A5eG88i7NTLiHJ766T2qQyNB3u6O9u6Ef9FujBaQebqaoo85pCm2DARte3yX0wApyXXuLoheoxi6+QaWdiKeVHyWAjTBwViTs1bsIeG7IVcnCLbOGaAOlFWGnVuhXcSca7LmtD81pPSEtyZ3ryGwpvjWCS8gxf+SV3MGxtA8UK6HAaColG60gCrDgN1QrwA3TT9Hi8VfQPUpSqgWjGDj0IH3Yz7FMwvcUlR+xgJeENjT+R+uYk42R5uKzyNmucEFGPCU9Vnc7QHefMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9WEuMWi2t5RpxVOiUnUraT9O6fQAm+283D6/XZQDgk=;
 b=gh2b7x/G7s+CHo20qt+RZ3vUmJ1af4PfpX+ewlMVDjqQL+tWrqf5WtZUcunR2rQ04WiurjEgvNXgB/vo/JXJGAL7/skTtxvtOU5c8+3HwCRq+CgIUpl60sQvxcRJTCu5w+770TRWDBo+PcNpMilAXQ3/DU8AyxL1J4FwN2V4xOrhd5+mVA820EPJsJtT3b8M8COS0v90tXUyCrn1KMNMlRwWiTi/2z4kbTWCPpAa2Dz9AAzABFcc+oTFfwcRy749EQSjFUr+Lq6IwrOyDhy4ZlRuu1emS2nMcL2YafyTAjfE1uoRGkzyeHa6mc2bSy0oVTF/W9tSywseL7zh5IOKuA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2630.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 08:49:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 08:49:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc/platforms/83xx/suspend: Remove write-only
 global variable
Thread-Topic: [PATCH 3/3] powerpc/platforms/83xx/suspend: Remove write-only
 global variable
Thread-Index: AQHYkckR7DFcwn188Ua274Q2Fk3NZK1ymVwA
Date: Thu, 7 Jul 2022 08:49:30 +0000
Message-ID: <17c0d28a-114e-26c2-7e70-06e47c013aae@csgroup.eu>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
 <20220707061441.193869-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220707061441.193869-3-u.kleine-koenig@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9402ed8-d4ff-4913-41a0-08da5ff59bac
x-ms-traffictypediagnostic: PR0P264MB2630:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ze6iY6wFdkY7Nriolh/5v6JMurMf+5UezFiK1v0ONVagzw7oWZj8tldidn6SnPK1AFieem1sYKFU4TdRqGBDKO86j3/GKCpSt6DyzD8ghZHSsxO7M87RPxklcgbjlKlPMtftNwrAK3bqY1gTd54Egz+xCTSSaE7AsNHXfFekRmq3IMxH7oIySlAJIZWpOjTbc9oyZ2hQjRbZth9ij3VECCVNQ7YruWwQ3X1fBMIkMH4++vU0x3JEaJMdt5VG+KuTlrxDKSodbJia9RmYja9OdFURPt4m2adZQB1yE00fthIM+2hdNtGry9ucSdPP5Veq/kjgQO8VPPyGwYrQOgOL17T7+P3IEBXSCMkt790hfqV6hVAj/YnqwIUxL0sFnWlMwbLiE3wZRTC0m6CPah12eloVTUsulcB+68b5EVOnm1Sc/p+gAVHQp5kp0Mf1jtiGNPvi1efeRaSi9lLhq5e842fq3d+rrrON/lY7zUR1O9YIecgo/L4fIWe05r62socoUhMEAmyRWpwUko6HYRINUVa0e3m8CfxKfsBySig49sq02tTA6lf9HxaM8ohSrHWMFePg2ftKSRf4c+pFmpXPmvIWyNxsjnvd2SVGryXLY5VTjRCBunwLVcQCkB7vrDwo6D4a4CD8x/n90engfTQ3waN2aJ1/QUp0qsKySqM21ah7GOuNmhpkgDMtdy5t3UfRNemjeXWHuz3VzaF83b9tnP73Aszl9x8UaoxvJNz9ifCNJSg0hNW0dowcfeKzPSPpazgQSxRmivh7t0hC7SYJAXL2M33yjbNeajpQjWgPZggH2/GZ0E82mwbORKReujVm+0hwWJUD8DcSqMM3bWSQva+bH1xudqq+9UH6oVCPMO2uzJQgg0xBO5jW8IbZTpHo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39850400004)(366004)(136003)(41300700001)(26005)(6512007)(66446008)(186003)(83380400001)(2616005)(36756003)(31686004)(64756008)(38100700002)(6506007)(2906002)(66574015)(76116006)(38070700005)(66556008)(15650500001)(8936002)(110136005)(6486002)(5660300002)(44832011)(478600001)(4326008)(8676002)(71200400001)(122000001)(66476007)(54906003)(91956017)(86362001)(316002)(66946007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eElaWHRzK3dLQnprMCtjY3JuWU9lL1RXUytaclVhTFpoU3Z5elkybnY2WTcy?=
 =?utf-8?B?SzNzT08wVjF6KzhNSElHVVFBY2cwZ2ozU1o3L0lqYVZFSnNSbWtDM2hjSnBN?=
 =?utf-8?B?TVpkOTFoZWNyaE1PUlNLOTlXdXVlZFIzeWl2VTVtTkxRRzNPLzliWmxHR3d6?=
 =?utf-8?B?cHBSKzdNaG9oaHNOV1JVQWwyKy8wL2xTUWhMcXIvV3RKNkY2MTR0M3VMY21C?=
 =?utf-8?B?OW5DTk55alQrc2lqenBxWStQUFczc1ppNHppRlpXdlAyVldXYzYvR0JlMndz?=
 =?utf-8?B?dW96eDA4SVNid1VjVjAyREVJTnk5NExFSHFQR1JzTlptdHFVYlBVZW5Zd0Vy?=
 =?utf-8?B?dW81cit4WjNIa25iU3MwQlFiR0hISkRocW05WmhSaXhjYkwzMG9TSERiWGZu?=
 =?utf-8?B?SGFoc0NUUlVLUVdLdUhndFU0ZlllbUZCZzdiOEt3alFDMWl6N2RSR2Uycks4?=
 =?utf-8?B?RkIxSDBHNGJnNkQ5eW9QRlJKZnVzRWs4T3p4a0I2cytwM1FaRTVZSk4ybTRO?=
 =?utf-8?B?RExmUkpZTlVFcS85bzE4b2d1M2NFK2RhVE0yd2grZlhLeXAvOTB4YTZzYk44?=
 =?utf-8?B?M2c5REU4dGs3aWtSYWhveEJtcTBNWmRXTW8xbHhFQzdsSHpLeEp6QmJkTTlD?=
 =?utf-8?B?MDNFc1c2SXZodUswMnMwaWo0eTI2dGJHV1AzQjJwU1lkSTZMTGY0bjFIaTVE?=
 =?utf-8?B?anZocnIzaW9LSWFuVGtlM2srZ0ZBeW1RNWpCZkFxU2tROEdlSWFCWmxIc0Ey?=
 =?utf-8?B?R3ZDZTJiSC9FdVgwRE5ncmJ5VXBEQVhCS0VOa2Q4NHViR1FUbkxKVk9Od3Bz?=
 =?utf-8?B?WjhmblJlZGY1VXlRZVhHaDNDT2llL1dneTJJRzh3SU9VaXUrNTVobzdiS0NG?=
 =?utf-8?B?bnMyZWhLK1NpeUdxa2tnNVJtbHpaY1FJNTZjMm9odUg2SDk5VDd1akN1V0pK?=
 =?utf-8?B?c1FQWHNpTjkxNEZPWkIyNjgrQm5jbTMyRURSTUwzUm1QWG5aU3N3MUlJT3lM?=
 =?utf-8?B?Umsrc3Z2cC9zMVJKNDFScG1VZVZOR2RnUjlGVmdXK3VOa1NCUmdKZFlKYXNS?=
 =?utf-8?B?WXpzMS9wZ2hVTW0rNE1GcCs0NUQ2MTl3QnQwMlE0amxVVm84YnBUWlNpekJS?=
 =?utf-8?B?bk8wNmdTd0NJQk0zR1lSSkVLWlZ0czM0MUhWSHdNR2d0ZHZFZU5uRHZoRmZj?=
 =?utf-8?B?SzhVR1VhSml0MWJHcW54eHFQVnhjeDl5WDJXZ2tpeU1zNFBhY3NNakhacUMy?=
 =?utf-8?B?SHdMYmoxNWtjZmdCTXpNZHNyQmNlcnVZNmdtQ0RScXIvL1VpanpNWkxWb0pq?=
 =?utf-8?B?K1dac3lNbjhrRTdLRmpiUS9TUkpPUnlYSGxMSzJKanNiMzAvY1c2NDR5cjF0?=
 =?utf-8?B?bkJiL0hkaTc2NzhhYTkxUmxPMnlYcXNsaGhHdEM1dEhwck5wNTNyRkpoY2lm?=
 =?utf-8?B?N0c4OS9UV2wrVjJSQmhMVlJYZ1Y4bXk4MzB4alVwWWpHQUl1QmFLdlNrL2VK?=
 =?utf-8?B?SzV0amZoRDk0VTMzd2lqeW0rd2xkNkhhZzBoS2l3Slp0TmxYaUpPU0hCdEJ2?=
 =?utf-8?B?cStoc1h5aEM3VEUzcXl4czU2eEN1ZldoYVQ0RUY2aVZKNnk0QzlscVZVUVp1?=
 =?utf-8?B?TnZSUjBaSTJyVmZXbWtaYmVsOThzbk52aklodU5BOUhqRldaTVp1T0E3ekxG?=
 =?utf-8?B?TEZUMzQ3M2I5aEM2K0hZOEwxcXhicHArOWI2SU9SdE8vY25FMjNkNm4yeWk5?=
 =?utf-8?B?elJ2L3JaZ0hjZ003aXhkZ0Y5UC9ZdURwNWQ2K1NCdWNtTkZFd3FJM1hNdHAx?=
 =?utf-8?B?K0lFNnR1MjlnMU42Nmc5a2h0Nm10eWN2MWh6MEJkNDVWVmh5N0dqWmVsZUxV?=
 =?utf-8?B?YWNReUlWQ2NpbmxDUVJHckF6RSs4Sm9ycjhvSm9Hb0JmODhRRUlrbWhYaUhu?=
 =?utf-8?B?aUhGUWpVSzFFVzRtVndBRW41NkhQZTZZek90N0ZnZ0ducEFpRG9VRDFmK3M0?=
 =?utf-8?B?eGlpRzJLNHM5TE83OHVuM29hbDBNTGxwbUhDZTlXTWVXcG9JeU8vVTZsT3hj?=
 =?utf-8?B?NERBTnN1SFNIMGZhcXJCOSthWklOdUwxcUhmZkJudkh5UVRDQ2VyMFVhZjZj?=
 =?utf-8?B?bmw5YkN3WUIxR0pMWUVTaHZmUmNmRWtqMjlLYmZmdWpMVmkwMmlVTEhPcW1D?=
 =?utf-8?Q?5cTK6yITSY3FTTssYJ5OHgo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54A4C23B6E54184CBB8AAD202EB941E4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9402ed8-d4ff-4913-41a0-08da5ff59bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 08:49:30.9418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6R8y9ICOtHAEjzu6pVEjiuyZ4meLf8bCcsylbic+s4KcgVI6dPXNcx56Wxz7+8zzPzrq7pZBZYeD4w/2GZajDakLdrJIoQx26IjhVniRzTc=
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
Cc: "kernel@pengturonix.de" <kernel@pengturonix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjIgw6AgMDg6MTQsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IHBtY19kZXYgaXMgb25seSBhc3NpZ25lZCBpbiAucHJvYmUoKSwgb3RoZXJ3aXNlIHRoZSB2
YXJpYWJsZSBpcyB1bnVzZWQuDQo+IFNvIGRyb3AgdGhpcyBwb2ludGVyIHRoYXQgc2VydmVzIG5v
IHB1cnBvc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvODN4eC9zdXNwZW5kLmMgfCAyIC0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84
M3h4L3N1c3BlbmQuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODN4eC9zdXNwZW5kLmMNCj4g
aW5kZXggMzA5ZjQyYWI2M2Q0Li4zZmE4OTc5YWM4YTYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvODN4eC9zdXNwZW5kLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84M3h4L3N1c3BlbmQuYw0KPiBAQCAtMTAwLDcgKzEwMCw2IEBAIHN0cnVjdCBwbWNfdHlw
ZSB7DQo+ICAgCWludCBoYXNfZGVlcF9zbGVlcDsNCj4gICB9Ow0KPiAgIA0KPiAtc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBtY19kZXY7DQo+ICAgc3RhdGljIGludCBoYXNfZGVlcF9z
bGVlcCwgZGVlcF9zbGVlcGluZzsNCj4gICBzdGF0aWMgaW50IHBtY19pcnE7DQo+ICAgc3RhdGlj
IHN0cnVjdCBtcGM4M3h4X3BtYyBfX2lvbWVtICpwbWNfcmVnczsNCj4gQEAgLTM1Niw3ICszNTUs
NiBAQCBzdGF0aWMgaW50IHBtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvZmRldikN
Cj4gICANCj4gICAJaGFzX2RlZXBfc2xlZXAgPSB0eXBlLT5oYXNfZGVlcF9zbGVlcDsNCj4gICAJ
aW1tcmJhc2UgPSBnZXRfaW1tcmJhc2UoKTsNCj4gLQlwbWNfZGV2ID0gb2ZkZXY7DQo+ICAgDQo+
ICAgCWlzX3BjaV9hZ2VudCA9IG1wYzgzeHhfaXNfcGNpX2FnZW50KCk7DQo+ICAgCWlmIChpc19w
Y2lfYWdlbnQgPCAwKQ==
