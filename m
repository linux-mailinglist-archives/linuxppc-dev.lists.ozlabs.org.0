Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF188A990
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:37:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YoNFR+zH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3JVl6pFRz3vcr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 03:37:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YoNFR+zH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3JTz4BXxz3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 03:36:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpsCSZ90xZNjBkQS/trKiE3LaenYIkmteRilzd9BMseJyJGX8+P3bYZO5M7shGDW2g0JzSf9sOY9OWjzPz/amjUauiyp1yr04Fz8u+KHCQ5ky3+mkmE7dE4QPYkjSSbxeoz+cbe6Qe5Z7WDsRq46708th/K4x120l2pNJArnAeC3GvfWYFM0jMAjKaQ+BOXy19OxYDlRhmTvT49cHmro1rhPBSRvh1xZwqgnZ+luNmHJ7DJQRlroY/5adbcQYUIP31eoUfP/lAECJuKNQomoplAolIKdNIDg0WpqdQpUGh5ZKrqv7rxavdgiQmoHU9Cf5Bwc0H5bsv4lDwgHLxE5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikoiBGJKfAsJdiAhoh6HvkqD850uNKqNw3T5uYcmyPA=;
 b=I0Qf9A+F4QyI5IrIIjOgCtf0R495a7Yy0Tu4Zi8qJ7psHRej9xGCKWY8IXVJx6Crrorq6VnTd7hbeZtbxQ+utNdRAlYzVkaDdoaspi57pEaUPxAfN9FEH1CIQzOXFF7QICVjjO1CNDQkTMd4yeEPQS5HBEPClTwIVX1YuRn/fuN0ID/WynkaAX5RL2D4sebln/+OYtRdEH6RO778vkU+1BuDDDSdHTmqgs/nEw+GhMfLPUM4Xc8W70SZ0CvhngL6w6ykNHlrCO+6dC634M5Z3JiJCueAdkaN8KUvzaZfDm6jqRas2LzruoLbzcbNzO9cTNFx9JHFoYQmzSxBvVUrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikoiBGJKfAsJdiAhoh6HvkqD850uNKqNw3T5uYcmyPA=;
 b=YoNFR+zH6x/92oQq/vJ0OhjsQ9ITY36kthC7X7sBVp8RuLwkPJTChh5vsPENto3/D+9d9IfoO+F6ju4xznB5wYVT1C/ghC6DTR5xsgotCb4rsFobWWWiHdqkucOeOL1p75SFli3Tj/wWW2vPPyl8Zkuu7xcV1skJ9hUw5Ln/xahjz6T0h7iSQowZsuqfgDypPsBffiE9YMCLrpfSaf2b9Qru65HTUTQQxpvrxXR5XwtNlMaEIl5SnKSOX6E2rGoyPQsWXRWD4mL6b3XeDqHHiHbbzCQi5qUa8mPepFmpfr4cwP6Vj0YmWGQzXouR8yARJHOFeiTey3+isZxe5MxWSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB8996.namprd12.prod.outlook.com (2603:10b6:610:170::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 16:36:01 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 16:36:00 +0000
Date: Mon, 25 Mar 2024 13:35:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 4/8] mm: Provide mm_struct and address to
 huge_ptep_get()
Message-ID: <20240325163559.GE6245@nvidia.com>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <1abe6cfaba2ad41a9deb705a4d3de8d1a9b6d5ca.1711377230.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1abe6cfaba2ad41a9deb705a4d3de8d1a9b6d5ca.1711377230.git.christophe.leroy@csgroup.eu>
X-ClientProxiedBy: BL6PEPF00013E09.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:6) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB8996:EE_
X-MS-Office365-Filtering-Correlation-Id: 2653e59f-23d5-41d9-8278-08dc4ce9a7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cS8WU2dgGDZlEL3imS/k3BTA7B1PFMHy20XUeC+oKHHXpJ3jXdQv4zzcBt7EGx7i1QmZtherjUA6nfmSXjIX+DTZIic20O9T8gc9vfFLOA2mjrEN759ntfqMWgeR92qBzHjAbYTYZ6O2yI/yQyGxOe/eii1sTgBW5lLA997b8wOUNgNFF3jaeQqJ8NveOkF3NZ3rLnGUp9xMAtEwmZg8xCbZuDis9KmtXEQg/J9ZOGg4oLayucMhSsgtuRj0ygqrZ2g+/8iLF0RJmdQazfOa86fjrrnAHqnqnBXLkfOxQHcSdd/YgdX8NSePRDKRFH/kOK02+xsOkFWEQOYA5slvsLNVUbu2/UzG26ilWpv9g1L1CKyfQ0XnUmZ27Hq0OJzmldM/dxs1l8j/TgTysYL2YcZgrGwfzOY4vA0vKC+uaviljt9HuI7GCgyaRYvHKrKBJdw8GLNO3F26JXUfcaHro0fJMlKTupNizktAFeGBUwA5CnQvHHpDNBoeL4JUx6gC0opC7aYwbZAfiWbaGDAgMR6q3ZrPM0foCAksRLJAoIKPsypMZfGwSuUPS4+s2qJYzc7eP7wbtzY6jjAr5Ya2ix04e9cm7W22x74plOLHc95yOEsls8AB6r+C7ugnC9x2MNgsjMODfkegv95BQOZKgQFLN+R6o1M7ZnMJhGW/JaI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3BEzecunK9DG/KyC+6nFrRcurAIMud31+gEOk/OuXik3aP3Fuf+h4HGdge5m?=
 =?us-ascii?Q?NC/ISLVBKrVsnFrKQxefSgXjxAf/8znYWeY9fYHs1CkXPbK+OevBd87EyRz4?=
 =?us-ascii?Q?dRclxTTh4+Vx7NGH4TqrEwnkyb+l0EYjaQZShpY9XyAssuO/lwz70EA8pg0j?=
 =?us-ascii?Q?35WBKnqc7TXmwtFussqBg+k7DfI+/wcArXDn5U0GYVKY6kA4PymJru5/pYuj?=
 =?us-ascii?Q?6hjiS3nwq6Ke770fdDagClHLB9+jZw3oNg95BLqJuTDPK8nA/noJOxZ4hiin?=
 =?us-ascii?Q?K5tFicbT0+18xgs7sQEEuoXNfGw0RfmKMic/jlsrRbzAwwK8Ingqx+b3Rlab?=
 =?us-ascii?Q?C5/lLK/htxNLZc3dytJbN3GlJO6zNPOEeA4jbFmD5qnvvCP6XR89EsCCaTBI?=
 =?us-ascii?Q?g+7qT2eCpYCYdB4Cg8WiEWBsUwedEray3g8pA3z7XCsphvK9VKU5QvgmzJcJ?=
 =?us-ascii?Q?ucEs2sYZnUWAMYX329bZa5bR2SkqooGAremH6WvHiNm4p3MC2jJnyHP5icg0?=
 =?us-ascii?Q?Sj2yKELmrarw4hMVeCZaNGMEuG96cBVva78HvHTv4PlN3ksBBphrh6OiDlqx?=
 =?us-ascii?Q?e7dkDSRZi0E+3eWt6ZtJeqxveRQ2/fLhNyFLal9ppo75v6LK9F4+O1xl9wXO?=
 =?us-ascii?Q?JigkiqCk44XDnz9Xo5hM5D6zeHS5jEGxpe8Q3MN4QxQ3OfqB+7Bfek/Q5XlT?=
 =?us-ascii?Q?qi1CxqZtdqSuUyD6WUXQ9Fkn4IXc2a6BF3SjyULVqL5DbRVs5oRKxVKVT16W?=
 =?us-ascii?Q?TjxWr5AHoGgw65HnZx5cVJeKNEwxppuXQ55xEzoKLRaOfyR8519oTOo/1mi6?=
 =?us-ascii?Q?to1P74ZDGe8fkYXq6C83aLLc3tMMRVNssFyEp18xxYG3YCVNtEWthCe/3miN?=
 =?us-ascii?Q?wcEdwRe/us0kLiHlnmiz+vJDfSbH91WDmT6ruVd1U5ocUqnU21+ilNnQ8JLR?=
 =?us-ascii?Q?GzSmEuLyxlg3+RQjHJdIKq4Z7//wpdRuOGL3u5WNhW4baN4wXuW927qH37Fg?=
 =?us-ascii?Q?Kv1k3v69atTDpCDjyOI/mgbZ2b+mZTOh7E/PrT6jF47rhezxKAyZ6xf39lka?=
 =?us-ascii?Q?IRFBtUlE/CQXy6B7ma57n4ErbrE/ElRbSyns4uRR4XV/J5GvSHB/+eQVI0ox?=
 =?us-ascii?Q?XidXpznqO7bXlaa8W1OdHFuz8UYMoYotBEjvi2Tk7ks2ahCe/UNVrGU/dxud?=
 =?us-ascii?Q?PzxlLYmkEFaxqLPPuyrlga9k0cJwXLMP/jdmN4waIWezk+Iq0VkRCyQMcvad?=
 =?us-ascii?Q?ymfYOwv5n6BXpRNVtgZXQTsYC1TCkO0WyJF6aRKjk/QiVr+V1zIsyAvd7ZGR?=
 =?us-ascii?Q?95zo6aWAIKpQ511POB4Ka3pHByGq0ZDkfgLQTxTL+etGA54e4b+i4ZHvS1+4?=
 =?us-ascii?Q?4GBrl9jlCAU3XERq6s7bGvNmbuKzzHXAIGWQNg5WPVhsarEbrzILMu9b4moi?=
 =?us-ascii?Q?APQUZICLJ1/sC76WFULWVdEnxxJUQhPQk6jX4sqzXnpii/98tU/VPcEDNIbD?=
 =?us-ascii?Q?CfQyRSpy9xLjh5+d+/ivvxj4zFD9z3fgm5TVIEiaqTwNSBDVr4ij/LEiWt23?=
 =?us-ascii?Q?+67AI+5G/iWZOA8TjDieY3OLeU0QVXuncDPL9/xA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2653e59f-23d5-41d9-8278-08dc4ce9a7c7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 16:36:00.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIsS7pdRXWdBcvGrjzdtO2NMuzTl5JiqFJ9OFSs1biOoUsAvtu2d+Mo55ArrNUDg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8996
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
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 03:55:57PM +0100, Christophe Leroy wrote:

>  arch/arm64/include/asm/hugetlb.h |  2 +-
>  fs/hugetlbfs/inode.c             |  2 +-
>  fs/proc/task_mmu.c               |  8 +++---
>  fs/userfaultfd.c                 |  2 +-
>  include/asm-generic/hugetlb.h    |  2 +-
>  include/linux/swapops.h          |  2 +-
>  mm/damon/vaddr.c                 |  6 ++---
>  mm/gup.c                         |  2 +-
>  mm/hmm.c                         |  2 +-
>  mm/hugetlb.c                     | 46 ++++++++++++++++----------------
>  mm/memory-failure.c              |  2 +-
>  mm/mempolicy.c                   |  2 +-
>  mm/migrate.c                     |  4 +--
>  mm/mincore.c                     |  2 +-
>  mm/userfaultfd.c                 |  2 +-
>  15 files changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/qarm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
> index 2ddc33d93b13..1af39a74e791 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -46,7 +46,7 @@ extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  			   pte_t *ptep, unsigned long sz);
>  #define __HAVE_ARCH_HUGE_PTEP_GET
> -extern pte_t huge_ptep_get(pte_t *ptep);
> +extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);

The header changed but not the implementation? This will need to do
riscv and s390 too.

Though, really, I think the right path is to work toward removing
huge_ptep_get() from the arch code..

riscv and arm are doing the same thing - propogating dirty/young bits
from the contig PTEs to the results. The core code can do this, maybe
with a ARCH #define opt in.

s390.. Ouchy - is this because hugetlb wants to pretend that every
level is encoded as a PTE so it takes the PGD and recodes the flags to
the PTE layout??

Jason
