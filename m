Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDD6F15A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 12:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q78CZ0zyBz3fRb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 20:36:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bNwuIAX1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::607; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bNwuIAX1;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q78Bj1cg9z3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 20:35:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g49L1VyxOfTDVyIurBhQqwqYKcJv1TdRI9Dyu7nrFXwUoTf5Fj5eGKLULDy8s1KHw4LgD10Qcsrn5p6QTllIP/VEpgvK9CMjERJTeHKkqJdWXazPUm6eIiUQ5SEueqPk4lzw8I4hJBI/A9BOGF+bUud+VulkEoJJTpATRllfFQ3WKPvhaaVWhoggQupBZYqdUkIOuq4pp4Ai+XsjT9DjFNzidbEbiNDrXiSOSm92SAmyFSA/UddaJcWpq0Bg4gRc0rnrVt8ZXa0B4A8rn431fmtyMQwq7WuAkbE6WoCKyLEANjjPVzsCA9MrEkOm8c/5XzBq/zRCH/MGyWJRtggAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68LTZMP1WIjJpXMyWlrNvy+oORqHC8jFiOuYoUH6dPA=;
 b=IMtVwHe/EyF2dV7vUHAUItUw5WwY0yGQLwPKeRt11Nk1sYnChBxhfMlb5rKRpuG06KAjzol2ToX7sUIkFy6ov7dYrzVtNsmTDKt4wWIXZnXhILxa0QoxS+qjLYa+tK0LSgla/btZTvDw/DKEZci6nMUX7Fhu7nbPAL7qx5h5ASXLvwLS4QiB62Eu3nb7ZyKL5fU1jhqwV997F6Jt7ffGEsKKfRtElpmlHYb8S2e4ipRW18rHihjNxHl0uHlhBmfT6WnwaNAU1//LVFj+cpaNQLeeOKtX61OOAJx35yJ3kqpAUveNKGelOqNBWcmklAnm/DTS4ySTb2kn1lCBQHBnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68LTZMP1WIjJpXMyWlrNvy+oORqHC8jFiOuYoUH6dPA=;
 b=bNwuIAX1jZdUaPF0Hb/bzpwPttnUFCyWzvcOr2rt0UBmaVUw1TzZHPi5R23p9PeclBJpiEpL3jh4QSb0bK2Fupis3faPXZ5gb8FJCri2U0QSFeaDFnDujdFgDq+09qAi+VFe5Ki21vTIph2unMnOXnRqKJbmJGQH8NroBLpawt/pA+EH9++qIs8GXMU7jfuewH0qhAxN5UqtJ5Xc3+9fDfg4/ygtcUVRrc6aJfMGdS4IwAqpIfsbBPM5WHXDr1WWrIiV8VAo5Un066qzpEKl0+hJuYv51PlLU7x50D6CJpq/LLkLdaZ3yDJgsRHvybSdZopLO2y6AmdDkDH1PdZYyw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1722.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.23; Fri, 28 Apr
 2023 10:35:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 10:35:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Joel Fernandes
	<joel@joelfernandes.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Topic: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Index:  AQHZdRij7XaDRKPnAkCpLkVXFgccXa83txaAgAHnTwCAANStAIAAIX2AgAAENYCAADmigIABAIwAgAAMrQCAAAIPAIABqcKAgAMEiQA=
Date: Fri, 28 Apr 2023 10:35:01 +0000
Message-ID: <c8f9896e-0614-7aff-3846-80d2c1731209@csgroup.eu>
References:  <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
 <877ctyzv08.fsf@mail.concordia>
In-Reply-To: <877ctyzv08.fsf@mail.concordia>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1722:EE_
x-ms-office365-filtering-correlation-id: dd7f8fa5-bd1d-44c3-f5bd-08db47d4392d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p4oVEHlX8Y6TbxWx1fy85YtI6wrRvUhwCd8xPAChWPFjC/HNXfHIoKHnoXiI0biSQzbKkEw6EqZI4wSRPC77Hw/sA6gdoht+5wD7K9RtWSQaC73Wrw8EzfwW0fZgcRwoyCZ2UnkE8VWtwBp91P3X49dfMIOwWrQVFPqKyTMUeJ1IXU1AdAj0SLyJU2qivcnzec+82CXmOVgBSNy3mRzglQzxxFsJ9mjP9aCTEavCYXYXrxdjRIq1RdhAgwM6YeQ1D/KDZFnO8IQVNSSIYXJ+qAZhL8ReUyp0biUcguyvKcT5Jwi4WA/D64MHmrYscxXsy4XczVTWWaeBZQuErQxGFiqo2lrygMjKxrDVfHgExKF8NudJJB4xGl/ru1z8MKdQPxKYezf1m6sjrpdS87+b7R4ixRSuWe/CVGvcQBQymwTj5Il70jJJSDL/hSrN8iknmpOlaxx8QLtRrkBj/eBxuX2Mkx0Gt8rAcpXoRh2cHjVw80fDebg7i8Fys9oCIdOzDLN3JIxz5oX1OhdUhbch7WodNwtcoOm8qoFxeJJtvenrjqHm+G4hK3vhFnlP2diVrOn0Ayg2M78I8vlGaFtNUDduNnsIjsEORzVjM0P+xHHJhJ59G/LayeMcsRzQjkoUZnSUgfzVv+RnUQovaBNLLUfhDFLVC1yPL7Kdefk+lHE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(39850400004)(376002)(451199021)(122000001)(44832011)(7416002)(8936002)(8676002)(5660300002)(83380400001)(76116006)(71200400001)(66946007)(316002)(66446008)(4326008)(66556008)(38100700002)(64756008)(66476007)(41300700001)(91956017)(31686004)(2616005)(54906003)(2906002)(478600001)(86362001)(6512007)(53546011)(186003)(26005)(38070700005)(110136005)(31696002)(6486002)(966005)(36756003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WG9pVnVRdUdxMXQ5ZFl2VFdkSHFlWDZaYVdaa2tjQXVpcHNIdDF3YVBvaWVF?=
 =?utf-8?B?enpWT3BHa25sNktrVENpYzBrOWlUdlpkc3Bia096SWxaakI1NDF2TWxlekEv?=
 =?utf-8?B?eUZ1MnRVNE5qaithZmtQVG5rZFJHdVlYc0tFWHhnT21qZ1A1eU0zdGNpa1V5?=
 =?utf-8?B?T0t3aXZweVFvWjBTb28zRkV4MjhxTXB4Vjg0WlhnSmcrcmt1RVJSWXl1K3dn?=
 =?utf-8?B?akd4MzIvQ0ZxcTc2aTNjenF3aEg5Wk1pWE9QVzF4VTFsaitFdklKRTZOVmdr?=
 =?utf-8?B?UnRjQllzbUduYjRVcnFqSUFEMlRyc0lPTWZnSW1aMFB0SVg0NEVrUXVuenEr?=
 =?utf-8?B?bE42cHZ3R0MwTmJsVjZZWmRVTmZqNG4wTWNqMGRpN0NNOXgvNURHMlg1RlBk?=
 =?utf-8?B?R0gwZDJwRU5MYVRWY0JHazFzV21XeWpNTnFFMGs5Q2lwSG5xbWpVVEowUFFM?=
 =?utf-8?B?QTg0a2xaT3JHdjZkMzJCcGpsalF4QWM4TktCVXNDNjlFQTF5M1FwMklWcGJS?=
 =?utf-8?B?R2JzRGhXZVJ6RzE1a1BQdEFodlIzeGRsSmxNQU93M3N0V013L3M0dG5zY3Na?=
 =?utf-8?B?eWIxdlhEeUJXS2RnQ2dldzFJMmpySWN3aHY4SGtlWGRPVDlMVVRNSmQ2dVNp?=
 =?utf-8?B?cTdUMHlZN3B6eUVwSUpBbmx0M2RzRnRzUjBibHd3MHV0bEF0UnZuc0ZPMXA2?=
 =?utf-8?B?ckViekxROXpUeW1Oc2pGOC9jbDlYbnVNTStrV1JKaVNIYXMrR1BlTGpydEtq?=
 =?utf-8?B?bWlEUUV4MFFQWE0wMVRnMWJvcWZYRGJwbnhwV0xqVUVIb04yYlRQMVFTVFYw?=
 =?utf-8?B?bkdGOWNaY3Q0c2hEQlBuRnV4VEp2WWhUOGlkTHl3Sy9rZHNFdHFZdWNsRVdq?=
 =?utf-8?B?N0o2b1Q4QVVtanE5QmVJQmpIT0VSTjhncWgzSkUrbUZtaXcrNVNxUmJXRW9x?=
 =?utf-8?B?aHZzY1Ard1VNQUVCb1RZVHlPTG9VMVdkczdGMHNwRWtaMnpxclhQOVRUbkc0?=
 =?utf-8?B?NCtpczl2VGhyY2xDLysvMGJaOUtlS2YrQ0dnOU80NlZZTWc0ci9pQ1BRZG9Q?=
 =?utf-8?B?S3RpdytCbnNxZDJJcGFYN0lnK3VEOXJkaVZpRU9JakVkVUZyenFDQkFlZCtI?=
 =?utf-8?B?Y0c4NXZYOGZZNWlkbGExMHBhTHNJeU8yUFFYUUVRZGpVdi9qelJxdU91Ymxn?=
 =?utf-8?B?YndFWnQwS29XTVhkR3NmdzFPa25RaE8wRlBlcGlpQnhVSWd5cEZ4N3FtQk1i?=
 =?utf-8?B?WEh5VTM0aHpoREcySzlkZ3dxeTFCSS9ENGlhU1FIQnBjalhkczk0VUVpVW83?=
 =?utf-8?B?aXh3WVFKekcvaVhuQm56U1lTbUdJQURPL0lqWC9IL0I5T0tvOWdmbzk4eSs1?=
 =?utf-8?B?a2kwbFNsYnFpdS80RTl1V1l6UnV2dW1NTUYwOHR1Wkc3ZTNuQS9Mc012eGZo?=
 =?utf-8?B?RlhONWk0cGdIcXdIK3JUVllkYnpaVDFIOWVab0dROXN3TkZUc0hOV1hqRWRu?=
 =?utf-8?B?QVczRWh2ZmZvVkdZWFg5ME1wNDNmUkpzcjh0MnR1SUwxSDZzT1RtakVBOUJa?=
 =?utf-8?B?akttZ0hrWnNCYTNmbzFyMENYSVdKVHM4cHRGQ0t6akU2Qlcrb1F4SGFJZnZ5?=
 =?utf-8?B?QlFBL1VSSFA4YWhOT3p4NjBWY0ttWVJESyt4QUlSR1ZicDlScWtnTGxlWDBj?=
 =?utf-8?B?bCtGeHNvNDMxWURSVzlmZHpBMzExK093ZkMzTklYRjZXV0RkNEFOVWUxbFZ0?=
 =?utf-8?B?aXBoTjErK1g0NzlpWVJBWGMyblB1YXpYcXFnSmFkZ2FPcXlkZ3NtRXJwYTVw?=
 =?utf-8?B?OXlKU1pyeVJLRVhwOGljMS9IekVNVmZmS1NHUUFxVFR2MG92ZlErWXd4NGNr?=
 =?utf-8?B?QUhXZzFSZmx1b3FXeVY4WGdsNUJWc3A3VFZBNE14a0dhdmltQklWVVVtdHc5?=
 =?utf-8?B?RVhuWlk1aFJtNnFNdmkrRDZOaXZ6VDRjWjJUVjh5em44M3lTSGRGZkRkd20w?=
 =?utf-8?B?dk1kazRXNGVhTjRPUUI4STlXVXJXak1pRDk0ZVhWdWpOVm1idjZNTzVVT3ZO?=
 =?utf-8?B?ZlV5bG5pbkR3dlIvNE1YVXVjbFAxbk81YTJoZDJlWHFZMFcvNU1JZW54K0oy?=
 =?utf-8?B?WHFhNk1pZlE1M2NCWTJzckFUSHB4K3diODlwcUE3ZzRJOUhVdWgxT3dPdDhu?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84356AA39E7120468904326CCCCC8B6F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7f8fa5-bd1d-44c3-f5bd-08db47d4392d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 10:35:02.0780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/dfGigBklZaT753Ngz2ZIN25fK5WeN8K/Omun+I2Cmprr0PZFQ5LcpRkI2Bt0BXbU0OjqFZdv7gZGlsaUL9Mr4YJduI8/Lxa5OOTKKqzbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1722
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
Cc: "Paul
 E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA0LzIwMjMgw6AgMTQ6MjksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSm9lbCBGZXJuYW5kZXMgPGpvZWxAam9lbGZlcm5hbmRlcy5vcmc+IHdyaXRlczoNCj4+IE9u
IFR1ZSwgQXByIDI1LCAyMDIzIGF0IDY6NTjigK9BTSBaaG91eWkgWmhvdSA8emhvdXpob3V5aUBn
bWFpbC5jb20+IHdyb3RlOg0KPiAuLi4NCj4+DQo+PiBPdXQgb2YgY3VyaW9zaXR5IGZvciBQUEMg
Zm9sa3MsIHdoeSBjYW5ub3QgNjQtYml0IFBQQyB1c2UgcGVyLXRhc2sNCj4+IGNhbmFyeT8gTWlj
aGFlbCwgaXMgdGhpcyBhbiBvcHRpbWl6YXRpb24/IEFkZGluZyBDaHJpc3RvcGhlIGFzIHdlbGwN
Cj4+IHNpbmNlIGl0IGNhbWUgaW4gYSBmZXcgeWVhcnMgYWdvIHZpYSB0aGUgZm9sbG93aW5nIGNv
bW1pdDoNCj4gDQo+IEkgdGhpbmsgQ2hyaXN0b3BoZSBhbHNvIGFuc3dlcmVkIHRoZXNlIGluIGhp
cyByZXBseS4NCj4gDQo+IFdlIGRvIHVzZSBhIHBlci10YXNrIGNhbmFyeSwgYnV0IGJlY2F1c2Ug
d2UgZG9uJ3QgaGF2ZSAiY3VycmVudCIgaW4gYQ0KPiByZWdpc3Rlciwgd2UgY2FuJ3QgdXNlIHRo
ZSB2YWx1ZSBpbiBjdXJyZW50IGZvciBHQ0MuDQo+IA0KPiBJbiBvbmUgb2YgbXkgcmVwbGllcyBJ
IHNhaWQgYSBwb3NzaWJsZSBzb2x1dGlvbiB3b3VsZCBiZSB0byBrZWVwIGN1cnJlbnQNCj4gaW4g
YSByZWdpc3RlciBvbiA2NC1iaXQsIGJ1dCB3ZSdkIG5lZWQgdG8gZG8gdGhhdCBpbiBhZGRpdGlv
biB0byB0aGUNCj4gcGFjYSwgc28gdGhhdCB3b3VsZCBjb25zdW1lIGFub3RoZXIgR1BSIHdoaWNo
IHdlJ2QgbmVlZCB0byB0aGluayBoYXJkDQo+IGFib3V0Lg0KDQpBbiBhbmFseXNpcyB3YXMgZG9u
ZSBoZXJlIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzQ1IA0Kc2hv
d2luZyB0aGF0IHIxNCBpcyB2ZXJ5IGxpdHRsZSB1c2VkLg0KDQo+IA0KPiBUaGVyZSdzIGFub3Ro
ZXIgcmVhc29uIHRvIGhhdmUgaXQgaW4gdGhlIHBhY2EsIHdoaWNoIGlzIHRoYXQgdGhlIHBhY2Eg
aXMNCj4gYWx3YXlzIGFjY2Vzc2libGUsIGV2ZW4gd2hlbiB0aGUgTU1VIGlzIG9mZiwgd2hlcmVh
cyBjdXJyZW50IGlzbid0IChpbg0KPiBzb21lIHNpdHVhdGlvbnMpLg0KDQpFdmVuIG5vdyB0aGF0
IHBvd2VycGMgaXMgY29udmVydGVkIHRvIENPTkZJR19USFJFQURfSU5GT19JTl9UQVNLID8NCg0K
Q2hyaXN0b3BoZQ0K
