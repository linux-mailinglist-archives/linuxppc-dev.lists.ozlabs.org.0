Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F36E97D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 17:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2LT05Jf6z3fTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 01:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tXU6ISoZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::602; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tXU6ISoZ;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2LS20ls6z3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 01:00:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1oGjl4LwOjLoQcgbuLUw6cL5uzdo38DlRqS5tfEPyMrzonaRtGCkGXGwWyRBAGHfbUaFVsb/KbpS83+ix8iw6juAhImaTve4tMx4WrieXGs2redl4Os727Q3GqqrVuSBnIvTfXGfk4vY/kEPUQ/VSSnYUOMvVQkn3tsBaWnyhCbhjeb3du4SwH7YzYuMlkhgRUbnNzGU521bd+IDbg4D67TdTZDAKBnMPTPaBzIwLsHC+UPGuoiERum8V/DhIZGQp5io19xTAxDk2LKd/6Iec6kd3qMJBQ0zJRWtlG/1k/A6WiM0Jqvg4ZOrUeOaZTFuTppflmZnSYrYLe/AAaDOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6pmelraxc1z7Xn9kfKLTZmXdkra9BksMRB4bWHqdh0=;
 b=VwPw/kn0OEovU/T19W1JVmtlrzDZvhjoOtaVfT/u2pCPRVPaum7CghoScK+/2alzVc1wdOXS6QIe0SVIDsvq0m5Or5Y7eGfXKNxPdlVmbXBYs5CTbORhV0fh/b9MeA/kbDbqadO9joGv/ZqTxVY+vIj1mwzvSIn81ez6oTvAKzC7pX9psnpuy/mR4bk1Ll9Ekk4Zp4UD0T118h1Jvu6HWyhgktgBZ7MsRANd9vVEf9aWin623q6e1liVVdJaId6Y16rzhvPofTAoajwVBDLiXga8F4CUD1TVErgV26pJtOG/+rfYvs5vhgi4ZTqeSBCoZNK0OsW3NQdfYZEiETEzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6pmelraxc1z7Xn9kfKLTZmXdkra9BksMRB4bWHqdh0=;
 b=tXU6ISoZXQKdKthK8WsaTSck4rTO3H7DW9/tvZOQoptUWb1hJqwVCG9E9N1jj/Vk2YeynrKpyZzI6xg1zMaOiDRVfM+tJDc7uWFebaOJtaBOIuAEtYj1FfipxnSxV4RKAQNSs5Y+xzACv76cyNurcJSyZ20rMXX4uWPgQrBZlHCJCtjIxoPgIotmhtKlWFo2nY11C+dJJFvXLkASzFxmG7eE7foEbsT/TdT6iUomLkWeeXa6SSxp14jc0+aOLFD1bFNpTn3rizA51ME92CjGfudBypbp/x9RbFTyaBvmbl9E51RB6Zg0OlvyF/eA1ubb+BqTp11Fm4CtIn/NIrlcNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 14:59:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Thu, 20 Apr 2023
 14:59:56 +0000
Date: Thu, 20 Apr 2023 10:09:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 10/11] iommu: Split iommu_group_add_device()
Message-ID: <ZEE5bpvzS+tI+MXP@nvidia.com>
References: <10-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <132ceb1f-4559-5a99-af47-1a86a677eae7@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132ceb1f-4559-5a99-af47-1a86a677eae7@linux.intel.com>
X-ClientProxiedBy: BL6PEPF00013E08.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:5) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: e524475f-3708-40e5-e74b-08db41afe750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o4x8d76y+nra+TVSpO/ZofxKnrb8BNus2EPYmUAP4skYtdOo3JVkF/WADiTvimpjrGj62QSOHm9r7rjF/tvKZfv1gVXk7kL2QChSzLWr4o6Zq3nxJslsiuzcN36QiCrTDiK3V82fYr0WlCAMVuWf6ngGFLFmCoM+0qej2aFBzS12FjKPcypCaDs+NmeD4OpM8WrQBC+Lzq0U0FWnFs8Im3Ondkelpp6nn9Lt5soLcPZSTA5tMcsE1nH7L05aFgg20g8GMPutSjr2oC8aQWuiwUo8CRatvmOM07H1FHsFMiaAzSaQNKrtxNVy76080p4t1pNLknxSmiiEMgCk0jAUMhKB0G3CJ8LiKMRmmU676lt80eZX/5iMUbs2m2pxlI/V+Y3sd3NJ5f+Z6++/akbyKifjSmPOaMfsCVXWuGOLaWEql1vcRU7UcHtSIGn4I9qQz+GZCvF079i3DyEG7eNmme0gYQVMy6Jtpg7AhvhX92nvI4YNV4ddtav71qBe2yB8lzJCllVcOXojsioyRVS+E+mpciTlph6axfLN/86GdvOy2tSnv4L3pK6+HlVFhPE9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(451199021)(36756003)(53546011)(4326008)(54906003)(6916009)(316002)(66556008)(66476007)(66946007)(41300700001)(6486002)(478600001)(6666004)(5660300002)(8676002)(8936002)(4744005)(7416002)(2906002)(86362001)(38100700002)(2616005)(6506007)(107886003)(26005)(83380400001)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WMM4u+N2WFcHNg3Zf8UXd3SMikQMr6dMkSQCk3+ZLkvRdkLa2clhjBpELFAZ?=
 =?us-ascii?Q?qTmrUDl3GTnS9dMjlaakqZiCOr2N6WR2sdGawJ0h1DUWzhUVUWbzpxjRhYCR?=
 =?us-ascii?Q?qcrBZFybExyNoanI931FJDL3zVpn7LBvAAT8gywKzGz4FJqv4G/O3agTsIHz?=
 =?us-ascii?Q?IdvO9tP5TVewStIoKVQsnHLXP0acEfcAC3BLPFVWs5n48lczOOQGVfLqL5qg?=
 =?us-ascii?Q?CRYXL0b4ArAHT1sNnzCmR12xXj71gp2LzMsgZpOducXMCc6nnOyk1x4QSY7v?=
 =?us-ascii?Q?mMUzmihEkA6so8Wec4GNXF9TGvRejlBH3os7lwWMSGzeYT5JBGq+Bx8Vd4+Z?=
 =?us-ascii?Q?hJD8/ncmUGsF/SdaY52tqK08hrXWaiJNjv3KbS2Nr9WoAmPF08lSL/X66qFW?=
 =?us-ascii?Q?geyxi5ygrPLZ3G73INcDyOSKaulfGm/gZddZ9VJPS+knqbgO3Hw67vwA2E4z?=
 =?us-ascii?Q?p9X4WZSGBliQUZoXKimDUD0UOwHWhN8ZcR7XTfG6ujlc/X7owXcWuQpG9+Z4?=
 =?us-ascii?Q?tZPzazQxyXnKxT6nPo4B7w3022y7LxYFrcBGdD0e0WAscLyqKRJkEW/T+pyY?=
 =?us-ascii?Q?pwLL5afkAzOduur6TDvSgMdZRogLQufq/I3DlpPmPMKu4YpRuRyfR3yhAs6k?=
 =?us-ascii?Q?Ekx5+XDXfxaOQslfRz6iBcbTmVX3KOjT3vmhuCTX1QJxnsT0jVxefioX+Xfi?=
 =?us-ascii?Q?0Pqq2julUtkncvHOKkd/kJYKGMO0l46d15J5q8VHeucfOYgTyreTFlnO+uIA?=
 =?us-ascii?Q?2CtSH64kE/qUCiecZD8ddsDDhMh13OehvjKmbZZlcKgSxUjvL48JcUD+H963?=
 =?us-ascii?Q?rTZjO4Hgn9h3FNqpoUkNxqvpebAKeP+5eZbx6Js0YjbIKJRQvYrBvLrxjA0F?=
 =?us-ascii?Q?nOFn8uHCbjlj2J+JuQnTbD420FLnPGKna9j1G64R1474QLtN+waSqEbdlFkp?=
 =?us-ascii?Q?N2LWZiikzqpbzGExISsl4GtCM/KIj+6gTPE0VRJuzoY7ZynhN4XQXBVRo0dc?=
 =?us-ascii?Q?Hd8004Fwn3wrzzNNIXXn54euO2KlJsQOVhf/p4cqI+dW5bPRg2nRNTox7zc4?=
 =?us-ascii?Q?7dS6RUJhZlFobXudrAbYA81wyYXzI/AqtZboOlETbtRbhiDc86Z9iC6asAFc?=
 =?us-ascii?Q?e9zBiI7XlEdGHsG/vB8BWcFWL9AphfeCf4gRnf+kSZPu0+QkeduYihWCRakp?=
 =?us-ascii?Q?v5rdrUpHGb4lK/ST7CD76D6COaIR/002Sf8u5riKj1FTTRSJH7ktqap2Nqlo?=
 =?us-ascii?Q?vTkRpBJaTGNsfKPqbYKa6A4drs369TW+gz/FWF3wiipN3w01C8OEckca1RYX?=
 =?us-ascii?Q?b5tBVbF73nzzMcsskpk1T+IGqHPGXzC0R1+5/0BJDVDA4AaescdMd3cxhnj+?=
 =?us-ascii?Q?5hxxzTLqBjDfGCcCZI7f0+Bd6YtP9UH2mQN5KMoLhmf5Bh+znm2/dtRUeiIx?=
 =?us-ascii?Q?jjfYlqxOa9J5bX0UECoh/GmKfGRboANZ1AgkP81TVXNUNBSEXoGPZ5znrzZ6?=
 =?us-ascii?Q?M41e2mEAfwOKorq5Y33ppLXeqsOI5hvtEnQAI1IWXMDa8d2UIokW+K8sKH+p?=
 =?us-ascii?Q?xuHnLqM5kjxithD9f5aq+Zzq6iC04mWUVd++pco4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e524475f-3708-40e5-e74b-08db41afe750
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:59:56.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqAAHTzzGQGnDpENY5wrtX25vx+i8mzW42Xc2PspdzNpUdmxLPrGKTloNSZVw8aT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
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
Cc: Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 20, 2023 at 12:25:11PM +0800, Baolu Lu wrote:
> On 4/20/23 12:11 AM, Jason Gunthorpe wrote:
> > @@ -451,16 +454,17 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
> >   		goto out_unlock;
> >   	group = dev->iommu_group;
> > -	ret = iommu_group_add_device(group, dev);
> > +	gdev = iommu_group_alloc_device(group, dev);
> >   	mutex_lock(&group->mutex);
> > -	if (ret)
> > +	if (IS_ERR(gdev)) {
> > +		ret = PTR_ERR(gdev);
> >   		goto err_put_group;
> > +	}
> > +	list_add_tail(&gdev->list, &group->devices);
> 
> Do we need to put
> 
> 	dev->iommu_group = group;
> 
> here?

It is done in iommu_init_driver() and iommu_deinit_driver() NULL's it

	group = ops->device_group(dev);
	if (WARN_ON_ONCE(group == NULL))
		group = ERR_PTR(-EINVAL);
	if (IS_ERR(group)) {
		ret = PTR_ERR(group);
		goto err_unlink;
	}
	dev->iommu_group = group;

Jason
