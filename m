Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF661645B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 15:04:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2TCH5N1lz3cMp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:04:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wMwMfQ2R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wMwMfQ2R;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2TBJ6J6lz3c7G
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 01:03:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCSp9WTvYXbFFfFG/hnw1dCS/f9owBQVyYYiZBarAzJg/+r7adyTVXBaxYjGkKrEN4BwTxcdUCiq1ar5Eyxw1NNpPf2pwDlwBcoVl23dnwcxascr84hUtwtapJcLRiEaIJies3BI1KBkGOLrX1lZWvUWJE0meLtXsYmrmZ15Afs7lwdbuyzmLpZ/etUe1SQtN8v71ziOFkmbmeQUlgz4vVnuFKHbI1K5rjGP/m7kzTGAcRJrhmA891Kh22NuFC5Jp2mgNa+CNUMLDsdnGRSyM3fFfyY/R4B4OadWDVGWF5ZX++Se8mjm6s0gK8kSSYzlegumfakPQY8Ocnub5jzgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYMkEVf3wwAo/5KG3dti7ZmuG4MOM40W9G6npnuhrus=;
 b=jFHKRUYz8o/c9fRG7XE84ZSnBs1Q/frYhtMGeUJaXAO7MOSfbR+yELinXRJfchtfp0tZp7+X/xiqHJWSUT88XF1M0PZIT/WZIayFftvXoEqsYj9Kv+2RwAEvCbzeuxxaZMakdNUdL8BcgtXvq1g8qEI7Ej/cyMehuR9km3/aWW8zBfJ4v1xYsDJt1l4FEJnZJ5KwyQ+tSR5+QLR/n397Y18xQ0wg2oglNCCVvWFF3dgrTdXQzba32lQ2mI0XcAFCkHTcXwriNMC9sDc/2K12wp1L6OUKHeQcJolc1kGQ7tZVZfJdGuEeMrYZjJYx1wyQF3v61mvwI8G63BEzXWaMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYMkEVf3wwAo/5KG3dti7ZmuG4MOM40W9G6npnuhrus=;
 b=wMwMfQ2RacgUWiD9wtZ27aLc81+otuK0tGqfcI0BHVKhe/H/8v/iHJPCiz+7daMzqFIZ46/i0gdV9fbol0n+VPDFXQ9GtrXYX2CD6cApl1F97PJaydJsfgi39LnIbbpBcsRfeqV5TGaDu5rKk545VkAAHKb2TWxZmv++pLoASMuOfNgruKEkwMwtyOr8JeU0xxwDcUxWdll7GD/1ts/mcFgeAFH0tXRusUGbrP8UJzAcSEatJEs6zdD1kGHGALzSIwuC/VYMQsyF/IPdWG9T48nTB4CJP5kO1qR7abl8LJU+/TyLwJcBFQsghoxQ8oKzCXJ7GGVtbPCJ2hQboQLqTg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3304.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:121::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 14:03:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 14:03:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Bo Liu <liubo03@inspur.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "Jason@zx2c4.com" <Jason@zx2c4.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc: Fix some kernel-doc warnings
Thread-Topic: [PATCH] powerpc: Fix some kernel-doc warnings
Thread-Index: AQHY7ZT+qFG4grUMT02MvCsYTi1f2q4rrHaA
Date: Wed, 2 Nov 2022 14:03:00 +0000
Message-ID: <74b42b01-fb23-4cd6-d893-1fa7c7bd1e66@csgroup.eu>
References: <20221101015452.3216-1-liubo03@inspur.com>
In-Reply-To: <20221101015452.3216-1-liubo03@inspur.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3304:EE_
x-ms-office365-filtering-correlation-id: aa3a354f-d4e5-4058-e47e-08dabcdaf3f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8kSd4a5eXVvFvGBlE6s43XBdnnNscenHwi0VL6fjYh4T26hETuxN2dxLdjUWqaTkFpri9ZjFPzRF0Wy5e4GBZ+roeish2SRhD8J7erzTPMh6et68xOAeaN0lxpgftr1ZkMAgzsoLApFcigd5J+EEbosjIi9c376FtmbrJGkxs0ackX0SRTLr54CIvkOSleK74fXkuWxyq4KtMzBaA0muw/hcEJxqKRmP30d62wtgnpTaOE6XqeW7FI9I2kqaDWDkK8dfclHbfqo0hGBw46LKQi058FRwCm0Bo1FbxN03dULI7kXJs3QE+02Xtasro8FcZfmJhCH1l1uXvZp3gYzQqRqZpInWtXBP+C2U0RntaMluFWQQDN4I/zktAAR/5qBGWgcs4aMR16Afb6lK3OIDWzcbqiNwwlu5xdxPYJIzqDzW9U1t2Gf0nnRADeEEHZBTH8jnD8e+ZTTIv5GQjZ5YxWY8xYKEGblzune5nXhAAn+HmRruTWAbOlqF7jae65htTU7ahpvEjlvLWEz0JQIPEAB0AtDwQELyKoryJi3O6LT87it9Lv3GxGVRFXpXvzqv6d8+7RlX73Gf5BdlHwwt24V7JKVQuFbTmITDek+IQjo1KDhcaxTLUPE18Fzl3MvnCaFiPC8Xui8buU9dp8P5qyucmFsXyBGVaA8gwenrMW3XIqCDIevANbO3fov6yPvOPvSUHkvCOeM/L2DwlnpPMDQX9No+Uu28zcfPXRrbU+irFKmmvJOez3bcDDHkZ9XDUIXKbjdCwzFuKrFdbzn4MpzgKMpPLUqlAhy2fniBAQzGUiMYBMqsLw90j81jP9PDAC5FxqvMR6U2DUaNNs8gfg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(451199015)(36756003)(38070700005)(122000001)(86362001)(38100700002)(44832011)(71200400001)(31696002)(6486002)(966005)(2906002)(66476007)(8676002)(54906003)(6506007)(5660300002)(76116006)(91956017)(478600001)(66446008)(8936002)(66556008)(110136005)(4326008)(26005)(2616005)(186003)(64756008)(6512007)(66946007)(316002)(41300700001)(31686004)(83380400001)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eWlxZlVkN1ozMG1oQjBha0laZ2cwSjlmVDlESzJsbU92N0NuUmoyRDcvWjBD?=
 =?utf-8?B?ZG1JL293MytLOHlkUW5CU3NEY2E0eXNwSEZxOExmVkNFL3U3ZlBLN3dGUEln?=
 =?utf-8?B?allGNEoyNEtUQk4vWnBnbGtlL1lXQ2VnZ0txbTMrMW1hVWVNeXhvWVZPUm1l?=
 =?utf-8?B?NXhZUWtycUd0TFRjVFk3WHhtdlI2MEswcncrZFdzRU1MUGg4K21mdUJ6bG5T?=
 =?utf-8?B?M0pkK0ZmaEV1YktEbFRWNVg2OU44RzBNaENmWE9mTElDZk9VMUhjRW1yZml1?=
 =?utf-8?B?N0pkZC91RXl0c2lzMU02Z2w2N1pTbWRKTHkzQy8rT2JUdDRmejMreC9OMGlL?=
 =?utf-8?B?Y0JPQ2Y4dGF3SDRtK0hKZEh6UDdEd25kN1pOWjZrQUlqVEJ2aytqenBsZis3?=
 =?utf-8?B?VlRPTEljU04yZ0xvbkFWR3NIK3BiWnJVU2R1aXowUjFiZmN4ZWdybVdsTE1Z?=
 =?utf-8?B?dHZtZGVVWjBSRXQvNkVjK2R2ckp6bEpuMlZhZ3pqbmJJR3RmdFRUVkV1azhm?=
 =?utf-8?B?aWNwT0VxcTF3RExXME9RRXBLbnErOEN0ZmdSbGdoVmdId2dmSVUydENVeG1a?=
 =?utf-8?B?UFplUXJuRFdkbzFhdVc5T2lXQVdnRWkxVDZBcGtDcXhqMHRqdmp2VVk2bXNT?=
 =?utf-8?B?cUl5a0t5elJIQ2xnQzRoMWh2NExhUmVySkRJYUxEUWwydzdBazQxdDBWWHRU?=
 =?utf-8?B?YlF4WFBnQ1RwVXQ3M3dmclRsWnNCay9oQm8xSWJQYXMrWUhrSFEzQnMzakZF?=
 =?utf-8?B?VWV6WW9mTVdaTE1RQlFkd3hvRncwK1psNTJyenV1RldzZFIrUm55OGMrSXpu?=
 =?utf-8?B?UGdGMlJnMDlvcnZpdFZrcHFLTmkwVGRaR0ZRcnNHczZlMXFiZEQ0OEVPVytC?=
 =?utf-8?B?Q0R1UUVKNzR2L1c3NUZSWGVreGJiVVhvdFlUbXFCYUhlNFRaNEZwRHFDd2NZ?=
 =?utf-8?B?SFhZNklONlV1M2grN215Zm9Dcit4WmtuMkFVUXVNaFZzYkhjbktSL0MxaTli?=
 =?utf-8?B?RkRRUERqalhDTjdIblBpZVE1NVQyNDJid0lOSGJKa1VZdlhLVTJVaExtT2dK?=
 =?utf-8?B?SFo3UXB5bUtzRWdJUS9rN2hYNzVGNkVQT0k0dTUzdFVlbkExVDV5aElwLzQ3?=
 =?utf-8?B?TkIvS21JQ1k2T3FpeUt2VDVqeGxlVzEzaU0vT0dreVV1WE5BcGZDOUc0NHFu?=
 =?utf-8?B?d0JHRjE5S25YWXFjRlkvZjNPR3N4YVBmU2QwNm9CZEVqQVFhSGplQkV1WUZs?=
 =?utf-8?B?dlVabm13VWNzc2llQTB0cU1OdklIeERtY3h5dDJTeDNnM1hZYXRxdEdkM09E?=
 =?utf-8?B?VVVDeW5QYlJFRkdsWkw3OFBGT0lpalF5S0tiUnBHK05wWUlKbGg1SWFHVlBV?=
 =?utf-8?B?VURwRmozMGMzQVQvditLeXQ0UURwM1NCRVJrenRyR1ZBMXJ6OXREeWxvRWRS?=
 =?utf-8?B?SWkzZCtSS1JHcmNYS0FhdHJBeU5WeGVaYVd1ZFUzOTRacElhZ29ZQm92bmZM?=
 =?utf-8?B?S2lPT3kwR3NNcFQzTFNxd0VVT05sc0lyYkRwRFJlajBQK29QWHZGVVAyUVhU?=
 =?utf-8?B?blZJSHhtYVo1Mlh5VnVSMDFjdTFreHMwN2F4RWd1ZjIzVVJDdXVrOUFHcWxV?=
 =?utf-8?B?T3Zic29maWpWK2o2T3FKZk96NU5lS24vb3BGNU5aelNEa0Jmd1FtY3VPRVJt?=
 =?utf-8?B?c1dQUGEva1QxREN1dml6N3J6czBkbGEwQnI0S0JOUUNHQXNFT1RpclNHclBY?=
 =?utf-8?B?YloxMWRqZVpmVTFmTjVPTDJiVVEwZDRJa1NpVlFiVk9YZUwrbXJjQzgvMFQv?=
 =?utf-8?B?UnRsTUYzdnBBM2VEVTByVlM1d3JGV1VWbDEyZlN6bHhkM0FCRFBpZHBaWElX?=
 =?utf-8?B?eVYrckNlTVhKRlY4Tlp5WUd3RDlNRno4ZmNmZDM0ajBkRm1CdlMyMjd6aGRw?=
 =?utf-8?B?aDBBcjhQRk5PUXBtTjlMQ3U0ckRvRTJQZW0yYWxJOWlQSmsrTjNuUnRVQ2NS?=
 =?utf-8?B?bjBDU05uWlFDNDg1cit1V2FUMnNQbGdHajk2aEpNbXhlSi8zZStBbG56QUJj?=
 =?utf-8?B?RHUzQjl3b1VobHZHai9aYVRic3Z5U041R1Y1NElCL0FucmFSeXBZd25xRk0z?=
 =?utf-8?B?d2crWW1Nck5HY0tlNFVKSk13aFZ0RHpFN24rUE1zc3VkWENzeU1ORnR1NFk4?=
 =?utf-8?Q?bWheNzMnAHqIt64P5qKMhfk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F298595271A7B4B8171F7EACC186390@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3a354f-d4e5-4058-e47e-08dabcdaf3f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 14:03:00.7748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oDKgANm4RWrzEpV55zbLnLr5xxUkdAxREDJ9gTUIlf2t3cS0gfgBwIIa1OroM4fB0JodkxH4GDDHPEdKKebl1+rB+00oEpGBbD3kILIW03I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3304
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

DQoNCkxlIDAxLzExLzIwMjIgw6AgMDI6NTQsIEJvIExpdSBhIMOpY3JpdMKgOg0KPiBbVm91cyBu
ZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBsaXVibzAzQGluc3B1ci5jb20u
IETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0dHBzOi8vYWthLm1z
L0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBUaGUgY3VycmVudCBjb2Rl
IHByb3Zva2VzIHNvbWUga2VybmVsLWRvYyB3YXJuaW5nczoNCj4gICAgICAgICAgYXJjaC9wb3dl
cnBjL2tlcm5lbC9wcm9jZXNzLmM6MTYwNjogd2FybmluZzogVGhpcyBjb21tZW50IHN0YXJ0cyB3
aXRoICcvKionLCBidXQgaXNuJ3QgYSBrZXJuZWwtZG9jIGNvbW1lbnQuIFJlZmVyIERvY3VtZW50
YXRpb24vZG9jLWd1aWRlL2tlcm5lbC1kb2MucnN0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBM
aXUgPGxpdWJvMDNAaW5zcHVyLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL3Byb2Nlc3MuYyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jDQo+IGluZGV4IGZjZjYw
NDM3MGM2Ni4uMmU3ODIzMmIxZmM5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVs
L3Byb2Nlc3MuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBAQCAt
MTYwMiw3ICsxNjAyLDcgQEAgdm9pZCBhcmNoX3NldHVwX25ld19leGVjKHZvaWQpDQo+ICAgfQ0K
PiANCj4gICAjaWZkZWYgQ09ORklHX1BQQzY0DQo+IC0vKioNCj4gKy8qDQo+ICAgICogQXNzaWdu
IGEgVElEUiAodGhyZWFkIElEKSBmb3IgdGFzayBAdCBhbmQgc2V0IGl0IGluIHRoZSB0aHJlYWQN
Cj4gICAgKiBzdHJ1Y3R1cmUuIEZvciBub3csIHdlIG9ubHkgc3VwcG9ydCBzZXR0aW5nIFRJRFIg
Zm9yICdjdXJyZW50JyB0YXNrLg0KPiAgICAqDQo+IC0tDQo+IDIuMjcuMA0KPiA=
