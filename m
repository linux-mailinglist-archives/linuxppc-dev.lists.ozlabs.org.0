Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A86F5BF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 18:28:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBMnf5tChz3fHX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 02:28:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b/rojHwJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=b/rojHwJ;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBMmm6DSgz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 02:27:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcCo7oZQ2sqWr9+fLMrmo93//7MV+LBbudziFWRSRIMm9fdAdNBiZVeY7VoBAlLjLg7Jz36rVvI7Bvu3TDUfDROBMzEo1OyPJxIpJAfx2h6OuxtzCZvRSm4ihwYCdtOFOQpok1MoFIkbCyrV2CCAYQQ4VLxrjDT0PZgJFRpvTZKs3JOtYdrxoVKfD8BYt92q6JTFJ5NUbFGe/h+1v+dmwqG0qxQFao5GYNj1812x4sWfLSH5rmqIlDerD+jNQbIzlS/5mNvq9GK/NvbSCwC70u3B2tbV69Uvxhl3YqHFsNJw9IPUKOtezwNr5I7H0Hb+rnq1+mtdVo7EkqJhionFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQaM6GCWG6QpCi0aytTPn3GvQkZ7yXzzwqYFwo4/4JY=;
 b=ndzp0QF9WpRY+yftvPo48nRFjXRsegLDT6ayyIPNaa9Pk9bJLwgR94XeJkqDRBmh3VUiOhzmzuuOvreAFwPOlc2z6X1weuSofodflyV5j3a6A9QQKW/pffe9Dlx4ZaEQ5Nf0+TZi/pbcZizG0VzuPBKT7PnKRGpDIjjfFqXHDzZG16WVlLBicQNvXf+Euf78zh8b6bs39fDtTTYGPGpJWD36nvwifg/JP7KTAkG4l7T4OxxwC1/v1H2IXKR/IXcV05CRMCjFN9VOCAWwfxyfz0AwedDgWAYLytC+RWTjaSnAQBTd4lYQ1Z4YgjK3z8xAC1BAOv+XrPoe6+1xCDDr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQaM6GCWG6QpCi0aytTPn3GvQkZ7yXzzwqYFwo4/4JY=;
 b=b/rojHwJqjKLOlQHHTKEMHk/C2CoAaqUQLAFR6349tR+4moiuwwXURrqtgVP+CS0nsIqc9kkFQG2XNwLRW6HNri/f4xctqx/bOKKXiF2aLAG+k8NvDGFx1FtHtdyu2yOqveDARSnvx1uCMbveYA09CWQb+Xb/2tz19IRvGck1v4ABzLe9YA1my1hY9GKGGWL0zl/SFv7pGGEhkP3UujHNWpDbawBH4NzlTmCUS/Y8I1O4AmF1h9H0EDPHsUvG1QgoRp5Khd2YLiRjzMpg1MHHim6th3aqaHwg1Ul4rynMl2Wu2uh03sMNBgFY0ANY2b6TzugcGEHaWc/3L3BudWD+w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3325.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 16:27:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 16:27:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Michael Ellerman
	<mpe@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Rob
 Herring <robh@kernel.org>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Thread-Topic: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Thread-Index: AQHZfJ3uhjZJMcrhjkuYS0m/PUGJea9Gt7+AgAH74gCAAAtcgA==
Date: Wed, 3 May 2023 16:27:12 +0000
Message-ID: <df17df39-304b-d638-9aaa-6194b1ac4d47@csgroup.eu>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <87ednz6q0i.fsf@mail.lhotse>
 <3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de>
In-Reply-To: <3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3325:EE_
x-ms-office365-filtering-correlation-id: 8c73f34d-c841-4acd-5656-08db4bf3400a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4SMLQS5mX29sRHyVbC5Bb5wVc6Y2C0PI6RmZNNHl7o8fd/FsyQ98RPpCXrjTUpCbvgE2PFzY2Ogi0xBVpcaIIX2WcCi3DscVI+usOykzuBQP13RM6RNe4r2plaSWY+vzkDb1wiDaf8zA3GoYtNvcPiH//NRrGf3slRAsq/tZfLtSj8/BYGQDcUb2ifD8fvn0wI1DRYjUOQibGHqx/6H8aUDeP7Vk0st3pPvtOFxvWK2gpL5NxWLosf0WP/9CJ7ukhDSP4uKpLyRO4sGNDlaUrb14qck60lr0WUFngJD4xRR5uPxhsl1WglmtW4EYLuQ56ISumrDUQERZACJL38LvyqASSVcJW71Hz2TURZUFEVYo2z5js5AXFxj0VBptvAaI4Eb4nvUOJ4K8NbWtVFNuiXX9ccwKM3O76xtRO+yI8vTV531OBe2mbdrvxa5n1iJWyc41EERsdH9uffJAI8g3LN0gdX+JP3+cWtVeISpnF1o95OidqXBmyQFrVJkzGGHefKZsRYSt0d1V7g+Sx5qZF+MtYIsOWwgpxJllJEQIB2yLE21mEHRUltpPXE8/UySEnrJ0i0L3EAlx3RxnBgnZ84upryLUKueS24rzsAlNeja01KIUpFsWOMSs+gIt3f9SsAIrslo4fhwJ5CFp1yVNxe6JB88riPVSjZh/ZIGcur+OhgXmzNjEC06HLqo64yp1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(136003)(376002)(39850400004)(451199021)(36756003)(86362001)(31696002)(91956017)(110136005)(54906003)(316002)(66556008)(66476007)(66446008)(64756008)(4326008)(66946007)(6486002)(76116006)(71200400001)(478600001)(41300700001)(5660300002)(8676002)(8936002)(2906002)(15650500001)(44832011)(2616005)(38070700005)(38100700002)(122000001)(186003)(53546011)(26005)(6506007)(6512007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M1RlSlk4MlVlcWN3SGtNbG5XdUo1MGRYTkI1d3pnYzUxblprc2EySHhhemRx?=
 =?utf-8?B?dlIwamgxY1I2WHRqZUduSzhDbDNPSldTcXpiaklYWWtkaWlxK3FrRDBsQkFB?=
 =?utf-8?B?ak1sajkzNk4yY3BVYy9sZVhnYSttRmdTVCtrMFVScURLVmhvUng5SzBZRGVh?=
 =?utf-8?B?MXJ3OGZQWEh5cVdxVFJCOGJmREpUN3RFTm5KZFZtOUREcytaVk85YmJPZitw?=
 =?utf-8?B?V1U3VlVFTjg3SVRkZkJXeG1nUm45VHZzU2lmUzlLQysvWjh3QlpVU05jUEI5?=
 =?utf-8?B?UXdsYktta3FvbEJlQnhNTG9nOERXQTZKUmZmTTkvU0tMVG9CTTNmMytGSGJq?=
 =?utf-8?B?MEh3aHRzQ2JKUWFpcWNaR1poY2FJUWVsRExjOXBMUGlicUpFMFY2SHpkbjB4?=
 =?utf-8?B?RzdTN1VWTVJQWkUzSUFKYzI3L3RGTjQ4aGR4U09pd3RJa3psck4zVHlud2pX?=
 =?utf-8?B?SnIveml0cGVXeVZ0SmZYL24vQlp0YlJUcUNLYnZEYTlYTHcxZ0IwaTBnemNa?=
 =?utf-8?B?ZGJrL0J6K1lQN2JmczBuUkZiSXdPQ2lNSjRrNnZRc253YXB0QmNGbUZ4L3po?=
 =?utf-8?B?V1pWK2pWQTNScklwc096YU94d0hXQnEzcW1WVjVxc2hZRFNCR0VHcXJuaDFP?=
 =?utf-8?B?WVNOVU9QbUVQdHlqdlFJWjZ3Qlp1dGNvOVZpdWN0MjErYWRwT3U5MmNUSkNL?=
 =?utf-8?B?dlpLVzhyclVDS1cxVk5QUkpjSWNjSWdEMHJPcTNXVmZqYkVqMEhSV1kzRTdo?=
 =?utf-8?B?OTNMZjNnSkt4VHFOcllaTWFsdkFqcDhIMWNJU3ZyMzh5K3Z4L2lleGpOTFJy?=
 =?utf-8?B?NDRlYTcwdXFKVEtGcXpKcXBsZ0ZsR2xZbFh2K2J0QWtzM2FuajN5SlEvKzZk?=
 =?utf-8?B?ZW4yRzljM1FYTEZ0VG11MXdvRlZtS1gvMzBNTXNNRTBFSjdpdS9tMi9lbjNm?=
 =?utf-8?B?bjYwSEQrcXlYckRYVWRhTW5GUHZYU1hiZ2JmZWpxQ0I4bDdIRmo3RFM4M2pl?=
 =?utf-8?B?bW5Sb1pLOHkrYTdWMVlNK0dwSFNURUVISGhsK09SdjV3aEhRakFBNjNTT21K?=
 =?utf-8?B?dTBMZ2lKRkIydHJMMkhyUWVpL3ZOLzF3NmhFZ1NJSDA3SzhhOE5DUExMTG1P?=
 =?utf-8?B?Y0xvZU9vYWhaMTR0N1NVWis0UXVDY0ZoeHlES29pMFBOM1RxUE5rSXQ5aTIx?=
 =?utf-8?B?eHg1SHZObDNFTGROYnFpVXpVVUNFZmhNKzhxNUQvWk0zeCtmZXl4N2pBOURI?=
 =?utf-8?B?aWJheFhxTVg5Z2k2aXhlOHpXMDNEL00zNmhVWDNjcWtyRTF3NGN6N2ovZkJh?=
 =?utf-8?B?M1JVK043Wm9TcmlNWUhJZ0w2eW5HMm9Jb1M5UXhoOG5vcCthRVRDd0NlWVBW?=
 =?utf-8?B?MzlPTTlZMllhQzNqdkZrR1pVNCtlaUJiN2hFZUo3eFc2WURyVDlKcWJ3NnNP?=
 =?utf-8?B?RzVJM3dwMmE0RW42ZjlQakRDd0piTnYrQ1VucnJRM3o3Ni91ekNpYlRwZW1I?=
 =?utf-8?B?d21NZlZTZ3lQbHcvVEViUTdRWUo0Ly9aeFNzeWlXclNCRTV5VWpyNmFWWGJk?=
 =?utf-8?B?a3ZadEtwdis0dzVseGlFMUpDdEdsd0JROXNPd0pMVFhwQU4wMEJmQXRKcTdl?=
 =?utf-8?B?aFFXVjE2Z1hnbG5wb1B1d1VpR2xSNTQxU2pqazR6RHNVWTVxTWN5d3plSTM5?=
 =?utf-8?B?TXVyazd0bWlCRVNaRCt2TUIvZEtwV1hKZEVXdFZ1MzNKd09lVm82NGRLeVRV?=
 =?utf-8?B?S2Q3L0FJcERJb0NXRlBSYnJQNDhpK2MzcE9GSHVoTDdTQVVkY2FsdDJqVFJ4?=
 =?utf-8?B?UUJJWHRnUWpTOTZaZXZFVWtGYi9SQ3pnVXN0R0luMDgxNnhOS0tIQm5jNzI3?=
 =?utf-8?B?ZWsvZldRYm5tVlhIMkJHZDArNHVQZDMyOXcyVXN1aWlqM1dNZm12a3NmUUgr?=
 =?utf-8?B?d3doY3loUXg5eC9QVEVyOEY5NmYxanZWbmR6aVNGcFJUcUF1b3p4RG55andJ?=
 =?utf-8?B?d1lFVkwwKzRQdkcwT2RhQ0FScjZWV2RuUkdIZzVad3VQL0QycFFmNEVseHUz?=
 =?utf-8?B?eWFxK1lHbXlCNkY0S2Y0TFl5NGQvMjAxQ3VEZEtKZVlGVTU3UlU3N0ZVaEJC?=
 =?utf-8?Q?Z/A+0OR5f/pKq+g4INcHQanfg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD096DEA1D24784FBF62B8A7C965D640@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c73f34d-c841-4acd-5656-08db4bf3400a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 16:27:12.6376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fRYiSBdqspIDNRlKzBfWl91JlTXcdbqNtlHd++VwNc3TmR5PMIoZWBoq4jF5U1jMgWRIegIl4CcPa6riMmJ0F8FbknDvwPlsEPKXn5BPPzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3325
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

K1JvYiBhcyBoZSdzIHRoZSBjb21taXQncyBBdXRob3IuDQoNCkxlIDAzLzA1LzIwMjMgw6AgMTc6
NDYsIENocmlzdGlhbiBaaWdvdHpreSBhIMOpY3JpdMKgOg0KPiBPbiAwMiBNYXkgMjAyMyBhdCAx
MToyOCBhbSwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+IENocmlzdGlhbiBaaWdvdHpreSA8
Y2h6aWdvdHpreUB4ZW5vc29mdC5kZT4gd3JpdGVzOg0KPj4+IEhlbGxvLA0KPj4+DQo+Pj4gT3Vy
IFBBU0VNSSBOZW1vIGJvYXJkIFsxXSBkb2Vzbid0IGJvb3Qgd2l0aCB0aGUgUG93ZXJQQyB1cGRh
dGVzIDYuNC0xIA0KPj4+IFsyXS4NCj4+Pg0KPj4+IFRoZSBrZXJuZWwgaGFuZ3MgcmlnaHQgYWZ0
ZXIgdGhlIGJvb3RpbmcgTGludXggdmlhIF9fc3RhcnQoKSBADQo+Pj4gMHgwMDAwMDAwMDAwMDAw
MDAwIC4uLg0KPj4+DQo+Pj4gSSB3YXMgYWJsZSB0byByZXZlcnQgdGhlIFBvd2VyUEMgdXBkYXRl
cyA2LjQtMSBbMl0gd2l0aCB0aGUgZm9sbG93aW5nDQo+Pj4gY29tbWFuZDogZ2l0IHJldmVydCA3
MGNjMWI1MzA3ZThlZTMwNzZmZGYyZWNiZWI4OWViOTczYWEwZmY3IC1tIDENCj4+Pg0KPj4+IEFm
dGVyIGEgcmUtY29tcGlsaW5nLCB0aGUga2VybmVsIGJvb3RzIHdpdGhvdXQgYW55IHByb2JsZW1z
IHdpdGhvdXQgdGhlDQo+Pj4gUG93ZXJQQyB1cGRhdGVzIDYuNC0xIFsyXS4NCj4+Pg0KPj4+IENv
dWxkIHlvdSBwbGVhc2UgZXhwbGFpbiBtZSwgd2hhdCB5b3UgaGF2ZSBkb25lIGluIHRoZSBib290
IGFyZWE/DQo+PiBUaGVyZSdzIGEgZmV3IHBvc3NpYmlsaXRpZXMsIGJ1dCBub3RoaW5nIG9idmlv
dXMuDQo+Pg0KPj4gVG8gYmVnaW4gd2l0aCBjYW4geW91IHBsZWFzZSB0ZXN0IHRoZSBmb2xsb3dp
bmcgY29tbWl0cz8NCj4+DQo+PiA3N2U2OWVlN2NlMDcNCj4+IGU0YWIwOGJlNWI0OQ0KPj4gZWVh
YzhlZGUxNzU1DQo+Pg0KPj4gY2hlZXJzDQo+IGdpdCByZXZlcnQgZTRhYjA4YmU1YjQ5MDJlNWIz
NTBiMGUxZTFhM2MyNWViMjFkNzZkNA0KPiANCj4gW21hc3RlciAwMDg2ZTJjYmJlYzBdIFJldmVy
dCAicG93ZXJwYy9pc2EtYnJpZGdlOiBSZW1vdmUgb3BlbiBjb2RlZCANCj4gInJhbmdlcyIgcGFy
c2luZyINCj4gIMKgMSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlv
bnMoLSkNCj4gDQo+IEFmdGVyIGEgcmVjb21waWxpbmcgaXQgYm9vdHMgd2l0aG91dCBhbnkgcHJv
YmxlbXMuDQo+IA0KPiBlNGFiMDhiZTViNDkgLS0gcG93ZXJwYy9pc2EtYnJpZGdlOiBSZW1vdmUg
b3BlbiBjb2RlZCAicmFuZ2VzIiBwYXJzaW5nIA0KPiBpcyB0aGUgYmFkIGNvbW1pdC4NCj4gDQo+
IFRoYW5rcw0K
