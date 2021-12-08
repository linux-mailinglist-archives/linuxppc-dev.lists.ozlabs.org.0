Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4266546D700
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 16:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8Lhg17WYz3c6W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 02:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=spS15Joo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.244.61;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=spS15Joo; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8Lgw6Pj7z2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 02:29:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHrs/kPBvM6uI3pzYjhLLd/43CnFZ0tG7hin+v8VLrRPFgQSQ7xwdJK3xpfYRpfXdEk0mMVs8Aeyy+V897LZo62VX9+Pm1NQP/AErS9t57QHZ/hw7CRNf2MTfa0AK2m5ADpyyJY/UiIBNQc9NmpaToRCubLgNMSFe060ed4f6RVwOSSChjGAnDz94I56syrfGeBJeclZ+5cclTWX7Irb3vwZsrHb09JYif4SdacHkVpswQN2+Sh/ouhCbGEOtCkC63PVeH4YIqWX0XJq5VA5k5nMT8AUCeAjM9CcBqD2MHKNrb6IaRyrPy+GU8esciGQR4GzZZnvsqG/3PXqagsh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqIKwXBLinJdRbLsCXtGFLo3LB/oiMwLJPzx1nKQJQw=;
 b=nikdS4aqQd/bQMgGAaoN6ukfZszz2ThAASRdrLXFANqjUriC+GBi9dINRFkj4eThaKbwgLgWTkWTATdD2GVrcQIhEhz4+yjAYZ7c2ECvJH0UJxITZBdh9dRlYMatsewSKkkuvLcKciiiMwXmzH7+5TIJs20VewUMQfp/rR2UiEwLIpkS2p2e6qDJsheJLNbNnEQjatruYkCIKQIyY+ZoYJi9JsXpNnciA/HNtWChPPreNJx/45TRnDUQVrA+IM3sp3Ux6GNvFLcY0OR1uhaAZu9OqplDCSRxYGeh6yzm3ql5XF2gq+/xF9PdRFL22s9uB9gEEIS9yM4Blih5Sef4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqIKwXBLinJdRbLsCXtGFLo3LB/oiMwLJPzx1nKQJQw=;
 b=spS15JoopGFSv4KyzklfRP7r/1/fjYuQC0XvItGorKGo344ca3Ls/qajExfARxs+10UfJ+QdM4JqdDuyRb6xN+xU8h9FB5nu/5C0fOYQQzQ4HZi8GXtvh6sDxXODLgwKGvI4a5o+8IgyC5BuQx/7e+i5+ww1t22S6Hwmu8Rh6AtOMSs8FWLbou1vTHCRrre5UpFF/JrkccO+39LIpNcxb2dTU6Z5ZtzI2nFXJNAYmPem+nOBB/gvZ0sbfArBteHVd3n7Amj/ZXSSbT/konZrtF2I25EfgI92oNHYal1q+UUmguGlaidUkObUUWj5dpZVvFlKgb00CsY65DwiX5uzrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5127.namprd12.prod.outlook.com (2603:10b6:208:31b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.19; Wed, 8 Dec
 2021 15:29:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.013; Wed, 8 Dec 2021
 15:29:28 +0000
Date: Wed, 8 Dec 2021 11:29:25 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 20/23] PCI/MSI: Move msi_lock to struct pci_dev
Message-ID: <20211208152925.GU6385@nvidia.com>
References: <20211206210147.872865823@linutronix.de>
 <20211206210224.925241961@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.925241961@linutronix.de>
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f90ec134-269d-4019-2b5c-08d9ba5f85ba
X-MS-TrafficTypeDiagnostic: BL1PR12MB5127:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB51273842AE9FBFD29E22609FC26F9@BL1PR12MB5127.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3eVpYRpFFYTOU+vvrXBZ+ygMslxmtbo/hVH9fvie1kilzPEcIAdgCRxWgl6HWAfN/6/QzyX7KSKORKOcMDQkl6taLlAuB28200GaHKd419HPSjWCBFZ77PKRIBcuixHzKS4Yxxgnh2PEt/drqdKjJIhlhibXIyFgDioawlBMI/U4tDp1M/Jig7cGT0bn1iOk4r5f4Ec3SiYAh1xkbzjp5Lykm/j2B78ph65wX/R59ZHHk1FcWWnFWXSpx3End6NFtBai9BhOWGdCZDIb2s4vmk8SmodKXEBeqL5uFmAWivxfmx3wjPqC4SkzaKsi6lyOv2teNdHikDaQkN2TbtX8QDLN4kIJLD+KTUYy3BqKI4CTYEHOhrR3zG1lCo2bXDeyT7i6ke9zGGQl9K3LPA1OjAr27Dayf0u+aoZSlg1mmsJ7A47YA0htoC/u+1kGprlMUt8MpIEacGCAMZO5lDA6RXhOPOwc7EY5U5y6vgDDk4p3Z8NxOgsLtsGFdTI4hHYZRaiz1qL3We7RgCJ+u+18Oi/r5wu09zej02zql1QeT4uIV5qqnHUC+FM5NnTb4GGkEAapWrdnQlX78RU7FU7KLcH99lSQKcjZY/PpjCCQ5G0OG2381CiVlVcQpo6k26rUTfDo9AsZj/+ylmK1IxueA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(26005)(6506007)(36756003)(38100700002)(316002)(83380400001)(508600001)(1076003)(8676002)(5660300002)(8936002)(6512007)(4326008)(6486002)(7416002)(66556008)(33656002)(66946007)(86362001)(2906002)(66476007)(2616005)(186003)(6916009)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4qHNKg1WQH+kBtj/dK9f8zuC0IkmRPAm3+jbYJTKYf3Vur1eVMhVVzr2+lwG?=
 =?us-ascii?Q?czumodgEA+8VjQe7oHIEchjD9aOhAgV4/COqKYGIGrexW0TJ4SulZAEsMioE?=
 =?us-ascii?Q?jn+T4A8G8Kskbq/xJOX7Ggu1oHb1z0roPtMDnxgAkzxqQpNQuQcs3iy3cgeS?=
 =?us-ascii?Q?6kiDxYEJYmSw2hkSbOPn9CP73hKIXfRmP1KAzSVCv8/7/apybkKqMjsyoZYt?=
 =?us-ascii?Q?ClOuzt/ewNWAugLjrEFS7NAnRn0T2fxcoTeDNPOhIakFWXYrWXKg7qemOt1L?=
 =?us-ascii?Q?Z8ENKfX8YogRZLvd18s2gC4VzPfarVkIAW066jAPI5tvbkNsTm7TdzhtUoLP?=
 =?us-ascii?Q?5gCJqHREls+EBI+Y7pSzwt9PUBl0edvuN95LEhYMb0ZI+GjDYxLQLY9Kx8AP?=
 =?us-ascii?Q?kBpOfcTQTiEFArtuZ+fhg45mxcrRDdOPofagKG8OUPXXJAnaHcTjfKGrNUZh?=
 =?us-ascii?Q?sxVNOtfl3iNjDOs9WADBtIWvaM9eiyS10KtgUBPit3of4Vw0C+mhuXQYqA+n?=
 =?us-ascii?Q?Xg6o3AZxRLwDS1LO74Ax6zPTa72TqY6c4bV8q+vdUfZIN4/FxmDWY4L6k1Gm?=
 =?us-ascii?Q?ESl3e5ZoZAMWX5xNmi/k6bNEDbKu+Hvxqx42gkkjeL5fJrFNtzQ7/LwH1lMM?=
 =?us-ascii?Q?Hhhd8ZVYNngT4wme7g29/ukeftbxOfMm025p/BDxyw6+VRQ60Qt7I1WVoyHd?=
 =?us-ascii?Q?7hyf75XN6KHNk5bh4LE+SpaI8CIkY/hZ+xgbluduy/bINR0KElraxxGx78rP?=
 =?us-ascii?Q?GGkFVq/dmT+qkSn2W23tjCfEicvwoshnFFzWNpnAYAc7S1eAxhtJk7qKNiJ/?=
 =?us-ascii?Q?wEVZoSM/t/d469Cu47BrH5hOX8RB5mtXpl4RdJds+mvvXv+89XjGLVCyA9nx?=
 =?us-ascii?Q?yhr7943tLsjX0FJbPaDUztHShMMHPCciwxnx9s92+E89cHu5OnRqMtVBTS9i?=
 =?us-ascii?Q?W9/dOZOHhG5//UZOrkFtNvzpcQR7o9Ruo60OTE18DDhCzJrj3N4fwouMtWEo?=
 =?us-ascii?Q?VVOkgxfB3fm2FrGI6BZmCOBVpYQ7HVeY+FNrrdSXtXUBs2ezX1grCbjHaH6Y?=
 =?us-ascii?Q?+gVS7c6AbxlNw+1ZGEK2mBLdhu/lfpNbBh7bHvP/gQFigicFZMlJQC9uJlce?=
 =?us-ascii?Q?hcguvHjxZAcsE1YycbXIWF2BkfnmuaGjVZDULyvAORReXccmz5wPbF5LoVIj?=
 =?us-ascii?Q?sj7gu52idywq5M5wGnFuUzjiwxt7aYqxviKjAevtRCVR6s+iBzyQ1c76mPKd?=
 =?us-ascii?Q?gXcyPtf3qpEpfg2E9yg20NOG1aOmTaMDGBIG1DWwQJQXt92e4EsVkgKb+Zcc?=
 =?us-ascii?Q?JvE0BkcdwAH3l9K5IIzdEpqS91wEG2Msmy+mhkb+MR80Vle8inGplLwEP9R2?=
 =?us-ascii?Q?Ufq3aMvRMmMeqDMGi9UAyqiPs2SQFkdulATIT5Bl6qcI27/g9ByxoE0ozt1B?=
 =?us-ascii?Q?sTRESsqyymdY64s2k9L285cOd2ar3wekv85B0GQ4bMwAJ08hsr3xxUKgFOVI?=
 =?us-ascii?Q?OCQZZJ1OrVxujVpiYFUBz8EVfIAa+0eRNPSingf+iqndZgIWOyptWX2cqDFo?=
 =?us-ascii?Q?2NYb/o05UKkV7cZ+3eY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90ec134-269d-4019-2b5c-08d9ba5f85ba
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 15:29:27.9428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfMTmdcaHlz/BZrC2JZXCui5mkQVZpKHJFa1nbioq5UXjn3RJ3Zj89JoFzfAoZYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5127
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 11:27:56PM +0100, Thomas Gleixner wrote:
> It's only required for PCI/MSI. So no point in having it in every struct
> device.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: New patch
> ---
>  drivers/base/core.c    |    1 -
>  drivers/pci/msi/msi.c  |    2 +-
>  drivers/pci/probe.c    |    4 +++-
>  include/linux/device.h |    2 --
>  include/linux/pci.h    |    1 +
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
 
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
>  	device_pm_init(dev);
>  	set_dev_node(dev, NUMA_NO_NODE);
>  #ifdef CONFIG_GENERIC_MSI_IRQ
> -	raw_spin_lock_init(&dev->msi_lock);
>  	INIT_LIST_HEAD(&dev->msi_list);
>  #endif
>  	INIT_LIST_HEAD(&dev->links.consumers);
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
>  
>  static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
>  {
> -	raw_spinlock_t *lock = &desc->dev->msi_lock;
> +	raw_spinlock_t *lock = &to_pci_dev(desc->dev)->msi_lock;
>  	unsigned long flags;
>  
>  	if (!desc->pci.msi_attrib.can_mask)

It looks like most of the time this is called by an irq_chip, except
for a few special cases list pci_msi_shutdown()

Is this something that should ideally go away someday and use some
lock in the irq_chip - not unlike what we've thought is needed for
IMS?

Jason
