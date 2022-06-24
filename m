Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884C5591D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTm150yPMz3f1J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=H/BTggDA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.87; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=H/BTggDA;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90087.outbound.protection.outlook.com [40.107.9.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTm0N3g8Yz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:29:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRzSN3gAx6SPNp1opnuUm9wCoAy9esUod3ARlzAu0Q2aPqNDT4q+f3GrZC6RkT0LVSag5qfG5cJ7rfiFoyw801MYLLFPZ3v1U2vkEzRGDBKFkn23990Ykm4jqmexoU0fLybDW56T/LX+om/4nyvcoRPpRt69Vs2BWv2KTix52vxgjkxRX1mUUW2WeUYD7fk6czCeuRe7Zkl2Lg1gD5An2FOJ6vhAN6sqk5usDZc6Ywe0cZ+ck373qpLnyjy/GUScA9SKm0E9yAAyP7p2Vq16EIjMDiObDNrLUEA8RQ23Y7v6QTedv4aFFsN3770wxv8m76Zgxw1YPaJCppsl86sO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0yeQydWwEHqDA6Wugq5yAN59wGGgcFZRk/WlnzLy7g=;
 b=eOPLIrKGZaSu5Iz1nlsYS9bIFTtgVOpT3YP1VOAbpF90iR/01mJHY3O5YCUuJ9lmdVCH4Ov+u29Fmrz9CmTEeB//3mUn7oeQ0X/NpMcuYylbNJDqCJyj0yb4i/ZZ9YEHNoV35xSRuRIj0RdaLnbI0z7b1RXbMr/ATIEfvYnV44XxFYXtJXPZEHbmbQPmBSXdLQqhUth0VKVPp3MGrv8lroiVMDjttqUuzZFga9GmEa2olQNCoMdMRjQgqbc38FOUb3OE3gfoPQEWoslMDJNf1Trm1aXqnLxtLxhZ8+ZTJ559Wk6zqtUySg+DUjCJOJ84kkig+ItfEfHbmnhYK5X8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0yeQydWwEHqDA6Wugq5yAN59wGGgcFZRk/WlnzLy7g=;
 b=H/BTggDAJK2gpoHXhlTbpZsFvn+GSPDB5Srbciue5l9KG7sAjy3bluN+qP19ZcMupNyh65ytuUBHjpsW+bKM5ZCT1j/7z+ex1npQYLYlMBUt9ELUTYH5AqLK0A4Y5SjeKlQF01/3IStu0nZjGLhxA0UW0jlvQ5ddnLZiBicbTddssUIIQWp0FLYOrNk+U4ewrmKnoOS2eJIk2HiDiNIRHQxWIRk085Hxul4W3oaGsGzwo+Iiwvq9JSUJpiwddXolPhCn2IgumCuGTPURjAPOWT9CyswGSZMPBHIxK9eu3L39Sv0tZPcm7dKjw2WwtOw/k9EcsBpomfSBZVEDhUMczw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2882.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 05:29:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:29:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYh4WDYdNDDmUyYEaka3z7yJYQ461eB70A
Date: Fri, 24 Jun 2022 05:29:38 +0000
Message-ID: <fa9cf9bb-841d-69d8-c243-ab339a891cc7@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-27-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-27-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69fb205d-cd22-42e2-3225-08da55a28834
x-ms-traffictypediagnostic: MR1P264MB2882:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZgtSeEOxRIVMxrJy3NXZE/6Ic9bVuUhftZnj6vsb87PPIyybqypH4z6sMLKOKoOIvtssLshHrXbiLaOQRR4EJyWThoZIH95nVN5b7um7+noX3rlgswOB4szsu27SnBjU+2DPs9nVAlw9MqlTeOthJaZz87cpKdVhXC+e+6uBg+s3q2pPZs7q7TlhqoO/TTi5OJdymAGRqpKatMtD93yKGPHpVfd0n1C58TLkbVtLpb6M01K6CIria+6r5svmvMNFVhYktcrzgV+/MVtZyxJgSH/zMk9Gdu32/SzWH18Y63p1Sa3bjxKUGqI2xRAEOG9x9fJi6iF1CzCOwzxMO6ADo+mImq9hqKf2rvgSdNzakdZ2A7YsXT32GR9Nq9MdbcCTQswwK9921yNhZagpof824hR8yRk0roSXiDS3Epd2yTs6dN3bfJyn6uDxm3t4VAlgZQPLnzOWxPJLwjL+IvtY+hNk2qU9KEVEfFSIgFcusXckhXWZIDnSbXAxu6CoN3wnIbFtDTTaYR8i1elab1KdDQ/ideeDL3xrjxBjfvtUqTL1JDH1TP7lvAuqDih2waQbTUWrGOQ5HKIXzu7NrGFe+yL33G6F+64byUj8ThBn3eQ/NMvrELAo5YvczKhvqbosmHY7NVcx741D2q+bEZm5J6uam9cGj+dL92GxkHRywNjF118zTUH9lEU1vL/T/simQCgFnaPI76q7vgWKTwxCdliLOgHrKTPTi3cWt86j1yDESk7KHI+1bIuIYwpb/Ublkt8TnbQ0pjaFG7e300zTcbLVvlPYk7XfEawA9FNikB+oPhyrFmV8KQZaxNF4lC93IxykE9pUdgET3sMbUsK8Vlp3etUqq8bRQUgVKVqGfrQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(2906002)(6512007)(31696002)(26005)(31686004)(6486002)(478600001)(38100700002)(6506007)(91956017)(8936002)(71200400001)(86362001)(41300700001)(38070700005)(2616005)(5660300002)(7416002)(186003)(122000001)(110136005)(83380400001)(8676002)(66946007)(36756003)(44832011)(66446008)(66476007)(316002)(54906003)(76116006)(4326008)(64756008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dGdMVDVJUWV6MDd6U2pCS0JtU01Vc2N1bjRYR2U2bnBKM3VHRHdBMFNrbEEv?=
 =?utf-8?B?TlZjUGxUVGxzN1RDSXV0WUdKZDg4R2Erd0txekNqVXVRRkowaXJnUlNRMXF6?=
 =?utf-8?B?clFiR0VUaUxFSkhWQ1RkRS8wNk5ac2JNckM2aTVUMDBsaS9TUlBsNm1VWkdM?=
 =?utf-8?B?QmxWLzB0SVpXcUUvaG9JZUlPbnB6cTBXOC9QQjRIbk9ZMjZrS3FrRFhId0x1?=
 =?utf-8?B?ajhPU0pMaUkwcG9LRjVYWVl3WTBOdzRQVFczQ2crcjI0SHVVSW5RU24ycXVo?=
 =?utf-8?B?OHVsNVI2Ymh6bmlMTEJEN0RFZUlJS3A5WjI2Y0I5ejlaTUx3YXEyM3A0bk9i?=
 =?utf-8?B?RytPOGFsRC9XVFdNK2hTdHNJZWhIK3VuZGFhNjBSR2g2WDhrS0FFK2hMcWUy?=
 =?utf-8?B?eExmbk5oYWNQVjBXS09zR25laGN1RG1TdllOMkVUaHV4WDZHQzVQZldxZmV1?=
 =?utf-8?B?VDJrUWZKQmhoYXZjTWVXZExCS2JEMzg5M0YrRkpNa0VxWEJHME9YZmFsYVdN?=
 =?utf-8?B?S1IyYk1DTzZ6cnRITExhaWw3SzkzUk1Kbm9iQW02L2xuL2dXbVlHRTVTNGpo?=
 =?utf-8?B?eXdkbHVBVUVoUnB1ZHY0c2J0K2NIVVlOVHVuVGVTaWY2SkJRNjQrdlJ0dWty?=
 =?utf-8?B?UFh2NDBVM1J6SUNaYXE0WDB1K0RaTzBSUjZrS2gyVS9Lcm9LeW94N2o5SEtp?=
 =?utf-8?B?dGJFS05tR2crZ2RJc0dQeFRZSTRvZFlvRjJyYnAwZ3ZpakNIbXcyWUtoV3Q1?=
 =?utf-8?B?K1p4NXVCeGxMekt1MXh5M0V3OEM2QmY3bXo4WU1oN1daT2VudFVpMzhZdnNs?=
 =?utf-8?B?SzBGREFPdEtPQW80TC9XSndjYlJNSENOL2ZVTk5uZWw0QWl5UjJGY1JQRnFi?=
 =?utf-8?B?MDUrVGE1WDRxTHZYa1NhWFlad1RVMnFvL2NnTkd2TmIwSDUvUlU2NlAyNkp0?=
 =?utf-8?B?ZytOcGg3cGhzbE9hdDMxMEpJVDhoOXJ6ZUkxU2pzYzlmQkZwcnZFckE4b0F5?=
 =?utf-8?B?WnBaczNWQjRUSGcxYkc2L2VZNENtS0xKQlV2TVhJWGpmZFp3SnVoSys2WTg3?=
 =?utf-8?B?T1lrMjU2UXAvNEVDL0RtZytHQzlPNEtyL1UrUzNyeVFJUmNvOG5hWXJrc2w3?=
 =?utf-8?B?TjVMQ0V1d0RKTGdYYVdKaytVQkhjNGZJZEpwT2loc1ZRb21yTk1ray9iL05u?=
 =?utf-8?B?M0ptZkdKRDE2SXhzWFVoa0xXSEUzcFlvM3dzWElham5wMEdabEV1b0x4Uklx?=
 =?utf-8?B?Wm5rWHRBNW9EUWNYbzJQbmRyRFFsbWpIdkp5SlAyNXlpeWhLTlFSVmJxcnZj?=
 =?utf-8?B?ZDZ0ekpqZUhybi9HM0l1eU9HN1BKY1ZEbStaNGlDMC90YmcrYzRRVnJKZjlK?=
 =?utf-8?B?L3BudENVakNhd2txanhTaFdjeEhaSEc3NlZCOHRoOTRmS0ZTODJkcEpVd3pU?=
 =?utf-8?B?a2VDTkJsYlF1Si9RUkpNWE02WnlNNHVNZGxnbHBYdW1tOTIwZXllbmpSQndj?=
 =?utf-8?B?VEJvZ0dkdjEyV1lyRG5uN2NKVjErdzBPazVCWHM1azZBZ2ZYWHY2OUdKczJ6?=
 =?utf-8?B?bE9UWTlCa0pFejRvTlQzMnRhWks5L3d6YmlWRTB0U1ZUd2VUYmludmFxeGVT?=
 =?utf-8?B?WmY4TjlpN01RR0tlMCsvMEtoeFg2QmMxNWdkM1BJTVB6QWRtTFBYODg0SmxZ?=
 =?utf-8?B?RFQreXB1NjJxYjViWmF6MTcwMU5TaURCTS9lNTlmekZiamExMitiQUM2VHQ3?=
 =?utf-8?B?RmVmY1pFS2xVU3VPRm5udmYxVVRDcldrNExRei9vRzh1N0tQWVVvNDY2d2xO?=
 =?utf-8?B?SndEU2NpMHBMNFlyTFpJMTZpTFpPTHpHSG8rMlNTWWhUWTRjM2VwNHd5cDlN?=
 =?utf-8?B?dFJoeS9EbDErNUdoR21tUkkvLzVONFJoUllQQklwdnp1a0w0Ylo3Zlh1MDgz?=
 =?utf-8?B?THFlNEFZdVJGaWJFK28xVWNnZ082WXdXalFtSjh6RnVmcVk3RTh6S2h6cTBS?=
 =?utf-8?B?S0N6NHhyVTk4QkNjdWpibGdxNno2cFBjZG5HdENoa0xpMzB1bFVWRGtaMGJY?=
 =?utf-8?B?THV0WUxmS21tZzVCWTZrZnRPVEMxc3BvOEowWnpTejNIZWJTaGtDQnhqcEdT?=
 =?utf-8?B?S3FrVlF2QVIvbkZmajFueG8ySFdvZEpwblM4bDVSNjdLajlsUGE3NVA5cnJn?=
 =?utf-8?Q?vaJVZAZ6GgOnOTwGNNLspt0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F9BD59831BEE94EA7E2E1A3F9CA3971@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fb205d-cd22-42e2-3225-08da55a28834
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 05:29:38.3907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2fjukuAmOL3o7t820ml3hD4gmmOERvhj/qaOI+lI6sa+FN/2sSRX7S/YIv27PKeeTGEeDHzwmXdzfW+S+7ZF7aYelJE9iwaS74/J7Rug34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2882
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IE5vdyBhbGwgdGhlIHBsYXRmb3JtcyBlbmFibGUgQVJDSF9IQVNfR0VUX1BBR0VfUFJPVC4g
VGhleSBkZWZpbmUgYW5kIGV4cG9ydA0KPiBvd24gdm1fZ2V0X3BhZ2VfcHJvdCgpIHdoZXRoZXIg
Y3VzdG9tIG9yIHN0YW5kYXJkIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVC4NCj4gSGVuY2UgdGhl
cmUgaXMgbm8gbmVlZCBmb3IgZGVmYXVsdCBnZW5lcmljIGZhbGxiYWNrIGZvciB2bV9nZXRfcGFn
ZV9wcm90KCkuDQo+IEp1c3QgZHJvcCB0aGlzIGZhbGxiYWNrIGFuZCBhbHNvIEFSQ0hfSEFTX0dF
VF9QQUdFX1BST1QgbWVjaGFuaXNtLg0KPiANCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcNCj4gQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1
YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvYWxwaGEvS2Nv
bmZpZyAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvYXJjL0tjb25maWcgICAgICAgIHwgIDEgLQ0KPiAg
IGFyY2gvYXJtL0tjb25maWcgICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvYXJtNjQvS2NvbmZpZyAg
ICAgIHwgIDEgLQ0KPiAgIGFyY2gvY3NreS9LY29uZmlnICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gv
aGV4YWdvbi9LY29uZmlnICAgIHwgIDEgLQ0KPiAgIGFyY2gvaWE2NC9LY29uZmlnICAgICAgIHwg
IDEgLQ0KPiAgIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgIHwgIDEgLQ0KPiAgIGFyY2gvbTY4ay9L
Y29uZmlnICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvbWljcm9ibGF6ZS9LY29uZmlnIHwgIDEgLQ0K
PiAgIGFyY2gvbWlwcy9LY29uZmlnICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvbmlvczIvS2NvbmZp
ZyAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyAgIHwgIDEgLQ0KPiAgIGFy
Y2gvcGFyaXNjL0tjb25maWcgICAgIHwgIDEgLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnICAg
IHwgIDEgLQ0KPiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvczM5
MC9LY29uZmlnICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvc2gvS2NvbmZpZyAgICAgICAgIHwgIDEg
LQ0KPiAgIGFyY2gvc3BhcmMvS2NvbmZpZyAgICAgIHwgIDEgLQ0KPiAgIGFyY2gvdW0vS2NvbmZp
ZyAgICAgICAgIHwgIDEgLQ0KPiAgIGFyY2gveDg2L0tjb25maWcgICAgICAgIHwgIDEgLQ0KPiAg
IGFyY2gveHRlbnNhL0tjb25maWcgICAgIHwgIDEgLQ0KPiAgIGluY2x1ZGUvbGludXgvbW0uaCAg
ICAgIHwgIDMgLS0tDQo+ICAgbW0vS2NvbmZpZyAgICAgICAgICAgICAgfCAgMyAtLS0NCj4gICBt
bS9tbWFwLmMgICAgICAgICAgICAgICB8IDIyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAy
NSBmaWxlcyBjaGFuZ2VkLCA1MCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tbS9t
bWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggNDNkYjNiZDQ5MDcxLi4zNTU3ZmU4M2QxMjQgMTAw
NjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFwLmMNCj4gQEAgLTEwMSwyOCAr
MTAxLDYgQEAgc3RhdGljIHZvaWQgdW5tYXBfcmVnaW9uKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0K
PiAgICAqCQkJCQkJCQl3OiAobm8pIG5vDQo+ICAgICoJCQkJCQkJCXg6ICh5ZXMpIHllcw0KPiAg
ICAqLw0KDQpUaGUgYWJvdmUgY29tbWVudCBpcyBub3Qgb3JwaGFuZWQuIEkgdGhpbmsgaXQgc2hv
dWxkIGdvIGluIGxpbnV4L21tLmgNCg0KPiAtI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VU
X1BBR0VfUFJPVA0KPiAtcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9fcm9fYWZ0ZXJfaW5p
dCA9IHsNCj4gLQlbVk1fTk9ORV0JCQkJCT0gX19QMDAwLA0KPiAtCVtWTV9SRUFEXQkJCQkJPSBf
X1AwMDEsDQo+IC0JW1ZNX1dSSVRFXQkJCQkJPSBfX1AwMTAsDQo+IC0JW1ZNX1dSSVRFIHwgVk1f
UkVBRF0JCQkJPSBfX1AwMTEsDQo+IC0JW1ZNX0VYRUNdCQkJCQk9IF9fUDEwMCwNCj4gLQlbVk1f
RVhFQyB8IFZNX1JFQURdCQkJCT0gX19QMTAxLA0KPiAtCVtWTV9FWEVDIHwgVk1fV1JJVEVdCQkJ
CT0gX19QMTEwLA0KPiAtCVtWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQkJCT0gX19QMTEx
LA0KPiAtCVtWTV9TSEFSRURdCQkJCQk9IF9fUzAwMCwNCj4gLQlbVk1fU0hBUkVEIHwgVk1fUkVB
RF0JCQkJPSBfX1MwMDEsDQo+IC0JW1ZNX1NIQVJFRCB8IFZNX1dSSVRFXQkJCQk9IF9fUzAxMCwN
Cj4gLQlbVk1fU0hBUkVEIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQkJPSBfX1MwMTEsDQo+IC0JW1ZN
X1NIQVJFRCB8IFZNX0VYRUNdCQkJCT0gX19TMTAwLA0KPiAtCVtWTV9TSEFSRUQgfCBWTV9FWEVD
IHwgVk1fUkVBRF0JCQk9IF9fUzEwMSwNCj4gLQlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dS
SVRFXQkJPSBfX1MxMTAsDQo+IC0JW1ZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURSB8IFZN
X1JFQURdCT0gX19TMTExDQo+IC19Ow0KPiAtREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UDQo+IC0j
ZW5kaWYJLyogQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QgKi8NCj4gLQ0KPiAgIHN0
YXRpYyBwZ3Byb3RfdCB2bV9wZ3Byb3RfbW9kaWZ5KHBncHJvdF90IG9sZHByb3QsIHVuc2lnbmVk
IGxvbmcgdm1fZmxhZ3MpDQo+ICAgew0KPiAgIAlyZXR1cm4gcGdwcm90X21vZGlmeShvbGRwcm90
LCB2bV9nZXRfcGFnZV9wcm90KHZtX2ZsYWdzKSk7
