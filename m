Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4009A662D08
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 18:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrLql0yvVz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 04:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=B/Ud+R2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.83; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=B/Ud+R2A;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2083.outbound.protection.outlook.com [40.107.12.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrLpm3qB4z3bbd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 04:41:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqj12qo0tpIfABOW9kHy1FuqUwfo9yD7OXffnPL18pBsOzvc1ciARsTaukAWc1OQTpAKV4lCwYqIDVp8aZhyC8GOsyFi7adwHlskQURc30tq1nE9DMBTsKj275H5MHWBz07idTOLq9ZgJxS4xl1OODDG4vKaUiPeOe2kZEPDCfpQLCrLtd82BKHuAbChxGYitCtc6vCb3PaFbtNvo9abVcKnL0XV5CKQW/6JZnqjNGzOPtTUyygtMQzzcFiEH5Ldylhvs9FKOo60TormIivrs4z6T6/Oa/q/LpDvFA4RLqZBlEdnoULcQ8aTZhrkz00or/zuHjcDx/McgkH79bymFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lTJDW5c6HwbbnVFAtdZq/w2r7LyKNNSgAQI/b8voxk=;
 b=FjDItidB/CbxXr7MZSqbcvVsTtYIplt299+xCSHG8AY/qyG15o87ArH6+NF8GdHIFrHA56uPtajhBh2EmVheSeTHfGl2G8kohce7MxCY67QoZRD11fEK7jIh9cA5cnpUGfEURXjnRr8zlskEZAzplRIT4tn4rVX6mUQk1qWn4CXZlAc0ihvWvs6cAKsd5WsZbqyrwWBcVEcKBUasBE//SjjEfd3gNezOvgrjAZ9zGhKZcBruLdXGiDHSNz+7hPhzv2v0ue5H9rx1NY+wPTamsbVW0UmnubB8RNhgTM6JVgrkWBdn3S6DS5IiRNhHcc3SMHZk7luAPcJWRgN/Yy0yvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lTJDW5c6HwbbnVFAtdZq/w2r7LyKNNSgAQI/b8voxk=;
 b=B/Ud+R2AHtft4cEQrTGg1nAT6nMAnaD5conM4q+uFZILTGklT+/ruAegnusO5eHoFFDM6CDY/thOVbUHCGQu4ytJwtVbQML87LMOTpfT0rL/nnI63CSFT1xWEJJJEO0mhTwSatJZKYG2Jo9WmEnm+C7GC4dKfkukC9CFYsT1NjPaXwUqrZAUN/ejyjUw1Xzk2+7yLAdZbrXscjOGSvPLgDkQTj7VtRAcQctl/3wWMkcVSOa3faw+o8MRDQTwDqX158GQPPUKLaGGC1JY648gsURrExtpBjJ2M4T/tdqFr2OAh+wAaN6vGIn1gJQ7rxSRDQDsEfpQOZNvr9rKk8CJyw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2156.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 17:41:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 17:41:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
Thread-Topic: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
Thread-Index: AQHZH5xSiGvUukY/6EynXZxGkihbMq6WY+mA
Date: Mon, 9 Jan 2023 17:41:14 +0000
Message-ID: <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
In-Reply-To:  <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2156:EE_
x-ms-office365-filtering-correlation-id: be8d865c-8968-4495-e876-08daf268b499
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Fqq5zShIAKuKSbTRUGAbb6ghT2nRl4IS/G4ym3Plv2dtFRG99hOAMShAFvyIuqh4M5jY5HflnZr4T1VRQPwk1iIXX1VnjXHdXAWGYGvcdOINfQoq6PqplSESh7LcncdTe5XTA0242bTOPKGI0gLKMD21amewf+Gl6WJU1sWLVejb405J1nYTRSh8Mdyvp8neBtV8efLR/jY2bzQlfAd/Q+mdzrx7r/BHKtoIo/uEr3CELcQGzyjSuIsVvZAdqQASI0Q/xE8K2fD6gI7XFfHNv7H1ddRa9JM9gdZwgA4T4PHYLhBAuJl3NK7UPx0dJuYTZ9vm3gKW2ZmUM8xXn4v2wJP2brnUj5Zgc2ZmRoEEXwdWzwr5yXQ4CWeJ2I2ZEoVe0FWjir09NNTumFGPToGFMh1Nqu8uC00ysvrRyijXv8um4pDbOOS5F4hHV/5BBCDLD6uZOYy5n7L0vcAKkYKACasveblM6+gks/aSFP4CNw/rUPxtTnmWHEtOirBDRpr0WHvMPCXkcOW87Wf0DnXvpCmM7zPLhcGODXC9RYTsTKYgTBzYIsvvah+Gqur7gBHFWHi7+zwdsFZ4qXnUb8sCYmOS5LfXvbOIV9aRg6/3W8tY6NbugNcuECDMChRb80ZIAp0LLB63f3QQCkrJT/TzQ0mvqGUuFkHAihI4qVMq3gkjk1AFLAXNPAY9b4rbCw5UXi8tawoOytSqcJzNCd3XhN+tg/Bm/SWjB5X95hAk3cjHC3aWuRJvdJ0L8JTt2dNcHudg0GefZtfRdmbvp31csA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(36756003)(2906002)(8936002)(5660300002)(41300700001)(44832011)(83380400001)(66574015)(122000001)(31696002)(110136005)(66946007)(71200400001)(91956017)(31686004)(86362001)(38070700005)(66556008)(76116006)(6506007)(186003)(38100700002)(6486002)(26005)(66446008)(66476007)(4326008)(8676002)(316002)(64756008)(2616005)(478600001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QjV5UW9NYU9IWkNra01wTVBoZFJJTjFVOFFhbzRDU1dwYjdiU2MyU3g3d0xL?=
 =?utf-8?B?UkdYUTFxWUFHb21RQ3NVZGxpY3ZVUHFWUmlzTVBjU1lhci9aditoVjh6aXdR?=
 =?utf-8?B?dXJzZkhnMGFiZEhFalhUUWdodlRuaTZnY2gycE1kUlBEb2J2cUdRNXBYMyto?=
 =?utf-8?B?QTM5TyszTExEL1Q3aXh5WlhEY3pNcWsxQ1F5L0FRcFRPbGhER09HcThrSlFT?=
 =?utf-8?B?dEhxOFNaK3JlaXVzc0xLQ21sMVNHbG5zVitqaFhZWTA2U2lqSDhUWG5ZNmU0?=
 =?utf-8?B?akhYTUVFV0lPb2VkdDNYWXRmUk1tcVFRTzhyRlBia3lzS3pPSncySDFKS1Nu?=
 =?utf-8?B?UFJoc2NoTTJpa1JqSTVBeUpvK2ZNdkZvb1dCL3FobGwrb1NVbVN2d0J1NjBY?=
 =?utf-8?B?R0VYTWY1bnZaNTYxVmdJamRiS2VBNFlZWmZ2YnNCcGsvaktjaFpGekFYVDNL?=
 =?utf-8?B?dm5LdkFIRGI4VWVtOExNKzBaZE9CU3p1T2hqaDFxVDROMEkwU2dRVnBKMVRu?=
 =?utf-8?B?cmwvNFRTZTFsaTg0ZURIZ3hrV0M4MFhBN2dHWThYY3pQc1RNMXFDL01oaTFs?=
 =?utf-8?B?U3g4OGtGRWVhOGt0aXVlS1F2dkYwditUZUgrWlhoZy9YSmRYRDU3cmRvYUFX?=
 =?utf-8?B?OHduS1VZQU1XbW5HTTZudk9SdFR4cmN3QTRpYVhDMEZ4S0dIWDRldWtuTTZQ?=
 =?utf-8?B?UlZ2NEgyZUxET012bmhXU01meGpFV2FYbkVzM0Izdk12bE9MT1l5SzF2N2xs?=
 =?utf-8?B?UFd2SXorK29Hb1ZXSUdzYWM0NkIwNGZraUkrNmVHVjlvaHdPbG03SVRRQUdo?=
 =?utf-8?B?V2pxY3EvdXZoN3dBNGVMall2UDJhZDNpaVRheG11UmlMTCtMZjlmR3djZDZI?=
 =?utf-8?B?YnFPb3k0Y2orWWpvaUpxMFV1K0d1eDJIWWVCZDA0SDFrU1BoQ1NneGFmVjhr?=
 =?utf-8?B?eXhsZXZKWUQ2K3FrSDFHek1odmg3TDFxZEVxZE9vTG8zZnJzWlhkWWlOa1dL?=
 =?utf-8?B?QVJUejNRQ2xOWXNyUWs4VlZzMDNWQ0Rzb0dKbmJiY2ljZEY4cjE4ZUxSZWNz?=
 =?utf-8?B?VjZTVFBHbGdKb0lOL0Z1Q2RvUWhrYnVQS0xzc1ZON1ZDdDZBcVhxOWdIaVdJ?=
 =?utf-8?B?QTBjU0Jua21HRnN0amh0T3lCbmxDZzJkTzRkRkJJaEh1SkpwN1JXZ3R2MS8z?=
 =?utf-8?B?TzdSRE9YSHFYRHZvdE9PRis5YXFlbUxvZjZYM2tRNmxiSjBnMHMrcnBvZzkz?=
 =?utf-8?B?dnl6bmVqNmdMM0V3U05IendVTzljT3NmZ2pwM0RCL3FhWVlwcVB5ZTBzL1dJ?=
 =?utf-8?B?NkhPWmhJeWoyMU8zQURlUzVpR0pHaDcrN053VTd1SUJUUHFsemZTdUpiRVRn?=
 =?utf-8?B?d2RMamVWTDVmemtIN2huK3pPaE1tOHhpM2tRUEhHaks4WER3eFQ5RWFLa1R0?=
 =?utf-8?B?Ylhrb2YrdXNKeWhBUW04dDhnb0dPNDNnZWRiYUJKcUt4bFd5WFBSUmpYa2ZM?=
 =?utf-8?B?Sk9uS3kzN0o4K0c2QW05azFlMW1vNzJ3QW1VOEtMRklad29Ld2o4VEphNERK?=
 =?utf-8?B?eDZIWG5udVZiVE5NTGlKVmhjbWVPMDJlbUpYUWpGa21zRldxS1RlUUJPOThO?=
 =?utf-8?B?Z3hiTFFhNWRwUysweTJmdmF5S3pzdVRnNVV5M0FERUM1S2kwL2tqT1lqM2lz?=
 =?utf-8?B?amVVTDd2WldnNDZJK2Y2b0ZscUswemJUY1dRRjladHcvUGtuRlorYlVxSE5w?=
 =?utf-8?B?Z2Jyc2NoY0xGSFRqazkrY0RNenlEVi9jOFpnNVBYNkZIUmk3UlFYQ1BwSURH?=
 =?utf-8?B?UmtQanlSUndIVWRiVzhJdmJPMnAyUGl5c2tWeHNuRUFUQWZ0TXMvZVUvaHVl?=
 =?utf-8?B?RU91RmdtMFBZL1NTTFptMEZ5SXo5eUhOZENocXpCMlY2MXpPam16SFBjVERU?=
 =?utf-8?B?SGZUWGxnb0tMMjBjRkpjT1A2MFlXZFoxYU1veXloa3l4czNnOUNPWDc5TXVl?=
 =?utf-8?B?cEIxUlp3OTF1T3R3a04xZCtGS1VLazZyeVN3VmxMUkpLMWEvYndHdm1Yd2pW?=
 =?utf-8?B?UWpDZkxZM3BRKzRwS1V4eEQvWXRKMEI3RE0za2p0WkxaUEdYNDZjalEwek56?=
 =?utf-8?B?WktpbFZXd1BxRjhWZXVGYTJYZFk0L1puNmxMVUZsOVJrWlRrV21lS0s1WVRI?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FCFCAF8E65407438A3EBB647D7138CE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be8d865c-8968-4495-e876-08daf268b499
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 17:41:14.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bkr+K8gHfwX7vQXnpv+Y834h3PkqN8Q1VnSUEBhNZKmOA1uq2Mv7o37z52H9NUw6rqk05qoKEeMKufTQ4RmZ9VobUHU9Qr9y5qLsYlR1e2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2156
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

DQoNCkxlIDAzLzAxLzIwMjMgw6AgMTg6NTEsIEdlb2ZmIExldmFuZCBhIMOpY3JpdMKgOg0KPiBD
b21taXQgZmRhY2FlOGE4NDAyNDQ3NGFmZmYyMzRiZGQxZGJlMTlhZDU5N2ExMCAocG93ZXJwYzog
QWN0aXZhdGUNCj4gQ09ORklHX1NUUklDVF9LRVJORUxfUldYIGJ5IGRlZmF1bHQpIGNhdXNlcyBw
czNfaHB0ZV91cGRhdGVib2x0ZWRwcCgpDQo+IHRvIGJlIGNhbGxlZC4gIENoYW5nZSB0aGUgcGFu
aWMgc3RhdG1lbnQgaW4gcHMzX2hwdGVfdXBkYXRlYm9sdGVkcHAoKQ0KPiB0byBhIHByX2luZm8g
c3RhdGVtZW50IHNvIHRoYXQgYm9vdHVwIGNhbiBjb250aW51ZS4NCg0KQnV0IGlmIEkgdW5kZXJz
dGFuZCBjb3JyZWN0bHksIGl0IG1lYW5zIHRoYXQgQ09ORklHX1NUUklDVF9LRVJORUxfUldYIA0K
d29uJ3Qgd29yayB0aGVuLg0KDQpTbywgc2hvdWxkbid0IHdlIGtlZXAgdGhlIHBhbmljIGFuZCBm
b3JiaWQgQ09ORklHX1NUUklDVF9LRVJORUxfUldYIG9uIFBTMyA/DQoNCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogR2VvZmYgTGV2YW5kIDxnZW9mZkBpbmZyYWRlYWQub3JnPg0KPiAtLS0NCj4gICBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9odGFiLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wczMvaHRhYi5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
czMvaHRhYi5jDQo+IGluZGV4IGMyN2U2Y2Y4NTI3Mi4uOWRlNjJiZDUyNjUwIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9odGFiLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9wczMvaHRhYi5jDQo+IEBAIC0xNDYsNyArMTQ2LDcgQEAgc3RhdGljIGxv
bmcgcHMzX2hwdGVfdXBkYXRlcHAodW5zaWduZWQgbG9uZyBzbG90LCB1bnNpZ25lZCBsb25nIG5l
d3BwLA0KPiAgIHN0YXRpYyB2b2lkIHBzM19ocHRlX3VwZGF0ZWJvbHRlZHBwKHVuc2lnbmVkIGxv
bmcgbmV3cHAsIHVuc2lnbmVkIGxvbmcgZWEsDQo+ICAgCWludCBwc2l6ZSwgaW50IHNzaXplKQ0K
PiAgIHsNCj4gLQlwYW5pYygicHMzX2hwdGVfdXBkYXRlYm9sdGVkcHAoKSBub3QgaW1wbGVtZW50
ZWQiKTsNCj4gKwlwcl9pbmZvKCJwczNfaHB0ZV91cGRhdGVib2x0ZWRwcCgpIG5vdCBpbXBsZW1l
bnRlZCIpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBwczNfaHB0ZV9pbnZhbGlkYXRl
KHVuc2lnbmVkIGxvbmcgc2xvdCwgdW5zaWduZWQgbG9uZyB2cG4sDQo=
