Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D799546531
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:10:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJD91Zqbz3dqv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:10:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Hh8zpHCy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Hh8zpHCy;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJcjn0vqVz2ypn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 18:30:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laaN/p+ovZCVMPzZsL6VBu9BGxdW8gmDLFvf5wlVJxHSHbvNaBVfpzjm9qcYI21hRKloK4Dus1ozgWnBKFCmOZdYh3by3wSGyqPip73fZRYNPmHUH3d8H6UkGCX/AfybtaOkVipqorVRshcuA/asfwSNjJMCgNO4ZJK+uQBt+EIcqon94jKE3cwuApEE6tQeHtnOgw0V2havIUlG+1cCvBkooSA9rHwrxuhuS2ch64cURuTcoMm+RdOE5z+Wrkd/DabeCjUayPhbw01fDWge8gJGn4isb1bIu3LCjClUnC48WVtOMsTl2z9EBLX+Y75OjU9XUt/pk7+7OEjrJyZhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaHU5O8oL7PaCIjwN9mvw3XzQGczs+0z5rneVrJwV20=;
 b=U9C3YZ71i6djRKgeFmullnOia2yOAxX/5WnaY4BcG5Lr8JK6zKU5CJ7r310n8Iif34C0/yUBAnjX5BNuRd6GNYyAn+HxULecm6iuW6EoccDbFvhTdg/3OmQ+VTGV0AlfCu37/27C41/6MspzM78XvHUhi7RFDyZw3fcr2vHRafNwPkcTHqUUTuYNWthWQZmYnzn2zmlTH2FfGfqxvwck1gC0/k7b3s3oa6QZJLTtL+cS1lJFEV3SMZUJW4Pz3pA8KhZcP/B73ErMtNy/1R6OX/G6Zc/90F0UD3u/uhgMcigDr95WoWUoRDUxVGm0n5xbpmDsiayF1pNbvorovpcmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaHU5O8oL7PaCIjwN9mvw3XzQGczs+0z5rneVrJwV20=;
 b=Hh8zpHCygyVHWfwJ6h5/28PHnzBGnRBNjRxeZdFJP8GJFqAkxkD1I0rOeO9poCfkGvx1M9NEaTlNWtv74yhuXyVhLq1nxOhoUzBz5pZxkDtffSOj/10WRObDg6wKbXOP6Hlvg6/R19aFfTStp6Qi26n04JA5sqSpxiCouicC/ouwwmWOQQFBPJ9IhRKOuFArDosPHm0gpm8J03G0Alcv1/6OvRWGsr/sJW5mSQTW5uOF/2u7iaRQV4mhFA3KvFdyS/JsiPXMHzFt8Xxc3Ovqu8wPPadAhGmogQn9RFfCY5QcjxuRbd5LpoOBrHqiFNt7UsfinAyRHqETw4A/0vSryw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2348.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 08:30:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 08:30:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko@profian.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYessDwND8kPCFFkWhvh7Pg63gL61GwK6A
Date: Thu, 9 Jun 2022 08:30:12 +0000
Message-ID: <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
In-Reply-To: <20220608000014.3054333-1-jarkko@profian.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6ff48bc-341a-4d51-2190-08da49f245a9
x-ms-traffictypediagnostic: MRZP264MB2348:EE_
x-microsoft-antispam-prvs:  <MRZP264MB2348FEEB67529AB26EA9C09DEDA79@MRZP264MB2348.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ArP+MDpDWz7Vg9Dn3R/k0oVNfYSbNAAGycXfGwztcd3iPlsaMnwORazvW682H3I8nuDhTQ1ffYaOeAwl0csTUlm1ACRFIRdhDrA8q+9gS8XHkCC2uaE+20+ZAdHu+5hjhyBjVELi1v+o/B+Ip7vgmPYCwjj81k61W5Obd6sr2Y4FTUagq8rho++NOn2hKX+YUo1gIlK4X4GOhKl1Ub00+M6KG5Y7u6WL9kWQsNjyyYWTIdfVK2fPuLDTHU6bbZrf/+ybkW9Ueh+itdKvcJuqHSsbRVwbtvVCaQyOZPm8xGg0kALLbRu4f21UVEjIdP5vrhmcG5W45tFrY/MrmnAA82qqqphq0GsGZuoylzNxMVHtxYLZgQWcZ7Rge+9NXLTF9xmXOv018xMaJ273WSUFPm81UMwL45tg9uBEigXz4Vs5nGeoH1XZ5ppHJESAkPAEESG5pefa3Z70AefjmB9MbGWGtIoorMZ+0NdzEvyIb3TZflwuXIhST1cej7Cbt2cV1Se69mpri2P0ic3r6yXTuCJ9na48QGHWgeiPsPyXr3H+XkMptvS8HVCtx10A8iHqwoR+wL6VlZxlwDimn4AcWhwcu/WPaHUJxioKXnITE10PDitz6AIRP+OvcrIZvww4QhgChw5udlCypaqkEsHDICoGQsBdtzCuVrTozbYvxJaQIbu+Hu/i2xHJExPoeUHwD1+IChZRfodEbEHQxnIIvpXcs6OCWgdYblnr2vEFPO4mxgUuhK3ujIsUgChgsgMlUlNswXzyT8Vn9/+IcLTu6CZJh6Z7uWnOMQFowHiH1nU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2616005)(66574015)(6506007)(36756003)(966005)(66946007)(8936002)(122000001)(6512007)(31686004)(66556008)(66446008)(64756008)(5660300002)(26005)(8676002)(76116006)(66476007)(186003)(38070700005)(91956017)(7416002)(508600001)(30864003)(2906002)(38100700002)(7336002)(7406005)(44832011)(7366002)(54906003)(83380400001)(31696002)(71200400001)(110136005)(86362001)(316002)(4326008)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SnZrb1puNm5Ub2cvK3JBdWo0bjBsQnlmMDloZGFyS2JPZTF4WVVRUWYrQTZk?=
 =?utf-8?B?NGFpR0VoWEZtRVFhaDdKQXFPTEk2cW5MZks1VjU0cmJ1OGFUc0JzUmV4TUwy?=
 =?utf-8?B?V1lYR1BKTnFZckVYcDFGOGFvankxUzgwNWNYQmI2Mll3Q2JQRmlSRTZGMm1W?=
 =?utf-8?B?b0VrZWZPbW1ibWFXK2k1aXJwcERPaFZsTFVoWlVsTXQ2RjU4RithRUNGcHY2?=
 =?utf-8?B?a0hvUm9xUy9ucThZenRTa0JKaDN0S25KbytQeVh1L3pyWDVKVFVSS1A4R2Fi?=
 =?utf-8?B?SXFmakpZZW1qS0tQd1N6bXErYnI4WFRlNmFtejNmRWZvWk5WQzJxaE13aTdj?=
 =?utf-8?B?TldldUpRbHhBVXM2NlVab3VXQ2dOVjFqUVlTcXBMUW0yNUk5WGpkejJGRVl3?=
 =?utf-8?B?MkJ5WG9HWWxMQ1RNMThyMG5WVFU1WVdGK2dqSWhET2RNV0NDRXkvQ1pBQzlS?=
 =?utf-8?B?NmNFb0xMakRReHI4aUg5SEpDZjViVDJDWTJUNlFiVExrOTdOTWM5ejZUR3hN?=
 =?utf-8?B?OXdsNENZbEFqRzM4a0FVV1k5WEdUd29HdXBhZDMxdEN1LzJQem5OaXd2WU5R?=
 =?utf-8?B?U2ZNUTlwKy9TVjNzR01taDhBT2s0azZ0eStiYmRWLy9MWmVBSWYzM3ZrNUx0?=
 =?utf-8?B?ZEZhWHFjdWFhTFF4SUt3OTR3d1lBVlVyR2wzaGsvZERmSWR2SDlpRnF0K3lX?=
 =?utf-8?B?cUVjTHIxL1RQRmxaaHNwekVOektETnU3clZmMWJ0cXNBYUViUXd2YjZ1VmVI?=
 =?utf-8?B?ZDRFMHRNRkk3bWRsTGpCamVVNmpha2RRQ0RuZVNXZDd4NVZEbmJYUFhEZVJD?=
 =?utf-8?B?cFVUeFBaM0JVRVlYZWJaZW52L0ZxV0k4NEFDS2I3bXlLSWRwMjFURmZud2NC?=
 =?utf-8?B?SldrWC9tR3dmaWcwQW5hcmx3Q2J2Ry83NTZ5cXdHMU0vcDAxMytqWDhkemZ5?=
 =?utf-8?B?blYycWEyeDBkUVcwbE80UjBzalRDYysrcndMamFDWTlQeVorMVFQdm85ZlFh?=
 =?utf-8?B?U2pVQTc3dVpXY1JLeFozTFlGV3c1YitHM08rYVZaVksyai83Nlh5MEdhYzM0?=
 =?utf-8?B?WVEvcjVjYXo0Q0IzR3J5Y2NneW5zNWJsOFhGS2FOL2hjSXRDR2RBY3Q1dVFS?=
 =?utf-8?B?RXFhQk1xeW9NeFhWVGdCWXlqVTFoY2RxOXYyd05VRkJFYjFweWExZWw2UGtJ?=
 =?utf-8?B?TzFwa0RHQTcxVm1ocUtSdHVlYjVCcVJITndZK1FKWm5LUldQUVF3ZENxSmRL?=
 =?utf-8?B?TjROK3kyTVRXNURYaGNsMlRnWDhDMWNTNXFNZ0ZPY1FXNzNPemN1L3h4ZzNh?=
 =?utf-8?B?QUNpWCtQMHJVSEcvQlk0OEcwa20ydXZENVJEU0hvUXVheEdzRjlIcnJRcXpk?=
 =?utf-8?B?emFrSTU0MFlzay93VFI3SS81dEZlcDcxdWx1bWF6NlFibFVwWmV2cWg5NXZY?=
 =?utf-8?B?eDdsRE5uTkNUN3ZwdklTUWZMa3JBRXJxclU4d1J2MG95MnVrMy9PUHVlVWhO?=
 =?utf-8?B?a3NnSFIveU1MOTE5QkxHUWhzUUMvVnoxNStnVUdxWjJmNWUyQ1VtMVBGT21J?=
 =?utf-8?B?MkdCUlVWby91Qlkxb2Vxd1c1NkdnTkpDcENQdG5JSFBLMDNZWTBVM3hkT0Fi?=
 =?utf-8?B?VHkrcGZxQnpicGJrQjRVYWFBcE1KUTlmUWtkV1pJbTFSTnRURDhEL094WFhr?=
 =?utf-8?B?OS9tN1ozc29zVkVBanBPL2RwTk5kTk5SRVA5V01zUkt3eWZrVDFoQWhoZFJn?=
 =?utf-8?B?ek1tWkM1T3owK25ncy9IVGhjYnNZdXVkeExzVmdIc3lKNFNXNm16Rkl6TVV1?=
 =?utf-8?B?YSsxRlhYMVlRbVZXSFNCK2xiZnFwbHpPb2ptNEJGc25sbXhEYSs5VDJBeS9n?=
 =?utf-8?B?Z2g5K3A0MHZ3R1F1NXJOQ2x1MEx3ZzhvSmhzQ2ZmMVR6bW9hWnQycGNwcnRJ?=
 =?utf-8?B?Mll1aXZxNE9KSVZPQmRWRm5qRG5IMmRuc3RoM2o1YmZkcTVqYnFjTUdzb29R?=
 =?utf-8?B?dlpXL1RMSGxPNm1TZ2dia1F2SWc4OTVzcVRwNml4SEtKcjlsVWdyVFZaWjlD?=
 =?utf-8?B?NVR5b1h3S2VGTmltakJReU43RkloUE01SUo0RXRBTjNsbGE3Q2tpMC9YeUVL?=
 =?utf-8?B?anRaTm1PZVhuVk55OEVhNFhiRm9qbUJveFVjc3JUWWRvTzNoMjNPWStZdzJh?=
 =?utf-8?B?RjBHRlB2MDRYaUc4RE42ajNyTi83K25LOSswS0hiM1pPbWZscHkvTjZveFJP?=
 =?utf-8?B?Ykl5c3VSK2JFVG1OQWhIcmxFYytscHl1ME9kZHZXM2psUUFKeTUwRGxTZlFx?=
 =?utf-8?B?VUEvZEVZR1cvZTY3dUx1cGc0NVJZVFUwdW1PVnh0a2wwT1FBOGJkWHZITkRI?=
 =?utf-8?Q?BSUFisjIFWGQ67zVOPTsaWy9evsEbVjazKsmJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <431AA82043B3474389D783A9CDD6AEB9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff48bc-341a-4d51-2190-08da49f245a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 08:30:12.5815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XW7bgtbtQXU7eiNe7Y+RzBbujS9Pt3+WeRzIwLkG1aa3jSH1JBxwRvhqlj8X+v0dvzK/ygbxEld7bL361AXX23WA8d2yWnCtI6gdD7C7dvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2348
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.i
 ntel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Song Liu <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, Jarkko Sakkinen <jarkko@kernel.org>, "Eric W.
 Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King
 \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert 
 Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA2LzIwMjIgw6AgMDE6NTksIEphcmtrbyBTYWtraW5lbiBhIMOpY3JpdMKgOg0K
PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGphcmtrb0Bwcm9maWFuLmNvbS4gTGVh
cm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5k
ZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBUcmFjaW5nIHdpdGgga3Byb2JlcyB3aGlsZSBydW5u
aW5nIGEgbW9ub2xpdGhpYyBrZXJuZWwgaXMgY3VycmVudGx5DQo+IGltcG9zc2libGUgYmVjYXVz
ZSBDT05GSUdfS1BST0JFUyBpcyBkZXBlbmRlbnQgb2YgQ09ORklHX01PRFVMRVMuICBUaGlzDQo+
IGRlcGVuZGVuY3kgaXMgYSByZXN1bHQgb2Yga3Byb2JlcyBjb2RlIHVzaW5nIHRoZSBtb2R1bGUg
YWxsb2NhdG9yIGZvciB0aGUNCj4gdHJhbXBvbGluZSBjb2RlLg0KPiANCj4gRGV0YWNoaW5nIGtw
cm9iZXMgZnJvbSBtb2R1bGVzIGhlbHBzIHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBzcGFjZSwN
Cj4gZS5nLiB3aGVuIGRldmVsb3BpbmcgbmV3IGNvcmUga2VybmVsIGZlYXR1cmVzLCB3aGlsZSBz
dGlsbCBoYXZpbmcgYWxsDQo+IHRoZSBuaWNlIHRyYWNpbmcgY2FwYWJpbGl0aWVzLg0KDQpOaWNl
IGlkZWEsIGNvdWxkIGFsc28gYmUgbmljZSB0byBoYXZlIEJQRiB3aXRob3V0IE1PRFVMRVMuDQoN
Cj4gDQo+IEZvciBrZXJuZWwvIGFuZCBhcmNoLyosIG1vdmUgbW9kdWxlX2FsbG9jKCkgYW5kIG1v
ZHVsZV9tZW1mcmVlKCkgdG8NCj4gbW9kdWxlX2FsbG9jLmMsIGFuZCBjb21waWxlIGFzIHBhcnQg
b2Ygdm1saW51eCB3aGVuIGVpdGhlciBDT05GSUdfTU9EVUxFUw0KPiBvciBDT05GSUdfS1BST0JF
UyBpcyBlbmFibGVkLiAgSW4gYWRkaXRpb24sIGZsYWcga2VybmVsIG1vZHVsZSBzcGVjaWZpYw0K
PiBjb2RlIHdpdGggQ09ORklHX01PRFVMRVMuDQoNCk5pY2UsIGJ1dCB0aGF0J3Mgbm90IGVub3Vn
aC4gWW91IGhhdmUgdG8gYXVkaXQgZXZlcnkgcGVhY2Ugb2YgY29kZSB0aGF0IA0KZGVwZW5kcyBv
biBDT05GSUdfTU9EVUxFUyBhbmQgc2VlIGlmIGl0IG5lZWRzIHRvIGJlIGFjdGl2YXRlZCBmb3Ig
eW91ciANCmNhc2UgYXMgd2VsbC4gRm9yIGluc3RhbmNlIHNvbWUgcG93ZXJwYyBjb25maWd1cmF0
aW9ucyBkb24ndCBob25vciBleGVjIA0KcGFnZSBmYXVsdHMgb24ga2VybmVsIHBhZ2VzIHdoZW4g
Q09ORklHX01PRFVMRVMgaXMgbm90IHNlbGVjdGVkLg0KDQo+IA0KPiBBcyB0aGUgcmVzdWx0LCBr
cHJvYmVzIGNhbiBiZSB1c2VkIHdpdGggYSBtb25vbGl0aGljIGtlcm5lbC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFya2tvQHByb2ZpYW4uY29tPg0KDQpJIHRoaW5r
IHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNwbGl0IGluIGEgc2V2ZXJhbCBwYXRjaGVzLCBvbmUgKG9y
IGV2ZW4gDQpvbmUgcGVyIGFyY2hpdGVjdHVyZXMgPykgdG8gbWFrZSBtb2R1bGVzX2FsbG9jKCkg
aW5kZXBlbmRhbnQgb2YgDQpDT05GSUdfTU9EVUxFUywgdGhlbiBhIHBhdGNoIHRvIG1ha2UgQ09O
RklHX0tQUk9CRVMgaW5kZXBlbmRhbnQgb24gDQpDT05GSUdfTU9VRExFUy4NCg0KDQo+IC0tLQ0K
PiBUZXN0ZWQgd2l0aCB0aGUgaGVscCBvZiBCdWlsZFJvb3QgYW5kIFFFTVU6DQo+IC0gYXJtIChm
dW5jdGlvbiB0cmFjZXIpDQo+IC0gYXJtNjQgKGZ1bmN0aW9uIHRyYWNlcikNCj4gLSBtaXBzIChm
dW5jdGlvbiB0cmFjZXIpDQo+IC0gcG93ZXJwYyAoZnVuY3Rpb24gdHJhY2VyKQ0KPiAtIHJpc2N2
IChmdW5jdGlvbiB0cmFjZXIpDQo+IC0gczM5MCAoZnVuY3Rpb24gdHJhY2VyKQ0KPiAtIHNwYXJj
IChmdW5jdGlvbiB0cmFjZXIpDQo+IC0geDg2IChmdW5jdGlvbiB0cmFjZXIpDQo+IC0gc2ggKGZ1
bmN0aW9uIHRyYWNlciwgZm9yIHRoZSAicHVyZSIga2VybmVsL21vZHVsZXNfYWxsb2MuYyBwYXRo
KQ0KPiAtLS0NCj4gICBhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0K
PiAgIGFyY2gvYXJtL2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgfCAgNSArKysNCj4gICBhcmNo
L2FybS9rZXJuZWwvbW9kdWxlLmMgICAgICAgICAgIHwgMzIgLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IGFyY2gvYXJtL2tlcm5lbC9tb2R1bGVfYWxsb2MuYyAgICAgfCA0MiArKysrKysrKysrKysrKysr
KysrKw0KPiAgIGFyY2gvYXJtNjQva2VybmVsL01ha2VmaWxlICAgICAgICAgfCAgNSArKysNCj4g
ICBhcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyAgICAgICAgIHwgNDcgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gICBhcmNoL2FybTY0L2tlcm5lbC9tb2R1bGVfYWxsb2MuYyAgIHwgNTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIGFyY2gvbWlwcy9rZXJuZWwvTWFrZWZpbGUg
ICAgICAgICAgfCAgNSArKysNCj4gICBhcmNoL21pcHMva2VybmVsL21vZHVsZS5jICAgICAgICAg
IHwgIDkgLS0tLS0NCj4gICBhcmNoL21pcHMva2VybmVsL21vZHVsZV9hbGxvYy5jICAgIHwgMTgg
KysrKysrKysrDQo+ICAgYXJjaC9wYXJpc2Mva2VybmVsL01ha2VmaWxlICAgICAgICB8ICA1ICsr
Kw0KPiAgIGFyY2gvcGFyaXNjL2tlcm5lbC9tb2R1bGUuYyAgICAgICAgfCAxMSAtLS0tLS0NCj4g
ICBhcmNoL3BhcmlzYy9rZXJuZWwvbW9kdWxlX2FsbG9jLmMgIHwgMjMgKysrKysrKysrKysNCj4g
ICBhcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlICAgICAgIHwgIDUgKysrDQo+ICAgYXJjaC9w
b3dlcnBjL2tlcm5lbC9tb2R1bGUuYyAgICAgICB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlX2FsbG9jLmMgfCA0NyArKysrKysrKysrKysrKysr
KysrKysrKw0KDQpZb3UgYXJlIG1pc3NpbmcgbmVjZXNzYXJ5IGNoYW5nZXMgZm9yIHBvd2VycGMu
DQoNCk9uIHBvd2VycGMgOHh4IG9yIHBvd2VycGMgNjAzLCBzb2Z0d2FyZSBUTEIgaGFuZGxlcnMg
ZG9uJ3QgaG9ub3IgDQppbnN0cnVjdGlvbiBUTEIgbWlzcyB3aGVuIENPTkZJR19NT0RVTEVTIGFy
ZSBub3Qgc2V0LCBsb29rIGludG8gDQpoZWFkXzh4eC5TIGFuZCBoZWFkX2Jvb2szc18zMi5TDQoN
Ck9uIHBvd2VycGMgYm9vazNzLzMyLCBhbGwga2VybmVsIHNwYWNlIGlzIHNldCB0byBOWCBleGNl
cHQgdGhlIG1vZHVsZSANCnNlZ21lbnQuIFdoZW4gQ09ORklHX01PRFVMRVMgaXMgYWxsIHNwYWNl
IGlzIHNldCBOWC4gU2VlIA0KbW11X21hcmtfaW5pdG1lbV9ueCgpIGFuZCBpc19tb2R1bGVfc2Vn
bWVudCgpLg0KDQoNCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgIHwgIDUg
KysrDQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgICAgICAgICB8IDEwIC0tLS0tDQo+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlX2FsbG9jLmMgICB8IDE5ICsrKysrKysrKysNCj4g
ICBhcmNoL3MzOTAva2VybmVsL01ha2VmaWxlICAgICAgICAgIHwgIDUgKysrDQo+ICAgYXJjaC9z
MzkwL2tlcm5lbC9tb2R1bGUuYyAgICAgICAgICB8IDE3IC0tLS0tLS0tLQ0KPiAgIGFyY2gvczM5
MC9rZXJuZWwvbW9kdWxlX2FsbG9jLmMgICAgfCAzMyArKysrKysrKysrKysrKysrDQo+ICAgYXJj
aC9zcGFyYy9rZXJuZWwvTWFrZWZpbGUgICAgICAgICB8ICA1ICsrKw0KPiAgIGFyY2gvc3BhcmMv
a2VybmVsL21vZHVsZS5jICAgICAgICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Nw
YXJjL2tlcm5lbC9tb2R1bGVfYWxsb2MuYyAgIHwgMzkgKysrKysrKysrKysrKysrKysrKw0KPiAg
IGFyY2gveDg2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgfCAgNSArKysNCj4gICBhcmNoL3g4
Ni9rZXJuZWwvbW9kdWxlLmMgICAgICAgICAgIHwgNTAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAgYXJjaC94ODYva2VybmVsL21vZHVsZV9hbGxvYy5jICAgICB8IDYxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgIGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgfCAgNSArKysNCj4gICBrZXJuZWwva3Byb2Jlcy5jICAgICAgICAgICAgICAgICAgIHwgMTAg
KysrKysNCj4gICBrZXJuZWwvbW9kdWxlL21haW4uYyAgICAgICAgICAgICAgIHwgMTcgLS0tLS0t
LS0tDQo+ICAga2VybmVsL21vZHVsZV9hbGxvYy5jICAgICAgICAgICAgICB8IDI2ICsrKysrKysr
KysrKysNCj4gICBrZXJuZWwvdHJhY2UvdHJhY2Vfa3Byb2JlLmMgICAgICAgIHwgMTAgKysrKy0N
Cj4gICAzMyBmaWxlcyBjaGFuZ2VkLCA0MzQgaW5zZXJ0aW9ucygrKSwgMjYyIGRlbGV0aW9ucygt
KQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9rZXJuZWwvbW9kdWxlX2FsbG9jLmMN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9rZXJuZWwvbW9kdWxlX2FsbG9jLmMN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9taXBzL2tlcm5lbC9tb2R1bGVfYWxsb2MuYw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3BhcmlzYy9rZXJuZWwvbW9kdWxlX2FsbG9jLmMN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfYWxsb2Mu
Yw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGVfYWxsb2Mu
Yw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3MzOTAva2VybmVsL21vZHVsZV9hbGxvYy5j
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvc3BhcmMva2VybmVsL21vZHVsZV9hbGxvYy5j
DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L2tlcm5lbC9tb2R1bGVfYWxsb2MuYw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBrZXJuZWwvbW9kdWxlX2FsbG9jLmMNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL0tjb25maWcgYi9hcmNoL0tjb25maWcNCj4gaW5kZXggZmNmOWE0MWE0ZWY1
Li5lOGUzZTc5OThhMmUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvS2NvbmZpZw0KPiArKysgYi9hcmNo
L0tjb25maWcNCj4gQEAgLTM5LDcgKzM5LDYgQEAgY29uZmlnIEdFTkVSSUNfRU5UUlkNCj4gDQo+
ICAgY29uZmlnIEtQUk9CRVMNCj4gICAgICAgICAgYm9vbCAiS3Byb2JlcyINCj4gLSAgICAgICBk
ZXBlbmRzIG9uIE1PRFVMRVMNCj4gICAgICAgICAgZGVwZW5kcyBvbiBIQVZFX0tQUk9CRVMNCj4g
ICAgICAgICAgc2VsZWN0IEtBTExTWU1TDQo+ICAgICAgICAgIHNlbGVjdCBUQVNLU19SQ1UgaWYg
UFJFRU1QVElPTg0KDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxl
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZQ0KPiBpbmRleCAyZTJhMmE5YmNmNDMuLjVh
ODExY2RmMjMwYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZQ0K
PiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+IEBAIC0xMDMsNiArMTAzLDEx
IEBAIG9iai0kKENPTkZJR19ISUJFUk5BVElPTikgICs9IHN3c3VzcF8kKEJJVFMpLm8NCj4gICBl
bmRpZg0KPiAgIG9iajY0LSQoQ09ORklHX0hJQkVSTkFUSU9OKSAgICArPSBzd3N1c3BfYXNtNjQu
bw0KPiAgIG9iai0kKENPTkZJR19NT0RVTEVTKSAgICAgICAgICArPSBtb2R1bGUubyBtb2R1bGVf
JChCSVRTKS5vDQo+ICtpZmVxICgkKENPTkZJR19NT0RVTEVTKSx5KQ0KPiArb2JqLXkgICAgICAg
ICAgICAgICAgICAgICAgICAgICs9IG1vZHVsZV9hbGxvYy5vDQo+ICtlbHNlDQo+ICtvYmotJChD
T05GSUdfS1BST0JFUykgICAgICAgICAgKz0gbW9kdWxlX2FsbG9jLm8NCj4gK2VuZGlmDQoNCldo
eSBub3QganVzdCBkbzoNCg0Kb2JqLSQoQ09ORklHX01PRFVMRVMpICAgICAgICAgICs9IG1vZHVs
ZV9hbGxvYy5vDQpvYmotJChDT05GSUdfS1BST0JFUykgICAgICAgICAgKz0gbW9kdWxlX2FsbG9j
Lm8NCg0KSG93ZXZlciwgYSBuZXcgaGlkZGVuIGNvbmZpZyBpdGVtIChlZzogQ09ORklHX0RZTkFN
SUNfVEVYVCkgc2VsZWN0ZWQgYnkgDQpib3RoIENPTkZJR19NT0RVTEVTIGFuZCBDT05GSUdfS1BS
T0JFUyB3b3VsZCBtYWtlIGxpa2UgZWFzaWVyIHdoZW4gDQp5b3UnbGwgY29tZSB0byBkbyB0aGUg
Y2hhbmdlcyByZXF1aXJlZC4NCg0KDQoNCj4gICBvYmotJChDT05GSUdfNDR4KSAgICAgICAgICAg
ICAgKz0gY3B1X3NldHVwXzQ0eC5vDQo+ICAgb2JqLSQoQ09ORklHX1BQQ19GU0xfQk9PSzNFKSAg
ICs9IGNwdV9zZXR1cF9mc2xfYm9va2Uubw0KPiAgIG9iai0kKENPTkZJR19QUENfRE9PUkJFTEwp
ICAgICArPSBkYmVsbC5vDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVs
ZS5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYw0KPiBpbmRleCBmNmQ2YWUwYTE2OTIu
LmIzMGUwMDk2NGE2MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5jDQo+IEBAIC04OCw0MCArODgs
MyBAQCBpbnQgbW9kdWxlX2ZpbmFsaXplKGNvbnN0IEVsZl9FaGRyICpoZHIsDQo+IA0KPiAgICAg
ICAgICByZXR1cm4gMDsNCj4gICB9DQo+IC0NCj4gLXN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCAqDQo+IC1fX21vZHVsZV9hbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLCBib29sIG5vd2FybikNCj4gLXsNCj4gLSAgICAgICBw
Z3Byb3RfdCBwcm90ID0gc3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpID8gUEFHRV9LRVJORUwg
OiBQQUdFX0tFUk5FTF9FWEVDOw0KPiAtICAgICAgIGdmcF90IGdmcCA9IEdGUF9LRVJORUwgfCAo
bm93YXJuID8gX19HRlBfTk9XQVJOIDogMCk7DQo+IC0NCj4gLSAgICAgICAvKg0KPiAtICAgICAg
ICAqIERvbid0IGRvIGh1Z2UgcGFnZSBhbGxvY2F0aW9ucyBmb3IgbW9kdWxlcyB5ZXQgdW50aWwg
bW9yZSB0ZXN0aW5nDQo+IC0gICAgICAgICogaXMgZG9uZS4gU1RSSUNUX01PRFVMRV9SV1ggbWF5
IHJlcXVpcmUgZXh0cmEgd29yayB0byBzdXBwb3J0IHRoaXMNCj4gLSAgICAgICAgKiB0b28uDQo+
IC0gICAgICAgICovDQo+IC0gICAgICAgcmV0dXJuIF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUs
IDEsIHN0YXJ0LCBlbmQsIGdmcCwgcHJvdCwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgVk1fRkxVU0hfUkVTRVRfUEVSTVMsDQo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE5VTUFfTk9fTk9ERSwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsN
Cj4gLX0NCj4gLQ0KPiAtdm9pZCAqbW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4g
LXsNCj4gLSNpZmRlZiBNT0RVTEVTX1ZBRERSDQo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBsaW1p
dCA9ICh1bnNpZ25lZCBsb25nKV9ldGV4dCAtIFNaXzMyTTsNCj4gLSAgICAgICB2b2lkICpwdHIg
PSBOVUxMOw0KPiAtDQo+IC0gICAgICAgQlVJTERfQlVHX09OKFRBU0tfU0laRSA+IE1PRFVMRVNf
VkFERFIpOw0KPiAtDQo+IC0gICAgICAgLyogRmlyc3QgdHJ5IHdpdGhpbiAzMk0gbGltaXQgZnJv
bSBfZXRleHQgdG8gYXZvaWQgYnJhbmNoIHRyYW1wb2xpbmVzICovDQo+IC0gICAgICAgaWYgKE1P
RFVMRVNfVkFERFIgPCBQQUdFX09GRlNFVCAmJiBNT0RVTEVTX0VORCA+IGxpbWl0KQ0KPiAtICAg
ICAgICAgICAgICAgcHRyID0gX19tb2R1bGVfYWxsb2Moc2l6ZSwgbGltaXQsIE1PRFVMRVNfRU5E
LCB0cnVlKTsNCj4gLQ0KPiAtICAgICAgIGlmICghcHRyKQ0KPiAtICAgICAgICAgICAgICAgcHRy
ID0gX19tb2R1bGVfYWxsb2Moc2l6ZSwgTU9EVUxFU19WQUREUiwgTU9EVUxFU19FTkQsIGZhbHNl
KTsNCj4gLQ0KPiAtICAgICAgIHJldHVybiBwdHI7DQo+IC0jZWxzZQ0KPiAtICAgICAgIHJldHVy
biBfX21vZHVsZV9hbGxvYyhzaXplLCBWTUFMTE9DX1NUQVJULCBWTUFMTE9DX0VORCwgZmFsc2Up
Ow0KPiAtI2VuZGlmDQo+IC19DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL21v
ZHVsZV9hbGxvYy5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfYWxsb2MuYw0KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ4NTQxYzI3Y2U0Ng0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlX2FsbG9jLmMN
Cj4gQEAgLTAsMCArMSw0NyBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb3ItbGF0ZXINCj4gKy8qDQo+ICsgKiAgS2VybmVsIG1vZHVsZSBoZWxwIGZvciBwb3dlcnBj
Lg0KPiArICogIENvcHlyaWdodCAoQykgMjAwMSwgMjAwMyBSdXN0eSBSdXNzZWxsIElCTSBDb3Jw
b3JhdGlvbi4NCj4gKyAqICBDb3B5cmlnaHQgKEMpIDIwMDggRnJlZXNjYWxlIFNlbWljb25kdWN0
b3IsIEluYy4NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4NCj4gKyNpbmNs
dWRlIDxsaW51eC9tb2R1bGVsb2FkZXIuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+
DQo+ICsNCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCAqDQo+ICtfX21vZHVsZV9hbGxv
Yyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcg
ZW5kLCBib29sIG5vd2FybikNCj4gK3sNCj4gKyAgICAgICBwZ3Byb3RfdCBwcm90ID0gc3RyaWN0
X21vZHVsZV9yd3hfZW5hYmxlZCgpID8gUEFHRV9LRVJORUwgOiBQQUdFX0tFUk5FTF9FWEVDOw0K
PiArICAgICAgIGdmcF90IGdmcCA9IEdGUF9LRVJORUwgfCAobm93YXJuID8gX19HRlBfTk9XQVJO
IDogMCk7DQo+ICsNCj4gKyAgICAgICAvKg0KPiArICAgICAgICAqIERvbid0IGRvIGh1Z2UgcGFn
ZSBhbGxvY2F0aW9ucyBmb3IgbW9kdWxlcyB5ZXQgdW50aWwgbW9yZSB0ZXN0aW5nDQo+ICsgICAg
ICAgICogaXMgZG9uZS4gU1RSSUNUX01PRFVMRV9SV1ggbWF5IHJlcXVpcmUgZXh0cmEgd29yayB0
byBzdXBwb3J0IHRoaXMNCj4gKyAgICAgICAgKiB0b28uDQo+ICsgICAgICAgICovDQo+ICsgICAg
ICAgcmV0dXJuIF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUsIDEsIHN0YXJ0LCBlbmQsIGdmcCwg
cHJvdCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVk1fRkxVU0hfUkVT
RVRfUEVSTVMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTUFfTk9f
Tk9ERSwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsNCj4gK30NCj4gKw0KPiArdm9pZCAq
bW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4gK3sNCj4gKyNpZmRlZiBNT0RVTEVT
X1ZBRERSDQoNCklzIE1PRFVMRVNfVkFERFIgZGVmaW5lZCBldmVuIHdoZW4gQ09ORklHX01PRFVM
RVMgaXMgbm90ID8NCg0KPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbGltaXQgPSAodW5zaWduZWQg
bG9uZylfZXRleHQgLSBTWl8zMk07DQo+ICsgICAgICAgdm9pZCAqcHRyID0gTlVMTDsNCj4gKw0K
PiArICAgICAgIEJVSUxEX0JVR19PTihUQVNLX1NJWkUgPiBNT0RVTEVTX1ZBRERSKTsNCj4gKw0K
PiArICAgICAgIC8qIEZpcnN0IHRyeSB3aXRoaW4gMzJNIGxpbWl0IGZyb20gX2V0ZXh0IHRvIGF2
b2lkIGJyYW5jaCB0cmFtcG9saW5lcyAqLw0KPiArICAgICAgIGlmIChNT0RVTEVTX1ZBRERSIDwg
UEFHRV9PRkZTRVQgJiYgTU9EVUxFU19FTkQgPiBsaW1pdCkNCj4gKyAgICAgICAgICAgICAgIHB0
ciA9IF9fbW9kdWxlX2FsbG9jKHNpemUsIGxpbWl0LCBNT0RVTEVTX0VORCwgdHJ1ZSk7DQo+ICsN
Cj4gKyAgICAgICBpZiAoIXB0cikNCj4gKyAgICAgICAgICAgICAgIHB0ciA9IF9fbW9kdWxlX2Fs
bG9jKHNpemUsIE1PRFVMRVNfVkFERFIsIE1PRFVMRVNfRU5ELCBmYWxzZSk7DQo+ICsNCj4gKyAg
ICAgICByZXR1cm4gcHRyOw0KPiArI2Vsc2UNCj4gKyAgICAgICByZXR1cm4gX19tb2R1bGVfYWxs
b2Moc2l6ZSwgVk1BTExPQ19TVEFSVCwgVk1BTExPQ19FTkQsIGZhbHNlKTsNCj4gKyNlbmRpZg0K
PiArfQ0KDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvTWFrZWZpbGUgYi9rZXJuZWwvTWFrZWZpbGUN
Cj4gaW5kZXggMzE4Nzg5YzcyOGQzLi4yOTgxZmU0MjA2MGQgMTAwNjQ0DQo+IC0tLSBhL2tlcm5l
bC9NYWtlZmlsZQ0KPiArKysgYi9rZXJuZWwvTWFrZWZpbGUNCj4gQEAgLTUzLDYgKzUzLDExIEBA
IG9iai15ICs9IGxpdmVwYXRjaC8NCj4gICBvYmoteSArPSBkbWEvDQo+ICAgb2JqLXkgKz0gZW50
cnkvDQo+ICAgb2JqLSQoQ09ORklHX01PRFVMRVMpICs9IG1vZHVsZS8NCj4gK2lmZXEgKCQoQ09O
RklHX01PRFVMRVMpLHkpDQo+ICtvYmoteSArPSBtb2R1bGVfYWxsb2Mubw0KPiArZWxzZQ0KPiAr
b2JqLSQoQ09ORklHX0tQUk9CRVMpICs9IG1vZHVsZV9hbGxvYy5vDQo+ICtlbmRpZg0KDQpTYW1l
IGNvbW1lbnQsIGNvdWxkIGJlOg0KDQpvYmotJChDT05GSUdfTU9EVUxFUykgICAgICAgICAgKz0g
bW9kdWxlX2FsbG9jLm8NCm9iai0kKENPTkZJR19LUFJPQkVTKSAgICAgICAgICArPSBtb2R1bGVf
YWxsb2Mubw0KDQo+IA0KPiAgIG9iai0kKENPTkZJR19LQ01QKSArPSBrY21wLm8NCj4gICBvYmot
JChDT05GSUdfRlJFRVpFUikgKz0gZnJlZXplci5vDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwva3By
b2Jlcy5jIGIva2VybmVsL2twcm9iZXMuYw0KPiBpbmRleCBmMjE0ZjhjMDg4ZWQuLjNmOTg3NjM3
NGNkMyAxMDA2NDQNCj4gLS0tIGEva2VybmVsL2twcm9iZXMuYw0KPiArKysgYi9rZXJuZWwva3By
b2Jlcy5jDQo+IEBAIC0xNTY5LDYgKzE1NjksNyBAQCBzdGF0aWMgaW50IGNoZWNrX2twcm9iZV9h
ZGRyZXNzX3NhZmUoc3RydWN0IGtwcm9iZSAqcCwNCj4gICAgICAgICAgICAgICAgICBnb3RvIG91
dDsNCj4gICAgICAgICAgfQ0KPiANCj4gKyNpZmRlZiBDT05GSUdfTU9EVUxFUw0KPiAgICAgICAg
ICAvKiBDaGVjayBpZiAncCcgaXMgcHJvYmluZyBhIG1vZHVsZS4gKi8NCj4gICAgICAgICAgKnBy
b2JlZF9tb2QgPSBfX21vZHVsZV90ZXh0X2FkZHJlc3MoKHVuc2lnbmVkIGxvbmcpIHAtPmFkZHIp
Ow0KPiAgICAgICAgICBpZiAoKnByb2JlZF9tb2QpIHsNCj4gQEAgLTE1OTIsNiArMTU5Myw4IEBA
IHN0YXRpYyBpbnQgY2hlY2tfa3Byb2JlX2FkZHJlc3Nfc2FmZShzdHJ1Y3Qga3Byb2JlICpwLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsNCj4gICAgICAgICAgICAg
ICAgICB9DQo+ICAgICAgICAgIH0NCj4gKyNlbmRpZg0KPiArDQo+ICAgb3V0Og0KPiAgICAgICAg
ICBwcmVlbXB0X2VuYWJsZSgpOw0KPiAgICAgICAgICBqdW1wX2xhYmVsX3VubG9jaygpOw0KPiBA
QCAtMjQ3NSw2ICsyNDc4LDcgQEAgaW50IGtwcm9iZV9hZGRfYXJlYV9ibGFja2xpc3QodW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpDQo+ICAgICAgICAgIHJldHVybiAwOw0K
PiAgIH0NCj4gDQo+ICsjaWZkZWYgQ09ORklHX01PRFVMRVMNCj4gICAvKiBSZW1vdmUgYWxsIHN5
bWJvbHMgaW4gZ2l2ZW4gYXJlYSBmcm9tIGtwcm9iZSBibGFja2xpc3QgKi8NCj4gICBzdGF0aWMg
dm9pZCBrcHJvYmVfcmVtb3ZlX2FyZWFfYmxhY2tsaXN0KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kKQ0KPiAgIHsNCj4gQEAgLTI0OTIsNiArMjQ5Niw3IEBAIHN0YXRpYyB2
b2lkIGtwcm9iZV9yZW1vdmVfa3N5bV9ibGFja2xpc3QodW5zaWduZWQgbG9uZyBlbnRyeSkNCj4g
ICB7DQo+ICAgICAgICAgIGtwcm9iZV9yZW1vdmVfYXJlYV9ibGFja2xpc3QoZW50cnksIGVudHJ5
ICsgMSk7DQo+ICAgfQ0KPiArI2VuZGlmIC8qIENPTkZJR19NT0RVTEVTICovDQo+IA0KPiAgIGlu
dCBfX3dlYWsgYXJjaF9rcHJvYmVfZ2V0X2thbGxzeW0odW5zaWduZWQgaW50ICpzeW1udW0sIHVu
c2lnbmVkIGxvbmcgKnZhbHVlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjaGFyICp0eXBlLCBjaGFyICpzeW0pDQo+IEBAIC0yNTU3LDYgKzI1NjIsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBwb3B1bGF0ZV9rcHJvYmVfYmxhY2tsaXN0KHVuc2lnbmVkIGxvbmcgKnN0YXJ0
LA0KPiAgICAgICAgICByZXR1cm4gcmV0ID8gOiBhcmNoX3BvcHVsYXRlX2twcm9iZV9ibGFja2xp
c3QoKTsNCj4gICB9DQo+IA0KPiArI2lmZGVmIENPTkZJR19NT0RVTEVTDQo+ICAgc3RhdGljIHZv
aWQgYWRkX21vZHVsZV9rcHJvYmVfYmxhY2tsaXN0KHN0cnVjdCBtb2R1bGUgKm1vZCkNCj4gICB7
DQo+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsIGVuZDsNCj4gQEAgLTI2NTgsNiArMjY2
NCw3IEBAIHN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sga3Byb2JlX21vZHVsZV9uYiA9IHsN
Cj4gICAgICAgICAgLm5vdGlmaWVyX2NhbGwgPSBrcHJvYmVzX21vZHVsZV9jYWxsYmFjaywNCj4g
ICAgICAgICAgLnByaW9yaXR5ID0gMA0KPiAgIH07DQo+ICsjZW5kaWYgLyogQ09ORklHX01PRFVM
RVMgKi8NCj4gDQo+ICAgdm9pZCBrcHJvYmVfZnJlZV9pbml0X21lbSh2b2lkKQ0KPiAgIHsNCj4g
QEAgLTI3MTcsOCArMjcyNCwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBpbml0X2twcm9iZXModm9p
ZCkNCj4gICAgICAgICAgZXJyID0gYXJjaF9pbml0X2twcm9iZXMoKTsNCj4gICAgICAgICAgaWYg
KCFlcnIpDQo+ICAgICAgICAgICAgICAgICAgZXJyID0gcmVnaXN0ZXJfZGllX25vdGlmaWVyKCZr
cHJvYmVfZXhjZXB0aW9uc19uYik7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfTU9EVUxFUw0KPiAg
ICAgICAgICBpZiAoIWVycikNCj4gICAgICAgICAgICAgICAgICBlcnIgPSByZWdpc3Rlcl9tb2R1
bGVfbm90aWZpZXIoJmtwcm9iZV9tb2R1bGVfbmIpOw0KPiArI2VuZGlmDQo+IA0KPiAgICAgICAg
ICBrcHJvYmVzX2luaXRpYWxpemVkID0gKGVyciA9PSAwKTsNCj4gICAgICAgICAga3Byb2JlX3N5
c2N0bHNfaW5pdCgpOw0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZS9tYWluLmMgYi9rZXJu
ZWwvbW9kdWxlL21haW4uYw0KPiBpbmRleCBmZWQ1OGQzMDcyNWQuLjdmYTE4MmI3ODU1MCAxMDA2
NDQNCj4gLS0tIGEva2VybmVsL21vZHVsZS9tYWluLmMNCj4gKysrIGIva2VybmVsL21vZHVsZS9t
YWluLmMNCj4gQEAgLTExMjEsMTYgKzExMjEsNiBAQCByZXNvbHZlX3N5bWJvbF93YWl0KHN0cnVj
dCBtb2R1bGUgKm1vZCwNCj4gICAgICAgICAgcmV0dXJuIGtzeW07DQo+ICAgfQ0KPiANCj4gLXZv
aWQgX193ZWFrIG1vZHVsZV9tZW1mcmVlKHZvaWQgKm1vZHVsZV9yZWdpb24pDQo+IC17DQo+IC0g
ICAgICAgLyoNCj4gLSAgICAgICAgKiBUaGlzIG1lbW9yeSBtYXkgYmUgUk8sIGFuZCBmcmVlaW5n
IFJPIG1lbW9yeSBpbiBhbiBpbnRlcnJ1cHQgaXMgbm90DQo+IC0gICAgICAgICogc3VwcG9ydGVk
IGJ5IHZtYWxsb2MuDQo+IC0gICAgICAgICovDQo+IC0gICAgICAgV0FSTl9PTihpbl9pbnRlcnJ1
cHQoKSk7DQo+IC0gICAgICAgdmZyZWUobW9kdWxlX3JlZ2lvbik7DQo+IC19DQo+IC0NCj4gICB2
b2lkIF9fd2VhayBtb2R1bGVfYXJjaF9jbGVhbnVwKHN0cnVjdCBtb2R1bGUgKm1vZCkNCj4gICB7
DQo+ICAgfQ0KPiBAQCAtMTYwNiwxMyArMTU5Niw2IEBAIHN0YXRpYyB2b2lkIGR5bmFtaWNfZGVi
dWdfcmVtb3ZlKHN0cnVjdCBtb2R1bGUgKm1vZCwgc3RydWN0IF9kZGVidWcgKmRlYnVnKQ0KPiAg
ICAgICAgICAgICAgICAgIGRkZWJ1Z19yZW1vdmVfbW9kdWxlKG1vZC0+bmFtZSk7DQo+ICAgfQ0K
PiANCj4gLXZvaWQgKiBfX3dlYWsgbW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4g
LXsNCj4gLSAgICAgICByZXR1cm4gX192bWFsbG9jX25vZGVfcmFuZ2Uoc2l6ZSwgMSwgVk1BTExP
Q19TVEFSVCwgVk1BTExPQ19FTkQsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJO
RUwsIFBBR0VfS0VSTkVMX0VYRUMsIFZNX0ZMVVNIX1JFU0VUX1BFUk1TLA0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICBOVU1BX05PX05PREUsIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7
DQo+IC19DQo+IC0NCj4gICBib29sIF9fd2VhayBtb2R1bGVfaW5pdF9zZWN0aW9uKGNvbnN0IGNo
YXIgKm5hbWUpDQo+ICAgew0KPiAgICAgICAgICByZXR1cm4gc3Ryc3RhcnRzKG5hbWUsICIuaW5p
dCIpOw0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL21vZHVsZV9hbGxvYy5jIGIva2VybmVsL21vZHVs
ZV9hbGxvYy5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
MjZhNGM2MDk5OGFkDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIva2VybmVsL21vZHVsZV9hbGxv
Yy5jDQo+IEBAIC0wLDAgKzEsMjYgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9yLWxhdGVyDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChDKSAyMDAyIFJpY2hhcmQg
SGVuZGVyc29uDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMDEgUnVzdHkgUnVzc2VsbCwgMjAwMiwg
MjAxMCBSdXN0eSBSdXNzZWxsIElCTS4NCj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSA8bGludXgv
bW0uaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVsb2FkZXIuaD4NCj4gKyNpbmNsdWRlIDxs
aW51eC92bWFsbG9jLmg+DQo+ICsNCj4gK3ZvaWQgKiBfX3dlYWsgbW9kdWxlX2FsbG9jKHVuc2ln
bmVkIGxvbmcgc2l6ZSkNCj4gK3sNCj4gKyAgICAgICByZXR1cm4gX192bWFsbG9jX25vZGVfcmFu
Z2Uoc2l6ZSwgMSwgVk1BTExPQ19TVEFSVCwgVk1BTExPQ19FTkQsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIEdGUF9LRVJORUwsIFBBR0VfS0VSTkVMX0VYRUMsIFZNX0ZMVVNIX1JFU0VUX1BF
Uk1TLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBOVU1BX05PX05PREUsIF9fYnVpbHRpbl9y
ZXR1cm5fYWRkcmVzcygwKSk7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgX193ZWFrIG1vZHVsZV9tZW1m
cmVlKHZvaWQgKm1vZHVsZV9yZWdpb24pDQo+ICt7DQo+ICsgICAgICAgLyoNCj4gKyAgICAgICAg
KiBUaGlzIG1lbW9yeSBtYXkgYmUgUk8sIGFuZCBmcmVlaW5nIFJPIG1lbW9yeSBpbiBhbiBpbnRl
cnJ1cHQgaXMgbm90DQo+ICsgICAgICAgICogc3VwcG9ydGVkIGJ5IHZtYWxsb2MuDQo+ICsgICAg
ICAgICovDQo+ICsgICAgICAgV0FSTl9PTihpbl9pbnRlcnJ1cHQoKSk7DQo+ICsgICAgICAgdmZy
ZWUobW9kdWxlX3JlZ2lvbik7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvdHJh
Y2Vfa3Byb2JlLmMgYi9rZXJuZWwvdHJhY2UvdHJhY2Vfa3Byb2JlLmMNCj4gaW5kZXggOTM1MDcz
MzA0NjJjLi4wNTBiMjk3NTMzMmUgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC90cmFjZS90cmFjZV9r
cHJvYmUuYw0KPiArKysgYi9rZXJuZWwvdHJhY2UvdHJhY2Vfa3Byb2JlLmMNCj4gQEAgLTEwMSw2
ICsxMDEsNyBAQCBzdGF0aWMgbm9rcHJvYmVfaW5saW5lIGJvb2wgdHJhY2Vfa3Byb2JlX2hhc19n
b25lKHN0cnVjdCB0cmFjZV9rcHJvYmUgKnRrKQ0KPiAgICAgICAgICByZXR1cm4ga3Byb2JlX2dv
bmUoJnRrLT5ycC5rcCk7DQo+ICAgfQ0KPiANCj4gKyNpZmRlZiBDT05GSUdfTU9EVUxFUw0KPiAg
IHN0YXRpYyBub2twcm9iZV9pbmxpbmUgYm9vbCB0cmFjZV9rcHJvYmVfd2l0aGluX21vZHVsZShz
dHJ1Y3QgdHJhY2Vfa3Byb2JlICp0aywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbW9kdWxlICptb2QpDQo+ICAgew0KPiBAQCAtMTA5
LDExICsxMTAsMTMgQEAgc3RhdGljIG5va3Byb2JlX2lubGluZSBib29sIHRyYWNlX2twcm9iZV93
aXRoaW5fbW9kdWxlKHN0cnVjdCB0cmFjZV9rcHJvYmUgKnRrLA0KPiANCj4gICAgICAgICAgcmV0
dXJuIHN0cm5jbXAobW9kdWxlX25hbWUobW9kKSwgbmFtZSwgbGVuKSA9PSAwICYmIG5hbWVbbGVu
XSA9PSAnOic7DQo+ICAgfQ0KPiArI2VuZGlmIC8qIENPTkZJR19NT0RVTEVTICovDQo+IA0KPiAg
IHN0YXRpYyBub2twcm9iZV9pbmxpbmUgYm9vbCB0cmFjZV9rcHJvYmVfbW9kdWxlX2V4aXN0KHN0
cnVjdCB0cmFjZV9rcHJvYmUgKnRrKQ0KPiAgIHsNCj4gKyAgICAgICBib29sIHJldCA9IGZhbHNl
Ow0KPiArI2lmZGVmIENPTkZJR19NT0RVTEVTDQo+ICAgICAgICAgIGNoYXIgKnA7DQo+IC0gICAg
ICAgYm9vbCByZXQ7DQo+IA0KPiAgICAgICAgICBpZiAoIXRrLT5zeW1ib2wpDQo+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiBAQCAtMTI1LDYgKzEyOCw3IEBAIHN0YXRpYyBub2tw
cm9iZV9pbmxpbmUgYm9vbCB0cmFjZV9rcHJvYmVfbW9kdWxlX2V4aXN0KHN0cnVjdCB0cmFjZV9r
cHJvYmUgKnRrKQ0KPiAgICAgICAgICByZXQgPSAhIWZpbmRfbW9kdWxlKHRrLT5zeW1ib2wpOw0K
PiAgICAgICAgICByY3VfcmVhZF91bmxvY2tfc2NoZWQoKTsNCj4gICAgICAgICAgKnAgPSAnOic7
DQo+ICsjZW5kaWYgLyogQ09ORklHX01PRFVMRVMgKi8NCj4gDQo+ICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+ICAgfQ0KPiBAQCAtNjY4LDYgKzY3Miw3IEBAIHN0YXRpYyBpbnQgcmVnaXN0ZXJfdHJh
Y2Vfa3Byb2JlKHN0cnVjdCB0cmFjZV9rcHJvYmUgKnRrKQ0KPiAgICAgICAgICByZXR1cm4gcmV0
Ow0KPiAgIH0NCj4gDQo+ICsjaWZkZWYgQ09ORklHX01PRFVMRVMNCj4gICAvKiBNb2R1bGUgbm90
aWZpZXIgY2FsbCBiYWNrLCBjaGVja2luZyBldmVudCBvbiB0aGUgbW9kdWxlICovDQo+ICAgc3Rh
dGljIGludCB0cmFjZV9rcHJvYmVfbW9kdWxlX2NhbGxiYWNrKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbmIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIHZhbCwgdm9pZCAqZGF0YSkNCj4gQEAgLTcwMiw2ICs3MDcsNyBAQCBzdGF0aWMgc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrIHRyYWNlX2twcm9iZV9tb2R1bGVfbmIgPSB7DQo+ICAgICAgICAg
IC5ub3RpZmllcl9jYWxsID0gdHJhY2Vfa3Byb2JlX21vZHVsZV9jYWxsYmFjaywNCj4gICAgICAg
ICAgLnByaW9yaXR5ID0gMSAgIC8qIEludm9rZWQgYWZ0ZXIga3Byb2JlIG1vZHVsZSBjYWxsYmFj
ayAqLw0KPiAgIH07DQo+ICsjZW5kaWYgLyogQ09ORklHX01PRFVMRVMgKi8NCj4gDQo+ICAgc3Rh
dGljIGludCBfX3RyYWNlX2twcm9iZV9jcmVhdGUoaW50IGFyZ2MsIGNvbnN0IGNoYXIgKmFyZ3Zb
XSkNCj4gICB7DQo+IEBAIC0xODk2LDggKzE5MDIsMTAgQEAgc3RhdGljIF9faW5pdCBpbnQgaW5p
dF9rcHJvYmVfdHJhY2VfZWFybHkodm9pZCkNCj4gICAgICAgICAgaWYgKHJldCkNCj4gICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gKyNpZmRlZiBDT05GSUdfTU9EVUxFUw0KPiAg
ICAgICAgICBpZiAocmVnaXN0ZXJfbW9kdWxlX25vdGlmaWVyKCZ0cmFjZV9rcHJvYmVfbW9kdWxl
X25iKSkNCj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gKyNlbmRpZiAvKiBD
T05GSUdfTU9EVUxFUyAqLw0KPiANCj4gICAgICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiAtLQ0K
PiAyLjM2LjENCj4g
