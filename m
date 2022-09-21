Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC635C04B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 18:52:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXkww3bKQz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 02:52:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uhdq7QkE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uhdq7QkE;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXkw90BWGz3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 02:51:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m74gtDfPXBF7WXwDqQ/ZQHtEk5m/Odz7hVDhNHmcjh1M6C9IIEDhWKzxtC5RwHspfEh3yTT3AUw6OESo5Rdh/5vw3mWdIzwSIa+01wU+m3Ojpaa7Xf6ZKX9tYCBGwlOw3nRwEPxjLtShCSVd6XKeyYLBazMSJpOvHCWTkPzbP6f3C4DVNU7aDVwgxd6AOu7X0+h5JvUqA87AFR9hozy3GdIh+ImPnRwy0YAUnqovXhuvI5gkDZPQwGuXpiFDBpDJHPSz5KUB0WTUqHLHEE9G+ZhZQgw1tydLNCUxCvbYnvtlyvQjSBUhAHKB7bf78O0l3VguVoVnnPNLYlkUdUyNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcOK6GLH43kNaGe9/e1QvlXDayYvYjlP7fJtr35jWeE=;
 b=brwvgJiZ3xHuurExkFfsqKVdvjWkz+tcfSARsEQ6WDrZufDLLqy3nVSZlKqjFzLOZqVJ5VUJD28OYge21Rl/R5JRwkYWpqdkZVwYxDvLeD4bNb3f3ZvLLQP3z+JTs+EY2Dr1urYHyZCAQlGoSU/YEZ4K4a4evBCdcVGSXAn2l7WkTHtXj5J2T0vE2/OKqKhBMoQLp5RSuyiD1vov/MG+HHfcB8OPgurSbROT3ti1S8oSpg5v7l5fTa8FGhTCWPAq6+WLkN/nFz2dodSEMoD/0yDa+lCB2R2oi88KH2obr3doHX3sPyu5R76jlzsxXJzRb0+X3Vlnb9cPoXrrUzkkZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcOK6GLH43kNaGe9/e1QvlXDayYvYjlP7fJtr35jWeE=;
 b=uhdq7QkEziW0s4lqSYaRxX+Q/PJjw0Pb3rFoYJZLnGeveSnE1DMX6eKpkWZPyNNxBxhAGp53JEgJ4TIstSrT0ZpOCQ5TdMm75pegAkPndXZozS7Hv2y6xWK+RrKJckUg4L2HUp0DjEgyKpiB3nTg3X9ksD1XR2rEOY4BDrVlgpw/EXgIA8Co1rWFWQEnDzhTdt2En7xAhMZ6ybYr/7dgx3URc6BTtBLEuaBVJbwHvNzA02kdWQLohehXP7O6NZkSQfHubLCMIhsrcL+Okvw8jnycRPXmNf8b9RASNF6QvNi3KVy1XuLS/Tyy2OJ0+fd9s8J1sBw3WdQun1WFO1hGNg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3325.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Wed, 21 Sep
 2022 16:51:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.024; Wed, 21 Sep 2022
 16:51:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/7] powerpc/64: abstract asm global variable
 declaration and access
Thread-Topic: [RFC PATCH 2/7] powerpc/64: abstract asm global variable
 declaration and access
Thread-Index: AQHYzDCfgE1Y7cmMnEug5DRXEUWyhK3qHGwA
Date: Wed, 21 Sep 2022 16:51:33 +0000
Message-ID: <0ba96e75-b2ce-da83-e651-68dc3bb21b66@csgroup.eu>
References: <20220919140149.4018927-1-npiggin@gmail.com>
 <20220919140149.4018927-3-npiggin@gmail.com>
In-Reply-To: <20220919140149.4018927-3-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3325:EE_
x-ms-office365-filtering-correlation-id: 6b435af1-b2fb-4827-49f3-08da9bf18a6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VJN5HgR3DaykzHQdrnh7/RUQjOfbV38KnvbqnvtWjJrCSKFlZVK+ZDMPyh0POaT1IT62qoNoAEZNHHyYc/2GgW6JjACbeTJ4yHHT9ltrKF8tKK/KxZj8ESiXglQIEWBNFajfAdJ8K5IQoC2aTtxUhJM7LtCrJ7A/w0smYKWdwtCUmEfoXxkyHo1dEhPgD1OsYVvNu83DgyzGbragDT1k14pIrnuQlu93FpH2/hfFRQHbXZi9kiYZTU9XyUgcQp6sHgMHa7EqKMBjhAdbVZ6U9E2DDkCIsMdUpxiv54FDgu0IFBweC5GI9xfO5ABqU0uZQBe2aHpzvzG0Fne0yas24+C8PAVEhdmZHv+xzoxz3cbWHhrsoU/gLVNTNylBXFZbtJGlukQfHuQBIEk7Padp8ffKPLupNUSDNyEnfuNPciVivmOOQw7RTmkOG+vTZZOzPyIWoddLQ8i/VYO0BR9ZxXz7fk9dKlpOB4WIi49QBeE7T5frKqwKfbj+YDadslNbPYOtfknhj05ueRBRUFP5vTEip49B16Kidn3XiHiQffATjAvIdmHolZsKdjJPsscvrBDLDWaHqFB4Y94uAgF+/xXaxHzwdlPmLXw6dvK0OLsQ5XRsVsvj6idN1CJFWOqYH66k7MYDDv6oOJchReM7wqMLTV7p9rqHiC8VJlMxfOiH+rc5N/ZOsmWTplxUNJdMBOCmg0UYEMzF5KRP0qgf/wt1f4Sjkpcq1DZSytddB/aCfl8ugxwuCphLtv6hmlnO/AUr3/qpQpfoM9MHS39TrCcjw2ron8NR1mueQ6QQZ6rmY9I29SCyWJrgwX524ZSonE1xRAg3M1h+9Nk1D3r70g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39830400003)(451199015)(71200400001)(122000001)(38100700002)(38070700005)(31686004)(478600001)(6486002)(6506007)(91956017)(66556008)(66446008)(64756008)(41300700001)(66476007)(66946007)(36756003)(76116006)(6512007)(5660300002)(8936002)(4326008)(8676002)(26005)(83380400001)(66574015)(2906002)(316002)(110136005)(186003)(86362001)(2616005)(31696002)(44832011)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MlYxdzBkZm5leDgvMzd0MFg1KzlKblFtbFB2TDJXcFoyblU2cEx3TGU2OXVm?=
 =?utf-8?B?T21jS1QyUFhBWTMySGdyMGhwT1g4QlpRRDdObWpleENydVJvalFzdzFGL00v?=
 =?utf-8?B?TVpNVHpNT1Q0ZWdVMkdrRTU0OFBsbjdFVnFLMVF1MXNDZFhScXBOWk4yUFJr?=
 =?utf-8?B?Z09YdjhmbWFWMFNEUnBuYXErY0EyUElXSEcyZUhUcWo5d3BqejFwSUdvT05k?=
 =?utf-8?B?REd6RDFrbjFpQXF6L21qbExPR3NRaitzZW1yZjRRTXpkWnlyWUlCNXFRUGlG?=
 =?utf-8?B?TWwxc1RUTTVrcllhTFE0dVZEMTJqSENxcDg5Z2YrMzlZTkN1T1g2OE5yNUFH?=
 =?utf-8?B?WHo1QkFnbXF1V1owc2ZmMU5rT09ORmsxQS84bVRrVmxqdTBydmJqV2NmclBu?=
 =?utf-8?B?bURibW0yZldPSmhqRWNSTmNZTEQycmZOODAwZEttTlRiLy9WUjdjaWZXWE9z?=
 =?utf-8?B?WmE4Nmk1WHVEWXpBM1kxc2grdWlSd3BYbjZXblA1dGhOVkxhNVlWSXJQWFZZ?=
 =?utf-8?B?N2NqZ3pMYUxhc1REQzdaSlZBR20xdC84TDVIdVh2cmhjWnF1VVo0R2NXa2Fi?=
 =?utf-8?B?ME5WTXJVcm1qM0YxRlBnSmNHSmkrMjFuZUk1YldZUFJzY1RYdHpDV1JiTGZB?=
 =?utf-8?B?VFByL3RpcUY1dVdkVEdlNDRBcmtFQzB3SXdSUHFBTTBKekV3dnlVMGRyYlFx?=
 =?utf-8?B?cmxGRFFhZHJOZ0M2bWw5S3JjSXJJanlmV0hSVDlGcm5ENThuK1BMUUxxcDFK?=
 =?utf-8?B?VzUwbm1oc2lXa2lkZFY0eG9FdjNBVlFteWQzZHl2Z0RodjgrV2t4U2RMckVw?=
 =?utf-8?B?VkRlYUQzZGJIaFBQbi96dW5QaHZRajMyTTljRDlnYTdRRnM2SjdoQWMwS0Fo?=
 =?utf-8?B?MllER3lwWE42WXphZGdHMEp6RHJ3YngrRWVURGpMR3pzZXBQUXVzK2tnR2Vv?=
 =?utf-8?B?T0ZiL1ZJV0tjTlFYRExWemRBRzl5WVlNVmU2Y2VWYnlkeFNnSmlRZzJSNmd4?=
 =?utf-8?B?OW1yNmNOWGpmb3dSYU82V2VPdGtDVGZha2pteDhSYTdRK28rSU5OUnQ5UjA1?=
 =?utf-8?B?S1dZWitMZDQvcWRFdlNXeUhpZHREYXFVNDA5d1Naa2JFQi9TTzZTcytnZjFw?=
 =?utf-8?B?M0hsRmV1M1pGY2p4ZDRVWVhDQzFjWmVrNng1TXUrVC9tK2Y2Z3NFbndobzdx?=
 =?utf-8?B?d0NpM2tJczk2UkJPUjdtUU5uekl3am9VNUZKVDdTSWF2UWlFR0NGbnp4Tmdj?=
 =?utf-8?B?TXFXR01qQ1JtRys2VnFpZG9aZmJaZUpBaW11TUVhdGo4TWRYeE1HNW00UUox?=
 =?utf-8?B?SmNLRFh4bitGdk5RZUk1RVVWUzY5OWh4c3FrME9nUjFoZmdmRHdrOGR2bk1E?=
 =?utf-8?B?bHFjR0docHVmSE9ZRmFFVFk3L3NzRUhpQUplUVYwSkFVR2lObXd3K3I0dnZi?=
 =?utf-8?B?RGtCdG15SmFITDFNVGVhWHpFcENMVmpJV1g0aGtaQThBVC9MTG5KZkxXd0Vr?=
 =?utf-8?B?MUtQdTdydTVXcjY3Mm90a09KMDhya2gwQUs0WEpVRFVhSkUvUTVzVS95a1g2?=
 =?utf-8?B?Zld5bTRZYzUxUExrdHhwNk9RNURzc0FzUjZIQURYUVRhR3VtWlpPTjhnbHAz?=
 =?utf-8?B?cGpaMEQ4N0pXaXFOeVM0M2RIaTJSZklqWUpQU3lvaUNpSUgxV1VSanBNNlh1?=
 =?utf-8?B?TDB5RHFWN1dHcE9OVEJkQlQvc0Y3MFpZcW9GU0ZRYUhDR2JmRllzWjFHZzlO?=
 =?utf-8?B?LzE5ZWpEc3UxUDJZZUlaSHBPajhvUEJYYUJkcGlDR0gvdk5uRHlkQUxURk5M?=
 =?utf-8?B?UGlDT1JiWG55RHY1cnZWZ2VTR21IVm5kSmM3VnpoL3d0MXJTbGwrdFNPb3pF?=
 =?utf-8?B?a3ZXZU1CakRHY0lONmVEdFcxNmg2T2Q4SU0rbWl0bTdwaVVKcWZvQUlFczNH?=
 =?utf-8?B?NFpQWkpRdnlOZDVIZW5PSXZkTjk1U1NjWGcwSkxGZDhGd2ZobGdqMS9hNnNp?=
 =?utf-8?B?eFBVUmVSSlZtR1NIS0EzQ3ljeWxIdk9mcWV5dWVuSnVCMmtkUHpjZGhLdlQz?=
 =?utf-8?B?SVB4eDlkLzJFSTlRTENqOFgwb1hsRGxUSEM4TnZ1cWdLM0ZmYnpwNXNWYkVP?=
 =?utf-8?B?aVIvd1ZuTk1EdWJsMENMb2FkV3V1cHBvaTZvbEZkRGNFdDdsUVI5VWxRODdG?=
 =?utf-8?Q?1AuqwX2Vcf11gaxgdiVFVZM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C6E489B9AA7FB478FEB916F7CF843ED@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b435af1-b2fb-4827-49f3-08da9bf18a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2022 16:51:33.7497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3Wvcyh/9YekJHdVwtrQ6R8as7o8UAgBUJXxkBBLpuWYp2T+hDDF0HrI5FtFzkTDo///Bv/rAf9uD5ojYtYv99te5oXXmEpHrQPgD30FnA0=
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
Cc: Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMTY6MDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBVc2UgYXNtIGhlbHBlcnMgdG8gYWNjZXNzIGdsb2JhbCB2YXJpYWJsZXMgYW5kIHRvIGRlZmlu
ZSB0aGVtIGluIGFzbS4NCj4gU3RvcCB1c2luZyBnb3QgYWRkcmVzc2luZyBhbmQgdXNlIHRoZSBt
b3JlIGNvbW1vbiBAdG9jIG9mZnNldHMuIDMyLWJpdA0KPiBhbHJlYWR5IGRvZXMgdGhpcyBzbyB0
aGF0IHNob3VsZCBiZSB1bmNoYW5nZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBQ
aWdnaW4gPG5waWdnaW5AZ21haWwuY29tPg0KPiAtLS0NCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2Jvb3QvcHBjX2FzbS5oIGIvYXJjaC9wb3dlcnBjL2Jvb3QvcHBjX2FzbS5oDQo+IGlu
ZGV4IDE5MmI5NzUyM2IwNS4uZWEyOTBiZjc4ZmIyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvYm9vdC9wcGNfYXNtLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2Jvb3QvcHBjX2FzbS5oDQo+
IEBAIC04NCw0ICs4NCw4IEBADQo+ICAgI2RlZmluZSBNRlRCVShkZXN0KQkJCW1mc3ByIGRlc3Qs
IFNQUk5fVEJSVQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2RlZmluZSBMT0FEX1JFR19BRERSKHJl
ZyxuYW1lKQkJCVwNCj4gKwlhZGRpcwlyZWcscjIsbmFtZUB0b2NAaGE7CQlcDQo+ICsJYWRkaQly
ZWcscmVnLG5hbWVAdG9jQGwNCj4gKw0KPiAgICNlbmRpZiAvKiBfUFBDNjRfUFBDX0FTTV9IICov
DQoNCldvdWxkbid0IGl0IGJlIGJldHRlciBhcyBhIEdBUyBtYWNybyA/
