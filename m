Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586D62C6DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9bl6nPWz3f46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:52:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HlKj6dvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::623; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HlKj6dvS;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9Ww6mTPz3f9t
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:48:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4TY2H5UCwgmNWHvlk45hcz8Cte/B0KUtOQ+TrevYiZ7xkV7IS//uZS1NoieBsfKEevvF6kz1tHxxdUgVC7ZnV16anxUoFDEk3YOrNoqCu7iG8pbJz42Ca/kA0uKIVmUqj936big4QZ8NivUyDKTSC+t30l4SB42IhsE8pag9eaWUM+FYuXQyqw9GC5DFky4Ixbg8KmIWuyeYP/mjzBuqbttCQsj1ULAoW7pWdNLrvGQWIeFCDALztlaSBweBa0ovHFndNWuxVEalEVIIvAYUtMd6QLW8duQYhYEDuUmuKy1xM9l1Qxc0ieg1n3Avrlu5QgyVHwtmH0ppaqxSooKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fERJypxZhviohsRZsnh0KItZV3im1Ok4Pd15GFVJ/fg=;
 b=YZ+xaU5cgNkcK+SwpMkg3N1robWBJaueaSKSNYNB3uFawcz+O3hJffGoo2Xl5SKASi1rlRyHLRS4UolnwKnzXZ/U/itjlNo5oB0Mq4ZM7V9dBkgI8ylMtOMtgrtmruLQ2oFmvkS7XJvGTzmGwrDwHVQKGJ9oiNtBFumkAmCJ537oTKPMNE9YPOulUxGZzVK7mUY/c4hIXtiEjBqdQWWkSWYUs+L9T0au9ijskypjDiWolhyFscrdPKguYzAGycukW4ypO/dJXLzIJx6ypmnVcdwgy6D//eV+6rXAn5dtWX0z52RSvNCBJJEsZlIOf0jzTPhhyIvdCEqAJsc+CF8VKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fERJypxZhviohsRZsnh0KItZV3im1Ok4Pd15GFVJ/fg=;
 b=HlKj6dvSyT8qdQX0uhWc+rr/0oVQjhN6ch+npVWWQp7YnqN41zJuoknlestoc9pBrhtnCaZSTpFSqymMSmuknSJbR7kbEuMQ6vjpVJhTubGp5jFRSprI/ToaQ+mY0QWn694Z7SHH8uGYxmw8LWLUR52dXY0nxHEIccm7Rj1rdNKAXQYhQLpTXfjGmRrCPmf9dskJGvgC3oIkx418SxTaHmuHmhKk0xtTw7bSkoGgY/odBonw5qgU2VjDYguvQcplCa6YeL0MKvq+2cA5keoktmO+OAZvRnVXx71dhTeSPYNIyD2NL7Avfp+SdnXgfSDu64CHnTNPeP3kB4ICHu1bzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 17:48:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:48:25 +0000
Date: Wed, 16 Nov 2022 13:48:23 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 11/39] genirq/irqdomain: Move bus token enum into a
 seperate header
Message-ID: <Y3UiZxDu0jBH/FkM@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.237221143@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.237221143@linutronix.de>
X-ClientProxiedBy: BLAPR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:208:32e::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 308e62b8-77e0-4fd8-d951-08dac7fac29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	v6ci0CWUwD0xjbGLEmiZ6ljHRs1WDI1XS/JQo6B06CyUJAv8lqeG1J/uktb5GivbJ9gpnBH1KUzA8nJkk6uvrn1J9ZvLMEO18vu1mIqFRAyYZtYCH3gXP6i9hq121tDq2CmrN92QsmbFxj4hys7aHL7BJrlMgHe1BCeIaGZpTFve9c9gRHANcIdUmlZ23PTBQWDzPs770ZaBMB8eCN4GDMHrbba7YVT422nucEZwBUxInbwXKqmtJrpGlGs9IOAnBvreIAtoMXQJn5oUY62BX5cLoMfiPr7Ag7MYNiz2UJQXd0+J2RRxhJmHhLKmS4Q4Wgza+uTImTdY+GUk41CU3PSFXJ4IlcnJr3oVDh61ZmUefN6N0ZdottRwSQPk6C7cjKcmZa/IQMfQcKk1dLiSIpzQOmoz1UcZJb9OuYwGor3mvaDvjLx5+cZkkBzeHt+hfjjOJtIyx7xtlR4DOfQe9QAP4FAS+MUA9fKXeO50erB4sNEfVmEiD/oPe08ZWZ0MaoqYw1/XE0PpV/LGM4soLoFZZYcOlxzsKoCNYBLUP/BIELZWLtBTqAu1BvVo5DrBVboHn6jNydI3vH0bI4nWX2vLP3ycfRi+sTG7yaGb4v0TTGWfB6lSfV6xS6StBUzujJsVq1Md/SMCbmObs1Zz6Nv5GD7EjP2+hozfUVUevTIvtmHm5W/uFMbZi7q56QDtw00ivTQU6MWNjoHzkeOFGA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199015)(6486002)(478600001)(6506007)(54906003)(6916009)(4326008)(186003)(66556008)(26005)(5660300002)(4744005)(66476007)(8676002)(66946007)(316002)(2616005)(8936002)(7416002)(41300700001)(36756003)(6512007)(2906002)(83380400001)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7519Xv927YJbiXcfr9ZnADviEITEJ0HSyL9f+nrAHpZn2FJf9Zy6vbBU1+Xz?=
 =?us-ascii?Q?lQ50sPfyMvwbEvi91cevdPTw24A9mFfM4Kpi/cBxaQFhVw+WZgDawOAFMYW8?=
 =?us-ascii?Q?S8UwErpN62bOn9VrtyEp6s6/CMjetpN55FHkvRlQ1ZAGoPPo9qy46dLWAZVP?=
 =?us-ascii?Q?ypWtFgBfRa4M+1hpR12AHPGjoVxo1mXCZt+aLAPNX0BjgREOHR7X9h34Gv46?=
 =?us-ascii?Q?wWj1UJK1bMkU2XlCQ+G/y6YuHeccfzD9SPsqjjgPVpZOyvLKKgxxvgzjimTr?=
 =?us-ascii?Q?KIGDbyDCaKh4NNwIJ7NZFoBmb6xGvF1hw7GYN3ebC9sR0rjPm6L0qAhEl6I7?=
 =?us-ascii?Q?moc44/omQgkFzQqPcWk049Yq1NmN6Wd5C2iyPeBozdZ1CDPNKzibYlvl3l6a?=
 =?us-ascii?Q?39t5EZbHBuP2p3NPp0zD6RHbAj8axoZw5t7xM+um2HqVCdmW1vcaPvdKjAct?=
 =?us-ascii?Q?ARuuROvgwCJNCpJubbVyefLUeN828RJPw7lozDOJ4/YJ8JCsOTfGcbu/IMNe?=
 =?us-ascii?Q?yJOYG9/bOrk4FGxhOX8ND8r2MBt6jJ8VpyuFPkPuMMek/jdaleH1OH5zl3ra?=
 =?us-ascii?Q?unm7qC5rISvfxAWIaX9yzTZIEnFO6hnBhPZ5Ew3DbbrqUelyH4wO7WbHatod?=
 =?us-ascii?Q?bIOcpTQEsqi2IXdprSXDsA7ShLafAZ4V3gTDchiIZjClEkKbw5zPIxC3rj7Z?=
 =?us-ascii?Q?X5OB0+RR9VbwNXSb56y4EoVRRZ7KdLZlhptlRtk9JsXRNOSwZ3p7HaejADvz?=
 =?us-ascii?Q?vOcxii51a8mhiccSPJAEknS7APvihkHnJ2mSOtxzm2fP55uV7a5bDGHRqN+N?=
 =?us-ascii?Q?Q3VyvZvUWv7oMU7wJhQOmKBKKhFhXn4/RHgGQnonkT7OELo+FPFLzIkODTXm?=
 =?us-ascii?Q?llN9LNoR7XHP8VPJutPBesuZgNXLHH+8XH3RJnQXDlgHIAAJGqmO4xDyXVec?=
 =?us-ascii?Q?RGyC0lfiYZUASKEejRmOLqNmbd1FRGf3dqPh/ZTjkUc+TI3tYMm35znKk7kT?=
 =?us-ascii?Q?rvm/roH8GWg6uLUNCe3kuPfIXSL+r+l4X2RQGO/UHKAZutD/ZvuuI+JkkcOL?=
 =?us-ascii?Q?m8YDsrRuOA9wz7amsaM2IKmxFKwqe7i7Bi2gOyOrJ3Ih/pMgH953OVh0SKHt?=
 =?us-ascii?Q?4OYmp2odvOX1GbnwNIwrEi+pY6gW5YmRDzPtDl8Wckaz5vJ9uUdW/Zcfakba?=
 =?us-ascii?Q?r3FlpiwY9RApALDYrKp8tmC1X+iXIG9WmUvhkFyttEMV79DqXS3nnNF8lvEO?=
 =?us-ascii?Q?ClIJWIin1rtWMX900HOE/I+GMCr5bTHm8eRvaSzaWIVev05cvcvMbQB5Wzkf?=
 =?us-ascii?Q?5zoMcH2KlmzD0FkrkmI6qepXXrl7dcjIxN2IOa9On/v+E6QnQC6PzNhiJ0G+?=
 =?us-ascii?Q?nFI6xY8X1U7IQpyxLDsTYAxyLRa9mVlYeMpkq8gLNxATqlsjnJ3BpJzUJSOr?=
 =?us-ascii?Q?vQgKs8+bAlhzzvmzNU6s2rrkv9cC6MqjU6sI9IMSeb6dv6tH0yQduMG+ROh2?=
 =?us-ascii?Q?yWKGmdwCuRFYvHn/NCXeALhRhxYEJnfEffuL55zh+04GQ4MIEGn7genzv08L?=
 =?us-ascii?Q?a3IEWC1OcZjRmd/ZqPOxnfeTgzSO4nxUNyLEZquB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308e62b8-77e0-4fd8-d951-08dac7fac29d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:48:25.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVRMNhurKblfkq7Te4ZKMy4ArsoEZiDCf2HBV+N8jKDiY3wuAtzbhNrUjOh3rpCR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956
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

On Fri, Nov 11, 2022 at 02:54:32PM +0100, Thomas Gleixner wrote:
> Split the bus token defines out into a seperate header file to avoid
> inclusion of irqdomain.h in msi.h.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/irqdomain.h      |   22 +---------------------
>  include/linux/irqdomain_defs.h |   26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 21 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
