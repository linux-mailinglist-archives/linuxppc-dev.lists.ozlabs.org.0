Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344662C71E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 19:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9pY2yjSz3fMR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 05:01:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tcdUUSQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::61c; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tcdUUSQU;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9mS6pd4z3f79
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:59:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLfofxA5Y/wNq9X1DR/71Zo+vC1uw6z/ki909S5tyu4aI9eDoblqOoysjb7+ZgG/ZLOPsrLHL0hPJu8hFtF8RAxyUB6SSmLdlgsU4jyCJ2lGwnNm8o32h42l//sd34PZS042nPEcYmGFX1GTuUQnpt12rEUBrQvLhcteMbuzMpeDsxMSzZz4H9M+dUVTJkJZz8cBBVD7U4LoRKvft3kizrweq5L35rUfHUP8StMY4aHSLxtn6bGOdm2rZPZFwqbl3LbOA07ohKwJMvKFbD5cNKjetERY+NK0vuHHJoXnkOYN2IPmerjtKW6FnWD/dkUtylV08DGhKFdBtWJSWoKUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jlEI7V1vKaKxjGEDU167hOkEi0qq0doyZ8uSYLk6EM=;
 b=Qo3TstHIpNtjD4U7N6ghJeE24fV6zo2XWquUWnTgt3Qn5WQBa+4JRaqf5YxbcPO8CozQ2sRuuP80VWf0xdl5uXCignxKpPJ1pOOTrEqx6T6kwmW0iwCM/sYef5sGD1tFw2SIG+lgfe7wBGx8Cge2aO0AQnZEeTaWxO5YdkD9i6Wy7ax26caoXhgPoY29V11iqFkxZ52usH1EeD5S/klpccCsbF1TnI8DuxnPCWziJaK99Cad+QpFp0LpZztAw5TpYRc3+lqCr0jTSwX70+KYgkmjrSVsFWx+LTFJsdZtMlCINsIQClKJgMid08cXHRcV0+N+BVJEYp9zlTpGW387Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jlEI7V1vKaKxjGEDU167hOkEi0qq0doyZ8uSYLk6EM=;
 b=tcdUUSQUGwS8VWFzKQAYbZ5Aw6SL3jQ3r+7VrSePTNNgHzigT1zRWrTki7CGNduB7preWmx3l0XVWkbHpFhJYtHqxPirFO5OJiMMupBN6BJnOf+a9CZbVXl21ikIChx/JXg5bvrZupKKOBYitNlQ+XYFhcxkOId+LVUP6GpkGGxiqfIJQR9YqxPCYyrTOlAgeLj041ynsvEt9NY44Nccl5p8MeMrHg716lP0I81cl5s+sbF6tGMz4GKUds64PpM4OtgB/lNNmiIbpl9YexLNtQBf/YDuLsMRWdkuU2PiZ4XLXNVICLqJ6+5IkVHcnQM+S5l0c96sPxghThq3ZLWitA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:59:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:59:16 +0000
Date: Wed, 16 Nov 2022 13:59:14 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 34/39] PCI/MSI: Reject multi-MSI early
Message-ID: <Y3Uk8lKAgKU5a63r@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.574339988@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.574339988@linutronix.de>
X-ClientProxiedBy: CH2PR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:610:60::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 1362aa48-e76e-49fb-deff-08dac7fc46bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CiAIhL+4qFjO+Q5lmXcdExkcfM4RJaldCDYfbheGyPA/SlqNux1+OsIrUNT0YvugWzVb/2QtLzirOr2eH1/6/YLmgsDG1lm8SQHrgUo5GzIBA6yuRZjvGqqKqHNAfWQJ9+W9tM11er0ct7r8elyNh7KeffvpMFISKpIvP2cfhoXGTSLcfaXEtBRpP2vJYa62OeS9WotgrImo4MMTE7cC1Q7mCHKIvD7QFYwozkMsQet6ZMAMKOlwWRx+qIJKML7HtJxuzu3azSv2qzSHvao/MmzbgTHV6uMFoYYIQv4CuOvXXfwkSLLEYZjv+FNJs4BoB4cWYDbbgeVzS2gPEMwfBPBXoSEMJCgbX1uVZdxERu9AxhXgw4402XMvDXkOsBq+bx4nHBy9lzT1M2sFObyxPOfk/lm4xbMyUpp52ALmlokhtDUzHkEQQbr57Kls2/Zt6a1+vIrIxOKnXx3KOumYGz0ionsMW1yilUXzg0ZQ8hQyEYlxQP2OoZfxEz0KG1sf4qc5m/7KXcXeWA2JJsOy7pkJQOY1AS9IEX1LynFTuNQStaBwiuhop2qJP5cx3XrQhOkXi//accK2eprDbI1Vd7h5e+zJv7p13gX00X5vOEhCfuVM1YRv1eXDob6FxNycq7SNehkKb3ZkM57d9MPq6jsuH4g7PndDEbjOSl3WGGN+T1f3X7TITwx2bbP41hrYktfvfSvaAR+YS8WUb0/STA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(7416002)(8936002)(36756003)(66556008)(4326008)(83380400001)(86362001)(66476007)(6916009)(54906003)(316002)(66946007)(8676002)(2906002)(41300700001)(38100700002)(2616005)(186003)(6506007)(5660300002)(6512007)(26005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Q8WbrBikBT5AL9xNxcRJz7EnatzFzk/CVlf8RwOwtnwrfzaLkiShDU4t8tKV?=
 =?us-ascii?Q?d+5wVo5azOnaWL9PChOHE+XgLEdR8qlBConAPDwEhW3+Qn8proMt0torPgab?=
 =?us-ascii?Q?2NQXsPq941Qt1HpXHam16pp5anNRAhujQQmKUWejOzrAKELDi73+XhVbl/JY?=
 =?us-ascii?Q?BeDedAqAAzZQ2qhvmFXZW7V2/DpiyiZoYftBeE7Btm0EUhBI8Uus4tn/yvW0?=
 =?us-ascii?Q?FQfAdu9Hy4U37F7siXSozbMYmvC2FLJADX/W/bEr6qYbm4Ujj6qM/mFvrSZw?=
 =?us-ascii?Q?OYg5QaEzgyQDW4ybJbkykoGtDlwuguMc2qBpRLbh+t0PawNmeAyG6/FRthUf?=
 =?us-ascii?Q?ZN5FSuy7gwVds/y0eKq+mRIFn5oFpPlByUjuN7gTjw5DtNhceqneG/vJEkz6?=
 =?us-ascii?Q?60BVZa3Emw1QqmzDClMHOBH24d5g3NGZOVLmBJJP6LB2mWb/+TNJpC0FuA+7?=
 =?us-ascii?Q?Xe8ql5eAy3GLcqaOntZnxy5Cf3amcTwNbj7FSrgWCdhQ6HtL5j+zZDhQTA2g?=
 =?us-ascii?Q?dtEOoRX4Qo/vA2dtR0Hdi0Oz4+IqSUV7d1m/D0I11t4Cbu2rtONXjDedW1Zq?=
 =?us-ascii?Q?ujbMgqJvAD0wO9X7okfVVIt2afiCQ+ZFaNcUBsMYXAjimE/GdMeYwU7tEKnC?=
 =?us-ascii?Q?uInuwP2kaCby4xXA9N/8nNDmuBN6TISK17XHwIAACLSlbz3pL6Oa6sA2OlXs?=
 =?us-ascii?Q?I9TqA5Msay4lo+8mU1WTIWomu2zt+f1XP+6oRzY3x4Q500w54jtLYDhsz1X7?=
 =?us-ascii?Q?Sn21XwdWxjj08IPtOVRb9SS7cUpbkzQbZkALiWNwOVLoLGSiOxP2lQhhKmsl?=
 =?us-ascii?Q?PHDp8XuEGjvuDRvgNR0em5E1SomVwRLWHz6SOKiR4zfWTZaDW0Fpp7fu2SAd?=
 =?us-ascii?Q?OTEdK5fD/A2bzaSjNmLb5xAipf1ymKbseAmhdtoZo6Uy17DEVu0jIm7LbpOI?=
 =?us-ascii?Q?oDGD1w7XHK0k5Rife+E5tCnRQZpaS/qjHnyBe+fghEqRa3IFk8bYiMtNQK8W?=
 =?us-ascii?Q?meuNErT1FRSNE20Y68wvd/7IWURpPXwPlK8B5PU0D6tV/wGCBugV9JmUdquE?=
 =?us-ascii?Q?pDYEbTLOlMb2W/FFsOgL8fRlQKQ6YmCkd7XSoYlf5jnzQmwaFO/lCSrHkydL?=
 =?us-ascii?Q?FI3pBHbHz2XoZIvg6cW7N1D5bpqVYsPH1CoGZVTU6n5qlEKWpVM60ee3mxCo?=
 =?us-ascii?Q?0QCoH96MUEdF0Kt03nmzYWjJ/IeCHB6BvxrETRUKHDuhgjpK4+IR8YwdZ3IF?=
 =?us-ascii?Q?3VxkhOMu+wjXTtsGxBWL60fiE/myOHHL4GjWHVSJlvWtihUKfEuB5vM9RMp2?=
 =?us-ascii?Q?AS9XWDGI5MApOrJ6hoEI1p6Dh0BU5GElQUE8Z5Mye1l3GDTra4msqiWA5wX5?=
 =?us-ascii?Q?EcelHZ99Pdkm/fTkrtg0eJU4JysEpvG+TC6f1mTVf0pRw1R1BcY7Adpuv5IE?=
 =?us-ascii?Q?PqZSprMaeQfsBvi2dB+27vscc1uR+AN9D03i8E37v1ycAvlrYX6dr6nwmwXu?=
 =?us-ascii?Q?rb4xp4ZkqYGpTsDLR+rzy+fSHFemAgLwwe+NYB/VfZpgCk2eb+7sQAn/qER5?=
 =?us-ascii?Q?PoniroIK7HX/qsRC0YDVg78tmkva1AfDDLomdvq0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1362aa48-e76e-49fb-deff-08dac7fc46bf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:59:16.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqHzwiph/bKdLpxpi/hxBDnDwZuFTn0dnXMZ5sPfbZSF+SKH4rIgrN5RTNpPd+H1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526
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

On Fri, Nov 11, 2022 at 02:55:09PM +0100, Thomas Gleixner wrote:
> When hierarchical MSI interrupt domains are enabled then there is no point
> to do tons of work and detect the missing support for multi-MSI late in the
> allocation path.
> 
> Just query the domain feature flags right away. The query function is going
> to be used for other purposes later and has a mode argument which influences
> the result:
> 
>   ALLOW_LEGACY returns true when:
>      - there is no irq domain attached (legacy support)
>      - there is a irq domain attached which has the feature flag set
> 
>   DENY_LEGACY returns only true when:
>      - there is a irq domain attached which has the feature flag set
> 
> This allows to use the function universally without ifdeffery in the
> calling code.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/pci/msi/irqdomain.c |   22 ++++++++++++++++++++++
>  drivers/pci/msi/msi.c       |    4 ++++
>  drivers/pci/msi/msi.h       |    9 +++++++++
>  3 files changed, 35 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
