Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBBC82DEAE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 18:57:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g8XLuXjz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDKbG6SJfz3cYQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 04:56:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g8XLuXjz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.100.167.202; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2202.outbound.protection.outlook.com [52.100.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDKZR4k9Cz3cW4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 04:56:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCh6rWp01bhSFPejo3htExxH0I5fHdA5CPY9vaBmTgdQE005aPleu/RoMOcBw2wQqpfBo3wMyhBH8iCX5Q+ELTYrWDFw5eopGjF0q84v3eIY+U8IifIHvtRZlOyDvZBr2j3hK+mwcKQdc+S+YdbKfaXVH3jxMaCo2vUf55HW+T8RpuUxJc7RJyJMZTaV0rtgjlNzxLmu0A+cBVM2BGdUK0xINl9bEF7But6zFfbbQJ0JRXYj/IAiLch8rn+wuHg5YtGxyeKzKLLHdOauVmz4BKzzI193mHHqja5WNb0W6sYEBy0gkVZ5mdferEl1mbl7Vx2haNZb32gv9PQ6w96pXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8q96str2aPf/5pwnpg4PIu/CK/fACXHd0QW+uHOEp8=;
 b=QE2zvT2HTKdNvbEEkw69kXU9ZqE3cxGc+f/oEmrMGCbeXLMj4eLTHio/WhEyWEkk0VPq9OWI0eikEPYxUkeefQ092mj28fNXg7Hy+ehjvVPyBxrwmOXmnwxCWJPh7zMRdjyCg3j762Sr8I5KMHZt0EqVUyPYoEnSwfVBlaH0eVtx4qMylW78x0iguN2FFULPevqHfhAhAu7bR7osU1H48WuhVrA0a2JQO824Yp8k8cwLpAcFyzCRRQbbi9ud8UzH6GN1OtcaNbgLIQyexap0OhQ/jO0UmxqCO3Rx0wQVnoV7rCiOn0iKanQusE0Ysu+lY6C7/r8AcROXm81WeGYeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8q96str2aPf/5pwnpg4PIu/CK/fACXHd0QW+uHOEp8=;
 b=g8XLuXjz1VUaPY4ZaYTRF1/sgIcKWtLKMgm3HMBzH6M8heMg4PIll1JMbFd6qrN1o+ZMa3U223Vs53inFQFTRI1YLtB7hz6Wpeq24dNh0bTYT61pbDwFlvJ7p7UdZi72NoSllzAnSOiPTGe1oiNY0kYpWEGn/6IE3mU2/0rOb+MyFk/bsqg5c9V0Tvjao9arnCxfBH72WvO02PnZvDStnlCdkhuocrI3OEAVy20Y2fRymkAXOdrQu+Mxv09ILHXl7/bMMGYaF968ehA+O14Our7H0OQ/eQuErmQTJnpqS531PhtHbawI04CGN/kavEUKRXUG4dSWUAb4Kgm9vzkh7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 17:55:52 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 17:55:52 +0000
Date: Mon, 15 Jan 2024 13:55:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <20240115175551.GP734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-4-peterx@redhat.com>
X-ClientProxiedBy: BL0PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:207:3c::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CO6PR12MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc418c7-27bc-45f4-d373-08dc15f336f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?6EwXuVnxypkajaNAvflpMvIrPYubScGRMtYblECVziYWpR4HqHIGzSgXOD0Y?=
 =?us-ascii?Q?aW/RBzUOlP1UAk3S+W8D8NIK9iHUO5T+8/hUal04KGzXyo+m09RCOs8Tspa9?=
 =?us-ascii?Q?AIorjrDFsIbdN1+bnigfUQ/TLNutC6F9jH65+2zBEKPqS8tIbYd5F7BwJ5ox?=
 =?us-ascii?Q?pravSrYjRO13oFGHTs189+r9XMnPW1rX7UnB8kRRRbN36Zg0aGLpq8h6lbun?=
 =?us-ascii?Q?7pztQJR3GMfugnH4nf0bmcp6kEt1GGX8aUsu12J6Ey4ppAlHftAz3EEpnDr8?=
 =?us-ascii?Q?6In1NCkGNDBC1MGsj2g7+/sG2+UQVeAC2AO6X544kHwXONq9GQGQrpPyRN31?=
 =?us-ascii?Q?EoPBPulG5FVgsjNLBx/mo3b0WO9wbuVZI9+hc0qqG/8LcfeSPwZnvsZZq0ZA?=
 =?us-ascii?Q?ZkXd37Hp1yZe+MW9fRCLS1ZL1T/4lEdhuzJIWmqUQoJ2ImubgL4LYlPaLzC3?=
 =?us-ascii?Q?pZrwx6wFzNCRPgSfPW3En7qHcuxOxI5LUXNFb5ElRxmPPH1aUhSd9Cgsjuzg?=
 =?us-ascii?Q?Yb1TDAURUh5wYd9YHSbzIGN4baz5TbVa+HWqWQym/D46rLnwCuXmv8/joRZM?=
 =?us-ascii?Q?0Z/liuUeu/B6sZpGM0zMbNmtzQ2Z2jnClo59ayIYt3OjyqCk4a1NHaXiJeiA?=
 =?us-ascii?Q?ztjftFIXCReNwEWhVa7SJ8xlTc6lKgrmz79UILcqKRGqVL2yUTn4juhan80V?=
 =?us-ascii?Q?vMPiLqsWsKvONLLpOVRsGvEABynX5iuaU6NlLY7SZhUtye8aRoUUk6fVDOgx?=
 =?us-ascii?Q?6TZseHtIKdvYlup8Ng0YhMvpLUsciOX3FUPlcuGfdc0ZAI8vYYUFamF5Dsty?=
 =?us-ascii?Q?nqYuxZDW8nfjWDfSjWkIljz4LudDmj5lCbTUlTpUbqiuwfr/zJOzAjc60gcN?=
 =?us-ascii?Q?+oSxnvuJA3G44URCc4zK5O1zJOTELj1M4Nx1tfxPfG+W1OrbdW0KTLBb2zyM?=
 =?us-ascii?Q?PqExk+ojyn5CxiKGRqnqpS4XQXQLCHa0F1/tgYidCx28NA/XA5x4idzifCVI?=
 =?us-ascii?Q?m7QMwT18QabULgxt65X25uviVw=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(38100700002)(36756003)(86362001)(1076003)(83380400001)(41300700001)(6512007)(66946007)(54906003)(6506007)(316002)(2616005)(6916009)(66556008)(6486002)(66476007)(26005)(478600001)(33656002)(2906002)(5660300002)(7416002)(4326008)(8936002)(8676002)(27376004)(41533002);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Y0Mnz+FeeoVW5CGXwQ/NvcLQVPo5bEBhWaviH9wkGZXMZ7N3lD5fBZdbxVqA?=
 =?us-ascii?Q?ApU9YnpP/RgZbsQxrWPI4JDZ/ipQLzQ59ll2C2yAYB9ii7hUUNMMZazQjAP9?=
 =?us-ascii?Q?fzr1c21hr9hASew3UtfqwCVVS3t81HPNbLn2+EFRZAPh3bnS/Jomun8RAOeR?=
 =?us-ascii?Q?48lEND0KaSIZxw3j/0AfVolKx9NHGybZ6WXI1N/Tui8MBG5Rr28Ick/5pCYq?=
 =?us-ascii?Q?Cx95ukqsQPPvlQNpZtDxU3Iaz8E5VRj2fpy8eAsRLE6Ylpb/Pd/Z2u5HhYCX?=
 =?us-ascii?Q?+ffuddCgXPj/eR4iMckQVcZxvyLPjFPxTMCQIfCJdKml/PEAkAPFzvhGGKRv?=
 =?us-ascii?Q?xDx4Ke4wu1fZqXAolbj2Bh+1v+4JhgIsW0QXj7KRT19W8OiVZc5H1A7yBGHb?=
 =?us-ascii?Q?J7SUt89BU2xa6/PSm1R8nk+kuDermiwPvU/d2arz/uvdJEiZkwnHXwAEtaXv?=
 =?us-ascii?Q?Ax4tVgcgN0u/1bUzljIJfRiCy94Kep+yiUy/tGmHnfCSRp25DIUqLXsTW9iq?=
 =?us-ascii?Q?RgSU9qKQtdub6Qt6PKQgGN+t21fz6ON8W0N4APxrJuI8gllS5FMcdE3EzxJC?=
 =?us-ascii?Q?OMcIRlsK1xY6Rynquq2/rTbGt/z16O/rdHu71p0emKVHGOpHzH0DKmJuICKw?=
 =?us-ascii?Q?vuaYPm/1SB9bAL6vRR6cBKQTiSWuFbmdpnpYO44OFoPxEsoclSzPtAYrmun1?=
 =?us-ascii?Q?d6qHgg3yUw/+H0qcomBoyucTFgABul51xulQa+NJ0+t85O11beoDc9Z5OISV?=
 =?us-ascii?Q?7y8Bb3eQJRKSH4SHJ3VjANQf4kblMDC9vHEkLUWt+gv7rUOUD1QhEtc0lzIV?=
 =?us-ascii?Q?7K+H2xSEZBSYkwl+ENG8B6UtL72muwsoiUH2CavWT9bX9r8mI9mflP8Lbq8D?=
 =?us-ascii?Q?LS9xVawTDpLbznNGNMd0FoJiQjvC7/jwm/ZfI4FRkLPgAiIzTpyA6GjPYioN?=
 =?us-ascii?Q?yZicqh4Q26WNAu391jR1ZqUXZ0eiKuuv9sxVhwIdqP8DCbSXuaOPIKVZBvWs?=
 =?us-ascii?Q?GAbH1onR4BY0U2fyRBOl5z3KN6d3h4xCI+ehz7izyVc2SWTK1KYJN2tKFr7N?=
 =?us-ascii?Q?4iOxW8CsxwYms4+5ftjVNbymlnZyRgZCZVIqq9Oe2PaWxaT4ABsAkXcd/iOW?=
 =?us-ascii?Q?5Wg/MOhYVvqGpJy2P8r1QxtYJZ8/UeYUIDJhAkwMTobMa2OHGFmHsG2cAH64?=
 =?us-ascii?Q?FaTiAwOvwSjHTZkzfbnnJIPfPeCfyxt4z45Gs9+JsdZZOluo8qRE13gQYyK2?=
 =?us-ascii?Q?WHQJSv12nSCMQMGdW74qKYS8SkaE+bbRE+svZP+9gyo8D3yNhLGrg8Ye1q/U?=
 =?us-ascii?Q?9I89z6DgFJfqL6AINDPQKLzsLLSzSzUPFnsS8zbL+NsC9V2hpRUF/GDzTzAH?=
 =?us-ascii?Q?zU5hMEkqmraZzXEGH0iraSZEyI6o0+VNj7bdS1tMUvIF7esEQ37lpFwFe/G1?=
 =?us-ascii?Q?9vder69Oa/OkbOGmJlxEFOR7NDR71+rbG4Om5rfXnKkYCJIT7VVXN6dBKF4v?=
 =?us-ascii?Q?FvhukTLNEoOPQSgTMNgwBGw8zycrhgQDPx7Cxk8AMbyRBKAuFEDJ8Mm4AF+q?=
 =?us-ascii?Q?Vy6XczWgs6FWDLjdVwwz9Az7hzWwx/8qZIKp+/13?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc418c7-27bc-45f4-d373-08dc15f336f2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 17:55:52.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/Usag42TfUXXXKvAA8ETsQfL0dzgmbBHZjxdZyFonQ7KwBgccdBmaU19g4uJrj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
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

On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> can be a helpful helper if we want to merge more THP and hugetlb code
> paths.  Make it a generic default implementation, only exist when
> CONFIG_MMU.  Arch can overwrite it by defining its own version.
> 
> For example, ARM's pgtable-2level.h defines it to always return false.
> 
> Keep the macro declared with all config, it should be optimized to a false
> anyway if !THP && !HUGETLB.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/pgtable.h | 4 ++++
>  mm/gup.c                | 3 +--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 466cf477551a..2b42e95a4e3a 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
>  #endif /* pmd_write */
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +#ifndef pmd_thp_or_huge
> +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> +#endif

Why not just use pmd_leaf() ?

This GUP case seems to me exactly like what pmd_leaf() should really
do and be used for..

eg x86 does:

#define pmd_leaf	pmd_large
static inline int pmd_large(pmd_t pte)
	return pmd_flags(pte) & _PAGE_PSE;

static inline int pmd_trans_huge(pmd_t pmd)
	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;

int pmd_huge(pmd_t pmd)
        return !pmd_none(pmd) &&
                (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;

I spot checked a couple arches and it looks like it holds up.

Further, it looks to me like this site in GUP is the only core code
caller..

So, I'd suggest a small series to go arch by arch and convert the arch
to use pmd_huge() == pmd_leaf(). Then retire pmd_huge() as a public
API.

> diff --git a/mm/gup.c b/mm/gup.c
> index df83182ec72d..eebae70d2465 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
>  		if (!pmd_present(pmd))
>  			return 0;
>  
> -		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> -			     pmd_devmap(pmd))) {
> +		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
>  			/* See gup_pte_range() */
>  			if (pmd_protnone(pmd))
>  				return 0;

And the devmap thing here doesn't make any sense either. The arch
should ensure that pmd_devmap() implies pmd_leaf(). Since devmap is a
purely SW construct it almost certainly does already anyhow.

Jason
