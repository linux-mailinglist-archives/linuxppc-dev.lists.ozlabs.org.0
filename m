Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC2733167
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 14:39:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ceBbog0E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjJdT3HLlz3bf6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 22:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ceBbog0E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::609; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjJcX3kz9z3072
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 22:38:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbEipcviY9zGC0ab2wKX0TynH5hnPwh7Zzgp297OD8mpBKjqEAQevQ7v7R7ySMPRWJ2YkEGs+oWogWO8kjser9lsyVrFbIO5/xB9VFw4Vmr3rT36GwHAQgbmmg8P0I03kL4xjA9/5/dw3ikiHi0rB2ZORSfZRWdDFyyQDvXce/5SDxmRN82ApjEw61jvy41ZkP5KAONThUOI6udozUn6pMgjIOz5f78j1ya+R7H8EPQPQYol2ICFESylNYVtun7I7794EMoqUvyrVZhWkGf2af1IdYM4EsgeDVQMiJ55WNO71a+lp8J5WjdxZsA9Js3XN959l14Tr9Hz/aZTp/nKnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBR3YGss3cI0UzYEflUIczDUB09k7UkNH7V/zqmf6Yg=;
 b=cjWEL+XYktzuLL44i0EyitI6dfUhZOf77T+tZ860X+6amPwhF2u7r08Mo/2teW589MdkU57ssBm+N5YoGr61g/+90C0HkPylyOOSIUsmOcc2iPBOoMOO1ep4sEs5opNKm/HGP39vu92XeeGe5s8+KvTUiNJzLxAfspku9QsUdoLlb3WnWIbHsWtDBQgIOx4kKuTawJKdUpeXHCX+BbUGeVAiBszmxBB6MYtTWP/scuxElJMqjW8Wrx5p7gzQsyvzPS7Uc+f8eXr6wbIHlNgLdq/s8wxpTO/Jpw0erqhRMIJ4izGwlAlG/rYtV+kUuE6A82mNNKLAjJyQdllzrl9rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBR3YGss3cI0UzYEflUIczDUB09k7UkNH7V/zqmf6Yg=;
 b=ceBbog0E+AeI1CoNtHw0AldT8zR8BRFnDlIuDqAN3xf70U9Ys3W2Pf7Ii+9xhaSlCUzUhSXokfRZ249xX1bc5OBWaxYpt+SNkl3jc3an6d38Pw7TN/5uiPPaRQ+WI7lVWNfQQqf9KRjxEuNkihTjnCiNLiGb4ulyCx1pJZv3GmH9k8lYnl6StluaDiE6CFuc4ZAyBf8D5JmssK5lwdOp7mN8UpD/WycIYjYV/p0PsdU3dypOkVqdFSPqcj+ijiM3g7diavbnhQA+JsJMWgeO1RHO84tNvZx1+0N4IrZYygDLIPCEdX+yE5yJIjowQDIuGP7GTae86vPGu3IBW+Dluw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 12:38:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 12:38:28 +0000
Date: Fri, 16 Jun 2023 09:38:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
Message-ID: <ZIxXw9ERkYv+ipdd@nvidia.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-5-vishal.moola@gmail.com>
X-ClientProxiedBy: BL0PR0102CA0025.prod.exchangelabs.com
 (2603:10b6:207:18::38) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 8506705d-9a30-4258-c03b-08db6e6695d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A1HBD5wD+23hljrt/BZDQ+Nq0kQdQCxvg+5QYwtqH0PvCuU0t+WZTcNeWVcPSeddfw7FwpKwPSrzyhfwIFb4hbe3Dduz5Td9kFUULTputVDH5dop9R47s7pwKtPLRnpWid3osDc+RoVSBxi84loqCiol4HKOOCUThtivw5p+7V305zg163JS80jbz6Nbq33o3bjiVsMdxEeAapbh4c4h3rPAzTJikGnn3Wrm/TEz6VRCcF3jf+jXw7+/vok0zU4ANfZeCsKt01GrQj2ezq8NXwRdrdT55uUbXCy+jb6ciQj1ACmXOz+HWEnpi10Hl431bujZ1n/wtxXeujt1xHRxMNCZYEg7cH4WHt0EcO6iSdWRE7I4KpFSC7sb/Egaf0o+sloQMWQ+cWXh/eDpR7gTC7SdCAGWsDSa6eNBjXFOT1GkV5M9Li8KLsT99nJhh2gBXNIjDoYLUG+B2bEw0S6dZSNuVgytIQDnSS0sALAJwdZQkUcoU0XJYlraVVs1V3XsZmbJXu67VfObirhEb2VdePBKCG0xTu/hVG5KZ3pK88IYnu342H9g+3Tw41/InV9v8wYuAqUSipnmQL/CDErDlnXvLwsGeSujy5kXXpRKMihuCi/JvMsMVHcgkoDKieULI/y91b+0usAD19Wh6QpfmA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(5660300002)(38100700002)(186003)(2616005)(83380400001)(2906002)(6506007)(6512007)(7416002)(478600001)(26005)(6916009)(66946007)(316002)(66476007)(6486002)(66556008)(8936002)(8676002)(41300700001)(86362001)(4326008)(36756003)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/Irqnl8o7kuP7oMmsP7PZvxKq7x2MmLRtDR+Vgt5CkkvQCJm2lPuWCVSvzo6?=
 =?us-ascii?Q?EbSIh+gkp9UQMFnOC7TLMnZfJ9XORFM9u3h+C9G9T174M+Cr6B7Q1q8D0YQ6?=
 =?us-ascii?Q?ucDM/oEkFCVR7DZVQxsSWRtKh0Pys7OtL9Rexlr+CSROsJqX4p2u/c19b1kH?=
 =?us-ascii?Q?7VERJjIDRwtpfgFovjP95eL1HQMOHpJjcVt5I0hFmKBR6vC4chQRWwSgtDe0?=
 =?us-ascii?Q?GAhbRzQTgrncE/F2yKzxlod6TFgXF4+6kg8XzzQgHbpaHSWU1p+Fu9cdbcO/?=
 =?us-ascii?Q?ppcDma4W0nRi5KmTeClGmwb9gYdpdpaALHBS86rfBHHUjfLkon+4CaVr7L63?=
 =?us-ascii?Q?T+xiQqf58weB/ZJ7hC5aY/Rj3rn58pbOzXMFWjxRKBBhQKAQlIWUOz4q8aQ5?=
 =?us-ascii?Q?uMf+69CwroesnC4uK4bdIJKkwYB5KYLnxUmH5lceQTyX9US/wb04E9C8WmO8?=
 =?us-ascii?Q?d2Igorxe7kyhchQ3YoAifJowzDausi3w9XkgwCygcId7CuV+D0NG3krnXG7+?=
 =?us-ascii?Q?8OWJr0TlKxY8HY3CWB5cjoZprye1VkM6yKqK9TBC5O9nPQxAlfzlXA42zTy7?=
 =?us-ascii?Q?cib2mo2WMjA8Cn0XJU+92IsShh0d3LxuZNaC+H0Caosp9AcATityFkNmEVNF?=
 =?us-ascii?Q?IdqnRm5asjVXFUZ4MDlimjrs4X0NLD9ZB4R9EHQi3cpCJBq708reJGCRorjW?=
 =?us-ascii?Q?+g3+p3Cg2ZyoKdOCndqVgQ7WtZr+5t0AoCpWQ0xi8LbjevjEhI9Py3rbAVvj?=
 =?us-ascii?Q?6lWh9Fp7szpCvF8T0/3HPd2+wkCpQaGj+/yDF1dvHHrLdmgCSYo4wckaQxhR?=
 =?us-ascii?Q?2lsRQwZEMRbD44vineIy9pxCbfESFWeG5A6bSf3slk57ghdXAbu9CEoZ6jcl?=
 =?us-ascii?Q?OpDI7lobgYTPDBZFjM0h7oZS4CuSfpuR++xNUeCAgOsu8T7Ds8Dpluq8uX4n?=
 =?us-ascii?Q?9Jm8cg8Jt0WoIRtPGEW5i9Isit3cyifJ7dZyKhGLLfgm+M/UKz6XVfhQjsOV?=
 =?us-ascii?Q?8bpZrzwmFG9rscMg9MSDwoy1bxx5Pc/yufiRFf5kAEtL1caZM8GTILicpeHK?=
 =?us-ascii?Q?hrE/7mGA8DpvM+qLBSjUIhEleXhmYzoVneHhJGXUncswjykpaBi+xGVkmHit?=
 =?us-ascii?Q?7K1tbHXYmlELlYTqdOdrlfy5CchSvODQE3VEx7/8JKKEi6k9uC6hiN35VKMR?=
 =?us-ascii?Q?k1Ca8xzyUotdpcK4BfCwnuujpOE+bhKZah11psUhKDLIJ1DDQoBxsei6C7az?=
 =?us-ascii?Q?jl86JF6Os4p3oTZRz0Cfi2jfp1uFhCbJa7YVzR3xLNzT6odu8kpKHZcMbrnG?=
 =?us-ascii?Q?rJ0kVqPp/XW1F8JHCv4NKt446tO6B8lxGlfEi5hT4t0LWRMb8iWRvhR1QZLX?=
 =?us-ascii?Q?IjClfLE/su4iY/Uas0HpwhAycdwOaATK2/OlucyTwlJs+75NV4LmT4VuMAsY?=
 =?us-ascii?Q?E9DcShxP5bbFHq9wZ3maqkQMutw0YJhOZzXZqWTlQWq82e9gin9apVec6eCa?=
 =?us-ascii?Q?fUBpj9ANJGOGl3b8d06YR9CjL8EX8qzHHJLwYrwngykFvIeJwVnKPJWnrq2x?=
 =?us-ascii?Q?d1/tocPhkWuPEB6GZDs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8506705d-9a30-4258-c03b-08db6e6695d5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 12:38:28.6370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8WtUVEqEUr+4a6ARSihpj6oeN2X6Diaq/r9BANH+D4NwEndUZStIxp4szriDpA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 02:03:53PM -0700, Vishal Moola (Oracle) wrote:
> Currently, page table information is stored within struct page. As part
> of simplifying struct page, create struct ptdesc for page table
> information.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index c5a51481bbb9..330de96ebfd6 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>  #endif /* CONFIG_MMU */
>  
> +
> +/**
> + * struct ptdesc - Memory descriptor for page tables.
> + * @__page_flags: Same as page flags. Unused for page tables.
> + * @pt_list: List of used page tables. Used for s390 and x86.
> + * @_pt_pad_1: Padding that aliases with page's compound head.
> + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap only.
> + * @pt_mm: Used for x86 pgds.
> + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
> + * @ptl: Lock for the page table.
> + *
> + * This struct overlays struct page for now. Do not modify without a good
> + * understanding of the issues.
> + */
> +struct ptdesc {
> +	unsigned long __page_flags;
> +
> +	union {
> +		struct list_head pt_list;
> +		struct {
> +			unsigned long _pt_pad_1;
> +			pgtable_t pmd_huge_pte;
> +		};
> +	};
> +	unsigned long _pt_s390_gaddr;
> +
> +	union {
> +		struct mm_struct *pt_mm;
> +		atomic_t pt_frag_refcount;
> +	};
> +
> +#if ALLOC_SPLIT_PTLOCKS
> +	spinlock_t *ptl;
> +#else
> +	spinlock_t ptl;
> +#endif
> +};

I think you should include the memcg here too? It needs to be valid
for a ptdesc, even if we don't currently deref it through the ptdesc
type.

Also, do you see a way to someday put a 'struct rcu_head' into here?

Thanks,
Jason
