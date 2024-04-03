Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E885E897012
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:18:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nFjG1XyQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8lg853Gfz3w0W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nFjG1XyQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8lfP6Q0pz3vnS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:17:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I1aJd1SdHe1XcegeNT+J6rMCiaOtXvzXS44F/6cmOGEK92pIueAqbfCeSUq6qLIWbbIscqS/9FEM76HTp71D1OHvG6flK7M/rDTHhTXUlO1SejqNGA4jcs+GcQKasMqi6KzUbohoplvaQpVMn1P8rLvUccoOFQXiXBvbnGmnp2WLca7xMa2PV1LqMz06BEoX5jgJfkmFhnVY1Z/87aPZntVhWgowwHlw+ru2I+J2GJeQ0B2QARv+bCbHjGd6/P34VQGFBKcktARxKs+DyWsG9iDB2wugX+wshddSWBsIGBxfrkkY6zLBRwe01Uu4odiUNeauqQFJKY0AWasS9ruLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOc0vNEAf/2C7NNUN/aH5CJ/AHTqARD6uMPXLPQOJHE=;
 b=jXm0nv9ULQZq2kSxu6+LBMHSLXBGVJeaOg6YGR+ClbPkTiZ+CMDy7g3sQIzoX5QBbw9ALXXPeldMNe/CHw8/BJHYOHFJtIcf1/CW5a7DD1JYE98nLbg6R5HMWbVFgTInme0XJBDFHNXnUQkM+kUPAErUiYU3Dp6nQM6lCR0NX5okknh31ahNWD7baqxKl8nDzROKgh3bkkA44hXN9qCTKR4kHJtM8Prn9cqIOqnyd+ajVY41niLEb+m3uCPdZ1BORXWS8fIRSE/0xqGbeyvxcyc0CjSIBlSUV/MhP8jWkkDF4Gsos6zaexFncEAULDUqaR688WvDqF+Z0SYLq4sQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOc0vNEAf/2C7NNUN/aH5CJ/AHTqARD6uMPXLPQOJHE=;
 b=nFjG1XyQOPS82qYn266tVwSyfjoKJmTIj/hLyIOt3Tu7DWxLVAIBfkYtdZnjkm1GGNdDvx6nlcMpimdWzKZr++EMbuEJ/WxIglUztCcQw4gNoaKSEa6hGaRswjRqQjmNU/J6yqG0wr4nY3VNpZtEJRN8DFGxWW7u6gtT3YHUtNC79CGnGRuPxanDeLOczbSiAazWOh5oQeQ8JKeFmJLcJ8MYFN+L3mAV05xiCDDaCHeP5VCA0IreCewaG2/OYEKUWgXqUI17VpV0oxiIJYAj9NqeZpyX00DI8ABRXoeKI3pLMoEY3ktXQfzvo+uCSpf7bbEVPy8OzuLWlxcOKFOOAg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1752.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 13:17:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 13:17:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Thread-Topic: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Thread-Index:  AQHagFrF+NhtRwW1WEuV4j/Hb81merFVYNaAgAA88QCAAAKgAIAAC9qAgADSXoCAAAUJAIAAC4AAgAAClIA=
Date: Wed, 3 Apr 2024 13:17:06 +0000
Message-ID: <4b56356e-ac10-4f40-a4c3-7672d6e4a4e5@csgroup.eu>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X> <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com> <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
 <20240403130752.GC1723999@nvidia.com>
In-Reply-To: <20240403130752.GC1723999@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1752:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  og5nEl569+HKQaLcGgK2HAMNBFswiC8QTU2wfYG/EoOUZer2e5NxPiq9sk+K/5loWrBlUbGyyKNIj3r4ez/Cf5uC2Xy45uqrzk5X0WZwi7ah384PqRmLwdkv1ymFypuneQGP4g3VbnjmsKJV4Hd2ar2rEy/oDY+MklLSStursSYP0aoHj7OvWuiW28W4AwLtqoFjCUCbgJq7OMyjdjtDUsgGywzKUbgiij+mzXsfbu8ec7fI5422HX7CsH4MgmOp1tjnfLx8DJ2FAAsyIJH9YqJbD/hcM03137JE7k5YcOo35A8cVKTqFhOBPUI+/fnUi1LWECoptEU+V5b8zQSbCdJpJSpc4PVxZNbsgZ6yvob7r3LsVQp7wBYsna/OtzmXk8pOymbiFLg4F0o34YckIiDQI9QmMHkqUpxxEfCjZfsUBHOBfxbZLY9A9p/UHTnUPihyCIFBDvWl/crJ5CcVKrxxmpeRSNOQD1rmsSkJiVgUS4XwuUpAGxdu+xSulbAAeexgLhc0ZVvO1pmhRzxynkBtRXLYBwTOhf0/9gB28ni/0sS7OgaJ4wy2uzHLlXKwxAPDOt/IHHlpLolNOar+NPr6uZWcbdj4Ywrp55WUPGN+LV57rqu1HRPJ1L9XuxeIB9+cAKk8StvW1YLRjYXqJRNo3JyXdEAveIS8heqFH2M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bURjMURESU85ZFJqVmJtMWFXRnhiTWpCbzhucldoNGExNUtkV0JXWjFjS1ZY?=
 =?utf-8?B?QVl4c1ZhNjI4VndMUDRWQndkYndNVWgxc2R6UnpmYXkxc0hIb3F6NHZNWTFi?=
 =?utf-8?B?QkdlSE1LMit1VTRETmFCZndHQjc5ZUdiR1VaOGRMRmFOTTlvb1JQaUtFOHpn?=
 =?utf-8?B?VzFuMzlyYjRHNTBtaW9mOVpISFM4cm5mY2xZeXV1YXQxMFA3NFB2a1lOdHpx?=
 =?utf-8?B?YSsvWUtnMzZFcVZUR0VMT1I2WlNDT3FycjNzNkY5cGcyUXFZZzF3SUZnVW5a?=
 =?utf-8?B?ZzVxNkZES0hqdHhyTjBac2xOMVAwcjlHcXdWTnhHQjdaTGNwVXZQMVhkOWtZ?=
 =?utf-8?B?RWFSeXRPMXE5a3NJcWhHRXZZZmxkeEFUWjhlMFNrOFYvbUcxUWszWlFYdWs1?=
 =?utf-8?B?Y3JBL3hhbnUrM2FXVjNRdHNUdkFVM2FLcmd5TVFscGt0ak9BSWwrUVRiYm10?=
 =?utf-8?B?OFJCeHB4Q2tOSFowekQ3MDExWlVCbWwvdXVmSklySkJPYmM1UWRKUEZlMjhV?=
 =?utf-8?B?OVNuWUxpVytPN1RKQkxFV2lGYnYrc211YXpZRHgveElCcTdnM3hlMmZySWEx?=
 =?utf-8?B?VkZGRmg3cWttaVMwc2ZOUit5UGQ5bnVEQ3Z5aWozTHFxcmJTMXc3K2FXOVdQ?=
 =?utf-8?B?clJqVTR6NGh4U3FHRmlSTmZtQWVFWnRubDJkbWJPN0dhNVZuZkltNUV3WDB2?=
 =?utf-8?B?RVVqeloyVlRZUnFPeGxwWTIwZ3JHelIvSzk2d05TWGYvd0JDbVJNckExbWVt?=
 =?utf-8?B?bzhyOW9nZUxDM3Z0Nm9jRWFYZk9lUDlKUVEwTXRlNzBvaGJHQUw0OXhtYkRX?=
 =?utf-8?B?L0haYlg3NVdDSWFqOG5sYWhJSGcwcHpuOGVhZTlsSkRRWGlmNSttNGM4ek9T?=
 =?utf-8?B?U1hDSlAzdFNPTm05bHY5eHZybEptVUQ1UitRekVoRU44UllITmZraGNjaVhi?=
 =?utf-8?B?SnNBTWs4d2NEYkd6QkpFeURFaTJuZ2dralNXRnlqbVBJU3hIT0hldE1mTC9P?=
 =?utf-8?B?bXdpZm91bDBhbVZrTXdHNlNXQjMrNGM5MVF6c1N6RVM1QUhOTjMxV1pPaWU0?=
 =?utf-8?B?K0JIb1lGRlBKdld0cnlod1RpbHBQbG1TeTV3QkpLeldnbGxLemExOVcvMzBE?=
 =?utf-8?B?YTYzNzcvOGF6VENiYTlnbXVjOTFjL3RmejJSZXNReS9NWFdrdG5Mbys4c1dD?=
 =?utf-8?B?MGdtWStMdFJaeEhnUXZ2OUw2bUJ3SUNpVHRpYVRnbk4zaFRJamprREg1Y2F5?=
 =?utf-8?B?K2VXR29sK0ZkQW9LcTNYUkhZSU9iMCs2S2lTdEtTL2lmQVk1eGltbSt1THBI?=
 =?utf-8?B?QnNLZGhtYUFMMExRL1dsVXVlUnVLR1F6WTFIQm1RZ1A3TnZVaTEvRnEyekZL?=
 =?utf-8?B?aWVSL0Nwb3NlVkpWNVpqWGpOWlNMWnliS25QVzUxdlpac1Z6aXlYaTArVXJV?=
 =?utf-8?B?aU9tS3d0SDQ1c3dvVk1CV05qSUVOQWswT0tQRnF0VmNOMXhNQUFMOFJDbkNn?=
 =?utf-8?B?N21KTS9PYlpOdVBZV1BEWWlnVzhVNXE1c0JZOXI1SG9iM00yRmY0dlNObUVx?=
 =?utf-8?B?VmdhdXdoWmZHcGZkYlFReXpNTkRycGpRamxKeUMvYUEyZkJxRlBIYjBnMVRN?=
 =?utf-8?B?WlNUSlp3N2JJcjgyTzZOUVFrMVp3eXdraHdLWEppNEREWDhiMnR4NzQya2JW?=
 =?utf-8?B?UW9YUUgwYlNCeGRVZ3JBWHVaWXJ2VjRUQnI2bXh4cFJGc0E1UkErZWc1dEw3?=
 =?utf-8?B?RUxpa0krelBkbEY3S1hmRHd0aU5BNENIZHA5RThRLzRHclc5SVNkTkZ6WlAw?=
 =?utf-8?B?YlR1TnhkdzhhdlRRalV4YjNhY1FBQS9yVE9IRzExeEJYM0tGOXhRWEw3Uity?=
 =?utf-8?B?M0poSVlsdUttQ2gvQllqblFzMXJpQklSeFlTZ1RjUXpLOFVWN200YXZaRnE1?=
 =?utf-8?B?Q1FCZ2k0Z0dCSURYeFozY1YwMStYdGNtNHdzMDhUK0s2SHllcXZTUkdOaGt1?=
 =?utf-8?B?WXZDb1VWMlJoWUloNVZtQ09xalRsQzM0Z04yMWEzQTBqTVJiUlNMeVJUc2NY?=
 =?utf-8?B?cmdvQTNFVzEvVEQyUXJPSkVMbmhxUGVWbGsyTTZDbkdGVkNxOVNiaWtrMzJE?=
 =?utf-8?Q?r/NjB3VJ3CZhsLj5om6U+1BWA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <067C2F196FCA5449B943F15C967CE87A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dae2439-7a66-48fa-b960-08dc53e05c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 13:17:06.3323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7H6dEgV9Ks385EM/xy10az1YvIXMsu5tJMraFB5c/brxWlZY/fLogMHbvJEcKBzQTzus7JP1BFkuVMU8WXhwOyR7yVfh2XEf3BqFnr9fiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1752
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K
 . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA0LzIwMjQgw6AgMTU6MDcsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIEFwciAwMywgMjAyNCBhdCAxMjoyNjo0M1BNICswMDAwLCBDaHJpc3RvcGhlIExl
cm95IHdyb3RlOg0KPj4NCj4+DQo+PiBMZSAwMy8wNC8yMDI0IMOgIDE0OjA4LCBKYXNvbiBHdW50
aG9ycGUgYSDDqWNyaXTCoDoNCj4+PiBPbiBUdWUsIEFwciAwMiwgMjAyNCBhdCAwNzozNTo0NVBN
IC0wNDAwLCBQZXRlciBYdSB3cm90ZToNCj4+Pj4gT24gVHVlLCBBcHIgMDIsIDIwMjQgYXQgMDc6
NTM6MjBQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPj4+Pj4gT24gVHVlLCBBcHIg
MDIsIDIwMjQgYXQgMDY6NDM6NTZQTSAtMDQwMCwgUGV0ZXIgWHUgd3JvdGU6DQo+Pj4+Pg0KPj4+
Pj4+IEkgYWN0dWFsbHkgdGVzdGVkIHRoaXMgd2l0aG91dCBoaXR0aW5nIHRoZSBpc3N1ZSAoZXZl
biB0aG91Z2ggSSBkaWRuJ3QNCj4+Pj4+PiBtZW50aW9uIGl0IGluIHRoZSBjb3ZlciBsZXR0ZXIu
LikuICBJIHJlLWtpY2tlZCB0aGUgYnVpbGQgdGVzdCwgaXQgdHVybnMNCj4+Pj4+PiBvdXQgbXkg
Im1ha2UgYWxsZGVmY29uZmlnIiBvbiBsb29uZ2FyY2ggd2lsbCBnZW5lcmF0ZSBhIGNvbmZpZyB3
aXRoIGJvdGgNCj4+Pj4+PiBIVUdFVExCPW4gJiYgVEhQPW4sIHdoaWxlIGFyY2gvbG9vbmdhcmNo
L2NvbmZpZ3MvbG9vbmdzb24zX2RlZmNvbmZpZyBoYXMNCj4+Pj4+PiBUSFA9eSAod2hpY2ggSSBh
c3N1bWUgd2FzIHRoZSBvbmUgYWJvdmUgYnVpbGQgdXNlZCkuICBJIGRpZG4ndCBmdXJ0aGVyDQo+
Pj4+Pj4gY2hlY2sgaG93ICJtYWtlIGFsbGRlZmNvbmZpZyIgZ2VuZXJhdGVkIHRoZSBjb25maWc7
IGEgYml0IHN1cnByaXNpbmcgdGhhdA0KPj4+Pj4+IGl0IGRpZG4ndCBmZXRjaCBmcm9tIHRoZXJl
Lg0KPj4+Pj4NCj4+Pj4+IEkgc3VzcGVjdCBpdCBpcyB3ZWlyZCBjb21waWxlciB2YXJpYXRpb25z
Li4gTWF5YmUgc29tZXRoaW5nIGlzIG5vdA0KPj4+Pj4gYmVpbmcgaW5saW5lZC4NCj4+Pj4+DQo+
Pj4+Pj4gKGFuZCBpdCBhbHNvIHN1cnByaXNlcyBtZSB0aGF0IHRoaXMgQlVJTERfQlVHIGNhbiB0
cmlnZ2VyLi4gSSB1c2VkIHRvIHRyeQ0KPj4+Pj4+ICAgIHRyaWdnZXJpbmcgaXQgZWxzZXdoZXJl
IGJ1dCBmYWlsZWQuLikNCj4+Pj4+DQo+Pj4+PiBBcyB0aGUgcHVkX2xlYWYoKSA9PSBGQUxTRSBz
aG91bGQgcmVzdWx0IGluIHRoZSBCVUlMRF9CVUcgbmV2ZXIgYmVpbmcNCj4+Pj4+IGNhbGxlZCBh
bmQgdGhlIG9wdGltaXplciByZW1vdmluZyBpdC4NCj4+Pj4NCj4+Pj4gR29vZCBwb2ludCwgZm9y
IHNvbWUgcmVhc29uIGxvb25nYXJjaCBkZWZpbmVkIHB1ZF9sZWFmKCkgd2l0aG91dCBkZWZpbmlu
Zw0KPj4+PiBwdWRfcGZuKCksIHdoaWNoIGRvZXMgbG9vayBzdHJhbmdlLg0KPj4+Pg0KPj4+PiAj
ZGVmaW5lIHB1ZF9sZWFmKHB1ZCkJCSgocHVkX3ZhbChwdWQpICYgX1BBR0VfSFVHRSkgIT0gMCkN
Cj4+Pj4NCj4+Pj4gQnV0IEkgbm90aWNlZCBhdCBsZWFzdCBNSVBTIGFsc28gZG9lcyBpdC4uICBM
b2dpY2FsbHkgSSB0aGluayBvbmUgYXJjaA0KPj4+PiBzaG91bGQgZGVmaW5lIGVpdGhlciBub25l
IG9mIGJvdGguDQo+Pj4NCj4+PiBXb3csIHRoaXMgaXMgZGVmaW5hdGVseSBhbiBhcmNoIGlzc3Vl
LiBZb3UgY2FuJ3QgZGVmaW5lIHB1ZF9sZWFmKCkgYW5kDQo+Pj4gbm90IGhhdmUgYSBwdWRfcGZu
KCkuIEl0IG1ha2VzIG5vIHNlbnNlIGF0IGFsbC4uDQo+Pj4NCj4+PiBJJ2Qgc2F5IHRoZSBCVUlM
RF9CVUcgaGFzIGRvbmUgaXQncyBqb2IgYW5kIGZvdW5kIGFuIGlzc3VlLCBmaXggaXQgYnkNCj4+
PiBub3QgZGVmaW5pbmcgcHVkX2xlYWY/IEkgZG9uJ3Qgc2VlIGFueSBjYWxscyB0byBwdWRfbGVh
ZiBpbiBsb29uZ2FyY2gNCj4+PiBhdCBsZWFzdA0KPj4NCj4+IEFzIGZhciBhcyBJIGNhbiBzZWUg
aXQgd2FzIGFkZGVkIGJ5IGNvbW1pdCAzMDNiZTRiMzM1NjIgKCJMb29uZ0FyY2g6IG1tOg0KPj4g
QWRkIHA/ZF9sZWFmKCkgZGVmaW5pdGlvbnMiKS4NCj4gDQo+IFRoYXQgY29tbWl0IG1ha2VzIGl0
IHNvdW5kcyBsaWtlIHRoZSBhcmNoIHN1cHBvcnRzIGh1Z2UgUFVEJ3MgdGhyb3VnaA0KPiB0aGUg
aHVnZXB0ZSBtZWNoYW5pc20gLSBpdCBzYXlzIGEgTFRQIHRlc3QgZmFpbGVkIHNvIHNvbWV0aGlu
Zw0KPiBwb3B1bGF0ZWQgYSBodWdlIFBVRCBhdCBsZWFzdD8/DQoNCk5vdCBzdXJlLCBJIG1vcmUg
c2VlIGl0IGp1c3QgbGlrZSBhIGNvcHkvcGFzdGUgb2YgY29tbWl0IDUwMWI4MTA0NjcwMSANCigi
bWlwczogbW06IGFkZCBwP2RfbGVhZigpIGRlZmluaXRpb25zIikuDQoNClRoZSBjb21taXQgbWVz
c2FnZSBzYXlzIHRoYXQgdGhlIHRlc3QgZmFpbGVkIGJlY2F1c2UgcG1kX2xlYWYoKSBpcyANCm1p
c3NpbmcsIGl0IHNheXMgbm90aGluZyBhYm91dCBQVUQuDQoNCldoZW4gbG9va2luZyB3aGVyZSBf
UEFHRV9IVUdFIGlzIHVzZWQgaW4gbG9vbmdhcmNoLCBJIGhhdmUgdGhlIA0KaW1wcmVzc2lvbiB0
aGF0IGl0IGlzIGV4Y2x1c2l2ZWx5IHVzZWQgYXQgUE1EIGxldmVsLg0KDQo+IA0KPiBTbyBtYXli
ZSB0aGlzPw0KPiANCj4gI2RlZmluZSBwdWRfcGZuIHB0ZV9wZm4NCj4gDQo+PiBOb3Qgc3VyZSBp
dCB3YXMgYWRkZWQgZm9yIGEgZ29vZCByZWFzb24sIGFuZCBJJ20gbm90IHN1cmUgd2hhdCB3YXMg
YWRkZWQNCj4+IGlzIGNvcnJlY3QgYmVjYXVzZSBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9w
Z3RhYmxlLWJpdHMuaCBoYXM6DQo+Pg0KPj4gI2RlZmluZQlfUEFHRV9IVUdFX1NISUZUCTYgIC8q
IEhVR0UgaXMgYSBQTUQgYml0ICovDQo+Pg0KPj4gU28gSSdtIG5vdCBzdXJlIGl0IGlzIGNvcnJl
Y3QgdG8gdXNlIHRoYXQgYml0IGZvciBQVUQsIGlzIGl0ID8NCj4gDQo+IENvdWxkIGJlLCBsb3Rz
IG9mIGFyY2hlcyByZXBlYXQgdGhlIGJpdCBsYXlvdXRzIGluIGVhY2ggcmFkaXgNCj4gbGV2ZWwu
LiBJdCBpcyBlc3NlbnRpYWxseSB3aHkgdGhlIGh1Z2VwdGUgdHJpY2sgb2YgcHJldGVuZGluZyBl
dmVyeQ0KPiBsZXZlbCBpcyBhIHB0ZSB3b3Jrcy4NCj4gICANCj4gSmFzb24NCg==
