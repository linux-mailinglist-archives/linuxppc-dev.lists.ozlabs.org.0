Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862227E696B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 12:19:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=B8vIy1yb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQzxY5pLnz3cWC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 22:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=B8vIy1yb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62b; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQvKW4m6Qz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 18:51:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gez0/G1mCD+PhwYzccbK7HnNolg7+ar01RUnR87+ImavIEpjwL7qAvGFTKTj6BGiMBO61bX4usAJcTkj3Z0brhsS8mBYgNyyqNkScyx6+tO3lNp5JvTCbYL/OZPDP7dcsNq01zY9nDLYVKj2bi/quYGdsxo6GipMKe6+Wzp0e2BWaymBjsiwmvvPqUqzN0sZOEbDKgxowCDajCLVgdmBnQsOjxtzzxqNLByw4jY+upjsWc1cmxW8o7z3IEZon7W1087IhEWh2nV6IIIITky52pNxT1RZtw2tPOb/2vbrEF3Oma6skKv6kyvGhGjcMxGSZiaIB3mFzTpT2gOn7BXpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2eikrIvlQMysYuM6u0fRDWCLfWqS7aaq5BFW/jxHc8=;
 b=IYMBQPFEvQZSZn8Ffui4Tr0gK89zqi+6ldBXyiw/1rE151znz9dJ98+SfXMry8xi/3CiKrA3p8I/HqM4yKyFxDuhZ6Dtzl9oUaZAQNA+DnpF4C9vKh5+QOBaXs6r9Vx70U6qhOaXCVV75ma1nw7k5pZzUj7xGQJRFq1nC8MbnwKdVa04gRlkjj9o7cvStrx3I2BXbjtLKa9JGFYhqKcc/bUWy1OYzMI7wMokhqwHE4ooKMmkZWF4JP89GWlQ1W69xyTgPqYmxLoSSzXF5mnOj/gqCbVpo9JxJKHEok/gu4czPGuhgeUEehXD/h4o4E5tcGPnCOV8U48pkrzafmCFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2eikrIvlQMysYuM6u0fRDWCLfWqS7aaq5BFW/jxHc8=;
 b=B8vIy1ybcPgZQDxKEwmYuC+a2brKKmIKurGqsGw4CAapwaKS534T8Fg41c2rS0XTCNLbDu/CGG1/ciGUt6xzDHFjrYsQQ5CuUxmqcALLKpNpPBeP3nZCgOmgQI1Gk2AJpUWWulPJ8MBMMpMpaEDxYC1PrpNiml+lqEe8c9tJG1NonL0/WMtYt+5utYraekI2unAmg0JSBwf8mq/lKELAie7IqhalFE6X1Tgg7eGDTKNLlGiq+J/bmPyShv4reBz2YCpZD+kOzIjpecUu/2cCe+oDc/GJrdDa4igHwN/1NJOW9Ep61xYg7dTHzCpVvTDds7bdb0VN1bUjF66S9YXHSA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 07:50:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7002.007; Thu, 9 Nov 2023
 07:50:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Topic: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Thread-Index: AQHaEkPkiwEWo83izEmVhjzNZW4UOLBwvvwAgAASbACAAM0CgA==
Date: Thu, 9 Nov 2023 07:50:58 +0000
Message-ID: <9cbfbd59-0761-406d-e97e-75e83bc4e6d0@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
 <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
In-Reply-To: <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2060:EE_
x-ms-office365-filtering-correlation-id: 7fd46605-a5a3-4429-7fe6-08dbe0f89cc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CotvFx75DMMuKHwjPh2tXnWiHwsxyYHENTBYC1puuKnRMcbQUY4adXRJxExQ/HzFzIMHzN35wsMH3iE7TOqI6RYzUwuDVyyXlfjxA59YKtgE2uroyFAcnB/oSQjxm5nibe8NhSbRUgU9F42GEn4wSMq1jDTxl0mGQjJ1EHcIBe7kH2Ik0nbjnPLnGC+qyWJMifT8Na5K+e2lwRZoIoYf3mnZw7wg95MUOl6FE1WiMusyeNqxGlK6M8w7Vw5AlX97OdrTwdxRD7pekgqpv17utzAQWfWCSEb+wx7TFt8ZELxwn8yP4l/Qx+OXPr/u5+ANojBDEHq/Io89KJSFmcBcoMP7X45IpOZ4CZbV84LvkYq/7o/C9PeZYw3LJ5+IlditUdyUZxECHCHfrbAX9PS/p+DceKpDJmbdcNoINdxy7mdbw0k7US2W0ankT/9tYApKOoNchr31ZOLyjLbBklY5LpFeow3TVXA5VibHRmwLuzFn/gvRc/SX2/ceZcS7NDjJTsWnkbtadIFLk3G4Ll+02/ZySr/I/cV8Uhb7JqAv2lgFz5MDuhDz+woJDl+FEKiXA8cq8AUFKByafmrA02Eq3RJVWlqivQ5GzrRtScU5bagNQkSYKGvC4c9tlojLdfdruvy1Z6X9cD+op+vUz41G/yRig98scD2krjPBw0pTcGT00UhEhaeOGf1uc/HWe0FG
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39850400004)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(6486002)(478600001)(2616005)(71200400001)(6506007)(6512007)(36756003)(38100700002)(122000001)(86362001)(31696002)(66476007)(7366002)(7416002)(5660300002)(7406005)(64756008)(110136005)(76116006)(66556008)(66446008)(54906003)(316002)(66946007)(41300700001)(91956017)(44832011)(83380400001)(2906002)(38070700009)(4326008)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEdnV051TnhxRWI3c05VY1JMN3pQNWpYeTdQK3pWZVZHSk5QdFRoOUhjRHdo?=
 =?utf-8?B?MWE5RmN5bGlCZitWMUluTldmZE5HM1U5ck1TOWxpQ3pVd25pc3lCSGt3YVBC?=
 =?utf-8?B?WStCSDRRMWFPZ0o5SHlhNDRBczdQcS9LOHZzTTlrb1IrREhTdXBqTWNkMzNx?=
 =?utf-8?B?NlFZVmN4M3FBYzVmQzAxd3k4c2gvV25rczQ2Z2xoZk5tejlqRnhyampaOXh4?=
 =?utf-8?B?bDdKbzhEOVFMSitudmIvWERWT2xrd3pneE8zdUlkdjZXYlk4NElmbSt5V29p?=
 =?utf-8?B?ZS94SDZRMXladGMxUHRiS0lxeExHU1pBRkRlMHVsRU9TSW5VWjllVUhKM2Fk?=
 =?utf-8?B?VnlvaXNTRFR5RnFwTDFETm96cDJyQnQxRndrNXkyVzJ1RTFXYlVhaURuUUxr?=
 =?utf-8?B?STlTbklzL0pTenRBM3dIZVVqRTZZU1dEbVN3eXRMZmNmV1ZlTmpROHZZd3dB?=
 =?utf-8?B?clI4eTR4azVSWkxFQ2ZnODZJZE1MWlJCRWZVU00vaDRKYzczS1QrVzhQbkpi?=
 =?utf-8?B?azNsL3NSZlBNbmtKTXk1V0Nqbm1VckNlQWZLODQxVmdrYzY3dHlXemYxdjlN?=
 =?utf-8?B?NGpENTlDTWhMSWxMRlBUcnQwNGl4MDNKUjl6dlZzSDhCRFRtdnZFcmFicEty?=
 =?utf-8?B?cjdQOUpwV0pnS0pHZEw5YzNDa1BtWGxnbXQwOUxsTjNuSjY2aHlhYUtQeVJm?=
 =?utf-8?B?WFdpRmN3MEc0QVJEUWhvLy9CK2E1bGFBUlZNUC9YQ3FuaDRuRUJsTThieTZZ?=
 =?utf-8?B?Y1M3Y05lSTlsRkNTSnB5WGhWSVk0NFErNGdURC82UGN1d1RrZTJNYkNSWk1u?=
 =?utf-8?B?YWJ0KzBOUDVUMTFuQmVkNG9xOU5WY0M0MTNkbFpsTDRJZUorWUM0b0k3WlYy?=
 =?utf-8?B?clN1WGFQMldEd0ZwWlU3TVcxMERSZEo0UzlQRTBoUFo1YUhnTzhrQ081NHJI?=
 =?utf-8?B?YXhtcUFJNEdvUlR3OU5IN3VxSzdoK0xqTFZiTG1IanFPK3g4VCtEQnVzTDBi?=
 =?utf-8?B?VUQ0TnV1cjNzMEZhbzZCeUdoUWRFUVVVbmQwWnBMSkp1U2lwMmhLUXJsR0ZU?=
 =?utf-8?B?ZVNyYnF5U3hUekljYmFvT29VZW5SeTNEUm5McFUzdUtLdzJLbmRFdG9XSDRF?=
 =?utf-8?B?TDFaQ01vZGUrZThPS2tSS0ZBcDBzcFU0cHliang5YVQ5c0V6UkNCZ2Y5bVpr?=
 =?utf-8?B?OHRPTkdZcnpsbDNja0VaZlJmNE9xR0xZYTRvQ3YyS253NThuV0srbmdVbnBR?=
 =?utf-8?B?TUZLRTUzZDNoRDVFSHM3bk9BNU5lRkJJU2ZwaGhldE5qOUhLY1BGaG1yTmE5?=
 =?utf-8?B?K2RTN1prSFpiZ05IQ0xxWHlnaGFPSjhaeWVzYmdNQWovcGMrYjBFbHJ2MmtV?=
 =?utf-8?B?eXk2bFpBd0RoaWZHeDFyak9EUTZxbTRYWTliSThaU29VUmZHWTBFd1FQbVdx?=
 =?utf-8?B?Q3REN05SV2NqWE9XVk5senRKc2FiSHJNcWNObkdSc1dHS3lhWDduL0swUXJF?=
 =?utf-8?B?S3ZWY2IzTmZjSzkwVXAxWVZKbXRZOGVQNXphYzZtZTB5RllxZFB0dkJ2Ymdq?=
 =?utf-8?B?SWhYdDFrdkZCdnNqUkp5VFI4c1N4aHQ2MG41OHlISlJrbTJYMWJybkdXV2Zh?=
 =?utf-8?B?ZXV6NHpJWU5FK243Q1gzZkJMa0J6dFRZeFVVS09PQ2R4RFcwM2VtT0pVWkli?=
 =?utf-8?B?MWIrZU9RZjJ3MkFVYU9HVEcwRlNIVjA3cmNJcC9ZYVIzb1FyS2xYWVk3MlFh?=
 =?utf-8?B?bStkZkVQenZYMFRUazlsT04xeFMwb1VjVTg1bmU4b1hXc1RBYWY4bzltL2pP?=
 =?utf-8?B?M0wzN0thaFl4bTBwWXRVdzAxM0RabmMxNjFQTE5XN2s0K1gxbWFZZ0ZLbUIx?=
 =?utf-8?B?ckE2UXJaQ0RmQXdyZnNoZ3dPaHJwRmo3TjNJNFozc2JNQlB1OTRpSDY5YVNR?=
 =?utf-8?B?aXFmT2VKUkNMaGNlOGhhM0tRaEZ1eWRneCtyNU4zVS9FRU9YSDNwYWFYcGVt?=
 =?utf-8?B?QlJDVE5LdU1uQkZkK09FekdrTHNKZzFQcG50Uk5nZHBOUWpMeFJnWXd2bk1B?=
 =?utf-8?B?YVREV0NoU1ZUOE5Wc1p6QWtSMHNldXRYUjFucm54NmtQN0FPSVYzTW5EUUc3?=
 =?utf-8?B?N0tmQ2ttZHF4VjF2cEdUMHZZSzlZSk1xeW5ZVVdFTUxSTUJsdGJ4YS9wUjAv?=
 =?utf-8?B?eEF2WXRvKzhNSXUvVWMyT1ZYc2Q1QmxISVRsbkpEOXhVcys4bUcrVlordlM3?=
 =?utf-8?B?MGN3Rm9hTGhaY0VPUW9KSDZoMjFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6ADA312F05CBD14886F7686E9E3B661D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd46605-a5a3-4429-7fe6-08dbe0f89cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 07:50:58.9770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhXpgb1F2l6xtfeDBb9/frhCt+QuHDXHsK2ocb0duLDJUEQTcU0qq5eUKD6YhHGrBYQ38DA1iI/n+JUTe0W4xwlIAzSyupKvu+IsauF1FpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2060
X-Mailman-Approved-At: Thu, 09 Nov 2023 22:18:45 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Netdev <netdev@vger.kernel.org>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kerne
 l.org>, Russell King <linux@armlinux.org.uk>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Ard Biesheuvel <ardb@kernel.org>, "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
  Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, "David S . Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzExLzIwMjMgw6AgMjA6MzcsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCBOb3YgOCwgMjAyMywgYXQgMTk6MzEsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+
PiBMZSAwOC8xMS8yMDIzIMOgIDEzOjU4LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6DQo+IA0K
Pj4gcG93ZXJwYyBoYXMgZnVuY3Rpb25zIGRvaW5nIG1vcmUgb3IgbGVzcyB0aGUgc2FtZSwgdGhl
eSBhcmUgY2FsbGVkDQo+PiBfX2Nfa2VybmVsX2Nsb2NrX2dldHRpbWUoKSBhbmQgYWxpa2Ugd2l0
aCB0aGVpciBwcm90b3R5cGVzIHNpdGluZyBpbg0KPj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3Zkc28vZ2V0dGltZW9mZGF5LmgNCj4+DQo+PiBTaG91bGQgdGhvc2UgcHJvdG90eXBlcyBiZSBt
b3ZlZCB0byBpbmNsdWRlL3Zkc28vZ2V0dGltZS5oIHRvbyBhbmQNCj4+IGV2ZW50dWFsbHkgcmVu
YW1lZCwgb3IgYXJlIHRoZXkgY29uc2lkZXJlZCB0b28gcG93ZXJwYyBzcGVjaWZpYyA/DQo+IA0K
PiBJIGRvbid0IGFjdHVhbGx5IGtub3csIG15IGluaXRpYWwgaW50ZXJwcmV0YXRpb24gd2FzIHRo
YXQNCj4gdGhlc2UgZnVuY3Rpb24gbmFtZXMgYXJlIHBhcnQgb2YgdGhlIHVzZXIgQUJJIGZvciB0
aGUgdmRzbywNCj4gYnV0IEkgbmV2ZXIgbG9va2VkIGNsb3NlbHkgZW5vdWdoIGF0IGhvdyB2ZHNv
IHdvcmtzIHRvDQo+IGJlIHN1cmUgd2hhdCB0aGUgYWN0dWFsIEFCSSBpcy4NCj4gDQo+IElmIF9f
Y19rZXJuZWxfY2xvY2tfZ2V0dGltZSgpIGV0YyBhcmUgbm90IHBhcnQgb2YgdGhlIHVzZXItZmFj
aW5nDQo+IEFCSSwgSSB0aGluayByZW5hbWluZyB0aGVtIGZvciBjb25zaXN0ZW5jeSB3aXRoIHRo
ZSBvdGhlcg0KPiBhcmNoaXRlY3R1cmVzIHdvdWxkIGJlIGJlc3QuDQo+IA0KDQpVc2VyLWZhY2lu
ZyBBQkkgZnVuY3Rpb24gaXMgX19rZXJuZWxfY2xvY2tfZ2V0dGltZSgpLCBkZWZpbmVkIGluIA0K
YXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL2dldHRpbWVvZmRheS5TICwgc2VlIG1hbiB2ZHNvLg0K
VGhlcmUgaXMgbm8gcHJvdG90eXBlIGRlZmluZWQgZm9yIGl0IGFueXdoZXJlLCBvYnZpb3VzbHkg
dGhhdCdzIA0KdW5kZXRlY3RlZCBiZWNhdXNlIGl0IGlzIGFzc2VtYmx5LiBTaG91bGQgYSBwcm90
b3R5cGUgYmUgYWRkZWQgc29tZXdoZXJlIA0KYW55d2F5ID8NCg0KX19rZXJuZWxfY2xvY2tfZ2V0
dGltZSgpIHNldHMgdXAgYSBzdGFjayBmcmFtZSwgcmV0cmlldmVzIHRoZSBhZGRyZXNzIG9mIA0K
dGhlIGRhdGFwYWdlIHRoZW4gY2FsbHMgX19jX2tlcm5lbF9jbG9ja19nZXR0aW1lKCkgd2hpY2gg
dGhlbiBjYWxscyANCl9fY3Zkc29fY2xvY2tfZ2V0dGltZV9kYXRhKCkgd2hpY2ggaXMgcGFydCBv
ZiB0aGUgZ2VuZXJpYyBDVkRTTy4NCg0KTWF5YmUgdGhhdCdzIHRvbyBkaWZmZXJlbnQgZnJvbSB3
aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMgZG8gPw0KDQpDaHJpc3RvcGhlDQo=
