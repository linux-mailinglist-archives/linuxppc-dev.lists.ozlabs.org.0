Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF8582E030
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:42:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CIHuKl2o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDLbN0xQbz3vwH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CIHuKl2o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDLZY5y2Yz3cl3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 05:41:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfOnkHUJ96vV5TWvE6cBV2CJMc7WvviwU5dX10rHr2G3/YdyxO882HcUsoSlI3+us7OOVQRvHoTJNnDJiHc3kv+tSgHXoFuZEhAgAVEb116+c1hnUjHNOleGL4itfa05QTw9KL14dWA1kNp3Yb5aQ0IOVpwbyxr7yKfVmKF6/WKgdAsvfrOhH/1/awE8tEqC0Ojh5wlGDfw+/A1kOlEE3QtixcLuS4wwrHGtM+SDLVE7kNnpi4xFc79ZUoULqlXqjNxLPNowlEHXn+gIAcVHNElyq4g4nmXlzQZXANZOJT/gyZthmUoFMIo0nLKMhE6zTS9IOPlJDs1f5GWXQKuqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5ILbPEFZmyJGFxhbK2YHEHlIEDwEAx0Z+7w9UPEIss=;
 b=my5bzQsQ3MlzO20FMwm106lmbNiTfMnTOkg/kbF22GaN5w4HeW32ZRiEVkGn5z3FyNqjyaHg3aB+3VrJxe0YE6qGdPxRfliJmDXke+6eDxNAibqMU926L7jSUZqdupB3W3M0BQwLmC9in8YQjlCtSSgTTucjnQG5L4AybfCQ8P6rmBTP5FdHebP+7gpm4cstffSj5A/jkajy2akD1hiV1xDsHIug9JTSfrUgcHs6xNhH9eDD8xl2DfIiigJzKG/5lAAduMIypX7KsBw6h1SPz0zfJVYDJsUOew/v2CJ3N0hpUYeKHdKJJY3vK/lIZv/Y/kZS/Uaum066wEedO3IoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5ILbPEFZmyJGFxhbK2YHEHlIEDwEAx0Z+7w9UPEIss=;
 b=CIHuKl2oPBjTrK1o8pQWgYRBNEbNcx38F8/1uYku2zhtnoQ6Pa8M2kq0Z980pYbsaoA7tkv3utPgt8Gl021TvPLqlUT++OBQfoO3HkPPozjpk0qo9yvCcd5K4ic+em8XCPy8q4A78XERVW6xBgeMRfJnochW/ROWUGDVWXwx5SK56D3BycRQBhDp/kcl1sZ+W+JqW4RJ6fCPsheOW/dSKb8LF3s7s0mM30Orep3JTKUr4ifrR8muF+6QfeHHL293BNhFuB+7wjmDN9DJVvGSf47v0M60uVd/f3kxBzL7oIzMkh6Yu29ZYGhmVFMve0jjurRTrnVRgqV2t0BfVQmR4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 15 Jan
 2024 18:41:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 18:41:03 +0000
Date: Mon, 15 Jan 2024 14:41:02 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 09/13] mm/gup: Cache *pudp in follow_pud_mask()
Message-ID: <20240115184102.GU734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-10-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-10-peterx@redhat.com>
X-ClientProxiedBy: MN2PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:208:120::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: abc36491-8ea8-4287-4ecf-08dc15f986b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qEZbr8p5qAVsT4X0pYjH44zb2n/4om7g3YXgAwzlK+pKJ+GHnfS7/qvnMughiGTHsoY/k93RoJwA3/2j6peUfUzDUqImrQzjYzne8KxhOjzO0mjAcOfSrkegsbObx2RPgSC0F/bm9i6z3Rxb9wQt0bT54nRfC3HxVlOHxCns0MFiW6omZ6Q/ObOcmvS0Wb12d73j38fYw7p246a+OMqyE+Fj3JNT60egl2ehVtqwjiBS6Z7PrmIhNM2gFmvYjIDt6W3NPeNhh4UVgKc4sXCXVTqfw2ScPUkSlvTIeymdsFHKqv/RYbT2e2okhfkrxjR7CZCDFPb/85eW1EPF3JqeYiXMQm6hlmi3VRFXkKAQJvPNaU4x1s0uRE8aJXa+3gFU9e5APU8Z9P1aqhSXb58ecLMy0io27rmmU/rFjq1mAmYiGvqBLyAcYajtlqyTFxJkos0qvdkIOmaVGpdd0kxatw/eLZ0Dp+Qex8U95BbCmix4YkSLqb4ALRgIvZVEit3KUzJu9Nn7Y4ILln0iroCeC+0g6znTTbwJr8sO2c5JFeqUDHvsnjNpXQnDRVIolSdiCbL7+mcy2fe4ttDPlim058KuJtJ7O1U0Y1B9y2j+Kjw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66946007)(83380400001)(6506007)(66556008)(6512007)(26005)(478600001)(1076003)(38100700002)(4326008)(2616005)(5660300002)(8936002)(7416002)(4744005)(6916009)(54906003)(8676002)(66476007)(6486002)(2906002)(316002)(33656002)(36756003)(86362001)(41300700001)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C6Q4bQcf9PvJCs5KvaZDIXKIi+dVQ0rNEfElxA/30WhejkyzRDyadFx0Nx9i?=
 =?us-ascii?Q?wNIY/PWj+4R24SE0/kjIkuIJpc6gIKNaEzA9w1gH9/8RB/YwlGMgH6vCJopJ?=
 =?us-ascii?Q?9zf8Z1tzjS58N5TqaBdtUzxvsJhAnBASsuUqnfi3QC2pDJECYo4GB77loCyI?=
 =?us-ascii?Q?3xyg9Au7G0A+TRaZ1p7ZQgkhQWGuGu0yQLv5nIxmygKBja3a0EkhP/W/8FcM?=
 =?us-ascii?Q?9hyaCgjQXa4Uj9DO8jT5ky7SnNHibF1xZCdVIsVDns9LK9xHGNRCky0KRgRI?=
 =?us-ascii?Q?O8jbnN7DtZTbJUbIyJ973i7zWTMGSsjMikf2PHjpvX4fS+z8GepaCT7UNevc?=
 =?us-ascii?Q?HKTdCF+dHk8d6+7AsMJ5DKMT9bUmEr2pynUj58t/2yiLz+DgMEBLSQskrfXD?=
 =?us-ascii?Q?VxfQUD7vdhz9hxku3HeS6FxAt3FGjCEfEQMzWd098e443PuSKpogXbSEkoeS?=
 =?us-ascii?Q?e+xRyzd/Wn1Ef7RgDnVr3UcxB3vQ/MLbGJWHHuBKBA2ZJW4xIasWxqQB8323?=
 =?us-ascii?Q?cUxvTdGayBGUivQ8pXpB7x7rbONcH/mUSYTQPhMFLvuVsxe+qpu0dNDA4NOa?=
 =?us-ascii?Q?w9Xm39Pj5ad7eVZBl+cAXuUKu+lGanAYsqjLM5oEeeUiiSQWu1uLOvk8R8Oj?=
 =?us-ascii?Q?9Ji6MBeDh7MrlzN/bFCBd5p86nGoFvaCcSivyN1vyAW9F9O1xnZTodFCEFJo?=
 =?us-ascii?Q?V8+zIk76lYWrPChN8n8/KRe/oBsqJ2LLaWKBCbbbm6Q0+COGq+CRUNXPcEVk?=
 =?us-ascii?Q?LUO6gpmoMtgHeo601+3fITaBgBSALDBug8TSujucnx1SC6Bl8iR6k5TIWCcY?=
 =?us-ascii?Q?cjnE9+an+VOGLxAORDh7JTQ2l4wWL9XhIi2mbrKG9sCbrpSdbhJgzFFzHFd+?=
 =?us-ascii?Q?Rcb0pS9B4JEqM8+1scMXmMAJkuHkPG4fRk0SNVmBAU8pA+DwNQd/yOeWTEv1?=
 =?us-ascii?Q?n9JPrC9YSoikeiQY5C0rWkzY7Lk+1Y/XjmvZqj5YZQW6ME278j76Wl7sqB5q?=
 =?us-ascii?Q?GtwbRxNL34WEuFaD2c/+5lfS/gfaH+sUXaiUWk3Hk/9Y109yFNnyocKxulw7?=
 =?us-ascii?Q?3aT/0R3Ux9F4idTFG/kWS3UNlHe9EM8LZ+dwFnzkojJ6gY7QIGwUNLB669xn?=
 =?us-ascii?Q?DwQFtjLZWcAyzr2yOTFZJF0UnsZ8BuzsIn914utQC0eSanvyfmEqC76FJez3?=
 =?us-ascii?Q?sxcXJRjTGF7dDf36MosGMx6zXxIV7Vt8BfZ/EVhCtB2wJpNrLksnpAcAfgKw?=
 =?us-ascii?Q?VTdh2QHxWfEQWDkusJILbRR+Gqc4y6Y2BUssNGccpu2YIH98mJJvNPmoG+FZ?=
 =?us-ascii?Q?qGf9A0SxG5+dBIBGSABPz/qhu+gwLnNJEKbqhjoMhZ1XmCjPvfsJeWx7xayk?=
 =?us-ascii?Q?rydIP8CqvWWEjfSrV7PUG20hfWJuXJbIWb3ix/kWL226kd7T7fdp1qcAkruT?=
 =?us-ascii?Q?1v0OUScOu+3H9jzxiujGPux8wtycqNDXs3lZcSn6/lFO8PY20KNNslB/G1Vo?=
 =?us-ascii?Q?nTUYSflibbto3v7H+ZCicZyGgjioUwe2LbgN4kVTDjZI2FHKi481FnQfiZCC?=
 =?us-ascii?Q?5TT+Qyi5ZpFEqqfO+yxVIezHjtS1lN+63BbWoLpP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc36491-8ea8-4287-4ecf-08dc15f986b8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:41:03.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3uKmk1oZbZ8NDMj2a4Z/x072dEUACMzUR1yIEo3ddZUPH1dFQfBO5puws2dAukf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:19PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Introduce "pud_t pud" in the function, so the code won't dereference *pudp
> multiple time.  Not only because that looks less straightforward, but also
> because if the dereference really happened, it's not clear whether there
> can be race to see different *pudp values if it's being modified at the
> same time.
> 
> Acked-by: James Houghton <jthoughton@google.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

I think we have several more case like this, and I ceratinly agree
code should not access a READ_ONCE variable more than once :(

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
