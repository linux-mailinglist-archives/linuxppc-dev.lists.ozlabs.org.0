Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA048701E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 13:58:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KgydFu61;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJfc2X02z3vgN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 23:58:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KgydFu61;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::606; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJdY6ZGwz3dRl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 23:57:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqu/qAkEfJVfYSSTRmkElWojiVi6N39MjYcPVhnsgRHWugvwzxyYlCn+XAQvfSmX8c9C77NRXCOwfoYEBeJWf1sa2u9M32X/CLAc/GVJ3ng0tmFfLebH6Zq7U9F+2NMmiFwKj/l359fbNdPOi+BffEnbVmzbz6Vq4HqL6TQFC9A+R2v/FQG0NRqLkmaKa1wIJSAAyrdqp8S2kzZ3CQa/VQkhaRLRhngiS4cq/BKPzIURi4rTFCuJnr2MRhA0kw7f7Nuz2WWdNW7NEgGcvHWz+kqybzZZwXX1AQimwHTgSd9q8IJMJcnh7Zi6C+Nuhc230udTzBnlETkyJB/BAU/UJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHpNzowK/7kgPIApFTyGCqhesgtmFXk20KhgDsV9T/I=;
 b=l5zkkiukTY0TXjnZf0xWyQUoL+bK8V6NZq16+iDTkYu8PxTKEeHQmix+DNqA8USPO2gZv8HLbikyfKBPOAoQBo0JCxjsGqa8zAz321CPOfsnq0KQUxUA/jbYsj1lfHchyncB2naQmKzGgBUmd/DjY6aIOwq67K8I4lePhb7ONResBXVCG2hHAiw+CIzWNeJrljVM+euQ7RYisH5QZiDZSZatukG148jPlyNsLAOlbkKwf0JvL34i2sA1tvIP+Iiriu+GAxbs2oNI0rSQwyJCf9d96aPJJsxSKGhqyB9b+T0yIlymXWvZImUFPkoelpcsMBI8WOVisrYT7EEwKSCkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHpNzowK/7kgPIApFTyGCqhesgtmFXk20KhgDsV9T/I=;
 b=KgydFu6132nXNfNVC8FEBBNwsA0f0Q6D/MgQa5aUkmmzeoLXU+GpuBa50LssIdjlkOxUGT8FtKzsU4M10I/rMvjwvMI0Cxu+VtrwKhB7a8PsLwdG6wfc/6Mc+JhKJaxWKSq9tghxm6W5cCkrfN4s+qBMUOic4+t9cKtRe8YNPPFNf4JetsGNyoXdsXlPzqj7maa5QTYHMaGm2aBMVvFzxpndmDBRcn3h8FmARNkpjvZqiX9hWN9LP27FRL3PthKk6lDTm/4oImVxH59Rhr3sG29rQWYHX091sMQck0fTH5ZyBKtRZ+ST+77IG5hYZ34MJvT2qUG3regwPehnjceeSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 12:57:49 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 12:57:49 +0000
Date: Mon, 4 Mar 2024 08:57:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 2/7] mm/ppc: Replace pXd_is_leaf() with pXd_leaf()
Message-ID: <20240304125747.GP9179@nvidia.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-3-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229084258.599774-3-peterx@redhat.com>
X-ClientProxiedBy: SN7PR04CA0103.namprd04.prod.outlook.com
 (2603:10b6:806:122::18) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 243c78cc-2ff1-4f82-c8a0-08dc3c4ab1f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TRylF9uEhUWrbSkYUugk8/X7c+WC5FlxRAP7rY8YI1CuUYf4JqqJyucoQZ62OiO4/+aRjBSXLAzZpM0E5mZTNEu1Gy8y64SdEspU0e952tnOv5YaL9IYGhlAqPgun4l36h5VkcvdlriZlnsSJOE3dmeiqA/M65AEmuIHWc4IpzrPJNJlLr17hJXWShKFpaJDh1rqeEhS3pHM67xmzi3FX1kPpCl7YVaqVtCjQUm5LLq/1Ov2fq+0aZ8nj4ljOU2U89bbI7Udd9mph4XMkJCfcvK2I69svxIyKNeZiwi/kHtljhC8/ohiGOhQyHYBrYfFHIom2qdqAy3p96Gw3YQgm2BJlpI8pQDzJmyQ29U4diNFv4ZVx668/fp9drT84VWlcaqRwn7M4/oPkvabSSp3Ll9uD242kA38Cculp42SO/11kCiOZVm+qTMmAWFFD80llosN7Q9qFikVLxiQIswbVedHGo/aJF4IGfTsMLwoWPSvOGJ+0xo/A74w63dtLpiWe+J4/Bj9FXeiIwuCFunomBSAnQOiIcOALip4vqfZU1FQjoFGCJqqU5Ie0oUPEmyvPvem0iNKdiF/ZOEcRvcYgHnZ0FXr6/KBfkNvDvzl8nhxm+qV998qR+wbPlQ8+9Of9Og3ebqUIvQ79M7aVh1x6mLdlKlmgp7MfSjlXTl6Gxw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?c9CoqiLC5t+9SYdqNC7Vp8icceCaoaaFlKPtWih6QnSReW2U8sIzSYCiR1xO?=
 =?us-ascii?Q?HIU2YxF2c/onTmRPEYAf1ogzX2nHxPP0ogWBOsbiwcXof6d95j5PylctdJ9P?=
 =?us-ascii?Q?nJmeTIYn7+o4f6k9mqk+yjMJUGCdZJZ5B1iiHC0xD8qRm0VsFcfxzRmUzLKK?=
 =?us-ascii?Q?mtLqKE35GIAsceMOnYxSJj+l0nlpQNV69mBkETpU/KU52RkMiV+LlUU7FKR6?=
 =?us-ascii?Q?49x3If4BYCifbU0V9sS2gmriy850rn+4J/CpvnX2tkoBQC9A9Wf3YmTZPPq7?=
 =?us-ascii?Q?BmvJpAQLGZ664bIUJZioGKktweUuEc5U76Gc5tAbVtnvjbK8KJn5UojqKG6L?=
 =?us-ascii?Q?emhqXS/FCa8arzrQdYq/HLB9X6MatcofLH9ItgmzzbpPoBb2wpVhvrpHctIs?=
 =?us-ascii?Q?iZlhG87r6R4zzZBQTk/82YY9JAN1EPjifIjaIAO8PknVbuLkFgZZInyK6AfU?=
 =?us-ascii?Q?+3d7RM8Xq2qNtRxLug1HNl7UUo9fXu5Va4QPXPccvueUtn3fHgSmxLKTYCua?=
 =?us-ascii?Q?zkNpObyoHJHcQg1X3m7ThQDS5TsiBZvU3ng32MFtc4QL3H05cMXdHm56C7mH?=
 =?us-ascii?Q?UCgQYfjGHXu7kiLB/hMv/iJFfDE6qBTxhupnyHIiui0+15hWXumqzevZ8p2z?=
 =?us-ascii?Q?gxcc9Y2+ZWrCtljK4WTuGPhw5cuDq8d/XMRosu6G+HyqEKb4enj3053FX/AS?=
 =?us-ascii?Q?ihfaST5VvP4VXelU2qQ3jgVOugEyiKjNBNYR4ZPUVCRnAFYD2VWk2sNcc2LI?=
 =?us-ascii?Q?1oe5M9wzDstfqo/1aM+HsOtV9QV2vLW0dAhWBFpfAj9fHTASSklcHkmM+Smx?=
 =?us-ascii?Q?e19JzU5nNPi5TRdsyQih2364d/R8NvgzU9c/wZ6L3AyCMCqzyday8lhGxgGm?=
 =?us-ascii?Q?7coiL7jeWsLehIRb95QTtwJsBjjZ4z0M0EFlBFSX4yQdOyS6xAh6ONN3BqAr?=
 =?us-ascii?Q?6QG3FOICj62kZ6thGtC6p962qPRXyWDuhdTcgUTxh+fuvZJS2ee2yMW7bYYU?=
 =?us-ascii?Q?h760dcBgsMODU9FtktISAnVDb0R/M3DYS2xzH218y7zIoF9Wh7QjwaRAtM5T?=
 =?us-ascii?Q?wu8h+uuneu37IdkW2/EOpZwFHHZedqmNR/yMl2uDrFb8tXF8wOXkDfLHgND1?=
 =?us-ascii?Q?axY8pYiCKK/GSmTUBqMaKh7PofxxACKUfYohst6T6PW9AvyZiJFtSiMHwNdu?=
 =?us-ascii?Q?65oNSIZ7uE6WaajfVOjvsufBg0qW7X7UeZpySwzS+avBwgzI8VFgQ8wynKCa?=
 =?us-ascii?Q?1GcJr47P8E8loBI4BvECKzLGdsOUw8s6HFpkDR1BmfUV8XMYW07TtT7eVhZi?=
 =?us-ascii?Q?b6LVzSdM7oJjN0PPQM+daCniFvOIFu+udwt1I0Mp+TASGeb3EQkiJ5JbzgXq?=
 =?us-ascii?Q?4UAxupOXsuyzqwSFTjjfbtwViCIthHWCd7IlWLWayN27krcuEZ2Tscb4NFhZ?=
 =?us-ascii?Q?KOnRRZjcwI+4rPr2Yrwk5I3KTSGEAUN+oLI5Gt7Q7M3qvOFm5S7Uaw7lCF1g?=
 =?us-ascii?Q?Y9MZsqoG2vioTFYMWVzIU9NOgI1XeFLuFbSXJK5poRVLo5gdxde+9wH5CXZh?=
 =?us-ascii?Q?JR/p3qyY5EGL1zYjqgs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243c78cc-2ff1-4f82-c8a0-08dc3c4ab1f7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 12:57:49.1803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wR2u/wST/p+GUEk5mAWELIiPbUorKDoavVbtlCgAv9XqWRTl6eHdQuWopgiYsjW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 04:42:53PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> They're the same macros underneath.  Drop pXd_is_leaf(), instead always use
> pXd_leaf().
> 
> At the meantime, instead of renames, drop the pXd_is_leaf() fallback
> definitions directly in arch/powerpc/include/asm/pgtable.h. because similar
> fallback macros for pXd_leaf() are already defined in
> include/linux/pgtable.h.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ++++----
>  arch/powerpc/include/asm/pgtable.h           | 24 --------------------
>  arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +++++-----
>  arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 ++++++------
>  arch/powerpc/mm/pgtable.c                    |  6 ++---
>  arch/powerpc/mm/pgtable_64.c                 |  6 ++---
>  arch/powerpc/xmon/xmon.c                     |  6 ++---
>  7 files changed, 26 insertions(+), 52 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
