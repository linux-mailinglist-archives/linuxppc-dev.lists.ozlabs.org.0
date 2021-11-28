Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A537D460275
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 01:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1pkY3qwVz3cJS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 11:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RVDBhQIJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.93.77;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=RVDBhQIJ; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1pjh2htlz3022
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 11:08:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwWXat6A8f77a1be4zN8r/W7UCTCFCivHEsJTo2KzaMI43ALhEoG9APFH+uJenG7WRkOUCKy5rGKKgl4B6owou6LoukxjO+IAnq5x3V6C6oz34LjeUY6MClO689f00Jh03HajKPXQ3Tb+cQcpL7eDEZyU/1Ao9O1rb69YRvwY5wYn4kIGOP+kvobg5Zgkqry9ND3RVWKsb9t0RoNb9qBFMeu763nkTU1CcCrB7QG+9EM0g9oDidPHKgiUFD5/jYxfPdTdA/6v8Q8aHcZ/LQZ2DdBk73CkJ68PawicBBFZWkvAf1vmKFSX/VVM5rOwO1zsZwBQIJApHredUcfyrnOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pVvssknBhQqmkjfnAH5n58/RZ+BO9TWp89tWLupnzQ=;
 b=P/hkSjwfJGBTpTJXufoHTH7AtR2UVP7ItmyXw5kSPTC0iTP4VwSGnKtS4bvo4LhSHGdFfoaMhTgqZTh3+ZISzPc+XtsTuetK6jp5XpLAXfUIE/hYPQXcPYroK2ysamuO6nliyy0g40MGQSzu6AmnU2KZkSHwHnxfbmFWfKbn/twMd13edddm14tDnxgEfwYbIum275bEiO7gtU/bsa+it2LvS9h00GNaRNP4kvBHQVRBVxYvHKqQdRqpXo2MYVFL0fPCy+w2c6U0SyYhb8BgC3d95nFiqdMU6v3zEBzTsfGoemvTHaZNC+2WzCIM79db8vDmvTIF2e/U7yWj4kBtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pVvssknBhQqmkjfnAH5n58/RZ+BO9TWp89tWLupnzQ=;
 b=RVDBhQIJLpb/y3N2LbOgQo7eiW0h6ojygnfnOpizZ2NyZmxrVovkV7yJuJbE/Ahsq7bTG4Peu/BfoSgEq9A5WvGqFT0yJNzeEEEfDqHn6dPUAPfSOu7Bnq5DtAllCXDidCMPESU2Vo+stMR8f6yqnz3tk8QF08xSRLRCyA43RdvGT0BhxgjiipAkme3i+qCDmfFOQxZa344PBHduNACryrSAkB9tX1+zwtFiF3dUo94flyVCe67w8nvAQ53oCx0yMs6h1E6qzvBSTZtqr4bayHTJFWAIraIAhv/PVP5/JYlWMU69JAhm71rIy4ECQJGE6VyT4VJ6UNG0tyB1XsYXjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5080.namprd12.prod.outlook.com (2603:10b6:208:30a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sun, 28 Nov
 2021 00:08:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::5897:83b2:a704:7909%8]) with mapi id 15.20.4734.023; Sun, 28 Nov 2021
 00:08:15 +0000
Date: Sat, 27 Nov 2021 20:08:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
Message-ID: <20211128000813.GS4670@nvidia.com>
References: <20211126222700.862407977@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126222700.862407977@linutronix.de>
X-ClientProxiedBy: MN2PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:208:23b::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR11CA0016.namprd11.prod.outlook.com (2603:10b6:208:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Sun, 28 Nov 2021 00:08:14 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mr7jp-003n9O-MC; Sat, 27 Nov 2021 20:08:13 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ccafd9-0d25-48b3-c9df-08d9b2032c60
X-MS-TrafficTypeDiagnostic: BL1PR12MB5080:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5080742C64AE7A468452A1C9C2659@BL1PR12MB5080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MCH67MnKWwoeJ0tJBUuCQtLpOse7q2gKhtHcZ9w4HVT9WLdyV6PDyjjzhRxGHcn1YhsXHnEm38E01Izt9ff6llf8Q3/ZVS3SHbOy1QUg7ZXp5IHSr6m4OiE7Iip6xKIF6BP6fLwGT9b3DbdiSv+JPtjKP6GknFIZP09Cf3qirh9eRARcpKThk4zj8bU7FcG1z6rxPoaNvLiuFGXUyJBSjB9D3VvsAk9gFNDRatiB2lsUu5XrFAFQwKDCXI3ZDPsyncKCILtridE0wmFzwksd59bDSy2IiZfO13XX82Tr/Bygxfl41gHHEEaweudYBMPx9VBvhRRjShfP9I4AlxYrDm1qpl2p3w9lPaZq/aMhJxX4uHcr5PR3La/0TsecikyEZvlAjXHGRt8sraUonrazIKOp1dVQ9omcSvL+gowlW2l37OX+aVgrR9jn5fw3svsbtQ7yZysn1CX9wvmC0Fm0XvfITmM3GrceITHiuXzzRIRnVIV1c/+0ntPNBh20S9GU0spzIBkpgEItTX1eiWgGIF501zcTvDigMeEAYaj1376VEzgzcvICDse+mpfI2wggPhiVYJ8Rg9eZYr/KjN2YRajKKOAKPCStk7LtAKEWfaIB+0+xz2hCmzan8KIWw46Hm6gSJN04AFB19Uvnv0RMHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6916009)(1076003)(36756003)(8676002)(2616005)(2906002)(426003)(9746002)(5660300002)(508600001)(7416002)(83380400001)(9786002)(8936002)(4326008)(33656002)(86362001)(186003)(38100700002)(66556008)(66476007)(26005)(54906003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUZwGTckNFwtDHLpp8y68okFCMHSSqDEP2vmNjrr6VWsoONo5iK+BFLRuK/+?=
 =?us-ascii?Q?zc+UsCbFZfwgHkdDYCBbzdLpod8RhooTjzyuiPFGIU/B9JAx42nsQOURYYF0?=
 =?us-ascii?Q?/7H+3j0qC6XIzfP+CTH8rYFge05Tm9GZKaP2bYd9A+MnFRZCHkzwkxhcen76?=
 =?us-ascii?Q?0rdbS8rmAOzS0NbkdtifZdRszQCFPAwxhyRGrPFUKnfdOzvwHj8j9LxDCXrg?=
 =?us-ascii?Q?6pVWQFZNjb2bLR8DAd0JJK0HQEdDpLBkeGTplFqYpdHV10rFQiSNOMZ1iOa/?=
 =?us-ascii?Q?oPjSlchM4dbFODya1Lb8TwYrpfsE5nr9rqY8CfGPn5YULdvG9iM8EnMZ1obq?=
 =?us-ascii?Q?dk5+6YBl2wcudgAi49Dx4m+1lL1rnHewAxGLL3G0vu1bKBqFCubFDN12yQg8?=
 =?us-ascii?Q?FNvVaueuWrA+qSYKx8edbOuIzsRcNDET0yQHWs/SywnR3iRvOf690ukf8qP/?=
 =?us-ascii?Q?Mm+NUCHkpN9CM4wJX0wgpKbfKbsQzNrf8IfDZ7rIv0MGEg+VtBfAaKPR95KJ?=
 =?us-ascii?Q?lEhk3decDeRZB5Bjs1a2IFq/IhrmSpd/Anf6Q4+UDpJvFCZE4vRQ7QNOZIcw?=
 =?us-ascii?Q?9PqPupphnqEVTXzDRuR+MScsy66X6qDHLUM0omg2xVSWGlyq/JCRKBw6rgyu?=
 =?us-ascii?Q?8sMSL5L4VyHW4P6yZ/iTeb+5FmtEQBaOH3tMaUZz0zbdcLodmfyJ/LYBokmk?=
 =?us-ascii?Q?K2dHFvr19g1Lvpvc4mHrjcUJxzDCdbJNmuk25u/EN2648vfc5IHmkRNOu0/0?=
 =?us-ascii?Q?Fo6yRikSczn+NlItKqDK2aLoY3AysUZ8sG0P4J92yV1g4KRPs8WxulK6htDP?=
 =?us-ascii?Q?zgcQEn+AA8XIe1JGGPTcZSNrcePOPEorVEDIvv1YzY55RvFVzjQUYxId+T0o?=
 =?us-ascii?Q?KAuTccqXq6prZYKFp/7P/ncx9XRAKwchMBu8iux+Goe8mKn742tkuItafklG?=
 =?us-ascii?Q?Z7pyi4d8uvY8Whq4O4L+gdYYd22QxMMSggA+fgiSIVwnmvrCnbCkygYwZBPJ?=
 =?us-ascii?Q?QaqDZjdm9j/me2mASEp7tPHNkasRfGJ0Uf7VEb8C2ixA01TZB2RdeGQwbxnM?=
 =?us-ascii?Q?CaA66SHSrILKwav0Spi2AzIxDo3aul4UKSnTL3K/twUV6S7NsNCTvu/Qko8Y?=
 =?us-ascii?Q?VXgMe6mV82/WeHoKS0S+ssocDdytgZ8G4ZwySJxpKuFtY/IJCql0PKSw3KAG?=
 =?us-ascii?Q?PAmC+eS4YH+lvSiPOdChM+w5ICxWz+in6BGZnGO0JzUrBEBhcH4ufQm3pLkC?=
 =?us-ascii?Q?vkZkobKtuHhO5owViup90DzMJC6jFx+dZMLzivhW7XgkLkpk7Kt+k8csozzv?=
 =?us-ascii?Q?TtB4dlRwnelTePkLTn1AAJ3Lkk5DCtuq+bHwjZ5gfU84NAQvxkhUMNUGnXXC?=
 =?us-ascii?Q?0XgYbp7gPW8MwZvXEWYWYUbanV6lYCrtKD+8gIK4lqt3JUrJJSQCHw8VzZ79?=
 =?us-ascii?Q?Dfp0nf+Qvn24AqVjh/ZC/t0yQ3e0jzoW/BrGYETnMjfp6B0sbVDBwbRasjXw?=
 =?us-ascii?Q?sYmd9E32yVQ5+xW//CLD7cYgUEyPwH5Zukdhk8ZNYyDWrFTftgPmgtyIfcgK?=
 =?us-ascii?Q?/3Z6HeQPURCRkqBr+Rw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ccafd9-0d25-48b3-c9df-08d9b2032c60
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2021 00:08:15.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /J4TPudRgMIfuhU0HwQ/2RR9GYPr9SHY8H5kT0rLiX1UHTG8TZiZUz4yF4x9T+FI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5080
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 27, 2021 at 02:18:34AM +0100, Thomas Gleixner wrote:
> The [PCI] MSI code has gained quite some warts over time. A recent
> discussion unearthed a shortcoming: the lack of support for expanding
> PCI/MSI-X vectors after initialization of MSI-X.
> 
> PCI/MSI-X has no requirement to setup all vectors when MSI-X is enabled in
> the device. The non-used vectors have just to be masked in the vector
> table. For PCI/MSI this is not possible because the number of vectors
> cannot be changed after initialization.
> 
> The PCI/MSI code, but also the core MSI irq domain code are built around
> the assumption that all required vectors are installed at initialization
> time and freed when the device is shut down by the driver.
> 
> Supporting dynamic expansion at least for MSI-X is important for VFIO so
> that the host side interrupts for passthrough devices can be installed on
> demand.
> 
> This is the first part of a large (total 101 patches) series which
> refactors the [PCI]MSI infrastructure to make runtime expansion of MSI-X
> vectors possible. The last part (10 patches) provide this functionality.
> 
> The first part is mostly a cleanup which consolidates code, moves the PCI
> MSI code into a separate directory and splits it up into several parts.
> 
> No functional change intended except for patch 2/N which changes the
> behaviour of pci_get_vector()/affinity() to get rid of the assumption that
> the provided index is the "index" into the descriptor list instead of using
> it as the actual MSI[X] index as seen by the hardware. This would break
> users of sparse allocated MSI-X entries, but non of them use these
> functions.

I don't know all the irqdomain stuff all that well anymore, but I read
through all the patches and only noticed a small spello

[patch 02/22] PCI/MSI: Fix pci_irq_vector()/pci_irq_get_attinity()
                                                         ^^^^ ff

It all seems good, I especially like the splitting of msi.c and
removal of ops..

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
