Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DDA472E6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:02:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCNVj2nrzz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WWNpiL5e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.94.77;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=WWNpiL5e; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCNV40zBdz3bN8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 01:01:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evfCkW8fPGkeLhneb633ESMHzmrBn3wPmlk5gxUhc2+FrCf6dhXmrgF+h3EcXsvMsIuzdWiUyfTO1pvnE4xoWEMLjG4det9dXAoAP/YVsoLFSlCP8EUBcJhNwUImDcxrUdwwkC/DjLYusV3TF3vu0Da9uhgbHVRSuF4uMlDZUaPi6d23t+oPccyzVs8ONOxQgId4VJAHXKggYq4iMfO17cZHWcr5EA0Mymt+MU4LX7M4KViNC9U45Hv1akpti0rWHpKRvUkLmxiJWzIjp21XGag89VB8UgF7jMO2qlhfouJbDUbMJkixjnH/qkh5+B/ZM/ZXGbrHPXXVj+4WZpAV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlMF/+WtA6YdQsLs5VHo84300JQYQ5QA6EWbVzAk+H8=;
 b=X3pvuNfUcS9URUWvJ0PD2OQGWQIEMBe/0okQLgbpQqIikCC9X4ThWZscJhIiRc9LCUhiUzRFmloYDFWtgYt4RalMxeDe7aIspXqaeAI50KKDUkBwANma9B3B5O9L1tAdcSbmkzIZNNNxxtYy9Lg3YDrFu3g51/auBwSeoz0wMS3tY1oUIzFD2i/X0byK8NbYcjdX1E+/dKXFT0Y4NTKxs2iy46Y1ybVMdmVlY20LSG60Vz/NUm20GpMwrSvqjHDdcxU2FuAL61Kl8lBrkNcKNOQI8s0gSZgcDi4CUL+KW4rWAmkY6JLdeYb1GoXgWJBupT7DgKSckDEGp10v+C4ApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlMF/+WtA6YdQsLs5VHo84300JQYQ5QA6EWbVzAk+H8=;
 b=WWNpiL5eNFoki6MoWpF+o5CAwCN68AC81WB/U06W/oe26N3emwtLWGL5o8FrsvXNyF36cKfNxXjGW2yWz5IJcT1L1sulx1dSmbJKCw7CEtTsWpcLl2OQbT2Lh8cpA9go5qeqokk5sbPxoCUnedVzjJ1yflYVZkihMsGOztiRfUSx/Fcwn2P2CzaF/uY/FtRltmR+ZjccHrAAXZgtj5n5s6VeiNkPeOkBDqhOHL78vf+Zwh1shYfeVJYDu3ZqHwhZZpb9Ts/l5MI5rGxqMQMnyIxVyiG9oB+mqECTyLI2ePCsVjxtazwz7a1XVZ676ANTwCN7ajaNevQcygV3duzXmg==
Received: from BL1PR12MB5111.namprd12.prod.outlook.com (2603:10b6:208:31b::12)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Mon, 13 Dec
 2021 14:01:22 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5111.namprd12.prod.outlook.com (2603:10b6:208:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Mon, 13 Dec
 2021 14:01:21 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 14:01:21 +0000
Date: Mon, 13 Dec 2021 10:01:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 05/35] powerpc/cell/axon_msi: Use PCI device property
Message-ID: <20211213140119.GY6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.493922179@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.493922179@linutronix.de>
X-ClientProxiedBy: YT1PR01CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42bf01e5-e98e-4c9a-c2c5-08d9be410aab
X-MS-TrafficTypeDiagnostic: BL1PR12MB5111:EE_|BL1PR12MB5334:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB511104452E38FA5162B1642DC2749@BL1PR12MB5111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPEY9KlCvUCh5Xbnatfd9ocx8COZ/3g/o58EYyjE5ATTw0SUM+b4MfRTbsSph9dxZHg14CX+PTxC8J2MPbkGQ8DhDyiiKTo4xSPAR7K6c2jc/42y87iCRpiMtrgySSB1HUkn69AeD28+SFzw/VOoWCSPB5L9KL2LgeM/pdLVpGM0uQShQOKsx2ZSXBFLEV+y+EQuloUVemDquCMLCq7hSlxjXXIXIpxY2WMMqfeT7qRNO81qt246o+CVOZofNLpZ1zzfrNS1+rRzIA1EQ8Drf2XBX7SP/58hgpUexA8w+RJzafbbFhO5RSAaWMJoOs3VrtVujRKn+inKQc/8lVpXNBzfeuK0sQR3A7BlJzG2/NcF5GxLAGCiaoSwzVut2FZLD0ItkB6Kzc4RAdDl2pnKAMV6Yr6Bf5n8VkhQJ4JoBxvzEQdKJDfE1naXUfCF7Fe9smTJ2E9pTjt0WVh9OViSwVCVjmhmKdWk0si3E/L3wxGZBwfP8WWemxK/iI0fhJpCU5vsG80ARaKV1Ur6hY5r0OSv6oWdMBkp+3TH0ayHX20cNamabMJf4kQrj2iaThqScWAJ4ZDx7szNUkOflFgXIapT8RaMk2GSagYMyTuWyA+Ez8W5q7TZfXZJI1/wxYB2WkezN5VfxSHtFvwcr4IUmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5111.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(6512007)(7416002)(8936002)(36756003)(508600001)(7406005)(5660300002)(4326008)(186003)(54906003)(6506007)(33656002)(2906002)(26005)(38100700002)(6916009)(4744005)(83380400001)(2616005)(66476007)(86362001)(66946007)(6486002)(316002)(66556008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MU6qH4cQCAQ7AAhN4pQ1R8xxTCuYJVW7E2Mz0K/YReQL9mmdunGVJQMIReoM?=
 =?us-ascii?Q?G3//ER+U3RiLgpSfCX5krQmbXa+a4T1g/TXUfug32yE8vk1/o3UNuzDhALlA?=
 =?us-ascii?Q?jzL8KP3nXINqqqfBkJcZbF+7Anvj76Yqljocj1yBU/SwrqJTbyAuwBwEXwBH?=
 =?us-ascii?Q?2dzJak/1/iWmgU3t2eT/Fhho5NCthEvpa3xfIv8Iezi4RMRpLqASQie1/U6f?=
 =?us-ascii?Q?8WqWr8XPoPLI+/8gi8bssCAc3gnrkMrLS0YceqRxNVQUr4BiU++RGyAS01fX?=
 =?us-ascii?Q?q5kzLKNbmxm1UBU5JCtpIJCGhHslIzPAn1Nl9k5+q7bGbRHOUSJ2flYICKXt?=
 =?us-ascii?Q?R0QKmJxELGDJ+3mta5/2RYyMeEjXSVbLwS8IlCCM55EdSinNsXP5K8EmYU7y?=
 =?us-ascii?Q?n5HAZhRrMfK08ozWsDnPLKgBBoGsIUbA4ivmaOqHOOOnSXIL5LTVu4+TM+KS?=
 =?us-ascii?Q?0fGtkxU2y0cngXS/LZeMaM+weh1e4QhtNFg9Fo5ub3HRq16EVbBWRZ6gNU9D?=
 =?us-ascii?Q?lGEHAIY3euiZAeo5xwsUqVhvF0iuwmlZ/j5qAFsu+hiecN25dTrt7Hk8prB1?=
 =?us-ascii?Q?TMjNdTDtwBYJGBU8SOwxmgIW93wTosZsoNaIhri6hvgCK3BXwvqrYCNEFJGb?=
 =?us-ascii?Q?dtxGdoXKmaZRPd5fpbSPvTLxzIjqmM+WsuEjsL0Ld/v3g+QZya7v9YoP8gw9?=
 =?us-ascii?Q?8D7+PVRnirCcSvcFmLyRIjSkWNE+YRONRWzl26R/sdKEL6gWP/4lL9KcukCw?=
 =?us-ascii?Q?/gUQHnGnIMiI7oX2k0C5GY4wGJqgGxV+gTJxIcWH+9mcYveyvEyJT8eThi/v?=
 =?us-ascii?Q?X2OWK2TNSE2I2JnFdo0zDvfvtHH9F+iYohQSS2kvK+9hpoNeeYQTld16JjuI?=
 =?us-ascii?Q?uO0vykylzW4drgfatDRsbPmSTOqVKC30K696JyTQLhwWJrrg4IYkq7MGsLdU?=
 =?us-ascii?Q?2rCxm65ye2CP28K9U6cbhTBEMFAN7qYVw5WH2XuT4JHhvgwYiNToiWLs7O1/?=
 =?us-ascii?Q?G70VhrJlMoCmYq7vNBaE8P9mM8pNZ+MNaZxma/LVj61TLShYhOxiHAwf8Kuo?=
 =?us-ascii?Q?/xKR+3+X0+ugfrEFCc2r+TYYG8wZ25Z+KSkBuysjfoZXTW/iZGNh6LIFcji0?=
 =?us-ascii?Q?Qp6fbCFk7nxLjHu2DXmbpdaa5lu3ES72fUv6+ZhZ0gLWu91FFThbSmJ0iQQi?=
 =?us-ascii?Q?ICvARK5kZq/GFB0KyTrt/tCAxjEKDfvLQMzq0Utr0miAr/MBLMK6sx6lx7qy?=
 =?us-ascii?Q?Qpz6fUPW9ocgDAzOy4nml6/Tb9iuly6rDSXRGaExuAvy7P8I+SP4VoetVKCQ?=
 =?us-ascii?Q?jJBKvkz0LqGKhNJOi9If9k7WZKpTp+wBnNjSSl4psJ3Hg92leBfPXk6eNTHP?=
 =?us-ascii?Q?aB9ZUZF8fdO4TMhDlMVh+khaV4wdaEGby0wH/MOwS0fESdVgqb48stg0XEcz?=
 =?us-ascii?Q?Z2WnpgVziI8jKibyVJZZtNues8nWb1y7/Ad6bsruoZYMRqP4/NzTSOQc1xuo?=
 =?us-ascii?Q?D5krg56UtwFAhcQSENR0G5GyJvDacIJFwkCzB4Wo/hgDrVygZdASyHtUcc/h?=
 =?us-ascii?Q?rirqebb2NJn44i5tp08=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bf01e5-e98e-4c9a-c2c5-08d9be410aab
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 14:01:21.3003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o0rLzrumUI9mtRFTkDxCUrs/be4HKVEFvJk9/ev6ag+RNwCvz/J/4XFYRZD+TDQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 11:18:51PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> V3: Use pci_dev property - Jason
> V2: Invoke the function with the correct number of arguments - Andy
> ---
>  arch/powerpc/platforms/cell/axon_msi.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
