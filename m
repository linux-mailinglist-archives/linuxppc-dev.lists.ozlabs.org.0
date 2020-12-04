Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 630042CE78B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 06:28:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnLns3XHbzDqKK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 16:28:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnLm15qDlzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 16:26:25 +1100 (AEDT)
From: Andy Lutomirski <luto@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC v2 0/2] lazy mm refcounting
Date: Thu,  3 Dec 2020 21:26:15 -0800
Message-Id: <cover.1607059162.git.luto@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Rik van Riel <riel@surriel.com>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Jann Horn <jannh@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is part of a larger series here, but the beginning bit is irrelevant
to the current discussion:

https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git/commit/?h=x86/mm&id=203d39d11562575fd8bd6a094d97a3a332d8b265

This is IMO a lot better than v1.  It's now almost entirely in generic
code.  (It looks like it's 100% generic, but that's a lie -- the
generic code currently that all possible lazy mm refs are in
mm_cpumask(), and that's not true on all arches.  So, if we take my
approach, we'll need to have a little arch hook to control this.)

Here's how I think it fits with various arches:

x86: On bare metal (i.e. paravirt flush unavailable), the loop won't do
much.  The existing TLB shootdown when user tables are freed will
empty mm_cpumask of everything but the calling CPU.  So x86 ends up
pretty close to as good as we can get short of reworking mm_cpumask() itself.

arm64: It needs the fixup above for correctness, but I think performance
should be pretty good.  Compared to current kernels, we lose an mmgrab()
and mmdrop() on each lazy transition, and we add a reasonably fast loop
over all cpus on process exit.  Someone (probably me) needs to make
sure we don't need some extra barriers.

power: Similar to x86.

s390x: Should be essentially the same as arm64.

Other arches: I don't know.  Further research is required.

What do you all think?

Andy Lutomirski (2):
  [NEEDS HELP] x86/mm: Handle unlazying membarrier core sync in the arch
    code
  [MOCKUP] sched/mm: Lightweight lazy mm refcounting

 arch/x86/mm/tlb.c    |  17 +++++-
 kernel/fork.c        |   4 ++
 kernel/sched/core.c  | 134 +++++++++++++++++++++++++++++++++++++------
 kernel/sched/sched.h |  11 +++-
 4 files changed, 145 insertions(+), 21 deletions(-)

-- 
2.28.0

