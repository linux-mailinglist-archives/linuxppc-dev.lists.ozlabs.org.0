Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680627B9D5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 15:36:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cxXtsv3I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1Xdl3Jhcz3vrG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 00:36:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cxXtsv3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::622; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Xcs2Gtxz3ccV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 00:35:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq4s2bXoFzXm/cRv7gqPu0H4JdtxrCPB7rMcrrRHP1d4Nw8fJafeznh99chBJB69RcvKsRl0LjxoTTUdCoeoJZucHGH+J6tRKyEu57AIRML870SiVEfJuTFNJgFHMCD9yQzgEsk2sdWSUKLkfq72w9KANl4BwlGnD1JbUt6/xvH5gkPrPnoWg+ddEeiwfKu2Wm784W714Sm4Dt4tOaQE5zn+62gIbb357Llgev6OVZnkkrZscsv2POXFYM1HzeaY6YcvUY/ejWKpHvcNd4Uh3hi8vQREZ30iPp4JBueXW+QuY1xtOSqY1QdQqGz0Y+DoqSYp1P3HMPXhryn+OoQ/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/hA31E8sLWJVXsGSidN3JpnXAuT4BjgL3GuuvcyOa0=;
 b=hbkB5zZ3QBCbl76QjsfL8jAXVcyj0pzg4yeEbsoRuUszJjh7Gb2VowgHDUn7JnIb5qXCxwPhzJVor32fQ62QITNL24BO4h8VOVcyNYNMOUdkonvxldTYOszxe1YHmSSuXfiMEjduKpBEniFVQ9XxccsdvBW+cG8b3wTq7X2bDOnkWvMIh3VlvwRXPp2tL7JMryJXyeh/AsOoxMio/SmxSZDUXBcLXTdGd7+xOGkwlBoeyNrjwOswhMZCit9/xf+XIGPPLX4lDloq4DuHfHB2wDLanrZSpWEATyfhFvo8gfc5jdxmtKPsHAVjS/mcLUdYJWu4OJzXN2RCVuPoPZiCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/hA31E8sLWJVXsGSidN3JpnXAuT4BjgL3GuuvcyOa0=;
 b=cxXtsv3IbZu4LQJxds+DVGKlMAj4fHGio3smvo3StgxohNFUNl9lXQCRLSZTirmb9tixk/QAHSuBIxpiMXBnPJ65pG3b+OpERWzCdvP9F2oK7CkkF6Zoh7OK1scsc5wa9pFBovbz0xNr+Z3Xrc/kOtnlf1fZ58ENjlURymLbrD7gDQvptFhoNNWBSvjrLfqeCJ+Q+bnNMVDga9fGD9G/wnSM8lwFh5fL8MANKxIz/IEFoYeAV/4HsXS68H7tqLX3L+UqXao25edmmRJ5/x6SiGajMEJU+1U+QdCVkLNGf3fAVjgZwwK+aliaaCpp1uUUnxQVTQWQ1W35WT/23U+3Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 13:35:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Thu, 5 Oct 2023
 13:35:15 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Joerg Roedel <jroedel@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/iommu: Do not do platform domain attach atctions after probe
Date: Thu,  5 Oct 2023 10:35:11 -0300
Message-ID: <0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: a1655af8-1b16-4f74-4bc2-08dbc5a7e89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rJb8VTrWp0dT5r7KUVjwxJefLjqZoRv6iCB0xk6gzxHGk2Wr92/jlw+WvkL3y3vYGTR4nN1u2f2LOut6E95xTK3OB1Hu6asVtV4H4wI2U0EicgQCJU8JGzUvfaeadu0s6xfoxmm1UeoVR6lZPUN7khfuKF78FON1rv8RZdZTt9QAHsVxWiJhicho4GAWKxUJi/lihelRaO2YAS4jkKw615sCS+FyOQJbqAgSh/hRn4+DGhq+J4oFmswGgoXwly253zM7nXBI0dAaSsuDkeDnLnByExHg3nouXtSC8kFd6LNaohCo0qkKq3BeFnDaDOQlSrLXbueCnMdL4ItytJrQrpMdndwmllyh0Pa4m/HgTnvsvhAaZZuJAMf/9fuv8UZHc80EFXOgI1H6uzoGV6B/WDifJYrSqEXK+qqzheFGkNNdIYyxL4TUOuPP56P3EoUGliO8/xQB4Pst5Y/Sv8Gt2njyuYOa13eD5yALOvzp6R6ZwT+EBjyMMNMZ8eIamYHJjRsoKOc8DFT+aIZiXyZx6s7UlwfWP38M6SUu/gyYJTlxZMIjR5GOzj/ZESVHKnkvnRWQBpkKyx/3AzDBv3/AUhotithWQbIdEsOPdJs4KtlBk5H2vnHo3irtM0HSlVKvq2u+ZX5sSyqeTLkUPv4PeQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(478600001)(6666004)(966005)(6486002)(6506007)(45080400002)(83380400001)(6512007)(26005)(2616005)(4326008)(8936002)(8676002)(66556008)(66476007)(110136005)(316002)(38100700002)(41300700001)(54906003)(66946007)(5660300002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5vrDU4cS5D60TXHepOBu/uV3qQ2dKu2W2iCi9l4838jo0JEV7EvPysQtXYf3?=
 =?us-ascii?Q?7mqmsP9eZBMAd+PO+1VwzPIt/sI6zSrrd6D2q+/W2Xnc+pU8HPxDoGskDp3f?=
 =?us-ascii?Q?tqxK4RPmNoAzgNympoqleSvsp9yiWICCDQCFQRF9BQZiRGyPw0N+6ECvP0/o?=
 =?us-ascii?Q?ncDDNLjN8pL9NzbfNEuB8z4PLCTuXsmvVDIhVhmOlNclXPGKVtP/qy2oGOVL?=
 =?us-ascii?Q?kHyVTzk/8hFd7nj49GLMWoTJ/22+08UlJKkhcmQBjwrxUBKl2TyEKdr1LkzP?=
 =?us-ascii?Q?Jubzs/RqKp3EzWRNBtaJPn7DpU/tlqxYLbI0BggnVv9TD5T2RcswwyiDpfA4?=
 =?us-ascii?Q?5fLeXr5DvYhGB2GeKI2LDB7YBPJnB3Y2Go9pc/rtydhtf+BuCPAB5lZfNmv4?=
 =?us-ascii?Q?zgvCjG0e8jPfur3r0UEKZr7s39Ia8qua8ECBxC0iWNfcIngB9NBKWH+uqJMt?=
 =?us-ascii?Q?fsSyqXtsOz7ClqC99H6GBCINkFJ6pfMudY8FYOyweXWVlAuNcJQV3wCWzEpU?=
 =?us-ascii?Q?HZXQxpaWcRTyfMaY1LxuKPicmJNDNh5baedjr5uASJFBytaFMVNwcdE1zU/H?=
 =?us-ascii?Q?266D0RdpUi7wqP1z09dSnLgAPtgal2r2EXeAFRiPXR/U+a/VD7oMUqXVf6CL?=
 =?us-ascii?Q?3awru3QrRQVlX+b0yyuuGmvhxcY1NT5cLT2esrhkCOEZonu7sKVr1SCqGHkX?=
 =?us-ascii?Q?SeqOAFe7Op4oJLwKySiaHqAa4jL80czUImjR69Y6lbRpsytWesD2z6uwjgBi?=
 =?us-ascii?Q?teZ9iHkIUS2PPduGLiIvjDHF13xIQmvWJ2SjQIGCv8b6T77a4JVbTv0kwGSd?=
 =?us-ascii?Q?RwcyOZ//MD4rV2k2XJd+40sXiiq10sFLTTArWnz5Br9kz5974N53BVB+Iaaf?=
 =?us-ascii?Q?cdZuyeAnqeZCHx+gi5yEZR0LNztkGnf+hMErt0JiuF+m2L22bg7jOjC8RL60?=
 =?us-ascii?Q?w54X5RZvbSBNm8QZnejXUPVDSTWbOSgGmPbsLAvDKtlsaAgr7HSs+Qg1lTWa?=
 =?us-ascii?Q?VU6gaOnDma4AYWpmNAFkoSGYQ0A6xZZu04NTqGbFYyg8yliyUecDLxm8a7x5?=
 =?us-ascii?Q?qc5hbTNOJydKS9Opsz4Lxuq4srQPikewTOwOESuofA+GF9qH5M87N2gg89bQ?=
 =?us-ascii?Q?thdPooKrrVltqgjfJljPAzh0ScVJDHyWEWBH7R60Oh5OZ5RdWyn80shwaulm?=
 =?us-ascii?Q?I5Spj8LyDESLRacITnF600IBlf7plisS50w+CkVMVkPclEup0NpluuuFeOpE?=
 =?us-ascii?Q?/aVJkgXvR/R8Ov9F1XaZD/7bJhqB1ffXR+vEc2W3WxDMRznjU5+87m8j9ALs?=
 =?us-ascii?Q?c1J2GfD791A0tKTQI7yK5Y4vJ8qx0edwzAblTzTShCp7bSw18QSbV9DbWKpq?=
 =?us-ascii?Q?Rqi4KGyn6K7CmB7ChaUIYKM+yoLaLk+yQoYuXDNtKQBip1xZIcoB0BRLzRKw?=
 =?us-ascii?Q?1+9h12YeoR6mUzEqHC7XaTUWC4GfAV0fRzLcbULieWNhUbRTNy8ZLG2lMRCP?=
 =?us-ascii?Q?vaai99S7j9N6OZ0w+2+A3vlDBsTAiEGyLMURfGw/6VMMVZEwQ4LLipJmb0RX?=
 =?us-ascii?Q?FNsTN+a1NlhgWp92VsQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1655af8-1b16-4f74-4bc2-08dbc5a7e89f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 13:35:15.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ0V9O51zkirwDVlsgbeZycj2diNjOA1a2gB9z7QInlOmiT12vuK7o5Rvu/RsZSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5440
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
Cc: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER throws a splat at boot, it looks like the DMA ops were probably
changed while a driver was attached. Something is still weird about how
power sequences its bootup. Previously this was hidden since the core
iommu code did nothing during probe, now it calls
spapr_tce_platform_iommu_attach_dev().

Make spapr_tce_platform_iommu_attach_dev() do nothing on the probe time
call like it did before.

  WARNING: CPU: 0 PID: 8 at arch/powerpc/kernel/iommu.c:407 __iommu_free+0x1e4/0x1f0
  Modules linked in: sd_mod t10_pi crc64_rocksoft crc64 sg ibmvfc mlx5_core(+) scsi_transport_fc ibmveth mlxfw psample dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
  CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.0-rc3-next-20230929-auto #1
  Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.30 (NH1030_062) hv:phyp pSeries
  Workqueue: events work_for_cpu_fn
  NIP:  c00000000005f6d4 LR: c00000000005f6d0 CTR: 00000000005ca81c
  REGS: c000000003a27890 TRAP: 0700   Not tainted (6.6.0-rc3-next-20230929-auto)
  MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48000824  XER: 00000008
  CFAR: c00000000020f738 IRQMASK: 0
  GPR00: c00000000005f6d0 c000000003a27b30 c000000001481800 000000000000017
  GPR04: 00000000ffff7fff c000000003a27950 c000000003a27948 0000000000000027
  GPR08: c000000c18c07c10 0000000000000001 0000000000000027 c000000002ac8a08
  GPR12: 0000000000000000 c000000002ff0000 c00000000019cc88 c000000003042300
  GPR16: 0000000000000000 0000000000000000 0000000000000000 c000000003071ab0
  GPR20: c00000000349f80d c000000003215440 c000000003215480 61c8864680b583eb
  GPR24: 0000000000000000 000000007fffffff 0800000020000000 0000000000000010
  GPR28: 0000000000020000 0000800000020000 c00000000c5dc800 c00000000c5dc880
  NIP [c00000000005f6d4] __iommu_free+0x1e4/0x1f0
  LR [c00000000005f6d0] __iommu_free+0x1e0/0x1f0
  Call Trace:
  [c000000003a27b30] [c00000000005f6d0] __iommu_free+0x1e0/0x1f0 (unreliable)
  [c000000003a27bc0] [c00000000005f848] iommu_free+0x28/0x70
  [c000000003a27bf0] [c000000000061518] iommu_free_coherent+0x68/0xa0
  [c000000003a27c20] [c00000000005e8d4] dma_iommu_free_coherent+0x24/0x40
  [c000000003a27c40] [c00000000024698c] dma_free_attrs+0x10c/0x140
  [c000000003a27c90] [c008000000dcb8d4] mlx5_cmd_cleanup+0x5c/0x90 [mlx5_core]
  [c000000003a27cc0] [c008000000dc45a0] mlx5_mdev_uninit+0xc8/0x100 [mlx5_core]
  [c000000003a27d00] [c008000000dc4ac4] probe_one+0x3ec/0x530 [mlx5_core]
  [c000000003a27d90] [c0000000008c5edc] local_pci_probe+0x6c/0x110
  [c000000003a27e10] [c000000000189c98] work_for_cpu_fn+0x38/0x60
  [c000000003a27e40] [c00000000018d1d0] process_scheduled_works+0x230/0x4f0
  [c000000003a27f10] [c00000000018ff14] worker_thread+0x1e4/0x500
  [c000000003a27f90] [c00000000019cdb8] kthread+0x138/0x140
  [c000000003a27fe0] [c00000000000df98] start_kernel_thread+0x14/0x18
  Code: 481b004d 60000000 e89e0028 3c62ffe0 3863dd20 481b0039 60000000 e89e0038 3c62ffe0 3863dd38 481b0025 60000000 <0fe00000> 4bffff20 60000000 3c4c0142
  ---[ end trace 0000000000000000 ]---
  iommu_free: invalid entry
      entry     = 0x8000000203d0
      dma_addr  = 0x8000000203d0000
      Table     = 0xc00000000c5dc800
      bus#      = 0x1
      size      = 0x20000
      startOff  = 0x800000000000
      index     = 0x70200016

Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
Reported-by: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Link: https://lore.kernel.org/r/d06cee81-c47f-9d62-dfc6-4c77b60058db@linux.vnet.ibm.com
Tested-by: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Joerg, this would need to go to your tree, thanks

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d6ad3fde85a212..bf19932147517b 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1280,13 +1280,19 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
-					       struct device *dev)
+static int
+spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
 	int ret = -EINVAL;
 
+	/* At first attach the ownership is already set */
+	if (!domain)
+		return 0;
+
 	if (!grp)
 		return -ENODEV;
 

base-commit: 20700abdf2393c8c0bd3a100e3111d0fcd3d5bf3
-- 
2.42.0

