Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F056B546572
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJVK5d8Sz3ftJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:23:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=taahTl3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=taahTl3x;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJlfQ2glBz3bn5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 23:43:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL51PQFvUmUhyDMNrc0V76ZzURJ9nhDb6ZdNxvxs5zvEeVd7qxYDf8yILZie2W5JYYIEe5QAirjaoVT2bk5wK7aNNMYzI3TrDkWBrdYObv1G+UZiFP0oHGVNcrTWzIccg4fp885foaYBVawkGSsC+2gotlc6QpIElW4o2jMmOWZw+oqurNWl+cagt6NliIxV+yWvfkmD8n+1U3lLY4iYIVsudH67onTaMFej36FhN/L6dox3Fb/yOaAFMge72oOT6CfN/FhrG4eDZWUyCcVc9oOewbxM5D+7RIhuegFtpcLE02JfTSG7/bCyA6F/Fh2Rz+RPkyXfXBTIAJj5caZwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWV/Mq7ELxOoK20yaq2RZy+IG+nhjODFeLv9TtNQfg0=;
 b=L+GeeS8FMCrAAl/CPtEjfmlC26kugmTZxqgv1c49UyHABGDIsEc2ooldydbm4kQZfggI1vnGeabVATnX4Wb1gSlupKQLaVMUrxTkjkRttJZnGgwS3yCHFn2fmAzolBj0k+1m+QIY+/3m4RVmjfs9txWKWiesK1eNIro03U0aybrC3OqAxIpH7Jiw7j64/U7xu98k+ZvQnP0zTn7Fn1WxelmlzjDcYEktieHYq8v2TfqRp866VhLJUXoJ4qZtxLfIDI/Avt8t3+vKC7rgAuOb/0cCxq5+eHOwzUkebBGw1ffoFoQFjNVh6WQ2Y880d4QrocwKhtaRUd0k/xDN34w7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWV/Mq7ELxOoK20yaq2RZy+IG+nhjODFeLv9TtNQfg0=;
 b=taahTl3xKbwHadBgaKYfrjozhfnTJ3AYTiYpox+HQpNn1dWw7tnfQ8VXCB598N0CF+izRrUTN18btLFR48oewzeArKKzAB8oW94RmmPtWBGZnqlA7ygSAnDkZvKdij+2jwMzGzGyJ9U39yHnlsxIo1hvw0WoPYW+GXu7sD2zdRaDodr2jbIOLnWbbbEmKDXw18wUaDrzWIK+LGGYLA1IrkKcJzy1PoZ9N0LgM7WTm8YrmL89ss8R5jKH9yvSt0lFvAHMTdMUms9Hs8lzoUBgo3D9MrP1Owzc8HtsxHN6gtDHk4ckKkd19VtLLzG/gdVOZvsr1eQ+XJA6943bDZ1vfg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 13:42:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 13:42:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Topic: [PATCH] kprobes: Enable tracing for mololithic kernel images
Thread-Index: AQHYessDwND8kPCFFkWhvh7Pg63gL61GwK6AgABKzQCAAAyGAA==
Date: Thu, 9 Jun 2022 13:42:44 +0000
Message-ID: <f22e34b8-5dae-55c8-c04e-e8b913b40b80@csgroup.eu>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu> <YqHuUsevcvaaunVq@iki.fi>
In-Reply-To: <YqHuUsevcvaaunVq@iki.fi>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04ef55ca-0d09-4efe-8c0f-08da4a1deeee
x-ms-traffictypediagnostic: MR1P264MB2884:EE_
x-microsoft-antispam-prvs:  <MR1P264MB2884BBBF9466F1CA3086E585EDA79@MR1P264MB2884.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ea6Os62Q+Zsi1v7RDyMQ/umBDObn8+2WoPAr+DeYskm2YTnMXOtf4570yrhdmqGdyDocLlzngGVHoeBsdLVxWD2U1+4aXsTgJJZSNGTehbObo3ZLrum10nfpF0H7pr1b4kQpubaEPejT4OnTfVaTuNqu9W2/L9/IpJJEYPF8fkd+a816yKksIAiOaSKxJYFgV2ns70SYTII7lT+BUA/MAV2PySFlOvnEVGxwvKa0d0ay4xcjyxT5dURStsjd1r/PRuOwt/vXZjvLkeKrL/YsJsXXu7B/vmtiYwGfEib8dxtUUKGYL2xGKlSuyb0OR1Cdel2qkm1IsBz+eDdUqJXhCqhf0wbwsybwUGTw6x32hkJ5EEJe7Dm/13wxlzUb3iC9cbKxgMRwX4ODDufZM+Ab5YfU70G9gYvrGMt0Sb2owqNaft2ZinKXDi127qbqU7pLJtsb4C7Pw4vNp/t2if8sEwGBNcy8SZflTr15o2GbnFekH8I3+As6XWLwggFd4EWRsUPogCOH74nFeN92pYeYq7CtgPVoRxTDxPYIUaycTZS8m1fOL1V5nR8eBE08ixxuDvAwF3VtNX4Nbm9CWcP7EtW0beOg4sOLGhts9EkA3fzVNv5//UOTnG31XG8u3hRZn2SMfjHYE5NzNofraSiv4wppp+byZk/I7M+BR0Vm+cKlbpFeWTAJogL+/U9IdEdMbVKxaDEmTT+sgo0Iq43Am1RBrmjR8IkBpva6xIzLq7sMDuM7IAjLCS4DHdEK6P/lt60sfaEa+vkVsOIj0B+xfA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(91956017)(7416002)(6916009)(7366002)(508600001)(966005)(7336002)(4326008)(5660300002)(54906003)(71200400001)(7406005)(44832011)(8936002)(2906002)(83380400001)(38100700002)(316002)(66476007)(64756008)(66946007)(76116006)(66556008)(66446008)(8676002)(2616005)(38070700005)(6486002)(31696002)(31686004)(86362001)(36756003)(26005)(186003)(122000001)(6512007)(66574015)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Yy8ycnpSZ0tML1E1dFl5Y3oycEE0WjhxVVovOFJLWW1CRWVoYVVJdHVtMi9C?=
 =?utf-8?B?a1BjditMaU1nR1I0ZTgrc1JXMGkrTkZXMWNYWHRzWDBmenkrell5a3B0bmNk?=
 =?utf-8?B?VG1QYk9YVXkzdEV4ME16ZFZ2SFRsY0E1bTVDenVFWFc4TkxPZEx3dnNhRldQ?=
 =?utf-8?B?N0dkRDZwZGhvM3dYWnBBV2pyek9EVVYzdGhCdml4UjlIcFpGWi9Za1h4SkMw?=
 =?utf-8?B?blhGczJhQmRDbWRFeXBDWTU5WDZ1R3FIMXQzTjZTS2Q0Mlk0ZE9razVGeGJz?=
 =?utf-8?B?dTRENXI2Mi80QkhxRWs2c1NBVUVPVDNmMmVFa2k2NFZEVlN3TlBvWDdod3VH?=
 =?utf-8?B?cUN1OWN3N1JnZlJ0d2dtSVJBOVcwWTRUekp3TjVhMGx0Vmh6MWpVRnN1UU5k?=
 =?utf-8?B?ZE1oSlhQaVlYNVN4UGxKeDBicStnWWNzdFo3L0l6S2ltNnpzQ003K0wyM2hv?=
 =?utf-8?B?T3ZyUjlBNENNMmxPdlJNbzdHR0l2NEtUa0tzZWJiNXdWZloybDk1Rk5Jc0wv?=
 =?utf-8?B?d2J3TytnMTEweVdwU1pLdHYxdTczelMzeVlaUFpIVjltWEZiQ3YzcDkwcVoy?=
 =?utf-8?B?dUtHSUgvZUFFUWx3OWZHeTE0L0cyOGNaNXNxL00wbDRkRHFNdWJpMzEvZHVE?=
 =?utf-8?B?ZDR4Q1FMNjVjMnVkcHliSU1jUVpPMTBoYTEyaWtXQm1QbU9KRTByQ1c4bDRl?=
 =?utf-8?B?ZGcvMVYwY01iSWIwcStmbThVclNHdEZxL3ZETFlmcEEwUjR0cXgyWXlIMlov?=
 =?utf-8?B?NjNaYTBaaWxkVmQ5VkR6Zm42M1Z3SkFWdnBXOWQ0ZWl4YkNNVGJiUEN0eUFP?=
 =?utf-8?B?ei9Ya1U3dDI3SHMvZnhZVDMzNFEyb2QxT3dMNmZraEx4Z0poNk56Yy92QVZu?=
 =?utf-8?B?WThYV1BZVEowdHZlRHAzc3Nidko1SVBwNTc4MEgyVkkxZFhoenQ3ankzQkRM?=
 =?utf-8?B?cXZWV3NQeTZBZ1FscHYxTUk3T1ZmMGthRWZnRWtkWm03bURPakZ2UDI0WmhD?=
 =?utf-8?B?czlXQ2ZBcUszWkRyVTYxVU1SUzQ4RjA0V2lyaXFhRWZHb0dFWEJncTJmSThC?=
 =?utf-8?B?R283TUZoUFNmVkVRT1IzM2tjY0k4ZUxVYlR0MUpEZll6UlNOeWZ6S3JqeHo5?=
 =?utf-8?B?U0hmU1NJanBJQlZwSnR4TitueXNQMUJTMUordkxMdTFYS0tZZTZRZ0YvWEo0?=
 =?utf-8?B?OWd6Qng5M3lCY3JkVGw1OE52Ymt3VUo4RFhrWjNoZ1V1TGc3ODNmWTVWYlpa?=
 =?utf-8?B?ZnVXZ1JGaDd1WmdxWEZUVWY3RldGVDdNNkFVYmdPZ3lzbFU1ZERsbzZnN1l1?=
 =?utf-8?B?Yjdhck9MOFV5eDRyM21yZlhMOTB2cHhFRUkreXNldkVnMjJsRWNVM3RzV3dl?=
 =?utf-8?B?eEpsRjBlclhCUWNMZERiMExsWENRb0kyL3lWRzJ3MGtzWmNsQUpxcFRPdGJL?=
 =?utf-8?B?VGhJUXk5cXNSTEJOekVMMVdsN085c3p5TlVCYUpJcUIyUURzT2NYWFZaNndx?=
 =?utf-8?B?aXQzbWZnLzlBeDQrVExoRUlmK3VWckF3clJnTEszMHV1aUVBQ3NDVXZ3a3lw?=
 =?utf-8?B?YTgxSlNlMnlmMk9xa3JvMlRVbktSWTRsYlhXUm43RzRuUFR4NGMzWnNxYksx?=
 =?utf-8?B?bmFIcmE3aWVRUVBiMWdQWHBnREFwQTlpYmJyZ3crQVhhbGFzZGd5REVLZTJs?=
 =?utf-8?B?VU9QTVVBYVVvdW5WeTNHVkhkYnRWTWw3MWF3SW1OdmxMMGcyZnJVSTZiY3Vv?=
 =?utf-8?B?YVhBVFBadHN3akVoMERQeVkrRVdhNytWZ2tVK2dLZ09vZ0xHbk9zdWtYM1V5?=
 =?utf-8?B?Tng4c1QvQmV4QndBaFF4K2FpL3JDbVVheXhyR1RueEVadXg1dEZZNHZIZHlu?=
 =?utf-8?B?akg5ZDQ1bG9INXptNU1vZHRJNUI3WTkyUXJNd2V3Q3hiaUZPVWRVQjJLMEpH?=
 =?utf-8?B?UEJaRGpmVDB4Z05LSDdMb1dpcjlXTzZiajFOaFF6VmU5TXdVR0VGVC94YzU0?=
 =?utf-8?B?emwwOGd5SFJBaUZhZmFlTVMxMVNxeit2eWhZTGFNd0xkY05BSkxxTTRHL1hW?=
 =?utf-8?B?V1hFdTJvL1ZaczlHbnNWZlYwb09rVVc2R25DNmdjbXAzY3BLanhHSmF5eDVD?=
 =?utf-8?B?M0x0WWkrOSs5RFpxaTU1cG9sMlB6TzNZU3VxRGNDVUNkYjFPTkVtaEg3d0Nm?=
 =?utf-8?B?dlR2UTh3TktXcEkvdE1SZlZybWtZdXNpSFNQcDFSaVo0SURSN3hjNU9oMlk3?=
 =?utf-8?B?Z1NRVXRBZmgxTzlTWlIrbzZsQkt6ZkhHeVNRdlJwcXVzZGtkRjZ6SmRxRENG?=
 =?utf-8?B?VGNMVXdHUjBrTURSdWNaK0RaQmhFaWNnZ00rdnNjdzlwcDVjam9kSDUzTWZi?=
 =?utf-8?Q?I25hsSZLj7Q6cXloe7wMtiXCjwrZSqcLRZ+II?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D014B0B65500164483C9E55D19A099A7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ef55ca-0d09-4efe-8c0f-08da4a1deeee
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 13:42:44.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2axa1bs43aL+5ZdShBxsOFp9rEfcuDOwhvbXnlgcrq6KdzoSUHsmShhZ4aQO5oL0ZdvW6gNiz51XZJC/meIeX0i2uilASNOgYsKLUUjMgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2884
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi
  Nemoto <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W.
 Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniethe5@gmail.com>, Atish Patra <atishp@atishpatra.org>, Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King
 \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert 
 Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA2LzIwMjIgw6AgMTQ6NTcsIEphcmtrbyBTYWtraW5lbiBhIMOpY3JpdMKgOg0K
PiBPbiBUaHUsIEp1biAwOSwgMjAyMiBhdCAwODozMDoxMkFNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAwOC8wNi8yMDIyIMOgIDAxOjU5LCBKYXJra28gU2Fr
a2luZW4gYSDDqWNyaXTCoDoNCj4+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGph
cmtrb0Bwcm9maWFuLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8v
YWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+Pj4NCj4+PiBUcmFjaW5n
IHdpdGgga3Byb2JlcyB3aGlsZSBydW5uaW5nIGEgbW9ub2xpdGhpYyBrZXJuZWwgaXMgY3VycmVu
dGx5DQo+Pj4gaW1wb3NzaWJsZSBiZWNhdXNlIENPTkZJR19LUFJPQkVTIGlzIGRlcGVuZGVudCBv
ZiBDT05GSUdfTU9EVUxFUy4gIFRoaXMNCj4+PiBkZXBlbmRlbmN5IGlzIGEgcmVzdWx0IG9mIGtw
cm9iZXMgY29kZSB1c2luZyB0aGUgbW9kdWxlIGFsbG9jYXRvciBmb3IgdGhlDQo+Pj4gdHJhbXBv
bGluZSBjb2RlLg0KPj4+DQo+Pj4gRGV0YWNoaW5nIGtwcm9iZXMgZnJvbSBtb2R1bGVzIGhlbHBz
IHRvIHNxdWVlemUgZG93biB0aGUgdXNlciBzcGFjZSwNCj4+PiBlLmcuIHdoZW4gZGV2ZWxvcGlu
ZyBuZXcgY29yZSBrZXJuZWwgZmVhdHVyZXMsIHdoaWxlIHN0aWxsIGhhdmluZyBhbGwNCj4+PiB0
aGUgbmljZSB0cmFjaW5nIGNhcGFiaWxpdGllcy4NCj4+DQo+PiBOaWNlIGlkZWEsIGNvdWxkIGFs
c28gYmUgbmljZSB0byBoYXZlIEJQRiB3aXRob3V0IE1PRFVMRVMuDQo+IA0KPiBZZWFoLCBmb3Ig
c3VyZS4gWW91IGhhdmUgdG8gc3RhcnQgZnJvbSBzb21ld2hlcmUgOi0pIEknZCBndWVzcyB0aGlz
DQo+IGEgc3RlcCBmb3J3YXJkIGFsc28gZm9yIEJQRi4NCj4gDQo+Pj4NCj4+PiBGb3Iga2VybmVs
LyBhbmQgYXJjaC8qLCBtb3ZlIG1vZHVsZV9hbGxvYygpIGFuZCBtb2R1bGVfbWVtZnJlZSgpIHRv
DQo+Pj4gbW9kdWxlX2FsbG9jLmMsIGFuZCBjb21waWxlIGFzIHBhcnQgb2Ygdm1saW51eCB3aGVu
IGVpdGhlciBDT05GSUdfTU9EVUxFUw0KPj4+IG9yIENPTkZJR19LUFJPQkVTIGlzIGVuYWJsZWQu
ICBJbiBhZGRpdGlvbiwgZmxhZyBrZXJuZWwgbW9kdWxlIHNwZWNpZmljDQo+Pj4gY29kZSB3aXRo
IENPTkZJR19NT0RVTEVTLg0KPj4NCj4+IE5pY2UsIGJ1dCB0aGF0J3Mgbm90IGVub3VnaC4gWW91
IGhhdmUgdG8gYXVkaXQgZXZlcnkgcGVhY2Ugb2YgY29kZSB0aGF0DQo+PiBkZXBlbmRzIG9uIENP
TkZJR19NT0RVTEVTIGFuZCBzZWUgaWYgaXQgbmVlZHMgdG8gYmUgYWN0aXZhdGVkIGZvciB5b3Vy
DQo+PiBjYXNlIGFzIHdlbGwuIEZvciBpbnN0YW5jZSBzb21lIHBvd2VycGMgY29uZmlndXJhdGlv
bnMgZG9uJ3QgaG9ub3IgZXhlYw0KPj4gcGFnZSBmYXVsdHMgb24ga2VybmVsIHBhZ2VzIHdoZW4g
Q09ORklHX01PRFVMRVMgaXMgbm90IHNlbGVjdGVkLg0KPiANCj4gVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGlzIG91dC4gV2l0aCAiZXZlcnkgcGVhY2Ugb2YgY29kZSIgeW91IHByb2JhYmx5DQo+IGFy
ZSByZWZlcnJpbmcgdG8gdGhlIDEzIGFyY2gtZm9sZGVycywgd2hpY2ggc3VwcG9ydCBrcHJvYmVz
IGluIHRoZSBmaXJzdA0KPiBwbGFjZSAoanVzdCBjaGVja2luZyk/DQoNCkluIGEgd2F5IHllcywg
SSB3YXMgbWFpbmx5IHRoaW5raW5nIGFib3V0IHRoZSBkb3plbiBvZiBwbGFjZXMgaW4gDQphcmNo
L3Bvd2VycGMvIHRvIGJlZ2luIHdpdGguIEFuZCBhbHNvIHRvIGNoZWNrIHRoZSAzMCBwbGFjZXMg
d2l0aCANCkNPTkZJR19NT0RVTEVTIGluIGluY2x1ZGVzLyBkaXJlY3Rvcnkgd2hpY2ggY29udGFp
bnMgdGhpbmdzIHRoYXQgbWF5IGJlIA0KdXNlZCBieSBhcmNoaXRlY3R1cmVzLg0K
