Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0316EE334
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:37:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5NNP0mJbz3fBd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 23:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PtFUmnBO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PtFUmnBO;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5NMT2g4Rz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 23:36:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlVHqrQmWjAnUbacksVUbm4oue5qJzHlu4gfO7eMQzSCwFU44ll4qjaMol4st2XXXKxfu40OZjz9Cr1uskxIFNxZo7QkxnFRn6tPah7HWjup08nfz52OGD3SUdNZNPFs2mG5jSwMOuHUODYVEDl5AQF8mGXjwmzMy/FCJoKrOJstzqAN23eoX/4jU8Y+s72DXfkq+ihjPcaIVpj4BOmYyPqZKlwUnpJ20XAkAtTWkcK9OizXht7y9p1jBAmaXCGHDj8J62ffyyKBxR0//I5FOdRp1ClR4B+9ZMr46QOPitWnLAnpJRmqu04wuvePnzuayA4+jK8CIDffNhMvey1UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6FXHj7jK7kfPMfI3/rg29bF6igOtf18iTjZYcU1Ts4=;
 b=Emx21+OFAygcLKtGXm25QaftkhFfSw8aGU+jH75T/pvSB1N98Ew9AjvYnXcAKekKi13+webHpS9TPDS5m1T1ETDgGVjk2Ryq9q/Umad2lwi4rGpdAh+I+4Pk4GOw1Mh9QNnMN/IiCuh85cBsk+YeGRdLjCStjBw8NlEEXhFpJSwms57IqmRjpTy9n4ACXLf9yU6s/qim5kK2gx6E+HaQhecXXfp44GPo5yMc4MIDQTsi91zoFBusFGfjS1Y5CL5CAEg7OvCPiNRt3AfivtCuN4s1T//jMKiryjFtEPnweQC7F2V/Cka0APH4FKfgim7/CFhCJXr14/PWkvdREVX3mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6FXHj7jK7kfPMfI3/rg29bF6igOtf18iTjZYcU1Ts4=;
 b=PtFUmnBO39XwTNO/vNC4aZ7iADyow6K+xuEnp7TnbKNNStRMrGscfh0AwLLOG56gSuQr8vggwnolblMnIq/HNSDvwzjMdpYJpkTbGP4huNiEBwwZbNxozcnxeeOKOlTmS47Cg90xlDecIO2+FqExL1PuYyUBOVf03S0asF0WIKo64IxwajvOeuuBYprFkxb0Uz3zLV8WpHyT3LOPsp9wCbFUg5qN+8p7aOs+o9Ace5NakAlXGNORuyk0wfGArYq3uohjWhdiZ8yTN1lWHDQUpnUzMm5sk9AKpe1TX2VKmizGIfoUA64f1llPvvlRHKMyFs0HB9sfIphs9pvGhrS7kA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3084.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 13:36:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 13:36:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, Joel Fernandes
	<joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Topic: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Index:  AQHZdRij7XaDRKPnAkCpLkVXFgccXa83txaAgAHnTwCAANStAIAAIX2AgAAENYCAADmigIABAIwAgAAM4ICAAA8DgIAAHNwA
Date: Tue, 25 Apr 2023 13:36:31 +0000
Message-ID: <7b76b5c6-e86e-0894-5745-b6ea8faa850c@csgroup.eu>
References:  <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAEXW_YRFZ3zDc0gJRHjJPRuNaBtnmUc+9RxSAHH48jkFw_b34g@mail.gmail.com>
 <20230425115313.GD1335080@hirez.programming.kicks-ass.net>
In-Reply-To: <20230425115313.GD1335080@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3084:EE_
x-ms-office365-filtering-correlation-id: 3907e002-f541-4628-63f2-08db4592145b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  be7kMWhasYPH1I/CVPKifMkK2C7yktWngeZALxih1Ca0RWs4pCYDvoEB2r5+YAwrIYO6akGYpB+sAVMBN4nR8lhR+l3A3tzfCKDZtYK37lTrWlXn4OuvLoLs7ClO2o0uDGODc/BwS01UCpbzPyo2w/qN1ycYDmnsMSYd+FoRXNxGxGKI3R37saqR3NIe275A8zWD7Y4+qkiY8Mef2QzhcvNpdJIHjd9f0gFlWagyONBSKsFZmzqSuWRdm8kkV6CipaaZKQV0yKbHq3WX6YjEKTSJ4ahxfxY71uMI7kKE/4J+BzePC7SCLcYRzdaR/nA/B/D63b/9J3BNlDc6blxqkSPXgBwxFG3wBAAJnyWCv2ldud9WTYscBg/6rEiheIunrDlmg+/Mz0VGR+hBhS8ah4ja4aLqrt078yQtW3g5j32hED80hLdr30olw1wnB62H5cAdK3Z2Bw9NeueQKczlISmaLrkgkfjmeL2VEYzcP5CEDZoG1J5L6QLXxpMQuiHGDUpdYmtUI/SfXskzlykDRU34hvoYuEw1q9C5Ks2EWtnk6edACRJhVBST3NoMT7y7dm2WkKTUuXRI8vabV2WQQy5NFDaYCPy6m/b0ZZ30M7xgNE4UqnIXkNTmEH5WCcvVL5MrvhhLjtKHEHWWlHLfK8QDoZ8SylZjp5oN2oEIzVqVPG0MfxLr5i3ii++niNjp
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(376002)(346002)(366004)(451199021)(36756003)(110136005)(54906003)(38070700005)(31696002)(86362001)(478600001)(38100700002)(41300700001)(122000001)(8936002)(8676002)(44832011)(2906002)(4326008)(64756008)(66446008)(66476007)(66556008)(316002)(76116006)(66946007)(91956017)(5660300002)(186003)(6512007)(6506007)(26005)(31686004)(83380400001)(66574015)(2616005)(6486002)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dlBDcCthZ0xpMFBFUGhPaXpKbkpEdE0wdTZacDJOa0VJU29BUDlqK0h4eVdG?=
 =?utf-8?B?VTdGNFl1K2tjVFA5bmVLUVlJMU01Ym5rK3R5N1FuVzlNMnVWdXpnUjJUaE0z?=
 =?utf-8?B?Q3lEZVhSRFpOMGZDYk9nRDlodWlINXZrWk1Kc2pKZ25YbU5tZ01EQWFhRUxI?=
 =?utf-8?B?Ym0vK3Vzdk85d29NYUROQnBYNjJObnBqd2hmTVN4em5TZEVmL1M3Zmswbm5v?=
 =?utf-8?B?c0M5c0lQaU93aVhJcXIvMkRiTk14ZVJseFNORGN1QUdzTGRYWWNPTVRvcDRp?=
 =?utf-8?B?bG9rdjRCMkVvWXVWNW5wZy90RW9rZjZhZkRoWnJiSytvbjJpc0hDRXV1OUcy?=
 =?utf-8?B?K0FxS09RWEVHNWZLRjJvNzAybjNML3FCMGh3RUZLclNuTE0vQ2pVckh5Qm5h?=
 =?utf-8?B?OTVUM2tNK3M0NVIvNjR5V3g3OGIyczRWV1RaQytaR3NqZ3NsMGVqT2lOUHJy?=
 =?utf-8?B?Z1pzU0RaVU1MdkI2M3NYS1VVMGxqWXVvSnB5Skc0Y0x1QjNhTUVlSHdmZzlM?=
 =?utf-8?B?b0pmaTBuVExBOHFkTXV1Rndlb21IZWgwUDR6MWNrZ0ZaVUxFUTVvd2NZN2Zp?=
 =?utf-8?B?c0NsS1kvNkZRemlvbVdqeUppOXMxcnoxZ3FaQWdLcEo0a2o2V1V2YUpBVElZ?=
 =?utf-8?B?MjVNdVNJMVZqcjdUbmRiMFlBQjV1am9ON0xMMjBRRkoxYUNHaFlvM0dDeEo4?=
 =?utf-8?B?b3Z0NGlJdXQ3TjYvKzVYK2x0QThOUkNGcVIzUEZpcnFEWU1Qc0Jvbng4VlB1?=
 =?utf-8?B?NHBKTFBoMkdjZno2QnI5WDRucU5IRk14MTJka1JreERCM1ltR1lGQlNyWGZF?=
 =?utf-8?B?Mlg5eFU5YzdiMFgyeEl1WE43TVAraitLWlFoY0NTSjBXeUt2TzZESEJVUWVl?=
 =?utf-8?B?MUhPdWUyNVV4TE14OVJJY3lOaFhuUFF4WnhQdXVscG9VSkRUKzE2K2dIUlBi?=
 =?utf-8?B?Rk1HNkloQUxQazdHNElkY3B6MEFOU1Frd2k5cGZqVjdFTnNPK1BOTjkwa1pn?=
 =?utf-8?B?VkhxMHhvK0c4aFlZVjh2MURFbG4yYVc0emNRVEVaSENGYUR4TGVpcVdjVytP?=
 =?utf-8?B?RFRYSlNqWEg2RVJnamZUNk9YQjVzVEJIMzR2UVNzaWprVlFpZzN1Uk1PR3V5?=
 =?utf-8?B?QmJKUmMrd2J2L2lGNjVYSjZla3IwKzU4UG5mbFRRdjhnc0RaWGhGSnBGUHp4?=
 =?utf-8?B?aXFFcEkxNUErcXEycENvYlRpeFJwaWFXTUVlZDlkeFZ0MllEdFdTbzBTWjRv?=
 =?utf-8?B?eHgvV3pSQmgyWmFrRCtWZDhQQlJtTFIzWE41bWNtbnNpeFI1Wmx2VWtHaFVs?=
 =?utf-8?B?RWIvRTNtazR3SG1GM01oUHZRckhNb0x2VUdGNWlaVG1DODVCNFRVa1Zia3I1?=
 =?utf-8?B?NFNEVGZGQlhWQ0dHaXEzK0JQSytISm5NZHVUbnYwVHBwaGFqWWNuVGhwYW0y?=
 =?utf-8?B?K2dWMlRZcVM3QTJMaUhod3p6bUhUNzdXN3hheDVIcVdOVUQwbDBYQXVPQjdU?=
 =?utf-8?B?R0pEcVpSY3gybXNDNDhuOWJnREcva1dGZHJKQ3VaTnNFekR4aUdRWGJLSzFR?=
 =?utf-8?B?WGFKTXRpa0x2THczTnEvSGU3ZWl5dWNtRXIva1p0N0xJVkFlN0VaeWNIeC9R?=
 =?utf-8?B?SElua1hMQ3doUytKSVFyazNacDYrdlEwWGhlcllacFVrSWZCcVJUd2NLTGFt?=
 =?utf-8?B?dEdleVVMeVY1UkxNN2tNbjlDcmNZeVJRc1JzdEJudXE3WjFDOEhSSlIxcWEw?=
 =?utf-8?B?TUJOV1BwUXY0TWZZcjNqTTA0ZlVRMkVCUndxd2FyTDFSZXl1S1R0RVkwSm5m?=
 =?utf-8?B?blZGQnpzcGVidWtZc2JTb24wRmkyYUxDR05QMVY2blpqeWFVMTJLV1V3Wmxv?=
 =?utf-8?B?QWRDbHpzWE5reTltcmx5OEZGNUNKQ1YwWjVLdE1hNWZ6a2JreDFWNkZ5aTgr?=
 =?utf-8?B?cmhuSEdsR0V2K3MycVdZaUt1NGRvOU9JV3p0aWlnVG8ycDh1NE5sSFpDSk5Y?=
 =?utf-8?B?bVdlT0kwOHNyQnZ0SWJqS05IcVl1aUpsNy9jQWpkZFdBZ05oMjNxYSt0NTZO?=
 =?utf-8?B?T0w1WXQvMGZENExuQWU4R21qZ3hUb3I1aXk4TUpVUkhuSVMzUHdDQzNjRFNO?=
 =?utf-8?B?aElPaXdaOEE0eUpUdDhDWlNNZmkzcFZxN0dzWmpEWjYwVEpHZkI4ZWVTZDAr?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00FA97C637FD7643BF9576F50F5E4F8C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3907e002-f541-4628-63f2-08db4592145b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 13:36:31.2088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lu08krGk7UQCcskj0hRYJX3V8fOf1DcAROOvdb4r2X1BVQMGY+x90zR7/YNdI6wqzt/IJBS1+c8oOVyF32oXunC4uX26T4ltFc6aqjSNFYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3084
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA0LzIwMjMgw6AgMTM6NTMsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDA2OjU5OjI5QU0gLTA0MDAsIEpvZWwgRmVybmFuZGVz
IHdyb3RlOg0KPj4+IEknbSBhIGxpdHRsZSBjb25mdXNlZDsgdGhlIHdheSBJIHVuZGVyc3RhbmQg
dGhlIHdob2xlIHN0YWNrIHByb3RlY3Rvcg0KPj4+IHRoaW5nIHRvIHdvcmsgaXMgdGhhdCB3ZSBw
dXNoIGEgY2FuYXJ5IG9uIHRoZSBzdGFjayBhdCBjYWxsIGFuZCBvbg0KPj4+IHJldHVybiBjaGVj
ayBpdCBpcyBzdGlsbCB2YWxpZC4gU2luY2UgaW4gZ2VuZXJhbCB0YXNrcyByYW5kb21seSBtaWdy
YXRlLA0KPj4+IHRoZSBwZXItY3B1IHZhbGlkYXRpb24gY2FuYXJ5IHNob3VsZCBiZSB0aGUgc2Ft
ZSBvbiBhbGwgQ1BVcy4NCj4gDQo+PiBBRkFJQ1MsIHRoZSBjYW5hcnkgaXMgcmFuZG9tbHkgY2hv
c2VuIGJvdGggaW4gdGhlIGtlcm5lbCBbMV0uIFRoaXMNCj4gDQo+IFllcywgYXQgYm9vdCwgb25j
ZS4gQnV0IHRoZXJlYWZ0ZXIgaXQgc2hvdWxkIGJlIHRoZSBzYW1lIGZvciBhbGwgQ1BVcy4NCg0K
RWFjaCB0YXNrIGhhcyBpdHMgb3duIGNhbmFyeSwgc3RvcmVkIGluIHRhc2sgc3RydWN0IDoNCg0K
a2VybmVsL2ZvcmsuYzoxMDEyOiAgICAgdHNrLT5zdGFja19jYW5hcnkgPSBnZXRfcmFuZG9tX2Nh
bmFyeSgpOw0KDQpPbiBQUEMzMiB3ZSBoYXZlIHJlZ2lzdGVyICdyMicgdGhhdCBwb2ludHMgdG8g
dGFzayBzdHJ1Y3QgYXQgYWxsIHRpbWUsIA0Kc28gR0NDIGlzIGluc3RydWN0ZWQgdG8gZmluZCBj
YW5hcnkgYXQgYW4gb2Zmc2V0IGZyb20gcjIuDQoNCkJ1dCBvbiBQUEM2NCB3ZSBoYXZlIG5vIHN1
Y2ggcmVnaXN0ZXIuIEluc3RlYWQgd2UgaGF2ZSByMTMgdGhhdCBwb2ludHMgDQp0byB0aGUgUEFD
QSBzdHJ1Y3Qgd2hpY2ggaXMgYSBwZXItY3B1IHN0cnVjdHVyZSwgYW5kIHdlIGhhdmUgYSBwb2lu
dGVyIA0KdG8gJ2N1cnJlbnQnIHRhc2sgc3RydWN0IGluIHRoZSBQQUNBIHN0cnVjdC4gU28gaW4g
b3JkZXIgdG8gYmUgYWJsZSB0byANCmhhdmUgdGhlIGNhbmFyeSBhcyBhbiBvZmZzZXQgb2YgYSBm
aXhlZCByZWdpc3RlciBhcyBleHBlY3RlZCBieSBHQ0MsIHdlIA0KY29weSB0aGUgdGFzayBjYW5h
cnkgaW50byB0aGUgY3B1J3MgUEFDQSBzdHJ1Y3QgZHVyaW5nIF9zd2l0Y2goKToNCg0KCWFkZGkJ
cjYscjQsLVRIUkVBRAkvKiBDb252ZXJ0IFRIUkVBRCB0byAnY3VycmVudCcgKi8NCglzdGQJcjYs
UEFDQUNVUlJFTlQocjEzKQkvKiBTZXQgbmV3ICdjdXJyZW50JyAqLw0KI2lmIGRlZmluZWQoQ09O
RklHX1NUQUNLUFJPVEVDVE9SKQ0KCWxkCXI2LCBUQVNLX0NBTkFSWShyNikNCglzdGQJcjYsIFBB
Q0FfQ0FOQVJZKHIxMykNCiNlbmRpZg0KDQpUaGUgcHJvYmxlbSBpcyB0aGF0IHIxMyB3aWxsIGNo
YW5nZSBpZiBhIHRhc2sgaXMgc3dpdGNoZWQgdG8gYW5vdGhlciANCkNQVS4gQnV0IGlmIEdDQyBp
cyB1c2luZyBhIGNvcHkgb2YgYW4gb2xkZXIgdmFsdWUgb2YgcjEzLCB0aGVuIGl0IHdpbGwgDQp0
YWtlIHRoZSBjYW5hcnkgZnJvbSBhbm90aGVyIENQVSdzIFBBQ0Egc3RydWN0IGhlbmNlIGl0J2xs
IGdldCB0aGUgDQpjYW5hcnkgb2YgdGhlIHRhc2sgcnVubmluZyBvbiB0aGF0IENQVSBpbnN0ZWFk
IG9mIGdldHRpbmcgdGhlIGNhbmFyeSBvZiANCnRoZSBjdXJyZW50IHRhc2sgcnVubmluZyBvbiB0
aGUgY3VycmVudCBDUFUuDQoNCkNocmlzdG9waGUNCg==
