Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC22454E1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 20:41:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvYG45075z30R1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 06:41:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=clDBZ9LK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0955d447e6=terrelln@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=clDBZ9LK; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvYFJ6p7lz2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 06:40:51 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.1.2/8.16.1.2) with SMTP id 1AHJdtFC004740;
 Wed, 17 Nov 2021 11:40:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=SWNb9o8pFPywRvIE2R71TZaZyWr3ueHJiLJMhiAgZe4=;
 b=clDBZ9LKrI/PRFWYE/r+4eIZSMvxNkk83GoYC7s5Ln1VsUJYc6UayZNOjh33qO5xNzKz
 FwLDW7D5i4owGzvfkE4u98cSK63PbR3phDHAT9ODxCgV+D7VBYmuu16ulI9Dj/IbIUcn
 MXlsXaIOfMObilugdOmwaU8b0mMHxdFWy38= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 3cd1gnk610-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Nov 2021 11:40:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 17 Nov 2021 11:39:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwAtCzQvlWT1q771Tk8COUSY2XcUVGfgr72yr+Z6xPbFVpb8UJoT3DY7anfi+cTbUN+5TlpziTdzfY280xnk31qbL1peJc0nf53NgyyvaFjaDoLEoeG/GcL46uKMyFfWxSr4hYE4scBmVIjLU2XqCCN1TWyIRRok3iN646GBx2dyOkowjbpKe9M1vgYVo3MHe5tz6FOgJd6wWviWjvRV/vFBKhWutZfdNnFjXcNYz7eAUK0WzNK9m4DN/t5QGGs1O2qH4XzsHmfiOtmBPKgjQyvkyVCe5OMqoCdluEh60eUreQ6x4fZIEotBOILuBiGsnbLeJK8xUsi3HokhOgTGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfjcIKT7XzV6Dvjzx+Gs0kgXvkD5gJKAPj82OBOJV8Q=;
 b=Bw8fZ+Bpauq8ZyldPqlyS7E+87z+S0rcy0O5DwDMfZiRu9RhHlw8GX5qdzcGt1dLJyEgBzF1EYxAZyDEfPzChBcc6QlItjwN6awAdshUEs6mqAxswbcnmKcpMwTQDHe+6qDKh2V4w2LOVE99oSV7Efl4BF6KU0PrHzKqk4TTuSiTcmbEC0Dk5M8MpzJG15UTyiBuYr6QWW5DP6HLMNWbq9mHplp36Yn7eY3s4CMQl0rjnlPO3YpKU9KAx8zAO7sVGqAqioLT04U/3JcPpg4fBNC+iqUyfcNXch6h/ZD2ZiPnDJf/uczI+TJKJoj13KQFyTR1Vytx7oRH9MStS+prIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2693.namprd15.prod.outlook.com (2603:10b6:a03:155::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 19:39:41 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 19:39:40 +0000
From: Nick Terrell <terrelln@fb.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v5.16-rc1
Thread-Topic: Build regressions/improvements in v5.16-rc1
Thread-Index: AQHX2jynD2CHATmgwEukyh+iAPvEB6wEy7gAgAItboCAAAGdAIAAA9+AgACXqoCAAIrygA==
Date: Wed, 17 Nov 2021 19:39:40 +0000
Message-ID: <62F607C5-0004-473F-9864-4F73E70EA8F1@fb.com>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
 <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
 <525f9914-04bd-2d8a-0bbf-daf2d0d2053d@gmx.de>
In-Reply-To: <525f9914-04bd-2d8a-0bbf-daf2d0d2053d@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35d7bf98-109c-4288-5a84-08d9aa01ff9f
x-ms-traffictypediagnostic: BYAPR15MB2693:
x-microsoft-antispam-prvs: <BYAPR15MB26939139D96F136F45400D2FAB9A9@BYAPR15MB2693.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TDFFznG/8SflJPzXTOT73Ctuc872viio6hpgNZzAvuDjveYwHkpeMQVQuDqmc4ZARE6+VUCVxPhKlBWc9miVFjANF4rgJvUbeVPW3r2uJnFaH4XaSGnewapXFHQ/KgkaBwR6q3ASJkvRCjjZQ9NxvjC5t7Ql7ovl0+146iXyBf5ENA/GcYHrqvqYrnOB8MnxqfF2Kmnp0ai9ODpm+s1vRzz6ouz9tDESYO+ZjxPQOA4DKonED+MqTcfy7NOmhoCkE0nxRnXaAdzM6M9k7WVTmGemvYterzdHzM0/ThJ0HLRiUYZR8UU/PExovLuLsXuJlUQxEqJcgbzf98ItEYMyoYUTLYigl8q1/JW+xgjO7N7OPlLY7LdtUi8Ogz+Jc80Zkxe0HGWyOHKhtYoi72W0ac3XYYsoHKTeEIIW9ekDzZud63Q0wqzWH5TuxjIAC3pTdJxlM7UmLbKO1Ho5I6cReMq/m3QH7eiyvGwqvDgUSGGmwd2CJFnWTJ9OmxCFFG6EIhSkDtPZR/Uxp9JsMeLSlHS7vj8RuSdX8vEmEDy9zMUI6bfJCk3QT70g1hzGruVVPbsBHFJVFueR7bAqrBwjGzEHTcK81f+K9YW7IEQ75caKt7+xpzTA7Bmngmc7ZWPInX1xJ78iw/h7D3yqKUKzQMIa+0rEbN3dugpwmIaFZZuD2Mgf4wPm9RaiuaPzya3uPsk0ZKSdpAhnY09Ep4DQ+7O7541IbMIyNWtbmQuKVzTlCiDf3ILOW14H4sjMAbh+XJAKnf786E1jy6AcDh+qTrwtN8k0TB2jo0kd9mUS8vSFj0YBbuZzX00V5zsWtsACrTd533OYDRHhGn1hwnA+EQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(8936002)(86362001)(4326008)(66556008)(966005)(6512007)(5660300002)(66446008)(91956017)(71200400001)(6506007)(36756003)(53546011)(66946007)(76116006)(83380400001)(66476007)(38070700005)(64756008)(186003)(508600001)(6916009)(2906002)(33656002)(7416002)(316002)(122000001)(6486002)(38100700002)(54906003)(2616005)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHU5S0VFby9saDltVlhIazFWUVJ1WlR2Tlg0RU5aTldxeXhMVnNqak92K21w?=
 =?utf-8?B?d0U0WWxnQXpOTTJQcXR4Zm5ZQ0VzWnBmR1l3VXVKbUJwUk50U0RWWUhpR3ZH?=
 =?utf-8?B?LzBFbUFQU1kvb3pwNlRLVHFXZ2ovenltVTZmclBUNGwrdlpxS2lzQk5Ma05I?=
 =?utf-8?B?emFHZUIyVXVoUWxLZUYxRk85c0tuK2RhNys2NnhWN2VaOVBlOElGdnF2Nk93?=
 =?utf-8?B?aGdNaUdHbHdBMjM3ZFZRRkVEQTdHTEtEZkJtcGxxMGZIZERwempWaU5vdHY4?=
 =?utf-8?B?RVpRZW9zeXVCTEc5dFBsRUhTS1hJNytzWkl1UXBpZzRsMG5wV3N6Q1g2aWZ6?=
 =?utf-8?B?UHprdUZGbDF4c09wbVJFZEkya3UzenRieHl4VFlmeWErSEx6T1h3VHN1ZUsz?=
 =?utf-8?B?TTlGK3ZNR3RCZzRxbHp0VFZ3Ri81S2RFTVZnRkdESnRxYVV3ck0rempacUZU?=
 =?utf-8?B?dUZxL2hscFRpeEFvV0xqZ0FwUWNJdXhUcUdCdHN5RWFKVFpZQ0FGQ0MzZkFx?=
 =?utf-8?B?NUZ2NU5KMmNOZk1BQXpxd0c0d041WU00aFRDRUI5Si9SbGRNWEtGb2M5Njc3?=
 =?utf-8?B?T25KMXk5NFVXUmhLSXBiR3AyYW4yUUJ6Z0t1Y2hCUW5jNXZGSjg0OHhOOTFp?=
 =?utf-8?B?dFoyeko4QXFmVFM3azhOQzl5UlRiQ2VNVzd3V2FJOXpDMXByeittMFZZa3U3?=
 =?utf-8?B?Z2ViRFMwdHlRczlUTXFjWWtTaUdmVVJMS2NacWkzNUtXZmMrSDJtWmFJYjZt?=
 =?utf-8?B?Tyt4WGpPbnZ5dGJsSXFjNkROdlpMSUdZVTJBdUl4bjduU2JpZGhIV2NmZW1t?=
 =?utf-8?B?VWJPeDRMRnJZdFYveU5nV2JlaG54WUVXUHgzMVA2NzNySXJjV0FyYUNPQ3Bu?=
 =?utf-8?B?ZlFBZVh4eDdlMjlCNUNxR29oRWN6VUxOUDJqMjZPUzZ0NklYcHFGaWNmN1kv?=
 =?utf-8?B?TWdteDgrMzF1dzcrcDdsOFROakZsSGN2RVJQUkluZzJZYW1QMVJqczlWd0k4?=
 =?utf-8?B?dXF6dElQY1B4M0lvd0Joa09jdDJiaXRkTjNMbVZuZTNBMHhkTGtrR3hUanJM?=
 =?utf-8?B?TktWZU9lcVFKQUdWSEtBQjBYUG9OaGFQYjAyaWNIVmFYckFYcGwzVm1pUHB2?=
 =?utf-8?B?UHduUVdoZndjSDlPSHA0SDluYWczNno0eW03K2xzaG1kM29HdXRWL05EcjNE?=
 =?utf-8?B?eTZpN3Z0aHJmZm1QV2xraGQ5S1pzczdSeUFWSEtTeDJJd0FsQzRGVzZKTkJq?=
 =?utf-8?B?QityZ2FnK01iNGRuZHF0bEFvcnlRV3RHOTZvSXpYQVhvazJDVjZZaU00Ty9S?=
 =?utf-8?B?TGxxZkZPMkRlbVpnckdjVzIxTU12RlFEQmhvbHdTVTdHTnBickJycU5VN0Zn?=
 =?utf-8?B?b0NHMi9lRzRHRExKV01rd3BtNEgyRTVVaHZLT1ZMRUZJQ0xnTVRGQUhLTENI?=
 =?utf-8?B?Q3VIdk1PWkE1MlpoSmVmV0tmMjhYcU5VYVZ0SCt3RkZ1QXE4Q2I3dnBSRjFV?=
 =?utf-8?B?Qm1MSFljUkNRMFpBRVk1RHB1aXQrUGQ1VjVMSXdkMlRWNk1laXhxaSt2Sm10?=
 =?utf-8?B?Q1p2NVQwclVURlovdmdBcXh5V1BwWHpMdGFDcGlLVFVyMkdDTVFyWmhuSWdh?=
 =?utf-8?B?WDNpcWVBRzJCVUNGWXZxZUpiTFFyejhidVl3ZnJjTnZVNm5EejBRQnVJOXpz?=
 =?utf-8?B?Q1lLdS92L3BKRzk4OUJnWmRSWEhSRmJwTWdINkVoTkh0ZmI1K1pRcUhSQ0tN?=
 =?utf-8?B?MHJ0UE5mTkFPTTRTbHg2cGVyRldBZHZSZ0VYYWRjWU0rbVdaV0kwWFJTVXlq?=
 =?utf-8?B?RVdvYzJRSVNzeDZtdFJsRjVqdnRyNytOSmVxeGZnejhiTTR0VVEzbmZsNDk2?=
 =?utf-8?B?Y204bHhUVllxWXNlblljMXB6eENIbG5xQ2doQVlEYmlYUFdRdnNvbFlmckFk?=
 =?utf-8?B?YTNiT0h4cGtNNjRPSEZybXpOL21HdUdmOWIxSkpMVWZ1OTRlSlVzWDVId0dt?=
 =?utf-8?B?Z0kreU9yK0hla0NYUHJGYkNpY0xEWXhMTXJSSUlVOXhnelhyVFhaRUtuK0h1?=
 =?utf-8?B?N2ZQVlQ0SkU0S3RmU1dmbWhaYnhsREtxMWdwcGVGR1VvZEdmd1g0L1c5UGh4?=
 =?utf-8?B?d1NJNk1ucXpQVHh6QVVuRDMvUEZFa0VuZ3RPK3JOanFjZ0Urb0F3WlNLUGkr?=
 =?utf-8?B?alE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1CCA86516A21F46B2F1B76ECB5AD575@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d7bf98-109c-4288-5a84-08d9aa01ff9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 19:39:40.8089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBJWUViTlr7KCgh89OqNGa49/oaxLTMtpHKAtZ7kGdiKn0DggSZ00LJqnL7S39rM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2693
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: tdC2voR1NU9mrsbUqafjSZ1MJEQmCWbY
X-Proofpoint-ORIG-GUID: tdC2voR1NU9mrsbUqafjSZ1MJEQmCWbY
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170086
X-FB-Internal: deliver
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
Cc: Hector Martin <marcan@marcan.st>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Stan
 Skowronek <stan@corellium.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>, Sergio
 Paracuellos <sergio.paracuellos@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Linux
 Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTm92IDE3LCAyMDIxLCBhdCAzOjIyIEFNLCBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+IHdyb3RlOg0KPiANCj4gT24gMTEvMTcvMjEgMDM6MTksIE5pY2sgVGVycmVsbCB3cm90
ZToNCj4+IA0KPj4gDQo+Pj4gT24gTm92IDE2LCAyMDIxLCBhdCA2OjA1IFBNLCBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMTEvMTYvMjEg
NTo1OSBQTSwgTmljayBUZXJyZWxsIHdyb3RlOg0KPj4+Pj4gT24gTm92IDE1LCAyMDIxLCBhdCA4
OjQ0IEFNLCBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+
PiBPbiAxMS8xNS8yMSAxNzoxMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPj4+Pj4+IE9u
IE1vbiwgTm92IDE1LCAyMDIxIGF0IDQ6NTQgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+IEJlbG93IGlzIHRoZSBsaXN0IG9mIGJ1aWxk
IGVycm9yL3dhcm5pbmcgcmVncmVzc2lvbnMvaW1wcm92ZW1lbnRzIGluDQo+Pj4+Pj4+IHY1LjE2
LXJjMVsxXSBjb21wYXJlZCB0byB2NS4xNVsyXS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IFN1bW1hcml6
ZWQ6DQo+Pj4+Pj4+IC0gYnVpbGQgZXJyb3JzOiArMjAvLTEzDQo+Pj4+Pj4+IC0gYnVpbGQgd2Fy
bmluZ3M6ICszLy0yOA0KPj4+Pj4+PiANCj4+Pj4+Pj4gSGFwcHkgZml4aW5nISA7LSkNCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IFRoYW5rcyB0byB0aGUgbGludXgtbmV4dCB0ZWFtIGZvciBwcm92aWRpbmcg
dGhlIGJ1aWxkIHNlcnZpY2UuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBbMV0gaHR0cDovL2tpc3NrYi5l
bGxlcm1hbi5pZC5hdS9raXNza2IvYnJhbmNoL2xpbnVzL2hlYWQvZmE1NWI3ZGNkYzQzYzFhYTFi
YTEyYmNhOWQyZGQ0MzE4YzJhMGRiZi8gICAgKGFsbCA5MCBjb25maWdzKQ0KPj4+Pj4+PiBbMl0g
aHR0cDovL2tpc3NrYi5lbGxlcm1hbi5pZC5hdS9raXNza2IvYnJhbmNoL2xpbnVzL2hlYWQvOGJi
N2VjYTk3MmFkNTMxYzliMTQ5YzBhNTFhYjQzYTQxNzM4NTgxMy8gICAgKGFsbCA5MCBjb25maWdz
KQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gDQo+Pj4+Pj4+ICoqKiBFUlJPUlMgKioqDQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiAyMCBlcnJvciByZWdyZXNzaW9uczoNCj4+Pj4+Pj4gKyAva2lzc2tiL3NyYy9hcmNo
L3BhcmlzYy9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmg6IGVycm9yOiBleHBlY3RlZCAnOicgYmVm
b3JlICdfX3N0cmluZ2lmeSc6ICA9PiAzMzo0LCAxODo0DQo+Pj4+Pj4+ICsgL2tpc3NrYi9zcmMv
YXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oOiBlcnJvcjogbGFiZWwgJ2xfeWVz
JyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtbGFiZWxdOiAgPT4gMzg6MSwg
MjM6MQ0KPj4+Pj4+IA0KPj4+Pj4+ICAgZHVlIHRvIHN0YXRpY19icmFuY2hfbGlrZWx5KCkgaW4g
Y3J5cHRvL2FwaS5jDQo+Pj4+Pj4gDQo+Pj4+Pj4gcGFyaXNjLWFsbG1vZGNvbmZpZw0KPj4+Pj4g
DQo+Pj4+PiBmaXhlZCBub3cgaW4gdGhlIHBhcmlzYyBmb3ItbmV4dCBnaXQgdHJlZS4NCj4+Pj4+
IA0KPj4+Pj4gDQo+Pj4+Pj4+ICsgL2tpc3NrYi9zcmMvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZHJ2Lmg6IGVycm9yOiAiQ09ORCIgcmVkZWZpbmVkIFstV2Vycm9yXTogID0+IDUzMQ0KPj4+Pj4+
PiArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZG91YmxlX2Zhc3QuYzogZXJy
b3I6IHRoZSBmcmFtZSBzaXplIG9mIDMyNTIgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTUzNiBieXRl
cyBbLVdlcnJvcj1mcmFtZS1sYXJnZXItdGhhbj1dOiAgPT4gNDc6MQ0KPj4+Pj4+PiArIC9raXNz
a2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZG91YmxlX2Zhc3QuYzogZXJyb3I6IHRoZSBm
cmFtZSBzaXplIG9mIDMzNjAgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTUzNiBieXRlcyBbLVdlcnJv
cj1mcmFtZS1sYXJnZXItdGhhbj1dOiAgPT4gNDk5OjENCj4+Pj4+Pj4gKyAva2lzc2tiL3NyYy9s
aWIvenN0ZC9jb21wcmVzcy96c3RkX2RvdWJsZV9mYXN0LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6
ZSBvZiA1MzQ0IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUt
bGFyZ2VyLXRoYW49XTogID0+IDMzNDoxDQo+Pj4+Pj4+ICsgL2tpc3NrYi9zcmMvbGliL3pzdGQv
Y29tcHJlc3MvenN0ZF9kb3VibGVfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgNTM4
MCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10
aGFuPV06ICA9PiAzNTQ6MQ0KPj4+Pj4+PiArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNz
L3pzdGRfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMTgyNCBieXRlcyBpcyBsYXJn
ZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiAzNzI6
MQ0KPj4+Pj4+PiArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZmFzdC5jOiBl
cnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMjIyNCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5
dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiAyMDQ6MQ0KPj4+Pj4+PiArIC9r
aXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1l
IHNpemUgb2YgMzgwMCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZy
YW1lLWxhcmdlci10aGFuPV06ICA9PiA0NzY6MQ0KPj4+Pj4+IA0KPj4+Pj4+IHBhcmlzYy1hbGxt
b2Rjb25maWcNCj4+Pj4+IA0KPj4+Pj4gcGFyaXNjIG5lZWRzIG11Y2ggYmlnZ2VyIGZyYW1lIHNp
emVzLCBzbyBJJ20gbm90IGFzdG9uaXNoZWQgaGVyZS4NCj4+Pj4+IER1cmluZyB0aGUgdjUuMTUg
Y3ljbCBJIGluY3JlYXNlZCBpdCB0byAxNTM2IChmcm9tIDEyODApLCBzbyBJJ20gc2ltcGx5IHRl
bXB0ZWQgdG8NCj4+Pj4+IGluY3JlYXNlIGl0IHRoaXMgdGltZSB0byA0MDk2LCB1bmxlc3Mgc29t
ZW9uZSBoYXMgYSBiZXR0ZXIgaWRlYS4uLi4NCj4+Pj4gVGhpcyBwYXRjaCBzZXQgc2hvdWxkIGZp
eCB0aGUgenN0ZCBzdGFjayBzaXplIHdhcm5pbmdzIFswXS4gSeKAmXZlDQo+Pj4+IHZlcmlmaWVk
IHRoZSBmaXggdXNpbmcgdGhlIHNhbWUgdG9vbGluZzogZ2NjLTgtaHBwYS1saW51eC1nbnUuDQo+
Pj4+IEnigJlsbCBzZW5kIHRoZSBQUiB0byBMaW51cyB0b21vcnJvdy4gSeKAmXZlIGJlZW4gaW5m
b3JtZWQgdGhhdCBpdA0KPj4+PiBpc24ndCBzdHJpY3RseSBuZWNlc3NhcnkgdG8gc2VuZCB0aGUg
cGF0Y2hlcyB0byB0aGUgbWFpbGluZyBsaXN0DQo+Pj4+IGZvciBidWcgZml4ZXMsIGJ1dCBpdHMg
YWxyZWFkeSBkb25lLCBzbyBJ4oCZbGwgd2FpdCBhbmQgc2VlIGlmIHRoZXJlDQo+Pj4+IGlzIGFu
eSBmZWVkYmFjay4NCj4+PiANCj4+PiBJTU8gc2V2ZXJhbCAob3IgbWFueSBtb3JlKSBwZW9wbGUg
d291bGQgZGlzYWdyZWUgd2l0aCB0aGF0Lg0KPj4+IA0KPj4+ICJzdHJpY3RseT8iICBPSywgaXQn
cyBwcm9iYWJseSBwb3NzaWJsZSB0aGF0IGFsbW9zdCBhbnkgcGF0Y2gNCj4+PiBjb3VsZCBiZSBt
ZXJnZWQgd2l0aG91dCBiZWluZyBvbiBhIG1haWxpbmcgbGlzdCwgYnV0IGl0J3Mgbm90DQo+Pj4g
ZGVzaXJhYmxlIChleGNlcHQgaW4gdGhlIGNhc2Ugb2YgInNlY3VyaXR5IiBwYXRjaGVzKS4NCj4+
IA0KPj4gR29vZCB0byBrbm93ISBUaGFua3MgZm9yIHRoZSBhZHZpY2UsIEkgd2FzbuKAmXQgcmVh
bGx5IHN1cmUgd2hhdA0KPj4gdGhlIGJlc3QgcHJhY3RpY2UgaXMgZm9yIHNlbmRpbmcgcGF0Y2hl
cyB0byB5b3VyIG93biB0cmVlLCBhcyBJDQo+PiBkaWRuJ3Qgc2VlIGFueXRoaW5nIGFib3V0IGl0
IGluIHRoZSBtYWludGFpbmVyIGd1aWRlLg0KPiANCj4gTmljaywgdGhhbmtzIGEgbG90IGZvciB5
b3VyIGVmZm9ydHMgdG8gZ2V0IHRoZSBmcmFtZSBzaXplIHVzYWdlIGRvd24hDQo+IA0KPiBJJ3Zl
IGFwcGxpZWQgeW91ciBwYXRjaCBzZXJpZXMgdG8gdGhlIHBhcmlzYyBmb3ItbmV4dCB0cmVlIFsx
XSwgc28gdGhhdCBpdA0KPiBnZXRzIHNvbWUgdGVzdGluZyBpbiB0aGUgdXBzdHJlYW0gZm9yLW5l
eHQgdHJlZS4NCj4gTXkgdGVzdHMgc28gZmFyIGFyZSBnb29kLCBhbHRob3VnaCBJJ20gb25seSB1
c2luZyBnY2MtMTEuDQo+IA0KPiBJZiB5b3UgZG9uJ3QgbWluZCwgYW5kIGlmIGl0IGRvZXNuJ3Qg
Z2VuZXJhdGUgaXNzdWVzIGZvciBvdGhlcg0KPiBwbGF0Zm9ybXMgJiBhcmNoaXRlY3R1cmVzIEkg
Y291bGQgc3VibWl0IHRoZW0gdXBzdHJlYW0gdG8gTGludXMgd2hlbg0KPiBJIHNlbmQgdGhlIG5l
eHQgcHVsbCByZXF1ZXN0Lg0KDQpTdXJlLCBJ4oCZbSBmaW5lIHdpdGggdGhhdC4gVGhlIG9ubHkg
b3RoZXIgbWFqb3IgZ29hbCBvZiB0aGlzIHBhdGNoIHNlcmllcw0KaXMgdG8gcmVkdWNlIGNvZGUg
c2l6ZSBibG9hdC4gQnV0LCB0aGF0IGlzbuKAmXQgYmxvY2tpbmcgZGV2ZWxvcG1lbnQgb2YNCmFu
eW9uZS4NCg0KSSBkbyBoYXZlIGFuIHVwZGF0ZSB0byBtYWtlIGZvciBwYXRjaCAxIHRob3VnaCwg
YWZ0ZXIgc29tZSBjb21tZW50cw0KZnJvbSBMaW51cy4gU28gSeKAmWxsIHNlbmQgb3V0IGEgVjIg
c2hvcnRseS4NCg0KQmVzdCwNCk5pY2sgVGVycmVsbA0KDQo+IEhlbGdlDQo+IA0KPiBbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZGVsbGVyL3Bhcmlz
Yy1saW51eC5naXQvbG9nLz9oPWZvci1uZXh0DQoNCg==
