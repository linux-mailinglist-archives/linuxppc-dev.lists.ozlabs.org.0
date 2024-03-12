Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54086878E3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 06:45:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NFah+XmQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv2fj16Jxz3dtJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NFah+XmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv2dz6Pspz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 16:44:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1qJ9XFILXbduB/w4z/8X5+jqKR9QqWIxtY9+BjK2COSRrU04w0Hfe555QZC5urMPrhpDa5DTeuDOf2YGo/ssLYRF8VFH0I9khKTadORLJchX9PtRp9UoNmJf7PkK6yTjkzfE9GOBl/GqfF/Y82xM/VgJBPLRccv+qXEijPqKlZ043PZalrvmoHs+DVamkRGu+F1u4UwNf6+sVaMHO46/IeKXOo+zK7CumIIwAOYujCsATVIT7rhoE33/kLVbgOhxr8PfjnES0G/MmQjgqTst/IEdUZ8uLmIC9AM6RApFKVWkYfOQfbyBHLGe+FayT1ngCQyHpam4ilIhb1PgkMuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDSjnDKjYB8q60mMrakPtyJ7hVaYY2Sr+pjLkbNzrDA=;
 b=i71jEEHlpiFaGTdXtyg4rg43RRTw/ftZfH6eXjULrRylSP+ow1tuEe7JgiiQ/GHv4jV2Qo9Z4Sa4t1uBcakV7tTJ6FDvSmdZ9KvjoLeiPOgSR5t0iBpb+MQA2Z/DiSBs5kiq+LwyGhdXbzdrxS/7hRDExN6cuC7HFPt0N1i3Dt0eC501AX1Qm4KXDxtkCtERobtFaYRz3K4lW1XRpNTVndNZznp4jmpy6s39RpLMxArctLG/jQjQRcW0R1WoU+sYNerfVkXjzQGk0aVEOGwAsGHLCTnu2XMm2ukqvF+fYxaEA1JSSsJjnnl0rFUcm6zlsPkPiL5vJufR3sU4mjwdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDSjnDKjYB8q60mMrakPtyJ7hVaYY2Sr+pjLkbNzrDA=;
 b=NFah+XmQMwBEFgxMZzaOSj9MPEP9vtdjTaRLKWroUg+/YAx0uygWsuvuW6YSFgg8e7lNRRjfue3sL4Cr13Xe78kr152KXbdScWuRv7idzv2IreHEDOJkLsqWZLnpV4/28GWz2dj2qefyCr4jMDksERnuAx9jv5Cq8C2FHkVLsBewupXdBo0LD/8mI8C3IVmmtuqw5yeE+umv8I5LEUE21JHvArVC8QKQz8LzZ1tp7IKcwvwaV5EgY8V1Io08ABZLMGf2F5gejprCyHm/W3RU6+c79ZNDtGvXaxj9K47aMm7zDNX1tE0BWffOYM0SsmyjnSyXTxhrkHafHQMgFBsF1A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 05:44:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 05:44:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Waiman Long <longman@redhat.com>, George Stark
	<gnstark@salutedevices.com>, =?utf-8?B?TWFyZWsgQmVow7pu?=
	<marek.behun@nic.cz>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Topic: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
Thread-Index:  AQHacDjgK3b+WpnPIEGh5lKDyA2GCLEsCyQAgAA+QACAADOKAIAGv34AgAAXNwCAAEyOAA==
Date: Tue, 12 Mar 2024 05:44:17 +0000
Message-ID: <479472f8-58a1-47af-9f83-c75f89f67b00@csgroup.eu>
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com>
 <20240307095639.b6utkbzr36liuu3p@kandell>
 <3d95ab40-2df5-4988-87be-568a628a0561@redhat.com>
 <20240307174414.4059d7ee@dellmb>
 <cfceef12-883e-4593-9dca-50768acb1aa9@salutedevices.com>
 <d98bff53-c85f-45c0-acde-8cb4e018af30@redhat.com>
In-Reply-To: <d98bff53-c85f-45c0-acde-8cb4e018af30@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2004:EE_
x-ms-office365-filtering-correlation-id: a1b38690-dd9c-455f-2800-08dc425774f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  63kQqecslrYumuItt3DgKz5k24A5csQQfBZIp3WSET3RJWwETVYwEq9WxUgWMV3s/RPKO+qWor3RH2CZ5SQZa1iNPcRYUq78+wbRWhVG2e8feNVodJhB0xpGzs9ZI3mKZ/GBt+vg5tcVh+2hlA7QMuBGS7qRzSifGskWbSFMi0M4iPOozVEnXwG3x8HDDAf1mfewnKUGX2MDXj9h7//OfBN33xqVq46omeP6E+hPC51mL0pHbyy2D/tVR+Q/Wg2XSMjVms+2xjiCjdoyJtMNy6r+xYZDxl5yfkr9IAuNk3pV5rw2YAulh+/n3G1VQ5IyQsLGYOiHeWeMxtr0d745CuOwuAzw2GDZEzbSYfzh1Z5gLMz1RyM+xMgpPOyliodPICuilTLs1uS+H3D0xufo6RgLc7F2OukqvWO3wEX+p6clQXDUDN3DQOxuTaO2yPhpLQbaaH3DAeygUDSE1C1K2eBIrLp4awFb/Vda7fYNjhwEe0F15a3DSlAKCpc/lPeAYR3k2eYAdtDv92+8XWrtU5r9e9YS+vQDXzmIOFH5WguFHsKbVXdyI6Y+3mQJG4le7N3stjuFHqwlOCj1cIjMa0DiLLjHHJSn2mwq7QxIHfPNlKzyyxlzOBz6CBLJ2N9k5NQbVubW81iMkdpBAxxYVD78NcVinaxZI0s6waHQTgyIijcpay+4qSmTDNnhBnsfqeZO0qMpY6y1G3JOyi1DpA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QVVJWGdXckhIcll6Z1paZjgyUm1QMXl6ZVExKzR1WDkyb0ZMNFhJMWRqMVpj?=
 =?utf-8?B?QkpOTTMvb3dGcjhWN2djTVp5MWNMTnZBV3JjSEJuZDNmWmE1aHhGd3krZkRC?=
 =?utf-8?B?YUtta2piaE5nS0Zqb1U2eEx4a3Q0REVyS3l1eWVOS1dNOVFEMEs2Ui9GVVlZ?=
 =?utf-8?B?cTZlME9sSmZVa1VxMWp0VzlLQVpVUkY5RHpMWHo1bytsTUtkRCtwelFzS2lu?=
 =?utf-8?B?cFgyY3RtcEtjQXNkcWZseGtEV08rS3ZLZERDOVpDNVpjQmxVYks3M2hPdWN0?=
 =?utf-8?B?cG9ZdzcxZTFnY21LRXJlUzJyeEtaWVhuRDVnRE5LckIrKzdZY3lCSzJCOStN?=
 =?utf-8?B?bjJCZGVpcWdSbFF1alNMbkt0bTJJZHRyZXY3bE1WOXVOeUVlYng0d2xPOVhU?=
 =?utf-8?B?TlcwT09zdUcvTFFWMTkxdGJNNlVvbzVybXRxb1NsRThvNXM0NmR6TXlPSVFE?=
 =?utf-8?B?SVdOSUxvUkFGWW4yMGl0RURZR2RBdUdhdTJkN2Z0MEhhajFpY1gzVUFidGdL?=
 =?utf-8?B?NDYrMEdBVVROVG9TNzdNdzFnVGwxVkhSN0xLUmhxcUl4R0ZvS1ZDK0wxZHlB?=
 =?utf-8?B?U0dla1p6U2xIMEdHRENlTkN4VWRjQjFFejRJbEx6cFBqQnBOOHUwY3kxYVlY?=
 =?utf-8?B?RnVLUUNzdkFnQTFYQVNaWDhEaWFZdkd1WXd5N0t5K2w0NzlvcTVhUVpvL0lM?=
 =?utf-8?B?VUw2eTZCTHFsUVJDOERMbklZTXdqb3UwT2ppVWdkSmxvcngvb0NIcVNqTWRV?=
 =?utf-8?B?NUJHdlBiTTlUNExTYllIb0krZDBFWUR1T1BNYWtkdUhXS2ZKMHF4V0pNU1hl?=
 =?utf-8?B?SkpYS0l0N05aVWhjQmViM2NKclBQKy9XbmtkeGcvRWJLU3pYenRoTk9IUkZz?=
 =?utf-8?B?UVpxZGRNZC9FZnJuTVE5RTBrcStSeHNKNG5IUTJJYXFqR3l1eWpkTG1vUzJr?=
 =?utf-8?B?ZFJhVjRCQWJiYmR3VGtaaktCRjV0dFF2RVJvYWUwbEdqd0NlN1F4WUZFUEtZ?=
 =?utf-8?B?WkFleUxRalpNUVUyUkxNUWJjb0V4MEJibVFLUXljUUNvcFpBR1ZqN0J6bnNi?=
 =?utf-8?B?WDVOMmUxZlNrb2Fyb09GWTBoQThueHJSNjM4bEdiREFLS3lFMnk5dnNNTEZr?=
 =?utf-8?B?c2w0SFlHc3RMb2FPYVoyRTkrUFhCS1B1eHIrV29MVXVkMDB3UXJ1V1B2WDE5?=
 =?utf-8?B?cHJnakdTaEJIVEZyUkNWSHMrYWdmVi9Pd1JhUEhjdlE5RGhxbGYxblB1NHhD?=
 =?utf-8?B?MmI3VE51aG9mUWl0SWd4L2h5eHhJdjdUWW1XbktRQnkzL3N4MnF3d0tZK0M3?=
 =?utf-8?B?SFZrL1FXOVJRYUJEamFOOGUvZ0daeVR1eE1Ld3cvNkdveWtXWkhpQ2FaaHNt?=
 =?utf-8?B?ZVdCc01DMjkyM0hLVjFrYXRRS2ZCbDVjT0NnQ1FUcEYwL29tdlMrT0ZBTHVi?=
 =?utf-8?B?enIwS0FZb2NuQnBqMGxkL1FPZGZmT2JuK1J5ekJON0ZQMTVVUjhFUXBYd1dQ?=
 =?utf-8?B?RUtPYXM5Vi9mNzQ2WnNMSVdlUk9xbjlrRm9CMzhZcFRwUWhVMFUwUjM1VFg5?=
 =?utf-8?B?WW1qcEZMM2lrVFExb1VGSCt4RmlGRWI1N2ZpcUw1OUlyWFR4NHJsSG1MNFRX?=
 =?utf-8?B?TWFPWExqb2hoc01GMzV1L0pRazE2dkdIRGczM3N6bnNoZUN1QmtyNENjcDJM?=
 =?utf-8?B?SmJKNDZxWDA5QWlLUm9ONkhUUjh0ZWdKdGhVSmdERTRLNXd6UWUwRkkyeWl1?=
 =?utf-8?B?OE53NENWeDFVY0R4SzRMOXNOYVJ1MzBGUkJDVHR6MmR1NThGMlIyeWtsRmdO?=
 =?utf-8?B?amkxY21MYktqdUVpSnlPWEU5WTYreUozTlFlc0hHTzlpZGIyNW03d1kxeHZ5?=
 =?utf-8?B?ZVRqVTJVaHFyTzJORnJvb2h3eFlvcTAxbjRveHkwOFg5R1JnMGtFV25XZFBw?=
 =?utf-8?B?WVhWS0FvMUZzYUlxZ3ZnNExVVkxYOFNSRmMrbFZaVGs0V29tOVljeTM4YmF6?=
 =?utf-8?B?ZlZiNWpBd1VpRFJZaGl1aXpud2d5aldPOCtoRElqZzBmNkNxc1N3eGp6U3Zw?=
 =?utf-8?B?MGZCRWtOb3hvRmRmRDlVMHJrZzlhTm5wY1dhRk5GQzYyWlZwZWpxZ2RmY0Rn?=
 =?utf-8?B?NTBlQng3dUdWUE01bVhaaWxTc3pPN1UrNVpORVZyVE9LY1hmNlI4M0lCck9B?=
 =?utf-8?B?ZFRWSUJKdXJtOUVHRVJmajVuMkJSaUJhTVNxb3RWMmx4QnZsZ0ZxeVhKNkY0?=
 =?utf-8?B?QndTUXJjU1Z0TEt3YnhMQXB0bW1BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D91471BC4ED3244AB30F49F1460B91DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b38690-dd9c-455f-2800-08dc425774f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 05:44:17.1466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hxvXsRh8rPG36pIjhOmblXU5GW+2RLKZpesjUuXcqoCaVvGfQR1QnxKOBmwX8n5sV8T55FmcpJnJs2U2Y/WBmB687JQCKdi1c44HOKMkR8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2004
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

DQoNCkxlIDEyLzAzLzIwMjQgw6AgMDI6MTAsIFdhaW1hbiBMb25nIGEgw6ljcml0wqA6DQo+IE9u
IDMvMTEvMjQgMTk6NDcsIEdlb3JnZSBTdGFyayB3cm90ZToNCj4+IEhlbGxvIFdhaW1hbiwgTWFy
ZWsNCj4+DQo+PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+Pg0KPj4gSSd2ZSBuZXZlciB1c2Vk
IGxvY2tkZXAgZm9yIGRlYnVnIGJ1dCBpdCBzZWVtcyBwcmVmZXJhYmxlIHRvDQo+PiBrZWVwIHRo
YXQgZmVhdHVyZSB3b3JraW5nLiBJdCBjb3VsZCBiZSBsb29rIGxpa2UgdGhpczoNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdXRleC5oIGIvaW5jbHVkZS9saW51eC9tdXRleC5o
DQo+PiBpbmRleCBmNzYxMWMwOTJkYjcuLjU3NGY2ZGU2MDg0ZCAxMDA2NDQNCj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbXV0ZXguaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9tdXRleC5oDQo+PiBA
QCAtMjIsNiArMjIsOCBAQA0KPj4gwqAjaW5jbHVkZSA8bGludXgvY2xlYW51cC5oPg0KPj4gwqAj
aW5jbHVkZSA8bGludXgvbXV0ZXhfdHlwZXMuaD4NCj4+DQo+PiArc3RydWN0IGRldmljZTsNCj4+
ICsNCj4+IMKgI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX0FMTE9DDQo+PiDCoCMgZGVmaW5lIF9f
REVQX01BUF9NVVRFWF9JTklUSUFMSVpFUihsb2NrbmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+IMKgwqDCoMKgwqDCoMKgwqAgLCAuZGVwX21hcCA9IHvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiBAQCAtMTE1LDEwICsxMTcsMzEgQEAgZG8ge8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pg0K
Pj4gwqAjaWZkZWYgQ09ORklHX0RFQlVHX01VVEVYRVMNCj4+DQo+PiAraW50IGRlYnVnX2Rldm1f
bXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jayk7DQo+PiAr
DQo+PiArI2RlZmluZSBkZXZtX211dGV4X2luaXQoZGV2LCBtdXRleCnCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwNCj4+ICsoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcDQo+PiArwqDCoMKgIGludCByZXQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCBtdXRleF9pbml0KG11dGV4KTvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCByZXQgPSBkZWJ1Z19kZXZtX211
dGV4X2luaXQoZGV2LCBtdXRleCk7wqDCoMKgIFwNCj4+ICvCoMKgwqAgcmV0O8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK30pDQo+IA0KPiBUaGUg
aW50IHJldCB2YXJpYWJsZSBpcyBub3QgbmVlZGVkLiBUaGUgbWFjcm8gY2FuIGp1c3QgZW5kIHdp
dGggDQo+IGRlYnVnX2Rldm1fbXV0ZXhfaW5pdCgpLg0KPiANCj4gDQo+PiArDQo+PiDCoHZvaWQg
bXV0ZXhfZGVzdHJveShzdHJ1Y3QgbXV0ZXggKmxvY2spOw0KPj4NCj4+IMKgI2Vsc2UNCj4+DQo+
PiArLyoNCj4+ICsqIFdoZW4gQ09ORklHX0RFQlVHX01VVEVYRVMgaXMgb2ZmIG11dGV4X2Rlc3Ry
b3kgaXMganVzdCBhIG5vcCBzbw0KPj4gKyogdGhlcmUncyBubyByZWFsbHkgbmVlZCB0byByZWdp
c3RlciBpdCBpbiBkZXZtIHN1YnN5c3RlbS4NCj4gIm5vIHJlYWxseSBuZWVkIj8NCj4+ICsqLw0K
Pj4gKyNkZWZpbmUgZGV2bV9tdXRleF9pbml0KGRldiwgbXV0ZXgpwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcDQo+PiArKHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoCB0eXBlY2hlY2soc3RydWN0IGRldmljZSAqLCBkZXYp
O8KgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgbXV0ZXhfaW5pdChtdXRleCk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgMDvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICt9KQ0KPiANCj4gRG8gd2UgbmVlZCBh
IHR5cGVjaGVjaygpIGhlcmU/IENvbXBpbGF0aW9uIHdpbGwgZmFpbCB3aXRoIA0KPiBDT05GSUdf
REVCVUdfTVVURVhFUyBpZiBkZXYgaXMgbm90IGEgZGV2aWNlIHBvaW50ZXIuDQoNCkkgZ3Vlc3Mg
dGhlIGlkZWEgaXMgdG8gaGF2ZSBpdCBmYWlsIF9hbHNvXyB3aGVuIENPTkZJR19ERUJVR19NVVRF
WEVTIGlzIA0Kbm90IHNlbGVjdGVkLCBpbiBvcmRlciB0byBkaXNjb3ZlciBlcnJvcnMgYXMgc29v
biBhcyBwb3NzaWJsZS4NCg0KPiANCj4gDQo+PiArDQo+PiDCoHN0YXRpYyBpbmxpbmUgdm9pZCBt
dXRleF9kZXN0cm95KHN0cnVjdCBtdXRleCAqbG9jaykge30NCj4+DQo+PiDCoCNlbmRpZg0KPj4g
ZGlmZiAtLWdpdCBhL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMgYi9rZXJuZWwvbG9ja2lu
Zy9tdXRleC1kZWJ1Zy5jDQo+PiBpbmRleCBiYzhhYmI4NTQ5ZDIuLjk2N2E1MzY3Yzc5YSAxMDA2
NDQNCj4+IC0tLSBhL2tlcm5lbC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4+ICsrKyBiL2tlcm5l
bC9sb2NraW5nL211dGV4LWRlYnVnLmMNCj4+IEBAIC0xOSw2ICsxOSw3IEBADQo+PiDCoCNpbmNs
dWRlIDxsaW51eC9rYWxsc3ltcy5oPg0KPj4gwqAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+
DQo+PiDCoCNpbmNsdWRlIDxsaW51eC9kZWJ1Z19sb2Nrcy5oPg0KPj4gKyNpbmNsdWRlIDxsaW51
eC9kZXZpY2UuaD4NCj4+DQo+PiDCoCNpbmNsdWRlICJtdXRleC5oIg0KPj4NCj4+IEBAIC04OSw2
ICs5MCwxNiBAQCB2b2lkIGRlYnVnX211dGV4X2luaXQoc3RydWN0IG11dGV4ICpsb2NrLCBjb25z
dCANCj4+IGNoYXIgKm5hbWUsDQo+PiDCoMKgwqDCoCBsb2NrLT5tYWdpYyA9IGxvY2s7DQo+PiDC
oH0NCj4+DQo+PiArc3RhdGljIHZvaWQgZGV2bV9tdXRleF9yZWxlYXNlKHZvaWQgKnJlcykNCj4+
ICt7DQo+PiArwqDCoMKgIG11dGV4X2Rlc3Ryb3kocmVzKTsNCj4+ICt9DQo+PiArDQo+PiAraW50
IGRlYnVnX2Rldm1fbXV0ZXhfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAq
bG9jaykNCj4+ICt7DQo+PiArwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
ZGV2LCBkZXZtX211dGV4X3JlbGVhc2UsIGxvY2spOw0KPj4gK30NCj4+ICsNCj4+IMKgLyoqKg0K
Pj4gwqAgKiBtdXRleF9kZXN0cm95IC0gbWFyayBhIG11dGV4IHVudXNhYmxlDQo+PiDCoCAqIEBs
b2NrOiB0aGUgbXV0ZXggdG8gYmUgZGVzdHJveWVkDQo+IA0K
