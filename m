Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D244D6D3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 08:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFvcl0Yj5z3bZl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 18:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFvcB3kKFz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 18:31:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eooWYHY7Xdnm60vFi4rJm38CIgDzuL4+hiJyE/AnhYfT7k5Cc/nOjDoLRzQGSr8Sx5LL1KOsGjxJ8DFdnyafxgrZGgCIwuKzR7lOx1h365wYCM9J06fztoEBEERB4xdeSDWjlWrni6q/H/9mtkKz57CByJa9XnFZ8SEiuVd2XJb35hC9WHFgC44InYlnEjkX7raNbr0V+5h00wXXUeFJPWULjlrnUfRDZeRx+x9+5EFlYSqOnrb9cSl6n0EDnCJnlLQ7QwXwLNQyIuwrH42drXGjjlffWMRpQI4OwbmeYAEvlvLiq1bsHxy5NOjsmlNePI/MxA/+ZI38iINefhHtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AFEfvUdbOy6F+ukYb3iMboxr4OM9uKtvgdEzQg011Y=;
 b=m/3GVQ43Fm03McBHvgLcNLmCEpyk0UNkFqoNDYvm2JphZrLtQ2lg4K1z2ziWhFttnrTt0/WaqCrzNPZgjtv8FFMAa626rEmozrbx8iZuONQA3O/mVwisu37/BoYu0JgTLh/fAHDhjZGuSL0rx9mRqIstIfWMvHa49WW2zdrJAQl2R5B1RgV59xkiAC2gpc4z7pyMGmiyDChVf/O47zbIT/ASESdtxEmAcUJpTtqeQHb2qfppYvFiWOsCYOvJHV3cYGu1MXePRO/JbJ8J+TLMrFdQUa2Z+B/+mvftBTBJUmY7D7ClR6wCVWGk1jDT/WwW4kD/V8bDjT4WTUOUMsIhvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1655.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Sat, 12 Mar
 2022 07:30:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%5]) with mapi id 15.20.5061.025; Sat, 12 Mar 2022
 07:30:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jordan Niethe <jniethe5@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v7 3/5] powerpc: Rework and improve STRICT_KERNEL_RWX
 patching
Thread-Topic: [PATCH v7 3/5] powerpc: Rework and improve STRICT_KERNEL_RWX
 patching
Thread-Index: AQHX1ct7yac1TU9Bh0uIOZtYifF5u6y8Go2A
Date: Sat, 12 Mar 2022 07:30:38 +0000
Message-ID: <69fafbf6-2d3f-4589-1ebf-e6e4216e850c@csgroup.eu>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
 <20211110003717.1150965-4-jniethe5@gmail.com>
In-Reply-To: <20211110003717.1150965-4-jniethe5@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f535943e-5996-4bd4-fd48-08da03fa3484
x-ms-traffictypediagnostic: MRZP264MB1655:EE_
x-microsoft-antispam-prvs: <MRZP264MB1655B036AA858A3DED3D6096ED0D9@MRZP264MB1655.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rIg+LGc8slNFsCAFP1+5HYF8pNHnd5sN8bWaJsc02tYAT+6ec8PsnfQ7fsxpsoBcP6DiMvqgIdtyI7jZEcEB5CGvk0qddp6Cdc3LDTjIyPB7EBoOANCVe0x+7wFp5tUFFYKazqnZqrYqGjWWQL8GIJ8bq8i6OQegZacIUlWgJVWxh6lBnPCu7clIbtl3P89I3QvwUy0M0dRoaa0zGuSuFXwonxRIVQw2uoftAGbsBmWGUhy9lB8t3E8NnR62e+qb60oEA02Gm/l3tONorT64kKtidDXQlHs+/mlBpIZEOnoerH+VBqjqhJWnsVZjDEhKKb098tvYm5jsdSXBYRs9nAJotpIJWc2q5ySEBtWviCfgKbZ7tkmpaInRtAi4ywm1eVVhDqw590j7/pcxqLZCpU9ryEhTjlDNHq9jsRIavIs2DQa6skCTWIlM0CbwpWJ1HztheXL3emXJgvGTyIbuLIn79mg0ZzEmUnOuaIBR4v+nWIZ+6SBCJemSDeG2VEYMgI6KBMnINNtQQxG8np8nFbil4ZqAJsQ4QhqJd1IkXaAcXeRrGcw2Fm0lOlo7BTqOI4+Sf8fi4vUjcqLL6g8aQHZLCbdE0yvr1l+VZM7HL0sIFVO9r6JuaUv01HHS9sxUjqBlZ3R4b/Ad/JC1/AGRGXWntG0MOKO23WOfXuoMMq+d0nQobym3ZAlcdQODlBOKhekBnX1jbkbDxvGPEz8aEjcucgjo187rsBGLfB5n04vbZgRBfCJ9GXLdiElOlRpFkJzCBnYH0UiKzDK7mgmQBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(38070700005)(26005)(83380400001)(2616005)(66574015)(122000001)(38100700002)(31696002)(91956017)(66946007)(86362001)(66556008)(66446008)(66476007)(64756008)(8676002)(4326008)(110136005)(76116006)(2906002)(316002)(31686004)(8936002)(5660300002)(44832011)(36756003)(508600001)(6506007)(6486002)(6512007)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3J4Z0tWaWZ0VEdRTy9SY2xlYU01SEYwck4zVzJkb25PYmJiRVZ4R2FvdGhI?=
 =?utf-8?B?L3c0OEphNGdoVDlJaEhIZ1VySC9HdER0UEpjWDZSd2x2cG1YdkdzREtzOGJp?=
 =?utf-8?B?QkREb3BrSGNiOXhqZ1R6RGF3cG41ektkU2NzbkNLdllrbGRiTmpJTWVEYW1z?=
 =?utf-8?B?TEQzaXdtcksraWVhMUhZbFFQaTBvUFZiSmZYYWVhNzlTVEd0UjJsa05qUWk1?=
 =?utf-8?B?Ykc0S3o5Z0hDNnFweDNSek9wdTdBOU5TOU5Fc1VtQjRUSkNIVnM5dDY0Z00x?=
 =?utf-8?B?UjlCdXRwUlhYOUhpc2NzYkNIaEtIY0V5Sm02eDMwRGFJYlpKY0szSE1jSmNt?=
 =?utf-8?B?dlowODYxakxQWFZndWNwUXg2WjdzemcrVVlwNjVxMk5Dd1FaUFlUSXh6djdE?=
 =?utf-8?B?MjJpMXhHdzByZW10MmFzTHI0ZlVkTzAxd3FKeFJTc0lRTzRiVmFpTFNkSllu?=
 =?utf-8?B?N1RwWU1tSThmc3ZMTnY5cDhUaU5hOUtQZEFXVVVnaHFFQWxUck5lRS9Ra0Zo?=
 =?utf-8?B?OHZVeFFTMEp2Um4wNzlUaWUyaW4ycGJNS0hqME1XenhuZjQ5R3VTQURRS21Q?=
 =?utf-8?B?cHBUMnNKaENnWHZiRCswdU45ckdmTmFKYytVZmJQeStRMmx3dWszL00xRllt?=
 =?utf-8?B?MXh1ZFA0Z25ZQ3REbkZJLzU2Y0Fvc3pxM0E4V1g0dDBEMFBQL3ZoNFAzd2px?=
 =?utf-8?B?MzR6U2FiU0hIZVp1dWo5dGpYV0VlaW84cURYd0JzSE5FVkxtYnU3bkZ6WmtQ?=
 =?utf-8?B?Y1BzQkZjSkFsL05xQ3hsWGlxN3p4d0pyQzZPeVJqMzNBYVBDZWdwSTYwMmV1?=
 =?utf-8?B?OVpZWHh3TllEbGJERXNaVEVoV1ZrV0RiRTNqdlZnQ2Q1dXc3WmQ4dmRMbXYy?=
 =?utf-8?B?TmZsZjZJSXVOWXNVUDROQmhGZEVMNndIRE5YeGhVSW5qZXVrZTJXOWxUSFRE?=
 =?utf-8?B?V2dDTTJ4YmxEclArd3FLNHcxT1Y1WDJNZXhEUngyYWtSVjZWMjUvTm9LU05o?=
 =?utf-8?B?Z3ZvYy94aDZHRFR1TksxZ0R3aVlvaWtTZXhINlNzUnQ4TndZaE9EZHk2OGtP?=
 =?utf-8?B?bEdndVhFS2xtQnJJZDNUT2pOZWcySU9OeUcyamgvQzVXdGdzNW9uTjlGQlMr?=
 =?utf-8?B?RmZ5TElhTXkrTDhwV0hrMHlRVE10K0VIT1Y2dGc4WVdmcXN2dWhlMnZMR21O?=
 =?utf-8?B?NzJrclFXL0p3V2w5Y2V4L2oxZC95bEowQkNQU3Ftb3JlQ21sYnIyRzA5cWhJ?=
 =?utf-8?B?bVVaRFhLU0JDVUV6VmcxM2VINUVleWJCK3ZkN1B4bEFFNlRjOHp0cHMySmdv?=
 =?utf-8?B?SWJBWE1JZ2d4SVg0a2NiaW9HVkkvc3NHcFpBeGVYTGgxRVV6eFBud1NkNG1i?=
 =?utf-8?B?c1RmeWJPNTFUSFZrYmU4UkZFR2dzTmJTK3QrR1cwUHJlSUVaN25Ud2g2WE5Z?=
 =?utf-8?B?QXFsOG1XT3Z6WkNVRUhFdnNWZzhnd1NLMFhBZkowc0lIcXVsRGphU3lpcmVD?=
 =?utf-8?B?NHVES08ybTNDR2VXYkl6MGQ1VDNhckNZb1pHN3d5elRFODgvRk42djRORmh3?=
 =?utf-8?B?cHVSTWc5NlZ6d3p5T1ZJbmVTeGRyeElRaDRMY1p3VGU5ZnVGTXNOVXp6QXVX?=
 =?utf-8?B?WGpYVXRwL1MxQnBWNUc4bmV6aWZqVHVrMkVDdmR5dXZLSEhldy8vMlVvNVQ1?=
 =?utf-8?B?a3hyUm9EdnhsSitIRUJZWXNYVHFVWVJjWStGckZmQnQ1aVBWMm0renRGdDQ4?=
 =?utf-8?B?QVc1TFhHczlFcGxyWW1VRjNKc2JvdG5SMGRzNGZnYU4veGVDL1RvK0x3Nm42?=
 =?utf-8?B?b0FVemxTMGphNTRHTm81OFAxaWVTQTRGS0gxWGM2NVVEUnI5UHIrdUNxYlNI?=
 =?utf-8?B?Yk5lU1Q1R0FXa0VtQzVjcVBydDNPYXFCQ20vNW9kTVNtZE5RUnFYVTROQ2pH?=
 =?utf-8?B?REpvZXBmcFBRM2YwUkJRU2VQR011MkRSVEcwbXh4dHlMdzZsaXd5Tnd5MTdn?=
 =?utf-8?Q?II2a6jrqdHpPLZiKhxH6LyDszWB67E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87A12FC54273E34D87D3088038565360@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f535943e-5996-4bd4-fd48-08da03fa3484
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2022 07:30:38.3559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmpIJxk6wQ5XIugnPDMWnbF+3OhAeUanImmXCVV66FjyYCMJbtfposPKFYCXnCZab02ozY6aucY+v606F1nV/AItHoHZ88qH5Tes9QONMxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1655
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
Cc: "cmr@bluescreens.de" <cmr@bluescreens.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSm9yZGFuDQoNCkxlIDEwLzExLzIwMjEgw6AgMDE6MzcsIEpvcmRhbiBOaWV0aGUgYSDDqWNy
aXTCoDoNCj4gRnJvbTogIkNocmlzdG9waGVyIE0uIFJpZWRsIiA8Y21yQGJsdWVzY3JlZW5zLmRl
Pg0KPiANCj4gUmV3b3JrIGNvZGUtcGF0Y2hpbmcgd2l0aCBTVFJJQ1RfS0VSTkVMX1JXWCB0byBw
cmVwYXJlIGZvciBhIGxhdGVyIHBhdGNoDQo+IHdoaWNoIHVzZXMgYSB0ZW1wb3JhcnkgbW0gZm9y
IHBhdGNoaW5nIHVuZGVyIHRoZSBCb29rM3M2NCBSYWRpeCBNTVUuDQo+IE1ha2UgaW1wcm92ZW1l
bnRzIGJ5IGFkZGluZyBhIFdBUk5fT04gd2hlbiB0aGUgcGF0Y2hzaXRlIGRvZXNuJ3QgbWF0Y2gN
Cj4gYWZ0ZXIgcGF0Y2hpbmcgYW5kIHJldHVybiB0aGUgZXJyb3IgZnJvbSBfX3BhdGNoX2luc3Ry
dWN0aW9uKCkgcHJvcGVybHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBNLiBS
aWVkbCA8Y21yQGJsdWVzY3JlZW5zLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gTmlldGhl
IDxqbmlldGhlNUBnbWFpbC5jb20+DQo+IC0tLQ0KPiB2Nzogc3RpbGwgcGFzcyBhZGRyIHRvIG1h
cF9wYXRjaF9hcmVhKCkNCg0KDQpUaGlzIHBhdGNoIGRvZXNuLXQgYXBwbHksIGNhbiB5b3UgcmVi
YXNlIHRoZSBzZXJpZXMgPw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiAtLS0NCj4gICBhcmNo
L3Bvd2VycGMvbGliL2NvZGUtcGF0Y2hpbmcuYyB8IDIwICsrKysrKysrKystLS0tLS0tLS0tDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jIGIvYXJjaC9w
b3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gaW5kZXggMjlhMzBjMzA2OGZmLi5kNTg2YmY5
Yzc1ODEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jDQo+IEBAIC03NSw2ICs3NSw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzdG9wX3VzaW5nX3RlbXBfbW0oc3RydWN0IHRlbXBfbW1f
c3RhdGUgcHJldl9zdGF0ZSkNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIERFRklORV9QRVJfQ1BV
KHN0cnVjdCB2bV9zdHJ1Y3QgKiwgdGV4dF9wb2tlX2FyZWEpOw0KPiArc3RhdGljIERFRklORV9Q
RVJfQ1BVKHVuc2lnbmVkIGxvbmcsIGNwdV9wYXRjaGluZ19hZGRyKTsNCj4gICANCj4gICBzdGF0
aWMgaW50IHRleHRfYXJlYV9jcHVfdXAodW5zaWduZWQgaW50IGNwdSkNCj4gICB7DQo+IEBAIC04
Nyw2ICs4OCw3IEBAIHN0YXRpYyBpbnQgdGV4dF9hcmVhX2NwdV91cCh1bnNpZ25lZCBpbnQgY3B1
KQ0KPiAgIAkJcmV0dXJuIC0xOw0KPiAgIAl9DQo+ICAgCXRoaXNfY3B1X3dyaXRlKHRleHRfcG9r
ZV9hcmVhLCBhcmVhKTsNCj4gKwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfYWRkciwgKHVu
c2lnbmVkIGxvbmcpYXJlYS0+YWRkcik7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4g
QEAgLTE3MiwxMSArMTc0LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IHVubWFwX3BhdGNoX2FyZWEo
dW5zaWduZWQgbG9uZyBhZGRyKQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgZG9fcGF0Y2hfaW5zdHJ1
Y3Rpb24odTMyICphZGRyLCBzdHJ1Y3QgcHBjX2luc3QgaW5zdHIpDQo+ICAgew0KPiAtCWludCBl
cnI7DQo+ICsJaW50IGVyciwgcmMgPSAwOw0KPiAgIAl1MzIgKnBhdGNoX2FkZHIgPSBOVUxMOw0K
PiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgIAl1bnNpZ25lZCBsb25nIHRleHRfcG9rZV9h
ZGRyOw0KPiAtCXVuc2lnbmVkIGxvbmcga2FkZHIgPSAodW5zaWduZWQgbG9uZylhZGRyOw0KPiAg
IA0KPiAgIAkvKg0KPiAgIAkgKiBEdXJpbmcgZWFybHkgZWFybHkgYm9vdCBwYXRjaF9pbnN0cnVj
dGlvbiBpcyBjYWxsZWQNCj4gQEAgLTE4OCwxNSArMTg5LDEzIEBAIHN0YXRpYyBpbnQgZG9fcGF0
Y2hfaW5zdHJ1Y3Rpb24odTMyICphZGRyLCBzdHJ1Y3QgcHBjX2luc3QgaW5zdHIpDQo+ICAgDQo+
ICAgCWxvY2FsX2lycV9zYXZlKGZsYWdzKTsNCj4gICANCj4gLQl0ZXh0X3Bva2VfYWRkciA9ICh1
bnNpZ25lZCBsb25nKV9fdGhpc19jcHVfcmVhZCh0ZXh0X3Bva2VfYXJlYSktPmFkZHI7DQo+IC0J
aWYgKG1hcF9wYXRjaF9hcmVhKGFkZHIsIHRleHRfcG9rZV9hZGRyKSkgew0KPiAtCQllcnIgPSAt
MTsNCj4gKwl0ZXh0X3Bva2VfYWRkciA9IF9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfYWRk
cik7DQo+ICsJZXJyID0gbWFwX3BhdGNoX2FyZWEoYWRkciwgdGV4dF9wb2tlX2FkZHIpOw0KPiAr
CWlmIChlcnIpDQo+ICAgCQlnb3RvIG91dDsNCj4gLQl9DQo+IC0NCj4gLQlwYXRjaF9hZGRyID0g
KHUzMiAqKSh0ZXh0X3Bva2VfYWRkciArIChrYWRkciAmIH5QQUdFX01BU0spKTsNCj4gICANCj4g
LQlfX3BhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc3RyLCBwYXRjaF9hZGRyKTsNCj4gKwlwYXRj
aF9hZGRyID0gKHUzMiAqKSh0ZXh0X3Bva2VfYWRkciB8IG9mZnNldF9pbl9wYWdlKGFkZHIpKTsN
Cj4gKwlyYyA9IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24oYWRkciwgaW5zdHIsIHBhdGNoX2FkZHIpOw0K
PiAgIA0KPiAgIAllcnIgPSB1bm1hcF9wYXRjaF9hcmVhKHRleHRfcG9rZV9hZGRyKTsNCj4gICAJ
aWYgKGVycikNCj4gQEAgLTIwNCw4ICsyMDMsOSBAQCBzdGF0aWMgaW50IGRvX3BhdGNoX2luc3Ry
dWN0aW9uKHUzMiAqYWRkciwgc3RydWN0IHBwY19pbnN0IGluc3RyKQ0KPiAgIA0KPiAgIG91dDoN
Cj4gICAJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiArCVdBUk5fT04oIXBwY19pbnN0X2Vx
dWFsKHBwY19pbnN0X3JlYWQoYWRkciksIGluc3RyKSk7DQo+ICAgDQo+IC0JcmV0dXJuIGVycjsN
Cj4gKwlyZXR1cm4gcmMgPyByYyA6IGVycjsNCj4gICB9DQo+ICAgI2Vsc2UgLyogIUNPTkZJR19T
VFJJQ1RfS0VSTkVMX1JXWCAqLw0KPiAgIA==
