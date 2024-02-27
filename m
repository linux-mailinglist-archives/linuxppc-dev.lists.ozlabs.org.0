Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BA869AE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:45:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aA4r1noe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkhds03Psz3vcG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:45:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=aA4r1noe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkhd639DBz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:44:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbYP2bST7y9YjDY6I8zE6jFdqVHfAeMIbCLqzOgSowHjH3c2rNKANyCtPug7Z1jKyWwG+PGdIzXZltmzMV8xES80ljOLBqe/ks00IZpVFcw9n8Xevg7PQeLOL0l4nkD4zx1MsItresvibTH56rF7TPLJptn5GSd1rTMU/V8DZ2+ikvbTLjImDahPWY2D/I0g5Vdep1YS8hsYY6yMldfnLqSjqPHEr/LICXMURDhlmmEskCRLPpj1h47AYXJ9vudo/DlXeNluV4uq4kn7+q5pFMUX9IDwJKzoMmYXnvBBTnFNQp1r38Xj4YSHw6UbgBTk0BTkC5glRHZLX+RGXks13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMpunAhd8AIvtpUC7lfRvR+Hbu+QP8OkSpSKGcngzyo=;
 b=FlO6n7wlZO88DHofp5OG2qyW6BfWVWdh1bI5Mnsep+W2aNOOT5hd8kk1dnq/Dq1EurzwgoYddlDr4UJH2933oNsMcB1f3rwjJjPS0zbpqGMyLTgHsNUuyTOp+fE7qNA6tzs0j/ippsaSFGjZXGxM6XHezwrlThcxtAv5bs8RTwoK5izfRMbqkTCVHKWLEyv/MhkhVXRIJ4gUUDzr8MbkSRqFqIg3/JC0eXi06kJ2evUt+ldFe9shtCbztzivIvnbj4lcuauJgCFI4DKFZIBPCBFcR6Dwns/EnX3AtGgOjKhGOt1njKB8cUUr1/oI87iuN0nCdPV++4DAnAsuCnz3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMpunAhd8AIvtpUC7lfRvR+Hbu+QP8OkSpSKGcngzyo=;
 b=aA4r1noecfgyZ5GAy3inJeu8lIpb3DgFgPyty5qRENvaOVzHnMIv4sfrk1sLlq7uOi4k+pNAN1gLUmj84rBYcSFyxXp6zhuMPHy7Br46M6nSUSGjGqvMHEVoQxobw6fWlG1bhG5A098Is/sg+K9Hqzns9TCWLR9axJ4YN6NdRKfkQXMi9jTNhD9/I3uKZyTPBQS95I6Bw1d3yKIyedINbEjHXHPiLl6rw5djtwBU6dlcAusIceZtWG2vxsXK3fER4t7eGh+sZHWgHaULbXX9tp6aFkUAIrtnmuGzoQqEDHQL32BL0hY2A3xOGvCcefN1PXbEGy+OsQK8gNHemBC3QQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1428.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 15:44:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 15:44:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Samuel Holland <samuel.holland@sifive.com>,
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook
	<keescook@chromium.org>, Anna-Maria Gleixner <anna-maria@linutronix.de>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Thread-Topic: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
Thread-Index: AQHaaM7rN2hV21jYgUGwUZqovHeHwbEc14GAgAF9ewCAAAEbgA==
Date: Tue, 27 Feb 2024 15:44:31 +0000
Message-ID: <b737a088-c811-45eb-b143-d24e6cdf7eea@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
 <83450530-c908-4abc-bab7-88c50a3143ff@app.fastmail.com>
In-Reply-To: <83450530-c908-4abc-bab7-88c50a3143ff@app.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1428:EE_
x-ms-office365-filtering-correlation-id: e9bee02e-68e5-48ab-2a1b-08dc37aafd9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VnFkx95QyKHo2x8CQMik63F1eZPBJzQDStJl+kfUYWklz9qmrmNDp0QAPfJFgcEg1jelC6l67QvgFzZVeDOYrPUFW+UN0o2P1JqBWFDhwFLbK2DDvRxZNc/2LFXbOPyjJUm01np8JwL53yyXWIPxiXeFNm83C1gsJms+Anpjzzyf6DFIqnJHoJ4d/cH+nVXIR4PBqNG9fenHAbc2oUSxNl7ZC2NQvAVN9Ix1t5kTj3YOHzyXIh6EoIqwHIULATd9fPmwJCispi5RHlp1HRZghdBgyyIl0jJJLRV1x53FDII2kA47lpJA2PWi8tdmPSq8I4e4usdr181guxuKV0dgD6BVdJ90A3kKOZ7g6uamLW3noupbjsBsv4nUocB3PEuPS2y19upI1mM/7TyBzAHKZAVf2SLOwqXFlZn36N8pO+p5f2dYJN9Nz88ACzjYp3zA4Ud8xmXFWqxP6nHksAoRe95TsKQT90H/Xlzb9OB9ygswPm7Lq3I5v8l9n/39QkjLzsuIt6XmGgQAeSMY4EtQL2dqaRGaJOhQvRbQfrfQSZI/CYzjSGjld7H+RQFofjbVJPMB1CZbijve36j5YCGBl0VMM7jBuvRR8PYOxEzCb/VTw+8BFeoDQQRoNgouiApd76O+/l4kray8SiYWX/ssMO+ROc2HZ6MM+27OnaIMBvIijRioMx7OdnuMfQlMNuyFh7dCmwtDoB03NTkLQpbFhCAX7Ru8Y5CRIIkIl1NL2PA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SUp0d01VUjYwTmNxdXhHT00xWG9OcE4xR2ppdlhYdW1CcHhRQWZ2eUpVenZk?=
 =?utf-8?B?cUtnRXpTSkxxdkgvTGNpc0N1UWRVV2xxeGNpNnZmZUgzd1RKNnNrZHg2R21t?=
 =?utf-8?B?YlJrV3hOZStZanFKOXZjQnVteHU3UDduclpDb1ZoOHRvWDhhcm15bWhzaC9o?=
 =?utf-8?B?b3BWMk5yaFdkK28vRFBxRUxXakJjd3pDVnViY3djdENBb2xzZzd2S2xvMGdT?=
 =?utf-8?B?V0k2d1dGSVhoZ1I2K21rTzcvU05yV1p2U3Jaa0RPVEdqQ1A3OGxneFlvcmQ1?=
 =?utf-8?B?MTdJa0IwTm5sQWVTbmRORlhha0RjV056QjNSK25CWWJmcXM4QnByOWo5VVRF?=
 =?utf-8?B?cUtlQW83SVJnNGJoMjlQbXFxWmtIQlF2eUhjcUEwa0Nkc2lteVlKNlh3ZlBV?=
 =?utf-8?B?NWh0Z25wUUl0Zm9BOGVQeE9HUm5FMXJEb1FocTB0RmhuZDF2cUNxT0FXZzdK?=
 =?utf-8?B?SU4rRmhja3FCSlZ1TlJ3bWUrNWRKZWViNTJtbU1XOXJsQmtqUUI3NnJjaDE3?=
 =?utf-8?B?NEJDMXZvSTBJZjY5RnY2OWVVWTFlSHRIQXBSVm4ySzB4QnQrRGNWWTZlaUhK?=
 =?utf-8?B?dTg5UEpaZ1JFV0VVUWE0a20rU01SaEp1blh1NDRhQThhUVlod0FBREZ2eHBq?=
 =?utf-8?B?dzNaaDJ3bW9FSHRQRUhlVXJzazJPQVFBQ0xOdnlLV3YvcFZVUmlPbk42dWJy?=
 =?utf-8?B?cFFFY0lrYTNaeUoxNjhKdGZmUjZnZU1vUHhLbGE0clFNbWw1MHRLRXJ3d0pL?=
 =?utf-8?B?WTNueVdUdlBkU0U4K2M4Yy9SUkR6eTNJcGY3VVJ1R3B3ZVpPR2RML1ZlZWda?=
 =?utf-8?B?eXJxWURQMm5MK3NVVzcrUFdTWjArWlN2eFdiRDZwV2lmTGM3cTRpK05aeDRv?=
 =?utf-8?B?U25TNWRqRUp3RlAvU21WVnlCMzczS1JXblZOaFpKbHJsT2UvUlBwcmFtaFNp?=
 =?utf-8?B?d1o3d05nSnBpNVpEYjFXSHZxeHJHeE5ORzU0VlptdjkvbGhWY3JodXFwS2FF?=
 =?utf-8?B?VllXWUh0dkhKTE9RVkNjb21vcTRpZmtKUTdZYS9kM3FUSXRZMDZ1dDRMeGtM?=
 =?utf-8?B?eDNQd0EycXFwVkh5WjFsaXFsYkZxODEwRHYvQjhTQThRSWg5UFI2S0hlNHlt?=
 =?utf-8?B?QkdBRWw0OHJUSFRrSG5KL0JQb2lCY1BMV1oxd0hlUm1EY2orSGFSSEJJclor?=
 =?utf-8?B?dmhQak8vQ1NsRS9kenFnUjBxRy9vRTdMVWJLRlMxNUlYVG5RdkNJeVRFZDgz?=
 =?utf-8?B?YUZKZTV6MWwyVW9WZEF6QXJBQ2FaNlMrV0toemVEcnhYaFpLWnZNNS9PNlpU?=
 =?utf-8?B?aFBlM2s0SS9oVTJLUzRRbWNhdmtWTEVHcDYzQ1ZWSFRVUTh1Yk85L0pkRFFV?=
 =?utf-8?B?YUpEYzJBNTF3SDNoUk91c0wxMUpaK3ozWXN4dlVMclRQUW84Z0xBZTh0a2Zh?=
 =?utf-8?B?ZC9TVGdjRFJBTDFmNDVxK2FhK2hKL09HNU0rRkpSQlltNzFodGpFY3B2VzJr?=
 =?utf-8?B?aWlLU2VHVkFEbHhNZjB0dXRCK3A1d1VuRG5XU1BVd3JCbytEMVpKN0swOWQv?=
 =?utf-8?B?RVpWMHNnTm4zaHJheGNkbG5raDFaZ1dldkFFOXl4RDJYNmxSK2dwZFBaUWJO?=
 =?utf-8?B?U05KL1FzVzkzSjFBak10dDJJQW5MVmVJWnFSNGx6TFljeUtSdi9rWGpiQVVB?=
 =?utf-8?B?Sy9JRk9tMmNaT014QSt3SjJPLzdCbnI0SGdQdWZxYUhkTlNlaFZHTUhlYmhY?=
 =?utf-8?B?R3VQeWhZTjJiUXNLa1IyTC9zRjE0TjRBYlh4cnExeW53OGFGanBvU1YwbXVC?=
 =?utf-8?B?V2ovbG1yb2xJclBCNXYrem40SmRBd1cxY0xxQWI1MHl6TGNtU3RpUTBUMXFD?=
 =?utf-8?B?TUVHR2k4QytkcThIQ3liekhRdlVGVm03VG9ZaXNGTndVT0VkS0cxY2hYRVB5?=
 =?utf-8?B?S2xpTVBLOWJQeWJsalVxakdxZkE5c2xiVEUyN2JRNnQwUWlHSmxaU3Jzd3BC?=
 =?utf-8?B?dnJraVl6dkR3L3RpZnRTM0ZSZXlKUk0vSFZvQ3FsdlAvb1pwUXRVYS96NE8v?=
 =?utf-8?B?VGx4UEl0OG5GSGNGYVJLYklaRlBDN2hjOG1oeTJ5ZEF0a0l6WTllOTl6czNr?=
 =?utf-8?B?OHVGZmhub2FYK1FkQ0MzdkdsMWlkYTYwVE9kVlcvSHNlT1QzOEtENWlyOU84?=
 =?utf-8?B?UnhiWUdaWjArVWNaKzRhV05UR1NYaExMUzEwTFhUREJOWjBZeHhyVjMwb0NF?=
 =?utf-8?B?RWxsRU5Wc3JXWkxPWUZjY2o5VEFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79A15AC21162AE4DB198068AD9118BCB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bee02e-68e5-48ab-2a1b-08dc37aafd9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 15:44:31.8296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcbTPAdRNA1ddT9SkCgvJ+3plQwO9/4V3XcH6QcJeYLgSmslE7wHghnFWOZvANW4yhkfbEhT2+Pk91LMP2oBEYFJHUyy3YSP0fCd9BY78B4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1428
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linu
 x-snps-arc@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Kieran Bingham <kbingham@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMTY6NDAsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCBGZWIgMjYsIDIwMjQsIGF0IDE3OjU1LCBTYW11ZWwgSG9sbGFuZCB3cm90ZToNCj4+
IE9uIDIwMjQtMDItMjYgMTA6MTQgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4gICANCj4+
PiArY29uZmlnIEhBVkVfUEFHRV9TSVpFXzRLQg0KPj4+ICsJYm9vbA0KPj4+ICsNCj4+PiArY29u
ZmlnIEhBVkVfUEFHRV9TSVpFXzhLQg0KPj4+ICsJYm9vbA0KPj4+ICsNCj4+PiArY29uZmlnIEhB
VkVfUEFHRV9TSVpFXzE2S0INCj4+PiArCWJvb2wNCj4+PiArDQo+Pj4gK2NvbmZpZyBIQVZFX1BB
R0VfU0laRV8zMktCDQo+Pj4gKwlib29sDQo+Pj4gKw0KPj4+ICtjb25maWcgSEFWRV9QQUdFX1NJ
WkVfNjRLQg0KPj4+ICsJYm9vbA0KPj4+ICsNCj4+PiArY29uZmlnIEhBVkVfUEFHRV9TSVpFXzI1
NktCDQo+Pj4gKwlib29sDQo+Pj4gKw0KPj4+ICtjaG9pY2UNCj4+PiArCXByb21wdCAiTU1VIHBh
Z2Ugc2l6ZSINCj4+DQo+PiBTaG91bGQgdGhpcyBoYXZlIHNvbWUgZ2VuZXJpYyBoZWxwIHRleHQg
KGF0IGxlYXN0IGEgd2FybmluZyBhYm91dA0KPj4gY29tcGF0aWJpbGl0eSk/DQo+IA0KPiBHb29k
IHBvaW50LiBJJ3ZlIGFkZGVkIHNvbWUgb2YgdGhpcyBub3csIGJhc2VkIG9uIHRoZSBtaXBzDQo+
IHRleHQgd2l0aCBzb21lIGdlbmVyYWxpemF0aW9ucyBmb3Igb3RoZXIgYXJjaGl0ZWN0dXJlczoN
Cj4gDQo+IGNvbmZpZyBQQUdFX1NJWkVfNEtCDQo+ICAgICAgICAgIGJvb2wgIjRLaUIgcGFnZXMi
DQo+ICAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9QQUdFX1NJWkVfNEtCDQo+ICAgICAgICAgIGhl
bHANCj4gICAgICAgICAgICBUaGlzIG9wdGlvbiBzZWxlY3QgdGhlIHN0YW5kYXJkIDRLaUIgTGlu
dXggcGFnZSBzaXplIGFuZCB0aGUgb25seQ0KPiAgICAgICAgICAgIGF2YWlsYWJsZSBvcHRpb24g
b24gbWFueSBhcmNoaXRlY3R1cmVzLiBVc2luZyA0S2lCIHBhZ2Ugc2l6ZSB3aWxsDQo+ICAgICAg
ICAgICAgbWluaW1pemUgbWVtb3J5IGNvbnN1bXB0aW9uIGFuZCBpcyB0aGVyZWZvcmUgcmVjb21t
ZW5kZWQgZm9yIGxvdw0KPiAgICAgICAgICAgIG1lbW9yeSBzeXN0ZW1zLg0KPiAgICAgICAgICAg
IFNvbWUgc29mdHdhcmUgdGhhdCBpcyB3cml0dGVuIGZvciB4ODYgc3lzdGVtcyBtYWtlcyBpbmNv
cnJlY3QNCj4gICAgICAgICAgICBhc3N1bXB0aW9ucyBhYm91dCB0aGUgcGFnZSBzaXplIGFuZCBv
bmx5IHJ1bnMgb24gNEtpQiBwYWdlcy4NCj4gDQo+IGNvbmZpZyBQQUdFX1NJWkVfOEtCDQo+ICAg
ICAgICAgIGJvb2wgIjhLaUIgcGFnZXMiDQo+ICAgICAgICAgIGRlcGVuZHMgb24gSEFWRV9QQUdF
X1NJWkVfOEtCDQo+ICAgICAgICAgIGhlbHANCj4gICAgICAgICAgICBUaGlzIG9wdGlvbiBpcyB0
aGUgb25seSBzdXBwb3J0ZWQgcGFnZSBzaXplIG9uIGEgZmV3IG9sZGVyDQo+ICAgICAgICAgICAg
cHJvY2Vzc29ycywgYW5kIGNhbiBiZSBzbGlnaHRseSBmYXN0ZXIgdGhhbiA0S2lCIHBhZ2VzLg0K
PiANCj4gY29uZmlnIFBBR0VfU0laRV8xNktCDQo+ICAgICAgICAgIGJvb2wgIjE2S2lCIHBhZ2Vz
Ig0KPiAgICAgICAgICBkZXBlbmRzIG9uIEhBVkVfUEFHRV9TSVpFXzE2S0INCj4gICAgICAgICAg
aGVscA0KPiAgICAgICAgICAgIFRoaXMgb3B0aW9uIGlzIHVzdWFsbHkgYSBnb29kIGNvbXByb21p
c2UgYmV0d2VlbiBtZW1vcnkNCj4gICAgICAgICAgICBjb25zdW1wdGlvbiBhbmQgcGVyZm9ybWFu
Y2UgZm9yIHR5cGljYWwgZGVza3RvcCBhbmQgc2VydmVyDQo+ICAgICAgICAgICAgd29ya2xvYWRz
LCBvZnRlbiBzYXZpbmcgYSBsZXZlbCBvZiBwYWdlIHRhYmxlIGxvb2t1cHMgY29tcGFyZWQNCj4g
ICAgICAgICAgICB0byA0S0IgcGFnZXMgYXMgd2VsbCBhcyByZWR1Y2luZyBUTEIgcHJlc3N1cmUg
YW5kIG92ZXJoZWFkIG9mDQo+ICAgICAgICAgICAgcGVyLXBhZ2Ugb3BlcmF0aW9ucyBpbiB0aGUg
a2VybmVsIGF0IHRoZSBleHBlbnNlIG9mIGEgbGFyZ2VyDQo+ICAgICAgICAgICAgcGFnZSBjYWNo
ZS4NCj4gDQo+IGNvbmZpZyBQQUdFX1NJWkVfMzJLQg0KPiAgICAgICAgICBib29sICIzMktpQiBw
YWdlcyINCj4gICAgICAgICAgZGVwZW5kcyBvbiBIQVZFX1BBR0VfU0laRV8zMktCDQo+ICAgICAg
ICAgICAgVXNpbmcgMzJLaUIgcGFnZSBzaXplIHdpbGwgcmVzdWx0IGluIHNsaWdodGx5IGhpZ2hl
ciBwZXJmb3JtYW5jZQ0KPiAgICAgICAgICAgIGtlcm5lbCBhdCB0aGUgcHJpY2Ugb2YgaGlnaGVy
IG1lbW9yeSBjb25zdW1wdGlvbiBjb21wYXJlZCB0bw0KPiAgICAgICAgICAgIDE2S2lCIHBhZ2Vz
LiAgVGhpcyBvcHRpb24gaXMgYXZhaWxhYmxlIG9ubHkgb24gY25NSVBTIGNvcmVzLg0KPiAgICAg
ICAgICAgIE5vdGUgdGhhdCB5b3Ugd2lsbCBuZWVkIGEgc3VpdGFibGUgTGludXggZGlzdHJpYnV0
aW9uIHRvDQo+ICAgICAgICAgICAgc3VwcG9ydCB0aGlzLg0KPiANCj4gY29uZmlnIFBBR0VfU0la
RV82NEtCDQo+ICAgICAgICAgIGJvb2wgIjY0S2lCIHBhZ2VzIg0KPiAgICAgICAgICBkZXBlbmRz
IG9uIEhBVkVfUEFHRV9TSVpFXzY0S0INCj4gICAgICAgICAgICBVc2luZyA2NEtpQiBwYWdlIHNp
emUgd2lsbCByZXN1bHQgaW4gc2xpZ2h0bHkgaGlnaGVyIHBlcmZvcm1hbmNlDQo+ICAgICAgICAg
ICAga2VybmVsIGF0IHRoZSBwcmljZSBvZiBtdWNoIGhpZ2hlciBtZW1vcnkgY29uc3VtcHRpb24g
Y29tcGFyZWQgdG8NCj4gICAgICAgICAgICA0S2lCIG9yIDE2S2lCIHBhZ2VzLg0KPiAgICAgICAg
ICAgIFRoaXMgaXMgbm90IHN1aXRhYmxlIGZvciBnZW5lcmFsLXB1cnBvc2Ugd29ya2xvYWRzIGJ1
dCB0aGUNCj4gICAgICAgICAgICBiZXR0ZXIgcGVyZm9ybWFuY2UgbWF5IGJlIHdvcnRoIHRoZSBj
b3N0IGZvciBjZXJ0YWluIHR5cGVzIG9mDQo+ICAgICAgICAgICAgc3VwZXJjb21wdXRpbmcgb3Ig
ZGF0YWJhc2UgYXBwbGljYXRpb25zIHRoYXQgd29yayBtb3N0bHkgd2l0aA0KPiAgICAgICAgICAg
IGxhcmdlIGluLW1lbW9yeSBkYXRhIHJhdGhlciB0aGFuIHNtYWxsIGZpbGVzLg0KPiANCj4gY29u
ZmlnIFBBR0VfU0laRV8yNTZLQg0KPiAgICAgICAgICBib29sICIyNTZLaUIgcGFnZXMiDQo+ICAg
ICAgICAgIGRlcGVuZHMgb24gSEFWRV9QQUdFX1NJWkVfMjU2S0INCj4gICAgICAgICAgaGVscA0K
PiAgICAgICAgICAgIDI1NktCIHBhZ2VzIGhhdmUgbGl0dGxlIHByYWN0aWNhbCB2YWx1ZSBkdWUg
dG8gdGhlaXIgZXh0cmVtZQ0KPiAgICAgICAgICAgIG1lbW9yeSB1c2FnZS4NCg0KDQpGb3IgMjU2
SyBwYWdlcywgcG93ZXJwYyBoYXMgdGhlIGZvbGxvd2luZyBoZWxwLiBJIHRoaW5rIHlvdSBzaG91
bGQgaGF2ZSANCml0IHRvbzoNCg0KCSAgVGhlIGtlcm5lbCB3aWxsIG9ubHkgYmUgYWJsZSB0byBy
dW4gYXBwbGljYXRpb25zIHRoYXQgaGF2ZSBiZWVuDQoJICBjb21waWxlZCB3aXRoICctem1heC1w
YWdlLXNpemUnIHNldCB0byAyNTZLICh0aGUgZGVmYXVsdCBpcyA2NEspIHVzaW5nDQoJICBiaW51
dGlscyBsYXRlciB0aGFuIDIuMTcuNTAuMC4zLCBvciBieSBwYXRjaGluZyB0aGUgRUxGX01BWFBB
R0VTSVpFDQoJICBkZWZpbml0aW9uIGZyb20gMHgxMDAwMCB0byAweDQwMDAwIGluIG9sZGVyIHZl
cnNpb25zLg0K
