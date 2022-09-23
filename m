Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2F5E7436
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:37:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYjBL4f6Gz3cF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:37:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5H4nluW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=5H4nluW5;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYj9b4yLVz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:36:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5MSYpmWNPDFWF7+B2Hz2G/Too2gQtrAxHc0tqRrJEoSq1QoKXrRUrl76qTcqKPhT+X1+HW7hLyLJMze/Ua6GaVx6eFKYxMUW0zz6o7c7zSxQuAQHpok4eXAFw2SgPEdAeuZiv3UrTBaudfKgxvjYuQAQpT7L4XDuIYKHDeZei1r9rBWPaBJG/aI3WfsI6K5OionavDQ8IMPWA9TDFUkTNlo/hRcufiy4r4O9RK2DFREIRaK5bo+Oqm5+u0+TSrYcxEiULjQOg7RJjhJRosZbBaVOxHKhZ1lTmXWTSj3K+OzhAl03vb+jKU92CNAwL35roDoPhaYp2kMgoO8oh4WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7ta2mM6JvjnZyO5y3SeWS21dVNGBHaTzVJEIpITnP8=;
 b=DOcl6kDki5CeARZCM5WOV8fbTqYIFMiIiCU3PCu5kc8PBlLwR1J3ggxc7OO8H+Lmmcr6626NpuL3oxPYa77/wJHHyuIgz7dvAv2WWCcRKrhiuT+BRvqTQbHWr5/mQcBB5aiCvlPYRBy+O2L90GqJiHuNCzDEwRE+PuKvMaUmORcNGjr+kNyVXXW7nO7f3CMgc92IzCMmw9njhk7QVxgB2x+dihwcXLvJuM+jn/MOH8WIf+9SWhWdp5lxz2Tv8uZK321qu5DAhqHCCMv7F5ansxGgtMo+ipaaHboNmp9aKEtw0/Yb0I/+Z+IEG16BBXaukA1FIpNNlveHHPz2B1cRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7ta2mM6JvjnZyO5y3SeWS21dVNGBHaTzVJEIpITnP8=;
 b=5H4nluW5merkqIKLP7aL5NrWOK+79+oyTBtcdCClNCZAKnUnaHzZB3Oq44nI0nbD37xjtdGy7RzIbcTEBYCK2F1ccBnChrSDD/WO7S+u3ZYQEmbjgzx/D6h5o3wv7nHnBCzMw6ObOvBIc93lG+I8iPHeRcSkio6FOoEbV5jGgIh8LLWFN/z4S4vOJvzRHBpcf+Ao64pjQjedMYG7k5WMRqKHgl7TozUXShQ2eOV5npvz/OU/G8SWa5nFSRTUqSq8H4LW0jACqgDCbztDG/d9BUILg6raDCH8lisvMaVzH1EDmIvUjbnWWZwdsbt3AAxkHeFSsx+Lshn7CYOGAJ1eVQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2278.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 06:36:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 06:36:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH v2 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHYzxMoAN1BIzFPM0W6TY778N5N1a3sj3oA
Date: Fri, 23 Sep 2022 06:36:30 +0000
Message-ID: <6076050a-bb7b-3d95-13ee-aa434f834b19@csgroup.eu>
References: <20220923060802.1187520-1-rmclure@linux.ibm.com>
 <20220923060802.1187520-2-rmclure@linux.ibm.com>
In-Reply-To: <20220923060802.1187520-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2278:EE_
x-ms-office365-filtering-correlation-id: 86401484-1f8b-4e20-81d5-08da9d2df360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  D/We54PWN0QToUqxKraY/ZBH69VyrnHhEnNzzBV/248PA7FRgqci1PP2YNeMWH4vhXhsN1x9E5yp5mZUaP08gL/U/UJ3abc3fa+dWn+lFfuogp3D21XCw8/BEcs0MdFqZhjUo+s2qptJDsHimdwvJ1wyHMvjqOpasbnlwtqYVuER3xPP+ilWsyVyxkIZ92Xp+jwsADqH9CTaxdMfQD5VpWOKIdbEtnnNo47Fa8B+w8hmI534WEH4EI1/16piCPCsxGydnu09NLYfSCllLJeFMwmVZNlyAj5Ba2DMS4AV1mCHG+mBOqlRyPD1Rp557xU+0UL4nwJnrZ01Z+f75IBb0p1vlmsaH/LO0aRUPZ4bw7gdUgVleE2Wh2E5tb1WCVqQ5HBo6DE3IhB1oiUUjMo3YAUWxX3ZlZIXNljqrqRfVI7A44uOIukdLDMP7LVW3n6s3vtstXs6Yvc+NB/95JHlBjfTFgZXOWXc9Prx9GxBQXvqazstbgFpQmkgJNnj+zqDWrfWgdbpERKX3aNXj5/LEQom3ACk415HCIRytKiFKZURRh1SxsheuudOKA+ICbsPlRIB4N/HcN2rkYim9J66SfeJnJLh3URXPi03Hx8d27S+dbieFPuJVHVmHXEgpVIZ2riQZ5wUr3Lv9mbJmXEm8ilhYAlIoLh/v5hZLmIgCJnBWTXKBguOX4D8v/S9Ww7zqa9hWgb+Dsfpz99OrWl5pq9R9lzXvCopXt461F2XbYZ+oSYrnRdReSz6cH59G1KiW8w2ElYo5/yaxlwnjaz1Q5YaesoqebqWBKtw+0IMD7iLQAUiKQyt13LvqewTcV4Kba0VSoWb595MErTzC6dK8Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(110136005)(316002)(186003)(44832011)(36756003)(2616005)(6506007)(41300700001)(478600001)(38100700002)(122000001)(6486002)(71200400001)(6512007)(5660300002)(26005)(8936002)(86362001)(31696002)(66946007)(31686004)(66476007)(66446008)(38070700005)(64756008)(66556008)(2906002)(66574015)(83380400001)(76116006)(8676002)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aXlNaVBKaVFscW1yVkE2cFgrK29nWGRiSWFsdFVabDR3djd4cnAvTm1RWHpG?=
 =?utf-8?B?dmROa2FRdkMzY01RNGp4WEFPZ1JLVFl0TmFsZEoybGpwNmNTcWVMRnNLRDRQ?=
 =?utf-8?B?cDNDUm9QY3ZxaGI3Nk1pY3JBUHo4T0JyMlFMdjUxblFlY1pEelVTSEhMYUZ5?=
 =?utf-8?B?TmNlLyt0T0NybTRUT2JDNzlXNHFRZEYva3VCdnFxVDBTNHB3VnRuS1kvR2xV?=
 =?utf-8?B?OURyWGhhRVdqT2Nmd2VGdzNwcDRUaEk4RGFOSSt2MW03RitrQ204RDYzaGtI?=
 =?utf-8?B?THFqSWY1UU1kc2RpV1ErcjJtRXZKeWdhNHJEcElwM2h3d05WWnRENktVUi9N?=
 =?utf-8?B?S09xUUZhYzZtalJkR1RyRVNLd1FoVVdNWDNGTjVIc0VBZ1ZWd2VsQVI2ZEdN?=
 =?utf-8?B?V2xpRDFnSkxlbmpWdmRnTUk1T3dEVWRGRFNHTUYxa3h3aG5RaFUwNVNSR2Vq?=
 =?utf-8?B?WGpQampGYjVOVWtZd1hFTnlMelBCZUx0V0VMRk9tTWFBcVFPek05dTYzNGpF?=
 =?utf-8?B?a3AyTHNqeXR3eTFsNUZVVnlSSjdiRCtYbXdUQ3FPSS9OTTZ2elRQR1MzeUZv?=
 =?utf-8?B?QnFyUXA0V3VGZTMxdmhoTlJxclFuaURwb0k2Y0x6UTh2OFo0akZjL2hSc01k?=
 =?utf-8?B?ZjRTVEtiVk5GenNlOTBIQ3E1dlVjWHF4Z0NaZkNWWDFQZVNyTWlpQlh1R1pQ?=
 =?utf-8?B?UUY2eE51ektUeFRJSVdSNDlRdjEvYXp0TGhKYWpwQmpQQnlSdzZMUnp1VE4x?=
 =?utf-8?B?UVVFNHlyYXRSTlNWVEhJbjVsbGtQVG51M0lDelJOZGRBcDBobEdsZ1c2THZk?=
 =?utf-8?B?V1ZMWVo0Zi9GYW1ySXVWMXpMcWhYcENJYUpHNHdSN24rYjVnRS9ieEgwdGJW?=
 =?utf-8?B?U2trdC9DMi82aStmS1VCVHV3Wk85RkdGcGN3ck9ya0haWHEvSlcyMVMxMDFi?=
 =?utf-8?B?ZThjdlk5YXNYK09JWUw3V1U2K2pMNTczQVo5U1VWdWl4aEQ3YWs0d0NNZXZi?=
 =?utf-8?B?U2RqQitWMG9PdkttYTNrMUN1dG95Z1p1SlV3c2JSeEdBWUpmR0JCM243SnFC?=
 =?utf-8?B?QlpMMTA3aHhMMkw0c0NwdGhEQTczOTRtYmEyVlc5WlRjT011WUJVcWdhT0o0?=
 =?utf-8?B?NjkxRVM1ZEUvYVRjekR6a0hzZk9CbzJiNTJqUVVPTFNzbHd0T3J2dDFEcVY4?=
 =?utf-8?B?NUkzK1JBcExmUDlMTDBjOXRMaDBsL2pYSzF0S09tZ0x6ZmlpZ1hnSWRTaTNa?=
 =?utf-8?B?K2NSQ2FRUXdIM2o3dUNseGQzWU4rYkc2bG1lWG1PTVZuSERmMUVYenF2Vjhh?=
 =?utf-8?B?L1Z3QWg3S3U2dUxhR1pYRW9YNFViMlRXbFkrUVJ6TnRxcllybjBnOXdaMWpa?=
 =?utf-8?B?TlhlRFU0TzMxd21sSlUyUnEzZ0Q0RENmVEdqTW9IYWdVQ0I2OXNra21tM2ht?=
 =?utf-8?B?WldaSDVjK0hxZk9LZFh0NzhzcHlwM1FWa1VUMHM4ZG5PaUZhM0NVT0h6Rnha?=
 =?utf-8?B?Mi9KQ3FqWTNXWWpyVEtRVytFTW5oL3RZaExrZ2VXY1RzbVMzM1dFQm8vYzB4?=
 =?utf-8?B?U1RBWjlLZEFoOWM1OEp1RVg2em1vaG5UOHk2WnhlSUlKQUFGOUx2Q1p1WXhv?=
 =?utf-8?B?dEtJdy8yNW8rVkZZRUhUczl6VVBkUEZlYU5LbGRLZW94SHRtOVNia29lRUdh?=
 =?utf-8?B?MWo2bFBpdTU3T3Z2RHoyeURITGdoZTVRM2J0dkZqQU9wa05aUjg3L0w0cXFx?=
 =?utf-8?B?WUJUYStGYnBjeHRuRzBRbjRWSXRjUHZjRmZUR3A2Q0EwOGtqUXp0VFU2eG9x?=
 =?utf-8?B?Smd5Y1k1QzhyZ25hYVBoUytFczVMRlRuRTJLQ0RrS3c5QnZHdlAzNXZUUWVO?=
 =?utf-8?B?YmlYODdoMzhwV2MwRVpINVU3NFVQYWRIYjdhcXowVFVtcGdtYjZ5Uk0zUWFJ?=
 =?utf-8?B?UDUyaVF1NzA3Nm9YZHI1Z1pvc09KVkVQWjNYTUVzMWJOSU1EWEVIakhHT1Nv?=
 =?utf-8?B?Z1VtSzNDNnNITERyTEUrckN0WG1sa1BscHFKb3FYeFdTeUllSW1qZFEwd3Vs?=
 =?utf-8?B?TXZwZWk1TTZIaVdRb3g3eEsrSWlvNnVIbEtwRFBNY0dYMHJlQnRNYjNaZWJ5?=
 =?utf-8?B?V1dTY2VtTDk1MysxcFFZejNTaVBlOUVaejdOZ3hHZmxQL2J4K0Fma3hQUys3?=
 =?utf-8?Q?4DICTFc74YYdyDfC76jxKq4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23164E473DEF65498504E36D7BAC81B4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86401484-1f8b-4e20-81d5-08da9d2df360
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 06:36:30.8155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lBDdK3xls8Pl2ZzRj88MPYE+f2B7Fjb+0hFGdsadM34ZBmy6N0ZzgYyp/mT3RFyGZ/AG444biAKEo5yMaHkmTd8VWDxiwJhkZrCt/RAe90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2278
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

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMDg6MDgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gQWxzbyBpbXBs
ZW1lbnQgbWlzc2luZyBwdWRfdXNlciBkZWZpbml0aW9ucyBmb3IgYm90aCBCb29rM1MvRSA2NC1i
aXQNCj4gc3lzdGVtcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVy
ZUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gVjI6IFByb3ZpZGUgbWlzc2luZyBwdWRfdXNlciBp
bXBsZW1lbnRhdGlvbnMsIHVzZSBwe3UsbX1kX2lzX2xlYWYuDQo+IC0tLQ0KDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaA0KPiBpbmRleCAzNjk1NmZiNDQwZTEuLjY5ZWVkNGUwM2RhMCAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IEBAIC0xNzIsNiArMTcyLDM5
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB1ZF9wZm4ocHVkX3QgcHVkKQ0KPiAgIH0NCj4gICAjZW5k
aWYNCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdGVfdXNlcl9hY2Nlc3NpYmxlX3BhZ2Uo
cHRlX3QgcHRlKQ0KPiArew0KPiArCXJldHVybiBwdGVfcHJlc2VudChwdGUpICYmIHB0ZV91c2Vy
KHB0ZSk7DQo+ICt9DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfUFBDNjQNCj4gKw0KPiArc3RhdGlj
IGlubGluZSBib29sIHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRfdCBwbWQpDQo+ICt7DQo+
ICsJcmV0dXJuIHBtZF9pc19sZWFmKHBtZCkgJiYgcG1kX3ByZXNlbnQocG1kKSAmJiBwbWRfdXNl
cihwbWQpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNz
aWJsZV9wYWdlKHB1ZF90IHB1ZCkNCj4gK3sNCj4gKwlyZXR1cm4gcHVkX2lzX2xlYWYocHVkKSAm
JiBwdWRfcHJlc2VudChwdWQpICYmIHB1ZF91c2VyKHB1ZCk7DQo+ICt9DQo+ICsNCj4gKyNlbHNl
DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3BhZ2UocG1k
X3QgcG1kKQ0KPiArew0KPiArCVdBUk4oMSwgInBtZDogbXVsdGktbGV2ZWwgcGFnaW5nIHVuc3Vw
cG9ydGVkIG9uIHBwYzMyIik7DQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArDQo+ICtzdGF0
aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkNCj4gK3sN
Cj4gKwlXQVJOKDEsICJwdWQ6IG11bHRpLWxldmVsIHBhZ2luZyB1bnN1cHBvcnRlZCBvbiBwcGMz
MiIpOw0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiArI2VuZGlmIC8qIENPTkZJR19Q
UEM2NCAqLw0KPiArDQoNCg0KSSBjYW4ndCBzZWUgdGhlIHBvaW50IGluIHRoaXMgc3BsaXR0ZWQg
aW1wbGVtZW50YXRpb24gUFBDNjQvUFBDMzIuDQpUaGUgd2FybmluZyBoYXMgbm8gYWRkZWQgdmFs
dWUgZnJvbSBteSBwb2ludCBvZiB2aWV3Lg0KDQpBbmQgbXVsdGktbGV2ZWwgcGFnaW5nIElTIHN1
cHBvcnRlZCBvbiBQUEMzMiwgdGhhdCdzIDIgbGV2ZWwgcGFnaW5nLCB0aGUgDQpQTUQgaXMgZm9s
ZGVyIGludG8gdGhlIFBHRC4NCg0KcG1kX2lzX2xlYWYoKSBhbmQgcHVkX2lzX2xlYWYoKSBhcmUg
UFBDNjQgc3BlY2lmaWMuDQoNClRoZSBmb2xsb3dpbmcgY291bGQgYmUgY29tbW9uIHRvIFBQQzMy
IGFuZCBQUEM2NDoNCg0KK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcl9hY2Nlc3NpYmxlX3Bh
Z2UocG1kX3QgcG1kKQ0KK3sNCisJcmV0dXJuIHBtZF9sZWFmKHBtZCkgJiYgcG1kX3ByZXNlbnQo
cG1kKSAmJiBwbWRfdXNlcihwbWQpOw0KK30NCisNCitzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1ZCkNCit7DQorCXJldHVybiBwdWRfbGVhZihwdWQp
ICYmIHB1ZF9wcmVzZW50KHB1ZCkgJiYgcHVkX3VzZXIocHVkKTsNCit9DQorDQoNCnB1ZF91c2Vy
KCkgaXMgZGVmaW5lZCBpbiBpbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wbWQuaCBmb3Ig
UFBDMzIuDQoNCkFsbCB5b3UgaGF2ZSB0byBkbyBpcyB0byBkZWZpbmUgYSBzdHViIHBtZF91c2Vy
KCkgZm9yIGJvb2szcy8zMiBhbmQgDQpub2hhc2gvMzIuDQoNCj4gICAjZW5kaWYgLyogX19BU1NF
TUJMWV9fICovDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8=
