Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D565AD920
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 20:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLy1s0zFyz307g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 04:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ieQqIwPq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.87; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ieQqIwPq;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120087.outbound.protection.outlook.com [40.107.12.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLy144mF1z2xCj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 04:37:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuMnxUqOEF2iMg6mQlvdO2wU614ud3eOKUPHI18siZZhaSDOYg7gwUiMYbCXXkKkLyguTpvVG+pYxUdCkItgNugBHnIF6CywlT6o2z2zvcT1cVgXen2wKgY/d7QpWjXfN4Z43Yr38aNV5K5UdzS9+pTVCXEPxxLaLjROBxbJlzksSTPzPlXkx5xUfeb/q2703DSdODuHkSj5sk5Zpcyw0CGlYI6OzRSqkLcS0CnzNEbj0QGU9dd0ld3Qg+wVSg5fz6zkPaWlkQW0bfH/YDcfsyiE7CZexvp9lo59mvgdRntb/FMwlTYg8ZKxEJBCGPK7SYReMhD674c7OasO2hBjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MplGlilKEZ7DUiet9vgYkvrPA1LniUkO8vu+5S+Zm3Y=;
 b=E8vzNGDo5PP+mucr7SG6LGThlucPlWP913NyiVw6nwf3dAwY5IXhkgM+90+vOnhXp5kV40Q2OPds5M2uAXMuy9erAaa1Lh6oq4wBtTXHeAHy4GII6gxNSHa+hMOI6UxzySwYQZ0nKsO0oek93wQgyjEdSGjMY3lXsUdwKsDscQAINAPppMBCGKnr6Yj8/AQHdfyqZfyeYwCOZGvWdWfHZ8/v/jNOEZHpdIYmjZT0900mM3rQXgOYjfK0jgGI5pFE1TOjCyVsu2xhnNy4iVR5ceNHoZi3IddajEuj91iPP9DWD/fyRT4FFM45MX5de7AakXzv+dJeblSdrAyASUdVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MplGlilKEZ7DUiet9vgYkvrPA1LniUkO8vu+5S+Zm3Y=;
 b=ieQqIwPqCyqCrA9T+6gdl2K7RHYCIQK8xbNl2iDJB8E7eUK1WS8ZY2qkuzPV1SBuNYeC9MalntFThtzvpgQCIZtjV3P0wIGkiqZxit74ES6XXYUO/FRD+0BE0gDyYAkA1qFCfvPw/yZkJi6tKrWS78favReaYAYoAmkBa8YCOZpQH3LNGbTEjZsBVgkz1bLfOIvz4J4oLAyjjKHBChGdMNjUL9xQnftQplPU5J8ZWf/v2MnP+tJ//E++mMysRBsTgJeKPCMLa02KTLwMXmgSUOEORtWeoapUIKHKTJ0z0HBfbujGeLmxWwMwhGoUpIZWiqVcXGXrqT05KS7SxLHhzw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1920.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 18:36:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 18:36:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] powerpc: ideas to improve page table frag allocator
Thread-Topic: [RFC PATCH] powerpc: ideas to improve page table frag allocator
Thread-Index: AQHYwQS96dmA69lfpUqMADvRH/cqTq3RKuIA
Date: Mon, 5 Sep 2022 18:36:51 +0000
Message-ID: <9598b359-733e-bcef-0a13-8cd01c8f3e2f@csgroup.eu>
References: <20220905085055.2990058-1-npiggin@gmail.com>
In-Reply-To: <20220905085055.2990058-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab0f96c7-c90f-4194-7aae-08da8f6d9957
x-ms-traffictypediagnostic: PR1P264MB1920:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ++BuFgsiHdvcF9HQLd0q0k7usynEF5JAQO5x6WgZp6XRpphzCwL9AawBe/t0qkbMI2B0R0vrWUoWoa0Dzi0Wt8jjdoQ49QbttCv8LS2uicOjEnJH2QesNS1M4HNO3rOMm5/oS34bjg3ABMkxo25/0TF6yb3gV433ZppVxLp8FBz1b3iESPTBP/u/FWW7ODkjhbfa7me9h7oolkWM69arbfiG9MMJ+fPcLZAGlf22B0GcA3Z7lRIosFspHbfPe3rDqdCRFGwfKHaUxWXaLs2aq/uCSE/mQmv+tWWoL4rmN4Ypq5WcaJEVSlXgOsr3eGeGGhfaugJol5iTp68mJqe++PiTjLLbgo/SZfVfAQCzgx0J/IBB5aIfzMedVscijm9cevj4zhqTqA6mPXKRNyEG1KWHRIFv74Zfbt/QHFyOcGLFwnTXnaR1ZLj084obNQ3ujo4CURACnrkP3W+Ir8pxwC+L9WRTf/fvD7X9J+lXQWt97XbGqYxZVPc5XBOo3dAdQRYuXXQdqOFdecV+viFUO8uJ9aBCl2vdDJGsH1ox3ZYJSNUlpYHyUVMOb1sa5vEgBPgTK/j+S4zfhvxrLx3SpaOauUVQRqAZkma3k3oUw+orZdkYyWXoapZpkQzfnHsmFGO6nVfEoOjJzhvDDcxi+SNvl3D1aBBuxJ6eW62mj529iP2tcti18uR4QqQJHXQIy74gBbP6Fe1VKpTPLCEqjd+fc1zSSNNeCE4/9CwTunqOgfw1E+GmxOZ6ihS5c1A8TXc0Sv6UMcG/C3dgljtoteA+fPaVt+Szc/vcaaaO+OMYihV+IbGUdAHmSs27NtUMZXCYMglNmj0GaAxJcGTxXw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(86362001)(66574015)(186003)(2616005)(41300700001)(6486002)(71200400001)(31696002)(6512007)(26005)(478600001)(38070700005)(6506007)(122000001)(38100700002)(83380400001)(316002)(5660300002)(36756003)(2906002)(44832011)(64756008)(76116006)(66946007)(31686004)(8936002)(66446008)(8676002)(110136005)(66556008)(66476007)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MjQ2eDZCYlRMR3FKNHJVeHNaTVhOcnlCVlZ0L3ZTQTNINGpIRXI2SVFGdXNU?=
 =?utf-8?B?VUduazRuTHNReDhwd3N6RlJ4c3RacER5NkwwcmRvbUdZOUIxcG5Tbk02YjdK?=
 =?utf-8?B?cXM0ckMvRlZpc29WRnBrMFNHK1hkdFBCeFRBK1BKbUZhVmJNNStSZXJ2Nlpv?=
 =?utf-8?B?djB3Y0c4N25SdHhzVlpSOE1DeGY3c1pJWkhtaHNkU1pESVZyMzNDTWZBQ0ls?=
 =?utf-8?B?dkcxY3ViQUlNN090TGZLV2EySlpqYzN1UVlzcm5xWU9wQkwxMEY4TTdUZWYw?=
 =?utf-8?B?STFQT2E0R0Y4dnhZempOaittRDI1RXJVTGNsRm10UXpOQU4rZFV0L1N3Z1R0?=
 =?utf-8?B?T21EN2xuRmt6NkgrR3BZdU9XZjh5L3VOdWRPbUFWdHhrcisxVytDM0d6TGFt?=
 =?utf-8?B?ZWtSbEdjcHBYb2FRZWxJVUhWTXE3QVUyZ2hkQWZOalZIZ2JOdHlhaTlzRU1k?=
 =?utf-8?B?UlE4Y1FIaXdEdHR1L2RFM0NNVEVWODhwMWNhSC8rN0xhdUhwc3Q3WGd3WHcv?=
 =?utf-8?B?NVZlYk9DN3d3K2FpY1J6Z1A2SnFzVDBuenZPMWdrZXdhYkt6VjJ3azBDK2Nm?=
 =?utf-8?B?bXRoVUhZWUovR3FnRWcybUZJbzRQWk1hMTNQZXBYZ0t3VFFlS3ZENUNuMTVI?=
 =?utf-8?B?WXh0SEQvM1hOMCtuZVpsNjFacUk2QlQzMm1Ld1dqNXJ3dVVOSGFuQ05KMXdX?=
 =?utf-8?B?NFFENWRYRncyM1ZNUU9wZ1V5VkR1Z2xvTVcvMXM0WTBnMkwyU2JuVklsMzg3?=
 =?utf-8?B?K0VieGFMc0Y5KzNvVUlibGxZQlZXd0VqUmE0dFJSOVRudTBsK0tyZVY5UEJs?=
 =?utf-8?B?TjAzS0tjNFdJeEFpOUhoU0pUZFFCbU51aVRra2szcUlibDQvTTB0TXVqVkZi?=
 =?utf-8?B?WjhUdndqcTJKZnJ0YUtobnNrSTMxZ0hVRnQvelFBSUR1RXlYY2l2YzRteHUx?=
 =?utf-8?B?djd6R1lwenVUOW1UZ3NtQWFZZ3lWazYybndhSFJvSXpJMEdsMHFXNjBMMm1y?=
 =?utf-8?B?enBIaFJqNVlhVWN4Qm50aWhXdGtzRmpieWRjQmVkRk9lWlhrRVFrdWhRNmdV?=
 =?utf-8?B?TDJiYVBEejJXZCthblVBYi9ZUkFTMmNYdmhSWW5DQnRJbk5mYkFSUlEyNEM2?=
 =?utf-8?B?aUVRWGFwdXhWbTdObzFZbUZVQ0VlWDdIMVpTVXI2UWZDdDUrOVA1MGdwa1Nj?=
 =?utf-8?B?ak1KZ3E4dHA0ckdQZyt5NmxpZE9SSnZUMk5FRHRqb3lKczVraWpwK0JTb0pI?=
 =?utf-8?B?cENBeWtxN0hQa0lTVTNEdk0yZUsxVXhDN3c3SVdiVEdVbGRhRjUzamhxZ1NI?=
 =?utf-8?B?TXRibU82d1hwRjVKbkhndnd2L3FCaDZkK1djVStNcngweWpqZnJIQWZEcHUy?=
 =?utf-8?B?K1cxOEwzR1Vtb05qM3NSS2V5UnFWWHlzWUl5OWZ0NVRhdSsxaHp2UmlZZWZT?=
 =?utf-8?B?Z1lDYmtSeFA2aWpUbDZsVDlTQUZTMnNsSVAwWjFrNUhMODNvSDhyc2pDZGxj?=
 =?utf-8?B?R3RaSmJabWUrVjVFaUprdVhORmJrUTdiZnY1YUpNYVNpMWEwSy9XM1I5OWti?=
 =?utf-8?B?bFgrVUh4cDRodU9PRTJUdEVIZXZmZG5UeHpnbFpTRnFCTWxHRlZGUjU1Ukc0?=
 =?utf-8?B?a2dNU2VyRzNUUXRmZVpzdSs3RVYwRU1vQzNES0UrYUpSYjlNVmlhNXYzL3Rl?=
 =?utf-8?B?a1lvSFdwMDdqaE1PSmIwV1lSb1lDVlJWb2JYUkUvajRWVmhzdnpwU0pwZEJ5?=
 =?utf-8?B?aHQ4TkRvNFVMMEVVbEVrQUd3bWd6Qy9QYjFzdmpXMlhWVTRDOXRtY1hNb0FO?=
 =?utf-8?B?aTkyMEFINHZ5QzBOVktzTW02NjRhK3Z2NjJKVXpjeVQ5dTBobGpSNW1FbGtI?=
 =?utf-8?B?M1ZFYWdrVzNxSkFrbVpNWnVlWVJqalMvSWRCVjB5ckZZNVREOVpEVC8zazZw?=
 =?utf-8?B?dUZmdC9SY2xSTGIyUFJwUFdHa3VXcDdyYmY4eXliZ08vSDBDenc3R0dVREN4?=
 =?utf-8?B?QWpxOXRUdytINFpFczJjekkybCtYOWtNNkoyZzJhTWVSRWNtODl1OHNScjVZ?=
 =?utf-8?B?K3d6M3FZNTA1TnV5T3E1Z2kvRmdVczFseE5PTC9hMHBDa2Y0M3IwYjJUUEZB?=
 =?utf-8?B?eUpuNFk0bWsrYlNCUG92RTd0TFp0aDcvUk9MaVRtSzdYUmd0ZVlDd3JEMmQ3?=
 =?utf-8?Q?bDht4dA7YOQpBIZjeK8JhQg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF8DFDD1B68C743ADC839EEE95E48E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0f96c7-c90f-4194-7aae-08da8f6d9957
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 18:36:51.2732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lj26CTMynf1RXwYgEF7QcLmXmU2QFd2TKy0NXsH4ESEVveWC3gIOvMFU40gOPMCBFRzQKHybiMbnBJI6sAQHIHrGrzxwl4+/eksbXGVprYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1920
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzA5LzIwMjIgw6AgMTA6NTAsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBUaGUgcGFnZSB0YWJsZSBmcmFnbWVudCBhbGxvY2F0b3IgaXMgYSBzaW1wbGUgcGVyLW1tIHNs
YWIgYWxsb2NhdG9yLg0KPiBJdCBjYW4gYmUgcXVpdGUgd2FzdGVmdWwgb2Ygc3BhY2UgZm9yIHNt
YWxsIHByb2Nlc3NlcywgYXMgd2VsbCBhcyBiZWluZw0KPiBleHBlbnNpdmUgdG8gaW5pdGlhbGlz
ZS4gIEl0IGRvZXMgbm90IGRvIHdlbGwgYXQgTlVNQSBhd2FyZW5lc3MuDQo+IA0KPiBUaGlzIGlz
IGEgcXVpY2sgaGFjayBhdCBhZGRyZXNzaW5nIHNvbWUgb2YgdGhvc2UgcHJvYmxlbXMsIGJ1dCBp
dCdzIG5vdA0KPiBjb21wbGV0ZS4gSXQgZG9lc24ndCBzdXBwb3J0IFRIUCBiZWNhdXNlIGl0IGRv
ZXNuJ3QgZGVhbCB3aXRoIHRoZSBwYWdlDQo+IHRhYmxlIGRlcG9zaXQuIEl0IGhhcyBoYXMgY2Vy
dGFpbiBjYXNlcyB3aGVyZSBjcm9zcy1DUFUgbG9ja2luZyBjb3VsZCBiZQ0KPiBpbmNyZWFzZWQg
KGJ1dCBhbHNvIGEgcmVkdWN0aW9uIGluIG90aGVyIGNhc2VzIGluY2x1ZGluZyByZWR1Y3Rpb24g
b24NCj4gcHRsKS4gTlVNQSBzdGlsbCBoYXMgc29tZSBjb3JuZXIgY2FzZSBpc3N1ZXMsIGJ1dCBp
dCBpcyBpbXByb3ZlZC4gU28NCj4gaXQncyBub3QgbWVyZ2VhYmxlIHlldCBvciBuZWNlc3Nhcmls
eSB0aGUgYmVzdCB3YXkgdG8gc29sdmUgdGhlDQo+IHByb2JsZW1zLiBKdXN0IGEgcXVpY2sgaGFj
ayBmb3Igc29tZSB0ZXN0aW5nLg0KPiANCj4gSXQgc2F2ZSAxLTJNQiBvbiBhIHNpbXBsZSBkaXN0
cm8gYm9vdCBvbiBhIHNtYWxsICg0IENQVSkgc3lzdGVtLiBUaGUNCj4gcG93ZXJwYyBmb3JrIHNl
bGZ0ZXN0cyBiZW5jaG1hcmsgd2l0aCAtLWZvcmsgcGVyZm9ybWFuY2UgaXMgaW1wcm92ZWQgYnkN
Cj4gMTUlIG9uIGEgUE9XRVI5ICgxNC41ay9zIC0+IDE3ay9zKS4gVGhpcyBpcyBqdXN0IGFib3V0
IGEgd29yc3QtY2FzZQ0KPiBtaWNyb2JlbmNobWFyaywgYnV0IHdvdWxkIHN0aWxsIGJlIGdvb2Qg
dG8gZml4IGl0Lg0KPiANCj4gV2hhdCB3b3VsZCByZWFsbHkgYmUgbmljZSBpcyBpZiB3ZSBjb3Vs
ZCBhdm9pZCB3cml0aW5nIG91ciBvd24gYWxsb2NhdG9yDQo+IGFuZCB1c2UgdGhlIHNsYWIgYWxs
b2NhdG9yLiBUaGUgcHJvYmxlbSBiZWluZyB3ZSBuZWVkIGEgcGFnZSB0YWJsZSBsb2NrDQo+IHNw
aW5sb2NrIGFzc29jaWF0ZWQgd2l0aCB0aGUgcGFnZSB0YWJsZSwgYW5kIHRoYXQgbXVzdCBiZSBh
YmxlIHRvIGJlDQo+IGRlcml2ZWQgZnJvbSB0aGUgcGFnZSB0YWJsZSBwb2ludGVyLCBhbmQgSSBk
b24ndCB0aGluayBzbGFiIGhhcyBhbnl0aGluZw0KPiB0aGF0IGZpdHMgdGhlIGJpbGwuDQoNCkkg
aGF2ZSBub3QgbG9va2VkIGF0IGl0IGluIGRldGFpbHMgeWV0LCBidXQgSSBoYXZlIHRoZSBmZWVs
aW5nIHRoYXQgdGhlIA0KaGFuZGxpbmcgb2Ygc2luZ2xlLWZyYWdtZW50IGFyY2hpdGVjdHVyZXMg
aGF2ZSBkaXNhcHBlYXJlZC4NCg0KVGhhdCdzIGNvbW1pdCAyYTE0NjUzM2JmOTYgKCJwb3dlcnBj
L21tOiBBdm9pZCB1c2VsZXNzIGxvY2sgd2l0aCBzaW5nbGUgDQpwYWdlIGZyYWdtZW50cyIpLg0K
DQpUaGFua3MgdG8gdGhhdCBvcHRpbWlzYXRpb24sIGFsbCBwbGF0Zm9ybXMgd2VyZSBjb252ZXJ0
ZWQgdG8gcGFnZSANCmZyYWdtZW50cyB3aXRoOg0KLSBjb21taXQgMzJlYTRjMTQ5OTkwICgicG93
ZXJwYy9tbTogRXh0ZW5kIHB0ZV9mcmFnbWVudCBmdW5jdGlvbmFsaXR5IHRvIA0KUFBDMzIiKQ0K
LSBjb21taXQgNzM3YjQzNGQzZDU1ICgicG93ZXJwYy9tbTogY29udmVydCBCb29rM0UgNjQgdG8g
cHRlX2ZyYWdtZW50IikNCg0KDQpCdXQgaWYgdGhlIG9wdGltaXNhdGlvbiBpcyByZW1vdmVkIHRo
ZW4gSSBndWVzcyB0aGUgY29zdCB3aWxsIGxpa2VseSBiZSANCmhpZ2hlciB0aGFuIGJlZm9yZS4N
Cg0KQ2hyaXN0b3BoZQ0K
