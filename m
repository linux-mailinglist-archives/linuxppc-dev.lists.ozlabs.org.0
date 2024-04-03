Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9990896EB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 14:09:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nNh21PyA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8k8F2PSYz3vnm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nNh21PyA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::701; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8k7T6n5Dz3vbJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 23:09:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj6dg4NgXo2koQtkxJccWHqoD9exTFAZ7XqmMBHt2j6bzxzC9Fz+7Rv5redlgK8/FObJm573nkAHJzqj2moDyw90r0Gh6xYzND8Ny1fLsHtjJK88tN3CmRlxzdlhqswuK5DNc5PLmXQ66STFixqkFdqVgENTAaRYCyTWaU+m6bMvBOxo4Ze5/aif7N74JuJTT158/VJR9yLHE67SpilOVEkza2emlx+xz7lJzwcBUqlE85fpF+312HDjoYKwqHvxi0Q7Atg6ERfkyjPmDGo1IoQ/U173p38oJzmRmmZmOmjhXtz5qY15MWrjbtOdFoNWToe/zmOJnIpu8XIBn4/RRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y36j+coR/veq+AhDz/Y+4pEbXQYKqpMkg02kmZ1Xx7w=;
 b=MuUizv83Rhxn4VS4aGFUcHnpuSZ5s8NNyf27SZnbUoIPUK6a1uPchW0fNkLvc1rTBvbnpPLjWBBEqn4lGyN8Y3dfR+j+1RiSwncXEzeAkJf05NqdKRIC514YnmjxYfcklVoWr8o2GxrCEdrw9V0l+pJRnLslDRIMQe1FapX7ojNIU0sjpl8GOVth+o43U/B1TIRKKmyWbKGauZtcQW1spBQNs4Q/4pdIPOepBKiTgsx87P3j5FzC15JmYiL7yFMGop6z01U6G9TPBn83jY3s/bRav4NrrM7NeUOu+gJagu4ZKPtoZQkt2Uro3BP6g7BrXrh5lROCskvP7bvtpiROug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y36j+coR/veq+AhDz/Y+4pEbXQYKqpMkg02kmZ1Xx7w=;
 b=nNh21PyAgJxzCDOH2FGKmvSP/mLF96W2rtbne/m0oCpmtP94e9woHSJpUsOH+aemqUVMMuKDdIHs46WFpndxeR319vgq0bnSPY+S+2m1pGhI/ZTPlRwMha3SU0iUnw9SHTdzAYdAyvx0WCNQHkLaP+NSLwhwhM9kNnyazQnS5x1Tuca5sgdbM9qlKNG62RKORIx9Fa6g0lrkin+UPuHKbRZnMiVaCAnjj70H6QsINU7bnAp9KndAHHfnrzGgJOf4QETiaTfvXLdrP2owYTwc2A5OnXn3FpOFPIsa5LiQyWJWxiQMKg1RNNCaXf9juzVUBTxFraZCv3qcpVqzY/+/Bw==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DS7PR12MB8290.namprd12.prod.outlook.com (2603:10b6:8:d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 12:08:43 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 12:08:42 +0000
Date: Wed, 3 Apr 2024 09:08:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240403120841.GB1723999@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgyWUYVdUsAiXCC4@xz-m1.local>
X-ClientProxiedBy: SN7PR18CA0020.namprd18.prod.outlook.com
 (2603:10b6:806:f3::14) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DS7PR12MB8290:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7d5Drxicj9Ag1dwLcDuEFcEjNK03/mtTdDuPv/+0E+qGLHKkCQJoVH/u/CbZuPLrYXgRmrapnirIFA8LOIf+KAfaAtuQOakqev5oc5paMcTrbB/rWzX3wTWeHLi21/NKaXJG56APRAl510740g0mTHTr8lLMD85wWg+80d5g9NphVzfb1lRhqUjSx0yGfper/3RV/PE9Yli757VwRSQOiRFhsmuSxeBOhc5rL2FbEXL6yPixi4l4pBHb9Td0rJ4i4+z5UuoErAraZgnUcmcSY/x+oE6T0DpI3R63biiThXd+OzETp+/QitfdEg7LPguZHqORJ4D/xSxj95U9DW/yKRP8tTG08s0Qc5fxiRndmgbumhCzY6hiB+cuuxCWWFRI38RMXo1h+Ox+E2quJoahUCdFKzQ+7KJKetSkAySmrnEl4SkHeWQmEXpPR7YE+QyumqVEODAP75hTSuPRdIP72xftv+wcahF27t2thJOk/GC3oQxqD6YvOzDGHQFHLaJ375C+wLidEWxjwdBzadQxyGdkqLgMWfuW1OlavfEVWoq4CVLpmb5U6fKT6eBf93R/Md9TZJESBJVclwGwhJs5c7tIp6OSjrqjbIrLWk9ZOvKHN8rLN3eb98PH3xJVzCnUFQHsX1m/QLHklfgCyxpbhTFMNWbe57Ujtcu4rQ+99lc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7dPeEXo85Anym/htRXm3/v05s5CWDH+IEgsNsIZxrBbSa8kn5SRwnvHx0zO3?=
 =?us-ascii?Q?BiHLYAXHNVH4310Zc0aQpo/IA53d5xwMcckgup+QMmBYdDiYTJI39SvTszdT?=
 =?us-ascii?Q?w4+SMkfeJ423XVaj8aWv4KY9fzYFLvV2BguAsBelaGL5yDUtPEsMewddwTpd?=
 =?us-ascii?Q?bAE39gwVqcHAcz5L4hi2ap8lmvPD0zfXBO3HY9lxTcey7RbJO9SPZ8BARaif?=
 =?us-ascii?Q?AaLTTChfm33lXZvRVq0aVLSpaizO5q8ONd1uLKApKp5cE+MktygcWLxJoP9U?=
 =?us-ascii?Q?48G1Cr71fX+pJ0dr9EskqPz34ZuogK6Ta3P1ZXlEccpDminsRkRi+OhYpkbz?=
 =?us-ascii?Q?enzlx6pmOLhXT94+xBfFiEjZg6TEVvMolza9Yx6fbdpki70z7CJL3OhWz3e/?=
 =?us-ascii?Q?qAugtbHR/UIQmCOY1Nv/TRB053aqNDQjefiu9Yuvlz18iLNXmXrk2Gtd4ZSi?=
 =?us-ascii?Q?aitrnwlZvae9Nv1wNyXYzZRNun7FsnPQz2OKFEt7F82FgWBSi4rz7yusGS0Y?=
 =?us-ascii?Q?dKEfLYuBpz4Rz1ZfeRNYBg4U0M3nLn2cjMN+k7u5TmgSK6lBbO/5spPPUqDA?=
 =?us-ascii?Q?ujD8wNlsxADVY1Tr+VCYGJa8v4kiMb9hq7VBbqfKUjgoHLgGydvvhi7ZVbHU?=
 =?us-ascii?Q?iLoE3PuBsWei1yEomJKltHn/eNYZxluK3IdA+8CBuAc9OGHPP45pig/hl9pn?=
 =?us-ascii?Q?AZoa0hOb5XMBhXJNrWL0CvRxTSLx5Q7tBtW04uznB1nn1jDphmqcWrjSkATz?=
 =?us-ascii?Q?acZZST9v14dXv4V/2OzPvIf2ijICE6Tvv8FomZXAIRPBT/64w07xtBLQkpsg?=
 =?us-ascii?Q?vL0BBbs675siQBIjCdJLm1m7hyraR+ObpFXPNmOgjRxaPC8liSnl9UQx72sM?=
 =?us-ascii?Q?OQtVEiKj+F9gBoyVHX/LlZqTdp67drsWz7yZaKrOJEa3AVZwpOKC9Jm95v9c?=
 =?us-ascii?Q?zCFqGnGIuZRVu/NYWCRk9v9dUflkdRz/dUCafujw0pqqWOdZZ87eGZ+vTsOT?=
 =?us-ascii?Q?aJiE2PDliDXjGbjKNbqMOIGgl+AQJbzPASFsccVZjVKIfeifRcwaq2qFwWkm?=
 =?us-ascii?Q?UCLQqw4ezq3R5C4awJ4PgiHUn13ZGJDFX+s4VEez9nX5VbfAVhnks6PnuEcA?=
 =?us-ascii?Q?FaWkkh0hqECLGPcwbnsowCKTAu5C4Jha2qyKoWWBhAQn0mBMgB46bqvGpgS/?=
 =?us-ascii?Q?ZTZKHixSfhL/U8OlgwTFeyrCe5xXkiV/tv1wPwmWo4HH8Q61yHeChKJ6R6pK?=
 =?us-ascii?Q?skCGyu+XeoNzd+mvvlts5zud8to0B2FKqMeoS5jeiEgi7Pi/JjGPTIFokTGt?=
 =?us-ascii?Q?0mhuOr0uOL0PRkESYaFn8u+ma29q0X+y8j9f90caka86CJLwhVXoj4oltS/i?=
 =?us-ascii?Q?7hajPSpTT/8wgTYcSmYioLVmgs1WGhBFFz0LPUMsn/7yOVHCshnJcg1tXmng?=
 =?us-ascii?Q?2SBXwnriXVc03Ow+KkTUNzeljeGL7W6zd25KiuC1XHWLuLdjCmaxTo9trLDs?=
 =?us-ascii?Q?SenWy/wo3Yx1Le+tIv4gae89tC501DynX8L60nzeZTKTDQ7KLXrqfrab1e2X?=
 =?us-ascii?Q?O3AG/VstJQkpQqp49tiE8dvlG1ySaio++uCogt3O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce796d5-6291-4946-c6c0-08dc53d6ce35
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 12:08:42.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcqeO8smnJ2yHXJiT4G/jEqlS6nSh+02kCcBY902wQMF8jp2DjJMB4trd+v+y+SW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8290
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

On Tue, Apr 02, 2024 at 07:35:45PM -0400, Peter Xu wrote:
> On Tue, Apr 02, 2024 at 07:53:20PM -0300, Jason Gunthorpe wrote:
> > On Tue, Apr 02, 2024 at 06:43:56PM -0400, Peter Xu wrote:
> > 
> > > I actually tested this without hitting the issue (even though I didn't
> > > mention it in the cover letter..).  I re-kicked the build test, it turns
> > > out my "make alldefconfig" on loongarch will generate a config with both
> > > HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
> > > THP=y (which I assume was the one above build used).  I didn't further
> > > check how "make alldefconfig" generated the config; a bit surprising that
> > > it didn't fetch from there.
> > 
> > I suspect it is weird compiler variations.. Maybe something is not
> > being inlined.
> > 
> > > (and it also surprises me that this BUILD_BUG can trigger.. I used to try
> > >  triggering it elsewhere but failed..)
> > 
> > As the pud_leaf() == FALSE should result in the BUILD_BUG never being
> > called and the optimizer removing it.
> 
> Good point, for some reason loongarch defined pud_leaf() without defining
> pud_pfn(), which does look strange.
> 
> #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
> 
> But I noticed at least MIPS also does it..  Logically I think one arch
> should define either none of both.

Wow, this is definately an arch issue. You can't define pud_leaf() and
not have a pud_pfn(). It makes no sense at all..

I'd say the BUILD_BUG has done it's job and found an issue, fix it by
not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
at least

Jason
