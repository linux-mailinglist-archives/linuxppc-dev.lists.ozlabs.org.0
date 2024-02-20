Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0785B460
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 09:03:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TW8+H3VF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfBkN3Cr8z3dSJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 19:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TW8+H3VF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfBjc1zTTz2yk8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:03:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myEOvXdmGNzg4A6uQ8oBAqbiWnijIoEIBOd/raju8oX3X5D1LSA9fXhgeT2IRjTH2y2BwSPnRe69LG7N7kfjAKTayeQilHq/miMyjVa3uzCBFqGNc+g18uHBdyfXQUJfzJ6Xfe1uA7XPA1o85xJ4WfFKaUu/okPPG8PEarm0R+Ow2qJeQb9HnzUxkb6ptadAbjmGrZSEvAuCbEmYTKUc8S1V9JzZvSXm26Y4yPvqlD9cBggQe90AgBWzQsB/VjZWZTj4U2hXOwuMeZ+F0kyPfblaz66BTd7hj9zR7oOVSTmJcfoZWgVOuFTQDDyXSVoF6dLf4PBvuKKid/L5HbdGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CASkGKgaDimPWycwun8e+ED3fwcyBA+TZNmhH9ZxKo=;
 b=Nnm/tOjk4Wax2WWqzdGaGUN+0m2tGifaXaZroDw0OiqAKH4+h07Hj387mrQOzsPaTcKidfnNJXHB8AqwoM1HimGSryHl4Y1nO1SGGIo19WzczYAsGtYzGB+K2gVhKbLj6MF4b7TiwkbCGYiSZnGraDEHvwzKedQgxvyPPU24MegOHXsPTEzUpdGVfKRIaG1GD8+gYRXHmuQLm7pmef2bckUIA0wGWM8sFtB2hfReLu4hIZshdSu2U8VHh1NT3phuZaRt71nt32NH6+v4rLk/zGxZIhzKTaKlCHgat7hkkN/tGNDsggdGvRNceHbSA7JdPsCZU+KrbktcNLM5/K7Lrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CASkGKgaDimPWycwun8e+ED3fwcyBA+TZNmhH9ZxKo=;
 b=TW8+H3VFOsGYQnftA6GE1OpTEKVBF9NOlDWqzlFj+uHhpWhzNJOTopbWpvcasky8t/qqfJvdYVDFjgI+X34ZnFg2suDKgGtzXyM8GpXfcZd8NKsCySqKEr7qvNMQjVs0v2C5X4Gm/PnAbNfMKYbMjZJMbvo3crLvyA0aIUxxLi3k+xMO22H4COjlouZ14PJaBVPufpB/KDw6ORwbxKok6a9a1OThM33FuBGgBOPN4Bu7Vm55HOZMWEWJjDRuKbLz3gnKG3l3By2sBOaL2IyRb/YSoOSXroDtJycytXBFG/oLJ5O8AzcKGlYi1Q8rh0skO/4Qiq7HZOgjVcofTLcjAw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1748.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 08:02:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 08:02:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 0/4] powerpc/ps3 Add ELFv2 support
Thread-Topic: [PATCH 0/4] powerpc/ps3 Add ELFv2 support
Thread-Index: AQHaSsJIC2aPfbMyDke9Okdlmh3LobETENqA
Date: Tue, 20 Feb 2024 08:02:45 +0000
Message-ID: <0ec4e2dc-38b5-4aca-9e58-2072d2ac6f0f@csgroup.eu>
References: <cover.1705654669.git.geoff@infradead.org>
In-Reply-To: <cover.1705654669.git.geoff@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1748:EE_
x-ms-office365-filtering-correlation-id: ef6c0f8c-21c2-4e00-04cd-08dc31ea529a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Wb+QTCmV4UA+ExIytZOrsyXdwucgxolaetHQ6nxvYowhQapwkAWqBg8qIj7GUh/QaB5EOIEbiekWa1jVb30/ZN01/M+8HFdedhCY3pvnGVaMJyfs0anQOLz4c8ssCAOuQ5DAJiOnlPN/vpbvi98aRPPNRw6a8a9Pp0iryr+bfGKbHlAVs9jfuIBwgn1iA+7xbhg+89so5JPiMlO+osdXn2BK3rB+1mzYDVvzursIaciBi60TwrX5YH8vC/EoNPx4IPdyvV0GzmnRuXKGLcTtFsVpfwO+ieeZKdzKFlwBy8DqSG5YpvzMra73vC3xErXg7r71KuUxbUPCVQxBpN5QIqiQR9jUv+efZkNDXkSlJUtjkBaXop9Ex/kh/j7apJ6r/28PtTb/+KhHiZhswwpthfIsZ6Vimnn3IHa3ZF5JsvVl0Aiyysv+Lj9yMaoK2e6Sf7EyKlxjfb8miQSmB8/wdX2I+cQWwguUINnju28s7sGgb4ovk1lPZ0tfx64NXZxL6FQtelTva6K/SpR6qB883seMltuUYZF49kMKZYn66vlwg/7MlKFqAAVdheotr3zAjWUqSMbhxxL9aB6u2YGcW5sJn6FguFy//+0YnXkU1zqHwSDZ1lsN018ws+sQivb8
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RlFpeHYvcmNoZTRISkkrMGRLYWRwYjFEdEdvTklNMnRYRStXZDViU1FjMlp3?=
 =?utf-8?B?TWR3cGViRDkwVGpUOW0xNG1MaVVGUlZFZVNheHdmTWMzaTZOa0FDcW9xcjli?=
 =?utf-8?B?N3BZVXR1MVdvaXBGNXVTWjJwOHBKakdaVmpwamhvWlo1Q1o0cHFibExhN0dG?=
 =?utf-8?B?SGJnamtyc3ZWNnVjTDBIRU9jME5GMzlvaTNZMFJWTGtXOVR0QnFHZUJMQ3d4?=
 =?utf-8?B?V08rdnd1ZE5SR3cwdFdSUVFvSjFId2VBZ0FBN1ltM0owU0c2Q0dJKytCN1dD?=
 =?utf-8?B?eVpDK0FGLzlSa2RVQUR1RTVmME9JU2k3bm1GZExrTnB4STNnaldkZ3NTNXND?=
 =?utf-8?B?U3p6WElySDE1aWxjN1BBNDdhbzQ0OVBZWFo3MEhBaWxQVEZHZTIycnNzdEc4?=
 =?utf-8?B?OGR3Z1doT2VwbHc1U1lxQU1qZThJNkZwRW1HWTk5L1FITVJyTk9yM1VmYmZz?=
 =?utf-8?B?Qmo1SFlUTDIvOVlYSldQWStQS0Q3YlcvMWJPdEsydFY0WTE0b25kYnpaNlFw?=
 =?utf-8?B?Yk13ckZISEwvZzRrQVAxU1hSRm81R1BqQzgyT3FNMm9FYUlvOE85bmRNMDZi?=
 =?utf-8?B?SVVKTkZGNFF0WmhZdnBoQmE0YTEreE02VWZrc3RCS3l3aXE1cmtlMGphQUZz?=
 =?utf-8?B?MUpMNU1La1N2RVFPM3RzbEozNlYrQW1XZTJiNjdZYUE3UldociszWnBVbzZn?=
 =?utf-8?B?b05nQnNvU3pkdWRNMTA1N1IvemFjZHJrb1A1R0VKZ3ROcnFWM0NUamtPTFRj?=
 =?utf-8?B?ZE1CMGhoNHlQcGk2ZHBwSFo3SFdFRHo4NkY1NGFRZkJyT3JVSXVtZFVXNUhq?=
 =?utf-8?B?dEtrZEp5S2Nhb3J0aWNnemRHa1dVRUp5ZFV4YWNENThGZG0xbld1OXN3ejJv?=
 =?utf-8?B?a2dpbmZzK2UrTlVWMUVUOUJhRGI1N3ZuVXZwTVNwOGRhcThUVUozTnJMS1Iv?=
 =?utf-8?B?K1Vqb0xoN21qKzd5T3JHaGNwNkRBdXI0M0RsS3VIeDdhUzllMzIwWW8xSXkx?=
 =?utf-8?B?Vml4emJva1ZWaWI0QmdSZFJPY0dMNGdnd2hJdk9HZ2ZFNFNGVmMzMW9yUXhL?=
 =?utf-8?B?Yzg5bkYvTGNxekxZNnRwUmY4am9hNWp4VFg0bW5VbTFlYnVyQm4wL2I4UldU?=
 =?utf-8?B?SkVRYVRaYWJlQWZqc2hobTBhcTc3SDh1QTFkUEhFRFpiMlpzSU5pT3Zhd2ZS?=
 =?utf-8?B?TGVEZVBITE9sajEya3hTVGhscmp1WjBBVnlhRHVuUjNpejlIQXk5cCtWaUdW?=
 =?utf-8?B?dTNMTXA0YzFBM0hDMGxzRkFOeGxBVjV4aGRFNmFGUnpNWUl6c1NPbk5kZE43?=
 =?utf-8?B?NGFCT0dMbGxJYlg2ZkQveEswVkFSY3llcmVRWVpqRkNCRGMzNE9WbW1HWlAr?=
 =?utf-8?B?cFhxVkJJYWNSVDErWHI1UXNiZnJOdkxFYVhpcTZ0K25PQVBib2hrVldYWjdi?=
 =?utf-8?B?ektmbE1aaUV2ZWFFVzlQSHIvREc3TFR6VjZ6ZkxHSGxBMEJqako4ek8vR1h5?=
 =?utf-8?B?Zy9rTmx6cC9VZXNlQTNWYmJFLzJ6WTJIOWF1RFBLMG8zZnZyVHh6SGRHNWVZ?=
 =?utf-8?B?THlLOFFBU0VWSEpSZXRNc2xPcXZ0TWJYeWtRWDZnWGxQSVpoVUFla1dJZHlX?=
 =?utf-8?B?NU1iL2J2RDY2WDNtRVVaMjdTcm1IM05IalV3NS9oNUQzVDZSUEc1aGw4RUZp?=
 =?utf-8?B?WEhsVE92ZUhrSEFlSTJ2WUdIblJIVURiTlppNTh1UThodVBocGtUMitoVzZr?=
 =?utf-8?B?T2FFaHQycXJOWDQvRmJWaGQ4N0RwaXpJLzV2bHdyWDZHSmdmVlJNS3k5dWxK?=
 =?utf-8?B?djMzS1Y4NWRNamVXV3l3NVBKS1lKNkNiVUlkS0phYzRxYlNoSE95V2psbFZr?=
 =?utf-8?B?VjVCS3RiU3E5a0E5amJmUGpKSm9kT0M1T05FWHRaUzd6WUlrODc5clhqcVUw?=
 =?utf-8?B?WTR0MjkwbmZpUnBqNTRHbGFaTG1nK09vYmVQTWhGSDg3QzNKYlhWR29Ib1lq?=
 =?utf-8?B?YXlDcTFSb214L3VMQUlSY0V4V1cwdGV6ejhpeVdnZ3dZeHJWQnJGMGkwSTFM?=
 =?utf-8?B?bVRsVytqTE1wVnltcGRBUmpIS2U3RU9obzVMSEpRSlNUOTBQZ3FPZ3A4OEF3?=
 =?utf-8?Q?yJ8+XB0wXSQh4HpsLJI6RMxB0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E1C2CEA168A3D4F95EA5A3CDA48231C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6c0f8c-21c2-4e00-04cd-08dc31ea529a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:02:45.7391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3rwWZ7muTNZNj/3Hn/TrJrDPpDk91M4u63J19i71G/lcrlYIrhCk/wZf5LuuVqnl3x3ePNuBdzVmyqO8ca3RPan9bN9oKZx1FAwnUec6Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1748
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

SGksDQoNCkxlIDE5LzAxLzIwMjQgw6AgMTE6MjcsIEdlb2ZmIExldmFuZCBhIMOpY3JpdMKgOg0K
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDQ0YTFhYWQyZmU2YzEwYmZlMDU4
OWQ4MDQ3MDU3YjEwYTRjMThhMTk6DQo+IA0KPiAgICBNZXJnZSBicmFuY2ggJ3RvcGljL3BwYy1r
dm0nIGludG8gbmV4dCAoMjAyMy0xMi0yOSAxNTozMDo0NSArMTEwMCkNCj4gDQo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dlb2ZmL3BzMy1saW51eC5naXQgZm9yLW1l
cmdlLWVsZnYyDQo+IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOTgzODM2NDA1
ZGYxYjYwMDFhMjI2Mjk3MmZiMzJkMWFlZTk3ZDZmNToNCj4gDQo+ICAgIFJldmVydCAicG93ZXJw
Yy9wczNfZGVmY29uZmlnOiBEaXNhYmxlIFBQQzY0X0JJR19FTkRJQU5fRUxGX0FCSV9WMiIgKDIw
MjQtMDEtMTkgMTc6NTM6NDggKzA5MDApDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IEdlb2ZmIExldmFuZCAo
MSk6DQo+ICAgICAgICBSZXZlcnQgInBvd2VycGMvcHMzX2RlZmNvbmZpZzogRGlzYWJsZSBQUEM2
NF9CSUdfRU5ESUFOX0VMRl9BQklfVjIiDQo+IA0KPiBOaWNob2xhcyBQaWdnaW4gKDMpOg0KPiAg
ICAgICAgcG93ZXJwYy9wczM6IEZpeCBsdjEgaGNhbGwgYXNzZW1ibHkgZm9yIEVMRnYyIGNhbGxp
bmcgY29udmVudGlvbg0KPiAgICAgICAgcG93ZXJwYy9wczM6IGx2MSBoY2FsbCBjb2RlIHVzZSBz
eW1ib2xpYyBjb25zdGFudCBmb3IgTFIgc2F2ZSBvZmZzZXQNCj4gICAgICAgIHBvd2VycGMvcHMz
OiBNYWtlIHJlYWwgc3RhY2sgZnJhbWVzIGZvciBMVjEgaGNhbGxzDQoNCk11c3QgYmUgc29tZXRo
aW5nIHdyb25nIGl0IHRoZSB3YXkgeW91IHNlbnQgdGhpcyBzZXJpZXMuDQoNCkZpcnN0LCB0aGUg
dGhyZWUgcGF0Y2hlcyBmcm9tIE5pYyBkb24ndCBhcHBlYXIgYXMgYmVpbmcgZnJvbSBoaW0sIA0K
bWlzc2luZyB0aGUgRnJvbTogYXQgdGhlIHRvcC4NCg0KU2Vjb25kLCB0aGlzIGludHJvZHVjdG9y
eSBsZXR0ZXIgYXBwZWFycyBhcyBhIHN0YW5kYWxvbmUgcGF0Y2ggaW4gcGF0Y2h3b3JrLg0KDQpU
aGUgdGhyZWUgcGF0Y2hlcyBmcm9tIE5pYyBhcmUgYXdhaXRpbmcgaW4gcGF0Y2h3b3JrLCBhbGwg
d2UgbmVlZCBpdCANCnlvdXIgNHRoIHBhdGNoIHdoZW4gdGltZXMgY29tZS4NCg0KDQo+IA0KPiAg
IGFyY2gvcG93ZXJwYy9jb25maWdzL3BzM19kZWZjb25maWcgIHwgICAxIC0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcHBjX2FzbS5oICB8ICAgNiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvcHMzL2h2Y2FsbC5TIHwgMjk4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTcxIGluc2VydGlvbnMoKyksIDEzNCBkZWxl
dGlvbnMoLSkNCj4gDQo=
