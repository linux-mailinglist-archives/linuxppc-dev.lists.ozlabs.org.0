Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD254BD53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2gY3dSxz3fgL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:10:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIWuZadn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIWuZadn;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMnxX1XRFz3c7N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 22:36:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbXRgxbiRbaQO7YWGr2FfGMYRbBYb/xdJf5rE7iRL6HQpGi+hRcszIuNAqKPpOnSlog9TP0iWYdMfoVZDpetDjKfLswBAfe+YodQ8XhePIgOfTmDyj6vm2rFX5pa2LDn1CQIT1aQxEDENOf2Ui9/Ot/q/jzHOIulFtj7G5erPcflgSQDJW5EaX19IVp5gw1/fGHr45Qognro5/g1bpAqYIAdxVEz/GkXMoJbIAU4RpXZlcJrZfnbHasmDxv5xG0SrZC4IMbnLOrW1lcRmvloSqTW2UCdN7fj2kHI5ISq7jjQFlw2uohGtLSEnnpPisvBT3zQ6x/U+4zsboMitXDdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKTWigruVnf6d3NsCrGvQ+nnteqpEaqhjBu388bR5Ls=;
 b=YiyB4pkUajnKHJBCb3fzYxBDhDpjWGebR2IHsDw/Odgt8K2MjPGcwvuEGET776w/dXJWAwOni8Y83uripl7QbOkBTrOQbW+Rj0K9aOPCdAtPVqr1XDldXClZqt5rTwyzvI/0XGaW9PY78mYjBRIXLT4hl8Us4QqGCE/TKvF3Zr2Xknz+7qdKbqL/c2H+N4TpaOllAt+wQO6L0oFmpXikNRTqgpvY1kHnm1KfFLA/hDhM3jYNTHeN1ncfN2IP4Ywm1aGeFvaL7CdWz4rnZ2JqGIdu2udCQUJbVrmev3wDEM6QgGWpYfniBBxUL3Lgn2GYd4RiR862PN4JFayN00dUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKTWigruVnf6d3NsCrGvQ+nnteqpEaqhjBu388bR5Ls=;
 b=AIWuZadn1ddIyGIcqpbl+8JzqKH4oB7BOPtHJEcH+ZFaxar5yYlvfND0f8Qh3IRCtjOfCT7XhrcwncFqOoGQL6OG7q/AtCLkJt5PQw5BKSUoR6CQn77dpBhOGgJ9CtmSQCSWY8dPgAeXxL0XnUPYUbMZm+VLkJiWrjJs9YWKEPrlJbqr4hmism9ZlVFhwvPrj3JoIgfmAASxfNU4nqR7LIXblCacaRQDWARl0h6waLuslcP9mhz7uaAeLfM3Gyc7d0Fk19wM3177djhEQllRDNHDE2SALaNIgA7NJoyTZZssvjjNa+7D+Hxu3ms8/cN7cEoEx2FVJWCTnwUWXKd92A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4212.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:42::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 12:36:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 12:36:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYessDwND8kPCFFkWhvh7Pg63gL61GtMsAgABjx4CAB8XtgIAAAqGA
Date: Tue, 14 Jun 2022 12:36:25 +0000
Message-ID: <144b7e90-5d75-7e2c-4e54-8a73f914dfdf@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <YqGlmpbx8HTrWmpF@shell.armlinux.org.uk>
 <YqH5TfN9w35kHFLU@bombadil.infradead.org> <Yqh+k7Udth0IOBrd@iki.fi>
In-Reply-To: <Yqh+k7Udth0IOBrd@iki.fi>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f61864ec-4b29-4724-ef9f-08da4e027f04
x-ms-traffictypediagnostic: MR1P264MB4212:EE_
x-microsoft-antispam-prvs:  <MR1P264MB4212802F9CF6824CE5F79533EDAA9@MR1P264MB4212.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IfNTwoK07k+xiOGvfKSeSWG/l2D+b2zElLQ9WAP7iFYXq+hdRDeceAirr6pwxGWk0cW9r+a4P6q+wO9cIyk+TvjTSofUprWBQopK2AQVPWlL59CaHH5kH5AMiKEqbCFFtwhW+3KCccDof377fcYJvktj8K7S9+qcU4LrCGjn6G/uuxaHTCLU7/oNKY7cUkts1ACZYHzHHpyUFCpObx9ER8OYLFq2FL7IXEtNTmdxwI7VDT7Xl6YBg41pFzNnoLlLjz7zmkz9TG9cO/Ac3H/KsOFS1UFCTAP2vuv2YA71HIyjuo/CCD+RIomkHEquyvGmoKqgr5hhMGA+M1efl9tf4Gh/cjRHf4LwSGHjTU7EWfjWhpbWm4cte/OJHR+O5M5gcKLwe06kTXG2pqO70/NJKggv7qAPegVI562W9Qgb5tPY1lYAdgbG0dto3f3c2V6O9sQl8CI/RbggQiev6JRzVEItJPkoRgZD/VTkqJUVl46Jv3bVpqHliaTFBdHCjsyDeRodniEsmBnkUDU1pRTHS1cQEzpirsJvRc6DQIHYVPAyRweN0cKXRgSO+cKmrHeRxiMnSzw5uHrlfPya6ouyjJLegSF8yp+7kqdIlpnPDfR6XuCASgNcxm71L8WXYTbD0oapQbTLWeChC9FYn2DfuF6hWwifaQ3NPNfsVDi2wwIQuPG40malqg2hsp24tU0JeLHFmcfzifwqe9W0douQIryyZEXDsN2QFO6hoPOGHm+swJxsf3AgrJBiH/LvVgBCNPzqHZ/LPDuFrAM4TXHCPQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66574015)(64756008)(91956017)(66556008)(76116006)(44832011)(8676002)(31686004)(4326008)(7406005)(7416002)(83380400001)(186003)(36756003)(6512007)(8936002)(7336002)(7366002)(5660300002)(66446008)(26005)(66476007)(31696002)(86362001)(71200400001)(316002)(38070700005)(38100700002)(6506007)(54906003)(110136005)(122000001)(2906002)(508600001)(6486002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a3lzRWt5bDlDemQ0RjZmZ3Rwa3Q2bTB0bXJjOFVHZElCR1Q2amtNOVI3cklX?=
 =?utf-8?B?ODZnLytzR09oWklIWm1ZTGtrY25lcldiVDhvK0MzUnBPblRsekxUVWtwL1o2?=
 =?utf-8?B?TXo3b3BrV285V2hnYldXNElEVGthTG81aWZHcFkxTlNzNDhUUjNyS2NCNXhY?=
 =?utf-8?B?SW9HbDM4VERLc0dCMXk4dnFnd0hoOHVKUVlCL0lpc2pWMFhISnB6MGZxQkkw?=
 =?utf-8?B?V0Q1b3RUU3FuWThoS2JjTDlSdElaTDFudWVSOU1wbEJuT1EvT2xkNnhtbkMw?=
 =?utf-8?B?ZloyZ0xnZ0RiYTJ0NHZ4ZFdBYks3c0JCQzdOREpuNFdIdkJ6WGZ2K1Rob1RL?=
 =?utf-8?B?L05KQW5EUUpVZmcxSXJMNVp5bERHU0NuTnEwYmVTNHExZExZQnJQazB0d1lT?=
 =?utf-8?B?TnVNNTcxMCt4K0psbGFnbzJBL0syVFIzWFVJZktBNmp1Ym1PeURDV3VsYXI0?=
 =?utf-8?B?bDFwTnMwLytpOFpqMGNxSjl0eVhxN0xoYi9TcGExRE5sRjlPenQ0M3BiaXlY?=
 =?utf-8?B?VXB4dkt2eWZpWFZEYllrTEgvVWoxdWpmQ1VCMVpIYjJNNkltVVQ4K0IvbWxy?=
 =?utf-8?B?TnkwS3g3WVQzKzJrZXFCTlBIQXRkZFk1bk0wSENpUUJCaXFJVFZDZ3VVOVB4?=
 =?utf-8?B?OEhqc01RNmx4ZG9qTEFLc2U1Tk5QZjh1TGpQekNDRXYxdTFoZE5pZEhzVlFY?=
 =?utf-8?B?bDRzamNiRVVoMXJ1UGNWMEQySlZ6VncyWlJzMStoOGkydjJMdTFldEdqKzZ0?=
 =?utf-8?B?UXEzWkMyOEZXaFUzUEQ4aDNXdmZWS0FQTmF0T25ZSVp1U2QrUlJmcmdSY1o1?=
 =?utf-8?B?dzNGNjhVS2lpa2tEK01mTkx4YndQRGlhZEUvNlRpM2tvMmpIUHB6QTlyUndm?=
 =?utf-8?B?WGJ1WnlpV0ZIMGxHZmhqcEFTNjdjckpabk1xTmhocVFWOVNWWUd2N0Q2ZmxI?=
 =?utf-8?B?N2NNc1pOOG1qbHNvVU5abFpSbEJRUzlyYnhOVERXUFdJeHg0YVg3bXpLY2I3?=
 =?utf-8?B?SUtEME1WYWd2SkFSZ0V1M1lxV2dNS2dDbWZ0TW9JbXZJYS9HRTNEYWRJb2gz?=
 =?utf-8?B?dHF3NE1VKzdScldvekNjK3JlY2VVSUE4ZDNKc3FqNTArVDg0TjIvQ0s3R016?=
 =?utf-8?B?NG5oUXJpRWFROUhzdURpN2I3UWwxNlYrMHZyUnBvR1h0blBJUi92bGRyRVVt?=
 =?utf-8?B?NFdaZWJreE5oalBDbGc3NzQrbVFaOU5sQWZXWld0M1puTHNXbHFabnZoUU9n?=
 =?utf-8?B?bjZrU3JnZlZyRVNtVDdVblVOUmNzVGZHaVhtSkhQK1NIOWZvZlRxeXg1WmtS?=
 =?utf-8?B?azlma2ZmVkhRbGhaUDVrcDBTTzd4UE8rTTh3amd3WUlJd3NtRnYxakU1YUUr?=
 =?utf-8?B?ejJvK3dQKzE1UmVRbkpwUGRxNzdoWGpZZ29xS1poNDJnWUx0aDVHcHFIbm5h?=
 =?utf-8?B?a1JNeEpMc2traXJoY3lQbzdjcVppK2hnZXdhazRTaGFjQXdQVnJyMmdDamJN?=
 =?utf-8?B?ZHUxc1NSUVQ4UXU4MFpVdzJROW1wYzJtZDYxa1VLZEZ4bUd3Rm5XN1Z4NnhG?=
 =?utf-8?B?ejFrQzNXUDFoT1hWcmhRYkllbXJLVVRpU2tSdjhuYWd6cXhDQlNXT3lYR2di?=
 =?utf-8?B?K3F3UXhBWDA5czUySHR3NHl4YUNyeFgrSkJ6Vm55UFhtazRGZGZGZmVOam4w?=
 =?utf-8?B?UGh6TGhHSDRsdnN0cGgyUlJNNWw2UjNxa3ZQemVHZE4vQ1ZmYnJzMXdRcHBO?=
 =?utf-8?B?Nys3M3poM3kvc3BZRVlud0dXTnhpYTdTRHZkRHZwU0FYY2o2KzVHYXVWU2Fr?=
 =?utf-8?B?REIyRVFrMi8xdnRod2p3MXQ1U05yTW9GY1cybU1oNU5UNUo3VkljNGdaalFh?=
 =?utf-8?B?dHdMZXZock91L3ZMK1dhYy84Vkw4U0FQSVZxcjNCMkhSMDFWM0prdjFoUkZI?=
 =?utf-8?B?TUZwUCtKaDdndzUvUWxKVExZeGZ5VHV2VnRUN1lnTzlOWmRmNWI0YytUazlK?=
 =?utf-8?B?NXR5RHNPdU5WZVRVbURXU2t5TnVnU3lsQWpJNVYvOWVvQk1PeGlYTlJLVEVH?=
 =?utf-8?B?dlc3SkZ5VmEyQWJJeDZaZ2EyZVNTTVp6dzFNSXFDeUhUM0krOHUrZG9IQ2ZP?=
 =?utf-8?B?R3U3QVpkZ0wrQjJMZ1ZFVVY4elhNbDY2RzdjeDJFWTFpVzEvT3hHckN3cUdt?=
 =?utf-8?B?azBmYkVRTUNPOEtDRUVMTnRSdU5BU05hbmFFVUdCYnNVVmVHdXpFZnNucmFl?=
 =?utf-8?B?Rk1rZFRWNWJRMElzWDU0WitnUWdtTFRXbVMvNWJUTFFEMW5SK3pWWVJaODla?=
 =?utf-8?B?UmphRDg3QVlKUkdobDdGUEJMTFVScStEY1BIR000bkpjR0xwZGhRMzR5dW5t?=
 =?utf-8?Q?Q5rXTD+FIoMlTb8K755DmF8mwmzpRvUVzmsGE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F55359D1AB37641BA2B2303D8039BB6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f61864ec-4b29-4724-ef9f-08da4e027f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 12:36:25.3965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7ZGrpuO84qfsnuIAzIHJgewBW+QYHKI+A7e4vP3gwrmnD72S1Fo6rmJynKfpH/CNqWRUpa+tz/zLhqkhu/dp1lJIjP3eGD+wptwKOkn47s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4212
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsush
 i Nemoto <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renn
 er Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe

5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparcl
 inux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA2LzIwMjIgw6AgMTQ6MjYsIEphcmtrbyBTYWtraW5lbiBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIEp1biAwOSwgMjAyMiBhdCAwNjo0NDo0NUFNIC0wNzAwLCBMdWlzIENoYW1iZXJs
YWluIHdyb3RlOg0KPj4gT24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMDg6NDc6MzhBTSArMDEwMCwg
UnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOg0KPj4+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0
IDAyOjU5OjI3QU0gKzAzMDAsIEphcmtrbyBTYWtraW5lbiB3cm90ZToNCj4+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvYXJtL2tlcm5lbC9NYWtlZmlsZQ0K
Pj4+PiBpbmRleCA1NTM4NjY3NTFlMWEuLmQyYmI5NTRjZDU0ZiAxMDA2NDQNCj4+Pj4gLS0tIGEv
YXJjaC9hcm0va2VybmVsL01ha2VmaWxlDQo+Pj4+ICsrKyBiL2FyY2gvYXJtL2tlcm5lbC9NYWtl
ZmlsZQ0KPj4+PiBAQCAtNDQsNiArNDQsMTEgQEAgb2JqLSQoQ09ORklHX0NQVV9JRExFKQkJKz0g
Y3B1aWRsZS5vDQo+Pj4+ICAgb2JqLSQoQ09ORklHX0lTQV9ETUFfQVBJKQkrPSBkbWEubw0KPj4+
PiAgIG9iai0kKENPTkZJR19GSVEpCQkrPSBmaXEubyBmaXFhc20ubw0KPj4+PiAgIG9iai0kKENP
TkZJR19NT0RVTEVTKQkJKz0gYXJta3N5bXMubyBtb2R1bGUubw0KPj4+PiAraWZlcSAoJChDT05G
SUdfTU9EVUxFUykseSkNCj4+Pj4gK29iai15CQkJCSs9IG1vZHVsZV9hbGxvYy5vDQo+Pj4+ICtl
bHNlDQo+Pj4+ICtvYmotJChDT05GSUdfS1BST0JFUykJCSs9IG1vZHVsZV9hbGxvYy5vDQo+Pj4+
ICtlbmRpZg0KPj4+DQo+Pj4gRG9lc24ndDoNCj4+Pg0KPj4+IG9iai0kKENPTkZJR19NT0RVTEVT
KQkJKz0gbW9kdWxlX2FsbG9jLm8NCj4+PiBvYmotJChDT05GSUdfS1BST0JFUykJCSs9IG1vZHVs
ZV9hbGxvYy5vDQo+Pg0KPj4gVGhhdCBqdXN0IGJlZ3MgZm9yIGEgbmV3IGtjb25maWcgc3ltYm9s
IGZvciB0aGUgb2JqZWN0LCBhbmQgZm9yDQo+PiB0aGUgb2JqZWN0IHRoZW4gdG8gYmUgYnVpbHQg
d2l0aCBpdC4NCj4+DQo+PiBUaGUgYXJjaHMgd2hpY2ggb3ZlcnJpZGUgdGhlIGRlZmF1bHQgY2Fu
IHVzZSBBUkNIX0hBU19WTV9BTExPQ19FWEVDLg0KPj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgcmVz
cGVjdGl2ZSBmcmVlIGlzIGltcG9ydGFudCBhcyB3ZWxsIGFuZCBpdHMNCj4+IG5vdCBjbGVhciBp
ZiB3ZSBuZWVkIGFuIGFub3RoZXIgZGVmaW5lIGZvciB0aGUgZnJlZS4gU29tZW9uZSBoYXMNCj4+
IHRvIGRvIHRoYXQgd29yay4gV2Ugd2FudCB0byBlbnN1cmUgdG8gbm9leGVjIHRoZSBjb2RlIG9u
IGZyZWUgYW5kDQo+PiB0aGlzIGNhbiB2YXJ5IG9uIGVhY2ggYXJjaC4NCj4gDQo+IExldCBtZSBj
aGVjayBpZiBJIHVuZGVyc3RhbmQgdGhpcyAobm90IDEwMCUgc3VyZSkuDQo+IA0KPiBTbyBpZiBh
cmNoIGRlZmluZSBBUkNIX0hBU19WTUFMTE9DX0VYRUMsIHRoZW4gdGhpcyB3b3VsZCBzZXQNCj4g
Y29uZmlnIGZsYWcgQ09ORklHX1ZNQUxMT0NfRVhFQywgd2hpY2ggd291bGQgYmUgdXNlZCB0byBp
bmNsdWRlDQo+IHRoZSBjb21waWxhdGlvbiB1bml0Pw0KPiANCg0KSSBndWVzcyB5b3UgaGF2ZSB0
d28gcG9zc2libGUgYXBwcm9hY2hlcy4NCg0KRWl0aGVyIGFyY2hpdGVjdHVyZXMgc2VsZWN0IENP
TkZJR19BUkNIX0hBU19WTUFMTE9DX0VYRUMgYXQgYWxsIHRpbWUgYW5kIA0KdGhlbiB5b3UgYWRk
IGEgQ09ORklHX1ZNQUxMT0NfRVhFQyB3aGljaCBkZXBlbmRzIG9uIA0KQ09ORklHX0FSQ0hfSEFT
X1ZNQUxMT0NfRVhFQyBhbmQgQ09ORklHX01PRFVMRVMgb3IgQ09ORklHX0tQUk9CRVMsDQoNCk9y
IGFyY2hpdGVjdHVyZXMgc2VsZWN0IENPTkZJR19BUkNIX0hBU19WTUFMTE9DX0VYRUMgb25seSB3
aGVuIGVpdGhlciANCkNPTkZJR19NT0RVTEVTIG9yIENPTkZJR19LUFJPQkVTIGlzIHNlbGVjdGVk
LCBpbiB0aGF0IGNhc2UgdGhlcmUgaXMgbm8gDQpuZWVkIGZvciBhIENPTkZJR19WTUFMTE9DX0VY
RUMuDQoNCkNocmlzdG9waGU=
