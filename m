Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8162C6F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9h31vXbz3f54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t1RnZJSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::602; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t1RnZJSX;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9dz2fJJz3fDx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:53:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMtZYShkRvr5wsrPJaCnxJUgel4k1n4d+0eW3y70KhFJFx83ppwPbbHTJ3J4ixFnlH4JLww/pckFQPHyxblQc2HvwXSQq0p5hCFGpx2g4ada+Ro7PSYXOVfaddrm2WT3DAzxm/hjbil8gGh7i7hNvxm976H8snRBn8ZLwPp/U7Txf4k86duzd4v28y3NwUML7Kt/lkT56PLxJ9RUoEWi4LC4Z//rvz1S+bS2liE1llImwSVPDaohHe5eJqLfLpzbAZx0p344HUIHnEJFRr/9jmybpPWVL04YH5B24NxEqqvaCbtFufksI10lzZn8Mf/UTNwEIlZWEA4z/RD5UtQrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4PfyU6965SxkVjigx4XetlKhbhIVzcq2U3xAZ7zqBk=;
 b=RcCizxyC2eK8465jco9x7wGLtOkXV6q1AOGuKXlrXyJ3aGBS6rlxbSKdyQpyKtheaO1ah0C2gFzjtxzUo2aXfOuqXsK+P+AOCWMMITwolaj4tpEZ1matfKfrN34Ro7XJL2dLn+6g8hRyJ2UoxlpxzX3E61WX6A9uc40JNXKVEgB90aL7cGkg+NoJGiKUZkjqOdVfTdUiEylDfHwM7lumsx54TvJoHK1JfLN6bjFTRlYTMHIG3aLsnssG8LyAZRiWJ5SjwoRIxfonHUgizio540uA1reYbLz7TCVVfb+Pj579B9pj7Hi6xKPD6PyV3bB3IogLJdbtoGD+Pg7N6b9OIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4PfyU6965SxkVjigx4XetlKhbhIVzcq2U3xAZ7zqBk=;
 b=t1RnZJSXTkpqG3PNhUvjJFcU4mrPAh2VLkD64LWTZ4Ydyej67vHkuqNj/zGd7LkaQpRU4E5AxVSk7frKyBCzvvt9M8PnE5cRF2pw8zHmy9KnnsYJKOVNZs3W0PU/DcWUpVKYH2/rKZsjBSQ1rLQphuLA8ZpRYtlqRGRJyuq6F/iQ1ipKKJgJk6ZyF+RVMNZ7E7fzD1xMm6PUVqUqD3T5mNtUdF3iee+aGhKrt+1ibGi1oOodFjplkmspjdFSTfqKcQdSMyjsrYKZRi5o30P9nn2PNP55Kpbqc5BlMGisAkvpUR64a1an8RtPu8vallNXarsdAJhj4RP9YDQ5wT8X5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:53:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:53:38 +0000
Date: Wed, 16 Nov 2022 13:53:37 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 14/39] PCI/MSI: Let the MSI core free descriptors
Message-ID: <Y3UjofjdGh0TyP5o@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.409654736@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.409654736@linutronix.de>
X-ClientProxiedBy: MN2PR01CA0001.prod.exchangelabs.com (2603:10b6:208:10c::14)
 To LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1c8dac-b1df-458e-03b3-08dac7fb7d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	or0G6ZKF82Im5oJpkzZj5JphJXHI0tD4bMuoBqeD7BJTKXj4TKsCKU2OVMr+vWfdFtK1dIPUU+NAjO90BtQiK5nEpM5iNxy6Tl1VLYDcjm85GYsI+8lY9YoBBPg6OUWID7Pz0OnQslkdSDrlvyRJ8jYGYraeqxiZnFRuY7K9bYYHnJiavyjRG4bulkKe6/lM/MRlMYdPqvKPWEtbbhQ2CvbpebgmN/UbOOEfqg++0VVdiArSnnhLsFCMv/rpecolqAD9QmZ2iOyqaIMIlYBGrLs58Kt8mp0GXDXAytbzLXMfOnfx3enbBWBYcWmqwrUr8WSx6XjOkzEJPTFzbWDD0snuXyE/QkGzxxczVspkSNT38+GdZRS+XZn7R3t5nlgMDbEnZGO4PGUunS2ymYMrz9kt/qIgXGevxQBuq5ImQGkKNT/Kdh5EPgdx2tMOxaweGR35rMtnD72MRPlmOzJg5CXbqiuoyNGKoexBxrV/sP25IjwVqAHjIJyGDFzjc0T5cguqR5Sy6UDM9U0cphmLfgQlHBzr7VIe9T2VY5qbs/KRKOJ+iN2+9/cupgiJCf1VWqPOY2+Pxz6FZBSduVr6EWTHS6FpSFpfVtUMQF7dRQoA4/EgRDSpjGz/f9rks0jbEcsJhhz5iFja5BG7Zno66pfFk3gNdTmm2wV02TgrQTUXBInkE9+fu8t49SYhl50THxOZBFcHFT5oNZQJhrgGGQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(6486002)(86362001)(38100700002)(83380400001)(5660300002)(8936002)(7416002)(8676002)(66476007)(4326008)(66556008)(41300700001)(66946007)(26005)(6506007)(6512007)(316002)(186003)(2616005)(54906003)(2906002)(478600001)(36756003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0MnaQPUruXXbrorVlmyqj2p0fmL0lLXgfb42mZyPf56SfHOJd0pqu68VPpFe?=
 =?us-ascii?Q?mbSVus+rS+v/aFW63BauXdjdsRYCK922COrGGBN9T8MjQEsm58PY5DR1vBJu?=
 =?us-ascii?Q?lPYS/4BOJDW6uuLanBEC3fYH01tD7Ygn24XTQlirgso4NtOz5ITCYV067AGS?=
 =?us-ascii?Q?zcxl6r2/3VAcNmzbGl/yLDn6ljpQDW9TnU+7NbQQRxoW2YKxFYOraBDZxoV4?=
 =?us-ascii?Q?5zovMsKZmtyKmjlg+vhUPlqSIhgunZHdSBDNFh8gQq1JSrVgJwMKkhQnliDu?=
 =?us-ascii?Q?jrnMeled3OL80Gj/qpRqHnwYs+YEOsPyJ/MC0hyHYW60lbeUWiX81StSSxsS?=
 =?us-ascii?Q?u6krAdH4eiNJw4vecXOW/NmuFZaW4GAAvu+6rmaNi6uRqpOWubdgvnRfEtnY?=
 =?us-ascii?Q?dEwQMuilEAMzyrlCkE+o7N3dNYymHHGGjjNkKL069Y2L80XUZ9t3ArPcWDrg?=
 =?us-ascii?Q?uc9Ozme2WtVh5t5PrgBkfg67GNrc0pYQ6qH12F1C+swJOE0FDzrRTwCO+Rd5?=
 =?us-ascii?Q?mzcNXpxT48i0VBeDGrBbtSF1eC33Et/YCkuKEJTOBzNAeRz6hhMwpH/0M4ar?=
 =?us-ascii?Q?MgwpEum1mdPGj8suReXLr7sjFYmr8qwpMMrkxOdQolYzcMijK2arNbtLieA+?=
 =?us-ascii?Q?JhaX6+BbNABe7ETrfXB1mG4XMz82NNrp2QI4VEMqm45SepHAD403bPl5d/6Q?=
 =?us-ascii?Q?EELeps2zYe3xnnzRxB3Yk1FSN2xyK7m/wAwvT0zdM+L20k4FZtZodQ98umGB?=
 =?us-ascii?Q?3Dn3u5788s35Ve1I0PuXGIhXVeJPTCEDDhMDX7A8fb4txiUKH5sD1FMUXeL1?=
 =?us-ascii?Q?C19A07uU/iglzirnBAMIJj4NA/s5GvoT+oj44FMrW6ids/LqDIKtRRRWtb8k?=
 =?us-ascii?Q?TEEidGxmfFcGojTIDcECz/WiF37J3q4tSulCyjW1g8T9U0OYUzJrzLl3ME1p?=
 =?us-ascii?Q?tW+h6LF/6lRFWliF7fgxe5Tf95W05v2nBBZejk1WG6r9qnYrFKPp9aHfk8hh?=
 =?us-ascii?Q?r+/02S5MwCl5UQksU+eSJFy45myKzze1sPDq75SNzIZ/eHklUOk44bCMi2fU?=
 =?us-ascii?Q?kIupCkkpEGJjXlnhrk5oVTyE2fsJ48ct36348k1IqaBPVzWMq6/sR/raDIP5?=
 =?us-ascii?Q?vlnxtb+hhHJmJWgcA0emH89JI+tvoWTfTRqh/4onkrcuCsjIH0g4wQunM9gT?=
 =?us-ascii?Q?B+i4xVUpp5XYY4uji6BZ8AuY5xXB/Xd/pmkZWnNH61gPFn+oqPJv48t7CkS+?=
 =?us-ascii?Q?6bBDpuvZDlL7bp3mLBrv/cSUJ56xIpaffWnGwDf2E+3y3EiHikcioQjdPDsz?=
 =?us-ascii?Q?NxSBbMZ7u/CaONKkh8SPJdME1srJwFEbWYFZhuFfgLQvOUMfajWBKZg3zjif?=
 =?us-ascii?Q?oXmcJxMNaDe32YFreohdSn6baIgVofIc15ZXxQ2nceYRHS/gez48Z0NFtQSu?=
 =?us-ascii?Q?+UedPyi1Hz5VI2zGj+JExmiPG5RvVfVdp9cC2Ju/Mqrlo163Va3k5VOeVcug?=
 =?us-ascii?Q?d/0AOtosiOjVQsnHjOu1kqO43oFICpa6HbR969p6FIdal6rTYd/lxhclGtv5?=
 =?us-ascii?Q?4cA93vbAY1a2b7LQIlrtRCgDIrQFeVjPGrJAuFuW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1c8dac-b1df-458e-03b3-08dac7fb7d7a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:53:38.4379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2X2BSZRbLY7S1HBX4mQWcq4cSM0hU7ZPq6n3daG574/XdGsnyeptHG7xKqZUOQN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:37PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> Let the core do the freeing of descriptors and just keep it around for the
> legacy case.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/pci/msi/irqdomain.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -24,11 +24,12 @@ void pci_msi_teardown_msi_irqs(struct pc
>  	struct irq_domain *domain;
>  
>  	domain = dev_get_msi_domain(&dev->dev);
> -	if (domain && irq_domain_is_hierarchy(domain))
> +	if (domain && irq_domain_is_hierarchy(domain)) {
>  		msi_domain_free_irqs_descs_locked(domain, &dev->dev);
> -	else
> +	} else {
>  		pci_msi_legacy_teardown_msi_irqs(dev);
> -	msi_free_msi_descs(&dev->dev);
> +		msi_free_msi_descs(&dev->dev);
> +	}
>  }
>  
>  /**
> @@ -170,6 +171,9 @@ struct irq_domain *pci_msi_create_irq_do
>  	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>  		pci_msi_domain_update_chip_ops(info);
>  
> +	/* Let the core code free MSI descriptors when freeing interrupts */
> +	info->flags |= MSI_FLAG_FREE_MSI_DESCS;

Comment repeats the one on the enum declaration?

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
