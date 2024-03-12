Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B578C879354
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 12:52:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=besuayc+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvBpm3yCqz3dVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 22:52:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=besuayc+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvBp168wzz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 22:52:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5dTN49qW78EldYMcHUDt8Ka993uFKCdwX6V6M/r3vVBu99l4YHovmpHsiGqpvZ6zt4GkQY9yrRuBpke21cGD90Vq6JFSRSPr6lMcBMITkYcdWxay++bdmEyJrSUrMkdD7Zvv7bGIRhjUatAnyR4IQOb0dTlH8abgIv7tyXMD/k6ieIMuEc7YMB4fabTVcerVfyHc7QQxRwZNX4bsSlNSkX78yXuaQl+tpX4kgDQcwPUFRFer4nOtpVYTyrWaUvI2V8bGjBiHYJiwlXfh8BN+P85vyAwvNZbHj7hWmIh1nvxB44rwLVaZmkla3tIohE0gGP88q56Qy7dbDrhvp4ByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJW13n/xn92KGfy32eX83cKl9R2nR+3XgCZnEGNHQ5M=;
 b=YVrtl6w1GpZsaQj+x+l7U+DiyouajFM1WGIPBfXoapsIqhFrXufTYAwp0ycODOoP5P0jpIWRpfa9EUFvlHwudNr6mObDYWHc7coouj8cAAtR9xsInDV/x1gHCgSiECL2xzjZO52TiROzz/mFghyMieQDzwCOe466bXzf4/rE4LW3HFBst4fXoyn/Suc3cuzq9QRs5X3Rr9atqJad8EE7rQS1ZuBvkFEXhjxeMHJZ/Xsim7oaAODd1kOFSAS64CoKO3gz5gg824uYeQuahUAtt0nIoOVv74AI/zq0UdmFyaurugC2vcBXXIbDYNKdRvaLqLAhdkNzEe8TcsmdUkVL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJW13n/xn92KGfy32eX83cKl9R2nR+3XgCZnEGNHQ5M=;
 b=besuayc+pzxrBBpT/TZ5yfMGgkIpTQI2gpV0bSn4u289bBbBgMsnaD0s+h82O17vakGBSg/hxtaqObVFZy9UscPH0SYgZ/p2eZ0XwzUh4q+vWSAi02EDZnBnJKg2X3qbvxwCusNO1xMpE5atOrA8ko6SGn8f7tAXfjb7cOI6u2V66jXNiaApGPmWMHzQrK1nAmyDmsV5WyAYzvdQZXVsqPH+MdC3aDJE4yCB5nbErwoBFa3EnVan/Bh3aTB39dIKUD2Q67pKiIqKWJjXDZZONnC1nxSOXPBjOBGdUJRPHtlYqq4HNnoOjCybKvrG90OrIudghL4fBSxk+Y/CT5k9nA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 11:51:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 11:51:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, =?utf-8?B?TWFyZWsgQmVow7pu?=
	<marek.behun@nic.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Topic: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Index:  AQHacDjgK3b+WpnPIEGh5lKDyA2GCLEsCyQAgAA+QACAADOKAIAGv34AgABpg4CAAF1ugIAAA30A
Date: Tue, 12 Mar 2024 11:51:43 +0000
Message-ID: <2106ea35-2d96-43f9-92a1-7d33ad5240b4@csgroup.eu>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
 <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
 <c3be9cb4-06cf-45c5-841f-3fa016e4d087@csgroup.eu>
 <9e13fd46-b05b-4fc2-abb6-c6c96dd576ee@salutedevices.com>
In-Reply-To: <9e13fd46-b05b-4fc2-abb6-c6c96dd576ee@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2736:EE_
x-ms-office365-filtering-correlation-id: b4e2c61b-9aa2-40a2-10d8-08dc428ac9b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  c5SSHWNFFuVkIj9y5udlfN4PapfseVxVZtix4i+zAmNEEqV6OlA6/k1K8ixRvviQMANB1qi7IK7DS1K8wlh45tGTWcNqjp12SBq8/jvXYCc8iVRizHQKm6uY0xeofEoAPegpUca4mV35ZgijsEcL4UzftYyCsZO/Yaxy6lZ4Ar54x7o/CHEWvHIseQm1NgFwh8jranBmjbNB9IuK7knFR3cVw7UPVVnQAkQXjARER8t5Rj9o/hOHoyCZnHbE7eexlTFOywh+3fe51Ef24RnV8Y+YFsPUYeOIHsSRQpK3BxpnM22+Wionp0VLSBVT5mhYsgdxE7nOLT3Z6G8tRxmdYMKry8B0pQ8KXAzF5vnTZAXlyGKyXHDsoTNS4DITCEQ14Z5cHTupZFZbNXODwzYY+TpPwQ/+SidtOMm9qkNhb3Z4PIohyt5R9oqwC5BceOTHZmvWqTqEKf/2DAuIDp/sBzc3MMBH0BKtFwxNtefjAWFjxHY5x0dqnXgblN8nDQmn/Oz3hjnAW3nyk7GJku/RoH7jtCQTr3tC/3KSn+mPPznWTp+KPYXJgDhxluGgebOrhxU6b+GMDpPdEOyVu+gdJf/cmsgzd3eMojsSQq+INBBrTOQV/LVzVHz3mUSwnmdqakgOURf/VNOBBtkc5Ky0oMDaZoirP4i5Jdh4k+0/B/G8OGmcE5AzXRFfUXqXmMpOP7GxFQn4hrTwNDjkiQjoPg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WWxCRWgxOUJPSEhKL3B0Smo1d1BiZ3VwZHdHU2x1azhQNG9GajB0dVR2VnQv?=
 =?utf-8?B?Q2JacDRuOGl4Ykpzb3hTcm9tYkU2V2E4SldyL1VQNWRLME9Qc1k2VjIyalI4?=
 =?utf-8?B?c1lBWms0SXFhdTd6RVpTMEVRVGRlTkpOVWR6ZjlvKzNrWHl6YkpVMGlJaWZT?=
 =?utf-8?B?U0hRSWRsZlA5TG5wZ04zVDJtYVVnSWI4Z1E2ekFTVGcveTRWM1Y4WllZV2F1?=
 =?utf-8?B?cFZmNTZvdzVZeVQrc2E1MGJ1YjhDcU1BOHhGTFhNREt0c1BIdzlCbUtTampS?=
 =?utf-8?B?QmVHNkZrbmVHSjk5L2dBd2NKa2diaXlxa3NhZjFuWmNtekdSMC9HQnBPNENW?=
 =?utf-8?B?TFRnVEdlU1NBZUFFV2R1Wm0rRnY4OWd0WmwxTnZmTmRGYTRkVnI1L2ZFcnMr?=
 =?utf-8?B?UXNtcWVzWVNpWUhsZ3UxRmdzNXMxS3lZejkwbjV6ME5TN3VvLzJuMlY2OTI4?=
 =?utf-8?B?VldscGJWdVVwVkhINHBhK0REUDBRNVRaUUtZTUpaNDNCNDZITkVDcjVLdzgw?=
 =?utf-8?B?dStFakNWaW5WS0twQTBRSm5GRmczOW5xaHFzN1lKNTJ1THZhelU5V3FHWDNG?=
 =?utf-8?B?ZHNoUWJXMDBBL3JiT0VnN3RsV1ZRUWZtbndsbGYyMjNKTkRIaUdscDdqS015?=
 =?utf-8?B?MEZXa3hvRE55blRWSHhpL1Q5TE84UzJyZzBjckN0RHhPZ09nbnIrWWFkQmFU?=
 =?utf-8?B?cHNCSDk1L1JhVm5RMHFUTTRkajZvYzhWZVMwb2dEUzNUeVB3R21USGg0NWFO?=
 =?utf-8?B?aDF6S0tFVHI3RUtzV3BuSDFVY3JEektsSDVCR1dIYXBpdmNPcFlLdE1OcGw2?=
 =?utf-8?B?cUpBZC9hVGdhR3lrSVBvTWRtd2RDdGdJRUlpY1A4bXRKRTFsZU5YWGR6U1k2?=
 =?utf-8?B?TElvM25YcUhZOWg3S2xRMkpicnZaaGltOGZJU1ZRSWFTUm9GMmVDYUxxc0hH?=
 =?utf-8?B?Ly9TdlkvWnpJU29tdVgzSnBwRW1saTlsRlhScVVCTXdWZ292c1hsR2F0WGRL?=
 =?utf-8?B?US9ob2FpNlN6K09QRUFCMm51VUNlaHBDa3NQL0NUb1FGL0tXMHVVTGwvc25D?=
 =?utf-8?B?dnJRVS9zV21UYU9mSmVQU3IvSE5LSzBNdHFjaEZjOUQ5VGg1L2d6S3U3R2ZS?=
 =?utf-8?B?a0N3ZUg0S21mM1N1TWxzcnNZQW5PcG9ZVzErRHVDUXh1TWR3K3pDS3JGeE5r?=
 =?utf-8?B?Z0k1dEZZYkZ3VXpqeURyOFpHN0EwSjlZL2Y3WEJML3N3MVgxKzNPSm9Pa0ht?=
 =?utf-8?B?YjJMUWhhbnJmWVpqdlhRSDMvbTZRelVRYTc2aU9uN0xhZzlwNDRod1ZvTjUx?=
 =?utf-8?B?VStrQkovajlqdGNzWkg0enZ4MmhQZVRsRmYxQllIa21hY2NZZ0ROeUJuMkJH?=
 =?utf-8?B?M2VlbkdRcktiUmZmbFdFbkpOS2ZQKy9VUFJFVlJkbksvQy9TSGFqQjFKODVj?=
 =?utf-8?B?Q09KWnBMd0JwaUJVQzEvSml4OWFOUHFDeDFpNisxcFcrbmVGUzh2RndlS3FL?=
 =?utf-8?B?S0FCckJ1dW83TDl4QW9MWTZ5dzZ2YkRtWGt4elZkMnllb3hlb0hEdi9YV2oy?=
 =?utf-8?B?b2psK2srTi9ZSVJCV2sxaEZrVllTMkhiYW92c0c2ZVdIN0xjc1pDVU9rS3BL?=
 =?utf-8?B?dXhhSE5KV0VwaVBwOVczMFdETFZHVnhTdjJVdzRMb2pKaFJsSDdvMmxPbXBv?=
 =?utf-8?B?S3oxaGcvUDJLNUo5emE2WEhtcTI2YlZyS0hwN01mMnN1aFpQdHMzNFU2aHlP?=
 =?utf-8?B?eWkyZjl4QWxBN0ZSbDYzbStIeGMzYzRKeVloVmdwdHFuYlR2U0cwcjhRT0Rp?=
 =?utf-8?B?bVRuZEpCOWgvSFc2MHlwZ1RDVTVSM2lmbkt6aUhiQU5YSlZxU3FnMU1hQ0V4?=
 =?utf-8?B?YUMwcElRMzdVdDJ1Vk9RakliR0RmU2lyQmRpNTVRdlB3RG9kVmRJc2Y4MUxo?=
 =?utf-8?B?RFBjYXpsUTk5VVpUMHg3NDk5T3FjU3pMejBqS2pTdkovZlUvMDl0bXR3eFo2?=
 =?utf-8?B?SXVkN1gyc0xJWkZIRE42MWUxNEZsSlYyT3A5aTBERnRNR1pvdzlKK3NoNWcx?=
 =?utf-8?B?Q3BTSU9YZnphYU40TVdxZ1BLckxpSUpST2NUU0VpSWJ6QzAxWkV4Y05NbkVU?=
 =?utf-8?B?L1hYRE5XZHFVd2h4b0FnNzFEa0dWRVNvMVd0MXkxcXFVSjJSUzhqT2dDVUwy?=
 =?utf-8?B?ODZ1NkhXalpUb1NjNFM1VWNwb2c0bERJY1F0RnZtTUo0dCs3S1doRVZzL3dp?=
 =?utf-8?B?ZHhNUzZ0UmNwU3FvSkpNNTRsQkdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DCEA574B6466F46BC137BDDC06DF2BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e2c61b-9aa2-40a2-10d8-08dc428ac9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 11:51:43.6681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5QJRSWTkUoveXj7KltvmV/Gec6Lj7ERvSiaK0gXEpBXN63mi6/jfSGf7Lqwh8hvShfBliY9r3VsJ5oTs1iKqyNABliLlVNoZVPtGEbiA4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
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
Cc: "kabel@kernel.org" <kabel@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzAzLzIwMjQgw6AgMTI6MzksIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBnbnN0YXJrQHNhbHV0
ZWRldmljZXMuY29tLiANCj4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQg
w6AgDQo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBIZWxsbyBDaHJpc3RvcGhlDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcNCj4gWW91
IHdlcmUgcmlnaHQgYWJvdXQgdHlwZWNoZWNrIC0gaXQgd2FzIG1lYW50IHRvIGNoZWNrIGVycm9y
cyBldmVuIGlmDQo+IENPTkZJR19ERUJVR19NVVRFWEVTIHdhcyBvZmYuDQoNClllcyB0aGF0J3Mg
Y3VycmVudCBwcmFjdGljZSBpbiBvcmRlciB0byBjYXRjaCBwcm9ibGVtcyBhcyBzb29uIGFzIHBv
c3NpYmxlLg0KDQo+IA0KPiBIZXJlJ3MgbmV3IHZlcnNpb24gYmFzZWQgb24gdGhlIGNvbW1lbnRz
Og0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXV0ZXguaCBiL2luY2x1ZGUvbGlu
dXgvbXV0ZXguaA0KPiBpbmRleCA2N2VkYzRjYTJiZWUuLjkxOTNiMTYzMDM4ZiAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9tdXRleC5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvbXV0ZXgu
aA0KPiBAQCAtMjIsNiArMjIsOCBAQA0KPiAgwqAjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPg0K
PiAgwqAjaW5jbHVkZSA8bGludXgvbXV0ZXhfdHlwZXMuaD4NCj4gDQo+ICtzdHJ1Y3QgZGV2aWNl
Ow0KPiArDQo+ICDCoCNpZmRlZiBDT05GSUdfREVCVUdfTE9DS19BTExPQw0KPiAgwqAjIGRlZmlu
ZSBfX0RFUF9NQVBfTVVURVhfSU5JVElBTElaRVIobG9ja25hbWUpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICwgLmRlcF9tYXAgPSB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4gQEAgLTExNyw2ICsxMTksMzQgQEAg
ZG8gDQo+IHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXA0KPiAgwqB9IHdoaWxlICgwKQ0KPiAgwqAjZW5kaWYgLyogQ09ORklHX1BSRUVNUFRfUlQg
Ki8NCj4gDQo+ICsjaWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4gKw0KPiAraW50IGRlYnVn
X2Rldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jayk7
DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgaW50IF9fZGV2bV9tdXRleF9pbml0KHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IG11dGV4IA0KPiAqbG9jaykNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoCBy
ZXR1cm4gZGVidWdfZGV2bV9tdXRleF9pbml0KGRldiwgbG9jayk7DQo+ICt9DQoNCllvdSBkb24n
dCBuZWVkIHRoYXQgaW5saW5lIGZ1bmN0aW9uLCBqdXN0IGNoYW5nZSBkZWJ1Z19kZXZtX211dGV4
X2luaXQoKSANCnRvIF9fZGV2bV9tdXRleF9pbml0KCkuDQoNCj4gKw0KPiArI2Vsc2UNCj4gKw0K
PiArc3RhdGljIGlubGluZSBpbnQgX19kZXZtX211dGV4X2luaXQoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgbXV0ZXggDQo+ICpsb2NrKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgIC8qDQo+ICvC
oMKgwqDCoMKgwqAgKiBXaGVuIENPTkZJR19ERUJVR19NVVRFWEVTIGlzIG9mZiBtdXRleF9kZXN0
cm95IGlzIGp1c3QgYSBub3Agc28NCj4gK8KgwqDCoMKgwqDCoCAqIG5vIHJlYWxseSBuZWVkIHRv
IHJlZ2lzdGVyIGl0IGluIGRldm0gc3Vic3lzdGVtLg0KPiArwqDCoMKgwqDCoMKgICovDQoNCkRv
bid0IGtub3cgaWYgaXQgaXMgYmVjYXVzZSB0YWJzIGFyZSByZXBsYWNlZCBieSBibGFua3MgaW4g
eW91IGVtYWlsLCANCmJ1dCB0aGUgc3RhcnMgc2hvdWxkIGJlIGFsaWduZWQNCg0KLyogLi4uDQog
ICogLi4uDQogICovDQoNCj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAr
I2VuZGlmDQo+ICsNCj4gKyNkZWZpbmUgZGV2bV9tdXRleF9pbml0KGRldiwgbXV0ZXgpwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPiArKHvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ICvCoMKgwqDCoMKgwqAgbXV0ZXhf
aW5pdChtdXRleCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+ICvCoMKgwqDCoMKgwqAgX19kZXZtX211dGV4X2luaXQoZGV2LCBt
dXRleCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+ICt9KQ0KPiArDQo+
ICDCoC8qDQo+ICDCoCAqIFNlZSBrZXJuZWwvbG9ja2luZy9tdXRleC5jIGZvciBkZXRhaWxlZCBk
b2N1bWVudGF0aW9uIG9mIHRoZXNlIEFQSXMuDQo+ICDCoCAqIEFsc28gc2VlIERvY3VtZW50YXRp
b24vbG9ja2luZy9tdXRleC1kZXNpZ24ucnN0Lg0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL2xvY2tp
bmcvbXV0ZXgtZGVidWcuYyBiL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4gaW5kZXgg
YmM4YWJiODU0OWQyLi45NjdhNTM2N2M3OWEgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9sb2NraW5n
L211dGV4LWRlYnVnLmMNCj4gKysrIGIva2VybmVsL2xvY2tpbmcvbXV0ZXgtZGVidWcuYw0KPiBA
QCAtMTksNiArMTksNyBAQA0KPiAgwqAjaW5jbHVkZSA8bGludXgva2FsbHN5bXMuaD4NCj4gIMKg
I2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiAgwqAjaW5jbHVkZSA8bGludXgvZGVidWdf
bG9ja3MuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4NCj4gDQo+ICDCoCNpbmNsdWRl
ICJtdXRleC5oIg0KPiANCj4gQEAgLTg5LDYgKzkwLDE2IEBAIHZvaWQgZGVidWdfbXV0ZXhfaW5p
dChzdHJ1Y3QgbXV0ZXggKmxvY2ssIGNvbnN0IGNoYXINCj4gKm5hbWUsDQo+ICDCoMKgwqDCoMKg
wqAgbG9jay0+bWFnaWMgPSBsb2NrOw0KPiAgwqB9DQo+IA0KPiArc3RhdGljIHZvaWQgZGV2bV9t
dXRleF9yZWxlYXNlKHZvaWQgKnJlcykNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoCBtdXRleF9kZXN0
cm95KHJlcyk7DQo+ICt9DQo+ICsNCj4gK2ludCBkZWJ1Z19kZXZtX211dGV4X2luaXQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQoNClJlbmFtZSBfX2Rldm1fbXV0ZXhf
aW5pdCgpOw0KDQpJdCBtYWtlcyBpdCBtb3JlIGNsZWFyIHRoYXQgbm9ib2R5IGlzIGV4cGVjdGVk
IHRvIGNhbGwgaXQgZGlyZWN0bHkuDQoNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9tdXRleF9yZWxlYXNlLCBsb2NrKTsNCj4g
K30NCj4gKw0KPiAgwqAvKioqDQo+ICDCoCAqIG11dGV4X2Rlc3Ryb3kgLSBtYXJrIGEgbXV0ZXgg
dW51c2FibGUNCj4gIMKgICogQGxvY2s6IHRoZSBtdXRleCB0byBiZSBkZXN0cm95ZWQNCj4gLS0g
DQo+IDIuMjUuMQ0KPiANCj4gDQoNCg==
