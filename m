Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F009472E47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 14:57:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCNPN41bjz306R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 00:57:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fG7MXliX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.243.67;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=fG7MXliX; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCNNb5jxRz2xrq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 00:57:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld0rKPw9tZPYs+r5G5TLA01uesOR88gj2HAnb/t5zkqUQnn6jp55UspIoHbKi0uZy+uR1Eg2qcDCMab8Rg9l/TyMLKna9DV9nBYURnB7K/dAw24dvrSfRlLbYciXuZ+8nnJJbEkO6H3mT90vwi665TM8QGcWBfndPXyapWyrNKKrK+382gC4/jicTa543Pv3dYTAJQ3Lxzoxeev3fPZjXQvb5IY8VmIBc0DjZ2J6jzu/g9A+b4XcVmkglRrLH16S3XD8C6/SnN4XbZI+jihNlrvX1If5Q+vr5oLRyKGE9jRTrDACcydm62bNsp847slknE/mDTt8r6NbaUfK4VFpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSehdxNdqx2MtdTA5M2MuLCrmulXs0XzDuCUokkinNU=;
 b=a4zg3vKC450qGa4mfBief73BxT9SuQT7Vh1wPY6pVmCruTw4eDhOauiLidEcAeDpQfk9OZTE5o1Sic9kjCmlHvkVbzMYSA4NFV38VaRCLE725lSMEhIvoy6QzryCryIRKCc7E226eCl0BQYjSs8q72OAzzN7mnLV2HUx3ygGOhqdmy8BCGJQhzOjIbBFi3ICWBuBzpd13PJOUXgb6CWSglcjWF70mHZ08IRppCh2aNB5Q9rDvHqOenuErlBvaeOoYzMThXwIw2frjRnwg174WwqOM2uSqlTUw4RDO5pRf7lvfw4BXI/X85uzi0KAZ7xayebF5ASN/CYPbUPy77btLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSehdxNdqx2MtdTA5M2MuLCrmulXs0XzDuCUokkinNU=;
 b=fG7MXliXzDVYX0utMHDNe3vk4oW2wFzYpuFQiOeT3Ik5Fwg4hDxiZjCnAVdtkvNZY0pgVlAXmZWITzV/u9HICTDAIOqMxLHfivRkjt1RQdF/Rb7vV1sfjMEDuIv5KfMAOJWLjbH/tW3AEd6ct37nZiXBadl/p1C/Ju/9D+qt8iPHq8J7D4lfSVaAImtFdKb4qV7rO4coWkmN0ze8ybsLlnolEJZAFKdS2FcamAzm6+uqgIPWWx9L9CI+CIBPZTcCMWIlYWP6/5s8hsnEHwFzCC6xnLILBci0hf5CN6IuNmAZfmqOJ9FSbppM+cBmS9J4gHcWkNjPB9ct4X6CgMoW0Q==
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Mon, 13 Dec
 2021 13:56:42 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Mon, 13 Dec
 2021 13:56:41 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d8be:e4e4:ce53:6d11%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 13:56:41 +0000
Date: Mon, 13 Dec 2021 09:56:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 02/35] x86/pci/XEN: Use PCI device property
Message-ID: <20211213135639.GV6385@nvidia.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.311410967@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221813.311410967@linutronix.de>
X-ClientProxiedBy: CH2PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:610:4d::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c4b2b35-d962-406d-512d-08d9be4063bf
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BL0PR12MB5554:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB53209226BB84D421DB84A8B1C2749@BL1PR12MB5320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWe4RjLZTwtKiNuP5MtIWhuAZ3/8aNzaaj2HyHnRf5fS/YcJG7gxWQswTyNylLStRxShl/pH5ign1QSirSmXkVpAFO3aTVEYRovDoOtA4L+o3PCNOgxryhdvr8+c4NddB8uGCUgDQAxq5wUVxvy2+KWIMIXZdPoDDEINj8LLaEa9kJo/mSRV3mdIDBszhuGtvE8FsYVUUlrOgYSEBTuu4y2l+m/zS7sufoSBJjSwcmSyuMr+7eQBKyvQj5ZQCWfFdCEFl7hVahLhfqa/9G6ulafc0R3fJjpWQ7xzNfcXIO8DeG7mGTaT/JVKvbEtxT4oAAGTDbBCNlswu88U/8cUkGsnKt91vlcSpK+iC6Z43zX3PXEW7MWqIgyjTB8GgmgUPAdaiXXQEGNfUx07RpN+Adi10jZBf37OJJUncb+wxhb2nUmblU5hXJT+iVjisyCx9LywMDW0oy6g9Pg7VnHYsyi1e9OMWofgsVJXWxGatrF5WtnvpINVpyTh7HtEOYfo4sUrQmCVUslJZBqeQmDS3UGe8Gp1IxY7sGSNFFXkkE28LxtXtN7gpWYo0NdDG1YxxMPj+5WobMnGBh6cfmV4ijgwAlKrKa/+LCyS8KObm7U73joX6OfLFr9L0QDRku02uIWPJSnULqjZFj0XoUi6tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5320.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(26005)(2616005)(6486002)(7406005)(508600001)(36756003)(83380400001)(6916009)(6512007)(316002)(5660300002)(66556008)(4326008)(4744005)(66946007)(86362001)(186003)(66476007)(54906003)(8936002)(8676002)(2906002)(33656002)(1076003)(6506007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1n4rmLls89NyHwVi0ELhP/iPBMAGLXsM1ys+DCZUiO88alDNgg8f7iYYuiLW?=
 =?us-ascii?Q?T29FweIozJyVVizS6BS1+cdznNiM+d2pzAfORA2tKNa/W3Cf5g2Z0IYCKYb7?=
 =?us-ascii?Q?768e7ZAdx36XW68AAlkkp1l96G0Jnmh8UexCSb12UJZEsjomfs2tZ8wa7bWL?=
 =?us-ascii?Q?JO5yYnRqngI6tB1E42+ttAfL57jiGOE7++mycEeW40XEl2wiM1C9VDKpuukW?=
 =?us-ascii?Q?wiAdhdKJ95FzvtHRiWdAtDfnCU3XVM9QwlHTl4szBxANi2HTP5YPJzFsrgd2?=
 =?us-ascii?Q?81KfLRQAUEXI7F51Q6sJ2nPRaPdYFymjL31Ge/OaeOz5riuuofa7EwjjacmP?=
 =?us-ascii?Q?FtGuE8cWgr0fz7MXg/mLAsx3DCb3Z3ZkSj3sE28yfjccnmuT86qcKn/et7AC?=
 =?us-ascii?Q?R2fIiOJHf+z/9sNxeAwZsj6sGQ4x22NUO+Mr1rA0Fsvk+S2mr/XCiaNHwKWs?=
 =?us-ascii?Q?vfrYsO90QauqY9t3YZ2H3e2vCRyMF+fwmuiVq0GDOD9t+6UsA5hRbNsbz8TM?=
 =?us-ascii?Q?vv4GKTqKX5Itnx4nE1BuicBNMOsAE6qwE6T8b/2gM5rNqH8Pdv3jg2K/IcMA?=
 =?us-ascii?Q?cdO9eEIX2A2VvpipD+j3VfPG1LuG3CjilxH9cqEyCXrMJ4aGmThvHq0I/kxb?=
 =?us-ascii?Q?BvMDVDKmd+mv7WTuQvLJpyJMYIrA/Tet0ZbMPTd6x//fw+JvghgSKzjqDegz?=
 =?us-ascii?Q?FA0gF7OTI73fUU+J+YlghirK0UFDvwnSmjkEm2zs4nd4mPjdoR6dxVE2q531?=
 =?us-ascii?Q?ScubPtVV9Uvr17xetzr1VaEenSOf6y1+m5BI5ZWYg5QUQ7Et16TMoev4ORxY?=
 =?us-ascii?Q?M19L1xYlqFOIrJ5dv7jVcCbg8shAmr5xrF7iW88Hpwi5PWQhZMAMkWXcgtRy?=
 =?us-ascii?Q?1jbBVNEBIkohBF3tkVX64cDX/MmhYZLUI+RMw2lV1KTDCUzKvWZH0ifUrgq7?=
 =?us-ascii?Q?KosV10xWOHp7M6BeNUcDbIQ89uc6YkZl3sk0bI/3kkUkKI10lxmlY6xuliEb?=
 =?us-ascii?Q?sHrvp+ie1sJp3mFetdGYiBcl7aywpVVk0h7D22Nah9K40v4BeMfMa6U2iRSb?=
 =?us-ascii?Q?ykdjlN7zsnoEjxDVT1zl24kq9ZbcyizQOh7TmJYezdtQbpR4OqmJalQXHwak?=
 =?us-ascii?Q?ia2X64lMS9Q4J7NDTx+7JhGRCfQqPLTgXABdEbyptjBEceZBoTTZOvK/vr8U?=
 =?us-ascii?Q?xg6EHCH/DYOiWEG0L9ojOpAZbPEZhnB8fIsC6LsFzlERXjCvccUPbLAV9s1M?=
 =?us-ascii?Q?W1OtX8gyKUxPyVYjP2paNeG8SRCuK30NXHVtyfJXN47+zy4j6PdcO0f8cV7f?=
 =?us-ascii?Q?fm2ULMWMPq2BYEBGRc9/RttRzX0yTOilyj+/nufS9nnaEN+ZQztapDbB8IAb?=
 =?us-ascii?Q?MQFBUIVwg1bF3r+iDP3tMHmM3aQOPWdL4hGhaaZVyFunYe2auhiC3L+84NC9?=
 =?us-ascii?Q?DyJ0IE5og7lTca4IIU+QSVqDp1z1utOIc0+w9OdQYra16cjV5+3PinfaWfCL?=
 =?us-ascii?Q?099c9Y7wnj6ii++Mi1cHarMyliG9jrHPZrzoXJgtodVssmAZwMgY3WaqtGa1?=
 =?us-ascii?Q?kcoZ6ygcR2W59BZElnY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4b2b35-d962-406d-512d-08d9be4063bf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:56:41.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbwMOLVX2pyNkKO7Ti7Ng69tK3CWicOz9MbSuKwTf2fh8sS0f7ikzwXSdnGFz6NS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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

On Fri, Dec 10, 2021 at 11:18:46PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> instead of fiddling with MSI descriptors.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: xen-devel@lists.xenproject.org
> ---
> V3: Use pci_dev->msix_enabled.
> ---
>  arch/x86/pci/xen.c |    9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
