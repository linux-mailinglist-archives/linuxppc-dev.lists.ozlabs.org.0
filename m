Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C437E604B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 23:02:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OoTaKz6S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQfGN61jKz3vmj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 09:02:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OoTaKz6S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQYZk6ZB4z3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 05:31:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcHyTGDMo0wE8d44Clkr14OjZQMTHG1A9+8WqarCR6kXtJ8CnVgnRg4m2Kd1X2IFR8DsXHXPGtaEulu44hqkHkbmYYmBSXw5bzHg/7DA3Jgc3e9CodFo/idh6ws3Eym+AGb0osj408S6gRrrqUeHHML1TNvInXCX+MOd0b7YohmZN4Zl3xxpL2RpJWOdwXfE9lCaFOyFVmnpara1JFzyiNuZ0OGSOb17sxcenEIHYvWX9g9N/7084iSmXNWEUBBKwOiM/Hk+31xEUGBBuMjCmoJxhfVfs95q/E9F8UK0NuvjauzAu23t22FPnDivKOlplUlJ9koB3d+E5raJyLtyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEFd6rZP1yOqyMBQ2nhaCEUwOF4TlNx+anXdfKUppz0=;
 b=oJapebSQk52eyFXh0NuvvE5H+cMkXRRUdF96XqygtiD0P3z4viQWzBiTkmCv7bbKM1ZGJvdANV5Q7d1CULuipmrQ/pRlshWBKLkRr+kOXtiZ0DkSlGQfRqsXQtDfAsq5bvBAygHXQYVCtC4h3tIXPyx55P+9unwavUiGE6Hxc2onCdb8Y4OTVrD72S/aIx+IsVJ1REifA4CFQCR0ljlWwvhgKk2cPy/h4AjaIyjZ2F3Ry2u4ntkCUjPFdeHc85tN/ATG+NiNFSPtS6/f0ahBJKScrpsEeOE6yScSfniiVrW7XdVoLrUW4FgVs6S3r/hXYdO3tawo1SQgTO3ASFRtFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEFd6rZP1yOqyMBQ2nhaCEUwOF4TlNx+anXdfKUppz0=;
 b=OoTaKz6SPvutw7/Wd1pDpyyunpFZAAwBZ+76Q9dEJE/V4yfXdd2YqneHgOHwPhNnTeXQX7+oLHc6ZFf+pZUt3wceTlQ1r2ir6S6zV9CqWgWTlhLPhJQqJfl/Mars4RaSoVU7+e2p2+69vOmwS0Zn5pAFbQGrDyBrgyPzTiMV6kMf7ANPGfrrV9blUu+I9X2JjtL4ugDmF/AoK7X3hnZ7fVzMXz7xax1ZkV17OOQxzQrj/xTNgTBrvFKpAJ97uNZIImVMu4td+3O6SnoJHHxJZhAV/cSnxWjvFVG8912jCfag37lCoV45h9WDt70d2qQ4jwQSVkSebuWoMtS1LA/Wmw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2388.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.6; Wed, 8 Nov
 2023 18:31:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 18:31:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Topic: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Index: AQHaEkPkiwEWo83izEmVhjzNZW4UOLBwvvwA
Date: Wed, 8 Nov 2023 18:31:17 +0000
Message-ID: <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-16-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2388:EE_
x-ms-office365-filtering-correlation-id: 5d1f5e49-f364-404e-467e-08dbe088e583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Fp1JRTmkWLncYFH910KAH3NWhUE3YgpRFeNA1BtkV6xRFNfgS3yir0I80UfoE+W7H2/wmeTqYR/zwgIh2VFOzp8cArrDMHEA129Ni8cLIbK0aHMD3hi0x3ieW1aTDzzS14/jPaobhRGgeMRAu/bD0M96+5i1GOBJL5Zvf1cRMfmAuZ2H/kOq8JMqHXR4LmZFELc7gjRL8u0jKNZxlHhVUpesX5UYL0LHVxTDonQJhAImDPFR/2qMQ4iEQbNsYSkC3BmQIkGw2c38g4VJk+00FLI9jtUZbVsAkhqEPU7VwelGibW6+LxZSH4pmOs6LTI7ASFh7dakyCSJBbDTxwvuW+jRXTFuVypxeeuYHkzT9qo4qI+RqIfHXWlYldPsU2uX8d4GltxLhYZdBSlOpO5/9Grm2A/k289CyFOk+4+C5mC8zpcOBTrCTw0a0GixSZX3BtbhQQD788u7pvj+1YxQul5EGuSa4T/Tdf2HbFJhSMJ8li8fP/GFIesVfIiqxEYOdUupSQdarucpnKcFU4TqcxkgqiTgNdOwumS8AYlDwlNcdD3rElUYgEpPwpnNBK1qi+0WUMsNElZucOJ8c7rbeG8nXQ2FV1/4pihNwcYu4jq5Ku29vfH5tiCeTRU2wWnKDBamSbNQ2NFy3Azj11UoWvO0GPR/sCcxwcS9XxFnkl21NSvcAT/ipXlUg6pjUP+JcO+2BAT39CGE9bZSBD0T/KyGkS7QBwENFC+sapP2Ljo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799009)(64100799003)(186009)(36756003)(38070700009)(4326008)(478600001)(44832011)(5660300002)(8936002)(8676002)(83380400001)(7366002)(6506007)(7406005)(7416002)(6512007)(2906002)(31686004)(2616005)(6486002)(66476007)(66556008)(66946007)(76116006)(54906003)(64756008)(26005)(91956017)(110136005)(316002)(66446008)(71200400001)(86362001)(31696002)(122000001)(41300700001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bDAzNlo0eFdWdW1wbVIwYnh4a2ZzMWhQTlRKRE8zQzZ4cHo2a2xiVlVCblZl?=
 =?utf-8?B?d3VoVFpaN2hoNWJVT1luVlNjcGwyWjE5L3krRE02bENHdk9wVENLNW9nSzhq?=
 =?utf-8?B?SHlaZGNscXVuL1o2UzlYV3hRKy9LT0h6WDgxTVBIbmluS0w5Q3pNRXNUalM5?=
 =?utf-8?B?bk02SER6enE2eWZ1c3Jtaks2cjd3Qm1lbnhQVHg2TmlYUWZhN3YrVU9BM0lw?=
 =?utf-8?B?TWc3bkVoR0hRek90T0pjdDkvVzdUN1NhelRSbXVnVldSOFptZENhMTNDMGdE?=
 =?utf-8?B?Vk1VcVFjellQTm1RaTltNFN5dCtyU2gwaWFaOXhtaEFEYWZ5MHdMWERvNXph?=
 =?utf-8?B?dXgrM3lZZWw1bjFJeWdBSmcvS255NWVLSGtKa2N3Z3I3Y3hBZjM3UHV3TGp6?=
 =?utf-8?B?cnhhM0JkK3hOUGxBbExzY2VkQzM1Y2wyaktaZWxBc0ZiK2xHUEU0UnowckRh?=
 =?utf-8?B?WkppdFlIQ2NlVU51TUNucklyc0NySVVHcUhHRHJKRmU3WU5pNU54dmF4UU8x?=
 =?utf-8?B?czd4UVdQMWdoR1NBSnNTUVMyNXViTnZtdmcycnZxN0RKLzN3bm9POHJ1ZGY5?=
 =?utf-8?B?L1M5RGN0QUR6S2ZVdXFDejBRZDZ6NUdIYVN4Qk1lakwxRnpOcVNTY0RGY0E1?=
 =?utf-8?B?aFlMS1ZVSTdnT1E4UnlKMzRETlMxeDVFUThaamlDY3JuNUwxbWs0MU9DWHBo?=
 =?utf-8?B?d1hVN2tyYzBUaGg3ZjlyWDU5anY0UUkzZ2d3SmVOVXhzQ0ZIVzB6L3RGQU5L?=
 =?utf-8?B?TStuc0Z3TUdDdTNqN2JySlFPQ1ZqR2xYQlJYcmtNSndHNmYyek9yUzFyUmp4?=
 =?utf-8?B?MW1sc1hscTg4enNDamZ6Umc3ZFE5NGk2SHdSVXZWYkxWM3JDUnhtQWZzUEJu?=
 =?utf-8?B?RW1UVktCU2NZeVdYZlJUaVlvWHFSSTBZWFp4U212YWtXU1dXSmJ4cVVkZi9r?=
 =?utf-8?B?aFZCM1R1Tyt5V0ZQQU84VU5Kc3plTDZEcHZhYnR2T2RvTlVITElDVTJvQmhj?=
 =?utf-8?B?S0VSdkFLc2lzRjBaYzlmcmtSNXlXNVNBOVNBQnZvTm4yYjF3OERoaFRlNURM?=
 =?utf-8?B?K2lXaGliVGdTUmdtT1dSTHhDMXVrWFZ4SmxwSURRSnR2c3l6S052TjVYMmln?=
 =?utf-8?B?UDJXWEtCZTlPb3JvdEN2aTZMeHFpa2hTSHFUU01SdE9TckZCUG9WNWRTUlda?=
 =?utf-8?B?TXlkdGtFdHQ3SGd3NHdjMlkzTGtCQzRjSjc4UEJYdWgvR0tpNjNiZm1FQURX?=
 =?utf-8?B?VVRjUUxPSVZsdkIxa3l5bUsvSGs0cnc0V0QvOFNhaGlNekRzYkVDNnJOempk?=
 =?utf-8?B?TTQ5blpQaUlaaXMzbU5ERlZaMzJQMVdmbnhqQ2Z1b2VwTlJMZ3V5WGM3b3Bk?=
 =?utf-8?B?UEtkendFeVNTa1NOaE9CWEx1Q1g3YUdZQ1R0cGhKZHFIRWh3QW1HZzNFWnNZ?=
 =?utf-8?B?eWE5QTBscjUvK2NxOVU3QURlTVBjWks1RElCNUgzVENuZnJKY2hBUU44czds?=
 =?utf-8?B?QjMyNy82RlVxWWZVclRRNnRNckFQb0hKSHJXKzFuRndIbFJBRmt4Ym82czc0?=
 =?utf-8?B?Uy9Kc0ZzUUtTbSt2UnZ0dTh5akMwUlBYdjZHUHFkVXJTSmNBa2FmYS90elJG?=
 =?utf-8?B?Si9vTGswSnR6MXpkbWlZZDg2WlEvSUtwUEtnTXpZbkI0VCtmclRiWWs2ZDFy?=
 =?utf-8?B?cXE1dEtCZDNyWXR1WFFyeFEwYzRoOWFxVWExbUpWdDd5ZXg4NUJONFY5cEtS?=
 =?utf-8?B?UUJyVlh6NEpZK0wwVVRjT0JoYlBUK2FlaW1TN25obHp6VnhpRzZBV1gyUzhQ?=
 =?utf-8?B?V2FrSDliSkEwWXZzOHBQRWNQeUtQZG94OTVMejRVQW1uaTUvMG5XOWtYZWwv?=
 =?utf-8?B?bk9peFpqanhqNWExWUMybjRpZllWY2p4T1RITnZMSEE5eXpqMFBzNVNCSzFF?=
 =?utf-8?B?aXNyUXZvMlFuYVFGV3dLUkordXYyWWNlME56SjZIVktLQkE1WkFMTHFVZExr?=
 =?utf-8?B?YzM1MGwwajZTTjBiWm9qbnVYZnVnU3lJMS9oTCtRdFFMM0VITENDVmZOTW5T?=
 =?utf-8?B?ZVNNRWRpQzZiSHU3QXBYOWV5KzdDRlQ3RWJNd3paUEhzMUtmbTVoZHZickJn?=
 =?utf-8?B?RGZjRzhVbmpGVllSTE1FaU9xaDJhSFlmWnBDTWVOTzE3emZ0V2FqWVRGbEFn?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C233738C4F54F846AA4C39154FBFB7E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1f5e49-f364-404e-467e-08dbe088e583
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 18:31:17.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgRxhNLlCVkPc0LSEKxDmYk13Epm1drAQ51K7ghR1BlnMAtU6BHXhvJz0vDxNQ55QC8jwmFb9Gk8lEsCeGEDiat92/7DJzDVfHtwYXaeMXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2388
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Guo Ren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Che
 n <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Ard Biesheuvel <ardb@kernel.org>, "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
  Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXJuZCwNCg0KTGUgMDgvMTEvMjAyMyDDoCAxMzo1OCwgQXJuZCBCZXJnbWFubiBhIMOpY3Jp
dMKgOg0KPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gVGhlIFZE
U08gZnVuY3Rpb25zIGFyZSBkZWZpbmVkIGFzIGdsb2JhbHMgaW4gdGhlIGtlcm5lbCBzb3VyY2Vz
IGJ1dCBpbnRlbmRlZA0KPiB0byBiZSBjYWxsZWQgZnJvbSB1c2Vyc3BhY2UsIHNvIHRoZXJlIGlz
IG5vIG5lZWQgdG8gZGVjbGFyZSB0aGVtIGluIGEga2VybmVsDQo+IHNpZGUgaGVhZGVyLg0KPiAN
Cj4gV2l0aG91dCBhIHByb3RvdHlwZSwgdGhpcyBub3cgY2F1c2VzIHdhcm5pbmdzIHN1Y2ggYXMN
Cj4gDQo+IGFyY2gvbWlwcy92ZHNvL3ZnZXR0aW1lb2ZkYXkuYzoxNDo1OiBlcnJvcjogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciAnX192ZHNvX2Nsb2NrX2dldHRpbWUnIFstV2Vycm9yPW1pc3Np
bmctcHJvdG90eXBlc10NCj4gYXJjaC9taXBzL3Zkc28vdmdldHRpbWVvZmRheS5jOjI4OjU6IGVy
cm9yOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yICdfX3Zkc29fZ2V0dGltZW9mZGF5JyBbLVdl
cnJvcj1taXNzaW5nLXByb3RvdHlwZXNdDQo+IGFyY2gvbWlwcy92ZHNvL3ZnZXR0aW1lb2ZkYXku
YzozNjo1OiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnX192ZHNvX2Nsb2NrX2dl
dHJlcycgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiBhcmNoL21pcHMvdmRzby92Z2V0
dGltZW9mZGF5LmM6NDI6NTogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ19fdmRz
b19jbG9ja19nZXR0aW1lNjQnIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10NCj4gYXJjaC9z
cGFyYy92ZHNvL3ZjbG9ja19nZXR0aW1lLmM6MjU0OjE6IGVycm9yOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yICdfX3Zkc29fY2xvY2tfZ2V0dGltZScgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5
cGVzXQ0KPiBhcmNoL3NwYXJjL3Zkc28vdmNsb2NrX2dldHRpbWUuYzoyODI6MTogZXJyb3I6IG5v
IHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ19fdmRzb19jbG9ja19nZXR0aW1lX3N0aWNrJyBbLVdl
cnJvcj1taXNzaW5nLXByb3RvdHlwZXNdDQo+IGFyY2gvc3BhcmMvdmRzby92Y2xvY2tfZ2V0dGlt
ZS5jOjMwNzoxOiBlcnJvcjogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnX192ZHNvX2dldHRp
bWVvZmRheScgWy1XZXJyb3I9bWlzc2luZy1wcm90b3R5cGVzXQ0KPiBhcmNoL3NwYXJjL3Zkc28v
dmNsb2NrX2dldHRpbWUuYzozNDM6MTogZXJyb3I6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig
J19fdmRzb19nZXR0aW1lb2ZkYXlfc3RpY2snIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBlc10N
Cj4gDQo+IE1vc3QgYXJjaGl0ZWN0dXJlcyBoYXZlIGFscmVhZHkgYWRkZWQgd29ya2Fyb3VuZHMg
Zm9yIHRoZXNlIGJ5IGFkZGluZw0KPiBkZWNsYXJhdGlvbnMgc29tZXdoZXJlLCBidXQgc2luY2Ug
dGhlc2UgYXJlIGFsbCBjb21wYXRpYmxlLCB3ZSBzaG91bGQNCj4gcmVhbGx5IGp1c3QgaGF2ZSBv
bmUgY29weSwgd2l0aCBhbiAjaWZkZWYgY2hlY2sgZm9yIHRoZSAzMi1iaXQgdnMNCj4gNjQtYml0
IHZhcmlhbnQgYW5kIHVzZSB0aGF0IGV2ZXJ5d2hlcmUuDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCB0
aGUgc3BhcmMgdmVyc2lvbiBpcyBjdXJyZW50bHkgaW5jb21wYXRpYmxlIHNpbmNlDQo+IHRoYXQg
bmV2ZXIgYWRkZWQgc3VwcG9ydCBmb3IgX192ZHNvX2Nsb2NrX2dldHRpbWU2NCgpIGluIDMyLWJp
dA0KPiB1c2VybGFuZC4gRm9yIHRoZSBtb21lbnQsIEknbSBsZWF2aW5nIHRoaXMgb25lIG91dCwg
YXMgSSBjYW4ndA0KPiBlYXNpbHkgdGVzdCBpdCBhbmQgaXQgcmVxdWlyZXMgYSBsYXJnZXIgcmV3
b3JrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4N
Cj4gLS0tDQo+ICAgYXJjaC9hcm0vaW5jbHVkZS9hc20vdmRzby5oICAgICAgICAgICAgICB8ICA1
IC0tLS0tDQo+ICAgYXJjaC9hcm0vdmRzby92Z2V0dGltZW9mZGF5LmMgICAgICAgICAgICB8ICAx
ICsNCj4gICBhcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvdmdldHRpbWVvZmRheS5jIHwgIDEgKw0K
PiAgIGFyY2gvY3NreS9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5LmMgICAgfCAxMSArLS0tLS0t
LS0tLQ0KPiAgIGFyY2gvbG9vbmdhcmNoL3Zkc28vdmdldHRpbWVvZmRheS5jICAgICAgfCAgNyAr
LS0tLS0tDQo+ICAgYXJjaC9taXBzL3Zkc28vdmdldHRpbWVvZmRheS5jICAgICAgICAgICB8ICAx
ICsNCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkuYyAgIHwgIDcgKy0t
LS0tLQ0KPiAgIGFyY2gveDg2L2VudHJ5L3Zkc28vdmNsb2NrX2dldHRpbWUuYyAgICAgfCAxMCAr
LS0tLS0tLS0tDQo+ICAgYXJjaC94ODYvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaCB8
ICAyIC0tDQo+ICAgYXJjaC94ODYvdW0vdmRzby91bV92ZHNvLmMgICAgICAgICAgICAgICB8ICAx
ICsNCj4gICBpbmNsdWRlL3Zkc28vZ2V0dGltZS5oICAgICAgICAgICAgICAgICAgIHwgMjMgKysr
KysrKysrKysrKysrKysrKysrKysNCj4gICAxMSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspLCAzOCBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS92ZHNv
L2dldHRpbWUuaA0KDQpwb3dlcnBjIGhhcyBmdW5jdGlvbnMgZG9pbmcgbW9yZSBvciBsZXNzIHRo
ZSBzYW1lLCB0aGV5IGFyZSBjYWxsZWQgDQpfX2Nfa2VybmVsX2Nsb2NrX2dldHRpbWUoKSBhbmQg
YWxpa2Ugd2l0aCB0aGVpciBwcm90b3R5cGVzIHNpdGluZyBpbiANCmFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oDQoNClNob3VsZCB0aG9zZSBwcm90b3R5cGVzIGJl
IG1vdmVkIHRvIGluY2x1ZGUvdmRzby9nZXR0aW1lLmggdG9vIGFuZCANCmV2ZW50dWFsbHkgcmVu
YW1lZCwgb3IgYXJlIHRoZXkgY29uc2lkZXJlZCB0b28gcG93ZXJwYyBzcGVjaWZpYyA/DQoNCkNo
cmlzdG9waGUNCg==
