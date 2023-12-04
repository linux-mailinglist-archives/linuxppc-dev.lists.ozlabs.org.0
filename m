Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA48031EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 12:59:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TqwegmkD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkMdj6qZSz3dTt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=TqwegmkD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkMcq2J5Nz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMZ4sSvmjKd2pKdRJk+inYdR59kMHzrBvQSStpBrzWN/WZqeFiIFHms7hmiwgG35iUCX7GpBGkXoBw7FXAcFH3P9q+P9tkhodRIh1JabDR9YOdmejvgK1sTVubk70BmeYkOpn/fIqOnMf2a+fjRvEHKwXIYpLR+kXrHqZdaUQaee5jctCjQApot1FjE0ixPUILWkiSQ7MGdoRb2E1S19GH8O9Fb0cHi9Ua9X1k6xoC+cwTkKRc9hv81BZqTbRRdrgzi6pdl8u26kQMWStFqpJoNm/Ia2UTJOlMYa7DQG4nKBv8Vnox1Y1OPGnvse9nWCY9clChQY0ar4n/ujgcz+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHiqzPf9OTkqOxLTpsN+POJn5d1ZaM+P1CM5xP849hg=;
 b=JURfYQQV2wZHdtxA0ffyhZ5xgsVUJmjfTjqft80YyeygVUBttvOpSXDSKZoSo+NRZ/vKNkUB1rPp7rapNUYeZPA9KKfF6P/4QhDxPGlrWd1+M6Ce73ak2junOfLXhtZmgyYLgM1Ye4mx1U20N/krrDbh5tKn3JtQyqnLYCWGP7DPMHRidwGU5RuVeLBQaiR6cwppaT84pzCgH57lTJQmW117fGTGBSNIqWvfhTCVX0ti7VNIqu3LTaN09xIO+tY8bGEUPbbz4EgPAgs/pCQppPmwvPNZ0eEeq149/5Of+1nKrGyAYMHH7h9EvnLwSvn1Gg5JHmlO7iyaZrvk7wpgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHiqzPf9OTkqOxLTpsN+POJn5d1ZaM+P1CM5xP849hg=;
 b=TqwegmkDSicZ9EMofK9LgEQNUWEy57R5vDrWd/Gpz3IfuzHDZG+YlvJ7kKLVSL/Hpjujj1N8zAtP6cQlALslfMnEUaVEbvVRKSpFp7jL65doVItBZ+Lzh0L3n7QTE7k3g+T5xuZ8maoHu3GHAD3M3/8fBAWvCs8jH426MgZ8C+T0qrkMN5H+Bvl0ISdOjHuCf/r/sYcd7S3x2PR59EJIXMQuLyb+H2RkfQ4vi84rufY76QLHyY0BNPe8XtzFGm9Kf+PFZ4ZTK9IkHuhHJ/5Cdh1/T8pQiEbhyHnsxvkTvrSC/knorjQs8A7R0vaVnQmuYg7nWqeqVKg6rnXWBhG++g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2207.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 11:57:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 11:57:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Thread-Topic: [PATCH RFC 06/12] mm/gup: Drop folio_fast_pin_allowed() in
 hugepd processing
Thread-Index:  AQHaGCxakejDChMrKU+uwfinjAsKCLCC5iYAgAIQ84CAAQxzAIACFO2AgAAaXYCAAB5+gIAACegAgADfT4CAAHXcgIAJyEQAgAQxj4CAAWqrAIAAA94AgAAF/ICAAAMjgA==
Date: Mon, 4 Dec 2023 11:57:55 +0000
Message-ID: <8c7fe945-ee34-4eb6-b466-5707660c7723@csgroup.eu>
References: <20231116012908.392077-7-peterx@redhat.com>
 <ZVsYMMJpmFV2T/Zc@infradead.org> <ZVzT5_3Zn-Y-6xth@x1n>
 <ZV21GCbG48nTLDzn@infradead.org> <ZV90JcnQ1RGud/0R@casper.infradead.org>
 <ZV-KQ0e0y9BTsHGv@x1n> <d2313c1d-1e50-49b7-bed7-840431af799a@arm.com>
 <ZV-sJsdFfXiCkylv@x1n> <510adc26-9aed-4745-8807-dba071fadbbe@arm.com>
 <ZWDKV0XNjplc_vUP@x1n> <ZWj_EgljG3NwS5r1@x1n>
 <283da12c-14f1-4255-b3c4-ab933f3373c4@csgroup.eu>
 <01aad92f-b1e0-4f31-b905-8b1c2012ebab@arm.com>
 <97c21205-f3e6-4634-82e6-c7bbd81d1835@csgroup.eu>
 <0c446883-7f01-406f-bddd-8e78b989d644@arm.com>
In-Reply-To: <0c446883-7f01-406f-bddd-8e78b989d644@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2207:EE_
x-ms-office365-filtering-correlation-id: fd33d1cf-50ca-4551-b901-08dbf4c040a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KmY74fIT5BzhiL8YMP/m5+FQqDDHEZjL3LWpZUhVg1BZpqSJG5nhSvYU+aExtVk7+QFeHjshh8UESw4c0KxGvg00u3nzQc8wcF+LO0iyH01nP/9TpTO42S/9dtKMoaITOcjYOGehf3yRwk2U1MxhavJNQO+8qAFCGrKoXQ4BCUrs/FzdrGKFImKpO2G6W5RrHaj4Y0ebKaIS1h4QnyE9mkmbivayhdepAmYgJ+12PwelBaF884N0KBX6bDCgjH5ywQgA0t0bFSMcb9GdI5/q74q1Bkg41w55miRlf64ozw8Gq0Ye6rA3my7XJkkBmksoNflJLHvsSCwXXe6AXFvY5ZAgHnENCoYq6rfO7o/4WIwK0zrVRxTFONlvre4pMt3OGOlSKRXljmCMxbhBQMrtvnryzXnIju3XuOHI8oGfjYxCrci515X+BbhqGjSw2WrmZYQQoDZuGVIp+IfydOR3YBI4N6N8igXnJBCIWo42tNYltYqJh02Dxwo26OxUZNn7fzC97+UHj4xZMjS8enBsCZ0HIqrizMwjJZpNV9r8SAgQk1Cu86PSmsNzCgOEMCkdx//R4/j1JPyeVZjirGbgEzBrj/9EAmH41o0S7Q4bIrg6IHSQkspHUWia8q3dIp9gOysLWlzPIABHj7EPXgoek8tsmQ8B97fzQNpjmW05pDA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(54906003)(91956017)(66556008)(64756008)(66476007)(66446008)(66946007)(76116006)(4326008)(8676002)(8936002)(110136005)(316002)(6486002)(478600001)(966005)(71200400001)(7416002)(5660300002)(38070700009)(36756003)(41300700001)(2906002)(31696002)(86362001)(44832011)(66574015)(83380400001)(2616005)(26005)(122000001)(38100700002)(31686004)(6506007)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T0YySkZHTVNCK3F2eFdzaldVWnpyeWJSd2hGbWdPek9nMFpJR3RoUG4rS0Ey?=
 =?utf-8?B?S1JaRU52cVBYS3VTUlBUcy9ReWJUTnIyVG1qRWRnejRSd2VMbW5tcHRFYUhS?=
 =?utf-8?B?V01lNHFodHpOYm5DYzNmbloyNy9UOGVzOE9EU253UitUdzkzaG0wUWxsVENX?=
 =?utf-8?B?NExYdlJGenA2QllTWmxtSmIyUVlyc1dXMW01OUwrK1NpUFJYeWc0QjUvK1Jh?=
 =?utf-8?B?dEluc2tpZmExanJyd3BLRm5kTURNMmlxQnZIN0VyOUpuTlZNMVkyS0pWb2ln?=
 =?utf-8?B?Y0VuSHhIZkJHRGEyRkxTT3RKem9hclh4Nko1c2Yxb21EcndWUnY5U0NGNUVn?=
 =?utf-8?B?Ni9NZEtJdEtucHBhU1R1azNvcWxVZWFNRzN1MG9QMDNkbzJrVGdHSlZhTytW?=
 =?utf-8?B?ZVdFaDcrcFIzSXdxdW0xbGptcEZ2Z01ENk5nREUwajNaZ05vM1ZUMThqa1F5?=
 =?utf-8?B?MkhyNTlKbkIvV2RLMmtJemhGY0poSERZc3pwd2ZBRjJMN2lzd3dEaHJmM0E3?=
 =?utf-8?B?c0psMzJ2eXlINzVSWllXVThkQ1RPbXJoYW9FbGJrM05US2MrZEtGcjFrUDZD?=
 =?utf-8?B?UTJNdVZqZ3lvWUx2bll1Smd0dWplb2Jrd0lqZXNjWFlGSittSmRYK1REc2xl?=
 =?utf-8?B?enQ2Qi9RYW9IclhRSWlIWkl0SC9TWDY4eGN3UUJFblZUSVdHN0JmSWFCMnpY?=
 =?utf-8?B?d2EyQllabVhYOTY4S3E0Q2NmQURCdVFDTzg5dUFTbHZtb2FWTnMrUE5maHN0?=
 =?utf-8?B?WWRMZkRLSWhGcFlRYzM0TEFueENodmU1NHgrTjRxT3Y3WDZ2aThLWU1Wd3Js?=
 =?utf-8?B?YzR2VDNNN0FCK3RnK05wbHpKTVRVNUI5czJ0bUhzeTNiY2pScXpmSFZtQ3p2?=
 =?utf-8?B?NEJ6d1ZlUzErZm1TeXNNU2FCMUFESFFXM0dlZExDTC9ubzJWRFBsZlFMVlRk?=
 =?utf-8?B?cDczMC9kRHIzWEYxdW1GVVNtOFhLZEtObm5CV2p6dTA1WnFjeUhiNU1oM3lL?=
 =?utf-8?B?bVBmRk9LY2w0V01NYkhNdXd2SExTVHNFM1VVeEpmZzk4bDU0V1N2SEtrVjNa?=
 =?utf-8?B?L0dEdExTaWVpSGw4UHBaMlBjRHVpbVNHU1MweURadWJsYjRMUUZ0cVJFd1BQ?=
 =?utf-8?B?QkkwOFZKSGx2dXRHK3phL0lFckpRREVZMGtiQU83d1huTDk1dHF5SkdBRHk4?=
 =?utf-8?B?WUh1V2NNVFdKRXJMMHE0L1FadXNQL1JJMXhyZk9hZXdUK0Jtc0t2WlJpY20y?=
 =?utf-8?B?RXcvMTdUQ0Fxc2lrbFd0R1JobnpsbHpNQmYyekxYeUc1Z2RXQVArYWFycCtq?=
 =?utf-8?B?cVU5MmVlYkM3TjJDYnlOemNkTnRLZnJCRmd4Ym50R2owZ2gvOS9ydC9WYnlF?=
 =?utf-8?B?M29HREpIREVUVHFxdFhqSzJ3SWFJZjVIOGZRV3dTRFg3TGRiNlNNbC8ydWJv?=
 =?utf-8?B?OFVvWE1YUzdkRm53cDEycWs5K3pkK1VZd1RlOE81MmhyOEFGVEYwWU53NlFm?=
 =?utf-8?B?SGJOTU5uT0NPNVdVRUZ5VkZFV1JXUlJ5dm16R08rSlpJS0J6Rlc3OGs5MlNT?=
 =?utf-8?B?bHpJZnh3ZFpXKytEdldKTnRrM3U0TGVoMWxMa0xPWTFYTVVXWTNlU09UQ0pk?=
 =?utf-8?B?QmZkbndCSjB2cWdITDZEVm1Gc1NmM1ZjL0xCK0JLNDl0RGY0cVR4VzBMbU9q?=
 =?utf-8?B?WFFza2V0ME1NMXBSUHJQRUxjb0tNcnhkK3FsWEhCayt0QVIrTGY0Nm02Z1Rk?=
 =?utf-8?B?RGVVSTFDWXA0aTZWUmJBdGFNRnd0T2NHM25YRFE3VTdieHgyN3lHdk9RZnZq?=
 =?utf-8?B?amMxVmY5VXl3aE56ZDJnQmV6MWE3aUhMOCtvcXFtSEFvTmIybmpjam45VWYv?=
 =?utf-8?B?RXh4NkFjM0YvMmhkVDZBNWdiYXpjMFg4YXNKUkh0R2Naa2RLbldId0pjQStT?=
 =?utf-8?B?MFFlUnlTc2phZjEyRy9tOGMyeWhnT25FQVJDMTRPVW9Xby9WY0RhS3B6dTJD?=
 =?utf-8?B?dG5xU1F4SUxQVExoZTRZMnFySUROcmQ1R01Yd3ZtajhXNWRMWDB5YzgrT2xr?=
 =?utf-8?B?UjVneWJBRkxXODE3Qkx0dDh3NWtKenJTeXB3eDIzdGt6ZmZPUGdLdlZESUVm?=
 =?utf-8?Q?C82E48yI/DLCPcXYDrIMmwNlK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9DB4615981B6C44AEF96EF49FE31A07@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd33d1cf-50ca-4551-b901-08dbf4c040a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 11:57:55.8087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2eXlFuXtMKzpcQvJEmbmWuNo216OjyntKaMpRHwLLW+kd7VeZe0lnBtQciB92j8LD201eOq7RgxtNBFn3OObpWGF2/RABd1QWTX/jttrmA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2207
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

DQoNCkxlIDA0LzEyLzIwMjMgw6AgMTI6NDYsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBP
biAwNC8xMi8yMDIzIDExOjI1LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBM
ZSAwNC8xMi8yMDIzIMOgIDEyOjExLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoNCj4+PiBPbiAw
My8xMi8yMDIzIDEzOjMzLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+
PiBMZSAzMC8xMS8yMDIzIMOgIDIyOjMwLCBQZXRlciBYdSBhIMOpY3JpdMKgOg0KPj4+Pj4gT24g
RnJpLCBOb3YgMjQsIDIwMjMgYXQgMTE6MDc6NTFBTSAtMDUwMCwgUGV0ZXIgWHUgd3JvdGU6DQo+
Pj4+Pj4gT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDk6MDY6MDFBTSArMDAwMCwgUnlhbiBSb2Jl
cnRzIHdyb3RlOg0KPj4+Pj4+PiBJIGRvbid0IGhhdmUgYW55IG1pY3JvLWJlbmNobWFya3MgZm9y
IEdVUCB0aG91Z2gsIGlmIHRoYXQncyB5b3VyIHF1ZXN0aW9uLiBJcw0KPj4+Pj4+PiB0aGVyZSBh
biBlYXN5LXRvLXVzZSB0ZXN0IEkgY2FuIHJ1biB0byBnZXQgc29tZSBudW1iZXJzPyBJJ2QgYmUg
aGFwcHkgdG8gdHJ5IGl0IG91dC4NCj4+Pj4+Pg0KPj4+Pj4+IFRoYW5rcyBSeWFuLiAgVGhlbiBu
b3RoaW5nIGlzIG5lZWRlZCB0byBiZSB0ZXN0ZWQgaWYgZ3VwIGlzIG5vdCB5ZXQgdG91Y2hlZA0K
Pj4+Pj4+IGZyb20geW91ciBzaWRlLCBhZmFpY3QuICBJJ2xsIHNlZSB3aGV0aGVyIEkgY2FuIHBy
b3ZpZGUgc29tZSByb3VnaCBudW1iZXJzDQo+Pj4+Pj4gaW5zdGVhZCBpbiB0aGUgbmV4dCBwb3N0
IChJJ2xsIHByb2JhYmx5IG9ubHkgYmUgYWJsZSB0byB0ZXN0IGl0IGluIGEgVk0sDQo+Pj4+Pj4g
dGhvdWdoLCBidXQgaG9wZWZ1bGx5IHRoYXQgc2hvdWxkIHN0aWxsIHJlZmxlY3QgbW9zdGx5IHRo
ZSB0cnV0aCkuDQo+Pj4+Pg0KPj4+Pj4gQW4gdXBkYXRlOiBJIGZpbmlzaGVkIGEgcm91bmQgb2Yg
NjRLIGNvbnRfcHRlIHRlc3QsIGluIHRoZSBzbG93IGd1cCBtaWNybw0KPj4+Pj4gYmVuY2htYXJr
IEkgc2VlIH4xNSUgcGVyZiBkZWdyYWRlIHdpdGggdGhpcyBwYXRjaHNldCBhcHBsaWVkIG9uIGEg
Vk0gb24gdG9wDQo+Pj4+PiBvZiBBcHBsZSBNMS4NCj4+Pj4+DQo+Pj4+PiBGcmFua2x5IHRoYXQn
cyBldmVuIGxlc3MgdGhhbiBJIGV4cGVjdGVkLCBjb25zaWRlcmluZyBub3Qgb25seSBob3cgc2xv
dyBndXANCj4+Pj4+IFRIUCB1c2VkIHRvIGJlLCBidXQgYWxzbyBvbiB0aGUgZmFjdCB0aGF0IHRo
YXQncyBhIHRpZ2h0IGxvb3Agb3ZlciBzbG93DQo+Pj4+PiBndXAsIHdoaWNoIGluIG5vcm1hbCBj
YXNlcyBzaG91bGRuJ3QgaGFwcGVuOiAicHJlc2VudCIgcHRlcyBub3JtYWxseSBnb2VzDQo+Pj4+
PiB0byBmYXN0LWd1cCwgd2hpbGUgIXByZXNlbnQgZ29lcyBpbnRvIGEgZmF1bHQgZm9sbG93aW5n
IGl0LiAgSSBhc3N1bWUNCj4+Pj4+IHRoYXQncyB3aHkgbm9ib2R5IGNhcmVkIHNsb3cgZ3VwIGZv
ciBUSFAgYmVmb3JlLiAgSSB0aGluayBhZGRpbmcgY29udF9wdGUNCj4+Pj4+IHN1cHBvcnQgc2hv
dWxkbid0IGJlIHZlcnkgaGFyZCwgYnV0IHRoYXQgd2lsbCBpbmNsdWRlIG1ha2luZyBjb250X3B0
ZSBpZGVhDQo+Pj4+PiBnbG9iYWwganVzdCBmb3IgYXJtNjQgYW5kIHJpc2N2IFN2bmFwb3QuDQo+
Pj4+DQo+Pj4+IElzIHRoZXJlIGFueSBkb2N1bWVudGF0aW9uIG9uIHdoYXQgY29udF9wdGUgaXMg
PyBJIGhhdmUgYWx3YXlzIHdvbmRlcmVkDQo+Pj4+IGlmIGl0IGNvdWxkIGFsc28gZml0IHBvd2Vy
cGMgOHh4IG5lZWQgPw0KPj4+DQo+Pj4gcHRlX2NvbnQoKSAoYW5kIHB0ZV9ta2NvbnQoKSBhbmQg
cHRlX21rbm9uY29udCgpKSB0ZXN0IGFuZCBtYW5pcHVsdGUgdGhlDQo+Pj4gImNvbnRpZ3VvdXMg
Yml0IiBpbiB0aGUgYXJtNjQgUFRFIGVudHJpZXMuIFRob3NlIGhlbHBlcnMgYXJlIGFybTY0LXNw
ZWNpZmljDQo+Pj4gKEFGQUlLKS4gVGhlIGNvbnRpZ3VvdXMgYml0IGlzIGEgaGludCB0byB0aGUg
SFcgdG8gdGVsbCBpdCB0aGF0IGEgYmxvY2sgb2YgUFRFcw0KPj4+IGFyZSBtYXBwaW5nIGEgcGh5
c2ljYWxseSBjb250aWd1b3VzIGFuZCBuYXR1cmFsbHkgYWxpZ25lZCBwaWVjZSBvZiBtZW1vcnku
IFRoZQ0KPj4+IEhXIGNhbiB1c2UgdGhpcyB0byBjb2FsZXNjZSBlbnRyaWVzIGluIHRoZSBUTEIu
IFdoZW4gdXNpbmcgNEsgYmFzZSBwYWdlcywgdGhlDQo+Pj4gY29udHB0ZSBzaXplIGlzIDY0SyAo
MTYgUFRFcykuIEZvciAxNksgYmFzZSBwYWdlcywgaXRzIDJNICgxMjggUFRFcykgYW5kIGZvciA2
NEsNCj4+PiBiYXNlIHBhZ2VzLCBpdHMgMk0gKDMyIFBURXMpLg0KPj4+DQo+Pj4+DQo+Pj4+IE9u
IHBvd2VycGMsIGZvciAxNmsgcGFnZXMsIHdlIGhhdmUgdG8gZGVmaW5lIDQgY29uc2VjdXRpdmUg
UFRFcy4gQWxsIDQNCj4+Pj4gUFRFIGFyZSBmbGFnZ2VkIHdpdGggdGhlIFNQUyBiaXQgdGVsbGlu
ZyBpdCdzIGEgMTZrIHBhZ2VzLCBidXQgZm9yIFRMQg0KPj4+PiBtaXNzZXMgdGhlIEhXIG5lZWRz
IG9uZSBlbnRyaWUgZm9yIGVhY2ggNGsgZnJhZ21lbnQuDQo+Pj4NCj4+PiAgIEZyb20gdGhhdCBk
ZXNjcmlwdGlvbiwgaXQgc291bmRzIGxpa2UgdGhlIFNQUyBiaXQgbWlnaHQgYmUgc2ltaWxhciB0
byBhcm02NA0KPj4+IGNvbnRpZ3VvdXMgYml0PyBBbHRob3VnaCBzb3VuZHMgbGlrZSB5b3UgYXJl
IGN1cnJlbnRseSB1c2luZyBpdCBpbiBhIHNsaWdodGx5DQo+Pj4gZGlmZmVyZW50IHdheSAtIHRl
bGxpbmcga2VybmVsIHRoYXQgdGhlIGJhc2UgcGFnZSBpcyAxNksgYnV0IG1hcHBpbmcgZWFjaCAx
NksNCj4+PiBwYWdlIHdpdGggNHggNEsgZW50cmllcyAocGx1cyB0aGUgU1BTIGJpdCBzZXQpPw0K
Pj4NCj4+IFllcyBpdCdzIGJvdGguDQo+Pg0KPj4gV2hlbiB0aGUgYmFzZSBwYWdlIGlzIDE2aywg
dGhlcmUgYXJlIDR4IDRrIGVudHJpZXMgKHdpdGggU1BTIGJpdCBzZXQpIGluDQo+PiB0aGUgcGFn
ZSB0YWJsZSwgYW5kIHB0ZV90IGlzIGEgdGFibGUgb2YgNCAndW5zaWduZWQgbG9uZycNCj4+DQo+
PiBXaGVuIHRoZSBiYXNlIHBhZ2UgaXMgNGssIHRoZXJlIGlzIGEgMTZrIGh1Z2VwYWdlIHNpemUs
IHdoaWNoIGlzIHRoZQ0KPj4gc2FtZSA0eCA0ayBlbnRyaWVzIHdpdGggU1BTIGJpdCBzZXQuDQo+
Pg0KPj4gU28gaXQgbG9va3Mgc2ltaWxhciB0byB0aGUgY29udGlndW91cyBiaXQuDQo+Pg0KPj4N
Cj4+IEFuZCBieSBleHRlbnNpb24sIHRoZSBzYW1lIHByaW5jaXBsZSBpcyB1c2VkIGZvciA1MTJr
IGh1Z2VwYWdlcywgdGhlIGJpdA0KPj4gX1BBR0VfSFVHRSBpcyBjb3BpZWQgYnkgdGhlIFRMQiBt
aXNzIGhhbmRsZXIgaW50byB0aGUgbG93ZXIgYml0IG9mIFBTLA0KPj4gUFMgYmVpbmcgYXMgZm9s
bG93czoNCj4+IC0gMDAgU21hbGwgKDQgS2J5dGUgb3IgMTYgS2J5dGUpDQo+PiAtIDAxIDUxMiBL
Ynl0ZQ0KPj4gLSAxMCBSZXNlcnZlZA0KPj4gLSAxMSA4IE1ieXRlDQo+Pg0KPj4gU28gYXMgUE1E
IHNpemUgaXMgNE0sIDUxMmsgcGFnZXMgYXJlIDEyOCBpZGVudGljYWwgY29uc2VjdXRpdmUgZW50
cmllcw0KPj4gaW4gdGhlIHBhZ2UgdGFibGUuDQo+Pg0KPj4gSSB3aGljaCBJIGNvdWxkIGhhdmUg
VEhQIHdpdGggMTZrIG9yIDUxMmsgcGFnZXMuDQo+IA0KPiBUaGVuIHlvdSBoYXZlIGNvbWUgdG8g
dGhlIHJpZ2h0IHBsYWNlISA6KQ0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bW0vMjAyMzEyMDQxMDIwMjcuNTcxODUtMS1yeWFuLnJvYmVydHNAYXJtLmNvbS8NCj4gDQoNClRo
YXQgbG9va3MgZ3JlYXQuIFRoYXQgc2VyaWVzIG9ubHkgbW9kaWZpZXMgY29yZSBtbS8gLg0KTm8g
Y2hhbmdlcyBuZWVkZWQgaW4gYXJjaCA/IFdpbGwgaXQgd29yayBvbiBwb3dlcnBjIHdpdGhvdXQg
YW55IA0KY2hhbmdlL2FkZGl0aW9ucyB0byBhcmNoIGNvZGUgPw0KDQpXZWxsLCBJJ2xsIHRyeSBp
dCBzb29uLg0KDQpDaHJpc3RvcGhlDQo=
