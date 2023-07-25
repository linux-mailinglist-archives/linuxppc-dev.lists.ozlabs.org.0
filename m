Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DD6761A3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 15:43:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TBcCSAbk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9JC70kB5z3bYt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 23:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TBcCSAbk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::609; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9JBD0G75z30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 23:42:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRoI4/8VunNQhvRDqeFGG+nav21zmlRcfEPyYfrhQC/4Rs4/Z5fpj5mkKNPFDQr4AX4jq+5zwLC+hIKosNdf/bK9LtRI5fiWej0rs9AXZgtR0Sct3GPX9TOgJXmeHZJB+e0Kzct6U84PlQ3ovtwaNhNjyQz+C77pSEGAyTGn0CnnaaD+szv42ML40kZj7g/eHRgdCYm6ua7qmhSkskdHi2JYl2AhBZAofOUkFBB10DyQ0kLsNzoW/F6t2/ekxtRQLybPIfocW2HvvjV2TfsBa4xQkLXwJ5VzlHKTk0cVgWTrg9rDGpHrB1RGa9vjRGBHrWkHR61gZU9g/CVJ3aPSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyyDarhn0EZOYCN+tIdqU4Xq964oX7IdVcVrjs3dUuI=;
 b=fsPkjnTvJpDo/M0Np4AfXQZjitWz4+NIMkiOtrtI2N9Q05xSSsXcjHR2rC+tKXp68JInKEkrfu0xH9w/cYnHkW9fytl5tiB8GgJ+/avcJ62ssPWfx+3CYc8kyKuD8dh7kd2RcuBNKcH4Ots6cUCZHdPO55z8lFtZdGtVXnHqG6kGxaXAeGpWtMcTInIqMV4XvPdrmpygzo9UnCe1h0GsYMvGw+T7WmsF1QVo2W8M3mahWVb6ji697zh3ECKGLPA1xrb0chglFWCmQkC+rpBMjxucsuM1nBRVXuaBy5W8WtnwXY9PvinhXs5RQ3oQXpEmLScAmnz699/za9gSLyhvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyyDarhn0EZOYCN+tIdqU4Xq964oX7IdVcVrjs3dUuI=;
 b=TBcCSAbkEQ136vesp9E+6H0MFq/p2crCSeoyb8wlDmayJg35Em+Qbt1ASu0r0HrtKVIcjp0NUr1iLQYm8j4m9ImgrROC6QIZzKp6LGJIAehI7bsPsk9pbp7Ux1PsrTZC052lK2MEEzR988u3/RvExkfsNyrFr2dEVAYlXSOkiLIeEBVF0zJ617cXOXygrWX1IfK1rDaTucyjaS5Omjv697IKE4BNZBc0p2YTR7NM4VrfLUlHrsWaKY2FgQxH6C/40ClmfAykZ23ZnZ3ObFJHLywAGyYLLBRkw17rETJa74hd0oS8mV0qRo9b8b6sqmVtokicK/KSAhqA634y1W+d7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by PH8PR12MB7327.namprd12.prod.outlook.com (2603:10b6:510:215::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 13:42:19 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 13:42:18 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v4 0/5] Invalidate secondary IOMMU TLB on permission upgrade
Date: Tue, 25 Jul 2023 23:42:02 +1000
Message-Id: <cover.1eca029b8603ef4eebe5b41eae51facfc5920c41.1690292440.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0145.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::9) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|PH8PR12MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa33fd3-bddb-42b6-9968-08db8d14f707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4yr+8pL7Xtf5U4AuATof+mgWpUUvzYMXQGSqJZrzSWVIlmaR0/qH64As4e2lh6E4lLn187KReFEn/Ti4Li+tK60gCHD5hCHdPA0ea3JE2Ha9fuVMGJ+s9CHi8V24em2E2TXKUsNdEVBkgujSE2f7GdtQIOhJ8dYkaVfUfT6o14ix24KflNRBQ4QyNdzmf3SO/vUds+3JB/fPgOQSWvbtXn0/Lhg0s8w6EHlXKKNVsC9r1IBnsT8mwUZKQ0MoH23omylcFXX/5XLpDBav2Orj6ESXHx6l0cwWSfHC3E1oBP7FYkT2WnbXXtYZ4JSxBNYucykqEecHDoNGtWCgwDFaDP9bhZ8EpfQNjZizF6s4W3tKIWsSgFygznK/ryUvWu4LXzTkgdt52cWSCnN/j2E/3xpU7CcZH1YwyyGvBekYbGpDelRJ1S9pJKSjQhzIcdeRfz4tYP/WjMF7Ffen3k02HyK1TFZyy4F7+0iJrEEx+YJq95IOnDYEWS/O6J2w2F6k0NW0dAQjQl4sE9TxiMMGC6SOmQWgqKI13ZLcz9CgoDuBSXzgYnVnC3tNneCvjy0PsPum126h9OIAvQLqPTlNprldufP5bkXMtxh0EKDVOUzFC6e4dv/FMIdhShnhrAZ9P95zQdeHqi6IPvfmUABe+w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(966005)(66899021)(186003)(2616005)(26005)(6506007)(107886003)(316002)(41300700001)(66556008)(36756003)(6486002)(66476007)(7416002)(5660300002)(66946007)(38100700002)(2906002)(4326008)(6916009)(8676002)(8936002)(83380400001)(478600001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZGPd82TY9cWOGJ98hYIVe4gAbqdlGukOP9KCiGTIw1S+6tM+W8keTK+FpWOz?=
 =?us-ascii?Q?fPGux4+NfdvCbXPM5pkgIA+XMkvcGRnktKN80qUmhc6oHjbzU7yb1l8Pxi+n?=
 =?us-ascii?Q?zdaMsPrj88DaYXZA6maOjfa8FrvCGNbYXeYGT7UVb3KUOPveZaEbBZ61Sx7Z?=
 =?us-ascii?Q?BQqFwpLH15NCdrccPcIvAXOn9ZPJ/DrJxgsMtj427NhrpWgYw5PZxvpJWuGg?=
 =?us-ascii?Q?/eOXdGO1FianH3BeanGIJeidxS8M+M7RJAPBoklsjqHo0LXwdbC61fzWzx3D?=
 =?us-ascii?Q?pu1YDpraf8bvzG8fZRvfzJUHmwPxCl+OUkkglnACtUFA+oN+qkbg5lStTKL0?=
 =?us-ascii?Q?vFUHrJpNnMMdIplylTtcNLXnZ0bhkDF7u+ALuCWUZ2GsbYI1AQY9H71RHf2p?=
 =?us-ascii?Q?5SiytSVUVIRwWl/yhpALJfEnM6ZNI3CAsOc2dpUnL6Wmr/5Fnv3idXlg6JUx?=
 =?us-ascii?Q?ilEOYPgsKxQA7bwUQDWV7C8TW2rg6v3bWZoA1Xlj/RqLPF4cK9+b1K3tTXEh?=
 =?us-ascii?Q?uW/n6hXc8031SSLkWSJb/XiIp6XQYyoiMohqHLYfKNn+ZmJymIZXkra3JhNA?=
 =?us-ascii?Q?FBDELM7ohADrqyNL9nqaG9ROwxNUQtDQPtjd0/kw0LOlK28G/4XzqqpbMaZu?=
 =?us-ascii?Q?IBjbrB0d+wLED/CDlJx82pgETpAa04kk6BxP6aZeOQ+uGdZ3xxkM5X6lSUVl?=
 =?us-ascii?Q?mvMsk987752MaMfZODKlMTeEbSpXqY8YsIEpGG+B7mPU/lNLFsFQW7U+FkGo?=
 =?us-ascii?Q?vkyNqdTRZ//e/QVt0z45H75C54bXmdwbp9HBI5zIYX/MqvsmI8VDViq6NIpz?=
 =?us-ascii?Q?A9MSzs2jWT+DxhSNP13nR57CqZ9jqWEV6y9EA30IQRRHjyCrQszSiKLw0dX6?=
 =?us-ascii?Q?rHXt7wkJCpDnfFk+MjEYVG/jE79kL/f3PjKqVtlFzWpeMU/Ies4Wuvm9fOx9?=
 =?us-ascii?Q?uAXEBtRupQ+aQKl+MOmUnYtccv93OorolhEuxx8a6I7ShbvjWpZ+HO4OQwv/?=
 =?us-ascii?Q?QZZYu1haqRiXWs+tW2elsiVmGptLqfK5qbWBNZ2CwLpao1sD3wkK8MaEnaRl?=
 =?us-ascii?Q?N4mXMPVF0SezoFL/WjOSZgvASU8Xym6XGgw3AgKoCNrrLsjpy3SlBjK46Xl3?=
 =?us-ascii?Q?XUS0wJ0c+7OdFFzRoQH3LUbpmV9rEg6WTpE20jLAGbH38qjCe7jwA/0BYBM8?=
 =?us-ascii?Q?5vc9Rc/o69oXhid5c3FiRLPQEfMw+dwS7SbIrt+2Rp0S/SEYfmiroelqmgy+?=
 =?us-ascii?Q?HsZy3ZMuJv1E/dgxEgQQtBUTdRLsRiw3quJvdA4Q0ajkM0kndIQht//xsu/1?=
 =?us-ascii?Q?JS5AGZYaF+Ks7j5UZLfYqzu+SzlAEgyauyS0Rmjuw3lf8tK22J+kfvdCzu5n?=
 =?us-ascii?Q?uc+hqrxdaqluFpqfjJky4VtpkrzCptp45r9w5736ZNmOUzyuDaHfzlEqtaGU?=
 =?us-ascii?Q?UyO5p0ikwzTKSx6S+OHiHR8ToztkQO7KuiX1K1llG/AGlHrxez++3fsLvnV+?=
 =?us-ascii?Q?KMVjaYv4YkTRuhrEugeCVLkFKyp1ZxMohm2iCchwQoj6coY4kIgLDbGZKHNC?=
 =?us-ascii?Q?b5yxzwYa1MgdmtU8nujGztwKH9Et/GKC+kIgJI6a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa33fd3-bddb-42b6-9968-08db8d14f707
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 13:42:18.7391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Dh2Il8UKoz1k5InVFSyoYVHRUBMdJnFLOzvAjWKBh+o2JYBMaPiwIHje4Q4wTRdr8Ru/EPgtFwpzHPHbVR6jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7327
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
Cc: Alistair Popple <apopple@nvidia.com>, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, x86@kernel.org, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org, robin.murphy@arm.com, npiggin@gmail.com, chaitanya.kumar.borah@intel.com, linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, rtummala@nvidia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main change is to move secondary TLB invalidation mmu notifier
callbacks into the architecture specific TLB flushing functions. This
makes secondary TLB invalidation mostly match CPU invalidation while
still allowing efficient range based invalidations based on the
existing TLB batching code.

Changes for v4:

 - Fixed a NULL pointer dereference when registering the first
   notifier with mmu_interval_notifier_insert() instead of
   mmu_notifier_register() - Thanks Dan and Chaitanya for the bug
   reports.

 - Collected Acked/Reviewed tags.

 - Don't call the notifier from radix__local_flush_tlb_page() on
   PowerPC.

Changes for v3:

 - On x86 call the invalidation when adding pending TLB invalidates
   rather than when flushing the batch. This is because the mm is
   required. It also matches what happens on ARM64. Fixes a bug
   reported by SeongJae Park (thanks!)

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
 arch/powerpc/mm/book3s64/radix_tlb.c            |   4 +-
 arch/x86/include/asm/tlbflush.h                 |   2 +-
 arch/x86/mm/tlb.c                               |   2 +-
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
 mm/mmu_notifier.c                               |  50 +++-----
 mm/rmap.c                                       |  40 +-------
 19 files changed, 110 insertions(+), 211 deletions(-)

base-commit: 906fa30154ef42f93d28d7322860e76c6ae392ac
-- 
git-series 0.9.1
