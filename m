Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE48332C19
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 17:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw1141l4bz3dYm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 03:31:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eefOIOcB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.94.71;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=eefOIOcB; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw10F42dWz3dSF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 03:30:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr1nkdSsahjPD2dBxm8KcitMD7DHc/tXrJhzEynr+Es0R07U4QWRCmVT2aXxLM8QjqRl09L0W3Dq0n19d7wSvVJo1rDpQ5fNfMDH0XHJCXWC1iA+kXVeN5gDY2VEwVHv1CX2/bVWJgV14cBIGZqQr604OEm6/GIw51g4lxaD65nxF/U2a+YeDCbomeasfF8KayoPD25bJceByU48NnPrA7uNODIuHEP4h4zAQyGA6HnnIbkjOOCcyJFhfkbC6AEs2cwVJaeywHk6KzbQIJP7jD4jdHuQhNWAyRansk9CzBYywktGZ2pnvkCdUr9tbKPbPPnH33A4uC5D70oYhE0TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx4u4CqzyU8/bg10yk5Bvl3Bl81sKAITY/gse2edcuE=;
 b=iTFfsH0gekC0iFRw1pLUadK1MBLNuTKOQndGe89emM/8rYTh2ift0/Ta7P/oiuiibvwOHJH+C6KXXRGLrXS7EQ73F4c8fYRF2cR/vBdj9EK6QGjrJ9KGZc1f895OoJzMPId6olbXJ+mGSfMwXTvdczghuDXx/WtcDbGeMu/voOPBWJ/PZThJ6de+glMhwgJp10eBI561YozqhfnqSOxD9Wha3fRlrryvywGKoWaKqZUVGBsA+y5JeJXNBh26GKK59bq7M992+6YxQK97oBDQ+y6qySRjPNZQe4cLzKxe/ukRD8mCBiRsxvM2TgC5RifluSy3lA31ETjgTKG8crRT4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx4u4CqzyU8/bg10yk5Bvl3Bl81sKAITY/gse2edcuE=;
 b=eefOIOcBFAyS+g+SrQuqVsNWogEss2nMvBrf86frmzgL8DfVEOVFtolEch4HbQFUhVR6i2MQQPrRzLgifWugDB1BRZvHFTcGBiuiroQRFYQDGJzeG2kpJcQwqLOwnd1rBkk7QGp6JXcmMdfTArgnfiY8OJl5eRJxcFBTznupOWQ03YhjAfnNe5kuYb0iVbV/YnyjqZzPtSm1OBo8KnXR+wkHk6vVBKyZEiiZBEOdZsD6KA8FzTtq5ZULeEAHar4KX5/g4bDSwJic5DImEWlJsGzY+V5TklghySvJELC/IAOonQL41LvhaIBnHn1tcwZ2yt6ufAcWKschp0+4ofVn8Q==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 16:30:13 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 16:30:13 +0000
Date: Tue, 9 Mar 2021 12:30:11 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] powerpc/pseries: remove the ppc-cmm file system
Message-ID: <20210309163011.GI2356281@nvidia.com>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-4-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-4-hch@lst.de>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: MN2PR19CA0060.namprd19.prod.outlook.com
 (2603:10b6:208:19b::37) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 MN2PR19CA0060.namprd19.prod.outlook.com (2603:10b6:208:19b::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 16:30:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lJfFL-00A8Q8-4m; Tue, 09 Mar 2021 12:30:11 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a770fdb8-d9f5-4c3e-2467-08d8e3189d3e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1515AD5539AEA25E61904769C2929@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YB6AWWyhsRFzEZ77McjH72YwfG9fd9go4Fvx8vIcJh38nNWNOLp+DGN5WoqjALpxD7wFYdcNQn42PJyLo6ZsRnBtWr5JZiYIC1O7dxxMBJ2OSh5XCStz0vh4aEhUjE3WaqxMitanuIGJGeS6IJWIokVZHdr2mJOPy6zrC5Xgodo3OSI0gcGlBNloEL6qYOLS8z2/LihHud3FV4oh8npAZOpTHmZ8XVQhfzdUOKkO5kEIEyfBTCH+oAnjkVfDorb319W84dYZelaRVfE7aWn/bumEYw3o0z1eg4HaHZonpFXf3VtQ/25CBFpIhD/mMbGt5016nleizT5S00D0h5gfPGvpsOJ3Z4h8eN979gWpcuCxyQtaAeLhrhVXxyx4zU4ugiCDXYMnye1+Qlv8WBFRFGiyaiwdOTZLFxlo+TqVUMnKMKry3wEXtUTxCi69fdv/66bdWiztPEgD3LvEsMWO2I0DQ4MNW3yIcHNwLgopvuzxeCNssM+uRkWabXKK1bbto0+zNL+QvBHSTZU1WMICgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(186003)(26005)(1076003)(66556008)(66476007)(8676002)(66946007)(9746002)(83380400001)(33656002)(9786002)(4326008)(36756003)(6916009)(54906003)(5660300002)(2616005)(2906002)(478600001)(8936002)(426003)(316002)(7416002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GeZfUjj/BY4Q5ZY/Ne5hIbcRm2fx9AhzeVfKrcWHKhjvzQYH79J+bILlAEfw?=
 =?us-ascii?Q?2j2zNEDIHCPzLB7G4S7p5Y7dMEA7sQyVCJtJkLn0Xm1kEQ6apuACyV5qNcqS?=
 =?us-ascii?Q?BdJbsywgpiHuStyxySNN2Obpe8Z778/v+gdu2w/c/SOtYv4tZl+Vaj9by/Iq?=
 =?us-ascii?Q?reFh/L9gxkUMYEx8f/ZKt7mTEStsfT2gsUhVYm6ZVpiWqqof5faizpmkKGzG?=
 =?us-ascii?Q?BCWpV/uFrPf54pgEE59RecMv2dn4Urc9MNB+xlQZ3VMnI57lGvjmEREJYmkp?=
 =?us-ascii?Q?Y56+ZjoMuXrX5Q4iNi9dq3rbWheVBsd3jNtebQMaAwDlv9uliD+e1OkX49pb?=
 =?us-ascii?Q?EiMLClszECZ8J7zgMgvKW+86hrQ+vvZ3wKmCSThp1nNPy5tRjGTymojzwyjO?=
 =?us-ascii?Q?DEmvzj0n+IzB/P3tm8Qvwo9fmVVKGjgfCnxpoeJqQltAxv0bLDMP0l0sFK92?=
 =?us-ascii?Q?nOL/D1Ubu5am3HSgtjaVeMIoVeo+ijlJtS3ahc+bkqHD9HoTeM6Hdph1doPv?=
 =?us-ascii?Q?le33czrHXyn3fCF67xwx2GadwqIYwIq9qKUlI8f6xpumClD3E4FFoJTSh8vs?=
 =?us-ascii?Q?w/sFhoR1IfV7NnzkXcNWJe5XobmQqvGkw4e/oYMdPng9Pw06NGAQjQ+25mRP?=
 =?us-ascii?Q?5pYBcXMCx6KFqU3BregIWp0HGSUf/M5fhDfF753dwhBtcXgtwjcrD3aQbAK6?=
 =?us-ascii?Q?Ruh0ihhWFUTPa4rir/E3/hqSRi/yecY6YqmqH69dyiGIZrJRuqMacvm/fmLC?=
 =?us-ascii?Q?8DfWeB2myltlvUAd6kEgGnkVZnj+LgGXQ12jF6bYVSEimIB3ZGuDcVJwuKjT?=
 =?us-ascii?Q?3tZzmEdDfM9qKchuxAJW3KAZ3bxZFvWEAvBekomQL+BHS4YIptHAhY1zBU0V?=
 =?us-ascii?Q?r9ahlyffkSGY79sf6B3yHSY2Jn+3fG2r29z0lLpD+fqGUlVQQqDqdUgNf4ey?=
 =?us-ascii?Q?6LygnYH43wka2jpORwEMmSEJOHrVS4qvqwZcT5OIGyV3mZBoBTtVELpLzFkX?=
 =?us-ascii?Q?HjRN20FA0mv/ZAh9c2z0Rw21MxHC22jPS03qMKjLiuXjvuV9nLubjhXiaCzN?=
 =?us-ascii?Q?1tUZ2g1kPYibTK+KpiCKmZnwcM6K5KXfFjkgUwYIDIkdDQ3qcd6ij8k7pXlw?=
 =?us-ascii?Q?ydNgmU9wa5WtFI2B/Q7/oOemVkWMPhoHJ6Ek986ZN1bQQ8YU8M4ADX5FHfoX?=
 =?us-ascii?Q?X06u1+2kpWTyQaZdTPampDln5MN+9J7MbJHePvSq2QUKgKZSU0FT43tBg5aB?=
 =?us-ascii?Q?mU+y9DT2OLOKzDO3DcettVUjQDZoanGusIl1iPkW7WLRWmJTeDkcvLUQj9YG?=
 =?us-ascii?Q?oksXENpn2jJljsQnEvAaAUzhp/9agQKq4x/oxJ+QILJ6Kw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a770fdb8-d9f5-4c3e-2467-08d8e3189d3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:30:13.3578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG0fXvmgG4F/z/92kicWiUtI37//p+Oz3U8+UgFrwDdkQQo+kYm6bXhKFDMPFBa+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 04:53:42PM +0100, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>  arch/powerpc/platforms/pseries/cmm.c | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 6d36b858b14df1..9d07e6bea7126c 100644
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -6,6 +6,7 @@
>   * Author(s): Brian King (brking@linux.vnet.ibm.com),
>   */
>  
> +#include <linux/anon_inodes.h>
>  #include <linux/ctype.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
> @@ -502,19 +503,6 @@ static struct notifier_block cmm_mem_nb = {
>  };
>  
>  #ifdef CONFIG_BALLOON_COMPACTION
> -static struct vfsmount *balloon_mnt;
> -
> -static int cmm_init_fs_context(struct fs_context *fc)
> -{
> -	return init_pseudo(fc, PPC_CMM_MAGIC) ? 0 : -ENOMEM;

Should we clean these unusued magic constants too?

include/uapi/linux/magic.h:#define PPC_CMM_MAGIC                0xc7571590

Jason
