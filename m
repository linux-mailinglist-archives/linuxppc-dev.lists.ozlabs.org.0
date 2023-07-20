Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FB75A983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 10:42:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VeLQOsU7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R65mW4hkxz3c82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 18:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VeLQOsU7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::61b; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R65jL0QWcz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 18:40:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czcMPwRKE6Yr2kIDjbNOnrESZnanBo6EyDVBnAvQ74Ej/fqV0NSWZ2H2jQs4ta+JMsT0L5DVawomLtC3p0cFJ4krT2kc2/Qhq9+/X6QdnPQWbnP45+uH+C+ZfJsrfVJQHwV26g8DMtISfpvtrgQzdngWgWN4EJ75wnrShtjaDi361SOm1kA8daLRX9sD4ml6TfiQRh4uwsJ1VBgjs7NCtN3r4+7HivzAxMi2QlOHD6gFEgauL6TYs23Xg0nWexd652e3T1yJl0fuG0Rec9xaZWxLj2zmkGKlOiOQz/jkuJts58B+QEeuOLnHntcS84mD0oRomZw0cijOWIoThX3/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPc/276d9SPxX1FIJHjG9BBb1nqejmmtat9YQEinW+8=;
 b=cRnJqlopQ99+U8o08s5fZx8AuhiAjTz+hgFA/8+cwpwrHmzOv8y1dd59QXbQ+oGyjnU6vicdbcnBAOotngxDyQ9wKaSduEmRWF1VT0wIXKizsDuEo9B0CBNqHxTzMUq8H2ATtSzoIzaj9OHIx3vKkaKYcyGdtHrvtMd6hb2HUQQ5WP9dgi+2ZnWTLGydK6jbzoyxaC8A6pVc44KBZ3y4d/1/jtmd92swtpDE46S/9OHV5ETK1MREFlbyQjC6oSCkhcDkqkl32xAR4LfgXgtdw1KgLP91auWOvQx8b4C0f6p3U4TWn0hGRFPIs8k2Gz8xCYbD42Gq75vHDSLCxXOHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPc/276d9SPxX1FIJHjG9BBb1nqejmmtat9YQEinW+8=;
 b=VeLQOsU7dSdTLfcJ23tS5A9pvFzOHBLAAwJtf2rxoUwv0iRk5jSnZta26VH9ITQA8zxiQD6IM24U9d4pNcMmkdYm7jwqC4+lR2tthHwfyAweOFV3CJ+xYOjegDwZ8ufTpRceYj7/5qSj+VfUiav/SEvyXFaWKNRFA51041agt8HEVeh4UHTTSuM25C30Mhx6Skh1Ad8U7kNXaLJt19gYlSkpi5PGZqXtgf8WnNkty5Yd3SD5xm+8dQ9PFGELEtU6ikIdgE06bTG5cYhXSJCATxiXnfCe2akbG8bYn03kbPBDiYk/eMSWHk+nOXmI4c1R/NEWBj8xGkSpWe5QDS0jqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 08:39:39 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::cd5e:7e33:c2c9:fb74%7]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 08:39:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: akpm@linux-foundation.org
Subject: [PATCH v3 0/5] Invalidate secondary IOMMU TLB on permission upgrade
Date: Thu, 20 Jul 2023 18:39:22 +1000
Message-Id: <cover.b24362332ec6099bc8db4e8e06a67545c653291d.1689842332.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCP282CA0023.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:80::35) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 6517a9dc-8a8f-4543-1827-08db88fcda74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hH8TX3bFHJJVxgNIpekeIL0B9ThbtIkT3gJOKkKNbql5HXAYsCFPeaan4TFU4c4LtYCRdwKXJjvWkUz6HZ55Hd6WlRQMeglMv6r4IxGjrunCiGKA3CJgvXD1Sp2gj8BWJaOGxDHrxP60uwU8aw33GxjSBRM5/fQV4ZolcE78QtqUAT/2BDUM9hE8+IZLvfpZXvbJvRClqOH8BAHDJyl3BR43Wo9Yv9dpiVD+cvT1P33tlbOfv0AEwrcsrhoBp2v/jmjT9jY+LlNWka0xN3DzmgJyd7QHM8pDU0+oICV6HdXv3jwn1JAntLXAb1zlyBG+XrEsInBdLTwFh05NFo+eQBuJXE4iBpFA9TronxKYvcNVQp6CZhdX/rKtrQI9f4ic2Iaw+SEXvJswzJEQOU/WQVfKjgvP3srxc9NTYObp+dbazDNX3pwYt/4wg74Nfd04ZEar4jVTZNSzww8YNLteDCmA+hFpu+OcfJeYDJIFevCBFca7MF7me00Ki8nBGtghjwm0HXMeR6GVSJcTO9l2BMrhYakQj31p9Uc/Q/srO5OwZqd+rjbHWhgHAxVr+sEdA2RucdyGd4r/IdOEggxotwUem6rRlSJbwaHz8N3L8qmlboB2Z3nziQOGV+/T8MoEyjXa0D6T4vRSXqUsiUxMqQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(66899021)(6486002)(6666004)(478600001)(86362001)(36756003)(2616005)(83380400001)(41300700001)(966005)(6506007)(38100700002)(186003)(6512007)(107886003)(26005)(2906002)(66556008)(316002)(8936002)(66946007)(7416002)(8676002)(66476007)(4326008)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?U1mG3T0zL9VTU7mRQtFV0TQ/6xziaz1V+U8+1VxPFbHwWjgxIpyFv3B5UajT?=
 =?us-ascii?Q?GW06PUl4qy3J1n1vcjYir69LrvfmDpRy3TooP8DV68+tfewu7QdWHD5/379p?=
 =?us-ascii?Q?CE/3itr/E+XQ9NtcOHKKGtZB8wKWD46DtlXSKtDOP8TUGInNuoY6a1fWspT7?=
 =?us-ascii?Q?YmqO1lXitKlBIQR25aALR8oYluyu18qWcxRXmzDpjhYV4TtdXaFWBxJWSyOU?=
 =?us-ascii?Q?wOK5SxgBIZEXYN2fp8eA0HlAwjjdFxL3GaqKt17HHoKr2vnq2w8Y/Of5CC9b?=
 =?us-ascii?Q?+5tkhpwEEYbOMcV5TGMnGhayLgW3j1BTTfx0MSJbkEzuIKh+tGYwHn1ApnQ+?=
 =?us-ascii?Q?G1+5SOnqVheJ/0UjtXBY9+26J3PgVRo+msk7ABy+JU4Cg4LXjcg+SwM1smDZ?=
 =?us-ascii?Q?6sQoveUNgFlzHEKYTBX9GjwroHAjpOVREEuiMz/Chw/f7WfRB/Z1iT2ma7nL?=
 =?us-ascii?Q?A///chfLDQexogYJ9liKA1awpIyK1/vQ6Nz7GEiqqdkCcPA9X6u7TcOnZ2+N?=
 =?us-ascii?Q?JQbXXZ36DDgWeFmGGFHPVoei8ejyY7BqEETct+CFOGiu1cJgo1Z+XxNxHD3j?=
 =?us-ascii?Q?0GL6oZJiGolYKZYQoI3jUHPtYNkhxupiBmShZzzivn9CshKzUg9sg1Mgwh3k?=
 =?us-ascii?Q?RMwIBrQoMyH3W1h9HnqhWkzmZ5c+H+RGennmY7imNBzVSlRmCnDf5D0XPfbS?=
 =?us-ascii?Q?pVRWz+eyb82i0BpyEs3JXriJ1P4+STKzBrQcMA/5PIPdyCQC2jutktwosSfQ?=
 =?us-ascii?Q?ytKdzD2c2RsErQVMGpLmZir8wY0kEFe/j5PiEXS3fhKqaeAw05at82vn7ENy?=
 =?us-ascii?Q?4DXXWGqSuNwT/ex2Uipn8VxWHM8o833d0NfHkIxToSACIt6VVYI20qGnD2j/?=
 =?us-ascii?Q?Qr5Gu4EUikm0BsTYudGzUj93rGS5PHjAODXmHL3YkeuoJJzVqmOXQiWTP9HI?=
 =?us-ascii?Q?kGiRulXMwQJ/AY5VKjIWJ0EqjOaZRIvb5jg5er+Q/gI/KsA+Iy/q67sBm0gX?=
 =?us-ascii?Q?NgNA/Zs4uLbDv2pP8iI1f2V57VANQHiK1hwWfo39/hdqOKsEH/p4D7BDgLwB?=
 =?us-ascii?Q?9O3vUZohb1Mcxw8nDcbdlFxVQgCWG13ZeuTVAlWMtcCxQPnowPScBzlAUcOF?=
 =?us-ascii?Q?hKJELufiJ+JhgxgETOYJzgD1xHUUCCxKUJBE5KjzAgfMP9J6hgDyRiY5LSv4?=
 =?us-ascii?Q?FWfoDvA3hcN44nKc97OprAUDCdUfL1P65Fb5C9cf/KKu//tfw/RzYaolctW6?=
 =?us-ascii?Q?4edEPl/VqZAyPKvE3Y9yPTvu7KcG1vN3e+Cy55IQp5z2BXxs7CbDoUN7W2yN?=
 =?us-ascii?Q?pciW0re0KP2zBJqOyYlthSJFpypjBfT5cysD30LqAbRzRGfh9aGfKGOKJGwR?=
 =?us-ascii?Q?huY2SeboGhHXj/FmrC58EWFJLG22RLIHWFNF/gLJ68mQTkop4UOot3Sx8aNp?=
 =?us-ascii?Q?miegAyAVPW2FF06E7x/HR2GMXC3E0bcKSaUvZB7a33IWCngmRQjwtRG0wOrD?=
 =?us-ascii?Q?4gTvZTiBq/vZQT40R7uFgsNEIzS9jcGVIBI6H2lXv4WACLdDYJea+qmsNy7D?=
 =?us-ascii?Q?kwqBKbgP8NrEL05Yao8RwV6XCCz7yw20ysjy6RWD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6517a9dc-8a8f-4543-1827-08db88fcda74
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 08:39:38.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y61I+lzbuFGiKXwm9INIiYmxKCJX98YKxgYdJ7EgKqsD3LeWXHMooRhy86JjNGGJqfZ8YisHinKQC5qbhEroFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712
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
Cc: x86@kernel.org, zhi.wang.linux@gmail.com, kvm@vger.kernel.org, catalin.marinas@arm.com, linux-mm@kvack.org, will@kernel.org, Alistair Popple <apopple@nvidia.com>, jgg@ziepe.ca, iommu@lists.linux.dev, nicolinc@nvidia.com, kevin.tian@intel.com, ajd@linux.ibm.com, jhubbard@nvidia.com, robin.murphy@arm.com, npiggin@gmail.com, linux-arm-kernel@lists.infradead.org, sj@kernel.org, seanjc@google.com, linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main change is to move secondary TLB invalidation mmu notifier
callbacks into the architecture specific TLB flushing functions. This
makes secondary TLB invalidation mostly match CPU invalidation while
still allowing efficient range based invalidations based on the
existing TLB batching code.

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
 arch/powerpc/mm/book3s64/radix_tlb.c            |   6 +-
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
 mm/mmu_notifier.c                               |  49 +++-----
 mm/rmap.c                                       |  40 +-------
 19 files changed, 111 insertions(+), 211 deletions(-)

base-commit: 906fa30154ef42f93d28d7322860e76c6ae392ac
-- 
git-series 0.9.1
