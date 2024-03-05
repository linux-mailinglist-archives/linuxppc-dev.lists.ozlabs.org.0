Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0538723A3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:06:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q4R8PY8q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq0mz3r7Hz3vg6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 03:06:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q4R8PY8q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::600; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq0mD0p92z3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 03:06:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzolugL34sovFc+A0BAvSF4osaSiZ1nH9D0eiT1HYx3ZA11URn+eH+YpL9KNPNruewSIhsy2cfhhmVowMIxtRPH45KhO2E0CsR1sPvaqf8ThSRgQHksgqv3mP+8o3cc+KZsB0Opjai9Gj+/YU8YOI/BlQNQX5sD411VBgSUuOeEKk3iT9/OKvStfNslK+U/YMZt11Xq9oAa5ivYoeYC82X87BKYC1TC2rP3VMDs41z6LmrYLaQmcR8w0TWnynLY9bqfeEippIfmWf3zAcGDwWyTUjSxrZz2THykcE+Dw9c+m3myHQ3AQmdypxzc/SwJa+VqJKqgismIAtsAwnQU7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSh4p77EeOclB4dYcWDQnx8vJQCiB+u0lnIPFcSJrU0=;
 b=XqA8Bq3qIf84LXlX+RR94BSkw5nf1Cuc7i+eJpXcl/Hw8erCO9NyZiZFK7O1JIlYO3G8nOkWzy57dtyhbkCeSilLKeJYKN/VqqidqrI418kYwKZSvcsPHjmjC/Za7olCE5bbZLXLPVZE6489BeECOKpU7luX1MNmZDoBkBOgLhr3PyfERvqwUB9/d/tAP2SzQu3SMn1SSRk41Z17v32/Sy7CM+W1czJcHD2vP6IRONM4K9EwPFdMKQ9Pt1D1D4PBJEcgWWC5PJwLxulq9EpZpPcttxLRrUtAiriLiU3dkcNnusFiAtfO3U/1oyOK/aJdV6PSccg1evay+3bkQhGLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSh4p77EeOclB4dYcWDQnx8vJQCiB+u0lnIPFcSJrU0=;
 b=q4R8PY8qw7EXUZjN1C4XZeHhf0rDRDCIbNAdrlGPxw+1nE67bz+kA3ojID7gV/qCFnnkgwsKk0ftWWnsjk+DgdlbPIWkQGljG5xNkh6JbPtLpjMqKrRO2DH4c0bImRvGZG3Er5Ej4QNo2z/54JC7EiJAKqycSoFLe0w8Hi4O4LkvIuT96OpM+E7xKBfhWuU3n9Ihiq3w42sOVb00IpxlR5aUEjcKtKG3xObapdoTzV/3xfVtrcid706uBWARa/kyRmA71Xf+TV3cFYj60DsiGTOLuMNN16+YvJtalpIyAT+T4SvlDcS05XFfG7kDoRXaGwaRQCN4Win1WYQ09cS3Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 16:05:40 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 16:05:40 +0000
Date: Tue, 5 Mar 2024 12:05:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 04/10] mm/x86: Replace pgd_large() with pgd_leaf()
Message-ID: <20240305160538.GA9179@nvidia.com>
References: <20240305043750.93762-1-peterx@redhat.com>
 <20240305043750.93762-5-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305043750.93762-5-peterx@redhat.com>
X-ClientProxiedBy: BL0PR1501CA0017.namprd15.prod.outlook.com
 (2603:10b6:207:17::30) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1c0641-f72a-4fa4-ab9a-08dc3d2e1a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WD8KMZ9dMO/OQGre96F8ajjMC1iYklJfLG0Iw5dDkDOcwI/+jkaSbZNKYMl+i80iIv/2wyd/1qSQ5SK8+1V5oAEVTLyjH93ZFIS0990JuO7aYvMaueqbqhUFwwRtPYyN6eVX6mcKHoKybrC60zDDEstFhlWXBKz94MOLgRQABTmYz/XX1y/Dcr2/4IPlyPgU3eYnnscWmifqx84wNFLiBiHi9GTKmE+MYp3juYWSEyYBMN6jBc6zLMzhgnCwUAfU6BLSSEUcPXwpxwEX5ZHV2Tt7Bk9Gx6PfX1x+1gVF4hLP7/3i36Kka1pZeuovjuBr3ccjBcpWpJZc7GXjsdmd0LArlb5zVNuEMMCvKFokz4ztpsYuLa+OBZBsFqO/HLpPpcSuPyeMjnXX6S4MDbrEkqLNmuNaASOIWIgAS2Ni3oLnn/DgLPgOHDojbCNH14M+h2FzplnrbUAd9Qiu6e6MlZiEE+/znrK2U0Y/8yuRwvjqW7OuBu55UzIDiGu/sPDcD3q3bOkvKRurcZb8TSOXJwysLoWAk58ysWvafJKF2W6rJOa5ru0IHbC8ydHIfWG64K6D71wuVJ0bhqwnAJ67xrBQLp01J6CmAzzGgf9YDg5IYTdAu6nq3mhJNbOKVWmJArWOVBZi/4FEecU3XmYr1ZTPA2jY0rSTL52FSgB0iLQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xJzYa4VP3YCjNDFBq9I9xH/oBIV84c+F/+rv7STWFM4vzslzNZiqKE6lPKIv?=
 =?us-ascii?Q?pSMvAuDJMrzSzL2DwbYNyL/VbL7aSKBCgQ+8Om+GsCJJsz4SBLUU0X0kV5VO?=
 =?us-ascii?Q?cN3d+1nsmfvja7aaCgtYd8utKfaGvvW31g2PY04wUQdnaTlXEZ136bOoHNJ/?=
 =?us-ascii?Q?rXxPkRDp3pmhLzxYi+VlsyAMUBqSXGBUBAS78v4ZCv39Ja8uLmE9pOCh/bxW?=
 =?us-ascii?Q?K29AOWQ0DQy0RkJ9Nacnl3E7n/g05QMlc6vKDZM/kJMCWmgKVzvG3rZEPWAD?=
 =?us-ascii?Q?LTngsO+qHehqf4zWmp2zf4rF6BAFLAj5aBUooVjDqQEmPS93L9l60sY4TTPN?=
 =?us-ascii?Q?wNbgQRSefgDymHjws2Dkr0sedj/Fj8KCJsvyCDloL8vGkhM8x7lo2GvJB7hH?=
 =?us-ascii?Q?OazlW7Z7oNgYBm/PDUsqdPnAsWDJ9LWhGSg5boPzwEALWOOgK9cd3fV4D9qd?=
 =?us-ascii?Q?71mjy6KSoL0K3izQK0CpLWBhakCqvv7GBrAwD9cB9hQMVHoW1ytaMPO7Ux1k?=
 =?us-ascii?Q?8teZF+Y928eWj4N7QqQ8VL6gmrPJrFQTR1RTfmONsuQS11t1BAgiQ1tfQ5DJ?=
 =?us-ascii?Q?XOagkO0q2jRnwaCY+UCBJvPB3v63PvRBUEwNha5/zjULCxiqKgxbqf0kpabI?=
 =?us-ascii?Q?m3YLr2kwVMIn/yxJtytNVyg2bW6kCWWgI74ZCVpvRgCY/CwU4vC/ajaOVgE1?=
 =?us-ascii?Q?T2PqK0G4/ZiQX6sjGamkPNfEc8IsuYN8q4BmSycutkOE0VT1sOsKF/PUiqXh?=
 =?us-ascii?Q?gNALwDP9LIXs6BuKXTnz3ef20jEld2U3+dlx9jedB7hZmiLV9D9zmu2uCyBy?=
 =?us-ascii?Q?wIWF8FvDJMh4xC6KeqsMrTPYVykxTAmaIOuSA3Puy1za6lDqnk3euNwkOaWm?=
 =?us-ascii?Q?2/EhOl7edeH2pMQAXwX7En2qWq1XtuMjqYl8o5S83RctHDz7Gy396fqFargw?=
 =?us-ascii?Q?eByf1PPIxnz6TFz37mRTSUfAL2B99Vk6t/6oK3IwuiKka/kVyFKghF3X9Ho4?=
 =?us-ascii?Q?tUOpWim63HWwj4TfIwJkMESSBjuWoFfLA07pIYBu1y6yjqY+hkyV9PylpTQR?=
 =?us-ascii?Q?k0F8xQo0ITT3A/QFnsapMLNIZnMI2YgYYhovX07fnpflLVbzZjLAKUg4N3wT?=
 =?us-ascii?Q?bO6MuuAFO5fbRkK1tAIzaCfLXHlffC9K29nBdz0YjimcPlu+rKsAwrdVqSst?=
 =?us-ascii?Q?SJS2ujYDqpuZ+gkuBCZhrJsKOpUg8doOjKyuiUfUf61VCh22gPzcoZC/unf4?=
 =?us-ascii?Q?NufjD+HW8/k2b6GPTFpYk8jy4e4Tq0ukJj6ESUZx+cPYPVoPV6OBTDCJL0r6?=
 =?us-ascii?Q?1tQA+sovnFsHl5bqh3xaxeOopQ/0RWxkTy9SPtIycvFlSn5XB09cPbArjHxj?=
 =?us-ascii?Q?GTP+PmbbfhGebNwQTnZxYwLLIB44HHg2XNyJ8gY9+75p+3f2P4+cfFBtStpm?=
 =?us-ascii?Q?2HmyndeGghEcSYTqX8PEVWM7bbhmdfPyLuO9w9aEOusD2JrM/nl9lVjUsMIq?=
 =?us-ascii?Q?N0ktPy8gfiPSZ1gTycFDa1PNxUyFbg5Dm1XGe8LoC9SM0+13LzE/scg32MMb?=
 =?us-ascii?Q?OjlcbD5rkAF8gxoFhgbie3WD++84t555wRd67qW+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1c0641-f72a-4fa4-ab9a-08dc3d2e1a3a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 16:05:39.9549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zR9QSCaL967YGpMMAGxpMr/YckHLdr9ipPzcDCU9SQ+Fl5T3AoQOk/jI4o4XGACF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450
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
Cc: Muchun Song <muchun.song@linux.dev>, Yang Shi <shy828301@gmail.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 05, 2024 at 12:37:44PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pgd_leaf() is a global API while pgd_large() is not.  Always use
> the global pgd_leaf(), then drop pgd_large().
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/x86/include/asm/pgtable.h | 4 ++--
>  arch/x86/mm/pti.c              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
