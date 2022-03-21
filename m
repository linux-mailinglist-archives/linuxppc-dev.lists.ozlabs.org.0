Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8F4E20B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 07:47:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMQD76SfHz3bZ7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 17:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMQCd6vp6z2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 17:47:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3xbLi7pgtsFE5P1atULP4JFxO6Enm/SNJwlBuMtJAW4e0HiwfMUd3qJeMgJY8FP+SJuQbAuGBDSDDVA8KY/0jlFqzI1xfkVb6YCUOQmtO9Vxa+gh2HegdzgrP+wYN3U/YoU8yV3tS3+4hLPUFEIMYs6ybbURY51rZYcueq+D+eRhd5HmYOjy2e+CIc47t3tbNJjGRYVhyzQa/5cl13/YDuslsNN/maMleu4LboUqR52dvBwtZzAlt3RqmclJIkILD+d0GP98ijHsCAF50WGrIgA/0AKk66GVrgs/OE3avNrcg7w+nFZkmcE+QSg900P0mGB15/BfjdUmVqJ65IppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyvT+ye4HUAVP20wJGgE9BMYecMEgyg3ptG6Iha5OZY=;
 b=UgpggvINyyr7pqivfjHfQeBa4w5JLQPkr49MAvrX+4/rbuve7oBYAQkIpLVM+fl5FBaZiILROocz9KkRMZjPFq9L3UJKcfVYn8mGCML1TckzSXuxpGlB41udrbkeKZmAqhw+EhfvYI6BJF7/pD70LQKQ8sDjvp/CMa8Ob4Bz7xzEe0jHxSeUtXGiv5OrobK4stik9Uas6WXGDqenH91NcDLlWGhOv4rxK4wq2Yu7f9jtXgpRA9duEbSHliBoX48rWW7SEOTDUqHflOrr4lGwxucN+5FT8FSIsGBIt9IYAPQAQdV9U+31JuwDeJOBeIXMQUOIWNDsfmrxF55Ld10vnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3678.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Mon, 21 Mar
 2022 06:47:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 06:47:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzFK0EAgAP1goCAAEisgA==
Date: Mon, 21 Mar 2022 06:47:07 +0000
Message-ID: <d6b928b1-846b-cb43-16dc-4c22e4d58853@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
 <87pmmgghvu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmmgghvu.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4615f550-e0a8-4ec7-3a36-08da0b069dfc
x-ms-traffictypediagnostic: PR1P264MB3678:EE_
x-microsoft-antispam-prvs: <PR1P264MB3678282A9245543AD78A9D68ED169@PR1P264MB3678.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0nQ5m7iujI8TBsGo+cJllzEUUzLL9XVTvxHqIFclqzvTHtkQYKE9TkVsL47fQ3wXp08/0b2Zmw3mIqlaXnxzl6/GAwwKVRFLBEKlq0TtYcALCTr3QJHms+6TBbXuPQJOR/2MbSBd65ehurNuolV0LENfwzEJqGpFsM3J71CM82bTJqt+MzCKaTxqb7zwy5Ho/fbB3RUOjymI4xSVkbWZP07Wwb0yegbeWAQeRY3sww7EPRT3CTLiXGGduphAAR+KCHCO+dy9TMfu56Nfy8G1vksU9kN6NxjT18JCVA54Tqq3Wx9T5qCX6QUZ3/7I0oyysUQw2aitR9JkZ1LZ6afyxSEjnEtgdrr7jTM3iVXKUfzTKW/cmN3OtzKfWOWqixtcRw7CjmpGT8SiEXGj08S8yV/UVRxOk2IkS40lVFO/6qi+nNx9MATP34s9Dra6Y7nzA5MSAiPrQiUtZ+/NYvvXVTcA1w01Y+GC0isz8M9HMtv6v2qxDARgcI58BUyR/f0BDv2c6UZdQh37FOYz04a2w3m2GcBNdJiP1Lbv91pxM9ruRUh9X5rKByIe6s33E29tmIbrHrxSsoY8d345hAAkOMEhZhR7h+ZvjU/WjX9vV4SoRfw6Ceu+f7cRxze/1nL6U7wX6aM2e65oNkmAYiiaHaIGAF8Z/O9BnTgI7qD0lP9dYKK4i3KFOiFCy+klyEYSLgeqH77098hNDe9jKKCp/xUIirp09JFe2Iy3F/wPmCvvfrBZOoA3ivvBR7W//As4MxL3Wve6aXvXtUmFbAlROlisUsftEWO+EyAa+9bTaAZzq/RkifHDN7bCXJ/YE235SEpYzGB1uQQCTJxQYusMlXVozog+AgzQHpPR9UQm2QbfpgFvPNaPOEfoZ8V119IA2qsFKb6euQV98mk5y2KTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(316002)(31686004)(110136005)(8676002)(4326008)(66476007)(66556008)(54906003)(966005)(6486002)(71200400001)(66946007)(38070700005)(76116006)(36756003)(66446008)(64756008)(86362001)(2906002)(6512007)(508600001)(2616005)(8936002)(31696002)(38100700002)(122000001)(44832011)(4744005)(5660300002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkw4bzRyZGQ4WHFvRFdiNUttaU9NbVYwMEYyRW11Q2xyNTg1S1Fabjl0VU90?=
 =?utf-8?B?by9jcXBBNENvL1F4QURROVdHdzRxZUVsZkdpVGIrUnZiTVpTUFYwNG5uM2NS?=
 =?utf-8?B?YXlPTmRvdVVEdE8zZjlPSXYzNHBOUi91Tmh0cDFBVTMxbERlYm03MXBmcy9i?=
 =?utf-8?B?ZkxjRmZqZHE3RlhCMjkzY3BRMFlPQkNWVGxuWjBhUFRkNE1tNnAvQ0RnVlAy?=
 =?utf-8?B?SHRzTnpvdWNiR2EyY2N4WWkzYkZ0aWM2cGkwUXRaOVg3QnNaWlltRDJPWkFV?=
 =?utf-8?B?bmhnRXJNanZISkNvWjJWRWZQbUNOejY2N3NVaHFrT0ZsUE5vM2VqNVU5RVVP?=
 =?utf-8?B?OHRvVnRQcGVKdXhIYXRIMnhQb1ZWVFFScEZIa3l4UUU4MVBYSnY4cWx6R2ZJ?=
 =?utf-8?B?bXhPRE1CQlFhNmhDSlVob0NCVHMyaFZLclR2TGJ0akNJRlpLWUpuOHB0Sk54?=
 =?utf-8?B?VXRLM3JsRFBGekJFL3RaRk1iMEZmTkVjblhSRGx5RXVQVUJkb0gxcU13NEUw?=
 =?utf-8?B?bVh0enFsa3ByVjVmcXNLaldsb3JNdGxHM0hJRlo5Zll2YjZoenM4ZFRtYkVh?=
 =?utf-8?B?bENLajIzRHhaZ2NKd25LcmNmK3NUR2F1NE8xMFJrc293VmNxTEFDUC9wdG9D?=
 =?utf-8?B?TkZzYS8xMGxrSk4rL0p6cmFwREhQZnlMT3VhQmN3RUFRUnNiMFNDbStFR1Av?=
 =?utf-8?B?SDI3NTE5aVBUbWNCWk1PY1BiMVdYckJSTUxtTktsTDg4c0FyMmJyUGZMRnBS?=
 =?utf-8?B?bHNFdkNmRGlRQ2V6UlNyeW9nSzlaUHEvSGZBc056YXE5NmJVWTJlWXlJSFcw?=
 =?utf-8?B?OFA4akgybGRSUElhR3BBL01vSktKbitOdGd3WGs0WVAwSldrU2VnL0pFMUZo?=
 =?utf-8?B?UXArKy9ocGJoSjBmdGFMTUVpeUIwT1lENURmanBveGdUSDhtb2VOelJkc2RW?=
 =?utf-8?B?dU9pTjc2SjE1OTZobURjZEQwOUNISHBCMEdTY3JINFpNVUJ3K0ZoSkVuSlV4?=
 =?utf-8?B?VlZDU3FTUTJ5cCszSGwxeFZFci8ra0RUQzhpTHJpZXJGSWh6OXJQOGY3THgr?=
 =?utf-8?B?dkNpbzYxRDZ1dFJuVGJlaTNtQ2R2bWhrVWUwZ2w1ckd2Uk9lOElMZTJPRld4?=
 =?utf-8?B?NWhIK2x4ZTlGbFRhMWZKdFltY2RPTngwKzMrVlVzWTNiWFN5WkFjNjZ0djUr?=
 =?utf-8?B?RUIvTTlicWdMamNQemgxZC9sSHdPaG1aWFlTSlVXR3VXZlJLbXdaUE1vMm9V?=
 =?utf-8?B?WWNOYXNOcUZNNUtudk1nckc3cWRnK3h1U1VCMjNIMFREVXBPYjk5OVVhUzEy?=
 =?utf-8?B?b0psMFNCYzJRMyt0TVVabk1YMlkrK21nUFozM2x5T0VCUmtvSmpLM1lqa20w?=
 =?utf-8?B?QU4vWkpvOXBPT0s3V3dGZGxEVEp5aWFGdmxxUVozRXRjd29YUGt1dnhDOWpO?=
 =?utf-8?B?VTV0U05uNWw1Q2VmRzlJcWJrMXlSTkw3MGwzaDRGRnVOM2Jmd0J0TlNYTEdk?=
 =?utf-8?B?SmgraEJ4VzZUQkYwRms3L2dKVGZEOUVoaEhzK3pZR1o0T0Z3UUIyeE1XeWNl?=
 =?utf-8?B?UUNwQ2FCRUVyazRoZkFMbm5MSjVSVFlwRFNYdE1YTlk5ekZkQWYydzA2RDhh?=
 =?utf-8?B?djBWdHE2SGV5OTFQNDVyZ1pMTEpMM1hOWXkxR3dGdHdIZkR5MXk1ZU56bmRq?=
 =?utf-8?B?Z2xyZTZvdysra0R6U3pSMzJZaU16NUlFREl5cmJoakJwNmY5UVFxWkRuVllH?=
 =?utf-8?B?NlVCWDl2WGtrUW0wR1FVQjNYOXVQOWRkdEZSSXVseUwrbXhkdmowVXN3QVc3?=
 =?utf-8?B?MjF5aGtKSTIyb08vOHFwSW1PKytWUFZPTWFyODVVcS9EUHdoMkt6UXhZclJ2?=
 =?utf-8?B?ekV0d216cXlDbGNCb0Z3bWhjekN1YXhZQ3ZKMHhMazRqZmYxcVo5eWtyTXhm?=
 =?utf-8?B?aU8zZzk5ODZ1WnhiUGxFekZzbG1LVjN5UnpvRU1NUnRPSlFKSG1adkdSRkx1?=
 =?utf-8?Q?D5KPvWFlMBR068yiGLtTpuXD9Wl+BM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD5544F78065814BA5A748FFDB6416A8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4615f550-e0a8-4ec7-3a36-08da0b069dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 06:47:07.3873 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6jvTy9na7GPFRRgWu2Jlcmi0/7rTol+8teWUBewErbt8bNqES2uzrsWZpKhvSPDqxyHf9OxZxBqf+CBh2ncwf0Y0hnVa49TdcEp1DuKIA9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3678
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDM6MjcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxOC8wMy8yMDIyIMOgIDEzOjI2LCBQZXRlciBaaWpsc3RyYSBhIMOpY3JpdMKgOg0K
Pj4+IE9uIEZyaSwgTWFyIDE4LCAyMDIyIGF0IDA0OjIxOjQwUE0gKzA1MzAsIFNhdGh2aWthIFZh
c2lyZWRkeSB3cm90ZToNCj4+Pj4gVGhpcyBwYXRjaCBhZGRzIHBvd2VycGMgc3BlY2lmaWMgZnVu
Y3Rpb25zIHJlcXVpcmVkIGZvcg0KPj4+PiAnb2JqdG9vbCBtY291bnQnIHRvIHdvcmssIGFuZCBl
bmFibGVzIG1jb3VudCBmb3IgcHBjLg0KPj4+DQo+Pj4gSSB3b3VsZCBsb3ZlIHRvIHNlZSBtb3Jl
IG9ianRvb2wgZW5hYmxlbWVudCBmb3IgUG93ZXIgOi0pDQo+Pg0KPj4gSSBoYXZlIG5vdCByZWNl
aXZlZCB0aGlzIHNlcmllcyBhbmQgSSBjYW4ndCBzZWUgaXQgb24gcG93ZXJwYyBwYXRjaHdvcmsN
Cj4+IGVpdGhlciAoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBj
LWRldi9saXN0LykNCj4+DQo+PiBEaWQgeW91IHNlbmQgaXQgdG8gbGludXhwcGMtZGV2IGxpc3Qg
PyBJZiBub3QgY2FuIHlvdSByZXNlbmQgaXQgdGhlcmUgPw0KPiANCj4gSXQgaXMgdGhlcmUsIG1p
Z2h0IGhhdmUgYmVlbiBkZWxheWVkPw0KDQpZZXMgc29tZXRoaW5nIG11c3QgaGF2ZSBnb25lIHdy
b25nLg0KDQpQZXRlcidzIGFuZCBteXNlbGYncyByZXNwb25zZXMgYXJlIG5vdCBhdCANCmh0dHA6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIyMDMx
ODEwNTE0MC40MzkxNC00LXN2QGxpbnV4LmlibS5jb20vIA0Kd2hpbGUgeW91cnMgYW5kIE5hdmVl
bidzIG9uZXMgYXJlIHRoZXJlLg0KDQpDaHJpc3RvcGhl
