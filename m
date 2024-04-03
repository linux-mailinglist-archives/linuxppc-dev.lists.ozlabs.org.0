Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8B897132
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 15:34:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RoKipFmf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8m1s6Mnwz3wB1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 00:34:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RoKipFmf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::70b; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8m155Zvrz3vcw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 00:33:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZDfxyua8jHTIC6rx9rwJAxkDZsij7jg5P9ZYqHA6RWINu/uBCgJkOHLkOcIxKtAUD4mhfUOn1MQ7zYObgNB6ulxRyX4WDHe/zS1YEFDROsIQYREhPVQaPzMPGGMcVlr8ufK9sMbDddrzBthEq7wciRYOHJ/GsR5heEd20EuoT4Gc4bqayKT0wpn6rtoQq4zX3JNVss9XgxtBJIZHd/aIzqGFDhCt9jaalAUtW8tteUS3VHjk3mJlxu3D0dwJlelzJa5v/7uSI/wvEWmbSnI1pV6YkKABDYoDcSp/yoa+0AQ23RlCXWfa0Ya7rIfR1uHmKxAzt1xM1pHAFkpR9D97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKLOv5tMIA7YLZhgO/SWJoz0Qz1dX0FuunDsb/mfeNw=;
 b=bwr+rfuVpO9/nTp37GGvBJ56zHHNYx4GXWDQqKVG3ByVu/sTIMhKXSDX3Qvs0XBnTDxCA3k/63lK1rKDhLZwcRYXMC7ekCsPq5QuZIWxAt3XcAFxF0ccCBedU87OOo9h0SvpUUYDZkinaTzs3mmwFnNWaenVi6LzZolX9GT/xyoaW6YGYgW+Fz1V2YXbsjhuoWLZEexBk0NyJI4KytgKJXer1rPXvXbhid72HziXd4tzqMxEl0Lgy/uRhx+i+/xjnDcSzH75TFBt1HlyY9Fk7Yh6956BoA93NCwrU/qVoNduvzhodOnwi5ZCeVKP25z5Ly2CjGUUywKK/WngoOrMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKLOv5tMIA7YLZhgO/SWJoz0Qz1dX0FuunDsb/mfeNw=;
 b=RoKipFmfp9jtqbzNTBT+6/cLBLszIUAV9iMP9MRte1/rb9YaK5PHb+blEUxIZVIHMDPI0eHj5zu0okM68Idsm3Pu0p1wHl4qOHCMSz12fufSW6P4zHa2E2irm+f0NMmxZIFvqxoi33iIgX3QIQsAQpzK0b+WjaRoboPOS8V9GDYQO4FFDi8F2dCQ/bfZkmwyP0XcK99ztxTnhTwrweZni12jycwPG6OMOIIBAXtozIIzh3DHlZoXdHUGzu2SJfMUz7pzxyhJ1tCaQtnYmexvUuUIx1bQYcm5TcUprF3LhV04DI91ncll9vlG5r0BlUv2JqrBhgu6SdZUa5I0Em6e4A==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 13:33:23 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 13:33:23 +0000
Date: Wed, 3 Apr 2024 10:33:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <20240403133322.GD1723999@nvidia.com>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
 <20240403130752.GC1723999@nvidia.com>
 <4b56356e-ac10-4f40-a4c3-7672d6e4a4e5@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b56356e-ac10-4f40-a4c3-7672d6e4a4e5@csgroup.eu>
X-ClientProxiedBy: SA9P221CA0008.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::13) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SJ0PR12MB6733:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kRL9J8thnfwor5HdOUa7p4yWumKXuEJ2Zx/nEOfAu7eZmhZQbtYSYgivUHRmN7NPVbAbdzl5zSrAZxl78rbXdA3W6yGsh6RTbgIVsLt24ygV/6uIb/rmieQMk8fv5Hwt+uuGpqp84oYXTX4+iU1+wAcbJZGBh8a+r65qZLRYCohk0dLhVGkLiWvOD6/Gvwy+aFZYIxjQ99UTHTYeZub3iP2i8F/PMRUinHC59yoopuZ1FvAfY3Vfv2xJnVpRGkq1Qp60XeldHsaFB1ovppLt9bipnbpqcC94fWs4LfJkyVKFeFupypDHKGX7A4oUYwVxgcMGrTZSwvJudEWOuCC8vtyIeuY8N0XcUI8zHYlFA2Vsx8J3sWCrfClqtvYDWF2TWLPJ/KxE058khRv9zGjWFTRDmzp2cNWIQEqdI41W+pr+hFqXFHTsl8KyqwMQTMGO2SjeaIQ30xJpDtO48v8N/ulUnjbGafIIzxOg/NQ9frwxM1BpN8kiFLzr04eTK9BB97/2apll3b/52vTlIOMJqjb+zPMn/cXggJdTQWX0rSp/u+h0E71zOhDsx2kvEUc02iudNgZinBW7ewtLnY9KxL/P4Ez26AuLHJCItkwjvUI5B7Nw/630Yp+DWx1kCQZsPr7KlCLkd4oXl+WJZ0sGuXXQL2VypqvFGUQ43GnI+RA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xcBv7YUxNnJvSEFVCMkOWjjLygPXZUW+DzdYQcnV+Dk6FL3B4XWJy++Khrxf?=
 =?us-ascii?Q?ErFKtPYjCmy56C6bgmd3owi0MLQ+9DIL/D9hX5AH2sKKBOw4luGhIgx7Qmfh?=
 =?us-ascii?Q?ZdWp6ls5cd5tf/grSPMILoSWunuJFCxAvdxJOyPeh4+aSw4sMmZRrL1Awgtn?=
 =?us-ascii?Q?0qKJCYJeGq4D9X5zBT2MHhIyPSaXekURh5Kgjcs1NV8VMw+mMqs+LdpLsFT5?=
 =?us-ascii?Q?s2o23p43AzSSjRpcQU56UPtM337TGn86m6TFlwCkUtKou/tTqjM1wysdZRkM?=
 =?us-ascii?Q?fhoYBugN7hDj6LbIZh+FU6zjAQMMLE4hxTeOxw1qP23w0wfytyh+nFrXCJXf?=
 =?us-ascii?Q?TopsdFlBYsuG+21pyTH5C1HMKmePd9YsVNZh1Qunt+eQp5ctnkaYYQGKIOOf?=
 =?us-ascii?Q?BNPRrRzxx0atndv+XBgF+py6x8F16XI07pRjmrU4UDqMXUWOG8M6dXQ7ZdzN?=
 =?us-ascii?Q?RF/LqF+k1uasvKKQhAd7F6vj0/y17s+eedKdivqZRfOBPUPKd9jr3+FtyK+O?=
 =?us-ascii?Q?mS7TOEq9mdgQ/q0Z7D1yU7/iG2h7z6N7H2DDLJ65YujJpdI2vNJNM+f7gspc?=
 =?us-ascii?Q?btUY7U0k2zzs2SLcp+uTMUdpftvn0pA0cTbSIWUntiBhAHLPbMoEVVEuHmPC?=
 =?us-ascii?Q?7ZvnZSPsUr/Kkh89ReOYuDFisChxh5KqOkrUbPcbLCGQsWgAqJe7UFUu7tHN?=
 =?us-ascii?Q?QrxbHCCs4wfKyZsfToyKvCx0LWhnSW1KzrpxDUNGBnKJZV/g43aecjBrLTka?=
 =?us-ascii?Q?pCf8rJ/n6zfVNLRAJAxNwVrIQvMHrQFAe6sanHmddoRBrSXzso593CuWy4eA?=
 =?us-ascii?Q?CV3JlKK388m3Xnjlwo22xVlmen+jvFfgAvgJthYpmLhOK5pU+knhrF8AFDpt?=
 =?us-ascii?Q?krJZxaULYlS2jhkh+25/J7UFmnDDrvu4HeAhePngt6OKv8f9DlbjMqCJ4moO?=
 =?us-ascii?Q?zS4V7t7zMWz6ZvHlDd/jMXkaudMms4bp2zyMgjpsI6vAm/lJEjXpv2mI1u6z?=
 =?us-ascii?Q?SIg/h6hJay7w6R1pLkz6ZyBhlpC96P7gW6poFjkmhkFPJcXIxH1HEz7sBQox?=
 =?us-ascii?Q?Klr1N73f3k4VINn5rxyF8BkQT0B4ZwsqGFK0DbkvuzbG7wTK7uHfydUUjKu6?=
 =?us-ascii?Q?tGvvfhoQfOSKcOuFW3u9X3OKFKjQYvnewWr9WU5hMl2I3D2Xlw8GpPEHAWEw?=
 =?us-ascii?Q?IDF0NZbVlefVj2OQJ595/GCz9wj+9QiU0mP5gU6pr0Qtyg5IJMN8XZgi7AQD?=
 =?us-ascii?Q?dQGfUQSl9pxOf/mBPOqeW3EBZozpOiZuyPVYKGohX1FdKRxOO+85xZbqo14a?=
 =?us-ascii?Q?e9U7o/faH3/sdKyhODa1y/CF2xQH34QZYxBjL9BYmUzvbtul4qVa+Tir67GA?=
 =?us-ascii?Q?0hmLjoIIp3AK5o8IlqPd25FU4t2GmnXmxwyithfKrkTYr/hH5jPilzces5q/?=
 =?us-ascii?Q?Wjig231txkl60YWZDqGLi5lbin8LoLCTQ9bdX2F9g5emMzRu+GgWSf71tl0o?=
 =?us-ascii?Q?rtUY6OpH223msQyiMMsWLuu2nKuoKknni5kiEc/MR1bRcepWYdDtuAt/dfsf?=
 =?us-ascii?Q?pnF7BejALRcCL9OHZaxL6DhVfONM+YBYUM6NkDXM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d988ea5-e245-486a-93eb-08dc53e2a274
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 13:33:23.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JrL5MlnmT3z6hxv0tdPgUiyeUe5lUXFiDsrGMtrbXNgCuXXaiwqyXjaTCtCp1MsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "Kirill A . Shutemov" <kirill@shutemov.name>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.
 org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 03, 2024 at 01:17:06PM +0000, Christophe Leroy wrote:

> > That commit makes it sounds like the arch supports huge PUD's through
> > the hugepte mechanism - it says a LTP test failed so something
> > populated a huge PUD at least??
> 
> Not sure, I more see it just like a copy/paste of commit 501b81046701 
> ("mips: mm: add p?d_leaf() definitions").
> 
> The commit message says that the test failed because pmd_leaf() is 
> missing, it says nothing about PUD.

AH fair enough, it is probably a C&P then

Jason
