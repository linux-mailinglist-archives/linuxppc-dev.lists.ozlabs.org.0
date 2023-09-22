Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7957AB6DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:09:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PcxJsW/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsdz153Dsz3ckR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:09:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PcxJsW/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61b; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy54ZFtz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jy516PQEpmDCwtxd0rihMYIgGYgClLUmbyDNH3VB+TcjypDOKxRiI+bpMs6e/zXAvKxE7jcXeJ3nnw8rWSzqSpLZNUl7derhVMZmQ6emrHoKN4mPy3E2AGNTHkcR+U+W6uA5nItuGC7mZxdyUeTybFqkMoi5CJX/Oapieve3Y6sLWrwUQ8UI54345wvtSVRgvPqjp33isQISp25Qz/VMbLcIsoYXr/WhLK1nCbP6WM1TpP8ozIA4DquVa7haGYIlWzXpIedR0PVAxHZ9vPwpN2JF3w9jiSojPmLPWfkLZwF8pLpWzHN7Gmt8MZHCp+tI4CCC7BJiQpx1v2JRmeuR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCegSzVYXOvxHKPCB6hdzD9DQrV2f6EahQmZY/5ccxs=;
 b=hJx+ouo+Xmx6V31F/SEhOfFZhrxDRyVhlbMaOpumCYGzai1CZyX39NVzIOvkTTtJhsuOToCUt5yQ8H1VJaeXb+receMeBb4hikGB9DXO6fK+0l5aLWKhtuyIYtMXkaDohgosCpWYMMr0XJO4NfgHP9OAKC4qeRPQoUhhhK4SlXHdYT5hLudNakRVC1NyjaQow2BvRbNvqZaNzQgRLP2/wyobULH5a2igsh7lbdAii+63P4P+i2CDtTlJ41+9rS8xqGrijqvJBq8yKeAJjudBCPHR5h+pwcbwx8Go0IgBxu1OtS+UfQhDNaHV46tPNANai2INk09xluwVFsW/qkTJIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCegSzVYXOvxHKPCB6hdzD9DQrV2f6EahQmZY/5ccxs=;
 b=PcxJsW/CvIwE3uzzgV3n1PEwUVRnLM/U8xPJIlGRWId4N5qabU4xfrRh1BFF+RvVjCgav8oZmc+wENkyfppxzsdb67pr4baY/dG6ySXh4WQBWjy/1AHnvvt9QFfgIbfyEWoB+GVnuGl4brzDkkgzV5vpQS5OLxS+geWz8kHNfWU3RM72WQ5KHV+qn/mu8MvmxT+9UPWWfTql0nAjxPRW2FlibqpF0wLaOXYLz541BA1pgGQS06umMrsr0JD1rhZY7hWhi3QI1e1nZ2bX8GQdI4cpv/q0LLXJXvrMvYh7aAgYzLQI9MVJGQkNBDqMSTIlrkd3UkFxzE6oYrYWeVjMgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:01 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/8] iommu: Convert dart & iommufd to the new domain_alloc_paging()
Date: Fri, 22 Sep 2023 14:07:51 -0300
Message-ID: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0327.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f658ab8-9b96-44f4-f877-08dbbb8e7a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kZMcI+ZgG1tQUTzRO0xICUU60nFpGxH5YzXtM4HC74+UrCexRx5bqj9DZR76L9V3pf4PEhZCX5X13OvVDA/E7DsrR6bcyCkn/UvlA1xP0Kr0qTicBb5vkTEwusCySjaEFkSoUM4g/Oyh8+tygYS+aB7rzAH73Iw/P0tpq8LRnvCztpuQA8B6TJSf443krC6Lhtb4PjjSsLQpgJFJZisQG57LRlGdbb1pGntRMpBscavhyY3mYXrOTB0m3WhQ4iRIZgwk8Mu2JOuaIl+A0hzLWG5J/DhYmtRLOe56DbTH2tL8tevZ8T12Mx+1CvqjhSbOdC1XfSD8a+OWTW4Oa6LUeIrtshuru2W2Vw1/CMmkCZnbEoIAAMN3VxGC7qigBV0fFeqoOPhtC4Yv08h3MZH5wdj/xEHoT8CXNXm9yH6wZ0PhtxaFZWoSNGAz0QOr/Ds8eWHAP7VtPDmUGYRoZTZHF5V1kAHiI2bLSZhPuSIVqQKCoGPq9L0jKgCRiSG/i6eEh/ifvG+BdBiVWamAOntsEsMlgqLh/qS3324g1ejDDKOVICM+PhxH0rVuGNvaGPyh8cJntKLEbahjJfqOB5bUq9sr+It8sSVcmUE/zKcMO9wuJFUjv37CfpgBP1RKUQwj
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kydm7pRd4ElUGcqwzas/k/+TQ2eVXlC1p5I8DK9Wa7LXjr45ZpcMcYEl4plN?=
 =?us-ascii?Q?bez+uTW/B4R95M+MU6n+UD9UNAYee9lmXE70Xr+I2H7vcqFQq/OzGaScyjKU?=
 =?us-ascii?Q?jydppsJfEq7vFBWQ9H21U87aM2sN4lZaDoSkldRUTFMWfd6JuQQ1/nQRsrA3?=
 =?us-ascii?Q?Rnc4R7dIvc/RLiRIOOE90L5y+F6qmWIBzIFRN0KdtZk2v16E5cMoSkEbLr41?=
 =?us-ascii?Q?r6bTPPZBMr9mqyoTRnO5qw0PwGP1NpGGxlRiM0lEyJIqm+RK2FZ52okbNyOE?=
 =?us-ascii?Q?rfv1h8dqyGsPln0Qt+S9E2oAucgZuRkVFkSK5Nx9sgtTMFo6Q9LudOKhMFfV?=
 =?us-ascii?Q?CzIgF32L32liutxcH9bDrdjiBa/FUqbthex7yFmfsbSocJczSDeHOyADFdi3?=
 =?us-ascii?Q?AKYLbSeyhl9800YZkhqMEbi6gIJmeFmlEn0kYVLnrQfn/ZMPSRrfQyM1BZQ9?=
 =?us-ascii?Q?9Bez7dLyVoxXMytvDsc7A9ub+xaJ3PbWVgBsmKZU9CPEf6yi6EjSFMvDYW9Y?=
 =?us-ascii?Q?D9rJJ2I7A/mWQPEL59rk0FlacjqBvCsFDe+wZvVVNOnlvdEsG9/i+3I50D68?=
 =?us-ascii?Q?RHEodtTsmLOodqcaLSttQBwWecqHr2wwlEUzKHTWHLIoQU7nPHcwav+RcUX/?=
 =?us-ascii?Q?5pQijHK6Sobr13JyvOIZd3Y/oEAlRzLpIXruke7O6g7c6Z5yHrQKhU/AWEIE?=
 =?us-ascii?Q?NRhhcPp/oTpgBhewIsDvFzbSfV4/uyAdbVuw6IwOi7r2FJIOwnYPRJl6blyC?=
 =?us-ascii?Q?624Kz+f1DAdIRd1bw87fU3LS+VMGT2G85ilIOnl1x9CUUWVDfkzqEI7bvucZ?=
 =?us-ascii?Q?Xrk0zucYEQ5rog7g7SYyH5AsbsQBNFlN1b8Iz2kaml0VZ/EXjnQAj2xIyBPD?=
 =?us-ascii?Q?nZy9LK40fyK1O7GDqKQ73YdJfa5k/kv3bJ5n4BmsPf1Bo353e9f8uaLk3Ey1?=
 =?us-ascii?Q?uqg4ksj59YEIaGr9OZs5+dpSpQtFy8SRGruR/rnjZAzrEmCApEIwodQPiP9P?=
 =?us-ascii?Q?rGAf6pR72CqXDlCb2CZBbYcPf9KKVkRSDXj2HKZhv/ztIep4aX3d16j9ZuoP?=
 =?us-ascii?Q?aMmc4Quova9ZF+BJHwC3phgRj8yFZmBcb6Sk6TswBDDOpNwkkGT7pKDhYQu7?=
 =?us-ascii?Q?3xI8YQHyV60m82o6X9aCOlbMYSzS0u8nZKZDFGys9d24YQJy2l0a8YlSowRF?=
 =?us-ascii?Q?tWKDbYWfZ/UWwcgbxo+izfde7uj7o9D2MfmG9kcoZ70Y1JAPXokZoi2T/qmh?=
 =?us-ascii?Q?ShlPVkv+Fk4+inMSaRs8WO2LtrTZeO4sUAg9PB/jcPt6WCOlsVITLZUn7GGS?=
 =?us-ascii?Q?TQ8lkwLi5egTMadO2v+Zhoq54VRT0c7dqQZsjQBQLHhRFKc1Ggu32gsocxh2?=
 =?us-ascii?Q?8Ql3ZaT59wKLz52TweCCMsfK6Q/Q3PT9DgOzAh030I3ZSPp1dOtaDCl2otEl?=
 =?us-ascii?Q?2UUVKGpwDPDdnwGueCu3LGjuwnCjbPAZkvsG58fwm3kuauAFgj1JhvzYdJWR?=
 =?us-ascii?Q?aqkso5YfuPOgW/3LdW+qmg7FLJQq7qLxLlqWcZHDPLp4rKWBy6Y2fxvMYECs?=
 =?us-ascii?Q?hdGITXtRnxGudHxGVxk4z/WQhMgjNzTkg40UMWiI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f658ab8-9b96-44f4-f877-08dbbb8e7a1e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4WVpLDNEG8y3zAi4GsPHDHSQKQc+HbZmDUg0puJWYjVcNIUdsatt8Uf/96CtPdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Continue converting drivers to the new interface. Introduce
ops->blocked_domain to hold the global static BLOCKED domain and convert
all drivers supporting BLOCKED to use it.

This makes it trivial for dart and iommufd to convert over to
domain_alloc_paging().

There are six drivers remaining:

drivers/iommu/amd/iommu.c:      .domain_alloc = amd_iommu_domain_alloc,
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:    .domain_alloc           = arm_smmu_domain_alloc,
drivers/iommu/arm/arm-smmu/arm-smmu.c:  .domain_alloc           = arm_smmu_domain_alloc,
drivers/iommu/fsl_pamu_domain.c:        .domain_alloc   = fsl_pamu_domain_alloc,
drivers/iommu/intel/iommu.c:    .domain_alloc           = intel_iommu_domain_alloc,
drivers/iommu/virtio-iommu.c:   .domain_alloc           = viommu_domain_alloc,

The follows the "Make default_domain's mandatory" series

Jason Gunthorpe (8):
  iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
  iommu/vt-d: Update the definition of the blocking domain
  iommu/vt-d: Use ops->blocked_domain
  iommufd: Convert to alloc_domain_paging()
  iommu/dart: Use static global identity domains
  iommu/dart: Move the blocked domain support to a global static
  iommu/dart: Convert to domain_alloc_paging()
  iommu/dart: Call apple_dart_finalize_domain() as part of
    alloc_paging()

 arch/powerpc/kernel/iommu.c      |   9 +--
 drivers/iommu/apple-dart.c       | 124 ++++++++++++++++++++-----------
 drivers/iommu/intel/iommu.c      |   7 +-
 drivers/iommu/iommu.c            |   2 +
 drivers/iommu/iommufd/selftest.c |  11 +--
 include/linux/iommu.h            |   3 +
 6 files changed, 91 insertions(+), 65 deletions(-)


base-commit: 494e0fef6db2e604bca0fc552d92b760b6e25d10
-- 
2.42.0

