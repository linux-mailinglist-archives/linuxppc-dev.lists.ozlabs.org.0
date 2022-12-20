Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D87652261
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 15:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbzLr74gsz3c71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 01:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pRGde8Z6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.53; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pRGde8Z6;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2053.outbound.protection.outlook.com [40.107.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbzKs2R7Hz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 01:22:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXN7HRimCXqGwnhEJ2wO3p3qTOuNOBn+MIo49WQknippwxfdogZhE53Vvo7upfnmPzohppUtEwq0JQG84r2Ad0KWNasOMFulECYfRCDu63T+Pgd1EUMHc3L7spEKFsMbLwVeE+RA2Dc8i7Ofao5bjGZkqFTDuydVE5nLSCBV4R4PRZOweBRFeJAr6YdG9PJAG4ffBt2Lzcy3Az+DFFckQgHPOH4XCeD4rRAffCz47Ls9CWED85C73iXQoGg/xlY5jRfwzgZGTKoFX/1utGY6C3Aq4I7TCIhreFoUCVXAH4LxPR5kNG+Vs7fo4ed8URSmPP3gxcUm5nkWHg//L45fRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aztZnGgcLF9/t2/IjlEGDfl102JSJ1+ybNLvIsNMOaM=;
 b=AXY98stZ1icOCGSkZL10j+pa3xKdrzSD7KxEVM2uvqAN753FQeXoS45kGpah6vlTz/DhwJocLkP+94iZgNNPhX0o898X7kUeTB7lF+bjzp/t9pj28yVFyGFH9yjypSMleV00tzF9YYXAWTWH+HukR4e1yZ/cegtF/sksTZGhshylqShcmWhyEA64/OvE3hJvyTM/QGbFSffe+JNeDh3s2KV9ZBggDLm14Y/3KU3xb0PT1x+SKdB2qRnflKtJQH4gZF+C9w97SyuJg5I+i1w6Z5tQ1Wp93q/jIUGlhO3XCl3oC0B28Ychh+aQlobl6j2DkZbExkClFT0BxZbMUhU1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aztZnGgcLF9/t2/IjlEGDfl102JSJ1+ybNLvIsNMOaM=;
 b=pRGde8Z6Ee87kB9xl0HDpkuZH0sQlXbooP/2ziWG/g5uREM4Gd1av/L0uu2KMuleAi6zJ8fHHXWAvXuAWCjlrJevEvFxh4QKaK04+ttEDIcqXh4YSbrS7AChCcN/XgEJ4u7FoGdJmgrgui5ncocSCQc4P0lWhTINQYt1r1Xlgp7LJG2++snLb5fCZlbwpVjOs9KSy3x57DWQFImrYOC0OIC358R311qsvzTdGhc62i+vlv5VGzRWsqEz4oRDbhpLIBZcsBR0k4dz0l3k8Ffs/bLYOMr8xqQj57uEBD7QBVic0r8diCIPF6BASVeEbLLVTD0FOnSybR0ptKZZUo/okA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3225.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 14:21:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d%9]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 14:21:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] tools/objtool: tolerate STT_NOTYPE symbols at end of
 section
Thread-Topic: [PATCH] tools/objtool: tolerate STT_NOTYPE symbols at end of
 section
Thread-Index: AQHZFFvZl8kUjHeQfkGPAxL1h9t2JK521BGA
Date: Tue, 20 Dec 2022 14:21:48 +0000
Message-ID: <96810808-f4b2-d80b-2f1a-08674f582670@csgroup.eu>
References: <20221220101323.3119939-1-npiggin@gmail.com>
In-Reply-To: <20221220101323.3119939-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3225:EE_
x-ms-office365-filtering-correlation-id: 4b833268-19c0-49c0-7546-08dae29587b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KFJxbHCGGvmjee1jrClMWQvbONLABeu0eTn92PmzXeADrRDtUGFulPMS+pMKXPOfNgdJZ2MVUAkkv3nBtx+FbdCjpQ+tmgA3Fy7v8UHyTHf134Loj74KGxqkpsqsGhIWdMB8A+0Ffkp1l4dFABXTS4wzC1N+8qWcbfDGYBFBF8mW7AZuop5la6r2317ab5al9dyge6FO+wdECMZMTol2ZNKPxM0X2Dm5cgW2x6/7Z09QENjYIqoRud5T1FZJ95u2d/07YEK0vhXqT6lzgYuq8uNSpK3NUYCPTmbr8kVBxNp9x0boKcFSdT9i+y9ABZSUpGUW9I0rG6TmAYp6n32kEjvH8OrrUq9LzU5a++ieN+QDOKPeqijeS6xYLj04e/98QSDQqBAeq1QmaO5k/U0/wZQL4uXV+dUsM2uzu0eU2gUlBZMnOP7tMxEu1ktA4dLxjKJVXC1S6MVP2LehO3QhT3I776V8IXG+4Ox6Yr9dNnbkhIcRyLWLDcwoOzPChaRbnEXK2e7hFT6e+bi9p6JmfD+c18bbqgwVOODYShfOnhqBDAzwqdBnopUD80aAvlMGRrBpAsBqsZOh6d1zrHMteRD3XKzSi7ZlFlv/2nE0fk0uzbRFfKoBqwFeIy72/ZTmgUzz77d0VNA4AZq4B+DaUqL/l9o01Q0yDeQMZKdTWOcQCQF1uAj0VC5qGXAhKxZN/0Tg1WNyoK0em4ihh/H3TiFByA37q4kHqIXqWE2FeDkg5Ly0kgpRFx1M3/geGBUS3zEd6kFyGF+9AzOdiJGla5VVRicD36EmqpMld9ym14U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(451199015)(31686004)(4326008)(86362001)(5660300002)(8676002)(6512007)(6486002)(122000001)(316002)(186003)(26005)(38070700005)(76116006)(91956017)(31696002)(2616005)(66446008)(66556008)(66476007)(64756008)(66946007)(6506007)(966005)(8936002)(38100700002)(83380400001)(71200400001)(66574015)(36756003)(2906002)(41300700001)(478600001)(54906003)(110136005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UFIydEtETWtNQzFMcmhvdTFYMmdPRzJ2UWxRYTMzbTIrRjZyN2ZxODFKQi9N?=
 =?utf-8?B?Q1YxM2o5RE1oS1ExMzhjb1gyMWJrSzY4d3dSVldqNTNMNjYxbTBQbEZWUzJW?=
 =?utf-8?B?aWJyZi8xdDNxR2dmblp2aTY5L1VXNzd2enBBL1dzdE5DQXN0ek5iaDBZdC9K?=
 =?utf-8?B?RGJXVlRDRnBlNzlJaDllQXlZYjdwVUhwUVFBYzJ0ZDZrMENpbWNaamRZblhN?=
 =?utf-8?B?aXY2TDJFNS8yQS9GWFhER1dKbXVkNE1aZ3pKcXhJeGZXTU54OXV0Rlp2WmNP?=
 =?utf-8?B?aWhPbzBFOW0zVVdpblIwNmNydVJyL3Via0V3dlVER0dva3U4Z0o4OHlUN25T?=
 =?utf-8?B?TGdiY09mbE5jbUNjd3p1Wnl2RmRyZkJoSHA2Y01aaldDZmdNcnZtN2d2bDN1?=
 =?utf-8?B?TEE3YThEd0VnQ1FCU29tTEhiNXdJOFJod05RMC9zT3V1UXJ2djY1cTFvRDBn?=
 =?utf-8?B?b2JKWkh1MUc5b3FHV2R4NXRHVmdoRWNsVlNkMHI4RDlWcGJGajRPdDdOZXBB?=
 =?utf-8?B?eDZpbG5CWFdBdE1yVlBPdmRZT3dIcU0yMUZjTm0vSWs1Nko3UGN3RFZ0aHBO?=
 =?utf-8?B?Q2NMbmpGZUdaakdnUEYzWVkvZDkyOWx3VldrNkhHTng0cU10d3dMc0tHWlAx?=
 =?utf-8?B?cHE5bGxqVUhLMHhsYit2bXNWZ2JUZU5FWGNhSlA1ckZnRWNRQS85SEhYZGs5?=
 =?utf-8?B?OWg0ZEdDalNlR0Vpbk42NXZkaW1ndHRreUY2YnhqdElYNmxIZHdYeE50ejNV?=
 =?utf-8?B?eUJETDZlMWhoVGc2Y2tia1J5VEd3R05FbGx2d2lzVlFSM2crbndmVm5tOGdO?=
 =?utf-8?B?TTltcUsxdWZMbFFJT2JVL0R4RzBmRDFLa25DdHFEVUpyZG53a3NYYkR2L1JM?=
 =?utf-8?B?VlQ5eXVzZG1TRmNnYXBUaWNnUERrZUdyYXMvL0V3UFpYVTJjRGpqV3EvT1RP?=
 =?utf-8?B?cW9nUkVacUVzRmFlU0ZTOW5tbjdidC90c3htMUVjZTlMTXFLaXNuMXExQkV2?=
 =?utf-8?B?S3pHNjNtdHlHUm02TmcrNU9Hbnd3Nk45YWFja3lhRjI5ZmhGRldzZXVUaElW?=
 =?utf-8?B?M0Uwa3JRV1U1WEVFSU53ZmdlQm5vOUw3OE5MRDJBQUxHUFJiR0RVVjUrdUZ3?=
 =?utf-8?B?ZmxvWktOZmFvZ1A5QzVTSWhFOVZqbHJEdnE0V2FNcEhVYllaY1FkR0hXanBw?=
 =?utf-8?B?RCtWcFhZM3JvR2p2L3VlNGRqWVFBRFVPaW5zQkd5RWZoYStFeHFxaFdGQXlp?=
 =?utf-8?B?UTlVK2ROb0dLeHpoUFJlRDc5UjhLL2lMcmdSanBlNVV4d3NSM1JKQzVkRzFa?=
 =?utf-8?B?c3c5QmVGTDg2VnM5S0FlUG5DOGJDcVVmV2dQeU9wUWptU0w2K29PZnZzTWp0?=
 =?utf-8?B?Wlp2bE40YkV1RGFsdnZnU0k3SnpzVHBtY3lWVGs1bGVybnJ3Q2t3ck9BeXBY?=
 =?utf-8?B?SWRsTWpWbkowU2x6TVltREN1Y1FxU0RucldsbmVTOUpiT2k4bEE5SWJTU0Jy?=
 =?utf-8?B?TVB4TExzNkFYZjVRTk00YnlqUUJLbUNZaHZIMGs0d0hOTTc2UUJZRG5UOFc5?=
 =?utf-8?B?andKKzZXWWI5N2hwa2VhM2xRMjVDVDE3STJrbUhVdE95cDBub0w0bjd3SUly?=
 =?utf-8?B?OWo5N0ZFTXBiOVV6TWhnU04zV0lxUUFrV2NHRXZOckFwTXp2ZGhDbjdKVUVU?=
 =?utf-8?B?Ykc2QmM0ZmtDRm05NUxoLzc5QUNhTS9hblJSbHpka1VkeTFla1hqV1hScXF1?=
 =?utf-8?B?emw3ak9rdnFXY0taNG5RZERmdVBTZExsdno2bGFVQTNyc0REam5ENi9Zck1N?=
 =?utf-8?B?aElZVEdwLzg0cEw5MUNESjFsTDEwSGtVTW9jMEE4cnNYYmxiMFhUOXlmMGF1?=
 =?utf-8?B?d2RJTmtqWVpWWXh3QS9jeEtFTVB0aDRiekFLQjFvWEF0Z2VDeFBzNHJlanJi?=
 =?utf-8?B?SzF0M1BZaEZCRms3UlJiTTJVRllPU0RLaExQNWd6ayt5WFpoa1lKcVIrbzQ2?=
 =?utf-8?B?VGRjek1MZG1DTFZYcHhsL2xTVk1obXdOTkprUWdIN21vb1FVTlhEeUphdzNK?=
 =?utf-8?B?elY2czVjOWVQbVpJd0dIY3NTS05kZEJJVlNJSVdkSmd0eTRUZnBZWlMvb0pE?=
 =?utf-8?B?MTBEcFdPMXp2Y2sxaUhKdGs3RU14REJJdkhyQXAzZklmOG56ZitKU04wUEti?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F2D0B80F95F8448956AF22A1124F8D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b833268-19c0-49c0-7546-08dae29587b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2022 14:21:48.0854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oEsOoLIlcqwU588CmuF5Ob9Sn2jJNJOT2aIJ8plt04BfHajunDIxkv9c9q4/PgKBW6PjwVR1gfCI8dZwBjXclXh0MFq3yHIeNzvdy7Nnocg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3225
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
Cc: Peter Zijlstra <peterz@infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzEyLzIwMjIgw6AgMTE6MTMsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBIYW5kLXdyaXR0ZW4gYXNtIG9mdGVuIGNvbnRhaW5zIG5vbi1mdW5jdGlvbiBzeW1ib2xzIGlu
IGV4ZWN1dGFibGUNCj4gc2VjdGlvbnMuIF9lbmQgc3ltYm9scyBmb3IgZmluZGluZyB0aGUgc2l6
ZSBvZiBpbnN0cnVjdGlvbiBibG9ja3MNCj4gZm9yIHJ1bnRpbWUgcHJvY2Vzc2luZyBpcyBvbmUg
c3VjaCB1c2FnZS4NCj4gDQo+IG9wdHByb2JlX3RlbXBsYXRlX2VuZCBpcyBvbmUgZXhhbXBsZSB0
aGF0IGNhdXNlcyB0aGUgd2FybmluZzoNCj4gDQo+ICAgIG9ianRvb2w6IG9wdHByb2JlX3RlbXBs
YXRlX2VuZCgpOiBjYW4ndCBmaW5kIHN0YXJ0aW5nIGluc3RydWN0aW9uDQo+IA0KPiBUaGlzIGlz
IGJlY2F1c2UgdGhlIHN5bWJvbCBoYXBwZW5zIHRvIGJlIGF0IHRoZSBlbmQgb2YgdGhlIGZpbGUg
KGFuZA0KPiB0aGVyZWZvcmUgZW5kIG9mIGEgc2VjdGlvbiBpbiB0aGUgb2JqZWN0IGZpbGUpLg0K
PiANCj4gU28gaWdub3JlIGVuZC1vZi1zZWN0aW9uIFNUVF9OT1RZUEUgc3ltYm9scyBpbnN0ZWFk
IG9mIGJhaWxpbmcgb3V0DQo+IGJlY2F1c2UgYW4gaW5zdHJ1Y3Rpb24gY2FuJ3QgYmUgZm91bmQu
IFdoaWxlIHdlJ3JlIGhlcmUsIGFkZCBhIG1vcmUNCj4gZGVzY3JpcHRpdmUgd2FybmluZyBmb3Ig
U1RUX0ZVTkMgc3ltYm9scyBmb3VuZCBhdCB0aGUgZW5kIG9mIGENCj4gc2VjdGlvbi4NCg0KVGhl
cmUncyBhIHBhdGNoIHRvIHNvbHZlIHRoaXMgYWxyZWFkeSBhcyBmYXIgYXMgSSB1bmRlcnN0YW5k
LiBUaGV5IHNlZW0gDQpkaWZmZXJlbnQuDQoNClNlZSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjEyMDgwNzI4MTMuMjU3OTktMS1z
dkBsaW51eC5pYm0uY29tLw0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQaWdnaW4g
PG5waWdnaW5AZ21haWwuY29tPg0KPiAtLS0NCj4gICB0b29scy9vYmp0b29sL2NoZWNrLmMgfCA5
ICsrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90b29scy9vYmp0b29sL2NoZWNrLmMN
Cj4gaW5kZXggNDM1MGJlNzM5ZjRmLi40YjdjOGIzMzA2OWUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L29ianRvb2wvY2hlY2suYw0KPiArKysgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4gQEAgLTQy
Nyw2ICs0MjcsMTUgQEAgc3RhdGljIGludCBkZWNvZGVfaW5zdHJ1Y3Rpb25zKHN0cnVjdCBvYmp0
b29sX2ZpbGUgKmZpbGUpDQo+ICAgCQkJaWYgKGZ1bmMtPnR5cGUgIT0gU1RUX05PVFlQRSAmJiBm
dW5jLT50eXBlICE9IFNUVF9GVU5DKQ0KPiAgIAkJCQljb250aW51ZTsNCj4gICANCj4gKwkJCWlm
IChmdW5jLT5vZmZzZXQgPT0gc2VjLT5zaC5zaF9zaXplKSB7DQo+ICsJCQkJLyogSGV1cmlzdGlj
OiBsaWtlbHkgYW4gImVuZCIgc3ltYm9sICovDQo+ICsJCQkJaWYgKGZ1bmMtPnR5cGUgPT0gU1RU
X05PVFlQRSkNCj4gKwkJCQkJY29udGludWU7DQo+ICsJCQkJV0FSTigiJXMoKTogU1RUX0ZVTkMg
YXQgZW5kIG9mIHNlY3Rpb24iLA0KPiArCQkJCSAgICAgZnVuYy0+bmFtZSk7DQo+ICsJCQkJcmV0
dXJuIC0xOw0KPiArCQkJfQ0KPiArDQo+ICAgCQkJaWYgKGZ1bmMtPnJldHVybl90aHVuayB8fCBm
dW5jLT5hbGlhcyAhPSBmdW5jKQ0KPiAgIAkJCQljb250aW51ZTsNCj4gICANCg==
