Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF967645B95
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 14:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRzNd6CFwz3c71
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 00:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zuBsWumQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::611; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zuBsWumQ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRzMd4Sq0z30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 00:55:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6P/RsWYQZ7LzoNoHPW3aum3+16KTG0JqcfEhDWZT2rvbVzhSzIAzDXAA5/B5A4dcATF5qT9H2SUnpI5pXKzmcTt/+8jE7hPnt5wYkLblffbG6Nd8UE9CykwRBW7/64K6TdWnyRB0Sr1wZq5abhQQOkbz8fo9As2p4pxTWXK1JbNv/sSzd6/p+n1Z9T5Hj25mzB174Va0u4dF89ULz4PetF8Ymdl7orw71MooA4Y8cW3OFQh5dY6OzT3f7NR+ZN7CV4O8I/GTvSKmRFFsyfWKEcYUg7zxsxnJf+/x2AQaD2tLkLT40bElQaz+9vahXuowHGuQWYy/Hm1Rpg2T6nj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGfWQgZg/aiXDwWfCo4noLTd7DuIPVo5Qtq1za2QtGo=;
 b=mwfNf/lKlHVMFY+1zEIhkaX7M1HEoqTEycu/eh5eB4adY+ml37pnrWNP+/MubN/vAkhCXQenYnhsJoeJ25BMTelcUIpdbPd/2A/GN6QPK+hXyj9pLd/999rIC2b1AJ8p5lI+uQlk7L2Nk4bZHSb4ioCL5gvUJdcn4JiSRFHVuQXszZ3U8/jZrSd0qfNVja4Zvu6eDMyDvzoukxIytSeOA7Z5oUDbYX1NPUu1krHO31yj+atcgEwx/zU0lOC4M4ZSN1VYvXfd67kRj0uJ2sQs9XX/PbdHzTcHtx9QhwYf0jCMEpu8NxZ3DZLQrZ2Ylk89GIt6dHpxEEm7oWJdk+FV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGfWQgZg/aiXDwWfCo4noLTd7DuIPVo5Qtq1za2QtGo=;
 b=zuBsWumQHUlAdf1W0TUYdyROsq0beEuDVUwxf1A4A310ov3VEDAKG+bGlf7qKp8X9KxkWCSRuozIW6+mGo9yTAYBmspCY+ZkBzPeVLiwnZOZ/Lie+je8Jy4qgRmJAefAEw2Dn+et5wxkq/Wu4sM2pFEfJ4jkepCt8PpiQPMbL2ey7DSvQx25VQMrvqF/lwEEVP2/CPAcOpLoINpw9zxr1pki/aecwW0KGmUlGBbgZS9SilSAtXgjO/Um282D+gp+oWlFMHcAm9I6IwGODJaC71CJf3RyUpB/juDye2yZF9ACSxq+fCZG79sLPsu72d30MF6S2ei2JwJMRDYqZaP9Ug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2270.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 13:55:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 13:55:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH mm-unstable RFC 17/26] powerpc/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
Thread-Topic: [PATCH mm-unstable RFC 17/26] powerpc/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on 32bit book3s
Thread-Index: AQHZCYIF0H2yDCvsF0KHplaR79S6jK5idCUA
Date: Wed, 7 Dec 2022 13:55:36 +0000
Message-ID: <8be167b6-3836-25c3-9f69-b8b3916ee5b4@csgroup.eu>
References: <20221206144730.163732-1-david@redhat.com>
 <20221206144730.163732-18-david@redhat.com>
In-Reply-To: <20221206144730.163732-18-david@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2270:EE_
x-ms-office365-filtering-correlation-id: acdfa050-6e6b-465d-d372-08dad85ab766
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z7ibob5Kz0yv1OHR3Y0dzSs0kWUGf7SD3up71bkdvYsaJsgP6PaW2JAWyyEZDuSk0v11cNLKtA3zTFOB+/lEy1InJ+01bEo0Sywpk2mGFMAGhQFyWEizBs2wnplTSEVerZMoh2XjHNHOwzGA3eBvRnmH1qyMflelSwlvOgxeMkliyek2vgFfCmLVfHM69nVnGPzfvzGXejzEXGEPgDvkucUYZ1it7dW4VEfHlqE78ERsjEakW63WAjf8Cdo+NQkLybBb5hQua1u8wPvvUjj4gBDtgt4LImALAz+eUQS+oDPucHo+I2dXAm9W29JeVZYaJLrPHYPD3V1XBagVC3vbSJXSQ1IPSzGWLG+1DAwkO9dOHD1fw9ZPPFlzxgCeE/C6qMVDISmBzPDgthSZZilpaMg3zT5petQJ7hIm95UAIakjpOleRprW01seXTNZa4IGt0chU2vDFXsfuqZvhHKpq+z63v4M0XKtyK6WlHqQV2tFOERcUMdKVInb1iLpN7upEy/6g5cbyqk09zTN86jenAT/rF+XNixqv2e6Ju5JZ6TyU9sP/pARSkmmKd2HJ4zGQZeWcNF0YQsiaiiz8hGd/iBOgFAy6QkfcyqcyoffXy9MImf8UntUmL3mYDTvkKIE3BHtSVZsNhuDo/SboilIijQiDE5tH7quLUwi5sJNs3OEIwBCSMFh6G50+E8wa8yoWkCZmyp76RaDYkfIWNcK6vLiSRfROSK0G/edC1ANOUYQn20C6EjDElR2y//fpr5YVCcP1Mllc7OpTfPyefDm5LijYt4t/+4AsihOOKy399A=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(66946007)(76116006)(66476007)(66446008)(66556008)(91956017)(8676002)(64756008)(7406005)(5660300002)(7416002)(4326008)(2906002)(31686004)(44832011)(8936002)(316002)(41300700001)(71200400001)(122000001)(110136005)(54906003)(6512007)(6486002)(478600001)(36756003)(26005)(6506007)(2616005)(186003)(83380400001)(38070700005)(38100700002)(86362001)(66574015)(31696002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHVhbmpXcTdtODQ5Z0EwaWFzb3NrMHkzZDcwSUowUXlNVi9IL2JkanJ1RlY1?=
 =?utf-8?B?Q1p2QS9DdVJmWkw3UTF1YXFEeS9WN1NLYTV3VWZMcDBYRFpoYjdid2U2RG9B?=
 =?utf-8?B?OEs1RnlFNHQzQ2NlZ291T1JzS3hBa0JTR0c1OExTeHpRS2ZOMFdxTzdjUkVl?=
 =?utf-8?B?UHRSYlRobzhtMHBHeEV1b1d6K0R3eWpNYjUxc3loSDZLS0lGYXYraXBjcG5v?=
 =?utf-8?B?Rkp5N01xL0U4SGdaVEFqSHJwc0JYWXZIbTNXUExXZDA1dTcrRS9FL0U0SGV0?=
 =?utf-8?B?RWplZG8zd0YxeENNeXVUR3lyV1FUR0pxM2QrR1BnQ2FCSThxY1c0U1l5SjZR?=
 =?utf-8?B?MFpTaW5kMzZlU1lERmxaSmhieUthSkxYaGowa3I0aXpXVURrQkRVRk03eEt6?=
 =?utf-8?B?am5nUzBZdU9oNkxYWUlTUDNHWkZHUFo2TWdiRXlScFhRb0x2Q3Rzc20rMVo0?=
 =?utf-8?B?bEdTeUdTUkx0OVFCVkRlZ3h1MTJQb2trZDEzWFZIQ1hDYnd3NXJtWUFIVmdn?=
 =?utf-8?B?b3lyQWtZVm01djk5cWhQZjhRMEE5dXMxNFlPU0J5eUVveXJ0cklCcnplck9p?=
 =?utf-8?B?OFpjY3dBVEh0T2JDbzBJakxReExWcCtCSGNJUUFJNWM2QUlDT2VhK0xLMzRJ?=
 =?utf-8?B?ZkZDaCsxWDhjLzgydXBaWVhHbUFlcFV6OXV6TEVreVMyWUFjcFRiQmJaZ3pV?=
 =?utf-8?B?MVZZYkRRcXArdGhiRUN4aWNPUjJ5cm40V3h0NDU0RUtSd0UvcXVTRWFNUmo1?=
 =?utf-8?B?UnY5cWlkaFRjMXBDVzQvL1RpajRpRGFrRGpRWnV0b2VwL04zdHFhU3IvakZ1?=
 =?utf-8?B?ZkVVbGlWbmwycVQxUVIrcG96amhEdnYyR2lCWEpPRmQ5MVpaY0ExMGZnaDhV?=
 =?utf-8?B?dk5kOUF1WEF5OStkRlRUY1kzZzNQL0NKOCtIZkdmWDdOc3ZFMmxlR0tUT3Rt?=
 =?utf-8?B?RFgzclQ1eDF2b1hreWltU040M0ZLNWdiRTZHakdFSVdkT2pGRUdMNzhYcHNX?=
 =?utf-8?B?NG5QZ1RIbGJUQjNldEllaE54UmZHdmk3MGx5U21FRW13c3hBN3dUVXRiWWxj?=
 =?utf-8?B?dmdLOW5SR1dSZzVjMThqNng3NGdhSU9ucUJ1ZGl5bGJ4U296RlJEN0RQeWJv?=
 =?utf-8?B?RmJZOFZzNFN2NFpmTGpGODZYRW1DRUlNWVVra0tWU01FSVJDTzRiQWk0NEFh?=
 =?utf-8?B?Ni9mSTh5U2lJZ0xyZmdYMjJqTDhjdDQ2cCtSbFJJVnE4bytQL2VZcnZxZjE2?=
 =?utf-8?B?SjVhdWxVakY5eUthRlhNK0UrblcyN1NpN2VEOElMVkV6SUZMSE40V1IvRFZl?=
 =?utf-8?B?YTNzKzlka3dmaHRueWFHN0RQUDVESm0wcWRxN01EcTRNaDBobDJoMUJVQ2xE?=
 =?utf-8?B?b0pDWk16UktDQWY2eVRnZS83MDcvWFdWczZqRUhDWTR2MTJPdXpwZU5wN0tR?=
 =?utf-8?B?ZEh0VnI4ZURFN0lDa2Y2UUFtTTljZFkvQTJmd1lXcFFYL29idGRSYWJUdVVp?=
 =?utf-8?B?djNCVHpjUHZ2K1N6Q0g5VUJSTmpxYU5EWkgvWU9tZTdYdnBXdXkzc2Q2WUc5?=
 =?utf-8?B?T0JiK1NQK2hxNVZXV2Jhek01c1U0enVtM1FWQkZXWmVkaEQvQTNDMXRDR041?=
 =?utf-8?B?aEovTHhtd2xKOXE5a2tqdVA2ZFE4dHl6WG5HeVBEWG1KS0JhNDYxWlNEc3RD?=
 =?utf-8?B?Y2ZGbHY3Q3FFczhvOE9yNVhKSFBLOUhmd0RQbEVpVUkrb3hNVmVQUkhDVWFu?=
 =?utf-8?B?V2tzM2NaYVZsdzU5Z2VvSFgxSjJORWNtTmxJTVZZb3VCUXJYWjZPekEzZ3JU?=
 =?utf-8?B?eU9xa0dIRElRdndNeldFVzBaZDI2TlNpandiYXVRNGZBSTlqS3lyOVBpZTFk?=
 =?utf-8?B?KytlTU5YZVVZak9KZ0FOSkFZZFJ5VUp1Q0dBUnk4NUNyVWtmY3BuQVl6d0Qx?=
 =?utf-8?B?YmdJeVQ4a3lVUGVrUFJkSDJONHlwOHlNanlubzNHNzNwZHVtd3BxY0JkUFd1?=
 =?utf-8?B?VHFDQUkxa0h0eEhHR2tVWUEyNGRzckVRVUVnaXFEa0xuNzIzZENZUjU3WEVB?=
 =?utf-8?B?R1o0cTBsOE9xTDlTN2pXZnpDajVFOHZzWXBUNGt1QXBNcVBIY3NrNGRCRzNu?=
 =?utf-8?B?OGwvdlF3eFhpT1FoZWMrNDNHZkJBQmpISXdCYnlaN283UDhPMnVpNUh6VVY1?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5067142341036D448D9876A6032824E7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: acdfa050-6e6b-465d-d372-08dad85ab766
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2022 13:55:36.1503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNbom3hK2oLpDCru/E/fXL8ZaVFSsPGNR9eNxYWozSv1Bn4J3XkeFz1rtthrqgIKTkn6lw5ti7dRzs1cJ94uYSdYcDrsWu2KGcq5p7fnmvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2270
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nadav Amit <namit@vmware.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Hugh Dickins <hughd@google.com>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, John Hubbard <jhubbard@nvidia.com>, "linux-um@lists.infradead.org" <linux-um@list
 s.infradead.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjIgw6AgMTU6NDcsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IFdlIGFscmVhZHkgaW1wbGVtZW50ZWQgc3VwcG9ydCBmb3IgNjRiaXQgYm9vazNzIGluIGNv
bW1pdCBiZmY5YmVhYTJlODANCj4gKCJwb3dlcnBjL3BndGFibGU6IHN1cHBvcnQgX19IQVZFX0FS
Q0hfUFRFX1NXUF9FWENMVVNJVkUgZm9yIGJvb2szcyIpDQo+IA0KPiBMZXQncyBzdXBwb3J0IF9f
SEFWRV9BUkNIX1BURV9TV1BfRVhDTFVTSVZFIGFsc28gaW4gMzJiaXQgYnkgcmV1c2luZyB5ZXQN
Cj4gdW51c2VkIExTQiAyIC8gTVNCIDI5LiBUaGVyZSBzZWVtcyB0byBiZSBubyByZWFsIHJlYXNv
biB3aHkgdGhhdCBiaXQgY2Fubm90DQo+IGJlIHVzZWQsIGFuZCByZXVzaW5nIGl0IGF2b2lkcyBo
YXZpbmcgdG8gc3RlYWwgb25lIGJpdCBmcm9tIHRoZSBzd2FwDQo+IG9mZnNldC4NCj4gDQo+IFdo
aWxlIGF0IGl0LCBtYXNrIHRoZSB0eXBlIGluIF9fc3dwX2VudHJ5KCkuDQo+IA0KPiBDYzogTWlj
aGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBDYzogTmljaG9sYXMgUGlnZ2lu
IDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRh
dmlkQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29r
M3MvMzIvcGd0YWJsZS5oIHwgMzggKysrKysrKysrKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCBiL2FyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+IGluZGV4IDc1ODIzZjM5ZTA0
Mi4uODEwNzgzNWIzOGMxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
Ym9vazNzLzMyL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzLzMyL3BndGFibGUuaA0KPiBAQCAtNDIsNiArNDIsOSBAQA0KPiAgICNkZWZpbmUgX1BNRF9Q
UkVTRU5UX01BU0sgKFBBR0VfTUFTSykNCj4gICAjZGVmaW5lIF9QTURfQkFECSh+UEFHRV9NQVNL
KQ0KPiAgIA0KPiArLyogV2UgYm9ycm93IHRoZSBfUEFHRV9VU0VSIGJpdCB0byBzdG9yZSB0aGUg
ZXhjbHVzaXZlIG1hcmtlciBpbiBzd2FwIFBURXMuICovDQo+ICsjZGVmaW5lIF9QQUdFX1NXUF9F
WENMVVNJVkUJX1BBR0VfVVNFUg0KPiArDQo+ICAgLyogQW5kIGhlcmUgd2UgaW5jbHVkZSBjb21t
b24gZGVmaW5pdGlvbnMgKi8NCj4gICANCj4gICAjZGVmaW5lIF9QQUdFX0tFUk5FTF9STwkJMA0K
PiBAQCAtMzYzLDE3ICszNjYsNDIgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fcHRlcF9zZXRfYWNj
ZXNzX2ZsYWdzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgICNkZWZpbmUgcG1kX3Bh
Z2UocG1kKQkJcGZuX3RvX3BhZ2UocG1kX3BmbihwbWQpKQ0KPiAgIA0KPiAgIC8qDQo+IC0gKiBF
bmNvZGUgYW5kIGRlY29kZSBhIHN3YXAgZW50cnkuDQo+IC0gKiBOb3RlIHRoYXQgdGhlIGJpdHMg
d2UgdXNlIGluIGEgUFRFIGZvciByZXByZXNlbnRpbmcgYSBzd2FwIGVudHJ5DQo+IC0gKiBtdXN0
IG5vdCBpbmNsdWRlIHRoZSBfUEFHRV9QUkVTRU5UIGJpdCBvciB0aGUgX1BBR0VfSEFTSFBURSBi
aXQgKGlmIHVzZWQpLg0KPiAtICogICAtLSBwYXVsdXMNCj4gKyAqIEVuY29kZS9kZWNvZGUgc3dh
cCBlbnRyaWVzIGFuZCBzd2FwIFBURXMuIFN3YXAgUFRFcyBhcmUgYWxsIFBURXMgdGhhdA0KPiAr
ICogYXJlICFwdGVfbm9uZSgpICYmICFwdGVfcHJlc2VudCgpLg0KPiArICoNCj4gKyAqIEZvcm1h
dCBvZiBzd2FwIFBURXMgKDMyYml0IFBURXMpOg0KPiArICoNCj4gKyAqICAgICAgICAgICAgICAg
ICAgICAgICAgIDEgMSAxIDEgMSAxIDEgMSAxIDIgMiAyIDIgMiAyIDIgMiAyIDIgMyAzDQo+ICsg
KiAgIDAgMSAyIDMgNCA1IDYgNyA4IDkgMCAxIDIgMyA0IDUgNiA3IDggOSAwIDEgMiAzIDQgNSA2
IDcgOCA5IDAgMQ0KPiArICogICBFIEggUCA8LSB0eXBlIC0tPiA8LS0tLS0tLS0tLS0tLS0tLS0g
b2Zmc2V0IC0tLS0tLS0tLS0tLS0tLS0tLT4NCg0KVGhhdCdzIGluIHJldmVyc2VkIG9yZGVyLiBf
UEFHRV9IQVNIUFRFIGlzIGJpdCAzMCBhbmQgc2hvdWxkIGJlIG9uIHRoZSANCnJpZ2h0IGhhbmQg
c2lkZS4gRXRjIC4uLg0KDQpTb21lIGV4ZW1wbGUgaW4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L25vaGFzaC8zMi9wdGUtNDB4Lmggb3IgDQphcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
LzMyL3B0ZS04NXh4LmgNCg0KPiArICoNCj4gKyAqICAgRSBpcyB0aGUgZXhjbHVzaXZlIG1hcmtl
ciB0aGF0IGlzIG5vdCBzdG9yZWQgaW4gc3dhcCBlbnRyaWVzLg0KPiArICogICBfUEFHRV9QUkVT
RU5UIChQKSBhbmQgX19QQUdFX0hBU0hQVEUgKEgpIG11c3QgYmUgMC4NCj4gKyAqDQo+ICsgKiBG
b3IgNjRiaXQgUFRFcywgdGhlIG9mZnNldCBpcyBleHRlbmRlZCBieSAzMmJpdC4NCj4gICAgKi8N
Cj4gICAjZGVmaW5lIF9fc3dwX3R5cGUoZW50cnkpCQkoKGVudHJ5KS52YWwgJiAweDFmKQ0KPiAg
ICNkZWZpbmUgX19zd3Bfb2Zmc2V0KGVudHJ5KQkJKChlbnRyeSkudmFsID4+IDUpDQo+IC0jZGVm
aW5lIF9fc3dwX2VudHJ5KHR5cGUsIG9mZnNldCkJKChzd3BfZW50cnlfdCkgeyAodHlwZSkgfCAo
KG9mZnNldCkgPDwgNSkgfSkNCj4gKyNkZWZpbmUgX19zd3BfZW50cnkodHlwZSwgb2Zmc2V0KQko
KHN3cF9lbnRyeV90KSB7ICgodHlwZSkgJiAweDFmKSB8ICgob2Zmc2V0KSA8PCA1KSB9KQ0KPiAg
ICNkZWZpbmUgX19wdGVfdG9fc3dwX2VudHJ5KHB0ZSkJCSgoc3dwX2VudHJ5X3QpIHsgcHRlX3Zh
bChwdGUpID4+IDMgfSkNCj4gICAjZGVmaW5lIF9fc3dwX2VudHJ5X3RvX3B0ZSh4KQkJKChwdGVf
dCkgeyAoeCkudmFsIDw8IDMgfSkNCj4gICANCj4gKyNkZWZpbmUgX19IQVZFX0FSQ0hfUFRFX1NX
UF9FWENMVVNJVkUNCj4gK3N0YXRpYyBpbmxpbmUgaW50IHB0ZV9zd3BfZXhjbHVzaXZlKHB0ZV90
IHB0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gcHRlX3ZhbChwdGUpICYgX1BBR0VfU1dQX0VYQ0xVU0lW
RTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBwdGVfdCBwdGVfc3dwX21rZXhjbHVzaXZl
KHB0ZV90IHB0ZSkNCj4gK3sNCj4gKwlyZXR1cm4gX19wdGUocHRlX3ZhbChwdGUpIHwgX1BBR0Vf
U1dQX0VYQ0xVU0lWRSk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3
cF9jbGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQ0KPiArew0KPiArCXJldHVybiBfX3B0ZShwdGVf
dmFsKHB0ZSkgJiB+X1BBR0VfU1dQX0VYQ0xVU0lWRSk7DQo+ICt9DQo+ICsNCj4gICAvKiBHZW5l
cmljIGFjY2Vzc29ycyB0byBQVEUgYml0cyAqLw0KPiAgIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV93
cml0ZShwdGVfdCBwdGUpCQl7IHJldHVybiAhIShwdGVfdmFsKHB0ZSkgJiBfUEFHRV9SVyk7fQ0K
PiAgIHN0YXRpYyBpbmxpbmUgaW50IHB0ZV9yZWFkKHB0ZV90IHB0ZSkJCXsgcmV0dXJuIDE7IH0N
Cg==
