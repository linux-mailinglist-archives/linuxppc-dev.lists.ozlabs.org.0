Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E724C62C686
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:40:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9Lj5vMwz3dtr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:40:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mn6SwCct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=ashok.raj@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mn6SwCct;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Kj2dlcz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:39:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668620393; x=1700156393;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=imDaHmXk9dusJzY12geRQEBWpTL1c7cg2IGxlAFWVMU=;
  b=Mn6SwCctoGZzdIyBhg7s/YEJ9IyTAvwmynZfgPZck/zRKIV3WFDn/4p5
   1TXs9ml7ZHBRwsriYvIVjGnmpl5pJIGwFaMrmYr29FXVNpYcFYMLLNckX
   uKqHx3GglDtNsQEeC4JKuhfOc6ZCpjMTbnQU2GjXgkjfp7asBGbuTTzjo
   VdlY4dBnzAuTsOt7jTMg7Osn/lXCQVRhJc5uvuzikPH6ptzNcvCXfPsF0
   TCz93xQQ5IwxwmTAycu4sPOVrFrViuktBycCeXGaLxt87PwldHvoAzAki
   w1WtsCoKen2eREa5Vl8aEqz7LhmhNOXNGO/gy2UHarIgstHDze/TWg9FN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="292320633"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="292320633"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 09:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="728458837"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="728458837"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2022 09:39:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:39:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:39:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 09:39:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 09:39:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpy3h60stT321rhhYYbq/Bj6ll6n4pcr27tu8R4e/x0If4fxjoNuh54fwIQ01d4GQ5esuVFli2hFSjE2hxIdIrCG3NH72VXkDie6i53E3MdSye+wUSxRuwlIpeRcnkoDYUpiSm4W7a4XVj5MD+ASRvtcpJ6WkereV6vY+10OJ5Yo7XtabyIo3caqvOFjE03vco4BVIDS6HT+lh8/oDrB/JjJBQkrk0BoajgzzGZQj/GOfzsYQXEotTprptulJdvZ/DeSHI4PYPDdrM0jwNPlDPuJsEd/unUSS/DEIFaaUzEhHG6sWsesYihQwPFHSbzR0rA+vfwe3Z1ec4Tu8FfmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4HoGhvbnA7BBMdk1UEp6lQ4HQW11JLy4buZYdkpx5c=;
 b=ZZbZmLuBjAVZVNr3tAVllijZqwT1lWyzHr0ADLoHtYhD0NL6X9k6Y4iuAE5gD0k38HFoeGgRM/y8+gSUz742mz0A1ZlNupGp5iDMbfbWDe+yI+N4W/orlFbVxraFplmz2Pn6FK70TcvKkXryjmgXW/Ve/ZU0nwJEL0TMTBJ1ob21xVfDq/mgLmHKzcTTQ2fcA777Qo01SGb+6bG+fhHGq1yBB3pLdwCJsfQbu1nrDFcnTbQar8pBZWt5S5OpG50Q/Dx8OQNm0ILz43DmT1+J70HnBSQxPmiRv5YtUPsJjZJreTsSkgjRWIAjGmJWuhWczVfXZl7Xi7Yh8rhkEGIqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by BN9PR11MB5531.namprd11.prod.outlook.com (2603:10b6:408:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:39:36 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad%4]) with mapi id 15.20.5813.013; Wed, 16 Nov 2022
 17:39:36 +0000
Date: Wed, 16 Nov 2022 09:39:32 -0800
From: Ashok Raj <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 02/39] iommu/vt-d: Remove bogus check for multi MSI-X
Message-ID: <Y3UgVEGRIuim+7es@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.713848846@linutronix.de>
 <Y3UHVGptkWZnIEgI@a4bf019067fa.jf.intel.com>
 <87wn7uq1cp.ffs@tglx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wn7uq1cp.ffs@tglx>
X-ClientProxiedBy: BYAPR01CA0032.prod.exchangelabs.com (2603:10b6:a02:80::45)
 To SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|BN9PR11MB5531:EE_
X-MS-Office365-Filtering-Correlation-Id: 699c6924-f3ae-4ad0-7b78-08dac7f9874b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l9mwKFc51mtSvNrMWu5WVEeKerKHs6zxkW1g8gtXGvqB9/vYfSc0/HLWzStz+gSECdKlOPwchEt5QVTjt16cVnodw3WBW6mkYn5Gz1Vq9hdSJyJujug1RJ0SjEqs9ZN/ijOeNQLgclLCmITf1rWO61GGGhQYoBm0NY4IlrGKZKpOvMnj7gCWAKhbb1/iJ+a8mEJRb/0yxNoicFCGAO/wniyRDcYpzwYaAIGh4OZOvsSSgz6F/Mo9JzVISyXCHbUGn23RQf3VmWenxBxKcwFVo3ejYS58jf1SDV9d8SPULZRU9B/zmQWHrX7xfr164fp8x15kUNfGBkV0wsQbyzs8UvYke810RZBVzNF5iLf6GTjEMq/Hugk1L35nvD3EuyaXuuc+Hl8miFdnpkwA8Z77TYYBBofrbijhlrQ60w7tgTCw813OX1tZH600kpLpxrkRidxsAfq++dRFK93mQuqTfflzTO1GBNeu4DEJPi6L1VkuXp91oMWvP2Se4bZsxUUrgfK2zRUtLRzFsy5iffN7zRlzC4jAASno0SbMRegq1WT8WDJrmB43SNh+GKebTFJLWZQAOtt25XQKyWKsP77uFioEd2pRX8SKheHFNDBN8hzgUefX0uB6+9pYKrvCk+Iaj6zQFYpnI8HNjJETz/8N3RXRnmeO4MByaIT4dOZ2jdude/fBmyNoFFAs9zrivdqihxMZYPgL6BDBv41SuV5hkDPYICH+KguW8kfGqdDV7vLPhAj/CpdNqmN6+vmXDdOjEO7J2jRwmMuJvqQpIMwM0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(346002)(396003)(366004)(451199015)(54906003)(478600001)(6916009)(316002)(41300700001)(66946007)(66476007)(66556008)(5660300002)(8676002)(2906002)(6486002)(4326008)(44832011)(38100700002)(7416002)(82960400001)(86362001)(8936002)(6666004)(83380400001)(6512007)(107886003)(186003)(6506007)(26005)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7oHLE1021uLRkYLDpWdbw59uYbODHpdYCWwKd3RnrVMWRnaQ4SIXXN/EwIP?=
 =?us-ascii?Q?oGkP2lCcJBNWQKOQ2cUbIUdomtJlH8GEUpfYj4GNI/fOIHFSHOmieWof3djB?=
 =?us-ascii?Q?I6jHXDwZThQu46vvyLbsluH2jiE55JX4x5T/39gjDuDyboWOwNrhFGQyx5ok?=
 =?us-ascii?Q?IPcuvDlgryJ3fuRp6aZS2r8J8LLOl5ihX0LZb2OZXVEcIcFA/4AvlFKD9+wf?=
 =?us-ascii?Q?V5UUUiWvNgiicK2oFMtJ2C6ZbEuAHv7f7pFhveT3EqqTI5gX8Aj725/hRaTS?=
 =?us-ascii?Q?n15adJLxfIvdhM6EA+tJY+ISJ3XSMkG622g5+8dYADydGronMB7JgQPQUEhR?=
 =?us-ascii?Q?kkNYMNoBROVsluPDq0U7dIgALNxEEiI8iP2iGW3whzogadE70uzqxfJpBLt6?=
 =?us-ascii?Q?OF8007amwQs0cH9zkro2o/SJyEz50+sZIrfjEqNo/8EM7MZoJkkCgg/ySvUV?=
 =?us-ascii?Q?gqh1ydUADechONCpUu5ioTsdtZgY+QTINcLQM7ZnUiK/SGEmGivtDiiRZzpq?=
 =?us-ascii?Q?9yZevjXBPzwrqhngIXCVt1cOknW3cofYHInFMqs+BDdQxG7K6Cl0N86qjedD?=
 =?us-ascii?Q?Z+T028sQ/lZ8aJUdFZ5+ygRWaHzmC/yBi9JzaImy6XftLoTW42BSNKUmBQzp?=
 =?us-ascii?Q?SZBQLILRL565aPM4V1LdL4Z/P4XzEjTuDyn1i2Zk1v/s1WUvqkyk7QYMsP09?=
 =?us-ascii?Q?Sc4W23rD61k2P5+EG1tEJeZHVkh6yECD65rLYTzTdRScxMqwYkSevbq2ERFa?=
 =?us-ascii?Q?IlPv99zLtOQ21axl9BL+3fpFw4R6Jnq3Fg79MDOGRhgNhSRbFgqpZJTWSHfy?=
 =?us-ascii?Q?0dfcBNYIO+6QmftBqa8BjAzapzNfBRkDxGNkXdqwGxrmXVrJ1umOxEgb8iiM?=
 =?us-ascii?Q?i+Bly/L+4Wtz7WqmcPanj109mUPkQjaMVMJLu6PlSXvo7KjtXRNqPPmyKaiC?=
 =?us-ascii?Q?mwSXsUBYXV7PK4LszYXUYBV6Fx02MkeG/wcbPgKia5Ot9HT4+XPUBiR962cf?=
 =?us-ascii?Q?RNF1w04obbwVAYpE0Yo6nbVMn5+LPp96Zw4Jtl+LjEwsK8OaOwT0nBfobmCg?=
 =?us-ascii?Q?sFXGOaM8X0nmi+Zi6QCkMSGzKEFLXxgzewtONMqjt6mZFPlxBQiYncZh3+n7?=
 =?us-ascii?Q?HfXC/n+98UtwYayipBZ1xKeNkW4gKoQNxF397NnQXo7wZHp+hhbTvGAR+k3t?=
 =?us-ascii?Q?2nwvp1fJeJFaFDZtvnr9x6GMBKC9mKo2N731C/t2nsx5IB8FvHYVGFEDAWFg?=
 =?us-ascii?Q?7pjjjMzdOQp27XGk1OoKC9TlVbA7JZhxFhG/s0Wp5JAa97wEZ6vJNt7cgOpw?=
 =?us-ascii?Q?nqTiSaoPByzh5pQz1Iu69eDWZe3K5/IUriQ6KddT2n2MzpGtdfWNKKmvOEWA?=
 =?us-ascii?Q?RhkilQ/5j+p8WoNz567UhTaA6FzUxD0Fudkh8V9REZoWndM2A1INthMd8/Er?=
 =?us-ascii?Q?o1Q+JG0Vo+6dC50SN3yWnsjpGirW0Kw8ZfC8eNeQNw/42IitvmIdDCcRuzCM?=
 =?us-ascii?Q?BGotxjafIqru2JHiIZQohd0ROf1bOx4UkAZ4827wDi062iNWdZmaHlKh/4jW?=
 =?us-ascii?Q?G67E8d+qViZke8nmQ2yV3/6Nyfxushs+c/+5qBnAAOLYTTi6YkK4mAPzKzhs?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 699c6924-f3ae-4ad0-7b78-08dac7f9874b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:39:35.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfeV8Uy+XVjB1tcZ3FAxrgCXLnazShernwPveV8Skgi80C5PrMmxsMYYr8Wk/KpnSurqqcPEq4Lj6FquvipQ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5531
X-OriginatorOrg: intel.com
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 06:02:30PM +0100, Thomas Gleixner wrote:
> On Wed, Nov 16 2022 at 07:52, Ashok Raj wrote:
> > On Fri, Nov 11, 2022 at 02:54:17PM +0100, Thomas Gleixner wrote:
> >> PCI/Multi-MSI is MSI specific and not supported for MSI-X.
> >> 
> >> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >> ---
> >>  drivers/iommu/intel/irq_remapping.c |    3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >> 
> >> --- a/drivers/iommu/intel/irq_remapping.c
> >> +++ b/drivers/iommu/intel/irq_remapping.c
> >> @@ -1334,8 +1334,7 @@ static int intel_irq_remapping_alloc(str
> >>  
> >>  	if (!info || !iommu)
> >>  		return -EINVAL;
> >> -	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
> >> -	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
> >> +	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI)
> >>  		return -EINVAL;
> >>  
> >>  	/*
> >> 
> >
> > This check is only making sure that when multi-msi is requested that the
> > type has to be either MSI/MSIX.
> 
> MSI-X does not support multi vector allocations on a single entry.
> 
> > Wouldn't this change return -EINVAL when type = MSIX?
> 
> Rightfully so. MSIX vectors are allocated one by one. Has been that way
> forever.
> 

I thought why block multi-vector allocation on MSIX, but if there is no
use case makes perfect sense.

Thanks for the clarification.

Reviewed-by: Ashok Raj <ashok.raj@intel.com>
