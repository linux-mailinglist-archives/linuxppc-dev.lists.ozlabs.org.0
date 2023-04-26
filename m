Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B867B6EF68E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:37:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q61fw4wfbz3cff
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 00:37:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KqAx77Lg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::624; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KqAx77Lg;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q61f14mMRz3cM1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 00:36:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBu2MrhqVKQSrKwsu/oioqQ6b3klprz7vU+Gv3wvjL17TxJ/09jk98ynPk7VtuEdRIDWggnJGrYXX5+Fgq8ZdzXCfcjVLoxFEAdWDb4oRf0l3iH+wy5J6KTSGBblR1XAq7KrvEqTyJD9ChQBXnADMgmFmOxPvS3hdoBpDrlU3jh7/8dpsNoZelO83Efua5p8LAcTsmvcg3yAATNoLFKd9p/TzcfY2zx9Mkg48roJ3JBfJS7y4NpPq2YKPrs8620n3WaiYHa3kdg4PHZF7jH+T9WgSgAf7y1Fqi4orhndLIiy5pMeembP22SNA2nMpppBZo+Oka8PtxsVHq2eAoH5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6L7ZFHkPu0G7khvpeAwPHtRMc/MzbK49oi2u2H2m/U=;
 b=hzO6nuiPvIW6+WqcEtS+1epTS10bWgLx7rKhUrgjny4QOVtmlWwAoe8azI6Bk8iEin7VeIFG41gwFiFC/clMD9aL0qGwMhpJQ8rh5ur/RzuXrI0zuIwSEDoARTPUlmmestsQ/A4eS8JewmWuk2SgckVgEWvS5HJIpPZVhowRv7ndGFBYgF3DuFEaXbDk8GNBaKXEqe7/Z8gJlu6QNhL7WQzllQyV4hz6C+q4o68biYd4Tr+AINkNvkmm1ea7/QKlC1lFbmEkyStw3iig7Sr5ir1Wz1OzR/qY2CNMaJUZj4gSZI3LFaoAu9XyGIxoqX5FL9VuHwWS5ljg+/XKl3lffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6L7ZFHkPu0G7khvpeAwPHtRMc/MzbK49oi2u2H2m/U=;
 b=KqAx77LgJdSqt2Dzp++9j/1LKdfggd8UxhLnZ5r0BmJXhafjt7q+/lA5Myv2BGmL+Rb8KJL7pgXQOGGDH9+gouJ7U/Bg9I6dTslRjbcnlRVOfhfnTmOEnnotycFswxyjWswL0AenAwLP3cGSp1JsgiTBvWBBpMROS0rrby+9LU09kBEQD5Cc+OTYU/9+DDKP+MF+Ovca/V81mLWVrO1MK87T3q/gc26OoUemuJR0ckXXkxEnRelkPWCabz4VpPsNw/+lKCju/waZ3DBeihVLlPCoJ4jMN3RMvYblbnhx/0dQ7WVzeNL92efpQvkGn6xFnZmdoXNqfrrFXJo9qa52MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA3PR12MB7880.namprd12.prod.outlook.com (2603:10b6:806:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 14:36:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 14:36:20 +0000
Date: Wed, 26 Apr 2023 11:36:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 05/11] iommu: Add iommu_init/deinit_driver() paired
 functions
Message-ID: <ZEk24ZAyV769JNQi@nvidia.com>
References: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <5-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <BN9PR11MB52766930EE86D8D629258CA08C659@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52766930EE86D8D629258CA08C659@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA3PR12MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f3d359-facf-47cf-3ee4-08db466399d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FwtNpKblm+Fe9esOsm6wyvfqe0xkupZUHpOR/woSf01MmpzwmGxBoYqUgChAERL/NAxi0NKXIzuJmyq0J+xfmdLyptF/mV5PGDNpA7nFHvdNXKZu79aKSzVmD7OlzstyRtLKYwBiw2ocfPVFimCyhB9DZj4zt8ggeorzwmM7t76dA7rqLaOw7CD81DUyqP5eoXFwjwrylCVxdYS1mbJH7YufnoOYuI7GgC5a5IiMW0pySpbTVb3yfM9dCok8Ee7Bi9Yynb+KutdzAt5g4k8wkFek1r9CCpmqwbbriVwliLMMciKrdED4JTrrPClkRYY3YfJR7r0LU36IyfPVL7ZujYZN6MNL3nUZRrt4HWDbvXAErQ0lz7zL+6Qkz9DPfZI6JmraiAAHnwAvoBEFR1QubUMArvHri0EYa5Y1+yT4XXBlOTs6nxeH2j21UkXYTSJFJZN4reN/8efehuriCQZM/oxxhyio6y5rKacvLRVd9DAliovW/3lHYL3tt7N/uwz0/0vm36D7TLaL7qt59YbrPfVY/vfq0yRxW2/Rq7TwiBzEbzkruKmeA9hEFVqkVKoc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(26005)(6506007)(6512007)(186003)(478600001)(54906003)(6486002)(36756003)(6666004)(5660300002)(7416002)(8936002)(8676002)(2906002)(4744005)(316002)(4326008)(86362001)(6916009)(66476007)(66946007)(66556008)(38100700002)(41300700001)(107886003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uw1NIXzqWm7w8kdwt7jLvYS4Ft8M2YfzFzvKrzZRGU1XWbXW5EFMWmP3q5OU?=
 =?us-ascii?Q?sJkmjgjQ4QiWp0mU2Luxl+z7FjlZQPEXgq5cZaNG47w8+xP1qPp8fN7zQOt6?=
 =?us-ascii?Q?h5X7WJ8X59GjGgrMsqSUCCtlXijxdJecrO9vuJKH0uFVolGB6gaf5BWrpkUe?=
 =?us-ascii?Q?qL4NWBpAgFrnMn3zGLBBrUcrBYUsVdiyqzIG0ARRJY9qcFrZEFMkkGy/ja1d?=
 =?us-ascii?Q?NWFImu5crIp/MMd39I7GkEagxx51bFTe0a12crhOJXDDbJBCu/ODhi0xuFhK?=
 =?us-ascii?Q?oNM3S82nv7+zEaaY7p7OcKIwil1tTv5KVur7qUKc76Lm7EKfgrjAdc6rc9Qt?=
 =?us-ascii?Q?BelNldl3a0JjUlJrLrj/y0OZcNIkYndigXk3qMH1UMzayHS/ZhQGoCV4HvKy?=
 =?us-ascii?Q?Wg0XW/wzuO9zIjKfnRtPdL7zH7Y4p+O6D4oKeuKGk6Qhfu+8aiD8HZO/UnPn?=
 =?us-ascii?Q?lfIEZwWNso85AX/G3bVRz2cGgy+wT1E7SCmkHMSnznBBBJcdpsWLjwEnzyTs?=
 =?us-ascii?Q?ABQefn3q9SheVdYuqvvsZ5RsbBpEowVhFWa2+VW6HBjTB/8pSHN3DXqAfyr1?=
 =?us-ascii?Q?+cnSp9P8KVaovNFau1b7/g3eSzxjGhBnbLr5GTsfi4Omx2PL1Thl2QGsdx0M?=
 =?us-ascii?Q?arjBieLpn9RrmHkPn1FM5QNocEHAG7pMJ0+FegWpsvHvudan4nL4iUZjcPca?=
 =?us-ascii?Q?X91Tgc03KMBJFk1a0dcmmTb5557vfe57kUhCvNw0KwH/R4kCGcNYDx0Twbp4?=
 =?us-ascii?Q?HlamnMzQGsKvEisqt7lmjsPMj6sSQE/urLPJiRg6nO3fx0ixil4frqOMmooW?=
 =?us-ascii?Q?qkRSv5IbcVmcELiNI5V0R6/XFNKuR7bVfNmhE95UlCkqEpdY8vXyVcqFcCWj?=
 =?us-ascii?Q?UV9xTmvMdT6HiZ7Ioqc2gJUg4WV2ijfTHhAJA4qFuEJV1Q392cbf0wcqO2DR?=
 =?us-ascii?Q?3N4aviPA+kJsKV11NHTSJMdeRtxYhGRRiTQ0ZPXQ2C58K3/PaAvgaUmakaCX?=
 =?us-ascii?Q?l+vVYFE5ozGIdTi5zLIsPkAR2D2NbPAVR0TTx32dGNThr5ZH8iOLcd0q7I4K?=
 =?us-ascii?Q?QVnuV47a7YXplZUtDg4y9R8OCeY0qqHdmTiRXZNhp8nVTrMvvdsKu7jCSmfa?=
 =?us-ascii?Q?nKBHxSdI3mIwLOOTSt3zm+Hg2zXR/+OIX3IMEmUsxdmnHqQveinAqJY1ctG9?=
 =?us-ascii?Q?L9KuYGRcYO9IyoNJiMOFambAzlpVXyMOfkmFF3zkCH+NHxf2bAiSoSMD4pqC?=
 =?us-ascii?Q?KnL5b34ImSXyiefo+CgJdzyNRwTIbBIx6kS7vAcH9D0hWZoXrtCovs8YB1E3?=
 =?us-ascii?Q?76N6gL1lPuulAdFhupJeywl9nIV+5EWCjtkpackmPI6PzE7W1HOtJ6A6hQi6?=
 =?us-ascii?Q?BqdTJR/GJeP8yOXCbUN26MIfyfTwGVN9/bxbhfbC+Fuxy5iZs4LFxp/+cy+I?=
 =?us-ascii?Q?aNO5IW+1Yjz3Q2i6lCY3e1cWSTYNPGyLSMIwHlrz47bmSwNVdbBVJWMjihYF?=
 =?us-ascii?Q?qPFMbd4Sw5ny7VbDXhS35uiC68g0zVRpPwLFAKYQo8ywE2d0OjZs/ifJ3Irp?=
 =?us-ascii?Q?gDi786JJdR/9sB7+6K9j/dc7PVGHx0POrwmMQ3qW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f3d359-facf-47cf-3ee4-08db466399d6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 14:36:20.1358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSPmQHPDtScJ4VEBqeEiPL3/adHCqOPKNOPaXEZq9ROwmiuRTht5ZGJ35Dvqz1nN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7880
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
Cc: Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Nicolin Chen <nicolinc@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 26, 2023 at 09:41:38AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Thursday, April 20, 2023 12:12 AM
> > 
> > +static int iommu_init_driver(struct device *dev, const struct iommu_ops
> > *ops)
> 
> would iommu_init_device() better fit the purpose?

Yeah.. that does seem better

Broadly this mostly sets up dev->iommu and gets the driver
connected to the device

Jason
