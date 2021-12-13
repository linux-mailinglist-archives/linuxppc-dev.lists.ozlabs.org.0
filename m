Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC47472D89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 14:38:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCMzS4xCLz3bjN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 00:38:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZlSorW0Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.243.66;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ZlSorW0Z; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCMyd4TGMz2yPD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:37:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki5BN33Ic7DMxipuaQkKgWuddBouHcbm9iDqcVZrR56znv0141dDiHveqC2MxsMYUQn6UkM4NoBmSWVFIR1tqVb+4jbwzRMcunlGkw0o504hq2PNdWd4p7pQON7B8ITZl9IsDKWMVDSlDWe317IiwsUe2TYPhc0d2SAwsEfb+Vc2l3m3+iJsvbhTCQdg369sZjv3mWnQbw0VhYWg0NpwOIusTXsOB3s7c663R3oad1clj46XagEeZYigzjHBpl9Rp7fayl+9IhMbPwe658J7UjH8KNpwLMJGar3NOW8SHpC5beufAo6VYJssr8P/qrSXgHPWPKbJ8Ir74qV8h8ei3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xggFXRr0LsROw2d6Z61nZ7hHVxM38Z13f0KEkB/Uhw4=;
 b=LQI9zQrgi8BymOvVzFpv1YQx4Mn+ONoD7weq7u3udebHW2dqNlHqmwe011BFI0KH0+7JSFapNgMcIQrO3qu5SxyLiTw5xHz4Ahm6kAZqfvKZv+vHs3xdH+Q2IpfoCHQJUkKLbYpmLYlSK9OTkgzCCpudMjeZvvu4EfESI4WQi/2Kmst4Lf+iz2P79hFNWSnAxObHJX2vlOhC3dM0AH5PXb82HrbyWyLiB7QftLIzhrYcOqokCiHICKDjmP0iu6K61mhKT+Z++1u0SXBeQOX0xjk87Vp5S57NUQ+3QAXJ0QcGEFECuWnale2HGWxcGXPwRKDeBjL7Tm/f7dxkAsz73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xggFXRr0LsROw2d6Z61nZ7hHVxM38Z13f0KEkB/Uhw4=;
 b=ZlSorW0ZAGYSekVtz/5f9u42qg+HPrOHdhQllA8cjTUmTe9SpCiM/zPfJuA5zBlcE8cMql/RhORIjOQJwiZrstDuS6a8ScAr9yGaT0SkKT0xrwIxJTr6rgEjN38rnMh9xdhiBMZhPACsrIJGViVUxkNVOjN8Bjjn/9WAaAL77NOhwMD8MXVdZNxK8lEWNoVtfUw7jbVFhIW1Az7QXDhkzvQDGLrLpNpeQAFWqrmS7yBFq9yo2Ae3ntg6EyMoMVPjLolc+2bRctZyfmKKxOJhBBLGEEVw4+RmEERFCx2QK1PGUWF1ym8uaGSDvgI4S/EmqyRoZBHFBd3CIKN5muA9pA==
Received: from BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 13:37:38 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Mon, 13 Dec
 2021 13:37:37 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 13:37:37 +0000
Date: Mon, 13 Dec 2021 09:37:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 01/35] PCI/MSI: Set pci_dev::msi[x]_enabled early
Message-ID: <20211213133735.GU6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.250049810@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.250049810@linutronix.de>
X-ClientProxiedBy: YT3PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::6) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f276fb4-b3b7-4cd0-30db-08d9be3dba1f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5272:EE_|BL1PR12MB5207:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5272067DA35BD30855DBC8C5C2749@BL1PR12MB5272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ZNdlvyKTGTbehIFUDKiA7YcdDH/5E9YKYmkS8atCo5M1+yMncNYjnyXmTrFKfiy9YWTVVTW/J6rrc7RCcDpa50UexR+l7IaZ1EYQf8SVlEDIijCGL+A77atYYSyGk74xu0IuG2BLeBFGf69eAlp7l1g6PTTkVU8ajhVuaiOVe186TaZGIMGIFg+wWCpLwPfzSMOI17nC/TatKdncHABQwX/l27k9Ox+Lmcp9cbyrSe0fC+YFBOCr+pVUbGGYPte94jP0BD2NVxB9fvqHvm8G+yYg4MTQEpzGjOYMNFonH7egb9lAsbpyQMK4FqfW6SROxF0KvqIbPvaQ+30vF/vdtuFIxJE4RORQ0EY1Q7XpoG1UrB2s8f4XkjkCeVjlONRHn844uuIWETBKA1E1iL+77eO/kvj8KMRAlLNhP5CAEJv6uQTigMPh4JtxeQ72wVlNPuQqcPWiWoLDysRVbrraUhcsfLslucBQOYf0eu35zurh1xtBmERNDMzMgw4A8Tb99mKXkPNWgDMtXWzYaOXP2k7e64kR/PHWXPhzE93N14u4xelnWFtJdPuTXeFQZKmBcglOnf9gaYYsaV52t8qrhNADMS59ZU97pqqT9bjrKlwWM6MWFdEXzUP2UcQYN2k7vmep7rpMkMBEMBj0+diTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(54906003)(86362001)(4326008)(7406005)(316002)(36756003)(7416002)(83380400001)(508600001)(6512007)(38100700002)(8676002)(2906002)(6486002)(4744005)(1076003)(5660300002)(33656002)(26005)(6506007)(66476007)(186003)(66946007)(2616005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xdqpvC6oG/g8YjIodR1SC4/6w3DBlwnZJ0pJ5J+9kjCrBJbjmPTloLXFgSWU?=
 =?us-ascii?Q?XTyGOe4aUI29ZZb2KP2+F3Sh9pNDeSADj3XDjmgU3H1PJK8nCcq62n337HBg?=
 =?us-ascii?Q?WVwhCHVZQh51MA1uZ4llaE0WsHXusAe/NpQ0+aQItmefcLUpeJmNHcQ1uVJ/?=
 =?us-ascii?Q?4+7wiFaIh4xyAjp2rpvQj9RodEKiGmwQHDggzJfkqqMFgaX+rI05mcJs/NRc?=
 =?us-ascii?Q?h/St0MWkgpHbX0lkTGw7BUINrpXkhV82undeRCyAW9Mjxhj0RoBj01CZedwv?=
 =?us-ascii?Q?+t2BkL5FcXzFN/nI8wFJfYz+hf9+wWKstPUD089HvAxxcnBKctmp9d7kx551?=
 =?us-ascii?Q?f48DK4/sxFzAkm7QXHvMZ3V3g+33FGbd2fk5jTGFXMr4sdqDEUQW5OzNnNaT?=
 =?us-ascii?Q?r3ianOYaF10GTHCoSbFbFJe7BM0unNiP5IKcYjY5k3r1hiIwelOhi3TqETR3?=
 =?us-ascii?Q?3WP+CaTRaQqpV1rZ/ICh7M56q5w7HC9cLvq2PMJ6hAOCcSEY5acqLz6UtH5c?=
 =?us-ascii?Q?YdXwSKE/oSkd/BN8tnNQsohn3rFthwg+4WCedpXhfY5ZpkwmIk4aJuQIwlqh?=
 =?us-ascii?Q?Y0XZBVP3NVhMEnvMc2GYlm0VF246sGlXHKPFHGGGjEum41Zosyhv/pGsuUD9?=
 =?us-ascii?Q?TbelPO+G2Myz8I98fbyTJO+buyH9jxmmgJR0HrWtRjsLxujZO7JOZ/k3djW5?=
 =?us-ascii?Q?iGb0shFdBAQB8ij/bGpNMEwV9vgT99DskvE5jp6hI+xIH9gxHTj4tMD0qceC?=
 =?us-ascii?Q?VPBguO27ihBmUSFT7KGPZf0A+cUtvzz7bo6d5NMhkJHgXSOCIgfF46jf2Q1I?=
 =?us-ascii?Q?KD9SDpdczWJqDk0sqXY7PZEMDLV/jNVfWrW2YN3uVqGIb5oyMgL8UQ2ZW8Eq?=
 =?us-ascii?Q?RN/+Ac/gQ3z0pl/3FtdIbjXa7v499FzyZQXD6F3XRhbI8TYSK6Sx/a2Bkff3?=
 =?us-ascii?Q?ATQkvEzUPcU13I21IvWl5YE9ZdxHJfnJ3kiZMRqtsqJAIfyro8MIdiMewviH?=
 =?us-ascii?Q?HbDF0eWilAPXOEohUbSUlDoZdrBokj9EKaQdy3sVLrgm/8CnXkAIK1+ZYEmM?=
 =?us-ascii?Q?Dg/qJvd403zZojUiF8yTilXG+aReBDrJMFF0SgmW5IIXyP5MgWN5/T9lpeHN?=
 =?us-ascii?Q?SdNMYIo6n7b4mUF20CfBfVTWWe2z8AaP0qPNRWXe5nOfJGpAQXIzA4fXyZdT?=
 =?us-ascii?Q?74dlnPeVgUC4fP20/lwkM9Pi6eAdar/z2ngarMQ1JOVN2P9LWBEeQ98JLfSg?=
 =?us-ascii?Q?8VdoKOfoopHxnEq10zr5ZH4yjrMKRuic+EVMCjAI19e+2oReOwupEXKKCcx5?=
 =?us-ascii?Q?3CATr5MC0B2E7gSMjzIBczFwGftt99cyP4/o0N1f+9fPYlGRyqS9bXa6DMn2?=
 =?us-ascii?Q?7qBYoIv0rbk5kMvn89z8xAat/3eDb1Cscrl7yNZLCZnOfDZsILYYQDT03gUu?=
 =?us-ascii?Q?DQHY/K2u+hvbI5xkFE4ItRbbN9ofh6jMhrcOkugbPso8ntAqtVF7SOq9FhNR?=
 =?us-ascii?Q?E1RXBy+DpRjwV+b/Ot++hGmUoZr2mobxa3J7lGRd7YSvQzTMZGLdKV2/f34d?=
 =?us-ascii?Q?0EnIyilE+lYn1/BDh/Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f276fb4-b3b7-4cd0-30db-08d9be3dba1f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:37:37.6399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VytknH7paVPjrCWIKp0flqHqBuCf5kFFsxuZNo9G/pTnt4rie8xiU6i3m/jhM/Nc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

On Fri, Dec 10, 2021 at 11:18:44PM +0100, Thomas Gleixner wrote:
> There are quite some places which retrieve the first MSI descriptor to
> evaluate whether the setup is for MSI or MSI-X. That's required because
> pci_dev::msi[x]_enabled is only set when the setup completed successfully.
> 
> There is no real reason why msi[x]_enabled can't be set at the beginning of
> the setup sequence and cleared in case of a failure.
> 
> Implement that so the MSI descriptor evaluations can be converted to simple
> property queries.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V3: New patch
> ---
>  drivers/pci/msi/msi.c |   23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
