Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CD7873790
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:18:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=N+xf8aeP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqY0m4WZ0z3vZ8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:18:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=N+xf8aeP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXzz5sb0z3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:18:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5XRwCkJmpUiDwISoHJ/HoOJ0NjNfS8TXV5xebPka9gnTNGD7Qzm1H2z1QYZx4+hiBUhaZFpRzehe5++PKlS5aZvcFb1pB/i1g1u7f4JtPSOwWXkrOFuZL2d807x3H/CywCFcpr+WxoGJR3wig0WnAf41uyd/zIsW1+DmxkrzTNsKEYmhZV5pKthY6pv5nqhHwW+Qb5uDH2zSjPcEBx3F3D4f/DHUhkRhZgqR1CNtXKDVhpVnPQhxa1wp0PkddQUzYiNOgLspP5a5TR+imr1zaiBc7QFzM8p3CWGFDxapbsGvvFDmePpL9doveb5Z3LoFUAk434BFn8jEUGmXgQ8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lilFRQkuw9WC4dU73cFTZ4P/TfzOJNkcz735ZsFs+qA=;
 b=C52/tjPRXhOscktfsW2kj/xbhCDKbv4ZHWS+TmB/1vJkSBQJMwn2nG4VDIW8vV1eNb/f3VVUu34vCLIUFFrqhGWtGgpMAdwBKseIz9eLLAKFDZU4uEhws6VT97csxwx4+h9nNkUcdRXbgzvyY1Bxw1yCp0MblXYbDRnVE/Qnji2DMkVRLCD7duo8cmgiIvS5dEJLXRqzwXnDBAMiz5ZERgMn790oFQgxxrgdGLeCG56gzYuh0pzFNURcJl8B3/62aKZEZNKtu6ZcZM0k4RN3D+kGJ9hFikLscB1eCi96E1hD7t39uScZ5GOfsFDjOS5qQrfDrQIwEQQqsyHytIbCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lilFRQkuw9WC4dU73cFTZ4P/TfzOJNkcz735ZsFs+qA=;
 b=N+xf8aePyyxUCaJX1zJcOD1KvBbR0YlDs0Z8zmVdag0jH+st7SvaCYwGKSP/3mjPqkY0Joy9K0AxM6WVQdY2adM8CO09kdVcTzUIzpt7gso7EFo7A3qXqry8QFmLW96dM7GJ+njwbjoQ8exj0HzBeLM0WURZWKUn89uHYIBxl4Js9Q5QNKlxGnUkXLJqqN9mk0M5QY/7fZ5MS9BnoMaVvxfP2/Gloyt6a2Y3rzvmYr9yJQyJb3Idf7sQy2XUc3xJXclc1uIUPVLeu9/qo1fLW16TZX1AFls3thi/b5gzkUGq4Kscxx2/canuAdfiVJubGYIIp3/5ZkGQP/KyaGSSiA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3245.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 13:17:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 13:17:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] macintosh/ams: Fix unused variable warning
Thread-Topic: [PATCH 3/3] macintosh/ams: Fix unused variable warning
Thread-Index: AQHab8ZUbltzgnJp8UWXb7URKbgjErEqscoA
Date: Wed, 6 Mar 2024 13:17:42 +0000
Message-ID: <210b7f0e-9f1c-4f8d-8248-3d906121333a@csgroup.eu>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
 <20240306125853.3714578-3-mpe@ellerman.id.au>
In-Reply-To: <20240306125853.3714578-3-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3245:EE_
x-ms-office365-filtering-correlation-id: 97483ea3-02e4-4734-4ace-08dc3ddfce6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JpPnhqlsKV1uZeb5K9IWsRchxtLb2/q1euW36ERhHY09VBW6Xl+v1+oEKn/2msbhowUhlQvCyCOArE1ws6Hiigibrxn4+oGdweXTFDkH/PtQlYKjrCJNoFMWrv4lN8uzrBzQjZXEfHcqdRMQ1FiMATCKS0O4Lj4okuaxxPcT/p/WrLgKHhgRVU+In0N6FXsDCb1f66ayn1x6AHcox7dTbXn510+k6snz9rKp6FncCotfX8F/tOhjPOCDA/sQyUSgMPCM3pLMN/Zq8UfpSALvEX1GMw4whwHOFkjCc9xOfR/abHQbQ9bHia5VYXEx46KafnBhaaRTIY4ksk0LXhgWSWpmBUJta+ReBmaeTHcl/tG7VCQxNyrqoIpuQf3XIqxWGr2ZoR48HNJ3fw1xLYdDWa5ppyShXo1C9Xbzl+ENpbbmuM6JwJ244OIuPcnfx99a4WlBZ/6eSs6FonnbDXM0kZfNbUHJWq37f7adb6BFGFoEMkcZbdcMax1dOJcQCu2hi93Fn3BwMSCuPfCDaqpU2gCMm+Ah6R1qZOSSdO6GlKUO/ehX6ZluByFzJqCUBM9nNVnNUiR34Vctg5mGuzxNY6gjwBeWq2isnJuWB7YPzR8GhWE4KxCa7m0y2otnq+iRcWtn8Yb1kJ7bhqYlQKHYlrWRqNDRqWvQ//60unw7E5WJzI+vdeqh3nW5hz3x47YMIC5hjsGNzyX0GxcaUmsf0kT3U+k58HMCZFP/+aRmrcw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y3BmeDNaODlLQkQ3b1JGVkJnUm1mR3NDQU8xQ1NjaWx1Rnh2Q1JlQm1rVHR3?=
 =?utf-8?B?VGhlbXhJUDkrT0dES3FuNC9Sb2w2ME1XV3U0K21PTGMySlRjbjk3S2RIS1Iz?=
 =?utf-8?B?c3VGTXRKSlJGa1g5aUlwT2RvY2lBQWZjWFJvaE83ckJMc0NpOEQ2WFFyWCt3?=
 =?utf-8?B?YlFRSGQwd2NhTU93L2VKd2d1aXRNczY3dVhIMWoyUUlleXdVd1hYNHhCOHNS?=
 =?utf-8?B?L0JXZUJteVFCZ0lJOVc1SHFMZmZkVjdZdk1odEgxR0gvNk5ZUDlDOHp6eW1R?=
 =?utf-8?B?dVZtaVVZemxPdlZsVUljNnhJZS9ZWHdSdCs1WXhXVU10M3c0MWpiTXNlZWw1?=
 =?utf-8?B?dXl3N0ViMStSNzdYTzc0eFRiekdCVDNtWUJYZkszK25DVS94SDFmNlJBQ0JV?=
 =?utf-8?B?R256bVBOKzhRYlMrdW9BQnZLek90R0pRZWRGMlQrY0hSK3l5aFkrbTB5SjFG?=
 =?utf-8?B?RzFIVGR4RytFbEhlM0F4SzdkVzduc0g4MjR0Q1Z2WlQ3enFDdmtQbkFvYStX?=
 =?utf-8?B?WktybCtVcVl3ODVEUTYwdUo3K1lPVFRxTEZOQ0M3WkdUbWdFczJmaVdvNGJ5?=
 =?utf-8?B?QnNnNnY3WU1rUVIrRlVIZ2FhL1BJclZ4THdYeGhOK1NEK2k2T1hKdFh6MW1C?=
 =?utf-8?B?cVVlMzR5Z1lHZlA2REM5SDkzZ3VFcGlrZWxpZXQzeVdDNTJBUHBzWE5pUGFu?=
 =?utf-8?B?SC9iR3J0RXZpcHlBTjFOSGRqeGNpdUlDZjRnbWMvdkZLMXVHYXRrZFZpbk9x?=
 =?utf-8?B?UHlrd0gyZHZHUWhlVGpMMVJoMEtKblVMUmR3dU5ZV0I1TUY3ZkNCMXBiTFVP?=
 =?utf-8?B?eGFkWFZITzBheGhoZTBSKzhIZ3dCQXZwRnhzUzEwV0lqYTAzQkdtelV1M0lN?=
 =?utf-8?B?R2h5WXVQT0pQcVFjZnJEQ2d4Q2luNlkrS05SUFlSdDNrYnI4QU1DN2lFRk1q?=
 =?utf-8?B?Uk9lakc1cGlIQWpnOTliVmtFUGNvaUtMemdyS2NuUVN6alBpT05XQ0QyUHN1?=
 =?utf-8?B?OFVoVXYvd2R3ekhLRWNiK0lWcCs5Y2xsRCtoemc5OUpaemJCV3NpZEZtNGp3?=
 =?utf-8?B?NE9pNjFXNmI2OVdsem8zOVhnNC9zM1RZWUtvUllIampzZDA4Y1pCc2txYW9N?=
 =?utf-8?B?bHVmbnpDRmRxZDJZcExrM25wWFFUUk52Z1gzSTVsc2tSTmo4dzc4empFZ0hr?=
 =?utf-8?B?VmVWMjlHQ2pXYmlSZ2prRHIva0tpVUFHejVYV2dPbzZIZitpQzBQVFpiQUND?=
 =?utf-8?B?aTdVVnRoanVtSUVVM1BNeFZ0ZkxUbnVBdTNnT0Q1U0hVM2NNMjhkWGt1bFlI?=
 =?utf-8?B?aFQ3bHpIbGVxa0M4UHV2VmRsQVVOcTdZakYzNmNLSWM0YUJnYys1ZXR6MVVs?=
 =?utf-8?B?NE9NaVFvNCtLVTQ3Y0txTFNxT01ncEdQUTlzTlAwdnQ2SCs4dGx5NVcxb05X?=
 =?utf-8?B?SkIybnZrVWNXZmFacW13MXUvRFM4RFZlR1J2akZKM1JHMmRvOC9SV2g5MjU4?=
 =?utf-8?B?dzd6RlNmVkpTVVdYQjlQQUFhbk5rZ3VzeEpSZk56OFhGV0lQZDVxTytCdjdJ?=
 =?utf-8?B?VFdVaVdaMVZ6aEdNRDd2RC9Sc1VTRUc5RG9iY1NOU0RYNmt4RjdOTUo5SSt3?=
 =?utf-8?B?T3ZxR3BPMTRYOUdncVpKRFQxT0k0a2xmMW96cnR0ak92LzJaazlHaFhzR2JU?=
 =?utf-8?B?SHRKcUpDTWVoR1pWTFlIMWRIeEQyVjNXbHVtOEZ1Q3dJaDBKa1k5YmNvSTZp?=
 =?utf-8?B?U0svMUxzYzlwcUJNK29TalE3dEpNblQ4a25kTmFqczFtNlNlem5VUjdGNnkw?=
 =?utf-8?B?WXgwUnBKTnJGL3RIdytoak41eU9RK3NHYk5XYmFhTDNGb3FnQUgyc3lJTE00?=
 =?utf-8?B?L3djWHkrSTBLZnpibEVDRVdjdXVneWhyNHlNSGN4VUZBa09BSG5wbHB0OWdP?=
 =?utf-8?B?YWVwQjI0RTJiTjNTOStYZmtPNDNnR3dkWVpCVjBKelhJa05RTXNpZUxpRjdt?=
 =?utf-8?B?VFZGamRieUdvdDJPQW5teWNUZXBtK0VpUWhOWEhVanZ3RU9VYkMzVTFWclNo?=
 =?utf-8?B?blRoTERMMkRSQWpIMU41cHU0NUpIRUR5TGg5d2puMGVjYWlxc1BUT2VrT2lB?=
 =?utf-8?Q?vAjJ+Dns1B2cPqzn6obUkRCKo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BDA241EA789A74F81508A94BF7894A2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97483ea3-02e4-4734-4ace-08dc3ddfce6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 13:17:43.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDh/skK6/yGMOHN+29/Fy6Bg14PMQSnUkzMZ4IOakS+jdk2y0F8vqXdKQPJpQRCkJmuhgTviVfadTB7jF/uMdee1v/J315NKo61yFsoP284=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3245
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

DQoNCkxlIDA2LzAzLzIwMjQgw6AgMTM6NTgsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gSWYgYm90aCBDT05GSUdfU0VOU09SU19BTVNfUE1VIGFuZCBDT05GSUdfU0VOU09SU19BTVNf
STJDIGFyZSB1bnNldCwNCj4gdGhlcmUgaXMgYW4gdW51c2VkIHZhcmlhYmxlIHdhcm5pbmcgaW4g
dGhlIGFtcyBkcml2ZXI6DQo+IA0KPiAgICBkcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWNvcmUu
YzogSW4gZnVuY3Rpb24gJ2Ftc19pbml0JzoNCj4gICAgZHJpdmVycy9tYWNpbnRvc2gvYW1zL2Ft
cy1jb3JlLmM6MTgxOjI5OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ25wJw0KPiAgICAgIDE4
MSB8ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4gDQo+IEZpeCBpdCBieSB1c2lu
ZyBJU19FTkFCTEVEKCkgdG8gY3JlYXRlIGEgYmxvY2sgZm9yIGVhY2ggY2FzZSwgYW5kIG1vdmUN
Cj4gdGhlIHZhcmlhYmxlIGRlY2xhcnRpb24gaW4gdGhlcmUuDQo+IA0KPiBQcm9iYWJseSB0aGUg
ZGVwZW5kZW5jaWVzIHNob3VsZCBiZSBjaGFuZ2VkIHNvIHRoYXQgdGhlIGRyaXZlciBjYW4ndCBi
ZQ0KPiBidWlsdCB3aXRoIGJvdGggdmFyaWFudHMgZGlzYWJsZWQsIGJ1dCB0aGF0IHdvdWxkIGJl
IGEgbGFyZ2VyIGNoYW5nZS4NCg0KQ2FuIGJlIGRvbmUgZWFzaWx5IHRoYXQgd2F5IEkgdGhpbms6
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnIGIvZHJpdmVycy9tYWNp
bnRvc2gvS2NvbmZpZw0KaW5kZXggYTBlNzE3YTk4NmRjLi5mYjM4ZjY4NDQ0NGYgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnDQorKysgYi9kcml2ZXJzL21hY2ludG9zaC9L
Y29uZmlnDQpAQCAtMjYyLDcgKzI2Miw3IEBAIGNvbmZpZyBTRU5TT1JTX0FNUw0KICAJICB3aWxs
IGJlIGNhbGxlZCBhbXMuDQoNCiAgY29uZmlnIFNFTlNPUlNfQU1TX1BNVQ0KLQlib29sICJQTVUg
dmFyaWFudCINCisJYm9vbCAiUE1VIHZhcmlhbnQiIGlmIFNFTlNPUlNfQU1TX0kyQw0KICAJZGVw
ZW5kcyBvbiBTRU5TT1JTX0FNUyAmJiBBREJfUE1VDQogIAlkZWZhdWx0IHkNCiAgCWhlbHANCg0K
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQu
YXU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWFjaW50b3NoL2Ftcy9hbXMtY29yZS5jIHwgMjkgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWNp
bnRvc2gvYW1zL2Ftcy1jb3JlLmMgYi9kcml2ZXJzL21hY2ludG9zaC9hbXMvYW1zLWNvcmUuYw0K
PiBpbmRleCBjOTc4YjQyNzJkYWEuLjIyZDNlNjYwNTI4NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tYWNpbnRvc2gvYW1zL2Ftcy1jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9tYWNpbnRvc2gvYW1z
L2Ftcy1jb3JlLmMNCj4gQEAgLTE3OCwyNSArMTc4LDI0IEBAIGludCBhbXNfc2Vuc29yX2F0dGFj
aCh2b2lkKQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgX19pbml0IGFtc19pbml0KHZvaWQpDQo+ICAg
ew0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7DQo+IC0NCj4gICAJc3Bpbl9sb2NrX2luaXQo
JmFtc19pbmZvLmlycV9sb2NrKTsNCj4gICAJbXV0ZXhfaW5pdCgmYW1zX2luZm8ubG9jayk7DQo+
ICAgCUlOSVRfV09SSygmYW1zX2luZm8ud29ya2VyLCBhbXNfd29ya2VyKTsNCj4gICANCj4gLSNp
ZmRlZiBDT05GSUdfU0VOU09SU19BTVNfSTJDDQo+IC0JbnAgPSBvZl9maW5kX25vZGVfYnlfbmFt
ZShOVUxMLCAiYWNjZWxlcm9tZXRlciIpOw0KPiAtCWlmIChucCAmJiBvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShucCwgIkFBUEwsYWNjZWxlcm9tZXRlcl8xIikpDQo+IC0JCS8qIEZvdW5kIEkyQyBt
b3Rpb24gc2Vuc29yICovDQo+IC0JCXJldHVybiBhbXNfaTJjX2luaXQobnApOw0KPiAtI2VuZGlm
DQo+IC0NCj4gLSNpZmRlZiBDT05GSUdfU0VOU09SU19BTVNfUE1VDQo+IC0JbnAgPSBvZl9maW5k
X25vZGVfYnlfbmFtZShOVUxMLCAic21zIik7DQo+IC0JaWYgKG5wICYmIG9mX2RldmljZV9pc19j
b21wYXRpYmxlKG5wLCAic21zIikpDQo+IC0JCS8qIEZvdW5kIFBNVSBtb3Rpb24gc2Vuc29yICov
DQo+IC0JCXJldHVybiBhbXNfcG11X2luaXQobnApOw0KPiAtI2VuZGlmDQo+ICsJaWYgKElTX0VO
QUJMRUQoQ09ORklHX1NFTlNPUlNfQU1TX0kyQykpIHsNCj4gKwkJc3RydWN0IGRldmljZV9ub2Rl
ICpucCA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKE5VTEwsICJhY2NlbGVyb21ldGVyIik7DQo+ICsJ
CWlmIChucCAmJiBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgIkFBUEwsYWNjZWxlcm9tZXRl
cl8xIikpDQo+ICsJCQkvKiBGb3VuZCBJMkMgbW90aW9uIHNlbnNvciAqLw0KPiArCQkJcmV0dXJu
IGFtc19pMmNfaW5pdChucCk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklH
X1NFTlNPUlNfQU1TX1BNVSkpIHsNCj4gKwkJc3RydWN0IGRldmljZV9ub2RlICpucCA9IG9mX2Zp
bmRfbm9kZV9ieV9uYW1lKE5VTEwsICJzbXMiKTsNCj4gKwkJaWYgKG5wICYmIG9mX2RldmljZV9p
c19jb21wYXRpYmxlKG5wLCAic21zIikpDQo+ICsJCQkvKiBGb3VuZCBQTVUgbW90aW9uIHNlbnNv
ciAqLw0KPiArCQkJcmV0dXJuIGFtc19wbXVfaW5pdChucCk7DQo+ICsJfQ0KPiArDQo+ICAgCXJl
dHVybiAtRU5PREVWOw0KPiAgIH0NCj4gICANCg==
