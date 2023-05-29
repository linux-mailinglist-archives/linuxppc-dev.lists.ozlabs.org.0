Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEDA714168
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 02:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTxgt1ZC2z3f7d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 10:47:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GGeDvTr0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::60c; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GGeDvTr0;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTxfx5hdyz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 10:46:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2JDQuy5PpuF1wlkvj5dQQPEfMMyWDi+7MLWteOVpQkCzBpNUEXafWflg0p9/LYafysj59v6sZwmDgswykonjhWcYjK4jyVZT0pcF1zM2jPyJTieogpitcljegDQy+mq6AB4dZrxHRl3dSDBZRD9PBBfwe5lCgDbNAS4aG+F878zmt8LUz6NF7ashkvyLlau44VOET7QYYnulZK3RRCppHmWH8y4GmH7VrTAJNzGgkCWuSaOPD+V10raQ5tdCl95hvpE5CnlVVMmBEkZv5q/hIZKPleMgNYEjh5SyQ1k9Ug53OYYIyNe0jtKem6WfNlGEBEERv1i1njDpPaZCbScMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVMyjlvg/KlrSG6hdT6cZXpbFu0qwmoujW4rupeqVzQ=;
 b=TQVl/BOgAvSXZ6D41+38rgfrIuBReQGNzbl9eyc4g1uBHFzmxR5GcX6A7bghtzvMsJSv4++bf4ZJT2Y6R7IMm1oP9MHA47KqFFg91RjGvox2Gxdl9zHqCG3VH7dKInPMc8ELc9QOVFTSddj9+qtTdAqb5LMpjlfp1iGnVNZ4v7HC2646Z4df1BSXicGNVCE+PnXCTBLfNyX08h5TyTLmFRoa3G4RTNDxbZLg54AQnVWSpW5h2UX8dW28hfDeCwAQAyF4uLRtnAOydvGjfmDVGjL/twJ6v0nuX5UZqKCFpr0cYCGR9XGExwq8WHiV4AtWRWLHJE56g8DCA+H8LVlwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVMyjlvg/KlrSG6hdT6cZXpbFu0qwmoujW4rupeqVzQ=;
 b=GGeDvTr0vD7wyt7WaB+eldrORNImAUrWXhuw1WtwTTX6i5vJrNIyrzz5xjz0ZnQwuFDA0oBeVEP6Wn+eTp/GbQ2sL71HZe34B5K+ATmBn3YhinrOEjRYGkC1M4fRBP6E7ndXZuFKtDKxuHmHShLTxqfRKap2dJfBmw+tts+49HRRZVesWM0pukb5MHT6Fnix+Cc/tLmjPPkjkJ2qhfJsu/K65egctNMLhz+fXymKxq5QOrFKbc3kB99Kcx/RZ5zyVTdRi5VX9sHzItVgQzD6esKu/r8xZjNhHfIYWZj8c9WI77cD6brYAi74g3hd8wvbh4KkTVhv+REGzAtMTQOotg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 00:46:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.017; Mon, 29 May 2023
 00:46:08 +0000
Date: Sun, 28 May 2023 21:46:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Joerg Roedel <joro@8bytes.org>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
Message-ID: <ZHP1zv48iZUV5Ypj@nvidia.com>
References: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
 <ZGxcmJ3vH0Smqqxu@8bytes.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGxcmJ3vH0Smqqxu@8bytes.org>
X-ClientProxiedBy: MN2PR19CA0020.namprd19.prod.outlook.com
 (2603:10b6:208:178::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: ea622c01-bf7d-42ff-54cd-08db5fde1736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	w1RM5uAXMXErVn30ZOtAj8K9b0wZBQYp4znaaX2ZnhTFotDzLnSz/bWxWCrnVHVrWYIFEFYPjcwcduyxl2dzSVjfmnWA4qt2WvLtbqGzpgTjwx6+gWUg7YzNKsRUF4ppLSkAo5gllPDU+jfeGWdYx1NcYbOET113PiSugke8UATzWlbQfLXHU8WRdXn0x7cBmTqThbL/AIRw67e/LE9VdOZkfT+aquyh+VsFy8n4zxKCu765J+Zr0sl1vqX4gDq/g4NgZsdNfN1WhazEPDNiHOlAbYiSOMKTcHch5CKFsGSQ6qsT1qZ6sCwVw5WaM9046VyPqJZMu3tnAW6vz50gyV3pUZS0NbXl2jaEqiaWKLcjOSXgNIokWFKDkZHDwQ8ov8Ek7onRfnEy/W6mPzw5kaLoHluvUk+YkeAnvgXYHhFLVV3zoxkSlrncAssWvXFyCKMlEUOSw1VCdL0lJoAqQx72zEAcL6FMjnszEs1jPLBl9OiAAQsFuUUKqqcAn3lM1nhsMAC5+pnaAJzkIRojrDmoTUAFVHUYkIYT3LuMxNt3VTFCp1CWY5O4a1aFF+jbru3jKUHimJZF3CPHREKC8CYVY3IX0hpED/OU81u1cO4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(6506007)(6512007)(186003)(2906002)(2616005)(54906003)(110136005)(26005)(478600001)(83380400001)(86362001)(8936002)(8676002)(6486002)(966005)(38100700002)(41300700001)(5660300002)(36756003)(66476007)(316002)(66946007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?aRtfgznu6TVsI8SdTr9cm0B7m7L+NCP2jIICnLkmZwQzKsUiCbavNQlM9ujT?=
 =?us-ascii?Q?7TEo+ufYFQ5fVwbYqXRZ/LeWYqZcphH9qmyLaNgeMc/YNxB79PUIPEfbfoB4?=
 =?us-ascii?Q?Mhby3dHgNoVv0RXjmGj6dDOcpWA7pwWMBjXss2SQcJqGmIeSjt7srCSH0Nbt?=
 =?us-ascii?Q?nHIyfoT42BzMn4EHVbPi3WWijPZzz702ETrxYlrih4hUIKUUfHS7DpPqj121?=
 =?us-ascii?Q?fWPLU+aVsgNUqstlzUfrmTr12fgNgFNmaQQxQivvKl1kyUAqR7mApVHaKQvY?=
 =?us-ascii?Q?js4gxDmOGn7q4CjvqI+RHXItYGRFpvxLpZF1Xh66EBAEbIIyda49odU5Cqzc?=
 =?us-ascii?Q?IXpzKazS8C4vJk5REq4/EWt4K2Mbx/qhUNanghsCNkU8BbUJ1P7Ve8Ca46mG?=
 =?us-ascii?Q?tCMYM3AEtWm5oxC/L+2/STrckDw2C/4CgfMC/BmpUsyEdtqNK1kyMwqozjyX?=
 =?us-ascii?Q?l6CjTnVNIPhIEn5rgBmsTyabUUlqSCiJIOpX/S6m4zbV9f/1zhgmWmnA1ZoE?=
 =?us-ascii?Q?1lbvmt7qdQUhzpoEBXX+2+b1g2hN2JgnSq4e3/EZuKnoDTQb5GGkHai7Yrek?=
 =?us-ascii?Q?x8Ja91pLJ1j+wiKS8ZFpzFqwPkmQxZB03SoLryCnsOS2/m+q6kucKFVQNlB3?=
 =?us-ascii?Q?9Q6DZ/x2LC1/xa/XGRCf4RCQBho5yGrrpwOMPW1z4JfsIl2iaxsR02WXDg4g?=
 =?us-ascii?Q?pNn2Vkd2f8oLIZ/DlcH8BIENLDJ/H7xRXVa4dai6uBA+94oj5TM2i+yzeYUc?=
 =?us-ascii?Q?L+lZcesyajdQLRWxpo/7XQAEh2ZdCoIhpRSJVsKce6As+1NJTHfDh7VOX+Oy?=
 =?us-ascii?Q?ujQlbW5Beb7c/nlnus7HFZUnhwRiU8eotRwzoaU/7CgdtuvlvJI6CcsTuRE6?=
 =?us-ascii?Q?UcvpY92+NOcesmfGWilQKz0Jvjb5EDLVV/03sSiT0u+gw3ZADCaJImM1WSRM?=
 =?us-ascii?Q?fVJSIqOPnmZf0BPhFwwOyGy/KXIHGz5RKRSWQiKcX7Ynd8Dq9R62M3HniWf6?=
 =?us-ascii?Q?ch12Nlg10rXhjR9upKJF6JmVKX7ksIexSIqq1SpBZw2lZ8iLihUsuXKRAKVk?=
 =?us-ascii?Q?Zv2nN18j870sdXGLCoWcJwaOc/y2ZWSe8jVBXlocwl64f6WJpUZGDmdhDe9A?=
 =?us-ascii?Q?wOcvwUse+CYbqc3Y+2rYQuzDzMcMfkfSxQI1hiA8IBSgSGDcxZjhkyJn/2DL?=
 =?us-ascii?Q?IeOT+yniEaPmKAaGuBTIZq/XXz9xgAeKnKh6aMEM+RblajuZ0LAsMAB9326H?=
 =?us-ascii?Q?9FK+e3S8aKGHl/64sqKD19yiQSYs0E4DXRHUDtnFbE7MYZf5NHHvynr3CMHp?=
 =?us-ascii?Q?AZ9avHHQidr1rGZONNv6hgaQrDDLdttsbe5kmFgByuHRSgRUt+hjRBxBL2QG?=
 =?us-ascii?Q?cRWWYDHzqGPhhZyEU6VqUT2qn3W3e/tD/UEGrpPwrulDvVyeJAn9fTriW39I?=
 =?us-ascii?Q?Pacxaa0gREK5/z5Ijrq6HCYa4c0u8nk6wcKOSvGH1TBX6lV4jMXhftBI728E?=
 =?us-ascii?Q?oTwh8pnHQ6vtdZW4dJIuc4RvHdgaWu2pc9zWPXZ8MkRm2aI37Mt56kA9i0Vj?=
 =?us-ascii?Q?ATwkFrtIYl8K28F+N4Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea622c01-bf7d-42ff-54cd-08db5fde1736
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 00:46:08.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PracepHHgI6o1uh/vdcTqYQLrrOjNQZBKXCnqdnevs9KPtz7v+rigfyLB5Sz1OpQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665
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
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Nicholas Piggin <npiggin@gmail.com>, iommu@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 08:26:32AM +0200, Joerg Roedel wrote:
> On Tue, May 16, 2023 at 09:35:25PM -0300, Jason Gunthorpe wrote:
> > With POWER SPAPR now having a real iommu driver and using the normal group
> > lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
> > user for the iommu_group_add/remove_device() calls. This will help
> > simplify the understanding of what the core code should be doing for these
> > functions.
> > 
> > Fix FSL to not need to call iommu_group_remove_device() at all.
> > 
> > v2:
> >  - Change the approach to use driver_managed_dma
> >  - Really simplify fsl_pamu_device_group() and just put everything in one
> >    function
> >  - New patch to make missing OF properties a probe failure
> > v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com
> > 
> > Jason Gunthorpe (3):
> >   iommu/fsl: Always allocate a group for non-pci devices
> >   iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
> >   iommu/fsl: Use driver_managed_dma to allow VFIO to work
> > 
> >  arch/powerpc/sysdev/fsl_pci.c   |   1 +
> >  drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
> >  2 files changed, 36 insertions(+), 88 deletions(-)
> 
> Any chance someone can test this on real hardware?

There isn't even a MAINTAINERS entry for this, and the git log looks
pretty dead for a long time. I tried to cc people who might care,
but I'm not so optimistic - unless Li says something.

I do feel good that if there is a problem and someone does come
forward it can be fixed up without a big trouble. Certainly without
going back to mis-using iommu_grou_add/remove_device..

Thanks,
Jason
