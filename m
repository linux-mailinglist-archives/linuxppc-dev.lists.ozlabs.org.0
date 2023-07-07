Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F574B033
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 13:47:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DKngXDpW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyBT46rXZz3bPV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 21:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DKngXDpW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy2lT6ggrz30GJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 15:58:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwCCLoiFPbWYWQxR5T2J1/XlTJvoyFumyXZLIm5YVXyvfjrso9+GN0phQOoYYM8P+WbtLNTRoIm0CDO2Rf+Ak1LWYDmVWkg15p2Buitvw3vqeuM31ay7rfIKbsjw6DqHdQo9dv04MEY/TOI0YI8HfpED6Pzrzu7z93NM8u1RhoE7iLOg5rJAGugxm2ZQ5plqZcY0YS+v+MPPxAO5vytVR35kL2wkpxhrPCIRQdEtl27xmjQbSW3bnCM/jTLNFBSdqHAOqY8NDYRp4x7Sb0Q7eACttpOcLxUxPRjKXCh4D097nnX2JCPPZGqF9YvQVY3g1vs6OuB40Qm6rgqxkI+6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02qhPvhImcEK+6g4xrq3f9VO3iQC8nPfxuPOsQJWvyM=;
 b=f4RjT6wPf2jgnIlSJTlm2cSRu5ZAwVRafyNXdNSNJZ7RJVuiGVAhFpqtkG0pUQ1ibrs2N+yQ14oTP3FgmlJUReojJvOC7uI1JtqUR5AeppRktNidvaDUeNjoprX7SLgLIifjDei9Mi5mO+XSss+5t7uKSbvmf+csLO7yAleYs1XB3NhehG6LwdxGwMhWmzcnMJGzUYyUZ+Gc8sfO6BhhiO684bpbiAqQa33zhhYbVeqYWLJCzei8WwjbXV9O8s3bcqLe14Ya8GoO91flckg5qqQ94jGIp4i2JfIhVT7MSh7l7lATZNjqyzlJ3a0WlTvLgNe+qH7I4KEMYJ4HzxmAhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02qhPvhImcEK+6g4xrq3f9VO3iQC8nPfxuPOsQJWvyM=;
 b=DKngXDpWYQ2kGy9uw1wIKkRMx0mjNq0EvRigxiMZtEsVBmV6kPKbsyUsKykw80hm43g+cQwV/qBjrm9O9s++i9LbrptmirWpLLuFMbbfctDFI3LpLSQHxi4WAP0xCPsiGD2LDF8f+8lAjK0w45pLr5Y2dt0egtyJZrHBQvAmYd32ZORR4N+Cgf6QMwrkZgG2Y2OyPiiKu/J4aGakch3jueFbAp9GU4PIfoWozeHyqppU3KQVcAIB2w+abI5VFOWTiaks+bo3BXMQzOwSpfMjF6/kIdsSKgTBPvb9CWVpy/O0pXlva15Fo2xCOveqVDBr3lR2rnC3C1sWhanWwSXO5A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2360.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 05:58:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 05:58:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Eric DeVolder <eric.devolder@oracle.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "geert@linux-m68k.org" <geert@linux-m68k.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "deller@gmx.de" <deller@gmx.de>,
	"ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>, "dalias@libc.org"
	<dalias@libc.org>, "glaubitz@physik.fu-berlin.de"
	<glaubitz@physik.fu-berlin.de>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org"
	<linux-ia64@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>
Subject: Re: [PATCH v5 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Thread-Topic: [PATCH v5 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Thread-Index: AQHZsFghBMLN4GfYGkC1z1JC7KCAn6+tz3AA
Date: Fri, 7 Jul 2023 05:58:35 +0000
Message-ID: <0d1097dd-f0cb-8518-cf88-e6afbd2a6a19@csgroup.eu>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
 <20230706222027.189117-3-eric.devolder@oracle.com>
In-Reply-To: <20230706222027.189117-3-eric.devolder@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2360:EE_
x-ms-office365-filtering-correlation-id: 9c542bb0-4e36-4de4-e4df-08db7eaf33fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  y/I3BvHXu9Rbyuk88lSsX+P5eGEpsSxVw1IctrZUePOblyeVBfDPRtj1ghGQa8aJ1ZUGjdWmtyX+QYOcLYO/PCDCbOtiwPW8CbVIfcA0jin5MMD3lDYR/IlAxgt3cN8CfgUwL9PCt10GO636PM42Ha8yUch/tZFeKPk4UMwAJJygA6e6o7YWfbV3vGC3KFCPR8Dku6cJWrUM7N10tqL0UFYpDTtD9O4g1aFbTS3tmKe4d6W+4+hDj1Uogjb/zmbCJDcxC4qsOO2CzWWZLSPP6VC+Osly2HSdEosbweiTKCxl4Fvube4GnDkYsT/EoKL2h/ujD2tC0oXv87i8iwhOk1KH5AePDO48wZN3Mm23LCbp3R7iRbyiHGoREBzIssm8HTz4V7DJfr4YYDJ22B7b1O135rDtYBkupiAHGtC9uYhUg5Ck8dSnwRYrqodxiOQ1F+54xn5JMQVo38bsWD/gavxlqgK56E8l/IGaAaAiiAvp4ElKJ53ddzhfs5Q5Nj/KP8ZzENLE+uajVcvk6HCNo8B5jALctHYy1TmEI3ykCVK9WXNreysqxwl1LjRaU6HeZ/CMSViUWLDleJfJKgq98/LQHjYUoKbAKNfFbLLjc8MM1caDvoZufiRGkpQ9Hebffdzov38wxA5HCHlGQ5AdqVXQhwpIhMkBrwQRa9twK1kB0xUNoP64wFJyJAsqJLKKmtPqM479LV4OpuOmKHaAYg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(66574015)(83380400001)(2616005)(2906002)(66476007)(64756008)(4326008)(66446008)(66556008)(6486002)(91956017)(76116006)(66946007)(316002)(110136005)(54906003)(478600001)(71200400001)(6512007)(5660300002)(7416002)(6506007)(44832011)(186003)(7366002)(41300700001)(8936002)(8676002)(7406005)(38100700002)(122000001)(921005)(36756003)(31696002)(38070700005)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3FGWmlnRFVmYS9NRWZDS1NENzdMOFlRdFRZYmRZQ1N2R2tIWFVPQ2hLTDRh?=
 =?utf-8?B?TURlZm82RWl1WUpUMUEzZWQzeit3L0x6RS9EUTNtREpMMlFjSW5ZSXZBS2Fp?=
 =?utf-8?B?cnlvZlFYbURmV3FJQUZ2TGpJWFZxUXk3UG9TUlkrTERQMFFGU2FFWEZZVFVu?=
 =?utf-8?B?TVRCV0JIbEVhZ3BWRVZmM0VvTEtXNU9wZkprTHZLbG16UGZHSlhtZjJhR2c4?=
 =?utf-8?B?Y3dSbTlQMmdtd1gzenlIc1NpY3VEbXY3VDFaSkpWN3NoYXpWMndUMjVnM1hW?=
 =?utf-8?B?Z3pKVUR2V2wyZFFhV05Na3c2aG1OT3RCemFqSUNQbVlOUXc4eVNhY3pFblJR?=
 =?utf-8?B?RVFsdldUVTd2U05XK3ZsaG80cHYrYXQzUVZQZlprNUJrSXBiOU5zYmFEYlNp?=
 =?utf-8?B?QTE3RmQwYVNHN2F1NnJZeXU2N0RoakRZeUFGSW83SGZMS2swMlZzUzJBbmVN?=
 =?utf-8?B?NngxK1pZSWFwZldseHVtdEQ2dG9uM1RsRGZQQmZOTWV6cnlmdkJmdmhqVFBX?=
 =?utf-8?B?bU13Z0duZ1l6NlJVRkI5UGVFdTVrRzFadVQzMGxCQWpUK2t2RitEOW9hNGtp?=
 =?utf-8?B?T1B2NFYrY0hTUTBVSXo0YUI4eGZpWmNpNXJKQlBVNWpCRDZoM3RaTHRaZGZT?=
 =?utf-8?B?eUE3U2ZjSFE2YzMyQ3FVNlBoVlcxNmRVOFZkMTJGdkxQU3lXclA3Ung1bm8z?=
 =?utf-8?B?VVBNTkVldjNiY1BlN0FCWktRelBjdWJNSVF4OFRFNnhkaEZOTCtVYU13SU1Z?=
 =?utf-8?B?Z1RpSFBheXJENU1GYytqY3VWaU92NklxbVJTUU9rNzJZU1JzdENycnZxNVZO?=
 =?utf-8?B?YTBWRXFvUFZGU0NMV3gyZWpMNWhGc3FCRThFZlMycU5Qb20rMHVhTWdJN0xB?=
 =?utf-8?B?RmhCMWdlRWp6VGJyc3hQekJyVjVDZys1dE1KSSs2RHd4OUxOUUNWR2pERHc1?=
 =?utf-8?B?UnU3T3FxQ3JxV1FiTjJIOVBIZFBPWnpGc1ZHS3BNOHIzZWxKN2JiZlZOa3NW?=
 =?utf-8?B?UHY4bU1yMkdPL2FMdC94ZW1VTnU0UkxUeDZFanVpdGhXQWgrOWZycXVna1Jy?=
 =?utf-8?B?TXljQ0hZS2ZlRUNDbzNyeW1aWDdCeUp4R2Y3bmh1SHpLczVnbUZkMENhU0pF?=
 =?utf-8?B?MXFic0NRVG1KMHBqcXVlSzZuelRJR0w4dUpNa3VFdlZiRDlsNllsMXpHaGJv?=
 =?utf-8?B?ZnFoY2hoVEt6aEMveXg4amlLUVdYSFlVT211NFNyaHowVWdKT292MTRwbnlZ?=
 =?utf-8?B?eDUvOVUwTkpBSXdIVnBoaS9yclNZSHQ3ZS9LR2NnZkpXZHBRby93Z1Jwc3Fr?=
 =?utf-8?B?OGRFMzR0dGRoQm9CQjRKMGNpZkw2aWM0M0VhR29XK3hTeXFnVjM3SjlWcy9j?=
 =?utf-8?B?NkpLRmFjOWxtTy9EZCs3YnV4TkJnUU5HbFBEOHNjbWtoTUgxS1hFWjR3QTZi?=
 =?utf-8?B?Zk9UblU2VStPdWkrbGdkRHpQalVJYWtvUm1TaC9QYjBMV1FiRERrbGZOSVRS?=
 =?utf-8?B?ZjNtcjFNWno4d0NpNHpzUVN6K2kvSitIU0ovM3drNjFCTXA1czlRUUdRYW5D?=
 =?utf-8?B?UFlCREZXYXZOS0JudzhlUXQ5WE9TOUFCOW1jT044Q1ZtWTh1ZkNVd2N5ZXpL?=
 =?utf-8?B?My9QRzE5dWNnWDdLN2dyS3pDWmRJMWdpV2k1ekZIZS9JQWRSb0x5VzFQY0Jr?=
 =?utf-8?B?MVdnTk1kRFRyZ1JRTkZ3c2xPNmh2Z2plMGVMZjlvSVBKTEZQTXVJL1k0RDR4?=
 =?utf-8?B?OCtRTWt1QTdkZHVKQS8yMDFjQ0V3THhoLzY4RGpFTkdiMEdaemF3ejVGdFBT?=
 =?utf-8?B?bU1DSWhpa3VoZW0xSWhZbWdsVFdUQXc0STRGQjFzeEd4WUloVzJaMmczclFE?=
 =?utf-8?B?aStpN1FDQ2Z1STkvRVE3TkNsdFJCMDFCS1BhYmFsM1hFa05qdWVqSThwTDQv?=
 =?utf-8?B?L0h4OEpqTzdROFBJQmpiYmlIK1kyTUFjbTNrSm1NT1IvcW0zSlh3eHBGcVo3?=
 =?utf-8?B?b0Y4dTJpaUlTekNpZTY2VHRMSWpQdWJ4VWJHVlRFZlNtTEdvYlZOOVB3LzQ2?=
 =?utf-8?B?YlhYTGJCWWZIOXkyVUwvUTVxS1lsVks1Z2UzbXhWdHRoSUpZSkZoSEZBUHl3?=
 =?utf-8?B?TmxhekxGd2tXZktLdzdCSFFUekxCVjRqcC9yYkxkSzk0RGU1VWxYWWd4WWNm?=
 =?utf-8?B?OVd1VjRXa1QwbjA0c0RQa1lxdkdjT2JkUHV6S29QMU5JelQyK24wbUFRWU80?=
 =?utf-8?B?TUV1TmtrbTFuWlRxZTViUko3UWhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87527B0D04FADE449B8AFEC50A7C121A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c542bb0-4e36-4de4-e4df-08db7eaf33fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 05:58:35.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7F3eCRrz5tqGisTBukOVJkJfWWRYRylN0l8XStCTd7CAhNQ+RpETl1enP/jLPfYb1Jmj6JjHtZB/WnKzEJUNuh8A5h/UcYerWfQyDBCk/GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2360
X-Mailman-Approved-At: Fri, 07 Jul 2023 21:45:28 +1000
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>, "hpa@zytor.com" <hpa@zytor.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "ardb@kernel.org" <ardb@kernel.org>, "tsi@tuyoix.net" <tsi@tuyoix.net>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "bhe@redhat.com" <bhe@redhat.com>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "ojeda@kernel.org" <ojeda@kernel.org>, "juerg.haefliger@canonical.com" <juerg.haefliger@canonical.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "frederic@kernel.org" <frederic@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "kees
 cook@chromium.org" <keescook@chromium.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "xin3.li@intel.com" <xin3.li@intel.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "ziy@nvidia.com" <ziy@nvidia.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "ndesaulniers@google.com" <ndesaulniers@google.com>, "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "tj@kernel.org" <tj@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjMgw6AgMDA6MjAsIEVyaWMgRGVWb2xkZXIgYSDDqWNyaXTCoDoNCj4g
VGhlIGtleGVjIGFuZCBjcmFzaCBrZXJuZWwgb3B0aW9ucyBhcmUgcHJvdmlkZWQgaW4gdGhlIGNv
bW1vbg0KPiBrZXJuZWwvS2NvbmZpZy5rZXhlYy4gVXRpbGl6ZSB0aGUgY29tbW9uIG9wdGlvbnMg
YW5kIHByb3ZpZGUNCj4gdGhlIEFSQ0hfU1VQUE9SVFNfIGFuZCBBUkNIX1NFTEVDVFNfIGVudHJp
ZXMgdG8gcmVjcmVhdGUgdGhlDQo+IGVxdWl2YWxlbnQgc2V0IG9mIEtFWEVDIGFuZCBDUkFTSCBv
cHRpb25zLg0KDQoNCldoeSBkbyB5b3UgbmVlZCB0byBkdXBsaWNhdGUgdGhlIEFSQ0hfU0VMRUNU
U18gZW50cmllcyBpbiBlYWNoIA0KYXJjaGl0ZWN0dXJlID8NCg0KV2h5IG5vdCBkZWZpbmUgdGhl
bSBpbiBhcmNoL0tjb25maWcgdGhlbiBzZWxlY3QgaWYgZnJvbSBlYWNoIGFyY2hpdGVjdHVyZSA/
DQoNCkZvciBpbnN0YW5jZSBoZXJlIGZvciB4ODYgZm9yIEFSQ0hfU0VMRUNUU19LRVhFQ19GSUxF
IGFsbCB5b3UnbGwgaGF2ZSB0byANCmRvIGlzOg0KCXNlbGVjdCBBUkNIX1NFTEVDVFNfS0VYRUNf
RklMRSBpZiBLRVhFQ19GSUxFDQoJc2VsZWN0IEhBVkVfSU1BX0tFWEVDIGlmIElNQSAmJiBLRVhF
Q19GSUxFDQoNCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIERlVm9s
ZGVyIDxlcmljLmRldm9sZGVyQG9yYWNsZS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gveDg2L0tjb25m
aWcgfCA5MiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gveDg2L0tjb25maWcNCj4g
aW5kZXggNzQyMmRiNDA5NzcwLi45NzY3YTM0M2Y3YzIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2
L0tjb25maWcNCj4gKysrIGIvYXJjaC94ODYvS2NvbmZpZw0KPiBAQCAtMjA0MCw4OCArMjA0MCwz
NCBAQCBjb25maWcgRUZJX1JVTlRJTUVfTUFQDQo+ICAgDQo+ICAgc291cmNlICJrZXJuZWwvS2Nv
bmZpZy5oeiINCj4gICANCj4gLWNvbmZpZyBLRVhFQw0KPiAtCWJvb2wgImtleGVjIHN5c3RlbSBj
YWxsIg0KPiAtCXNlbGVjdCBLRVhFQ19DT1JFDQo+IC0JaGVscA0KPiAtCSAga2V4ZWMgaXMgYSBz
eXN0ZW0gY2FsbCB0aGF0IGltcGxlbWVudHMgdGhlIGFiaWxpdHkgdG8gc2h1dGRvd24geW91cg0K
PiAtCSAgY3VycmVudCBrZXJuZWwsIGFuZCB0byBzdGFydCBhbm90aGVyIGtlcm5lbC4gIEl0IGlz
IGxpa2UgYSByZWJvb3QNCj4gLQkgIGJ1dCBpdCBpcyBpbmRlcGVuZGVudCBvZiB0aGUgc3lzdGVt
IGZpcm13YXJlLiAgIEFuZCBsaWtlIGEgcmVib290DQo+IC0JICB5b3UgY2FuIHN0YXJ0IGFueSBr
ZXJuZWwgd2l0aCBpdCwgbm90IGp1c3QgTGludXguDQo+IC0NCj4gLQkgIFRoZSBuYW1lIGNvbWVz
IGZyb20gdGhlIHNpbWlsYXJpdHkgdG8gdGhlIGV4ZWMgc3lzdGVtIGNhbGwuDQo+IC0NCj4gLQkg
IEl0IGlzIGFuIG9uZ29pbmcgcHJvY2VzcyB0byBiZSBjZXJ0YWluIHRoZSBoYXJkd2FyZSBpbiBh
IG1hY2hpbmUNCj4gLQkgIGlzIHByb3Blcmx5IHNodXRkb3duLCBzbyBkbyBub3QgYmUgc3VycHJp
c2VkIGlmIHRoaXMgY29kZSBkb2VzIG5vdA0KPiAtCSAgaW5pdGlhbGx5IHdvcmsgZm9yIHlvdS4g
IEFzIG9mIHRoaXMgd3JpdGluZyB0aGUgZXhhY3QgaGFyZHdhcmUNCj4gLQkgIGludGVyZmFjZSBp
cyBzdHJvbmdseSBpbiBmbHV4LCBzbyBubyBnb29kIHJlY29tbWVuZGF0aW9uIGNhbiBiZQ0KPiAt
CSAgbWFkZS4NCj4gLQ0KPiAtY29uZmlnIEtFWEVDX0ZJTEUNCj4gLQlib29sICJrZXhlYyBmaWxl
IGJhc2VkIHN5c3RlbSBjYWxsIg0KPiAtCXNlbGVjdCBLRVhFQ19DT1JFDQo+IC0Jc2VsZWN0IEhB
VkVfSU1BX0tFWEVDIGlmIElNQQ0KPiAtCWRlcGVuZHMgb24gWDg2XzY0DQo+IC0JZGVwZW5kcyBv
biBDUllQVE89eQ0KPiAtCWRlcGVuZHMgb24gQ1JZUFRPX1NIQTI1Nj15DQo+IC0JaGVscA0KPiAt
CSAgVGhpcyBpcyBuZXcgdmVyc2lvbiBvZiBrZXhlYyBzeXN0ZW0gY2FsbC4gVGhpcyBzeXN0ZW0g
Y2FsbCBpcw0KPiAtCSAgZmlsZSBiYXNlZCBhbmQgdGFrZXMgZmlsZSBkZXNjcmlwdG9ycyBhcyBz
eXN0ZW0gY2FsbCBhcmd1bWVudA0KPiAtCSAgZm9yIGtlcm5lbCBhbmQgaW5pdHJhbWZzIGFzIG9w
cG9zZWQgdG8gbGlzdCBvZiBzZWdtZW50cyBhcw0KPiAtCSAgYWNjZXB0ZWQgYnkgcHJldmlvdXMg
c3lzdGVtIGNhbGwuDQo+ICtjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQw0KPiArCWRlZl9ib29s
IHkNCj4gICANCj4gLWNvbmZpZyBBUkNIX0hBU19LRVhFQ19QVVJHQVRPUlkNCj4gLQlkZWZfYm9v
bCBLRVhFQ19GSUxFDQo+ICtjb25maWcgQVJDSF9TVVBQT1JUU19LRVhFQ19GSUxFDQo+ICsJZGVm
X2Jvb2wgWDg2XzY0ICYmIENSWVBUTyAmJiBDUllQVE9fU0hBMjU2DQo+ICAgDQo+IC1jb25maWcg
S0VYRUNfU0lHDQo+IC0JYm9vbCAiVmVyaWZ5IGtlcm5lbCBzaWduYXR1cmUgZHVyaW5nIGtleGVj
X2ZpbGVfbG9hZCgpIHN5c2NhbGwiDQo+ICtjb25maWcgQVJDSF9TRUxFQ1RTX0tFWEVDX0ZJTEUN
Cj4gKwlkZWZfYm9vbCB5DQo+ICAgCWRlcGVuZHMgb24gS0VYRUNfRklMRQ0KPiAtCWhlbHANCj4g
KwlzZWxlY3QgSEFWRV9JTUFfS0VYRUMgaWYgSU1BDQo+ICAgDQo+IC0JICBUaGlzIG9wdGlvbiBt
YWtlcyB0aGUga2V4ZWNfZmlsZV9sb2FkKCkgc3lzY2FsbCBjaGVjayBmb3IgYSB2YWxpZA0KPiAt
CSAgc2lnbmF0dXJlIG9mIHRoZSBrZXJuZWwgaW1hZ2UuICBUaGUgaW1hZ2UgY2FuIHN0aWxsIGJl
IGxvYWRlZCB3aXRob3V0DQo+IC0JICBhIHZhbGlkIHNpZ25hdHVyZSB1bmxlc3MgeW91IGFsc28g
ZW5hYmxlIEtFWEVDX1NJR19GT1JDRSwgdGhvdWdoIGlmDQo+IC0JICB0aGVyZSdzIGEgc2lnbmF0
dXJlIHRoYXQgd2UgY2FuIGNoZWNrLCB0aGVuIGl0IG11c3QgYmUgdmFsaWQuDQo+ICtjb25maWcg
QVJDSF9IQVNfS0VYRUNfUFVSR0FUT1JZDQo+ICsJZGVmX2Jvb2wgS0VYRUNfRklMRQ0KPiAgIA0K
PiAtCSAgSW4gYWRkaXRpb24gdG8gdGhpcyBvcHRpb24sIHlvdSBuZWVkIHRvIGVuYWJsZSBzaWdu
YXR1cmUNCj4gLQkgIHZlcmlmaWNhdGlvbiBmb3IgdGhlIGNvcnJlc3BvbmRpbmcga2VybmVsIGlt
YWdlIHR5cGUgYmVpbmcNCj4gLQkgIGxvYWRlZCBpbiBvcmRlciBmb3IgdGhpcyB0byB3b3JrLg0K
PiArY29uZmlnIEFSQ0hfU1VQUE9SVFNfS0VYRUNfU0lHDQo+ICsJZGVmX2Jvb2wgeQ0KPiAgIA0K
PiAtY29uZmlnIEtFWEVDX1NJR19GT1JDRQ0KPiAtCWJvb2wgIlJlcXVpcmUgYSB2YWxpZCBzaWdu
YXR1cmUgaW4ga2V4ZWNfZmlsZV9sb2FkKCkgc3lzY2FsbCINCj4gLQlkZXBlbmRzIG9uIEtFWEVD
X1NJRw0KPiAtCWhlbHANCj4gLQkgIFRoaXMgb3B0aW9uIG1ha2VzIGtlcm5lbCBzaWduYXR1cmUg
dmVyaWZpY2F0aW9uIG1hbmRhdG9yeSBmb3INCj4gLQkgIHRoZSBrZXhlY19maWxlX2xvYWQoKSBz
eXNjYWxsLg0KPiArY29uZmlnIEFSQ0hfU1VQUE9SVFNfS0VYRUNfU0lHX0ZPUkNFDQo+ICsJZGVm
X2Jvb2wgeQ0KPiAgIA0KPiAtY29uZmlnIEtFWEVDX0JaSU1BR0VfVkVSSUZZX1NJRw0KPiAtCWJv
b2wgIkVuYWJsZSBiekltYWdlIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gc3VwcG9ydCINCj4gLQlk
ZXBlbmRzIG9uIEtFWEVDX1NJRw0KPiAtCWRlcGVuZHMgb24gU0lHTkVEX1BFX0ZJTEVfVkVSSUZJ
Q0FUSU9ODQo+IC0Jc2VsZWN0IFNZU1RFTV9UUlVTVEVEX0tFWVJJTkcNCj4gLQloZWxwDQo+IC0J
ICBFbmFibGUgYnpJbWFnZSBzaWduYXR1cmUgdmVyaWZpY2F0aW9uIHN1cHBvcnQuDQo+ICtjb25m
aWcgQVJDSF9TVVBQT1JUU19LRVhFQ19CWklNQUdFX1ZFUklGWV9TSUcNCj4gKwlkZWZfYm9vbCB5
DQo+ICAgDQo+IC1jb25maWcgQ1JBU0hfRFVNUA0KPiAtCWJvb2wgImtlcm5lbCBjcmFzaCBkdW1w
cyINCj4gLQlkZXBlbmRzIG9uIFg4Nl82NCB8fCAoWDg2XzMyICYmIEhJR0hNRU0pDQo+IC0JaGVs
cA0KPiAtCSAgR2VuZXJhdGUgY3Jhc2ggZHVtcCBhZnRlciBiZWluZyBzdGFydGVkIGJ5IGtleGVj
Lg0KPiAtCSAgVGhpcyBzaG91bGQgYmUgbm9ybWFsbHkgb25seSBzZXQgaW4gc3BlY2lhbCBjcmFz
aCBkdW1wIGtlcm5lbHMNCj4gLQkgIHdoaWNoIGFyZSBsb2FkZWQgaW4gdGhlIG1haW4ga2VybmVs
IHdpdGgga2V4ZWMtdG9vbHMgaW50bw0KPiAtCSAgYSBzcGVjaWFsbHkgcmVzZXJ2ZWQgcmVnaW9u
IGFuZCB0aGVuIGxhdGVyIGV4ZWN1dGVkIGFmdGVyDQo+IC0JICBhIGNyYXNoIGJ5IGtkdW1wL2tl
eGVjLiBUaGUgY3Jhc2ggZHVtcCBrZXJuZWwgbXVzdCBiZSBjb21waWxlZA0KPiAtCSAgdG8gYSBt
ZW1vcnkgYWRkcmVzcyBub3QgdXNlZCBieSB0aGUgbWFpbiBrZXJuZWwgb3IgQklPUyB1c2luZw0K
PiAtCSAgUEhZU0lDQUxfU1RBUlQsIG9yIGl0IG11c3QgYmUgYnVpbHQgYXMgYSByZWxvY2F0YWJs
ZSBpbWFnZQ0KPiAtCSAgKENPTkZJR19SRUxPQ0FUQUJMRT15KS4NCj4gLQkgIEZvciBtb3JlIGRl
dGFpbHMgc2VlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2R1bXAva2R1bXAucnN0DQo+ICtj
b25maWcgQVJDSF9TVVBQT1JUU19LRVhFQ19KVU1QDQo+ICsJZGVmX2Jvb2wgeQ0KPiAgIA0KPiAt
Y29uZmlnIEtFWEVDX0pVTVANCj4gLQlib29sICJrZXhlYyBqdW1wIg0KPiAtCWRlcGVuZHMgb24g
S0VYRUMgJiYgSElCRVJOQVRJT04NCj4gLQloZWxwDQo+IC0JICBKdW1wIGJldHdlZW4gb3JpZ2lu
YWwga2VybmVsIGFuZCBrZXhlY2VkIGtlcm5lbCBhbmQgaW52b2tlDQo+IC0JICBjb2RlIGluIHBo
eXNpY2FsIGFkZHJlc3MgbW9kZSB2aWEgS0VYRUMNCj4gK2NvbmZpZyBBUkNIX1NVUFBPUlRTX0NS
QVNIX0RVTVANCj4gKwlkZWZfYm9vbCBYODZfNjQgfHwgKFg4Nl8zMiAmJiBISUdITUVNKQ0KPiAg
IA0KPiAgIGNvbmZpZyBQSFlTSUNBTF9TVEFSVA0KPiAgIAloZXggIlBoeXNpY2FsIGFkZHJlc3Mg
d2hlcmUgdGhlIGtlcm5lbCBpcyBsb2FkZWQiIGlmIChFWFBFUlQgfHwgQ1JBU0hfRFVNUCkNCg==
