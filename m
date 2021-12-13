Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78A472F17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 15:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCP0b4dVLz3bmk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 01:24:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bdyG4ZJr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.236.52;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=bdyG4ZJr; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCNzM1Khdz3c5S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 01:23:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuHvCSV5d2vACK8wVjcXijViROigYc/lf7KdVhJgHA95goWmYi8VsqjDAV5CpijW3TzQ1rCO6WRhCx/HWwH2ogWQ/4hM1k+YWEb9YhkMLWrsrnPNJR0XlwKz14hnsifQhiddRYava8iRHq9nvrheUTm/hHQ8hIzgspjVU2lYxpYWagubua6lhNf3Z5H+iOjhmkBT/mwjLzV3JHTpKzLzOkIXlluf1per3yuw7KDAcikoz0Etjul8R+RMJi61Sznvp5aP3eCz0RR58tNfv+CcBV+vjXwx1WVrEDFBl6JSO5Q0fXo6b604Ljpt6m6sm0MxjZtdGuVaQ6hIG3lWR2XipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcvkLSxUrexFwmEl22G3OBeDexHDcm8N7OZdbKxaJBU=;
 b=bYGmqWd5rWbmzk5GH2+er0/GtFfUUIkkB0ajq1T+RmnPTSmHbiTFwGiWSmtxRFFpEVUrdi75YHsDD9LSu3OwHLCoZo8kwvGYXAxFalja+SZT53zqCEidARBpL7Lms++P2XttBEYbpk3Shxh8ZJXknjx5fO9ZjmJ9zsOhqkYVE40uoHPcYBCWdSbfowX0FC8pdiW36L5IylJE7JiFHHT09r3z8m0D3X3j5Ots6DSX1GCfNZlax406oQ5wf5iF/TJinXxKNIfrxTq2HQAbRDykhXG/R6V5HV3VXJo1VpSjB+f49OuZn0Eve673jR39WNI6EqJBUl0Www1bRU7Nm1n0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcvkLSxUrexFwmEl22G3OBeDexHDcm8N7OZdbKxaJBU=;
 b=bdyG4ZJrDwpVcIaTLObgZApxloyne5u3LUVX49qJisqSyuXnykwi8e0c6fGUGgpib8N1aDh8GeNtK8Ph3tHlhNWBrz7oH0CKEeSr86fojY9WNtIQw5PMeDMq9QfvqWmZ8jwlE+wcaRNX4OqO9fFW55Q0sDWBlNBYKRy99szMNRDFKEr6GqR/18aN+u+sPYvRTQr8GBT4rAGg69ZHTzKl0tRRbiyH1+zLk3wtmSVev1VfZBEDvplB+czEXMyjKec+hZgAgY7H4S0PlWGhBxGLg/9jzPsim5+ZymsjTJ9jjMj+k5IOITCUkt8s0NoNZ2YKODUILX6u5aZ1/3llojyMnQ==
Received: from BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13)
 by BL0PR12MB5523.namprd12.prod.outlook.com (2603:10b6:208:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 14:23:23 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 13 Dec
 2021 14:23:22 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 14:23:22 +0000
Date: Mon, 13 Dec 2021 10:23:19 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 27/35] PCI/MSI: Use __msi_get_virq() in pci_get_vector()
Message-ID: <20211213142319.GC6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.841243231@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221814.841243231@linutronix.de>
X-ClientProxiedBy: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9113e18-d38a-4d89-55f4-08d9be441e0c
X-MS-TrafficTypeDiagnostic: BL1PR12MB5143:EE_|BL0PR12MB5523:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB51437D808E60C0DC80DDBDFAC2749@BL1PR12MB5143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiIReGv5ViTNmRUm3GWfQ/6oexO3oFbF+wAE1ske0bIY++8NRNVljaR7Rq0Q4tbhfzIIasTrhjolWthJ34jxaeOIER20SV+dC/JFs29fWOCK+ElO3foLNTacI9c4bsf9d3MdJ+KlbcUDObQHmZb5AU4r2K176/MH6nX7Xnb0pLtUdwIE5JjRV8n7TnZQQ5WOG8/uQQw3BAi110uk3/C+xo/iiBFmF1QchF+HzWMmsoNdR2LfepBjJKp1Nl+b0cOy0UsuJjgJ7Yd0tceNaLPmlwfN6k3vbzlhWdv54a/amVjl1zr9/WPxPFnZKsP82k4Q9KAwtE2TbWh8SABMvL9lKLmDshSwTNgpCXKDqq8ywPg1LibnpvYvmi3ckcruevZJqpTx2IrObzQ8+v9GWZM8up8Xb9+UcqPgz62cyZMJmqED5rWICLH/3FP1i46qkIOh7B61WvGRnP7pm7RqT/gf1RyPrp5EQxXn5If8w1/tkhQHERq+GKP7GldFRzzYfwb42gNR2RVF13z5mTmg64aaWBDMWX5XqZT5AXbPb4MVPfx7sVlGqhQAg/A9NIKyWAxfCkScJgSIlUrqoJknaXgVRpbtrWsHb6FdGBEPNUmy4e545pqzTIPbI3OaMH7GQJIk8qkFQGzF9PFNxAHzwdWIpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5143.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(8676002)(8936002)(54906003)(2616005)(186003)(6486002)(6512007)(83380400001)(316002)(7406005)(7416002)(66556008)(6666004)(6916009)(26005)(4744005)(38100700002)(66476007)(4326008)(508600001)(66946007)(5660300002)(33656002)(36756003)(1076003)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UdZTbKneE6nGhVTOfihQqiTo1Qt4/yNIfP6Lj5FtBtkuj97TWidSSaO4TLxr?=
 =?us-ascii?Q?bu4POC9xFVAX8UBm9mdW05nSbiy7F4ZhivLsX/eweXPVBe39pfIWuYdk3Vsc?=
 =?us-ascii?Q?v0yrCcknH34HzUGsvF5h1HTCBHgWK/zaC4evj+WNWRI8g44zx/ibqMOmh2cb?=
 =?us-ascii?Q?EsER9bQgPEZdLJKGisWmuADjVT51meMdyX1B1ykqBv3krcJxaJeEGwfPYoOW?=
 =?us-ascii?Q?bxaI1swyppyF51HoxXo6jWc/ArXumWJxPl6xKVescIn5+rp0lTcg9exmDNb/?=
 =?us-ascii?Q?i22cu+3qTPml5EyxBol1LdYZFv5tErJ9+HM2lqysZei+2oCuhkOGp9VuHIfH?=
 =?us-ascii?Q?qUrKEbeN6wA8L37nUeytPUOW4DCPXvVruqn7Bxr0biAiJcA27aWIW1xeaj3A?=
 =?us-ascii?Q?VqBEcTs/lPiilABweeZWiQ1Sez/9gl/64Bbfc5xBLxNr9j8uEQGguACin8iP?=
 =?us-ascii?Q?WGAEjM/vOclCHNY8bq3ObcG6GRLvhW7jtb+2uYJVPYoWhvSzzA0z411PSFBL?=
 =?us-ascii?Q?qDfiTupTvFIZT5Y34vQYeqQ4SmbczYDysFOf929KCHHobmLoQ8BFwIMX+Hb4?=
 =?us-ascii?Q?WNZMPWC++yrHsfZxoMGJFXjCK4b3PoCtb6VlrB4NP38XxojEoLpLiLf5sRD4?=
 =?us-ascii?Q?dEHsa+0pCbz8gOzO63M9QEMvkyLozYkZjVhBJNQ0QktfJBQxiD6CC4BC1PNf?=
 =?us-ascii?Q?nmMhcxXdtTtySEbHsGAL3caVmBmg4vqioyhWLE6/Pv/dvDvjkTlBhXXHCtPP?=
 =?us-ascii?Q?itZUmhtIGzsgSLaNAxmdZyKCuyZ/NbaWK6phedCjfo1/ztIH+NitdwgB+A5T?=
 =?us-ascii?Q?+qKnbcvex4TIcCtaG/zzDBAGQT6gOvwEq4eLKj2J87Dm03QZKnIfIgcWip5F?=
 =?us-ascii?Q?KsUVIVWDSZZCyoOusUDo5NR9n86PgGpB/GWZX8IarGKmUaG73577JTGuWT8+?=
 =?us-ascii?Q?PPwg1M7LWnVIBJernM9U6ZcUvAaeKp3Hszh0ZANacC9fLjyDyhxHrlSkX5/1?=
 =?us-ascii?Q?CtSdpqXTFFqkqmqTBm8S+m47L0PumiedW0tCcAeyo2BJQIaC9kiL3dsmnwEd?=
 =?us-ascii?Q?Z7Cfy+y0qEK0d5dHMIOqatHqWZjpJcFoMyha4qgc6pDuRIi3uZVQi6wwSJdb?=
 =?us-ascii?Q?c641Backr6RtQgg9DmFVTikvzqA1M2APqN3XCaCdfIaS0SVrQFNonXjMfoN1?=
 =?us-ascii?Q?mIZgYmeMEpxE/vksb8SoDiKy1TxfLMAPFldGYLna3SjDvz0TGqmf+BIhI1ZF?=
 =?us-ascii?Q?3PGmjQ5ZQN8ZQxCGLg4X3K2Vtx0+ezehOv3mQ9QV7jluiuuNNx7unZdGZDY/?=
 =?us-ascii?Q?27J8tGwy6lvtDMlORg14xso4hdE/uwAEbHQaYIgFJXvwDQMh8UFfytTB9up2?=
 =?us-ascii?Q?Alsa2UsvMel5kUDx/mgZBJRXqgxhuT0Oq4DPCDSk7ux+gt0ye2YUTJjqCVzC?=
 =?us-ascii?Q?DrBLTQHsDblBEmErZ0uskud4gqc97I3MLeh5QJhIPrq4OW2MvME/HxT5HbNP?=
 =?us-ascii?Q?h9UP+2vEJLOpgcOkSNcRQ5eiBZllrVbPOG9IrzVzzfPBCTS5zXVZOxxzqzA2?=
 =?us-ascii?Q?zfzIVl0PQTpLwbNQl1M=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9113e18-d38a-4d89-55f4-08d9be441e0c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 14:23:22.2701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/ECntS8fh8ZLrZFpJFupHNoZTpVITuBmuPCq8r5VPOP+PA6J6entj0tG44juQHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5523
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

On Fri, Dec 10, 2021 at 11:19:25PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Use msi_get_vector() and handle the return value to be compatible.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> V2: Handle the INTx case directly instead of trying to be overly smart - Marc
> ---
>  drivers/pci/msi/msi.c |   25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
