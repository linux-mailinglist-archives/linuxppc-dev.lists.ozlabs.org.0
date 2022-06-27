Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F38F55B7DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:53:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcNX2Y08z3f5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:53:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vfPjIAmJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.54; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vfPjIAmJ;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcHt6KnKz3dpf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:49:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAl6/nZQdqZm3cSoNg8gHg2PpCQ7WKszrKWzlkJQYX6UtBoRJhhiDNyyXwTNumkM+aFskWmxWPTIXG7UyLu6HhAkn9hhUva5ho+pvgmEJXyBLHu/mmxJOjQgm5MHVNJKNgXsOb7cIFDm4pFANyVvd7jWUqPiQy6kRJtUAAuqXCHA6G0CUTvA/OIP2iUaBY4TM1NHPcY1wTjjvUkkEV0DgIM6tSaAkl0VOUWw6XPAD16mePxPFr/7ItHtmVdRC1wWn1gJgrhCujq8XH3oBRoC35GRsoxjvaRO5H5HuNKywl8REyxR1mdDNlJFxZzdmd/LEQKYnvmn59unsSzgwEefAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55VtZBRWAJoEWfB46VqNMWvX9OXglAEE6tvNAEcArgU=;
 b=gqZR3fW1+Jzlsild33yj8a/5127RUanP18/2QYmdPxT/8vsBVvNQqlVg//G7Q8IvKtoZ0FuAhiQc7hoSNBMbJsvN74fllnE3RyJJq4IE+6BFg7iFdSELjycXLSR4GcKPzQ10fYbeeqwtgfYwKpAtWx8jycjDb2fGdUzrCwcfRSI1GyTh9OU3wvBuMhQ30yX1i1LIlGvCUvBTnVn6BiBHLaGttmY/o2cAfpQs5l2AnzECJ0/gRIgj6Qx9CcfeqCYdK51BhSM6Pk2dyGSHAJ4rZNR9BPCyqyRlLtzBHpOJ++d3LMxixKnUdGYx6Xv/y3z7Dn6HA6/2iYS1Wrfe2bLl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55VtZBRWAJoEWfB46VqNMWvX9OXglAEE6tvNAEcArgU=;
 b=vfPjIAmJpCWx0+FfjdkrPt/Ui81tog79ciYQ0+hweQb4C/hcaVmp8mc26dSUM9T2BBgF6Ro7oIPFOhgIZ7V/clToXuGh1emvpJKnhl7OWJfb1yUcxkKXqPebb91kcqosVW1w+p11fRqFzg6QFJNonEhwz/EyAbgR/+xp7ga4DkQAnCqKUCMXw7bX1rgLHEZAax5FKw5uI6eD+nHw5JNddECb4yydDOav/jRMuU1Gp5tHV+lO4Z2ma3kzjFxuAUB3wXk39jV2HCRlozrOod5mlIv7PIiPeU2XffGNzlylmbzZA95JKxLKsQMxI7C1xcoRf2lf9zM7SWCc3s6YlWw/bQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:49:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:49:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V5 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Topic: [PATCH V5 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Index: AQHYieKo9lWaR6eRjEGOQ4R64y526K1iv6CA
Date: Mon, 27 Jun 2022 05:49:44 +0000
Message-ID: <78a5d6ed-d1b5-2007-5d45-9c307d565349@csgroup.eu>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-4-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-4-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c7ce1b4-a84d-46bc-9e4f-08da5800d62f
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hrptdtAU1GS8C3uUC51ECgeH66v4MO1YtKT3YwlIq/DVPYBUey35ovO8DKFdMUUlcSiBRIiKBET5dt9BDwu46zPSn8AB7zXpsl4mYFIpMzXpWgy+4QTy3DZ+oigVUXUImua1tUS5q5WTH6JmC0Rp8QRI3ze5fcKCWe0OVXy7WZmvaaPCzYBqrxYSXJeNS+J2eyr71XxB6hLGPuPTMnzhSdXvN4/PnahjAvzNzYCtqbavW2iT3uzWylT+kHye0vPeau1tHKAJgrcCrvSN9h2NWAF6z5YOxG6P0TudodN/dEQjCkMDkaDzna1kdZQ4qz34Qw4AU8C/cHUP4O0rL0eTPPkTp6WSuwzRH/RPHR+tyzRDKfyMesZbg3XZW5dSeR6nZG9agKz/dfoeujjI8yrOy/Tl1ADBblibTnqm2MKrpT28gWZMz7oAivTGv7fuwfCTPoJCT+FOGigzgcoOhzjXEo/P9MP8NQ1TRwPyuBdtB37t9KOOMOdD0yfCh3GQ7pNxNGavOIUGqIJ12B+86rBQ6sEpuYcuy/9CPkN4A3ckVREbSNj3c+vPajkaZ2I9yCc7PhNPhsXHMeN2S3uafcmluGjsz7yDzSQHCP4+zoEXtWkzL/A+olY3l9BNRFxhzSzr8vm223saZQO46DV9FieRYG0tV5RfiaKuDrKbZN6hiKzYYWjIK6RrPb7rokV3Z740/GPCZ/RlMxoLPWoU7niiJP6pNw2wY641k+Jo7UcW2nUiy0TRMBEp/mREuP0mcTdnPG6izB9BBOpCG+gnCc2KjAW32xfdXZykk7O7IUQps1WR32NkJlXkR6GgUkzhhyCUPKabuyUZbdwnvPp5RNxCK/i9/1LuOfzk/rE3hwWYGLU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(8676002)(44832011)(4326008)(91956017)(83380400001)(6512007)(2616005)(5660300002)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(6486002)(8936002)(478600001)(26005)(71200400001)(7416002)(36756003)(122000001)(186003)(2906002)(110136005)(6506007)(54906003)(38100700002)(41300700001)(86362001)(316002)(38070700005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZkFwUlJaMXlrWjYxYld4R1RMODJHSGFRQ21yWFJIeVFIeVZobzcvZVlaenBn?=
 =?utf-8?B?cmtobWNMZ25BMDZHME5nN241VE0xREhTU1o1ZW9rNFNJL2FYSW1kV3NseWdL?=
 =?utf-8?B?TzBVcHVic2gyRU9XcS91TWhjdHMvek9xeXRtQ21pZ3JnZE45bllFRWg3SkZU?=
 =?utf-8?B?NlNuNzZEbVRjQ3FucFEyTnBGQTNOZGltUlAvZk5ZcmV6aFIwdi9jK2dTaU95?=
 =?utf-8?B?OWxWclBRVnNDcWgrWXlPWXVpZ1c1RFlJOHZIV2UwNW5xb1I3T2VwOGYySjI0?=
 =?utf-8?B?Y0tRNUpKL2xnanJtOGtBSHdIekRhT3U5aDRXZ1QvODVOZjM5eEY2VnM4YVdD?=
 =?utf-8?B?OVZKTkQ4bVBoTm1LNmRpeWVBVk1COWFxU09RQTlwRFJrYTZaMHYzT3NhRlhj?=
 =?utf-8?B?NVcxRThBRk82Ukt5TS9BZHFOcGc5NmVxemluQ2hiRVdnVnN5dWtQN01kZm9P?=
 =?utf-8?B?OGdNWFZQMG94bml1ZDlvVC91N1ZJcHhQaUpnaWFFeUo4eDdBRjczYWtBNHJJ?=
 =?utf-8?B?dVo4YVVCblBQT3VBaG5ycURzNTZZSEdxeTJ6ck1QNkdTSlBJOTdqV2l2RFdr?=
 =?utf-8?B?dGFJZjhXQ1h5bjAwditxZVBQMGFaSnFMRVNwZEw1V3o0RXhPcCs4eHJlTys2?=
 =?utf-8?B?VUE1ZFo3UU9JVjNzZDJ5N0dWa1ROL1dYK0M1UFBBQjQ3YlJSendxckJMa2hD?=
 =?utf-8?B?cVNuSysvQkNEd0FnMW0zK1dBalhwMm5pcVZnaGtPZVhDdlJqNm1Vb0N1UDdv?=
 =?utf-8?B?VS9ySFlMZ3Ftd3o3ZjF1c0NZUzM1aHhWRS85NWhlVlVWUXdzUXhZWlpUSzUr?=
 =?utf-8?B?eXBWZ0dGOHJ5TzVxOUR6b3k4aVpYVjJjQmJkOEZ6d0VNVzhXTEVxbVhLQVVI?=
 =?utf-8?B?Z1B4ZFlZUU5hNVhRS0V5bit5eW1wKytlQlhBdkhTcGk1QURaM2hLVUpJbEty?=
 =?utf-8?B?cG5rTTVkQjA3WDk0aVk2SG56NHZuYlowM2lUUWFNRW8wengvL0JQL1hEQTgx?=
 =?utf-8?B?aEhlaFc1emcxN08yY2c4UmFSaDJQRUZWYzJiNTdKZTIybFZTVFRIK2xMSkVw?=
 =?utf-8?B?c2c2WFQ5cld2VmtWV1Nxa1hCQnhRWEVncG9MQXJLSnZGQjB6SElKNTl0Tmts?=
 =?utf-8?B?VjB6aHNSMDkvMlNYdWpMVFhZbkRoWE1aQ3VoZ1JMTlNkS2E3TUNUUnJKK1RQ?=
 =?utf-8?B?VERHZEpuVXhhNGJ1MkJHUit2SlpubFRqbXIwUmRKeDE2ZXZmUEZnY2tYdm12?=
 =?utf-8?B?R0t5cUJCRUdkWjk5bXlrajMwUTFaRWNxUDVKNS9oUnVJNGV0cGlsQ2FUcG9l?=
 =?utf-8?B?eFErRUNkL2Vib2h0ZVloY0lIOEFWSUV3dDRFUVExNGhJRERuOUZPOHkzbGJt?=
 =?utf-8?B?MlJBTFlvc3lnQTg3ZlhHN2Vnc1FUNjFYT1N1akxDVVFlNitDaEhGa2JxTFg4?=
 =?utf-8?B?N2I2YVUvSWlzbkNlWERRTy9uVjBLSVRsN3JFYSt0ek1GYVE5Sk95NU9lM3JC?=
 =?utf-8?B?S3czZVZSOC9hVU02eEJIaHFnd09xWkszV0N1Q2lPR3pPZGV0UlhwL1JIeFpG?=
 =?utf-8?B?TXArYkVpOHNYZGpaS2R3b0U0QStyeGhRdVZjbDZ2aGlmTGdIZlJvT2djNmJO?=
 =?utf-8?B?OW9HdlpMMHpXOHNhQjUrS0lKT05XSk5VajFpV21pSjBvaXZsRnJKTHBzNGgr?=
 =?utf-8?B?OWxxL01DS2ZITHR2MUViTnR6enVscmJKUzEvamU3OTVVS1NOZ0tPS01Vc0Ry?=
 =?utf-8?B?bitaZ1lzTGVLWFZ6WkQ0Qk5HbnduWnhncFYrUG5uWEtUZFJsaXZJQ0dJcjFH?=
 =?utf-8?B?Njh3bVNLSmJ5RGZqU0VSc2tsaHhXTU1NR2dJR1FEeEwzSDYrNGRHSHZUbkZN?=
 =?utf-8?B?UVNaY1VpYWFVODBWKzFPaitZRTFGbmFYa0dJMXlVOWROVE5uSktOeElGV296?=
 =?utf-8?B?QkdrNCtXYkgrVW9vcEkxME5kTDN6VHhVT3NvbzNKL2NBS3AwR251V1dXci95?=
 =?utf-8?B?NjN0Q3FhbHJtVHczcjVZaGl6SGlVNWVpTWhjM2ZTOUg2SW5RMDAyb0J2MUhj?=
 =?utf-8?B?bm0zL2lUcWtwblJjSHI2MXc5WkNNM3JyN0MwOTNNQXEzUzE1YlpGTG01OU91?=
 =?utf-8?B?bkF6cmtNZ3ljQkVpTjN5NzFReWRRelN6TEhyaWVKQWQwK1l0TzJuQ1grbytk?=
 =?utf-8?Q?zZkkzCpVZULtuRofG9bJQBQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AB53177BF314F439E0C3F6AC2A7B43D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c7ce1b4-a84d-46bc-9e4f-08da5800d62f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:49:44.2879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fTAlvG7TWngO7Svzr5jWBilgsFNkyyB2cl/edEgQ41Gy2/Bq06T4YbTmLfVvGInaL2mO9dRAou4qfU6XVOmoWAeX+kSfvv1yf3c8/Liq0xQ=
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecore
 s.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA2LzIwMjIgw6AgMDY6NTgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMgbW92ZXMgcHJvdGVjdGlvbl9tYXBbXSBpbnNpZGUgdGhlIHBsYXRmb3JtIGFuZCB3
aGlsZSBoZXJlLCBhbHNvIGVuYWJsZQ0KPiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UIG9uIDMy
IGJpdCBhbmQgbm9oYXNoIDY0IChha2EgYm9vazNlLzY0KSBwbGF0Zm9ybXMNCj4gdmlhIERFQ0xB
UkVfVk1fR0VUX1BBR0VfUFJPVC4NCj4gDQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxs
ZXJtYW4uaWQuYXU+DQo+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4NCj4g
Q2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+IENjOiBsaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZw0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
PiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJt
LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAgICAgICAg
ICAgIHwgIDIgKy0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMjAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jICAgICAg
ICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IGluZGV4IGMyY2UyZTYw
YzhmMC4uMTAzNWQxNzJjN2RkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0K
PiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBAQCAtMTQwLDcgKzE0MCw3IEBAIGNvbmZp
ZyBQUEMNCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1RJQ0tfQlJPQURDQVNUCQlpZiBHRU5FUklDX0NM
T0NLRVZFTlRTX0JST0FEQ0FTVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVUFDQ0VTU19GTFVTSENB
Q0hFDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwNCj4gLQlzZWxlY3Qg
QVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVAlpZiBQUENfQk9PSzNTXzY0DQo+ICsJc2VsZWN0IEFS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJc2VsZWN0IEFSQ0hfSEFWRV9OTUlfU0FGRV9D
TVBYQ0hHDQo+ICAgCXNlbGVjdCBBUkNIX0tFRVBfTUVNQkxPQ0sNCj4gICAJc2VsZWN0IEFSQ0hf
TUlHSFRfSEFWRV9QQ19QQVJQT1JUDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBp
bmRleCBkNTY0ZDBlY2Q0Y2QuLjMzZjRiZjhkMjJiMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vcGd0YWJsZS5oDQo+IEBAIC0yMCwyNSArMjAsNiBAQCBzdHJ1Y3QgbW1fc3RydWN0Ow0KPiAg
ICNpbmNsdWRlIDxhc20vbm9oYXNoL3BndGFibGUuaD4NCj4gICAjZW5kaWYgLyogIUNPTkZJR19Q
UENfQk9PSzNTICovDQo+ICAgDQo+IC0vKiBOb3RlIGR1ZSB0byB0aGUgd2F5IHZtIGZsYWdzIGFy
ZSBsYWlkIG91dCwgdGhlIGJpdHMgYXJlIFhXUiAqLw0KPiAtI2RlZmluZSBfX1AwMDAJUEFHRV9O
T05FDQo+IC0jZGVmaW5lIF9fUDAwMQlQQUdFX1JFQURPTkxZDQo+IC0jZGVmaW5lIF9fUDAxMAlQ
QUdFX0NPUFkNCj4gLSNkZWZpbmUgX19QMDExCVBBR0VfQ09QWQ0KPiAtI2RlZmluZSBfX1AxMDAJ
UEFHRV9SRUFET05MWV9YDQo+IC0jZGVmaW5lIF9fUDEwMQlQQUdFX1JFQURPTkxZX1gNCj4gLSNk
ZWZpbmUgX19QMTEwCVBBR0VfQ09QWV9YDQo+IC0jZGVmaW5lIF9fUDExMQlQQUdFX0NPUFlfWA0K
PiAtDQo+IC0jZGVmaW5lIF9fUzAwMAlQQUdFX05PTkUNCj4gLSNkZWZpbmUgX19TMDAxCVBBR0Vf
UkVBRE9OTFkNCj4gLSNkZWZpbmUgX19TMDEwCVBBR0VfU0hBUkVEDQo+IC0jZGVmaW5lIF9fUzAx
MQlQQUdFX1NIQVJFRA0KPiAtI2RlZmluZSBfX1MxMDAJUEFHRV9SRUFET05MWV9YDQo+IC0jZGVm
aW5lIF9fUzEwMQlQQUdFX1JFQURPTkxZX1gNCj4gLSNkZWZpbmUgX19TMTEwCVBBR0VfU0hBUkVE
X1gNCj4gLSNkZWZpbmUgX19TMTExCVBBR0VfU0hBUkVEX1gNCj4gLQ0KPiAgICNpZm5kZWYgX19B
U1NFTUJMWV9fDQo+ICAgDQo+ICAgI2lmbmRlZiBNQVhfUFRSU19QRVJfUEdEDQo+IEBAIC03OSw2
ICs2MCw3IEBAIGV4dGVybiB2b2lkIHBhZ2luZ19pbml0KHZvaWQpOw0KPiAgIHZvaWQgcG9raW5n
X2luaXQodm9pZCk7DQo+ICAgDQo+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgaW9yZW1hcF9ib3Q7
DQo+ICtleHRlcm4gY29uc3QgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdOw0KPiAgIA0KPiAg
IC8qDQo+ICAgICoga2Vybl9hZGRyX3ZhbGlkIGlzIGludGVuZGVkIHRvIGluZGljYXRlIHdoZXRo
ZXIgYW4gYWRkcmVzcyBpcyBhIHZhbGlkDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPiBpbmRleCBlNjE2NmI3MWQz
NmQuLmNiMmRjZGIxOGY4ZSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3BndGFibGUu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+IEBAIC00NzIsMyArNDcyLDI3
IEBAIHB0ZV90ICpfX2ZpbmRfbGludXhfcHRlKHBnZF90ICpwZ2RpciwgdW5zaWduZWQgbG9uZyBl
YSwNCj4gICAJcmV0dXJuIHJldF9wdGU7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKF9f
ZmluZF9saW51eF9wdGUpOw0KPiArDQo+ICsvKiBOb3RlIGR1ZSB0byB0aGUgd2F5IHZtIGZsYWdz
IGFyZSBsYWlkIG91dCwgdGhlIGJpdHMgYXJlIFhXUiAqLw0KPiArY29uc3QgcGdwcm90X3QgcHJv
dGVjdGlvbl9tYXBbMTZdID0gew0KPiArCVtWTV9OT05FXQkJCQkJPSBQQUdFX05PTkUsDQo+ICsJ
W1ZNX1JFQURdCQkJCQk9IFBBR0VfUkVBRE9OTFksDQo+ICsJW1ZNX1dSSVRFXQkJCQkJPSBQQUdF
X0NPUFksDQo+ICsJW1ZNX1dSSVRFIHwgVk1fUkVBRF0JCQkJPSBQQUdFX0NPUFksDQo+ICsJW1ZN
X0VYRUNdCQkJCQk9IFBBR0VfUkVBRE9OTFlfWCwNCj4gKwlbVk1fRVhFQyB8IFZNX1JFQURdCQkJ
CT0gUEFHRV9SRUFET05MWV9YLA0KPiArCVtWTV9FWEVDIHwgVk1fV1JJVEVdCQkJCT0gUEFHRV9D
T1BZX1gsDQo+ICsJW1ZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQURdCQkJPSBQQUdFX0NPUFlf
WCwNCj4gKwlbVk1fU0hBUkVEXQkJCQkJPSBQQUdFX05PTkUsDQo+ICsJW1ZNX1NIQVJFRCB8IFZN
X1JFQURdCQkJCT0gUEFHRV9SRUFET05MWSwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fV1JJVEVdCQkJ
CT0gUEFHRV9TSEFSRUQsDQo+ICsJW1ZNX1NIQVJFRCB8IFZNX1dSSVRFIHwgVk1fUkVBRF0JCT0g
UEFHRV9TSEFSRUQsDQo+ICsJW1ZNX1NIQVJFRCB8IFZNX0VYRUNdCQkJCT0gUEFHRV9SRUFET05M
WV9YLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRF0JCQk9IFBBR0VfUkVBRE9O
TFlfWCwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFXQkJPSBQQUdFX1NIQVJF
RF9YLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQk9IFBB
R0VfU0hBUkVEX1gNCj4gK307DQo+ICsNCj4gKyNpZm5kZWYgQ09ORklHX1BQQ19CT09LM1NfNjQN
Cj4gK0RFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVA0KPiArI2VuZGlm
