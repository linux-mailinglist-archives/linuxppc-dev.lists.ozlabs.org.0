Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA547F6CCD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 08:20:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UAf4eWt6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc5wd4z86z3vbs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 18:20:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UAf4eWt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::608; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc5vk6ZmZz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 18:19:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxhAAYYzAaGDrCLnIMp4Zza22RQ1Tt8CfnWCwx8f8xu1g3y1MU1Ors7VfXf0Cu228YteOhEDXb8IVU2jcl6SWwwXH/AyTKlnASv8GR/pUoA9fe/yEKxX710mjdLLhifWQ2U4q5clX1hgx6v3/CI8C5rMX9tqg1VEL0vZcUUZTI0fNP61MhWhX2BAsLaIq99XCVzcbv9gO48jbdM6dgrAaEp6xi2pvYlhbXIR5oo4dWuYksZM6EGyt2hKYnzL4BZ+/BUmEtMxf199xZQwDHM8SqbjdU8a+AsgPO/UFEQGZM/Auo12sBYWDseb/ofEEgrOXe/cnpaB4noAfT2KaxUWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IxZ2jrq2h7gLHkS3n9lgRLesTsvMtv8jHcMvjMR7/g=;
 b=OO5I44dRSr3mBQgYu+tFVLlSR041P53M71Mn58UBT7NiL70DApcUb5Xjsq07ixw4SOURMD9lgQ3BKjdful5oBzrIbr/cvq3esyTREtFzFTKX5U2Gf6vgscr/Cus+QsD3xL0kMIMAUczIac8M4lkyZlQ+As6Lm/KAcQeQP+TDslHp/WUE6wxBgsykmYRZRK6TaZ8xu4BCXodLyp8Vz7OAF+VFcyaR6+KWOhY2cZJ217fIEY33zJIop2mYvQotsWdUDJRELU0yrU5AHLDOmFIUkglnvNkWHbfU5wr3Uzpo+pdbmec9XHqkPrF66wIzHoX5aAlAZwMu4DQzS/FCHMD6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IxZ2jrq2h7gLHkS3n9lgRLesTsvMtv8jHcMvjMR7/g=;
 b=UAf4eWt6R8M6KoHRSfh21gccwuOk6LPPbBzCPxe/oaMRkb40srWjl4ttE4amzOISML4h15Z1IxtnMKvzG7zmpdK7lsh2wvevgMrHl+dhaoEOZczNvyzTPmnj9kLAYrajHVlc+0SHqMmdzMJYLKhUxIKsWYebfqLOc2C35OfTmFhlz3ayiHxnHDRudFczLHlmSL9CiIbpx+/Q36TbnM7MhCj5TsvFEZN/5vjjVMHMd/86+x05qX9PUXHEeCaJVoGDsTlMXNe0nERo7c8xeMrC2YXHLYdNBm6uCtyg4t8f8f2/dCbfRnxBwOH3c9N+exUoGPg3WGP9CN9cBJJfCfrgsw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 07:03:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 07:03:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Thread-Index:  AQHaGCxakejDChMrKU+uwfinjAsKCLCC5iYAgAIQ84CAAQxzAIAAe2+AgAHEuYCAABTjAIAAv6KA
Date: Fri, 24 Nov 2023 07:03:11 +0000
Message-ID: <1a1cbd2c-ef59-4b73-bffc-a375bf81243c@csgroup.eu>
References: <20231116012908.392077-1-peterx@redhat.com>
 <20231116012908.392077-7-peterx@redhat.com> <ZVsYMMJpmFV2T/Zc@infradead.org>
 <ZVzT5_3Zn-Y-6xth@x1n> <ZV21GCbG48nTLDzn@infradead.org>
 <ZV4co7wcI-_wK91F@x1n> <57be0ed0-f1d7-4583-9a5f-3ed7deb0ea97@csgroup.eu>
 <ZV-p7haI5SmIYACs@x1n>
In-Reply-To: <ZV-p7haI5SmIYACs@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3009:EE_
x-ms-office365-filtering-correlation-id: b5b0f971-6b58-4201-ce12-08dbecbb6bfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  trUh7M2oOG9dp1jADlhs4809vSwVTVDifyW5A7vILnyydYpSBUxC4VQbUxV8A6mePt/Ldh27ZtZRQgwlD3ByU1clgiVYySHxrN4HqJOV4Y1pgHjjPVy3vcoQVMMMHT4Ph41CJcZF/3Em186Brc1kJWWfpMOaymz4bTLNscxaE+1eblpPHgpaIJFQLRaaE3ZYF8K5Yckh6TAkT7foGqvZwb27nvSmfCsNtl1JOG47Laj7+Gy7uO6+4/l0h22h3edOoGVU0k8jv408O18Sw3LCDxSHvLamVdHKvxk+EpFJR3vKTWslt5FB8ZviQ5KuGDlSksle02ryta4InuurvX+4+4yKdL02p3xN+EeDPGxgvhLZisxJjEUjxsRj2J7kRDhEz9c7sYElRCO+iShLv1LLRMieti1dicRR5YWFvhpcPuvPaS/KOe3oF550dSC7SRCc1Hj+D4XbYZbksotYSrhWl/K6KgT2CKLdK8wun917/P7owTq81AQyeE/uxEe5S7ETt5J3DrpO0v5JaVo3uBiKr2amJLbG9upfM1Ff6RKpAiv0oM3BcGoPRxuB7WHOuYMfBqz7oin7Fc8I2fvHjIMFTDhYm2QNTukezl6IcxAj81PpxncdM6/RGdegotefN0j3LakQcwxvHcanSCI8fqckYd+wNqwcAtzylAj8iUD9PELeD6taWnliCaxxLMy7JSFj
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(26005)(66946007)(64756008)(316002)(66446008)(66476007)(66556008)(38100700002)(91956017)(7416002)(2906002)(2616005)(6916009)(54906003)(8936002)(4326008)(8676002)(122000001)(76116006)(478600001)(44832011)(6486002)(5660300002)(38070700009)(36756003)(41300700001)(71200400001)(31696002)(6512007)(6506007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Smp0V1l0czdlZGpoZVMySnNvejFrTWNnQVErbExmK3EwTW0rS1plQytNbjlB?=
 =?utf-8?B?aVpSanNyRE5qVnA5a3VOaDNVaXJNdHEvY2FIdURrY0VSR0NFZXlNVHJYdmc1?=
 =?utf-8?B?Vmp3WHR3Yk1IWEp2d2hCMThIVWtkUlRaTUkyUldBcFZudmhCN21XT2x5TFpx?=
 =?utf-8?B?Z2NIOERQQW1YaE91K29DcytWUjZGaldXRC9mWkJ3Z0pnd1BzM0xEa3JxdGFj?=
 =?utf-8?B?a3Z4VHZEVExRSzYzZEF5RDdWVGJ6OWxHOXlrQi9KOWRBVXlxN0plQXl2cXNN?=
 =?utf-8?B?Y2M3TTZjTDUxMUtsZGR1SUFtenJGZnBCSnZxYmxzREdmV0kxbEVFT3VZdHc2?=
 =?utf-8?B?V1Y2NWx6QmhURUg3SXE3RHlpaTJzQXlucG9KNk9YdVh1VVBSRER6Z0YwVW9K?=
 =?utf-8?B?cEREUjArVFlvanIrdkd4ZWh5TUtFRHBxcFVGb3A0bzVBZmxmT2RweWs1YmRp?=
 =?utf-8?B?dldsajN6ZlhRZ29Jc2xFUDRxbXhwZWlMNDArZzUxTlJ4Y3JRTTh1Y2x1bkMv?=
 =?utf-8?B?WUFyZGhaaHJRMWVGNHJnSTNUdSs1bVlQUzRsa002Z09NY2lveE5FaDNreHd4?=
 =?utf-8?B?ZnpzTTVTVkpXbzhVdE5oeU9laG5ZRlR5MlMyMXlDOXNuYWgzaGtES2krWDlB?=
 =?utf-8?B?ZFpGdE9ueWRmWXdnQUExekxDalM3c29hWExNb1VubkpxRisvNzlOQlk5cUND?=
 =?utf-8?B?cUpjbVZraDhHcFZnelVZWEtnaDFSaVptb2k2b0dxWC9lR2NrM0MzNlRJM3Nz?=
 =?utf-8?B?MjVRMXFYVWk1dCtJT3NhVUhlVTlHbWFaazJLSGlMeVRFckR3OUljY0p2b2Ey?=
 =?utf-8?B?U0xWZUkyZlgrRkhiSUFKM1RvdzBrSGEwVEdMZE9jQ3UwaTdsSHB2NXNUQWtj?=
 =?utf-8?B?MW9GQm0ySURsVVMzNkdUdHVuMno1b1hIUG1KRWVzRzBSLzF5U1lLb0IzOXZi?=
 =?utf-8?B?bnBFRmpyNk9LbnBDVmw1eWRuMEZWa2Q4VTNud3IwU0hjR0hON2ZJdzJsUVZs?=
 =?utf-8?B?OWZpcGFhTTJLa1VNdW1FYmdHWE55SGZ3R0crbGVRL2F4QWFncGZNb1VqMUxN?=
 =?utf-8?B?MnBjdHoyTFY5eTlvQm05b2lXMlczL0Y1TVluUDBPQjI2eGF4QVZFVnQzdTFr?=
 =?utf-8?B?dlFjYXp4M0l3RjhrcEl2MDViVlJVbEMxTmk5Vm9zalRFQU9nZ0x6Q1FqeHd2?=
 =?utf-8?B?Mk00U09jWDQ2NDFML1FqajRmanhjZzFqYUQwaUFjQmtGWDZyZFQrRXpZMzBG?=
 =?utf-8?B?OHFlb1l3QnZ6U1NyT21uci9QNVl1U25HS1FiZTk3aWxyd043N0dnR0h3akJo?=
 =?utf-8?B?NGpNWHRwS2tzNWhkWDQvR2FyVk1aZjlZMzBtUXA5eDVFRUYrUDNsS2VLci9W?=
 =?utf-8?B?OFR5TFVudkwxRnlyYTc5MHFXMXZIUWlicm80cHdIWnRJWkFPV2cwVmhsTkh0?=
 =?utf-8?B?clpXUnYwai9ONWdJbUR6NXoyR3VJUzVGdzN4NjU5cFJZbzdJSUpHU3haUEJO?=
 =?utf-8?B?Nnh3RGhDbm9FbjhDbFNaUHlBN2pEVWxiZ2ttN2pJRW9kWUxzRWgyZ2c1R2w4?=
 =?utf-8?B?REpocjBPYndUSXdWSjVwTmxybTBOVTBnRCsyMTBzRmRqbFIrMUg3YllHSEtz?=
 =?utf-8?B?eFBjOFFPK3UyVnVYaHhXQkxBTG5OWEJCL205OXdMMVNUcEdLc1djVVNnQXFw?=
 =?utf-8?B?a3pEaU1EZXVLUnVnbDdvMVdjdzc5aHAwY05LQVZtd3BzOGZvSTVwS25kVHZG?=
 =?utf-8?B?MGwrWEl0b0xUS00zNWU4eWZtaWd1ZzNRZ21LTnBDNTkwaU00ODhSYWJyZnl2?=
 =?utf-8?B?dDBUc21mR1p6S0VJR2hHb0JBM3Joais2SnBhUllmb3g2M3hCU3JPTmRjN0lZ?=
 =?utf-8?B?UDl0anZTZUZBZExudHFCcDdaeVkyL3RDVmdmUkNORHMzTk16SlRZYkVKWjR3?=
 =?utf-8?B?WjRsT3l5dzEyalA0NXBVbGxtWXNpNDRLRTEydGsvenoySUVlcUtDRC9CSGcx?=
 =?utf-8?B?eUE4MklhVmpvVGI5dEpaMFlHNGVqalcwVlhQYmNpWVVvUkI5a203aU5XOTUy?=
 =?utf-8?B?MzBqOVNIbFhUWWJnVWZ1a0hLbEIvMm50NTZkSTJpRVo3QkFXdk5RcUFqdFFY?=
 =?utf-8?Q?rIpFo38t1it93V1Q/zbAdxI6m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C60A1DC16B1BE4AB857898E9556506C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b0f971-6b58-4201-ce12-08dbecbb6bfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 07:03:11.7687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TKlK7ga8E2h54e3o9FB7A+IC0x4dKSHK66njvLOkUKZN4YAHfsZax8scfgQEbG30DT+5mVCu052KeP6uw7n9tS1iJoodCpPsg/xefA/rhMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3009
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzExLzIwMjMgw6AgMjA6MzcsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFRo
dSwgTm92IDIzLCAyMDIzIGF0IDA2OjIyOjMzUE0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4gRm9yIGZhc3QtZ3VwIEkgdGhpbmsgdGhlIGh1Z2VwZCBjb2RlIGlzIGluIHVzZSwg
aG93ZXZlciBmb3Igd2Fsa19wYWdlXyoNCj4+PiBhcGlzIGh1Z2VwZCBjb2RlIHNob3VsZG4ndCBi
ZSByZWFjaGVkIGlpdWMgYXMgd2UgaGF2ZSB0aGUgaHVnZXRsYiBzcGVjaWZpYw0KPj4+IGhhbmRs
aW5nICh3YWxrX2h1Z2V0bGJfcmFuZ2UoKSksIHNvIGFueXRoaW5nIHdpdGhpbiB3YWxrX3BnZF9y
YW5nZSgpIHRvIGhpdA0KPj4+IGEgaHVnZXBkIGNhbiBiZSBkZWFkIGNvZGUgdG8gbWUgKGJ1dCBu
b3RlIHRoYXQgdGhpcyAiZGVhZCBjb2RlIiBpcyBnb29kDQo+Pj4gc3R1ZmYgdG8gbWUsIGlmIG9u
ZSB3b3VsZCBsaWtlIHRvIG1lcmdlIGh1Z2V0bGIgaW5zdGVhZCBpbnRvIGdlbmVyaWMgbW0pLg0K
Pj4NCj4+IE5vdCBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4gV2hhdCBkbyB5b3UgbWVhbiBieSAi
ZGVhZCBjb2RlIiA/DQo+PiBBIGh1Z2VwYWdlIGRpcmVjdG9yeSBjYW4gYmUgcGx1Z2dlZCBhdCBh
bnkgcGFnZSBsZXZlbCwgZnJvbSBQR0QgdG8gUE1ELg0KPj4gU28gdGhlIGZvbGxvd2luZyBiaXQg
aW4gd2Fsa19wZ2RfcmFuZ2UoKSBpcyB2YWxpZCBhbmQgbm90IGRlYWQ6DQo+Pg0KPj4gCQlpZiAo
aXNfaHVnZXBkKF9faHVnZXBkKHBnZF92YWwoKnBnZCkpKSkNCj4+IAkJCWVyciA9IHdhbGtfaHVn
ZXBkX3JhbmdlKChodWdlcGRfdCAqKXBnZCwgYWRkciwgbmV4dCwgd2FsaywgUEdESVJfU0hJRlQp
Ow0KPiANCj4gSU1ITyBpdCBib2lscyBkb3duIHRvIHRoZSBxdWVzdGlvbiBvbiB3aGV0aGVyIGh1
Z2VwZCBpcyBvbmx5IHVzZWQgaW4NCj4gaHVnZXRsYmZzLiAgSSB0aGluayBJIGFscmVhZHkgbWVu
dGlvbmVkIHRoYXQgYWJvdmUsIGJ1dCBJIGNhbiBiZSBtb3JlDQo+IGV4cGxpY2l0OyB3aGF0IEkg
c2VlIGlzIHRoYXQgZnJvbSBoaWdoZXIgc3RhY2sgaW4gX193YWxrX3BhZ2VfcmFuZ2UoKToNCj4g
DQo+IAlpZiAoaXNfdm1faHVnZXRsYl9wYWdlKHZtYSkpIHsNCj4gCQlpZiAob3BzLT5odWdldGxi
X2VudHJ5KQ0KPiAJCQllcnIgPSB3YWxrX2h1Z2V0bGJfcmFuZ2Uoc3RhcnQsIGVuZCwgd2Fsayk7
DQo+IAl9IGVsc2UNCj4gCQllcnIgPSB3YWxrX3BnZF9yYW5nZShzdGFydCwgZW5kLCB3YWxrKTsN
Cj4gDQo+IEl0IG1lYW5zIHRvIG1lIGFzIGxvbmcgYXMgdGhlIHZtYSBpcyBodWdldGxiLCBpdCds
bCBub3QgdHJpZ2dlciBhbnkgY29kZSBpbg0KPiB3YWxrX3BnZF9yYW5nZSgpLCBidXQgb25seSB3
YWxrX2h1Z2V0bGJfcmFuZ2UoKS4gIERvIHlvdSBwZXJoYXBzIG1lYW4NCj4gaHVnZXBkIGlzIHVz
ZWQgb3V0c2lkZSBodWdldGxiZnM/DQoNCkkgYWRkZWQgdGhhdCBjb2RlIHdpdGggY29tbWl0IGUx
N2VhZTJiODM5OSAoIm1tOiBwYWdld2FsazogZml4IHdhbGsgZm9yIA0KaHVnZXBhZ2UgdGFibGVz
IikgYmVjYXVzZSBJIHdhcyBnZXR0aW5nIGNyYXp5IGRpc3BsYXlzIHdoZW4gZHVtcGluZyANCi9z
eXMva2VybmVsL2RlYnVnL3BhZ2V0YWJsZXMNCg0KSHVnZSBwYWdlcyBjYW4gYmUgdXNlZCBmb3Ig
bWFueSB0aGluZy4NCg0KT24gcG93ZXJwYyA4eHgsIHRoZXJlIGFyZSA0IHBvc3NpYmxlIHBhZ2Ug
c2l6ZTogNGssIDE2aywgNTEyayBhbmQgOE0uDQpFYWNoIFBHRCBlbnRyeSBhZGRyZXNzZXMgNE0g
YXJlYXMsIHNvIGh1Z2VwZCBpcyB1c2VkIGZvciBhbnl0aGluZyB1c2luZyANCjhNIHBhZ2VzLiBD
b3VsZCBoYXZlIHVzZWQgcmVndWxhciBwYWdlIHRhYmxlcyBpbnN0ZWFkLCBidXQgaXQgaXMgbm90
IA0Kd29ydGggYWxsb2NhdGluZyBhIDRrIHRhYmxlIHdoZW4gdGhlIEhXIHdpbGwgb25seSByZWFk
IGZpcnN0IGVudHJ5Lg0KDQpBdCB0aGUgdGltZSBiZWluZywgbGluZWFyIG1lbW9yeSBtYXBwaW5n
IGlzIHBlcmZvcm1lZCB3aXRoIDhNIHBhZ2VzLCBzbyANCnB0ZHVtcF93YWxrX3BnZCgpIHdpbGwg
d2FsayBpbnRvIGh1Z2UgcGFnZSBkaXJlY3Rvcmllcy4NCg0KQWxzbywgaHVnZSBwYWdlcyBjYW4g
YmUgdXNlZCBpbiB2bWFsbG9jKCkgYW5kIGluIHZtYXAoKS4gQXQgdGhlIHRpbWUgDQpiZWluZyB3
ZSBzdXBwb3J0IDUxMmsgcGFnZXMgdGhlcmUgb24gdGhlIDh4eC4gOE0gcGFnZXMgd2lsbCBiZSBz
dXBwb3J0ZWQgDQpvbmNlIHZtYWxsb2MoKSBhbmQgdm1hcCgpIHN1cHBvcnQgaHVnZXBkLCBhcyBl
eHBsYWluZWQgaW4gY29tbWl0IA0KYTZhOGY3YzRhYTdlICgicG93ZXJwYy84eHg6IGFkZCBzdXBw
b3J0IGZvciBodWdlIHBhZ2VzIG9uIFZNQVAgYW5kIFZNQUxMT0MiKQ0KDQpTbyB5ZXMgYXMgYSBj
b25jbHVzaW9uIGh1Z2VwZCBpcyB1c2VkIG91dHNpZGUgaHVnZXRsYmZzLCBob3BlIGl0IA0KY2xh
cmlmaWVzIHRoaW5ncy4NCg0KQ2hyaXN0b3BoZQ0K
