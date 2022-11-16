Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9082362C6C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9XW3Fsxz3fBg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W5PwB5hM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::617; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W5PwB5hM;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Rr0kv1z3f3V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:45:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtHp3tgMOT4/c1S0eLSqYUYIPQahGzY/s8U0X1hlmpyCCRUGMGxB+Wi5y1+IjCQXk9QsyrPnjzmufE7D8dcTXqRGGOn1ZxXdIqVRb0sffdVtLnrzWQoi3IWLbOBHQ8eu1UbkgS4rawWKU6yvHN1mxPIAe6Cj9h1hu7nMEMQNzphGSPsDK+oGA1MYK1waWxG2im1Z6J2vr67bP4y5CwUK21E6GoxZK6ynVHNJThzRiZ0VHRiku+QaJa7mPtbRu4EL4FGR4TYCzZZCifaEAV/ZHd8d5wbBgLWfGA0rOCmXJbq+Ihm3OFIJ4TuQylcfQ3tsDJQM1LpNQK3vizhBx5SQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOtE/mVQ0pZBljpoch3I9MSZW8QsEtEm914yTD+qx28=;
 b=iM/1GuguXQvx6D+RYNmS4HeYhVikKe0cLEp5oDIJ81Wt5HmeJGx6NV+UwB7GzlkKH7FQRY4ZdVk+e+KNiYvO2Z5N5AKWi6Jg7MZ/97z6FCmgo+0r0C9SY5oa5KWDXfYBtMc9CpAl+Fn3P0VpMveDdlczzg5XIiAV9+/RmXzkhgo/lh2rHAFPmBRarWNcc19i/ibSUnZzxia5LpDXHWrDe5gvZJR9ivlhe8KTh3wazjLXBMAbEO+dE5MQH4fhHz5LOzoaWp2YdRkG5se27M0WMy9OO2CMPQCY5rwnFLw5dKEV5t77x/i44lMh7Id8XExr3tz1JdWZmVklayY43FLtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOtE/mVQ0pZBljpoch3I9MSZW8QsEtEm914yTD+qx28=;
 b=W5PwB5hM2Fu9Qv1b5D2GFxt4KWA0tfXI7f0nd7A6KWGtqqovZfMWq2stVgMljOND5Sb9x+2nIRLLwOVWrTr8ZsYZVIoFYY3AoVUYNG1dCSuOWtNu+JFFAQmTJKsRa9crguKeieGw2NJC10OfPgZZAEnKZb7D9CaL8c/UUVt4SNXx5d9FwONM1eiWQnpjQ/qSQQhWowYq3yjqhRrpMYdj1DnWxRWZSE4fJ+OrSnQTygCFPxe0NEvG15qz/bQr129sT9uG04BM6dPFzdduyubdKR+5q4snt0rExOxld2TAjy+AMgc0R/V8lvomPHKeAsk7nasntS4vSLHsjB2NAeq6Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 17:44:53 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:44:53 +0000
Date: Wed, 16 Nov 2022 13:44:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 08/39] genirq/msi: Provide msi_domain_ops::post_free()
Message-ID: <Y3Uhk4YZ9MN4x5Jx@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.063153448@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.063153448@linutronix.de>
X-ClientProxiedBy: YT1PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e61b754-a15a-4f81-8c8f-08dac7fa4468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UbcxTaXHBxaJ5Fzmf1Y/CRTtNN4OpxZCqAjoH3Fj0+uFOj3kpPxZLzvPQAJfdslJS+kBgPhpahWbdI3MhNYMSaOp2WVrujjWwFzY+JEAXJo/lBE2rxus0n7IdcVfdw9EkQDnvddIJP6a1PaS5PKKSbkKuBwzu5US7VOBhYPlNGZeMXqkJzQSpzNaW1vabCpzM/KXKdkhaGV6w73XPR9SrS/vWqTc0xICJyRU8fP2AC5Lm8lYVoxsPfiZ0qdwsPuaY/g5WkDx0EX5cYQ9sQxzu/1pzHzHqFx8B0x1nc5P2exOHKUGvjNhCS6TmiTelANgJNooB9knnrJA4sbHfHB6SVg/OixULwy0Y+Xgjn/JTdt5sKB6T35fZA6rdw2d3dvVpM0GPx/xK0eldoht2qlz8XYF4e62DNSOH2qQJFYxAO8tHmJF5xmPWiwPFgE34vUWuSK+tUi57XCmAyyqAHz5TZ9vaGbs5SBu6UBLL5rxEqCy1Pqc1xoGS52c0W2QqyQjUn1qpyzgiHBJ/vcE/WaYu5qYMAy8wR4ldZLxuXQzi5cSoBv7rl96VVdC/lhxe+0QIWBHi1U16FURb3oBRBNg+rjes3w0YqdPEzAZAtwmfvSJj9Ia6bzopRYfexbQBbzuAnlPcxo1HK8Y1+Gcq2NPkz1TH0edEy4P9Ehzr6t4x4nffA2gtZIN5DIDdKGbgOWxUN0F6LMZY6Av2V621Lkp1w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199015)(36756003)(38100700002)(86362001)(2616005)(186003)(6506007)(2906002)(6512007)(83380400001)(26005)(7416002)(478600001)(41300700001)(54906003)(6486002)(8936002)(4744005)(316002)(66556008)(5660300002)(66946007)(4326008)(6916009)(66476007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IXqcr1pjooDqwl4AQEmv0tWG3SUo+hP2McIxvikssaH4rLKZnB2e2oMQX14c?=
 =?us-ascii?Q?wbIoXsGBEeTzJdcThTFLuJk5JJ1keCqqawAQjsQSQPqopn8IAgIlBpNQzTf/?=
 =?us-ascii?Q?tNzZVu2bL4E2Xi+bUl3JetfevWk2tLNKOudPSOJjRFcC3Y7EzL2n2U8KZC9d?=
 =?us-ascii?Q?dBPsibpVELdOLWkXe7A7R9s6+cUYeNI31/MEdTr8Bl1R8MkNFfJiQ7cvoU+P?=
 =?us-ascii?Q?51CG6gfSJTOww558P7mjOjpnIp7Va1Ty8AxCnTRrS2TiS3xZviOQuLN5hjYz?=
 =?us-ascii?Q?+nozzltKN8Fdc/0Q0NZZyAaFRNhwnN95qa4w2LASpYC3NlCYPyjVhrLOD/GX?=
 =?us-ascii?Q?jcs3JEzqjK7JfnEXXX0igUYccR9w2IYLIW8ECvSpxkiPcNw9uUN8RFllViJj?=
 =?us-ascii?Q?X1uIM92v2BYGeHWRrrf0mVLgxxwBY8ugYlU8lNM86VDP4lLEc++yKcrnhjmG?=
 =?us-ascii?Q?vkTu9Jrw1WL/E+O9Kq0JFf987UkQg24TKAz+UlU0R9fTnzZl3fCMnWD1sBAh?=
 =?us-ascii?Q?A41/pLgVt8JwNLkMoZVPlmspTj+Q+Jc6V9Op78bjXJ3QLbpBw2/KSbuh+pzy?=
 =?us-ascii?Q?10p2QC0T5anu2et8gSYSHBNQJnBd5IJN/mFWGntyHFVwgWpHccvlBOcIPJj3?=
 =?us-ascii?Q?/zTYtKBXD2eTnyjQqgxrQfNKAD+HFe1P6cx4pJ0RF3Ahc8tvF/3bkx8/782Q?=
 =?us-ascii?Q?VC3v5N5f/TKI9q61AOthdbIk3sTfTZIlMDbwwVtzVnNoZeTQE81LGRwajqpe?=
 =?us-ascii?Q?ludk9RrRYbshoTEwwo2zGKj4g+qjSIBPvohOC1AwsWwrcLbFfCvgeoTCipN7?=
 =?us-ascii?Q?qABUlkA6mLbVdUy9ZFyf9AFSZfXDI2UiWDuYkQxMW0Ki2PqZZNNfvPUBhkmz?=
 =?us-ascii?Q?Tdg2o3689hPINY2w5AqZKHq560GtlJQpHCFCPADv4j1IfZWBXIvRoGpLEGNW?=
 =?us-ascii?Q?xhkG5PDhPs4beVX5CH1uX63l15OrjNhZr/y9E0U8n07SFlUzQ3O7XlESXfOe?=
 =?us-ascii?Q?4P5LaxlfNJKSDn04gAKQ5/iJOAWBbGyibK6BfK+0MJn9Pw4alpQf2HwvDH+9?=
 =?us-ascii?Q?v0TGl8+ODg8KxsPYHvEHiuGJJbjUZIUZthID9dbeIMs8qGXzAWyyUcGUL66Y?=
 =?us-ascii?Q?RudwDPE8nsdCkyJOUv23AnOYWjt4NQRmj8jjQoiwD8tX7PlHR9uJ87rOXxcw?=
 =?us-ascii?Q?AiseZTX/WGb7WDHpYQ/vPw8o97qxXpDlj487Swz8VARpjFjo9t/BKnII+jYB?=
 =?us-ascii?Q?+HVtWjZ/8TcoGRPGVnf76wivNPwxDRHtQDjw8/9UVornc9jn2qC+8OJe6ZQC?=
 =?us-ascii?Q?6khhpbC7X6xtxBWvQisGNKi2czRI5zp18OeBd2aqFDZ50tMAdHzEu94FyN2Y?=
 =?us-ascii?Q?VvTPvmAFX6mGaxygB6p1w/vOz7pTMFfkG5pdq6y8oVHvIq0aL2/7UUSs9Ol8?=
 =?us-ascii?Q?yqiYMpfHy1tI1tQonZxdFbS3G/cPkSb3PipTSoZbHtJ/Jxr6Cw7vtKHhfS4g?=
 =?us-ascii?Q?M6wIjgHkSfRIoJz8QcC1+0cy25zQq0NWxrW/INBjQa7RKOnTwGy+29nMb/mM?=
 =?us-ascii?Q?Z4KA0LJZy645rVxfFbersOSNm2QZHRVcjkhGCyHQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e61b754-a15a-4f81-8c8f-08dac7fa4468
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:44:53.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72tg/xoJvo16ebe4ZNy0PEO7nWUjxKbnvGCDtTHXwjG74PmZI2Y4MmV+uGW4LC29
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
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

On Fri, Nov 11, 2022 at 02:54:27PM +0100, Thomas Gleixner wrote:
> To prepare for removing the exposure of __msi_domain_free_irqs() provide a
> post_free() callback in the MSI domain ops which can be used to solve
> the problem of the only user of __msi_domain_free_irqs() in arch/powerpc.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/msi.h |    4 ++++
>  kernel/irq/msi.c    |    2 ++
>  2 files changed, 6 insertions(+)

Make sense, but I do wonder why PPC needs this ordering..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
