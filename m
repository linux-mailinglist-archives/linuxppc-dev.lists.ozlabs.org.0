Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE55759507
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 14:20:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b3JGyjz6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Zf25CG6z2yDH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 22:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b3JGyjz6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::630; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Zd42MN2z2xq8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 22:19:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxcvRdKMSiIVO/ROapHDNl+sFBiLyG8Qyy/DPgKmeLTmwSEqLXnssyHUzhXQoMjxlY4+jmgwwDMYs4A32VHzi8ddDQwtfJF6kFAAQrgtFnUOuJ424jL+tHXdZTSz0AIipOtbhPRHlqIXwOOjorV75RWMbG+a7IHoMa9pd/3D0pZ9JEpS5NJnMkoTFPvUjDgCaBiUJ7xiecnDrAYecXKyDHIVmg6L1YKINejt+TBuZEr4r1OAkgNQiD+kmoHcm+nOj2HHCQWSTYSGBmP8Zd7nH083PMWjy1yP2H8ckO+CtrCiAAkpxs5mGXK6WdjZ/blFLtGOI4/285O1UZ5H7LoJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HBFfmuWX+KisCpXWf64RQbJUrhoe7H9Ws77F0iR518=;
 b=ZdHgEGnKsSQVM8iit+i/HPE68pRoDyrid+Xynz/ytD8DRGacIYo9wzz7Sf5j7CdW0pfLYjNQR/kG45FBOBU+SVNIMaF7IeSMZ+bs9C32O5+Eio0sljySYizrSBZOvZADoexnL9vtAEUsQLK9pSxiLpVWrY4sFfVfRUYcdKcTUb+6pMBo7kI1OEX7cdR5XWFPv7VPNnSUUyDFjMKdbEKoUgEfay9cwQLY8H4OeiL2+J9X112vxKCn0kmMVDA9FAMTI5v+3wKQbRELnZEwcOocw/a7hADlrgRkokcScedDDlZQ5aAuP5hX6BcrZ5fOuAEfTIs2/Fv7Scbs4s57m7l1uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HBFfmuWX+KisCpXWf64RQbJUrhoe7H9Ws77F0iR518=;
 b=b3JGyjz6Rabi1TIXbOBHMGXTJ4Brqh1FK1Y8P9ZV4/TgHG+TLpxWCJvE+LH7mbYa+MZjHLXSycMUa08qxwMx/QqpFes6Rv+O5vWvVMex33fB6Wmw/8fs/LzlKMB1VIjD9FMlbdUql4yv8ByyBf3/RpZ6ssLDnkP5Yi9Fo++xZL4FpErfpIWKwgXHGVUQFyPMjfCGZ0uaXhRpcRao9h7CPxXoEmtJGvPdaOmNpwAVi6bRY8XBxXN6JQoRWO3YYBXZ0pNXdexINSMRqbD+TwlFrGhFCYteQi1rMox3IVPJuvGB9qmoGlRWhteXFTqzQHZs8PM82F4iuQgp/XNKllCs1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by DM4PR12MB5359.namprd12.prod.outlook.com (2603:10b6:5:39e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 12:19:12 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:19:12 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2 0/5] Invalidate secondary IOMMU TLB on permission upgrade
Date: Wed, 19 Jul 2023 22:18:41 +1000
Message-Id: <cover.de78568883814904b78add6317c263bf5bc20234.1689768831.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:10:31::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|DM4PR12MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcf66c4-d07d-4448-41ae-08db88525bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x+KpCdqXtF2RiqWzbw1gZ5EVOqrKrifGtpa6gmgrljggrjKiPHu7KJMNG+2L0zm9uu05yx/oTHewU1736DWNeSd+GK0pZm8Do9n0kaEDE5MpiYEpME4fGjN5zA/4L1TQ9jvyxM082XA5Yr3i1ummFPYKcqjgnVU0lndx+4t3DdsKpgPOl6sRne3LheUHObkoS77GdG+PaWS0PE8EPZt08KD6bMudhi9lhuGYA0vJ7gbHZh5Sc0wUEQtc6HSzwPXEceR1pDj+tEMHabgkaOeq5eUI+9bAGumeEz19ZWjvc/3CZZF39ws9s9B4Fx1ePpsMjFD97KGZgPovOaBB0nlarzj297HcL2onv9UCgAfFVPVW18U9qbM6kpWAgZ3H3NkRSzQDSqUHzwig+m2VFL3VKMpwTbcNqx8k6rhT4A7zjbW8/Vi38W/+O2OjpiV/UUaAhZWttZL37Gnal+VqdP8aAlgZXwUd9z49FoF3C/BZp6I640awUWzMghR/Q2MOQSJ7NcCWdmXzSOwx4JYOrJBMVn2smpjxBK6glM+2iVQVkel57octUI3vRoePJkThH49v2rx4OQrjfMShiu93v0jEbPJzqdkTeFCzCmdk876gnETvWYgY/Bq8O0iyoI7FldmqWpKAikvzwOKcsqpYc1iNJA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199021)(26005)(5660300002)(8936002)(478600001)(8676002)(6506007)(83380400001)(2616005)(107886003)(2906002)(6512007)(38100700002)(316002)(966005)(186003)(7416002)(66946007)(66476007)(66556008)(6666004)(6916009)(4326008)(6486002)(86362001)(66899021)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0hf3Rs7ImCuvoIMz6aQPf0OpI2uZuHcEB0rDUASEZCRROui7+JKWeNPvRk0c?=
 =?us-ascii?Q?pyySIsgVKOTeu2jGcZ7MSZ2OuUTVX6pUb/afDcT4zcmZG/4fC8d+PKGmCk4V?=
 =?us-ascii?Q?0zKsdHtrQZzKtHlgIK381vtbBi8yJ4uuLTbH+N0m2iL5O1BOBXZ8y7S9KF/R?=
 =?us-ascii?Q?MB2fVHtpmMtjBEk+3MDVG+OjartT28DaNAef0aRz5XLR4UZJNdZ4TkcBv0KJ?=
 =?us-ascii?Q?3Xx0eR+2Hd2L0KhU8RLym+mpEhP/Lb4YMwSGJjSIRfy1Ug2zySgjoAlmCE2H?=
 =?us-ascii?Q?WKaPomVGV//phAYTk8npEhv8HYDHzAD01NE2F/BahftH2dMeGRszzCv/VoJC?=
 =?us-ascii?Q?JoFInkHIUBLcCb8DbwSo1w7eybZ4zH+cBViM7F26LlYuSxPIVaEj+SoAKCg1?=
 =?us-ascii?Q?CWdbOIc5j6GHWhMs6yUnDpFcbB2bZGD2IiZQmkYU3o40bW/WIOoqm1J2sjyz?=
 =?us-ascii?Q?5/iiRaNP8TqmYAMWrRB8pn+4yZD7n/iFIx2XjA/16HNBREQHS6P9vJvFukG0?=
 =?us-ascii?Q?WTttY+qAwOkSnE+p5sVbw3RB1+aTlunEc1ruOnAtKpz95avBatIAJBwsYDrZ?=
 =?us-ascii?Q?mHEv+R9phtSHRgOx3eJU3mn1klsZ+m0eL/fFLIa4+3kzopo/Z+QcS5e1wnlk?=
 =?us-ascii?Q?ADQYD9qqa++3iHICWBZzr+nW6cRp5zILH7W2UWUN9Xtn+k2x8agJ90a51UtH?=
 =?us-ascii?Q?bbUAnows1BKxx0ltwsOPv9hQ5SSwrf8Ks7TKSb+dCHGa8qA/j+jUjQ54+/nf?=
 =?us-ascii?Q?5cx4vIR1DM3h0OvHAoDFOeoHAZP09TP5eXIeaRyr1Ne03bL+xT/VB9sK6iHB?=
 =?us-ascii?Q?H5gkARJcozuTV5/L6ReShHqcHa8AvbzGVcCxGb0juBcXC3Rvszt8iTlU0fYJ?=
 =?us-ascii?Q?u3nJq7GfS83gJNdcL7TIZ5SFbeDcnk1YyC4uofxL1mZozd2MJ1cbHv4MKq1T?=
 =?us-ascii?Q?81nZG5agiu0DdQivBuDY+zKLPI3vsaH6qgbRX6gU/073y+iVcqQdFqzFEJDJ?=
 =?us-ascii?Q?iT5mfcx/zt3TGpbG2Tn1E87k+Rx5mqxgjvysR8o4NHTH99C7YHOjtxuNWbE+?=
 =?us-ascii?Q?kUrpRrVaLMQBJzvfQdAakXQ60p6x2XelaOMFucj2hrTH8ggtF6Rtqw/thYPZ?=
 =?us-ascii?Q?UjU0yoQI3tC6PD1YRc4nff55kQMbPQro7PsASjpOfYfo0//pmPfBbTEihA3r?=
 =?us-ascii?Q?5gMhp8JDDXB6sec83ADX7AUbLsOxZcCAdfy+Qs7cmGfCpQPWwenaCKR1rB5W?=
 =?us-ascii?Q?2VdixTIuRwQkljlKtpHfQ90Q01i0+uKE4IKhHRB6PRgwDOUz8g1WqFuQpCDI?=
 =?us-ascii?Q?VrVHCGygkq5Xs9cctLkCQsiVqbRRz2ZePGQJiVp7bd6t7oCyTAynYGkosERS?=
 =?us-ascii?Q?1MxVEGDR6xTSq/gxjIKcyCxb0wWsNrquYwBrBEriK4+Sk/+n3pHACTSrHK5z?=
 =?us-ascii?Q?Xhc3Px9V/tsQ64huYWvVwRMOxAzJqJPttkN5eVInkoSIftpSvma5Lahb8teh?=
 =?us-ascii?Q?AFp6+zMr7Pw7+bWxkJwG3zZqcrIUVLVMMGQVDL18DIsGRLnlE/YDUJQGn0qq?=
 =?us-ascii?Q?VecUaaME3I1PT9FzL31RehRitfMEtDD8o0LFI1fk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcf66c4-d07d-4448-41ae-08db88525bee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 12:19:11.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgwO6XJYMRm9OpKdQoWu3hIYwu8vPpN7nwo14iiwz6K7tqdLaSyR2aoT9RLJx1f84xJBSZq+4g2WFdV4f+XAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5359
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

Changes for v2:

 - Rebased on linux-next commit 906fa30154ef ("mm/rmap: correct stale
   comment of rmap_walk_anon and rmap_walk_file") to fix a minor
   integration conflict with "arm64: support batched/deferred tlb
   shootdown during page reclamation/migration". This series will need
   to be applied after the conflicting patch.

 - Reordered the function rename until the end of the series as many
   places that were getting renamed ended up being removed anyway.

 - Fixed a couple of build issues which broke bisection.

 - Added a minor patch to fix up a stale/incorrect comment.

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

Alistair Popple (5):
  arm64/smmu: Use TLBI ASID when invalidating entire range
  mmu_notifiers: Fixup comment in mmu_interval_read_begin()
  mmu_notifiers: Call invalidate_range() when invalidating TLBs
  mmu_notifiers: Don't invalidate secondary TLBs as part of mmu_notifier_invalidate_range_end()
  mmu_notifiers: Rename invalidate_range notifier

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
 mm/mmu_notifier.c                               |  49 +++-----
 mm/rmap.c                                       |  40 +-------
 18 files changed, 110 insertions(+), 211 deletions(-)

base-commit: 906fa30154ef42f93d28d7322860e76c6ae392ac
-- 
git-series 0.9.1
