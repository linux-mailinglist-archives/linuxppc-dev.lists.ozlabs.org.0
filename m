Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D3D89FCDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 18:31:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IELgmKBT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF7dH4wB9z3vbD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 02:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IELgmKBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF7cW51qhz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 02:31:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loqFKaX4nQWVO5uAp+1utO5F4YX0dFVsTW4QESR8o08ufWjtOzcGmqriI1VExibJH48Pq6IKR8e2/IrdAW63bzO+l8oF4UwjtJKlvA2WQxUpB8n+o5on+1rY9h75WWHm6iyqb3rCxq36yvxhm5ereIpoKDFhLAFHRjLmfQVgprSKnpZKYc5pvLHmzg/SP4LVfAuGQeV4JPqDPqnNe2HQmfdxJ4E0QasKsjjewOHZE8tekENd/INCabI2GldzXcdecyQmAbv/yMbQstv9C7UPM4SkYozPT1GdPaEMzOJlBiEHYZcB7wVFCOasunC2NSmWgV12T//yZcbCiRBKqTC2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxDAO74PjQ+yHY9yjiJjayDERNLI4Ke4SU7AqOus+2g=;
 b=FLKYyPm9KZtl9N5O1NAlTpLhEbQFoOEy0Ix1lq6Vr7u72qwfHosfXAdjB8Q1STtU0qnQBZnGJE5W2GE/sVGZFJWykuV77iIHxu1O8/PUF3WcKAhHVK4zIvJz47eVtyNDiW4LX8GdJ8OydjAiJCAnPapLDdFbrwgSwmF4drBKw6r0XzZx8unwutwqmBl9MiyqfyFjky9xwFcs/wpSa7SCeyyXoszhH9Lc8UYhRwa+53ZpP59WdNh5tdOBTap0MgVPcua+rm2vIHS8gEHAjIoQFJ/7m7a1/sE9BMsRAWt9YOZw5ubUcImi2dDlbFSYvq19wC6xVXg93W9ryD0o7iuMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxDAO74PjQ+yHY9yjiJjayDERNLI4Ke4SU7AqOus+2g=;
 b=IELgmKBTS0e74UsfUmq08VvhSRG+BkenVWIVtOHS2ELFUShVdQAfWhPccTbtkK3bvqXLqXWcTHIOMVw3rJXRj9j/nYuZ75sKpVHFFIBioUm5t7etYCJbpK4F3DG5YuryD2dJ92iqhM//2aMWO9o9xoDcAA/0WLfVWUiMdOJkN+4Fy11t63Jz+KFi0WaPCWKRopuEsu9WMfUE6LCqU/aoDxC+QvoEGtrpHrjpqW+VnhyGh4QdJwZPnY8qObqwNkORjr1s5UdjO/l2V7jAPUCek+8dpyyYkYLbPVtrTCiBz7n0vnFjLqgvjXDC5v4wctfGYvNbMCr5/bOPJdS0hyKwhA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1747.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 16:30:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 16:30:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Thread-Topic: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Thread-Index:  AQHae9xDtU7RU0MVOUS5yg8mgl66VrFD7w8AgATmKACAAT+mAIAOpvSAgAFXPYCAADmbAIAGay+AgAEH9YCAABFUAA==
Date: Wed, 10 Apr 2024 16:30:41 +0000
Message-ID: <7b75c4db-9dbe-4ff1-b649-06a9218ae0aa@csgroup.eu>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com> <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com> <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com> <ZhBwVLyHr8WEKSx2@x1n>
 <20240409234355.GJ5383@nvidia.com> <ZhawJ-VD6DtLZ2Zm@x1n>
In-Reply-To: <ZhawJ-VD6DtLZ2Zm@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1747:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ctYKsiq3FSRjLf6uBSnXSdJfPnEqkeDCsaFBrY8U4UlCi5CEVV8ATqqIGCRHLzXvp2BLT/PXbsSuiPxYlyntMb1sUTjhNQKGzdvFsmyVJswYC/+b5cUPn3dR/dvMBKlN0dd4GKEz5GDkduXZbmKxxHyG53J+ypm0ZbTnw3JRZzToPZFSdo2DfjVnN2LV1wqbLP2oG4hLqdMu8ecMY+2KqWQtXYKrzPodpcxcFNhMDyQmQn1rT40NLfLAasIZY0QSze0h9K49GGGQYHw9nWI5Drq+BcJw1ZxetEc8tJL43vXso5m7RACH+2CXqSwQmkC8tmG4nBZq7fYV7rpKEtm0cwv9qb5if7HYOZE84UuajuVqyIKDT98uqDZAjs2jJmhInG05hO3OYSS/S59bYLy27De8Bp1U4R8G1eSiCwNh56UzdNo/HHfjUYCUSX9qJdMbTlTH25l8ujEaa1fb/lfdSl+yfn0P9lrqjGLiaMfUV4kXsd1pEkZ19DERIv/gOj4UmO1pXRbM+b3b1HyIlRD4mr27mPI8oWbivr5D7LI/1byA8O2Nr/KAKmDIO1f01S+HrJB32Igk4QsvADBbYRC524Uc+sDHQsuBj5kmq0jAsmw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QkZDTGdXamR5cTUwaGJqSDBLTGlHd080UXNBLzJpMnhtQWl2dmJrRHd1Mlpo?=
 =?utf-8?B?ckZ3aGM1aHJzVGNYNW56TFdKL0NueTF3emdrU0JtaXBhd1dtalpQVG1HTjFY?=
 =?utf-8?B?ZEFJdlBNQlhJZmpsOFh2eGFQU0ljVGsxQ2lNdjBva2RKZ0N2R2FwcFJzTVNR?=
 =?utf-8?B?QmRGWnc3QUplZktjTTc1elZZUlpSWVlpQng1VGtLRnJDcnpOaUtneFRmUGZE?=
 =?utf-8?B?aVVzZkh2RUo0blIzdlRqc3RmaG9UdEN2NFoyWG1GVFlPUGRzUWpNcktoMkdR?=
 =?utf-8?B?UUx6bHFwMDRONWZIRVJtbkNUZFAvZzZVdmhxTm9ueUtnY0l1VndBcWlvdjE5?=
 =?utf-8?B?T3hnTlNjTjhWVFVYMXcrejcwMFc4M29uUnBnTWJwVnVaTU9PL1FSeHNrUDRv?=
 =?utf-8?B?WE1yUVhVaHZrNTNsY3VqalhScjhCWHBlYXdJWHY3OUt3T3Q5bWRKKy9SNUVt?=
 =?utf-8?B?SWJUUTYzS2V1OWYzODFHcklOQ0dDcFJGb3REMktDN1hxVll2RzJIMytkbWFX?=
 =?utf-8?B?N3FGRklYaUZsN2R4ZW9CUFpJYURuYXdMRGpsMXk3UXAxd2N4Tks5dDgraE5F?=
 =?utf-8?B?V2xsRWUyNmhyK2xWOVhDcVNzZnZQTUJobElvRklPRlFZNmh3NUM1cHE0VzZH?=
 =?utf-8?B?bVJiNHp2SEZray9PVHp3VzJQL0hSQURxYk92bWVzUUo3MnVZSjdOcFdmY2ZH?=
 =?utf-8?B?L0R5d1B1OXdKMUF3R0c2OTFLdEdNanJ5NHRnYkt6MVlCbXNSRElIM09zNjl1?=
 =?utf-8?B?V0JZa2w2K0hZNElYelJFTW1DMWVVejd4ajNoblhVTFZsRTR3SS9YaHNXV1RJ?=
 =?utf-8?B?K28vS0VIVDdGUGo4TDZxNUZFaTRPWVJQdkxYWHY3NDZNcmhGZFh1SDBYbVlL?=
 =?utf-8?B?TDZubzl1aHhMMXB5a2R4N254alZxaUpVa1lVNkVZdVdyWVZuUHJtUlBxNEw2?=
 =?utf-8?B?K0hBY3hnaGZZdUlyL1lqRTU0YjhWZ2I4K1Z4VXk2ckpoSFJ3TzJPMFlxRm5u?=
 =?utf-8?B?djBTQVEzeTdWY1FPN25sVlZUQ0R4NFY3M3hGa2k2bTFMR05PSkJpdjdRSHd5?=
 =?utf-8?B?R2c4Rk9HZEFNUkNrWHVJdS9jYkcyMVVXU29pTkVWTlFDdTdKOHFrMkVRazNI?=
 =?utf-8?B?YnQ4cXFLeEUzeTNpT0dTakxTZ3AwWUZiQU83YjNqRDA3R2FUc3BKZmYwL2tu?=
 =?utf-8?B?dE0xZE9aMnFXS0RLSnB0bmNYVU1nc0drYjVJUWt1RGZCVHJkQ21RRnJtYjBF?=
 =?utf-8?B?MzZrcEhoSldyaFJ2RnZVWUExVE1PalpQK2ZzNmt4VkExemlHUGNxYkdkbjd2?=
 =?utf-8?B?c3Zndjd2NEFxampDSEtqNFl3bDVYNnRuN1dvRmQ4dFJBenV3YzFOcXl5Uk1m?=
 =?utf-8?B?dzFBMVQ0UG8vaWhBd0llUzhZLzF0R1k3SCtSTy9RN0kyUHhlekFnT090dENw?=
 =?utf-8?B?N2dTaFFKL3RVM05UOTFXdTBlc0I0SGRhQXNHeHI0SjNjRFZua21mQUJMbnBv?=
 =?utf-8?B?SEs0Ykc1OXF5ZDV0VE8vZDJnQXhlaFBscTV2eUU2aEN2TXljOVd2emFkR1Jo?=
 =?utf-8?B?bER1OFl3aGVMMjRvUU5Beno5bVlxZXZ4M0luRzNaVGZKUUxWN29TVStqcmdm?=
 =?utf-8?B?dkdHSEc0Tm4zVVoxelovOFZLcEFVK0FqY0UrMVlnZ0hHMExiNGZsaHphdGRn?=
 =?utf-8?B?NDMrTjcxbXVKK29naStmVkF6RmV3WVdCbVNFeFd1MXQrRHE3elFzNlpTNzVw?=
 =?utf-8?B?NTlrTWRLUDBsTDlUQjlZUVhLUW85YmUrN05hK2lGVzR2a3ptV1dldHpRaW9Y?=
 =?utf-8?B?akVOMlNHVXdGOXJaS1pTM3Q0K3JQNmwvYkFMNTRzckx1SERqZnhNQk5KTkxF?=
 =?utf-8?B?ZUl4ZkdNamUrb2lpczI4NTd0MUFUSVNXZlpvbDhPcVhiaWF0YkhVWTBnZVYz?=
 =?utf-8?B?NGdJRm5GeHJlSWhnTlY2aThPbzVlZ0hKcis0a0J1bTVzV2hsc3VxZkRPOXkx?=
 =?utf-8?B?ZFo2WWRZblZscnFwS0FvdHdNUXBleTJURzVDMWtRTUM1RkZZMDFuYVY1UkEz?=
 =?utf-8?B?aTBPWUlHNGxFRFE5VlNLV29jQlVNOTl2K1g0aHBPRzN1TUFnc1N3a2t2aENv?=
 =?utf-8?B?Q0l5SGdVYkE3NWNyZFB3WDk5YnFTY1RONGJnVURkT1NEZU0rQmppSlVoazcx?=
 =?utf-8?B?dUUrVU9IdzNoNE0yTEltNkVNUHd2T2tlSEk1bHRmcVBBZTFVSXU5NTI4MVJV?=
 =?utf-8?B?dkxnZUw4cytLRW4yaktWRGxVV3FBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D95C1980B25CA44CBB78F17E64CE9C99@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb90e77-2e3c-49a3-af78-08dc597b9017
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 16:30:41.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhgUCgNueqQ4DX0GM9ktbiFdhH6JRIcGKhIhbeNPbHwVSGAc5LlHfG/3ihkvitUlsmsF5g9vhe6/xAW2kDF0BMqcHHctC1AHmu2RB5atTow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1747
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike
 .kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA0LzIwMjQgw6AgMTc6MjgsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFR1
ZSwgQXByIDA5LCAyMDI0IGF0IDA4OjQzOjU1UE0gLTAzMDAsIEphc29uIEd1bnRob3JwZSB3cm90
ZToNCj4+IE9uIEZyaSwgQXByIDA1LCAyMDI0IGF0IDA1OjQyOjQ0UE0gLTA0MDAsIFBldGVyIFh1
IHdyb3RlOg0KPj4+IEluIHNob3J0LCBodWdldGxiIG1hcHBpbmdzIHNob3VsZG4ndCBiZSBzcGVj
aWFsIGNvbXBhcmluZyB0byBvdGhlciBodWdlIHBYZA0KPj4+IGFuZCBsYXJnZSBmb2xpbyAoY29u
dC1wWGQpIG1hcHBpbmdzIGZvciBtb3N0IG9mIHRoZSB3YWxrZXJzIGluIG15IG1pbmQsIGlmDQo+
Pj4gbm90IGFsbC4gIEkgbmVlZCB0byBsb29rIGF0IGFsbCB0aGUgd2Fsa2VycyBhbmQgdGhlcmUg
Y2FuIGJlIHNvbWUgdHJpY2t5DQo+Pj4gb25lcywgYnV0IEkgYmVsaWV2ZSB0aGF0IGFwcGxpZXMg
aW4gZ2VuZXJhbC4gIEl0J3MgYWN0dWFsbHkgc2ltaWxhciB0byB3aGF0DQo+Pj4gSSBkaWQgd2l0
aCBzbG93IGd1cCBoZXJlLg0KPj4NCj4+IEkgdGhpbmsgdGhhdCBpcyB0aGUgYmlnIHF1ZXN0aW9u
LCBJIGFsc28gaGF2ZW4ndCBkb25lIHRoZSByZXNlYXJjaCB0bw0KPj4ga25vdyB0aGUgYW5zd2Vy
Lg0KPj4NCj4+IEF0IHRoaXMgcG9pbnQgZm9jdXNpbmcgb24gbW92aW5nIHdoYXQgaXMgcmVhc29u
YWJsZSB0byB0aGUgcFhYXyogQVBJDQo+PiBtYWtlcyBzZW5zZSB0byBtZS4gVGhlbiByZXZpZXdp
bmcgd2hhdCByZW1haW5zIGFuZCBtYWtpbmcgc29tZQ0KPj4gZGVjaXNpb24uDQo+Pg0KPj4+IExp
a2UgdGhpcyBzZXJpZXMsIGZvciBjb250LXBYZCB3ZSdsbCBuZWVkIG11bHRpcGxlIHdhbGtzIGNv
bXBhcmluZyB0bw0KPj4+IGJlZm9yZSAod2hlbiB3aXRoIGh1Z2V0bGJfZW50cnkoKSksIGJ1dCBm
b3IgdGhhdCBwYXJ0IEknbGwgcHJvdmlkZSBzb21lDQo+Pj4gcGVyZm9ybWFuY2UgdGVzdHMgdG9v
LCBhbmQgd2UgYWxzbyBoYXZlIGEgZmFsbGJhY2sgcGxhbiwgd2hpY2ggaXMgdG8gZGV0ZWN0DQo+
Pj4gY29udC1wWGQgZXhpc3RhbmNlLCB3aGljaCB3aWxsIGFsc28gd29yayBmb3IgbGFyZ2UgZm9s
aW9zLg0KPj4NCj4+IEkgdGhpbmsgd2UgY2FuIG9wdGltaXplIHRoaXMgcHJldHR5IGVhc3kuDQo+
PiAgIA0KPj4+PiBJIHRoaW5rIGlmIHlvdSBkbyB0aGUgZWFzeSBwbGFjZXMgZm9yIHBYWCBjb252
ZXJzaW9uIHlvdSB3aWxsIGhhdmUgYQ0KPj4+PiBnb29kIGlkZWEgYWJvdXQgd2hhdCBpcyBuZWVk
ZWQgZm9yIHRoZSBoYXJkIHBsYWNlcy4NCj4+Pg0KPj4+IEhlcmUgSU1ITyB3ZSBkb24ndCBuZWVk
IHRvIHVuZGVyc3RhbmQgIndoYXQgaXMgdGhlIHNpemUgb2YgdGhpcyBodWdldGxiDQo+Pj4gdm1h
Ig0KPj4NCj4+IFllaCwgSSBuZXZlciByZWFsbHkgdW5kZXJzdG9vZCB3aHkgaHVnZXRsYiB3YXMg
bGlua2VkIHRvIHRoZSBWTUEuLiBUaGUNCj4+IHBhZ2UgdGFibGUgaXMgc2VsZiBkZXNjcmliaW5n
LCBvYnZpb3VzbHkuDQo+IA0KPiBBdHRhY2hpbmcgdG8gdm1hIHN0aWxsIG1ha2VzIHNlbnNlIHRv
IG1lLCB3aGVyZSB3ZSBzaG91bGQgZGVmaW5pdGVseSBhdm9pZA0KPiBhIG1peHR1cmUgb2YgaHVn
ZXRsYiBhbmQgIWh1Z2V0bGIgcGFnZXMgaW4gYSBzaW5nbGUgdm1hIC0gaHVnZXRsYiBwYWdlcyBh
cmUNCj4gYWxsb2NhdGVkLCBtYW5hZ2VkLCAuLi4gIHRvdGFsbHkgZGlmZmVyZW50bHkuDQo+IA0K
PiBBbmQgc2luY2UgaHVnZXRsYiBpcyBkZXNpZ25lZCBhcyBmaWxlLWJhc2VkICh3aGljaCBhbHNv
IG1ha2VzIHNlbnNlIHRvIG1lLA0KPiBhdCBsZWFzdCBmb3Igbm93KSwgaXQncyBhbHNvIG5hdHVy
YWwgdGhhdCBpdCdzIHZtYS1hdHRhY2hlZC4NCj4gDQo+Pg0KPj4+IG9yICJ3aGljaCBsZXZlbCBv
ZiBwZ3RhYmxlIGRvZXMgdGhpcyBodWdldGxiIHZtYSBwYWdlcyBsb2NhdGUiLA0KPj4NCj4+IERp
dHRvDQo+Pg0KPj4+IGJlY2F1c2Ugd2UgbWF5IG5vdCBuZWVkIHRoYXQsIGUuZy4sIHdoZW4gd2Ug
b25seSB3YW50IHRvIGNvbGxlY3Qgc29tZSBzbWFwcw0KPj4+IHN0YXRpc3RpY3MuICAid2hldGhl
ciBpdCdzIGh1Z2V0bGIiIG1heSBtYXR0ZXIsIHRob3VnaC4gRS5nLiBpbiB0aGUgbW0NCj4+PiB3
YWxrZXIgd2Ugc2VlIGEgaHVnZSBwbWQsIGl0IGNhbiBiZSBhIHRocCwgaXQgY2FuIGJlIGEgaHVn
ZXRsYiAod2hlbg0KPj4+IGh1Z2V0bGJfZW50cnkgcmVtb3ZlZCksIHdlIG1heSBuZWVkIGV4dHJh
IGNoZWNrIGxhdGVyIHRvIHB1dCB0aGluZ3MgaW50bw0KPj4+IHRoZSByaWdodCBidWNrZXQsIGJ1
dCBmb3IgdGhlIHdhbGtlciBpdHNlbGYgaXQgZG9lc24ndCBuZWNlc3NhcmlseSBuZWVkDQo+Pj4g
aHVnZXRsYl9lbnRyeSgpLg0KPj4NCj4+IFJpZ2h0LCBwbGFjZXMgbWF5IHN0aWxsIG5lZWQgdG8g
a25vdyBpdCBpcyBwYXJ0IG9mIGEgaHVnZSBWTUEgYmVjYXVzZSB3ZQ0KPj4gaGF2ZSBzcGVjaWFs
IHN0dWZmIGxpbmtlZCB0byB0aGF0Lg0KPj4NCj4+Pj4gQnV0IHRoZW4gYWdhaW4gd2UgY29tZSBi
YWNrIHRvIHBvd2VyIGFuZCBpdHMgYmlnIGxpc3Qgb2YgcGFnZSBzaXplcw0KPj4+PiBhbmQgdmFy
aWV0eSA6KCBMb29rcyBsaWtlIHNvbWUgdGhlcmUgaGF2ZSBodWdlIHNpemVzIGF0IHRoZSBwZ2Qg
bGV2ZWwNCj4+Pj4gYXQgbGVhc3QuDQo+Pj4NCj4+PiBZZWFoIHRoaXMgaXMgc29tZXRoaW5nIEkg
d2FudCB0byBiZSBzdXBlciBjbGVhciwgYmVjYXVzZSBJIG1heSBtaXNzDQo+Pj4gc29tZXRoaW5n
OiB3ZSBkb24ndCBoYXZlIHJlYWwgcGdkIHBhZ2VzLCByaWdodD8gIFBvd2VycGMgZG9lc24ndCBl
dmVuDQo+Pj4gZGVmaW5lIHA0ZF9sZWFmKCksIEFGQUlDVC4NCj4+DQo+PiBBRkFJQ1QgaXQgaXMg
YmVjYXVzZSBpdCBoaWRlcyBpdCBhbGwgaW4gaHVnZXBkLg0KPiANCj4gSU1ITyBvbmUgdGhpbmcg
d2UgY2FuIGJlbmVmaXQgZnJvbSBzdWNoIGh1Z2VwZCByZXdvcmsgaXMsIGlmIHdlIGNhbiBzcXVh
c2gNCj4gYWxsIHRoZSBodWdlcGRzIGxpa2Ugd2hhdCBDaHJpc3RvcGhlIGRvZXMsIHRoZW4gd2Ug
cHVzaCBpdCBvbmUgbW9yZSBsYXllcg0KPiBkb3duLCBhbmQgd2UgaGF2ZSBhIGdvb2QgY2hhbmNl
IGFsbCB0aGluZ3Mgc2hvdWxkIGp1c3Qgd29yay4NCj4gDQo+IFNvIGFnYWluIG15IFBvd2VyIGJy
YWluIGlzIGNsb3NlIHRvIHplcm8sIGJ1dCBub3cgSSdtIHJlZmVycmluZyB0byB3aGF0DQo+IENo
cmlzdG9waGUgc2hhcmVkIGluIHRoZSBvdGhlciB0aHJlYWQ6DQo+IA0KPiBodHRwczovL2dpdGh1
Yi5jb20vbGludXhwcGMvd2lraS93aWtpL0h1Z2UtcGFnZXMNCj4gDQo+IFRvZ2V0aGVyIHdpdGg6
DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzI4OGYyNmY0ODc2NDhkMjFmZDk1OTBl
NDBiMzkwOTM0ZWFhNWQyNGEuMTcxMTM3NzIzMC5naXQuY2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1DQo+IA0KPiBXaGVyZSBpdCBoYXM6DQo+IA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL0tjb25maWcuY3B1dHlwZQ0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25m
aWcuY3B1dHlwZQ0KPiBAQCAtOTgsNiArOTgsNyBAQCBjb25maWcgUFBDX0JPT0szU182NA0KPiAg
ICAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OIGlmIEhVR0VUTEJf
UEFHRSAmJiBNSUdSQVRJT04NCj4gICAgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX1NQTElUX1BN
RF9QVExPQ0sNCj4gICAgICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX1RIUF9NSUdSQVRJT04gaWYg
VFJBTlNQQVJFTlRfSFVHRVBBR0UNCj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfSFVHRVBEIGlm
IEhVR0VUTEJfUEFHRQ0KPiAgICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19IVUdFVExCRlMN
Cj4gICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJTkcNCj4gICAgICAg
ICAgc2VsZWN0IEhBVkVfTU9WRV9QTUQNCj4gQEAgLTI5MCw2ICsyOTEsNyBAQCBjb25maWcgUFBD
X0JPT0szUw0KPiAgIGNvbmZpZyBQUENfRTUwMA0KPiAgICAgICAgICBzZWxlY3QgRlNMX0VNQl9Q
RVJGTU9ODQo+ICAgICAgICAgIGJvb2wNCj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfSFVHRVBE
IGlmIEhVR0VUTEJfUEFHRQ0KPiAgICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19IVUdFVExC
RlMgaWYgUEhZU182NEJJVCB8fCBQUEM2NA0KPiAgICAgICAgICBzZWxlY3QgUFBDX1NNUF9NVVhF
RF9JUEkNCj4gICAgICAgICAgc2VsZWN0IFBQQ19ET09SQkVMTA0KPiANCj4gU28gSSB0aGluayBp
dCBtZWFucyB3ZSBoYXZlIHRocmVlIFBvd2VyUEMgc3lzdGVtcyB0aGF0IHN1cHBvcnRzIGh1Z2Vw
ZA0KPiByaWdodCBub3cgKGJlc2lkZXMgdGhlIDh4eCB3aGljaCBDaHJpc3RvcGhlIGlzIHRyeWlu
ZyB0byBkcm9wIHN1cHBvcnQNCj4gdGhlcmUpLCBiZXNpZGVzIDh4eCB3ZSBzdGlsbCBoYXZlIGJv
b2szc182NCBhbmQgRTUwMC4NCj4gDQo+IExldCdzIGNoZWNrIG9uZSBieSBvbmU6DQo+IA0KPiAg
ICAtIGJvb2szc182NA0KPiANCj4gICAgICAtIGhhc2gNCj4gDQo+ICAgICAgICAtIDY0SzogcDRk
IGlzIG5vdCB1c2VkLCBsYXJnZXN0IHBnc2l6ZSBwZ2QgMTZHIEBwdWQgbGV2ZWwuICBJdA0KPiAg
ICAgICAgICBtZWFucyBhZnRlciBzcXVhc2hpbmcgaXQnbGwgYmUgYSBidW5jaCBvZiBjb250LXBt
ZCwgYWxsIGdvb2QuDQo+IA0KPiAgICAgICAgLSA0SzogcDRkIGFsc28gbm90IHVzZWQsIGxhcmdl
c3QgcGdzaXplIHBnZCAxMjhHLCBhZnRlciBzcXVhc2hlZA0KPiAgICAgICAgICBpdCdsbCBiZSBj
b250LXB1ZC4gYWxsIGdvb2QuDQo+IA0KPiAgICAgIC0gcmFkaXgNCj4gDQo+ICAgICAgICAtIDY0
SzogbGFyZ2VzdCAxRyBAcHVkLCB0aGVuIGNvbnQtcG1kIGFmdGVyIHNxdWFzaGVkLiBhbGwgZ29v
ZC4NCj4gDQo+ICAgICAgICAtIDRLOiBsYXJnZXN0IDFHIEBwdWQsIHRoZW4gY29udC1wbWQsIGFs
bCBnb29kLg0KPiANCj4gICAgLSBlNTAwICYgOHh4DQo+IA0KPiAgICAgIC0gYm90aCBvZiB0aGVt
IHVzZSAyLWxldmVsIHBndGFibGVzIChwZ2QgKyBwdGUpLCBhZnRlciBzcXVhc2hlZCBodWdlcGQN
Cj4gICAgICAgIEBwZ2QgbGV2ZWwgdGhleSBiZWNvbWUgY29udC1wdGUuIGFsbCBnb29kLg0KDQpl
NTAwIGhhcyB0d28gbW9kZXM6IDMyIGJpdHMgYW5kIDY0IGJpdHMuDQoNCkZvciAzMiBiaXRzOg0K
DQo4eHggaXMgdGhlIG9ubHkgb25lIGhhbmRsaW5nIGl0IHRocm91Z2ggSFctYXNzaXN0ZWQgcGFn
ZXRhYmxlIHdhbGsgaGVuY2UgDQpyZXF1aXJpbmcgYSAyLWxldmVsIHdoYXRldmVyIHRoZSBwYWdl
c2l6ZSBpcy4NCg0KT24gZTUwMCBpdCBpcyBhbGwgc29mdHdhcmUgc28gcGFnZXMgMk0gYW5kIGxh
cmdlciBzaG91bGQgYmUgY29udC1QR0QgKGJ5IA0KdGhlIHdheSBJJ20gYSBiaXQgcHV6emxlZCB0
aGF0IG9uIGFyY2hlcyB0aGF0IGhhdmUgb25seSAyIGxldmVscywgaWUgUEdEIA0KYW5kIFBURSwg
dGhlIFBHRCBlbnRyaWVzIGFyZSBwb3B1bGF0ZWQgYnkgYSBmdW5jdGlvbiBjYWxsZWQgUE1EX3Bv
cHVsYXRlKCkpLg0KDQpDdXJyZW50IHNpdHVhdGlvbiBmb3IgOHh4IGlzIGlsbHVzdHJhdGVkIGhl
cmU6IA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL3dpa2kvd2lraS9IdWdlLXBhZ2VzIzh4
eA0KDQpJIGFsc28gdHJpZWQgdG8gYmV0dGVyIGlsbHVzdHJhdGUgZTUwMC8zMiBoZXJlOiANCmh0
dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy93aWtpL3dpa2kvSHVnZS1wYWdlcyNlNTAwDQoNCkZv
ciA2NCBiaXRzOg0KV2UgaGF2ZSBQVEUvUE1EL1BVRC9QR0QsIG5vIFA0RA0KDQpTZWUgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLTRrLmgNCg0KDQo+IA0KPiBJIHRo
aW5rIHRoZSB0cmljayBoZXJlIGlzIHRoZXJlJ2xsIGJlIG5vIHBnZCBsZWF2ZXMgYWZ0ZXIgaHVn
ZXBkIHNxdWFzaGluZw0KPiB0byBsb3dlciBsZXZlbHMsIHRoZW4gc2luY2UgUG93ZXJQQyBzZWVt
cyB0byBuZXZlciBoYXZlIHA0ZCwgdGhlbiBhbGwNCj4gdGhpbmdzIGZhbGwgaW50byBwdWQgb3Ig
bG93ZXIuICBXZSBzZWVtIHRvIGJlIGFsbCBnb29kIHRoZXJlPw0KPiANCj4+DQo+PiBJZiB0aGUg
Z29hbCBpcyB0byBwdXJnZSBodWdlcGQgdGhlbiBzb21lIG9mIHRoZSBvcHRpb25zIG1pZ2h0IHR1
cm4gb3V0DQo+PiB0byBjb252ZXJ0IGh1Z2VwZCBpbnRvIGh1Z2UgcDRkL3BnZCwgYXMgSSB1bmRl
cnN0YW5kIGl0LiBJdCB3b3VsZCBiZQ0KPj4gbmljZSB0byBoYXZlIGNlcnRhaW50eSBvbiB0aGlz
IGF0IGxlYXN0Lg0KPiANCj4gUmlnaHQuICBJIGhvcGUgdGhlIHBtZC9wdWQgcGxhbiBJIHByb3Bv
c2VkIGFib3ZlIGNhbiBhbHJlYWR5IHdvcmsgdG9vIHdpdGgNCj4gc3VjaCBhbWJpY2lvdXMgZ29h
bCB0b28uICBCdXQgcmV2aWV3IHZlcnkgd2VsY29tZWQgZnJvbSBlaXRoZXIgeW91IG9yDQo+IENo
cmlzdG9waGUuDQo+IA0KPiBQUzogSSB0aGluayBJJ2xsIGFsc28gaGF2ZSBhIGNsb3NlciBsb29r
IGF0IENocmlzdG9waGUncyBzZXJpZXMgdGhpcyB3ZWVrDQo+IG9yIG5leHQuDQo+IA0KPj4NCj4+
IFdlIGhhdmUgZWZmZWN0aXZlbHkgdGhyZWUgQVBJcyB0byBwYXJzZSBhIHNpbmdsZSBwYWdlIHRh
YmxlIGFuZA0KPj4gY3VycmVudGx5IG5vbmUgb2YgdGhlIEFQSXMgY2FuIHJldHVybiAxMDAlIG9m
IHRoZSBkYXRhIGZvciBwb3dlci4NCj4gDQo+IFRoYW5rcywNCj4gDQo=
