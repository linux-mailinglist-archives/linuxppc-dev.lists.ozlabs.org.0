Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C56E7F57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:14:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1m8X1phVz3fVX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:14:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TF55AK3G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TF55AK3G;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5m0Tb8z3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqj0wCssbCBTdTWx6Rwjf5/n2R7GorjXlmXXhJFwd7PHRfqaZcxPwsrIo8ht3ajASmzerZgt3UTGDVX1PxiHrln61S1Nwrh9um+Dj8embUpqEMAB8IkEehJy1n/W3PA+f69T/ujusRrtuXmq/dFkVrYk4OBulXRLzTi9LnVx68PLwa1TkJ49tVhpA4lzAoY7PbtdLLLUmTeTV5pninNwT+M9vlC1NET3DEbP4OKFz5wBF7/oASk7WVsZVpcA4AFZ6QwzXHZtkgYyLZ2eh3Hv9e0e5sxdhpdYiV2rbb2ePmyT0wEmWnkWlWE7fNp13CrGjaihJEP55j9HoJeVfstuEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQPUsuK5vGIaJef6f4S7pYnI8VbCHe+jPeaMkcbKN88=;
 b=BE4F9+JmCdLZwAGoXPCtvg70K9I+wC/RfklCsKfw7MFFxUEWv5CyUTkRrmX5qYH/tjhkk9l/1ADJjTeAp1f8zuHHIytuOFg8Wxa5mlw3X4dXbf2fogRWc+Dx/nF1Zo6NFynI7t78lSfJ1P42mT6i3RvXFQPfvuIy9f0+YVNcS5hJnqEdR7FBmp5wfl6PoeYjOCO+3bNjAqMI6ZIGf3DYBSmo1EVJHXVmUnkEr3bz69T5sw+2/bY/qL+FS71lEZQ6ys3qasD1zxLheeIhwFHpYhfMIcl4LSyKJuKct7zHIAefOhsVPoe99+A4q6IVyWELGHOE33SFWGIPHtlM6ArmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQPUsuK5vGIaJef6f4S7pYnI8VbCHe+jPeaMkcbKN88=;
 b=TF55AK3Gxx6yRL4yPrEFCV+jOsPT97yYEdqcqaYxGIHLvMYHc6H4+i44csoiPt7NsN8nlNKocovRtWDkEBut34DSOygVFZOaUN1YkaT0Od2zQvZ5Bx9Fqjind0oMXQfiC2YFNCv7gdfee95FTMjUxNOAyVZwXjEmaM2EAJq9rnSK5qKCwwhHOoWOOgXBHUJ67Lh79WkKMzrpVody1c2eDTMinhBdEj+XepIkIgfdYT7yJ6m9hCTkIrl8AIq8Rr4ZLuuqPzRFYelLwIs2gX0aeoV90Ht7DGTtQQ5gG2VN/83mogXltkWluibcD74h47peO5bX5jcdtdSOLOEd2U4CYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:01 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 00/11] Consolidate the probe_device path
Date: Wed, 19 Apr 2023 13:11:46 -0300
Message-Id: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a38f5e-94e5-4491-89f4-08db40f0ce70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DW/kT7uMag8c+B27SsbUJnkUYSCuedVkcLtfFylulA+2IfyYn4GBGBzk1YKDvaz3h3RhNcSxMQ27sAQT+V3qz07VqmpvZbe4WdwYdyRHJ6+d4tK9gMDPPDc3uNYwB4CkAncvLHIAEjDiC50u6dHsYXxrlDG3Ne9vmOUaFqLbXjY1DQoHxEDjkpmBDrA773ri5yvjHTZ1bIfqbf+jyoahMCT6nY9jEGgA5lIPTO6zwz/j1nmUpNx9r1Lpn6Rbr57RXIRYzVPoa5Kp64iWEr+UNjnIe9/avkLscDxzvgafnX7RTKGwDIMvwWZHiTbGtT1wnMnfHB4fAVkU0WbWwXiZa/kBeaAPDHLVuOenvMdjCt6Suz6KGK4FcXEEPb3kafQFt0igUdJ3jn9zGhoONSEB0kjYHNSBRxloSOTWXeKOgSQEddqpxPX7o+Vsn8606YGFtPQsV4wcw1Vmhu6ytrjlyAuieIUWwziA6VT7EGN7q8cwFHA+qjcD68IoTJ6a5DaSuTWNCcmgLbas6g9XOrjwKLHQRhLs0rDq77vQtgUaySTJlYOUspfaNLtkgOw0JcA1a/NCGSthkVH1qvTswo8ywwWE17Xw8xIWbxCfkS0C/jUicHlRuPFwzv/RV7ucVirbDRNnoJoWDWqBmwNsnPHa2hDr0p2Pc+LNyRASRXkEqQE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(966005)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+tJkyBwa+yAE0snvrJu/q2oVxxl92WDqmZOHhKU6c/AqlpReN2q8pOCm3E9g?=
 =?us-ascii?Q?mkhMWtWiZr6EEsF+C6YONClMo7HD/x+u8Sn+L9oSw27TfFXWlZBM+Gyc8FcD?=
 =?us-ascii?Q?KffTGbV/HIXwgM7gUiarUBATOCtDVvRuvg0pRyWYFOOUwetp9GSpfzLuoynp?=
 =?us-ascii?Q?SWbpik6SVP2zPpyIRzWAYDxASlYcwXhIGfocU1cvz6A60wWFF6x1YwYi07kJ?=
 =?us-ascii?Q?+umZTTZQeqMUs7gIzV7iWI9NQvFnp85i2zvUkTQNtPvqJ8CAM4GQguaOT20c?=
 =?us-ascii?Q?jcDWchFZyQRTCRO/fI9wF5eKplgznWtmU+n6I2+53daTaYSpOp2/wnREb0j1?=
 =?us-ascii?Q?Sb6ypsFs6ycVJduv+MFVdNpHG2rRlO0PpKSgNSMpNVroHZPdBS87GntZr+En?=
 =?us-ascii?Q?KMZ0ZrcB0verGc3u4ih3tZAEbOpppgUQvqAX3u1pGLZN5BRybwUWrntrfMD6?=
 =?us-ascii?Q?fimXG7FfOCzCLHp+n01cZAn84EsLGHQCR9DVnOceJ9ZBJX9nFzo29D2oEwOY?=
 =?us-ascii?Q?FRpfC/hTVciEyhw78vEu9ZCgh7uidjt58BbrR+TsPTzfiusLNBFxLfNU+XIG?=
 =?us-ascii?Q?Lm6uo9DcXMRKjjX9jAchUQ4SCpDLf6kBH0EN8wqw29tlgQJWkr56iixYwkKh?=
 =?us-ascii?Q?jFzWxl7ut0/4RbcShpmhwI3AQI8TD2ktFzlDygmgCpGOUUf2MvTi3OQIhzHA?=
 =?us-ascii?Q?OCinRgPymhLLT6FXgToLCFWK+o2puViJ37JoZOS88g4lBICHCZ47nI5inFVk?=
 =?us-ascii?Q?JDgh+dpsWywNGvxM3Xo3T6iZKcjgGrq9zmULnB1rZTNX43/tyknOthdPscvS?=
 =?us-ascii?Q?v9sUYUQlmEpwU51KJ6BjuJkaFVSiaQmV0osoTVSLR9ZiugYCTnNd4qiibjDn?=
 =?us-ascii?Q?F4GvTjNF63a7OCHF9sh/DWlLfQRlH8CnoARiej2EP9LgXmHuyIiq+ovyZh6Z?=
 =?us-ascii?Q?8wUGghwm8yS+3Yu1nrZX8kZ6vph8wexdgyDuWSClZXKXik7ioU4PrzyDB30d?=
 =?us-ascii?Q?uh4JAeOR62NSESUC6lFTXyN0gKFVgGQRVk87E7HNIQbKaYqR/9RjPEYCBCUS?=
 =?us-ascii?Q?ZQsX2VAicWtZ0kssqRWa8xXXZ/6tWPsi2667/QhzYYhDPnKvi2Beb88KJV2P?=
 =?us-ascii?Q?rzEvqn5BXprDySWic50NpWhybbkSJgnUuGyaFj/K9twBCxObHyDTwmyTQaGG?=
 =?us-ascii?Q?+O/YkOioUeAxCcv8BOhB9D6h0tAy9Ae+1R83rZwuYlVPJ7TNlUnKsQmAUP2Z?=
 =?us-ascii?Q?zdwm9+ae/5qtTpCAFnNVLOsPYTtmQmF6mWS1+QNO9fOONJSAbO8OwNKV3kt0?=
 =?us-ascii?Q?OuhkRcQ8a3k04IFpFpqhFLD/zyrgdQmXTbH1MErTwgNCpHkxX1IdR3miXCEo?=
 =?us-ascii?Q?bbMV1Pf1PwcEmub+wke3KIllMRPwU6B7BrYtEvZbB4Oq/myqkLfEeFIWJqN3?=
 =?us-ascii?Q?U7HBNnFK+5oP5UGd2sSInDvx+4qhvXgdc2UH3f/bEa6fy/zFXR+kLzEbzyBl?=
 =?us-ascii?Q?4YdfZScBvByfjfMocnWY/ojmJZgjz3zXA05dovrMxBLH6+/jQ64izwNjgIRH?=
 =?us-ascii?Q?yOxGS+ioRAF72A1JcqaUJ+y/nGpCb8G+bLJLg8Xb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a38f5e-94e5-4491-89f4-08db40f0ce70
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2VqTJHf00M+7EE/lGpTL8bUGyGgnwfoi8Qqey4qPqShZ8zd7QMvpTh8sbnzqN3l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
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
Cc: Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the domain allocation path is less duplicated we can tackle the
probe_device path. Details of this are spread across several functions,
broadly move most of the code into __iommu_probe_device() and organize it
more strictly in terms of paired do/undo functions.

Make the locking simpler by obtaining the group->mutex fewer times and
avoiding adding a half-initialized device to an initialized
group. Previously we would lock/unlock the group three times on these
paths.

This locking change is the primary point of the series, creating the
paired do/undo functions is a path to being able to organize the setup
code under a single lock and still have a logical, not duplicated, error
unwind.

This follows the prior series:

https://lore.kernel.org/r/0-v4-79d0c229580a+650-iommu_err_unwind_jgg@nvidia.com

Jason Gunthorpe (11):
  iommu: Have __iommu_probe_device() check for already probed devices
  iommu: Use iommu_group_ref_get/put() for dev->iommu_group
  iommu: Inline iommu_group_get_for_dev() into __iommu_probe_device()
  iommu: Simplify the __iommu_group_remove_device() flow
  iommu: Add iommu_init/deinit_driver() paired functions
  iommu: Move the iommu driver sysfs setup into
    iommu_init/deinit_driver()
  iommu: Do not export iommu_device_link/unlink()
  iommu: Always destroy the iommu_group during iommu_release_device()
  iommu/power: Remove iommu_del_device()
  iommu: Split iommu_group_add_device()
  iommu: Avoid locking/unlocking for iommu_probe_device()

 arch/powerpc/include/asm/iommu.h       |   5 -
 arch/powerpc/kernel/iommu.c            |  17 -
 arch/powerpc/platforms/powernv/pci.c   |  25 --
 arch/powerpc/platforms/pseries/iommu.c |  25 --
 drivers/acpi/scan.c                    |   2 +-
 drivers/iommu/intel/iommu.c            |   7 -
 drivers/iommu/iommu-sysfs.c            |   8 -
 drivers/iommu/iommu.c                  | 411 +++++++++++++------------
 drivers/iommu/of_iommu.c               |   2 +-
 9 files changed, 212 insertions(+), 290 deletions(-)


base-commit: 172314c88ed17bd838404d837bfb256d9bfd4e3d
-- 
2.40.0

