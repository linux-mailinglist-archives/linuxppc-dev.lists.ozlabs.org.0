Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C846E7CD3CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 08:04:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Th+ZNM+K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9L0c538Tz3cSJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 17:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Th+ZNM+K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9Kzl03Pjz3c4l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 17:04:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1UtC/3bzcrvL1Vh1qAuGQQge8qvL3N6pq3bxSbeTzESuCMrw36k0/0u6qAvT62GR/aaOFV0dTQBYycmR9UEi774rhBaJxxvwuq0Kmr2iHChTOS0F3DODGgisComHXmz0AAqSDi/nSEBzEJLVCB7yqTFJQFK9ish1Z93MxsuD1EJ/biGCLMhrnmZlIm4GdnYehDSqnqG4y1ft9Q1V28S855X07f+ZRfJf//cgIInKmTRyEpQg9R4fxdz7YPepOkKEn/48+ROSjNDpoDu2VRBtFFDcEb8rk/LyiJBPsZRx6SEPmTwVK/t5hyIfbw75n1+poMEWXs3D5wuLuUjoJfovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FljSnWOufhOs+3FOZvRg7sx0d45o8i/QP+1KrdN9LZc=;
 b=nxY2xyL0hOEYU7VhcYtFffsK/Nhf+LL6pkF9Zos2uuYQRM4YeufsN/+RkwN5ubWJvIzfEbooW3KZ6q/4d9P0+WMZZzr/DAzOTCP1lCuMk+byVAD5NFEypTgZCWKHHPyZxAtJ98sRi5PeR/4qIw5g4UREm6b2mN7O64G24bw99J43fTl5UErWxz7gqzkPpTdOY3eg4pxXV8JJr0lKdYCU2rUNYWOrUZ/NVz1xVgXqeR6P1mhnMWww/TnVpcSRofU9GptrMXSwf3pD7gd15RqSuN2qr4OCTU0sHkoyumdU3EglrNeBkzTJ9t3Wet1AZVPidoHAuEHUJ/vVyifIHN4eJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FljSnWOufhOs+3FOZvRg7sx0d45o8i/QP+1KrdN9LZc=;
 b=Th+ZNM+KPJiiyWYXYACHf8+g1L5Gkw8pJXTEC2hdAovMjx/8d9G1ohLHS38j2WAFI1nv1DFC30KfmRW4hyaE7dlIo3hWK/Nk8WwLLSVAMHYWxIgsyYQuXuMKqTfqzBHX7zQOnc3rqCor9B1tykaEbRjFkErsRg/e3aUBDmFfjy0tJ2ufn9cRV6fv5AY0dJwA7y0a+DOEAxp0cZwtKKmPzr6c4imaxfoISssTY4ZVa48YZEIBgVB6VyH4BYSSOzbBnCDj8vQKZj6eWH6Jeqq9qciWOVKUrNmLIKneMHaI9X3Ls5TlqzAUmy/TfYYl29sIMS7XczWgIsyck5Gt+cvQQw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3327.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 06:03:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3f16:2478:90af:c462]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3f16:2478:90af:c462%6]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 06:03:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 0/3] Add generic data patching functions
Thread-Topic: [PATCH v2 0/3] Add generic data patching functions
Thread-Index: AQHZ/+4hD4O5JoWsRkmYmth7FsZ0f7BNiZUAgAAEyYCAAYN2AA==
Date: Wed, 18 Oct 2023 06:03:43 +0000
Message-ID: <1da08492-f8b0-a6ac-b076-c5a820bfeb20@csgroup.eu>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
 <e2fd9e0a-9371-c8a8-39de-6bca99732567@csgroup.eu>
 <6dcfb1dc-ff4b-485d-befc-4928bb1460a4@linux.ibm.com>
In-Reply-To: <6dcfb1dc-ff4b-485d-befc-4928bb1460a4@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3327:EE_
x-ms-office365-filtering-correlation-id: e27d515c-8695-47b2-3a84-08dbcf9ffbb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  koYJ+n1AW8uTdTv0HA8VB1nMA8FO4qKWN0VcFUZzU/50xPfuzOAw8o4ymG/DX/95ELvIZuY118fi77s/GlVj3t9oge+4dHw1teZ6cvw2jsbS7vb+X8d/8zFg2UnyVay6kcoPpqrUaUCyRTacb4Eky8kQOlgPv61aeyIxtOXD9ZR6AVufd6ivCOM4mhAvBsigLIWF/d0+9upPpZM7Tr38DoAMuMMx3eTdaT+A+ZUS2wxmHDJghTW+yWFDsZvRcfbcakz874X1uksKG+nK2R6itsz0zfYPowj+WAo1VA6XYNNfS43EgKib2KQZ2e+VWgoVw6Udy2qVqN3lEOmTe6QETbVdsORW/1qvTfBoKr6YVovZBrrbYUA5f8BBU9AXWfoSIfRo0sObYkvNEJ/K0UKYHFZmVEQ1whwFtt2iux3eSihp6atE4TXVPFOvioLK/7J52poy0RtErmuOfFW/q+9hHAq1Zw4jl+DbgU4mOn8r1uCLSWMfSZTMrmW55ZPnO5lijnvmaFJbRLYQdNis3CJBGRJTKlkO+3o3eHLZYp7sTf/mqvndcdQ7IkYIcLALURskIfa4mtIzA+Onu/YTska8e0RP81dKYiqkAr4CFy+06Um0NgXWKTD1H7TOWlqYMTcFV5GiNE/6rL8i8CqSb2ufIN8d9050VdhWMAcZAYaTfsOK0JKYsNXo5YWPrP6npRrxEmbZMMbAXql9Ou4/zOh+RA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(31686004)(2906002)(44832011)(5660300002)(8676002)(8936002)(41300700001)(6512007)(64756008)(66476007)(66446008)(91956017)(76116006)(66946007)(66556008)(110136005)(316002)(6486002)(478600001)(53546011)(71200400001)(2616005)(26005)(66574015)(38100700002)(83380400001)(38070700005)(36756003)(31696002)(122000001)(86362001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UTVVeTZRUXNzeHM2NkluS3Y3UlRUaVI1cFlYdVJJRHJrZC9xbWhMVmp6Wlh1?=
 =?utf-8?B?YW5idTBKWDlWWktWY2dCK2NKU0J0Wi8wTEJZSkE2b3cwRXZFWXkwa01zT3hl?=
 =?utf-8?B?VFUxZGlWUEZocHFoVUpRcWEwM3JydUhTTm1YczlqQlAwaG16MUNDVjEzVURo?=
 =?utf-8?B?Wi9WNWVkT3JHdHhEVVUrZFlZaC94dzRHM3RaUlc3ZEErVkJ5NTlLblhHTmFY?=
 =?utf-8?B?V2VWMEIxaDBKTHZJNW8ybFc2dFdxSk5wWHBYWTkrcjhlSnh6Z2FuK1d4Rm5j?=
 =?utf-8?B?aFVNcVh0MkZIZWJhNWF6L1UzVHQ3bWhyWXR2V2Nmd0pld0RLK3k3KzA2S2ZD?=
 =?utf-8?B?d1JMc3hFTUJtcHlLQS9WQmRHczJZeGxFb0YzeU80YytoWFJvaDA2NkdMWUk1?=
 =?utf-8?B?cFQ5R0Z6ejVWZVZORHAyc3V4N3R6ZXdSY01mVVh1Ri93L2diMGZpckhqbjY3?=
 =?utf-8?B?NVBpakpIOVdvaW5jS3lPL0lvM00rTGo3eEs5UUg3Z2NFT0JhR0VQS0RPbUFC?=
 =?utf-8?B?c3Y5ek0xRzQ2MW5HeW41Z3ZNOThFWHJvWWNUUnBJSE5MRHZlL3dTQVRwK2lZ?=
 =?utf-8?B?SnJIMWpoVmNWWkVGWXVlZjYrSisyUHBUeHoyQlJlT2RIYzdnVzd1YkZhcHB3?=
 =?utf-8?B?R0NSWTJEWXl5R21MV1lpdGgwNi9jdXVzWFRRVWs3MTVkRWRXK0J3ckNERXFX?=
 =?utf-8?B?WlZXSXo4ZnZ6TzRlM1RYVkJFZUlpZnRvdXpxcVhqUk5lTFhqMlYvdFJldGQ2?=
 =?utf-8?B?amFKUjREOSszNmFwWHpGanlIV21kZ1lGZy9ORDJLYmcxV3lNMXhGMTlaTW52?=
 =?utf-8?B?ZTZGRE44VWlNTTNMTTYyclVVRG1LK0p3eFdwRUg0cHl3aG1oZ2VuWDZVbEsv?=
 =?utf-8?B?VUZSRUpRbEFaenc4VmI4VlhTcVNudHRld0NXcTYyenVqSXZVbUhVeTNYVkp1?=
 =?utf-8?B?R090T0hCOWNqbHdYL2F2ZjVCbGN6TWxRb3ZDaXRoRUJQYWJGc2U2Qm1vb3l1?=
 =?utf-8?B?bjVqaHpsZEg1RDRmalovbUR1cHgyWWtYUWtaTCtubXYydUFKcVQyVGxCUThp?=
 =?utf-8?B?N0ozSXd4YjVhV2ZFMjNxNWZncEQ0ZGlQcFd4QUpmQ0t1TFF5b2ZqaStGemVS?=
 =?utf-8?B?TW1RemNnNGhSelBnT3dkb1JFTFhnZVRkU1I5a05RbUJOMERPMW1QUFR1SFJo?=
 =?utf-8?B?cFVRRk5QYzRzYWY2amVkTjZuUHp3RUtBaDBQUTRwMnJweHQvNi9idk5TWkda?=
 =?utf-8?B?bkxtdGQwOW9GRUhaZGhlWG90SEg1Ujc3SFhocHBmUjN4bUpjQ0pjTlgwOXFV?=
 =?utf-8?B?aGQ4eGk5R01JQ0NXMnZaYnluSUtqVUNoQmpEaC9nRndpTnNudHc2NWZIT3Ew?=
 =?utf-8?B?VHl3d2Q3b1FGbDBtUnBsL0RONm5Fbm9OSG0xeHBBQlBMdVhwaE1lSi9Hc2w4?=
 =?utf-8?B?SjgxdWp4MFA0QWVGNHJmNUd0Ry9XMVVNUHR5U2o5SlpKYzJlckVTWVMxUUYw?=
 =?utf-8?B?R2pka044ZTJwSk5tK05zdlZjQ0N5OE5UZlFWWmtIMWNKeWlqUjI1a3VOTXAy?=
 =?utf-8?B?bXVWK0l6ZHdnTVBhaCtuWVJ5YjhBYy8ycGd1SU5BVVNSWEl6Z3A0RDMrTnVZ?=
 =?utf-8?B?QmZUQ2dSUmhYZ0FlQ1ZuK2htNlptSk1NdEJzaE9HaUFtVXFaM0M0Rzhhak1n?=
 =?utf-8?B?VHU0MGd3VEdWS0FUc1hmdWd4OGtyWjc4Ync0bVp4STllcDFDSXhwUnRhRGVC?=
 =?utf-8?B?RFIveEFpcVBMblJ0UlNYYWlnZ1JPRlRQcWxnS2t6OS8zMVpUZUF1S0ZOcis0?=
 =?utf-8?B?WkM2Y2ZhYVoraWFlbURsVEk1QUJQMWtRNVV2d3A5ZTVvTCtmbVZhL2FUVWxo?=
 =?utf-8?B?Vkp6MU1yQmhpcUxDNEZHb3lKaFVTR05GYTZ4QzRYc2JqN1Z6RzRpeVlzWGhY?=
 =?utf-8?B?ejU1aGdjbDA2R0ZwSjF6ZENNYkNjUXNnaHNTd0RmU004UUdSWUNYbkFUNWsr?=
 =?utf-8?B?d3FIWmNVTkNHa2xkSkJncW5kQzZyUzdCMy9WU083d1lhUEhZUy9aSmw2NW4y?=
 =?utf-8?B?UktLYjVZQkIzTkhqLy9sakZCMyt1dC8zVHlEdVg4bktjTStTVWdHanlBY2tO?=
 =?utf-8?Q?IGLmzkZVRg0Y36Om9EZzuipL6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A74224E88E3AE4985EE343F19DC5F8E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e27d515c-8695-47b2-3a84-08dbcf9ffbb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 06:03:43.2439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vogs+uALwXybHjrdJLRXhrW2psBDBRvwlKPDXgaLG7A70xT7FO1o+BQKyQDGYMj42vh97O/2/PIVjHv+49abdZ1xBePSUitynljlEc/U4PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3327
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

DQoNCkxlIDE3LzEwLzIwMjMgw6AgMDg6NTYsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gMTcvMTAvMjMgNTozOSBwbSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IExlIDE2LzEw
LzIwMjMgw6AgMDc6MDEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4+PiBDdXJyZW50bHkg
cGF0Y2hfaW5zdHJ1Y3Rpb24oKSBiYXNlcyB0aGUgd3JpdGUgbGVuZ3RoIG9uIHRoZSB2YWx1ZSBi
ZWluZw0KPj4+IHdyaXR0ZW4uIElmIHRoZSB2YWx1ZSBsb29rcyBsaWtlIGEgcHJlZml4ZWQgaW5z
dHJ1Y3Rpb24gaXQgd3JpdGVzIDggDQo+Pj4gYnl0ZXMsDQo+Pj4gb3RoZXJ3aXNlIGl0IHdyaXRl
cyA0IGJ5dGVzLiBUaGlzIG1ha2VzIGl0IHBvdGVudGlhbGx5IGJ1Z2d5IHRvIHVzZSBmb3INCj4+
PiB3cml0aW5nIGFyYml0cmFyeSBkYXRhLCBhcyBpZiB5b3Ugd2FudCB0byB3cml0ZSA0IGJ5dGVz
IGJ1dCBpdCANCj4+PiBkZWNpZGVzIHRvDQo+Pj4gd3JpdGUgOCBieXRlcyBpdCBtYXkgY2xvYmJl
ciB0aGUgZm9sbG93aW5nIG1lbW9yeSBvciBiZSB1bmFsaWduZWQgYW5kDQo+Pj4gdHJpZ2dlciBh
biBvb3BzIGlmIGl0IHRyaWVzIHRvIGNyb3NzIGEgcGFnZSBib3VuZGFyeS4NCj4+Pg0KPj4+IFRv
IHNvbHZlIHRoaXMsIHRoaXMgc2VyaWVzIHB1bGxzIG91dCB0aGUgc2l6ZSBwYXJhbWV0ZXIgdG8g
dGhlICd0b3AnIG9mDQo+Pj4gdGhlIHRleHQgcGF0Y2hpbmcgbG9naWMsIGFuZCBwcm9wYWdhdGVz
IGl0IHRocm91Z2ggdGhlIHZhcmlvdXMgDQo+Pj4gZnVuY3Rpb25zLg0KPj4+DQo+Pj4gVGhlIHR3
byBzaXplcyBzdXBwb3J0ZWQgYXJlIGludCBhbmQgbG9uZzsgdGhpcyBhbGxvd3MgZm9yIHBhdGNo
aW5nDQo+Pj4gaW5zdHJ1Y3Rpb25zIGFuZCBwb2ludGVycyBvbiBib3RoIHBwYzMyIGFuZCBwcGM2
NC4gT24gcHBjMzIgdGhlc2UgYXJlIA0KPj4+IHRoZQ0KPj4+IHNhbWUgc2l6ZSwgc28gY2FyZSBp
cyB0YWtlbiB0byBvbmx5IHVzZSB0aGUgc2l6ZSBwYXJhbWV0ZXIgb24gc3RhdGljDQo+Pj4gZnVu
Y3Rpb25zLCBzbyB0aGUgY29tcGlsZXIgY2FuIG9wdGltaXNlIGl0IG91dCBlbnRpcmVseS4gVW5m
b3J0dW5hdGVseQ0KPj4+IEdDQyB0cmlwcyBvdmVyIGl0cyBvd24gZmVldCBoZXJlIGFuZCB3b24n
dCBvcHRpbWlzZSBpbiBhIHdheSB0aGF0IGlzDQo+Pj4gb3B0aW1hbCBmb3Igc3RyaWN0IFJXWCAo
bXBjODV4eF9zbXBfZGVmY29uZmlnKSBhbmQgbm8gUldYDQo+Pj4gKHBtYWMzMl9kZWZjb25maWcp
Lg0KPj4+DQo+Pj4gSW4gdGhlIGZpcnN0IGNhc2UsIHBhdGNoX21lbW9yeSgpIGlzIHZlcnkgbGFy
Z2UgYW5kIGNhbiBvbmx5IGJlIGlubGluZWQNCj4+PiBpZiBhIHNpbmdsZSBmdW5jdGlvbiBjYWxs
cyBpdC4gV2hpbGUgdGhlIHNvdXJjZSBvbmx5IGNhbGxzIGl0IGluDQo+Pj4gcGF0Y2hfaW5zdHJ1
Y3Rpb24oKSwgYW4gZWFybGllciBvcHRpbWlzYXRpb24gcGFzcyBpbmxpbmVkDQo+Pj4gcGF0Y2hf
aW5zdHJ1Y3Rpb24oKSBpbnRvIHBhdGNoX2JyYW5jaCgpLCBzbyBub3cgdGhlcmUgYXJlICd0d28n
IA0KPj4+IHJlZmVyZW5jZXMNCj4+PiB0byBwYXRjaF9tZW1vcnkoKSBhbmQgaXQgY2Fubm90IGJl
IGlubGluZWQgaW50byBwYXRjaF9pbnN0cnVjdGlvbigpLg0KPj4+IEluc3RlYWQgcGF0Y2hfaW5z
dHJ1Y3Rpb24oKSBiZWNvbWVzIGEgc2luZ2xlIGJyYW5jaCBkaXJlY3RseSB0bw0KPj4+IHBhdGNo
X21lbW9yeSgpLg0KPj4+DQo+Pj4gV2UgY2FuIGZpeCB0aGlzIGJ5IG1hcmtpbmcgcGF0Y2hfaW5z
dHJ1Y3Rpb24oKSBhcyBub2lubGluZSwgYnV0IHRoaXMNCj4+PiBwcmV2ZW50cyBwYXRjaF9tZW1v
cnkoKSBmcm9tIGJlaW5nIGRpcmVjdGx5IGlubGluZWQgaW50byBwYXRjaF9icmFuY2goKQ0KPj4+
IHdoZW4gUldYIGlzIGRpc2FibGVkIGFuZCBwYXRjaF9tZW1vcnkoKSBpcyB2ZXJ5IHNtYWxsLg0K
Pj4+DQo+Pj4gSXQgbWF5IGJlIHBvc3NpYmxlIHRvIGF2b2lkIHRoaXMgYnkgbWVyZ2luZyB0b2dl
dGhlciBwYXRjaF9pbnN0cnVjdGlvbigpDQo+Pj4gYW5kIHBhdGNoX21lbW9yeSgpIG9uIHBwYzMy
LCBidXQgdGhlIG9ubHkgd2F5IEkgY2FuIHRoaW5rIHRvIGRvIHRoaXMNCj4+PiB3aXRob3V0IGR1
cGxpY2F0aW5nIHRoZSBpbXBsZW1lbnRhdGlvbiBpbnZvbHZlcyB1c2luZyB0aGUgcHJlcHJvY2Vz
c29yDQo+Pj4gdG8gY2hhbmdlIGlmIGlzX2R3b3JkIGlzIGEgcGFyYW1ldGVyIG9yIGEgbG9jYWwg
dmFyaWFibGUsIHdoaWNoIGlzIA0KPj4+IGdyb3NzLg0KPj4NCj4+IFdoYXQgYWJvdXQ6DQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmgN
Cj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NvZGUtcGF0Y2hpbmcuaA0KPj4gaW5kZXgg
N2M2MDU2YmIxNzA2Li5hZjg5ZWY0NTBjOTMgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vY29kZS1wYXRjaGluZy5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vY29kZS1wYXRjaGluZy5oDQo+PiBAQCAtNzIsNyArNzIsNyBAQCBzdGF0aWMgaW5saW5l
IGludCBjcmVhdGVfYnJhbmNoKHBwY19pbnN0X3QgKmluc3RyLA0KPj4gY29uc3QgdTMyICphZGRy
LA0KPj4gwqDCoCBpbnQgY3JlYXRlX2NvbmRfYnJhbmNoKHBwY19pbnN0X3QgKmluc3RyLCBjb25z
dCB1MzIgKmFkZHIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgdGFyZ2V0LCBpbnQgZmxhZ3MpOw0KPj4gwqDCoCBpbnQgcGF0Y2hfYnJhbmNoKHUz
MiAqYWRkciwgdW5zaWduZWQgbG9uZyB0YXJnZXQsIGludCBmbGFncyk7DQo+PiAtaW50IHBhdGNo
X2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cik7DQo+PiAraW50IHBhdGNo
X21lbW9yeSh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHZhbCwgYm9vbCBpc19kd29yZCk7DQo+
PiDCoMKgIGludCByYXdfcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5zdF90IGlu
c3RyKTsNCj4+DQo+PiDCoMKgIC8qDQo+PiBAQCAtODcsMjQgKzg3LDI4IEBAIGludCByYXdfcGF0
Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5zdF90IA0KPj4gaW5zdHIpOw0KPj4NCj4+
IMKgwqAgI2lmZGVmIENPTkZJR19QUEM2NA0KPj4NCj4+IC1pbnQgcGF0Y2hfdWludCh2b2lkICph
ZGRyLCB1bnNpZ25lZCBpbnQgdmFsKTsNCj4+IC1pbnQgcGF0Y2hfdWxvbmcodm9pZCAqYWRkciwg
dW5zaWduZWQgbG9uZyB2YWwpOw0KPj4gK2ludCBwYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIs
IHBwY19pbnN0X3QgaW5zdHIpOw0KPj4NCj4+IMKgwqAgI2RlZmluZSBwYXRjaF91NjQgcGF0Y2hf
dWxvbmcNCj4+DQo+PiDCoMKgICNlbHNlDQo+Pg0KPj4gLXN0YXRpYyBpbmxpbmUgaW50IHBhdGNo
X3VpbnQodTMyICphZGRyLCB1bnNpZ25lZCBpbnQgdmFsKQ0KPj4gK3N0YXRpYyBpbmxpbmUgaW50
IHBhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4+IMKgwqAg
ew0KPj4gLcKgwqDCoCByZXR1cm4gcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgcHBjX2luc3QodmFs
KSk7DQo+PiArwqDCoMKgIHJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgcHBjX2luc3RfdmFsKGlu
c3RyKSwgZmFsc2UpOw0KPj4gwqDCoCB9DQo+Pg0KPj4gKyNlbmRpZg0KPj4gKw0KPj4gwqDCoCBz
dGF0aWMgaW5saW5lIGludCBwYXRjaF91bG9uZyh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHZh
bCkNCj4+IMKgwqAgew0KPj4gLcKgwqDCoCByZXR1cm4gcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwg
cHBjX2luc3QodmFsKSk7DQo+PiArwqDCoMKgIHJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgdmFs
LCB0cnVlKTsNCj4+IMKgwqAgfQ0KPj4NCj4+IC0jZW5kaWYNCj4+ICtzdGF0aWMgaW5saW5lIGlu
dCBwYXRjaF91aW50KHZvaWQgKmFkZHIsIHVuc2lnbmVkIGludCB2YWwpDQo+PiArew0KPj4gK8Kg
wqDCoCByZXR1cm4gcGF0Y2hfbWVtb3J5KGFkZHIsIHZhbCwgZmFsc2UpOw0KPj4gK30NCj4+DQo+
PiDCoMKgICNkZWZpbmUgcGF0Y2hfdTMyIHBhdGNoX3VpbnQNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4+IGIvYXJjaC9wb3dlcnBjL2xpYi9j
b2RlLXBhdGNoaW5nLmMNCj4+IGluZGV4IDYwMjg5MzMyNDEyZi4uNzc0MThiMmE0YWE0IDEwMDY0
NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+PiBAQCAtMzU1LDcgKzM1NSw3IEBAIHN0
YXRpYyBpbnQgX19kb19wYXRjaF9tZW1vcnkodm9pZCAqYWRkciwgdW5zaWduZWQNCj4+IGxvbmcg
dmFsLCBib29sIGlzX2R3b3JkKQ0KPj4gwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7DQo+PiDCoMKg
IH0NCj4+DQo+PiAtc3RhdGljIGludCBwYXRjaF9tZW1vcnkodm9pZCAqYWRkciwgdW5zaWduZWQg
bG9uZyB2YWwsIGJvb2wgaXNfZHdvcmQpDQo+PiAraW50IHBhdGNoX21lbW9yeSh2b2lkICphZGRy
LCB1bnNpZ25lZCBsb25nIHZhbCwgYm9vbCBpc19kd29yZCkNCj4+IMKgwqAgew0KPj4gwqDCoMKg
wqDCoMKgIGludCBlcnI7DQo+PiDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+
IEBAIC0zNzgsNiArMzc4LDcgQEAgc3RhdGljIGludCBwYXRjaF9tZW1vcnkodm9pZCAqYWRkciwg
dW5zaWduZWQgbG9uZw0KPj4gdmFsLCBib29sIGlzX2R3b3JkKQ0KPj4NCj4+IMKgwqDCoMKgwqDC
oCByZXR1cm4gZXJyOw0KPj4gwqDCoCB9DQo+PiArTk9LUFJPQkVfU1lNQk9MKHBhdGNoX21lbW9y
eSkNCj4+DQo+PiDCoMKgICNpZmRlZiBDT05GSUdfUFBDNjQNCj4+DQo+PiBAQCAtMzkwLDI2ICsz
OTEsNiBAQCBpbnQgcGF0Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBwcGNfaW5zdF90IGluc3Ry
KQ0KPj4gwqDCoCB9DQo+PiDCoMKgIE5PS1BST0JFX1NZTUJPTChwYXRjaF9pbnN0cnVjdGlvbikN
Cj4+DQo+PiAtaW50IHBhdGNoX3VpbnQodm9pZCAqYWRkciwgdW5zaWduZWQgaW50IHZhbCkNCj4+
IC17DQo+PiAtwqDCoMKgIHJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgdmFsLCBmYWxzZSk7DQo+
PiAtfQ0KPj4gLU5PS1BST0JFX1NZTUJPTChwYXRjaF91aW50KQ0KPj4gLQ0KPj4gLWludCBwYXRj
aF91bG9uZyh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHZhbCkNCj4+IC17DQo+PiAtwqDCoMKg
IHJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgdmFsLCB0cnVlKTsNCj4+IC19DQo+PiAtTk9LUFJP
QkVfU1lNQk9MKHBhdGNoX3Vsb25nKQ0KPj4gLQ0KPj4gLSNlbHNlDQo+PiAtDQo+PiAtaW50IHBh
dGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4+IC17DQo+PiAt
wqDCoMKgIHJldHVybiBwYXRjaF9tZW1vcnkoYWRkciwgcHBjX2luc3RfdmFsKGluc3RyKSwgZmFs
c2UpOw0KPj4gLX0NCj4+IC1OT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zdHJ1Y3Rpb24pDQo+PiAt
DQo+PiDCoMKgICNlbmRpZg0KPj4NCj4+IMKgwqAgaW50IHBhdGNoX2JyYW5jaCh1MzIgKmFkZHIs
IHVuc2lnbmVkIGxvbmcgdGFyZ2V0LCBpbnQgZmxhZ3MpDQo+Pg0KPiANCj4gV291bGRuJ3QgZXZl
cnkgY2FsbGVyIG5lZWQgdG8gaW5pdGlhbGlzZSB0aGUgaXNfZHdvcmQgcGFyYW1ldGVyIGluIHRo
YXQgDQo+IGNhc2U/IEl0IGNhbid0IHRlbGwgaXQncyB1bnVzZWQgYWNyb3NzIGEgdHJhbnNsYXRp
b24gdW5pdCBib3VuZGFyeSANCj4gd2l0aG91dCBMVE8uDQo+IA0KDQpBaCB5ZXMgeW91IGFyZSBy
aWdodC4NCg0KQ2hyaXN0b3BoZQ0K
