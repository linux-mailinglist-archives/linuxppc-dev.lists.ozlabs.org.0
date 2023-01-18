Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12133672170
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:36:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxqcb6s2rz3chL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:36:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DmRZRKRP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DmRZRKRP;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxqbc5BXDz3cBh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 02:35:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056156; x=1705592156;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V+7w/6DVh6oOTj/5Q6BI82PHATnPnRgB/JN4Ard83Dk=;
  b=DmRZRKRPReXmxzXGiGU0PCvQHKyIkPqMKDdxFCLO5xEymahPuvYk3SY9
   53MG1E3WfSYujhaEHeQoMvYN+J/GKL8abTAWwQZR9FKDiqT9Z+Hq/V7OP
   6hCBBdo1nxNTh02Bj8JrNEDkHbJhjdjGKw5qjwrGbPpsXeo+zIhTmPzqV
   RLi70MXnzBTO/fDxhTtNOAXyJDDDHEx6mAtJtbiFPpmjxiyQhYln5gPi3
   nFbxSqUrpZqTV5p8ADFFoEERQyLJRR78x/z1rQgH/VMS3se+x06kHHF5S
   kGgn1wINo9Xm/RQOY3wDGEdNu4fIra2HauId48dGaGIoY9y6eJ55CKwFh
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305381647"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="305381647"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:35:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833614590"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833614590"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:35:41 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Date: Wed, 18 Jan 2023 16:35:22 +0100
Message-Id: <20230118153529.57695-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

The helper is tiny and there are advices we can live without it, so
I want to present few arguments why it would be good to have it:

1. Code readability/simplification/number of lines:
  - decreases number of lines,
  - it often eliminates local variables,
  - for real examples see patches 3+.

2. Presence of similar helpers in other somehow related languages/libs:

a) Rust[1]: 'replace' from std::mem module, there is also 'take'
    helper (__xchg(&x, 0)), which is the same as private helper in
    i915 - fetch_and_zero, see latest patch.
b) C++ [2]: 'exchange' from utility header.

If the idea is OK there are still 2 questions to answer:

1. Name of the helper, __xchg follows kernel conventions,
    but for me Rust names are also OK.
2. Where to put the helper:
a) as in this patchset include/linux/non-atomic/xchg.h,
    proposed by Andy Shevchenko,
b) include/linux/utils.h ? any better name? Some kind
    of container for simple helpers.

All __xchg conversions were performed using cocci script,
then manually adjusted if necessary.

There is lot of places it can be used in, I have just chosen
some of them. I can provide cocci script to detect others (not all),
if necessary.

Changes:
v2: squashed all __xchg -> __arch_xchg t one patch (Arnd)
v3: fixed alpha/xchg_local (lkp@intel.com)
v4: adjusted indentation (Heiko)
v5: added more __xchg conversions - patches 3-6, added tags

[1]: https://doc.rust-lang.org/std/mem/index.html
[2]: https://en.cppreference.com/w/cpp/header/utility

Regards
Andrzej

Andrzej Hajda (7):
  arch: rename all internal names __xchg to __arch_xchg
  linux/include: add non-atomic version of xchg
  arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
  llist: simplify __llist_del_all
  io_uring: use __xchg if possible
  qed: use __xchg if possible
  drm/i915/gt: use __xchg instead of internal helper

 arch/alpha/include/asm/cmpxchg.h              | 10 +++++-----
 arch/arc/include/asm/cmpxchg.h                |  4 ++--
 arch/arm/include/asm/cmpxchg.h                |  7 ++++---
 arch/arm/probes/uprobes/core.c                |  8 ++------
 arch/arm64/include/asm/cmpxchg.h              |  7 +++----
 arch/arm64/kernel/probes/uprobes.c            |  9 ++-------
 arch/csky/kernel/probes/uprobes.c             |  9 ++-------
 arch/hexagon/include/asm/cmpxchg.h            | 10 +++++-----
 arch/ia64/include/asm/cmpxchg.h               |  2 +-
 arch/ia64/include/uapi/asm/cmpxchg.h          |  4 ++--
 arch/loongarch/include/asm/cmpxchg.h          |  4 ++--
 arch/m68k/include/asm/cmpxchg.h               |  6 +++---
 arch/mips/include/asm/cmpxchg.h               |  4 ++--
 arch/mips/kernel/uprobes.c                    | 10 ++--------
 arch/openrisc/include/asm/cmpxchg.h           | 10 +++++-----
 arch/parisc/include/asm/cmpxchg.h             |  4 ++--
 arch/powerpc/include/asm/cmpxchg.h            |  4 ++--
 arch/powerpc/kernel/uprobes.c                 | 10 ++--------
 arch/riscv/include/asm/atomic.h               |  2 +-
 arch/riscv/include/asm/cmpxchg.h              |  4 ++--
 arch/riscv/kernel/probes/uprobes.c            |  9 ++-------
 arch/s390/include/asm/cmpxchg.h               |  8 ++++----
 arch/s390/kernel/uprobes.c                    |  7 ++-----
 arch/sh/include/asm/cmpxchg.h                 |  4 ++--
 arch/sparc/include/asm/cmpxchg_32.h           |  4 ++--
 arch/sparc/include/asm/cmpxchg_64.h           |  6 +++---
 arch/sparc/kernel/uprobes.c                   |  7 ++-----
 arch/xtensa/include/asm/cmpxchg.h             |  4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  4 ++--
 .../drm/i915/gt/intel_execlists_submission.c  |  4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  6 +++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  2 +-
 drivers/gpu/drm/i915/i915_utils.h             |  1 +
 include/linux/llist.h                         |  6 ++----
 include/linux/non-atomic/xchg.h               | 19 +++++++++++++++++++
 include/linux/qed/qed_chain.h                 | 19 +++++++------------
 io_uring/io_uring.c                           |  7 ++-----
 io_uring/slist.h                              |  6 ++----
 51 files changed, 126 insertions(+), 155 deletions(-)
 create mode 100644 include/linux/non-atomic/xchg.h

-- 
2.34.1

