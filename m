Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8BA886C0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 13:28:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QFSOm195;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1M7f2Kpgz3vfR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 23:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QFSOm195;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::601; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1M6s63V8z3vY7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 23:28:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q49dTe4La7gxK188WxsQlPlXXlFB+t2Ei4EX8Pja0ZSajMHt9lv2rdMdAUHcH5FK1mpE9sYO8UhhO6lfyPbp4aCEOYFTEVP501qDRHuWS/+b0nA9nMUYRfN9olSa5GhU7rJ7Xs/GbtZfb3+brnScDUOS140cHNH/+dVCqhjKW4fZv4cw9X/R1kGe6swjYA0cnbtUsg8gC4KXfNn9v4HBIFZiwf2fJYoKz10wqIKTgUXk86uuX4fFhati6pnSn4MB8oCA8W9lV07Y/glCNiB6G+ZoP31pbpiiBwx77XjXYCiCjYAvcaEyh2hdUM11W0MOmUbXEA2D+FQhhXYoLAiJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLP5IavJX+IlzQD8n3W+txWFsjfXaPYljNt/Ql0q954=;
 b=WhYd4bYq1p8M57LBbxSS0lbvwCT4T0gHwEMnKE3ZxsqMoyMMR9DCGCsQHBdPFGh8zZoCdYwRbyMchiSljMQuJ8AD77wg4mh9Hs/X7yhfGAiqZ7kvKjJBtMYXM8IvplVWgDFqzAe0nBnmzWbZUouu11v08RsPh7kpwKqGyQMrdCQ2HxrMlDww7ZtlQ92hywTJ6ROeG7IC6Kx3UrfvomHzNK+zUB+6Nz64gKY/vH2KhvF+gW/x66EFvushswRBXVF7RsSm5BRpw4A01Wx0XNZSjNELazqalAcTG2p6JXM3bG0scTh5XiQr7awal0vdBWK0Rm2qA7uisWeV3aQ2yl/Dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLP5IavJX+IlzQD8n3W+txWFsjfXaPYljNt/Ql0q954=;
 b=QFSOm195i60siWq0uPSaWWwtwUASdKvDI/a8wjFNhR7Yv9vBXPxP6gLaLdAb002VFrjehVWKado2H6zggDOhr5RTN+ZPFgHqfbo4UbQ+IBwGcEzaGT318dlJh6GS+FpdTj9A/6y1iepb/RfdRhm2d/KazaVW3Qp1JIrgZfjP6fM5vKdUpQ0eqoPSqi3zBXC/a8Bwd751JFh5aQa9paBO1N9xOCOsI0rkxiLibUUCRe7VSZlGPKxiP/kbSUh4A43Xg5LawZVMGOnnB98Rta3A62vfzkcx4hcfGXxnGi+M5GYx8ZSkEP7hX2BqgIGOK02bl+KHaBLEuZjl1aAoKWd3pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 12:27:43 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.030; Fri, 22 Mar 2024
 12:27:43 +0000
Date: Fri, 22 Mar 2024 09:27:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 04/12] mm: Introduce vma_pgtable_walk_{begin|end}()
Message-ID: <20240322122742.GG159172@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-5-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321220802.679544-5-peterx@redhat.com>
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: e35b9ba9-15a3-4c2e-2fb6-08dc4a6b7941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uUTVg+zadAnrs1WOaMSAdIbDkyXAToFUVEh0sYHhV3+TMx4qlvjSWpbEGd9KqWC9gqZb3opoBmiJHDBaNiNHz7+tC9KC1POieyPQClLNlq9UUtKOPX9QmsfjybgPj3Li+sOH9AGPl/3KFX1R8Wxnb1YcmFKSDCchnYqrcKggAeB6i6mEcx5bHugzYE2TjAPLh2farljX1vw+ZGkI+rgz8jL4olCdltv8TDMEn72TeHTKfi0yRgHcCcDBDQK8B63w7ch1rccE6lsWqpM4kFr6fOZnnVsyXbb1CRw/s/X5tAAwfRlsAeUJaN7T1krrXnLWKiueSQXNwe/eosktwcHwoBzKAyyd2T5VwMhFt735Gi17lDQPQmB/vB1A92jz3j9KVqNNsVKiRPWus92ZXdxSif9t9inX2t/mylkGLezDWDX+Glya3I1awNr0BELGC+LQJGEdsBFOCCFWK7DYXYXuIst2IfVg5+qyWZ5vaxodNrBLoM7szJzza6edaYCVjYGJ2x+ir1JF7K855w+2RKh0hSPQcBb9EdMsyRtEcWXUg2EHCqpXs30Id46ajc7OF2TsKWJtMBrUR/QkQllGZoafaBt8e/gtipmluIsRNxdG0Y6/vclFAG1Bqkf2HwE3AACWGClKuUFKAL88zGCu0OAVHtZosIm8dWK1iiRYpJJj4qI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TiXNQf8IkW6SUIzBF/By0DedAURWnwZ5nhqAcF4o+nu9uxsp2uQRIbp9oLIG?=
 =?us-ascii?Q?LO4+f/y4TyxCu2i6OWPr3maJmzQAUMw2KwFasvhewC3YA09bTcR02RCLpbWc?=
 =?us-ascii?Q?9PkM7F/nmDwbhoCBHQ3HHbvJ4ev7sqyZ3zzG5VTEdTe985SHFdch7XQnE6Sk?=
 =?us-ascii?Q?xEJaoguxwoIqcOyDCtP8nYKiEEYBQ+nVdh/lhdDjIehjR+zL+TAi/YDYCRbs?=
 =?us-ascii?Q?G0eZpKAZJQPDs/uIP1Ti4BVzl5uOmullFxcLKHbyXdsfJo3QTa0O2qv3nCfM?=
 =?us-ascii?Q?klxGCfXkvfte+516zRg4T+bJ/rvcHG65ZHxxm1RFpPB+i/lAOxUn13IdqiN4?=
 =?us-ascii?Q?Ao7GFAnLhinIMAlEdwyG6bc54uKl6jnYQNeCg0+5RIa1UiXLlR1ZaRgaAlFn?=
 =?us-ascii?Q?UPy2IbLqHdqAAtifzC/etMtFcSbVQbVQBxDOMBEeLEnbRbdY0aYIWPntFjRg?=
 =?us-ascii?Q?gjRuOxEfotSwfztPdlqtny49g+LSgdQWWAAiLJk13gmjxMqiiSqgFXsPwu4Y?=
 =?us-ascii?Q?+zk+eqHMQZh6mEArZajlXRJw1GQgSFPVAMjlKPGJriPNr2OzbFnEWlEjocEI?=
 =?us-ascii?Q?2fIslgl5P2As5tyaR7cd6q4+zbmRO1uTs8yW0YretBX1aU1wUYTo17Zagc6W?=
 =?us-ascii?Q?k1jTxVfSnN5TY/HdD8k48AYvADxI0MKGkY++YvuL6bc8d3rVaEIld7qIQlDD?=
 =?us-ascii?Q?RpzKsnVpdjaRflhsLkaBxGPX8MU8DslVzasqTOdDR87SGce+TF4v/Oxeh28p?=
 =?us-ascii?Q?SvuuhV3O5OSjibHGhDOKXj24LqJzJ5GI7KSSEqEUYyi7L0m9ezzOpL+WPL1Q?=
 =?us-ascii?Q?5UzXGCKm8nPI2CxgmjefIaTXeIm1DQWZRRas3OnZgsCuwVQ61baDvYzgS0kT?=
 =?us-ascii?Q?0SGbvq0NvXkdW5aWOZWb1Q1Yy0gotmIYGeCs6cG4a3wU/InW26YFcTOefRMm?=
 =?us-ascii?Q?566m2vTlW0xPeTOeyx+CZw3gGocQLoPtTKDfUxY88NNJp/k9h+9MoQ+k+wwM?=
 =?us-ascii?Q?R//8kvK3+DLVtkXKSL2qhbjRsww662D8d5usNUhgmdrPyWc3SNqpxi37Tohh?=
 =?us-ascii?Q?i/OWZQmeKHipnvHohCX0FkQtqZOEH2EkD4I0Q+osMoKMaWE+CsrYo/ZIYh03?=
 =?us-ascii?Q?L1LF47QEKhTCnW1YVEWZo55c07i4Z7olq9Zrg+H3TSnutYaIyp1E1Vpc9YGJ?=
 =?us-ascii?Q?2dvMwMA68AltK1sGcnZadc+11RmUwnnR8pitRsQdTGZPls7t4xYNpHxLxtnz?=
 =?us-ascii?Q?cvqX126mlNJS7ylwq4gZ95g5LPcoaho1x1dxajDtAUSV/N75UoTjVCG8aIyH?=
 =?us-ascii?Q?CJq+eThZY1+WyZDvYmAQJq4GnE5CWJLShfalC001XaeZbveK2mqzqlx6Ni73?=
 =?us-ascii?Q?bPy/KuAEQmFXasdnYyYeTWHiEnfYi+pT29W5Mcp2HZ+jsPkzFMpnl3+nDjbq?=
 =?us-ascii?Q?olsObf0wDDIXLAcIHHDRSbpchp4MZofGY4gFcrrrNqI2lGQLrOiOGxbMewvD?=
 =?us-ascii?Q?kYeSNLa9+YCCSdv2QUft64cm+11pvmr1pg6wqGnHp4Ubr8Jw3MNmU7l0sG4p?=
 =?us-ascii?Q?HZr1ZMEN7uz64sjl4L712E2FwRxiFV9n1N1Me13r?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35b9ba9-15a3-4c2e-2fb6-08dc4a6b7941
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 12:27:43.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NOlXBnQsmFnslfD5ANkoAQzGQ7kWYprS8udj0FR21j5uvfOGSymvdY6A55LfaLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 21, 2024 at 06:07:54PM -0400, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Introduce per-vma begin()/end() helpers for pgtable walks.  This is a
> preparation work to merge hugetlb pgtable walkers with generic mm.
> 
> The helpers need to be called before and after a pgtable walk, will start
> to be needed if the pgtable walker code supports hugetlb pages.  It's a
> hook point for any type of VMA, but for now only hugetlb uses it to
> stablize the pgtable pages from getting away (due to possible pmd
> unsharing).
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/mm.h |  3 +++
>  mm/memory.c        | 12 ++++++++++++
>  2 files changed, 15 insertions(+)

is_vm_hugetlb_page(vma) seems weirdly named. Regardless

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
