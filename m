Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBD6EF5C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 15:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q60Zj4Fgtz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 23:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OnKTcS1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::629; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OnKTcS1j;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q60Yr3LdYz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 23:47:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh71EuV4h2rOlCF63vmBdr2PMOK2oBmKSfbyMv8YQkSUAu4FFj1tmPZ/T7hjsoN8AHHtzaZbeo6o7kmmiHA9y4n1aYwXlwAxVhVSKgrfCtE1/X05FU7HIJxtNO6xUl/IrNhnT1/xZLUfC2stFP+ontlsqqCrvT7t8yOq5nMlbDosQf/0Pk5OevNl9FnCSuzKr9QcEeB05R0k6uvlnfd/7twwR509qTuzYOJi0X3tAvL00eXml+UKlCPxgJrxicCKuUcyo035m3bVTuWq9Q1Tm7sZzlDSUEELROTnEvyjQSGxxdHHGAFrHsMeZDuMdQHdJEyLxMa/HjYYZq1SiVvgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpA+3GsfHkzitOYBxOdtknCI+uy9bvzr3j4J/OReio8=;
 b=XgjU7Z2YFF8PSWYvKPYeCKfHVsChD09MAh82fQZEbfaJf5Jo5n/xRTk7H2qxquyJnkw+vI0PkwVQumDTCo00wQpsx8ZU4pcSOddxW+yQQISxIO7nUy/Tn6qPftm5SsCVtANvj6PwU2qAkHlLhPa3x2H+9tHF3x7ToFdjUwOBIvGJ87CwXyLVE2CNTVHk77B5EKoS9we1pf6kI9hitmH2mbARqHTjkGRiJgQJlap/RiltKIEQ1qREmumgLtOdTmcRUrokRCskJGXTLCwRMI9b5mlwzgpL0n+hhzripY08cEwX24RX4i9EUBP6bZ6PQdxqjTkFz2xA4F6EryRxlRmGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpA+3GsfHkzitOYBxOdtknCI+uy9bvzr3j4J/OReio8=;
 b=OnKTcS1jboKS8mAsqJeQFSenvxEuHy2iOzx7abKQs0XZDjGdwhOksfkBtYEIVEO7i2Yz8p9nalg3RM1hNFJe0dvxFSewdBb+ZtqIZSIB5MjCTw3oTIM2K5zbQm8C1DCjOfH8GSl4ZHgHdvfT0ut8EMPyHoTbKRL105fk0DVobDfRLc92jSwdPy7q9Qyg1k84knJdv+aZTUctD+Ko0L+9LBke5FlYngog2wqLMv4WkHbVVs4JjAT56dsXehpzyEphDd/O+tADjNzF32pVtAm4T3OG6sT5mmXpeQ7kcustvaHX3D9jFJ03RYO+4lkADlSgDViJ/PQMtgnWRToFYxq/iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 13:47:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 13:47:37 +0000
Date: Wed, 26 Apr 2023 10:47:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 08/11] iommu: Always destroy the iommu_group during
 iommu_release_device()
Message-ID: <ZEkrd2VY3wOdcSWm@nvidia.com>
References: <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
 <da60a120-e1dd-3b61-d6c4-ba0d955e2339@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da60a120-e1dd-3b61-d6c4-ba0d955e2339@linux.intel.com>
X-ClientProxiedBy: BLAPR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:208:32e::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 97028621-4edd-44c4-87c8-08db465ccbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gEJ4P5dpzL7c+k2NYTr5Cr8qLmL7qi1Yxhy5ahssVAJ6Ir5ZlHeD+jelreJvVYy26hTAzSfnLnKV5Tw5uMn4vc7L3JpAFTKNqsLKhTMAPWf+KZ+YJbB3dMW/QKgoiOyscCnGFkbPK1+BMVG/UU7o190HxRQcGUTO3WkoSo+gMmQFTJzhUkOzLBArobLFl8x47eIDQ6PUkpAJRqLNgYHJXqX2HVhUTYTsyy72dPlZunLQwaNTsdL3WlWy4lBQRfIr3RgbIokK/6I0h066T4SmJgoxeNIgcZAZrLMQ4ovgFNKuA3L0Ew2brr3luZZlxaAac7vWhjNM7zFYZEBdmyscdKy5EfQ1ynFEJa87h1Ch4FvWXrg/C+8mrhSa85fMRBgihoJ4l+5tDCHSsNBFy3QdP5T8nAAAah1cuBO1hunWdQ5jTyBBnFqV1QZ6I2lvPthzhG1TU+72tuMg5XeVeixOySphvsWnqfsKJcjFyy6b4SYsyJPLLOIboL/0/7PE0qvfu83dUFOpNJx9zEfQPmsPMTtBBNSX4b8TNTJbffD39yMUojmWr+oWL1xxuIMgeDj+
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(7416002)(66556008)(26005)(186003)(86362001)(107886003)(6506007)(6512007)(53546011)(36756003)(2616005)(38100700002)(8936002)(316002)(6916009)(4326008)(41300700001)(8676002)(5660300002)(6486002)(66476007)(66946007)(478600001)(54906003)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GfuD0oSAox0D5GoTaQcTnCwETYvOy/WcXz58OYhcyTtZ43yRhppSbOixnM7G?=
 =?us-ascii?Q?BygLN6hi+Pz4B+9xJSYh9LX1fhXn2NLqvTh7MhvKo2A8AvVVLByWZBcE9eNu?=
 =?us-ascii?Q?f/uMNSjgRXBD/D8yFzk/ZYgcFO7p/rF28gmqymyMyRR/OyYfHzlo1YpJCeEZ?=
 =?us-ascii?Q?3T7cfswSrNY271wgf63hYEpAEPGfe5/bL0b19yH2qXHXuGGxOPPMBOg4Rnsn?=
 =?us-ascii?Q?cA+PjFBvP8B8jV/qEPVb19waXax+SRzjr2tSoDFZeKrAufIi/7HDZTu86qa1?=
 =?us-ascii?Q?5j9XMdq8qmvpOVKzD2Z1xJv0w78E00MhT4VcNC+IKaKK7vKOwQGUGLQ1k81e?=
 =?us-ascii?Q?7NDJDSi+Jl7mhS8DjNiVR09DG7RxiyRSr+NPbhllrYEbnP/sHwO9+BZufvl4?=
 =?us-ascii?Q?iIufVXvFej341CvRkmDgssX6g8oTFRXS+NTXO0yP0Cc9BJxq7X5xWjKg3hNn?=
 =?us-ascii?Q?bhDPK/kSzU8SmlPkXgQ/KQnpWcvSxpLfQXL/jaQvJskhmfP3FOZ547s8G7cq?=
 =?us-ascii?Q?aIi5dLCxvroE7J9YFyHehHsGYsB9CeD0VGLz9PtJhnffxrJZ1n06doG53SIz?=
 =?us-ascii?Q?uaRIH9d9Eb72WlATad62lKN1f6Y2LzoGI+orltBSJqz6/zN8ybMBb+btfsiV?=
 =?us-ascii?Q?9LjAsXGk8urLH8QDIkvzc90UXJXipiPsVmm7UM8X2tQS+ESsM/Xof57Z0A3K?=
 =?us-ascii?Q?4AMbtC614rWLckefrYYSevCKpGCZPQ9jgfXSBbHCqpmp2UGqC1hzoe9OHB4n?=
 =?us-ascii?Q?SvvlpEPTlTnksZBOQefv5LU4dgkIY66cdkdzMlAswSQqHT+UOuEvORjKlf/Q?=
 =?us-ascii?Q?mKvCDAtpDaNT3z6lptaj8ZaD5L0/EymP+OcSY0lj7DYaznClrv2YlMFbhwjc?=
 =?us-ascii?Q?8CYaO7YTsG9LVYguc8ZQ9nkMAnqS3FGEleUCtLbfOyP1XBacEkW4fWB7o0B6?=
 =?us-ascii?Q?dM99PoIu/qRDCBMbncgD13Dt5DRtviXlda0gJgbRk7mVziCVgywGMOW0d1VT?=
 =?us-ascii?Q?BtYaoc6Sto4zpjwIqAZJwClfA6W5T0s7LpqUt5n006AePvT4Lhm2Dmh9RAWB?=
 =?us-ascii?Q?o50rOJC84Mf/5RoWq9wGs/O8bV62LzbEy+qmF/LHGbcME40WzWmmFL8LuHg3?=
 =?us-ascii?Q?+q0zhwrCXXbMF5uK9E8DPaLfsg+pAg5ozJfCr9i9urdAoGFUt30zy+FY8Tof?=
 =?us-ascii?Q?5PTft9cNmPisfVLJPs1Ypq4Wj66A3614WalgGkxvnkeWGUDCVW8PiyhDJY0E?=
 =?us-ascii?Q?PU64oexU987qYwQZxajjjtEe9Yq0cCBPT/Vs56eumBevhMSqBpGAtWmKUPqY?=
 =?us-ascii?Q?NrpOJIaQsJBgFhG64xEv0wDbZn7JKPdBwoqfM7k6twRlUIsCiNNA1xQV0O0v?=
 =?us-ascii?Q?5K7hw2Dic24pyuRR/xjgc8uBHolFdQ8zUTahSNbVckhV0gc2L4svBvY5KFiO?=
 =?us-ascii?Q?gJj09i2KRDRPrW8M4JGtu7L3JdxTr4Bv7XOknnVINRBXErCEo3hWfemR7WI3?=
 =?us-ascii?Q?2Hc73tEIJVyzL2jNnYEqWHbRMX3vyZkNYLSjWIr8ENrvKfCDqiMYXFW69IoH?=
 =?us-ascii?Q?pYqJJU8f0u66Wgq/KCZFegzuEHEMtySvlbDDe3NL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97028621-4edd-44c4-87c8-08db465ccbd3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 13:47:37.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcB76GR2MfSe8VY0XQ6VB1TmaJGYFDD+m6uc/Lx9yqTF41zCPtynYT3287IXjCfQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731
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

On Thu, Apr 20, 2023 at 12:23:11PM +0800, Baolu Lu wrote:
> On 4/20/23 12:11 AM, Jason Gunthorpe wrote:
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index dbaf3ed9012c45..a82516c8ea87ad 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -569,7 +569,6 @@ static void __iommu_group_remove_device(struct device *dev)
> >   			dev->iommu_group = NULL;
> >   		goto out;
> 
> Nit, given that below line has been removed, can above simply be a
> loop break?

Yes, that is much nicer

Thanks,
Jason
