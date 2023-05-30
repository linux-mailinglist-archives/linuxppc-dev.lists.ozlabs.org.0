Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41208716272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVttx6G8Dz3f59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 23:45:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tWREuisK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::628; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tWREuisK;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVtt61pkbz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 23:44:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1zKEXncla4vbra6FGkW0n922BTzfd/s9v4Gkbockq4E2pudJMAO0XmVRDDAI+8U2Q5Q4AM3dmvcZEbeTraKamYvKMH3FxCdOFlVRuDvZ+KxfNtuJpHGeG3n675/jMinvjHmFTo7LKfYWHiuXAu645XPEzdumk4Voxhu/EZlVSDmHN+vjh6opPvi9C4oMB/G9AWSiyiDbEMPpNZpqAPYZk7ezS8R0uMt71eVb2I0Nt+HXul+ffKZ3FAaLU0bcqnJwjVflvqkpPoY9IQYjo/uy2frGSR5CTdZQtZSpR3bBDYHFi9Ny759xAMqNRZq/Dy1LI84HRHjck0TCJCNl/S+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq8YNJXz3s5Y79U2O4LJkmvh6OM6+fxFkVQ/2j/88SA=;
 b=VxmuLOiNSaiE5x4HJAnWbMEcPQdNUk753CTgq6vx+fLKf7EsHHyOnAqyiv8mdB8iF1QZF0Ol4jHhVcKpWhcjAL53TnE3L76orBSkD7lVNSFd7iI+Tmph0/dRF5DhK/kCgPq7seho74WMHK+jfE+P8EVkDHh+8Dw2LK3htEpAEcdzJ5V8Mu3gn66m27HFuoxCttPPYJP6CLlPWKADaY+p2DjRRAdZ6nDo70ehNBr8vftUr0bACbH6o9Eqzmewt6gnnAjG0bmW9+Kw4QHkS48R2hAfV7Gsfkywwlt2A/Of4Dx5An27omrn1e0PwRsfsdsqMbBMJH07MlPaIp0oBivLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq8YNJXz3s5Y79U2O4LJkmvh6OM6+fxFkVQ/2j/88SA=;
 b=tWREuisKW89GpxZ+V4jwp07uIWnaEyRCXNqyXNq2bPNM0WNWvpHn3pTV/FaEYEMoSjQ5z6seSfbcWWGl1vd7dfCh26VoiLB3PcH3GSjKxho1CjN/sG4ENUXIuKh1cd1SdyZmvrMCUTCJUuFyv37o1oMIB//zIW6o/YxcChyXwzzmW97SBkezorsnASu3oMVBY9l4ZwxF0VzGnIxbnjwpWv2sJTjpjw3zFR3G0KCQDaEMMHpNeKSmlixrzE9BpmYVu2RWLcKJF9diOY1i7AfDvux+ivwkmseOhm9sc1VPswgJqbtnsVFU3E6OXi4CfBfRHPMbHt0xHa4eaDTolle0QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 13:44:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.017; Tue, 30 May 2023
 13:44:01 +0000
Date: Tue, 30 May 2023 10:43:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
Message-ID: <ZHX9nu234ehZWVwU@nvidia.com>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
 <ZGxcmJ3vH0Smqqxu@8bytes.org>
 <ZHP1zv48iZUV5Ypj@nvidia.com>
 <87leh658ly.fsf@mail.lhotse>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leh658ly.fsf@mail.lhotse>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 266dc400-3a9f-4360-18e2-08db6113ed00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CtRzYz5WNz3M8sQYpmQf2KqpTBdqc4IbuoSqDKOT3gCdgglLpSMVm2n+Ro2++rxZSU52kDl8qMFf/9kHEQOZEEaV5OhKUXDxYOjoasZGxOpRRc+f17pV2jgveD0MgnfcBBsOXLsXymSg1L4/S6jBCZBIeVjZMX+h/31z8AtCWQZTuwo2s3trpo/tA72OjBdsUK8K8Qco7TwzSGiNknv7zlbR7dbcEKOKcF2fL74vkYEtV+W/LpCtp8wcYzmumL0zPwgqzPtMwmGlaifpATmhke88S0XpbvR908qr8q8HUp3duvtnSuiMV56fRZzzZXmLMbR/cqzoC+sM9Z825OVRonpnwaW2i1d56OzcIkk6QK3qF4pv226D83IkU1GqjYG0m9eKashl2JqlzvjOZOBCFPqya2KpY5yTIKZpA7HwZOP52oQqaFt07IMwg3J3JhFaEh6Ayhu3ShGERxybwLSaeRTQXmWMY0WbOXxL9iEYw/k+DiLsQkkDgNHq52bvOpb3JcodXKjNWg6gmSKmLFMvbXTb7JhEmz3bo/YYF8tgUErjdERt4dY7k4+JKcMSvrRRZUtsU0sioecjVBpaVmoyGfkWZd5WuisbGbUlGaVCGAI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(38100700002)(478600001)(86362001)(66946007)(83380400001)(2616005)(66556008)(66476007)(54906003)(6916009)(4326008)(2906002)(6666004)(6486002)(186003)(26005)(316002)(6512007)(6506007)(41300700001)(36756003)(5660300002)(8936002)(966005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?K6f/vDy9siBqx2U7wkW3VddTdbviAOO/QTcukFSJPOWn0XwR+cB2f3usc0ca?=
 =?us-ascii?Q?e2uvHPgS3Blns+l1MZHDN4QZtXVELdiXtRUVTKbZD9cOx3VfQzHsjEyN+vUZ?=
 =?us-ascii?Q?N3ltrBu9eFAUJXQy1GGp/mcGUXfFkwrs7yPk5whvOuveTFi3dKqRML2kkiCj?=
 =?us-ascii?Q?OsNw8Y83gvtR6tNbwdeyb8yYyQ44MmyeZjywgNjtik9fkQU8zo8UyIpAW5Wk?=
 =?us-ascii?Q?C1Z0fE46ABaIB5vEukCl+Yzxsk2BbosUfdI6m3gZpURqjUgHn3dSJ/+A8/jZ?=
 =?us-ascii?Q?/eELDbPtPNMhgnKs6ddLXK6aTvLpAAgg9QHD0VyjxEPUE9bINQJCO3YmeyIR?=
 =?us-ascii?Q?fU6cgysdMxuxCplwHZVD/cm91BheuoA3aukW7vBXSuf5pyTvrTeaLWmzzjvL?=
 =?us-ascii?Q?M0gV8D7NLuZGohyMdxgG2nfHYzFQrUFx6pyzAQMS77VTttvy8pN3UPp0FoJD?=
 =?us-ascii?Q?jErrbI3gvYialpCfYvc/w35RG9vdaPv7srxqW09g0YZsjGTLCR4brz7SwHcv?=
 =?us-ascii?Q?6thsS3Kci/Mqcg0JcXnik+p32VeCm536OUcrrIe4vrwGebixm94lVL0nOzS+?=
 =?us-ascii?Q?Z1NEJD+vCC8+8bjWWMjjuYVe0Yk5P8dtYIVTkqkFXBr9u0ep99ozmFEDsEni?=
 =?us-ascii?Q?W8kcBt6QlUjYRbq0/JbHl9fZx6+mz1BRCtWNUMhvzVmSU2r8WudhpKWfCTZJ?=
 =?us-ascii?Q?oXB6tzcHKtXhSa+MCMa93AtTbqyU0cwawF7IPNNobedrHXOMWJQf9lfxnNbl?=
 =?us-ascii?Q?uIeF9QiocgiGzW+iHm/HnaEySZGlGmagMWj7LkUXzob69+CKc921Cbl4PrQ4?=
 =?us-ascii?Q?wTibnBxEIbC3kQSoLfN4PMQboaF9DqwAeXkh34/vGEUm+tjmgASYjDf6GJdi?=
 =?us-ascii?Q?UQUQUfOGhSSpJF9XCaPLe0ZTNht4tKFS+V/KpPo02KhFCMGgT3Tkl2in1Ge/?=
 =?us-ascii?Q?dBm8WqaFCz/jX9nHlxN7rzgsubsDqB0HIGHlahT+W/pYTpUL0cwNEm/TMzTF?=
 =?us-ascii?Q?7MbQ9LSS7GzK4cNLMcOQn8QSbg7LbpplBbSQstc8bkr+a9is08dWS17hOaN4?=
 =?us-ascii?Q?bNZoqqB+FWptETbSFQjjKxqLtYeU7LdgSRBoHK1tlLBECnzW2G8OK89pcbMU?=
 =?us-ascii?Q?+w+uJyc7UsLtknb0nGu7I+dx2pRlVt88soITLdcD2eBgwfBerYjVLg6d8k9j?=
 =?us-ascii?Q?Lzyw5tJ9kYyiAjxmeNfNZ+zsILd9cBgoA3vTksa79NbzAqOF9RGIvfJ8DOhh?=
 =?us-ascii?Q?MKWVhNB7xGhFcImRHoAkRHY+M64LwHj/Hjz8Ks7oYuxj9TFHFIIdlx+Xn3pE?=
 =?us-ascii?Q?b6IESA9DAJjRN3VEQY/+Gg1L0Oki9OIp+srxbOXNEHc+kgSAJuloA6+derYj?=
 =?us-ascii?Q?7BvYJQqC/s72oBeQnBEnYvtaQN/puu7TZ6aTkP7zPWgNw91y+gdMTVdyGo9K?=
 =?us-ascii?Q?O/qSQ8S0B7itKJBss7aG2voM/LQOubUccnu3Aig02pODRWsP/uLlBYaTkfbL?=
 =?us-ascii?Q?7AC7gZx1YY5AhR50wgwGq+gmBKO8C4Wxan05kBxuqilgQZlCWGcQ4a+/tC8g?=
 =?us-ascii?Q?emEUmPgcpo6kGWtldGz+A34hylzv6rvGIkyhgOfd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266dc400-3a9f-4360-18e2-08db6113ed00
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 13:44:01.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VdRHz4qx/HKLo3EG28DiPhFpyTViMb7OQ+v2tSAEB9PF5sRgxO7Xl28NuQ39C5S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Nicholas Piggin <npiggin@gmail.com>, Li Yang <leoyang.li@nxp.com>, iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 30, 2023 at 10:03:53PM +1000, Michael Ellerman wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> > On Tue, May 23, 2023 at 08:26:32AM +0200, Joerg Roedel wrote:
> >> On Tue, May 16, 2023 at 09:35:25PM -0300, Jason Gunthorpe wrote:
> >> > With POWER SPAPR now having a real iommu driver and using the normal group
> >> > lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
> >> > user for the iommu_group_add/remove_device() calls. This will help
> >> > simplify the understanding of what the core code should be doing for these
> >> > functions.
> >> > 
> >> > Fix FSL to not need to call iommu_group_remove_device() at all.
> >> > 
> >> > v2:
> >> >  - Change the approach to use driver_managed_dma
> >> >  - Really simplify fsl_pamu_device_group() and just put everything in one
> >> >    function
> >> >  - New patch to make missing OF properties a probe failure
> >> > v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com
> >> > 
> >> > Jason Gunthorpe (3):
> >> >   iommu/fsl: Always allocate a group for non-pci devices
> >> >   iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
> >> >   iommu/fsl: Use driver_managed_dma to allow VFIO to work
> >> > 
> >> >  arch/powerpc/sysdev/fsl_pci.c   |   1 +
> >> >  drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
> >> >  2 files changed, 36 insertions(+), 88 deletions(-)
> >> 
> >> Any chance someone can test this on real hardware?
> >
> > There isn't even a MAINTAINERS entry for this, and the git log looks
> > pretty dead for a long time. I tried to cc people who might care,
> > but I'm not so optimistic - unless Li says something.
> 
> I guess it falls under LINUX FOR POWERPC EMBEDDED PPC83XX AND PPC85XX,
> but that's basically orphaned these days. Basically all the FSL/NXP
> powerpc code is orphaned, although there are still some users.

:\

> But looks like this driver is powerpc only.

Yes
 
> I do see some changes in dmesg, eg:
> 
> -fsl-pci ffe270000.pcie: Removing from iommu group 61
> -pci 0003:00:00.0: Adding to iommu group 60
> +pci 0003:00:00.0: Adding to iommu group 64
> 
> And lots more like that.

Yes, we expected that the groups would renumber.

> Anything else I can check easily?

Wow Great, I think that is a Tested-by. :) Honestly booting at all is
99% of the battle..

This system looks like it has "partitionable end points" so I expect
it to all work, all this does is create a group for the controller
itself, which you saw in the boot with this diff:

  -fsl-pci ffe270000.pcie: Removing from iommu group 61

Which is harmless as long as its group is singleton.

So, I don't think there is more you can do with this system.

Joerg, this seems like enough, lets go ahead please :)

Thanks,
Jason
