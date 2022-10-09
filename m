Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CC55F8C58
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 18:34:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlngS15VNz3drx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 03:34:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uazr5qhw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.50; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=uazr5qhw;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120050.outbound.protection.outlook.com [40.107.12.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlnfQ6gSMz3000
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 03:33:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpM+uXcav5yZQ2YaWCmKoh6bDfK95NlpcCqZ6Jjpf9RICJb4x1ymRgqETHxHyFAhYy1TF8xjCwnytqcfdURANc6w94Ptr2rgeWDEEC3Z5tAWhjviqsGEbJXuCE2LGKjTjZdiRF3DwIclKVVzscJ6YZdAeGmU3nt34MgJcLoxQV74SwkXOi10y6FPzH8dOUcYK9lebTOrieNxGb8xTwVsLdjvCu1xI57fnrAVpPEtXT2YzbWhq3Clw9JW/T9qDfE0vWX7PJP6W06VZGFGGw/8o4NeXkIgQgobHuMHVFVFZ81dpLjIJWoZqoyqp3VChiwPH2ryuwpT4I2phSGn2ca9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5v4IXGuUDhT+LnSq553+zmQmxcSJYeT6qgX2KmYURQ=;
 b=WP3kYXmqTTgjEwSYmd2yxEeSMMQ/gc/i8OUhQexNUhAiG/Y6JPBuxFscbZ84Zn+wyWloHTrvmnGBzoYdUU6cxH82/79MkcRZAXykdf0la2UW4f+wT/jTkoVsvaSF2QaxhkECj3+oh4tzOHpJ9E2hLnRJohN3LqBW3RKwd+dPv9XCUVLicr/SOq4k+qnCmwq8q2zg5HmTl6gYNZdnYsJXOC1cim4QoVYzg+lEI1d2X1IZzuSdePJzkpM4AsweGreac6TXrHMl2Z2lgd8jQEynqjXhvEvXBrMRq4waHGGwn+9pddA1erCMmo0I9fghtHrRT5aAXgOUS83Ns41uaAEkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5v4IXGuUDhT+LnSq553+zmQmxcSJYeT6qgX2KmYURQ=;
 b=uazr5qhwDaO6LMSSvEBmhw/3+ij6mZOBsKPTKO+PgQBnGOLDHH1JPLMa9iDUr8TT60T2XQ7Mhe9t75j8O415VbxIukLqQHdvjxmmYcj3c6iDiFXAB9oHJ5wJkHbbwSTzhel2j50XSE7L7GI8xQ0gKIZJ54q+Fpjfl9Ux6dQb6wGawZEchEccmHTzzYLtWOXyUd2ahx+zEyYCBM/bqGzM7o8d/doaB/i7ihSamWPoEcojXU2P9mXMvih/qF1bhKYTD+D5qvzJcO8g6S6bwXLOiGrCJZHWeC6/I+kl1hWlrlTRTmrXBR5ZhFmiLVS4HQeUAw1hHffwA9sI1ZbgH11kUw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2419.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sun, 9 Oct
 2022 16:32:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5709.015; Sun, 9 Oct 2022
 16:32:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, "qiang.zhao@nxp.com"
	<qiang.zhao@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Subject: Re: [PATCH] soc: fsl: qe: Add check for ioremap
Thread-Topic: [PATCH] soc: fsl: qe: Add check for ioremap
Thread-Index: AQHY2r8isKmcQuOmGUmO+NyzMPz3fK4GRBCA
Date: Sun, 9 Oct 2022 16:32:57 +0000
Message-ID: <dda7bcec-ae7c-3cf5-6178-2c8098334bcc@csgroup.eu>
References: <20221008023819.47679-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20221008023819.47679-1-jiasheng@iscas.ac.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2419:EE_
x-ms-office365-filtering-correlation-id: 2a002bb2-591f-4a3c-c74f-08daaa13ec7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  S8OJqdESmXcyilPcwDdjU3I/8wCTUzOTqJhVSKATnriWasxEKDZZlMR4ajn6bZWRh2ClSTWtkcXQc7xqQQg4a3C3wfDKZJJa0/8Mweuuu+jwXABYsd0acFAlozG2kEXuwKxZvyzrV7XDrGIpVbLx5q9T/odC1olFUHEua3pncQtmCyPpjbiby4A/eCkusOn8wTKBlJzvekSryuV1Fgc8uUaziIOBbV03/UyMFq8L1yJLIQzMJRJwg2IwnkZDbByRGD1rEcEC36KfrTLWPuYCEW4rHpEahVFUWI8mtPeE0LXvR8PHb6iF/iauODrVbHXQADB9HCkQtGUd/H6fiNH8TEQ6qxs50r4wR499+sYxdIyLYo4+YGiIGDzVENhOUfLcXFtcS3S83BI/Ya/8IObxKMDPwJBexkDC/BehDfg6tI+G/M9XjryMrsxzPeify/swLXTaja0wj2HKuoWvcay9AD1zjDdcyCrFI8cBeO7/5N82CkS0NzFkyjEQhlQRW7Fn48F/n0lIMAmJkYXOyp13viz3ooydbIZ7pj8ay2jx5K3SxQZm4HTyX59zKdSA/HH967WQHQBi4i9pbj8oXzejeYBmhdsmbUXJG0H5813JyYE927ysy5b/J8JkvYMG9yVbmRqncxr6xZENjpmEsS9EJ1q60vW9dvKuA2OjxVeD/yrhrWpdFFFJiEnf4Y+Wcf8Y7xosXVLJhBY429qoQXuAGXCRFJHt5jSeib6Fs0avT3h3cpuzC7pfbG5odbHrctcVAQM0YiF7RqqUBBJCMH68ykEuY+GeM8pTOKMWg8e4ClnY949bQKZ4GSEDoQS/pwJUI9T0cJCc+TPGFnTT9tNutA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(451199015)(66556008)(66946007)(66476007)(66446008)(6506007)(76116006)(8676002)(6512007)(31686004)(26005)(4326008)(64756008)(91956017)(8936002)(186003)(316002)(36756003)(2616005)(478600001)(38100700002)(66574015)(41300700001)(5660300002)(122000001)(83380400001)(110136005)(54906003)(31696002)(44832011)(6486002)(2906002)(86362001)(38070700005)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RHhuL0g5WTZVa0gyRXNLemovVm44MjZ5TWo1SDFXcEo4eDNaU0RkY0ZaMU5G?=
 =?utf-8?B?T2RsNWZOU0RHeTMwT2YxQW1LT1Qyam1UWVJYbXhkOVgvWHE0MktnSU1zRjFN?=
 =?utf-8?B?aXFwaW5YdXlHWUpKQ3V2bkN6Sy9BTTFKWlNCTklHWUZtKy9lbVBBYTg1Skt0?=
 =?utf-8?B?QlgwQ2dxRXZlQjdhZGVwTE53NW9ab01pYlRYcXR5SXEzTGp2eVJ2eldFSjJN?=
 =?utf-8?B?NmpHbmJhaFR1ZXdZQ3dlS2RYYW5sOG5pSGJQRElqMTJDV1hocXJpemNWd2NQ?=
 =?utf-8?B?SEJqcHZMbzNjdzVVU083R3pxY3Noa2RGWGdBc0JLaXdxNTdtKzc3K1AyV1B1?=
 =?utf-8?B?U3E5WmZicnkzdTgrbUVWQ2dNbm52LzdaK0pSRDVTWHNPVnNHVDExdkJWNGJp?=
 =?utf-8?B?NTdBVERtdmlJd2Z0ZkgySVdsMTJCbktkMTBlY0xUTm9mZTlLcE8vTHlRMitN?=
 =?utf-8?B?SWhiMkxtQlp6Ymkzbm5iSmNYR0hKOVF0T2ZsdGtIdHZ2K3U3bWxnc2ZXTGNa?=
 =?utf-8?B?QVplZFBhSlVDUm9iM0tJKzc2RnRKY3d2TksvWWRMRXowM0swajVJcUNTM1hK?=
 =?utf-8?B?eFJvL0toTmZZUVFVdUw3Y25qWWY0U1F0U3RBcGIwZmlBc0tBZ0g2dWxHWVQr?=
 =?utf-8?B?MFJxaXRvMjRIWm41VU0zKzlBZG9JT2dXTG16ZDIrYUZmREVYZ3NEZThMdGli?=
 =?utf-8?B?cm4wWDhGZ3Q3L2JUeTlJQldHMHo5a3RyTVpocFlsUHgzVXNGbXpxemdvMUpx?=
 =?utf-8?B?YjBuNVhjRjdVMmNLUmE0TVVOc2M3Tzd2eTNhQXJmOHlIR0N2OGI1U3laZHJ2?=
 =?utf-8?B?SXZUZ1l1K1hZdU1xRHRXL3VqcXAwUnJVbFNWRGRXSWVaV0trcmE5NU5xcXRG?=
 =?utf-8?B?UXdqL1BoYi8yMUh6YnBkZUxJVnprRGwxbWUwYm05RTlIdml0TXg0TldtVFN3?=
 =?utf-8?B?b2s5dW1Na0VPZHE2RVJheGVHWlNQZ3c4Uzk2OUdVb1NtdlNoT2tRNUJWY3dl?=
 =?utf-8?B?aWNZZnZFdlNOWHpma2sxbFl3ZG1NakthNUY0M3FOUjg1b2U4bzJ5TUV5UFlt?=
 =?utf-8?B?cUM3QXdnajVCdlcxekxZeUZCUWhSeitud3RyTC9hZmYrcWVOUXFpUTgvTjk0?=
 =?utf-8?B?Tk1KQlZ4djlNRHgweWpqMVpVRlhjMXBjVmdWZnkrM1BTb3p3UDZSVmw3M2M3?=
 =?utf-8?B?N01iMG1wbHNqeFdPUC9STThFV2JVTXQ4SlIrWXhlU3UrZjQ1ZEZpUXl1Unp1?=
 =?utf-8?B?dmVFK0VVRnNWSmZkbDlhOEpGNUFWK214S1BDbnVsU1BPVXJoWFVreHVQSEhP?=
 =?utf-8?B?SlZhbXRwcm9hRTZ3YzBMYmd0aHdhcFFoc2ZScW1WUXE5ZkdacEVPeTlsVW5x?=
 =?utf-8?B?NEJHRnNPMFZGTUlMRGJNN0VtNEpwYnFnVUNaRlB5NC9BclUzVERSOEl4c3Aw?=
 =?utf-8?B?TTl5bGJZd3YvVWRrRkNyWFlyQ3R0ZDRhZHFVcktycjdSd0FObWpiN1k4WENM?=
 =?utf-8?B?YU0ydGx4ZThGd05KS2lqYlppb1NwWFJCUHJCTTVpWFRDSk13NGUrendvNkNq?=
 =?utf-8?B?dWlQdHp0Wm0zSmU2OTN1eDRRMXUraEJkVEcyNWxZZmcvWW5GZzQ2Y25aOUxo?=
 =?utf-8?B?blROcE1oNE5XQ3NkY3Q2WlJUcXhpYmxualVqdVJHNG13MVUwWHdXRnRvNE5R?=
 =?utf-8?B?TTZQRUtlbGsybDVpSkhRQ3pmRDJlQ2NLWWdNOUxCejRQMWNBSWZEaWd6N2Za?=
 =?utf-8?B?YnBxVHd6dzVhVExsbDdrb1NuOVcvamt6YWZWUGVzUkttUUQzNXFDc3hiM0RS?=
 =?utf-8?B?eHA3NEhmRldaVHhVMFRVYzJvTG1iS1M0b2JKZ3VGRjJWc0pBVmtpNHltSVVs?=
 =?utf-8?B?VFBVTTZZSmw4YjNlSU54eGU4U3FEWG96bU80VG9Xemh6QkhRTi9OeE1SeHcx?=
 =?utf-8?B?YlBoNTVmNWx4bEcva0xLaW9WVVpiQUJ4cURJb3puYlc4UTFMc0wvaXFwcG5R?=
 =?utf-8?B?QkdPTVgwSXpWbzI2VnNvaUZIZmdxeU1ud091R3N3NzFVLzVNbWJHT2NkQTdU?=
 =?utf-8?B?SEt0eWs5Kzd6SEJrbWxhTDVBU1ZCUlRsdjhHSW42U1BoVkppa2c1enhQdkgz?=
 =?utf-8?B?a2x5VnlYOGFLbFVUQStleVRxMEFsUXdCTnlFRHhtYUM0MGRadmlhanhQSkNC?=
 =?utf-8?Q?iEdpQrjib+irUTdUlrgsRSA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1789694C2C871347BDD6904C96AEB362@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a002bb2-591f-4a3c-c74f-08daaa13ec7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2022 16:32:57.4579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmpO6EdgjJUwJnlbsmPngas9qd9Q6YBQogH3bhzQRfAO5JK6bW8/S8JdTe4PVwaG4vu5NcauwOVCbPbyZ5Db5JbKhIGMQEtVbmwXozu7pGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2419
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzEwLzIwMjIgw6AgMDQ6MzgsIEppYXNoZW5nIEppYW5nIGEgw6ljcml0wqA6DQo+
IEFzIGlvcmVtYXAgY2FuIHJldHVybiBOVUxMIHBvaW50ZXIsIGl0IHNob3VsZA0KPiBiZSBiZXR0
ZXIgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSByZXR1cm4gZXJyb3INCj4gaWYgZmFpbHMuDQo+
IE1vcmVvdmVyLCB0aGUgcmV0dXJuIHZhbHVlIG9mIHFlX3Jlc2V0IHNob3VsZCBiZQ0KPiBjaGVj
a2VkIGJ5IGNhc2NhZGUuDQo+IA0KPiBGaXhlczogNjhmMDQ3ZTNkNjJlICgiZnNsL3FlOiBhZGQg
cnhfc3luYyBhbmQgdHhfc3luYyBmb3IgVERNIG1vZGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKaWFz
aGVuZyBKaWFuZyA8amlhc2hlbmdAaXNjYXMuYWMuY24+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29j
L2ZzbC9xZS9xZS5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gICBpbmNsdWRlL3Nv
Yy9mc2wvcWUvcWUuaCB8ICA0ICsrLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNs
L3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KPiBpbmRleCBiM2MyMjZlYjUyOTIu
Ljg4ZTMzNWU4ZWVmNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4g
KysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gQEAgLTgzLDEwICs4MywxMyBAQCBzdGF0
aWMgcGh5c19hZGRyX3QgZ2V0X3FlX2Jhc2Uodm9pZCkNCj4gICAJcmV0dXJuIHFlYmFzZTsNCj4g
ICB9DQo+ICAgDQo+IC12b2lkIHFlX3Jlc2V0KHZvaWQpDQo+ICtpbnQgcWVfcmVzZXQodm9pZCkN
Cj4gICB7DQo+IC0JaWYgKHFlX2ltbXIgPT0gTlVMTCkNCj4gKwlpZiAocWVfaW1tciA9PSBOVUxM
KSB7DQo+ICAgCQlxZV9pbW1yID0gaW9yZW1hcChnZXRfcWVfYmFzZSgpLCBRRV9JTU1BUF9TSVpF
KTsNCj4gKwkJaWYgKHFlX2ltbXIgPT0gTlVMTCkNCj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPiAr
CX0NCg0KSSdkIHByZWZlciB3aXRoIHRoZSBmb2xsb3dpbmcgZm9ybToNCg0KCWlmIChxZV9pbW1y
ID09IE5VTEwpDQoJCXFlX2ltbXIgPSBpb3JlbWFwKGdldF9xZV9iYXNlKCksIFFFX0lNTUFQX1NJ
WkUpOw0KDQoJaWYgKHFlX2ltbXIgPT0gTlVMTCkNCgkJcmV0dXJuIC1FTk9NRU07DQoNCj4gICAN
Cj4gICAJcWVfc251bXNfaW5pdCgpOw0KPiAgIA0KPiBAQCAtOTgsNiArMTAxLDggQEAgdm9pZCBx
ZV9yZXNldCh2b2lkKQ0KPiAgIA0KPiAgIAlpZiAocWVfc2RtYV9pbml0KCkpDQo+ICAgCQlwYW5p
Yygic2RtYSBpbml0IGZhaWxlZCEiKTsNCj4gKw0KPiArCXJldHVybiAwOw0KPiAgIH0NCj4gICAN
Cj4gICBpbnQgcWVfaXNzdWVfY21kKHUzMiBjbWQsIHUzMiBkZXZpY2UsIHU4IG1jbl9wcm90b2Nv
bCwgdTMyIGNtZF9pbnB1dCkNCj4gQEAgLTY0MCwxMSArNjQ1LDE0IEBAIEVYUE9SVF9TWU1CT0wo
cWVfZ2V0X251bV9vZl9zbnVtcyk7DQo+ICAgc3RhdGljIGludCBfX2luaXQgcWVfaW5pdCh2b2lk
KQ0KPiAgIHsNCj4gICAJc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4gKwlpbnQgcmV0Ow0KPiAg
IA0KPiAgIAlucCA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wscWUi
KTsNCj4gICAJaWYgKCFucCkNCj4gICAJCXJldHVybiAtRU5PREVWOw0KPiAtCXFlX3Jlc2V0KCk7
DQo+ICsJcmV0ID0gcWVfcmVzZXQoKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0K
DQpJIHRoaW5rIHRoYXQgaWYgeW91IHJldHVybiBiZWZvcmUgdGhlIG9mX25vZGVfcHV0KCksIHlv
dSBsZWFrIHRoZSANCnJlZmVyZW5jZSB0YWtlbiBieSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZSgp
DQoNCnFlX3Jlc2V0KCkgZG9lc24ndCB1c2UgbnAsIHNvIHlvdSBjYW4gbGlrZWx5IHBlcmZvcm0g
dGhlIG9mX25vZGVfcHV0KCkgDQpiZWZvcmUgY2FsbGluZyBxZV9yZXNldCgpLCB0aGVuIHlvdSBj
YW4gc2ltcGx5IGRvDQoNCglyZXR1cm4gcWVfcmVzZXQoKTsNCg0KPiAgIAlvZl9ub2RlX3B1dChu
cCk7DQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gQEAgLTY1Myw4ICs2NjEsMTMgQEAgc3Vic3lz
X2luaXRjYWxsKHFlX2luaXQpOw0KPiAgICNpZiBkZWZpbmVkKENPTkZJR19TVVNQRU5EKSAmJiBk
ZWZpbmVkKENPTkZJR19QUENfODV4eCkNCj4gICBzdGF0aWMgaW50IHFlX3Jlc3VtZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpvZmRldikNCj4gICB7DQo+IC0JaWYgKCFxZV9hbGl2ZV9kdXJpbmdf
c2xlZXAoKSkNCj4gLQkJcWVfcmVzZXQoKTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJaWYgKCFx
ZV9hbGl2ZV9kdXJpbmdfc2xlZXAoKSkgew0KPiArCQlyZXQgPSBxZV9yZXNldCgpOw0KPiArCQlp
ZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKwl9DQoNCk1vcmUgY29tcGxpY2F0ZWQgdGhh
dCBuZWVkZWQuDQoNCllvdSBjb3VsZCBzaW1wbHkgZG86DQoNCglpZiAoIXFlX2FsaXZlX2R1cmlu
Z19zbGVlcCgpKQ0KCQlyZXR1cm4gcWVfcmVzZXQoKTsNCg0KDQo+ICAgCXJldHVybiAwOw0KPiAg
IH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc29jL2ZzbC9xZS9xZS5oIGIvaW5jbHVk
ZS9zb2MvZnNsL3FlL3FlLmgNCj4gaW5kZXggYjAyZTlmZTY5MTQ2Li43MTEyOWI4YTU4MDcgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvc29jL2ZzbC9xZS9xZS5oDQo+ICsrKyBiL2luY2x1ZGUvc29j
L2ZzbC9xZS9xZS5oDQo+IEBAIC04NCw5ICs4NCw5IEBAIGV4dGVybiBzcGlubG9ja190IGNteGdj
cl9sb2NrOw0KPiAgIA0KPiAgIC8qIEV4cG9ydCBRRSBjb21tb24gb3BlcmF0aW9ucyAqLw0KPiAg
ICNpZmRlZiBDT05GSUdfUVVJQ0NfRU5HSU5FDQo+IC1leHRlcm4gdm9pZCBxZV9yZXNldCh2b2lk
KTsNCj4gK2V4dGVybiBpbnQgcWVfcmVzZXQodm9pZCk7DQoNClBsZWFzZSB0YWtlbiB0aGUgb3Bw
b3J0dW5pdHkgdG8gcmVtb3ZlIHRoZSBwb2ludGxlc3MgJ2V4dGVybicga2V5d29yZCANCndoZW4g
Y2hhbmdpbmcgc3VjaCBhIHByb3RvdHlwZS4NCg0KPiAgICNlbHNlDQo+IC1zdGF0aWMgaW5saW5l
IHZvaWQgcWVfcmVzZXQodm9pZCkge30NCj4gK3N0YXRpYyBpbmxpbmUgaW50IHFlX3Jlc2V0KHZv
aWQpIHt9DQoNCklmIHFlX3Jlc2V0KCkgaXMgbm90IHZvaWQgYW55bW9yZSwgaXQgbXVzdCByZXR1
cm4gc29tZXRoaW5nLg0KDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICAgaW50IGNwbV9tdXJhbV9pbml0
KHZvaWQpOw==
