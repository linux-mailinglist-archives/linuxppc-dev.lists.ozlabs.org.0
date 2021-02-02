Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37730D057
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:38:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjTv67TXzDwhb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vmware.com (client-ip=40.107.93.79;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=S/03B23n; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVKt210hZzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:54:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftECuGUFxLy5gj8hYJ/+6jUb5EcZoscICST/93Di9NlzpXYrcR/87naCdRRk48gkyPV+JTAEMjxA5Xx0DMCzic8RisIYilWVIVhEeP5+7C99Rwo3PM7EM2XSytR5lr9I1Lv1R5Znw5JmUjurxS6n1/dLH46Y1aNJVlCgd5fZhYNa4brEjIYUhDaUVUocU8veB6CradGpPvF/b9LEKWyMXui0AVBc9GdA3dBiUvb/7ArO30aOfP6l0dX/VArqbWckKMSQT2KHPOMW61EYcKLUbcmfIC0jx0TS5K0Z4/dXdYxOyopN2qF4W2TW3+8zblD2oHISK+LeqqccRmUnmZaz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2RR/AYzKVUa5s+3J3RjS7aldU89Q81zJxbN64DYC5c=;
 b=Xt7aERzdilv075lEgKW4dbmNAUEZpOtTurrPtlzBpdhmzFw65VRZIDYmsVRAmi3+KwaEwNiCGWxTWfmcAKM6aVlP7WUhi9bvcmy1Yqog9BHElUXWJEDCUJcsShEd67s3czGdZoq/MOaOtditt38Couhpcc0jQnUt0M3aMcMABrvQTm5DRkRFmc5XA6TMQgtQfiEw+CvmfkrtNQc7EzoWXXRFm8h3SMxZ2HYDP3ZvTZLI9+SG/8RCs6ZS2i9olOsnbNR103F4mhcUndFcw+o8dAzt4iIplMEugLoVZ+JxxadFk82B/kU8AwqZwg1P3n4DIwrVKnh8/lUFVe8PweEYGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2RR/AYzKVUa5s+3J3RjS7aldU89Q81zJxbN64DYC5c=;
 b=S/03B23ne9WGx1vTwjmRCcfC6MGAaIdHmbzZmfiYQSYriH5z7y8s98pDU8qcSqq/08O3KXtBpWr9qHXfIs3MhxhzJmY8NGxK+GmxeNwNnQXqAjUQaSHLy17Gh/hA2OniqrSgGYqaLjgpnnLbByK9qL47WycA7+IQ1CYGBtDNuvg=
Received: from (2603:10b6:a03:4a::18) by
 BYAPR05MB4248.namprd05.prod.outlook.com (2603:10b6:a02:ff::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.6; Tue, 2 Feb 2021 09:54:36 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31]) by BYAPR05MB4776.namprd05.prod.outlook.com
 ([fe80::ddba:e1e9:fde7:3b31%3]) with mapi id 15.20.3825.013; Tue, 2 Feb 2021
 09:54:36 +0000
From: Nadav Amit <namit@vmware.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Thread-Topic: [RFC 11/20] mm/tlb: remove arch-specific tlb_start/end_vma()
Thread-Index: AQHW+JMuIjRLErxJlUWOv0AHOQSsJqpEa7AAgAALDACAACR+gIAABnKA
Date: Tue, 2 Feb 2021 09:54:36 +0000
Message-ID: <9100B8AE-129A-4E13-8F01-7B9C14C98B4C@vmware.com>
References: <20210131001132.3368247-1-namit@vmware.com>
 <20210131001132.3368247-12-namit@vmware.com>
 <YBfvh1Imz6RRTUDV@hirez.programming.kicks-ass.net>
 <1612247956.0a1r1yjmm3.astroid@bobo.none>
 <F1C67840-C62F-4583-8593-B621706034F6@vmware.com>
 <YBkb8yKSUKTPJvxk@hirez.programming.kicks-ass.net>
In-Reply-To: <YBkb8yKSUKTPJvxk@hirez.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [24.6.216.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6818f7a-6092-486e-e0bb-08d8c7608cbd
x-ms-traffictypediagnostic: BYAPR05MB4248:
x-microsoft-antispam-prvs: <BYAPR05MB4248A679B365380C5C9D6C04D0B59@BYAPR05MB4248.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uB3WS/CEu+TutNysO4AIlnMpTI2LZsDuB8ZnE7tU1ZeLW8uS4KDkvylt1cIOf9edzIpXlnDzwn+qVjmzFU+hHVGa3gVpebTk4RgdhyWaWzKSetiIoP8bBDIm9gNDE7ca/rEeqQoFkGGvq+XpcO8tf4UWh9nVrAc5gPxLWL/0IkcVZcx9TURuGTUo6lDUrT9wpeYAitSwhOKr+/YjujeSgwyf3rsY/PxDkefinx7VYWzLQ765tr6T6sey/B1tlaHXVQf9eFGaBUXsSlrbwPYYO5YT9WCI3/Vv/NVRBtJoelAdo6nDntbzFzs7M2wRPjcBYMbl68j2sDGIQ5KVZoQGdES0tfafRe3TP9OHGw383mvh2sMMmLvyFUoxciQQwugAYLqynY/u/y+DDGvGkikxx0ZTmhOL3Alq2ggAgruiqnLD6+lPINRtrqYk5UKBgbVOJ84I3GPyQ3diqPtjxxEKPuXmjn/jNg6sSzSntpiKT8iVHdWfL1lbTxCdvB1rkkOaGH6fRfMGe+7LBIFUE6MWm+J2NnSHpeRmBjuK096+llId2Eiv+UbBR5Yd0Cg1qTceg4xKd/vlzShtyvlmEB8kXg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB4776.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(2616005)(6916009)(76116006)(54906003)(86362001)(33656002)(2906002)(71200400001)(8676002)(66446008)(64756008)(66556008)(66946007)(4326008)(5660300002)(26005)(7416002)(316002)(8936002)(36756003)(6512007)(478600001)(6486002)(53546011)(6506007)(66476007)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SlZGT0EyeHFJaWR6cXpma0YyQ2xKbnp5QzNmWE5qQVlqejlZdm1IMDZROEN4?=
 =?utf-8?B?MjgzNGZxRTlrR211VTcvdWtJdVZoZEtpcjkySzJQTFZmTjllNHMvV25mOUxl?=
 =?utf-8?B?NXFLc3JDU0tVS1VudndrQlovWFVHSHYzN3gxOEN6VklCWjhsUG1RT1ZIOXVu?=
 =?utf-8?B?TWI5emFzZkJldzJOcWY2b1N1cW1UakVqa1VIaVhTaDhFRnEyTWo0M2JURjlE?=
 =?utf-8?B?UjUvUlpFYjR3M040TFl5S1kvTy9EQXEyblVqNU9aVVZNbXhpRGU4dk9ta2VV?=
 =?utf-8?B?Z1IybHcyRkcyQzdVM2JlOVUxZUdtNnowUnBmaFhSMloyYXM4OHdsQis5Nk1C?=
 =?utf-8?B?c1BoYW1zd0ZNT0dqc1dhYnFqRHZ1OWYwSDJrSk4yaFd5RWg1ZndZR1M4UGxu?=
 =?utf-8?B?OW94ZSt4Q2s1SnN4VW9UYnUwQjg5UGc2ZmpQUU13SnVIOU1yUXJBVTkyMHp5?=
 =?utf-8?B?SWpFZGw4Y1R5aGgvZElVTjkxeFVFZWpob1ptTzVHeHJraGFPUTdkTVdvRENY?=
 =?utf-8?B?SVl0UkJaenZIYzZvQWh3ZkNjcUpKa2JPYndhV25BamtEZjY5UHl4S3VkVy9S?=
 =?utf-8?B?bXUwdzFhTTM2Y0ZCSnNZRlVzbEtCT3JxbG0ySEVYd1gxNjJ0ZW5ZQ2xjY2Rv?=
 =?utf-8?B?VjhXSVZLbFQ2MUQxVW9LaXVYeFJWdTRTNWhWZDFIVmtDRWlnMHpxNVFoMjBk?=
 =?utf-8?B?dWhkaCswemU5TlBiTk9IYUpuTTlaWDVwcm5OS2NPQ3FUNlRjL3ErU2p5RC9J?=
 =?utf-8?B?MmsxQVRYaUxLakhiVlpWOFFoZjZxNUVIeGc1ZHF2Zkw0VWxmTUUvSGg3b1hV?=
 =?utf-8?B?QlB3WnY4dVE2YTMwVm9TZnlCSzJvSC9aNXU4VzFRTCtQRC9KdzI3WHozQXll?=
 =?utf-8?B?emhxQkJJUkU2Rkl1bHVxTzJYeUJHbmNiNnA2WUtYMTk1aTR5THVyTFZzdnpI?=
 =?utf-8?B?YUNFb01Rdm1oQ1BVZ1RiMEkyT3p4NGN0WitHNFVnSkc5MVJGZCt6OUgrKzAr?=
 =?utf-8?B?Y3ZpRi95N285ZDJEWDdzekJWbmVNRCtvK05XOVIzNkVncW94RVY0UUYvcS9i?=
 =?utf-8?B?Sm1NdmZ0VEpLMXdFVUY3SHhnWHNqV0x1czRzTDJBODFudjdrbnZZOFlWWk1o?=
 =?utf-8?B?ckNWVnFtUmdRZm1GS3ZXdUJTb1paRFBaSzZnSEFOTll3YjFyRENaVUZzYkRZ?=
 =?utf-8?B?WG95OUN1aGZET2VzYlgxWGdETTNaajEreGg2ZTJmQ0Z1RGRrMElTV2JpR24r?=
 =?utf-8?B?bXl2UzhiOERFT01LbjhXbkNlbkowVFcxd0huS3FWRzVTNzFGb1dZcmlsNVJF?=
 =?utf-8?B?RXBBUmJqcmthaDc1bEZHL2xvU093M2Z2THdSTjRyL2Fmd1ZseVg2VVZ5dkZp?=
 =?utf-8?B?aVp2elM1eEtWM2VkWFdlaS9iZUF5QnF4TVhEcEswdFJRWlVKaUZ1RS9iOHBq?=
 =?utf-8?B?Zmt6UWdtVFQ2UzFiYUtuQmF1OUJNRzdMSUFuNWE4a2JWYURyWGJ1NW80Q2tW?=
 =?utf-8?B?NldwMnBaandxNWpoVExsRitPa2Vod2FlL3p2bVlzY3g2aDlyK2J6WWJIaUZk?=
 =?utf-8?B?bGZiYzBOSTZ2RU5ZUDNsT3hVejVtQzFLSnJWUFdzSmVPTm5OemNHWDZRNGFB?=
 =?utf-8?B?eTYwSHhBYWRSQlM0WDFzZXk4MkF4NzFmUzg3K0Z4SGRzUkVITVJnWXk4L3BQ?=
 =?utf-8?B?S0dCUzhVTzVLeUdNakJ5OUZ1QXNWM1ZKQnFZTnlMOXI4c3F5Y2RZc3Z4RHJR?=
 =?utf-8?Q?/MHPMuzXc5B/shpU2BGyWWxP5A/pS0AZLo9/1+H?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9DC8C5CE9FEB9418B5FBA96785E57B8@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4776.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6818f7a-6092-486e-e0bb-08d8c7608cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 09:54:36.3657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFIznUjwJEV875gICSVXrXqGKb70u7v5tV+sMy+ktQssc2O+a5yhzPdDLORyiR1bO2c35VZEgmQMHghaauUFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4248
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiBGZWIgMiwgMjAyMSwgYXQgMTozMSBBTSwgUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgRmViIDAyLCAyMDIxIGF0IDA3OjIwOjU1
QU0gKzAwMDAsIE5hZGF2IEFtaXQgd3JvdGU6DQo+PiBBcm0gZG9lcyBub3QgZGVmaW5lIHRsYl9l
bmRfdm1hLCBhbmQgY29uc2VxdWVudGx5IGl0IGZsdXNoZXMgdGhlIFRMQiBhZnRlcg0KPj4gZWFj
aCBWTUEuIEkgc3VzcGVjdCBpdCBpcyBub3QgaW50ZW50aW9uYWwuDQo+IA0KPiBBUk0gaXMgb25l
IG9mIHRob3NlIHRoYXQgbG9vayBhdCB0aGUgVk1fRVhFQyBiaXQgdG8gZXhwbGljaXRseSBmbHVz
aA0KPiBJVExCIElJUkMsIHNvIGl0IGhhcyB0by4NCg0KSG1t4oCmIEkgZG9u4oCZdCB0aGluayBB
cm0gaXMgZG9pbmcgdGhhdC4gQXQgbGVhc3QgYXJtNjQgZG9lcyBub3QgdXNlIHRoZQ0KZGVmYXVs
dCB0bGJfZmx1c2goKSwgYW5kIGl0IGRvZXMgbm90IHNlZW0gdG8gY29uc2lkZXIgVk1fRVhFQyAo
YXQgbGVhc3QgaW4NCnRoaXMgcGF0aCk6DQoNCnN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfZmx1c2go
c3RydWN0IG1tdV9nYXRoZXIgKnRsYikNCnsNCiAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
IHZtYSA9IFRMQl9GTFVTSF9WTUEodGxiLT5tbSwgMCk7DQogICAgICAgIGJvb2wgbGFzdF9sZXZl
bCA9ICF0bGItPmZyZWVkX3RhYmxlczsNCiAgICAgICAgdW5zaWduZWQgbG9uZyBzdHJpZGUgPSB0
bGJfZ2V0X3VubWFwX3NpemUodGxiKTsNCiAgICAgICAgaW50IHRsYl9sZXZlbCA9IHRsYl9nZXRf
bGV2ZWwodGxiKTsNCiAgICAgICAgDQogICAgICAgIC8qDQogICAgICAgICAqIElmIHdlJ3JlIHRl
YXJpbmcgZG93biB0aGUgYWRkcmVzcyBzcGFjZSB0aGVuIHdlIG9ubHkgY2FyZSBhYm91dA0KICAg
ICAgICAgKiBpbnZhbGlkYXRpbmcgdGhlIHdhbGstY2FjaGUsIHNpbmNlIHRoZSBBU0lEIGFsbG9j
YXRvciB3b24ndA0KICAgICAgICAgKiByZWFsbG9jYXRlIG91ciBBU0lEIHdpdGhvdXQgaW52YWxp
ZGF0aW5nIHRoZSBlbnRpcmUgVExCLg0KICAgICAgICAgKi8NCiAgICAgICAgaWYgKHRsYi0+bW1f
ZXhpdGluZykgew0KICAgICAgICAgICAgICAgIGlmICghbGFzdF9sZXZlbCkNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGZsdXNoX3RsYl9tbSh0bGItPm1tKTsNCiAgICAgICAgICAgICAgICByZXR1
cm47DQogICAgICAgIH0gICAgICAgDQogICAgICAgIA0KICAgICAgICBfX2ZsdXNoX3RsYl9yYW5n
ZSgmdm1hLCB0bGItPnN0YXJ0LCB0bGItPmVuZCwgc3RyaWRlLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICBsYXN0X2xldmVsLCB0bGJfbGV2ZWwpOw0KfQ==
