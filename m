Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FB5309B07
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 08:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DT3Nz5ctJzDrQc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 18:58:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vmware.com (client-ip=40.107.243.48;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=qdKLj4q3; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DT3MD1mljzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 18:57:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhExYwokGhWDQPZ7b/rTYEaYdY2ainQkvgXSKZO4zkP3pECOwVFLoNtMysD8/VFi0EGiv1NPoWHCczAocydfMCD5+wRey3g6fjDUflPteqTnhJIv6jrySbzevwFNkQ0BxVHZjFnVqr5SvZVuF9OAAsIIs5+p+rxyATiXl4/mh5WX+J0OubGndhk1GqvyMlMB9Wg5+GfQnZgB0iBOJlCBcxmat062iNv1kI2Txg8rYMxJD6ntxgLNpfgcR9gI4GDZqzM/eMDow23xYtbVBLwzeB3PljuRezZ7ag0Lqh1+MzDSDRj59oI8biQOpRT3B3f9gGsFMYQbzSfRxvZPi0oU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jdurUeNEDdHkdMa/vo+XcnMIVKb854aK31RdK5BPgo=;
 b=eCJrl2KLEQiPcJksYw4O75hdn+Bgvb6mPvvb04VS46xmNVNZ414tLDOr2EhqtO4H4xvOEAMtJ4Lv4YDMWUbb0vlfuYlxmsos0aH//EN7QnzVCAmdTil2n07faUjadplN6zHwjIbHO5SBqZvSymrZkkFyq30rnMvrwDocW0ls/e+gNKyhXhrdxDh+9iCiWYOa8QeHZPCrmdHMj3ov4fqBIokLgogAyZYICdNwSkD+8lL1I+yVnDJq3+aS02I4LaMXhyf/CALbE3XLCPs7lssJx2IB+GeFAzgL+whkMODNIjHx68oiZ8hs4OIffLTrSB/Rxd38Z05SCXouQb9CUkUAeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jdurUeNEDdHkdMa/vo+XcnMIVKb854aK31RdK5BPgo=;
 b=qdKLj4q3WUcsS+8eef0YrIZc1Eu0TgGkQO9n4DXqZ3sNc32xuwkQZWTLmAAO1emUBvAt/siZqRn1eEOW+CCM0RJX2oS7UjB2YSxamPKjS7nmRyXl9LmE4Cn8fjqSwHg84ehR5LUc+WVlTskZr9hMdTQMuWMV5h8aWadmaO8wF8Q=
Received: from (2603:10b6:a03:4a::18) by
 SJ0PR05MB7577.namprd05.prod.outlook.com (2603:10b6:a03:2e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.11; Sun, 31 Jan
 2021 07:57:01 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31%3]) with mapi id 15.20.3825.013; Sun, 31 Jan 2021
 07:57:01 +0000
From: Nadav Amit <namit@vmware.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC 00/20] TLB batching consolidation and enhancements
Thread-Topic: [RFC 00/20] TLB batching consolidation and enhancements
Thread-Index: AQHW94F8jqirOcyt10i89p5eRNXwdKpBXksA
Date: Sun, 31 Jan 2021 07:57:01 +0000
Message-ID: <A1589669-34AE-4E15-8358-79BAD7C72520@vmware.com>
References: <20210131001132.3368247-1-namit@vmware.com>
 <1612063149.2awdsvvmhj.astroid@bobo.none>
In-Reply-To: <1612063149.2awdsvvmhj.astroid@bobo.none>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [24.6.216.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c502c0d6-ce34-406c-052b-08d8c5bdcade
x-ms-traffictypediagnostic: SJ0PR05MB7577:
x-microsoft-antispam-prvs: <SJ0PR05MB757725E8519D6FB4B395874FD0B79@SJ0PR05MB7577.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O8/5dI6iWAaY/ljqSvy2HV+hISleAdkHBhoHt9cuQ38e5633eX5bIVg5J0mxPSroNeV0yK7A3XwZyFFCOrLv0s2sx0VxDY2Qu6aKNe2xGMZ3veJyIIGrvoTqZZ+C7aX+apydYGST38H70nQIT4IxsUgahaz0EdMD3iYgvZwv5dRncNJvajZTmB5lSP21tUDYq4Gp0s60OWSUvtKba4Kk196NlrVkiw43VID52OppuvUaYby44NBQ98pZr0fK9mhWYC4c3XyaRN6pKVm85MAzDn6MHW3ZlsDAFHEGkr1NqtVhlzJD7GRkKkUdwdW2J4OknWz91XfpMyGXJnMLZcbDu+2q6CxDJOrX5aOxBPuKpJkTXzcY6OtBmrLpCHe0tlr/mOXLtyuf9aretCG4/EBEBprb6UWi6B39zUvwl0S7A2iO/fuDQn8+j2c2/q0gbx9FRPHg7eGGzlKMv4DzC1PE7/8zoTsSQlL82WnlKvDiLxEpN+sQj80dTyewwkqLvNRqvjVAhvISM+YFzNhRTI3OBO8P7isYnZop4jiclUCyp2x7Eoe1LIS8XTkThYt2x4DZa0Bv/QkjISa6Y7nPuFgudA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4776.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39850400004)(376002)(83380400001)(7416002)(66946007)(478600001)(66476007)(53546011)(33656002)(36756003)(6486002)(66446008)(64756008)(86362001)(6506007)(2616005)(6512007)(186003)(5660300002)(8936002)(4326008)(71200400001)(54906003)(66556008)(316002)(76116006)(6916009)(8676002)(2906002)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QkZyVm1YQ0syZnliMmNuUnJRRk5EUjBiQmpnMGVSeXhLa1FVekdGWkxrc09n?=
 =?utf-8?B?K05lQTNWOVJ4QURmazc2UjBiNUcwbEVHRXhLVGRMeVJLRkxSRjF1Z0s5S1px?=
 =?utf-8?B?UnNQR0plK2ovUHJybTlOMlBlRjE3SEY2UWMyWmd0OWdEc1JNWC9heEJEQ1RC?=
 =?utf-8?B?Y1BGYTBqNnlPQWc3NHc4R0JUWVBQMU5CaUdHM2RVQUU0VzZCM050MVpETThw?=
 =?utf-8?B?YVI2dUhUVTIvc0dJcjNsNEpHQlMzeXFrblJVdHhBYjg5VXBsaVNEWERpWXpV?=
 =?utf-8?B?djlJQjhzY09UMWxqNVdOc1pHQmFZVFJiR01rM1MzVWxVWjY4MVNPWDdqY3Bm?=
 =?utf-8?B?VElKdEg1K1kzamlWazF2cnhreXNEVmFYM3hHRUI0N0o2MXduV1lXZkRTK1Uz?=
 =?utf-8?B?SWpMYlRObE1iSzVYVTlTUzdkalFUemU0SzU2Y3lzYzhVbjFMZnpaZVBNSVcz?=
 =?utf-8?B?aU5wenU4bzVRZWhCQjZrZytrSkNXME0yRmlGUEZKYmVTT2lGMmpOeW5tMDFJ?=
 =?utf-8?B?SUdNRGptWTBINVl2YyszQkhJdGd3V241UE9YbVl6aFBJUWdBZGpXNEFMOUhG?=
 =?utf-8?B?dzMrRUVWNzZ1MnhqbXkzdUJ0OWtKWjRSaFlCUkxLNkh4S1NjTUV5eG81UWNZ?=
 =?utf-8?B?VDJZZFZKbDh4UUZxZ2RURUR5SFNXZGJUckxiRkoyTkplVmpjYVRuMFdSR3VK?=
 =?utf-8?B?VmF0TVF0NFFsSzBqNDlDZHR0YlRvNDhIZ3NUcDFnNk9seERwSk0waURJRW9m?=
 =?utf-8?B?RjBCZW10bHlFQU9aRnM0WlhDUldrU3o4WDJOR2tXZ3RPZU9reGpQVVJMZnhw?=
 =?utf-8?B?RWNFM0tGMW1pMlZzYWdUS3hWVlVycTdua2tSWE4rMDBWUkV4V3JPUzg2dG02?=
 =?utf-8?B?TXJ1UHAxQi8xZ3RZSlhwQ0w2Y0JxV3hhbWtTYnNENk8vQXRzajMzTHhFcGlE?=
 =?utf-8?B?MzFmMEdTSk9XSTkvc2IwdTRUcGNkaHJGS2F3MDJ0S0FHTzdKeVdNUmVBRVkr?=
 =?utf-8?B?WVdDWUhneVBydHRQMUI1b0hEVDhtU0h1blNGTWwzc2d0MC81bVk0QVBjLy82?=
 =?utf-8?B?dTJiVjRvRnpWcWtrQWxtSlcxdVpFRm9tMmZGYXdrQjNEbGRmQTFPWXhzUS9p?=
 =?utf-8?B?Q3laTUZBcUZpZkV0QTd0RjVwdGl5cWc5eDFidm93OURmN1Q0Y1pqT2tWZWdl?=
 =?utf-8?B?NklzZUQ1NTJPUVpacWdvRG9aaW1GV1RHekg1eHVHYTcyeUtybFg4QlA4bE1k?=
 =?utf-8?B?STh6ZHNaRHIxN1lwK0dDeW8zYThSRTRtRithVjRVTUFvQnZ1WWx3UVVFaVRn?=
 =?utf-8?B?V2ZmYXBmSjROUzdrM3pyaGpPNWl1a2xlTHhTSnc1R1J5Kzhya1ZKUkhBbUN1?=
 =?utf-8?B?OFFuRDFENDhENWVMUXhDTjVnYVNZYWU2ZDB4VzlXSWk3MTRQd29DMVpxbksz?=
 =?utf-8?Q?LZJ3fHNu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <255E65CB0F9C7542894A7BCF6BD721DF@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4776.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c502c0d6-ce34-406c-052b-08d8c5bdcade
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2021 07:57:01.4694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dq2XtVC0XcQ8rezTTLZRBTQ8oXmrIxybigZ7mAaKFcFMWsKYz/ozS9THwvBZZ7GwOvIsvJkLKOQJqHZDC3seQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7577
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiBKYW4gMzAsIDIwMjEsIGF0IDc6MzAgUE0sIE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBn
bWFpbC5jb20+IHdyb3RlOg0KPiANCj4gRXhjZXJwdHMgZnJvbSBOYWRhdiBBbWl0J3MgbWVzc2Fn
ZSBvZiBKYW51YXJ5IDMxLCAyMDIxIDEwOjExIGFtOg0KPj4gRnJvbTogTmFkYXYgQW1pdCA8bmFt
aXRAdm13YXJlLmNvbT4NCj4+IA0KPj4gVGhlcmUgYXJlIGN1cnJlbnRseSAoYXQgbGVhc3Q/KSA1
IGRpZmZlcmVudCBUTEIgYmF0Y2hpbmcgc2NoZW1lcyBpbiB0aGUNCj4+IGtlcm5lbDoNCj4+IA0K
Pj4gMS4gVXNpbmcgbW11X2dhdGhlciAoZS5nLiwgemFwX3BhZ2VfcmFuZ2UoKSkuDQo+PiANCj4+
IDIuIFVzaW5nIHtpbmN8ZGVjfV90bGJfZmx1c2hfcGVuZGluZygpIHRvIGluZm9ybSBvdGhlciB0
aHJlYWRzIG9uIHRoZQ0KPj4gICBvbmdvaW5nIGRlZmVycmVkIFRMQiBmbHVzaCBhbmQgZmx1c2hp
bmcgdGhlIGVudGlyZSByYW5nZSBldmVudHVhbGx5DQo+PiAgIChlLmcuLCBjaGFuZ2VfcHJvdGVj
dGlvbl9yYW5nZSgpKS4NCj4+IA0KPj4gMy4gYXJjaF97ZW50ZXJ8bGVhdmV9X2xhenlfbW11X21v
ZGUoKSBmb3Igc3BhcmMgYW5kIHBvd2VycGMgKGFuZCBYZW4/KS4NCj4+IA0KPj4gNC4gQmF0Y2hp
bmcgcGVyLXRhYmxlIGZsdXNoZXMgKG1vdmVfcHRlcygpKS4NCj4+IA0KPj4gNS4gQnkgc2V0dGlu
ZyBhIGZsYWcgb24gdGhhdCBhIGRlZmVycmVkIFRMQiBmbHVzaCBvcGVyYXRpb24gdGFrZXMgcGxh
Y2UsDQo+PiAgIGZsdXNoaW5nIHdoZW4gKHRyeV90b191bm1hcF9vbmUoKSBvbiB4ODYpLg0KPj4g
DQo+PiBJdCBzZWVtcyB0aGF0ICgxKS0oNCkgY2FuIGJlIGNvbnNvbGlkYXRlZC4gSW4gYWRkaXRp
b24sIGl0IHNlZW1zIHRoYXQNCj4+ICg1KSBpcyByYWN5LiBJdCBhbHNvIHNlZW1zIHRoZXJlIGNh
biBiZSBtYW55IHJlZHVuZGFudCBUTEIgZmx1c2hlcywgYW5kDQo+PiBwb3RlbnRpYWxseSBUTEIt
c2hvb3Rkb3duIHN0b3JtcywgZm9yIGluc3RhbmNlIGR1cmluZyBiYXRjaGVkDQo+PiByZWNsYW1h
dGlvbiAodXNpbmcgdHJ5X3RvX3VubWFwX29uZSgpKSBpZiBhdCB0aGUgc2FtZSB0aW1lIG1tdV9n
YXRoZXINCj4+IGRlZmVycyBUTEIgZmx1c2hlcy4NCj4+IA0KPj4gTW9yZSBhZ2dyZXNzaXZlIFRM
QiBiYXRjaGluZyBtYXkgYmUgcG9zc2libGUsIGJ1dCB0aGlzIHBhdGNoLXNldCBkb2VzDQo+PiBu
b3QgYWRkIHN1Y2ggYmF0Y2hpbmcuIFRoZSBwcm9wb3NlZCBjaGFuZ2VzIHdvdWxkIGVuYWJsZSBz
dWNoIGJhdGNoaW5nDQo+PiBpbiBhIGxhdGVyIHRpbWUuDQo+PiANCj4+IEFkbWl0dGVkbHksIEkg
ZG8gbm90IHVuZGVyc3RhbmQgaG93IHRoaW5ncyBhcmUgbm90IGJyb2tlbiB0b2RheSwgd2hpY2gN
Cj4+IGZyaWdodGVucyBtZSB0byBtYWtlIGZ1cnRoZXIgYmF0Y2hpbmcgYmVmb3JlIGdldHRpbmcg
dGhpbmdzIGluIG9yZGVyLg0KPj4gRm9yIGluc3RhbmNlLCB3aHkgaXMgb2sgZm9yIHphcF9wdGVf
cmFuZ2UoKSB0byBiYXRjaCBkaXJ0eS1QVEUgZmx1c2hlcw0KPj4gZm9yIGVhY2ggcGFnZS10YWJs
ZSAoYnV0IG5vdCBpbiBncmVhdGVyIGdyYW51bGFyaXR5KS4gQ2FuJ3QNCj4+IENsZWFyUGFnZURp
cnR5KCkgYmUgY2FsbGVkIGJlZm9yZSB0aGUgZmx1c2gsIGNhdXNpbmcgd3JpdGVzIGFmdGVyDQo+
PiBDbGVhclBhZ2VEaXJ0eSgpIGFuZCBiZWZvcmUgdGhlIGZsdXNoIHRvIGJlIGxvc3Q/DQo+IA0K
PiBCZWNhdXNlIGl0J3MgaG9sZGluZyB0aGUgcGFnZSB0YWJsZSBsb2NrIHdoaWNoIHN0b3BzIHBh
Z2VfbWtjbGVhbiBmcm9tIA0KPiBjbGVhbmluZyB0aGUgcGFnZS4gT3IgYW0gSSBtaXN1bmRlcnN0
YW5kaW5nIHRoZSBxdWVzdGlvbj8NCg0KVGhhbmtzLiBJIHVuZGVyc3Rvb2QgdGhpcyBwYXJ0LiBM
b29raW5nIGFnYWluIGF0IHRoZSBjb2RlLCBJIG5vdyB1bmRlcnN0YW5kDQpteSBjb25mdXNpb246
IEkgZm9yZ290IHRoYXQgdGhlIHJldmVyc2UgbWFwcGluZyBpcyByZW1vdmVkIGFmdGVyIHRoZSBQ
VEUgaXMNCnphcHBlZC4NCg0KTWFrZXMgbWUgd29uZGVyIHdoZXRoZXIgaXQgaXMgb2sgdG8gZGVm
ZXIgdGhlIFRMQiBmbHVzaCB0byB0bGJfZmluaXNoX21tdSgpLA0KYnkgcGVyZm9ybWluZyBzZXRf
cGFnZV9kaXJ0eSgpIGZvciB0aGUgYmF0Y2hlZCBwYWdlcyB3aGVuIG5lZWRlZCBpbg0KdGxiX2Zp
bmlzaF9tbXUoKSBbIGkuZS4sIGJ5IG1hcmtpbmcgZm9yIGVhY2ggYmF0Y2hlZCBwYWdlIHdoZXRo
ZXINCnNldF9wYWdlX2RpcnR5KCkgc2hvdWxkIGJlIGlzc3VlZCBmb3IgdGhhdCBwYWdlIHdoaWxl
IGNvbGxlY3RpbmcgdGhlbSBdLg0KDQo+IEknbGwgZ28gdGhyb3VnaCB0aGUgcGF0Y2hlcyBhIGJp
dCBtb3JlIGNsb3NlbHkgd2hlbiB0aGV5IGFsbCBjb21lIA0KPiB0aHJvdWdoLiBTcGFyYyBhbmQg
cG93ZXJwYyBvZiBjb3Vyc2UgbmVlZCB0aGUgYXJjaCBsYXp5IG1vZGUgdG8gZ2V0IA0KPiBwZXIt
cGFnZS9wdGUgaW5mb3JtYXRpb24gZm9yIG9wZXJhdGlvbnMgdGhhdCBhcmUgbm90IGZyZWVpbmcg
cGFnZXMsIA0KPiB3aGljaCBpcyB3aGF0IG1tdSBnYXRoZXIgaXMgZGVzaWduZWQgZm9yLg0KDQpJ
SVVDIHlvdSBtZWFuIGFueSBQVEUgY2hhbmdlIHJlcXVpcmVzIGEgVExCIGZsdXNoLiBFdmVuIHNl
dHRpbmcgdXAgYSBuZXcgUFRFDQp3aGVyZSBubyBwcmV2aW91cyBQVEUgd2FzIHNldCwgcmlnaHQ/
DQoNCj4gSSB3b3VsZG4ndCBtaW5kIHVzaW5nIGEgc2ltaWxhciBBUEkgc28gaXQncyBsZXNzIG9m
IGEgYmxhY2sgYm94IHdoZW4gDQo+IHJlYWRpbmcgZ2VuZXJpYyBjb2RlLCBidXQgaXQgbWlnaHQg
bm90IHF1aXRlIGZpdCB0aGUgbW11IGdhdGhlciBBUEkNCj4gZXhhY3RseSAobW9zdCBvZiB0aGVz
ZSBwYXRocyBkb24ndCB3YW50IGEgZnVsbCBtbXVfZ2F0aGVyIG9uIHN0YWNrKS4NCg0KSSBzZWUg
eW91ciBwb2ludC4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIGNyZWF0ZSB0d28gbW11X2dhdGhlciBz
dHJ1Y3RzOiBhDQpzbWFsbCBvbmUgdGhhdCBvbmx5IGhvbGRzIHRoZSBmbHVzaCBpbmZvcm1hdGlv
biBhbmQgYW5vdGhlciB0aGF0IGFsc28gaG9sZHMNCnRoZSBwYWdlcy4gDQoNCj4+IFRoaXMgcGF0
Y2gtc2V0IHRoZXJlZm9yZSBwZXJmb3JtcyB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+PiANCj4+
IDEuIENoYW5nZSBtcHJvdGVjdCwgdGFza19tbXUgYW5kIG1hcHBpbmdfZGlydHlfaGVscGVycyB0
byB1c2UgbW11X2dhdGhlcg0KPj4gICBpbnN0ZWFkIG9mIHtpbmN8ZGVjfV90bGJfZmx1c2hfcGVu
ZGluZygpLg0KPj4gDQo+PiAyLiBBdm9pZCBUTEIgZmx1c2hlcyBpZiBQVEUgcGVybWlzc2lvbiBp
cyBub3QgZGVtb3RlZC4NCj4+IA0KPj4gMy4gQ2xlYW5zIHVwIG1tdV9nYXRoZXIgdG8gYmUgbGVz
cyBhcmNoLWRlcGVuZGFudC4NCj4+IA0KPj4gNC4gVXNlcyBtbSdzIGdlbmVyYXRpb25zIHRvIHRy
YWNrIGluIGZpbmVyIGdyYW51bGFyaXR5LCBlaXRoZXIgcGVyLVZNQQ0KPj4gICBvciBwZXIgcGFn
ZS10YWJsZSwgd2hldGhlciBhIHBlbmRpbmcgbW11X2dhdGhlciBvcGVyYXRpb24gaXMNCj4+ICAg
b3V0c3RhbmRpbmcuIFRoaXMgc2hvdWxkIGFsbG93IHRvIGF2b2lkIHNvbWUgVExCIGZsdXNoZXMg
d2hlbiBLU00gb3INCj4+ICAgbWVtb3J5IHJlY2xhbWF0aW9uIHRha2VzIHBsYWNlIHdoaWxlIGFu
b3RoZXIgb3BlcmF0aW9uIHN1Y2ggYXMNCj4+ICAgbXVubWFwKCkgb3IgbXByb3RlY3QoKSBpcyBy
dW5uaW5nLg0KPj4gDQo+PiA1LiBDaGFuZ2VzIHRyeV90b191bm1hcF9vbmUoKSBmbHVzaGluZyBz
Y2hlbWUsIGFzIHRoZSBjdXJyZW50IHNlZW1zDQo+PiAgIGJyb2tlbiB0byB0cmFjayBpbiBhIGJp
dG1hcCB3aGljaCBDUFVzIGhhdmUgb3V0c3RhbmRpbmcgVExCIGZsdXNoZXMNCj4+ICAgaW5zdGVh
ZCBvZiBoYXZpbmcgYSBmbGFnLg0KPiANCj4gUHV0dGluZyBmaXhlcyBmaXJzdCwgYW5kIGNsZWFu
dXBzIGFuZCBpbmRlcGVuZGVudCBwYXRjaGVzIChsaWtlICMyKSBuZXh0DQo+IHdvdWxkIGhlbHAg
d2l0aCBnZXR0aW5nIHN0dWZmIG1lcmdlZCBhbmQgYmFja3BvcnRlZC4NCg0KSSB0cmllZCB0byBk
byBpdCBtb3N0bHkgdGhpcyB3YXkuIFRoZXJlIGFyZSBzb21lIHRoZW9yZXRpY2FsIHJhY2VzIHdo
aWNoDQpJIGRpZCBub3QgbWFuYWdlIChvciB0cnkgaGFyZCBlbm91Z2gpIHRvIGNyZWF0ZSwgc28g
SSBkaWQgbm90IGluY2x1ZGUgaW4NCnRoZSDigJxmaXhlc+KAnSBzZWN0aW9uLiBJIHdpbGwgcmVz
dHJ1Y3R1cmUgdGhlIHBhdGNoLXNldCBhY2NvcmRpbmcgdG8gdGhlDQpmZWVkYmFjay4NCg0KVGhh
bmtzLA0KTmFkYXY=
