Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28802472E7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:05:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCNZK72yHz3076
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TXX9Mht1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.101.67;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=TXX9Mht1; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2067.outbound.protection.outlook.com [40.107.101.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCNYX5cnlz2yWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 01:04:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJeMf0AdzWz10t5c2AvMM1Qy1mBzi7y6w9yF6YR7W9s7OqoioCPOiOG/F9x6k3Y8D/IJWlvR6o7kfCUdV6BZnXMubc/kgRosZgWRtpEZAJs3SBQFt6Rl1OVSnFM5jPUNgBfdrhywBW9wBYk85cfVWO3B9JLSxNrJqy3lBRqKzAGPL31J74o2HPT3P2oLJiGuIp9YiNA55QzC81zbiesTZvibz3F5tBH+VV0W9U2jsRGvPjEKTu8YMIEKZpMniLnw6bKRDecw/jMYKxrgTJM6m2tETTeQixcolHFBeBEONnDbtUQL4nDk3bORQVC2An9kCB8U+LlwQv+UQT5rQC4V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFR2qCBgO35DCCzARlo9F87PegthBCAuSA/4C+N7+3I=;
 b=NfL72K7eN36HpcftECMCu7TLOZyDq4ev/lJSPxStofkbT1H614pn9t3ODoGu2+lN7dUetVhTVt+214RqxtkR+txv5Lu115zYcq1rKfl0W2PK3/gyXFKTeGPP1jiBTyJVzhsK9lLS8Q1xk3LYazgGGxPYZtIY68oWDw0rggdRlQzbg/dercs36OIqCfMEx8a1s/B1Mooq+rMI3hzGG86Trui2YYnNN+Ae/75FaH9nRQ8LYVmKNOrqKBHQ5e6/ISonKo717FAkHWR/XaRka7eRDxi6i7N2zpnDUdxhna+KPkoJte8p2EfLDHiteQc9BAQ3KuomJgZ1eMDyVXU2aUZ2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFR2qCBgO35DCCzARlo9F87PegthBCAuSA/4C+N7+3I=;
 b=TXX9Mht1d36cVmT/6hl5jKBzi00it1UcMsA9GMYLR4tyNeOsz+WWqPHOHHQmAPNmO4iuMEXJxTtTA+hZvLC7OErlNlYBKZ51cw9uh+0UxaAkMv69EShaqSEdUkbwjlT3XFvPjyn6cdWQ6tmxBEMt2CpRk2DDPJIAaS2kOQkok26tYsKblmP6lSsUuPLatXcoFy6Uw2MPaui8xyhReddwyiclVkGKEqjNe8/j649Wsfw56T1Gj1Y0EJ3Du+vrXFLjtlRTKLGOvTBScLf1GZqZabDFS6ZhJw4BtXm6pitMLqVHY9cXFuj2abwTbNDMWDpKNGeY+CqjnBm1SZBcy3lv9g==
Received: from BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 14:04:29 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5048.namprd12.prod.outlook.com (2603:10b6:208:30a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 13 Dec
 2021 14:04:29 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 14:04:29 +0000
Date: Mon, 13 Dec 2021 10:04:27 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 06/35] powerpc/pseries/msi: Use PCI device properties
Message-ID: <20211213140427.GZ6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.556202506@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.556202506@linutronix.de>
X-ClientProxiedBy: CH2PR14CA0036.namprd14.prod.outlook.com
 (2603:10b6:610:56::16) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e7e462-cd68-4183-9f08-08d9be417a7f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5048:EE_|BL1PR12MB5063:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB50480FC48CED472F62D2B0C4C2749@BL1PR12MB5048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vod+DPCiFPAdYsVFh2/PPcMbts7bAuPrkNT5362HkhU3xCcdE27qtR8MvrIkJ4ZWju/zlX0YTDw5CK8B+KvfpLNcNHjqaZKWG9cwXRuQ5ooo/w+tN1JvorL5tqJdmWZdFACIxs4r0TtlQtNaZkvMrX131Pc9/6fT4PSr1fER11EM5cNNlpegCHznJJ6nIuK+dn/AkJNe3M5i/2fo938X0KYcHtyzrcxCAvIQGtCa1wK9yii/Y0TYVKp9aEar2upyCvscs3N7ylRYNblOdXIarVhrtqaA3kYYsCgLJnBX5Vs2JY11V50noqMm2d7c8SDG7UlEKvmyQ/Vhh0PwJM5bzHSmmn+D3jz/ioZtXVE2hIeN7PaD20eUL/Ev3VkIhe9hjPw9MBocpydMcTklxfep+dwz4zAYveAqWV9HXwexfXaPLyr5eNc22zVOF/doJj7PU7Q8eMMCShwq3eBNFgG/+SvMfmBbrC5QaXWr49B62+nhkL060U1K4qjW/vCvcIPWcGA/aILTliDOxoY7ceH7g5NuiOfjYjNBZGKbHTfAkgds+c0ceBHNX6isOESB3oIwh3g76vv7Oad5TiyUE71IpwPxRz7RasXVmWDC1pSdMU0Q36NCZrWwTpj/5Naj+ciEXPEKZ2GTghov6nn2y/0QMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(38100700002)(83380400001)(186003)(54906003)(6512007)(2616005)(66946007)(36756003)(508600001)(6486002)(316002)(86362001)(1076003)(66476007)(2906002)(66556008)(26005)(8936002)(6506007)(7406005)(8676002)(7416002)(6916009)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J5VUedlTPcvI3lTUwuQpw0Y/Y13Y9NuOw40xNlNBrf3hZVU8eLB/ewcBpXin?=
 =?us-ascii?Q?ymPhJHF9SJaRl1e5g0ipxAVcHlf6ZNCVVjLPj2SDOT3BnrGcG/+nVFN0os5n?=
 =?us-ascii?Q?eYJlm/RDQv2tE0BIgnlg9EdSXKqW6V62X7UHQgHl+hWLwMIq9vEIuFpL7lxE?=
 =?us-ascii?Q?mp02noZYdE170szxV67/xeRrGM0ocZW/AbqFhMjsLfGZZ9durphOIkpeZqil?=
 =?us-ascii?Q?tFquVql5n9IurqlV73hZjYHBL7bWlWTi8OgfroZAvzLxmX3fQMKZx94lrplS?=
 =?us-ascii?Q?8mY4pXZHLpIHMJwtrl5T48Popdv/WMdsbMpptrmhIoGSOjdI+SvU3vIaVaR6?=
 =?us-ascii?Q?EtC2UCoCWE5nQbeWzUJMppGb5DYRnHghLGpqtUt2QPP7dB4z1AuaVCmY2siI?=
 =?us-ascii?Q?FpyZ91HC+SWdyMUV0GygkSdCsvSIQh8rEIgMd3vx0rypPrv3EbWvIeVSbSew?=
 =?us-ascii?Q?GfHtt0fcabIEXeKWYvzfoIReLfzBTKh+tRa2coqFDvt2LTYcFpFZ0S+WnNcM?=
 =?us-ascii?Q?+YyWvo7/va6WWu28TphBLLDaC82egcYoM40HPdY+RwP5oLA3D+69RNuaYARP?=
 =?us-ascii?Q?0Y/bmSWZ5yG8dU0I3G8HpmborhZ1AYmaMB95AjUmFKrwjeZ3RvjAF+gJ5ZcP?=
 =?us-ascii?Q?Dzo4UTy2wvX8wNISKJFuGDNDXi5Jg/LhxcZS+NuefFb1KI1xQ8Os8dOgKT1Y?=
 =?us-ascii?Q?Y0FW467uERIq0klB7gEQ4xnDDeKvSHNZRg7UjsG6aGdf9W1JTJeVsJWQB3wO?=
 =?us-ascii?Q?v2/UO3enIbp9B2flFMBHdwrbHj36m9dDWV4TXk4vHEjHGa5Ux0LDkmLHhWMA?=
 =?us-ascii?Q?nn01tWToMMq0c8Ob10vWy3AgkgXcmKcj6NLCvXynsxGsgEeCUGSm4NrZ4DV7?=
 =?us-ascii?Q?3ws3SeX8ahUAvUMdWSXMp8ROKJojUaiEueI0nkBrb7rUCjIww7dTd3i0vPP9?=
 =?us-ascii?Q?s4ozbbQoccXyHr/wZ3raMc9RCwNIzyY1dT5Ny3Pnh3rKRp9y7AagXgomvPDX?=
 =?us-ascii?Q?LmJMLBLXFnnG1OnKu8h+1wbSo9O4/UpcB4KPhTFbYy/OTth4I2nS4oUYvT0a?=
 =?us-ascii?Q?coKArLlMTBgAHBYUAe9dAwTUp0gN6L3Z50oeazYO4VbPHfzlNBuATFeKXDMy?=
 =?us-ascii?Q?5uWBSB2U/t05u3dqGVjemQDYc6sfdP6O+Io45bwZbt75mYQWVCf1WmI4UUI8?=
 =?us-ascii?Q?kHCuiaCwTD5Q8oy+QNO+l2FsM836CoQgCTLcoK4D76F6oBk235KyOJJMDXLS?=
 =?us-ascii?Q?DHwu1nTmI6EpPm/BmDv2LCW7ELg25k8NQttrYxMNo6HpKNU0Vb4br1xln+Gz?=
 =?us-ascii?Q?/awkyiJI/BWt33rrBVBiPl8wHccvXVqsH+0EXgBoHGwh/anKda/YkcXg/i7g?=
 =?us-ascii?Q?u8teW5Y/hZHEz6vBj8r8JC/U/NT3ZZwexlbQcT+hgIoZJbWD5yM5budx8Mm1?=
 =?us-ascii?Q?igAVVQgYnwMmCuFoUQ0M4Fm6/VDiKVvi5hqmTqMPB+ME+cHoam96GwHCv/hB?=
 =?us-ascii?Q?NOKpbZtWBkrBCmV9WFDMHy5SQLrhXLuVwSIprk3fU3VZK0vejVxNoV7+tHK/?=
 =?us-ascii?Q?tkYAAVTj/PR5ASrGwww=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e7e462-cd68-4183-9f08-08d9be417a7f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 14:04:28.9314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcZfBQZ+ybB0I2QtMD5KRQT9sCR68eyc1pg9XMS388uv83zLKwHWWsdZZSqLTmnG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063
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

On Fri, Dec 10, 2021 at 11:18:52PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
> V3: Use pci_dev->msix_enabled - Jason
> ---
>  arch/powerpc/platforms/pseries/msi.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
 
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -448,8 +448,7 @@ static int pseries_msi_ops_prepare(struc
>  				   int nvec, msi_alloc_info_t *arg)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct msi_desc *desc = first_pci_msi_entry(pdev);
> -	int type = desc->pci.msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
> +	int type = pdev->msix_enabled ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;

Long term it probably makes sense to change the msi_domain_ops so that
it has PCI versions of the ops to use in places like this that hard
assume PCI is the only kind of MSI at all.

If the non-PCI op isn't provided then things like IMS would be denied
- and the PCI op can directly pass in a pci_dev * so we don't have all
these to_pci_devs() in drivers.

Jason
