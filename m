Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553465AA43D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 02:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJdrW1Gn6z2yxw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fgX7wgjQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.100.167.235; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fgX7wgjQ;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2235.outbound.protection.outlook.com [52.100.167.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJdqk0p2Hz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 10:21:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EryOFHRg8izYxZKZbh8am91qygf1HIJIl7iYQyhZuj+qWRe+8vLisRZI8f6kq6FsnNwHoJWFhnJN56N3cpSD3CIBvUogs/yF1OevxYYXWrKdhapZRpwBHodj1+A+b5yTggtwWgqRFJQsBkRpH2MZ8EI2SX8xC3uruopaYZJy7ufcStq5++WoPFxp1w7aRu+uoiwYSqd9NSl7DYPd68D2xW257uOjyHyrEHZoXwis2hy4FzP/qOvbkbM9/5qXg75cCj6LtAJC6uDSTJ0VepBV7yB/f3tdOGmdEFoS59ovUtGpzikk6A4K5IRtEfGnUxVoKXu01+IfIUIIGpYjxHZLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTBx+NF94JJLzDq+C3F1If75PMM2BD5lKR5PYmTQsAE=;
 b=DcoD3N3o7GfAOga4IO88McrL8FCLLkx0w7Ry1PntxTmX/MPmFKVuPKTjKgE97pbzm2/SXnHMYjXAeJv8Zl2lgC7hRfFHbcGVEKRXVIIbmM8uRgJghmjo+9XESxy2OnZKvb9M0sU9jciKgEJZwI3/u+VjZYOEJU0I7yV6GKGGFCRRtWprsWYARTCGNsPWcQXJGOHujxduFm407NUIbj7vbhzuA/chPqcRkBt+7WWpXc3eZ8AERo1Iy8OCh34Divl0PR5llmVNvOlBaTDd/6cQDZG0z3DE6oqI0dV4Pve+/CWYetqgS+csKAftuamrcosJwHLOBPqyvz5ihmDLNBHYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTBx+NF94JJLzDq+C3F1If75PMM2BD5lKR5PYmTQsAE=;
 b=fgX7wgjQBVM/WRyJYr/y7+zsKIMLpga/jYOeotwWmqQa4ygRpe5zCrRnaPLvHjx5mSTqGvNyv8HB3jWS2Jfsv2MQr9mYMjxD/hYFfxXJ4DHYLPWTBtuP9L7l7KygeCtQcJ/4rVZSgKDVDUols6584QSBDCLXfuKBc1S4Kgn4Jg6k0bj2ZcnZg9vrGgQbNmcx9SsRKUR+RRdYSpqVMwSdbk7lC4kWNSDuN17vVHUbSw5kzvLUEhJj5+KHQHvEe3pN+6aHi85IU/c+VjPy16mVGTimCvDjRTYbnTF6lAEiP54DisuiZmmhWYDAWccoyjZiQKDqCzlOhz8W+p3bnU5N2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 00:20:43 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 00:20:43 +0000
Date: Thu, 1 Sep 2022 21:20:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <YxFMWs3c+m/rubVk@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714081822.3717693-1-aik@ozlabs.ru>
X-ClientProxiedBy: MN2PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:208:d4::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27cff96-844d-4279-ec62-08da8c78f918
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6098:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?wfXWujKmzAtTLL9+ubXZOZ3EFD1K3AlWM6LEG3yDWPIVdvE87Jv5vtKD8Zi3?=
 =?us-ascii?Q?k54HBpSduiH2h9OpCiydjwnSMHdA4IegGfuUKwXfDlEZJ/JcRcaDjUVgV9Hf?=
 =?us-ascii?Q?l8y0nNj0sTkJpB8sxYRvfSX4p/xs+Xcjs5CAe8sXQkdHbA1ebP1QSYXYLKsp?=
 =?us-ascii?Q?WzY9fbKNMqYFHouq33x5/y6qTLAJXjpVqYG0u79A39zZYJhqno3F6LzYuQSD?=
 =?us-ascii?Q?BrcuvjoxC5J3YbIflvOxNpPcC8XOQiB/w/U3GgxFC+a0rFx3T4l5OCRgiht6?=
 =?us-ascii?Q?i2tVViPL4HCgbd1sMX1lWseEoq439zDCfNb4GG0cx0XznWDUYqZALwY5Rwx4?=
 =?us-ascii?Q?o3PPJ2OXwX6fYBlZB9O531DKolUb+BWk4K49gDkxaeuhwBUUaRuOwydr6lLO?=
 =?us-ascii?Q?3qaQr6xkPS+9tW0lEFQwL5LeH2UZzFin7a4WQCO4sJzLHosPcC6Uh/KlihoU?=
 =?us-ascii?Q?1zWXsiFsplYMT73eRpum9y7KJqSkeGY7Ct3N8QGHmyWzjN7bPMv+AzODNbsN?=
 =?us-ascii?Q?GAaykx8vgrfbuNiqakesfGq9tY9ek1aQw1IXUopRnj3qtQ74OG2qalUQ9Ct3?=
 =?us-ascii?Q?hKvweQvzZyZuI94K7vw181do7030reQrMzVY5ZzdJ3RddhXNfo7j+2o8ox1w?=
 =?us-ascii?Q?Dwl8/E27NSV/qzpDnp+jRwP6oCqtm9QjlAxRjr59C59mKwd6dpRFS75v2h+6?=
 =?us-ascii?Q?HhfhRp8qB1CilUe2qZJnz23ksvOi3XYs9vIoWVXPrQWNDP1VdxSQ3qwI72NH?=
 =?us-ascii?Q?BAxKT3rZlomJ7DSFvM/iIBbMXnS/LqWcHpQ15XzSXnj+pWfCvAnWGvC5HV7u?=
 =?us-ascii?Q?4+MYaWvwkmJq3VO2VZ/V5CgC/wXshqQK4XlR0lAZuUktDJhUoPYATdRtPMUL?=
 =?us-ascii?Q?+m9nJbfRYrF9IBd0m61YDnqJDmsSzJOXoKqrjYfqmV/8hNwyA8L9fGuNPs7E?=
 =?us-ascii?Q?a6yAbmqkFCO2b6bVi/z06OwY2cgvcfQxWxvxaLFoiyNN3QzvpIOYzXP0l+cq?=
 =?us-ascii?Q?Kjdyku7g3lpRfN+MfBApXx8iTAVdLH7chpHFu596D2GTIJjEp3Srkxgvf9OD?=
 =?us-ascii?Q?vXHu6zrIZ99CR5YfaDtm80X6xB55l2xfGZkZoOPie6GnIfX7r//+VkZlNsMk?=
 =?us-ascii?Q?JQltFZCIEG+ScVQukd60Brd0gMFrVpAO5PuIJANTfFVR6p9zuat18aZYwtG8?=
 =?us-ascii?Q?aqISEQ7pOPLYt36HKMXllucalWvTV78uC5SwAdbx0rWMGuyMc6/kDykjWm0Z?=
 =?us-ascii?Q?fstBx6ZxaLBzLbPo3FrN1A/ExvYGDvxZx2aVB20pQ5wQjjL4gPc8YaMqCpu3?=
 =?us-ascii?Q?IGeNImLRPlodFHqwrywi88PN/+KM0Y/lwte6wnUeTjFLpSHhDHcDWvIHyi73?=
 =?us-ascii?Q?lPoAKjImEUJiLee5AcS1rT94HDCS7njuItZH7+XERJI7HnRtPQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230016)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6512007)(26005)(186003)(2616005)(36756003)(5660300002)(7416002)(8936002)(4744005)(86362001)(966005)(6486002)(478600001)(6506007)(41300700001)(83380400001)(316002)(66556008)(66476007)(66946007)(54906003)(2906002)(6916009)(38100700002)(4326008)(8676002);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6ABQywIjr3shMUgB+Rnge2EjMqc8BB2bkBRWzBmwd6h5KrE99Cx4zY3n1RrW?=
 =?us-ascii?Q?FPjF2Su8h7nOpBxRGPKVsH51N/OS7Wb7i9vH82sy/IDjGlygreq3vIgb9USS?=
 =?us-ascii?Q?AISjo5lP40pc4qWTmMebLl1fcAkIG2J8Mw6HDNPld1GPmuaTX9obgdCbxXoy?=
 =?us-ascii?Q?VtrlbwRA6h9iW47pKp10IynoRhcXsfCq5Pxw/RCGlqzsw/oNr2Kz7/BxqRYS?=
 =?us-ascii?Q?TwNtune8qNbuo+1a79Die4rRO8JhZTC06LBNJ7zAMIE2x9n5at8Rs0zKoeRK?=
 =?us-ascii?Q?ICp0u/VW5y9h3NqStn169i0KLZ+ooox3cMp8fu1Dd8RKgpFqV7qnPt3K4IeC?=
 =?us-ascii?Q?kAIs1yH0EyW1qxb4j8My5w/sCg/mCb4Uq0yR0aj1Vv1thkteRVW10gaWraHd?=
 =?us-ascii?Q?VCWuGkjmo/cf+dNEZY5AorXIrP3ZPfS0kvru2lFRQ64TPGSoGZKj3VpOXr33?=
 =?us-ascii?Q?SPrDBGC5PF9HvlDHW+qsJwVLr7L56bZseCRFPZtI4C4gMcw/nTILTwGI0zGu?=
 =?us-ascii?Q?SK4hhhtdh95nEfdzjyrfJSfK6pgwnBDum9h0WP28P/KOVklqb9OAO3+1Ow4f?=
 =?us-ascii?Q?Lz/kuEDnmwRlJQgTvY3ERkIafFsZXE0t4tkes7AQm2Ql5q5C9tBZik4fqNbl?=
 =?us-ascii?Q?DiEbH8jFufMwsLa4CICPTMlvVajXE2e/lRWAL87ViTKk+VaVU++xQ/XG2pqf?=
 =?us-ascii?Q?v7RTjHMwqV/oux16wptNHNHsV/TDrEwZQJdBabG2xDwllF39Z1kwlYMbpvaw?=
 =?us-ascii?Q?Rh7V0VbU7i0YMaAsnc2oK7dAn1vBCxiZIO/AJSW3CuvVSYe8/JjxvJfLDVfP?=
 =?us-ascii?Q?Ft4OChv+KDhJClHFWU8ZBXtSMf5M9NmvQ7c4b58UOUw2PQJpGW+ETvOEY2VO?=
 =?us-ascii?Q?qOtHjLcIwR/u4r3AvvHIXRGIWz3oODwWVKYFMalSeTk6Cd7j38BCGDcuYpYD?=
 =?us-ascii?Q?ABDVpfSpcqYZNMfxfZr5BBB6mkjbj9G2XWUGhU3suWS4EBDtY+W6tix8GP+/?=
 =?us-ascii?Q?FMRBWnioVovAP2o7LMnvQdCjffkguKNhzDl90uUPEQp3k4o57STneWVxnB1E?=
 =?us-ascii?Q?Z+2EeWcVd2p/w5bQyukumN7wtQvL9u5+ThOmrrMWNYE/cpf89u1RXLN3yX0A?=
 =?us-ascii?Q?XkG35MXsMGRhblh8ReRk+cFWtcLSxAiox6rbKUEIF8ZgzWb1k7TBseavyCKb?=
 =?us-ascii?Q?ntzDVy2hJOdpvpTkx9gygP9iK+RTgz/TNY27pVuOCVAcmC9oBFN9tLEjICMr?=
 =?us-ascii?Q?Z8SfTTLbyB1nLh8VCEiTQz4yeFNa//nkAyMj2jwcXUs2XJMc4Jr1y9kqEtD8?=
 =?us-ascii?Q?0krnDt9lvjhRtROwxoKjGBSeOcIgYR/uEN7Jk/W34GBnPq6XgXjpXFtcW+TK?=
 =?us-ascii?Q?f/G5QBbMiO4WeM7dZ0vvR3KiEeQs7OK5TbECWO+jIXprLOEQiPgclhzu25x0?=
 =?us-ascii?Q?F/ALhMKggdlV7Rk9IED/+qU2Sw0gtuI2bP46c0bnEMEd0dCoSeccaIEdM74S?=
 =?us-ascii?Q?qiT9CQyu7lTdIp4UgM0OBguNK0uA3eVvQ8+act1F+4Z+2zSCkgSm6kl0PiRk?=
 =?us-ascii?Q?q8EQUUx1/cOK78zzV8gqL2VbjoRW+R7+0ZLFqS5d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27cff96-844d-4279-ec62-08da8c78f918
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 00:20:43.0876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOPGb0vPGG3PDAONCmdIfuzNMIMKYOVMm9JnNZa40nBx85uPBM+z0JyRBmn33ZVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
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

On Thu, Jul 14, 2022 at 06:18:19PM +1000, Alexey Kardashevskiy wrote:
> Here is another take on iommu_ops on POWER to make VFIO work
> again on POWERPC64.
> 
> The tree with all prerequisites is here:
> https://github.com/aik/linux/tree/kvm-fixes-wip
> 
> The previous discussion is here:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
> 
> Please comment. Thanks.
>
> 
> 
> Alexey Kardashevskiy (3):
>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
>   powerpc/pci_64: Init pcibios subsys a bit later
>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
>     domains

It has been a little while - and I think this series is still badly
needed by powerpc, right?

So, reminder.

Thanks,
Jason
