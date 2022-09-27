Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF085EBA34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 07:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc84f0hkdz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 15:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DKUXYCpM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.78; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DKUXYCpM;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90078.outbound.protection.outlook.com [40.107.9.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc83q3phpz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 15:55:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUxyoFV45IY4tAnwbuIPUFNsNd6UwAjlqBq9afeRgi7S0iaKanA2aOuwn+/MqfErYjOcuq6dKRRJwT8LDgMrUDEq9vGPp4lVMKwFyiWFbq7AkU5RqlsjyG9gOd1xZ3KrMejyVKA0ta7IHQG+F5yTa0gGp5y5KXh1GXKUHX7mOiBGf8BtggHMlG5ubPRVAQ13pfU/jWYdM6CGGZtTpVF5DK/LUHAFXPgGqL4tU3w47eSO/7GE17xVaCGK7OaihNiv/OiCggok6Wu4JpNrdRkGxg01Ab5Ry0mpDzi1cBWRWSdR6tzOp/k6jArjPM6dQ0itNHhuGlaUmmQ1Fr44FIzrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WFEaFZHUEY2paNeI+5Bx7jWJg6dinaMHQK8bMEMzHo=;
 b=kY/S+qqr6rXNcQRqmLVPZgb0M3dmqFmCpTwPVD7+LDGxsx+5ZfVDuvSI/bJjd2u+gIBiDfSdHoN94kirIUJCpieH0TvOWLaajq3c9FQYJ952pDdAQaaP1/0707Rtc32ER8EAi7MLDNmV9U+WiD1jx1OxIooCjhxfsMW5inyR22e6d8r0oPwQcJe7SkDahWrHS7ljil0enQp80UH6bK0l+MWAgUUXO1C6ZyBUzGPBjWx0Y0FGnS2X6w+Xnu8CWiX9UOlgyonySHh1MZEwDPa8ueLzKFsw6Za49M8fLKw7kQA/HmoB1WyF3NHXh6KZ5yJ26J3+jPxDcjvJk8kZRGcQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WFEaFZHUEY2paNeI+5Bx7jWJg6dinaMHQK8bMEMzHo=;
 b=DKUXYCpMkDJDQTZn+ZjCzbsCA++FRTYFUbgHTAmcG//hLg/n8o7ARAblDjktjtXbQSczM+0uKmP7sl8go/rWWVp+wUYrAuP7BexM48URXgbiGbY2ggjz/lObwF4OG1ThMjypVJRqKdEWnii/5JqZoy+7ck/vAM+tHpUVHb1zxACbdCfpzkMYUyXmDDe1FBkdb6d9Qjw/Dnvi0IZCK3noRIrVARrBPCXoA4EXlFuC/fbPImKPvg4w5KtdQrqM2fGZqvYI26xwfp2Ar+lx1s+ixDSFTfDJKnAfc1wM39dK91ze9nr3RuTeJdv52148PXUkyLHnqOgGCTTjA4anYiXZyg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1985.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Tue, 27 Sep 2022 05:54:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 05:54:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Topic: [PATCH v2 1/6] powerpc/code-patching: Implement generic text
 patching function
Thread-Index: AQHY0XNe2Qn934FUS0iRuJQMSwM8K63xxvsAgADP3QCAADGYAA==
Date: Tue, 27 Sep 2022 05:54:57 +0000
Message-ID: <c712204b-f79e-fe2c-438f-58f73cbe0a95@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-2-bgray@linux.ibm.com>
 <cf9a6312-7a23-1000-8c28-4dbc1553db24@csgroup.eu>
 <ae7b4dfa7887ad1a4b3156dfc5c012bf73a1d8d6.camel@linux.ibm.com>
In-Reply-To: <ae7b4dfa7887ad1a4b3156dfc5c012bf73a1d8d6.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1985:EE_
x-ms-office365-filtering-correlation-id: 825d2b33-f15f-45b9-45ca-08daa04ccf02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vuioXIoOwDfENX+zQ9gZ1mqba5DaqxCg+eHaLRs0t28t+MQD6OWTGbzp8xnIJn2YBt/GijUQzQxtWEkm9RsM60g2BTvNEJfwQND4fU5rUqNh+cEsVRO5sMn9yn2CQB79iXdx87jzQaVdu9aMCVMEgcmZNusFv+RJMAk+w82+frKfrFqfgRxeLxKpYgx/hqZ8lmtPJXJZ39vMOBPqOddm1U4qWGyUzqvfHVb8z3nPTrSuCuJ83y7WDrYv8d1Fvv7NH2Ka/u8Wm1SuCzgBYgjEyHi0VhQUKqJMP7wGK+PIdP15xPCCdcruNyiLpFjHq5m5I+K56P2j6ZhOSfyp9mLafovSzjgKqa/dQhhSuYWiTvVpfQCplTuM621yZRm7gqtP6OQ3IT7hIcX12wPS077+5Gb6uY4Y5wvPp+mxqQOG5Sihco5Y/9vf/5ixubbLfslHgDL9bZUzSbD4qP2js2opnaO+tnd+ST0TQFWKq4Yj+ErUwkg/SyOP7GEOBZd9UxJnQ4kGPYugGG4pKvqXCtLi/pe/MMcN8M5zWPQ+BcF8+VHfYcUkbqklELPvaNev/AOi0ch5glL+H9Z1gmENTorrf9HkugL/L1OHyxC6vdpW1e6uIKvBEhYbKL5LrUq5CcCojjncxGDepAO5+r/0G3ww2ZfPw/9q9zGcJstwSICT+/w1fRjnfOCpaX1atrrXtjd0X/UQP4wgg/7nL23uoyRxQbb2gBPfUqNnC+goxtVSVgRObyccC30F8rBX4K3kRc/9E7HFGADVy9cFzhvGzMNtWmPZfnqEB/RbA9NO02t7iDGlYLH90RwNhsrf57fnSwJrpKCpGGBxhozqoeCM+1VdpgBDUdg1ZuIOfIwqGeOKKqM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199015)(110136005)(54906003)(6486002)(91956017)(5660300002)(2906002)(36756003)(83380400001)(316002)(7416002)(38070700005)(66946007)(122000001)(31696002)(76116006)(66446008)(66476007)(66556008)(86362001)(64756008)(4326008)(8676002)(41300700001)(8936002)(6506007)(44832011)(478600001)(6512007)(26005)(38100700002)(71200400001)(31686004)(186003)(2616005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S1pZNy9QR0swcjNMS0toOFUxaXJDaThVeTdFTHVSMXVKdUxsZXh4bkN2TTFJ?=
 =?utf-8?B?UTMyTHd5NVdOakFydmNvYVlpT3B1NXVlTkRIRDJHSWZUZTMzY0JPcFlIYi9F?=
 =?utf-8?B?dW80RjliSXh0WGNFL0l5RzU5SXpGZmwxTWk0ZEcxZ0gwOU5EUHlHWmxLT0NI?=
 =?utf-8?B?blhmYnJpNU5YOUs1a2FqcGg4WTRpV2VPN2dKWkZlSTd1NGFSbE5WUnZ4NFgv?=
 =?utf-8?B?ZmpCNU44UWk0cEFaN0NDQlh1UnBSZmxYYWNyNUhmcEgwQ1oxTHdTZ0cvaTY0?=
 =?utf-8?B?MzF6emMzUXJkNHN6WnpFaENhSWx1bXV2RDJ5U1dza01KRXN2Q0JCQWgwWDdk?=
 =?utf-8?B?blg3clNGNEp5enZuWWVsS1VhYWpaZVM0Zk1lYzVDaWZ6VkZHcFFhMmhDbThQ?=
 =?utf-8?B?UGVZbjRDbkE0dWFyaytXSUNIeTdjY1A2RGx6OVJvVTBFM1QybFMzdUcwTkEy?=
 =?utf-8?B?T2w1T3p3VFUxNFcvcWphMmRkckczczFqMklWNXZvSUZkVjhmTTRRNEY2WE1h?=
 =?utf-8?B?NEtJbW42dXZMYmhqSG40TVdGSjkxMm5STXpFalBFSml1QkUzZ01QbGMrU0Nt?=
 =?utf-8?B?cUE1K1NVNGhXVm9JejA5TVVjdzJkR2J6bldKdDY5bFVHLzBLNXdkWmNxcVhP?=
 =?utf-8?B?MEpidHF1V1JKZFlrUzRzalVlY1hqenFxdDMycVczQmpQWHBJWExtUWtjWkZI?=
 =?utf-8?B?M29sanIyQnNBS213U2N3WENSYjYwRkxucXFzdGxDYlhiK0MzYTI5c1hSc1Bo?=
 =?utf-8?B?VVdEVzJiVzhnamlQWTl2U0s4UXVCTnh4UWRaNlpTdjBvWWxBV05HNWJScjVj?=
 =?utf-8?B?cHlJdzV0MXN1eHVRbmdKdXNxblMvZ0VWbHZOQURObWxTYzdwenM3eldrdWF1?=
 =?utf-8?B?R3pwSXFPRlU5NCtScC9YeDR1bXVjbk5QbnExbXFVMkZZbEpoNnRXUEJUWUFo?=
 =?utf-8?B?RW5KZU5ibEE4N0EvTUxHOXFCUEpKZERpTktlaHVTamJhR3I1SHNEMjNVblZm?=
 =?utf-8?B?WDRBaEhTUURVU015eTVDaUlMK1cydCtQaUhla20veW9rVE1vdk1hZy9jd0Qx?=
 =?utf-8?B?VTBUZ2FoUC9VelUzSU9CK1hlc0FyRlpYcUIwRFZWb1VCeUEyTlptb0NMYUtm?=
 =?utf-8?B?MzZnUGpyMVNiNHQ1OGI2YVcvSVBNOFlSamdzMjUzdnRhUWpheENOMjZ4YmFt?=
 =?utf-8?B?WVEzbjZwMWdaYVdyRWE5ZnlxMkg4K1J6aFRoR2M4NEsxaVlzSGx0cnpybDhZ?=
 =?utf-8?B?ZTk2UVduSzVaWis1OVY2UXFEenlXcWVEdE5PMjQzRGpJdy91OTU5aG1mV1Vy?=
 =?utf-8?B?TDEwZUFDcEdyNlhpZVZEQ1gwYkFoUmdjWHFWaXlQU2tFWUdpT0svZlhDS0x0?=
 =?utf-8?B?OVV2TTY3SFcwODVZUW1sK2J0RzI1V1JXSWlCNVpKd3pmMzBCMHlLcGJQQlF3?=
 =?utf-8?B?QXdIbURTdktrYjVtdE9IMGZoUktGQTFGclRwdmdLMFgzVVB4L09XSXp1eGx6?=
 =?utf-8?B?WDd6OUlZV3QyS001UXZUR1dQMUt5enhSZG5aejFzOW95eVc5VjFocXYza0tr?=
 =?utf-8?B?WFZyYTV3WFNFSHV0ajgvQldCSUxTSkFHQ21nNHRkdUQxd0NLK1hYL280bzAw?=
 =?utf-8?B?amVCZFV1Z1JHanBIMVVqek0wa1NBN0VVenNGcXVFUEtTa2tld3JxTjZPWDhJ?=
 =?utf-8?B?SS82ZitZRGhpYVV2UGVaaGkzRWJIcmhoNWxXUTJYM29OSHIwejY0TmVQdnVj?=
 =?utf-8?B?RzNldmtHWDhnYjdVcGFpSEFPaXNad3hodVZUNmRLRDFMdTQ4cHJnMituUnlP?=
 =?utf-8?B?TFFRYTkwR3FvVEVqM0lIR3EwOVJhNG5zMXJtNnJCc1BDYS9aLzhoRzR0b0kv?=
 =?utf-8?B?Yk9yTnBWaUJuTDVoVXUvYlplL3czd2Rjc0NCamQ4eWhxM2E3RlQzazg1S1lS?=
 =?utf-8?B?R3ZBcXUxV205ampSMzBtUUJtdEdHSjhsb2VkcmJITFJ0K0l5L1RpeFNaeWFl?=
 =?utf-8?B?VTRqbUZ2ZFdhZW1QQWN6enh2UGwyYUVhcmJyRmdZOVlsOXZBeGplRFl3MXhG?=
 =?utf-8?B?b25YMDRqYWk5d2pvNE9Oc3lTMTBRRTRqNk0vQ0dCVGNSVmtncWlYNjViUmdl?=
 =?utf-8?B?L2NPbTBOaCtSY1VSMkRjRlM0S0FPdFBUK1l6TU1iaUlmWHVCZXhWeFN5cUJR?=
 =?utf-8?Q?qKUuAaj1qGXOiJH90DELF+o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1F8955B8FC71145953A84B9872B3DE6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 825d2b33-f15f-45b9-45ca-08daa04ccf02
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 05:54:57.6712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AdGIrHils7Z6a5gNMyTzWUz0nt0ZXxaOmqmezRdMeN8kelWeCdCe4cO/zozGAkZTZXFLiTOU27oBFG8ncuqSYi2VXuA9+PyNM5ngx+7IKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1985
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA5LzIwMjIgw6AgMDQ6NTcsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCAyMDIyLTA5LTI2IGF0IDE0OjMzICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4+ICsjZGVmaW5lIHBhdGNoX21lbW9yeShhZGRyLCB2YWwpIFwNCj4+PiArKHsgXA0KPj4+
ICvCoMKgwqDCoMKgwqDCoEJVSUxEX0JVR19PTighX19uYXRpdmVfd29yZCh2YWwpKTsgXA0KPj4+
ICvCoMKgwqDCoMKgwqDCoF9fcGF0Y2hfbWVtb3J5KGFkZHIsICh1bnNpZ25lZCBsb25nKSB2YWws
IHNpemVvZih2YWwpKTsgXA0KPj4+ICt9KQ0KPj4NCj4+IENhbiB5b3UgZG8gYSBzdGF0aWMgX19h
bHdheXNfaW5saW5lIGZ1bmN0aW9uIGluc3RlYWQgb2YgYSBtYWNybyBoZXJlDQo+PiA/DQo+IA0K
PiBJIGRpZG4ndCBiZWZvcmUgYmVjYXVzZSBpdCBkb2Vzbid0IGFsbG93IHVzaW5nIHRoZSB0eXBl
IGFzIGEgcGFyYW1ldGVyLg0KPiBJIGNvbnNpZGVyZWQgdGhlc2UgZm9ybXMNCj4gDQo+ICAgIHBh
dGNoX21lbW9yeShhZGRyLCB2YWwsIDgpOw0KPiAgICBwYXRjaF9tZW1vcnkoYWRkciwgdmFsLCB2
b2lkKik7DQo+ICAgIHBhdGNoX21lbW9yeShhZGRyLCB2YWwpOyAgLy8gc2l6ZSB0YWtlbiBmcm9t
IHZhbCB0eXBlDQo+IA0KPiBBbmQgdGhvdWdodCB0aGUgdGhpcmQgd2FzIHRoZSBuaWNlc3QgdG8g
dXNlLiBUaG91Z2ggY29taW5nIGJhY2sgdG8NCj4gdGhpcywgSSBoYWRuJ3QgY29uc2lkZXJlZA0K
PiANCj4gICAgcGF0Y2hfbWVtb3J5KGFkZHIsIHZhbCwgc2l6ZW9mKHZvaWQqKSkNCj4gDQo+IHdo
aWNoIHdvdWxkIHN0aWxsIGFsbG93IGEgdHlwZSB0byBkZWNpZGUgdGhlIHNpemUsIGFuZCBub3Qg
YmUgYSBtYWNyby4NCj4gSSd2ZSBnb3QgYW4gZXhhbXBsZSBpbXBsZW1lbnRhdGlvbiBmdXJ0aGVy
IGRvd24gdGhhdCBhbHNvIGFkZHJlc3NlcyB0aGUNCj4gc2l6ZSBjaGVjayBpc3N1ZS4NCg0KT2gs
IEkgbWlzc2VkIHRoYXQgeW91IGRpZCBhdXRvbWF0aWMgdHlwZSBzaXppbmcuIEZhaXIgZW5vdWdo
Lg0KDQpIb3dldmVyIEkgdGhpbmsgdGFraW5nIHRoZSB0eXBlIG9mIHRoZSBwYXNzZWQgdmFsdWUg
aXMgZGFuZ2Vyb3VzLg0KDQpTZWUgcHV0X3VzZXIoKSwgaXQgdXNlcyB0aGUgc2l6ZSBvZiB0aGUg
ZGVzdGluYXRpb24gcG9pbnRlciwgbm90IHRoZSANCnNpemUgb2YgdGhlIGlucHV0IHZhbHVlLg0K
DQpwYXRjaF9tZW1vcnkgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQgb3V0c2lkZSBvZiBjb2RlLXBh
dGNoaW5nLmMsIHNvIEkgDQpkb24ndCB0aGluZyBpdCBpcyB3b3J0aCB0byB3b3JyeSBhYm91dCBh
IG5pY2UgbG9va2luZyBBUEkuIEp1c3QgbWFrZSBpdCANCnNpbXBsZSBhbmQgcGFzcyB0aGUgc2l6
ZSB0byB0aGUgZnVuY3Rpb24uDQoNCj4gDQo+Pj4gK3N0YXRpYyBpbnQgX19hbHdheXNfaW5saW5l
IF9fX3BhdGNoX21lbW9yeSh2b2lkICpwYXRjaF9hZGRyLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZGF0YSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB2b2lkICpwcm9nX2FkZHIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6
ZV90IHNpemUpDQo+Pg0KPj4gSXMgaXQgcmVhbGx5IG5lZWRlZCBpbiB0aGUgLmMgZmlsZSA/IEkg
d291bGQgZXhwZWN0IEdDQyB0byB0YWtlIHRoZQ0KPj4gcmlnaHQgZGVjaXNpb24gYnkgaXRzZWxm
Lg0KPiANCj4gSSB0aG91Z2h0IGl0J2QgYmUgYmV0dGVyIHRvIGFsd2F5cyBpbmxpbmUgaXQgZ2l2
ZW4gaXQncyBvbmx5IHVzZWQNCj4gZ2VuZXJpY2FsbHkgaW4gZG9fcGF0Y2hfbWVtb3J5IGFuZCBf
X2RvX3BhdGNoX21lbW9yeSwgd2hpY2ggYm90aCBnZXQNCj4gaW5saW5lZCBpbnRvIF9fcGF0Y2hf
bWVtb3J5LiBCdXQgaXQgZG9lcyBlbmQgdXAgZ2VuZXJhdGluZyB0d28gY29waWVzDQo+IGR1ZSB0
byB0aGUgZGlmZmVyZW50IGNvbnRleHRzIGl0J3MgY2FsbGVkIGluLCBzbyBwcm9iYWJseSBub3Qg
d29ydGggaXQuDQo+IFJlbW92ZWQgZm9yIHYzLg0KPiANCj4gKHJhd19wYXRjaF9pbnN0cnVjdGlv
biBnZXRzIGFuIG9wdGltaXNlZCBpbmxpbmUgb2YgX19fcGF0Y2hfbWVtb3J5DQo+IGVpdGhlciB3
YXkpDQo+IA0KPj4gQSBCVUlMRF9CVUcoKSB3b3VsZCBiZSBiZXR0ZXIgaGVyZSBJIHRoaW5rLg0K
PiANCj4gQlVJTERfQlVHKCkgYXMgdGhlIGRlZmF1bHQgY2FzZSBhbHdheXMgdHJpZ2dlcnMgdGhv
dWdoLCBJIGFzc3VtZQ0KPiBiZWNhdXNlIHRoZSBjb25zdGFudCB1c2VkIGZvciBzaXplIGlzIHRv
byBmYXIgYXdheS4gSG93IGFib3V0DQo+IA0KPiAgICBzdGF0aWMgX19hbHdheXNfaW5saW5lIGlu
dCBwYXRjaF9tZW1vcnkodm9pZCAqYWRkciwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IHNpemUpDQo+ICAgIHsNCj4gICAgICAgIGlu
dCBfX3BhdGNoX21lbW9yeSh2b2lkICpkZXN0LCB1bnNpZ25lZCBsb25nIHNyYywgc2l6ZV90IHNp
emUpOw0KPiANCj4gICAgICAgIEJVSUxEX0JVR19PTl9NU0coIShzaXplID09IHNpemVvZihjaGFy
KSAgfHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID09IHNpemVvZihzaG9ydCkg
fHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID09IHNpemVvZihpbnQpICAgfHwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID09IHNpemVvZihsb25nKSksDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICJVbnN1cHBvcnRlZCBzaXplIGZvciBwYXRjaF9tZW1vcnki
KTsNCj4gICAgICAgIHJldHVybiBfX3BhdGNoX21lbW9yeShhZGRyLCB2YWwsIHNpemUpOw0KPiAg
ICB9DQo+IA0KPiBEZWNsYXJpbmcgdGhlIF9fcGF0Y2hfbWVtb3J5IGZ1bmN0aW9uIGluc2lkZSBv
ZiBwYXRjaF9tZW1vcnkgZW5mb3JjZXMNCj4gdGhhdCB5b3UgY2FuJ3QgYWNjaWRlbnRhbGx5IGNh
bGwgX19wYXRjaF9tZW1vcnkgd2l0aG91dCBnb2luZyB0aHJvdWdoDQo+IHRoaXMgb3IgdGhlICpw
YXRjaF9pbnN0cnVjdGlvbiBlbnRyeSBwb2ludHMgKHdoaWNoIGhhcmRjb2RlIHRoZSBzaXplKS4N
Cg0KQXJlbid0IHlvdSBtYWtpbmcgaXQgbW9yZSBkaWZmaWN1bHQgdGhhdCBuZWVkZWQgPyBUaGF0
J3MgQywgbm90IEMgcGx1cyANCnBsdXMgYW5kIHdlIGFyZSBub3QgdHJ5aW5nIHRvIGhlbHAgdGhl
IHVzZXIuDQpBbGwga2VybmVsIGRldmVsb3BwZXJzIGtub3cgdGhhdCBhcyBzb29uIGFzIHRoZXkg
dXNlIGEgZnVuY3Rpb24gdGhhdCBoYXMgDQphIGxlYWRpbmcgZG91YmxlIHVuZGVyc2NvcmUgdGhl
eSB3aWxsIGJlIG9uIHRoZWlyIG93bi4NCg0KQW5kIGFnYWluLCBwYXRjaF9tZW1vcnkoKSBpc24n
dCB1c2VkIGFueXdoZXJlIGVsc2UsIGF0IGxlYXN0IGZvciB0aGUgDQp0aW1lIGJlaW5nLCBzbyB3
aHkgd29ycnkgYWJvdXQgdGhhdCA/DQoNCj4gDQo+Pj4gK8KgwqDCoMKgwqDCoMKgfQ0KPj4+DQo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fcHV0X2tlcm5lbF9ub2ZhdWx0KHBh
dGNoX2FkZHIsICZ2YWwsIHUzMiwNCj4+PiBmYWlsZWQpOw0KPj4+IC3CoMKgwqDCoMKgwqDCoH0g
ZWxzZSB7DQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCB2YWwgPSBwcGNf
aW5zdF9hc191bG9uZyhpbnN0cik7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgZGNic3QocGF0Y2hfYWRk
cik7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgZGNic3QocGF0Y2hfYWRkciArIHNpemUgLSAxKTsgLyog
TGFzdCBieXRlIG9mIGRhdGEgbWF5DQo+Pj4gY3Jvc3MgYSBjYWNoZWxpbmUgKi8NCj4+DQo+PiBP
ciB0aGUgc2Vjb25kIGJ5dGUgb2YgZGF0YSBtYXkgY3Jvc3MgYSBjYWNoZWxpbmUgLi4uDQo+IA0K
PiBJdCBtaWdodCwgYnV0IHVubGVzcyB3ZSBhcmUgYXNzdW1pbmcgZGF0YSBjYWNoZWxpbmVzIHNt
YWxsZXIgdGhhbiB0aGUNCj4gbmF0aXZlIHdvcmQgc2l6ZSBpdCB3aWxsIGVpdGhlciBiZSBpbiB0
aGUgZmlyc3Qgb3IgbGFzdCBieXRlJ3MNCj4gY2FjaGVsaW5lLiBXaGVyZWFzIHRoZSBsYXN0IGJ5
dGUgbWlnaHQgYmUgaW4gaXQncyBvd24gY2FjaGVsaW5lLg0KPiANCj4gQXMganVzdGlmaWNhdGlv
biB0aGUgY29tbWVudCdzIG1pc2xlYWRpbmcgdGhvdWdoLCBob3cgYWJvdXQgcmVkdWNpbmcgaXQN
Cj4gdG8gImRhdGEgbWF5IGNyb3NzIGEgY2FjaGVsaW5lIiBhbmQgbGVhdmluZyB0aGUgcmVhc29u
IGZvciBmbHVzaGluZyB0aGUNCj4gbGFzdCBieXRlIGltcGxpY2l0Pw0KDQpZZXMgdGhhdCB3YXMg
bXkgd29ycnksIGEgbWlzbGVhZGluZyBjb21tZW50Lg0KSSB0aGluayAiZGF0YSBtYXkgY3Jvc3Mg
YSBjYWNoZWxpbmUiIGlzIHdoYXQgd2UgbmVlZCBhcyBhIGNvbW1lbnQuDQoNCj4gDQo+Pj4gLXN0
YXRpYyBpbnQgX19kb19wYXRjaF9pbnN0cnVjdGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5z
dHIpDQo+Pj4gK3N0YXRpYyBpbnQgX19hbHdheXNfaW5saW5lIF9fZG9fcGF0Y2hfbWVtb3J5KHZv
aWQgKmRlc3QsIHVuc2lnbmVkDQo+Pj4gbG9uZyBzcmMsIHNpemVfdCBzaXplKQ0KPj4+ICDCoCB7
DQo+Pg0KPj4gV2hhb3UsIGRvIHdlIHJlYWxseSB3YW50IGFsbCB0aGlzIHRvIGJlIF9fYWx3YXlz
X2lubGluZSA/IERpZCB5b3UNCj4+IGNoZWNrDQo+PiB0aGUgdGV4dCBzaXplIGluY3JlYXNlID8N
Cj4gDQo+IFRoZXNlIG9uZXMgYXJlIHJlZHVuZGFudCBiZWNhdXNlIEdDQyB3aWxsIGFscmVhZHkg
aW5saW5lIHRoZW0sIHRoZXkNCj4gd2VyZSBqdXN0IHBhcnQgb2YgZXhwZXJpbWVudGluZyBpbmxp
bmluZyBfX19wYXRjaF9tZW1vcnkuIFdpbGwgcmVtb3ZlDQo+IGZvciB2My4NCj4gDQo+IFRoZSB0
ZXh0IHNpemUgZG9lc24ndCBpbmNyZWFzZSB0aG91Z2ggYmVjYXVzZSB0aGUgY2FsbCBoaWVyYXJj
aHkgaXMNCj4ganVzdCBhIGxpbmVhciBjaGFpbiBvZg0KPiBfX3BhdGNoX21lbW9yeSAtPiBkb19w
YXRjaF9tZW1vcnnCoC0+IF9fZG9fcGF0Y2hfbWVtb3J5DQoNClllcywgSSBoYWQgaW4gbWluZCB0
aGF0IGFsbCB0aG9zZSB3b3VsZCBiZSBpbmxpbmVkIGRvaW5nIHRvIGFsbCBjYWxsZXJzIA0Kb2Yg
cGF0Y2hfaW5zdHJ1Y3Rpb24oKSBhbmQgcGF0Y2hfbWVtb3J5KCksIGJ1dCBvZiBjb3Vyc2UgaXQg
c3RheXMgaW4gDQpjb2RlX3BhdGNoaW5nLmMgc28gdGhhdCdzIG5vdCBhIHByb2JsZW0uDQoNCj4g
DQo+IFRoZSBlbnRyeSBwb2ludCBfX3BhdGNoX21lbW9yeSBpcyBub3QgaW5saW5lZC4=
