Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31F58E764
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 08:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2gX30r5Wz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 16:49:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0/3joo0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.83; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0/3joo0w;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120083.outbound.protection.outlook.com [40.107.12.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2gWD4Kt7z2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 16:48:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZuxUTo6K4q0IK0UkvTjU8mQIpHW5G8vhCCJadPOWaH0qxik4rsc1ouRXW2pVnhqutgEkxIWqaq1P5J499xcLT0QRBkADMfdTQo0cOmgG+3wxb+YnjDTVRPqLse/bTkZgjy4Ui4pilfFjpYnxxUC4zknwuAEuAhDodG3IK5flEfH7Q9G/pJi2afI7XFUlXwne9a6QIQtQLQuZ+rQRCKxoDVcq+rqjGna3EGFPixrMjrQFhwN0F/zilbL+XFoLsOfDnkZ+HTfeXhb2/anqfq2cOsT8YrdhhcPt0dLSRyTZbBBTyKxuIczaoVaUcZlzSl9wsD47OrzkAPjk1avwYZerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Kw2tH3pSVCAXrGlMYGCn+w/yj5JzrFlXJdyQsldfeA=;
 b=cyFrkWTCjL80rRHdIKcmnElCqaUg9Oy1XPfEo30xX6giVXnmUwl0Iq6CaSLDzM43l/nNDKc786db+fbyEeZACus6EkhhtuojpdYrSS+uJLF8Q8ZXmsjQwuW+bC91cP4vWWedSVXhgbvxOC/S2rAjGzxzYpKXoUlPFMNLK0Q60AT7uSjwMK43ImCejzA70ajp7G3fcgHTb6SJeQuNfL9iwbe4T3bpuA7H7qTRQMjJ+GJZM69PA8O+SIhng8p8iy15Ff7QcVNTlttvfjyz6dzVXPawc18EtAH1UmtnIi9H80qG3fyyjveIUAlOukeSlqOdMiZGX0hzSUfpg9wR1MAWQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Kw2tH3pSVCAXrGlMYGCn+w/yj5JzrFlXJdyQsldfeA=;
 b=0/3joo0wLOhgMAQuSUfLDYtQj8fN1u82SZAGPbLQG1rPATwfgjiSD3J/5kZGr7Cikk5iYCcFRJg0S/ImyBse5GJGxpAF1RNdxxzA5/ScgWzY6Yiwz7SmZfwX6xb8y7n9A9BTkOG83hLa/viV4/jNy6hq3TaDk9P7UF00n8WLfqb/Q8W+eFoaxpyaRNKxTGXusUy4hzUX7sa0skiiQoGUUvifKVCi7H/m2MlDkWVF2kAkKRM/KO68hiPh/q3sJXXFXy73peTFvlRuPwIjGI1O4iV4dBWIp0ATNa9sTzyWRpSbwiHuUZkuS63hLkytt5pDCpCXq9DuSrRTG4dIdsD2Nw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3712.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 06:48:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Wed, 10 Aug 2022
 06:48:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jordan NIethe <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock implementation
Thread-Topic: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
Thread-Index: AQHYokvMeG9HO3isIk2Jm4Vuf+afUK2ncyaAgABShwA=
Date: Wed, 10 Aug 2022 06:48:03 +0000
Message-ID: <7eabefab-fe3a-bacb-b54c-a8f9622d38bb@csgroup.eu>
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-2-npiggin@gmail.com>
 <0e3ea5733bd786a4dea43a53ebd59b93d97ad036.camel@gmail.com>
In-Reply-To: <0e3ea5733bd786a4dea43a53ebd59b93d97ad036.camel@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23b2cac5-6939-401e-0639-08da7a9c45f8
x-ms-traffictypediagnostic: PR1P264MB3712:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dw5RgLY/wCxCzu+tAzvtBq1L+Iab8JQMTJcV0WNflK1+bV9UFVH319JTtHTaIC/Y57w7G3/hf4ySn3QTwB9JZ12fOjGzYIUzQTZK1LjU00hMsdyMNjqJh5Ab6bypnNtsTH4drZF73GzBqEoucF1gspf2JdHbO6qT/6Sp15STQafL+sZITW3DIgElM1FikzFUQkdjegaq/5yoo1JTTJY7zwJaTaRxuczwHESuWVlPhiokhSvnQqXFUDRfO+aWaA9CAD4+RCwUBpWpbKAWwYL4z/LcvKPHwmjHuPhb47vSk3q+zTrCAXykH8OfzL6LUjqQh8/3hiBRuzbm+nxDpTqSVXoN7qb616E2/i5fJeNi5wzze1BvhF+uOSnunWOpYFWDgqqXK2HadHyvdwHsgv3PCr4uJmsvaZjz2PM3JY1NIt5WMQKKWLDPMqukrqURWj3teWaXk1z7GW8MDj/fdMD6YhsmIBolYS90uWPsSae65e8Esi+hti/3qbClmb6fDCxEcnDWK5B+hr1QskvPHPp5Vc0d7YVU8Fesle5tuvgeMQV2BpHxVtyvbLpGTDyIP9nMRUxQRiBbQcSLe7IO8lm8urQNtvMklgkf442EVR944XTz1V/o29WP2Kx9IJkqZ4JZV1lYGG9dCuc0PzZxfkJwUzfwJp7rBE954o2n/kgAeWZZuLdTLPtpreoeM8mx4WkALx4nl8be5+W5zclo62lKRpWyAl68TQzlLH27cL6Xe70xMHASrUu/PkVO5laZzKXb8Bjxn0xcrjENFh3k/xhce+xLYkyFC0WkWwCQnQi97IL1mHbbeI1Z/4rqM0QV2msF7UV2D/qMZdaY4OKjThFYa4w1s11vqg+0FFZOYaNKoog=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(136003)(376002)(396003)(39850400004)(8936002)(44832011)(5660300002)(6486002)(86362001)(41300700001)(478600001)(31696002)(4744005)(2906002)(91956017)(66446008)(64756008)(8676002)(66476007)(66556008)(76116006)(31686004)(36756003)(122000001)(66946007)(38100700002)(6506007)(6512007)(316002)(71200400001)(38070700005)(66574015)(186003)(26005)(2616005)(83380400001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHlaZGsxTnFXQUdxaW5pa3FhSkVRUitIbXpHSnFYKzh1N3loZlEyNlAwUjA3?=
 =?utf-8?B?OWlVd05udkZmNlR2bWRSbThscThteTIvUTZxUkl5Qk03ZTFFNzMzc0ZRYUpr?=
 =?utf-8?B?YmMxUDRBUzhzdjcwbTBDSVRuTlJTK3FPU01PSlp3VS9Kbm9HVDloM0pnKzVI?=
 =?utf-8?B?YVlQMkgzdzBNVC9aenBZMUExY3hGb2JsNmNNRGx0ekxUUU9XR1Frb2w0RE1V?=
 =?utf-8?B?WWFjWUJJV01URUg1MkVFS2V2TmxMUitKTTY2UDJHY2YvR0RNQjFvMFBBUUhH?=
 =?utf-8?B?dW9XMTZKa21VakFFL0VQVkcyZWJ6aGx0dzNFd3pySnN1dXRRNitLT0IvTXVI?=
 =?utf-8?B?bm9COVdPOEpZVnZtdThpTzVZSzBxNjJTMlBYcklLUXU0ZElweUlYTE9qN0FS?=
 =?utf-8?B?aG5PV2o0OWZPcUozQWJnK0pYQk02aXNCaEdLbThSV015M3JDT3dqRHNvTFJK?=
 =?utf-8?B?QXdiMjFEZzVrUWd3U2Y1TnpIZ281SHc3elYxdWhKUmN1N2hFdXpVNEFUSzhI?=
 =?utf-8?B?M1BtUHRLeEpXRDBzbEMxY1dOcnVMeEpqVkl3ak5QeHdvQjFiM0s5UkhKMnkv?=
 =?utf-8?B?LzlFS2sxUDJzbXI4bXkwc2dKcHZvcTkrSS9iREtIVjVxa0s5K1ZVbENTbUx0?=
 =?utf-8?B?UGU1b0IrWG5haGpJR2F4dDlDRjg1bmkxYSs4dlFqQkh2L1VjS2Z6TUxjbzdx?=
 =?utf-8?B?T3BLSG1HVEZqa3ptTHkvVmJCV0FvdUJEY0Z5UTVIbUlyVGg2dHliUi9VVHI3?=
 =?utf-8?B?UmZIaTh3elN3clFXcms1UER2aWo0NERYVUsvc2g1N0J0ZlJYSDNIbWdaVnlm?=
 =?utf-8?B?ZERabTNUNHUyZDNQS1QydGtmNklVbFpJcFJFbm04Y0tUNnIxY1lIUTRxdnZh?=
 =?utf-8?B?SnJSbXpwRi81a0xqQXoxVDZZWS9GOU5qSnRrTThDUWJTVUcxNjA1UlM1QTdi?=
 =?utf-8?B?RkNnd0dIQk5BWTVyZ1NBT1BSNjRzdUdmZjc5N3o2L1ZmeTFPdEZHb0lrQVo5?=
 =?utf-8?B?NHRKUFIxSTB5a0dJTFhxL2ZnUUUyN2dkeXhKSXlIVVdGNFhvL2VXaEZGT2lN?=
 =?utf-8?B?ZWVNU1lLNmtaOGEzNGRpaEYwQ3hBZXBCVDBCdzJsanRFbHhvYW8vbm1OdmRK?=
 =?utf-8?B?UVYyWGdBcVZ3QXJLMFpKMWxwQzJLWFVMYWNVWXBtK3k3ZUxNZ3MwTDV1U0s1?=
 =?utf-8?B?Qk13d0ZXZU1WaHkvaFYveExqV01JR0tCS2VCem91L21SK1FiMTBPU0t2enoz?=
 =?utf-8?B?cVNXYWk0MzA5dFkwU3hUc2d0ZTZpNDZKWkMwaE9YRW5vQTQ3QkFnS2pKNWNP?=
 =?utf-8?B?MUtmVVphZmRLeXBGTC9mVGNScFo5RGo1QXVZS2xPZDJMNE1UaFhiR3VRWnVM?=
 =?utf-8?B?REZzMzhLbU44bERkZ0ZlRC81MDMycmsvNDVRQXEyS005L1VLclFsdzBOSE94?=
 =?utf-8?B?aEg3a1lSM29WTVp4a2REcXpqMlQxTVFGeTJoZHB3M2pQSlBMN3RsalJYL3h4?=
 =?utf-8?B?dTEzSkVxZ0RHTDVqQ1ZIU3hickJwUElXTHl0NmcyLzJXc1dXamVZOVFIM3cr?=
 =?utf-8?B?S3lOM3ZCNzZ2bkRNNnRINTEyVjZ2U2pMVTVlaTlJUkczV25JaEF4YUQ4cDNJ?=
 =?utf-8?B?TzBCMjVkaDBiaWsyc3Q3akh0Y2Fzak9PbndVU0dtbnFqd2t5dmEwcXRNY1My?=
 =?utf-8?B?c1hWN245Z1BEZEQxNEFNNGIzVnZHOVRQOFpoM0dEK3pja0IvajRVeVF1REhF?=
 =?utf-8?B?WEJVMVJTNEFFRjlZZkdRUHcyMnpzMVpJN1R4QUlKNWpZWVZGdjNoTndCRWt6?=
 =?utf-8?B?N2haVUxHbS9zSkdXVzlxOUlDVWdZN1R1cm1YNk1TQzFzOGdIV1FtanhTS2dE?=
 =?utf-8?B?cTlsbFRidHJNck5GUmxKSCtVWjZUV3E3U2c2SndabDRwTURhQjlJT1J0QVIw?=
 =?utf-8?B?Q2crUzN4U2s1SFJkU3FzeXVYVmRjL0dMY2xISytuYlpJNjgwNzBTSWFuSDRF?=
 =?utf-8?B?K0NsOUZSY2RYQ0V0VzJhQTBaQ1Z3SXpyUTVXZWdaWDhpRDh5VFdhM3ArSjJP?=
 =?utf-8?B?NTJ4S0k3OHJNMU91NlZXREVseHZmS1NMWDNwTVBoWk1TV2crakV5TG01SUFj?=
 =?utf-8?B?RjFVS1U1S2NWY1hHMTZsYXZCSlA5dUkyaEZqYW9mOEJjblQ1YW9QWG90QzNx?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25CBBD4B23D9F54AABF6EFB9BE2163C6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b2cac5-6939-401e-0639-08da7a9c45f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 06:48:03.3559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNrTOV7LJbTUXC1zQwGGO38uKNfsP07y/vab+TFaxiUre1ftySPYUeV3WTYTuWqwhlVqZ0DiUm+/f3L+IZqae7pSUXa26VWjmFi6cXzGjDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3712
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

DQoNCkxlIDEwLzA4LzIwMjIgw6AgMDM6NTIsIEpvcmRhbiBOSWV0aGUgYSDDqWNyaXTCoDoNCj4g
T24gVGh1LCAyMDIyLTA3LTI4IGF0IDE2OjMxICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6
DQo+IDxzbmlwPg0KPj4gLSNkZWZpbmUgcXVldWVkX3NwaW5fbG9jayBxdWV1ZWRfc3Bpbl9sb2Nr
DQo+PiAgIA0KPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBxdWV1ZWRfc3Bpbl91bmxvY2soc3RydWN0
IHFzcGlubG9jayAqbG9jaykNCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBxdWV1ZWRf
c3Bpbl90cnlsb2NrKHN0cnVjdCBxc3BpbmxvY2sgKmxvY2spDQo+PiAgIHsNCj4+IC0JaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19QQVJBVklSVF9TUElOTE9DS1MpIHx8ICFpc19zaGFyZWRfcHJvY2Vz
c29yKCkpDQo+PiAtCQlzbXBfc3RvcmVfcmVsZWFzZSgmbG9jay0+bG9ja2VkLCAwKTsNCj4+IC0J
ZWxzZQ0KPj4gLQkJX19wdl9xdWV1ZWRfc3Bpbl91bmxvY2sobG9jayk7DQo+PiArCWlmIChhdG9t
aWNfY21weGNoZ19hY3F1aXJlKCZsb2NrLT52YWwsIDAsIDEpID09IDApDQo+PiArCQlyZXR1cm4g
MTsNCj4+ICsJcmV0dXJuIDA7DQo+IA0KPiBvcHRpb25hbCBzdHlsZSBuaXQ6IHJldHVybiAoYXRv
bWljX2NtcHhjaGdfYWNxdWlyZSgmbG9jay0+dmFsLCAwLCAxKSA9PSAwKTsNCj4gDQoNClRoZSBw
YXJlbnRoZXNpcyBhcmUgcG9pbnRsZXNzLCBhbmQgISBpcyB1c3VhbGx5IHByZWZlcmVkIHRvID09
IDAsIA0Kc29tZXRoaW5nIGxpa2UgdGhhdDoNCg0KCXJldHVybiAhYXRvbWljX2NtcHhjaGdfYWNx
dWlyZSgmbG9jay0+dmFsLCAwLCAxKTs=
