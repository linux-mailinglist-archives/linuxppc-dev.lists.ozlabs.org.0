Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7975E7EF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYxSK6V43z3cjL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 01:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z/yto6iv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=z/yto6iv;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYxRc0xgZz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 01:49:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjqYjnXMZjdJhRmC+TqCGOSHOHfCTruF38EYvC88u1p1cUsb4dOUOEVLybeL2zizWiRSmqf+lWxq+L96WeeYmjvnvnW9zohqGspLlpcJTVHaeBBOsPX97tcepBYnkRR0sYHYJ1JK0rqkVCJ/vutGV97tsEVjfjWHVUj8WnWH4ESUAP2bavUycYTUnYruxcRfsCeK7LvIJ9yyJ/Do3B0v7ED6hriyHzD0pSwHxoBIu6mSNLMZGW/p9kQItWkoKu2zfOocWOIi8sUksGWS68gGheRD/eb3jlX+OcvBYGr0SAs84QZddrs3KcHHDfYeQDcD/bh7xbBXzANHoBFlkmJqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hxtMvJ6XI63uvWXHFDHBeDUNY0vdXbRlI+pcv+oh70=;
 b=CyFXBKJJ8v16F+44+CE39D5D5ddjLcEfQIIJVZbshRtm/EHOfyhQzbCbFkG1SAmZ6Q/10Bh3ZOQynlAx0e2nOdj1dOfJeTjCuS7elyQGRLXmahRZAl/7RGV60ZJkb+RIQ9O/6LHj2iaPz9hUwHBwVOklhY703k4tl6BF7qumXS/47ZkHxkGfkrr8Q4lNRtUo67AlpprdijR85Oeu9kvyIb3O42HFz6BmwEDvXS39nTbCWAKZm7y31AfhbmUp5JHA5DYL+aAy+idY3D1XtYDOiNp8pXNdRckwKAOhYTFHroJZlCOo6UTE7M2QbMQgkUXzhhsm54prZdZB8+GgH6QxYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hxtMvJ6XI63uvWXHFDHBeDUNY0vdXbRlI+pcv+oh70=;
 b=z/yto6ivrOFpqI+qVAY6Bp9OvHBiuoqRLYpz0P+ib6yFIc3fcwkPivw3L9UkYjOaYf9kaX89Vly2a7rakv0I0vJu3IJuNF8UCrG8qq8XPd8Qcbvu7ND69MC+q6Nb5fKErhkUDkrWhMsYkgqOyaGzdKPFgEjLM9NF3QP8oHmWBihmjchpP5r6elvDRqJMnp9OUTjq8cdlOXkK3j+qcx7gdiaFYsZfAexQredJhvyxAv6KUNQ0kbxC0qIN0KySswL3VSNlhALrBrj5KbjGIor7TOo9Yfit8W97QNCuCNHaav2EDUV4gqjrXWRii+qy5P9fCcgffRWYTuUDbrqI50jSPA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2410.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14; Fri, 23 Sep 2022 15:49:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 15:49:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc: Don't use extable for WARN
Thread-Topic: [RFC PATCH 1/2] powerpc: Don't use extable for WARN
Thread-Index: AQHYz2MPfdZ9PqHjZUqz9TurXuwQbq3tKViA
Date: Fri, 23 Sep 2022 15:49:27 +0000
Message-ID: <2cd42389-b7aa-8b6e-e935-e732c39916fd@csgroup.eu>
References: <20220923154143.1115645-1-npiggin@gmail.com>
In-Reply-To: <20220923154143.1115645-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2410:EE_
x-ms-office365-filtering-correlation-id: 4ead5f69-d971-4ebe-ba8d-08da9d7b31fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5u/CqCPzMkHGNThw5TTYLjsfw745EU/yPZ3Q49nRNXYNfdvHwmBVM1Dh9O4BjOeEAJTVXpbBynN98LLcYnI1nTr4IvY5qWTKH6p3zQYle6XW8fis6HFpeIEQQ67pw/rf2nJUgOALK1Mp862ItfG/bOGxOGyNWHGefaYCgbG+/CpEaq2hsQXfqtwmPthTzaYrt8Gy6VyWyePVm8NpOK53/p1ddQuUID8ivMLC/b2DHMk/diUl0EDyF9XTKn4AavY/HpRNynM4MwZQLIGQ5EQUTDPuisXEln3ukiSKgOb3vFbTF0a8aV6uVOAnNkR38kGHDmrTrBUvKBS1A2gqBbUuh2/VjfNxMh0WnYBcJZchSo9MYLvk9AC1dYkXAVKgPkcTV9W0jhdqbtL4mYBvtic1uBlfSMkGjB+eyciCoMIJ5nNwR1qC1euBxjq0LxJKcfuU4HvO3jxDjfIjN1YMXtf34Wj5M7XS2XHMf9+2wo4c6qzdu3SxjZ3GroO9vxpgBrut6381N3ivkQ+wmwJqa0j/Sg4s7Sn7/RP8liH5EAJBwZbuFun4YscZPcQ2PO2BnAaoEanlRTjFyv5uYTt7gSbNLVrO5pPrZJ33OK9ykaCzcVVkLxPDPRwY3fTiKXOccPlpOfqLNdfC8Ohz9V6Q2ppY31PHET0pI5kLEd5AD3qsKX2jEs0zx5TEYED5K5cCH9wfn8txyLHMk8jIh1aPxnKTa0+vEVcD/8AYQff5xH8r1uLJ8JytFrlz0ZUL0E/Tq03zNfPRB0Zsz/gJ9UnWfrpBQV0mpxEJbPkWS+pBwiFyP2G829apXlmSPkNgWZC8uzT0TfjN0L1FHtnJgtGX5ZmkUw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(451199015)(31686004)(36756003)(6506007)(41300700001)(186003)(66574015)(2616005)(66556008)(66446008)(76116006)(8676002)(66476007)(2906002)(66946007)(64756008)(6512007)(44832011)(31696002)(4744005)(8936002)(91956017)(86362001)(5660300002)(478600001)(122000001)(38100700002)(6486002)(38070700005)(71200400001)(83380400001)(26005)(316002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UWlTcnk0eHkra3Y1U1dxdng2V0Vvdm01MkdYZVk2eGplQWdYSHBuUWtOT0hp?=
 =?utf-8?B?TFA5V01MQXFEZXZYcTZtaUZVWXhEMlEwWFpYeElqbWxpTHpXdVliY2M2VlhY?=
 =?utf-8?B?Y1k0U3h4M0xUTTFldnMyWHNOUWxKOGx5bTVCakhTTG8vejZ1SlJ4Q0JpSkk3?=
 =?utf-8?B?K1NrdzVJcnhnY3NhSkdDTGoybDh2eWVxQ0tJSHhBbFRlKzNRK2ZLb2Q5c1R5?=
 =?utf-8?B?azRHd2xZR0tnYURzU2xNVytid21TMVlxYytQMkVCRktwbGNBQkgrcU44K3c1?=
 =?utf-8?B?RDQ1Q2R5WUVRYkcwYmM0cnUrZmxtVUpEcTlaTGc1eVFobWs2ZXdRWUNUanhn?=
 =?utf-8?B?NHdia2xkMFJKN1FnSG9OUTgwUFlCYitMU240NHRZQlBGM0JJOHM4Rkg5WlpF?=
 =?utf-8?B?elBJUS84Nzh2dXFXVjV1QldPOFJpUW9lb3I0NXFVM21pZzFZT3p3bm5tTUZ5?=
 =?utf-8?B?UE93aGVJSzlYRFh6UysyVWJaRDJMWVc4dWoxdWVUejU0OXhLNVdnVExCbktl?=
 =?utf-8?B?UVZsQ1B4cmliNVZXLzRlakdhc1UvRVg0eVIzMk9tdFlPb1R3eURmUGNsNEY1?=
 =?utf-8?B?aTV2Z0lFWWgyTmtsL3NxdDA3Q2pzcGkrcXU5SDhOcUhTK0hWWnhhbENiYXFF?=
 =?utf-8?B?REFXL3dwQStLSDViT2czY0hPcndVT0VPRTE0blY3V1NzaHVJOHBnWnd1aFo3?=
 =?utf-8?B?RXN2TkxUN0poMERqTFhGc0JwMHdYRFZKWjZLdVQyS3hUYW9TVVNkTnVoWFlO?=
 =?utf-8?B?WkpCRnZzREJDWVBmNEFkT3ppZkZiSmtZNzBON2tSRWhLbUp5SHFxZU83OVEz?=
 =?utf-8?B?aTBncU1kVVFXS1V4YTgwak5MZWtlUkd0TXZrTEw2aTYzZS9VcDJ5NWRwUmVm?=
 =?utf-8?B?TmQzcHB1VlRqcE9ucThxalZ3SVorZ21FVkRLOGNBcWt5SzJ4dEtDeE9KOFZQ?=
 =?utf-8?B?U01ncHBuQUI0OFRWckdNenZJbVF5T2xoNmtCOU9QU3JUbnFPWWhDNC9YbDQ0?=
 =?utf-8?B?U1lEenRHRG1SSjBtbVlZU0FsaURNV2plcEozZFVZU1hhRGdOU1A4VFFkVkRB?=
 =?utf-8?B?QkNzaENuMFpUR0VFcjJhb2xGZXU0bkRsQkVjcGU2UzdVbXlPdm03QUkrYVZu?=
 =?utf-8?B?V2N4c2dSTkR5d1FtYTY2S01XQjdUVTdMOXk1Y1VFWTRJUFZOK1JwNHhNeUwx?=
 =?utf-8?B?WDhiaEYyTzQ3eEtrdWNHY1NvMUFjblJuQW1jZm5PT3lTdFg0d2hNVGkrdVcr?=
 =?utf-8?B?eEFubmhkQU1wQUhicnkxZmlxZHA2VjJ0eXNvOUE5OUd4UnlmZ3lsbDdzeUJv?=
 =?utf-8?B?T3p4ZjVTMkgzUWN3MXZMUUg4NGkybnZmczZtU1VDVEtiZ0lXME01MUVkZTR2?=
 =?utf-8?B?ZW9Jd1kzdUZVSjBvUjc4UUVKbVd5K1JSaFN3SE9id3FNTklLREwvQnJPck93?=
 =?utf-8?B?emloSXZnRW9aaTNNSy9ad2p2MFc3TnRReE84dlVYd0xJTGFyZDc3RS82MHN3?=
 =?utf-8?B?bEQ0NW4vbHYyZGpVRXJVSE4renB0Z052bmVWOUE5KzhPL29SOHIwZ2s2N09C?=
 =?utf-8?B?cW80MHpYRHluRlpGRm9IMVp0WmY2bWE1MHdIcGxqQzUycjlmNjlFRm5tMFMy?=
 =?utf-8?B?Z2c4Z0RiMFBBWElyZkdDQkZid3U3dVhBdVhVTCtTaU1jbktiQ3doTTFVWUNB?=
 =?utf-8?B?N29jNEpEN3MvbWM2b1NibDgraXhCcklKTTdRSHM2SlpsOUNLdHVKYUtEWjBj?=
 =?utf-8?B?dTEvY3RmU0pYTW5KbWZWQi9sZTlkYlNSdjRoWjRYUFhRdHNscEloMnJlbFlX?=
 =?utf-8?B?bnNFSFNFUWtKN0h5MDJiV3ZHQlRreWZMMy9wQm5id2RPY0dXZTB3K05XZUMv?=
 =?utf-8?B?SUpSUXdlcm1ocmJweEROUjJLOWl4ZCt2WmxMVWk5VVI3ZmNWNEJPdzFENlRY?=
 =?utf-8?B?enJtQnJUOHpjWjZrK3NMdkpCN1F6S0RCQmxIajBVaG9ZbkpEOUk3UjNlblRa?=
 =?utf-8?B?ZWhPdmFhVEd5OU5UYm1hdlp3UDRhQTMxOTcvaEdDajk0eUlmY0dTZVlkOUVY?=
 =?utf-8?B?K3UrRUJFalZwSnpkbHBYR3E4QnF3YVJ4cUxxOGs4WDY1aG1MUHhJaW5NMEZa?=
 =?utf-8?B?dkYyK2pMcER1bUd4RG5nK2ZnQnRLWUZaUjlkaTEvKy93QmpUN0twaUVmZ1Ir?=
 =?utf-8?Q?kpS45Afv05vLRkJagaGsY5Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA1075BB1132B64CAF17A62FE284A95E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ead5f69-d971-4ebe-ba8d-08da9d7b31fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 15:49:27.0931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqJCAfYb+Bnlb/GDq6sdVtEZDgu3TVM8AwCxb0cteBiRPG9KlUchts1ub4wItxYRU+bVLVQuf4J54Icl1NwUOIOgHyrn1Bhc0PAQ78TXr60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2410
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

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMTc6NDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBleHRhYmxlIGlzIHVzZWQgZm9yIGhhbmRsaW5nIHVzZXIgbWVtb3J5IGFjY2VzcyBmYXVsdHMg
ZnJvbSBrZXJuZWwgbW9kZSwNCj4gYXMgc3VjaCBpdCBpcyBhIGZhc3QtaXNoIHBhdGguIFVzaW5n
IGl0IGluIHRoZSB2ZXJ5IHNsb3cgV0FSTiBwYXRoDQo+IGluY3JlYXNlcyB0aGUgbnVtYmVyIG9m
IGV4dGFibGUgZW50cmllcyBmcm9tIDEzMDYgdG8gNjUxNiBpbiBhDQo+IHBwYzY0bGVfZGVmY29u
ZmlnIHZtbGludXgsIGluY3JlYXNpbmcgdGhlIGF2ZXJhZ2UgbnVtYmVyIG9mIHNlYXJjaA0KPiBz
dGVwcyBieSB+Mi4zLg0KPiANCj4gVGhpcyBwYXRjaCBhZGRzIGEgcmVjb3ZlcnkgYWRkcmVzcyB0
byB0aGUgYnVnX2VudHJ5IHN0cnVjdCBpbnN0ZWFkIG9mDQo+IHVzaW5nIHRoZSBleHRhYmxlLiBU
aGUgc2l6ZSBvZiB0aGUgYnVnIGVudHJ5IHRhYmxlIHBsdXMgdGhlIGV4dGFibGUNCj4gZ28gZnJv
bSAxMzdrQiB0byAxMjZrQi4NCg0KVGhhdCdzIGZpbmUsIGJ1dCBpdCBtZWFucyB0aGF0IHNvbWUg
YWRkaXRpb25hbCB3b3JrIHdpbGwgaGF2ZSB0byBiZSBkb25lIA0KaW4gb2JqdG9vbC4NCg0KQ2hy
aXN0b3BoZQ==
