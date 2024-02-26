Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B350868023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 19:55:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Fd7NBOeQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk8ty5wQVz3vb2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 05:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Fd7NBOeQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk8t85V3Pz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 05:54:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lM+yljWb2C18J4Jw/CSnWRpPTICg6xMnHYFMG8CwPac789mqtJFH5v9OCfpsWPFgXS6nunq4H0hWDJd26U7ENao1nTzVKciMsNc7MPp5aDIOAGElmVVcJiuy0NGuQcnfni84r6lnQKOfI/HrafKDXeyQsLdygTQh6LutS/hhUjKoP/6cAGiOvDpW3CfOQ8qTgjlkMptGSHlQ9L2Jqp66Dg1EcR3KMDv3ouynY3wwMujcrKN8QnEUOLt7BCBxbHehgqi19BCJII6ZtdoJCqBPnvgSM3iQ0GesltGKruzZyFB5yZ0I+2QlwgpIy5rydiJtZ3Scjz6yHGh3itKikmn/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYGe+zWU3Kna6wmlC6InTwUxBqGETMrm0x8fGoU6LYc=;
 b=ep4MEFvGlJtE/Z2CeFovRI5z7+WZcCeskvJu6ESRbESPoNRV1g3gEZl2LC7WhEMLCxj5F4eRJPV22PuH85XszrkAeC5UmaF1ZvTmJqwT1g+HGTKh8UrKpELSeTbyxUh+dXpUFgNcR7cbiSRM5GDBlDaNFT0Tx84vvCnyFFtF3l9q1T17Cp6RZdE4tVE02LAgD2qOHoN6MFQ/NS11wC2qEX/7TymKTX98yi2jtqEa1ABZtWhGe26kFfl5IAwm1DCfAqLMxlh/AZXxTNEXSO/admcJo6Td7U8CM6tXckwIniI0jXmmgB7V+OBMBjmTWDVpjwZJNlkkplO/g+weU2l2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYGe+zWU3Kna6wmlC6InTwUxBqGETMrm0x8fGoU6LYc=;
 b=Fd7NBOeQjrg6As/9RayTeQNFGQ4AlSC3Cvq8IYkw5U+eZ33oj0wVHQ3VYxCLF5iqXE7E/j6UjIvzRTW3tlILOEB5Aen+Z7ZYQ7euyfqZVo9ZZ9UUmHg6+RIB3zG6uBzQ+8On8KscdYK4F54Ow26XLT7QUfmXezVO/r785fzDyZkGP+WdxoAOAgbFLEptuaMynH9uczFibARZaI+ghhoR5i4eI3gzdhsG9kLK1d3pJE/1tvxy+FAntRrCfl4LrWQxqYxQtqMHjggJVZiUEI+ZUJQsaTWY3m2rdLSjVANKBf5tM2zI7uL2PhgEIKRt+Y1WHEFJtbs/cdS07DwfMWZ1Wg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2655.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 18:53:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Mon, 26 Feb 2024
 18:53:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook
	<keescook@chromium.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 4/4] vdso: avoid including asm/page.h
Thread-Topic: [PATCH 4/4] vdso: avoid including asm/page.h
Thread-Index: AQHaaM783I0sqYE5uU2LN0m8jk9xFbEc+K2A
Date: Mon, 26 Feb 2024 18:53:57 +0000
Message-ID: <80bc4de5-a351-4ac0-93c8-80c8d80fb202@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-5-arnd@kernel.org>
In-Reply-To: <20240226161414.2316610-5-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2655:EE_
x-ms-office365-filtering-correlation-id: 4cb29eea-cdb1-4825-0e70-08dc36fc4978
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EOOY6FIum82fElAgWLKO7l+EaGwdM6nML9V8cDoWK9A3C8aEOG0hRjd4VC+AwbI6SX+dU1UCWFyKYND8IkgnS0Of9Lii1q4LSBTUHNjk2ijbHL7tib+Av3hMbiuVT6/bdv4b+qExpocmSkdgVBHa7rsIpz9K9Ezz+LlLegx9FA1owV5vOoA67pwt/Wdx5utkNYu8prsUV5FFywoL0FZYLw++Hl+9tcWvIBVAdV/7QRDzjvST996JCENrrCBsGaMRI6i/1tLl4WgaVtblmNzSx9za+JotNWIcyrcGOL1iiDVc9LlCzX6dRQu11/Wp7OBPF5NbtguTP/uc29jZhLrqjoR/TDWXXWIPr/MLjf/i2Jjy2DsOxx/FsJWb+JH0wxo14cHKX23YaJdgFte/ht1yDuCnr3ON8TGFgcEtd/m0rBIdUK9OGFS/RBpXe+U0sIUKbZP26071HNmmS+UW/QQzvsu4Z++Z7p+f6V94Y25bBgb5+Zj+TPKCjiQy6KrNmwij5QRUNF64gTwlOe6vZMZA17VARdCSgWEwvwWmDd0RfjuV/PHlKnsUxQ87bbBcrd/cXB7Kqmk3vEoOTd6iCTtLZSOUywn8g7gC+NrdBxe8sqrBcU/AK2M5HzWgI6jOMrZW0QAdZQwQvrw1r/UxxeXabjLg41rA5ae/ZaTekSFpoJmK5wvjBSxREos/wI2QuejT4aG9Z+dhvTB7KJT3Ycj09w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NTlob2dhNzhGaWMyQnl3RWs4SytSZEE4QkV5SmlVeUk3cjZDN1JxZkdJT1Rp?=
 =?utf-8?B?cHBncWFxcUFoWXVvYmFBenlGV2IvMWpuN0N3QitGMXBqR3I3U2FFYzJwY2Ja?=
 =?utf-8?B?b0tUUHIvblEvUGgraVIwOWFSQmNnc0t4K0dRVUlyemdLcEtEVkVCVmRRdjNx?=
 =?utf-8?B?d2ZKV21Kem1rV1VHV1gyWXZiQ0JjMzJ1aG1jTTJPNVI1RmxHdk05bWVwaHUw?=
 =?utf-8?B?T3lZQzhoZ0szRmZmaUhnMHdQSUxONHE4TjFqVThLSXMwNmlXSFdCM3dEWWN3?=
 =?utf-8?B?Z3JGWlcxQy92NDJrdEZ2bFJnNTBSc3I2QStSYlBmYUw2UldsbFd3emFvVGJ0?=
 =?utf-8?B?cEtSOGdLQWRObjdzZjVrVFkvZHhqVVpNTzEzVjB6QjZ1eWZQem5YUWlJRktI?=
 =?utf-8?B?RUdrNGlqdWJTdnEvOGE3YkVkUXRhU1RhdmtzcXFmNzBCaENkWkRXWE0rRm1V?=
 =?utf-8?B?ZGJDbjVhU2JmTU9tMWpnZ1BGVlhhY0kyL0M0MUhMeDJsWXBDampJOERPY1lN?=
 =?utf-8?B?eS9hZXdLbWt2cGFQQkpsTjlVUWRIcjhKYk5CMGlienJxUEhybEVDemlIQm9p?=
 =?utf-8?B?UWNjNWJTSmh6RnJWTjcrbU9GazhpLzlaK2RTYTJ2WmVyamtEa2lLaTlMbWY1?=
 =?utf-8?B?dDVyWVcyYng5dis2T1dzRmFOL21jUDgvY2szVHpGcFFPc1JqYmpUMTVFU2dw?=
 =?utf-8?B?a0dJcVRPdTBiM3N6ZGtBTytEa1Zscmx1WVNIcTI1c3hnNWIwYXJpaUdZQ29n?=
 =?utf-8?B?dXpUVGt1cjVnZTZIUDljZGg4TFlQSmM0WEtsaFMxOHg0U21IMHd0bHRqK0Rm?=
 =?utf-8?B?ZXpJTi9zVjdPdFh0am5GRndhMGtEUTFCc05yV2Ezb2dDaDF4TjJ5L21zWVZR?=
 =?utf-8?B?ZDk5V09CbllFTDJEbXVtdlMxSEN2STNQVXNIYUJvQzNRZEFac21XQ0FOdEZE?=
 =?utf-8?B?ajA0WDBGQmR2bTArOFdYUnRHL2tURVlGUUNTODBlckpUVzZsMkZXSEJFOXkz?=
 =?utf-8?B?NmVWbDFUV1VCb0RkYXMySkZtMEVlMERnSWRYTlZrd2hBeVRMdVQzSW5UVXBY?=
 =?utf-8?B?MzRWNm5jdEVsajZzelFMK1NFdzRyM2JVSmE0bjU0MUZJZUFpV0RLZy9GRURx?=
 =?utf-8?B?L1pLRTZqRDhJZ0VLam5kaXZVUHhoaEZ4Vm1tdmtkZ3NjdC9SRm9uVnREd2kw?=
 =?utf-8?B?ajNGb3lsRGRDeEloUlhSdGdUV09KbEhZb212SWFnWU5Ha0pFWm42UHQxOUFZ?=
 =?utf-8?B?UTVWQnhXV1FDS1BPazdyNCtHaTJyMVlvV3A4cXJldjNsZENOUS90RGgySEJE?=
 =?utf-8?B?QWFMdFVEMnJaSytnMExISFpYTkxhKzQvbnhEeTM0NmpWUGhDTFRDcVBZVk05?=
 =?utf-8?B?eUdIdk1iYnBoSmJKU2hPRkVQZVl3cjMyMWdaakNrazFsWE9HTzQxYUFRUVNI?=
 =?utf-8?B?ZEtneDEyc0FLdG1zdS9LU1N6TDI2MzMrdWJsaHdCaWpQeXUyRlVhQ25rdUZU?=
 =?utf-8?B?U081SnFRTnEyV3RmaS9zWXBCNElhMktSQVpCTEpiVGVQUzJwVzVWZndTNVFn?=
 =?utf-8?B?L2x2R0M0cTVsUktha0Flc1h3TEZOaVZmOEo1Qmx6ekNseXhkbWZTT0YvVUUr?=
 =?utf-8?B?NkVRL2RhY2I1bHh2Sm9rNmVJaUZPTDlKcmw0d3FwZHdaZlNrSi8rMWUwUmlB?=
 =?utf-8?B?R3piK3BIVC8vZjhuSktIaGhFZURYeWtSaDJodURZS2xxSlE2Y0hMcjVmcFhl?=
 =?utf-8?B?M0kydFpzeWtBaHVldzhCT1RMUXF4aXRMMHcxQ1BvSHh3NzQwakNiaUt1ZWNj?=
 =?utf-8?B?bk1UTU03NFZMQzFqTU9Eb1NaUFdGTUNsc0l2bjJubElaU3QrOGxrTjNORkdE?=
 =?utf-8?B?Z3FKM0FMQnBpam90bXhHeDZPcTNxZys2UkluSUl3cmhTTUhyMGJnZk1rL2VM?=
 =?utf-8?B?dnBTdk96ZGQvQ3hmcWErZ3g2d3NvOWprTkFJNTdnR3puS293elRCMFVVMVRR?=
 =?utf-8?B?YVM5UTVKM245d3NzdmVqa0M1bGZVbVA3R1BicVhoTmNpa0h6dE1nNzcrTytO?=
 =?utf-8?B?VHZXRTVJRmRUY20zTC9pNUNORkZTN0ZxeUs1d1p6WnRTQU1GUXNoSWxRcEdT?=
 =?utf-8?B?b21zWDk1aVFmaW13TUtuRWx2cnUwenUzd1JHL0xIb3kyVys5NFJ1ZXVFN2Zt?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDC56866773E974D9137022655A4D547@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb29eea-cdb1-4825-0e70-08dc36fc4978
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 18:53:57.2010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oI3dHryQEhrd3o6vjMwUt1CpfrM8Widlr3G6Dkkxf4ZgqLImfwnjP0WKK11Y7wqsORGS854IwMF3wxLAxZ93FLXnE9NrLP2f1R9p7nwlRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2655
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <lin
 ux-snps-arc@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linux Kernel Functional Testing <lkft@linaro.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzAyLzIwMjQgw6AgMTc6MTQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IFRoZSByZWNlbnQgY2hh
bmdlIHRvIHRoZSB2ZHNvX2RhdGFfc3RvcmUgYnJva2UgYnVpbGRpbmcgY29tcGF0IFZEU08NCj4g
b24gYXQgbGVhc3QgYXJtNjQgYmVjYXVzZSBpdCBpbmNsdWRlcyBoZWFkZXJzIG91dHNpZGUgb2Yg
dGhlIGluY2x1ZGUvdmRzby8NCj4gbmFtZXNwYWNlOg0KDQpJIHVuZGVyc3RhbmQgdGhhdCBwb3dl
cnBjNjQgYWxzbyBoYXMgYW4gaXNzdWUsIHNlZSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMzEyMjExMjA0MTAuMjIyNjY3OC0xLW1w
ZUBlbGxlcm1hbi5pZC5hdS8NCg0KPiANCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vbHNlLmg6NSwNCj4gICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL2NtcHhjaGcuaDoxNCwNCj4gICAgICAgICAgICAgICAgICAgZnJvbSBh
cmNoL2FybTY0L2luY2x1ZGUvYXNtL2F0b21pYy5oOjE2LA0KPiAgICAgICAgICAgICAgICAgICBm
cm9tIGluY2x1ZGUvbGludXgvYXRvbWljLmg6NywNCj4gICAgICAgICAgICAgICAgICAgZnJvbSBp
bmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9hdG9taWMuaDo1LA0KPiAgICAgICAgICAgICAgICAg
ICBmcm9tIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vYml0b3BzLmg6MjUsDQo+ICAgICAgICAgICAg
ICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9iaXRvcHMuaDo2OCwNCj4gICAgICAgICAgICAgICAg
ICAgZnJvbSBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL21lbW9yeS5oOjIwOSwNCj4gICAgICAgICAg
ICAgICAgICAgZnJvbSBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BhZ2UuaDo0NiwNCj4gICAgICAg
ICAgICAgICAgICAgZnJvbSBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaDoyMiwNCj4gICAgICAgICAg
ICAgICAgICAgZnJvbSBsaWIvdmRzby9nZXR0aW1lb2ZkYXkuYzo1LA0KPiAgICAgICAgICAgICAg
ICAgICBmcm9tIDxjb21tYW5kLWxpbmU+Og0KPiBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F0b21p
Y19sbF9zYy5oOjI5ODo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxMjgnDQo+ICAgIDI5
OCB8ICAgICAgICAgdTEyOCBmdWxsOw0KPiANCj4gVXNlIGFuIG9wZW4tY29kZWQgcGFnZSBzaXpl
IGNhbGN1bGF0aW9uIGJhc2VkIG9uIHRoZSBuZXcgQ09ORklHX1BBR0VfU0hJRlQNCj4gS2NvbmZp
ZyBzeW1ib2wgaW5zdGVhZC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rp
b25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+DQo+IEZpeGVzOiBhMGQyZmNkNjJhYzIgKCJ2
ZHNvL0FSTTogTWFrZSB1bmlvbiB2ZHNvX2RhdGFfc3RvcmUgYXZhaWxhYmxlIGZvciBhbGwgYXJj
aGl0ZWN0dXJlcyIpDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0ErRzlm
WXRyWFhtX0tPOWZOUHozWGFSeEhWN1VEX3lRcC1URXVQUXJOUkhVK18wV19RQG1haWwuZ21haWwu
Y29tLw0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiAt
LS0NCj4gICBpbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCB8IDQgKy0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3Zkc28vZGF0YXBhZ2UuaCBiL2luY2x1ZGUvdmRzby9kYXRhcGFnZS5oDQo+IGluZGV4
IDdiYTQ0Mzc5YTA5NS4uMmMzOWE2N2Q3ZTIzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Zkc28v
ZGF0YXBhZ2UuaA0KPiArKysgYi9pbmNsdWRlL3Zkc28vZGF0YXBhZ2UuaA0KPiBAQCAtMTksOCAr
MTksNiBAQA0KPiAgICNpbmNsdWRlIDx2ZHNvL3RpbWUzMi5oPg0KPiAgICNpbmNsdWRlIDx2ZHNv
L3RpbWU2NC5oPg0KPiAgIA0KPiAtI2luY2x1ZGUgPGFzbS9wYWdlLmg+DQo+IC0NCj4gICAjaWZk
ZWYgQ09ORklHX0FSQ0hfSEFTX1ZEU09fREFUQQ0KPiAgICNpbmNsdWRlIDxhc20vdmRzby9kYXRh
Lmg+DQo+ICAgI2Vsc2UNCj4gQEAgLTEyOCw3ICsxMjYsNyBAQCBleHRlcm4gc3RydWN0IHZkc29f
ZGF0YSBfdGltZW5zX2RhdGFbQ1NfQkFTRVNdIF9fYXR0cmlidXRlX18oKHZpc2liaWxpdHkoImhp
ZGRlbg0KPiAgICAqLw0KPiAgIHVuaW9uIHZkc29fZGF0YV9zdG9yZSB7DQo+ICAgCXN0cnVjdCB2
ZHNvX2RhdGEJZGF0YVtDU19CQVNFU107DQo+IC0JdTgJCQlwYWdlW1BBR0VfU0laRV07DQo+ICsJ
dTgJCQlwYWdlWzF1bCA8PCBDT05GSUdfUEFHRV9TSElGVF07DQoNClVzdWFsbHkgMVVMIGlzIHVz
ZWQgKGNhcGl0YWwgbGV0dGVyKQ0KDQpNYXliZSBiZXR0ZXIgdG8gKHJlKWRlZmluZSBQQUdFX1NJ
WkUgaW5zdGVhZCwgc29tZXRoaW5nIGxpa2U6DQoNCiNkZWZpbmUgUEFHRV9TSVpFICgxVUwgPDwg
Q09ORklHX1BBR0VfU0hJRlQpDQoNCg0KPiAgIH07DQo+ICAgDQo+ICAgLyoNCg==
