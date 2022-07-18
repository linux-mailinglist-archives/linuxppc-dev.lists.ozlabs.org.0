Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C05578951
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 20:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmqkp2bRzz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 04:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JPj2dUCC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.102.53; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JPj2dUCC;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmqk42n4Jz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 04:09:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bz2LqMMQ+q5dk0jGSOTSeuL9crYqqhI5t70KdAHs/BYaRaRbe/WcX61NC2Z604Z9Up0FiOoaB7AzZIxOJLgiZF9dosoXpIN524qN5NCKwK9n0bIH1nUbiFngCyw9WT/9EKBeKv6ZjZqwkbAW//z9jMMHndsbDx7N5q5OTsIn3va0zwCKkpXQifia0zixZiYpm6VLN/Gf4ufGJOTqZlAzjKxbqGCJMlNMmZv+2oHGvG8Dfec6g64O/eJyKukQFKsKoqXmbakdlLvyAG5ATPggvNRJed6LzxytYy3R8jFCyYp1+e/LvcloA3+WIccs2pTz/LPkaN7tvE20xNoJnDWJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QNldVY88FMq538vD8Hn7IDhouoIRT3Qjf5xJUA7dcc=;
 b=eVLZXUtWJYzjfq4bRUzsMFM0XfirBhiPNSVbIPs9k6HfGZSSYUTqQbRo9imexLiFY+06YDLAgdyw8P3UmFrOVBp2zfmrBuyS6h82HURQ15FfALNdCfcdvuASKfa4fNDTF+Tjx/MMGKnpA1N4CWtFn2nyu0DQnqhPE8TWHn6AMbNVM6VMqjvVfGE5Kb+e5Nwd/4cwiAka8fO7OJ5dC7jKTWAtQTpH2o5yqyKFd82hvMrFalRBbTQt30PTjqRxYqYtrxsgICY31Ki0W+RiW2mOQ5qmg8njHr7LYrFz3o3qQrOLHT1SRHcySNpCK6kTMJbJGLptkk/bij4zv66xiGM+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QNldVY88FMq538vD8Hn7IDhouoIRT3Qjf5xJUA7dcc=;
 b=JPj2dUCCC3jWedxiG/VB6pv9KR+QOc+J0fQ7e2kvDXJKaUurV6FemFIWf7ORz4KJKXe4sHPI6gc//MUqq05O1AJDcEnzdEfhf12CudxacLeTi6IQ+GoxCd51MnVwUgzEV4mWuEPihgiED/YJoUkhWE1vThL5FspudfGXNsPdxbvtqOVW+jBKhYT8mkf38No7VFcV0xYOInZE1AHcfbYXO9oPoGR7DwdJtTyBZavksq6aUD97mAU/2jQhCX5RcYle9dJ9nIWzCVPKYi4ZePH5EC0TEPy0027QUXeuvO2tHafv98Nt4d//bRvbhSs9gzh1P3AB9e0tj1pisQ5428OheA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 18:09:26 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 18:09:26 +0000
Date: Mon, 18 Jul 2022 15:09:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 3/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220718180924.GE4609@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <20220714081822.3717693-4-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714081822.3717693-4-aik@ozlabs.ru>
X-ClientProxiedBy: BL1PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::27) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee0be1ba-fd46-4b5d-3ede-08da68e8a64e
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6123:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	B1Mv7Oiep/Yx6dp1R4Dg+SbRfttr5+nsK4hCncgSsve4ZgNSul8RmIC+jWauRjwNHEYIobjJkSnxzrGAi/NP88XotvJMHmuyfuYoXli4Syy/zl44tCO+uDK3hywogMri48JzgYtu3Fj3W0I+X7HN5JGuqTZhf23cjWuSruIn/8WNtI3zvR1u0YMNjORx4RJ6ENDYGl9Kb1Frkt6UiowPYnslVe4Y91gEbMz8TnUqavIL+nsHX4Ovp9RTvzyu6Ix7jbc8J1Ykhq4+dE0FFLHxpttrWKT+gqx8YRNEMijnyKCtfzVnMzncKLSCKsTY68uObZPR6hv4fiuD31RkxDESN/jPlEfZfXHYBPi8kawy5T7XJ6+V6HsuEeRW1P6JV9YRuwoGcV8rqmrTkcBxfHxqSDd1GHNGT1E4t5nrJqR84zXWLpZlhEUr6kAfIviyH071bBs1mqFwE7D2ymamIRNm62N4g4ruY6ZnLVKPHWYfftYfHDeCZymzse/2uSrysqliSh3tFIoKTVIxLv0VUQooaqpp4npZZL6XAzFO8TnBTU3ypFjHHAAN3r2VhJuSrhR/4Vaj22egRyj3WY/mkguXGPNwmMmvT2Xx188Gn1jnLH6G/2D7kfuH4fGYOt2IIoqivCZssiqim5xYy6VmZL3aPK9G2tYTGq+EXm0jQMB7Qbi3PVyx51lLU8dEoptpGJRv+labQSPIRKbFuvHk4q5I9rhuNs4xk2Go5ORpKoiXlo/kAOgFYyjbqRiDC1rkgDVg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(478600001)(8936002)(66946007)(66476007)(4326008)(66556008)(86362001)(8676002)(316002)(6916009)(54906003)(5660300002)(6486002)(7416002)(36756003)(38100700002)(6506007)(2906002)(26005)(6512007)(41300700001)(33656002)(2616005)(83380400001)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DQWV75ElbKjan8WXqajY+HKAIMoJz4E96amXAhgIYUIPgTiS2LPiv1YrwaLn?=
 =?us-ascii?Q?RrUP1oxGmoAPGH14BD2DBTAsDK18eWLeHfYJJpdEci3IHiGPVbtVMHTCwnDl?=
 =?us-ascii?Q?RYLI9Ig488bO71lRch1gYHJymfQwgvWw/Dd4avxqekpx9nL+xdB3XzY02WLs?=
 =?us-ascii?Q?d+5JYatHLImuPv7s7/TyiAv/+B2KNUqD65UhML3020SFkAsV5c+XHazdAB/E?=
 =?us-ascii?Q?Gn3odxsLVshq4vh9LgmAHa99Q/qDbsOL3/3E9xvfQru94CIC9EQNqyvf66h3?=
 =?us-ascii?Q?x4oqKNkfEGz8Fu+UWNJqRS7b6cy5FFIRU4P9pjgfgQyI2TdiMYpMMcisLMqs?=
 =?us-ascii?Q?+VBGdp9aT1jeDT6skKUgpQUPuL/XSK0qoFLi+lzsmamXsiDVE7wTSLh54Gz9?=
 =?us-ascii?Q?6qvFG29HkMiF7x6voDUDoEFZbnZM7VGzBrtGPNKVKpDXkmKUv5PeSpxpsUfQ?=
 =?us-ascii?Q?4l2ay9NqdZOu/XRh4Pzu1iOgFwaddDB+iJdtTLJjPLkeGfA9k1aI43p6aYkX?=
 =?us-ascii?Q?UF6viVVfXWgp4odkgZP4RU9mcAxiP5QeR6irIZQ9EbcJD5F0g81szxmWO/gP?=
 =?us-ascii?Q?f8fmfaKKsbouYdmjbsomCce2dUrYPrgsdwlxUMJa2EMX9ydOfziywqjVI/J5?=
 =?us-ascii?Q?rBs0ntAQEM/PAnmNuffOAZ0LjuNi/PaeHRh6N10Sn6WZfrakKTa3ZwFglrDC?=
 =?us-ascii?Q?JcQfg1ZBfUXBU3zWYSNeqHCnSSgcgcrgH5ep1bZHdEbLq0X0/vkhscXVFhqb?=
 =?us-ascii?Q?ZuUqHecH8JSvNTF0hp/5W09WHTQv4gL/ICBllLM1EM99MmuTXb4fsYjBwRqX?=
 =?us-ascii?Q?wM0eA5YkIJR4f3Js1x2UZJvQjNN3TjFHYakwUxetLrS4GrCBpek17yi/iCcR?=
 =?us-ascii?Q?Bewb92f/0M2eFM1dzbyasnmJOPfpGZ6xIVIqpqj3eGvcc1/JfGhBGd/fIQ8R?=
 =?us-ascii?Q?wXmgldQNTXpiXJrFS09Om8h66N782kO8ROcPATzT9dLi08pD3edlicHzVW8n?=
 =?us-ascii?Q?5CTb8PRHU3rz6aX6+NDNRhneoWUh+4TkYDsfbdUlwdzE9nsAoO8pXiNaNzjb?=
 =?us-ascii?Q?lKBGLHo19kq1Nt/86OyCYzg+Yk7xcDk8zyDbbcUM5kDqCFCxfAh1g4ubai6P?=
 =?us-ascii?Q?QWeRRfzEPIU9vJOunktH2IB1IftTJUs8ky3uJs85BJSHSGL4ftDoKWTMryZy?=
 =?us-ascii?Q?DXAlYLicZfBVwFtWpzPxncGvX1moQ2J7Z30pgwiXdJufPLLSMhfS7ZQPA9zH?=
 =?us-ascii?Q?ASRGlHwGji80rk0Dgjklub/XrzzQUKUNzwZkGp1Th7gPr8/D4zpfQVxlviSP?=
 =?us-ascii?Q?9GvKZMF9wQcadxnIwhFU+/07Wj4pZSm93LfWo0peoDhL1qOau1u8bb9mTXFK?=
 =?us-ascii?Q?bNtiwdu7UKaC8aeqYW8NcCuWhKdHWyZ1b8qBOzRUzqcIq5ooJwJwx+ec8ulz?=
 =?us-ascii?Q?XE1ouXCx26Sb7eGl4w1O0msUwYx/OnCopTszsrL7nX30gUOl8r4AyOgL5T7w?=
 =?us-ascii?Q?m4cOLPZ13nN8NApD7s3i3KTQbyibKMZHAdmmp3Hzj+ary56bvlu9RfDzLYWC?=
 =?us-ascii?Q?z8B99NfhI8ClWrtZoAMKj63LCeGyFfvcknDS9opI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0be1ba-fd46-4b5d-3ede-08da68e8a64e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 18:09:25.9912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRlupj6ds3IHdBIXNNalHmlcRJ7gPKOETrDK7K5ZkAlPv6DtkLQryHdCKD5QZQPd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 06:18:22PM +1000, Alexey Kardashevskiy wrote:

> +/*
> + * A simple iommu_ops to allow less cruft in generic VFIO code.
> + */
> +static bool spapr_tce_iommu_capable(enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:

I would add a remark here that it is because vfio is going to use
SPAPR mode but still checks that the iommu driver support coherency -
with out that detail it looks very strange to have caps without
implementing unmanaged domains

> +static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
> +{
> +	struct iommu_domain *dom;
> +
> +	if (type != IOMMU_DOMAIN_BLOCKED)
> +		return NULL;
> +
> +	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
> +	if (!dom)
> +		return NULL;
> +
> +	dom->geometry.aperture_start = 0;
> +	dom->geometry.aperture_end = ~0ULL;
> +	dom->geometry.force_aperture = true;

A blocked domain doesn't really have an aperture, all DMA is rejected,
so I think these can just be deleted and left at zero.

Generally I'm suggesting drivers just use a static singleton instance
for the blocked domain instead of the allocation like this, but that
is a very minor nit.

> +static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
> +{
> +	struct pci_dev *pdev;
> +	struct pci_controller *hose;
> +
> +	/* Weirdly iommu_device_register() assigns the same ops to all buses */
> +	if (!dev_is_pci(dev))
> +		return ERR_PTR(-EPERM);

Less "weirdly", more by design. The iommu driver should check if the
given struct device is supported or not, it isn't really a bus
specific operation.

> +static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
> +{
> +	struct pci_controller *hose;
> +	struct pci_dev *pdev;
> +
> +	/* Weirdly iommu_device_register() assigns the same ops to all buses */
> +	if (!dev_is_pci(dev))
> +		return ERR_PTR(-EPERM);

This doesn't need repeating, if probe_device() fails then this will
never be called.

> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
> +				      struct device *dev)
> +{
> +	struct iommu_group *grp = iommu_group_get(dev);
> +	struct iommu_table_group *table_group;
> +	int ret = -EINVAL;
> +
> +	if (!grp)
> +		return -ENODEV;
> +
> +	table_group = iommu_group_get_iommudata(grp);
> +
> +	if (dom->type == IOMMU_DOMAIN_BLOCKED)
> +		ret = table_group->ops->take_ownership(table_group);

Ideally there shouldn't be dom->type checks like this.


The blocking domain should have its own iommu_domain_ops that only
process the blocking operation. Ie call this like
spapr_tce_iommu_blocking_attach_dev()

Instead of having a "default_domain_ops" leave it NULL and create a
spapr_tce_blocking_domain_ops with these two functions and assign it
to domain->ops when creating. Then it is really clear these functions
are only called for the DOMAIN_BLOCKED type and you don't need to
check it.

> +static void spapr_tce_iommu_detach_dev(struct iommu_domain *dom,
> +				       struct device *dev)
> +{
> +	struct iommu_group *grp = iommu_group_get(dev);
> +	struct iommu_table_group *table_group;
> +
> +	table_group = iommu_group_get_iommudata(grp);
> +	WARN_ON(dom->type != IOMMU_DOMAIN_BLOCKED);
> +	table_group->ops->release_ownership(table_group);
> +}

Ditto

> +struct iommu_group *pSeries_pci_device_group(struct pci_controller *hose,
> +					     struct pci_dev *pdev)
> +{
> +	struct device_node *pdn, *dn = pdev->dev.of_node;
> +	struct iommu_group *grp;
> +	struct pci_dn *pci;
> +
> +	pdn = pci_dma_find(dn, NULL);
> +	if (!pdn || !PCI_DN(pdn))
> +		return ERR_PTR(-ENODEV);
> +
> +	pci = PCI_DN(pdn);
> +	if (!pci->table_group)
> +		return ERR_PTR(-ENODEV);
> +
> +	grp = pci->table_group->group;
> +	if (!grp)
> +		return ERR_PTR(-ENODEV);
> +
> +	return iommu_group_ref_get(grp);

Not for this series, but this is kind of backwards, the driver
specific data (ie the table_group) should be in
iommu_group_get_iommudata()...

> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
> index 8a65ea61744c..3b53b466e49b 100644
> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
> @@ -1152,8 +1152,6 @@ static void tce_iommu_release_ownership(struct tce_container *container,
>  	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
>  		if (container->tables[i])
>  			table_group->ops->unset_window(table_group, i);
> -
> -	table_group->ops->release_ownership(table_group);
>  }
>  
>  static long tce_iommu_take_ownership(struct tce_container *container,
> @@ -1161,10 +1159,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
>  {
>  	long i, ret = 0;
>  
> -	ret = table_group->ops->take_ownership(table_group);
> -	if (ret)
> -		return ret;
> -
>  	/* Set all windows to the new group */
>  	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
>  		struct iommu_table *tbl = container->tables[i];
> @@ -1183,8 +1177,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
>  	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
>  		table_group->ops->unset_window(table_group, i);
>  
> -	table_group->ops->release_ownership(table_group);
> -

This is great, makes alot of sense.

Anyhow, it all looks fine to me as is even:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
