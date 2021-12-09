Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8371B46E434
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 09:29:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nJl2g7yz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::603;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8nJG3mzHz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 19:29:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxEAWgKCvEXoARtlNh0uCbGnTtbKzABxQRM/mXpRyXPHNS/Si71fIdHuMSOPWRoDluyEUWMjAIGFgf+wq6ZRasXBcy7PCjXnuKDXWzs5QTktMSuqsEXRobvRYxfy8rNrtSkEGqVklhUZitrbKYHFl0dLRysYoKP2bz2pZjcHf8AYSHXMuMdzncLT3QjRx2RYj3P9OF+oSkdRNd9j/sbmuP+wGXMrBXqRxEup7lJ4ro6VAEZJKWzzDG1Y/RJ1YRFCj35NDBa77eimg/frW/NLNNuW3P0/hn6jw+TRRxDWpRAOyeeLkni74bPOSXex8YWsEH0T60guDDwyU7Dt3uFx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgbxHO5Dt1dnBIcDOJ9T5AbM7L7LpuRK/kJcofU3JOQ=;
 b=n3kdIviPmOBbsngqKsF8D4x2rMdQqwyeSZ9OvjuHzRE2OF/mmR6ZMk2Yvehnqiu3kQFWt7i1T0ZAAsx0YQNW8VfjCkQc8L8CKKmnezUmdfO39q4//0GFCEov69agCxZNDj6g4MKcgUfqpN/PdHxbJ4gSKpCDkxadLwX39FqUrFOvfZlSlDjD+1BnBCTGLW5iFuW2vZGQ23mrXnL5lnHBsoEK3gfHmYHoZE9fGh3G+HtKgm8wKiPSGT1YcoNd8qSWM627K6EjzGb6+pBS8e3gQhtfRO/FzIA39OogXA7MnlT27bN4OdJKVwH/rM4hCZAMU0Ip9o2kVnjc2lw/GOSgVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2304.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 08:28:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 08:28:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 15/18] powerpc/64s: Always define arch unmapped area
 calls
Thread-Topic: [PATCH v6 15/18] powerpc/64s: Always define arch unmapped area
 calls
Thread-Index: AQHX5sGy3qtE+cEnEk+RkzwY51H7bKwoYUGAgAF97ACAAADogA==
Date: Thu, 9 Dec 2021 08:28:54 +0000
Message-ID: <33b222cc-c746-3d91-7b61-243a415b6de9@csgroup.eu>
References: <20211201144153.2456614-1-npiggin@gmail.com>
 <20211201144153.2456614-16-npiggin@gmail.com>
 <bbe64ca3-5439-4b79-6bda-a3464febdc53@csgroup.eu>
 <1639038294.oxbnieugst.astroid@bobo.none>
In-Reply-To: <1639038294.oxbnieugst.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 525f22ca-4f18-4c07-6cbc-08d9baedeff1
x-ms-traffictypediagnostic: MR1P264MB2304:EE_
x-microsoft-antispam-prvs: <MR1P264MB2304410EC9D5E7671CCDD43DED709@MR1P264MB2304.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: trcvMtfAobqxuxBnkQRQd7SiqV1vvExwfi7TIDXs6DxQs86c6IdCYZ8f5wSq2WWE4If1A6cyA5dS12KLCsokHzgeC2ZK1zn4jkSCGUlwPSqnLUB/CnYmIKW4ONe4gGoOAg7LlXsa+2+uEHdGZ3aPqph5MaQBW+zcHCj+xbZ1QsT7FWO12y3moH/0Jo6W5G4QLfb1wCQzml8JeT0tpkjZ48lvyic4tj+60qhM28zQauJWt6TN9zEGS7nReb3onAPHPtjpa9OiaYfaFsBrMSqZSyPTubBruWBZNK/y1t9B51NSKoo1izUxfI/1Baw7xLjIJsW3eM3mtbQqFNZnNEuEw27Czbrf3up7s36sdNhRGhqLo/pybEJTDi9/w7+dGqwK3W9y1ZfEVNLSa6eNhCJ38gErmvmai36D86Nx3rgSR50Ecyfxw0TEz4ZsexfxfXAUGLtGPWtU6KWHMeHFrDiheMxi7snjLwt6AG4QVJoVllxn0EgvYm/8DsHUoUByzkhtcdngVTM2984+G5i5fo/LKfQuYwBTYGKicUgAz3BkXuDAQDSnXyy/p3sU6Ed3FJH1ka2RcRNaacWDmztv8/bj2n/BMqanvijDg+SHjBIwOZUPUuYtgy202iKt/ThiHbgUiTC9YBonpUI+VuOsaAbUsQFLgqeJOgENqqg1su0IQgYA7sAi7ykn1eWwBukZaKX64I/7oV8IKZ4b38S93TQebChTxc4VxxdOLjB82qe6p6/Nnc6Ka5nzgRkvFjdJBwDUqGUSYf/af3oliMlS2puaTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(122000001)(2906002)(36756003)(26005)(2616005)(186003)(110136005)(38100700002)(316002)(83380400001)(6486002)(5660300002)(66446008)(31696002)(6506007)(66556008)(6512007)(508600001)(66946007)(71200400001)(76116006)(91956017)(44832011)(64756008)(66476007)(38070700005)(31686004)(66574015)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0J4VmZZWHh0SXpINTlHb3ZJb2ppZktnaW9FS0Y2ZmxyTlBzZE1aN3E0YndN?=
 =?utf-8?B?S2V0UVpaMVh4VERmdStNWVViVjArR0pmUlBiTU1LSEdzQ1B0ZHVFMXBqYWlF?=
 =?utf-8?B?RjY5cnBCby9qNmdVRzBIOFIxVzlieDVDcXVXRlpWSXJGbHhFNnRrTy9oMmdM?=
 =?utf-8?B?STZTNVR6aVpXajg1WVlpQWdVaXFaSlNDeXFqYVk4TEhkWS8waVNBUFdHYUxD?=
 =?utf-8?B?NGlPYW5oTTZBMHU5OFhBU01jQlBRT0xZU09EeEZHUkVuQW11U0xISUxzZmhL?=
 =?utf-8?B?QWc0dkZkdk4zek8zNHZnMnJmTWRtRmR3Ky9KdFoyV1ZOQ28vRkhpNkJjUDJs?=
 =?utf-8?B?MHZvUVErcFA2Nk9TRzlFRCtOOVk4bXk5Y2h1S0lZTXFnNUIrOVdicjB6cUp3?=
 =?utf-8?B?MzNXbXVoQlBPdTZmcEtBMFcvNWFCWDRFenV0WWZFc3hXU0V4OER1bytLVU5E?=
 =?utf-8?B?NjBhbDlvU0N3a0FJRWtWT290RzNpWjUxdlZEMnUyQSt6cTdRVm0zbWxjdklM?=
 =?utf-8?B?Y2dEZG1XbnVIL0RwbUVReEp2RXJFa2ZJQ0dqM2pGZjg1TjU0eW5Rb1NQK3BX?=
 =?utf-8?B?cE41RGVSQnQvWS9LcjJFenU3Q2dBT2dId3dKaDh3RlhVaFpRcEk1RVE0UEpQ?=
 =?utf-8?B?SlVINjRjNHB0dDdRMlZZbkJUdGp5b0xWaUd3RHZoRHlFbjQvdUNNTmhpRmhy?=
 =?utf-8?B?WG8wb051cVYyR2ozZ1ZkWW9VMitWYTVVcEtTNUlWTTJzUkRhaWF5UHYwZUZa?=
 =?utf-8?B?WVFHVlFyaGxGZFk1ZUF0cjNPUjRvZ1RQN3hoaGUvZ2EzenJXNmtuTkZpdG5H?=
 =?utf-8?B?azE5bW5vazRyQ1NKajIyOURTYXpHM2dvb0UvcWtiVXA4UmY1Mi9Qdy8vVEg1?=
 =?utf-8?B?NzcvZGJuNWlmazIzL2dTSmY0dXlwRktLRHJ2Mis1VVRkMWtxWW1RQ0FBb0c4?=
 =?utf-8?B?c1duSUd3K25kZjJZV0lPYURFblBwdnNkZDJ4VTVjVXpveVA5RXQ1L1ZsMGRZ?=
 =?utf-8?B?OG51RU9aaENPd1VQdEpQWWJ5TUFyZkMvMmpNbVhSM2NlSzIxQWpHQXlObmZS?=
 =?utf-8?B?S09hcnNDN1hYbExkTVprVkgwSHp4Q2h0akwzN21JbXVJdWVpT0ZSRjB2UzZW?=
 =?utf-8?B?czNUQ214M3hnSXFpS1o5UEpWdnZYRmViTnAxSElNOUdreUV0cUVpbHlBZVVQ?=
 =?utf-8?B?NncvemdMMHFNemxGSWhmZUJvM1pDazNCV1J6RFIvbUN2U3kyS1R3WkIvdUc1?=
 =?utf-8?B?N3ZrdFJVM1VpaDc4ODVYZGlDbXJjTzlJZ2N5K0N2ZUJCVVpsUUZxemJHWXg4?=
 =?utf-8?B?MXJBcWlvbkQycytpTVkzR1F4cThTd3prU1greWVreEtzRVdHUTBnOE1ZNU92?=
 =?utf-8?B?QnRvQzVlczVZU3FzSm5IbkVhNHRjajkxRUVGMCtsMmdZdC9EbzQvYk0rY29h?=
 =?utf-8?B?SlNwczI0Q050MDYwNGh1RHZxT2R2WStsbW9PVUlVbXVaMmNXV0p1VXdKZzVk?=
 =?utf-8?B?cW1NRzMvekRtYUhlcjlmSjA5NjkwUjUwWVJ6TnZicnBzM0wxWUo2OEU2b1Ju?=
 =?utf-8?B?bExqZnNqaUpLMlVTbDBaWGt0dmd4YTFreGhSNzNaeFhFQ0YvdU01SDlCaElL?=
 =?utf-8?B?Qi9Cem5XcE53ZVV6NkliZjVNZTlEQ0xDM2t6YXkvRXl0OVVxNHU3RklMa1Bm?=
 =?utf-8?B?OGo2T3prMzFvRGpWYUNhOTVoWmNUckJlVitweDVEYXJiU3pjdHBBRENSNzFu?=
 =?utf-8?B?R0JUbE1MTFNucjNGTk5RWGhUdkFOZU5kaDc1YWFja29GMk1ZNFAyNUVoTFBa?=
 =?utf-8?B?bzNab2crR2Uzem0rTWNkdk0wbWNQYjczUWFMTnptczJaWmNpbHo0VEJTZm9O?=
 =?utf-8?B?bm9YSG5XbVFwN1h6V3IxOE9FVjcweUtqUUZia3F5Zy9XdDluVVVyb0xHLy80?=
 =?utf-8?B?cU5BeWdIcnhzeFNEZmk0Q0tEWnBsenk1YnFaYm5ySHpxU0RZaFB5aVdaMktq?=
 =?utf-8?B?c3lzSDFtSndJRnRmWHdzMVdZZHFLeFEyYUFBaVlCZXhLRXNacVl0Uno3Kzdl?=
 =?utf-8?B?NXlHcGFPb1lZTG41YVppNnpZcXZ5YWJNUGN4UlpqSnc3dTh1L2FCdmJ0RlF3?=
 =?utf-8?B?clczUWNXbHpEdHhWMlJqSVJGSEh3NDNMOG4xcncvOU51bnhXZktLcWNSWmdO?=
 =?utf-8?B?eUtha0lBQkpuWUlZdjFBVUd2ZitnOG5mS05RZlViQ0dXYXdSRVJsbG9BeFh3?=
 =?utf-8?Q?rTySf00bxkKLNfddYr/6hLJDj4kojyOhyWr5Lcni8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAE6217ECC33324DB488122E78C3FAD4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 525f22ca-4f18-4c07-6cbc-08d9baedeff1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 08:28:54.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: plksh9kUYxmzYttY9AsBCje3Ky7rLkQSFkRUhEU3mBT6l8Pd2FmvqovQAdtDo0fsg8cMbueuwE/E+dqRT1RpWAyyPczcepIm2m7nxr+0e5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2304
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMDk6MjUsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDgs
IDIwMjEgNzozOCBwbToNCj4+DQo+Pg0KPj4gTGUgMDEvMTIvMjAyMSDDoCAxNTo0MSwgTmljaG9s
YXMgUGlnZ2luIGEgw6ljcml0wqA6DQo+Pj4gVG8gYXZvaWQgYW55IGZ1bmN0aW9uYWwgY2hhbmdl
cyB0byByYWRpeCBwYXRocyB3aGVuIGJ1aWxkaW5nIHdpdGggaGFzaA0KPj4+IE1NVSBzdXBwb3J0
IGRpc2FibGVkIChhbmQgQ09ORklHX1BQQ19NTV9TTElDRVM9biksIGFsd2F5cyBkZWZpbmUgdGhl
DQo+Pj4gYXJjaCBnZXRfdW5tYXBwZWRfYXJlYSBjYWxscyBvbiA2NHMgcGxhdGZvcm1zLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4N
Cj4+PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2gu
aCB8ICA0IC0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11
LmggIHwgIDYgKysrKw0KPj4+ICAgIGFyY2gvcG93ZXJwYy9tbS9odWdldGxicGFnZS5jICAgICAg
ICAgICAgIHwgMTYgKysrKysrLS0tDQo+Pj4gICAgYXJjaC9wb3dlcnBjL21tL21tYXAuYyAgICAg
ICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4+ICAgIGFyY2gv
cG93ZXJwYy9tbS9zbGljZS5jICAgICAgICAgICAgICAgICAgIHwgMjAgLS0tLS0tLS0tLS0tDQo+
Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkN
Cj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L2hhc2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvaGFzaC5oDQo+Pj4g
aW5kZXggNjc0ZmUwZTg5MGRjLi5hN2EwNTcyZjM4NDYgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9oYXNoLmgNCj4+PiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2guaA0KPj4+IEBAIC05OSwxMCArOTksNiBAQA0K
Pj4+ICAgICAqIERlZmluZXMgdGhlIGFkZHJlc3Mgb2YgdGhlIHZtZW1hcCBhcmVhLCBpbiBpdHMg
b3duIHJlZ2lvbiBvbg0KPj4+ICAgICAqIGhhc2ggdGFibGUgQ1BVcy4NCj4+PiAgICAgKi8NCj4+
PiAtI2lmZGVmIENPTkZJR19QUENfTU1fU0xJQ0VTDQo+Pj4gLSNkZWZpbmUgSEFWRV9BUkNIX1VO
TUFQUEVEX0FSRUENCj4+PiAtI2RlZmluZSBIQVZFX0FSQ0hfVU5NQVBQRURfQVJFQV9UT1BET1dO
DQo+Pj4gLSNlbmRpZiAvKiBDT05GSUdfUFBDX01NX1NMSUNFUyAqLw0KPj4+ICAgIA0KPj4+ICAg
IC8qIFBURUlEWCBuaWJibGUgKi8NCj4+PiAgICAjZGVmaW5lIF9QVEVJRFhfU0VDT05EQVJZCTB4
OA0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L21t
dS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9tbXUuaA0KPj4+IGluZGV4
IGMwMmY0MmQxMDMxZS4uMDE1ZDdkOTcyZDE2IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvbW11LmgNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYm9vazNzLzY0L21tdS5oDQo+Pj4gQEAgLTQsNiArNCwxMiBAQA0KPj4+ICAgIA0K
Pj4+ICAgICNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPj4+ICAgIA0KPj4+ICsjaWZkZWYgQ09ORklH
X0hVR0VUTEJfUEFHRQ0KPj4+ICsjZGVmaW5lIEhBVkVfQVJDSF9IVUdFVExCX1VOTUFQUEVEX0FS
RUENCj4+PiArI2VuZGlmDQo+Pj4gKyNkZWZpbmUgSEFWRV9BUkNIX1VOTUFQUEVEX0FSRUENCj4+
PiArI2RlZmluZSBIQVZFX0FSQ0hfVU5NQVBQRURfQVJFQV9UT1BET1dODQo+Pj4gKw0KPj4+ICAg
ICNpZm5kZWYgX19BU1NFTUJMWV9fDQo+Pj4gICAgLyoNCj4+PiAgICAgKiBQYWdlIHNpemUgZGVm
aW5pdGlvbg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vaHVnZXRsYnBhZ2UuYyBi
L2FyY2gvcG93ZXJwYy9tbS9odWdldGxicGFnZS5jDQo+Pj4gaW5kZXggODJkOGIzNjhjYTZkLi5k
ZGVhZDQxZTIxOTQgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdl
LmMNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vaHVnZXRsYnBhZ2UuYw0KPj4+IEBAIC01NDIs
MjAgKzU0MiwyNiBAQCBzdHJ1Y3QgcGFnZSAqZm9sbG93X2h1Z2VfcGQoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsDQo+Pj4gICAgCXJldHVybiBwYWdlOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+
PiAtI2lmZGVmIENPTkZJR19QUENfTU1fU0xJQ0VTDQo+Pj4gKyNpZmRlZiBIQVZFX0FSQ0hfSFVH
RVRMQl9VTk1BUFBFRF9BUkVBDQo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGZpbGVfdG9fcHNpemUo
c3RydWN0IGZpbGUgKmZpbGUpDQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBoc3RhdGUgKmhzdGF0ZSA9
IGhzdGF0ZV9maWxlKGZpbGUpOw0KPj4+ICsJcmV0dXJuIHNoaWZ0X3RvX21tdV9wc2l6ZShodWdl
X3BhZ2Vfc2hpZnQoaHN0YXRlKSk7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAgdW5zaWduZWQgbG9u
ZyBodWdldGxiX2dldF91bm1hcHBlZF9hcmVhKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBs
b25nIGFkZHIsDQo+Pj4gICAgCQkJCQl1bnNpZ25lZCBsb25nIGxlbiwgdW5zaWduZWQgbG9uZyBw
Z29mZiwNCj4+PiAgICAJCQkJCXVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+Pj4gICAgew0KPj4+IC0J
c3RydWN0IGhzdGF0ZSAqaHN0YXRlID0gaHN0YXRlX2ZpbGUoZmlsZSk7DQo+Pj4gLQlpbnQgbW11
X3BzaXplID0gc2hpZnRfdG9fbW11X3BzaXplKGh1Z2VfcGFnZV9zaGlmdChoc3RhdGUpKTsNCj4+
PiAtDQo+Pj4gICAgI2lmZGVmIENPTkZJR19QUENfUkFESVhfTU1VDQo+Pj4gICAgCWlmIChyYWRp
eF9lbmFibGVkKCkpDQo+Pj4gICAgCQlyZXR1cm4gcmFkaXhfX2h1Z2V0bGJfZ2V0X3VubWFwcGVk
X2FyZWEoZmlsZSwgYWRkciwgbGVuLA0KPj4+ICAgIAkJCQkJCSAgICAgICBwZ29mZiwgZmxhZ3Mp
Ow0KPj4+ICAgICNlbmRpZg0KPj4+IC0JcmV0dXJuIHNsaWNlX2dldF91bm1hcHBlZF9hcmVhKGFk
ZHIsIGxlbiwgZmxhZ3MsIG1tdV9wc2l6ZSwgMSk7DQo+Pj4gKyNpZmRlZiBDT05GSUdfUFBDX01N
X1NMSUNFUw0KPj4+ICsJcmV0dXJuIHNsaWNlX2dldF91bm1hcHBlZF9hcmVhKGFkZHIsIGxlbiwg
ZmxhZ3MsIGZpbGVfdG9fcHNpemUoZmlsZSksIDEpOw0KPj4+ICsjZW5kaWYNCj4+PiArCUJVRygp
Ow0KPj4NCj4+IFdlIHNob3VsZG4ndCBoYWQgbmV3IGluc3RhbmNlcyBvZiBCVUcoKS4NCj4+DQo+
PiBCVUlMRF9CVUcoKSBzaG91bGQgZG8gdGhlIHRyaWNrIGhlcmUuDQo+Pg0KPj4+ICAgIH0NCj4+
PiAgICAjZW5kaWYNCj4+PiAgICANCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL21t
YXAuYyBiL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMNCj4+PiBpbmRleCBhZTY4M2ZkYzcxNmMuLmM0
NzVjZjgxMGFhOCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vbW1hcC5jDQo+Pj4g
KysrIGIvYXJjaC9wb3dlcnBjL21tL21tYXAuYw0KPj4+IEBAIC04MCw2ICs4MCw3IEBAIHN0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyBtbWFwX2Jhc2UodW5zaWduZWQgbG9uZyBybmQsDQo+Pj4g
ICAgCXJldHVybiBQQUdFX0FMSUdOKERFRkFVTFRfTUFQX1dJTkRPVyAtIGdhcCAtIHJuZCk7DQo+
Pj4gICAgfQ0KPj4+ICAgIA0KPj4+ICsjaWZkZWYgSEFWRV9BUkNIX1VOTUFQUEVEX0FSRUENCj4+
PiAgICAjaWZkZWYgQ09ORklHX1BQQ19SQURJWF9NTVUNCj4+PiAgICAvKg0KPj4+ICAgICAqIFNh
bWUgZnVuY3Rpb24gYXMgZ2VuZXJpYyBjb2RlIHVzZWQgb25seSBmb3IgcmFkaXgsIGJlY2F1c2Ug
d2UgZG9uJ3QgbmVlZCB0byBvdmVybG9hZA0KPj4+IEBAIC0xODEsMTEgKzE4Miw0MiBAQCByYWRp
eF9fYXJjaF9nZXRfdW5tYXBwZWRfYXJlYV90b3Bkb3duKHN0cnVjdCBmaWxlICpmaWxwLA0KPj4+
ICAgIAkgKi8NCj4+PiAgICAJcmV0dXJuIHJhZGl4X19hcmNoX2dldF91bm1hcHBlZF9hcmVhKGZp
bHAsIGFkZHIwLCBsZW4sIHBnb2ZmLCBmbGFncyk7DQo+Pj4gICAgfQ0KPj4+ICsjZW5kaWYNCj4+
PiArDQo+Pj4gK3Vuc2lnbmVkIGxvbmcgYXJjaF9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmls
ZSAqZmlscCwNCj4+PiArCQkJCSAgICAgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4+ICsJCQkJICAg
ICB1bnNpZ25lZCBsb25nIGxlbiwNCj4+PiArCQkJCSAgICAgdW5zaWduZWQgbG9uZyBwZ29mZiwN
Cj4+PiArCQkJCSAgICAgdW5zaWduZWQgbG9uZyBmbGFncykNCj4+PiArew0KPj4+ICsjaWZkZWYg
Q09ORklHX1BQQ19NTV9TTElDRVMNCj4+PiArCXJldHVybiBzbGljZV9nZXRfdW5tYXBwZWRfYXJl
YShhZGRyLCBsZW4sIGZsYWdzLA0KPj4+ICsJCQkJICAgICAgIG1tX2N0eF91c2VyX3BzaXplKCZj
dXJyZW50LT5tbS0+Y29udGV4dCksIDApOw0KPj4+ICsjZWxzZQ0KPj4+ICsJQlVHKCk7DQo+Pg0K
Pj4gU2FtZS4NCj4+DQo+PiBBbmQgdGhlICNlbHNlIGlzbid0IG5lZWRlZA0KPj4NCj4+PiArI2Vu
ZGlmDQo+Pj4gK30NCj4+PiArDQo+Pj4gK3Vuc2lnbmVkIGxvbmcgYXJjaF9nZXRfdW5tYXBwZWRf
YXJlYV90b3Bkb3duKHN0cnVjdCBmaWxlICpmaWxwLA0KPj4+ICsJCQkJCSAgICAgY29uc3QgdW5z
aWduZWQgbG9uZyBhZGRyMCwNCj4+PiArCQkJCQkgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgbGVu
LA0KPj4+ICsJCQkJCSAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBwZ29mZiwNCj4+PiArCQkJCQkg
ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZmxhZ3MpDQo+Pj4gK3sNCj4+PiArI2lmZGVmIENPTkZJ
R19QUENfTU1fU0xJQ0VTDQo+Pj4gKwlyZXR1cm4gc2xpY2VfZ2V0X3VubWFwcGVkX2FyZWEoYWRk
cjAsIGxlbiwgZmxhZ3MsDQo+Pj4gKwkJCQkgICAgICAgbW1fY3R4X3VzZXJfcHNpemUoJmN1cnJl
bnQtPm1tLT5jb250ZXh0KSwgMSk7DQo+Pj4gKyNlbHNlDQo+Pj4gKwlCVUcoKTsNCj4+DQo+PiBT
YW1lDQo+Pg0KPj4gQW5kIHRoZSAjZWxzZSBpc24ndCBuZWVkZWQNCj4gDQo+IEZhaXIgZW5vdWdo
LiBJJ2xsIHNlZSBpZiBtcGUgY2FuIHNxdWFzaCBpbiBhbiBpbmNyZW1lbnRhbCBwYXRjaC4NCj4g
DQoNCkFueXdheSwgbXkgZm9sbG93LXVwIHNlcmllcyAiQ29udmVydCBwb3dlcnBjIHRvIGRlZmF1
bHQgdG9wZG93biBtbWFwIA0KbGF5b3V0IiBjbGVhbnMgaXQgdXAuDQoNCkNocmlzdG9waGU=
