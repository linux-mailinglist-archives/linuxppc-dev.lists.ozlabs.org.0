Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6A783D0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 11:39:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=F3Ok798y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVPT74kxLz3c2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 19:39:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=F3Ok798y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::619; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVPSF1fx5z2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 19:39:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRHu++Yo9T4PAqMlaY+BxKXD66i9vAhVIRIlkSQI86IqLKUKSSlOZsC5+jjqOX+m1tGokDz+GL67kQQSntbdghIgQVaUrCIGyf/6qAPKPvXxwf3dbMrHpcrb72mWCtpnjuw83gb98T4igARxqiNoz71XknQOwvesDHw4oP0E853Qnud8wJPOOIFqqV0XAP+C/J73A8gu1rcOhYG/h2UixNuKRlCqX6sUrIkK5vP8/ogez1TQ8vg1VOChGSNtGCA7A59SgmzbzPNIJ7Dcza6oc5XJ7lFL6wYvnRulgIneFrlbviNTFiTkvu8JnQUlhfItS2JzZwOFqRUAb8OyLnTSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH/l2CNgTa9S+IgIgIgcvnAAZSGrVh8OhHz2mTSqaak=;
 b=RxTVXtO3KEA83kt1YlujgSzDo9BK9ZL5DXqwOqGzQRmOFS6uiEADUV4/3cAxFAUDCnfZAIlCnGvytes7uuEaJS5fGhheAw85Fj4BoyFDHiHNE8jwhRwmYRwsFV+NBl+w92Fa/7RuKiHMN7NQFUeb1GnvhYIelyA1vwqhRVoYSccrUY21UtCo9hPHMckc/BcmmipbJ6aOse6v33r1MiKhP5PF1afbIkxQCfOHRJe0AvNPJkwh0fLj84DM5YbcqhxeWb9Hmhg25remSCgkF1Pv2vhuqSpkOeCDwA8sIFc1Rbk24Br1LBP43kwTioqHU2DORFkcJehXnydkhFRCiNUOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH/l2CNgTa9S+IgIgIgcvnAAZSGrVh8OhHz2mTSqaak=;
 b=F3Ok798yndOm8gSvUK9lN7G665eBeTho2+ITiKWkPJsLeJ3YUoqOYBPwj/FKOA6fKZXOCCTAvLsDN8gC3OVNnN8Mcu2bzozhq8E/yjWPIq1Mubj817ejGIyBecfgLTuvOQ3mBdckNGYyz52QdXlGW8rt3Tlruzl74MsDRAvroZkCgRCZppMGUvJ879F2tn0X4V7dbAPA64APUKxJGFAmBTOZMrhsDKhUf9slxI6FfF898PtW2uOTBZxiKmPST3VZNNuA7BCLCtpH6QT/Uwmhxc6y6dS9aKlfFoin9I1CHJ7XzevUkeW29cshPuIcIpkIuItrB695Ay2GzhU7kYFU4A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3167.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 09:38:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 09:38:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton
	<akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH rfc v2 05/10] powerpc: mm: use try_vma_locked_page_fault()
Thread-Topic: [PATCH rfc v2 05/10] powerpc: mm: use
 try_vma_locked_page_fault()
Thread-Index: AQHZ1Ctmq7Potl0WZU+a4ok98ufykK/2EI0A
Date: Tue, 22 Aug 2023 09:38:47 +0000
Message-ID: <7eeed961-c2c0-2aeb-ff8c-3717de09d605@csgroup.eu>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-6-wangkefeng.wang@huawei.com>
In-Reply-To: <20230821123056.2109942-6-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3167:EE_
x-ms-office365-filtering-correlation-id: 49cabab4-84af-4e15-1d96-08dba2f395ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cTGBMk5ixqVUvzj5NO3dhjPSyk8HDb3vdX6OgNpuL+SIi7uFCNEWM6BHcWhhGz/l0890lxMOABdioLRPEqznsubV3HN0OWbg4RFZ+ga2EqmbYnWIOjLw+7doSZxF7W1BFAuXVDOWLQFZ/2rYdcMofAzHlNmjtUWc/nmwOuKvb+pThcueitu/naoT2L+RVGQ2r9b3lzWHkTVaDBVjCmfGlfHqq5OB0TZA8OYKeafK+tQJwqVCDuyhIt7TVmh0hJcbJF0RwegdZkFxcM9neFAwBfAxSAiaMZVPv4BfVcyL46HxwZKvnW/lfJsQ34IIKP450SKLUEo17Zcol4FaAV+eOYtLEhpD4JF3MP6FkbqDC9VP2viGfj594AKhoG+XKWHYRT3DqBYCs0h+Z8JJ5oBpKH700PQtPfYtQcT/e9eGzyP9thnZGmsJUh8EpTVT1VCUuExqcKKMN/jvnoQfYJUaJrQyDSaR1H7NP0cERJwm5T29YW9sdHAFSRkIXiAMEXQPWxZNxtJQNcNhH8ul0lY+s8prJ7KvpQk6/8MMrf6qeeWvCiDH1kVv0ox9leMBFOJdMIEFQUj5ZKPrlOf7D1iCDzgJkGMwzsQ2+xe8IML65tyaAT3suCnH1tDsNavD4RaRwWy1T1wL5saxZ5Yo9n1tD7gr4v4OIiQnF2RK1ebBDYCsHmY9DVUJmPlCcgapupNT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(66574015)(7416002)(7406005)(38070700005)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(6512007)(66946007)(64756008)(66446008)(76116006)(54906003)(66556008)(66476007)(91956017)(110136005)(66899024)(478600001)(122000001)(71200400001)(36756003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Rms4NURHZUJrZkhPSnJMTHN6S3lqSHBXRFJ2bkhqNnNGRmMvOThTSkNQZmRE?=
 =?utf-8?B?WlRtVXVzbm1Sb3ZOeTBqS2hiRHhmYVE3ZHZGWkpnZDNCRHlldnRtbzNFWTli?=
 =?utf-8?B?RURWQUE1MW95T2RsbitPS3hJSmpzWkVIL1BVRVBZcWJJdENjTE0xYW1WcjNw?=
 =?utf-8?B?d3ZzN1cwZ1pBN05xS05landHSzVpdGpnd2M4eWxLMkNmQU5UdDNadmE2Y3dJ?=
 =?utf-8?B?S0V5TTNQeVNkWUtGd1ZURHJTdld5MG5CRXZKQ09nekNnaUlNbzJDWkJETno0?=
 =?utf-8?B?cG5wQ1Z6ZTJ5TS9mK1JlVUF4cHZhdzRFa0RWeUNmeDVqcmhXQndCdnlTdW44?=
 =?utf-8?B?dDk5QUlScHdFMkZFV1hrK1lMNVhiN2JPMHVaZ05hZjE5Z2p0SWkwdk91QXJm?=
 =?utf-8?B?VFN3SGh1R0d1djNlSWxEdzNQR05jdW54alpHYlVpVXFiQlAzdmZUbnZVc2FI?=
 =?utf-8?B?M1pVZ0hYMzk0cXhuaElkanRwWEg5UGZ6THlLeGY3Z1Nqb3Fjc1AvSHdxK2tk?=
 =?utf-8?B?cytuSEUzM2ZNQVdUbWt1MFgvcTMvSkx2d0dMY2hsdlROOGpiWEFWME4xRXNs?=
 =?utf-8?B?ekRacnc4Q3J5VWNYREhoODdaVXU1NmFCbGRXV3IxTWp0dnJpVlh2V3J3cHRL?=
 =?utf-8?B?UGtKWUxpc2l5aS9rdkNPS2MyNEJ2bWEvNzFBV0xhemVlM0l5bU5MT0NPTUxY?=
 =?utf-8?B?TC9Oc3I3eGpyMXNLVXA2TVYzdEhnWW5nRVZaemphbklKZXBBdzc4ejhjekZ3?=
 =?utf-8?B?Sm5ka3B2cXhXdFdBSmtyYit2c2JVellTZnY5S3JqdzA4S1htQzlGcVY1KzVt?=
 =?utf-8?B?ZDQvcWpJNm1adlNReWNpTXJSaE90aXJoQlZ4ZU9KTGNDZytxYlRzVklyczNy?=
 =?utf-8?B?UTRhNlZnRjVvdm9FVi81dGoyQ3NleGtFRExqQ3Q5VGJSaE5jd2JLMk52Zzh3?=
 =?utf-8?B?cldkdDh1OTNJakl4VGNHcVZaY053U24yVXF0L1d2eU03a2QzNzBQZldEczJW?=
 =?utf-8?B?d2MzdkZTZzYrKzZpdUc0NlBpaUJ4TUUzaVYzeDV5dGlkeXR2dTVqMUhJVW92?=
 =?utf-8?B?QkdxeXJ5VThoL2xzWnoyc3Z3SG5RU3JJYXBwcTVzQ3FjOXJLNDV5VUoyWHBM?=
 =?utf-8?B?Y0hBVzJmOVZJeFN1SVAwaU0vSFhUeW1naHRyMVZBWGJ0NlA5d1J3WjkxbWpr?=
 =?utf-8?B?QUZMUGtpNm11S09qMFJHdkE1U0hmdkJINHNNVlUwdk1XQjhWa1B1Q1d5NitO?=
 =?utf-8?B?bTlsQ1ZWNkZHS0pRa2RBVW5WYXZaZFVOMmVmdzNZbTBiSTA1UVZZbUNHZFFv?=
 =?utf-8?B?M3BzQlVqSytMV28zVDBnT2NHczVCajFKcEdpVXU2U0NTTlpkWjEwanlaNXd6?=
 =?utf-8?B?NmswZkFPeEJaTVNsRldiaHRaQllwQS9ZNG16S0c4aUNMS2ZpQ0Ztc3hRYkQ1?=
 =?utf-8?B?cE9CMFVrL3loV0U2bnZCOGM3bmdaVWVIcVhicXBmWkdTV2w5SXBGZDR4Q0Jx?=
 =?utf-8?B?ZUFldTZxVklWM1p4T1hTQnl0OHA5V2RPQ0Fwb0pTNUJjOTkwMlVwKzVlRHNJ?=
 =?utf-8?B?TkRMOGV3TEdjQWlrd1NISVYxTG1tS25rS25OOXlHZkpxRGFTR1Qybm15L0ZC?=
 =?utf-8?B?NnlGN1ZSbFRzMXpRL04wbFRpLzM0Q1hpNHV2eGpMcHZSaU1FcGdUb2ZhU3o2?=
 =?utf-8?B?UFZFSU9rSkhNK3VBYWdBTmtuNDROOXFaRk4wQUU0NzFHd1FySGU4V3FGVWlM?=
 =?utf-8?B?Y2FOZHUzMUdKbkpLeDd5ZmRmTE1wZ2dWNEorcjFiOVhGeFVzNjI5QUZKVTVZ?=
 =?utf-8?B?MnIvclFBN2g3Z0lKWXZFbXBZRDJ0VC95K2lnNHRleG1rNnJ5Nlg3d3lEZ1hw?=
 =?utf-8?B?QnE0dUE5alM5bklBODNlVWR5MElpcHV6K28zQWhmWlFtVHRwcjBTZmIraGdT?=
 =?utf-8?B?YlBsREJpK2c0K3VFSXJNOWM3ZGRWTzMwWDJlT1JQQjlwaHN2NzUxVFdqSTBU?=
 =?utf-8?B?Q0NLMTZZaDFjakVTQVFGTWEyMWNYcm83U3NYdTkvWUt0MG5zNDRpVHdOMWQv?=
 =?utf-8?B?dTRTWit2Q0F1TXYrWDRVYzc3bHZaOWdVU2NVTVNRNTNtVTZhOE8wLzI5M2Ra?=
 =?utf-8?B?UUJGNVRZRHhWWVZNM0s5ZFNvU3l4RUlkSkxEWVFIcmJnZHVUUDZKR3NtbCt1?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE7D90B0D7BC114ABCA6BD087463CBE9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cabab4-84af-4e15-1d96-08dba2f395ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 09:38:47.6502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYc7eufCQHFv9LswbK/kooR8GGP2tEM50FDy8P60bSEDk8sH0paqB6B4SoHltRB4T4fgyVuqaaRiKiVgsl75ng8mOAivB2cTt4dO3RoaGXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3167
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "willy@infradead.org" <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, "surenb@google.com" <surenb@googl
 e.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzA4LzIwMjMgw6AgMTQ6MzAsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFVz
ZSBuZXcgdHJ5X3ZtYV9sb2NrZWRfcGFnZV9mYXVsdCgpIGhlbHBlciB0byBzaW1wbGlmeSBjb2Rl
Lg0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCg0KRG9lcyBpdCByZWFsbHkgc2lt
cGxpZmllcyBjb2RlID8gSXQncyAzMiBpbnNlcnRpb25zIHZlcnN1cyAzNCBkZWxldGlvbnMgDQpz
byBvbmx5IHJlbW92aW5nIDIgbGluZXMuDQoNCkkgZG9uJ3QgbGlrZSB0aGUgc3RydWN0IHZtX2Zh
dWx0IHlvdSBhcmUgYWRkaW5nIGJlY2F1c2Ugd2hlbiBpdCB3YXMgZm91ciANCmluZGVwZW5kYW50
IHZhcmlhYmxlcyBpdCB3YXMgaGFuZGxlZCB0aHJvdWdoIGxvY2FsIHJlZ2lzdGVycy4gTm93IHRo
YXQgDQppdCBpcyBhIHN0cnVjdCBpdCBoYXMgdG8gZ28gdmlhIHRoZSBzdGFjaywgbGVhZGluZyB0
byB1bm5lY2Vzc2FyeSBtZW1vcnkgDQpyZWFkIGFuZCB3cml0ZXMuIEFuZCBnb2luZyBiYWNrIGFu
ZCBmb3J0aCBiZXR3ZWVuIGFyY2hpdGVjdHVyZSBjb2RlIGFuZCANCmdlbmVyaWMgY29kZSBtYXkg
YWxzbyBiZSBjb3VudGVyLXBlcmZvcm1hbnQuDQoNCkRpZCB5b3UgbWFrZSBhbnkgcGVyZm9ybWFu
Y2UgYW5hbHlzaXMgPyBQYWdlIGZhdWx0cyBhcmUgcmVhbGx5IGEgaG90IA0KcGF0aCB3aGVuIGRl
YWxsaW5nIHdpdGggbWlub3IgZmF1bHRzLg0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vZmF1bHQuYyB8IDY2ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKyksIDM0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9t
bS9mYXVsdC5jIGIvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4gaW5kZXggYjE3MjMwOTRkNDY0
Li41MmY5NTQ2ZTAyMGUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jDQo+
ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9mYXVsdC5jDQo+IEBAIC0zOTEsNiArMzkxLDIyIEBAIHN0
YXRpYyBpbnQgcGFnZV9mYXVsdF9pc19iYWQodW5zaWduZWQgbG9uZyBlcnIpDQo+ICAgI2RlZmlu
ZSBwYWdlX2ZhdWx0X2lzX2JhZChfX2VycikJKChfX2VycikgJiBEU0lTUl9CQURfRkFVTFRfMzJT
KQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19QRVJfVk1BX0xPQ0sNCj4gK2Jv
b2wgYXJjaF92bWFfYWNjZXNzX2Vycm9yKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZikNCj4gK3sNCj4gKwlpbnQgaXNfZXhlYyA9IFRSQVAodm1mLT5yZWdz
KSA9PSBJTlRFUlJVUFRfSU5TVF9TVE9SQUdFOw0KPiArCWludCBpc193cml0ZSA9IHBhZ2VfZmF1
bHRfaXNfd3JpdGUodm1mLT5mYXVsdF9jb2RlKTsNCj4gKw0KPiArCWlmICh1bmxpa2VseShhY2Nl
c3NfcGtleV9lcnJvcihpc193cml0ZSwgaXNfZXhlYywNCj4gKwkJCQkodm1mLT5mYXVsdF9jb2Rl
ICYgRFNJU1JfS0VZRkFVTFQpLCB2bWEpKSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gKwlp
ZiAodW5saWtlbHkoYWNjZXNzX2Vycm9yKGlzX3dyaXRlLCBpc19leGVjLCB2bWEpKSkNCj4gKwkJ
cmV0dXJuIHRydWU7DQo+ICsJcmV0dXJuIGZhbHNlOw0KPiArfQ0KPiArI2VuZGlmDQo+ICsNCj4g
ICAvKg0KPiAgICAqIEZvciA2MDAtIGFuZCA4MDAtZmFtaWx5IHByb2Nlc3NvcnMsIHRoZSBlcnJv
cl9jb2RlIHBhcmFtZXRlciBpcyBEU0lTUg0KPiAgICAqIGZvciBhIGRhdGEgZmF1bHQsIFNSUjEg
Zm9yIGFuIGluc3RydWN0aW9uIGZhdWx0Lg0KPiBAQCAtNDA3LDEyICs0MjMsMTggQEAgc3RhdGlj
IGludCBfX19kb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25n
IGFkZHJlc3MsDQo+ICAgew0KPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKiB2bWE7DQo+ICAg
CXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07DQo+IC0JdW5zaWduZWQgaW50IGZs
YWdzID0gRkFVTFRfRkxBR19ERUZBVUxUOw0KPiAgIAlpbnQgaXNfZXhlYyA9IFRSQVAocmVncykg
PT0gSU5URVJSVVBUX0lOU1RfU1RPUkFHRTsNCj4gICAJaW50IGlzX3VzZXIgPSB1c2VyX21vZGUo
cmVncyk7DQo+ICAgCWludCBpc193cml0ZSA9IHBhZ2VfZmF1bHRfaXNfd3JpdGUoZXJyb3JfY29k
ZSk7DQo+ICAgCXZtX2ZhdWx0X3QgZmF1bHQsIG1ham9yID0gMDsNCj4gICAJYm9vbCBrcHJvYmVf
ZmF1bHQgPSBrcHJvYmVfcGFnZV9mYXVsdChyZWdzLCAxMSk7DQo+ICsJc3RydWN0IHZtX2ZhdWx0
IHZtZiA9IHsNCj4gKwkJLnJlYWxfYWRkcmVzcyA9IGFkZHJlc3MsDQo+ICsJCS5mYXVsdF9jb2Rl
ID0gZXJyb3JfY29kZSwNCj4gKwkJLnJlZ3MgPSByZWdzLA0KPiArCQkuZmxhZ3MgPSBGQVVMVF9G
TEFHX0RFRkFVTFQsDQo+ICsJfTsNCj4gKw0KPiAgIA0KPiAgIAlpZiAodW5saWtlbHkoZGVidWdn
ZXJfZmF1bHRfaGFuZGxlcihyZWdzKSB8fCBrcHJvYmVfZmF1bHQpKQ0KPiAgIAkJcmV0dXJuIDA7
DQo+IEBAIC00NjMsNDUgKzQ4NSwyMSBAQCBzdGF0aWMgaW50IF9fX2RvX3BhZ2VfZmF1bHQoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywNCj4gICAJICogbW1hcF9s
b2NrIGhlbGQNCj4gICAJICovDQo+ICAgCWlmIChpc191c2VyKQ0KPiAtCQlmbGFncyB8PSBGQVVM
VF9GTEFHX1VTRVI7DQo+ICsJCXZtZi5mbGFncyB8PSBGQVVMVF9GTEFHX1VTRVI7DQo+ICAgCWlm
IChpc193cml0ZSkNCj4gLQkJZmxhZ3MgfD0gRkFVTFRfRkxBR19XUklURTsNCj4gKwkJdm1mLmZs
YWdzIHw9IEZBVUxUX0ZMQUdfV1JJVEU7DQo+ICAgCWlmIChpc19leGVjKQ0KPiAtCQlmbGFncyB8
PSBGQVVMVF9GTEFHX0lOU1RSVUNUSU9OOw0KPiArCQl2bWYuZmxhZ3MgfD0gRkFVTFRfRkxBR19J
TlNUUlVDVElPTjsNCj4gICANCj4gLQlpZiAoIShmbGFncyAmIEZBVUxUX0ZMQUdfVVNFUikpDQo+
IC0JCWdvdG8gbG9ja19tbWFwOw0KPiAtDQo+IC0Jdm1hID0gbG9ja192bWFfdW5kZXJfcmN1KG1t
LCBhZGRyZXNzKTsNCj4gLQlpZiAoIXZtYSkNCj4gLQkJZ290byBsb2NrX21tYXA7DQo+IC0NCj4g
LQlpZiAodW5saWtlbHkoYWNjZXNzX3BrZXlfZXJyb3IoaXNfd3JpdGUsIGlzX2V4ZWMsDQo+IC0J
CQkJICAgICAgIChlcnJvcl9jb2RlICYgRFNJU1JfS0VZRkFVTFQpLCB2bWEpKSkgew0KPiAtCQl2
bWFfZW5kX3JlYWQodm1hKTsNCj4gLQkJZ290byBsb2NrX21tYXA7DQo+IC0JfQ0KPiAtDQo+IC0J
aWYgKHVubGlrZWx5KGFjY2Vzc19lcnJvcihpc193cml0ZSwgaXNfZXhlYywgdm1hKSkpIHsNCj4g
LQkJdm1hX2VuZF9yZWFkKHZtYSk7DQo+IC0JCWdvdG8gbG9ja19tbWFwOw0KPiAtCX0NCj4gLQ0K
PiAtCWZhdWx0ID0gaGFuZGxlX21tX2ZhdWx0KHZtYSwgYWRkcmVzcywgZmxhZ3MgfCBGQVVMVF9G
TEFHX1ZNQV9MT0NLLCByZWdzKTsNCj4gLQlpZiAoIShmYXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8
IFZNX0ZBVUxUX0NPTVBMRVRFRCkpKQ0KPiAtCQl2bWFfZW5kX3JlYWQodm1hKTsNCj4gLQ0KPiAt
CWlmICghKGZhdWx0ICYgVk1fRkFVTFRfUkVUUlkpKSB7DQo+IC0JCWNvdW50X3ZtX3ZtYV9sb2Nr
X2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOw0KPiArCWZhdWx0ID0gdHJ5X3ZtYV9sb2NrZWRfcGFn
ZV9mYXVsdCgmdm1mKTsNCj4gKwlpZiAoZmF1bHQgPT0gVk1fRkFVTFRfTk9ORSkNCj4gKwkJZ290
byByZXRyeTsNCj4gKwlpZiAoIShmYXVsdCAmIFZNX0ZBVUxUX1JFVFJZKSkNCj4gICAJCWdvdG8g
ZG9uZTsNCj4gLQl9DQo+IC0JY291bnRfdm1fdm1hX2xvY2tfZXZlbnQoVk1BX0xPQ0tfUkVUUlkp
Ow0KPiAgIA0KPiAgIAlpZiAoZmF1bHRfc2lnbmFsX3BlbmRpbmcoZmF1bHQsIHJlZ3MpKQ0KPiAg
IAkJcmV0dXJuIHVzZXJfbW9kZShyZWdzKSA/IDAgOiBTSUdCVVM7DQo+ICAgDQo+IC1sb2NrX21t
YXA6DQo+IC0NCj4gICAJLyogV2hlbiBydW5uaW5nIGluIHRoZSBrZXJuZWwgd2UgZXhwZWN0IGZh
dWx0cyB0byBvY2N1ciBvbmx5IHRvDQo+ICAgCSAqIGFkZHJlc3NlcyBpbiB1c2VyIHNwYWNlLiAg
QWxsIG90aGVyIGZhdWx0cyByZXByZXNlbnQgZXJyb3JzIGluIHRoZQ0KPiAgIAkgKiBrZXJuZWwg
YW5kIHNob3VsZCBnZW5lcmF0ZSBhbiBPT1BTLiAgVW5mb3J0dW5hdGVseSwgaW4gdGhlIGNhc2Ug
b2YgYW4NCj4gQEAgLTUyOCw3ICs1MjYsNyBAQCBzdGF0aWMgaW50IF9fX2RvX3BhZ2VfZmF1bHQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywNCj4gICAJICogbWFr
ZSBzdXJlIHdlIGV4aXQgZ3JhY2VmdWxseSByYXRoZXIgdGhhbiBlbmRsZXNzbHkgcmVkbw0KPiAg
IAkgKiB0aGUgZmF1bHQuDQo+ICAgCSAqLw0KPiAtCWZhdWx0ID0gaGFuZGxlX21tX2ZhdWx0KHZt
YSwgYWRkcmVzcywgZmxhZ3MsIHJlZ3MpOw0KPiArCWZhdWx0ID0gaGFuZGxlX21tX2ZhdWx0KHZt
YSwgYWRkcmVzcywgdm1mLmZsYWdzLCByZWdzKTsNCj4gICANCj4gICAJbWFqb3IgfD0gZmF1bHQg
JiBWTV9GQVVMVF9NQUpPUjsNCj4gICANCj4gQEAgLTU0NCw3ICs1NDIsNyBAQCBzdGF0aWMgaW50
IF9fX2RvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRk
cmVzcywNCj4gICAJICogY2FzZS4NCj4gICAJICovDQo+ICAgCWlmICh1bmxpa2VseShmYXVsdCAm
IFZNX0ZBVUxUX1JFVFJZKSkgew0KPiAtCQlmbGFncyB8PSBGQVVMVF9GTEFHX1RSSUVEOw0KPiAr
CQl2bWYuZmxhZ3MgfD0gRkFVTFRfRkxBR19UUklFRDsNCj4gICAJCWdvdG8gcmV0cnk7DQo+ICAg
CX0NCj4gICANCg==
