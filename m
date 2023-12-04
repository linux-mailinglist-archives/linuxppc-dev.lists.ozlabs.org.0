Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94B803179
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 12:26:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cwEKphQv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkLw60MzVz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:26:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cwEKphQv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::610; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkLvB4zFDz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:25:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cbdn/LAKGdRVdAZmuxpU5RyorLCpChQLLhJs9GgiNcSzs0U3XqlpzdxxbWektLLIyXkXaj/GushhLGt3kRmdI40cXmFb11ZX/F8yNTFUF2AdSm8r2PGCxY75sclMFvL0bA8o9qEJcLROrbEqKa0AHdHKLipXGqjpeARFb8vYxBsVj9QXcq3BfuuDNyglpYf5fMOcD4fxhsVV92KxKlzz2836n8Md4xDazRnedrB5Et0zfxnzjTpN9vCVIyW9E22q3DWQ2F36TWMxLSrWNaelZAUvQGcj0hyAnRerlKlCim24G7wHAyC/d6lf00G/83oAqiQP4DJsEpWn0Mcfl7fWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gh1ubTC1kQUZOHwhlRn7ovLb3O9Z29zQ1kgjU4fzEQ=;
 b=ad5caE6DMvuLeUVcZWokNSJ6G0gDFu128S4SdBR0QRk8fPHjDFGh25NiysfSziEzSqzOaOwimph3NKYmxUuRWbP+T1nuyG6bTjzehdxvLimKVWeBwcCcbs0B/GSBrBBjovEREwdfWbgXAWJw4Uj3UvgG7elmdrIOcRLwZSO3dSnCP6EW463j+cX62xrcRfmwpmC2EUHVS5ZrJJv8Czqq/Ksi1Sf92Q0uv6MxLR407Fnv2ffWfnFDYCOkmEeQZBWHlzwotq3f+z14YyY8gbJ1GImBR7siBfLe5Ar88koSHhH5T+xcpn801H1b5kQkByG0SAPS9LXupujHSF8/IZ8hcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gh1ubTC1kQUZOHwhlRn7ovLb3O9Z29zQ1kgjU4fzEQ=;
 b=cwEKphQvwQDNDyOkReI5aXOMMJZ0wOC3Oqa+EoyDONAvH3axp1XktL9932GAeuOjo4aKTg310D1n8f60yOawzdcpGfw3yrre1qex/gEBVS36WChLlyI01VyYgC/M1jfRUTjuBxN2mcJenyyQoS5PbKmrGAU7L1WRXOvmL315tatB4n88nTWR/WidiP+I6BZ6BhPRARIPhL/n+xg3DQdvJbOp7CITmeQ3KybtMpSAbtCtAzyRc5/IBviu1SjumP2toiFoK1ANf+Q5fG68zTMjXMnyx3jZlaIoX0Uuh5+kbwFJahooA1LRqRQjLP5t75FJ3Wsj12px2+FeXukIYhtt1g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3298.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.23; Mon, 4 Dec
 2023 11:25:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 11:25:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Thread-Index:  AQHaGCxakejDChMrKU+uwfinjAsKCLCC5iYAgAIQ84CAAQxzAIACFO2AgAAaXYCAAB5+gIAACegAgADfT4CAAHXcgIAJyEQAgAQxj4CAAWqrAIAAA94A
Date: Mon, 4 Dec 2023 11:25:16 +0000
Message-ID: <97c21205-f3e6-4634-82e6-c7bbd81d1835@csgroup.eu>
References: <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n> <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n> <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n> <ZWj_EgljG3NwS5r1@x1n>
 <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
 <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
In-Reply-To: <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3298:EE_
x-ms-office365-filtering-correlation-id: c55db98d-1336-4dd1-fed6-08dbf4bbb0e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +b0jUgRNKwMHaILFb1iduky9TBLznz47gYSrOFeaNpIn/TgvLZBPaaCY6pXmsge5uT6KnzD9a65kK2iL00GOcHxJctmg0sYEzXli0kbGtRmBxUt5doYZxLw3rak1ipv+p9z0zK/6NfANQMPYG/RypqAYi8XorJvrfl41NqBs2jymJdPRmhZ/ZpNkyGkcbRCUwNVgjZHiTZbaO9QzqDjhc1aTMyydYoLTSyE7Ry40DeooK+b+UShCwSMWVTkVhGsydjlQdUMiWSyirFVK3Ul0A4ef4NcpAIaDm2/NsfObW4SwHSZo/0qIU8DVmC8kppf1xKgiRT+tZUyHwWDp3y8yRAVhPg9zMEfJip2Ajno5e7ZQH9qL8LIDig2Rk50zn1a1L8qIJQyXrnNkuMZJzuxQP8pOkl0XariE2wZ1o7dzaNAzFP9VOigr/Y/1irJhxSt3R4PRnS8sAJyU9PxbZMhrEIvslCJx5liX1TBu5ExS7/VuUjo0EtZBSXWUKA1hZfJjkcxUqXkTFq+HM0WVaEIxPws4XRWZ1m4hCW/kF30ctWZgwgOlXoxTPv4HjK1NUGQqBcr9oPhfGSqI8GAausjwWpUkVAAYv5NOISa1EFLBhYuhV41+leYuUw+nTODeetGvP139jSePkXSpPnSYdikXTxJjdM5IyvPwV+bZCsaAHbyHt8GlCA12/BNrU2hH+hyV
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(39850400004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(31696002)(5660300002)(44832011)(7416002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(6512007)(6506007)(53546011)(66574015)(83380400001)(6486002)(478600001)(26005)(71200400001)(38100700002)(31686004)(122000001)(110136005)(316002)(91956017)(54906003)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ejc2b3kyakZmM0c0U0tnRzg2UWZLTjM3TjhaaWJnMHhFRFp2dUtoWnJsQVF3?=
 =?utf-8?B?NXVxd05vajFBWVBWcXpjKzVIdzFHQjFaKzFEYmpUZThQcVA1dCt0UlEwZ25U?=
 =?utf-8?B?ODlrSE5EaHNtM2FsdlNXaWEwQTVLRTJ6OGErQjFRMVp5NzBvdmJvS084azJJ?=
 =?utf-8?B?bHJub1hmVWc4TkhVQ3A4YVNSSXRENDBPdzFBcWVMRmdYSWYzZ0NsSWNwYVEy?=
 =?utf-8?B?ZXc5VkprejJoYWhDL2lrcWE1VkV3K2tVU2hZbzBHenFXb1d6b3JxOEkydlhZ?=
 =?utf-8?B?WE9GNzM0SVpGbG5pMjFKMUI4bEEwTUxaQUFZZE13cnZITms3b3VueTU4VDJP?=
 =?utf-8?B?Q2x1VzdtZWlDNXJoZytPMGhFd2pCb29XSStMZ3I2bGprem1ITmppSExMb0Vi?=
 =?utf-8?B?NGJmc0ZCMjNkaXlGVHNFR21BanhRQUcwMDBNWS8ycUpHU0J5Yy8xSlB2ZDQ3?=
 =?utf-8?B?Rm5pK0pzbFduTzNkVkVDdThwaUpRTnRabXdMTFlsTlJXSnRvSFpkK3czdHU0?=
 =?utf-8?B?eFRIUWJaT1dveGtCUVo2QTBZcU50R2ZIMENTd3BEbWdZaHdrZUxqU0ZYM203?=
 =?utf-8?B?TnhuZnZwMjdSOEwvL2pkM2RUNDJNRXk0SmJoR215c0hwUDJGMFZLUWZFczhS?=
 =?utf-8?B?dzVvN2E2aEZua0RBT1crRHhZYnZtQmpnbTRFTWZiYXFzTnhySHVQajV1em5E?=
 =?utf-8?B?QVU1akdEU1VKdjBpSHFiZk1XZk9lOEt5Y21uUSs0RGFrUGE4UExYb3duNXBN?=
 =?utf-8?B?UERSM0xoeFEzaFVvN2w2aysrZ2MzS24wMFVhWUNBblcrZ2FYVHovMXFOQ2Nh?=
 =?utf-8?B?Ujd4dS9ncjFvdis1Q2cvellpSlBzRS84R1MydGdwdzRFZ283c0tzdDNMSjla?=
 =?utf-8?B?QUNQTlF3NzlBYTgwcFJMRW0vbUtqeWl0ZjA5dmE3d1NjaEJCa0RMbVVOY0c2?=
 =?utf-8?B?SUVUamZIV29IWnZ6U3pjeTQ0S1RJcmI0MjZoQmozKzg4QXBnL2lYTWRmVWp2?=
 =?utf-8?B?dVVZME90YnRoWmRuaHBBSEY0UlNNQU5KWVFaa2pyUUQwODd3OElBMkZGU2Rj?=
 =?utf-8?B?c3ZaRFRaV2ptZ2VXaFpqV2NyeXhPVmhKUS9YWGNqOTZXVG82SWxjTnRzTnJt?=
 =?utf-8?B?THMvaVFFbFRVR2VqTVhTRFVFdFhEeklYVkE1Q1BIUVpKN0FVL1VIbVp3Q0pP?=
 =?utf-8?B?d3Q5aXYyZVA1ZzZmYmtRVTVrV3QydExBdjFLanE2WXJKcGpFS0d0Kzg5WHVi?=
 =?utf-8?B?c2dIem8veTk1ZklvRnY4cWZSZmNWSnlWZk9nV1hId0pVZW4rUHdROURRVTFq?=
 =?utf-8?B?K0NWdnNWa3NlY2FSbVArUGtweTdYU0grNDI0WGRVRkNmMXpUeUFidjlXaXJ4?=
 =?utf-8?B?d1AyOUlLTGN5ZmNvOGpBcmtFRFROU2VTdlRyY0F6b3RyZWdOa2dJbDdoQWJF?=
 =?utf-8?B?MkFrZ2pYYkFwZm5yb3lobmFhYmh2cndDdG9IcEdneGswRlI2cVBBdkJNNFRW?=
 =?utf-8?B?R05Ed0JmazBxQW81clRqaFFhSUs0VzE1eGttWEQ0SGZ5NFc4RFU4V2RFcUN4?=
 =?utf-8?B?U005Z05iZGo5T1lKVDhSczhBZWxKZlZEV09UT2RVK3ZHTmo3NGIreWVxNmtw?=
 =?utf-8?B?L0pwcVlHcTY3RGlUV3BqUTBxd0VsRWw0U0JUOFJTZ0ZlU25QcVFMaG5WWFp4?=
 =?utf-8?B?WlQ2T3cvMXE3cGdueWlIK1g4VVJ2QlBlSGhNSkdsTnRTbGZzTGt3NHBnSzJZ?=
 =?utf-8?B?WE9tNVFiRVpVeEJ2Z1E5VnlWODRseWVrK3ZWc29WdG5KTUhESXBqMk10NXgw?=
 =?utf-8?B?dFRmcGhBN3BmT01qQW54TDlRWnl6TytlMldpaGFCeWVFNG1zaERyY1hETExG?=
 =?utf-8?B?RkVkYlU2YkpjL1BMUUhkYm5rVW5NczJNNlRKMmkvNytLb0dvbW5xOGNjSk1G?=
 =?utf-8?B?T2dVUkJ6bWNsZ2Qra1BScU15TnpoYmEvNjJBenZaVDJEWjVIcGtoaUw5TlNu?=
 =?utf-8?B?cVhkZDFBYXhhblNYUzAwUGhodm1lWTJ0ejdxNVlZSHQ0Vi82ekRZVUdIbTB6?=
 =?utf-8?B?ekxiWmZvd0lWWW9SMTJUVEF0TzBQeXUxTWFyN1JpZFBoN29FanB3Qmt1Tndt?=
 =?utf-8?Q?/T6H8/Hyq0b2UgqFySzXNxcb2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59C220F1B3AADF4AB80CE87554E6D85C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c55db98d-1336-4dd1-fed6-08dbf4bbb0e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 11:25:16.6896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3nLdSzOW0Z5kv4Pkvjm7qMjhncmp58c8dveYUJJEDeglsD7H/RntAh14l7ukxIMwj3YfRTPmVMqjnh+RVo8QaZd8dM5MKpR3ZPHWHE0+8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3298
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, James Houghton <jthoughton@google.com>, Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Vlastimil Babka <vbabka@suse.cz>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTI6MTEsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBP
biAwMy8xMi8yMDIzIDEzOjMzLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBM
ZSAzMC8xMS8yMDIzIMOgIDIyOjMwLCBQZXRlciBYdSBhIMOpY3JpdMKgOg0KPj4+IE9uIEZyaSwg
Tm92IDI0LCAyMDIzIGF0IDExOjA3OjUxQU0gLTA1MDAsIFBldGVyIFh1IHdyb3RlOg0KPj4+PiBP
biBGcmksIE5vdiAyNCwgMjAyMyBhdCAwOTowNjowMUFNICswMDAwLCBSeWFuIFJvYmVydHMgd3Jv
dGU6DQo+Pj4+PiBJIGRvbid0IGhhdmUgYW55IG1pY3JvLWJlbmNobWFya3MgZm9yIEdVUCB0aG91
Z2gsIGlmIHRoYXQncyB5b3VyIHF1ZXN0aW9uLiBJcw0KPj4+Pj4gdGhlcmUgYW4gZWFzeS10by11
c2UgdGVzdCBJIGNhbiBydW4gdG8gZ2V0IHNvbWUgbnVtYmVycz8gSSdkIGJlIGhhcHB5IHRvIHRy
eSBpdCBvdXQuDQo+Pj4+DQo+Pj4+IFRoYW5rcyBSeWFuLiAgVGhlbiBub3RoaW5nIGlzIG5lZWRl
ZCB0byBiZSB0ZXN0ZWQgaWYgZ3VwIGlzIG5vdCB5ZXQgdG91Y2hlZA0KPj4+PiBmcm9tIHlvdXIg
c2lkZSwgYWZhaWN0LiAgSSdsbCBzZWUgd2hldGhlciBJIGNhbiBwcm92aWRlIHNvbWUgcm91Z2gg
bnVtYmVycw0KPj4+PiBpbnN0ZWFkIGluIHRoZSBuZXh0IHBvc3QgKEknbGwgcHJvYmFibHkgb25s
eSBiZSBhYmxlIHRvIHRlc3QgaXQgaW4gYSBWTSwNCj4+Pj4gdGhvdWdoLCBidXQgaG9wZWZ1bGx5
IHRoYXQgc2hvdWxkIHN0aWxsIHJlZmxlY3QgbW9zdGx5IHRoZSB0cnV0aCkuDQo+Pj4NCj4+PiBB
biB1cGRhdGU6IEkgZmluaXNoZWQgYSByb3VuZCBvZiA2NEsgY29udF9wdGUgdGVzdCwgaW4gdGhl
IHNsb3cgZ3VwIG1pY3JvDQo+Pj4gYmVuY2htYXJrIEkgc2VlIH4xNSUgcGVyZiBkZWdyYWRlIHdp
dGggdGhpcyBwYXRjaHNldCBhcHBsaWVkIG9uIGEgVk0gb24gdG9wDQo+Pj4gb2YgQXBwbGUgTTEu
DQo+Pj4NCj4+PiBGcmFua2x5IHRoYXQncyBldmVuIGxlc3MgdGhhbiBJIGV4cGVjdGVkLCBjb25z
aWRlcmluZyBub3Qgb25seSBob3cgc2xvdyBndXANCj4+PiBUSFAgdXNlZCB0byBiZSwgYnV0IGFs
c28gb24gdGhlIGZhY3QgdGhhdCB0aGF0J3MgYSB0aWdodCBsb29wIG92ZXIgc2xvdw0KPj4+IGd1
cCwgd2hpY2ggaW4gbm9ybWFsIGNhc2VzIHNob3VsZG4ndCBoYXBwZW46ICJwcmVzZW50IiBwdGVz
IG5vcm1hbGx5IGdvZXMNCj4+PiB0byBmYXN0LWd1cCwgd2hpbGUgIXByZXNlbnQgZ29lcyBpbnRv
IGEgZmF1bHQgZm9sbG93aW5nIGl0LiAgSSBhc3N1bWUNCj4+PiB0aGF0J3Mgd2h5IG5vYm9keSBj
YXJlZCBzbG93IGd1cCBmb3IgVEhQIGJlZm9yZS4gIEkgdGhpbmsgYWRkaW5nIGNvbnRfcHRlDQo+
Pj4gc3VwcG9ydCBzaG91bGRuJ3QgYmUgdmVyeSBoYXJkLCBidXQgdGhhdCB3aWxsIGluY2x1ZGUg
bWFraW5nIGNvbnRfcHRlIGlkZWENCj4+PiBnbG9iYWwganVzdCBmb3IgYXJtNjQgYW5kIHJpc2N2
IFN2bmFwb3QuDQo+Pg0KPj4gSXMgdGhlcmUgYW55IGRvY3VtZW50YXRpb24gb24gd2hhdCBjb250
X3B0ZSBpcyA/IEkgaGF2ZSBhbHdheXMgd29uZGVyZWQNCj4+IGlmIGl0IGNvdWxkIGFsc28gZml0
IHBvd2VycGMgOHh4IG5lZWQgPw0KPiANCj4gcHRlX2NvbnQoKSAoYW5kIHB0ZV9ta2NvbnQoKSBh
bmQgcHRlX21rbm9uY29udCgpKSB0ZXN0IGFuZCBtYW5pcHVsdGUgdGhlDQo+ICJjb250aWd1b3Vz
IGJpdCIgaW4gdGhlIGFybTY0IFBURSBlbnRyaWVzLiBUaG9zZSBoZWxwZXJzIGFyZSBhcm02NC1z
cGVjaWZpYw0KPiAoQUZBSUspLiBUaGUgY29udGlndW91cyBiaXQgaXMgYSBoaW50IHRvIHRoZSBI
VyB0byB0ZWxsIGl0IHRoYXQgYSBibG9jayBvZiBQVEVzDQo+IGFyZSBtYXBwaW5nIGEgcGh5c2lj
YWxseSBjb250aWd1b3VzIGFuZCBuYXR1cmFsbHkgYWxpZ25lZCBwaWVjZSBvZiBtZW1vcnkuIFRo
ZQ0KPiBIVyBjYW4gdXNlIHRoaXMgdG8gY29hbGVzY2UgZW50cmllcyBpbiB0aGUgVExCLiBXaGVu
IHVzaW5nIDRLIGJhc2UgcGFnZXMsIHRoZQ0KPiBjb250cHRlIHNpemUgaXMgNjRLICgxNiBQVEVz
KS4gRm9yIDE2SyBiYXNlIHBhZ2VzLCBpdHMgMk0gKDEyOCBQVEVzKSBhbmQgZm9yIDY0Sw0KPiBi
YXNlIHBhZ2VzLCBpdHMgMk0gKDMyIFBURXMpLg0KPiANCj4+DQo+PiBPbiBwb3dlcnBjLCBmb3Ig
MTZrIHBhZ2VzLCB3ZSBoYXZlIHRvIGRlZmluZSA0IGNvbnNlY3V0aXZlIFBURXMuIEFsbCA0DQo+
PiBQVEUgYXJlIGZsYWdnZWQgd2l0aCB0aGUgU1BTIGJpdCB0ZWxsaW5nIGl0J3MgYSAxNmsgcGFn
ZXMsIGJ1dCBmb3IgVExCDQo+PiBtaXNzZXMgdGhlIEhXIG5lZWRzIG9uZSBlbnRyaWUgZm9yIGVh
Y2ggNGsgZnJhZ21lbnQuDQo+IA0KPiAgRnJvbSB0aGF0IGRlc2NyaXB0aW9uLCBpdCBzb3VuZHMg
bGlrZSB0aGUgU1BTIGJpdCBtaWdodCBiZSBzaW1pbGFyIHRvIGFybTY0DQo+IGNvbnRpZ3VvdXMg
Yml0PyBBbHRob3VnaCBzb3VuZHMgbGlrZSB5b3UgYXJlIGN1cnJlbnRseSB1c2luZyBpdCBpbiBh
IHNsaWdodGx5DQo+IGRpZmZlcmVudCB3YXkgLSB0ZWxsaW5nIGtlcm5lbCB0aGF0IHRoZSBiYXNl
IHBhZ2UgaXMgMTZLIGJ1dCBtYXBwaW5nIGVhY2ggMTZLDQo+IHBhZ2Ugd2l0aCA0eCA0SyBlbnRy
aWVzIChwbHVzIHRoZSBTUFMgYml0IHNldCk/DQoNClllcyBpdCdzIGJvdGguDQoNCldoZW4gdGhl
IGJhc2UgcGFnZSBpcyAxNmssIHRoZXJlIGFyZSA0eCA0ayBlbnRyaWVzICh3aXRoIFNQUyBiaXQg
c2V0KSBpbiANCnRoZSBwYWdlIHRhYmxlLCBhbmQgcHRlX3QgaXMgYSB0YWJsZSBvZiA0ICd1bnNp
Z25lZCBsb25nJw0KDQpXaGVuIHRoZSBiYXNlIHBhZ2UgaXMgNGssIHRoZXJlIGlzIGEgMTZrIGh1
Z2VwYWdlIHNpemUsIHdoaWNoIGlzIHRoZSANCnNhbWUgNHggNGsgZW50cmllcyB3aXRoIFNQUyBi
aXQgc2V0Lg0KDQpTbyBpdCBsb29rcyBzaW1pbGFyIHRvIHRoZSBjb250aWd1b3VzIGJpdC4NCg0K
DQpBbmQgYnkgZXh0ZW5zaW9uLCB0aGUgc2FtZSBwcmluY2lwbGUgaXMgdXNlZCBmb3IgNTEyayBo
dWdlcGFnZXMsIHRoZSBiaXQgDQpfUEFHRV9IVUdFIGlzIGNvcGllZCBieSB0aGUgVExCIG1pc3Mg
aGFuZGxlciBpbnRvIHRoZSBsb3dlciBiaXQgb2YgUFMsIA0KUFMgYmVpbmcgYXMgZm9sbG93czoN
Ci0gMDAgU21hbGwgKDQgS2J5dGUgb3IgMTYgS2J5dGUpDQotIDAxIDUxMiBLYnl0ZQ0KLSAxMCBS
ZXNlcnZlZA0KLSAxMSA4IE1ieXRlDQoNClNvIGFzIFBNRCBzaXplIGlzIDRNLCA1MTJrIHBhZ2Vz
IGFyZSAxMjggaWRlbnRpY2FsIGNvbnNlY3V0aXZlIGVudHJpZXMgDQppbiB0aGUgcGFnZSB0YWJs
ZS4NCg0KSSB3aGljaCBJIGNvdWxkIGhhdmUgVEhQIHdpdGggMTZrIG9yIDUxMmsgcGFnZXMuDQoN
CkNocmlzdG9waGUNCg==
