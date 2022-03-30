Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCBB4EBA95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 08:08:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSwwB6QgWz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 17:08:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60f;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSwvg2d2Qz2xWm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 17:07:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkKxh/XwCQq52wzTt6fL0CQ0/ASCSlMDkj3yBIf1bAj2GX4fwLynWrVFZtdssMdIGdA0rjn3d9FXVcVJM8kfW8RmJjRO5p3yoZrgGAImH2w4T7og06lkBgWo1OSzFsn7iTWC9kuMC0foSypTL7sbetPWjisYdbEV9P/Ej9k+ocnzsWrkgOj+MdlP+fQR+OLTU0g2guaNCX01RgsXx0YWz7EUw9581Hd3a71yAVylJmD1K2IGAkZ16LKiNuXjrKUe61eoUNqLePtnZVJEwT2ea3rdEe1eJcG8ILFVVgFei/6uVbLDuRRtc6kPIDCvdS+ELUCLfFoght6h0M5RN2d0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haPo96bWSzueoKjiGKb0vSjO+9NBriqWTn0ya8JYeDA=;
 b=Bau5265bcUAIjnXL6PHN7CYFLfqbQahGCnqZqfUGUdsFC67qMFed0kgLtesPF0TvTxzqkNBPChNSR08LVtQUWIMOcIYsVkr3PKvcIJnkssIOJ6TRMGtQ3UyR7ykGHQ/AFTkRNAlQJHIVm20l5nRrzVoxqeDTXOcemO/fYRlzX0Vu4lKjw9+/LFBcwHKSBa8E7YyglM/31jlTBJAtgozRZdo2dM1mgxZxg2HpXde14qX0Kw9nkceEeXzKeFLOSQHoJL1SArM49nwIiNUhCnyRm6yFK5vco8sISi6Wv5OwX3JRnBOVljrZzkPZwKw5pvQP+mnyEauUitpxoRHfP2JSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3684.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 06:07:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:07:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] powerpc/pgtable: remove _PAGE_BIT_SWAP_TYPE for
 book3s
Thread-Topic: [PATCH v2 7/8] powerpc/pgtable: remove _PAGE_BIT_SWAP_TYPE for
 book3s
Thread-Index: AQHYQ40wY93tUMDYrEGXxCs8qiA/eKzXcbwA
Date: Wed, 30 Mar 2022 06:07:22 +0000
Message-ID: <22d3c42d-402f-8aeb-e989-c05d023b2ed3@csgroup.eu>
References: <20220329164329.208407-1-david@redhat.com>
 <20220329164329.208407-8-david@redhat.com>
In-Reply-To: <20220329164329.208407-8-david@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4759bff5-cd0f-45ad-d0f0-08da12138e4d
x-ms-traffictypediagnostic: MR1P264MB3684:EE_
x-microsoft-antispam-prvs: <MR1P264MB36847256674C430F247A6201ED1F9@MR1P264MB3684.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJ76by3EzGK5MH6xh+u2tqnbUKGUumze0bX2RIdIhjhtr8cdzUyrHeFpLpkpOVUUrf6LH8ZjU8Lmraxf7pIX+9rK966Cxhf2GMG6XCRK6jb3zW37WtW6ZgdNQqlltaEVLYNo8OUVIi/plap/EohY9Pd9HdGkSt8983pmrdFoUG++uyGVhBzwixaT/nbIIN16EWrmaF/seMNAM3KLBAc0MO+UHVQTnfgve5jRAx1cuq0pfY2ZAMPVnxY5I9Te+2Igv5wh20U3zE90JPr+tkZH/lBd6SGtdnnsGZJdG0rInbjUVo+her19c3YJz4zCyI4lsGbq5pg4jWKfJhhGE+6hIXd14qWwP2qOpHRZ4X63mwVvksiuup00kiYm4i1qpjvo+OTOFB3F3bvwIlKE3RbtPTlhQ+RuyUqPkx8C8PA6PYS9rAXvuqJ2q6i+k7o/XmpeT7P1uNcAhZLwYRypA+T4o/trAqu+wQEjuCc3+JFhOWZpcnuE5Llu8QtQPN9XPSIZTsGCIqxqdPuzWA95txX3AOWR1xDLlWv9a8Qv7gFUJb8NJ96s3C+6oSuFIeCjTawNZwgzQcS3zdm7v9riL4PVgEKIcGeDlvTVl9eV9eKMQiJAkg4ojAnx7K3Lorsi5NBen5uSvV5I7gjlO751eL/7dVSZOwX7vBbzZfBJxZJIymS7BAaJFt9Kt65beIFa1tfuyCeYN+QJCyng1LN9cYq08bFIK8y9GdBACTVm4cyVA5TZR7osxzuwB2SVG9U8JSggM8a9SpF43OjKVD4iDQqJJ0EDkIh/jTkqvIJpx7teJUI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(6512007)(54906003)(31696002)(6506007)(2906002)(86362001)(91956017)(8676002)(4326008)(508600001)(38070700005)(76116006)(64756008)(66446008)(66556008)(66946007)(71200400001)(66476007)(2616005)(5660300002)(36756003)(316002)(6486002)(31686004)(186003)(44832011)(7406005)(26005)(7416002)(66574015)(122000001)(38100700002)(8936002)(83380400001)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWJHQmhiQXNFM29EYXlXdTh1djUxU3FkeXhLN3BYOHB1WUFVTllncnN3dmlp?=
 =?utf-8?B?NEloREZEUGozNFRvODYvMW1McmVrTlJuWnVzRUpjLzNzYVM1RE5uZTdRVXRq?=
 =?utf-8?B?TnArYUpQdkZhNzJ3VE9jNE9MMzR1OVlWNlBPSGR3NW0vMklDS2RyRE5IQmF6?=
 =?utf-8?B?V3MvZE05QVZlcmwrTDBLTmFyTHdnTzF4d0U1VFlqc2NmVzM5V2VCdlF4MHF5?=
 =?utf-8?B?dkdMaXdPOEZGdEhNOWJLSUpLNVN4Vlo3UXhqQUZNV3k4dGxkWDZkdGVNR1FG?=
 =?utf-8?B?cHhxUmdwcHpkOGY3NllpYzBBSG8xQXl3cUtSY1BKY28wSDNWMmNpNnd2MU1a?=
 =?utf-8?B?S2EzRnhiUWdJelQrNVhMSjBjM3cyV3ZVa3k1RlpjUVMvUkhzcXpJL1lQai9G?=
 =?utf-8?B?dmIxdXdGWXJVSEJubVQ5dGlrWHhWdUU5ZS94YTlTUG5Qc1U5cDhKSEJGLzZj?=
 =?utf-8?B?WTlaNU5IdXdMc0VzNHlhSG12V2hSdnZXMVNEejdNMkhkWTkxdDVnQ1BzcTR6?=
 =?utf-8?B?WDJEdGdwclRORnJPUGhCa0RjNUpsNDFEQkRUbTZXK2NqUDZlcGlGZFV4empo?=
 =?utf-8?B?VFBRaXJCWnk0eC96UXVBam53VjU2NEdpZ1FIbHMrTkhJZUxONTBjVEFEd2dh?=
 =?utf-8?B?NkFUVkhUNW1KMkxaWkVILzRTM2RmYjhKamtWUXFPZmtSTllwMi8xdHVHbU5Q?=
 =?utf-8?B?ZWxjV1EyN1JVRmVGRFkyYmdWSCtQZHA4dG13aDlVYWFrMUNtMUtIUm5Kb1ZT?=
 =?utf-8?B?WWU5OHNMZE5JMEtNRWZHM0xKUkJxTFZhZlVpSEM5YUlwaVJIcC9zalNmUFJ2?=
 =?utf-8?B?U2R3N3hpN2ZSMTFsMXhxaFR6SFhXWWtvRDRjTk93Zm40Zjlxc2ZUNGF3bThy?=
 =?utf-8?B?WFBQVWJRNVBPbmRsUWxCQ2g3aFZxT3M1WGdZenJzRExqNlVCc1B3bTRTNURH?=
 =?utf-8?B?NEtZWHJUVDIySVlpV1ZhSXAzdXVuWVEycUc0ZFBUcVA2MCtMeFBicFE5V1Ex?=
 =?utf-8?B?dlBHdXQ4aDEyWXZ1UzdzWlZHeHFEd1VyeFhiNW9PRUdGdHFZdmtNbHJxVzZ1?=
 =?utf-8?B?MmtrQkt4bUlaZVlGWDE1TE13TGtOcCtLS3AzNlMraW0zS083RGpoUDQzaDRW?=
 =?utf-8?B?QWNwRnR6K2MxeTB6OVlrQVhnR3pMTXJLT3E1ODJTMUg4eVhNWkFCSWluVkVY?=
 =?utf-8?B?Tk4xZTV1ZFgzN2p6ekNna2M3NnFUcEFvS0wwU0FxN3NWMm9qZENjek5FMFhp?=
 =?utf-8?B?VWZsKzdVcGx6TVgxUTR6a29YWUV6K3RrSC9zVzhya3I1emFIdE1LVEN1Undi?=
 =?utf-8?B?b2tWWVZmZ0k5b0xlTkJUMUpBclpQencxOUFsaHoyRm9wSWhEWGd3NVZyZlRs?=
 =?utf-8?B?Y3IzNnhndVM2cmRUMnRDRFlRTjV3V2h4YUhWeE4yWWR1TE1ndVNOZUNQWk1t?=
 =?utf-8?B?c0xTTHBjY0hrSjBHMDc3Q3FEMVp2Qkpqa2ZjZHk3MkJTcnU1ckJOMVRaUWZ1?=
 =?utf-8?B?Ty9qVm5JUTMzaktDNlNQZkNmSXY5SzFwSFBWMDVZVHJYOVpEMEYvSDcwNzJ0?=
 =?utf-8?B?QksyNlB0NTBmeEhCL1JCbFlPcUdaVllHZzMxUHB0Z09FdFZxeFh6MTB2d1Jo?=
 =?utf-8?B?TE84bmFlYi9sOUs3QjI3NnlOM2RGYzEvWWJrME9DcGRyekRWdno3Z2xTcytk?=
 =?utf-8?B?Lzd5OTdpaWJWWTlPWDA2SGU5NDU2Tmh1R00rYnVEYWMwVFBUOS9Uek5QZnBC?=
 =?utf-8?B?UEhJczlCWEYxY0xxRlpXb0huTzZPYytSTitzc1BCQm12bXJDS2JET0pkQVR1?=
 =?utf-8?B?TDdsQlUyem9JaC9OR0k1dEZxL3F5VkIzVnpaVm9PV09TcUNiUmRXYkFBaVdR?=
 =?utf-8?B?VDV5VHJjUndhcHFhVUlnbXhYUW9uNzBZWVg5U1RYSlFEWThxTHVzVHZxSEFO?=
 =?utf-8?B?ZWRBM3ArYStLc20xQzQ4UG85bUg4UHY0MzJHQ0pXN2lmRW5aaHdNRmZsT1pq?=
 =?utf-8?B?eWhaT0RqUUE3citRYVNTSkRZTkZIcUpsSzIzVFN1WExubmR2em1BU0FQTG9I?=
 =?utf-8?B?OWxLMnVISUNpQkV1ZzZhdEVEeFgzU2ZibTRSYUwvVHR3eFlNaWZyS0p3QVFZ?=
 =?utf-8?B?QzBHSDhHeERzdGcxZTJxWVMrMU1nUFhYL3RXTDRtN1dLa1czZGJwdDlaOTJM?=
 =?utf-8?B?S2xFNU9EbHJadUwvMFpVVlczeVFHM0l0TGUvdE5McHJUWVNFa0hobzRVRlJW?=
 =?utf-8?B?UWszdTBzNE1JR09Sa3dmcVRVNHpUOGozR1NWbDRIL09Ednp4SUk4MGY5RU9F?=
 =?utf-8?B?bVRmNko4eUgyNEMrbW1ib0hyaE9IY0E3T0xmTGg1aC9KRzUvN0xNRmZGSUpO?=
 =?utf-8?Q?1OjNwbpUxArB1pbKa4Dgvj5nNHwKzSwmjcuUE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8443F8F09D56424C8BA13B9E4746293A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4759bff5-cd0f-45ad-d0f0-08da12138e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 06:07:22.6708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGxYcoQKiqY34QN2wVqc35/3shc0skppOrfXgv2f50uvNdiZWcFGvIbdE2y8NO3cwU7UnkuW7ouhMY4sghCtq09MEmKPy+tZNgsPmVPMG5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3684
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
Cc: Jan Kara <jack@suse.cz>, Catalin Marinas <catalin.marinas@arm.com>,
 Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Donald Dutile <ddutile@redhat.com>,
 Liang Zhang <zhangliang5@huawei.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Andrea Arcangeli <aarcange@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Shakeel Butt <shakeelb@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 "x86@kernel.org" <x86@kernel.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Nadav Amit <namit@vmware.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Rik van Riel <riel@surriel.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oded Gabbay <oded.gabbay@gmail.com>, Jann Horn <jannh@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oleg Nesterov <oleg@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Roman Gushchin <guro@fb.com>, "Kirill A .
 Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzAzLzIwMjIgw6AgMTg6NDMsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IFRoZSBzd2FwIHR5cGUgaXMgc2ltcGx5IHN0b3JlZCBpbiBiaXRzIDB4MWYgb2YgdGhlIHN3
YXAgcHRlLiBMZXQncw0KPiBzaW1wbGlmeSBieSBqdXN0IGdldHRpbmcgcmlkIG9mIF9QQUdFX0JJ
VF9TV0FQX1RZUEUuIEl0J3Mgbm90IGxpa2UgdGhhdA0KPiB3ZSBjYW4gc2ltcGx5IGNoYW5nZSBp
dDogX1BBR0VfU1dQX1NPRlRfRElSVFkgd291bGQgc3VkZGVubHkgZmFsbCBpbnRvDQo+IF9SUEFH
RV9SU1YxLCB3aGljaCBpc24ndCBwb3NzaWJsZSBhbmQgd291bGQgbWFrZSB0aGUNCj4gQlVJTERf
QlVHX09OKF9QQUdFX0hQVEVGTEFHUyAmIF9QQUdFX1NXUF9TT0ZUX0RJUlRZKSBhbmdyeS4NCj4g
DQo+IFdoaWxlIGF0IGl0LCBtYWtlIGl0IGNsZWFyZXIgd2hpY2ggYml0IHdlJ3JlIGFjdHVhbGx5
IHVzaW5nIGZvcg0KPiBfUEFHRV9TV1BfU09GVF9ESVJUWSBieSBqdXN0IHVzaW5nIHRoZSBwcm9w
ZXIgZGVmaW5lIGFuZCBpbnRyb2R1Y2UgYW5kDQo+IHVzZSBTV1BfVFlQRV9NQVNLLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+IC0t
LQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgMTIg
KysrKystLS0tLS0tDQoNCldoeSBvbmx5IEJPT0szUyA/IFdoeSBub3QgQk9PSzNFIGFzIHdlbGwg
Pw0KDQpDaHJpc3RvcGhlDQoNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ib29rM3MvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC9wZ3RhYmxlLmgNCj4gaW5kZXggODc1NzMwZDVhZjQwLi44ZTk4Mzc1ZDVjNGEgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IEBAIC0x
Myw3ICsxMyw2IEBADQo+ICAgLyoNCj4gICAgKiBDb21tb24gYml0cyBiZXR3ZWVuIGhhc2ggYW5k
IFJhZGl4IHBhZ2UgdGFibGUNCj4gICAgKi8NCj4gLSNkZWZpbmUgX1BBR0VfQklUX1NXQVBfVFlQ
RQkwDQo+ICAgDQo+ICAgI2RlZmluZSBfUEFHRV9FWEVDCQkweDAwMDAxIC8qIGV4ZWN1dGUgcGVy
bWlzc2lvbiAqLw0KPiAgICNkZWZpbmUgX1BBR0VfV1JJVEUJCTB4MDAwMDIgLyogd3JpdGUgYWNj
ZXNzIGFsbG93ZWQgKi8NCj4gQEAgLTc1MSwxNyArNzUwLDE2IEBAIHN0YXRpYyBpbmxpbmUgcHRl
X3QgcHRlX21vZGlmeShwdGVfdCBwdGUsIHBncHJvdF90IG5ld3Byb3QpDQo+ICAgCSAqIERvbid0
IGhhdmUgb3ZlcmxhcHBpbmcgYml0cyB3aXRoIF9QQUdFX0hQVEVGTEFHUwlcDQo+ICAgCSAqIFdl
IGZpbHRlciBIUFRFRkxBR1Mgb24gc2V0X3B0ZS4JCQlcDQo+ICAgCSAqLwkJCQkJCQlcDQo+IC0J
QlVJTERfQlVHX09OKF9QQUdFX0hQVEVGTEFHUyAmICgweDFmIDw8IF9QQUdFX0JJVF9TV0FQX1RZ
UEUpKTsgXA0KPiArCUJVSUxEX0JVR19PTihfUEFHRV9IUFRFRkxBR1MgJiBTV1BfVFlQRV9NQVNL
KTsgXA0KPiAgIAlCVUlMRF9CVUdfT04oX1BBR0VfSFBURUZMQUdTICYgX1BBR0VfU1dQX1NPRlRf
RElSVFkpOwlcDQo+ICAgCX0gd2hpbGUgKDApDQo+ICAgDQo+ICAgI2RlZmluZSBTV1BfVFlQRV9C
SVRTIDUNCj4gLSNkZWZpbmUgX19zd3BfdHlwZSh4KQkJKCgoeCkudmFsID4+IF9QQUdFX0JJVF9T
V0FQX1RZUEUpIFwNCj4gLQkJCQkmICgoMVVMIDw8IFNXUF9UWVBFX0JJVFMpIC0gMSkpDQo+ICsj
ZGVmaW5lIFNXUF9UWVBFX01BU0sJCSgoMVVMIDw8IFNXUF9UWVBFX0JJVFMpIC0gMSkNCj4gKyNk
ZWZpbmUgX19zd3BfdHlwZSh4KQkJKCh4KS52YWwgJiBTV1BfVFlQRV9NQVNLKQ0KPiAgICNkZWZp
bmUgX19zd3Bfb2Zmc2V0KHgpCQkoKCh4KS52YWwgJiBQVEVfUlBOX01BU0spID4+IFBBR0VfU0hJ
RlQpDQo+ICAgI2RlZmluZSBfX3N3cF9lbnRyeSh0eXBlLCBvZmZzZXQpCSgoc3dwX2VudHJ5X3Qp
IHsgXA0KPiAtCQkJCSgodHlwZSkgPDwgX1BBR0VfQklUX1NXQVBfVFlQRSkgXA0KPiAtCQkJCXwg
KCgob2Zmc2V0KSA8PCBQQUdFX1NISUZUKSAmIFBURV9SUE5fTUFTSyl9KQ0KPiArCQkJCSh0eXBl
KSB8ICgoKG9mZnNldCkgPDwgUEFHRV9TSElGVCkgJiBQVEVfUlBOX01BU0spfSkNCj4gICAvKg0K
PiAgICAqIHN3cF9lbnRyeV90IG11c3QgYmUgaW5kZXBlbmRlbnQgb2YgcHRlIGJpdHMuIFdlIGJ1
aWxkIGEgc3dwX2VudHJ5X3QgZnJvbQ0KPiAgICAqIHN3YXAgdHlwZSBhbmQgb2Zmc2V0IHdlIGdl
dCBmcm9tIHN3YXAgYW5kIGNvbnZlcnQgdGhhdCB0byBwdGUgdG8gZmluZCBhDQo+IEBAIC03NzQs
NyArNzcyLDcgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5KHB0ZV90IHB0ZSwgcGdw
cm90X3QgbmV3cHJvdCkNCj4gICAjZGVmaW5lIF9fc3dwX2VudHJ5X3RvX3BtZCh4KQkocHRlX3Bt
ZChfX3N3cF9lbnRyeV90b19wdGUoeCkpKQ0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfTUVNX1NP
RlRfRElSVFkNCj4gLSNkZWZpbmUgX1BBR0VfU1dQX1NPRlRfRElSVFkgICAoMVVMIDw8IChTV1Bf
VFlQRV9CSVRTICsgX1BBR0VfQklUX1NXQVBfVFlQRSkpDQo+ICsjZGVmaW5lIF9QQUdFX1NXUF9T
T0ZUX0RJUlRZCV9QQUdFX05PTl9JREVNUE9URU5UDQo+ICAgI2Vsc2UNCj4gICAjZGVmaW5lIF9Q
QUdFX1NXUF9TT0ZUX0RJUlRZCTBVTA0KPiAgICNlbmRpZiAvKiBDT05GSUdfTUVNX1NPRlRfRElS
VFkgKi8=
