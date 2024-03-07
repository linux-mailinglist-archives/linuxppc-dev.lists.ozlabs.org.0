Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FA8757F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:09:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qhv3wS7r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrL4K5K9Tz3vcl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qhv3wS7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrL3b2lVcz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:08:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac8Fs6Hw4LimRkPHp/mMv43mhCPAt3gJVZCmHa/9037yLenYx2mz7xlubcY1xiUIsX++jOMANAcUepuBA6JXelYNMAyhi2jvHYBBxHZvyow5uVnkcV+GofzDnzLau0kr0n4ORDGDrKChs+6Z9e7luJQqDg0rLcQ071uF5UNry3L0Tare/nn6vB6Z+yIuvMus8HF731NVSujlsr85lOFX87w04pzCETsVd+dzKo+VNDbjj90E7VR+DTTmEyZxl6FoMbLnBKrOReLm9EEIlRGkIGSBCAJEnnanwJ8IlHcnYWR2dIeE9MWWc1xw6IDpfNeocjkqhTkNPOLB/x8D+HHVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8wQUDTOYSJlMARjTgmzAk5fpDYwgSG+FjZHuf2weMY=;
 b=SAPW3eCYJFCoctUs5cM/z80E1imm4P4wWb5mqAq0XdJfjELS7Nim6g+EzmUz8kq+tPn0TLfmvfOyK12nZOkz/qKizHciDlkUEBXQOfBZZQ9chjmEXqtL+mvGunAbvWA+RieGBp8b8Mva+rxNpoE8woMO4AN/pZ6MK32wTtW4Mn9E66UmA+CIKs3Ulq9pUkPcH7wSBtc5FwKqw2YrmxY1KMkHM0MDQeDWbi+DuNuzKWkyUBEkPXKwOmWUChPGpVN+4AYr6v1nXF+oJP1RNCmJATIlF4qCofrHQj7Wmb0wsSxgeaGglau3+01VNyFJ4bzNsSLzcnV3D0ZQDhC1K3JrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8wQUDTOYSJlMARjTgmzAk5fpDYwgSG+FjZHuf2weMY=;
 b=Qhv3wS7r61ETog1AQTy/bBDfpBUWwezej7bTW10Z6aT5nRBb2k6muvnmvWhpOXc/68uBodz1qTnWb+Xv/agMfv6liw8pjdq88v8xy4vxRNtwwPnQsDlngiDb+wYiFf0tLiWQ0m3LAIbnCoiIbNQsNpkxS3u1dsP6M5dnMS5bPuEBokiQqTqon8A2GycWPhWmKkQREIA9rAiNY2O8nSD2oF6rz0yXSOzv0M2dnJXTI5PdlUTYuqfDTC4DNGHCfwSgT5WkZ5Fa7sNJbMME9wzydzM5vMOYwMmhve/MnE4caIV2foDVo7aD8474a+piqKUC5T77zDsIv4d2Jlatrtmn+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 20:08:29 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 20:08:28 +0000
Date: Thu, 7 Mar 2024 16:08:26 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH RFC 03/13] mm/gup: Check p4d presence before going on
Message-ID: <20240307200826.GE9179@nvidia.com>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-4-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240306104147.193052-4-peterx@redhat.com>
X-ClientProxiedBy: SA9PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:806:27::19) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b10a5c5-e075-4142-0b21-08dc3ee25ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fJsL/DeLsT3Haybnm2Y2kJUGYEhh/OcxVNROe/21sBWEKdg4Igg6Ck5ySrnTeFrTRDPrTJ8EYQWiRB5VfwCFTmGDYo0wt4xDBfYx6aAuzsnvv0LFqUly0oQ3Tg8z8m/EoN2HGFukOEQbCtrT8GIGm7WaGHOO++N1Tc4nHSKGjTLjYgL0TCfSu5xBHJxO2naZOMmjYwt/58P6W9WqVQ7vkXfNwd1Q/5rhVcJ6cSiIVyro7gri9Zr1NcVfKqRQkH9sip5WXb2/Q0Q6p5rEFeLTiSKw409EsEFc6ZfHdDF1S3TC0aXgeynMsc9Fc4FMT2I8dNHlLtqVmndZsXjtpvrMHNY4XEzjCRycN+bUwkSsgvnfFKJ39m4rZLNrJuY0HfZhwKo/3hzo/qs1NyAZmapPmBnR6uyibtA2yI+xYTxWlUeSr+0JHCd7rCEnjtSEE6tZNnqNB5BHr8SzXOyWvdL2o8q6dHaGQt+9IlAguMPexBTg7Wb09nAagLBtrYnMGGaJxByj0ww2W8WTxLuah6+mSpoFHYutSSlMPkmm/S02hk5HeF4/No6lX86jKhysbvM5X0/hso84vyEMnFME9g2VBbA4AeXZn0l6eIH+R6gfJCibElrLsHGp3Eh4q0bqHtFgaOGd99oWnx27KohVQooElX8bicFAbRL3oneVsoVbeZ4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?H1K18NrF43ngrcnsp5NUFbt4fQoL4BH9lQUEl7UBDkCt3Gq/umwHhkB7tzQ+?=
 =?us-ascii?Q?eqeWxwyHIrlxTR25dLl+G2oPGrLy/hoXDdfQBnXbwnDc9qdv0YIWsGMLzmQj?=
 =?us-ascii?Q?fhenZcMERZdvAmBBIIobFEFppvaDvAwR5w9I7IeZQVGV5TnDyg9o68LvMBzz?=
 =?us-ascii?Q?mDTCMw0FV4+o4knmDYetADXvDqxOjw99VvFbtXm6yJL5RnMABsCjGkz2XEHx?=
 =?us-ascii?Q?sHZ962kRzTKZj/l7p4B6SDb4vyDRogVlpaqydlHHIUIFoqj7P1xh2A6w//O9?=
 =?us-ascii?Q?pc91VU3jn+NjjO3MlYRCCBXaHA2q377BpOcqdSxARE/7GvCe/tsT+eZkQ4ei?=
 =?us-ascii?Q?eQRZF3dERbgus3/aZxxSR3IN7tCfWq3Tf/GVc8SGPABe4wZ6o11gB4ytTfLW?=
 =?us-ascii?Q?f6uut1SjsV5w0BoPyH6sZz2LUa8TIGIq6kLVMNt2HDsCfTeYozlXwZWvL8Pr?=
 =?us-ascii?Q?iq/03PFg6VDgzs+cLBVPnkXIJqkOyYufkc7MtWhND6/jOggS1Ap6h65BpPtH?=
 =?us-ascii?Q?kqVkAXr0ZLnPkI4Oxq/JSnx/moM5oudl46LCQfo7Ln6ZGRDJlkgte33IQ7zz?=
 =?us-ascii?Q?id1Jr4ERHpBXf2vAmXfgUnuxPdTbkt429z7InFsT4mGEWFNELIriYPaW70dw?=
 =?us-ascii?Q?h+OpHUE2sthyzYr5UekjYVc+MNJdBs9VME7nCdcFRKu9H5SMxfTxDju4oKFl?=
 =?us-ascii?Q?pqnuYGjBXZ9JkJK0ZVXNc+Dr2chGfgGsdKYpdDtPVwnGBaQvBCFbLmwXjH2b?=
 =?us-ascii?Q?lf4dsMU8tGii0jSndrcuBgYfRVSctEUCCROZ4d0GFGrbSy4ex7fNhhR5g+9T?=
 =?us-ascii?Q?w+ukIXn4tElpLiD9LJZ29OX2Dorfncfi80e0+PgXyZt/zDdBfUtIjL3It0aX?=
 =?us-ascii?Q?gj/R7ro8hktxCVZe3FezuVSo5kuDv1C3xHGjWd7tCBklitgGxGSZueJwYHqd?=
 =?us-ascii?Q?iAxIurALRccV7rcPoq2Gve99zyCByMS79xLrGyOq+rEQXmXe1MdMR+pVHQNb?=
 =?us-ascii?Q?LRFjTBFEw2HzGQalAEDrFbRerDm0M3rYSw76TUGXnkP0vzWezb9gEnVHvO89?=
 =?us-ascii?Q?xxlY+jdxFzSGBZpiT3kzbxII87U2GrFFxZvW5eC0piOuyqHofMOhxs7vESqD?=
 =?us-ascii?Q?d5t0qb3uNNOh59WZ94y486o9o2UmSWI5XdkNlMvRSByqgMjBiIJ0kbHifWXI?=
 =?us-ascii?Q?EFj+IJZJUE1cWhLZ1h25f2ow6qxfzijucnKFghSdTNnkS3vDLq9dZRZWEBTp?=
 =?us-ascii?Q?Uy6V8PUzzGjs7rKAf7Rz9XwNjvQyBDQDMLub7nDcOU3+i7UIKOVm9JK9EQVz?=
 =?us-ascii?Q?ti31eQ05fTo0DNE642/d36tLlel4OU2SUdRpB5/AsI9l1jAId5KLiV4fFkL6?=
 =?us-ascii?Q?3LqlCzTprrEFUrK9ug/L03LG+OcDRNZKs2vyjgE7FvnaTMGlDnrfZDO7DBKB?=
 =?us-ascii?Q?9kzs5M+cZRMV2m1G+j8TJYC889ANNpNFywKS85lzuLvaAO5IlRUMO/Mte8oK?=
 =?us-ascii?Q?s+GNuvNQAgsQvdkerzjYqSBA8C44PZWaoZ9IuXxj0aiIVAbVPl9zg0szOq3D?=
 =?us-ascii?Q?cQ1So0tu8OMXtUWM8yg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b10a5c5-e075-4142-0b21-08dc3ee25ab1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 20:08:28.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh3/T1R3A0/2/VWGto8TaosNkvNNAkVY+qrhcRfHa6Yd8mH+VSFHupTFM/aXeCkI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 06:41:37PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Currently there should have no p4d swap entries so it may not matter much,
> however this may help us to rule out swap entries in pXd_huge() API, which
> will include p4d_huge().  The p4d_present() checks make it 100% clear that
> we won't rely on p4d_huge() for swap entries.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

>  	p4dp = p4d_offset(pgdp, address);
>  	p4d = READ_ONCE(*p4dp);
> -	if (p4d_none(p4d))
> +	if (p4d_none(p4d) || !p4d_present(p4d))
>  		return no_page_table(vma, flags);

Like the other place I think this makes more sense as

    if (!p4_present(p4d))
  		return no_page_table(vma, flags);

Since none can never be present.

IOW if the following code doesn't decode swap entries then it should
be guarded with a chceck on present not none..

Jason
