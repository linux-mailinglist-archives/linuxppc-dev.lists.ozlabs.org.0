Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DE62C6D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9Zk015mz3fFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:51:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OqIZ5WG0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::607; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OqIZ5WG0;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Tf0w4nz3f5Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:46:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiAEEueSq02CFQMJ116z/BbUS3Lv3Ai6OxuVO69upmMiaDM9z94rBc/+nnMDNywOMzQODq1v5zRelh8iz6Qla6ye7T+RpX7pjRll2rLhQnpL4hcHBN3l4P2Oju9TzwEbtNtamhfRO99U/lMujwSGGWm956y0xbbVBCbYgK3PKkmMn3nmLNi6kHHJep0VKLKkI+QRxpOJ7nzOTLNvvY8qE3BsFlcytZIpeL3kfFMiCN7Qu2uRVHvTOFXs4HZraLSk0yDOB2bRGb+/mvz9rVrbpzw/BiHpJDJSvoCQLp2I6AB3i4yFCghA02k46qh7cHT92Jzah+IByi6iJyvLGF0mFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLnpJegnK2QEAKzEUe7VHRZl3PMpiaySEiXcAhARPLo=;
 b=PqqJ0kdcj0VXV2eK+QYTsHLBW6FXDEM7kr4BCRJX7JYMxB4teVpk4GaMSx5ezmyxnr1YXWOQFJRZ/gmoP6RVDbh3gHVBwBGjMIOpLvwUtJJgpZLgsHZFnaWFiA7lLXtCFY09QNjXLoZUjFe87+rDX4EIXvOD6adB6Fp8Zdco1WDVPdg5rt+7m1fXb4xb0Y2CfDLBMu6B8PVm6N2tgP1Jd3bBvueznuTjp8ctFJTA2dt/Y7RWZ9i5V06hTtyFL1NJSV/TcBL6k3lyHB1gKnQLBSA/PgBvgoI/Ox3fYHu/H7N6hVqIvOK7Wml4f0JaHeOuAtMqEorucp1mMfKMV+aMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLnpJegnK2QEAKzEUe7VHRZl3PMpiaySEiXcAhARPLo=;
 b=OqIZ5WG0ee8P3AgG6ykEbLfs/hN6e48Mo8dxmLzpfqWKUhz1tbCIgkkX9rEk8DJNDBTUXCB/CgGOn55hr1FalKCgOOgvry1WkJua3dt7hKQpHc3AmcWirfib2ZoMWx2hby703y/yrMxxukr4uSMJie/Wjb4chYeOPINHEsNCWfIwUqfuflQVp1C8Iisbqj6QIxmxl7zt2ApxxeJ8uiAIY2XZDYiWO2zbBjmQbM0aVXq30pqvCBUKh6nt17gv1v7MvuEsQ50/z5iPgekwnE1GxjOQh38QTXc8T88xA6okDA1elNYZYIWRCw8ImdJwxHLZ8tvBPbMS4Lwhr8/KawRV7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 17:46:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:46:25 +0000
Date: Wed, 16 Nov 2022 13:46:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 10/39] genirq/msi: Make __msi_domain_free_irqs() static
Message-ID: <Y3Uh78oeQr2ZxQcK@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.179595843@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.179595843@linutronix.de>
X-ClientProxiedBy: YT4P288CA0092.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: f6060f41-62e4-4f6b-3f53-08dac7fa7b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7BnbwLpszzUG4sWDuLYvNEjps9Je4wtbKqrmWtoMcDz9oB2Ik0WhsT/l5ZmMVN8bcL5cfuEyDRrlMRUj8o+1+SLV5Ba7pYnOCOa/9yyqih3fFPuwS+MoW3XYT/T6wuIHyKBHyQ4njA4Hq50GpDzsTYdG3raz8zoYXQe7PPQhleIKfesOnPuvRHLoP5bkQYd8uqPRkjY0zv77k7518B+0gy01u4HLvM0D/DBR8pfB088mUW0rTga+Pa+QXxxOnmoZmI17CvF2LMbZSfLqXYxnAHBBKTgDnpAvicDEnZ1W46zehPmZS3AdhYr8BN+wRTilV3628lCbMO5Z4JwnasdwnwwX5n1xkZLBJnGJMwTtX6B8ulEIL1wg5F1UqRYaLfhiSuVZs1lnHa+xZW9JLv9t/0vOKutD6whYA9Tjv/djX245nxbNFnYwD/RJoT2cSu9lDJDdgcFtUFW8Rc031t3sljQRrf44QM3T+NKZSllypYvVPE5LfmLdFLl4NhOLHYvnOoBiwz6SzyCMQ4D2HNL1jtFOCVSaxMtX2vaERWJu9Gp7vnGxsoxeNNeTUSTA2kp7zfy6r6dzXwugdRU/xt4Mi3kLLGbGPmxcVk8QPAbXidssqTTyXvcdqADroiV95nr/JcTxTskkjSKHbqLHnHOxO7esZePObqlo99hfYwiHVEcupV8Lb1+wBn8vqIyW4HG0OOEqsbsiyVQUdCwa8F5mSQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(83380400001)(66556008)(2616005)(186003)(38100700002)(4744005)(2906002)(7416002)(8936002)(5660300002)(66476007)(6486002)(6916009)(8676002)(66946007)(26005)(6506007)(6512007)(4326008)(41300700001)(54906003)(478600001)(316002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vZ/qOR+74S63IQJYzpXjDiNEWuJ3onn7Nh4Yh9VRmdB1an2W3jGfKPJLKdKa?=
 =?us-ascii?Q?4aa8bhWQiXjRkn8vBJHel3vZzEjCXw/EJFYIroi9J0Tf6cQ9FCcph0LLYaNe?=
 =?us-ascii?Q?jrIEvfQTJc+cZdDNst7K+NKfSJ1iKsN1iqPHz42usnqi3AoD1Ua6nngSD3Fb?=
 =?us-ascii?Q?2cL6iPVEGCqC+GnvRytDHRjDJcE/WJpxj+O1u6TXtYnxTMC6KcZFKijiPCJb?=
 =?us-ascii?Q?KzIo+byLqMDKRGpjtaj79SuVTL5AuTj4/i3OytMHamit20LXoOXnTwaVOT//?=
 =?us-ascii?Q?A14zAPT/+CGw0iBWAf4Kf86pELE8o22fBqGyKihqOhGskX1zl9cH8QJblO15?=
 =?us-ascii?Q?/6jmO1K7vPKkRHbf5hqCTdrqNjj9X/Bx8lCUirGG6nJO5Z/FKlDuAwM1TOUz?=
 =?us-ascii?Q?0DKJAuHUYf0yKsHnPz05o6XiCsdMOFXTIJ16GtMdEx/YiwtkQeEMyaDQ5hjk?=
 =?us-ascii?Q?O+fkL44eS7a7iCrCcaDf5myVwgxhMNki5vTYeqFrqp/7NTeNsYcPWNv1cQvj?=
 =?us-ascii?Q?amZDQB8/rN+MbCupT55gsPBAgcLuaj6VBhKtaq/DioQDrI3gNSCmmjGKVC8r?=
 =?us-ascii?Q?E6oY15MQq+DSqfjUl3Qqmn5K8D4KOvzIEG+F3rzhWQsMPd4shV0LCTOjPugM?=
 =?us-ascii?Q?wYXJYSLse0bQlzwFLKZZjHfauhqeov42uk5NC5Gx4ncfNIr+rjy6e+/spoSF?=
 =?us-ascii?Q?wSL0CnVPg5tFDNqayA1ycAQveXOJM01YQffqeBs9PGV1j0jaFPCTEDWy2kr5?=
 =?us-ascii?Q?HIkN3XKMZd7n5JxtO1lSK/N0tVrIIJQS0Ew33lWoYFod1hRqqDxmjqlIXNOs?=
 =?us-ascii?Q?O+dZKG1Z/nzWaXR6TNs9iczXb6R4lS7wYg1CJBSg9Lgzir/B6ebZdshadUc0?=
 =?us-ascii?Q?5gzOAb2GFPSDcoRyhtJ+JtTN7CS/2sXl4NCZJx/pq4Ipis67gqLpzTSXmYIh?=
 =?us-ascii?Q?IgF1ZFLFKeod3COofY+Yl5/hEKFoKi5XdTTCqlxdkSIgAuilLU/2bXJeSvT9?=
 =?us-ascii?Q?K/jI2XweeHNYPxE1L386yx4P5a7qhXqDFqEqzHkgi71tT6qKmKc5eBan4NLN?=
 =?us-ascii?Q?Svz44mkTFc296xrKv17FBXpgo9e1MXm0I5JmheE37Isy43e1nVKOY10NIIuH?=
 =?us-ascii?Q?mosZ/HQXJ7ZlSL5Me5ijDFnD9r62l+kb88VH8Mvr4+e+BOTgYRXyJCR9zRP2?=
 =?us-ascii?Q?kAGLN/XK8+7ef4Auq82Jjz0WWKBygIpFcnOS29ZSKuasFfJYND5QndlIiumT?=
 =?us-ascii?Q?xhe8tSwWuKpF/s0WL1Gc7rm4nG2wYUz/YVpApIRzLwMJiLAfW8HCcZTTfBU1?=
 =?us-ascii?Q?kDzJaubXK/x1kuX5ee2IVZW//B0EAdM9KoYqs7KX97xAV7xXbXFEs1yNsrH9?=
 =?us-ascii?Q?6Wy4HC0Z/+UU6pIFrB3UFij+/jAaj4fRAmZ9cJi/iCf16oSfCYqE2R7owdig?=
 =?us-ascii?Q?BicsEpSyZk40L9VyHbQiQP1+64OeiF62MwepNUIGRYVNmgDR6DMhPJxfCK56?=
 =?us-ascii?Q?Mb2sayZ0Oh+8ys806F4ZOYsKq7Z3jr7JWYa5HZPNoG4HAQlYe4vTgdehmtwr?=
 =?us-ascii?Q?jccDNukKOp+ZJPrxZOpmmC6Vps62pAF1Hxl+vSqJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6060f41-62e4-4f6b-3f53-08dac7fa7b3d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:46:25.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGRGlWb9A7nyu4tU/j4P6ybmnrtbbIHA6QoQA90BkQxXiv7Q7L7BUfwq0qTTlDx+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:30PM +0100, Thomas Gleixner wrote:
> Now that the last user is gone, confine it to the core code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/msi.h |    4 ----
>  kernel/irq/msi.c    |    3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
