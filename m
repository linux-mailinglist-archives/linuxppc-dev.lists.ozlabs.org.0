Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67C898604
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 13:25:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LMKNjkNJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9K6H50qSz3vXf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 22:25:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LMKNjkNJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::718; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20718.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9K5X2wXmz3dVK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 22:24:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrsSDNOqSyl7MNt5N2u5t+fg3Q0H6Rto8DApDQOr/Eq3Kh7GZVTa24aS+arm4WWBsXdcbDhJByAWIlfnlF+YZ6vzP2i5DGIxjVNg+SMMklz5PMBE8w3sEvwJV62+LnNaKPJi0Pr6p+5OVFu6wt9hUETOzanAHLpDJMGFZp1SyyApGNQjL8b2WnmqgUxw3sRzw/sBw/Q2Vlfp5WcN3HQLaRX9aaGAmxUV4CvIGaYIXmkDt7+qnOpUkIcAe7YaZPQmjPruWq6lzmFqnnycbaC100xzbyyOkCvbO+H3bwD2+ZrgyhVJSGbg2ICJuUhFB+PvPMYhnH7KyQEjJO1Evy9ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kDkQ9/zv5NwfQuVZpmIVUSfPhkVZ48d4u/yZoLWCcM=;
 b=XfVSmChfBHTxZCnWu4ytknFPwhgqaGaShsUPhVGjRDru14mPB0e3+jFSteifIiSelIAfx9fb+FTTtDLK7uAM1MZgHSMCvER5KCa8tsNA0vg6lekpvqvLMwFqGkHUo3LMdcTDxdrTr41AJVwHzU1ubtqSe+HYTHymiSWlLSoqzQdKAlfvBXl5hEJeSbdtc9V6X+nTJhJPdj3V6GoECt2J7rlh7Fr2wLwX8QNaPMVUmmNtZzusWiudtAH+l/yrZF3yMhRuLevUTqrpUGp7vYvksveNjlmBB0pYDZGqGquWkerxAKgAxyN0QRUEvrrjw+5jFFFqiFnGtt0T3eDIf0FxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kDkQ9/zv5NwfQuVZpmIVUSfPhkVZ48d4u/yZoLWCcM=;
 b=LMKNjkNJNgspTQQeL9lBAdhoEJHpmrrbi3qlLaLKLMIn2D2PahxPUgWYg5m5fY5E4UxZrd34GcYHtGKfvG7iRofrFdIiSYSMbEFjnq9zB78dhiY3DU43sHMkGRBmy9VcDGxwqk3+Tq0D1DGgU0a43Ve9W0RvjPhq7dSpSreeSgFzkjwc/32n0cCrmkDLh/uOzVTFcvQDCSX27Cqfn71oHr4j8iJWkjyN7BWoSUDRps5rD4jcVgKGtWcnyPVTjm5ANr7BIH8gpc/zhJ9BtxT7NQ0hdePcGIeDMTgTswui/4JDpumKFSPio8MUWy9EkYdtnOD9HF32eIGqixBC7MiRIQ==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 11:24:06 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Thu, 4 Apr 2024
 11:24:06 +0000
Date: Thu, 4 Apr 2024 08:24:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240404112404.GG1723999@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <Zg2fEP4eEeLhgDwE@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg2fEP4eEeLhgDwE@x1n>
X-ClientProxiedBy: SN7PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:806:f2::30) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH7PR12MB5974:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EhRUPTL0BFK+d07LVk9SoN/QpGp/aRHWcpkKHH75c+OpLEdeLbeLP4LipmcSfQW01jef+dp/vUsUvuiRjoaYUj1fEc2JfQ9BVpgUknslVXGsZww696g+WitO72VJ83lVLYQKeGYwJ/pXvgagNIRz8IQ2UmVEXFf7bTiiu2+QF/hQP1BK/dsNY3hoO796qQ8U7EfYwPjynbJXwSvDFI0H4/MCGbXI4/E2CQys0NPmVnMlfG6KFebLYfTIh+UPBNW2EfwD6aepXY1FSMuxrt/FMXWOEfI3YFbASKQ1e8MnbOlxj3EjLdL0aJOqjkeose2uEz2g+mCl8PoMUl26xHFmGVX7TAKPmDA/TH1dqDHz6hU8EJUyfcTYp41JAIrQiDxSUwwWfzpFc3H7yU+o9wvUgd1Q6xFaK39J3arscVvY07FsaHqtaCiG/nm2vV7xfAMj+CJ671pBRUuP1XIefnB9aYMtaJXg9GOVBf48d8kJGZmHticgHUpibHCzbzt1l+A0FFXU1sD0WrGKNgGzq2Q6NZl6xxl7ID99D2BCP+2nR7QiASNmN+5a0KlWTTPBcP2U6ZKfUHmCUefRmMpqPMhRvf4IZzc+3t2fgYZv63TP+5n4Bh2VgZ5LZwtQXpVSsKSOK0hVswNc9a6vD5Kw1W3wYliIc/+EQdtt6H5DQU2p97M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?C854FYBwplDK2b2mVfpBsUhj7KjqPPDZPvQX/Sv7AeTTBoKA7jwQRfdtVaiH?=
 =?us-ascii?Q?s4kCGdb54LXgKv33xrh1BYMThIzDZCevShJm09H5t6HxKLYSnfdhFCkIrzoc?=
 =?us-ascii?Q?tQK7PJWEFGKuTJCOGPIwJVOm5Pav7Zag1S1EbSFwaR0x82eHo1YAQFCuwbvA?=
 =?us-ascii?Q?dtzuERFsFTilIUJ0Br1xorWmduXeAzdqHl2imqpmWMeftBHHxSdWIXhM3BZE?=
 =?us-ascii?Q?HA2ma9V+4MFUCFV4iFeJz+twk3iFOqT86DhwcnTZ2mL4yxSef60xzYjrjNXq?=
 =?us-ascii?Q?ibshr49kRiLmCKfArUEE7LhJcGYbyRecG5+M4QYHEgPDuKnByvp27CGxnTLt?=
 =?us-ascii?Q?IFDvqsrgMZ5Htrjjm4Ua16yxD2YEzv9dNCd+NkSBnEfwTjQARj/XCfqsd8vV?=
 =?us-ascii?Q?OYDqbY9g94G3Jkblw8X8Vr/GBaFLSl8srAAT8hv7eWHgcX4CcahQLpSkYyRi?=
 =?us-ascii?Q?l3AOuJEOO0qcS5c0yH/qTsPvEmyQf2m0C5rj7OsZFu0k/EmDj0Q0bD1E5+7Y?=
 =?us-ascii?Q?HXZhYOs1cjl1bRxkmDFFKL+phQZ3nrbLympGWFsT8efJy1NfQhB5mVx5ZAnn?=
 =?us-ascii?Q?vTuVymdxYee2EKJ5Qv+B95vijMw1fVuEF+ylmyFBOhl1TUqC7hMSsyW6iK+/?=
 =?us-ascii?Q?94fiH11XtEb07MYCH1IOp5GeFsbUZ94DCyc5Kl2O8tP7gFeqWM05zzfXKQhQ?=
 =?us-ascii?Q?0k2cK6ZtLk33tpEfwB5La2UBaYiWNylFpn6RFDqzb1IDv84iA27zSWV7Bpsr?=
 =?us-ascii?Q?S8XPe/4smKU04AeVuYI+C9rgCEpm8pORKyZ54gNXk0OVeo7fuMZONnYxjlic?=
 =?us-ascii?Q?RsVreaDPZ2+q2V2uq8SP56LYOsFty2uPVTBExUYnuZm7gpIfIDYg+aestGm1?=
 =?us-ascii?Q?2lqSZn79waVji4HSfr1sLBjQWMZRVuHoImozY1XXlViGhkbiUGYrL32ThnzG?=
 =?us-ascii?Q?El/lS/XOEROMwaLltHwo001l1s1hnFCNVbOufpHVcyLPPYQz1EZW6GeGwtEE?=
 =?us-ascii?Q?PlRteep2rKKrthhjjurgji5IXwHQmbUGrm4kCqDrzgFD92kLoqlNq1OGD5RD?=
 =?us-ascii?Q?KZ7C/x+G+4kZqd/o4S7G7Q2DdIQaYSvLyRyDEJhiF91ZJtMcDtEmkr1xMYSf?=
 =?us-ascii?Q?R30vU2/GUYVcVfQShrz4lHHjEVECTIvlqNrM0DS1JL8NOCWiwoVubmp13sOW?=
 =?us-ascii?Q?Y0zwUx4ZWeDu1Za2WwM/uNOgTz3wPkhiH0R5YMQbmYOF5WuTje7Yi+lZ0MAB?=
 =?us-ascii?Q?V6UVKVq++2a3eLYhffjA2/+WCvPg9Glp9i7BEbm2iiXBrOzKFT6rN10b/MH1?=
 =?us-ascii?Q?Zs/9nKaojeoy8fsE48hP/4XikCvwTtQ7M/bGDFGpg0q06oo0TBCX5prXoGwW?=
 =?us-ascii?Q?TyNxpYtkjqK2djj9EYpY692AIjIRMRlhjeIWDDf0VhRYyTuxHDYPOmbsgeVZ?=
 =?us-ascii?Q?NcXUFJYq+GNn124idWKscbVWwLLOWJl8E1Mkmot6LNJwKTZU1mhWCM+JjC7s?=
 =?us-ascii?Q?VqxaSv/SkfooBIUfVXe8EmVqcfQDknznDg8QWnolQTDlvhr/jI2P2/9vPJuH?=
 =?us-ascii?Q?2cJgd5jXQyqSZ8ix9G0Y+KNjjdocQd2AJCFRs3/5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edfc7635-92d2-44b6-3143-08dc5499bd29
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 11:24:06.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPAtOWolyisb3/wTTV8/MSg4tfw/iHU/cjfNRqEbNOnjvS+MN6kZEmxhEPCEbeIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 02:25:20PM -0400, Peter Xu wrote:

> > I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> > not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> > at least
> 
> Yes, that sounds better too to me, however it means we may also risk other
> archs that can fail another defconfig build.. and I worry I bring trouble
> to multiple such cases.  Fundamentally it's indeed my patch that broke
> those builds, so I still sent the change and leave that for arch developers
> to decide the best for the archs.

But your change causes silent data corruption if the code path is
run.. I think we are overall better to wade through the compile time
bugs from linux-next. Honestly if there were alot then I'd think there
would be more complaints already.

Maybe it should just be a seperate step from this series.

Jason
