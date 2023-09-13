Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CC79EA44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:58:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=psjrK+Hq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm29V3zsjz3dyk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=psjrK+Hq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::60e; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sB5GHvz3cD7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRspkht1ymIeP4sOGmSom0ebeeoCFnazYDjaWjAXh+mUBSttKVUa7MyeGne11kSLN3dS6bnyiqn1SK9ZmnF1XUgAa6w90bq8e/Du0HFDYTOwUY92Apad/ancohPidlD9Ys1XECoX75w07X9xEKDqduRUV1FnbO+rbqpvKOsWtiTkWvPrQ4duoEuAl4eUm2wgGoI/vWwEl1nQhexDeRW0l7J+w0Ctjr3Uixgakc8F+qf8ZsSn3ytDCArX3B6yL6ReEZZK+zFZcXQ49NTjHsc1lxTYu/19kaA9bgqOAPyHzFu3gH05qUcczlrJ+dNzwjs+JDpYAMnho26CtxVW98nOYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwL5Iai/3p1GMeQMa03kMTSjbjzYmp4R4ELx0fkW8hs=;
 b=jK47u26/XActVUEEUaUwzHxOH2T6Gl1gD8I/KhIZefqAqaD/o7YTpeLIcUV7ALVJ97VEvtr8ZjtWYKo3ylvtC5PR69u9SGthT/J2gSVV03KW9gDD62sbIrlI7Aao7WzpKsWAm6Ynv2BWVlvYxl4oDHdo0PRpe3igk0HNJbnNlzE2XsOB1qtJ/3zc59WuQEdKWOImfIKLEJ/O69ewNkT4LcKVRs8p22uIlXkW6sVLHFoA6SxfNb8qpGRTq/sObASkg1yubY1+37AD3TthvWPbDu+2q2CzAOTrowKSQ9QH/fdeaBhGIXeIPaglmGnqCZ4gOyAfwy4V3iT9yrFO5vUVxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwL5Iai/3p1GMeQMa03kMTSjbjzYmp4R4ELx0fkW8hs=;
 b=psjrK+HqJIuYf6M0rVQ9r1liMuFdU2veEl49vcEnkwMaYZeCiGPpghoVAyMRHuRsUiC3G47SeVfQfDsCq0GlLtN0u2xMIAUXGxEgJz45cYehcw1TQNDDTtm06H4qNzr0YRLncFh3mzN25EDMI/+fEFQ+J3fVJg8JHJWuCbkYhEiNRlW2UTMWieUC8q3IuFvAQxJ6oXRVSzfz3ADSRA7Di92hfrNeQ7UB+k6KXcBE5LEEXXPozlKkl3ksfnF19UIzYMERWcUd/7kRB3m0CF8scA5ypQVO/4RuvRzgRPiCw2b9gbLV38qgTuagoa9qhv/oWz6sUD5INkTRpEYciwRcHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:11 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v8 00/24] iommu: Make default_domain's mandatory
Date: Wed, 13 Sep 2023 10:43:33 -0300
Message-ID: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:23a::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 570511ec-927a-464d-0719-08dbb45f8303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TBZD2cq1XoWNfevwgl6cO8xRR9qx0Z1x/guy+HLG6AMbEUCYfE6LhP7rKPDoPpIYZS5PkO/iyu4j8HBlcdDfEdJNtxHwnqDsYof9kOEE7De825bFNTZIlS6DBZHqlLcHw0cflkOKTilwZ+jvE+ZD/+GdttP0JGjMPCI4ZKvhhM4kLPO/CMJpINh+Eni0JDr1gVIH6o1MzkdsF5bkYTctvoOch/1N1holocTJ3MQzgsyTLQNNhsDUP+l4hbWjwwJwCKQ02utUlvkgskUsf9WOt+l7wgY1o9eQZOSasAvLNX/LXnZd6/lcPNn6Q59i7cXnRJre3kgvyDm5qPPcZf1GNNXdcHBsgRib/DTG48GMMCf7MVTz+p4ccisHg4jdQG70G50tayZy/bcmQ/NnoPeEqT/6uh123Z+JU0eLa5GJFc7/9PLP1qQN+woP+ySrQ5eHns2ZuEMwO4UpTBp3CKmJgYRFU2A/GSK/hvhew8+UJdt8Ap28EnsA/C+YC2kJJJ9eAnnBGne00Eq1/DhhrsFv/zaM0NBL4VYxEEDzmZYSArsH+SwuEkZO2b281Xq2N6133kOlzZZFsNAayUyMlS0KnP9q9DGNsOSlWblBomXsX2OOfvbZ5Yb94pHW1MupHM4HA2+EiNImFyC/YxhppEXFaY3VPT4w4WYPJvyIDnz66Bc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(966005)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Lm/1x4nDBCwifZHnBKDeqS0YZ12dl9DsYiW4fvrJXSk0pjfTX2lRPD3zcz0e?=
 =?us-ascii?Q?j25bxg7EdN/aKuvDwZogOzCh5jacWkJiKIZhVCpWhBNZT+Enlx+fNbNGRMgz?=
 =?us-ascii?Q?JurawNwxF1aUtIiq9fHu9yTVELGugqz/TEPwzsxyUzTAW1Cs80+kuUIGq3SB?=
 =?us-ascii?Q?pKlJwd3uFuDHnlnwaypAWdVFcAihtvfHX9GF/9EB5/0R+o7rohGj3LVKIWfq?=
 =?us-ascii?Q?0Fn6VhGBTpW6GrySmMXUWKHW7WYP5/QYQXwXjplR9Vu7eMkS/1+wj+b/Mg1T?=
 =?us-ascii?Q?gQdaLxsh3SMeDSILS3H2nzOQAX1rxjil54B0nYk8nBbt/wStM49kf/FaIICC?=
 =?us-ascii?Q?wn9H4NbxhriJWOGRA1UQkQVF6+1RjkD2RupKGIn3wKNMVjUQY54JxINbswQZ?=
 =?us-ascii?Q?2lZCkAqE+MGj4C+UcAmaC41GEo8iQKq/zVeewsn0VXUCzYYTPF0Wtxs17O38?=
 =?us-ascii?Q?0P3g5STpu9qY4aeHkWlqC3KaykicPDo87yMdmMPz8bac/C9Hu2x94VB0bUSm?=
 =?us-ascii?Q?I464+TufIpEes+m4S6kH8k/1OmDJkC3p8D7oD2x5u+YM4iQTwUEyfAd/4fXJ?=
 =?us-ascii?Q?V4Sc5MiRxDZclmeUgq77Ag+nxYiTzAVKFhWC8TwSWaLWOl7Ng2vqBc9P06Q+?=
 =?us-ascii?Q?d5J4xyb+YTJUvJM5IDK4cq3mo3w2XUJXWoE7G0tJqcrjXV63HwtYneqj59yB?=
 =?us-ascii?Q?GqyMjQSrYnRjPBkPEA2hYhbQ0xHwjqldqWne5dNHo3GuqsBQJxJC+FBQBu44?=
 =?us-ascii?Q?3MP9WMVzF6vKIiTQ654jx2Ogaynu1Rq/wiOBI8V1mgc8OwLQgnIGohJpPG07?=
 =?us-ascii?Q?RZGzG6RzPLuyx7+Irfe9qXE1xgxCpJbPpYJ7u9YsElEoP8wJvVryHCYT1PoZ?=
 =?us-ascii?Q?wKr5DzALpA0PJ6NLb6AImRQVkeKJjMtsl6NsOQ6Zo9ghpD89M5695CoInV8B?=
 =?us-ascii?Q?ciuZ/80uU5tpYWljtyFyrqMW5IS1q8VjHn3Gx0Hdk535l8v6Q8CrTEKskCn0?=
 =?us-ascii?Q?Sg2lrvHPCjBESETgFp0qtm5Zmg1W5ms5dMBCbUiJT0kw/MQQm8GJa6N+WNZF?=
 =?us-ascii?Q?ISMdotlVLKuggNPx/f1X9NYbV4Av7mtWA70dC0a2bwiRei259h3VBgK9c3uT?=
 =?us-ascii?Q?rFUsz/p/M1+UoD61pXLWvRaJzYzU7YWvhMVC6pUWM0+uSS/EtQgn9w0rAtED?=
 =?us-ascii?Q?etGhQggl+2hP0G7Tt3ZJt9ESpoj+xbBxE6ycEKrSr6Tbnz+9lz+RqKqKdlBo?=
 =?us-ascii?Q?QH7Mume5HhYKSBWLdTsKvNhsqVnuPKzX5v2UP8fS2tM5qmpbyNxtIyf3Kt+T?=
 =?us-ascii?Q?OPXlIbze4K2Cm/0MFPuYwFOUhiQL52LANyZdydSI+61Zu1cjO7hpJlzzW78l?=
 =?us-ascii?Q?O4sySCQHY8qmSh1/sDP7HnsQiCA4lRTY9aFOYEFBtrCKj09bGkMvpqh7bbYR?=
 =?us-ascii?Q?6eg94bTs81YeVCyNa2vpafOTkByRwInF8DlGzL+sCBStdvPfBJz1467TGNp5?=
 =?us-ascii?Q?ZJggK8Dhac+M2QcRHKi1bJFB2jVvGArpa468i6wtZ3DfDBSHuDqTHKX5OoRg?=
 =?us-ascii?Q?SmdJz3vfo+RYcxdwvzGa4FqNGiE0pBvPKE2sqOUG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570511ec-927a-464d-0719-08dbb45f8303
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:11.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOt6dtkTnkJuRCFntVRhsZksuLZ2uLsLWz6DMZbuZqh9bBmXuAJga1Qt0W0T2Pv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It has been a long time coming, this series completes the default_domain
transition and makes it so that the core IOMMU code will always have a
non-NULL default_domain for every driver on every
platform. set_platform_dma_ops() turned out to be a bad idea, and so
completely remove it.

This is achieved by changing each driver to either:

1 - Convert the existing (or deleted) ops->detach_dev() into an
    op->attach_dev() of an IDENTITY domain.

    This is based on the theory that the ARM32 HW is able to function when
    the iommu is turned off and so the turned off state is an IDENTITY
    translation.

2 - Use a new PLATFORM domain type. This is a hack to accommodate drivers
    that we don't really know WTF they do. S390 is legitimately using this
    to switch to it's platform dma_ops implementation, which is where the
    name comes from.

3 - Do #1 and force the default domain to be IDENTITY, this corrects
    the tegra-smmu case where even an ARM64 system would have a NULL
    default_domain.

Using this we can apply the rules:

a) ARM_DMA_USE_IOMMU mode always uses either the driver's
   ops->default_domain, ops->def_domain_type(), or an IDENTITY domain.
   All ARM32 drivers provide one of these three options.

b) dma-iommu.c mode uses either the driver's ops->default_domain,
   ops->def_domain_type or the usual DMA API policy logic based on the
   command line/etc to pick IDENTITY/DMA domain types

c) All other arch's (PPC/S390) use ops->default_domain always.

See the patch "Require a default_domain for all iommu drivers" for a
per-driver breakdown.

The conversion broadly teaches a bunch of ARM32 drivers that they can do
IDENTITY domains. There is some educated guessing involved that these are
actual IDENTITY domains. If this turns out to be wrong the driver can be
trivially changed to use a BLOCKING domain type instead. Further, the
domain type only matters for drivers using ARM64's dma-iommu.c mode as it
will select IDENTITY based on the command line and expect IDENTITY to
work. For ARM32 and other arch cases it is purely documentation.

Finally, based on all the analysis in this series, we can purge
IOMMU_DOMAIN_UNMANAGED/DMA constants from most of the drivers. This
greatly simplifies understanding the driver contract to the core
code. IOMMU drivers should not be involved in policy for how the DMA API
works, that should be a core core decision.

The main gain from this work is to remove alot of ARM_DMA_USE_IOMMU
specific code and behaviors from drivers. All that remains in iommu
drivers after this series is the calls to arm_iommu_create_mapping().

This is a step toward removing ARM_DMA_USE_IOMMU.

The IDENTITY domains added to the ARM64 supporting drivers can be tested
by booting in ARM64 mode and enabling CONFIG_IOMMU_DEFAULT_PASSTHROUGH. If
the system still boots then most likely the implementation is an IDENTITY
domain. If not we can trivially change it to BLOCKING or at worst PLATFORM
if there is no detail what is going on in the HW.

I think this is pretty safe for the ARM32 drivers as they don't really
change, the code that was in detach_dev continues to be called in the same
places it was called before.

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

v8:
 - Rebase on v6.6-rc1
 - Adjust comments for ops.default_domain
v7:
 - Rebase on v6.5-rc6/Joerg's tree/iommufd
 - Most of patch "iommufd/selftest: Make the mock iommu driver into a real
   driver" is now in the iommufd tree, diffuse the remaining bits to
   "iommu: Add iommu_ops->identity_domain" and
   "iommu: Add IOMMU_DOMAIN_PLATFORM"
 - Move the check for domain->ops->free to patch 1 as the rockchip
   conversion relies on it
 - Add IOMMU_DOMAIN_PLATFORM to iommu_domain_type_str
 - Rewrite "iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()"
   to be clearer and more robust
 - Remove left over .default_domain in tegra-smmu.c
 - Use group_iommu_ops() in all appropriate places
 - Typo s/paging/dev/ in sun50i
v6: https://lore.kernel.org/r/0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com
 - Rebase on v6.5-rc1/Joerg's tree
 - Fix the iommufd self test missing the iommu_device_sysfs_add()
 - Update typo in msm commit message
v5: https://lore.kernel.org/r/0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com
 - Rebase on v6.5-rc1/Joerg's tree
 - Fix Dan's remark about 'gdev uninitialized' in patch 9
v4: https://lore.kernel.org/r/0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com
 - Fix rebasing typo missing ops->alloc_domain_paging check
 - Rebase on latest Joerg tree
v3: https://lore.kernel.org/r/0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com
 - FSL is back to a PLATFORM domain, with some fixing so it attach only
   does something when leaving an UNMANAGED domain like it always was
 - Rebase on Joerg's tree, adjust for "alloc_type" change
 - Change the ARM32 untrusted check to a WARN_ON since no ARM32 system
   can currently set trusted
v2: https://lore.kernel.org/r/0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com
 - FSL is an IDENTITY domain
 - Delete terga-gart instead of trying to carry it
 - Use the policy determination from iommu_get_default_domain_type() to
   drive the arm_iommu mode
 - Reorganize and introduce new patches to do the above:
    * Split the ops->identity_domain to an independent earlier patch
    * Remove the UNMANAGED return from def_domain_type in mtk_v1 earlier
      so the new iommu_get_default_domain_type() can work
    * Make the driver's def_domain_type have higher policy priority than
      untrusted
    * Merge the set_platfom_dma_ops hunk from mtk_v1 along with rockchip
      into the patch that forced IDENTITY on ARM32
 - Revise sun50i to be cleaner and have a non-NULL internal domain
 - Reword logging in exynos
 - Remove the gdev from the group alloc path, instead add a new
   function __iommu_group_domain_alloc() that takes in the group
   and uses the first device. Split this to its own patch
 - New patch to make iommufd's mock selftest into a real driver
 - New patch to fix power's partial iommu driver
v1: https://lore.kernel.org/r/0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com

Jason Gunthorpe (24):
  iommu: Add iommu_ops->identity_domain
  iommu: Add IOMMU_DOMAIN_PLATFORM
  powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
  iommu: Add IOMMU_DOMAIN_PLATFORM for S390
  iommu/fsl_pamu: Implement a PLATFORM domain
  iommu/tegra-gart: Remove tegra-gart
  iommu/mtk_iommu_v1: Implement an IDENTITY domain
  iommu: Reorganize iommu_get_default_domain_type() to respect
    def_domain_type()
  iommu: Allow an IDENTITY domain as the default_domain in ARM32
  iommu/exynos: Implement an IDENTITY domain
  iommu/tegra-smmu: Implement an IDENTITY domain
  iommu/tegra-smmu: Support DMA domains in tegra
  iommu/omap: Implement an IDENTITY domain
  iommu/msm: Implement an IDENTITY domain
  iommu: Remove ops->set_platform_dma_ops()
  iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
  iommu: Require a default_domain for all iommu drivers
  iommu: Add __iommu_group_domain_alloc()
  iommu: Add ops->domain_alloc_paging()
  iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
  iommu: Convert remaining simple drivers to domain_alloc_paging()

 arch/arm/configs/multi_v7_defconfig     |   1 -
 arch/arm/configs/tegra_defconfig        |   1 -
 arch/powerpc/kernel/iommu.c             |  38 ++-
 drivers/iommu/Kconfig                   |  11 -
 drivers/iommu/Makefile                  |   1 -
 drivers/iommu/arm/arm-smmu/qcom_iommu.c |  45 ++-
 drivers/iommu/exynos-iommu.c            |  73 +++--
 drivers/iommu/fsl_pamu_domain.c         |  41 ++-
 drivers/iommu/iommu.c                   | 259 ++++++++++-------
 drivers/iommu/iommufd/selftest.c        |  19 +-
 drivers/iommu/ipmmu-vmsa.c              |  50 +++-
 drivers/iommu/msm_iommu.c               |  30 +-
 drivers/iommu/mtk_iommu.c               |  30 +-
 drivers/iommu/mtk_iommu_v1.c            |  28 +-
 drivers/iommu/omap-iommu.c              |  28 +-
 drivers/iommu/rockchip-iommu.c          |  26 +-
 drivers/iommu/s390-iommu.c              |  28 +-
 drivers/iommu/sprd-iommu.c              |   7 +-
 drivers/iommu/sun50i-iommu.c            |  35 ++-
 drivers/iommu/tegra-gart.c              | 371 ------------------------
 drivers/iommu/tegra-smmu.c              |  44 ++-
 drivers/memory/tegra/mc.c               |  34 ---
 drivers/memory/tegra/tegra20.c          |  28 --
 include/linux/iommu.h                   |  18 +-
 include/soc/tegra/mc.h                  |  26 --
 25 files changed, 516 insertions(+), 756 deletions(-)
 delete mode 100644 drivers/iommu/tegra-gart.c


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.42.0

