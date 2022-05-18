Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B052BB7A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3DPq2f5xz3cL1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:30:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3DPL74FLz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:29:58 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L3DPL6x8Rz4xbP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:29:58 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4L3DPL6m8Sz4xY2; Wed, 18 May 2022 23:29:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::608;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4L3DPL4fj6z4xXS;
 Wed, 18 May 2022 23:29:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEnxSwWHu3zAGKRaNuM9Vjc05mtudEAIJcgskcm4w06UztMAVoIVppKZlvdJj8/wP4POJlCcU9vvPN3HinBvC53d1Ig9+A4xUkU5S2N1THDU4RXT0gD2Lws7bcQX4oOP501CK0WZN2q5I2WnKQP1QiSdJvEy+jssnLy+ERNb7CcANh7tv3gpINsmXuDzxojhkiRTUoKW0Gy1/LbgImYq8wDVW495H3e3PxNxrs01woTHWTL4o0JjFrIuV55WActJ3m60MofNoKVFY+z11SzAosdp0lkY2yC26SlwbQydYbta+CADiZaUhvozcU1pAJBdjMrfRK03ktw9GRqivTvY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edh367JZjXC+bPqpeVomz+eBw7jsN6DKDupXZRot4kg=;
 b=E15obsd/RHWyaAkJxSwheeiLN29N24S1WGWMetR8/MumH4as8JK6i8MQMc10Qck72GAWhy2Hl8xpocnhho5r5wzDrBEu64mAQqfXupjWV9za+wvbEJbmUghJuBxXaAvQP3Nn+RRqYeaheQ64fHLc8njX6kOXoaO7++cmigWv93XgiGnk/AHSHLsHeco6Ed8Is3iFmA4/LdOp2a/uHpUO06XLQpHNslv1AqDOAwEW5X6bEz+SeBKb5Lv0r1sBnc4RKfyV0ZvG1+CFUptWyL3YdEcBB2qKmq9hJ+4gWQb8C0w/nrGZ+O6zMWj1ON0pmxYc57m/gkqUPVDJU3EWYqzUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 13:29:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 13:29:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Paul Mackerras <paulus@ozlabs.org>, "linuxppc-dev@ozlabs.org"
 <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v2 0/6] KASAN support for 64-bit Book 3S powerpc
Thread-Topic: [PATCH v2 0/6] KASAN support for 64-bit Book 3S powerpc
Thread-Index: AQHYap904gOhqaRF40e8YeM3U9A5Bq0koXYA
Date: Wed, 18 May 2022 13:29:52 +0000
Message-ID: <003c7619-b0b1-8a15-da19-ad2ef0e7f708@csgroup.eu>
References: <YoTEb2BaH3MDkH+2@cleo>
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35e3875e-d160-47b6-8f98-08da38d27dc1
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs: <MR1P264MB21616E012D7F2EC8A0A9FFA7EDD19@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /o3/l0zYjJjrUNfdWS9GaQRHU2F0kxufLI0KjZHR/W6IBTiKm4f0eNiurQ6A8q712lUMgqhk5n7sjgcIEVOOlaxnNVuuAJ4rNXy62QgRFlQf+js5ePEg7s7S+zieYurelI9r3L15aSQEEq9Frhsov7iFadjE4z8bxi1Fz34u/Y3v0NeMkfPmAN4BaZ9ygkJiLX0MijHyqLw9WDtp+kx9YfpIwXvtoQSauUEwx7+AuI0gVU7IIpXhA7DENI70ob+nbSgblPPidNtFDdhfGH5+vq6myW8OIwHDboltONT77dA3mcAqWm5JcE8nAT1Nfx0xUbfTauBslTFvxpa0auN3eNsuT1iTSQvWgrrkzhDCRAu7A40z7AnE+OuxxEJdimkFP7HF+YBTPgOjBv8FmjyFhZTXK8UQkF9LxbT4e2THrksm6YCLoqYvqKtFmYMEepch2He8CgepNVxcTIws+ZmTcfXs5m1MBKJF4MAUSPLudHnBWSSvVLy72YHHp+WHF74LZO/rssQWpzOTKioiQCB1bhjtTVimEAYejYcQHhhwCT00FZAv9LLCk9MQv+GNq0fHJUN9Wa/1Zadi1mRGSv+ukQJjKVg+VCBn1Mn6xHn3niyZjt/aHhDnAK9ko3++bnVx194w+5FnPBHamJXz4SF/0RlJWg6s6IasICQH8xyhvxtVq6hU9VjJv9QqISzORVdGXetGiSXgwfN8uuvQuchwWga1e6FlIEASt8p2sBGT8f3fgXNfRkNBRl/xUA5tJsTm00rCnbnMJou2TW5l3btq2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(86362001)(83380400001)(8936002)(2906002)(26005)(31696002)(122000001)(6512007)(71200400001)(38070700005)(186003)(44832011)(6486002)(508600001)(76116006)(4326008)(66446008)(66946007)(2616005)(31686004)(64756008)(66476007)(66556008)(110136005)(36756003)(8676002)(91956017)(38100700002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWtUZS9mTWt4SlRjQ01raEFnalA3YktGNDJ0NzNTYUgzL2xlc0xRb1p2NHFj?=
 =?utf-8?B?S3B0dkFITmYwdm1wNFdleHVBZEVRZThESGZaOHlGRmlpRWlEZzROY2Y1bmNQ?=
 =?utf-8?B?blAvZGxYbWJIOTJ2SGRSYmVLejF1QThzaG0wMW1mYjNTeEl4U01wM0hxRlI3?=
 =?utf-8?B?YW5idFZKb0Y5RjVnUDBoVmVobVIyOUxEQW1Hd2NSREsvMXFibHhkN2k0TEhI?=
 =?utf-8?B?TkpjVTFRY3ZmSlVxcWg5NVpya09PZzJRMHhDMlZEQ0JBZHpyYlNHWURzRU14?=
 =?utf-8?B?cEJVQkpWcjBZWUJ1cE1Rd3ZIN2N1bTVSRDdJaGdXTmdiV0dEaWZuVkQ1bnI3?=
 =?utf-8?B?N0RpOWhOVFZzNzFRWGNGblQvQStSNXNWcnhucjIweE83cmdhUzRKMFM5dEdD?=
 =?utf-8?B?OThMMjRRU1V6SWZKR2pBMTNqQUp2U1p5SFJxUE16SFNCS2V3RUZ5YjZPbDRk?=
 =?utf-8?B?UE92YWU2UWFLRFgyNlp5Z09JVUhZbXh4bklyL1Q2SmppakJwenM1ZER4anpU?=
 =?utf-8?B?cmxobmZ2cXM3dEJQYkZTVk90WnJrNXZ1OHozcUNYSHN2N2xrcXBEbWdrWEs0?=
 =?utf-8?B?ZVgvYUd1MHBHU0JQdzFpelpBMVMxTmJGbHNCSU5McVpEbWEraWdOQ3FWZXV6?=
 =?utf-8?B?N0tYNGZpVnBCYTB2SkNvRi9Nbi9WbHgyZ2FNdXI5OFFKWU9TKzJEL1Qzb3ZQ?=
 =?utf-8?B?bTRVTkhmM0poUC9sZWxicU5FRXRkUWlDRU9ZS3VXcjBpeEFvMllqdmk4aTRU?=
 =?utf-8?B?d3NRN3B0eHNzWkxiSGduL0JHdDFnMkVvZ2xZS0tCWkNFRUh1YTJxRHJiZ3J2?=
 =?utf-8?B?bXE5UjFuL2g3cXFjdGttLzlhWnd4dGxhbFZLNTlXeGM1dzNKVDZDVkJWSFhw?=
 =?utf-8?B?SlhaVjVKbnpZdVovcm01T2FSVFpORnpjSzRoeU83K3hFVlNWL1pvd3RKd1lM?=
 =?utf-8?B?SCtlRks1R29ETzhubjVCNlFoeEI2ei8vWDV2S0hDNkVYUStGWXJGU3FvSFU1?=
 =?utf-8?B?cWlsbVh3THBuNGd5dDJVUlgxUU12dXEvNldjemJtRllyejhEWkF3VlVwekR1?=
 =?utf-8?B?b2ZBdzdRbmhBc3piaFozOHBmTUhsMEVNN2EwdFB2M0hvdVBwUFl6UnJmckFE?=
 =?utf-8?B?U0FnMU9LeGhFekJ4b1hjTEtNTml1TjVzOGtmTVJ3enNiTzlKaHNVeTNZSll6?=
 =?utf-8?B?NlF5M29JSE4xekRGenVMcC9LYnRCYUkwbzRLdDlSK0hrdVY2b0xFSEFkWVNX?=
 =?utf-8?B?ZDh6WWdnQnkwZGdubHV1MFFoK00raWhIWm10NnV0eUc4b0JFSC85ZW4vdkVQ?=
 =?utf-8?B?dWNJLzBXenpYU3Mzd1hmOXhCMWJEKzZHS3d4aDFPU2J2VUhXbDN5bUx1NXVk?=
 =?utf-8?B?N0RFaC9zUkRQVWE5b0tXN1NyZ2xRcTN2UXlvSW8zMjdZZ1ZpT3ZkR285OC90?=
 =?utf-8?B?ZExsb1NvVXFDVGJ4SUhyT1cybk5MbGtybFNJdENkYktMM0IvSW1QTi91bHpt?=
 =?utf-8?B?RXBtZUFKR1NUSkJqcTBaZENOMVlMVlB5Q2c1S0JjU2RTcEgyY21IU2swWFU1?=
 =?utf-8?B?RDBiSGF2RWQ3YW83UVRINFJmc2RqRkpxOGhQaEwzRjhPWGwxY0VFM2h5S2ZV?=
 =?utf-8?B?NXhkUGVWYUtrWVZEd1pMYzhYRStpMzA1bVFUZDZGaUNOTjFFZm84MGc5UFRN?=
 =?utf-8?B?YVdKenhGSnN4MFlMcG1EamJBTkd6SDRZL1oreHRWMnk2RXJkRWdJM1NKanZW?=
 =?utf-8?B?amRMREJtQjIvQjNWNkgxZ2JJaW5SOVFuUW9EZElxcHRXRzRYUUdjS2dXaWx3?=
 =?utf-8?B?a2dJbHJBUHZqNFh3SUt2WEMwWDQ2STVvU01Md0lLaUtMbmltc3l2clQwdEhu?=
 =?utf-8?B?RmhBMGhLSlduNDYveS9mRHFMSnZCMXJFaFNJYnJKaXQ4U2pkZUZzenlKUk1a?=
 =?utf-8?B?S3h6b1lRa2gxV29taTlnZmVoVjVTMjFTKzdtb3p3WE5xZ21wWUNVVWhrQ3Iz?=
 =?utf-8?B?bXUzb0IrNnB1R2U2eHFoZDNtVW5JengvVFNYcjd3L3JpZlJDdjdpbjVCaUth?=
 =?utf-8?B?dmZ3QWtTR1lOclBHMnZtQXdFQ3F1ZllZNEhJNEtaYXBRN0s0YzRxYzY1RkFJ?=
 =?utf-8?B?YXJ2WDRueU8ya3c3K3dqRVdBN2ZVOW9aTTlnUjNkWXVieU9CVXdWUUVYZEoz?=
 =?utf-8?B?WHhuMysyaHRLMWRoRlhYSzM3cm9qU1VKSWdBM0hYMjFNNk5QdE9TdUs0dFRp?=
 =?utf-8?B?cTRxWWlubWtOa2tPZzdSUG0xQnp1TnJ2cnNGODJNdGYrejE0eXpkUVlqZEo3?=
 =?utf-8?B?S1YzQUtZd3RCYjYzUGVBR0xyOUdYWEhqaHUrQk9hVVRxUnFrMFBabERNZXpu?=
 =?utf-8?Q?Ztc7VRR8fIgYVewJIdjW0pGoF73lfZPM2uc/P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDD20DCEB4336A46B04062A3CBC5A657@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e3875e-d160-47b6-8f98-08da38d27dc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 13:29:53.0002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+3WI11QLZlTKglor45Q+/b/nBKyliBS8MOkqPZffciA/U1guannLIITusbr+hn6NktNy4aZOhr+NiAm8FB3b/C3rrnbPZpq+BKPU2bdxAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2161
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTI6MDMsIFBhdWwgTWFja2VycmFzIGEgw6ljcml0wqA6DQo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVudHMgS0FTQU4gb24gNjQtYml0IFBPV0VSIHdpdGgg
cmFkaXggTU1VLA0KPiBzdWNoIGFzIFBPV0VSOSBvciBQT1dFUjEwLiAgRGFuaWVsIEF4dGVucyBw
b3N0ZWQgcHJldmlvdXMgdmVyc2lvbnMgb2YNCj4gdGhlc2UgcGF0Y2hlcywgYnV0IGlzIG5vIGxv
bmdlciB3b3JraW5nIG9uIEtBU0FOLCBhbmQgSSBoYXZlIGJlZW4NCj4gYXNrZWQgdG8gZ2V0IHRo
ZW0gcmVhZHkgZm9yIGluY2x1c2lvbi4NCj4gDQo+IEJlY2F1c2Ugb2YgdmFyaW91cyB0ZWNobmlj
YWwgZGlmZmljdWx0aWVzLCBtb3N0bHkgYXJvdW5kIHRoZSBuZWVkIHRvDQo+IGFsbG93IGZvciBj
b2RlIHRoYXQgcnVucyBpbiByZWFsIG1vZGUsIHdlIG9ubHkgc3VwcG9ydCAib3V0bGluZSIgbW9k
ZQ0KPiAoYXMgb3Bwb3NlZCB0byAiaW5saW5lIiBtb2RlKSwgd2hlcmUgdGhlIGNvbXBpbGVyIGFk
ZHMgYSBjYWxsIHRvDQo+IGEgY2hlY2tpbmcgcHJvY2VkdXJlIGJlZm9yZSBldmVyeSBzdG9yZSB0
byBtZW1vcnkuDQo+IA0KPiBUaGlzIHNlcmllcyBoYXMga25vd24gZGVmaWNpZW5jaWVzLCBzcGVj
aWZpY2FsbHkgdGhhdCB0aGUga2VybmVsIHdpbGwNCj4gY3Jhc2ggb24gYm9vdCBvbiBhIEhQVCBz
eXN0ZW0sIGFuZCB0aGF0IG91dC1vZi1ib3VuZHMgYWNjZXNzZXMgdG8NCj4gbW9kdWxlIGdsb2Jh
bCBkYXRhIGFyZSBub3QgY2F1Z2h0ICh3aGljaCBsZWFkcyB0byBvbmUgb2YgdGhlIEtBU0FODQo+
IHRlc3RzIGZhaWxpbmcpLg0KPiANCj4gdjI6IFNwbGl0IHRoZSBsYXJnZSBwYXRjaCAzLzMgb2Yg
dGhlIHByZXZpb3VzIHNlcmllcyBpbnRvIHRocmVlDQo+IHBhdGNoZXMgYW5kIGFkZHJlc3NlZCBy
ZXZpZXcgY29tbWVudHM7IHB1dCB0aGUgZ2VuZXJpYyBkb2N1bWVudGF0aW9uDQo+IGNoYW5nZXMg
aW4gYSBzZXBhcmF0ZSBwYXRjaCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXM7IHJlbW92ZWQgdGhl
IFJGQw0KPiB0YWcuDQo+IA0KPiBDb21tZW50cyB3ZWxjb21lLg0KDQpUaGUgc2VyaWVzIGxvb2tz
IGdvb2QgdG8gbWUuDQoNCk1heWJlIHBhdGNoIDMgc2hvdWxkIGdvIGFmdGVyIHBhdGNoZXMgNCBh
bmQgNSB3aGljaCBhcmUgcHJlcGFyYXRpb24gcGF0Y2hlcy4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0K
PiBQYXVsLg0KPiANCj4gICBEb2N1bWVudGF0aW9uL2Rldi10b29scy9rYXNhbi5yc3QgICAgICAg
ICAgICAgICAgICB8ICAgNyArLQ0KPiAgIERvY3VtZW50YXRpb24vcG93ZXJwYy9rYXNhbi50eHQg
ICAgICAgICAgICAgICAgICAgIHwgIDU4ICsrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstDQo+ICAgYXJjaC9w
b3dlcnBjL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0NCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2guaCAgICAgICAgICB8ICAg
NCArDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggICAg
ICAgfCAgIDMgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcmFkaXgu
aCAgICAgICAgIHwgIDEyICsrLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9pbnRlcnJ1
cHQuaCAgICAgICAgICAgICAgIHwgIDUyICsrKysrKysrLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2thc2FuLmggICAgICAgICAgICAgICAgICAgfCAgMjIgKysrKysNCj4gICBhcmNo
L3Bvd2VycGMva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArKysN
Cj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyMiArKy0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA2ICstDQo+ICAgYXJjaC9wb3dlcnBjL2tleGVjL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgIGFyY2gvcG93ZXJwYy9rdm0vTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCj4gICBhcmNoL3Bvd2VycGMvbGliL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICAgYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgIDkgKysNCj4gICBhcmNo
L3Bvd2VycGMvbW0va2FzYW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQ0K
PiAgIC4uLi9tbS9rYXNhbi97a2FzYW5faW5pdF8zMi5jID0+IGluaXRfMzIuY30gICAgICAgIHwg
ICAwDQo+ICAgYXJjaC9wb3dlcnBjL21tL2thc2FuL2luaXRfYm9vazNzXzY0LmMgICAgICAgICAg
ICAgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrDQo+ICAgYXJjaC9wb3dlcnBjL21tL3B0ZHVt
cC9wdGR1bXAuYyAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0NCj4gICBhcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSAgICAgICAgICAgICB8ICAgMSArDQo+ICAgYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm52L01ha2VmaWxlICAgICAgICAgICAgfCAgIDggKysNCj4g
ICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvc21wLmMgICAgICAgICAgICAgICB8ICAg
MiArLQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9NYWtlZmlsZSAgICAgICAg
ICAgIHwgICA2ICsrDQo+ICAgYXJjaC9wb3dlcnBjL3N5c2Rldi94aWNzL3hpY3MtY29tbW9uLmMg
ICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBhcmNoL3Bvd2VycGMvc3lzZGV2L3hpdmUvY29tbW9u
LmMgICAgICAgICAgICAgICAgICB8ICAgNCArLQ0KPiAgIDI2IGZpbGVzIGNoYW5nZWQsIDMyMCBp
bnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSk=
