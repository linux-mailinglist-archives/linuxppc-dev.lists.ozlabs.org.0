Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 781796958A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 06:48:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9HG2tV9z3cHG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 16:48:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QgvHKJJF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0c::622; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QgvHKJJF;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9GH073Cz3bgg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 16:47:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izQI+eEZ6gXQP7zEotO2pOB7S0y18jFnCKMhf3Cem/fv9EGotPW6t4kHYfidE+4rHUE0VoJrFPEumYaRfX3kRlNnTb28tAcrLxgQOQFlea5c6z2Kml1vCgNsxkoSqElGvR0zX3Jbq0w8PRXjxYdwWObuF0mRxjPK8Ddf2TMNbXYGREk1gBptvXmQ/1mmiGh5pBNqXv+mewrQkNRb+yC0FDIz5U3/x4EHlbfXEIJtQXlujtRU2WA6onzFhYwoKx8X3xD+fgVV1O/UoSI2Ckrxb2xMRYGzBwRnAcEoBYSiNqv4aDj6GzamSJCesi1TU1OlH+3vd1qPkmu2box66w7Zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TOeJaYEIP49u0lmzryVXn+orNKeOSNZwtb58Kr2SwY=;
 b=eSp265vLGSEsFVDLQgeEYVO5R9FtGtxjkoGFLwgWOhQDdNXdstafby+sfu4BGazYE80bTJreQidZLnHifUBA5Of8VVh8fzRxxMPFjlbBg4fZ48jgLKIBGWxalEvVRtKQVE1H//86rT0TcbjzTjqJML4qw8g8H+twtrgMEl0Ai6fDEvRWWw8NMfUtIzgnt+3iTUl+O2iwHYD2G36hXiMyiD2x4KftU8v+yGPB9gDtI+RbPs6mohM5Qpu6xDh2LcaIOxcSQAnQqiaFjxISyim8nwKhjC1TF7LvLHQzqiGFNjihj7bOJB2+xTU4jFCwDs1FTAluY3dzK/K//YMGQMPR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TOeJaYEIP49u0lmzryVXn+orNKeOSNZwtb58Kr2SwY=;
 b=QgvHKJJFeLqIWeVVZN04qmYQfJ/J5Hwy3WnnTZ20TCwqaBbfgP45H7GGXRL9saSOYB754ns6J7QmzFV0kLhCkBHf4WWNHOQkwIC7if2/lHrtAYOPcXaftDWjXzxoZs7rQ/AsKYf6/0k/OuNsQDV7GA+Kmf97i6uvYWjnidOn5V6pqVBK+ydhoEBxAbHmcXiMDoDl9tr3i1Yk11eNbLfftusUpLa0GzHhmOEtl+/KgkfH6YFcQfGWqe8GjZO9scn4Y7QfhxUQadotV8NcA3tVrKDDpCV4JVMGYo3svsGb6Fx75sEBZFBJXcsr/W4Npbxc9eHOEFxZRbm7w2OkMoqbIw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1885.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 05:47:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 05:47:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH v2 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index:  AQHZF9ztPi//ZqICU0+kVOYLIruL1K6qdjuAgAHJHgCAAF4XAIAZafeAgAeT44CAAAPGgIAAoMGA
Date: Tue, 14 Feb 2023 05:47:08 +0000
Message-ID: <67c1b908-877b-13d9-7e73-5a6ef396bed5@csgroup.eu>
References: <20221224211425.14983-1-pali@kernel.org>
 <20230122111631.dgw5uwtfjsqack57@pali>
 <22db0b5a-1b7f-a94b-1092-a314d57dedf5@csgroup.eu>
 <20230123200922.scnwgne3dsip24lg@pali> <20230209001507.nc2njllc32pjp2az@pali>
 <ceb80ec7-57cc-ba39-88f9-72fc8fa67930@csgroup.eu>
 <20230213201145.72uzxbghabuyugbu@pali>
In-Reply-To: <20230213201145.72uzxbghabuyugbu@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1885:EE_
x-ms-office365-filtering-correlation-id: 13388866-67c6-4926-e300-08db0e4ee900
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  z3hCq0rwBTyk1EYCUlGByW6tTspMAqpc3/njXWnebrgVAbF8DQu16kBr8EtXm/5a5PShtcRoC/cZusvKXxvQor5ff+XuLjRuZfg7SsdiIgcVNCkcc6JJt/eosgcGni/nyD9aT69FW2737qk0g84V/XXq+g972k1Aex0vP30wtbUOeWbjyHZMYjKBddSbttR+w+ZKOsUdL9KuXZKeuLB1Wp7ENPKA9hEQxA1K5YmL8YHgHMJNCsXVSK1QOKLhCUatHypQf33p+KLK1x04UfaRt6PmQ8oSdvRhxmEkILc/hrg5uL7yxHBV7Me63yYJPqVX+Rq9QdQYPgGvpGFIhhn4+ra53P9OxBGpDFGXXUvy4sFOdDyFv5x3OR6kDQpGLXxCVIYafC7IWONcWE82TZysN+UyHZyGF4pmyFlXeoAdmi6h4I7mRaXr2A0FuTk2S4ZZWc9mb5Z9U/XlsOAiBpQHO2rBPMIcviSA72S3VTN8e2xk6EFSKPaCAINV7Z/WlvI6Uy5d0Dgk3UbAek5ZRUirndztU5x34lJfMAMmfUhBcen3B8y1GzZ6nJOAA50nqjcDnmsvqWOdkooQIiPg/GJ7mjlIlbPcVbREskekp2nkjWPV69OUscuQkuGpu/OT7nEHVku605orGRX8lOG5Bmw1MXtTBi1uj8CvLBKCnCDy9KLTuIILQAp2V4PC9QKhGmwS3olqGTFS3C6lXhdI98hhF8PVm/tG8Oi9SPKM80UExZURMb71VFQpvuju+ZtFRo6LatpcVmsyXssm+d9w3nZjUg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199018)(36756003)(44832011)(2906002)(5660300002)(6512007)(31696002)(66574015)(83380400001)(26005)(186003)(38070700005)(2616005)(122000001)(66946007)(76116006)(91956017)(38100700002)(64756008)(8676002)(4326008)(6916009)(316002)(66476007)(8936002)(66446008)(66556008)(54906003)(478600001)(6506007)(86362001)(6486002)(71200400001)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SU1xRS9zZUVHbUR1SjEycXgxRldOTWhKT0FpTkM3Mm1ubUIraHlBcVJUWjk0?=
 =?utf-8?B?TWR6MzJzU1hsVk9TTlk5OW5FL3F6THc3QUJWUTNWeXJybDh1bmV1UXFuQmxC?=
 =?utf-8?B?VmpsU1V6WnRPU1lEZitJcllWcmlua05SNG80N0h1d3Y1T1ByK09ncXZkQ202?=
 =?utf-8?B?R1NVWGs0NHZidFoxc0Uvd2RINTlyVlFjT2RrdGMxRnhqVXpYaS8yNWhQT0wy?=
 =?utf-8?B?eEpIbTF6b3VEOXVabmt5REtWTEVjNVV6c0pGcnRFR05Qa0xkc1JaWVhQMC9H?=
 =?utf-8?B?TDh4S2x0TlF5eHFYZFhoYjY5bHRwQTUrbVEvY2VuclRhRjBWMS9JS25HTCti?=
 =?utf-8?B?VzFZYm9zSWxQSUx4eGxHTzlRaVpBaXQyZkxhQUV3SEx2cldCUFgrZjJVdXVE?=
 =?utf-8?B?NzFkQ3pMWVAzYm95b1JJMW5KVmxCT0ttanBiak5wbFAvZ25ldzhMV3dCdjdZ?=
 =?utf-8?B?Qks3RWlxTmpaVUJicmU3STBMQkhCbk1OUWRpZHI4Q1UvOEIvQitjM3lmM2c0?=
 =?utf-8?B?QTQzcHVtcmZHZ2FoTXozSXk4NWVSN1dveW1SeW1CRlRRaStya2JzVEUyRm1Q?=
 =?utf-8?B?RW5WMGNGNmhhQjNwQWNIU1VOOThscS96dXVla3FERThIb2NkR0NVNUIvYVBI?=
 =?utf-8?B?TmhkSEhoV3k0eUszK2dMSHI3SXV1WWFrY2haYTBpOXhaYk03bGlUcjV0Y1Ez?=
 =?utf-8?B?dTNvWEF2U2FkL0w0blVkVWNJUkFEWDJyTUFWTmhVeFh2emEvYndaTlE0aXdl?=
 =?utf-8?B?cnAzSS94QTBKYzIrTnZPSlhjQ2tDWU5sN0pCS1pTTzFhZWU5WVpBVTZnY3l1?=
 =?utf-8?B?Q05xb0NnTGYzbjBhM0xVYURDc01FaUQwZDJrY2hqRHdqS0tPNGp2MkZueTh0?=
 =?utf-8?B?eTBiVXpjZjZYSkZMUStHV0JMVDFFSnJCU3dzamFjb3hZSFpNbGtLaUtkRVVY?=
 =?utf-8?B?Z1hrUTV1Y3Q2dXNCeXhQMVVwQmxRSk9GUWVxMWMzaWViMXh3UTQvUGdvcTZD?=
 =?utf-8?B?VFRVOEp0RlZyckgxR3FHK05PamhpbjEyZGUrWHArdmZib0pCUG5jajFkYkp6?=
 =?utf-8?B?TlQvNG1WU3pTeWJTMU1JSDkzN0RPL2pVNnNPS2RpbVJwVmwxYjZlRDR4c3Aw?=
 =?utf-8?B?YTNYMk9QZzhJaFRtVkkzaWRFcW1ndGhrejBnb3VmOFlENExNWFlEMUMyZVpZ?=
 =?utf-8?B?UjgwYm1YNVBoYUFUYUlPVjNIT3JsRzBkeXZybUpvLzZkYy9GcWNubWsxQmMz?=
 =?utf-8?B?ZUtLZmowc01OcVdHQjhid0ZXMkxPMmdkVDJzOHFNYXl3T0RSWDNBeWpOTmJo?=
 =?utf-8?B?T05KbGVpRWVJWURaemJKSFREcFUycHpaaWhDZE5EMWJOamFUVVI5YUNuK1ll?=
 =?utf-8?B?MzY0K0h4UlM2ZFp4YzBkZzEzaE1zazJSandiU0hWMExjZkdBRDRnUTlKV3ZM?=
 =?utf-8?B?bm1HUktpNFlLRjl3S0RKNjNxbTUrVFlGV0R4NDlubTUwTnc0dUNzemlPclhJ?=
 =?utf-8?B?RU4zeFBpWHozM1Uzc2k0bTRzM1B3V0liSUtXTm9LcjBnemUrb1MyTyt4MHJq?=
 =?utf-8?B?Q2Z3TTY2Uks5Ny8vS0hhOER1NFo0RTFnV01Va1l4ajJRN1FVWTNtZUNaWVNR?=
 =?utf-8?B?c0kycnhKYXVnSmlTcUJjMnp1Z09RTnBHamtYRGcvSUhqQUVya09WM3lGZDk0?=
 =?utf-8?B?SU5jK2sxczFiREpkaEN2Y3BVQU1tWjRjRUhESUh6cU9iU2s5NDgvR2I5VVBn?=
 =?utf-8?B?enoyUzJWMHBFN1dQcFdLRzF0dGMwcjJieVNrNlpGVjczTEJZY09jZk9CdmRP?=
 =?utf-8?B?eVIyRWZ6Y3NDUm1JQVAvK0g4YzFxMnNWMjJVeGZoSkpvRUtza3VSNWJheitS?=
 =?utf-8?B?RXg1b3ZMTG5FaDFudWRZaVhma2puNEFXcjRVTGRraUVkQzVtUithWWY5RzBO?=
 =?utf-8?B?WGpzZW0xVGozbk82MFc1Q3BOSGtMSUMyNm1lL2pSRTcwallrS3RvT21CYzM3?=
 =?utf-8?B?Z0JjRC9JbFhLL0grRjluaXJZeUZ6THJoK2pmYy82dElTeW1GUzlkaFp3aFNr?=
 =?utf-8?B?S0dFczFzMVFwY3dTQkgrSkV3bUpGTGFXTHhGb2pBbkorNlNvMExwNjBob3M2?=
 =?utf-8?B?L2tpWVV3SXpIdXNBRFhXRU13TkxtdFBnV3RvUFZ4SHRxaWxtMDViSURUdDZt?=
 =?utf-8?B?NlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26078E9FE113844E9351ED6500564088@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 13388866-67c6-4926-e300-08db0e4ee900
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 05:47:08.2288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0r/YzYShYlhMZvTnWYHOChwuj8Dx8UOXb+gcAv8Wf644BbmH7qq62XUBZeE8o6SNDcxdt2WN5Bmw1HH+swEdQKauD+pkIzbK+29q31RePE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1885
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzAyLzIwMjMgw6AgMjE6MTEsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IE1vbmRheSAxMyBGZWJydWFyeSAyMDIzIDE5OjU4OjE1IENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+PiBMZSAwOS8wMi8yMDIzIMOgIDAxOjE1LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0KPj4+
Pg0KPj4+PiBUaGlzIHBhdGNoIG1vdmVzIGFsbCBwMjAyMCBib2FyZHMgZnJvbSBtcGM4NXh4X3Jk
Yi5jIGFuZCBtcGM4NXh4X2RzLmMNCj4+Pj4gZmlsZXMgaW50byBuZXcgcDIwMjAuYyBmaWxlLCBh
bmQgcGx1cyBpdCBjb3BpZXMgYWxsIGhlbHBlciBmdW5jdGlvbnMNCj4+Pj4gd2hpY2ggcDIwMjAg
Ym9hcmRzIHJlcXVpcmVzLiBUaGlzIHBhdGNoIGRvZXMgbm90IGludHJvZHVjZSBhbnkgbmV3IGNv
ZGUNCj4+Pj4gb3IgZnVuY3Rpb25hbCBjaGFuZ2UuIEl0IHNob3VsZCBiZSByZWFsbHkgcGxhaW4g
Y29weS9tb3ZlLg0KPj4NCj4+IFllcyBhZnRlciBsb29raW5nIGludG8gaXQgaW4gbW9yZSBkZXRh
aWxzLCBpdCBpcyBleGFjdGx5IHRoYXQuIFlvdQ0KPj4gY29waWVkIGFsbCBoZWxwZXIgZnVuY3Rp
b25zIGJ1dCB0aGlzIGlzIG5vdCBzYWlkIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCj4+IEkgdGhp
bmsgaXQgc2hvdWxkIGJlIHNhaWQsIGFuZCBtb3JlIGltcG9ydGFudCBpdCBzaG91bGQgYmUgZXhw
bGFpbmVkIHdoeS4NCj4+IEJlY2F1c2UgdGhpcyBpcyBleGFjdGx5IHdoYXQgSSB3YXMgbm90IHVu
ZGVyc3RhbmRpbmcsIHdoeSBJIGNvdWxkbid0IHNlZQ0KPj4gYWxsIG1vdmVkIGZ1bmN0aW9uczog
anVzdCBiZWNhdXNlIG1hbnkgb2YgdGhlbSB3ZXJlIG5vdCBtb3ZlZCBidXQgY29waWVkLg0KPj4N
Cj4+IEluIHRoZSB0d28gZmlyc3QgcGFnZXMgeW91IG1hZGUgc29tZSBmdW5jdGlvbiBzdGF0aWMs
IGFuZCB0aGVuIHlvdQ0KPj4gZHVwbGljYXRlZCBpdC4gV2h5ID8gV2h5IG5vdCBrZWVwIGl0IGds
b2JhbCBhbmQganVzdCB1c2UgaXQgZnJvbSBvbmUNCj4+IHBsYWNlIHRvIHRoZSBvdGhlciA/DQo+
Pg0KPj4gQmVjYXVzZSBhZnRlciBwYXRjaCAzIHdlIGhhdmU6DQo+Pg0KPj4gYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy84NXh4L21wYzg1eHhfcmRiLmM6c3RhdGljIHZvaWQgX19pbml0DQo+PiBtcGM4
NXh4X3JkYl9waWNfaW5pdCh2b2lkKQ0KPj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3Ay
MDIwLmM6c3RhdGljIHZvaWQgX19pbml0DQo+PiBtcGM4NXh4X3JkYl9waWNfaW5pdCh2b2lkKQ0K
Pj4NCj4+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2RzLmM6c3RhdGljIHZv
aWQgX19pbml0DQo+PiBtcGM4NXh4X2RzX3BpY19pbml0KHZvaWQpDQo+PiBhcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzg1eHgvcDIwMjAuYzpzdGF0aWMgdm9pZCBfX2luaXQNCj4+IG1wYzg1eHhfZHNf
cGljX2luaXQodm9pZCkNCj4+DQo+PiBXaHkgbm90IGp1c3QgZHJvcCBwYXRjaGVzIDEgYW5kIDIg
YW5kIGtlZXAgdGhvc2UgdHdvIGZ1bmN0aW9ucyBhbmQgYWxsDQo+PiB0aGUgb3RoZXIgY29tbW9u
IGZ1bmN0aW9ucyBsaWtlIG1wYzg1eHhfODI1OV9jYXNjYWRlKCkNCj4+IG1wYzg1eHhfZHNfdWxp
X2luaXQoKSBhbmQgYSBsb3QgbW9yZSAgaW4gYSBzZXBhcmF0ZSBjb21tb24gZmlsZSA/DQo+Pg0K
Pj4gQ2hyaXN0b3BoZQ0KPiANCj4gQWZ0ZXIgYXBwbHlpbmcgYWxsIHBhdGNoZXMgdGhlcmUgaXMg
bm8gbXBjODV4eF9yZGJfcGljX2luaXQoKSAvDQo+IG1wYzg1eHhfZHNfcGljX2luaXQoKSBmdW5j
dGlvbiBpbiBwMjAyMC5jIGZpbGUuIFRoZXJlIGlzDQo+IHAyMDIwX3BpY19pbml0KCkgaW4gcDIw
MjAuYyBidXQgaXQgaXMgc2xpZ2h0bHkgZGlmZmVyZW50IHRoYW4gcHJldmlvdXMNCj4gdHdvIGZ1
bmN0aW9ucy4NCg0KT2ssIGZhaXIgZW5vdWdoLCBidXQgdGhlbiBwbGVhc2UgZXhwbGFpbiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB5b3UgDQpjb3B5IHRoZSBmdW5jdGlvbnMgYW5kIHRoZW4g
dGhleSB3aWxsIGJlIHJlLXdyaXR0ZW4gaW4gZm9sbG93aW5nIA0KcGF0Y2hlcy4gVGhhdCB3YXkg
d2Uga25vdyBleGFjdGx5IHdoYXQgd2UgYXJlIHJldmlld2luZy4NCg0KPiANCj4gTWF5YmUgaXQg
Y291bGQgYmUgcG9zc2libGUgdG8gY3JlYXRlIG9uZSBmdW5jdGlvbiBtcGM4NXh4X3BpY19pbml0
KCkgYXMNCj4gdW5pZmljYXRpb24gb2YgcHJldmlvdXMgMyBmdW5jdGlvbnMsIGJ1dCBzdWNoIGNo
YW5nZSB3b3VsZCBiZSBuZWVkZWQgdG8NCj4gdGVzdCBvbiBsb3Qgb2YgbXBjODV4eCBib2FyZHMs
IHdoaWNoIHdvdWxkIGJlIGFmZmVjdGVkIGJ5IHN1Y2ggY2hhbmdlLg0KPiBBbmQgSSBkbyBub3Qg
aGF2ZSB0aGVtIGZvciB0ZXN0aW5nLiBJIGhhdmUgb25seSBQMjAyMC4NCg0KTm8sIGlmIHRoZSBm
dW5jdGlvbiBhcmUgZGlmZmVyZW50IGl0J3MgYmV0dGVyIGVhY2ggcGxhdGZvcm0gaGFzIGl0cyBv
d24uIA0KTXkgY29tbWVudCB3YXMgZm9yIGZ1bmN0aW9ucyB0aGF0IGFyZSBleGFjdGx5IHRoZSBz
YW1lLg0KDQo+IA0KPiBTbyBJIHdyb3RlICpfcGljX2luaXQoKSBmdW5jdGlvbiB3aGljaCBpcyBw
MjAyMCBzcGVjaWZpYywgbGlrZSBhbHJlYWR5DQo+IGV4aXN0aW5nIGRzIGFuZCByZGIgc3BlY2lm
aWMgZnVuY3Rpb25zIGluIHRoZWlyIG93biBzb3VyY2UgZmlsZXMuDQo=
