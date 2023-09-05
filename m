Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFAA792052
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 06:48:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dMSkIWGh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RftKq2tFdz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 14:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dMSkIWGh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RftJw0Kwyz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 14:47:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjD6ej2Dp71SGbNsJfMEREgeToUBJPgkcvCSwY/nxdKl+T8UjRC6plHemk0JwAFnpT5s5ySyRwz0fXXLm0HmRN+aiXqju8HYvfckamoW9xZrpT3BHUwLoyxNER906lrgQfvIZI0CLvbqF7+QsnIyojvi1h7wqs8+Z52IsZjpYnoeZ+m6B4gzA9nejOk2bxmgyzIx8gPDQlikBEgrcvhF9uHsmM3QN/0kszHZhGyiiSujTpacr7PB8VL2cS1YKaewcxObo+r4JlMXRQJLe05FYXij6byoCo0BwUz5mUdPtdk53Zqt189zJE/ohI7Fw3T4+IDpHLMFiZVod4XI4up/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgIyWb9cetCQgEs2dbd+YP/muRFeq22Q7M13AjGozM=;
 b=TfCFZI+wvfoC9/yElBQ4Z5ruYKBZBcsA0k+rRe3dqS38eNojvbJdsR4/iNqymrRc417BYcopoLml1AvuDnJUNCEQKIPFXphevyCAJd0ydK3F5vXUDqKim0QuUMk1h6XSB15LcOosRb8ufUxA6H1CRWWHv+rjq0qlCBQ6pLu5Lsdo96NY7iysIXRoxDCXbJxXZhkIT7SxLjsxqAxqsOVFpgUzZItvhTp0NMXhUPZoHkje7wmbyPG1YQDwYbGtidb2X4uBb8Lc9CNn7Fe4YyKF2Hh40smt+0bS40ZixOOvOq/Zj0iGbduFSCot08MknGkM/oE2XSpMrMGLJJ05KPEgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgIyWb9cetCQgEs2dbd+YP/muRFeq22Q7M13AjGozM=;
 b=dMSkIWGhWHROl4G8dMlXVgur04MecWhYzfF+io5qZCMNIWEoyXNVCh0t8GNQZv766XWyanLPzip5D+eITyNOeXJjuPO4UOmi8TXwfiUpCy/+O7SWPwT8JPlnBSb2ESMUzN/QYtoccXRf2CAtFrUO+9jluuVyk2e6p8jXk2v0dBFbmMlyEgCLwhXPf6wl33PGT8cMVMuCY/NGLnkx4QT7VLn/Hy6STtpWIT3XEXI7GpEzn5kFQqx4rg19MZ/2AjVqndbrqWjfMMqfmP6WVo7TzWpMcnAMOQIJ1Pkqk6d4nXuj0fz8GML670chHdRIsxyYIJlfWWOzO7cuAOAREP8jNw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2464.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 04:46:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 04:46:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64e: Fix wrong test in
 __ptep_test_and_clear_young()
Thread-Topic: [PATCH] powerpc/64e: Fix wrong test in
 __ptep_test_and_clear_young()
Thread-Index: AQHZ3ZWvgclbkC122kmCn9+H/csT2LALiGkAgAAkXgA=
Date: Tue, 5 Sep 2023 04:46:47 +0000
Message-ID: <57fccd67-39c7-f5c8-ce9c-a6e390ca5d5e@csgroup.eu>
References:  <2daed51109cbd7e7fbd26fab4e77fc6a27dee63e.1693643773.git.christophe.leroy@csgroup.eu>
 <87a5u1ibwr.fsf@mail.lhotse>
In-Reply-To: <87a5u1ibwr.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2464:EE_
x-ms-office365-filtering-correlation-id: e0c37841-4a37-48e3-6c4e-08dbadcb1ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1FlcsB95c+e1Xi0nbXS8GT0/bn3v+j8WJzkxbuAzRr+gv60QRKlf0Paaqm2Fq2Ypk0yMBGQ0EM+9kgiR52jXC7FA0ghDGACHdfoMTacwuNnCnhOcj6TgEoO7Mw8hg47Lchrr2EjcnqZFkO6yM7nfnl58O02KoXpDdFGNw2zkygw0iZSf+6XyU5sWboTVsqtA2c1YHBiPEHpwtNGFTUC0IaYmBm2JgDRxTqt3evA6VRCnnB/jgIGdbCsioPCigp/ZpxAziBmY6ZHIumPjJxsnqx5Vr9NzST2u2F8A8stDyttFfAU6xjBj2S5cW3eAYEHIZSeXEDSwb9TeaoeR/CO6uTnTokrbQdQct9M0VW5QPU50U/B1xWZwhmVAC0ZURdINUuVg7kqL/6TKbQNldT4F1I3d8/b0Kk9lD6xK8OnxyoVDhnATXcg7kW5mA85C6J8LF8iK8a7rt3BsHxTrX+XFAL39NraHdj37J8nAnN57h6YfX2sg/F2GtLFpSetDhEqfseFs2A0ijbcgLuykw7cYwSRCJXFJCBpisS3DFJ+Iz7muCIq68Pvw69dJ4kbHUIerXgg1L/4I1NcHFFEaXiuUYEmMDIYmC8B1kRRxxbFVTwyNywimhCZElRBOYiEigjWSRBm8VBpQDSSGxjueoDLDExuKxl3S43MiN+MGIMKKHnU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39850400004)(451199024)(1800799009)(186009)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(110136005)(91956017)(122000001)(478600001)(38070700005)(38100700002)(316002)(2906002)(86362001)(31696002)(41300700001)(8676002)(8936002)(4326008)(5660300002)(44832011)(83380400001)(6506007)(6512007)(71200400001)(6486002)(2616005)(26005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dytLK0JFWU5RbkxRVWpHaHZrL0dwTHo4d20zQ1U4RnhhSFNWOUNVWGY5dUNJ?=
 =?utf-8?B?US9vazcxdW9XQ2tpTmhnWU1ON3kzZTRibmx1cGF4N1NqUHc0R0FESnlMZUU4?=
 =?utf-8?B?N1MzSVNCdDRhZ3JVYldTZDMyQ3o4Y25uOW9HemNhb1Nxd013UUxGMVN1YjFO?=
 =?utf-8?B?WW1Pb05nSDdiV3RtRW9qQVR2b3Q1Z28rclhOYjlWRnhhQkt5NFpaQ0k3dlZ3?=
 =?utf-8?B?ZzQyZWplektONlI5QzBkTkEvTW1hWWYwNEYybWdDSnkvVkl4bWpsN3VQeURK?=
 =?utf-8?B?NTZmN0FjNHpXQTVxa0kyUlpUbXJhR2JYdkVjeERKWlRWaDdHSmcybE8vclZm?=
 =?utf-8?B?NXFtc0ptdEZnWENQc2RzSkxodnRCQXZ5NEVaSDBDMmRRc2llbk1ndHdVVk1Y?=
 =?utf-8?B?RlFCcWFwNHpTck9qZ1JoLzNmVjhYcW0xV3BxTDEwQ3pKbU9GUGthL1ZIeVVC?=
 =?utf-8?B?UElvdWRHcjlXTnhtL1czRThRYjhHT2Y5YzJqRGdZYTVETFJYMWZUWGNqbzFl?=
 =?utf-8?B?NTBEb29XOWxaVEs3QmVkc2hSUms2ZHBHd0ErTWw4ZEVhdkFHL1JRMzhtMlJK?=
 =?utf-8?B?cXMyR25hcmJFemJZSDkrcTVUaWpFVUYrVG5vdU5KZzBWRHczd3AzcWFGSEk0?=
 =?utf-8?B?TTQ0aDUvc1R4Q0dlTVBYREd6c1lvU042aFdEOENwVE4vZ1g2cEJidHArdmsz?=
 =?utf-8?B?QkowU3Fqam50Z0huYXN4SzgxL1FUR1A0U3NOQlhqenMwUjQ1WU9jSFY5Nldi?=
 =?utf-8?B?T3pKODBOb0RxWVIvYVZSVjZXRFg0N0xhWm5pOXUvMFVHSERNQWgrd016eUZn?=
 =?utf-8?B?bnBUeHM5MWFLQWhEUDBXWEoya0dqNThPUmVhbnkzaVc0bEpQcDFkYVUrR3dP?=
 =?utf-8?B?NzJqeTZ6S1JnRy9obmdWa1RrY2ZDWG5qUG5Sdi9URnYwM28zMnFGV28zaG1U?=
 =?utf-8?B?OWlDM0E4QVZDY0szb09GR0FQNzZTNE8wQ1ViVmJyVitBQ1NHbHhwTk5LdC8y?=
 =?utf-8?B?TkpqTklCQzd6VGlDNWpyaDZMNTNmZUdCdXovMmRlVlFwR3hnaW9FcitLT0g3?=
 =?utf-8?B?VklybTVFU211eVBLL3c3QnlNZnVTUzlsUVlJTzNocml5K0Y1a0VDVFUrLzRi?=
 =?utf-8?B?U2FpWmlybDZHWG1XYmZnQXdBdDZQdjY4TXFpamYvb2dmNjRiSkt6YnJDcDh2?=
 =?utf-8?B?R0llSlpvQ0h6TXZwcElzRkpsUEh6bEF6L1BRUG5BOFBpQVhhZms1VkxKVTg5?=
 =?utf-8?B?WXhpeHV5UEdlWDVKcGVoL2QvK3lPbi9XM1o4LytzYThMVnhkRTVsNi8vckNn?=
 =?utf-8?B?ejc0bWhKYUp4LzhPdUprR1hscEI5NFhVbnA0V2JhaXZUK1J6VTByR3VkYkcx?=
 =?utf-8?B?R08xT213RXZMTDJoZ2lUc3lqU2dYaU9RVlNueGJvbzgzNWxtQS9zQ0Mvalg3?=
 =?utf-8?B?bnVUZ3BLd1UyS0MyTmhxdUUrTC96OWwxTEk3U3BrM0h4ZkN1b2hFajFvQUdq?=
 =?utf-8?B?anJsMXhXVDVWOHVNa3M5dW03Ujd2am5NRzU0YXJLTUE1VUFjRjNJb3g4MEZI?=
 =?utf-8?B?cnF6eWNzMmdBTHdmUmdlSHdWSHZ0UStoNzJwdkhCTzJtK1FpcXQ5bG5Na0Zk?=
 =?utf-8?B?UWpqbzJ3OGhYT21nT2xKQTN2bUh4Sk92TFlRanlKUUVEZU9Dd2VxaDZUWll6?=
 =?utf-8?B?djBYSWx3a1FCSGE4MXh3SVo0T3FpRWcrRU04T3JTZ2UxamVyZ2pVOWpYUmtZ?=
 =?utf-8?B?MWUwRTNqMkdFQW1vK1BLNmg0SnZ6ZndzdEQ1Ri9IZzJyeWxkUmxnTXVvVU42?=
 =?utf-8?B?Mmd3Kzh5bWZsUlBEeHdBQW9RaDZjQTlaRG1jbEw2RXVQRHlnZ3RpdEpHMmlh?=
 =?utf-8?B?SGNqSzdiYlJyYUdSUWkwT0x1VHVRN0lHbFdCaGFvS1dqK2lHVzYyRXkzeDU0?=
 =?utf-8?B?T3UyMndLcnNkdnlsVDVnSkFsV1k4OUlUaGFNb3RvZ0xGQjhOTm9DWGQra3p2?=
 =?utf-8?B?NFhNYU9MNlRKc21BMklqaG1VelFXRXZBM2ExODcxZ01wNXJteklDQ1dNeXYw?=
 =?utf-8?B?Q0g4NnM2L0liaU03Q0IvSC9mNkJQVzVNSW9ZNTlER3dyc1ExZklKTUlmK0xh?=
 =?utf-8?B?OHhadjIxY1Q2c2dCeU1wQ3BLRW1pU1hBMGpzQW1BMGV2dkI1dE1zbEtuMElz?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B72DB024C4DD8E499C9FA528A87D3AF0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c37841-4a37-48e3-6c4e-08dbadcb1ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 04:46:47.7381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UObeSsY/9WV8EYa3aU16wbdIsygYgWqK49nHtLsuhSJcGdSqCimb8wshaemrt1VkhXcM3lHlgfrtNK1VT+q+yhazNvGeFXW0z7VbSGcjVA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2464
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA5LzIwMjMgw6AgMDQ6MzYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBDb21taXQgNDUyMDFjODc5NDY5ICgicG93ZXJwYy9ub2hhc2g6IFJlbW92ZSBoYXNoIHJl
bGF0ZWQgY29kZSBmcm9tDQo+PiBub2hhc2ggaGVhZGVycy4iKSByZXBsYWNlZDoNCj4+DQo+PiAg
ICBpZiAoKHB0ZV92YWwoKnB0ZXApICYgKF9QQUdFX0FDQ0VTU0VEIHwgX1BBR0VfSEFTSFBURSkp
ID09IDApDQo+PiAJcmV0dXJuIDA7DQo+Pg0KPj4gQnk6DQo+Pg0KPj4gICAgaWYgKHB0ZV95b3Vu
ZygqcHRlcCkpDQo+PiAJcmV0dXJuIDA7DQo+Pg0KPj4gQnV0IGl0IHNob3VsZCBiZToNCj4+DQo+
PiAgICBpZiAoIXB0ZV95b3VuZygqcHRlcCkpDQo+PiAJcmV0dXJuIDA7DQo+IA0KPiANCj4gVGhh
dCBzZWVtcyBiYWQgOikNCj4gDQo+IEJ1dCBJIGRvbid0IGtub3cgb2ZmIHRoZSB0b3Agb2YgbXkg
aGVhZCB3aGVyZQ0KPiBfX3B0ZXBfdGVzdF9hbmRfY2xlYXJfeW91bmcoKSBpcyB1c2VkLCBhbmQg
c28gd2hhdCB0aGUgc3ltcHRvbXMgY291bGQNCj4gYmUuIFByZXN1bWFibHkgbm90aGluZyB0b28g
YmFkIG9yIHNvbWVvbmUgd291bGQgaGF2ZSBub3RpY2VkPw0KPiANCg0KVGhlIHR3byB1c2VzIGlu
IG1tL3Ztc2Nhbi5jIGFyZSBhcyBmb2xsb3dzOg0KDQoJaWYgKCFwdGVwX3Rlc3RfYW5kX2NsZWFy
X3lvdW5nKGFyZ3MtPnZtYSwgYWRkciwgcHRlICsgaSkpDQoJCVZNX1dBUk5fT05fT05DRSh0cnVl
KTsNCg0KU28gaXQgc2VlbXMgdG8gYmUgZXhwZWN0ZWQgdG8gbmV2ZXIgaGFwcGVuLg0KDQpUaGUg
b25seSB1c2VmdWwgcGxhY2UgaXQgaXMgdXNlZCBzZWVtcyB0byBiZSBmb2xpb19jaGVja19yZWZl
cmVuY2VzKCkgDQp3aGljaCBpcyBwYXJ0IG9mIHRoZSByZWNsYWltIHByb2Nlc3MuIFNvIHByb2Jh
Ymx5IGl0IG1lc3NlcyB1cCBzd2FwLCBidXQgDQp0byB3aGF0IGV4dGVudCA/IHBwYzY0ZSBpcyBm
b3IgZW1iZWRkZWQgc3lzdGVtcy4gRG8gZW1iZWRkZWQgc3lzdGVtcyANCmhhdmUgc3dhcCBhdCBh
bGwgPw0KDQpBbHNvIHN1cnByaXNpbmcgdGhhdCBpdCBpcyBhbHNvIGNhbGxlZCBmcm9tIG1tL2Rl
YnVnX3ZtX3BndGFibGUuYyBzbyANCnNob3VsZG4ndCB3ZSBoYXZlIG5vdGljZWQgZWFybGllciA/
IEknbGwgY2hlY2sgaWYgaXQgd29ya3MuDQo=
