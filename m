Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713A58C784
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 13:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1Yqj42b7z305M
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 21:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GgRLpFN/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GgRLpFN/;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1Ypw376Qz2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 21:28:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWwB7ZcGrXWxuiW1DYfwFcjWxcjXPLK+IJkeS/UC+gr92tmc5EPBOLxbFf7Rd3Y5llVNA9o+9tUd3hBRvecg0tpl4593qjGmaOm/TJjCU5uy3hHHRx+ZIDWyRaPixZEWdi65wVLFKZmcfJSPK7jK1Ba/IyrgCi2wbAbwsnp8+1tclc025HoIFWdWclkJ3PbbIToB5pZpX62uzJMMtjTd5vy2M0G0HY++qb4J315phH2WddOsUCMjWySBW8QYo+PWU48lXxtLZz4C/ZWcUBIgDvoUr4E2xIQFVxXuZ/enO3a0Q41hauBoaM3KSYp41aD9dxhszuwi10w3Q0RXwbum3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vivKXS8JcbfxVnO3Q75so9csx5jWLjvYztkcVGUbhqM=;
 b=Vo9eMAlUF1CjwnT6LLZD4DrAL6qdR16yFZTp8RaDTkt5XAqcRkwbktlYl33PWB0iRb3YD0McJqrV2/9sXr3t40emmMEKoMfnqtyV6xEYNVLQwGL8lTe15x9G5Ze34AfMEHMpvDgT39OBgDkuj7Zej6Y25tUnRVxWvPi1A2dM3kGkd0NjRuoDIP6y4L8cA/P1gEuqDsNDDHrJ7nGrs6y4PFBQlSJDuH4zC+dKREYKxWF63nFmyJqJpbw8bZ6UXN7XGlQt8rodycglrWm6RZHGq7OV0tQRJjvB4D6MahhkAQ6l8tL+cpjG4QfV7pT7LYC+wenvkPCtV2/l4DEW/FJdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vivKXS8JcbfxVnO3Q75so9csx5jWLjvYztkcVGUbhqM=;
 b=GgRLpFN/JscPSkyA42tBLWjACZ1z7sQiTB0wu1N2GbJgZVUYDzfqnj4sa6vlQcQfDGTjlKPPdUzUfbZBwzT7NjRbSU6J3vvlk7SNt4Axf953ABbmQWcnPVjcToSXMMoxRr7SHOmfNIMllAZdmW0zwahaedEcSePq4eKAenm4h7usnUn3bmjyfQ1QiBno9CpCqbG5tduUbPqCfxLn5o7kPJy8xZ44SIHkcT8mLUMvPXb0lRnkihFNY2pMQojMqrr/l8y4iC/Z2rgmJJ1XA5GnNefKtK+n5VziJWBdcQCHcffOa6BdwfpaB8SWsmAh4JeZeAG/aabObnDT2MLeC0yY1w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 11:27:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 11:27:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 13/14] powerpc/64s: Fix comment on interrupt handler
 prologue
Thread-Topic: [PATCH v2 13/14] powerpc/64s: Fix comment on interrupt handler
 prologue
Thread-Index: AQHYn/B6dB493KK11EGp/5ouNvO6D62k8+IA
Date: Mon, 8 Aug 2022 11:27:46 +0000
Message-ID: <34233718-8fae-d18d-cb48-bf695a1f102e@csgroup.eu>
References: <20220725063156.121292-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725063156.121292-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 721ec168-69ac-4306-4145-08da793104ec
x-ms-traffictypediagnostic: PAZP264MB3133:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jtlkpLgOju54d18GZS/pmFTYp/apbHFi9l+KG/6vU43Ba+ed5V6KkdBfML/1aB1LiZKbhdidLnR/MwWl+sDX/SXmUmO0ya9GVcC+RgxBObmcx9CbavEdsOevA/MC4OizTnuSzdf2mstHnMXjgAGHvC0HoW4Ie9a9e6hV3z89rPdFIRd6pvo7zsxqZNAwnEMZAXgEb4GFTqfFb2XaW7pdsMMQ+OKkKbAqHkofrH+9OpWUjJKSMYbWbKsNZKS5mTBPfim83/ZjQzIpug0xhAyB7Bpk/TaJEV6ox6Nf7yQZe2gwhKdr9NwxPgpK1YgXkczMIAQc53gHQWKQe7eOhMUI0iNFVtFDBgfS0CvkR4IHbiK0OK6nhVWSHNxwcwlXJtmZnvvT6kZgNzm7WllsviGu1m7CtNYHrIuQP731ylrHg0/RWA4cCopGnldigakr7e33lgba+X8tEDSqKqcyGTs1Y5tLWcSv+KcyqlipfazwZ8JVvPEStxyfSTupET8bPNDhJ4MyANvESHMgJ2lvUuStvhLLPAdf45lHO1amFyeyV9P/OnFq3Id++Dl5kyKZe8UxbntDUMOXbJC6IXygi9q4V+2+mkYDtKRuTp0kmFFKYXXMcQEehdnogNDXEfKVoFtbszqhQ6199cjlmMq0Pg8uAtLdaiUmoaco3dng4+01qgEASSJWM6TKPRA1ju9WN5sEue/g/kLjpSFL6mxEc6gNtOm+9zwLIq2c4Rr3gMcvgBkCz0JSXXm6Wi57iAX63wfNopemjzlb4hpVq0RsN+2kl+bHhg4s3Z0dUoEDmTq0SNZQD2b/nwndLhPP2uUEuzHFsGoK5Vbf02VkfLtmZX4AKMiZ1CYBB+9CnvlgnlwEAtGGBlqirw0obxioVDsk6wlq
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(136003)(39850400004)(366004)(346002)(38100700002)(86362001)(36756003)(2906002)(31686004)(44832011)(6486002)(5660300002)(8936002)(31696002)(71200400001)(38070700005)(478600001)(8676002)(64756008)(4326008)(66946007)(66476007)(76116006)(66446008)(66574015)(66556008)(91956017)(83380400001)(6506007)(41300700001)(110136005)(122000001)(6512007)(26005)(316002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VDdpbTA4N3MxbWdsTWxLTVlxZTNnNFFXZFBnRXptVjFxY0NuWE9vWFcvZHJO?=
 =?utf-8?B?UFhwcjdLeFFDODk2RC82dDJjTkU3dWRjUVNPdU43U1RJaXo2TVowZFYrVG11?=
 =?utf-8?B?b1Z0VDd5Ky8zbzZzVWNkc29LVUFIQzF2VnlzWW0vK01NdFFIZ1dSeG8xbWVU?=
 =?utf-8?B?QTlxQklPblQ1NVZJSjlEN1ludlZIdXZmMTBaNDFDY3gyTmIxdlFndE5BSkwy?=
 =?utf-8?B?ZnY5bEJyb3lRMXJHT3k2c09NVDJXNThhVlkvSkc5ejZ1NGxsdVhLdUpjcWd6?=
 =?utf-8?B?WlJCWjU5R1VpRDh3MVpDbE5jdERRNWtEQlNTKzh6eU15dlZjSU5QMHNvWDBx?=
 =?utf-8?B?TW92RG5ZeW9kTlNGMzljKzN1UVNnUVdFbmZqMzFiWXIwdFp0d05kZEVhekk3?=
 =?utf-8?B?cEI3SzE0ZkE0RjUrdTFGU3UrclltN3R6alltSEJhWEZRNkE2K1lleUV2MXdF?=
 =?utf-8?B?WjF5OXZWMktjdzZURDZNZU81OUVpYnVGQndBcDVPT0d2Tk53SDNSamJ3M0o1?=
 =?utf-8?B?T1V2a0JrcXNmaGxrdlFEcTlsTWQxL000d1NuWER3MkRVUjRFQlhBWTZONEdr?=
 =?utf-8?B?NkNnaEdYc0lmZXlFYUtPN3pkWDBpUkh2dmR0c01RNXVvWXFuLzFJN2tkWSsw?=
 =?utf-8?B?OUtsemk2eHpoeGd0S09MTUkxY09vM3NXbnRGbktVdG9PY0QrSm4yT0VZb3RI?=
 =?utf-8?B?eFF0Wm5IUEZRQktsaWhPSEZhNjlRamNwUjYyQlZpaTB3MUVxMnZFMzZ2SXhm?=
 =?utf-8?B?SkI2R0ZoK1pkTWlreUxDRW14K21hZU0zU2xhUEJaZXJWeVdZbTNBWFFaVE5l?=
 =?utf-8?B?WVgzV0JSY1RsR0x0MXhmNWVyOHJmYUhrZ1JZUkR6SzAwOHp2NW1OdmtLcTJU?=
 =?utf-8?B?a3dSVlN6TEJnelZDdEsyV2FOb3pKbFdaZ3hhTGRmbmt0ams3cXR0eGtiQ1VB?=
 =?utf-8?B?ZWVpcTFKUXVLblQzM0JURDhJZ3JvSDZjc0MxU2NjWWxDYTZSbm52UklScFRn?=
 =?utf-8?B?UWRobENIcnRTeGowVW9ZQ25ITmJOUkxMT29ZeHFaQmhBMTlzemJycGE3Yys4?=
 =?utf-8?B?cDM2R1orUUhwOUEwS3d4NnJWUk96Z3lGMW82MGNZTWVnenJOTkg3QUJQY0R4?=
 =?utf-8?B?R2YvcFMrNUpPTzdrbVExVUFiUHhtQWtwaUVtRitoZ3RRQ0pqZXlURjBvUldB?=
 =?utf-8?B?YjNpbXZ6d3FaSDlzdUxLRHEvb1pLdXdIUWpXZUlZUU82SmpCMnNJWmdJdFVu?=
 =?utf-8?B?WThraTNUSi94TTJyT2ZYcWI2c29lMTVtQTdwNnNKbzJyejBqMkJocHRWbzVZ?=
 =?utf-8?B?bW5EL2M3Ri9WOHBGZjFVeE1aMTBSYUZrV3lHZWtYbm92Ymo4T1hGVkZ0bUNM?=
 =?utf-8?B?L09pVWNMdDZYTzRxNWF5TFgramQxZ2FFalFpWFZYRjVicEVNQXRHU29TWlFx?=
 =?utf-8?B?eW1yZHB2MGZqcHVBVG03WUdmWStnWUJVbStVSTdyV3ZNbjU1L2FoamJ2T2c3?=
 =?utf-8?B?Y3RyUytVamJ4NVZhY3J5RkFWUmg1bFZFTWdlYnFXbnVMNXdZWDRXbVZwN0JF?=
 =?utf-8?B?dG9BOUFpZnBxOW11YjRsVWJkTnh1a3dYNzZaa2puWWVFS1JBdzJabi85aW51?=
 =?utf-8?B?VkpmbUt4cXB3bGg2ekQwRGNLakNjcGhQV3JyNFc3VnROVUJKNjk5T1FnMzZx?=
 =?utf-8?B?OVNUWFd3Q2JEZXZzTTE5MnpwaUlqYzMwTmI0blJpVTVyd3lXR2tFTHFya1Vs?=
 =?utf-8?B?cVVOUXlrckFocWJUVEFDKzdBY3lVcHFZN01xaUZyTWZiRkd6OXhRZVJOMFdo?=
 =?utf-8?B?RFRQYlpkTDI0Y0E5SUNqZitwemhpbG92YjBIN2FxQTRheFpJZWJvQUE5TDVp?=
 =?utf-8?B?dE10OHltaVF3dkFtRFphTzRJN3NVUGVQdnczK0VDU2VuKzQwSEkwTDVNREVO?=
 =?utf-8?B?dld2WVBwREs2NnB2V1c2KzJoeWYzU1ZZOC9KY1M4YU43UEVKclhnd2ZWdWJZ?=
 =?utf-8?B?QTdhOGZuTDFHYzRKQU9lcTlTQVRpSlhGTE5yZ2p3ZmRudU50WU93OVdaakdN?=
 =?utf-8?B?NUZTZVBuRGs5US9XMHJtcEJBQWxvUXFyNlZFNnQ4Q2tBcThQdUEydVNXZWJW?=
 =?utf-8?B?clFMRUN4OHdPajMxUnhHSjNlSzBpMlFYNTNMRlFMWXRUZ1RVZHJLQ3ZGL2Ry?=
 =?utf-8?Q?4u7OzgTeJCFoKa0WNFCpoqc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37A31DE3FCA65E4B985A828C2CAACCEC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 721ec168-69ac-4306-4145-08da793104ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 11:27:46.9140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nf22o1ts/sC8TjH7Ue+t4jZvOIi6UJuKJXMmBczWq6OoQu16NZaDJTa72BvHIUNg7aLObHfblGJVQiOfxD0UQ8eigcwrxTLYmkJIDwC1vGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3133
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MzEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBJ
bnRlcnJ1cHQgaGFuZGxlcnMgb24gNjRzIHN5c3RlbXMgd2lsbCBvZnRlbiBuZWVkIHRvIHNhdmUg
cmVnaXN0ZXIgc3RhdGUNCj4gZnJvbSB0aGUgaW50ZXJydXB0ZWQgcHJvY2VzcyB0byBtYWtlIHNw
YWNlIGZvciBsb2FkaW5nIHNwZWNpYWwgcHVycG9zZQ0KPiByZWdpc3RlcnMgb3IgZm9yIGludGVy
bmFsIHN0YXRlLg0KPiANCj4gRml4IGEgY29tbWVudCBkb2N1bWVudGluZyBhIGNvbW1vbiBjb2Rl
IHBhdGggbWFjcm8gaW4gdGhlIGJlZ2lubmluZyBvZg0KPiBpbnRlcnJ1cHQgaGFuZGxlcnMgd2hl
cmUgcjEwIGlzIHNhdmVkIHRvIHRoZSBQQUNBIHRvIGFmZm9yZCBzcGFjZSBmb3INCj4gdGhlIHZh
bHVlIG9mIHRoZSBDRkFSLiBDb21tZW50IGlzIGN1cnJlbnRseSB3cml0dGVuIGFzIGlmIHIxMC1y
MTIgYXJlDQo+IHNhdmVkIHRvIFBBQ0EsIGJ1dCBpbiBmYWN0IG9ubHkgcjEwIGlzIHNhdmVkLg0K
DQpNYXliZSBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyB0byBrbm93IGZyb20gd2hpY2ggcGF0Y2gg
dGhlIGVycm9yIGNvbWVzLg0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8
cm1jbHVyZUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gVjEgLT4gVjI6IEdpdmVuIGl0cyBvd24g
Y29tbWl0DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvZXhjZXB0aW9ucy02NHMuUyB8
IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRzLlMNCj4gaW5kZXggYjY2ZGQ2Zjc3
NWE0Li4xMDI4OTZmYzZhODYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZXhj
ZXB0aW9ucy02NHMuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2V4Y2VwdGlvbnMtNjRz
LlMNCj4gQEAgLTI4MSw3ICsyODEsNyBAQCBCRUdJTl9GVFJfU0VDVElPTg0KPiAgIAltZnNwcgly
OSxTUFJOX1BQUg0KPiAgIEVORF9GVFJfU0VDVElPTl9JRlNFVChDUFVfRlRSX0hBU19QUFIpDQo+
ICAgCUhNVF9NRURJVU0NCj4gLQlzdGQJcjEwLElBUkVBK0VYX1IxMChyMTMpCQkvKiBzYXZlIHIx
MCAtIHIxMiAqLw0KPiArCXN0ZAlyMTAsSUFSRUErRVhfUjEwKHIxMykJCS8qIHNhdmUgcjEwICov
DQo+ICAgCS5pZiBJQ0ZBUg0KPiAgIEJFR0lOX0ZUUl9TRUNUSU9ODQo+ICAgCW1mc3ByCXIxMCxT
UFJOX0NGQVI=
