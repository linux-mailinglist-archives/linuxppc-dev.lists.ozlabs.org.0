Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74C87CD5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 13:38:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fKXJ32kR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tx3hJ6BZxz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 23:38:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fKXJ32kR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tx3gX5ZsWz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 23:37:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0GBU/1KN9hqMZto/WmpnW8Q0bVhaOtNbm5UDc1mZ0N90n5U8epp8gu30zOOd9nyrVkjRKQzUBLKZ+AEIMUv0qd2wyS9B50/BCSeKB9eTpuZK2xNiP59BoTjY3WHD4CJe2qyxpLhzFLoDqemMSYAVsOe7a56OT93I7TXRn2PGbsz8/pBRWw2h7AtqVPXfT81/RaCvWr+3XCd0L9i7YheULQns9H8KC7Kjy0ZhKHaCAaBU9Ecab2yWbkmmqfp0+qV5bUb58Knj54QJ3GztAAg+iOZ7zbKWcmSkD7gy7nteCpPp4e/9WoZMbZn0M6R7iYuwBT6SAWbtlHaLtZjZ3rxEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNkwWda/DYZT9IQ9M1y0MaJCGFMLueC6ykC09myfm/k=;
 b=k6O58I1ug3taaL564Ii8pLIge0QKvScMDuy+5pxn8vrnSuez6L4VmX4PpRo9xi0X7nz4mQEEncmQyvOgKNNAs3mvBa36j4h8DTu7aIqM34RyEw99pnqf04qE64NfSM5Ny7cA+5tuVu/PPWeg09DcNbU/jXYXr6kM1yqA11reNre6pJWOyk/OGakQBRpkCDr4uEd9VOu0HTJrsVB76WqUlGPbNSvsDYZDouXZ4HYSVg6wavuMjC4guChpppz4ND4FC+Aih9JCspzUCetwRPq2AA1jZ6tIHKOitDEG6jiKLc0I/kp6lsebRfZHlESy6BDb+brmYNirVBvBISH6FTRa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNkwWda/DYZT9IQ9M1y0MaJCGFMLueC6ykC09myfm/k=;
 b=fKXJ32kR5unpRhQMcGkkGiE2UBdcBGulJvdRdn1Mr5Xf3uJxaOC2MLGNSfYYHHpooIzMDLpVZl0S7kDE1M+DrhMGCKeez+pBk9Xh/lMU3OTXhnYamlp4Acb8I1H5OlbfJpsI12h1ckIBOTeN8smsSKUxTsz5AnMUGsNaz31VOInYmqksO5y/0HvF7/8IOK6YArAPc9V/PfFcYx3z4zouTzTJuu4tJ4A8ZkNWWXmo6nicu9AFYfkSVdz5tEE4op6xmIj6NSQu/o8lHWr5u29y7UrqBQR9WnCdgAcAcq799OD/rTK8PFiDf1/dZOHsGNc9EhHsr7sZ/IgCjiBAMzLJ/w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2849.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 12:37:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 12:37:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?TWljaGFsIFN1Y2jDoW5law==?= <msuchanek@suse.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, "Jason A. Donenfeld"
	<Jason@zx2c4.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: Cannot load wireguard module
Thread-Topic: Cannot load wireguard module
Thread-Index: AQHadtM4QnT6PJoe7E+FadqTCoozx7E4vWWA
Date: Fri, 15 Mar 2024 12:37:22 +0000
Message-ID: <90a65592-1447-4fa2-97c4-ed3e925f6be2@csgroup.eu>
References: <20240315122005.GG20665@kitsune.suse.cz>
In-Reply-To: <20240315122005.GG20665@kitsune.suse.cz>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2849:EE_
x-ms-office365-filtering-correlation-id: 97b381cf-d45f-440f-7c7e-08dc44eca977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  j5Q9c8vj1Js2tne38ZPL4ysMo+fswxA3tYtEDDuwF+N+bKX1cCtYb65lTVFIm54b9RkcRka0OepnEL6vLCGVVntJgXO9UvRAa5hMpCt/L8IrwuU1HydPRt2FNugftlmBYdqTryOPDOPkJECIfrUmWmU+cXzU7/I8oulvT6mtEETVeLccHgkfHc2CRDlQRJLqNJ5YJyPWrIALATDppcxCZc0lsfJJtBIkW8s0NVWMDrLWOcB2oue8JLWaZtk7ltZ0EVir40jFjwfJWZnKm9u6G5t3PDGiLcS1V++juN5Pmf/E6qIyBSRQj/y0bmNrce7w76vDK+RxgGuuqCANy5zT1ze8mnaCUU+yBuM0Nt3kbZXwFa237Z0z61QzBajDenbOlO1RpNrLOaVl+HlqqxxaS2JRljZxt494M/m70MeLJqFr0Vn7ByR6K8iGyoQPewNI+JcCuqSfIsQdAIzPsh2w2ei22n0Wdpolx6QNWaAqXyWzWgPuCHjDLlG8u1khBwfYYgSzozExvEHVXlc7r8FkclOeLX3OuAchSIAbzc/J9oBEHpUaU4JPQiExGgVwcjVa6v4uiMd8y9dUe+nP0t10HwMtmdfFTRUU5fChVLHzfyK0dh3j/HIvJFp5q2TcsxQmC2eWc4CAwn5v83u/Ip33Va8CzxJGl5jTN+WBgNZ/3CY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZDhOZkJvcExqdW5WcTV3WVpoYUJZRklidUx3YkdhWEtmMzg5Tzd6MHlTNjVB?=
 =?utf-8?B?SEF4bCtaTXpnRTdqUFJWU0NlaExubzYzVERva1BNckNWOWJrTW1IMkE4d2wv?=
 =?utf-8?B?SGJFcEVJbUlMYk45Z1lRNFBxTzVKRHdIN2RQUGNhSTBDT2pTbzMxREx4MXoz?=
 =?utf-8?B?NXhTb0ZsZDhrVXh3b2xQTHIxODZqYmpobit3NTZJeitPS1d0cVBNYXVjZkk3?=
 =?utf-8?B?eHpZWVFMbWoxTS9OWkQwb1EwZ1NFYnNWb3ViUGQ1TnZweno3VlNVNGhhMm1q?=
 =?utf-8?B?aXNUV0RZUy9jNzB0d3BNbGNycnRlQW5uaVUxVEdTOVk2Y0JTaUx6ekI3ZVYw?=
 =?utf-8?B?SHhGaklLejd5dStjMHg4UllIdlhDUzlVOXBOaks2QnlGOWk3dkFvU0xFMmMr?=
 =?utf-8?B?WXNCVFlRbHJPdmM5WmZQSkQzcEFxK0d2eHFaVGhvRWxpd1B0UlZqekFVeVVD?=
 =?utf-8?B?ZHBYTDBGVElVNnZRdHE5L1c2N0pjcVNoOThrdG52YUxqSmtsUG1FOXJVQW5O?=
 =?utf-8?B?L25EK2pXTlI4T0RVYitsSlE0RGFKOXplSFZEOHRMK0NOWTVhZzNYYXN2SzZa?=
 =?utf-8?B?MHhvdWxveTdDcklSR0FKSnY4cDBENmhjRFMyZkYxdkJJdGUzWmNBZEtpbi8w?=
 =?utf-8?B?bnJ6UW9qaE5WeTVCZVJqOWZtSDdLWklYRWxJQXRRMjVFcDVPMlRsekRIVDdY?=
 =?utf-8?B?ZUk2cEVlTGlOUlFiUnZROGQ1cEx0WHhzNkUwaHFpK1ZlNWE2d0dicnI2S2l6?=
 =?utf-8?B?R0RBSG5RdndpYkRPZkZzT2lRb2xXQjk1a2p5bkgvZEt5NEcwdG1SQUJBdG1u?=
 =?utf-8?B?QTlxTU9KNUlCK1J5d1pCOS9jSk0vUVVDRTl2SHVZdHlGM2VkMXhOWVFiTVcv?=
 =?utf-8?B?Q2lhRlovZnVYODB1UHBheWtlRHB1VHdQK2M3dXpjN05YNnJWcmRuNlloei85?=
 =?utf-8?B?MEFwNGhHM3Zuc0x2T0o3MDlQRWJlSEdicGJkL29JVnl3bEZRdmU4M2xYemdh?=
 =?utf-8?B?QzREUTh4cS9CMFVzUkp5MnZxanZmWFlXdDgxcE8zQzRvZG1QYnZzOWM5bGdj?=
 =?utf-8?B?NU4yZzBBZUxQenNXWDhMUHc0VnhtV2l5Tyt3c3diUnB0ckRiNWhKL3hnQkc5?=
 =?utf-8?B?QWlIcFBWcFN6YU1oQVJUU1dpUGxFdW9paC9ZOEp5NmJiSXJjQkRqQ1g4QWlC?=
 =?utf-8?B?ZmhQcmVKdzlicC9BYkJUeERjYTJQNkpmU2tCMG1UdzlWQWUycjQvVG1FQkY5?=
 =?utf-8?B?U1BQOXp5cjhnUDhPM212eHlici80V0JEd1Q1SFlsbUJWQVN6SmxyMTVsOGxl?=
 =?utf-8?B?SS9tZVVjVEU0c1p3aDIxNTRjRFhiNzB4NnFqWGNNbE4rWFA2U1F3dzJJdXJy?=
 =?utf-8?B?T2NXMk1hNWpQay9Ib2ZmaVVkVnBTdkZaRmRKRExhMWg3YUdoSWQ0L09aVkQx?=
 =?utf-8?B?OXBMMEQzWUxEbFRMK0VxeTNhcjU5aTRLeS83Qng2d2VwVmdtMjRneExOMFJz?=
 =?utf-8?B?V3hFL1pQTEFBUUsvS0o4SEhGZHNXQ0tjQlpZUzlrUjhsR0RIYWlIZHJjdVp6?=
 =?utf-8?B?WEtPTHFndFAyeUVGcXJzNU41UG0wL0NNZzVWOE9oTzczTzd4REtFZENaRThm?=
 =?utf-8?B?T3BySGdYcXRUZzN2U2ppaytxZnN4NUhvSnVuMFJyVFl0OHBKNzRJNWZ1MEtv?=
 =?utf-8?B?YjE2RzhXclpSLytuZ21tU3ZiaXJINnJZdzcwQ2ZWN3VOVG9EbDY4ZmhGSDZI?=
 =?utf-8?B?SmdmbGFpTHBaN2tpTE5EY1VUTFg2QlhPK0Y2d0M1UzYxb1JNMTBqVW9IM2tn?=
 =?utf-8?B?cVp0ZGFwT3ludTliV3JPMVd4YWpDcUFRSmg0MjY5U2NvNzdUWk03ZTBrTHI1?=
 =?utf-8?B?RVNZYlZtams4ZWdmN0FEM1k2V3JYQ3NiT0prbnFoUnVRbWZDQ25vakZqMCtX?=
 =?utf-8?B?eGsvZmkyQjBVdk0yZHhVQkNsYUg4VDhZc3QrenRjVFJ5Um1sS1ZqSFBxT0pE?=
 =?utf-8?B?LytqV1JVL0drY1ozMjRRK1M3RUZMeG0zRTkxVFVNMmQxRHZVOW9YMmdENTJ1?=
 =?utf-8?B?K1ArZ2dxYm8yRW1SY3RPUDV2enBpbXcvbzdQZk1MWXNCUmJZRHZQNVhDejRx?=
 =?utf-8?B?Y0ZTeVpIUmJqdHQ3M3RON1J4OUF3bGo4MGtZNzFqWkNkU0dxUmhPL2VQMkZz?=
 =?utf-8?B?TTRHVmhCUmJQVy9xcWhsZlFPUXgwdFpLcis3UUJpUnZjbFd4U0JaZTFrTldP?=
 =?utf-8?B?amVDRENsMUJDeC9lUHZRb1JWTzBnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F3405FBC18F294F985B93439FC76762@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b381cf-d45f-440f-7c7e-08dc44eca977
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 12:37:22.5443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIeggE/MS/zGbZEdw77I19Ib6gM5csdmsCyAZifpp+F6c1AnHH04Ceh/ja4pL38CC1+LekKJprOckEhbeEkKZdWcSCtAQ0g1PMYKRnJEYqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2849
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

SGksDQoNCkxlIDE1LzAzLzIwMjQgw6AgMTM6MjAsIE1pY2hhbCBTdWNow6FuZWsgYSDDqWNyaXTC
oDoNCj4gSGVsbG8sDQo+IA0KPiBJIGNhbm5vdCBsb2FkIHRoZSB3aXJlZ3VhcmQgbW9kdWxlLg0K
PiANCj4gTG9hZGluZyB0aGUgbW9kdWxlIHByb3ZpZGVzIG5vIGRpYWdub3N0aWMgb3RoZXIgdGhh
biAnTm8gc3VjaCBkZXZpY2UnLg0KPiANCj4gUGxlYXNlIHByb3ZpZGUgbWFuaW5nZnVsIGRpYWdu
b3N0aWNzIGZvciBsb2FkaW5nIHNvZnR3YXJlLW9ubHkgZHJpdmVyLA0KPiBjbGVhcmx5IHRoZXJl
IGlzIG5vIHBhcnRpY3VsYXIgZGV2aWNlIG5lZWRlZC4NCg0KQ2FuIHlvdSB0ZWxsIHVzIG1vcmUg
PyBXZXJlIHlvdSBhYmxlIHRvIGxvYWQgaXQgYmVmb3JlID8NCkNhbiB5b3UgcHJvdmlkZSB5b3Vy
IC5jb25maWcgPw0KDQpJIGp1c3QgZ2F2ZSBpdCBhIHRyeSBvbiBteSBwb3dlcnBjIDh4eCAocHBj
MzIpIGFzIGJ1aWx0LWluIChJIGRvbid0IHVzZSANCm1vZHVsZXMpIGFuZCBpdCBzZWVtcyB0byBw
cm9iZSBwcm9wZXJseToNCg0KWyAgICA3LjU0NzM5MF0gd2lyZWd1YXJkOiBhbGxvd2VkaXBzIHNl
bGYtdGVzdHM6IHBhc3MNClsgICAgNy42MDcyMjRdIHdpcmVndWFyZDogbm9uY2UgY291bnRlciBz
ZWxmLXRlc3RzOiBwYXNzDQpbICAgIDcuNzc2NTk0XSB3aXJlZ3VhcmQ6IHJhdGVsaW1pdGVyIHNl
bGYtdGVzdHM6IHBhc3MNClsgICAgNy43ODE3MjNdIHdpcmVndWFyZDogV2lyZUd1YXJkIDEuMC4w
IGxvYWRlZC4gU2VlIHd3dy53aXJlZ3VhcmQuY29tIA0KZm9yIGluZm8NCnJtYXRpb24uDQpbICAg
IDcuNzg5NTcwXSB3aXJlZ3VhcmQ6IENvcHlyaWdodCAoQykgMjAxNS0yMDE5IEphc29uIEEuIERv
bmVuZmVsZCANCjxKYXNvbkB6eDJjDQo0LmNvbT4uIEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQoNCg0K
Q2hyaXN0b3BoZQ0KDQo+IA0KPiBUaGFua3MNCj4gDQo+IE1pY2hhbA0KPiANCj4gam9zdGFiZXJy
eS0xOn4gIyB1bmFtZSAtYQ0KPiBMaW51eCBqb3N0YWJlcnJ5LTEgNi44LjAtbHAxNTUuOC5nN2Uw
ZTg4Ny1kZWZhdWx0ICMxIFNNUCBXZWQgTWFyIDEzIDA5OjAyOjIxIFVUQyAyMDI0ICg3ZTBlODg3
KSBwcGM2NGxlIHBwYzY0bGUgcHBjNjRsZSBHTlUvTGludXgNCj4gam9zdGFiZXJyeS0xOn4gIyBt
b2Rwcm9iZSB3aXJlZ3VhcmQNCj4gbW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0ICd3
aXJlZ3VhcmQnOiBObyBzdWNoIGRldmljZQ0KPiBqb3N0YWJlcnJ5LTE6fiAjIG1vZHByb2JlIC12
IHdpcmVndWFyZA0KPiBpbnNtb2QgL2xpYi9tb2R1bGVzLzYuOC4wLWxwMTU1LjguZzdlMGU4ODct
ZGVmYXVsdC9rZXJuZWwvYXJjaC9wb3dlcnBjL2NyeXB0by9jaGFjaGEtcDEwLWNyeXB0by5rby56
c3QNCj4gbW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0ICd3aXJlZ3VhcmQnOiBObyBz
dWNoIGRldmljZQ0KPiBqb3N0YWJlcnJ5LTE6fiAjIG1vZHByb2JlIGNoYWNoYS1nZW5lcmljDQo+
IGpvc3RhYmVycnktMTp+ICMgbW9kcHJvYmUgLXYgd2lyZWd1YXJkDQo+IGluc21vZCAvbGliL21v
ZHVsZXMvNi44LjAtbHAxNTUuOC5nN2UwZTg4Ny1kZWZhdWx0L2tlcm5lbC9hcmNoL3Bvd2VycGMv
Y3J5cHRvL2NoYWNoYS1wMTAtY3J5cHRvLmtvLnpzdA0KPiBtb2Rwcm9iZTogRVJST1I6IGNvdWxk
IG5vdCBpbnNlcnQgJ3dpcmVndWFyZCc6IE5vIHN1Y2ggZGV2aWNlDQo+IGpvc3RhYmVycnktMTp+
ICMNCj4gDQo=
