Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C824DE4A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 00:50:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KL12x5FWXz3bYD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 10:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AlNIV3ci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::62c;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=AlNIV3ci; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KL1296yq2z2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 10:49:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSTDWUEmHduuMJlB5yurUEk2x8pTZ15CDfiIuFrMXkoePXiwtr6NJQ6gx1rNzrfrOW9kl7sPP//tFSrHXXLRVwnGiz2tjZSSH7KR43z9w4xLd5R2XgGA/MN/ILukNd65uebxOEcGJCF5leLTfTkcBXvOqXa6tmM7toa7i1nv0ivmrYyJMQETmK9yJN4lQ/ZIV9MqucC1Jnw9SjWb7PFb+p4hpDhKD824CUhFO5LXpkj+SwaEnsqYWmFzmq1QZUji2cd++rP974jDpw5MyxInq7BCzJgURPCvL6yEOVwoiGd45g5weZLnUGstH4Zu7rQCKKALT3/y2Rcx3uPVP4sgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJEROmUPUvsvhDSxwqNd2B9U+F5kopWhN2vLJ8cddAw=;
 b=RWkh421rjtj80vSigq1ZQwekNoVlm4S0UH4BWhg4zkvZ6xFHaeJiKDINEaMUqCltLyQ+lpDDO16u8vzS6mgrxwTgTpsfetLHxSBZFG7RHDsqGKKUbZNt7WERn2fpivexxIReWTRRg2+8f6fkvzwsDnkL10QsHZaVM3N5zGbH5zLKvoxHT3peZdR6nkIDLqCJKgvGOiEcBp3I+T6UWV0VSDTFL8SYMU1d4m3P7s9nV6fwPIrItAR1+JR+5AXDEu4McRxTzVs/OOcVo5WgTka3hY4iHkbQ3OL2PgG9VUmBx1kv3twg6sZivLtap3/+GVHjatRKictmXIHImEnC+5hiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJEROmUPUvsvhDSxwqNd2B9U+F5kopWhN2vLJ8cddAw=;
 b=AlNIV3cirsgoLNdk3cBhn7LcNAI8fgBjOF/tG3B0YqyysRxzBD3blzWmT2IER/fAoSqOU+LDeU5xZpj5ocdg3sahteW9XzJqHUGkWW6LrpBoe1QugbxmX+QJyZ3Tl1e3FuffTn27GsAPSp5JLCbFEefgH6FX0r3QrUtvA4ltIzvybk0514365ev0yZkiAkz2hduqDQr3JTaqkWH/KxjXywfCwQgN4kqxb/RC6skXHi9TM8aLRPxSl+60bYx1QE0W0icehAJ8Fzw9L0aIABFVQldyIKznxmx8MJmjRQ8RoEAcFE1+t6ztLE9vDbY1CuVjvRheUBeuWVc6qfgUR1ULDQ==
Received: from SN6PR12MB2607.namprd12.prod.outlook.com (2603:10b6:805:6d::30)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 23:48:54 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SN6PR12MB2607.namprd12.prod.outlook.com (2603:10b6:805:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 23:48:51 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::11a0:970a:4c24:c70c%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 23:48:51 +0000
Date: Fri, 18 Mar 2022 20:48:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 0/7] mm: COW fixes part 3: reliable GUP R/W FOLL_GET
 of anonymous pages
Message-ID: <20220318234850.GD11336@nvidia.com>
References: <20220315141837.137118-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315141837.137118-1-david@redhat.com>
X-ClientProxiedBy: BL0PR01CA0035.prod.exchangelabs.com (2603:10b6:208:71::48)
 To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edaf932c-7fe5-4aa3-62a0-08da0939da98
X-MS-TrafficTypeDiagnostic: SN6PR12MB2607:EE_|BYAPR12MB3511:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB2607B2142894F46D8DF13D7CC2139@SN6PR12MB2607.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnkMSbVlRN43Q7uHFDaujfH3zeqdv31q6fecG3kBKyHH4wIlvQsQxgajpIUjkhFUSpwXr5s9q/PgxY8h+0Zbi0ukPHokdCAQFNNJlZEgg+Nifm97HZTRKukFPqTs5lr8VcUl+Zml6soSnWYwjzTqKCmR3Nyw2DWSoY8gRB+oNs7vFm9YMukQcJpCCj0oidp8n0TFiWHv90oIfMrAKT+YBha8EO5Vy4v0yJe5Gk1Wz9kzu3V6UD1simI/Mlj2v5Ayz9RGcwRw68hECLbFbq7KEPeke8YVYWoXq+WVaXX/QUfkmo0BHUoC/Ah8jRRf0q7U5F3NUtH9F0Ziha28hU1jtog1hTDHApka5l8M8WMO/knjZJiipvKDRCujAJnfgFTgPIIEQW4nheNhs6dWchq/PQW555So2/CGUHQMdLog/c6RNd3xg3hIukVqXKn9ofRjmcrlC6aJAlxEq/y5jj5XskrtAhi+ZqOksyCsLqaJv9pFCRXjphEa4hR/FKGGiBRIjucOmvIFxFmOgeD9y1g0UkxAgin+xg7nM8GKb5SpKOVTF/b3D+rA/LpvHpl1OasnPbKAmcOOe6dA1W5fo0QqyM5Q8piD65gTumIL41fumA/j71Dj3x2oggYe5TCy/yUmugu2dpmJ4I1C5rBPCE3kig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2607.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(8936002)(2906002)(7416002)(6506007)(5660300002)(83380400001)(508600001)(6512007)(7406005)(6486002)(4744005)(38100700002)(4326008)(86362001)(8676002)(6916009)(54906003)(66946007)(66556008)(316002)(66476007)(26005)(186003)(2616005)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0svhnVVmeSO7srKs6+JxRk/rBoZxOrfZzib6M0qnAT4RxFLB5748GmZQvEXk?=
 =?us-ascii?Q?zhQ4AY6Bw1VL9tEroMP6P/BXOfM5RnP40oBz8BEzfUAp6uzh3zTzrP8mqb/I?=
 =?us-ascii?Q?bheO6iGolZixsiukRByxZ+cFjxaAr1vOK7cI4qH8cRK8O10ph2deWIYc6oaG?=
 =?us-ascii?Q?QmdZZaXRwdroXgxv8b54v/xzs9N9W4/rWwAbNJivPnikprUnjodefWkb9ImU?=
 =?us-ascii?Q?cDuLqbw3LedtWRvIa4N6DcxhwsT4AXMBaPT1oMRrfEh5h3EHVh5UqZngTr3X?=
 =?us-ascii?Q?gJU9qcmYBXLHj4qZH8PxGFD+5aINETHQUb25cWF1wt2+e2aNm53TIJpmBy/3?=
 =?us-ascii?Q?g2EVLUeCiFAPgdUM8qvIOUhOYvg9u3mIAB05T+YpcXgFxPzizp/WlbRKTrwT?=
 =?us-ascii?Q?hv7mi2hu3rZAX7h7KEBys2GJWuceUuHPrLtEPPs+agmfDCV652KLR7gVqZSv?=
 =?us-ascii?Q?Nz2WW9jL0ko25lPNkhE9P7f8fP8eEIZwXJaSz2H0b42L+oX6jfARA5nogf+L?=
 =?us-ascii?Q?P9ekYZDgRWdv5Oswv9zwDUN/BDGtL6sDz4Qwu7q2Sw6ai8fcXq/KiPMlDt7P?=
 =?us-ascii?Q?7xiJUrJAaE9UNFCzFkM8FPoo6lZDBS7MYqaBoe++uqh/1NM8iIofEOnReKYq?=
 =?us-ascii?Q?U5kEwmBIp/YSLO2Xcngc6RzzyOj/MYBJR+qxFdfhaBTkj0TIe/9sFfmv+7j4?=
 =?us-ascii?Q?PtVkIJD5aSSrnYQERrYE/WLbHzDvH9Yjv0JgNSduBPZykZnHTDO5VGNvDYY+?=
 =?us-ascii?Q?5f2VOqJ9F/NBijs5wJZRSoXMNKAWxNZxUNY20XEEeWOOp+bt8q8Hdlr/epEF?=
 =?us-ascii?Q?K2slnRNq5nAZin8kX0n0z7L1CY+ajqFhBOVlfmsBdhoM1MwuVpPnIfYXlT2/?=
 =?us-ascii?Q?nmnQ5UMRoOPPSfYpLWIyXI1DCKG73dFZlmBmf9Gyv0jlfoZ99tTKAY8ixbOd?=
 =?us-ascii?Q?C2lKp1ydgpGQnkbAIHYUnsSmDLDkWpS4iVLhTkNAyI0kHoU2fTj0m8b70bLV?=
 =?us-ascii?Q?r1irgy2VASXBs7voss+OQ+z1K5Y3zO/tym6AsxnL1nzr+Xtn8I3x/ioXyLT7?=
 =?us-ascii?Q?zphrvgabrse9e1KRtGBh0xuoL3AOegvy9iuHQeg2NOJeriNuwkdtTC0aj1xq?=
 =?us-ascii?Q?r+9DwbSgKARKhsm54ccc5wFC8Uz6qTyIaRgtmKGUrpGit+6afvtYaxuJvMUg?=
 =?us-ascii?Q?WooZoHqx6FeRPh4elETA52HMJovyjq+/lHGSi9dVd2arZvazrMX2VXiFdPMy?=
 =?us-ascii?Q?5Qh68PtuQD5tNm1BUny0Z9U1O8yBCdOXWpHjcFCKM6V98huOvSfuWnATrzMC?=
 =?us-ascii?Q?+hS8B75ZSeo++IuTOww6lufbuFe2CnDlr9surcG8Nohqu90R8PdQ8k19K7Tx?=
 =?us-ascii?Q?ebzoNqGpWkdp4q4wFXlZ2EQ+17pAcRwA+IPRdl6yUbTdFv9z0MlHvx8oO2AV?=
 =?us-ascii?Q?ritXUNnLjcnGc1qH//+bS3mz/I2oIjfS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaf932c-7fe5-4aa3-62a0-08da0939da98
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 23:48:51.4207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7VkHIwGEJaP6dqrcGbKSTIkuf01Dx8luXYetrH0Mkjf2+tg6rbvEcbP8SV8viXU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Pedro Gomes <pedrodemargomes@gmail.com>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Heiko Carstens <hca@linux.ibm.com>, Shakeel Butt <shakeelb@google.com>,
 Oleg Nesterov <oleg@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 15, 2022 at 03:18:30PM +0100, David Hildenbrand wrote:
> This is just the natural follow-up of part 2, that will also further
> reduce "wrong COW" on the swapin path, for example, when we cannot remove
> a page from the swapcache due to concurrent writeback, or if we have two
> threads faulting on the same swapped-out page. Fixing O_DIRECT is just a
> nice side-product :)

I know I would benefit alot from a description of the swap specific
issue a bit more. Most of this message talks about clear_refs which I
do understand a bit better.

Is this talking about what happens after a page gets swapped back in?
eg the exclusive bit is missing when the page is recreated?

Otherwise nothing stood out to me here, but I know almost nothing
about swap.

Thanks,
Jason
