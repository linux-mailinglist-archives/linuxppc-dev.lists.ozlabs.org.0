Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF5056A6B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 17:11:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lf0H10YRfz3c79
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 01:11:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dTvyWto6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.100.161.213; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dTvyWto6;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04hn2213.outbound.protection.outlook.com [52.100.161.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lf0GC2fdGz3035
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 01:10:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBMPAbELmLLC2+Dms44hrSUo52mLjq6XIroREN7Ec7i6J5Uor36i9ZVoa0BjfiR/EsQG2J8PWoAckjD9ApTni8SxsOjEabJ6EWUXbep+WUn0YD1TH1gcDuRYGVyzcCqLX7flFcum1/gaKc2xUj6QLPjfRjDI8nXJhkijSeL8gL4q85X2ORO48kpNDpoi4IYaDOP+ToJGmeZeUO/ZirH8fHX7sL7hzrrDokiQBKr52D5C/cZneEmgxqR/eL6YFhOS3qv4vj8zxs9Hi9rAG2uofDxEn/ktiLQjcCjIVqk8xwjP8UmdteBQa6eYy6gXpb/BQmQLsCUi6iu+BENGzAvQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZtsr6jJzqGvbA4y0BfLxwdUK5wVhdH/UPP5zrBF+I8=;
 b=YRuIBzqxdmffQftiIClx3DB9e7Bttt9y/9AOyUR4biz5T4TESTlZx0Q1OvyNed9V+asvFqal7E9WhvVCK67c+tj88TQ/GMn5CQGOYu4uj4w3mzUGc0tOLN3Ox6oHf16Xt5j8vLC9haj5Vu4bDNkJz7H2jf2rGK7QFNfL3R6NyshnKl2qN2UY0fI1kUzi7Qt9DOGZF9pT4g/RJwXf+kCFwAG55OttfaTBqWOXslqHcYRJMIzd6P/muzoVbfktYLhxtPRaiVHOpYFi6zpUP4QcNv1zNi3KjC3CEmU6ojZIj5jttusJ047YwEI7uw9OZPwJxAFx6lgiLyybyg5pdyI/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZtsr6jJzqGvbA4y0BfLxwdUK5wVhdH/UPP5zrBF+I8=;
 b=dTvyWto6kaD0nWgfSGeiN72kYIMkRpzbIX46UgZoqrrnz5h9+e01aCM5rALLCe2O6Uyblw51mNWgUAT3pi21pUZI5+6ANlUd87cSqnF098DTSqVVyYqAiFlrIGlbztZ8r0Gp+LRnz8FuLGmAY0M4CuurlrD1qtzJUdRoDQAUkGcW0CCAK+2KTEBSiF+wnUF/Yxctxlb7t6Bj2gSlLSd+FnwW0IYMOGiU3EfCihalX83MyPsNrm/vqzCEUjEGRblFoxTHNrwysaagjmQ3aE/vqeXl1INhOnPMxTtNuCKjobaPXmgc4O2yRB3tDAVcnjY1ZPbh3mUZvM6GE/Rda2T1wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR12MB1811.namprd12.prod.outlook.com (2603:10b6:404:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 15:10:03 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:10:03 +0000
Date: Thu, 7 Jul 2022 12:10:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220707151002.GB1705032@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707135552.3688927-1-aik@ozlabs.ru>
X-ClientProxiedBy: BL0PR1501CA0009.namprd15.prod.outlook.com
 (2603:10b6:207:17::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb8c49f-b94b-4016-94ff-08da602ac4c2
X-MS-TrafficTypeDiagnostic: BN6PR12MB1811:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Axj6L5Tejl/VeCyOrxGlSAlsGFClxsQH7ZUbXSaWHyHR5YqzcQKYGqUaKjee?=
 =?us-ascii?Q?Ok+24WdSPPbAVkRByFZjfT9NuRCn8zOrh3G4RZ+N89Ot+I5lg8C0SX1QdOx1?=
 =?us-ascii?Q?p2C8koybtQo2WE3CJo3b0tM5q1LSfo0vC72DwDstAtepJb9jq6eOATtA8KfT?=
 =?us-ascii?Q?hNVcZ7I3s1ia5LbgtMh33gaxe/rUgvH09NoEP7SkoTQaeo5FgwePF7HwdHKx?=
 =?us-ascii?Q?t637L7LIwC201jq8luGY4eXd57s3zl6wIMno/SkCtqcSeTtDCnPZx26oz1a7?=
 =?us-ascii?Q?EzYaF92c8Pfw4E9fOLe9c6a5ao6IeF2c/g7k9TKMuipt+KFQlEGTqQc2Xs6w?=
 =?us-ascii?Q?vkOOKCpCFKmqREwcr9SP4wDsqZhzzv0FIsashS7ObwjsBUXwHXfORmDXmgg6?=
 =?us-ascii?Q?zDONHrbcVhRz5WRDZ2TY4cMaRIsfwfHjNNrGdYjE2n2PgLt50en2nXLWhDGr?=
 =?us-ascii?Q?lJtjniopJfLEox71xcXcX/Ttxylc0wPU38yFYJoemaIQLVvTvYJCFWkNdMF4?=
 =?us-ascii?Q?WL7YJ3dRqJXq+vIFhWQZjHLmBdimGjzIpwGGi8yOXzUsfMJFgg04ib+4FoFz?=
 =?us-ascii?Q?lJL3ZNz5xg98nDKP7oXSmrNZSSEfeQ3/x0e54jK0/fkl2Cefe50IgQitA6ix?=
 =?us-ascii?Q?dUCl5ns1bnlpdY+JY3N4FSXg+GF+N41gOoJWdPvMV5Dcjd/yBDQ8q6cuUz+z?=
 =?us-ascii?Q?JD1Ijc34bEEakeqiNWAM6eajBv/LuMRvxOGK6IxnVjJeBwiUoxJxk5/P1jYl?=
 =?us-ascii?Q?hOgAlmWwLQyayKdd3AyKWv1HKa1Fjdrziov5uCmJ3Y5Xe94abbRGQjyvX/2i?=
 =?us-ascii?Q?IT0CZYnS2AhQYcsmXikglJfceBjuEom7kYtpWRJ1S/0mRjFZ+4I++22j4brt?=
 =?us-ascii?Q?7QN5XcR5MMXtXZmZtvHSCpDA5TbYX5Ut68yiLndg84Gawu3ZlxhJElNMmYRh?=
 =?us-ascii?Q?dcSJNsNpe0bStxRDmxi0ja/gxBq7rUppqFYjUP28ec4c/5EaUwFHEsCgjmdA?=
 =?us-ascii?Q?U8BG4l70C4Bk2uxTQurrHj48e/EpO9okQtvwNS1oVtLIvsgYv09afaKc3zUy?=
 =?us-ascii?Q?qq5Eom6qV4RvO8PB6E9/MljqhWMdqCXOG0NK/hXUeLpr/fwnfxTTDUMvhTwg?=
 =?us-ascii?Q?I4S62JfvL4IBFWh8g6npp5zFIm6x8X+qPoN+0VitE+JkmL6LUgRIiRonCakq?=
 =?us-ascii?Q?m9N8+kICS4FMQ+2vmAYvZzVgDrkiz6WWIAS5/Xy8WyTAVdZljvUeAEGA7n6A?=
 =?us-ascii?Q?Wu/kbabZOqZoCu1rH9MdBw9ePAl0Exu3hW2rUYswiVDw8xxbzofWdnig2D+7?=
 =?us-ascii?Q?un5nNGC2lzjZ+YbHdmmnz0zdfFjuvgMLZC8o7O4MFIBL8PcZn1lry1M3a6nh?=
 =?us-ascii?Q?QK4vqhaRnUXeXSNvzTWKB3iKJ4PJa2hT7bky4uclxpHy61IEfmP+pJhgnzan?=
 =?us-ascii?Q?6+kdif8724UJGPyTvwOi+4Wo4gDnoX4bRnPtkiKGN5WB+vIOawGaog=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230016)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(186003)(2616005)(1076003)(316002)(36756003)(8676002)(4326008)(38100700002)(83380400001)(6916009)(54906003)(66946007)(66556008)(66476007)(478600001)(86362001)(8936002)(6506007)(5660300002)(6512007)(33656002)(966005)(6486002)(7416002)(26005)(2906002)(41300700001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?b1YrkS5pePYM8NOT2+mcZEihkZVebli2VqhcNvtoHfxJP60hjgNknBrdcnRw?=
 =?us-ascii?Q?k6v1UtYy4aWI23Hv19pi40ZHEjX3MpvPVC2QtoZ5ANBr8SBOJYQC5nJwml8P?=
 =?us-ascii?Q?Y93UItxRPQJJJ3IGJvufQs9od0YdIJYvmK3TieiLRNdoJ4blkMmXbf6g0E91?=
 =?us-ascii?Q?p9n64F3LDZ+xpuYG/kr+c1V+e0v3b87S9EA6HFmbaY0bIidw+isyuHYJNjFF?=
 =?us-ascii?Q?FmkDhG8u3RRZAoAAI34SMnLxC04dzenjm6ee07sKuLHsg4C5325c8zkxKexA?=
 =?us-ascii?Q?9gbtIlju9XV0Nrhv86tWKMmb0ZPwvRaekkLll5tIWtOuQERNVaL2hqcDSf32?=
 =?us-ascii?Q?q7AqDO6ASRhEhkQvkXfKkYNPL9/vHJSg6vFDJAuZBFdf1K+cxEDjmqDZIvUr?=
 =?us-ascii?Q?6BdkRwUSexW2/l1Yh+n4Wm/vl4KCtXpKqIeZHWhHavz2U+rksMTPpp0Tod2Q?=
 =?us-ascii?Q?kYRrrJFxZh48QVpiS6nD4urRafmNL4oDT/CeRQaEOFSj8wMt/XpF0WVA3HYB?=
 =?us-ascii?Q?r2amD7QC/oiG74BpGCNirSqAk6vrGVijAQosMsAe7AMmqmTnwN3/TKJ3JYx3?=
 =?us-ascii?Q?6Da0MErZK5O9afwXrU32f4hyLzd6T0rROHnurpR5Pn1gh4svP4pxe8fIN7ri?=
 =?us-ascii?Q?RQ2r1a2Wg/+WZQPsUUveBsWbjJJsY9C263zj1eA/LmmKsyXOpUm4i80GrdDX?=
 =?us-ascii?Q?wpZ40vUAGgD245sRadQj4ptEL8gHbckMsOcphWcjZmSCWh0ltbPZh9fg6CZh?=
 =?us-ascii?Q?HGGmB0PSiMxzbVV4BF0rvEcfy9k9H68CEOOHmR/Hn/NNCfQRXvHEbX/KODyy?=
 =?us-ascii?Q?WqWX3l0tfQUYdiIgZLZvOt8eSQ2ElTc2uPgTQrv59RhV/LzAh+o6O1cg1ZQV?=
 =?us-ascii?Q?4Kd2PPbeL8uOAqD9njGjoG3h+WSZgNwIQtN9AyFSpZLcnN8cO3vk/RBsvzzG?=
 =?us-ascii?Q?ULBBtS7iwyDRbvfsjKhb3aX3zh0/qfDyuY+zwAsUSG+Cah/oDzDKG9c04lBj?=
 =?us-ascii?Q?ADGXWVqh0a7RcedsWGAwyUIPUuxaNPINlGJY0Hiu5bYhRKUnXrl5wgNTR+t5?=
 =?us-ascii?Q?f72wq+s9trpdJPS8lPfeyh9NxE8mXDw0vydeg/TxLgogyIinCraTPBGXDDCj?=
 =?us-ascii?Q?AIbhS3MrSQYsKGLLKwjovEwGLu50D75Cvnsc7a18yxCcLyc+ZcYu2dd83L91?=
 =?us-ascii?Q?cEz+LU3HY7L++zTRU+77ZOfFH/bdvG/Id//aQQNSF71L0lEOaNV+nGeob/Uj?=
 =?us-ascii?Q?0IpQfKL7c/D5Ax63/ArlFs2BICBIqnq30A/3+EsDWYQdxYtREbvHfeJl8jBS?=
 =?us-ascii?Q?277vl81IXoWPnzyPknrv25JVgJ3PYluStAX5ZL3aoX49Vd3hfs7onN/lTpTY?=
 =?us-ascii?Q?bSmX0m4z8jt35eLtTQDBtl4WEvvPFRPyJWEOghGp9itCm7KTSxeajlCvr6Ir?=
 =?us-ascii?Q?lZXnc2kj/exjy/dVdd6s+6k4rTZOVIOsRSwqTcWlBGtv0stsV7bsAr7Ra4Li?=
 =?us-ascii?Q?WkByphwjbEwUm6WjImmJhcUK2hWSDTCsxgN4+n2BMZFH97jXW3GxQvM0RE+d?=
 =?us-ascii?Q?/xNy2ucGEdZVy0NpUUmUQQtmRt720c99YZu37v9T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb8c49f-b94b-4016-94ff-08da602ac4c2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:10:03.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0gGsATi5mJ3DsU1miz+yd5CQA9zs20EVKNQ3d1O/DMXWFFRgxAog+oco2nJVcqdK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1811
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 07, 2022 at 11:55:52PM +1000, Alexey Kardashevskiy wrote:
> Historically PPC64 managed to avoid using iommu_ops. The VFIO driver
> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
> the Type1 VFIO driver. Recent development though has added a coherency
> capability check to the generic part of VFIO and essentially disabled
> VFIO on PPC64; the similar story about iommu_group_dma_owner_claimed().
> 
> This adds an iommu_ops stub which reports support for cache
> coherency. Because bus_set_iommu() triggers IOMMU probing of PCI devices,
> this provides minimum code for the probing to not crash.
> 
> Because now we have to set iommu_ops to the system (bus_set_iommu() or
> iommu_device_register()), this requires the POWERNV PCI setup to happen
> after bus_register(&pci_bus_type) which is postcore_initcall
> TODO: check if it still works, read sha1, for more details:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5537fcb319d016ce387
> 
> Because setting the ops triggers probing, this does not work well with
> iommu_group_add_device(), hence the move to iommu_probe_device().
> 
> Because iommu_probe_device() does not take the group (which is why
> we had the helper in the first place), this adds
> pci_controller_ops::device_group.
> 
> So, basically there is one iommu_device per PHB and devices are added to
> groups indirectly via series of calls inside the IOMMU code.
> 
> pSeries is out of scope here (a minor fix needed for barely supported
> platform in regard to VFIO).
> 
> The previous discussion is here:
> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/

I think this is basically OK, for what it is. It looks like there is
more some-day opportunity to make use of the core infrastructure though.

> does it make sense to have this many callbacks, or
> the generic IOMMU code can safely operate without some
> (given I add some more checks for !NULL)? thanks,

I wouldn't worry about it..

> @@ -1156,7 +1158,10 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
>  	pr_debug("%s: Adding %s to iommu group %d\n",
>  		 __func__, dev_name(dev),  iommu_group_id(table_group->group));
>  
> -	return iommu_group_add_device(table_group->group, dev);
> +	ret = iommu_probe_device(dev);
> +	dev_info(dev, "probed with %d\n", ret);

For another day, but it seems a bit strange to call iommu_probe_device() like this?
Shouldn't one of the existing call sites cover this? The one in
of_iommu.c perhaps?

> +static bool spapr_tce_iommu_is_attach_deferred(struct device *dev)
> +{
> +       return false;
> +}

I think you can NULL this op:

static bool iommu_is_attach_deferred(struct device *dev)
{
	const struct iommu_ops *ops = dev_iommu_ops(dev);

	if (ops->is_attach_deferred)
		return ops->is_attach_deferred(dev);

	return false;
}

> +static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
> +{
> +	struct pci_controller *hose;
> +	struct pci_dev *pdev;
> +
> +	/* Weirdly iommu_device_register() assigns the same ops to all buses */
> +	if (!dev_is_pci(dev))
> +		return ERR_PTR(-EPERM);
> +
> +	pdev = to_pci_dev(dev);
> +	hose = pdev->bus->sysdata;
> +
> +	if (!hose->controller_ops.device_group)
> +		return ERR_PTR(-ENOENT);
> +
> +	return hose->controller_ops.device_group(hose, pdev);
> +}

Is this missing a refcount get on the group?

> +
> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
> +				      struct device *dev)
> +{
> +	return 0;
> +}

It is important when this returns that the iommu translation is all
emptied. There should be no left over translations from the DMA API at
this point. I have no idea how power works in this regard, but it
should be explained why this is safe in a comment at a minimum.

It will turn into a security problem to allow kernel mappings to leak
past this point.

Jason
