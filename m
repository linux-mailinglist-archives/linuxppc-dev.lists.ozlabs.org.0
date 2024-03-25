Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0788A9AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:39:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ko/omsko;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3JYq2fBdz3vgL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 03:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ko/omsko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::600; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3JY234d1z3dWk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 03:39:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3G/023ZtsPuOC27bDrcLBPvO+XjVzycDjv7V1yw4CFhO+z7MOQLlv+psx3y2snekMQUZ30R63yPNdn2QRC2muOJ3ggry4OkG4doB6HGM1gIVELrq/owK4IhZpf1Ftl0V8Y4sWiqXQCXcN+rkfJcwSmiSuB9yo/L9vF4pcbxy854mwKNqPFG1U2omY/f/Z0uM6sGoiZ6kDgXKcMHKRl4xcR5K6L1P/7WdLW9GLl/IUV4Qtvt6xmyUjmDGiFKFTt0avAwlVJ+c5zAbeWEUB98uhACujFlqyilGDyl1GYj296vqc4k4JZOpZA9H0IE+bU7Gi4Amov+b5/uhUyLgCrwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l10P1gRYGmKdDXdRsZ2XbyP/gfUTNnWBeKApaJ/odb4=;
 b=ji8k5jktK9FrrDNhsegKmORFxxQjwzrZrRIyVbY2Lu/Va/OeLLAjpmH1Rc3j78dMYvEcSIHrhaQ9IhpdIWVGqF2xzE7iAiB0TMbRPwF6cKr+eWRWR3Q5u8dV0nolpTb4V6A9F3HQX8UiomR06KsH1OKGW0km99gLRRgBA5nYpxWfFEa0C81veDFU/DjXD935u7LaXPmEkWz2bWDBwjPy/KjTFUXbiukqYFetvNgvO/Qj9dx3TAF3dxIiIWYy6asT5Ojg/vNsl9I8f27tDIRYIi02fHQuKUl7WJU1tukZGxMoHCBSfkCJiE4iI7oIaiq8Hbrg1Tf+ThHjM8vhwhWlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l10P1gRYGmKdDXdRsZ2XbyP/gfUTNnWBeKApaJ/odb4=;
 b=ko/omskoMFmEMrVtdLhvVwFlyy3GVYboY4nDsYBcfm3+X4/0+1TdXJKKHNn3LTugNDNJ/+9Cw45I3nEyN6IyFRhvHIJXE0aWggFi2eDQ6I9WiYhUWg3TtSRLvOedTiJR+cX7KljKtk0rMg9u9griEaPPBqmFfrvP4/U0pv1IRQwwZVZXP7CTigsU+L5m9UjiE85nT20PkgIWo4AFgE7LwQqIwI2D1qR8s3cnZsUvtBrHUYdrQgK9Ep6sFvVEBeOabRbAs6E6AIGfDbVMa7jzdgunNLspQ9paRNCS1q1i4QqEr3wIZ8Exh5yKrhz3Qhy6viy5G8GKMvDG1ZkVQBhXPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 16:38:41 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 16:38:41 +0000
Date: Mon, 25 Mar 2024 13:38:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Message-ID: <20240325163840.GF6245@nvidia.com>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
X-ClientProxiedBy: BLAPR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:208:32d::26) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 289052b2-4db8-46db-a232-08dc4cea078f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/TWLwJJnCrFt4hVF6egYvHNZfYAQebbxJ9t3vjhDTu0dVdwwEpJrKUrGeP3EH2/ptwzsjHZWD4RmV2JfSKNkFh6p03oTU0xtcw/7sWTRmfkbIfKTJrqn80Y8Vaw/h61DqLEDSwrsJb9oWWrX+7HtbulSajXQE2bdB7cgvp0uNKpZmfDzUlPQ0rXOUlY63rILrRTa4QEv/iBdPf3DXLX7OTUH6fHZPTO74CfjwNy9kJeEP5Oi8/q5XVq0X7+kA05U+Zgs1sfY80slg50j0SdezubBjTHX1ZcPTEVYEwemjzu7qjYfvtw7kMIFv0yBlHhLP7hKQVmniEJfc7t6geGIqrf9YZ0y9sE2wMQNIl5DfvioP+tksOtBhkgYTthpIxloZ1IPnD2fn6UvmsYoiH2tCkrZKpU75YURdsSS0INiA7LPKiY6q4jXfVN/YO6FqfVVEhvp3zL1TJItoj4UpVmDaEr/TZ8g3qY30plUbB90tIpRrto2v37H0mLS6/TZceOWtQi8Q2dgROdHuGwV6sGSsEPqQKAXNRllz7XYidc0hCsKWp6XvGRdJi3Kuwh/qvZauVyIezRToPL5GhEVpUTk15yJ2gGT34FGI646uTteb0jfVfwbl7VbUoOqNqpidsOvyBYgEpv5vGSfkKinzFt9JEDEw+0sYrLp3xsG2owkOD0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1+hPKn5mWK2Yl74bnnvCTvIQyQeKOa+BcxkVDT357pWQGUqTcLN59iGvf2NH?=
 =?us-ascii?Q?B9GIvyY16TTfoLRAyj3snRQ0ixmqCFAlV8jXgzLPR4370N/4JSQJ1t5cWoug?=
 =?us-ascii?Q?pU01nOHNavsW5Qm58JS2ygsFTnnwQYA2LMiYxGd6HGjQFvUuqDPCdl9iisO0?=
 =?us-ascii?Q?kbjFSEVXTHd3wYgShKPL+AyB/9GxqwJK/A+1fp6XdEvZOwQ2hB+j5JBI6vuc?=
 =?us-ascii?Q?jqhPTF15pvN+Egr/Z6Etb1j1hRyEfzX0SOG/H+qSoQUsKIEi2wi/WMxFIIaq?=
 =?us-ascii?Q?0ZlPOqAD/Z8D2qmdGKwQ+C+a80oM61ZB/Ih20glNwzlV0TKAGB8GKvewM63x?=
 =?us-ascii?Q?CI4BCTyqRtrtAC3YSnODBRb8ZiYeBDSt3umj1R1Obfo521NE3LzCsCOfyEQw?=
 =?us-ascii?Q?h+xUdn7dUCbVkVvC+pKdR2+7CXtYbDQo5iGkBBiYDGcQ/gtmzZu2wqvvsTEZ?=
 =?us-ascii?Q?wNvm0Jl9hCQcPlHUiR+Cr8LVwkzDknggeHGGYTthat6u6FLKxm56aKy5MbCU?=
 =?us-ascii?Q?mDe4l/g9gYPrq+giqLXvithYoNUjawBnyKwViQ0yrnATrGSXvApwLf9yI+G5?=
 =?us-ascii?Q?zrbxsklWfAFNJL5GxbJElz71KZEvyoTQoDSrKxrLpOTLH3L+DjKZcV5XD2qT?=
 =?us-ascii?Q?9LdyK39doMlxc2lfm9/4Edg9nBIQgf1xXGXDnVSWRE1rEObu7syaAejJhyAz?=
 =?us-ascii?Q?RetdcWOPte9hkCipLBhEn/gxLuPuZllMFV0LxXaz44bvMJA8RFAycJz00dad?=
 =?us-ascii?Q?REETqT4D6SDAExGqpAKG1rVU2ygD/SpdAxq5oFHEQyqpPhec2q72bPAKY6g8?=
 =?us-ascii?Q?MI+rC4B5gfCk2TTvexrWX/GMQRH9RPbZk9z89yzGiTaD3I0+tUbJs3sZCWNG?=
 =?us-ascii?Q?HWYvHorr55CcNmeaMLE9V9QWIqbr02KLgGqlGc1XlZAuLjjrlX7m/9uPrwsG?=
 =?us-ascii?Q?RI7u1Hbjdq3btzlb4ZRsPIMLOUySidoXjWcF4HbPeW0yb397wu1Djk2tl3Rx?=
 =?us-ascii?Q?6A1aMRmH2RDy/r+NqQ9WqdIx3vd72K4alujHzbE4/UZrXnv2bujicII/l3BD?=
 =?us-ascii?Q?3z8IQ8FMicWcd7yrSD2hipI0OmO10eXKJykeAqCn2EDGgKc42eFuEOkEfBF7?=
 =?us-ascii?Q?NN8C77VH67GwdpiIRsaI1p7rZNnPV2t4xXXb7BjlqvNOUTJQgaLlnlVVgJ7U?=
 =?us-ascii?Q?yEz2son9+kufOPJ0Y6z9nBuZ0rr4WptYyZkajFmEEqlDNYKKnU/2hb0k7sM1?=
 =?us-ascii?Q?DSLH9qwp1+2LiR5GpFLo3Bj/KO15eZA1aXef59EKQwzL0Ng1F7xJVapk50y6?=
 =?us-ascii?Q?/aJq07IOg9Z/hfuD6h5tZzmMf0LFj8tdjbnbdQMJwXvn6s0vyQgFd1OcZzdM?=
 =?us-ascii?Q?NH4e75s8cHhge++NWyjCMqjx2mELPNNtp3wDksmHPlMZod6tBCXNSucpA9RE?=
 =?us-ascii?Q?P6FY+hGYZGrFjj1LdB3fOHbUFZfy4YSUKOYNZ2jh21+6kZhiMnKpXq7Gy/gN?=
 =?us-ascii?Q?gnT3OeLzGnyFj2sBHJLC2HlndsGDNmuMux6nlE4ayqawRl+Ktx3eM/Ezqzvn?=
 =?us-ascii?Q?8GpIaH+qhclSfJQUh8F99ijoqw5QBYA7PcybCCXN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289052b2-4db8-46db-a232-08dc4cea078f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 16:38:41.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eB4dPbf7wxfJY+2W/EJ4HlZglZpJlVoBcaKn1vuv6Eitee0t6S4t/g1w8XRrWVv/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
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

On Mon, Mar 25, 2024 at 03:55:53PM +0100, Christophe Leroy wrote:
> This series reimplements hugepages with hugepd on powerpc 8xx.
> 
> Unlike most architectures, powerpc 8xx HW requires a two-level
> pagetable topology for all page sizes. So a leaf PMD-contig approach
> is not feasible as such.
> 
> Possible sizes are 4k, 16k, 512k and 8M.
> 
> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD entries
> must point to a single entry level-2 page table. Until now that was
> done using hugepd. This series changes it to use standard page tables
> where the entry is replicated 1024 times on each of the two pagetables
> refered by the two associated PMD entries for that 8M page.
> 
> At the moment it has to look into each helper to know if the
> hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> a lower size. I hope this can me handled by core-mm in the future.
> 
> There are probably several ways to implement stuff, so feedback is
> very welcome.

I thought it looks pretty good!

Thanks,
Jason
