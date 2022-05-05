Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7547951B944
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv5BX399zz3fKc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:37:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv55M2gxdz3f9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:32:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWHe8g/mefVtU+BnsTQzBueL6x0zAtHwkrys5yKbrnYnp2BBiBPOz28fJEusEH3MMCY3eB96knoN7ZDsjbgk7/xFbmqmhM1Ftvvf1Uo9AlXT2Qv3fe2gVX6nSP7SU6PUm8decGjWdb1q/JOs94E2jYK0tfPpycv/pMqcuNIcRRhpFZHrB8GbkNUwkCInPvHODbRE/HedApPDXfmV3dlZhDeTCLmYod3S+aEjpgSP0ltNjOs25KqrGZhXHq+Ri8G8UcG0mx9mMZc7RdAUc7NTNqpj2l8Lglbmp1DPtEfY5Q4cjIj0LRrzUdHd9Q7MwGz56EATAF6NhRpYICgr4hpyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6dpUdyL6Ki+nmSDw2rMOFadGvA1efPEMgz4RnsxhSQ=;
 b=mwecFeVZwnUNAg0yJwP2v4sRyI5lYK9hWc29aYjLTDiTArPEaAfWTbv1AM+98o9rtBhQJeBpG0+yF0Ul7ekoPChSmJ4mV8btmCye0oqN9fQkXi8eOpH7XfarkgAHrxrLQNGsBIWL/ozl3vwC/6n3T8uz9dwNRrqY4Ii+rp+LHJQVhI2a83xcihJ8kDV+JKJkgKdUrsm8akM+08JFQoBwYMCkhxDABt3VavvAVrCSdKor9eAsS97OWO5H/9roWpk7AOtIbV7Lj3ba4ui5+QvL2sdwFhJ6TU+W5G4MpGPzihB5BafGGGuHUN0/AFCaRU2G+oFbQB9JATpFnTZt+tMuQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3767.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:119::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Thu, 5 May
 2022 07:32:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 07:32:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Nathan Lynch
 <nathanl@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>,
 Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, YueHaibing
 <yuehaibing@huawei.com>
Subject: Re: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
Thread-Topic: [PATCH 2/3] of: dynamic: add of_node_alloc() and of_node_free()
Thread-Index: AQHYX/RHv2BAytL4UEOxLfEYXW8Tbq0P5KkA
Date: Thu, 5 May 2022 07:32:35 +0000
Message-ID: <0d897c1b-d9d6-188f-b426-8f1ceb79eb63@csgroup.eu>
References: <20220504154033.750511-1-clement.leger@bootlin.com>
 <20220504154033.750511-3-clement.leger@bootlin.com>
In-Reply-To: <20220504154033.750511-3-clement.leger@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3207940f-4892-4549-07b0-08da2e696cac
x-ms-traffictypediagnostic: PAYP264MB3767:EE_
x-microsoft-antispam-prvs: <PAYP264MB37675B1C773DFFB07788EBD2EDC29@PAYP264MB3767.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xysLlt+Cph4L3G7CkMLlDiIaYe92wYsi2Vk08C2gx0QUshxe298dBLUIS52ViCeq25kOgOpeJitscl8XC1yWlOELiCyZq3yFqaElYK6gspp8NsfVXg14b0j59q9WBGIlA9PmYOMFtLVKpZx6nOYhwJcOznM1HUQB8HxdYZvqtJz0DkWOgOXEUGJ+WDPUTfBmfoujax3POvzneG4afnZnSEI1lbqwSLhCdgicB39VhBF8srE5/DvzASEXNxK49mSnYL9E+aHynHIKJbFX0iGft1iLjT/q8z7EyRbbgq6IOzknGLmi8M1la3tgsVhqwtpzoHAir0O2dUTC8JR2FkymPkvW2dKe9IIPRop6kTBtQOL/YJ1ClqNKr3TjU5wScgVtzc1tM/GBssGFrn9qVz7U+YXtfMEoTVvWEsq9+0qhDldIJtIPucSw8zSShwy9vKx0+rrHaNQx9etURkKFvgvfv7WUFALA6aNu2EO9ZbKOFQnA1OUebSUqAGiwQRBKYTYIwq9XSKG2oQku97kQhXCVpgT94fxVgsswmaCrDWjLoHguF1xkedURqH9rGjBPHyeBpMdCnyGMUhPixEAITqsKJIab9MFE63vl9xTK4iHx/9tBC0LvEsYFUEFSx78BG/B5Glv3X6jERmxuIVlVaU00ciD7qk/Cn+4eTl/hQsEek4nxjIjzfzi2p80tXP1FiMMqmYiGTnVUl5iG3DPB80AB14fFBeRKVEH8lsqqSVc+Lj3Muenh0yNDW39gpgw1tsDRDdt7jdmWLXyFEvrF7C+gpBrQLeMsBUIL3xQUOrCPELs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(66574015)(122000001)(6486002)(186003)(110136005)(508600001)(66556008)(76116006)(66946007)(66476007)(64756008)(921005)(86362001)(31696002)(91956017)(44832011)(2616005)(8676002)(2906002)(6506007)(4326008)(5660300002)(8936002)(36756003)(83380400001)(38070700005)(38100700002)(7416002)(6512007)(26005)(71200400001)(316002)(31686004)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkprS0RocVpKUlNXZC9EOFZoUDZ3RU9KWGh5bUNWVHZJVGk5NTBwQVR0RjRa?=
 =?utf-8?B?cjlESENiVS9zMjI0TUVzSGVJUUNlbDJJditGaHhxWVByTytZUFBLemdaeVd4?=
 =?utf-8?B?VHZUV1dxL0VkT3J0MHFadk4xTi9LN0VuNllLa0ZzZ0ZvbmJnRXdJUkE1U3E5?=
 =?utf-8?B?UC9WR0xCMGpickZaRHpXUm5MeFdLTVVCVUdNOUZtdEJzMHJkd1gwUFhsRit1?=
 =?utf-8?B?bWRjTDc0aVJCN3dhZFBONUFnenRhdCsyUHZ3RHZRamNXN3FtdGlGZ1A4M0ZY?=
 =?utf-8?B?N1RwY3JITG4xcjFlZjNzaFlGeEFzQlpLZjU1VFdrcHNSamk1T1ErcEh6ajNS?=
 =?utf-8?B?U1h0Yk1KcDRPU2NOb05MRWl0NjRjSEtkT0dLRW9kbjhrYnBDQjBrNElzQ0tj?=
 =?utf-8?B?KzU3NWZjc0wxY1RWVkIwcEs0Ti85akxLMHhIOU8vTFZlNXNock9QL29wVmdK?=
 =?utf-8?B?b21hTk5LK3VzRnhOS2g5d0ZBNmdaWTVHcGwwU2NhNFREZW5HL2FBd2tYc05G?=
 =?utf-8?B?TkpHRlphOG5lTStyWHJlYkRUK3JMMWR3cllPeHZHM1pqSGVLYWV6REdpeFVF?=
 =?utf-8?B?ZFlKclVzU01TTTU0a2hQMTRnaDZMcnZnSjU4THBxY0M5Z0ppZHFxRXlNOUtS?=
 =?utf-8?B?ZExOTVJEVFFsMktVWDZjbTJRUkViUE1YNVZZVVNBdzJ6Z2JzVTZRN0JOeHoy?=
 =?utf-8?B?MUVlYm15VEh2WStnSzRLREZFUVByUGgwWSt3N2lPdUpTanJLNG5rZSthV09J?=
 =?utf-8?B?ZDFucGZJSE5iWGJncFNTUWRhVmhpMzNHWEhoUXpTclB3ZmF1Wjk3WnBBdDJ0?=
 =?utf-8?B?amlQSUpIeWluSTBjMzFZeHpTZzV3YzB6UDVKbVRiMjVSbG1qR0JWSWQ5S1ky?=
 =?utf-8?B?OVJkL20zeisrYU4yQmkyejloZ0FJaHNJM0JPK3NwY0xaNi9uMlVSNVVYMVBw?=
 =?utf-8?B?MCsxaHdlTDE0T0JpWk5iQlF2MjFJSTZnN1VieUFFdExkSGxTeHNEY3V4bi9N?=
 =?utf-8?B?bkVzNzVnM29jYW9NWWxIcGxOTmpPWEg3Zk5ESWpTdG9Bemxvbi9ZUXJwSTlt?=
 =?utf-8?B?UDdJUCtTa2dUM25NTzlqOEk5NW1VRFlJU3NnQjE0UjRieEJ0R2xJenpVL21I?=
 =?utf-8?B?VS94YjVrd2NTYnRHU21NUXVhbzJ1MnN3WVRGazM4UTVDdWlnZ0NlSjJaSWNr?=
 =?utf-8?B?SHRuN1JFdnMyRmFUSzg2N3BJQ0FwTW9GNDliVnl6OElKNnZxVjNPUTNDOTVG?=
 =?utf-8?B?enVodzRFeWNyVnVhM1Z3M0lhZkxtb3lVOGhRenlrekMrNnFBa01sK2Z3bVhs?=
 =?utf-8?B?cUlIQm52ckpsR1dNYnI2aWhFTFlGMkZETUFkRzMxM0kvK09jRm1vN1Y5UVdD?=
 =?utf-8?B?NDJ6QVZzK1VORnFwZjY3b1VPbUxJT01RUXp5dGZzNXBsNnNScGM3WnJjcERQ?=
 =?utf-8?B?aDhCUUw3Vnh0QTdMamxWczk4am82Zk11MGZHRGYwL1pUYk1PbW5Tamg5MDEy?=
 =?utf-8?B?Z1d1eTNLWDdLeTJqMU4rTE5qeTNrbkduMmJMa2xidHYrMUFXVDlIUTJwZ242?=
 =?utf-8?B?azFVWVZTT05waU1NTk93UzFhYm9ra3AxazZmOS9SYnJ4bnFGcGRRTlRPUUNF?=
 =?utf-8?B?YVFGZEpLaEhmTkpCODF3RDBqK2pEUmxoSUFzUTM3SlhsSmFRdTdpQVlhMTRR?=
 =?utf-8?B?bnZITXM2NHRMQVBiWnFPWGJwRkhsT2Yxb0MvcjhlNksyZXkyQmlXRkdzUCt1?=
 =?utf-8?B?cmQvS1lld1dZWjdtMU1JbXNCM1J1T2FWZG1TYm5WenZJSjVLTExCeTdxb2ZS?=
 =?utf-8?B?K0RCTVVtVXZlZG02VGxMN1pCbzd3UTRTQzdaRitacmlMY2tpSFVoalM2RlhQ?=
 =?utf-8?B?WG5yYjFSMjk3cFA3WXV5eE1vOWtyN09SRDFDazRwdE5wTERjaE5nb2l2VUVl?=
 =?utf-8?B?Rnp4cStIOU05TXFEbUJ6YW80bEdUbjR3NHlkR3FjN3kxdTE4SUVIeU9YeW1V?=
 =?utf-8?B?aWh0aVIzQy9BQlQwVTJLdUJseG5Yck4rRE05cFVaRjdndlVBVVNtWjVOSFZC?=
 =?utf-8?B?UHZ3b3ZNSnhidmQvU3hjOUxaTzZrZWNsYjV6YjZNL2JVZ212VHF5WktWVVds?=
 =?utf-8?B?Mks2d3R3L1FTVTlxSU04M3RISXQvbFZxRi9BV0hHMVlWOUFFOG9JTms0Tm0y?=
 =?utf-8?B?Zi9tcjVvRU9YbWZ5c3ZUV0V5V3dWSkJLd2tlSGJ3NG5CSitGc2N6QVRVMkJH?=
 =?utf-8?B?WDI0c3d1YWNyWmNtRDg2Umd3QitqUTlzYVhyTVVLdGtSeWRIWmNnZGlsTEdZ?=
 =?utf-8?B?OG9ZQ1dRL1RNa0c1L01JVEN6K1Avai9mZVdIblQ4Lzd1THZBTXJZT3dVZXpz?=
 =?utf-8?Q?R8q9szezRzF6cbdRAQH82r4YWGCETqlt6GF4u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45E60A9572201B419027B983631492A9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3207940f-4892-4549-07b0-08da2e696cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 07:32:35.5847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJ2hx84J6zv7+jC48xvBDqKMfcE4KuxHnB/VzgvXY59HPLUZP0dIv739v/X2Dh5pfa06ECOJdjAbaYg24JXpBCPbzAMz9YxgRfs7r9j79IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3767
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA1LzIwMjIgw6AgMTc6NDAsIENsw6ltZW50IEzDqWdlciBhIMOpY3JpdMKgOg0K
PiBBZGQgZnVuY3Rpb25zIHdoaWNoIGFsbG93cyB0byBjcmVhdGUgYW5kIGZyZWUgbm9kZXMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxp
bi5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvb2YvZHluYW1pYy5jIHwgNTkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gICBpbmNsdWRlL2xpbnV4L29mLmgg
ICB8ICA5ICsrKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvZHluYW1pYy5jIGIv
ZHJpdmVycy9vZi9keW5hbWljLmMNCj4gaW5kZXggZTg3MDBlNTA5ZDJlLi5lYzI4ZTViYTI5Njkg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvb2YvZHluYW1pYy5jDQo+ICsrKyBiL2RyaXZlcnMvb2Yv
ZHluYW1pYy5jDQo+IEBAIC00NTUsNiArNDU1LDU0IEBAIHN0cnVjdCBwcm9wZXJ0eSAqX19vZl9w
cm9wX2R1cChjb25zdCBzdHJ1Y3QgcHJvcGVydHkgKnByb3AsIGdmcF90IGFsbG9jZmxhZ3MpDQo+
ICAgCQkJCSBwcm9wLT5sZW5ndGgsIGFsbG9jZmxhZ3MpOw0KPiAgIH0NCj4gICANCj4gKy8qKg0K
PiArICogb2Zfbm9kZV9mcmVlIC0gRnJlZSBhIG5vZGUgYWxsb2NhdGVkIGR5bmFtaWNhbGx5Lg0K
PiArICogQG5vZGU6CU5vZGUgdG8gYmUgZnJlZWQNCj4gKyAqLw0KPiArdm9pZCBvZl9ub2RlX2Zy
ZWUoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpub2RlKQ0KPiArew0KPiArCWtmcmVlKG5vZGUt
PmZ1bGxfbmFtZSk7DQo+ICsJa2ZyZWUobm9kZS0+ZGF0YSk7DQo+ICsJa2ZyZWUobm9kZSk7DQo+
ICt9DQo+ICtFWFBPUlRfU1lNQk9MKG9mX25vZGVfZnJlZSk7DQo+ICsNCj4gKy8qKg0KPiArICog
b2Zfbm9kZV9hbGxvYyAtIEFsbG9jYXRlIGEgbm9kZSBkeW5hbWljYWxseS4NCj4gKyAqIEBuYW1l
OglOb2RlIG5hbWUNCj4gKyAqIEBhbGxvY2ZsYWdzOglBbGxvY2F0aW9uIGZsYWdzICh0eXBpY2Fs
bHkgcGFzcyBHRlBfS0VSTkVMKQ0KPiArICoNCj4gKyAqIENyZWF0ZSBhIG5vZGUgYnkgZHluYW1p
Y2FsbHkgYWxsb2NhdGluZyB0aGUgbWVtb3J5IG9mIGJvdGggdGhlDQo+ICsgKiBub2RlIHN0cnVj
dHVyZSBhbmQgdGhlIG5vZGUgbmFtZSAmIGNvbnRlbnRzLiBUaGUgbm9kZSdzDQo+ICsgKiBmbGFn
cyBoYXZlIHRoZSBPRl9EWU5BTUlDICYgT0ZfREVUQUNIRUQgYml0IHNldCBzbyB0aGF0IHdlIGNh
bg0KPiArICogZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBub2Rl
cyBhbmQgbm90Lg0KPiArICoNCj4gKyAqIFJldHVybjogVGhlIG5ld2x5IGFsbG9jYXRlZCBub2Rl
IG9yIE5VTEwgb24gb3V0IG9mIG1lbW9yeSBlcnJvci4NCj4gKyAqLw0KPiArc3RydWN0IGRldmlj
ZV9ub2RlICpvZl9ub2RlX2FsbG9jKGNvbnN0IGNoYXIgKm5hbWUsIGdmcF90IGFsbG9jZmxhZ3Mp
DQo+ICt7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiArDQo+ICsJbm9kZSA9IGt6
YWxsb2Moc2l6ZW9mKCpub2RlKSwgYWxsb2NmbGFncyk7DQo+ICsJaWYgKCFub2RlKQ0KPiArCQly
ZXR1cm4gTlVMTDsNCj4gKw0KPiArCWlmIChuYW1lKSB7DQo+ICsJCW5vZGUtPmZ1bGxfbmFtZSA9
IGtzdHJkdXAobmFtZSwgYWxsb2NmbGFncyk7DQo+ICsJCWlmICghbm9kZS0+ZnVsbF9uYW1lKSB7
DQo+ICsJCQlrZnJlZShub2RlKTsNCj4gKwkJCXJldHVybiBOVUxMOw0KPiArCQl9DQo+ICsJfQ0K
PiArDQo+ICsJb2Zfbm9kZV9zZXRfZmxhZyhub2RlLCBPRl9EWU5BTUlDKTsNCj4gKwlvZl9ub2Rl
X3NldF9mbGFnKG5vZGUsIE9GX0RFVEFDSEVEKTsNCj4gKwlvZl9ub2RlX2luaXQobm9kZSk7DQo+
ICsNCj4gKwlyZXR1cm4gbm9kZTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0wob2Zfbm9kZV9hbGxv
Yyk7DQo+ICsNCj4gICAvKioNCj4gICAgKiBfX29mX25vZGVfZHVwKCkgLSBEdXBsaWNhdGUgb3Ig
Y3JlYXRlIGFuIGVtcHR5IGRldmljZSBub2RlIGR5bmFtaWNhbGx5Lg0KPiAgICAqIEBucDoJCWlm
IG5vdCBOVUxMLCBjb250YWlucyBwcm9wZXJ0aWVzIHRvIGJlIGR1cGxpY2F0ZWQgaW4gbmV3IG5v
ZGUNCj4gQEAgLTQ3MSwxOCArNTE5LDkgQEAgc3RydWN0IGRldmljZV9ub2RlICpfX29mX25vZGVf
ZHVwKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGU7DQo+ICAgDQo+IC0Jbm9kZSA9IGt6YWxsb2Moc2l6ZW9mKCpub2RlKSwg
R0ZQX0tFUk5FTCk7DQo+ICsJbm9kZSA9IG9mX25vZGVfYWxsb2MoTlVMTCwgR0ZQX0tFUk5FTCk7
DQo+ICAgCWlmICghbm9kZSkNCj4gICAJCXJldHVybiBOVUxMOw0KPiAtCW5vZGUtPmZ1bGxfbmFt
ZSA9IGtzdHJkdXAoZnVsbF9uYW1lLCBHRlBfS0VSTkVMKTsNCj4gLQlpZiAoIW5vZGUtPmZ1bGxf
bmFtZSkgew0KPiAtCQlrZnJlZShub2RlKTsNCj4gLQkJcmV0dXJuIE5VTEw7DQo+IC0JfQ0KPiAt
DQo+IC0Jb2Zfbm9kZV9zZXRfZmxhZyhub2RlLCBPRl9EWU5BTUlDKTsNCj4gLQlvZl9ub2RlX3Nl
dF9mbGFnKG5vZGUsIE9GX0RFVEFDSEVEKTsNCj4gLQlvZl9ub2RlX2luaXQobm9kZSk7DQo+ICAg
DQo+ICAgCS8qIEl0ZXJhdGUgb3ZlciBhbmQgZHVwbGljYXRlIGFsbCBwcm9wZXJ0aWVzICovDQo+
ICAgCWlmIChucCkgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9vZi5oIGIvaW5jbHVk
ZS9saW51eC9vZi5oDQo+IGluZGV4IDZiMzQ1ZWI3MWMxOS4uNzQ5YWMwN2Y0OTYwIDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L29mLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9vZi5oDQo+
IEBAIC0xNDYzLDYgKzE0NjMsOCBAQCBlbnVtIG9mX3JlY29uZmlnX2NoYW5nZSB7DQo+ICAgfTsN
Cj4gICANCj4gICAjaWZkZWYgQ09ORklHX09GX0RZTkFNSUMNCj4gK2V4dGVybiBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm9mX25vZGVfYWxsb2MoY29uc3QgY2hhciAqbmFtZSwgZ2ZwX3QgYWxsb2NmbGFn
cyk7DQo+ICtleHRlcm4gdm9pZCBvZl9ub2RlX2ZyZWUoY29uc3Qgc3RydWN0IGRldmljZV9ub2Rl
ICpub2RlKTsNCg0KJ2V4dGVybicgaXMgcG9pbnRsZXNzOg0KDQpDSEVDSzogZXh0ZXJuIHByb3Rv
dHlwZXMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gLmggZmlsZXMNCiMxMDQ6IEZJTEU6IGluY2x1ZGUv
bGludXgvb2YuaDoxNDY2Og0KK2V4dGVybiBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX25vZGVfYWxs
b2MoY29uc3QgY2hhciAqbmFtZSwgZ2ZwX3QgDQphbGxvY2ZsYWdzKTsNCg0KQ0hFQ0s6IGV4dGVy
biBwcm90b3R5cGVzIHNob3VsZCBiZSBhdm9pZGVkIGluIC5oIGZpbGVzDQojMTA1OiBGSUxFOiBp
bmNsdWRlL2xpbnV4L29mLmg6MTQ2NzoNCitleHRlcm4gdm9pZCBvZl9ub2RlX2ZyZWUoY29uc3Qg
c3RydWN0IGRldmljZV9ub2RlICpub2RlKTsNCg0KDQoNCj4gICBleHRlcm4gc3RydWN0IHByb3Bl
cnR5ICpvZl9wcm9wZXJ0eV9hbGxvYyhjb25zdCBjaGFyICpuYW1lLCBjb25zdCB2b2lkICp2YWx1
ZSwNCj4gICAJCQkJCSAgaW50IHZhbHVlX2xlbiwgaW50IGxlbiwNCj4gICAJCQkJCSAgZ2ZwX3Qg
YWxsb2NmbGFncyk7DQo+IEBAIC0xNTEyLDYgKzE1MTQsMTMgQEAgc3RhdGljIGlubGluZSBpbnQg
b2ZfY2hhbmdlc2V0X3VwZGF0ZV9wcm9wZXJ0eShzdHJ1Y3Qgb2ZfY2hhbmdlc2V0ICpvY3MsDQo+
ICAgCXJldHVybiBvZl9jaGFuZ2VzZXRfYWN0aW9uKG9jcywgT0ZfUkVDT05GSUdfVVBEQVRFX1BS
T1BFUlRZLCBucCwgcHJvcCk7DQo+ICAgfQ0KPiAgICNlbHNlIC8qIENPTkZJR19PRl9EWU5BTUlD
ICovDQo+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zfbm9kZV9hbGxvYyhj
b25zdCBjaGFyICpuYW1lLA0KPiArCQkJCQkJZ2ZwX3QgYWxsb2NmbGFncykNCj4gK3sNCj4gKwly
ZXR1cm4gTlVMTDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSB2b2lkIG9mX25vZGVfZnJl
ZShjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpIHt9DQo+ICAgDQo+ICAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgcHJvcGVydHkgKm9mX3Byb3BlcnR5X2FsbG9jKGNvbnN0IGNoYXIgKm5hbWUs
DQo+ICAgCQkJCQkJIGNvbnN0IHZvaWQgKnZhbHVlLA==
