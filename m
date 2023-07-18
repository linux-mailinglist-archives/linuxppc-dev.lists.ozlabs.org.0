Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A337575E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 09:57:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=of2EN7Nu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rsX6tnnz307y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 17:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=of2EN7Nu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::628; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rrb0ltQz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 17:57:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByP+qqYh/7S6PlXQbNlUnF/Z+KpERLnq7yr5Ab94TGYPVefiKkMCd+EVlsCzZVoL9Ed8LlmRAV84ZFa6yyBnCVdG44r2nkPA6JxYTRKfnVu8lqLG5Ls2RHXHaxKAZGXSjeWT9tE/QAQzu0we3vagjhARp0/PYL8PydYbaiK6hdJjdilsKiuRUy4LqvsNuyuky2ZDedt9lEt1i3qPzTlotsHcReHkfhTHRatBk6bGR2xKJopiKbSE/d//QD/v3bB+r4E4XJ3WLqe0HYjqnpfAoc+jBWTI77I5aqEU7LhlA1hV4+Ztkgxf9Ey7Qtw17Yc0KaJz8JwSplqenFhxTxQI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTfyLNkCP9i0UGNIpXxEg8A/BFVi8sDjCvnx6knX+ZA=;
 b=UPVMFlpR4oCBvnf7JatujujE7+6Qo2myb3MaOK9mvd9Zazrte18d2RL0xT5cmQJkFc9hYjkOB5un0EUQmdhwHRQfIWtKW4WPm1ZkeWK1efGfvXcpkulgFX+ZB1aR8oUHo7KlVXL7qqvzhA/2ckl7pW1R/j/MK6KbJvzbKBvwbxAf7U/tF44qc1LUtkkvnwkdCLjFu3JUfzzojJfc8P3IJwsVHRWGYV8XsosVnDICGsJjRAgCYjXsisdx5eJ7I+Za+OGySK98CPDpbrZl2Ql1BH7fcsf7+KtN9psqI1GV/QK4zK5Y5ZtyafIsnODDCGpiRjPq2wpcVD7QjTxWZOv2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTfyLNkCP9i0UGNIpXxEg8A/BFVi8sDjCvnx6knX+ZA=;
 b=of2EN7Nuc0wNDYDp73talkyv67RSOPxK/y6Q+us6dzaGhf17hfwt92nwluH2kIjpvYOIaNiM8XEyBN59bnH+M7cKY8qMF/SoIH34mklf86UeX1uC2SnTwZWzx0u3UTJz9bnDiOz6KFU9u/JPjwjWk9kQ7focfDNCZ4MnQe0S/vTZNTrSJrNTPBCVmGo3IN18t9JOn/e/8nMPPvqHXu+xL7/UpmZj+qBKEJcYRKZCHHZHx1m7WkTcBlIK4xIrY/C3aaRB/7hMia+3oEHGAwttlCD1bULInDbILQbH6dPqknWH6FbZnyZmAswqBqSiLLH+lN9FX857IcyGuM/srduwJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 18 Jul
 2023 07:56:37 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 07:56:36 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH 0/4] Invalidate secondary IOMMU TLB on permission upgrade
Date: Tue, 18 Jul 2023 17:56:14 +1000
Message-Id: <cover.b4454f7f3d0afbfe1965e8026823cd50a42954b4.1689666760.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0069.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::20) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef8032e-8ec2-4372-77c7-08db8764825d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nyuYXX+bIb3FZJpedkfce8cIgfi5MW1t9dxcfFj609mbN2ga0GZt5cszMrKIWqIXp1kTYLYVtaSuowGAgi9S/c+e68dvkXqZNEpeY/Y41xaWkAEf8+Yc0thKwhQkKk93KgoleAwPmIuyuJeXWesqQC/+7Qu6zoRieavDyB+kY2XHCUuolFnfC7iHxUk1AZg7uAxdieMpwn77GZwch99NFd3qiJ5DHQqdBtVkcHBoqk7i5POQQQW4Pa4ztUj5QRsOgwkVZDIqAltLSqAeD0cnvmYeMs+Hg6t1m2YKY+ySLLct59BA40fvjmzZfufHLK7bD7wbDA8H5LEQuVulMu20Ra0yvMB2bT1ErhX4LxyJmaA2+2ViRkZewFrSlgVHQrf5t5e7Ug5FQpLydi5/Q4Jx+ggedDnl3T9iHq77ZnrjkQdLSIHfUDWsh/LskyNknKxEu2vmNMr5hO2IbVL876igrml0u9B19x6VpjAC3F8cobYAW/d7ou+OQ5Ygv7lzsO3mjK23iXVyPcYBo7m2Yhrf2XQ+wqsVs9VsiAAKY4zGl7e31aWPvnZOXFe+DWKsyMd1AX0yCngxjBrV9zQbMPHXpZvkug1YzKMMJA3LdCotNkpiyfP7PEgRuZmA2ca+nJlQZzHDwJywZIdERV+TIPh+Ng==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(38100700002)(36756003)(66899021)(66946007)(478600001)(5660300002)(26005)(41300700001)(107886003)(8676002)(186003)(6506007)(6512007)(8936002)(966005)(7416002)(2906002)(66556008)(2616005)(6916009)(83380400001)(6666004)(316002)(4326008)(6486002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4IGkTle+hYeCXqjWhTc6z9wzsg7a8rNpHOtBPHIFqoGOk8lUtDVDghVijce3?=
 =?us-ascii?Q?77UcQcB0WHbIskZWiVWqI1c8kiNPldZZdxphHP7hpysjHZ48LChwfRjSPjyM?=
 =?us-ascii?Q?7oTLulPSbFSIFkxksIof/IwRS1tef8CEa/0POgF2EIL/rR3E/C9KC5y1ld9q?=
 =?us-ascii?Q?n3UHy294I5NQy4Q9eiozG4YqKdAL9cFZYTjBEX4HgqDB1Pck/Bft8LHzAZeV?=
 =?us-ascii?Q?bFYxAp/AhLGi2ae2XJIJij83VEPoZg71v9arhA1RaVamUIcgplDXZqvyMTyL?=
 =?us-ascii?Q?UMfmK9CbEhLy4D0DPGUIkLVrfGCfzQwQnaJ7ZvXP5Ja8BhDQ547ZAYHgCrCh?=
 =?us-ascii?Q?3hvS9Sq28c4AbbbDb5ojPRrgNnlVSozmLHLh5ZSoJddoImFqPJDd/mqiGzV4?=
 =?us-ascii?Q?5nkIbR/FzMm0zNpPng0ul9mwlxXFQcPHZHnqDdyF5WHm484P81rS7/NtASka?=
 =?us-ascii?Q?T7J7a63MVJOfqGHiLzgDn3PsF88VLyjxcA9ReYqTJvXKBNPJoV8s6X8sCGvA?=
 =?us-ascii?Q?dISSfaYL8QMM/6e2WWer8KznXJAbUtbFB5dhZoNeJCqOv9lsq6sRUIQHF82T?=
 =?us-ascii?Q?71xLmP+d2eUTdJTRSlZf0NboJfYkEmJ2k2oM1TVQH5jsCP5G9ptqJCetpjL+?=
 =?us-ascii?Q?PVwaveB+N3CDg/YapqWPdk0tvcpt7/6hGB0OSQdPnbFeijG6SJm1MY6BfxRH?=
 =?us-ascii?Q?fIEwpKhYd/9BEIiv/B8U+k2QCYT6aX1mHYv4VQfOJtz7NgodXXBofbpma5Oo?=
 =?us-ascii?Q?6ZqYXWN3OdNsKW9jzYAf8q/qzA1qiztAwwmjQjva5st+sf135k3rn09OXQuE?=
 =?us-ascii?Q?/qxIEBVGbaD0na1dzDohN3mokk1mll7+5LMwjbOqW4aT4HQy9pLicJdNo/TH?=
 =?us-ascii?Q?WZSPeDucdBTq+gPn/uL+gtdnPCarIDc0SwKCEyLHvIBHq7qO8eV5s9iOgR34?=
 =?us-ascii?Q?WuzjkqJ5RwN1wYL/1OnvHYcFDm7PxL9CZmQ2S7D/NQ4tRkA296hBEacoUSaX?=
 =?us-ascii?Q?sW4eoyHiGVZcd625PhKF0WFwacDimkS2zap3EXxZQYCbhGTz/eu2KcHvhHhO?=
 =?us-ascii?Q?J7F97npLDRNi0t9Xdy7FETBfAlPxeKP+xVjA9oId4yVUCBWSZ5arjDlmG6uJ?=
 =?us-ascii?Q?QyMOFdYKztpFJknPWKmc5FAaCv7T5erfeahB1hltU74Bwl2eRefhKHngWJkb?=
 =?us-ascii?Q?VIAZlVQNirB7W1qQqh0V82Z/t1PRc9zCqOTCD0i35fNqq07tJwlPrSVa3hKf?=
 =?us-ascii?Q?B3hYJ9Olmd3ByOm5NfTlTmNb8hacmxcsDPLc1JPKeNPV7OBsGYJ3/6rUO/n6?=
 =?us-ascii?Q?GME5L64/T1W+1fk27BjEbbQUMXi9I8N1Cn1SmDNUwuPgs1+nOai0XARIRfp0?=
 =?us-ascii?Q?HMcxjbicpH1wegzsBY7WSuLghrStTNOfL8Wm2wTKJ43evA6ea8iyjoUCUfKD?=
 =?us-ascii?Q?FPTrez0NILnPlj04YtupZWNQmW9AH7UqFmDfmLTpQI7Ai2h3Ea+2WVm+3MQl?=
 =?us-ascii?Q?Cqbb5ykun7hB9SQjRELgYVtd9PTdHoeM+GQXsL1B33x7/KLbW72KKRjJN9l7?=
 =?us-ascii?Q?YILHN4/K8VBpr+hleIHPX6pACcGxc8epne3mHVfA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef8032e-8ec2-4372-77c7-08db8764825d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 07:56:35.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYGl4G1NVFpyj/khwDs0GtCWesz2NH4u9CROibzMq+ZX0NiURtxp06MSmwv6mYgRvw4acQ+5OmHoX4AfXOf0FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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
Cc: Alistair Popple <apopple@nvidia.com>, kevin.tian@intel.com, x86@kernel.org, ajd@linux.ibm.com, kvm@vger.kernel.org, linux-mm@kvack.org, catalin.marinas@arm.com, seanjc@google.com, will@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, zhi.wang.linux@gmail.com, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, jhubbard@nvidia.com, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main change is to move secondary TLB invalidation mmu notifier
callbacks into the architecture specific TLB flushing functions. This
makes secondary TLB invalidation mostly match CPU invalidation while
still allowing efficient range based invalidations based on the
existing TLB batching code.

==========
Background
==========

The arm64 architecture specifies TLB permission bits may be cached and
therefore the TLB must be invalidated during permission upgrades. For
the CPU this currently occurs in the architecture specific
ptep_set_access_flags() routine.

Secondary TLBs such as implemented by the SMMU IOMMU match the CPU
architecture specification and may also cache permission bits and
require the same TLB invalidations. This may be achieved in one of two
ways.

Some SMMU implementations implement broadcast TLB maintenance
(BTM). This snoops CPU TLB invalidates and will invalidate any
secondary TLB at the same time as the CPU. However implementations are
not required to implement BTM.

Implementations without BTM rely on mmu notifier callbacks to send
explicit TLB invalidation commands to invalidate SMMU TLB. Therefore
either generic kernel code or architecture specific code needs to call
the mmu notifier on permission upgrade.

Currently that doesn't happen so devices will fault indefinitely when
writing to a PTE that was previously read-only as nothing invalidates
the SMMU TLB.

========
Solution
========

To fix this the series first renames the .invalidate_range() callback
to .arch_invalidate_secondary_tlbs() as suggested by Jason and Sean to
make it clear this callback is only used for secondary TLBs. That was
made possible thanks to Sean's series [1] to remove KVM's incorrect
usage.

Based on feedback from Jason [2] the proposed solution to the bug is
to move the calls to mmu_notifier_arch_invalidate_secondary_tlbs()
closer to the architecture specific TLB invalidation code. This
ensures the secondary TLB won't miss invalidations, including the
existing invalidation in the ARM64 code to deal with permission
upgrade.

Currently only ARM64, PowerPC and x86 have IOMMU with secondary TLBs
requiring SW invalidation so the notifier is only called for those
architectures. It is also not called for invalidation of kernel
mappings as no secondary IOMMU implementations can access those and
hence it is not required.

[1] - https://lore.kernel.org/all/20230602011518.787006-1-seanjc@google.com/
[2] - https://lore.kernel.org/linux-mm/ZJMR5bw8l+BbzdJ7@ziepe.ca/

Alistair Popple (4):
  mm_notifiers: Rename invalidate_range notifier
  arm64/smmu: Use TLBI ASID when invalidating entire range
  mmu_notifiers: Call arch_invalidate_secondary_tlbs() when invalidating TLBs
  mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()

 arch/arm64/include/asm/tlbflush.h               |   5 +-
 arch/powerpc/include/asm/book3s/64/tlbflush.h   |   1 +-
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c    |   1 +-
 arch/powerpc/mm/book3s64/radix_tlb.c            |   6 +-
 arch/x86/mm/tlb.c                               |   3 +-
 drivers/iommu/amd/iommu_v2.c                    |  10 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c |  29 +++--
 drivers/iommu/intel/svm.c                       |   8 +-
 drivers/misc/ocxl/link.c                        |   8 +-
 include/asm-generic/tlb.h                       |   1 +-
 include/linux/mmu_notifier.h                    | 104 ++++-------------
 kernel/events/uprobes.c                         |   2 +-
 mm/huge_memory.c                                |  29 +----
 mm/hugetlb.c                                    |   8 +-
 mm/memory.c                                     |   8 +-
 mm/migrate_device.c                             |   9 +-
 mm/mmu_notifier.c                               |  47 +++-----
 mm/rmap.c                                       |  40 +-------
 18 files changed, 109 insertions(+), 210 deletions(-)

base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
git-series 0.9.1
