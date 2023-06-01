Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4291F71F38C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:18:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXHX76TzXz3cR7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 06:18:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XIgA8EiZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XIgA8EiZ;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXHWD6FzHz3cR7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 06:17:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0v8+jjWoe80kSmSl3oShKYkNmkihfI0I0oGtkiOvkFD9BK/VoQoIkzWuUrViuD90/hJ2v8Z79bxoKulL7ihPm6I+L/cXnvpnGEZ63kZVRZ58SL1LQTDIVMBYd4Vmc1PjPrbJS1fNNP0nAoG4JXPn5s2Z5Qyqsnb+9B/SsblYSoLTn6F9mWADoYdfGcEENJeGajwBS7/v1JGJZLHXe3H9MCw/dy2AqZtIq2V6C5qlgT5OzjU/a6HTExhIArPdV2dAu4FdpBACJ3AoAdSsHQ0h4/jpKvAnicXni8WalvBFddbszB1LoRm0buKfBaPijrrwVrHaJ82J6EUeNvPDc1ctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaHcSqE7XlXrktBOTaCB5zFcGAm2dX2QUN4d5BhJxPU=;
 b=jPIVaJIOHIp3fyK7uZWS+Mz3HCIxfyiQli8Z0u/4AThXczw+7br2I88QGp27o21qVxwUHSBfHwMAhgyF99UrTAaNCIXfMqhX8rT+xoMTqvCxTm2B0/Byh6rSsDJeGSUW5kjaS98em0mX5NiyTymC0oWiYr+K3Il/yrVhp6+7UHPl1xUp5CpDRmElTBLDdWUrBZ4ge8terk67oXlH4Y4cifu2O0m1FLGIu//b12nxD6XasCrzmxpm5EL1A8zmLR7fVVc1uUNzo5C/8tLP0WI44qK2wfvWWrxYbCPhYNbApfA4pC5IMKnCGT86io0YTXqGxnvkhryHxl+jJhiE6Cnxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaHcSqE7XlXrktBOTaCB5zFcGAm2dX2QUN4d5BhJxPU=;
 b=XIgA8EiZ0oR73xZ5ja3VdBHIAUkq2diJ//ARGJ5qD4rLD6k7PTdBz95M963YuEbhkqD4mppj5eqzU/3EFWE+5d/kg0gskK+cvadr4eS4YvAzLvD3K9Ldc2JRwN4uuFVVP8ngcqhbfvRc/To3J2P9q3VFQIbEzHh65s+t2+meTOVNI2CvkN9/rcOjAbMWQCR8+YVdxnE/xx2d8kNr61UF+QrCVxoY6fyPw92VG/2shV8FdbMdZKgFJ7InM4F7sfZVQKV+NzWwl2BbKL48rk8pToPUArfjCirdqoZG22La4XGrFTMrE5KH/HqseLi4kb6+K89TC5FeJzobM45sAJO7Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB8008.namprd12.prod.outlook.com (2603:10b6:510:26f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 20:17:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 20:17:38 +0000
Date: Thu, 1 Jun 2023 17:17:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 09/25] iommu/fsl_pamu: Implement an IDENTITY domain
Message-ID: <ZHj837tTEEi03lmZ@nvidia.com>
References: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
 <84aa0f5e-f13d-40f5-abe6-e8ac231e2d95@arm.com>
 <ZHj1kXMMf5iqxXOV@nvidia.com>
 <ef78fd49-4609-b947-b26d-f3f5ac66178f@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef78fd49-4609-b947-b26d-f3f5ac66178f@arm.com>
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba30ab8-7fe3-4ee0-eb16-08db62dd3e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7hC8nokiV3oMPp1k03ODG27ycCii7VoTa+pGdomE5U+YjDzOP/XWh0SoemiBRIv135MBO1HHq9JY688IqJFe1f0rAZrPvWI6sFxSdw3NXP64AzIy4UCwUJBn75HEyEKxbHDsVoBCygsmgJ6TRUCZG2FPd7TqXrhafZ5JL3q4ob/50XXgiBBLvnU0oZUJRT4sz1MhEFOhNTPYUIRpqcfllFu33Mz8iJnY+dD2B66oRV5RSI3kRkvMPw3vJVWK7ygI0jrK6ZAgNjT0nAvMblxLfPTbX2DE8Xg4QeZCB+k1bKP04edGbHEDf2QsRpzqf8FfOvsrqxYrO4VpRNxgZAo0j83MnOVkJHKtEvJ+BtEN8vF8pgZ17cJch/ilsEvz+fv4tMjMRB0uYsPy/aIgEIDxpf+/ieQSutJk+JLRPAmXZ9nEAucsMJ6aYKBFTOgFSZbVGFn6/6qksZof1Ej9XpC/PYEaOGqD4qZi7CbSGxZGqVnELtEGoz1SVEn8SPEDEoEYJ8rUlD0MUbBHrQ7aQqS+7cWRVrya8ud+2sjTp9oblNpxTsgKynCcBQ7b+r456cq2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(86362001)(36756003)(6486002)(6666004)(4326008)(478600001)(54906003)(316002)(66946007)(66476007)(6916009)(66556008)(5660300002)(2906002)(8936002)(7406005)(8676002)(7416002)(41300700001)(38100700002)(2616005)(6512007)(107886003)(53546011)(6506007)(26005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?v/oosyQ/kXWhMoPBmR0mKUnKMYkzW2Z0E20X3N3WfbusLGbZgboytp1ZC3Ze?=
 =?us-ascii?Q?p6XVSL/Ju1VqunOb6quG5Wv/iJe1TvoBJdYDp4KPHEr8Kxi5LoO7pOlRfgJQ?=
 =?us-ascii?Q?JZ6sbnM2/655POXS6K8vFXw172ivXF2aBsO75Oex9JPTP8nJWqEz0IvxI6ta?=
 =?us-ascii?Q?zxLJe0YsUgWDKgJPryBZG9d9CwXgeqz1dO7MvxpLadq4rSGj27VNb6I0eP4s?=
 =?us-ascii?Q?upnZZKjVXO+Dy29YfAhGLWnxULr9I9wlVEaaOOw2t4WLjX2gCAMV3KXlztNV?=
 =?us-ascii?Q?20fGNPSw3gKSox1wDdMHUL5ezu5IafvTujPXw3v0x4T0VaVzBEX+cjtLUA2R?=
 =?us-ascii?Q?lylMBVhmbm9+3iU0D+tNGsAO5sDHpqGDuV+fcT6UMm87cJ0hS96ui2UzMhYZ?=
 =?us-ascii?Q?MKb3gJRP38SSDkO53YxIlXnl8Dd5kXi6Qksoj9lyU9MO3iZKzo4Dk+ayCxFP?=
 =?us-ascii?Q?z6cLa6zrhVq5ZruByqi3BJurviq1U0tUlr7RkKQUZGNmQZ0koAR/wDB1TSjJ?=
 =?us-ascii?Q?WbjPpAn18m0p67dRD50c68pRvqE+aCps8Na9cs15SHbAABb5/fEWteISiLMH?=
 =?us-ascii?Q?+EynKz/drwzGRIAgE9S+dDn679YExqKcxQ6DiUnJgHXPZdfUBB4qTRwm6bwZ?=
 =?us-ascii?Q?rmAXl8d1D61Dc1F1txIpLFl3+U3ZC2dLJ3QDPHv5V3VgSH40wNlQ524NjMK+?=
 =?us-ascii?Q?t7llx6U7cjfjAtiQbuREODGLil92pBMAwf2MrCeaRz0A1BneZq2ofwqP2Owx?=
 =?us-ascii?Q?kLYIWSrL8aLpP24RAEkATRdlyYt4r+tbSCw4vJOwCCm9tnILsyAO9UH2MDZH?=
 =?us-ascii?Q?CVUT3WQM5G6x6ASsXQ/LdRF3w84xzRoGmYeQO8r4SlMJvLYESZddbFils3ih?=
 =?us-ascii?Q?NR2hyFGtxiQvPTLal1XLTRelFx+MTq9SGdcE0ZhiNGdyML7WLk64MEr5qvW4?=
 =?us-ascii?Q?V5JBwHhrPy7SKWi5nHDvTIIXxs/FpKBo5CmKQBzyxNEB6Nkmn5JZd8CLmAQ9?=
 =?us-ascii?Q?Vj2OeOczzAuhkQwqcBW3ZOyEQBEPQ4Ml/BB8GKFDY4nLYQl1+CjIQXTSm6j6?=
 =?us-ascii?Q?oHtMIjhn8aQps+qy7d5B9UqO1GP/IMvHl53W7WcBgG5ZOTbVXTXAzR7WoPkv?=
 =?us-ascii?Q?vliYAf4XtQvJJk6yfcfcssBwl9wVozvkne/846egbRtPGQJz4hay6VKpLMMI?=
 =?us-ascii?Q?lRn/7E5mSqbc3SnEs7zErC3Yi0gGITJpjBqw8cdDMNLjT0KKu/F6d4Nt5Pd0?=
 =?us-ascii?Q?Dp74LWFOkr5/qLBVTJ85jPOJ4r0ulAkUMADmOUAQ85hap+KENZQM/JKEw/7U?=
 =?us-ascii?Q?jOhygIKB/xWk7+7GkVwO/ovmXRLRIkt2tZ8W5UG6zXWuhpATBOUxyO1jeKAn?=
 =?us-ascii?Q?YcAVobwIT6tJGz6uQHtasMK5oo1oi6JECsUWfRMdF96fNBytU2CfSQq2mrHH?=
 =?us-ascii?Q?5lRR9LcD2fJ50J51zogDAIIrGLDx1a/9fKVs1NIc2XacnXxHYvTIAJyfSo3j?=
 =?us-ascii?Q?9BUvJZnuNSwMcr90k8BxIchm3MMgwLPR9sa0d+Uq5ug2TkcyTu/Bsncxz6JE?=
 =?us-ascii?Q?mJoXYHa7O0xdCwnnPZfBhFxaZkLkhqWVtFVOasz7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba30ab8-7fe3-4ee0-eb16-08db62dd3e5c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 20:17:37.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybFCKg7FlbHV+/BvRa5o0GzNp7rHXi27+pOfAcNZG0dFzV3u6jWD+sjhKl0GLkZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8008
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 08:53:41PM +0100, Robin Murphy wrote:
> On 2023-06-01 20:46, Jason Gunthorpe wrote:
> > On Thu, Jun 01, 2023 at 08:37:45PM +0100, Robin Murphy wrote:
> > > On 2023-05-16 01:00, Jason Gunthorpe wrote:
> > > > Robin was able to check the documentation and what fsl_pamu has
> > > > historically called detach_dev() is really putting the IOMMU into an
> > > > IDENTITY mode.
> > > 
> > > Unfortunately it was the other way around - it's the call to
> > > fsl_setup_liodns() from fsl_pamu_probe() which leaves everything in bypass
> > > by default (the PAACE_ATM_NO_XLATE part, IIRC), whereas the detach_device()
> > > call here ends up disabling the given device's LIODN altogether
> > 
> > Er, I see.. Let me think about it, you convinced me to change it from
> > PLATFORM, so maybe we should go back to that if it is all wonky.
> 
> FWIW I was thinking more along the lines of a token nominal identity domain
> where attach does nothing at all...

I'm worried that would create security problems for VFIO.. At least
the driver currently wipes out the VFIO installed translation which
sounds like the right thing to do.

So, I think my first patch was right, we should label this
PLATFORM/PRIVATE/whatever and just leave it as is with some comments
explaining this thread. Based on the same rational as my prior email
that we should label things correctly and this detach_dev is doing
BLOCKING.

Jason
