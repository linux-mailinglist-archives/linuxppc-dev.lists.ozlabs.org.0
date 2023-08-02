Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E376CF5D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 15:59:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GeAPuTiw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGD9g3ZZgz2ygw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 23:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GeAPuTiw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::609; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGD8k5NmVz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 23:58:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8uL/HQU5iQTV3ED9OxcL8esbosSwAdo0hQ2QdqatyKeAzA2l6cpWTHqY9jhc+k3c50n5g0Os0HBvYTqoOozeE5v4neXzlVsIXKIeUjzuYdqdWw1k89JTfseApnTFVnlzAaNXHbWIDEUb4HwCiqaM8h85Uh0nNmHDaeMIYvb7q8Akf7AGylqC1/4/CHH5qcZQvjEaZaTbws/iGrC7Iz11Bk3btomfzOg3qAebTyxBP4J4uDnK3GUMAAH+YWuvUzb1JzpSOmY60HS6UCvrf1HdyAw8nnnRdZglwAeVDsCpgpXP4RjfzlYtJjynyWinxgEkcQDdJ6+N5kCWIzN5jfSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUzj6dMHLYAUejqHMXE7F9X/trSvjIqD+l2YNv3poKE=;
 b=jdxTlVlkH30OQEveZyjNK7AL40qqg3Qo3FsOox9oYRfwTCDOcFb/vsFrFprTIE/itLbrY0CYOGW1HDL2Ah+s2yKwmcGjCPLTsjdETT9NxI2Vugdv3hFmjHF0Km+77sNFrI8ilMNgFfiLAOj5v2H4L2iAsBAAJQEoZBlRF4/qtKxCaQ25obAXkuQHqVmUBI07uPa47i1pCVGTWOgzzFImia7Qksbx/XzTxGr6SuyiRXzDYnqkOf0DnrDFgIX8ayHaegM2RgTUicJjJkiUdhauEC9HYMbmNcKeQ3Nq7pw5hamT+33pL8XKTKG0Nq7rsFTyU9zN+42BWgzB+1VkVkhSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUzj6dMHLYAUejqHMXE7F9X/trSvjIqD+l2YNv3poKE=;
 b=GeAPuTiwET7I9iLxNDNp9MymvjmkbYVStPjorvaC9XaEP/ck0wBDoCw+27SFNSvneVIhyyfYM3SBKmrNGfNEitoUrZRGq0L27Id7XVp0jNILyi1CGXgZ6nMFp4LNqgbBCTfQ7OxRcHG59N3gO9qlplah8xDdxm/FM3r5jjlvdyEJmnwDVkFxhG5u4OG9CGYfyDFanArMAlFgw+NsSZTs1zSp84Qub7tPjrK5sc5VlCoEEMVz0FawxKy7V0zIXhSvsDmUBgdcpfzbrd/XAKL8lwo/NCszyF4OlyaNa2wyzON/LmMOrR0oblTbZbed4Z/jv2mqNqwGKeWbnnCyPsFS5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3097.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 13:58:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 13:58:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yuan Tan <tanyuan@tinylab.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: pmac32: enable serial options by default in
 defconfig
Thread-Topic: [PATCH] powerpc: pmac32: enable serial options by default in
 defconfig
Thread-Index: AQHZxUcTwtGCSCkO9ESDJFaxstbrdK/XCCyA
Date: Wed, 2 Aug 2023 13:58:07 +0000
Message-ID: <88334e42-a3c2-dab5-fdcb-91305d672e5b@csgroup.eu>
References:  <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
In-Reply-To:  <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3097:EE_
x-ms-office365-filtering-correlation-id: f2a050c7-6169-4f4d-5078-08db93608014
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Oex3Ac9vzIGhDsu+racPMOM2ZdcqFDpuzeeAdpvrhz4RKd0qXbCKWvW9g19ImJr2LUcSaam3n9ivb+MWCc4VryPPRpKOyQqLOOUII4uxFhCzG/8weuKc/YQDZXmJxM2I897ofNk96GRXs2o0JOgOuVuhv6PK3U5twi2CvbZmmOa5K7Srb9YuAL4w2GhOsBh6PmgQY4Lrs8RtS98wXcMVGY9EcEdUq5mylkLnNSmm+OaX01gJxSOvOc5GquCNypZgZ1RXQvPoFT0Ax3v7x/ulPKfGTJOBM1Xd3k29rYhCz+M5yBWLtryF4pGQh9IkEANDJvdPgZuLWrwmOgOWHG5Jkp0Q4HShHw6zAUH/6RxhyoVYi7Y3HrYHxj39Gxef/etPw1p64YzF+W/FFzia1RqfuaOBKCyGbLAv1yDIiv2DWhq6TyZ8UmN/4uQXG43rT1goOLxTJliMRGQSYRb1TjY+xg3JYGcs1DrpTMQXF+1UnokYF9SszW61l3DzPI4/3SNW6Juz69mc+rgTLtjOMdaGUG85VvA1cQes+u5HYcjzmykctwmJrKRpiE9idIQSrUT7PZJzBW1eZtvfzFaFK+0P0G3aijHjyNScAFjNXG+uIjczFyUhK/GC+aCH/Kguo141iA6H+nJGNCJykQnLMDHRdpWYiA85IWCGEKJxk/nsqENmhGU5al70hplmHt4ojvY1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(451199021)(478600001)(86362001)(31696002)(6512007)(966005)(36756003)(71200400001)(6486002)(316002)(8676002)(8936002)(41300700001)(5660300002)(31686004)(4326008)(44832011)(66446008)(66556008)(66476007)(64756008)(83380400001)(110136005)(54906003)(76116006)(2906002)(38100700002)(66574015)(91956017)(66946007)(26005)(38070700005)(122000001)(2616005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Qk44UW54VjVSY3pIVXV6bzI3ekpRcGxEbXVxR3JDSTZvK3NoajIvcUhzZ3NC?=
 =?utf-8?B?Ympld0h4MStoYStlcFBqUGFXcVFNSFI1aWdWQkxLLzducjUwV3JWc1lUZDNU?=
 =?utf-8?B?cHRVa2ZEcCtheHZNamxtUytsYUZjU2dxWVRycWxQbXNySDBRNnZLTE0rckZV?=
 =?utf-8?B?d05SMGNtWUYxaW14bVUrQ1pjQVR2OHpZTnBoZmEzYTBsQVNpTkxOcFdzc1NV?=
 =?utf-8?B?TW8vVmhGS3gxR1NBWFY1V0Z0eFhCb2tHYjdQNFdkWXZaeVc3NzlxU2pnMGNk?=
 =?utf-8?B?N0puQ0VkYnloczZXbERybVFUenNrNkhHTU85QmxWeXczMW5sbCtrcm1NWEhP?=
 =?utf-8?B?eis4cExUYUgyVjkrRCtZWE05TSt0MFNuZW9tWGphaWdyb2pxWkVXMXk2MXEx?=
 =?utf-8?B?R01mLzU2dmdkVHJ6Zk0zelcxTWYycGZxcmgvUnVGNDlVaXplc2NpWWhDaURz?=
 =?utf-8?B?aWVuaUJEQmVDTGE3elhmbW1xaTdtSGUrZTNjQ2hmMERTT3dJTXBsbG9TYm1x?=
 =?utf-8?B?bk5nTmdaS1lZMUF0aFI5TGxPMVBzeHAvT3YvN3AwTkJGZXZaM1VGclE3c1JW?=
 =?utf-8?B?OGpaUzY0R1hyTm1rSnVkdVA5Nm5wYmVhZUNHbWNDYWJLbzJSbTVKcjJNSlhW?=
 =?utf-8?B?d3lsOTY4TDlLM0RXSXk4eVdCZEFvU2xQdmVHYk5WaEtsNVY4SzhRSkhXcytW?=
 =?utf-8?B?SUlvYXY4REFJMnM4SldISWFoOHArN1hCZGRSQ0pYeEVXZ0xDRVNiWmo0SFpN?=
 =?utf-8?B?V1hsS1JCSkpDWUs3RTVzMi9VaTljWTIvaWsvTzgwdFNrL2lrQWcyTWxpSC9i?=
 =?utf-8?B?NzFJbldSL3F5RnRCZm10eTN3NjliUUc3alJ1S09STys4Wit6ZXZZTEFzaWNE?=
 =?utf-8?B?YkEwM2NUbHA1LzltS1NBTVJuYUc1bS9Na1BOSGE0TG5CdFExdlkrNml5WnVQ?=
 =?utf-8?B?dCtPV1ZhcDEzY3F6VUcxcktSNDhqLzlSdFVLU3VGbjI4S0QzOGFacjMvTVpY?=
 =?utf-8?B?Tld0bXVLLzAyU3Zab1BKRmJYYkEzRGR1cUgxS2xSV0FPSTgrNllzVzFUc2lp?=
 =?utf-8?B?d0pRZlZXRGJTRGJ0Wk0wMGUzUkh5MWFNVmR3dmx1Y2hRYXQ1K3lKMk91UjlU?=
 =?utf-8?B?K0FXK3BtS21DaHUzK2M0cEJQcmZBekswTGJscW10enM1U2dqWEZldnVIeVND?=
 =?utf-8?B?U1U0elhBTTJMOW1KYmY0T1g3WDRvVWRaKzJTdG55UDFQditMb2N4bVBvWFd3?=
 =?utf-8?B?RWd4c2lHa1dUSk56SnJRT29QUFFJdFZubk1hQlBjYndjeWoxaHZmVWI0dlAz?=
 =?utf-8?B?Z3JocnBWczlLSWlkZ3F4NGJyV2F2UnluSkM0MWJTK1gwYVoxaGFrL0dkSm52?=
 =?utf-8?B?TXNYMlhYWGdjdG1lNmNNQmUvQ3lSaUtnSm1EVUlvdk9paUg5QWVKU3BWRThj?=
 =?utf-8?B?UWtQT2VjVkRrOUFEeHBkWER4ZXJJem1EQnJUTG5zRzU4Z1Rxa2tvNnQrQUhL?=
 =?utf-8?B?OE94ZC9wZnduazhoTGppQTVFMElEQkc5RjFFNlNEN3RzK0I5djU4QWJKNTZO?=
 =?utf-8?B?SzBNb0dEaVJ6SWVYTlM3Vm5Ha2k3WldXSkFzakRCNnZRSjBKUkRjdmEyTXBm?=
 =?utf-8?B?ZnFCTG5ReC9GT2ZzRVVRVEpvWUxQTEJFQWFyL1FJb0dQNzdHU0luVG9xL1Q0?=
 =?utf-8?B?WVAxa2JyNTF4dnVuRVB1aXd4WDRqclNwaGlyU1kxT2Uxd2x5SWxPTFhZRUpa?=
 =?utf-8?B?ditTUk1ZNldDL3dKWXJtc3BYcHZsZ0pWYzl0dGRuQXMrNE50NFd2dVBUb3ph?=
 =?utf-8?B?YVBWcFJ3aWtVN3ZnL3p2dkppbGE0S2dFS3RKODBrRmJ6d3EzZ3FXaWxZaUF2?=
 =?utf-8?B?WElrUnhrWUdkVCtUWThxTHRZYmhRNkg5bnlWRUtLZFptL3VrK0RybHQzY1hE?=
 =?utf-8?B?QXl5SWMzSytQWWs0M0d6NU9tSWh2WU8zc3JiUG4zU0N4UFZqOGJDVy9aMkJq?=
 =?utf-8?B?bmZzTWNSTjRLandSUWpYTlZQUWZoeWtLamlvdExOaTNwRU9Oc21TUHZJK2lZ?=
 =?utf-8?B?L240a1FhclcxSk8zYzU5V0FDNFlueTFqUjB1WHluT1NLRkNGNHBiVVcvZklY?=
 =?utf-8?Q?S4nsBeuMifAkLWXAUOohSdirE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B54732DEE426342A31A34BB37424CCA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a050c7-6169-4f4d-5078-08db93608014
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 13:58:07.7574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsSO+jD0N9O5gsq+h4IEQ5N12n8JoD3GU0zLJSNxrUmJetDu6A7FU9qoTtjlrfjoZTXugtRpjZev99CNXj8D7B8jJt2r7Rc0tY06Luo6s4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3097
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
Cc: "falcon@tinylab.org" <falcon@tinylab.org>, "linux@weissschuh.net" <linux@weissschuh.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "w@1wt.eu" <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA4LzIwMjMgw6AgMTU6NDEsIFl1YW4gVGFuIGEgw6ljcml0wqA6DQo+IFtWb3Vz
IG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIHRhbnl1YW5AdGlueWxhYi5v
cmcuIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0dHBzOi8vYWth
Lm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBTZXJpYWwgaXMgYSBj
cml0aWNhbCBmZWF0dXJlIGZvciBsb2dnaW5nIGFuZCBkZWJ1Z2luZywgYW5kIHRoZSBvdGhlcg0K
PiBhcmNoaXRlY3R1cmVzIGVuYWJsZSBzZXJpYWwgYnkgZGVmYXVsdC4NCj4gDQo+IExldCdzIGVu
YWJsZSBDT05GSUdfU0VSSUFMX1BNQUNaSUxPRyBhbmQgQ09ORklHX1NFUklBTF9QTUFDWklMT0df
Q09OU09MRQ0KPiBieSBkZWZhdWx0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWXVhbiBUYW4gPHRh
bnl1YW5AdGlueWxhYi5vcmc+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2NvbmZp
Z3MvcG1hYzMyX2RlZmNvbmZpZyB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9j
b25maWdzL3BtYWMzMl9kZWZjb25maWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9wbWFjMzJfZGVm
Y29uZmlnDQo+IGluZGV4IDAxOTE2M2MyNTcxZS4uM2FhZTc5YWZiOWQ5IDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMvY29uZmlncy9wbWFjMzJfZGVmY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9jb25maWdzL3BtYWMzMl9kZWZjb25maWcNCj4gQEAgLTE3Niw4ICsxNzYsOSBAQCBDT05G
SUdfTU9VU0VfQVBQTEVUT1VDSD15DQo+ICAgIyBDT05GSUdfU0VSSU9fSTgwNDIgaXMgbm90IHNl
dA0KPiAgICMgQ09ORklHX1NFUklPX1NFUlBPUlQgaXMgbm90IHNldA0KPiAgIENPTkZJR19TRVJJ
QUxfODI1MD1tDQo+IC1DT05GSUdfU0VSSUFMX1BNQUNaSUxPRz1tDQo+ICtDT05GSUdfU0VSSUFM
X1BNQUNaSUxPRz15DQo+ICAgQ09ORklHX1NFUklBTF9QTUFDWklMT0dfVFRZUz15DQo+ICtDT05G
SUdfU0VSSUFMX1BNQUNaSUxPR19DT05TT0xFPXkNCj4gICBDT05GSUdfTlZSQU09eQ0KPiAgIENP
TkZJR19JMkNfQ0hBUkRFVj1tDQo+ICAgQ09ORklHX0FQTV9QT1dFUj15DQo+IC0tDQo+IDIuMzQu
MQ0KPiANCg==
