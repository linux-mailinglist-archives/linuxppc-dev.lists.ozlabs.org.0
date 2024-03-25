Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F21ED88A8DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:20:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y0rTuQ/b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3J7X56Lnz3vb4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 03:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y0rTuQ/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::601; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3J6n3FvWz3dWd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 03:19:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3yz4fm4kouV49ZUxOW6Xv+STx9qmIhgWhS29OJjSq3dGU6F37hdb+UTXLgnX1WY8OocLdmCCM1WlPH1fIhvrEQN/PYhWqG9n+l2uf0soBsZpZIyTCe4fmEHafKBwbJGZ4B2ixlirfx5SzRcqZcla/FOlexFm2PTOQ3+cVcqX34Xbt/huY4SZIw4rcKx4liI24FqtSp0IIwVKmnAYuyOQEmX7ZfKwg499iVoA0KgTp9XBJLyY9YigD85dz2+81fkJf2h2mbqTjscc7ab3iORoEH1qSHXszfQzmqOCE9pLDnMgPeUGPEpibWGzSvZtHSDarrcm8/hTFX/yWqrAp0Yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Kuzz4kAM0MmNLkTr7po/cfNPtpIyN31iuXORLVdAbY=;
 b=IGpaOtubglcYyGOrbWONC21/euCu1c//Uk98rDoGnm+M66dn0CtXRzYvPZ5hlWZSGZ+bNw0kAnCuuLlq0rg2Ey6Kb0CVbmbXAdpV1ZOF80qDdWhJbcrzlZ1TecX/hk4K8FFylcaDcFx0NHRtaFlA3Bu+xtje/XQUq8eeL3F6RTyS8Kuc/RrtX1xFMVOXz4ZKIZ2JeXm/uK+2onefgYQe7mjY8ogRj87Qmdid/vze82CTVc6xMNzIcHUe9I/uXxz2ewWA/jVYz4QPhorB9YTkDcztRYxdh1X+t6OLjz8+EIc74K3Q4y85xU3NN3fLnuXs8uFhYGkQU7fVF8wFxx8lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Kuzz4kAM0MmNLkTr7po/cfNPtpIyN31iuXORLVdAbY=;
 b=Y0rTuQ/b4Q6Deo0IDbYR5V40pu7rmJaLx3ccmHj6nyBov3/EHBB2dNd3lmUQhF+SboZThA7+noWJnXKa9obBGgRS+f/sCBseRTNcXzUdlXYN9nCKyfScap+oclk8tGLxs1eAAnmlkjkl6lDCXuUolj/jU9xBEm1dxPTNtf2LrfvWsJmVtfwouC65ANq5i736xV+s9zajNUnbJhAcBX09BHp80mnnH4csGp/031/EBKhE69Vdaa/ntAXJ9eOvAEVIQFKyuUA35w0jucvMfX4NXWdut3JaF6gOtCdUa+fOB8nacSCQz1Stik2L24bBKdSeLW1XWIdhkpLsAkXBUpeLeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 16:19:20 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 16:19:20 +0000
Date: Mon, 25 Mar 2024 13:19:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 1/8] mm: Provide pagesize to pmd_populate()
Message-ID: <20240325161919.GD6245@nvidia.com>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d78f1b7e7f1c671e40b7c0c637380bcb834326.1711377230.git.christophe.leroy@csgroup.eu>
X-ClientProxiedBy: BLAPR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:208:32f::24) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3e14c6-94cc-4aa2-404f-08dc4ce753b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	v5/IRBsIVBObxqY06oC9Upim19yMjJxziQgnNAZpFrCNhbntcDh+7hegYCZKNjYcBMXAaUCiDqFOEI/J+2biiJFD6C9h8VmNBvhcc0YY7L3YyMmr08Cc4dZaX7Ox+LvmYBqT7MVkQ/fPvnB4EJ4Z1ISg0xV3k4P/yMlxi1JUlmxfoU+mWnZ12THe9PI/6IELMNLKQ2+wjprrnzcZo6h7iekfovwJ1N6IVqiF+wdbyu0VKkRcCm95tXY6WJTqMQG4CtgmMV1bx6HEIGX6lT3mzO3MS/8Zhmni7woylBVp9uplAdZCFMJQU+aSNWahpqqZ3mWbgxWiyjiSXBtLL+4MG9AfDTaWOq3mmA9YlvQ920EYYzGcXWzDRz0aDMN8EAySYN1CQJjSmWubBhGKX1b7vhpyg0DIega+ajCKYd0tqEghHkNGvwYDBkEDGv1H5B1/xww0Dt6skA3QEGPSLviJSiUZxOoEpU8mu6rjlG5lrZhvLraDBr2FfyBDk3Pp3mXELmX/DO2OPxkUDkTtO4QN89GGrQYnXtYWaIotoCx6M5ylTidvH8kHzb/40B4vDmxtqlQ3iec42xuOOUVSC+8KE+o/hzRdx+JayCXVrrAmTPS7IlDP2e4OsAQhZbhugyCqqgHa1GzUEuL95gi/Pwblfw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CMpPP9T7RoE9moXFQG/wI96fAFoieYr6X82dNxspzDMW+sHu1JmL+buMDMCC?=
 =?us-ascii?Q?4yzTNXtA89zWPSKHjlCsp+uCCZGc83tYHI7gNh5eGZD/C4hWq/7zfTs4PE+H?=
 =?us-ascii?Q?FLKSLiXVFIImnlaOTkVD6krCP41pMBkzL8sLJZ+aM79sE1+bFyzbW5yr24L/?=
 =?us-ascii?Q?hF/R11X+ACCO1vX/yEtmzuR2GCVwCfkK9aNUZINNhEJlR9HyoAuRtqA49mYR?=
 =?us-ascii?Q?rlmT/DBio5rW3LC8BYyOuVgzNEqsavHaRoaEhS6yFosUuURTGmFI0eLARQzP?=
 =?us-ascii?Q?ZwCm1Mn++jfETaedUesKgwyYqUYndsK5VVn74WL0rUh7RpuZ4I9IUCwbMSCY?=
 =?us-ascii?Q?FqM7OL6Jr/4SZ30exAwDvlZ/Slsu3VN3GvkRI2tt+DNYQBxgQUdKUKtPID8/?=
 =?us-ascii?Q?cB9tCnyJRLTb0NhAvboM5wQrM/wLe31YI+WEMXEhHZl65lpo/fLkiFlnBhPA?=
 =?us-ascii?Q?oD7wU/C/1PVM1F9TILz8iSRGrwvhCVPlgV/CHSHpfw0kmo9gYVCEw/GjRryu?=
 =?us-ascii?Q?qDoYi2ag7s1p83bVUt/TUaylHzHgg1Z0jOvE58PbxfE9O2BhMEXR7KIG7Obf?=
 =?us-ascii?Q?/xyFeYXWlTasoODkLslBphCrEu7DIZSc5RqAEiAVSFU4EHCHy6Z63clBi+BW?=
 =?us-ascii?Q?40VDSVyy3veKpU5I9/SCI946T50zsbgeu0SVy647JBt3LB7UG6LpFF34687u?=
 =?us-ascii?Q?V/RYpPzJcQPMNQuc/ELT4IMnTVrZE1HYE7KCIllPV+FaBA4wvIvp1PUgsMZt?=
 =?us-ascii?Q?tjT22e5ecKCjMqfBovOaL+2YpnBEsNYBgxwGfYtfVK7spzeQIVUOewbgklk3?=
 =?us-ascii?Q?h51B+b2bysBORYILx/YSCMR1vsln97aVs2MhFw/3qYC1qgQww63OqQg798Xr?=
 =?us-ascii?Q?FrK8d+6fPblUqgnUou3m2ljs/SLQgK5sCLYhnJGQ8WJYsOYAPwN1pnFsPGYR?=
 =?us-ascii?Q?wqHqC8f7qryPfWCKOX6G7N0ZiirvxzjCj2RLkPQvmhJ1l5FZ+rRN4oa3/PO7?=
 =?us-ascii?Q?5cKjrNEkyBu+8Jmk3xxku172/gl/HJ/IYVIm97seuU8jmCJBIMWYWquDVPwD?=
 =?us-ascii?Q?IRbIkpIWEriWoC4hE16KleDx+nwbX2TrvHZRjncTLgH5BRNHdomvgHecY3i7?=
 =?us-ascii?Q?h/8SDSZ/ozDE2wRTz9D7RWiUkrKLhErqmOJ6PzovZgDAD414aJyFyaF9gpyg?=
 =?us-ascii?Q?AWyyJhVNKzcalyGMVr3TejoAKI9Sv2tx1XWGTsQ5ovXTrMDf7t0V+CtNmJxU?=
 =?us-ascii?Q?Y7qMrRa5jI6KolnJVkSlo05LteFqSfUbxqyFSQpVJaqOvxuC72Lei+qCmLKX?=
 =?us-ascii?Q?NKRYW7jzBk5ZNj3/iCVEaI72yUjwt8Y70I75+phAraPrGxToxUO5o6f2TR+g?=
 =?us-ascii?Q?Hk5g8VESNJCGZVgeofvbmy6+dlnnyUZF0VgLRed8Qw9qDpP7f2chfAe44u7E?=
 =?us-ascii?Q?sS9F406tVRq5/Ss/Jo/czceiwpRJw4YMwhVn4AfXuToVlFoqiYlvBlJpMPxR?=
 =?us-ascii?Q?uOwnbzkEAQhkO4BtzzFKiFqNdZT77TQmOj+hA1Wg3jIDNztgGvls0LUoxWho?=
 =?us-ascii?Q?Nc+wjTVfmZaXzSmlr/gdEQseHLHeMIupvAKgPwN7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3e14c6-94cc-4aa2-404f-08dc4ce753b7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 16:19:20.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+Zz9A2j1imQG0SR1EXhFKxsNHL36k6WaNoume3wUwr1/SmG1quGVFXxnBsOpTUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142
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

On Mon, Mar 25, 2024 at 03:55:54PM +0100, Christophe Leroy wrote:
> Unlike many architectures, powerpc 8xx hardware tablewalk requires
> a two level process for all page sizes, allthough second level only
> has one entry when pagesize is 8M.
> 
> To fit with Linux page table topology and without requiring special
> page directory layout like hugepd, the page entry will be replicated
> 1024 times in the standard page table. However for large pages it is
> necessary to set bits in the level-1 (PMD) entry. At the time being,
> for 512k pages the flag is kept in the PTE and inserted in the PMD
> entry at TLB miss exception, that is necessary because we can have
> pages of different sizes in a page table. However the 12 PTE bits are
> fully used and there is no room for an additional bit for page size.
> 
> For 8M pages, there will be only one page per PMD entry, it is
> therefore possible to flag the pagesize in the PMD entry, with the
> advantage that the information will already be at the right place for
> the hardware.
> 
> To do so, add a new helper called pmd_populate_size() which takes the
> page size as an additional argument, and modify __pte_alloc() to also
> take that argument. pte_alloc() is left unmodified in order to
> reduce churn on callers, and a pte_alloc_size() is added for use by
> pte_alloc_huge().
> 
> When an architecture doesn't provide pmd_populate_size(),
> pmd_populate() is used as a fallback.

I think it would be a good idea to document what the semantic is
supposed to be for sz?

Just a general remark, probably nothing for this, but with these new
arguments the historical naming seems pretty tortured for
pte_alloc_size().. Something like pmd_populate_leaf(size) as a naming
scheme would make this more intuitive. Ie pmd_populate_leaf() gives
you a PMD entry where the entry points to a leaf page table able to
store folios of at least size.

Anyhow, I thought the edits to the mm helpers were fine, certainly
much nicer than hugepd. Do you see a path to remove hugepd entirely
from here?

Thanks,
Jason
