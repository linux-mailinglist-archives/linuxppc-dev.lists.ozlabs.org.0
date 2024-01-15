Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA882E025
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:40:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rM3WbutY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDLYY6gSYz3vgZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:40:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rM3WbutY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::600; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDLXd1Q6Yz3cWx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 05:39:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imzlGlQTm0btr6w1mLOMaNgzyaPlxJwy1Fh/G9izKRklX16in1iAaBa9ZuULErbj/+FbjTpa9U9o/qmurZ6kTYc/P5oVMgUj4SlmNHIex8roS1qmNXF+rs2+1NwabTfgE448/Ik8F62sVy6K44G0Ipd1+bYV7F9MZvzevJDd4VwD0k6yUp7Bt3KcRuzOk8yPRDoFaLCMb4y369WsMTMdidL7zIN3yOpkH+9t1qqWXKwh8NdQwWamtFD2fImEgJntTo9vRiu7h0ocXgEg+3f+AN5T/dbzIcYghpRf9K8rkN81GST9OUjofy7gn9tKHY1eV8gPWmsFWlOSMIkK1MDQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8004MxhRL3TKScFMV6ePPk9H54PbBJPbofodelOtXmQ=;
 b=CKtaiek/AFUxo8rOWH9QXIwk68d03+PwQnmLBCrSSklJ8Y5FF9ekYKtgX36avlkUMwMgGnbFvnUFgwaNqphkeL5NZ7lHh0FAi51ZZbpfwp466V8pqLsxhVOuVGdwkyafqoS7B1wtsEH6mJ5++O3GdcVyDFAcw+opAx3BAa4xdSgxisHZbqIgq3tmDBdx6BqHn6XWa1ozEbUN6rjCnJ1JrMiKMnBY0GKQl+Xu0AHFULTf/ByjqBy0BbpXelgc281sSSrcwkAS6IcHdM9M2avSNg9ZT9+k5Ur8+gPKJFpCgmHBERSmknKPbalZwEMLKeRGVD4rJko9g0gJHa+d2J/Nxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8004MxhRL3TKScFMV6ePPk9H54PbBJPbofodelOtXmQ=;
 b=rM3WbutYeFEBUTOuBrkoDYfoVUWaoBDouLuaZHwjJQ1BZeDvfDCN9Cnow3RKZR2lBQZTdZSY8vGNpkUxQXHVo0dQs9vopn7hmgcvAHDr+nP1FM8JQlY+OR5DmlRPMLGVXvzSoZ1qMw7lj4penomdIsQw16kBRWqFpJpliEx7i4bqSvOUFmYACJ0qtYMXccCi4h8DFO2vO59cu5zLZIHq6CUeP+9wNAOH+elqX8GNfjmN0XxlZ6wMp7LluSUd3gpFyY3HGBfXB6StQGr+vEZI4ThABcXgO3JhYlwdie5LLtNMBeRUCEhl17YjOhGwnPYI/tI89J3PCeOXjRpyNtahHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 15 Jan
 2024 18:39:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 18:39:23 +0000
Date: Mon, 15 Jan 2024 14:39:22 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 08/13] mm/gup: Handle hugetlb for no_page_table()
Message-ID: <20240115183922.GT734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-9-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-9-peterx@redhat.com>
X-ClientProxiedBy: MN2PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:208:23e::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e166839-e24f-4c7f-77b3-08dc15f94b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	h8EQ/t7XBX2uyp0u9apG8ofggk3l1LHHgEQvYy39pa+DSmzPX9vZr4MKNZQP8Y1ZDofqs9kMAx1JMppKLirIXxrBAjKcQkgvc48MMIHFptIFK9G3Gf3QPq+/ScJtq40DGUzXhTq+nPwzVQtpPLUS7IIhXo4ygfOSwaPkBhWAvFPbR3j+cIFgy9HJLidl8b/JUQOukrmK6ZOd2UejiBlGUhVv31m+lmbwUE/RHRxkrDMxVYQ4jqf1YvqwOrs3WJNAiBS2zRfLMTECEc5V0EIH0+dRCr0zglApzYc/9cna0XsOMsq6IYO9XVmPdYCbJr8dZ0+5aGwKV/AZN7btNu4o6uumGyKnPdStx0e1G6iMa4yyWBLvtc3wpFbo/1hCWZRifu/ysfYl6zEQ4zCm6QxkjwHhWEjjFUwPIbUsgC7EICuGQ98sY4txmJ2fjg3au3VoXkp66SvyJf/WIkIh0ptkU1Xi9UNCy3i8D7hRlqOjHUudsLJbGy4ErXlokS1xz2OO0ZxGuIKf8tJwSokVvuRSFqvGxqYSOcXCTCNZ02RrFpduNhFSK11pbjZL4HigweXHuyfZE0fkBtu3lAsIi7t94k515abb+BAqhjYpM+kba6k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(38100700002)(316002)(33656002)(36756003)(41300700001)(2906002)(86362001)(54906003)(66476007)(66946007)(6486002)(66556008)(6506007)(5660300002)(6512007)(7416002)(4744005)(478600001)(6916009)(2616005)(83380400001)(26005)(1076003)(8676002)(8936002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BGBzhAMP69pXkMnACiS7hyqSwXoT8Nm9uT7HxZhc2breIBlYcIvmAuyDSb3S?=
 =?us-ascii?Q?OK/fN8pn9X56lZUuxJf9ssjzcwEm2OwQvw6v/nYfAqaAlRYNlhIpY8P8dyvf?=
 =?us-ascii?Q?Y1krZ0ZlpGIff3Zmkin0u2rDfqWW/B7acXU8BLRovSBvzQ3vpgJ0MfVFl0wC?=
 =?us-ascii?Q?agYtqDqJwLYbQNsOBXpH1DlkKKN6pnFwLxmQOIuBqlaa0VVwV94gcSxrQMsH?=
 =?us-ascii?Q?fceXpqecNDtlKLK6Oj0xOhMTw03+jhSSnxT/lcAf8JY8gGyyAx4s9N0PN8TB?=
 =?us-ascii?Q?MFxDXxCbmWQGBZ1lYs7qL1oowcU/Zwl8lGrbzYZTrDwz0kdJ4NoxHF94CBvz?=
 =?us-ascii?Q?g+0XWoxwOi9hcEkLlaTX1T/KgX5iaGycTFcBHI2EpdXYEawOqUm5n3ZAQwlN?=
 =?us-ascii?Q?7WyLFO9OA1xiujtQsZPxngPxl0mMUoDyFqu9N5IRj4pHx/O4osuRhO3mr1Fp?=
 =?us-ascii?Q?O68F4KECtPmMADw6+FpjrHC56LkK06q+fhB3OJzflGAK70AmRo7WYrkleAzL?=
 =?us-ascii?Q?Q8KAXEBtPJ9Vezg+RPd6Et7o54LkIXsiX1qVbydAY7F2rxL5k/5Q3Qdqzuik?=
 =?us-ascii?Q?d+8scxn4i63khPoCXvxpW2BnaENi+vQQjq5KkxgaA1yeLy09LjRuGPQu6Wki?=
 =?us-ascii?Q?hd0ur79/AX8BJKFQUZLr4UAtvvM5FcD7jc3VsTzeRNuLByYT/ekAZmX0jof4?=
 =?us-ascii?Q?a3A0pgs432DHjyRntLfO5UFlxwQAztrEQpUd1xm9+FyejllWx8kQgAI4JCTc?=
 =?us-ascii?Q?KkMF2zgN4xek6NGsel5/DmSwbbe9UMQ5tr3sF0g+24Gs4/irN43zkBlk4ID4?=
 =?us-ascii?Q?PjHBlGXfQKf92y3OTeiH4t/bwnlHi/1ipQ2X8v2N37MaQGSe7ZRF8byYtsNh?=
 =?us-ascii?Q?T4Vkyet6jTLz17uEVVvKGzGxp2Pfy8khkY9J+DrechqmNOl42bkYwpVYtSol?=
 =?us-ascii?Q?wDFt01cQ6+fvEb+c3zVmr8i4hHoHj217YkNgKz6IWectn/6LRnTjAZAgtdI6?=
 =?us-ascii?Q?YuPFV1uUp61vtKFaMRP+z661BU3sAITMf96NY2FEyhj44lIi5iliA/J0DvtC?=
 =?us-ascii?Q?nqmZ2ETIvFxX0lnJGqklg+pasqMwajOTlBo9kRMIpmLHZ8ZVBpiuXBVQ1KSr?=
 =?us-ascii?Q?qD0lOEh21MAYR3nGKXfsqmOL1RGi7QYfBOjjiTsM49QoqwS1LJ20NNNpDyRD?=
 =?us-ascii?Q?FtkZ3BXTAXIrQVU4M+hXuM92YUuP7FB9ZratC+srIYn0hjHqZNJlpjagIgi0?=
 =?us-ascii?Q?BCI07DQKqNfRS87nrVcucl0Trp6a0Xr8aPqxs6cjzUzQFUISQp+HH9lTeA1O?=
 =?us-ascii?Q?UAzMfMi+zOieZ9Uzpe+dGIK57Ge0tI9fkSZ3f5kvELB9rgxlEsRkJfiLXBwi?=
 =?us-ascii?Q?iUTFmwi2mGdEAR5sR0oxCM9rfaP6nNNejrS1aYuGs/HoKgLgcw2JNv3EJPjM?=
 =?us-ascii?Q?XY0mmNCeCe19NyLZCrSG/cspAYCgZY/p7LBg0sRpuMN/t7lyECjF7yZUEcjv?=
 =?us-ascii?Q?DkuB1TWqMfdKDSPHzcKRVQhl/e03dQz8r/1BK8dKf0xvR5HSvwchhqt2nc8P?=
 =?us-ascii?Q?uPy8oNEfpp9vNNiPc//yKeNmQDZ4OIU21cDgM8Nm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e166839-e24f-4c7f-77b3-08dc15f94b6c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:39:23.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqRa1Cj2gl43Z45j4vDV/qb4NfmghugEsbtqAgH6bY8EJyPJ4In8xNME0Xfpkzj1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200
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

On Wed, Jan 03, 2024 at 05:14:18PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> no_page_table() is not yet used for hugetlb code paths. Make it prepared.
> 
> The major difference here is hugetlb will return -EFAULT as long as page
> cache does not exist, even if VM_SHARED.  See hugetlb_follow_page_mask().
> 
> Pass "address" into no_page_table() too, as hugetlb will need it.
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 44 ++++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
