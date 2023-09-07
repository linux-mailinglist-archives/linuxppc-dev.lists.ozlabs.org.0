Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B600C79730E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 16:26:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QDJNb8tN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhM4b3pZkz3cPJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 00:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QDJNb8tN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhM3g6vSkz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 00:25:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK6sc3p9LJiiOuyfCkna4so0oO9uVQGILz/GS0CndUZSykM2Aqs8MYimzY62dhKZftHZEzYhXSNqGzFGCvg6/hl2dYyZRWFa3+/OBbD9oWyAowd4jjw4+wTlTstcwAAkkK/X4WuTlzqYOWMGZC5ZMRtrrgnr7q7VrbIjaM7RK+OzZPg+9PJNOP8+rPb6v6vupXqC9+JVYUxRdwUWWMD850CqpeiruXzcfTDRHylcVLP/7cZni9I8Au/v/vhl7T07qoNyD/JB7C2ggU9MLy/kyQ4KDHN5LIqi06AmOFk6dudkjxaDI8idzGAhSuQbyPBuxf0PIpGYgFe9mD51ep0pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/zzgJZFs/jeW9b6Xr/ih99GwauBXE1CE39tY7f3k2o=;
 b=ZGjJxLAV6Oeaq28V5E0yNz4h6v6APP4mKYT95n/v21AbQbUG/YnzE19D04l5Icio+Hm9zmSZO8kiZfzCy0ZZTU3o4dKoux/w7HqD2sIp4U5dYKJJUVAgW47vkSELiiWQZrL5FFuTewr2+K51JZ99LOu3l0XUgkBr/JHbshC3rhekQsLki9RPdkAGuNH5ieN8/N1dk1uIpJS+9LqPH3GtdkqO2JYOU0KZSGX6i3Tcvq7d0GqUf+6Lw7YktAxxzS7/4AtsMGT0+Pf1MwxrJvFm/xp4QjWD89NpPw/bLwokTaBT8SUmR0r9wBBi1GZriDZiiwBaoV5iA5PO82IZtaP34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/zzgJZFs/jeW9b6Xr/ih99GwauBXE1CE39tY7f3k2o=;
 b=QDJNb8tNJUwkEIqaW6AV0nFJR42xv8EATjr4xcEbGMB02sj92OOXH9MVAVmnyYvq8p4pdYEvti8ZaDtnPD6EZddAxds5gAz9V0MXgQKI57p5SeTualAuIeD9fv/r/ZuKlP69O26Q5Mi7fmNn/y2pFC/ZuhD/YpU+FuUay+PDyf69/624rY3NXrVMwhTE/i0QcQdYh7fq7HIqXWb30EDUaw9XkRaBSLV6rLEazvl2A3YVuzbzEV87mqw0qr3H0W5scvZGXRMoJ2+ZpM00+YmdLD3y+VhJlI0lq+1KwujIroEtYKZF5gHNOXmtwbT6HXeWnKMWU2GVxdOi4n2JNok6NQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3416.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 14:25:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 14:25:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/2] m68k/powerpc: Kill references to non-existent
 README.legal
Thread-Topic: [PATCH 0/2] m68k/powerpc: Kill references to non-existent
 README.legal
Thread-Index: AQHZ4ZabH0ICy1EpLkec16hhAiQeN7APax8A
Date: Thu, 7 Sep 2023 14:25:29 +0000
Message-ID: <5c80dc63-e7d0-5d82-de83-7e35c54b8351@csgroup.eu>
References: <cover.1694095086.git.geert@linux-m68k.org>
In-Reply-To: <cover.1694095086.git.geert@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3416:EE_
x-ms-office365-filtering-correlation-id: 87d1711e-ce1b-4e2e-2976-08dbafae4957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8uuq0kNS7q2HGodt1jLJUIDiAfadDEVf8Z8EJjSqeTQ4gN6Xqz3kUkUDXFpHiJoiAbTGl9t9qdCfPBhV3gS6U6yQc6+m8/FOQoaykJOoDqTBg/fmXBG2qgjZnA/z/QUvUsrzU9cUio2dD5ZMz+ygh2UtdEowl0G6IoJ7zD+KsyzMQMEOyKg3yGqPv7Qn6AzsuOwdhQ2G2aC1xBOj8P55ZBJvO6Mm6u5VYmbe+OGIyVxKx6MN1zv54awC/cZwjmYy1UxkMDd3CpgV1UHLjQ48B0liJTWrxKs4U6B5l8PkBEr/nsOJ1d9ikAeeslLk1GCu0W6+lTOWDmHCX+CuF167u14mqIgEWN2dEeSfZsVhHhYglKaAujfqiLmAw/38IX80zAMzE9gnCrNxwTVzzT66PEbCXRMRqId8nw8PaXOsq5FXOvIvGVgvMQtgt+x7wAk21z7jNPJTlUUJEAHaSJMyKFqZfvi01IdjhPhSuzfxoberZs0Y5aw53PJEVG+VLrKm252BJEh3MT0PsKkmBCKSvp6R9CH+Ru0UskEX4e0c5DFx2eBpCR1oImn2ifKqK2u9tCa+Fk5XdMNpsaLWMJUK7clRoIkKqC/kdSq4HQ3HQaBXS9C0dp9pFy6N/+sQwBdXXMTbc383ThNZCU5V6S2RvVYbqxo4zX9PElpfF+t27jg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(186009)(1800799009)(451199024)(36756003)(38070700005)(38100700002)(31696002)(86362001)(31686004)(966005)(478600001)(26005)(5660300002)(71200400001)(6506007)(91956017)(110136005)(66556008)(66476007)(316002)(76116006)(6486002)(66946007)(66446008)(54906003)(64756008)(44832011)(41300700001)(6512007)(8936002)(4326008)(8676002)(2616005)(66574015)(2906002)(122000001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bDlpSjlxRlpQMG1WaFZSd1pSeStJNGErQ2QyZlRXSUwyTlVydFoyY3JsaXVy?=
 =?utf-8?B?ZTdscG14bzVuS3pObEtMdGN6WjA5Smk4Y29FRng2cFVaMjFEb0hYTkZnckFl?=
 =?utf-8?B?WUJPdnZXaENqc0RBclV5YkQrM0dsMkdyVkhKdzdSbE0vZTNRaDRlSFF0RWFL?=
 =?utf-8?B?c0NLNVlhbFJoVVhDb2VMSTlubHMxL21MSDlpMzY4dzZXVVdBeTRveCt6QnNM?=
 =?utf-8?B?ZGRiaUhGTmRqeUNtdHVTb2dYeFZwUG9WSGFpNWhOTVVOdGpWTCt5QWtNeUhP?=
 =?utf-8?B?TE40blFBZXNGMUJ4dmp3MitFWFd4enBIWlljaU85ZDJMdnBPK1h0RHFtc1Fn?=
 =?utf-8?B?TFIvakxSUzVCajVaMDdSR04zNk8zQ3lVSk9oc2RRdDFTVmJEMVp4Rmx0RGpZ?=
 =?utf-8?B?QUcrdWFJdVN1dUJGVjdqK1lHL1ljWVltelFLcXA5Ri9qRGUvanRJMEdIYUhp?=
 =?utf-8?B?RHpIQWV6VThFZndaKzNuWGMzbG5xQklQMkRBeVZpRWY5Q21xeVNuNmJmcENx?=
 =?utf-8?B?Zis5Y2lsZWZZejVON3JKdFFaNE1JdkNEV2xEQzhyVWZPa2xYeWUxNUxuaTNm?=
 =?utf-8?B?TmJNaFhDWWgxMEIrUWplTm5aNmROM0hucHdDcXZXalIvUlkrNzNoUzdZdWhT?=
 =?utf-8?B?K3F6c3BMOTBGQlVZQUxCRklnNkRzTm1TOUxKaEdJRXRBMnUxTVBFNXhabTZr?=
 =?utf-8?B?M2I2R21SblgzTFd1YWpjaDBxNlJBWkpmMFZCajliSVBMTEpqNDJWb1hzdHhH?=
 =?utf-8?B?a0F0MktIMU1yeEowNzZBTEprVGxmZHM4WjVtRDNYbXlMbG1xdjM1RWxIQ096?=
 =?utf-8?B?UWRIN0ZHRGVTbXdzSUxLRk9SVHZOd0Q1eXp6MlpCQ0xmekFKMkdSaFpHZGZT?=
 =?utf-8?B?SEdGSk5oTmhKWU83YmlNeXlCNkp5M0tjb04zYVNnaGk3U1FLYVJlRDdJMzVU?=
 =?utf-8?B?dEJOa1F4dW11QmhBeDJOUHNIZGtHckdRU2RkYmx6SGRyeGRFc0s1U0tnK2da?=
 =?utf-8?B?REt4STBvTkY0RzRTMFgvTDBtSG81akxBdDkrOHErQkVRUXJ6WTJnMWJQYjhU?=
 =?utf-8?B?V1EwY2svdlhzbUIvZVBFNUFmMHBpb3ZZNHFpS25VOTkveDRNUXdBUTFxcGht?=
 =?utf-8?B?ZDF0bFlnaEFtYzNxN3pad0hQZVAxNUtmVXg4bkhoUWZ3bkJtd1VFT1N3TmZp?=
 =?utf-8?B?bTR6bHJmYjhPSVZac0d1cXlrN21WQSt6QUlGMGwvY2svZmovL3JEMmNENUsr?=
 =?utf-8?B?aTlmM0lOeWwzYXpXRUw3REdBclFuWG5KRzhYSUJyS1pxUDYzMHAyM3B4SEhz?=
 =?utf-8?B?aHZJd1c2enVFV0tHSW9sa29jVVVaYWpzYWF2dW9UTU9mK3dXRHRIZHYvMGRs?=
 =?utf-8?B?L0Mva2lISGZpNkxLYTNGdi9yT0prYUF4djRBWkpxMjh5M1JxYyt2NXpKMlhh?=
 =?utf-8?B?K2VVMVQraUFjSm4yUmh2VnJxYWgyWVZJdWpvdGY3b3BVbkdqYjAxR2prZ2JH?=
 =?utf-8?B?VUxvNGVqU1lVb3FpSi93dEZBRXRnQm1HSlE4OTMydEp1MjJLM2xhVEhQNCsv?=
 =?utf-8?B?b0F1dHJBSmtNOEZuREZhbmMraE9tWUNCNGg3MmVTT3ZnUWk1djVtR3UzYzNp?=
 =?utf-8?B?bThCaDVJRG9HTFFnTGY4bCs3aTQ0U002bm42cUpxcmcyV3Z6ZFJZVWtQWk83?=
 =?utf-8?B?amxOOHhFaVlHR2lPZHo1S212dzIwUjdiL0RtQjVFQ3pJMjB4TG9GdkV6K1Jr?=
 =?utf-8?B?YXE0OGNwenBuWnhNdk5XL1Arbzcxc2V0RkFmYjllSUFEbE1PWGcrUE1yMlQr?=
 =?utf-8?B?YWNLdllEczBnYkRJVk9PelVDRkxaQUhXcElrcy9WeW1PT2lTbzFvQituWjc3?=
 =?utf-8?B?ZytFaSt5WVduczBOSVJ3bEpJaTJoOHUwQUE0VXRzdE1tVklQT1JOQ0trQ0VH?=
 =?utf-8?B?T1B6WTRUOHlYdnk2QWNKRHBUZlhLNERULzZRZzh5WWlxbzZ5SVcvZGp3Vlgz?=
 =?utf-8?B?d0FqZSs3NElFR0tLUktnNmhmMFArZWVTWjcvQTlUbGVsZlY1TC9uaFkvRUN1?=
 =?utf-8?B?R1RJZGp5WWlaYWQ5WW1EWUtzZnh6K1Y4N3NHQ2VzTWs0cTVkcGNtSXNtdThF?=
 =?utf-8?Q?0wqaAuArn2mlHaGBB6pXnKiD2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5C4F7D3AB5AEE4FB0A806BEE366B0D2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d1711e-ce1b-4e2e-2976-08dbafae4957
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 14:25:29.2495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7si67qHKmhnL46P6sDR9Zje8tNqFyPck1knNU3DCQpv2cWxuL8UWjr+j0gbG1tsdo6Gcf199suSxEKwTkVTJ/6tOQqMlok7vP61jXxNDsxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3416
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA5LzIwMjMgw6AgMTY6MjEsIEdlZXJ0IFV5dHRlcmhvZXZlbiBhIMOpY3JpdMKg
Og0KPiAJSGkgYWxsLA0KPiANCj4gU2V2ZXJhbCBzb3VyY2UgZmlsZXMgY29udGFpbiBsaWNlbnNl
IGJvaWxlcnBsYXRlIHRoYXQgcmVmZXJzIHRvIHRoZSBmaWxlDQo+ICJSRUFETUUubGVnYWwiLCB3
aGljaCBuZXZlciBleGlzdGVkIGluIHVwc3RyZWFtIExpbnV4LiAgVGhpcyBpcyBhIHJlbGljDQo+
IGZyb20gdGhlIGVhcmx5IHBvcnQgb2YgTGludXggdG8gdGhlIG02OGsgcHJvY2Vzc29yIGZhbWls
eSwgYmVmb3JlIGl0IHdhcw0KPiBtZXJnZWQgaW4gdjEuMy45NC4gIExhdGVyLCBjb3BpZXMgb2Yg
dGhpcyBib2lsZXJwbGF0ZSBlbmRlZCB1cCBpbiB0aGUNCj4gUG93ZXJQQyBwb3J0Lg0KPiANCj4g
VGhlICJSRUFETUUubGVnYWwiIGZpbGUgKGZyb20gZS5nLiBbMV0pIHJlYWQ6DQo+IA0KPiAtLS04
PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+IExlZ2FsIGluZm9ybWF0aW9uIGFib3V0IHRoZSBMaW51eC82OGsgc29mdHdh
cmUgcGFja2FnZQ0KPiANCj4gQWxsIGZpbGVzIGNvbnRhaW5lZCBpbiB0aGlzIGFyY2hpdmUgYXJl
IGNvcHlyaWdodGVkIGJ5IG9uZSBvciBtb3JlDQo+IHBlcnNvbi4gIFRoZXkgYXJlIG5vdCBpbiB0
aGUgcHVibGljIGRvbWFpbi4NCj4gDQo+IE1vc3Qgb2YgdGhlIGZpbGVzIGFyZSBjb3B5cmlnaHRl
ZCBieSBMaW51cyBUb3J2YWxkcywgdGhlIG9yaWdpbmFsDQo+IHdyaXRlciBvZiBMaW51eCBmb3Ig
SUJNIFBDIGNsb25lIHN5c3RlbXMuICBTb21lIHBhcnRzIGFyZSBjb3B5cmlnaHRlZA0KPiBieSBv
dGhlciBJQk0gUEMgbGludXggZGV2ZWxvcGVycy4gIE90aGVyIHBhcnRzIGFyZSBjb3B5cmlnaHRl
ZCBieQ0KPiBMaW51eC82OGsgZGV2ZWxvcGVycy4NCj4gDQo+IFRoaXMgcGFja2FnZSBpcyBzdWJq
ZWN0IHRvIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwNCj4gUHVi
bGljIExpY2Vuc2UuICBBIGNvcHkgb2YgdGhpcyBsaWNlbnNlIG1heSBiZSBmb3VuZCBpbiB0aGUg
ZmlsZSBuYW1lZA0KPiAiQ09QWUlORyIgd2hpY2ggc2hvdWxkIGJlIGluIHRoZSBzYW1lIGRpcmVj
dG9yeSBhcyB0aGlzIGZpbGUuICBJZiB0aGUNCj4gZmlsZSBoYXMgYmVlbiBvbWl0dGVkLCB5b3Ug
bWF5IG9idGFpbiBpdCBieSB3cml0aW5nIHRvIHRoZSBGcmVlDQo+IFNvZnR3YXJlIEZvdW5kYXRp
b24sIEluYy4sIDY3NSBNYXNzIEF2ZSwgQ2FtYnJpZGdlLCBNQSAwMjEzOSwgVVNBLg0KPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLT44LS0tDQo+IA0KPiBOb3RlIHRoYXQgdGhlICJDT1BZSU5HIiBmaWxlIGF0IHRoYXQgdGlt
ZSBjb3JyZXNwb25kZWQgdG8gdGhlIHZlcnNpb24NCj4gZnJvbSB1cHN0cmVhbSBMaW51eCB2MC45
OS4xMSB1bnRpbCB2Mi4xLjEwNCwgYW5kIHRodXMgcHJlZGF0ZWQgdGhlDQo+IGFkZGl0aW9uIG9m
IHRoZSAib25seSB2YWxpZCBHUEwgdmVyc2lvbiBpcyB2MiIgY2xhdXNlIGluIHYyLjQuMC10ZXN0
OC4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGdldHMgcmlkIG9mIHRoZSByZWZlcmVuY2VzIHRv
IFJFQURNRS5sZWdhbCBieQ0KPiByZXBsYWNpbmcgdGhlIGJvaWxlcnBsYXRlIHdpdGggU1BEWCBs
aWNlbnNlIGlkZW50aWZpZXJzLg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQpB
cyBmYXIgYXMgSSBrbm93IHRoaXMga2luZCBvZiBwYXRjaCBoYXMgdG8gYmUgY29waWVkIHRvIA0K
bGludXgtc3BkeEB2Z2VyLmtlcm5lbC5vcmcNCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBbMV0gaHR0
cHM6Ly93d3cuaWJpYmxpby5vcmcvcHViL2hpc3RvcmljLWxpbnV4L2Z0cC1hcmNoaXZlcy90c3gt
MTEubWl0LmVkdS9PY3QtMDctMTk5Ni82ODB4MC92MC45L2xpbnV4LTAuOS50YXIuZ3oNCj4gDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAoMik6DQo+ICAgIG02OGs6IFJlcGxhY2UgR1BMIDIuMCsgUkVB
RE1FLmxlZ2FsIGJvaWxlcnBsYXRlIGJ5IFNQRFgNCj4gICAgcG93ZXJwYzogUmVwbGFjZSBHUEwg
Mi4wKyBSRUFETUUubGVnYWwgYm9pbGVycGxhdGUgYnkgU1BEWA0KPiANCj4gICBhcmNoL202OGsv
NjgwMDAvZW50cnkuUyAgICAgICAgICAgICB8IDcgKystLS0tLQ0KPiAgIGFyY2gvbTY4ay9idm1l
NjAwMC9jb25maWcuYyAgICAgICAgIHwgNSArLS0tLQ0KPiAgIGFyY2gvbTY4ay9jb2xkZmlyZS9l
bnRyeS5TICAgICAgICAgIHwgNyArKy0tLS0tDQo+ICAgYXJjaC9tNjhrL2lmcHNwMDYwL01ha2Vm
aWxlICAgICAgICAgfCA2ICsrLS0tLQ0KPiAgIGFyY2gvbTY4ay9rZXJuZWwvZW50cnkuUyAgICAg
ICAgICAgIHwgNyArKy0tLS0tDQo+ICAgYXJjaC9tNjhrL2tlcm5lbC9oZWFkLlMgICAgICAgICAg
ICAgfCA4ICsrLS0tLS0tDQo+ICAgYXJjaC9tNjhrL212bWUxNDcvY29uZmlnLmMgICAgICAgICAg
fCA1ICstLS0tDQo+ICAgYXJjaC9tNjhrL212bWUxNngvY29uZmlnLmMgICAgICAgICAgfCA1ICst
LS0tDQo+ICAgYXJjaC9tNjhrL3E0MC9jb25maWcuYyAgICAgICAgICAgICAgfCA1ICstLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wdHJhY2UvcHRyYWNlLmMgfCA1ICstLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9zaWduYWwuYyAgICAgICAgfCA1ICstLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL2tlcm5lbC9zaWduYWwuaCAgICAgICAgfCA3ICsrLS0tLS0NCj4gICAxMiBmaWxlcyBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkNCj4gDQo=
