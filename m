Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA2472E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCNST06P4z2ywt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=E54ZAdvk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.95.74;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=E54ZAdvk; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2074.outbound.protection.outlook.com [40.107.95.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCNRl4PD4z2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:59:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9OlWw2GhPqNSQJC1+7SFURj10H/SaEoeBwPx3U1SbetkJTi3blhTOixg91prXOUvjLsYHZVPO98pCjlDJOydcO71yP6i2Ph17ovsOd1smAhZqs7dU5smeub2XyG+/SHPvAK8JcHg5B7pNFLpH67HQPOYvQu6vEpjpd3aVfnl2Diewvd4R/jhhzzBnGBoNzM8/2gpHIt1BF5SD7V15QuclI1skV7QE16vHW7JTB3iGih+vrwn8IhhkPODHztYQ6gJZ8sRkS+0zJVg88HRM3aCYmKVslzB5ic9HgFkkmOpdb7nc41S08cjB24YGyt8oImWrCgibndNQvh3Db9Dj+28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4e1muZdaW+9bbvoI9sSBMtzRvLQLs2XEAcTxsebVYDQ=;
 b=hSbBAzdsUSkBO3CRzP9Q10aDYMfCLyEIQufaflrOrkqTgGlLeEIDLM7rI5z7J6ys5WlgSC8ZBmm0uXMz/xcWpNqpdMRz1HHyVPX+KwDoQ15b+OGhfAbx1qQSeX7sK7kkZW2zx+gsQ30Coy0ZgTuU9zYmH9HL7whk2kRTgQ1YufxvraX6BBtdEYkkhcrFLkS1E36aSr+1tQYrKy/WQ4BQOy3Up9BKWwwqm8w8TlVOe049c0j36KCq4HQu8Y/Y/+mZxklP91fBpdSzJpEOmBZoXfvSWH+G9m/+CgZv1uqhKewpYPJ8Yg/D/7CyW8hM2YtyKKjeMiLugNAhZbFwJcnrjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4e1muZdaW+9bbvoI9sSBMtzRvLQLs2XEAcTxsebVYDQ=;
 b=E54ZAdvk9kS59/3FBj+5nHzSgxOk5tk58o8S8xmIISrWQRh8WMTJ0Ia0w7Ec/gWXbubm+TtjWkoJGbt8VFMyOjFK9hxOuFt5XgzkTxEXz/XxgBzFNKzaRTlOZsEhfYYM0CZjoERIE9wHUc0sT/bc/PMEVVgGlRZLE3odY/9ZJNFQZuotgatxf5dlkNibo2L7U5+3ME9RA9O4jL+YDznK5IgOA8ur9/E82GKLTzWmbBTlzmLo/R8cVDxbr/y9FKMawiQtwl5H/GKlCVBq4Uqr9lUEeb4p6uPzkHZv0uIu9FBAQm/KeCLaB01UtKKFCaFq8jM2I3WY87rpZQvhsY6j9w==
Received: from BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17)
 by BL1PR12MB5285.namprd12.prod.outlook.com (2603:10b6:208:31f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 13:59:38 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 13:59:38 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 13:59:38 +0000
Date: Mon, 13 Dec 2021 09:59:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 03/35] x86/apic/msi: Use PCI device MSI property
Message-ID: <20211213135920.GW6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.372357371@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.372357371@linutronix.de>
X-ClientProxiedBy: CH2PR18CA0048.namprd18.prod.outlook.com
 (2603:10b6:610:55::28) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84173fb8-8889-4548-3026-08d9be40cd26
X-MS-TrafficTypeDiagnostic: BL1PR12MB5205:EE_|BL1PR12MB5285:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB520520644BD8D3760CC48A26C2749@BL1PR12MB5205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +So7GSv8f8tJxYve2FpjA+gybcaaPgw8mG47uB1eju1YyNkuV8V2o7nV9N/ZJKW5L6gAssweGQ8FXJXWh8HNkze4Zb5zXZgDcHODqRkyGN9EmeOBhhyARdYukQeCUn3sfElFAseVlMroEfssaw7BnqwhE4TMRkDRP/Ipp8S5xjC5gUSqaA77CB+6OXsdz+2e5QZRmahE3fivNcpQCIe2WdmI2pA4h6mL2VnAVhITS2tAHbi0mM2YJnT0ukHg5u+SvWb57I9Pl2HIW6cFWnHj3yy/0hdaW6ustrDyQtEAX9MppfMXHKzqVb6bSqpOII35IeYaLIEaRNDy3oVbCiuOQ3M7YIqxze5wKPX8SYZaGPkm7ahX3QRC6xLrD2wQT90i4bQXpN29CaCSRBXifSrpLAscLyb+anqXEUbnae1JqOvozG3z5Hcq+gbN7PEhS3VnC88FIWmYKW7ejEkwfiUQ7eb3DASNFkJC+Cxh1EIdCWK8fQTYECOPb2cB1JVprORrQLafeUTrADqEBqy6cBKjs3AJsW4ItNm26CaRWVqVfuHa8+7cOrBB0PcAqOAdiP0XopChOM5WqnBfKbphgY3/SBiDqjxSOdvoTcqWR+l5piwWjJKs2MqGVf/AS1MZNv9zmmAE1Hxu1V2WoQbN2kvUCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5205.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(6486002)(6512007)(186003)(66476007)(5660300002)(36756003)(316002)(2616005)(6916009)(8936002)(7406005)(66556008)(6666004)(33656002)(66946007)(4744005)(26005)(2906002)(4326008)(86362001)(83380400001)(38100700002)(54906003)(1076003)(508600001)(8676002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0+pO1xHbTviYxFv6EFUdG7x7speOn4GgTJc2k3gohJ2gi6Hm8T7f50Z2cij?=
 =?us-ascii?Q?PVeZ1E8cJeaY4m+gtWBc8JvhFQZYJZ8gIPTSCTVAF/edp3ZBRhcyOBZvB8go?=
 =?us-ascii?Q?v66ofCwIgEK+lW1nilwLGMK9SFGLWXEUo5vdfLKNcZVMDXvZKaKW82f8ODcb?=
 =?us-ascii?Q?1GgQD4HpXQM+KDptaOPEPBHpBAjLqW2ItIvjAxN29KprQoD00JezJUncGQvz?=
 =?us-ascii?Q?URtmVFapJh+9b2OdVctGvMk6uqXjPKsz9VqK/8lkbQv+p04L/uCxb0iWTZvD?=
 =?us-ascii?Q?SxOqpX7Zx6fBpR0tzWd3mw11abvl93V9lJfLScKNvGSfXPShHD9862tlDr8g?=
 =?us-ascii?Q?00EDMtDAqy6j7LHRnWEcL63wnAYAVrsdJ1w1YoY3mPZWlqOV5KLU4546nPUD?=
 =?us-ascii?Q?oarB4owRLdLHYNcuR5LD8JFIWJPyICR/swhTapmhkPntN6GIOz2NSOm5QSKG?=
 =?us-ascii?Q?0tdyNeO09KZ3cXDvHry2uh++vibJUlcwFzSpD6p2ms8JzZx68bpXGVenqcq7?=
 =?us-ascii?Q?3R3bDarspCRMHh9SsiAiwvKGohN9/YBEP2UP1O65C5+MROPXMuvGBdNek4aG?=
 =?us-ascii?Q?t704aNo+o9GuNVoi/0LpNjW0D85gCqqyC2Ev2pnwv4WTl3T1cTyeP5Lzug6M?=
 =?us-ascii?Q?ACRg8IcqNLdMzrBmdh1z7NVTuQtNkv6FjoCUdaPpxh1AfTqLfID/NlwT6M3g?=
 =?us-ascii?Q?mGENsXy2NIcpYH7XYS1doNihHh8RzWnEC3f8M0RvKFiQSjvW+fH2ppYGDV+N?=
 =?us-ascii?Q?lzRKE31t2pZLw39XMHshr6YfQgIuFm+rs0k2LPXqdco3Igoa1U5n7ipO4np9?=
 =?us-ascii?Q?ESqMEyZKlMoqIHAhUjSc8ZTJb2Q/EeDVXK9QOLa2bhJsVHnBwoWL0M7SbpD4?=
 =?us-ascii?Q?Jty8rYxshTtlbRot7qafDWWgXUM22T1ulZJ/RftsXFgfPFhP29PoWx/3N9Bu?=
 =?us-ascii?Q?5Ww/KsY07dghI19EpyQbRaZlW/nGwPCxI04MbFCzXQqUYkOrPfynThvZ9RNq?=
 =?us-ascii?Q?oC30y9TPAXVOIZoQg/F5ZDQ2Kt6hxAsrcUypSD7IS3qo2ZyxnUJ/tH7Sbzmg?=
 =?us-ascii?Q?5C97dNpm521/Lf0D0eyO/p6A1OiWbYNrnYuJJe9P8Fa3dSxrWlfxXdaENyLJ?=
 =?us-ascii?Q?G2c/A2tAEPetiFi9997XwRGtGrJZrBohhCBPfGnUrotmVCsayFuSbo9a0Omu?=
 =?us-ascii?Q?gECSDv4+d0zLlGzfXWDuzDgQk2+R/gtK3CVSs0F3mRfXAhIZuomkhwWUUOzu?=
 =?us-ascii?Q?vhYQIsKA22sopzSh+coRjz1imWb7plAUAfhfAL0x1h0eQni3w/zeeOm8VUB8?=
 =?us-ascii?Q?bwTSGIhYOv6/OO+Xumaavq3uXruwkVx3/U2KDEvppEFXM8HX62XoGHTg+uuu?=
 =?us-ascii?Q?227+EvHSt0NwPJTkPInxk3FDzDPqffa/7rKchTAoeYqqNAddJuPBCqv6DRTi?=
 =?us-ascii?Q?QinN6YhZbR+fYFEaqQ0ibdJUE4nwxGewjm+m5lYJNRS8mRJaMA6KRUd3uPMX?=
 =?us-ascii?Q?YiY/6fQ9OZ4pGclUWTR/OtwtssP1/CSOyiybiZhhgjjTUcvZj95+ZY5MudyA?=
 =?us-ascii?Q?ewQMl8OSXu+k3Is1qsg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84173fb8-8889-4548-3026-08d9be40cd26
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:59:38.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xbanXIkeWgWqW/UkwOL67cBY0Ay/mMZIJa2IiPRUtINVksIlOC1BvOemKxiVdU2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5285
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

On Fri, Dec 10, 2021 at 11:18:47PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V3: Use pci_dev->msix_enabled - Jason
> ---
>  arch/x86/kernel/apic/msi.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
