Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35548701FF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 14:04:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VCxR5Y/J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJnL5XdVz3cPX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 00:04:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VCxR5Y/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJmd6fDjz3dTG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 00:03:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMh68gUkXq63PXVzu50dlauXQw2cZ41eGfTBGk+jfNvIUGKu2g6urjzY5xNSeujFoQJWBFWIjLZVeAyshUVJUKIOq8AHpZUi7Rzyk1WVbZyKtIsc1eeldYO92bBI0jE4I1Ar/GhF1jeOswMt7wHvON7otxrNtlWtrN+t6Nh9iI4H86k8NbMjQqV2StzdLen3XO95MPZdfA+1lqnQhcIfV3lFhcUcyt5i+GG674z5nSsa5y+3Ccp6HFdGz7hRSpOA6t1A/EkYcuz0MEzWiAhPVZKSwybjy6lG4xbwt04Z8bnoXwErxchWzLaMgFLe3En6BXieDz9KR8J/CHQh8Nc8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4IrSclbt7V4Ji+rXWfqz5p8s0mDeK8V8fu4Ky+noFI=;
 b=LuSIgHINnSsVXrPFDYIaoex6mdVuWf7GzqRbwbwfUJNFixXcnB5cJL7EHN2vI03vivbEMjzwS+qAqHdpW/RlWUNPQFD8YijVI5jYTIdxWuHpmLss++fqh1cvTL7lRjKLji6EFgv+GKRLyyOtCCgsfxxBu+NqQBzkPNGuaK28nL68snnIYDjTwXIm+RzdYvzpApSpWKh7T1MHP8mXjeKSragjWEGhiKPLkBl+gsfjhePBtCTip91dTefT4YnxzQJD1+QgmTO6JY5IQYlbFaRWn8+hOQyk2PA+q07s2WiWIR8Kwb171QQdDeM8KxjcsTDXlm36rqu5vtqPWjjHeb+VIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4IrSclbt7V4Ji+rXWfqz5p8s0mDeK8V8fu4Ky+noFI=;
 b=VCxR5Y/JB1OjAotbYA+xXsAMHLiZYeXDrxVf93w4IOofcJ/sdSWrMM6Jwb92vOKncjOBYQs+bHa2qqkVQx9F7YKQKQUEW3MgAekFCiYMslP3Lf2OGwep84jRQUbLnpYUcAoRX1CU5b3vII8KN6fz9pa+wCc4y9QZCKV0kZFyHvTlzMh0ZZvDs5eu2yiIN5LoXfSGNACOn1ah6o7bCkCVdGv2JxRVjal3snNBWdV+FnD4gJIRCbeJ/mMMjkniBsUYnwluDFoTVbGov/8s245rbercMKbL4WmUSnyTrastHaDwbjnO3g8D98EyR9nbufr+FCaaSwgYkX5+nQ68p8V+tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 13:03:36 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 13:03:36 +0000
Date: Mon, 4 Mar 2024 09:03:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 4/7] mm/x86: Drop two unnecessary pud_leaf()
 definitions
Message-ID: <20240304130334.GR9179@nvidia.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-5-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229084258.599774-5-peterx@redhat.com>
X-ClientProxiedBy: SA9PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:806:28::34) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: cb166c61-980c-4b52-f026-08dc3c4b80ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bTjejDyBeHwtqWgmtEykQtgXR1g360JBdIk47PiOLywQA72ecg9qPmkP1bEh2A9+7PqL06vMf1AHpDHXYL8axd2iHCGpbL9wRH/czZqQ5SEmaUswdmXPUsYAmhIj1zQLkO4X7aY1CQ3Nc8k9JdJGhWGcANr9UuoDIvf1rCQo/gBK0jtIOzNZlPLqFts7RJ6x7HQUcXq/CfPtOLz61uI6F3o5373CByGgBHEvO3qmp0qV68Hu7sB5ldKVkb4vAm8gMoXpibChiWtuIJOyWbuh4Rv/uYfOpm4CwoeOz4W/4VKhuXyOsk+gt5ZhN8FsOxcA6wuZlADg0TLZvzd6qKpfWf/z6i5Va0PsLK9sqCQs44KU3CH/vafxk5S1H36pHF36v3roR6avgZW8c6f3OwlwBRJnqeVCP3O2b8E1qjDvHnz0rW42CeBdSyyhM0Ov4KYYFWe8ykldQGaBYHOz9kj9nN46Oll5Nj6hJWNg32xm0E+OJ5uIs0WbWeVpQuFw5JQlI4rsSVpSq3sTJzPx06UQbPbCm/SGK3buX2TGQWOb3oiusBY6ug6IeaMqUKnbysqhDmq5JEVLw/nESEWPSJamD1AYr+5dUqOc/PvbjtTkQrp2+aroHq5Y4Xg1iihXAMAmo88odelNa4iffKABbABAvwjBH5YX/MQMqimvKkUWrN4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Yix7zzUWlmQhIuX1op0uRkhcHilIPZOpgmJnaJ9TIIkB5WMoFXMZxZY0r+fu?=
 =?us-ascii?Q?NjswBJuFDd4ywTS+FVpz3R2GKCtWkGarK38cl/RakSGlJE0DgLIjerESUdwO?=
 =?us-ascii?Q?1TrYvvRv0w+66Cna6ZizE4Wojax86v3o9enxY3bW+DrOC3lTkZtGxLWU+YFQ?=
 =?us-ascii?Q?XnPgHGhsaQqXMOST73ZGesBXA99e6zLskeXLrAZBzoXbJHElQr+p/LhHdpRq?=
 =?us-ascii?Q?ErARxtZgoYOXHl4wkWEpzoJZk2UD9mhHJDSRGQT/gKnozxa9Vi8j6GZmS34n?=
 =?us-ascii?Q?MJzbDEpsU+pfji6U/1wJU8wFFTi/YUHc35XCNj1DbPXEkhAMW7qir7AMfRK+?=
 =?us-ascii?Q?Cyxp7TpHHNuMln8uERlYKJMaIFZXa+JPwqI5QVkq7AcTRSauWE/1nKJCJrRr?=
 =?us-ascii?Q?CsuE4GEormSic+ojYZSADd/rfvB73Azvp7YOb7abd3OhhGgA5aWcsbdsPS05?=
 =?us-ascii?Q?aHadnRl+5qA1QdW36WpOOAgCqI4Xz06vuyXVPC88sX4KbkhHSC3dpEszQjXV?=
 =?us-ascii?Q?RWrGrKfdku/D2742D2Rmcu2UyfwiU2udMM97Azq3B/PXopVJXHFZO00r7l7S?=
 =?us-ascii?Q?2XpXvOc8saKDxuTrrW/5dXPQEG/l7x5wyZUsgGdj09noSdJNrOPrOT+wDt/n?=
 =?us-ascii?Q?QfXmorafRDlfkiqU7fqE3wraNq0gnRRqOA97JwSRk7WkwSIi2SHbpSj2d9Rb?=
 =?us-ascii?Q?EGBbVj3oy4frSLXvbefnDE7f2sHHzLtRVTjyJW7V+jZCDHBJjaomT42wDWGk?=
 =?us-ascii?Q?GqG//C6unWzIBQILqisy0VWZfQF55PgyYwxijZtOS4Em7VVIqCBtc+YAOWxG?=
 =?us-ascii?Q?4cFSuMjuGX7s2lh/P674rV6IOb2NPAX3HZDpcb84Qtvbcw+9KnieFhHGHnAf?=
 =?us-ascii?Q?+pdsWXbPGanyRFeD83rXfs4u27zCiEVFXExdk9Tr64M92bhjvLHjAqrvCSu4?=
 =?us-ascii?Q?r4KD2kLurls8vO5uXBnHgIh40FMr+sUyYSHE0AdANgZ83vjYgyqB8Bkf1qjZ?=
 =?us-ascii?Q?Xel69gL/RrjdXmBqQz9ZMkFg+sh9hv/jLi8z6uRZKDztOtbo1RwOXFO3+tk7?=
 =?us-ascii?Q?Nm/jVSP14uGUxsU5rtVgJQVAXvcUIy26R1tHrec5UV4QrtusSYoEEBM3NYGw?=
 =?us-ascii?Q?tMJs0RIKElVhshKUIbmLcDW9hZzpJD90i40A47M1hpnhJhtjj0qupQMlCl1D?=
 =?us-ascii?Q?seHQ+Ktwe3tNR2YASskNOA2hupe3SUjvuSjLiKs2S2buToHtoA4/BTfR3ukv?=
 =?us-ascii?Q?tmhHmexUDebQKohTp/Gc4qvW+geYgwnRn7Fy2UHH8L2N71YF78QcaBnN0Bw6?=
 =?us-ascii?Q?Uj1fRPJ4DA3OHPqZ6uRozGcFLoGBG+gpu91inJHxPfdRVOh0j0G8Ul7WqYCl?=
 =?us-ascii?Q?OJJsXWn8uggCHvg28f5KLzlGvMhQf3GHYEzAq9u2IIg+D96ia8hRdADdkCqX?=
 =?us-ascii?Q?eZePIkRMKiSO2C0ZZ5y1/n/E1qohh9iqQjfLcXtJlE5CRxJKj53pX1cV0Sd/?=
 =?us-ascii?Q?SpTzQR2jFLSmrQXWKvBhl0fYZczWF2BictbPhJU511nbFFo+zON2+YCtBjMZ?=
 =?us-ascii?Q?lCrsEzccSlHZaL3NWf8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb166c61-980c-4b52-f026-08dc3c4b80ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 13:03:36.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+huBfKBTuwXTWWd/f0PxQhar4UJV4imd1/2voIR3aQEF9FvsKr+IjNhpSt4yoH6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 04:42:55PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pud_leaf() has a fallback macro defined in include/linux/pgtable.h already.
> Drop the extra two for x86.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/x86/include/asm/pgtable.h      | 1 -
>  include/asm-generic/pgtable-nopmd.h | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> @@ -31,7 +31,6 @@ static inline int pud_none(pud_t pud)		{ return 0; }
>  static inline int pud_bad(pud_t pud)		{ return 0; }
>  static inline int pud_present(pud_t pud)	{ return 1; }
>  static inline int pud_user(pud_t pud)		{ return 0; }
> -static inline int pud_leaf(pud_t pud)		{ return 0; }

It would be nice to have a final patch making the signatures
consistent on all the arch inlines, it should return bool not int.

Jason
