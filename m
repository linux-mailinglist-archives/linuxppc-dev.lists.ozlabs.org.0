Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 724EB5B70F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 16:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRmKP1prVz3c4f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 00:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RNqbslar;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.25.104; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RNqbslar;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01lp0104.outbound.protection.outlook.com [104.47.25.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRmJY0Q5Pz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 00:37:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K53S/6NFnpLAOJVrw5WKv0InixvS1kO/nAUFj27Xs/0bWV89Ec4U9xIIOtdZGcM7uh7OcGun2OqkX4Cc63za4OD8YNgnvM7JbtNJzy/yNh7n/rWOO3gNW62lSKmRXyeNegosrB9AyT1wuSZbG1IMNDHzBJlfJ95dwRRUSitIY2rKy/YZfhHw7n7d8fWQLRr9aZlezy4FaR7B9/tQK47/6/VycJg7EHADl6STMUvEYdZXstH38mtk+neV8HZ4fCyW9ffeLbOLDQlzZgHgroDYnPMGHXHWNfGAPlwizM1qtHZffTNMG6awHqAoXf9POL9Ce0zY2q1RZ5JYZn4vQ2MaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOMT2LCrQrboJZxvgdyvPX1V565tT9zG94CxCCuR59c=;
 b=GdypeNYG+kfjVeJPbrrOwofS8VvprAtOI9wtWNwRj5OXaVQNfw7KkTDqW478VoHytLsPuTZE3jk7v8OVIVLd7lOwrx9QGcYhgmUxxdo6FoLoUw39zMPUxILnDKAvWNBybAYjsNcOe5HIAyeTQLh71Px7ygaPQBp1uxwYQZ4zm787f6NeC5J3/VUfsvxWnVafRQj/F9L1YB8+U0NppieiJjwR3iXs8Mgtpgbr0PufiNkB0il9X+ojP0xdLrJlTKxuIxpgLiLln4LUkevtJNEW1GkoEEcQxyaJ9bWqzYw4CUvxzDPl8lG1q6Ftmeci46sU0Rs9gtfBHgrERSMspCsWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOMT2LCrQrboJZxvgdyvPX1V565tT9zG94CxCCuR59c=;
 b=RNqbslarLZWZYQoe869GvPfo6hkG7E7lkrjWH/XuNWazX22wsC/R0fy4f8Dhr0Qq7uJh4TLP9jiADTHAyZu0y4KV19/W+cmLwWMalft0WKCqmvfxqquIG0USAOXPNCp68hcFw8CvwkL3FIakAXgqtOWvVrIW9Bf+u3fQCVvLM9n+FqhEZ+Tssv+eR8uDkCpGFIh+ti98uPiJnJvXQbfInYQAmSVgqexmppvEv23kfBMB5KfT7KwMGbOD+xu1zuSDHrsUOIUzCTTnsmVss8mzs0QUMWSO3losI1G83acKXGnjWK6WRVpX3OdtY+mWFRgGu4O/tkqd6GwYNyyPF0ziCg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3213.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 14:36:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 14:36:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH 3/3] powerpc: mm: support page table check
Thread-Topic: [PATCH 3/3] powerpc: mm: support page table check
Thread-Index: AQHYxknqVKGdgYKjqEOpbYBl2kdeUK3bUHiAgAFBYoCAAN4agA==
Date: Tue, 13 Sep 2022 14:36:53 +0000
Message-ID: <41c299c9-71b3-c917-056c-0c25368da2f7@csgroup.eu>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
 <20220912014703.185471-3-rmclure@linux.ibm.com>
 <29425071-eace-5046-dfe4-815dfadddf1c@csgroup.eu>
 <7F7F6B90-C1A8-4ECA-9485-23D9D0B56D66@linux.ibm.com>
In-Reply-To: <7F7F6B90-C1A8-4ECA-9485-23D9D0B56D66@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3213:EE_
x-ms-office365-filtering-correlation-id: 5c44e9c3-bbb8-4db0-17c7-08da9595672a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RGvV+IvTzTQzZAN6D6aMWRTW0ouByw5Wa5L5kk6q6KWaVIZMxgZu02SA5MacFsCss3veP13vRz7waGA6a2zHCk7udJXcI7FajCNk68yrmvke3N+CPl3bsgbsdKO9KZzLRzO6pQora/zQB79IotdvS6jQbBdl3D7v2DNOe1l5yyt53VAEpBJTeOPIZb5pXLvxDQa/hoxfFh05/GqHdOx8N28tA1VHP7hXamOqUmddbEt66z2Y6Hc8zkh4SfNOJ+bq2CIwKVmuXxUYCGlUYwtW5bsHZosTBVSszYQHmUPVqlRYaO89SUHkh3AQ+Dop85PRuFk0eEg7b+b85U2YP59F0FAvVp6+snha6T57h9UXrKGa611I0lvo5K//O1Of73D2oES4dtktFs7zg55CvkYN8tZln4JQB4iR9ffgLMmuXGXhDOo745+vebTEB7j99LrAHhzKqxI2ua297i90XYllSbJ3FOMrtW0rMAZzpzZ8Sj+oZBpYZJdiSHZosfqGILxntoJbO0GDaLnOynENHmWOR4jgVZxodqiBLFpKLroL+6a5F26nXH4vXh4l08g6x1/Mr//HVrrccAFnGkJfzqjrlLk6OA60k2fUqmNxp3jc9poxGckiW8Rp/LkjYox33XJcqEgUGsRF0jPaacc1HBFcZW2PpzR3gwCIc7+8qrWDoc/0gLyLlJPMY5CkxD9VZ+prhbtGKuw4wJMlw76fO+X7x/smOq+asgrfD6spU6FgOp7O5x9nlMoMmrUoGtozggNNPzjlUn9Q64kXDFNhgaSSryQJP6GkU6+rfbbDI0NiX/lk9eggQJ3luXFDlsmH7uGiScbBNn4ZOmX+PT/k6tlUgw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(2616005)(53546011)(122000001)(91956017)(44832011)(66476007)(36756003)(66556008)(66446008)(6486002)(64756008)(6916009)(4326008)(31686004)(186003)(38100700002)(6506007)(26005)(316002)(83380400001)(71200400001)(38070700005)(66946007)(31696002)(41300700001)(76116006)(2906002)(478600001)(8676002)(6512007)(66574015)(8936002)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZE1UaDcyTm1pNGViem12OExKNG9CaHBtM3k4elQvMlBMOU80MmsreTlkazFr?=
 =?utf-8?B?S2tDK2ZMY2FnN05TS2RNVlpKRzd3Q0gvT2F0L0I5S2tPSmRGMmxBWU1GR0tm?=
 =?utf-8?B?OFMrR0VGM0FBWHg2YlA5TzZ2MW5WQVFSL1FaUWJCQVhSS255U3JaMGNvU3VQ?=
 =?utf-8?B?TC8zMzI2YXZkSnZoYjQ0WW40YVNvcUpxdTVOQ3ljWFpiNFpVYjZtQ2I3Q21s?=
 =?utf-8?B?T0Y5NENkbTZZTUFGV3ppZmFBZjBKb2hhTjYxUTd5MjRBM25VemVJWG1MRWJq?=
 =?utf-8?B?K1BtK0FnYWw2MFJhQVBNSWJNekRTVkpIY0dXTUwwc0YyU0NheVJFMnd3UG9v?=
 =?utf-8?B?ZWlUNTFjY2NNVjZYcmx2bVJEK24zSmdoSU1NeDFLNnR6a2wyRHViMUNsYUdz?=
 =?utf-8?B?akVJR1RJMUwwQ0NnQ0pQSnpCYUU2YzRWRDhZLy9PbFZ2TjJzZ2RTZjVoREh3?=
 =?utf-8?B?TkpDV3ZKV01naHpoZXZsN2FzUlkwOXh6NjBDYTF5WnhjR2ZJS1BDWS9HZzBW?=
 =?utf-8?B?SjNRSlVKb2dCMTkzVUNESDdjK1R6QmpRNXJxYkhyRTF5RXd2M0JzY0Jrc0FG?=
 =?utf-8?B?cjZGR0ZvcHNSSERKd0NVcW9lY0IyVmJSTi9Vdk5nTHpXRzJMR2IzdVpLempx?=
 =?utf-8?B?WFJ5Tmx4MmlVdFlUY3NLYUExWmpLcHZBdDhrdzNzbUlnYVFwamNOVGpIblM0?=
 =?utf-8?B?ekhwVGE1bklvakI5LzVrbm9vSktSV2dNakkrZXM4cmh0dkZNQzF6WTZtbktK?=
 =?utf-8?B?cUdGUlRmT3Z1MDFGemI5TXRrTW95b0hIVjlYTzgrZTBVUFlsRnNMbHdSZDha?=
 =?utf-8?B?cFEyM3FyRU5icHNzUVg1S2VDZ2g4ekxFWERmeGZWTmxCNm5lRmNGZVYvcllB?=
 =?utf-8?B?dHoxbEUzUGh4cFZwcnFSOHNkWkEzcFV3ajRIcWlhNnR2UWFsdnhPbVdwdHJu?=
 =?utf-8?B?NGtkMWttV1pKM1pIYTZUbE5YdEgzd0k3WGZtZUd4MUhDTmdYUHl6L3QwS0Mr?=
 =?utf-8?B?VUlBOXpQOGFHc0l3a1E4d21FY0FaeGRJZVBadTFwYnpGWEJ0TXpHa1NQczR6?=
 =?utf-8?B?MHlobStlOGhoUEJUQkY0Z2Y4eUdXbmFQVUV5N0NkcXptRmRUbEZEajhzMFls?=
 =?utf-8?B?bHhOR0JSekFQYUkzT0M0U3FoVlBCWi9oTkFpakpFNE1IeElMeDEvZGtOMXpB?=
 =?utf-8?B?Z3duM0oxRE1aSXg4enJWYzNldjB3UVZWcWs0UE9JOHNub3Z0cUYzUUhpRXM5?=
 =?utf-8?B?dGFBR3NVMnprVXJQd1pqc2RpYmQ2M0gzSUpqd3BFQnlib09YMXhUQStpdGxZ?=
 =?utf-8?B?K2lKUWpQRFRlQ3JHWkJ6NXkxNmNwWDhBQnkxQUlNUjBObE1OaWQ2YTNnOS80?=
 =?utf-8?B?RGdIN2ZsL2taN0kwditiNU1Pb2g0T09Mblp2c2ptUjN3TWxnZE1oZFYycmgy?=
 =?utf-8?B?WHJhUHVuYzRzVHl0cTIxaUtURDNpNkJ2VWlRUWxNN2dYQWNsTXJHSFpFNWkv?=
 =?utf-8?B?bVVkS3BNbEdSR3dFbVgyMHdERXc5Y0hGeUc3RjZFZUdqWWg5VXQ3Qi9QODcw?=
 =?utf-8?B?OG9Yei8xWFlPUlFpcnltKzhpTFVhQmtna05HKzVFRVExMnJVSTdXRVFRT29U?=
 =?utf-8?B?ckl3MmZ2WUlYd0xaUjVWZEN5VDk4UUxRWHhiSmhrMTZYZ01sVTVpSWtqNHVU?=
 =?utf-8?B?SzFRYnVVTUQ2YkdRSk5PRCtaVVllTHphMjlBVUpFa2U5QUFPSlB6RzROTzYx?=
 =?utf-8?B?ckNaVlkwMDQvUFRqaEQyUVFycWd1ZCtPRjhoamlkWXNUWlFkblROdXFyR0Fm?=
 =?utf-8?B?VmtXZEtlQWxINzRjUzJzaGlEeFFBNW5MdlM0V0RZbVdOM3VMWUZKNDhZMkVT?=
 =?utf-8?B?WWdxRUQ5ZlpmMklqd2Z6ZWZ3dEZ0NHA2OGZHWmc1clNEbk5VaEZHc2E5VDQx?=
 =?utf-8?B?RmJKNUpSNXhPQytQZ0FoaThTMjQ4bVhRMm5tQ1NITkFGUFVsaEtYT3NCYW82?=
 =?utf-8?B?NEJ3eTZhVjhZR3EvRnR1endJZW0vNWJSTEhwMTlKOWtaekZRNjdUMW1zZ3VZ?=
 =?utf-8?B?QnFiNnZBcUJKZXhmbzJXazM3WUNWQ0x1dTF1bGdDNktpNFpGem11ekllMlBV?=
 =?utf-8?B?ZTNYcm5OSDRYS2MybmxNQWtvcWJHWmMxdFFjbGIxTjJVM04rdUlya3VEOEF3?=
 =?utf-8?Q?hCSPta1BFUKPXlyP5mGnmo8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA2DAD86A62AA54F8ECE29843B8462B3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c44e9c3-bbb8-4db0-17c7-08da9595672a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 14:36:53.9199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ei2chFY5f7P+5oXsoYRzf1AS4YV239elSQmQPNZNddVidVkK4etx8g7ToDSrKi0xw728s9zw6q4gLfOXOGoCea/rPq98Qo37spHVTnA6zTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3213
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA5LzIwMjIgw6AgMDM6MjEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+PiBPbiAxMiBTZXAgMjAyMiwgYXQgNDoxMSBwbSwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hy
aXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+IExlIDEyLzA5
LzIwMjIgw6AgMDM6NDcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdCA6DQo+Pj4gT24gY3JlYXRpb24g
YW5kIGNsZWFyaW5nIG9mIGEgcGFnZSB0YWJsZSBtYXBwaW5nLCBpbnN0cnVtZW50IHN1Y2ggY2Fs
bHMNCj4+PiBieSBpbnZva2luZyBwYWdlX3RhYmxlX2NoZWNrX3B0ZV9zZXQgYW5kIHBhZ2VfdGFi
bGVfY2hlY2tfcHRlX2NsZWFyDQo+Pj4gcmVzcGVjdGl2ZWx5LiBUaGVzZSBjYWxscyBzZXJ2ZSBh
cyBhIHNhbml0eSBjaGVjayBhZ2FpbnN0IGlsbGVnYWwNCj4+PiBtYXBwaW5ncy4NCj4+Pg0KPj4+
IEVuYWJsZSBBUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0sgZm9yIGFsbCBwcGM2NCwgYW5k
IDMyLWJpdA0KPj4+IHBsYXRmb3JtcyBpbXBsZW1lbnRpbmcgQm9vazNTLg0KPj4NCj4+IFdoeSBv
bmx5IGJvb2szcyBvbiAzMiBiaXRzID8NCj4gDQo+IFNvcnJ5LiBJIGZhaWxlZCB0byB1cGRhdGUg
dGhhdCBjb21taXQgbWVzc2FnZS4gVGhpcyBwYXRjaCBpbnN0ZWFkIHN1cHBvcnRzLA0KPiBwYWdl
IHRhYmxlIGNoZWNrcyBvbiBhbGwgcGxhdGZvcm1zLCBidXQgSSBiZWdhbiB3cml0aW5nIHRoaXMg
cGF0Y2ggc2VyaWVzIHRvDQo+IHRhcmdldCBqdXN0IEJvb2szUywgYW5kIHRoZW4gdXBkYXRlZCBp
dCB0byBpbmNsdWRlIGFsbCBwbGF0Zm9ybXMuIFRoZSBvbmx5DQo+IGJhcnJpZXIgdG8gZG9pbmcg
c28gd2FzIHRoZSBuZWVkIGZvciB0aGUgcHVkX3BmbiBhbmQNCj4gcGFnZV90YWJsZV9jaGVja19w
dWRfe2NsZWFyLHNldH0gYmxvYXQuDQo+IA0KPj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgNCj4+PiBAQCAtMTY2LDcgKzE2NiwxMSBAQCBzdGF0aWMgaW5saW5lIGlu
dCBwdWRfcGZuKHB1ZF90IHB1ZCkNCj4+PiAgIAkgKiBjaGVjayBzbyB0aGlzIHNob3VsZCBuZXZl
ciBiZSB1c2VkLiBJZiBpdCBncm93cyBhbm90aGVyIHVzZXIgd2UNCj4+PiAgIAkgKiB3YW50IHRv
IGtub3cgYWJvdXQgaXQuDQo+Pj4gICAJICovDQo+Pj4gKyNpZm5kZWYgQ09ORklHX1BBR0VfVEFC
TEVfQ0hFQ0sNCj4+PiAgIAlCVUlMRF9CVUcoKTsNCj4+PiArI2Vsc2UNCj4+PiArCUJVRygpOw0K
Pj4+ICsjZW5kaWYNCj4+DQo+PiBBd2Z1bGwuDQo+IA0KPiBRdWl0ZSByaWdodC4gSSBzdXNwZWN0
IHlvdSBjYW4gaW5mZXIgdGhlIGludGVudGlvbiBoZXJlLCB3aGljaCBpcyB0byBlbmZvcmNlDQo+
IHRoYXQgdGhpcyBkZWFkIGNvZGUgbXVzdCBub3QgYmUgaW5jbHVkZWQgYW55d2hlcmUgaW4gZ2Vu
ZXJpYyBjb2RlLCBidXQgcmF0aGVyDQo+IGJlIGdhdGVkIGJ5IHB1ZF9kZXZtYXAuIEkgd2lsbCBy
ZWxheCB0aGlzIHRvIGEgV0FSTigpLg0KPiANCg0KVGhhdCdzIHRoZSAjaWZuZGVmLyNlbHNlLyNl
bmRpZiB0aGF0IEkgZmluZCBhd2Z1bCwgbW9yZSB0aGFuIHRoZSBCVUcoKSANCml0c2VsZi4gRWl0
aGVyIHRoaXMgaXMgbm90IHN1cHBvc2VkIHRvIGJlIHVzZWQgYXQgYWxsLCBhbmQgdGhlIA0KQlVJ
TERfQlVHKCkgc2hvdWxkIGJlIHRoZSB3YXksIG9yIGl0IGlzIHN1cHBvc2VkIHRvIGJlIHVzZWQs
IGFuZCB0aGVuIGl0IA0Kc2hvdWxkIHJlYWxseSBiZSBpbXBsZW1lbnRlZC4NCg0KQnkgdGhlIHdh
eSwgdGhlIGNvbW1lbnQgc2hvdWxkIGFsc28gYmUgdXBkYXRlZC4gYmVjYXVzZSBpdCBpcyBtb3Jl
IHRoYW4gDQpkZXZtYXAgbm93Lg0KDQpIb3dldmVyLCBhcyBwdWRfcGZuKCkgaXMgc3RhcnRpbmcg
dG8gZ2V0IHJlYWxseSB1c2VkIG5vdywgbWF5YmUgaXQgaXMgDQp0aW1lIHRvIGltcGxlbWVudCBp
dCBmb3IgcmVhbCwgaXNuJ3QgaXQgPw0KDQpPciB0aGUgb3RoZXIgc29sdXRpb24gaXMgdG8gZ2V0
IHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZSgpIHJldHVybiBhbHdheXMgDQpmYWxzZS4NCg0KQ2hy
aXN0b3BoZQ==
