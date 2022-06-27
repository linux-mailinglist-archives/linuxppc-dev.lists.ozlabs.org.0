Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820655B7DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcPS6n4jz3dyg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xNiXRu4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.45; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xNiXRu4n;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120045.outbound.protection.outlook.com [40.107.12.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcJS2Tymz3dQP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:50:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtjZwthawIjb2RUYGHPFIhsud2IhOZSZryLD2oTM1yDZVwHEPlmb2TbDffCjYXAUqYVTeTNAewxlWSnzRxFk5SYFeUse8QiH3Es6SA007+2TC+hc16uKT9gx4Cny0EoPgaV2zShu0HZ/lhTwrXZ//AJiEPqzWa0PBPDWHF+OmvYOEXjDLzXYnXGOdllF088QLYBLBpt2sqq7r6RFvovMPj8LFE+NSKSsPYtg3X+oKRzZcm3kV6P+I7lK/mqs+G2o1mLf0UZwtSWVSAbFu4CfFqQebGJVtA5DmsjMLX9L/ZiX2wPtm+hh48/J0yaEHuJOddIgXMzo2EpAJDPZj0EAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDd8poUCTdDIsr9G+/FSVg6gaBtq8k56dlSyuGP7W3M=;
 b=jQGFAb16XMthyfZam5VJWpJ5BDbPzycY76A6Zj5It0W/1IIzxKQmAJuFOFdQdIGdZYNSNbHTln4i+rUI68lfixjjVgnVAYOH4cheiufRwYhqRgYHR0sGcNIw2LxysDjPEocDdAzFO8S4ot0nv1DhmtqDiiSlv8XN9uIVD20+SMFw1YmKRQ8Ft8xpzgSTpp5doXJR6T44TnJL0h6Ywvqs18AsT44zJbjOT0o+m/0woveBF+zIDXUuaGpP9NC2r2q54Mu68pUJvLriNTlTOuxAuz4kUJ6g/YjsLL8k9E28TgQls0TrWZh4mjDdjTQmy2cYhV2e//hsZKtBcuhbedOOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDd8poUCTdDIsr9G+/FSVg6gaBtq8k56dlSyuGP7W3M=;
 b=xNiXRu4nM+XVhI3i2M1c/iwc/A2pDqThKo1KzluvrFHEcy3LaldknErxPzGmfEYCk7ZK4rIg50KhSLjcmt4I5BiLP1oye1sDlKCjutgJfxuGkYcVqqTFqMtEkwDeD/cMbkMWBWkwlhbE7WFHnyemo5FGz4sy+EG9CCNEvm6DSY2/iDNwA7id6NZxcPwUtvdJfSz6cL79iyhU5+r/n0pS0ApDCbnoFLDxqGAZ6JtJ9GobKSRCfoCNjWZvyUDpiMh5QpBxaThx5NDsjJOOn5LoIIa6FswbapUQqv+loBNj7SoXcDx4MDanNVsu1Tk8GVOvAux1yWecVl05LjngQ7N2ZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:49:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:49:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V5 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V5 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYieK7kvLSpT2TWEuaCGwfFZnTNK1iv7GA
Date: Mon, 27 Jun 2022 05:49:58 +0000
Message-ID: <62c90c50-6deb-d848-77f1-a4c927ef47be@csgroup.eu>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-8-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-8-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd7b209-62e9-46fa-a2af-08da5800de75
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  akXGEwdTWdth9VO5ThLzMdVX1C19BL8ygYfxirGe+dl2IyKUHnMaC4gCLZ7yRlu9xWODsMX5ZCxlxPIpm5nQq0O4JBOS/nEo6+jv986Ui2LJFn35EzjUbWO1lE5ASeywuwGScvPWXGeVRenEFtFg5p46IF7rudbUKzeUAZQpIoTrsw3XAqMQ36EazZlZevIT5l12gmsojawAg/1ZL4xwU1nKI4doehAjAxXyJUKNOAArYANW/b6k6Aj4teLQJmLcB9mmwaQeiOKBFhB1jNLYy+5SM6DoAWEMhJEQNjLeWybN9er40x0jx/ho2X2u/d+uA0bCQ9qXd2uHYB/3YHsyMWRMAGSjWBZpWuWnyRVx9oUSi6HZMuq858jwLkvQb6SgbTOmMgSOFx9CpQuZQCSONbi3TwewA4YGSGocG1xP9RrjYP/Y+3DA9W/LlvAbyCsRS96l2owVNVFUcJhAePmfPT5ro831gZuheSEjVe9jbRNU59mpiC68zCFEycPRr2aD3Bw6H8N7nVKDOwDUXcYY4LvlMy7vZpXfjwd0AdaAauXYKm+HiF33w9houQoYi3ztnQcbfyQAhgwxFc7/WhGNOPqHENNvE+O96RnoAP8wXzRtNx3L0JNpawruLaObglVetUs6B3aVnZrxPafu1kLs/R5vnBaH631a5fZ+htmW7+NXTqtutKfM/65MZWt70Czmn77/CaJriDTA4p2p4/FEqnMgyKEulHgracbfrJaj8KdYN0STWxHz2/brXGFlXb18aI0ckOwQ8F/9yHrvXm4+TkWf5QouG8fhLrt/Qc0WEkUoWkAM/+iIDtpWE/3lugKriLu7B/KMIwd34B/iLmS/31hrdSjhqG7M35YU+CpE/Ro=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(8676002)(44832011)(4326008)(91956017)(83380400001)(6512007)(2616005)(5660300002)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(6486002)(8936002)(478600001)(26005)(71200400001)(7416002)(36756003)(122000001)(186003)(2906002)(110136005)(6506007)(54906003)(38100700002)(41300700001)(86362001)(316002)(38070700005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dWR4U3pSenhjOUpPT2VhRlJNUzZHS2Vpcmc4NzdueUFPa0Yyb3Nob1gyU1F5?=
 =?utf-8?B?MjNiaXJNUE5yenNSZDJYcjVDdnlUUms0c3kwMHZIV1lsMi9zUGZUcFljS0Ix?=
 =?utf-8?B?UEdpTHRoSlV2UzdsQUJscmFxZ2VIWXh6dElGV0xuTjVwVExlRGxOMlB0Vk8w?=
 =?utf-8?B?Q1RtbzlzMHNGRkt4S3g3WW9UdHNNdWZOemhYTEZPcDV4WmcrNlk0SmNZZXZq?=
 =?utf-8?B?a1kyNEVzNEhuenE3L3lrbWs3R1ZIaUxWWERrbkVVdEFnZXFXeGVUbjhCVDhI?=
 =?utf-8?B?VHpxdVJDM1U3clVIMnBLdTUrVGp0SEdmOFVmVmRxbHY0RDVFLytFWkVsMUhE?=
 =?utf-8?B?ZHEvbHFlMUtCLzcyN01zdE5MMnF6UkZreVc0Z3JGaE00Y2hRN1lySTJhQXlQ?=
 =?utf-8?B?NnJ5MHJxQmJEdFV5V01GZzVDWSt3WUExUEU1cnFMd2xaaHowTjIxMk9na3VD?=
 =?utf-8?B?bGxYMk5yb1FSTkRVOGNaSzVyRnBtdGtRZlhlMng3eDJnVWFnZDVNNURtK2ha?=
 =?utf-8?B?ZitQVHJNQStVQ1NLRVhzeVlDcjg5WGFhMmdLKzJGRVdla1pHYWRDMkpMbEJS?=
 =?utf-8?B?NlhGZDJaZ2gwQW82R0Z0cmpkYUMreDZBS0ZoYlBtVHp4aE9aaDVWd2QzS1Fw?=
 =?utf-8?B?RXNyeUdUQm94cmhsYU04RU04NjQxd1hQYThGenhwOTh6bEcvcGJCSnNQYjZU?=
 =?utf-8?B?bUlWM09WclByRGxXeVQwVEd1Sm1Gcm91NnhrMmJpazk3ei95bFo4aEhqQXRa?=
 =?utf-8?B?a3BIdHNpdjRDNmJCbnI3STVxcUVaeFlSS0VVZ0ZzUFFCblZ3cGtuOFJnajlQ?=
 =?utf-8?B?MkhKWVQybTliYjNZSGNhcXZoOHZXb3l4Vll2MVdhNU96R2pDOXJuWEFSU01V?=
 =?utf-8?B?bWZyT1lOMWY1bVdya0JKMGhrR3dvYit6WjcxbEUxYm1LQnQxZkN6R1U1aGNB?=
 =?utf-8?B?b0RmakMzTUl4NWZBYW5RQ0J0T0tESklvYm9nbDd5djVsWS9jZWZydWRTT2lU?=
 =?utf-8?B?cUwvbFNTNjFJVUEyUXlOTVJaRlJPQVRBcWJ2WFZCdEF4L2dyNG5ITHY3d3dX?=
 =?utf-8?B?L1d6Y1d4RHdVR2I5NVZSZTV3QUF1WFJGb2lkNFljdVBkRVpQV0F6S0o3Ulhr?=
 =?utf-8?B?bmFwd1FpUkRoVWVxMUFOeWdXZFR1ekw5QTAvMU1Qd2NCSjFBQVVKcXE3dkRN?=
 =?utf-8?B?Y1p0aGlkMGhlWXZoSGd0MEt1WlB2MlhKTkcra0RQK1NYR2NqSnZZSytUQ1Vm?=
 =?utf-8?B?c3FtNFZsL3JGSjMyelk4YXVHcGlTR0JPOUVSc016MHFYeVlXamQ4dXg3ZGxH?=
 =?utf-8?B?SFZiditUc0toa1kvR3F2dFkzdHNlbVk4RGJLZGJkMzJOaVJJQjVMbTVrWVQw?=
 =?utf-8?B?TXZXNlIxNE81YWlSclZTdkxkUktpLzFod3F2bDF6b2YwSGlyVDdLWFhRTFlQ?=
 =?utf-8?B?QUdJWWV4RjU4NHJBaTEyd3ZaRlUvLzR0REF6NjFycG1JRXVoQU05a3dHNk9J?=
 =?utf-8?B?eE9uZWxvY3ZqMm5SSVQvWmpvUzJGRGVlUENMTDdqSDBFNnFvbWdKV0o5T3p3?=
 =?utf-8?B?VDl1UDhIMnFHVHRaQjU3Z1F4Uis2WCtMWGNHNGpoN3BDYjZvOGpsbUs0MlY1?=
 =?utf-8?B?ekZ4eHJxRHF0MGJYMjFQbjR5cDdYeTVsd001Y1F1cFZCUFc5NnVLRzZGQnM1?=
 =?utf-8?B?bytYSWdWbjR3NlA0NGxDazZteGFFL0c4MVZvbURCTWFhMFNWUXNmYVBQYUFr?=
 =?utf-8?B?NHFMS2VrNFRYcythaVJBSTd3SjY0ajNLd2U2QUxNZjJxWG1CaE1GcmFRTUU1?=
 =?utf-8?B?TjQzZkNuekVhblJjdHN1d2lZSUFYVEFvZkZKN25wbWdNWDh2SHdqdWVEUFlL?=
 =?utf-8?B?Z1QrZ3dTSkRoQ3FpZE9uOWdEYkQxU2p6aWpFdnZtd0ZrclBWZzBXNkZFZ2w2?=
 =?utf-8?B?Z1N5UFFEejJZeThkYlhBZG1vdFVRNXIvZUxycS9taEFETXhOeUFNeTczN1NO?=
 =?utf-8?B?ZDBENzJFNVo1djlsVGMrWU1qZXVkRW14RGtNb1R2MkZtTDBSU1F1V2JJeFRR?=
 =?utf-8?B?a1ROVjJnL3JNTUlta01SdmJCWHRBUXJYVzhEcXVSY3dSWjc1bllOMEhwM3ZI?=
 =?utf-8?B?ckZjYnRES3dWbnM1K0lKWXh4bXJ2WVZjT1Y5Ykxubi9TTWNRc2JCeThGNUx5?=
 =?utf-8?Q?xiWVxxofA9OLSbVBvqqAmx8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F95EE4CE8B1D404999EC642C2F2A9E5C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd7b209-62e9-46fa-a2af-08da5800de75
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:49:58.1373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xTPTIaon2OTLQKCwkVvXHx1GURqFdgofH5GKpdC5ti5tpZ1wqfJzQx653nMgQwZlpRlrV/mJGScjG7lrR6vLczEk/qI3/AOO69oJO9s+i90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
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

DQoNCkxlIDI3LzA2LzIwMjIgw6AgMDY6NTgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IE5vdyB0aGF0IHByb3RlY3Rpb25fbWFwW10gaGFzIGJlZW4gbW92ZWQgaW5zaWRlIHRob3Nl
IHBsYXRmb3JtcyB0aGF0IGVuYWJsZQ0KPiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9ULiBIZW5j
ZSBnZW5lcmljIHByb3RlY3Rpb25fbWFwW10gYXJyYXkgbm93IGNhbiBiZQ0KPiBwcm90ZWN0ZWQg
d2l0aCBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVCBpbnRlYWQgb2YgX19QMDAwLg0K
PiANCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENj
OiBsaW51eC1tbUBrdmFjay5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFy
bS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgMiArLQ0KPiAg
IG1tL21tYXAuYyAgICAgICAgICB8IDUgKy0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gaW5kZXggNDdiZmUwMzhkNDZlLi42NWI3
ZjNkOWZmODcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaA0KPiArKysgYi9pbmNs
dWRlL2xpbnV4L21tLmgNCj4gQEAgLTQyNCw3ICs0MjQsNyBAQCBleHRlcm4gdW5zaWduZWQgaW50
IGtvYmpzaXplKGNvbnN0IHZvaWQgKm9ianApOw0KPiAgICAqIG1hcHBpbmcgZnJvbSB0aGUgY3Vy
cmVudGx5IGFjdGl2ZSB2bV9mbGFncyBwcm90ZWN0aW9uIGJpdHMgKHRoZQ0KPiAgICAqIGxvdyBm
b3VyIGJpdHMpIHRvIGEgcGFnZSBwcm90ZWN0aW9uIG1hc2suLg0KPiAgICAqLw0KPiAtI2lmZGVm
IF9fUDAwMA0KPiArI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAg
IGV4dGVybiBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl07DQo+ICAgI2VuZGlmDQo+ICAgDQo+
IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggYjQ2ZDVlOTMxYmIz
Li4yY2M3MjJlMTYyZmEgMTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFw
LmMNCj4gQEAgLTgxLDcgKzgxLDcgQEAgc3RhdGljIHZvaWQgdW5tYXBfcmVnaW9uKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLA0KPiAgIAkJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqcHJldiwNCj4gICAJCXVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVk
IGxvbmcgZW5kKTsNCj4gICANCj4gLSNpZmRlZiBfX1AwMDANCj4gKyNpZm5kZWYgQ09ORklHX0FS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0g
X19yb19hZnRlcl9pbml0ID0gew0KPiAgIAlbVk1fTk9ORV0JCQkJCT0gX19QMDAwLA0KPiAgIAlb
Vk1fUkVBRF0JCQkJCT0gX19QMDAxLA0KPiBAQCAtMTAwLDkgKzEwMCw2IEBAIHBncHJvdF90IHBy
b3RlY3Rpb25fbWFwWzE2XSBfX3JvX2FmdGVyX2luaXQgPSB7DQo+ICAgCVtWTV9TSEFSRUQgfCBW
TV9FWEVDIHwgVk1fV1JJVEVdCQk9IF9fUzExMCwNCj4gICAJW1ZNX1NIQVJFRCB8IFZNX0VYRUMg
fCBWTV9XUklURSB8IFZNX1JFQURdCT0gX19TMTExDQo+ICAgfTsNCj4gLSNlbmRpZg0KPiAtDQo+
IC0jaWZuZGVmIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgREVDTEFSRV9W
TV9HRVRfUEFHRV9QUk9UDQo+ICAgI2VuZGlmCS8qIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFH
RV9QUk9UICovDQo+ICAg
