Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A918C822BEF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 12:16:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bPxO51dz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4nGj2X46z3dBl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 22:16:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bPxO51dz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4nFK2SPFz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 22:15:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/1BQ2LkED6ZB4J6itpPUPDi8h0fmUoBpUSCdE4JJl9u2hbzfDFYNTAu1XrGyHQnSXIhoEFGkZLYuRDF9sUTeTe+Qzj1dyr0BZsv4ZmE5sx88/n7PjBd/De/sYGKPZ0g8gIKZuQeMDsD7gQz4DTVxAUbIPfBRlj9cf0iVNcaZbB0ttqxw8HRSQxu28PqbivRokO9w0L1N+A2/yP1Gyj9yr6ahyOxPh55UjgT5Qs/OaRe8UF4471JJsrmrHq7xRlyYBkMqO5rGeq9UU9PzHQrfgVWTrMPXNgtnwesiHVJj5bcZNbxMItgN+cYDleiF9aEdpJxHmw8g6FDuAO5w8I0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61W9i2elWY4cDzcH9AfBgmc9NhqXytNr91CX1w8ccDA=;
 b=ND27t8LF1CFL7SOPNrmIU32qB2WfAnX2ujkRwiZ6PjMxpztxD9uAfv1zvmRw55jAAm8MEivb1Y1SzWOmxPT2pHn4PdoxBU3ex1O0y+3dmPilxDWicHaUMdNvigralowDrKIwfr2DSUq8yCBCKOoBXqpmJjrvFqCsdtWD3++L9el2X/Ah8gWHvTDqvxY0s9zCqrCA7QYWMI/EPalbQ9wG0kmQVDE7N99LMocEnPvmmhf2RAG9R5wu32y7d9lWszfjVoYPbX/cDxmsax6uJVaVqSQVYhxsEtVm9eycLKpj/GweUT/aVYrm7352btj5wd+se2DXH9PvisRmbWgPvIPiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61W9i2elWY4cDzcH9AfBgmc9NhqXytNr91CX1w8ccDA=;
 b=bPxO51dz2KfAYd8fNowOhBosMPSfaBVKhaVF1hCsC5IOTY7eEohA/FmH7zGkMzUa+4DITjP1B7uRliLPWqc2RcqiHs/qvOysw6m7vlm3/Bu3HbUvZC+J0UciZxgA+nR+snIUQVyYUzqD8E0XQrJOq6l5gO8C3VWSIYmUW8+tyVfauCXWxsVcsIQxynvLR54z/bLnTjV4faSlFMbihC/9sfMlBsGFLQpIptiWg/DKFbbq1choi+4wnnJxdUIXe0mjXVEMbOFuyZ6vI5t/jrn4tpZssNN6CC3aik7JPhIaNgYwKtVh3rFuQtRmeNAj2FxrXYsyqriXd8mY9rYFDr1FIg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1438.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Wed, 3 Jan
 2024 11:14:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7135.023; Wed, 3 Jan 2024
 11:14:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/13] mm/gup: Unify hugetlb, part 2
Thread-Topic: [PATCH v2 00/13] mm/gup: Unify hugetlb, part 2
Thread-Index: AQHaPiVMR3zGhecV+0qUMoop8MTeWbDH79wA
Date: Wed, 3 Jan 2024 11:14:54 +0000
Message-ID: <591c59d6-dedb-4399-8a6f-c574fd2ad9cc@csgroup.eu>
References: <20240103091423.400294-1-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1438:EE_
x-ms-office365-filtering-correlation-id: a46ab680-8c26-4864-caae-08dc0c4d368e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  206BXAmyCBTV/6DPmDDl7TdD2SOVaG7S9Kq64plErT6hscH+EZn1mQSWp2Fq3orAaWVJpPPKVPXeZWvqpGoVGikBqiuHTVwodponlrwlMfMobcUhKZzvgXX5NGDs9zdpURmSuKE7x+EDPMhOYFWh+HV7vSfhoiWK09PsRIe3z7UfSMsO2YEj4FBUoQoCFaHEjJxcLBjOQ63FoJXZ3axAezfY2P9YK4+42w2W/WnxOnjuoeh2le0rusBvxqwdoo2/5ZEN8k+pDGw6k0lTyYQ2Nxe3FIldMAlMJMqTfhqBZusyCsp1U7+TL2fCdZHQy8ZhrrmIeYtghx/maSaKbweW+rhBYjeLY6UwhbmMoYtFLOgE971G6rna/ITJiFSNJyGe34TOPNVLeRi5Qs/ayKC1QjmcRRHUI0IM624sHzJo8V3dHQg8H6vjcjz0zDw4kqPLr5IoIQ7ycxdw/9xd99Fy3oOUXt3Zd7gsOYMM6M2ErzqgfPSVmH1siEzyG+2AIQDhiyIZDADEfipzf2u1As72mkfXa0i0RVY9MY1QiTxt4yAd7lrFkC6vYTN1fObJ6h/BAZfUDzh8IlTJMOXNquecc7OWw+8uSQyImrwis0oF8+qwOI/xRUHf3N5SqJ6Aw8Rv/QhtJ04chOr6rXNNahVsouG8rDqSlSjvGy3f1xZYgd0Po63wKbJoQAHglwWDKVUQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(122000001)(38070700009)(36756003)(31686004)(31696002)(86362001)(26005)(6506007)(6512007)(71200400001)(54906003)(4326008)(6486002)(316002)(8936002)(478600001)(8676002)(66446008)(66946007)(76116006)(66556008)(91956017)(66476007)(110136005)(64756008)(2616005)(41300700001)(44832011)(5660300002)(4744005)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eko1WmdKcG56ZjhDL3B6YmNsY2l4aVFKUGlxN0ZYenlja0xTNjM4VjlNaDhC?=
 =?utf-8?B?N1JObUdydGFWcEJlWERPRjVoUDJlcUF6bi9mZUtqdzZCeGRMUE9JcmJhc29y?=
 =?utf-8?B?TFZ1WE1NN21jZU85bHBacnEwVm1vVUpBLzU2K0JLc3h3NDd2V1lvckVLWW1k?=
 =?utf-8?B?dVh0L0VkVE9WYUlaWXpINUpGYjQ2SHQ1MGF0cXBQdW42VkRpc0liUkkwYlIw?=
 =?utf-8?B?ZkZ3Ly9HQW1WTU1wWklHMTNGUXJMN0hnZlpROWZaK2h0YXRnQjVXZFlTdWg1?=
 =?utf-8?B?TjhUVm5aR2NLbjhTNWxwYSsxRDMvTy9hcjZpNjRUaHFsMzIvRGxUQThYSTFJ?=
 =?utf-8?B?QUtCcXhHb2FpL1pldWJsUERxVDFiTHJWbEphTVMyWFZkUkliR0FRSUhiRWFR?=
 =?utf-8?B?S1VqUm5xaUhKa0swVEo1UnA0SFhDbXhkTU1CVTVCTzh6N0JoNlN5bEhWbCtD?=
 =?utf-8?B?UXNXbzQvN0U3emdZVEVZdjBYZ0tBb0NXdVIzQVRWN0ZlMElQWElXZmF4N0VY?=
 =?utf-8?B?ejdDblltMGZCblZsK3RtU1NIV3UzcE1XaXZCRFR5NVN4dURwL0lBaWJYcjZw?=
 =?utf-8?B?bU1abXYrNVZQbjdsUHZuZTNEOEZYb25Cclo3bUVvekd4TVYyWUFTVXpkaFRD?=
 =?utf-8?B?Q2sxOXJhdVhUMkMyZlg2TWtEMDljSFd4WlBXeUYyRktzaDVMa05oQkFTSFRo?=
 =?utf-8?B?VDh0OE9CM3lqWm1PbktvZDIwUVZVMmNqY2h6SDFDYUhveTg2cGJhVUR2ZWNY?=
 =?utf-8?B?MGpPQkpWMVFOa2ZPZjdrKzRBK2lZZzBzNVYvUkUwdmk5aVUrTmNxZndXRVVa?=
 =?utf-8?B?blk2cU14YXMvenp6MmhJN3VzQWJ3RUIzdmlLZ3hOTjZjZTBmU0FEYnorVWJU?=
 =?utf-8?B?VGdzN29TTXJnaVQ4dURQSGFyRDN0SVExN2tmcE5LM1pycitkWS8rRU9wZkNn?=
 =?utf-8?B?QXM3WnRGcXJWVE5EU09aYVZ1N1dTUVpZUms0L3hLTnVkcDA1dEJFaFVYd3Va?=
 =?utf-8?B?anByOGM1RnlmYzBwSWlxMG5jbDNnOTM1dUNaQnFNL2RYbzFLeEErZlNOWUJr?=
 =?utf-8?B?b0xzblp4SGZoUHZHejdwbkhGUWE1TXdiNDR2Z0M4NytHUFE0bUxzcnJ4Tjli?=
 =?utf-8?B?QURnbW03c01pUi9sNDJuU2t5MFVHVXM4TzM3YlQzN0o5OVNoL0VseFh5blQw?=
 =?utf-8?B?REl5VEl4Z3l4MThrb1pxWWQ1VDN4ZVlxMURHaW8vcEdCdDNRQWdrTWNLeXo0?=
 =?utf-8?B?OTd5N2hYQWY3Rys2eEZLeFdzZHNOd2RndVVXQmlZME5wV0tiWTF4WVhxVERN?=
 =?utf-8?B?Wi9QRzJqT1g4N3pvdU5YR3JVb0o1c3dtYkF5TGNZVDJLampaMHU5cjhqa1V3?=
 =?utf-8?B?YmdKMUxkU0F0ZG9QMzJnZkdQZHZsSTJGbTdMVlU2Qjhoallmem1OY29rZkJX?=
 =?utf-8?B?RjQ0d3FvZFIyTUo5blNieWhMVGg1WXluQis1U05NYXhRQW5BS0FETGlFcExG?=
 =?utf-8?B?NDMxZkl3QnR4NjlMTllyTHlOVzhFMGZqVWlFMFA5cVVUNzNGNGdxT3ZnVlJ6?=
 =?utf-8?B?Mml3TmlhdkVaM2M5VVoxWkZiNFp1NnhDeUJBSTducjhXWFVBZXBtUFhqS214?=
 =?utf-8?B?ckJsL1J0OHZxWk9JK25vR1hCVVEybGVRVkZ6WDFyODdQckU0MDlBbzVlWmpr?=
 =?utf-8?B?aWtqYVNxQ0RaL0Z4ZzZrS1lhT2M2bXRqRHdESERzMzUzZjRZV1NDRXZ2Rkln?=
 =?utf-8?B?YmJZOEdwTVZ2R3ZjT1JhaWxrOWhEODYzQ0thcVJUM2Z3VmVNS0gxTG9memdK?=
 =?utf-8?B?MXFmeVdTM0hpZFhpSDNwR2U3bFFaUy9hcmVoU1FKdTAvRjJQMVFtK0pnclZi?=
 =?utf-8?B?UW5SU2UzR0hYT3A5cnAxT3I1VjJsSGYzcFZVSFZrbFE3ZlhNT2N4b1BtZ0xa?=
 =?utf-8?B?YW15NjhrcGJmdmNEeTNFNGdRU0FNeWhocy94MXE2MUNqQ3FRTTJNQy9PNVZD?=
 =?utf-8?B?dURYQ2l1RHNMWDdSa0hXVk9aSFl3NGtya0lTUXpETnlKbEgvU2hKKzcvQVZs?=
 =?utf-8?B?V1pLUlhES1NjYVFQbzdlZ3VHU25LdE1kWXo1czYwZmdLNHBBMndnd1NWbGtN?=
 =?utf-8?Q?CdhuWEYtVRTHjWy6h1uit1GuH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <734BDE7BB8D75B4788D78F6935B9A2E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a46ab680-8c26-4864-caae-08dc0c4d368e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2024 11:14:54.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NvPDBpNJ3tco9JeVbuzj/9gCNGcjUrPiOk6BQaHknYZY8OIitU8Lglv5C7XoVmPUM/ebk0qnZX9KIOmuiMXMYWApTEcc46ynxDpg/+Fqbmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1438
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzAxLzIwMjQgw6AgMTA6MTQsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IA0KPiBUZXN0IERv
bmUNCj4gPT09PT09PT09DQo+IA0KPiBUaGlzIHYxIHdlbnQgdGhyb3VnaCB0aGUgbm9ybWFsIEdV
UCBzbW9rZSB0ZXN0cyBvdmVyIGRpZmZlcmVudCBtZW1vcnkNCj4gdHlwZXMgb24gYXJjaHMgKHVz
aW5nIFZNIGluc3RhbmNlcyk6IHg4Nl82NCwgYWFyY2g2NCwgcHBjNjRsZS4gIEZvcg0KPiBhYXJj
aDY0LCB0ZXN0ZWQgb3ZlciA2NEtCIGNvbnRfcHRlIGh1Z2UgcGFnZXMuICBGb3IgcHBjNjRsZSwg
dGVzdGVkIG92ZXINCj4gMTZNQiBodWdlcGQgZW50cmllcyAoUG93ZXI4IGhhc2ggTU1VIG9uIDRL
IGJhc2UgcGFnZSBzaXplKS4NCj4gDQoNCkNhbiB5b3UgdGVsbCBob3cgeW91IHRlc3QgPw0KDQpJ
J20gd2lsbGluZyB0byB0ZXN0IHRoaXMgc2VyaWVzIG9uIHBvd2VycGMgOHh4IChQUEMzMikuDQoN
CkNocmlzdG9waGUNCg==
