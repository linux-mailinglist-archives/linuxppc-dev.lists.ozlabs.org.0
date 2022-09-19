Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 522375BC358
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 09:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWG1j1l4nz3bnH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 17:06:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Lyud+m5g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.53; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Lyud+m5g;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120053.outbound.protection.outlook.com [40.107.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWG0v08fwz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 17:05:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKSMpYVMGuz4Occ6KOrlWFur37qLeWsK25F7XAH0ZVMrzxyqwfSo0/Y35AOAa98SQXzP58S5/hJGVB1n9avsxwogeIG/GuOeGnNP8ecQb/hJ3P/Crm3Kwrb4UceBBbdiMuvQDMGkkWqIp8zlIdjAbqpnX8BnwJHjDLEWfl7HVMxgvInv8Tvhl//cA3wBGQw3jAJEizD5Z2FeuYnfDqov3nzaaqTjAUt22Wjd0EQt1qNxZNEGqZ20RwGSEJZbV0JtaxBkM2KDNJ6+BL50J+qt4BSs4ItCloNZvO44fzARCb7fpUFAJNo3oWCUmbqG1HzqxXLdbUjF1sZ9c3JGUdIZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHTQRYxC+TL/iwgV33CGcuL9StJO1/csDCeiYFEOHnE=;
 b=giINXa4h5fPfhXq8JT0+EEqZTecGNv8YbyDjhosU5LxxPrQgt7nOM7oFBECBZ0xwIMgnLEQEVlAqVqpqLkW7xD3TN2HRwGXD+gon+r3knwlFztQRcGg7PiXRsrheUHm09KB2J6g5qJjkwprJCWcwzLGRhS6Do4tAxPznfET13cQ0N1CQeamfXTfrVOgxx3myzrh7NhUkpVaYJcGV1PI9d+XDhM1p2XnSmdmlr3KIVP0XyCEBCaSkn7DBCfnggU73BpInutqSLcY792pO9A1mGzNSItxOexYs/Ipnkw2lUpiYRFbCE4Kbju6/xpaZ8WrnKBWwHFyIV8MHVpBdA2xALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHTQRYxC+TL/iwgV33CGcuL9StJO1/csDCeiYFEOHnE=;
 b=Lyud+m5grX373DBukdvSi+VI1XCEjx1Rap+9S5RLKZRSCwVu9QpZYzfKx9TUJ0NcBRofJHUA5NGKxgqd1DKni8dLKCM7RzJsprSdgjIhOrlS05uy7seaaATjDOMoeYPTDhXW9RxCn90Ym0c61tSrPDMoK0JxQ4vHcn7HlAPWxBfrFWs08V0XDrMdQShWFYBJE9YK3HQEgjfIPcSy8AjBPpOS3ieHOl3V8e+TdsAKzZWv/JdySj5hIZdAJPsRSIWSL/QrRAOwlqtMr2XSfLKoYosnVQt8mMSmlCUzh0I2XbbZlN15jUID353DeLWvXp9jtzQt6z49ZiW5Kcii1MNwhA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1822.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Mon, 19 Sep
 2022 07:05:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 07:05:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Miehlbradt
	<nicholas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Thread-Topic: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Thread-Index: AQHYy8nlJhklTd/R3EqJQuCxsQBgTK3mU2kAgAABagA=
Date: Mon, 19 Sep 2022 07:05:30 +0000
Message-ID: <ad4817c8-3802-fa78-ba03-aae998b603e7@csgroup.eu>
References: <20220919014437.608167-1-nicholas@linux.ibm.com>
 <87k05zlugl.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k05zlugl.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1822:EE_
x-ms-office365-filtering-correlation-id: 7b042cd8-4aea-4d61-1d7d-08da9a0d5662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uFE2fmugJiX+v+EMM1qS6t2Bc+TigJ+/3kshllVyd42kRCyx6I6wbR/x4NLk4BUxhSxgs67j0OsHLnzjGy8zbOPXB7hhj5YyhXwW+rUraJnWmBIn7k2Vqzt0GV9W/QakbChTWQPxZUeD9lzxbDwvQsj64zP0WyPzKfbeNToD2m0H+inckAb+9jo6EdL4s/FbWhtb0SWa7MZWkVt7nN26DDwOf9vM+d6Z/KP4v+u5vbBPuaZuGeulg5QGb7HZWcx9BiHGlFVtHaa0TBmd8TD8E3LCVXKL7OBv6ni8t87Q0XUabhbWcs2ReFtIYa0jpxQm4SHlKFJ2xT4abQxq0T/9p5l0TYPPiZXd/uUCprUWWuCgjGqaChvvmcnnZKwtxoh8s/cfGXAABtbzFA1pakSkIgcuGl5FSCywd65w/1joCASDwPEC1Mifx/WmMLqf6v7C6bZzFhQ/E68pHuh/1nQLfL82g0iOdWAHIgUFEFOIX18xl3FenWumRm3LszUjuDhcpXqjfcJfPiMO8A2njrcnLx842P7pNog4TVYbk3Fu2MvBSUUjLRlaXtuJDZ2ldUkWcajN2p3FEsERfpdmLH/+MMhCtpADaD0aW9EX6Ia3ZCMVUQSHV7dsR5cbH93TMwKI6Fny/mJOktOsfhK5A83StJuXCaNVpTNwy73k2y83K8jjUpmqhL5R2weKG6u+rEngECK+Rr2Y7WTJr8Jl8aTvTBwYVXI6xxUBHv4ZFTzjK+cNzDmN4qTeFdN1ZxTGZN3kbs9Mc6h43VdoxrJx/E0mzEGwU7k1TZHYWsWdIsRDxvycoZAMlGgarQbTevBSl9nzxvILEejIJftESkaeRmXbqQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(451199015)(38070700005)(66574015)(38100700002)(186003)(2616005)(41300700001)(2906002)(31696002)(26005)(6512007)(71200400001)(478600001)(6486002)(316002)(110136005)(66946007)(36756003)(66556008)(76116006)(91956017)(66446008)(64756008)(8936002)(6506007)(8676002)(66476007)(86362001)(44832011)(122000001)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bnQzYWxYWTcvbU1Rcktaam9tVEdmb0pUblg1eG9rYVV6OGJrbnVPMktjTzlE?=
 =?utf-8?B?YjRmSVg3MEkxS1g3eHZxdnhVNVkwRCtFWlA5RDhkUVBhNHhqZzgzSmJscnZM?=
 =?utf-8?B?ekdJSE9idy9HMlN0VkVMaXJJeTFjMUNKL0UvWjMwSkM1eGt1eGxJb3UweW5o?=
 =?utf-8?B?bVl6RkVqMzBlanBVQ0F1TnllUUJsUkRlY2lhRkhtSzl5Wld3bWUySWV6aGI3?=
 =?utf-8?B?R3ErS3dia2ZxeVltZlNFcG1SNzMyK0RwWHRpTStJUUt4TURSTXU5SkVxT2cy?=
 =?utf-8?B?Z3dUUWw3U3d5MVhmWTVRbzFlTDE3ZzRuTnBvK251enFvZTNndG9aN3RuVE1O?=
 =?utf-8?B?YTRhY2NOV24wbldvKy81MGZVV3JMZU9nTmhZOUZnb3ZCM0UrUk1JUW1TUWlH?=
 =?utf-8?B?My81dzVDZ3ZJNlkwaDdKMXc2NlRTeTBRUmtGYWRmREdhOWJ1emxXcE8rQ2VU?=
 =?utf-8?B?cFRtMWFYU2NWVGpaQWc3S3pBdVc5Sis1Ny9wMTI5UlNidDZ2NU4rMFRoVW9P?=
 =?utf-8?B?ZWhnNlRVdjFTVWhqTTdCSURkQVZwSGcrWWttMS9BclBRY25yZDhvMGlaWGxT?=
 =?utf-8?B?cnRCb3Y5dzVHL1p5NWxSdEVGQkRnRXcxNWp1cFNqMjIrODVPOWRzc1FGblVC?=
 =?utf-8?B?U0h6WkZuaXhJUkJoMStFTytiOEVBaVdka0hTTTNPaU4xRnZSdE1ydXczK1h3?=
 =?utf-8?B?eVZxTEVNZFUrdW9lR3FyaGhVM1JVWkFnNklZcWlQT2xsQ3ROYWdYYXlSc2Nk?=
 =?utf-8?B?NCs0R2FLS3FMLzNWQnh5bGtJMzN1bzNBR0piS3Y1RHVLN0hLa211WTRDRExq?=
 =?utf-8?B?Mk4xek9LM1F6R2xXSnNQa1l1bEdNK2hQNGhLVXllMkhzNmtIOW9nRUVGbEYr?=
 =?utf-8?B?WXZ6QllzYllVbDlZMkM5bTBtLzhJT2JIWmd1TUwzZjBjNHBVZStCWUowUy8r?=
 =?utf-8?B?NDJKdXNhU3ZkbldxQndQSDlBWm9RUmFuRGZlZVhqcGxrZnNyVytZZzl3NGd4?=
 =?utf-8?B?dDdxMUNxTFdrR3J4UUJMWGRvdEVYTWdzZ0hkZEZIcHlMMmpXK2xHTEdIQ1hr?=
 =?utf-8?B?WGQyM1ZITVN4dWlGazB1UjRGZnA3Ty96MEpWSXZUb1QyZ285VHhRRmxabThV?=
 =?utf-8?B?alJINWNrNkdHeWNXTnNZNDRIeEkyYmxkcE9TZmM4T1F4UUdwdlgxM3NydTJw?=
 =?utf-8?B?L3FyUXZ1TkJBNW85VjhSSmlJdjRyQTFPeVJXQU9xamw5djEzM3pCS0R0Z1cr?=
 =?utf-8?B?bjIvdmlsaDdvaVlQbWs2UTUyc1pBT2pQdFNtY0k2T0VKRGwrVTY4d0NZNjYr?=
 =?utf-8?B?YXlSbWlqUlEzMlRGcXBSTFRYQkI0N2s3anJjZEdMTDI3SnkyYkVkZW1IUkhL?=
 =?utf-8?B?Q2J2NEtiZWVjUUxaa0JaTTlRVGpZaURNd0hzWWd5MGpGcTBsUThvdzVSandh?=
 =?utf-8?B?ZUFNeGV6TEVJYnA3UlZHdFUrbkVIZCtsTkNzRHQxZTRscXoybHFQSTVRRWg3?=
 =?utf-8?B?UlZGZHlKeDFINDlzTjVMdEQ4Qi9oYjdNcE1PNUtZSVlSRzNjbGx6QkVZRk9Q?=
 =?utf-8?B?RzJ0UDZLbnBUcHRZM0RrMElETjJrSkx0MGJLUE0rZk50VjhwckdzU01qaEVO?=
 =?utf-8?B?c3lWVFRxTlVhVkhLY0x5SjJhK1F6N0JqcmxLbGdvNWE3dWRoOWEyR2ZQK29X?=
 =?utf-8?B?aUJUM1FXK3lpRjlyditUa1VXSW0yRHJDZ2xKZE1nS0tnWE0yWi94YXAwditu?=
 =?utf-8?B?R0xzbDZ4UTVlY3NuRGNMdlJJVHdzYVlnWmhZektVR3Q0UGRVTllmME9vaTZy?=
 =?utf-8?B?SzNMYVhuQzhVSFpxT3NpeVVRVWxyZ3lHQWtZdXBDQ0JUM1JwdmtPMFlxWXMz?=
 =?utf-8?B?ckV0ellpUktxSytzNnliRFhaZmc3dlBrTEZDVzcwS2E2VXVSTC9QYncxd25N?=
 =?utf-8?B?cVN5L2N4TnVGamVuZTBFRVhhNklrRzJiT2hKKzA2czlRbmc0SFFYcU5kOVRt?=
 =?utf-8?B?Q3huUG9WSngzdGl5aWNPUmg0bVlrcWw5L3Jab3ZkT01XUjJXTWZxTCtlU0Zj?=
 =?utf-8?B?NG9zUFBzc1RvNnhPeWJPTUszRXpTYi94WDIycktmSkE2NTV1VTRGNzJ3WkZo?=
 =?utf-8?B?aUlhWXhxMFNqNVdQaGd4VlYwT0FsNTRKYUNHMEMyV0xkSVVsYUw3ak81L3lW?=
 =?utf-8?Q?b4QAV96KUg0VHaD/NXSYeW0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69AC66253F2C1649A80203C2F97B88CC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b042cd8-4aea-4d61-1d7d-08da9a0d5662
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 07:05:30.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkY9tD1+CZ1ONr60sL+jYAp7VHVli8U74yIhrduRedtQ82KTS6+dXhlIoTjw3ZvGKg6A54BGLtwMKDprDY8Zw+yfa+g9YpvuYY5fdv06sZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1822
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

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMDk6MDAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gTmljaG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4gd3JpdGVzOg0K
Pj4gVGhlcmUgaXMgc3VwcG9ydCBmb3IgREVCVUdfUEFHRUFMTE9DIG9uIGhhc2ggYnV0IG5vdCBv
biByYWRpeC4NCj4+IEFkZCBzdXBwb3J0IG9uIHJhZGl4Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IE5pY2hvbGFzIE1pZWhsYnJhZHQgPG5pY2hvbGFzQGxpbnV4LmlibS5jb20+DQo+PiAtLS0NCj4+
ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYyB8IDE2ICsrKysrKysr
KysrKysrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4
X3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMNCj4+
IGluZGV4IGRiMmYzZDE5MzQ0OC4uNDgzYzk5YmZiZGU1IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9w
b3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYw0KPj4gQEAgLTMwLDYgKzMwLDcgQEANCj4+ICAg
I2luY2x1ZGUgPGFzbS90cmFjZS5oPg0KPj4gICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4NCj4+
ICAgI2luY2x1ZGUgPGFzbS91bHRyYXZpc29yLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9zZXRfbWVt
b3J5Lmg+DQo+PiAgIA0KPj4gICAjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL3RocC5oPg0KPj4gICAN
Cj4+IEBAIC01MDMsNiArNTA0LDkgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IHJhZGl4
X21lbW9yeV9ibG9ja19zaXplKHZvaWQpDQo+PiAgIHsNCj4+ICAgCXVuc2lnbmVkIGxvbmcgbWVt
X2Jsb2NrX3NpemUgPSBNSU5fTUVNT1JZX0JMT0NLX1NJWkU7DQo+PiAgIA0KPj4gKwlpZiAoZGVi
dWdfcGFnZWFsbG9jX2VuYWJsZWQoKSkNCj4+ICsJCXJldHVybiBQQUdFX1NJWkU7DQo+PiArDQo+
PiAgIAkvKg0KPj4gICAJICogT1BBTCBmaXJtd2FyZSBmZWF0dXJlIGlzIHNldCBieSBub3cuIEhl
bmNlIHdlIGFyZSBvaw0KPj4gICAJICogdG8gdGVzdCBPUEFMIGZlYXR1cmUuDQo+PiBAQCAtNTE5
LDYgKzUyMyw5IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9faW5pdCByYWRpeF9tZW1vcnlfYmxv
Y2tfc2l6ZSh2b2lkKQ0KPj4gICANCj4+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IHJh
ZGl4X21lbW9yeV9ibG9ja19zaXplKHZvaWQpDQo+PiAgIHsNCj4+ICsJaWYgKGRlYnVnX3BhZ2Vh
bGxvY19lbmFibGVkKCkpDQo+PiArCQlyZXR1cm4gUEFHRV9TSVpFOw0KPj4gKw0KPj4gICAJcmV0
dXJuIDFVTCAqIDEwMjQgKiAxMDI0ICogMTAyNDsNCj4+ICAgfQ0KPiAgICANCj4gVGhpcyB2YWx1
ZSBlbmRzIHVwIGluIHJhZGl4X21lbV9ibG9ja19zaXplLCB3aGljaCBpcyByZXR1cm5lZCBieQ0K
PiBwbnZfbWVtb3J5X2Jsb2NrX3NpemUoKSwgd2hpY2ggaXMgd2lyZWQgdXAgYXMgcHBjX21kLm1l
bW9yeV9ibG9ja19zaXplLA0KPiBhbmQgdGhhdCdzIGNhbGxlZCBieSBtZW1vcnlfYmxvY2tfc2l6
ZV9ieXRlcygpLg0KPiANCj4gQW5kIEkgdGhvdWdodCB0aGF0IHZhbHVlIGhhZCB0byBiZSA+PSBN
SU5fTUVNT1JZX0JMT0NLX1NJWkUuDQo+IA0KPiAjZGVmaW5lIE1JTl9NRU1PUllfQkxPQ0tfU0la
RSAgICAgKDFVTCA8PCBTRUNUSU9OX1NJWkVfQklUUykNCj4gI2RlZmluZSBTRUNUSU9OX1NJWkVf
QklUUyAgICAgICAyNA0KPiANCj4gDQo+IEkgd291bGQgZXhwZWN0IHVzIHRvIGhpdCB0aGUgcGFu
aWMgaW4gbWVtb3J5X2Rldl9pbml0KCkuDQo+IA0KPiBTbyB0aGF0J3Mgb2RkLg0KPiANCj4gSSBz
dXNwZWN0IHlvdSBuZWVkIHRvIGxlYXZlIHJhZGl4X21lbW9yeV9ibG9ja19zaXplKCkgYWxvbmUs
IG9yIGF0IGxlYXN0DQo+IG1ha2Ugc3VyZSB5b3UgcmV0dXJuIE1JTl9NRU1PUllfQkxPQ0tfU0la
RSB3aGVuIGRlYnVnIHBhZ2UgYWxsb2MgaXMNCj4gZW5hYmxlZC4NCj4gDQo+IFdlIHByb2JhYmx5
IG5lZWQgYSBzZXBhcmF0ZSB2YXJpYWJsZSB0aGF0IGhvbGRzIHRoZSBtYXggcGFnZSBzaXplIHVz
ZWQNCj4gZm9yIHRoZSBsaW5lYXIgbWFwcGluZywgYW5kIHRoYXQgd291bGQgdGhlbiBiZSAxRyBp
biB0aGUgbm9ybWFsIGNhc2Ugb3INCj4gUEFHRV9TSVpFIGluIHRoZSBkZWJ1ZyBwYWdlIGFsbG9j
IGNhc2UuDQo+IA0KDQpJIGRvbid0IGtub3cgdGhlIGRldGFpbHMgb2YgUFBDNjQsIGJ1dCBhcyB5
b3UgbWVudGlvbiBsaW5lYXIgbWFwcGluZywgYmUgDQphd2FyZSB0aGF0IHlvdSBkb24ndCBuZWVk
IHRvIG1hcCBldmVyeXRoaW5nIHdpdGggcGFnZXMuIE9ubHkgZGF0YS4gWW91IA0KY2FuIGtlZXAg
dGV4dCBtYXBwZWQgYnkgYmxvY2tzLCBpdCdzIHdoYXQgaXMgZG9uZSBvbiA4eHggYW5kIGJvb2sz
cy8zMi4NCg0KQ2hyaXN0b3BoZQ==
