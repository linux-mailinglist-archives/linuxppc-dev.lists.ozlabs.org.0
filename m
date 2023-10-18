Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8897CD3B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 07:56:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=baIXESo6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9KqV5d1tz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 16:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=baIXESo6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::620; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9KpZ2jqsz300q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 16:56:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf1SKDjn1fbqgZofJ3lQUJs6JRr8ryt9nYHfKzuqD2JKpw+m6u2k5G5+sT959xcShOncsE60qYPolP1FbyuXEqdTN6GAYWvj76lJMZEU9RBEJOEIX6Dad4qGjzm9Oj2x08lWjZpd5WB1f+lYttg5HySGj4ns2ouJ6iiyub8BKq6a2FkADQilCRYIATwgVrr+cK/pr9J6nKrw8F/em5jQD9UrlyX9VWOKlMkmbW9Evua2/4qMWEa0YlvTzHG3z3sOIIVtDfX6dYRQmivCgoD/EjIWsVkyUJaOfLETSbX7CCqUgpt3vidFZgiq+XqHcheIQih319a6IIhb443Opo54AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZKdA69M+tj5XbpoU6u6YuFQBiLCp2unAawdYSiIlJ0=;
 b=bQnuVJeUKSQjC+waDrmAZH7hvzW9fyFuR5pysqTQS9QvxBJzdY5MZxhCS6Db53luRrtNsdILKvbX8mL+zq3jx+BmowYprlreICJKlFYFUfD0e3eKMrULm3W5rcQatV/pi00s9KPG7RZSdQfrZGOWOnjn/+31yjfAcKW25v9SogiOdPQpgHfsLMr30ISvOXLZgBoiwQNFh9UNcXEM4NmTZazXdMokNNvVffiZ30xICNEnyHcG2UxY/C5W8iwrXfVGF1d3jCRkUm8DEQPJ+FCG/ph2KmSDwAgPen119ZLFX4QD+aZMCXYk+Hali4mBehlq2b1MEe4GNinM5Bn2Vtgh7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZKdA69M+tj5XbpoU6u6YuFQBiLCp2unAawdYSiIlJ0=;
 b=baIXESo6jwsjbrtkzFYaebyNbYeBFkI7bfVwygRGM9pwSF4XsvlCAoekK+f8PysvXMaC0ChLvGaZAmq3aeo9qutr5W4bu//luB8Qb6LhGl3mBIs/opVujlSfNcDGCwddn+gucWs3oexXNKtN2aR+B3Wg8OKL2mWeeNou8S8ZuYA1s1vRjwJKF0qMCCc108WinH7PyWTQIw8y6HmLDs6zrrAxX3uwlsDzXCzEHyGuv+vfWUZGackEG2scsyMCzoAw261Qx9aFMUhRxUtTK9x0wKwSyy9cLpejrjhtbCnbHL/KreS60N4y899hAGcDyfwyNyQZiswULSpz+ltGi+g2sw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1684.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 05:55:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3f16:2478:90af:c462]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3f16:2478:90af:c462%6]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 05:55:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Update set_ptes to call pte_filter for all
 the ptes
Thread-Topic: [PATCH] powerpc/mm: Update set_ptes to call pte_filter for all
 the ptes
Thread-Index: AQHaAX9ZaJFSF2lQzECZ7B6vsYnw97BPDHSA
Date: Wed, 18 Oct 2023 05:55:41 +0000
Message-ID: <9c598590-6911-3254-1560-62785fc325dc@csgroup.eu>
References: <20231018045523.776679-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20231018045523.776679-1-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1684:EE_
x-ms-office365-filtering-correlation-id: 18660035-ac55-4587-e78c-08dbcf9edc8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bcKO2rK9paMk4yUX8x3EkWZkZX4n5oh/vnpb/RB1RCx1IDw32VqdKJI8xXBAH8yuRX9NAQTAP4LLq5Qocr1wi36P7NYavKXeRI1dKozIjtiLXI60YEt6uru50LRvcKc8vN92SbE88inTAyE88NiJT+cqDpCHxhvkYd9FIhJORF1LszyDP9NhPI7YCiP4vqWsFZcCo+7vKre2DhsyTqf/q+gkMgg6oBgE0aP0MljOVkxNXZ77ovz3T6oOzqepzyqq+MvJnxmdqs3P1m7bls3MEINmKK4tPnEvukZyWdCgwEVMpBpeimgFcMfFM9590i8oL8Ld2jaAcUFzcH6UevrhRldV8iHCuuEAleVNexU2P0ZGS6RP4+OmdxcXF2Fp+Cm85CW3MILRySWVvzDhJWpgWmsT9CWbO37919nxWdGonzriicdso8tTf1jwfzAPevOWVd5U2msf6olU0H+4O6dEbhrgyQCkawHR/5m5D+ts25j8K/RgCXfpL/parIBwe+CgfeK6XGodBi23VUE5w5Iyon9d3WQkGYQyHOclkDG/PMWuWGo5QU0JuUldiqgpJssPIcZD8QGbnDe6WfYpN/D+K2GdnX5/8HwsFamEhqyZjTnOyB2PdWkibjcRebajjd957wSFstyzNPW1At5mxksr8fAEF/56l/2akKNhIpLzxeA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(83380400001)(66574015)(6506007)(38100700002)(38070700005)(6512007)(2616005)(122000001)(26005)(478600001)(966005)(6486002)(31686004)(41300700001)(316002)(91956017)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008)(5660300002)(110136005)(31696002)(86362001)(44832011)(15650500001)(2906002)(36756003)(8676002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bTc3S1QrNTNwdEVxR3drbmRCSHBWVHBoUWUrN0I5Q2JzNVoramF5TFRUV2Rp?=
 =?utf-8?B?Q3JwcGVKQ1VFV1p6V3FGVnpxcTYrOXd3c3kxQ1FOd2RsVHdEKy9TZURtTTlS?=
 =?utf-8?B?Vy9RdHBkbUp4aWZTV1hEbW1WK1RyK04yakNHeERINXhaVy9DUGp0cjNoWUxp?=
 =?utf-8?B?M09LUkdhNWJMNGRjM2orNmcwcWNDQWtlYXVvVGNXaVhFQXplL3pRUmNrTjVS?=
 =?utf-8?B?UHlpMFZUMC9Bd2hEOVlaODNaQU1Yb1c4bThYcGY1dGUvcjl0YXFrWVNhQjkr?=
 =?utf-8?B?aDJZMWNvSG53ZTFVbmhPbEpJem9HZ0x0MWhFeGFPd2VVeUVQT25OY1ducUYz?=
 =?utf-8?B?eHBjV04xOHdlSGVCK3RWMklTR2x2RWlsY2lld3FMRENMbW95eHpnZUwzUlM0?=
 =?utf-8?B?VTJlYkx0OUVwWHJreXlaeElPQWVIKzcyZVMyajhKdHBDSk0vSUF4UDVtQ2Ex?=
 =?utf-8?B?UHJmTE9xU3BhY2h4Q0Y2MDBHekliV3ZtQzROTEtmSXZ4clJEeUhvcElwTXZp?=
 =?utf-8?B?ZEhtbElvNDYrM3ExV2s5UUQwNDN0czdnMjdnREo1SmhWVXNWTzM1UGxhMHJK?=
 =?utf-8?B?dE5jdHlRcDdTTnZuaUQ5RlRheWJxcFZad2w2RER3RmR4Ry9LVHJ2dlRrZmtV?=
 =?utf-8?B?TG1uNExLUDJSQnlhVXhJREFHaEEyOFN6Z2ZHNmtMRyt0TGVPUjV2VHIzNkhx?=
 =?utf-8?B?NDN5cE52ZEdzQ0FNZDB0Y2pGVldCRjQzRHBKM25Eamlvd0JvZ2F4cFBTZ2RN?=
 =?utf-8?B?MUhpRTRHR0lpNEpQeTAzKytDUVkvN09lN2txbGY2R3ZxRElwek4yYndUTitQ?=
 =?utf-8?B?Q2R5azdYdkZnNnlhaFpNWTVQMmRFMzcwaEZtbU41aEFQU2ZnNXNkb2VRV2Mx?=
 =?utf-8?B?UEZIbmhOTzBlUFFid2NjZEZab3BVbUZhcCtDd0lIWEJ6YkxQb3ZkZC9ud0Mz?=
 =?utf-8?B?RG1CVDhSSkNjcWtpUEdGWmJKemU3Mzk1MWVTMktwY1R4OGtzdFJ4a2tYR2NX?=
 =?utf-8?B?dmpSbVYwcURDOWpxQWpCUmFSV1BLaEtZNW82VmlzcCtERXJSaHcvbXAvV2U1?=
 =?utf-8?B?WmNlTjhoWFJSY3R4REswbUE4UnJUakJibkhmcTVJWlBBZ0VuUjk3M3NBZUtF?=
 =?utf-8?B?YWxNd3dXOHdmWTFQUG4rM1lra1ZwY2N1dnRCbUxUVUxtYmM2RnFKZm1uM0c3?=
 =?utf-8?B?UkR0UmNVeG12UXk1R0w1VUxXYzhBM29OMGlSaG9USEZFT3ZXRXdzd25PdS9h?=
 =?utf-8?B?Vk9nK3ZiVHpNUU5VOEY5VlRMdTVPbWhMbFc1bWZ5YUtsUWQ3ZDFEK0J1ZlAr?=
 =?utf-8?B?cjNQc20vbTNSWndXSjUxak1WWE9LRnAxRWowOCtmQ2VsTGxRZXZuSUludEdP?=
 =?utf-8?B?Tlp6Skp1UzVQdTdyaHcrZ3doNnZ3bTJaZlRZcFJMWnAxRTMxYzhVQnJRK1FQ?=
 =?utf-8?B?YndiSlZmamFEcjRRSVAvamVGeFlvZkRqWGFsaFdyM2lNRHkvZUFFR3JtOGNz?=
 =?utf-8?B?b2xPdjVRYXBDeVM3aElMZTJLYWg3N2tTckVSYXNIQnAxYU5FdTE0REVjRkpH?=
 =?utf-8?B?azRnKzBTcFJhby9aMStoR3hzWVZXNllPS0oxRXBTa0RZWmNQcWl0V3paUGVh?=
 =?utf-8?B?aWREenRHZlkxVE1FRG03QU05TUpsbFA1WlBFYlVXZDE5K3g2ZUtxT2o5d1BO?=
 =?utf-8?B?WWNnSUd4NlJuUTY5S2QrY0FJb2l3aTc5dGNESjB0MnpFR1pDWXoxUW5wdFd4?=
 =?utf-8?B?Ymx2L1FpaTdJNVRab3BuR2NSMXFydWtzbGNERFoxdFkrUWhIQkxoVFluSjRK?=
 =?utf-8?B?ajJmU0M0YlFxQ2x0bVJRdlpHQStaZHJpUUJOOGUwdDIxcnFtSkdZU1A2WTI5?=
 =?utf-8?B?aFVYaTVLeVJEbmVwdkJmM1hYc1U1SGRUU29UVmV0UW1YMkE4UlNiczZReEZv?=
 =?utf-8?B?aStqYTJHenlnVkR0M2MzM1lWR0RCRDFsYTBXZ09PaGFjeFhZempDalU4ckF2?=
 =?utf-8?B?YklaNmhGc3VOMHRNSGg5SlJESVZ4SThUcTBpSU1EYjdkZWplMGZvNjRVeU92?=
 =?utf-8?B?aVJNczJWVzlGWjZuc2Uxbm9neDExNW05dGIzRFVTcjFoZVFOdzF2elB4alpk?=
 =?utf-8?B?Q200KzQ0NGkzMStJbTNSNFRYT3haU2p4Uy9qdTRYSTZlUWFsUEVzcTlIVk5u?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0185229B7F2A7540B46586A209800EA2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18660035-ac55-4587-e78c-08dbcf9edc8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 05:55:41.4722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J/S4jKHa2SQklcQWFXsF+dUGCFtkq6oXRIVlTXu8mx+ai0ROFTM6QWQR+zuN3JiaBT+X62yjy196a+hNCJA6W3U1c4HubuW2fyHKJsJNjWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1684
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
Cc: "willy@infradead.org" <willy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzEwLzIwMjMgw6AgMDY6NTUsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gV2l0aCBjb21taXQgOWZlZTI4YmFhNjAxICgicG93ZXJwYzogaW1wbGVtZW50IHRoZSBuZXcg
cGFnZSB0YWJsZSByYW5nZQ0KPiBBUEkiKSB3ZSBhZGRlZCBzZXRfcHRlcyB0byBwb3dlcnBjIGFy
Y2hpdGVjdHVyZSBidXQgdGhlIGltcGxlbWVudGF0aW9uDQo+IG1pc3NlZCBjYWxsaW5nIHRoZSBw
dGUgZmlsdGVyIGZvciBhbGwgdGhlIHB0ZXMgd2UgYXJlIHNldHRpbmcgaW4gdGhlDQo+IHJhbmdl
LiBzZXRfcHRlX2ZpbHRlciBjYW4gYmUgdXNlZCBmb3IgZmlsdGVyIHB0ZSB2YWx1ZXMgYW5kIG9u
IHNvbWUNCj4gcGxhdGZvcm1zIHdoaWNoIGRvbid0IHN1cHBvcnQgY29oZXJlbnQgaWNhY2hlIGl0
IGNsZWFycyB0aGUgZXhlYyBiaXQgc28NCj4gdGhhdCB3ZSBjYW4gZmx1c2ggdGhlIGljYWNoZSBv
biBleGVjIGZhdWx0DQo+IA0KPiBUaGUgcGF0Y2ggYWxzbyByZW1vdmVzIHRoZSB1c2FnZSBvZiBh
cmNoX2VudGVyL2xlYXZlX2xhenlfbW11KCkgYmVjYXVzZQ0KPiBzZXRfcHRlIGlzIG5vdCBzdXBw
b3NlZCB0byBiZSB1c2VkIHdoZW4gdXBkYXRpbmcgYSBwdGUgZW50cnkuIFBvd2VycGMNCj4gYXJj
aGl0ZWN0dXJlIHVzZXMgdGhpcyBydWxlIHRvIHNraXAgdGhlIGV4cGVuc2l2ZSB0bGIgaW52YWxp
ZGF0ZSB3aGljaA0KPiBpcyBub3QgbmVlZGVkIHdoZW4geW91IGFyZSBzZXR0aW5nIHVwIHRoZSBw
dGUgZm9yIHRoZSBmaXJzdCB0aW1lLiBTZWUNCj4gY29tbWl0IDU2ZWVjZGI5MTJiNSAoIm1tOiBV
c2UgcHRlcC9wbWRwX3NldF9udW1hKCkgZm9yIHVwZGF0aW5nDQo+IF9QQUdFX05VTUEgYml0Iikg
Zm9yIG1vcmUgZGV0YWlscw0KPiANCj4gRml4ZXM6IDlmZWUyOGJhYTYwMSAoInBvd2VycGM6IGlt
cGxlbWVudCB0aGUgbmV3IHBhZ2UgdGFibGUgcmFuZ2UgQVBJIikNCj4gU2lnbmVkLW9mZi1ieTog
QW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYyBiL2Fy
Y2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggM2JhOWZlNDExNjA0Li45NWFiMjBjY2Ey
ZGEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiBAQCAtMTkxLDI4ICsxOTEsMzUgQEAgdm9pZCBzZXRf
cHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRl
cCwNCj4gICAJCXB0ZV90IHB0ZSwgdW5zaWduZWQgaW50IG5yKQ0KPiAgIHsNCj4gICAJLyoNCj4g
LQkgKiBNYWtlIHN1cmUgaGFyZHdhcmUgdmFsaWQgYml0IGlzIG5vdCBzZXQuIFdlIGRvbid0IGRv
DQo+IC0JICogdGxiIGZsdXNoIGZvciB0aGlzIHVwZGF0ZS4NCj4gKwkgKiBXZSBkb24ndCBuZWVk
IHRvIGNhbGwgYXJjaF9lbnRlci9sZWF2ZV9sYXp5X21tdV9tb2RlKCkNCj4gKwkgKiBiZWNhdXNl
IHdlIGV4cGVjdCBzZXRfcHRlcyB0byBiZSBvbmx5IGJlIHVzZWQgb24gbm90IHByZXNlbnQNCj4g
KwkgKiBhbmQgbm90IGh3X3ZhbGlkIHB0ZXMuIEhlbmNlIHRoZXJlIGlzIG5vdCB0cmFuc2xhdGlv
biBjYWNoZSBmbHVzaA0KPiArCSAqIGludm9sdmVkIHRoYXQgbmVlZCB0byBiZSBiYXRjaGVkLg0K
PiAgIAkgKi8NCj4gLQlWTV9XQVJOX09OKHB0ZV9od192YWxpZCgqcHRlcCkgJiYgIXB0ZV9wcm90
bm9uZSgqcHRlcCkpOw0KPiArCWZvciAoOzspIHsNCj4gICANCj4gLQkvKiBOb3RlOiBtbS0+Y29u
dGV4dC5pZCBtaWdodCBub3QgeWV0IGhhdmUgYmVlbiBhc3NpZ25lZCBhcw0KPiAtCSAqIHRoaXMg
Y29udGV4dCBtaWdodCBub3QgaGF2ZSBiZWVuIGFjdGl2YXRlZCB5ZXQgd2hlbiB0aGlzDQo+IC0J
ICogaXMgY2FsbGVkLg0KPiAtCSAqLw0KPiAtCXB0ZSA9IHNldF9wdGVfZmlsdGVyKHB0ZSk7DQo+
ICsJCS8qDQo+ICsJCSAqIE1ha2Ugc3VyZSBoYXJkd2FyZSB2YWxpZCBiaXQgaXMgbm90IHNldC4g
V2UgZG9uJ3QgZG8NCj4gKwkJICogdGxiIGZsdXNoIGZvciB0aGlzIHVwZGF0ZS4NCj4gKwkJICov
DQo+ICsJCVZNX1dBUk5fT04ocHRlX2h3X3ZhbGlkKCpwdGVwKSAmJiAhcHRlX3Byb3Rub25lKCpw
dGVwKSk7DQo+ICAgDQo+IC0JLyogUGVyZm9ybSB0aGUgc2V0dGluZyBvZiB0aGUgUFRFICovDQo+
IC0JYXJjaF9lbnRlcl9sYXp5X21tdV9tb2RlKCk7DQo+IC0JZm9yICg7Oykgew0KPiArCQkvKiBO
b3RlOiBtbS0+Y29udGV4dC5pZCBtaWdodCBub3QgeWV0IGhhdmUgYmVlbiBhc3NpZ25lZCBhcw0K
PiArCQkgKiB0aGlzIGNvbnRleHQgbWlnaHQgbm90IGhhdmUgYmVlbiBhY3RpdmF0ZWQgeWV0IHdo
ZW4gdGhpcw0KPiArCQkgKiBpcyBjYWxsZWQuDQo+ICsJCSAqLw0KPiArCQlwdGUgPSBzZXRfcHRl
X2ZpbHRlcihwdGUpOw0KDQpXaHkgZG8geW91IG5lZWQgdG8gY2FsbCBzZXRfcHRlX2ZpbHRlcigp
IGluc2lkZSB0aGUgbG9vcCA/DQpUaGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gcHJldmlvdXMg
cHRlIGFuZCBuZXh0IHB0ZSBpcyB0aGUgUlBOLCBvdGhlciANCmZsYWdzIHJlbWFpbiB1bnRvdWNo
ZWQgc28gSSBjYW4ndCBzZWUgd2h5IHlvdSBuZWVkIHRvIGNhbGwgDQpzZXRfcHRlX2ZpbHRlcigp
IGFnYWluLg0KDQo+ICsNCj4gKwkJLyogUGVyZm9ybSB0aGUgc2V0dGluZyBvZiB0aGUgUFRFICov
DQo+ICAgCQlfX3NldF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSwgMCk7DQo+ICAgCQlpZiAo
LS1uciA9PSAwKQ0KPiAgIAkJCWJyZWFrOw0KPiAgIAkJcHRlcCsrOw0KPiAtCQlwdGUgPSBfX3B0
ZShwdGVfdmFsKHB0ZSkgKyAoMVVMIDw8IFBURV9SUE5fU0hJRlQpKTsNCj4gICAJCWFkZHIgKz0g
UEFHRV9TSVpFOw0KPiArCQkvKiBpbmNyZW1lbnQgdGhlIHBmbiAqLw0KPiArCQlwdGUgPSBfX3B0
ZShwdGVfdmFsKHB0ZSkgKyBQQUdFX1NJWkUpOw0KDQpQQUdFX1NJWkUgZG9lc24ndCB3b3JrIG9u
IGFsbCBwbGF0Zm9ybXMsIHNlZSBmb3IgaW5zdGFuY2UgZTUwMC4NCg0Kc2VlIGNvbW1lbnQgYXQg
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4zLXJjMi9zb3VyY2UvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmgjTDE0Nw0KDQpBbmQgdGhlbiB5
b3Ugc2VlIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMy1yYzIvc291cmNl
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcHRlLWU1MDAuaCNMNjMNCg0KPiArDQo+
ICAgCX0NCj4gLQlhcmNoX2xlYXZlX2xhenlfbW11X21vZGUoKTsNCj4gICB9DQo+ICAgDQo+ICAg
dm9pZCB1bm1hcF9rZXJuZWxfcGFnZSh1bnNpZ25lZCBsb25nIHZhKQ0KDQpDaHJpc3RvcGhlDQo=
