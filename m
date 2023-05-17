Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B970691F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 15:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLtn907vBz3fC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZvzxaL6m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZvzxaL6m;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLtmH36GMz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 23:11:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4780D646FA;
	Wed, 17 May 2023 13:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A30C433EF;
	Wed, 17 May 2023 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329098;
	bh=Kl24PXPpp3YYxyqhSLbqSf3q6HFW4Damtq3CSDCskSI=;
	h=From:To:Cc:Subject:Date:From;
	b=ZvzxaL6miwnra1zIxCrPjbAaZ1S77jiTGPi+TWHY99GZHeuIe7t1zDn5PBjrO3aCc
	 +d603Lljcw85VawWja8nf6gaVWqRpl9Nj7tZzRXkzY5DkbE/NOQHT5JDlBFMhSRcbN
	 awDudFpa43agxm5K7LEfe328a3TXgVCRPNgQPIxdX1MMxEhTwcwBzOmH304yaQOTEA
	 LAQ8CsSDBiyW+7ihNfrrYmE6bhtk+vaAzUlnNGRodoqU+/ltoPSxqzWVfnBSDhDAve
	 m3pzvoi4G5qi9TF3RdkL/eQ12VTNlGpm/zby+dxVvfvof+Jx9Ig7iudo7tccKBreR5
	 3KVJ0fYIn0zfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/14] mm/init/kernel: missing-prototypes warnings
Date: Wed, 17 May 2023 15:10:48 +0200
Message-Id: <20230517131102.934196-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Dennis Zhou <dennis@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Waiman Long <longman@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis
 @redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

These are patches addressing -Wmissing-prototypes warnings in common
kernel code and memory management code files that usually get merged
through the -mm tree.

Andrew, can you pick these up in the -mm tree?

     Arnd

Arnd Bergmann (14):
  mm: percpu: unhide pcpu_embed_first_chunk prototype
  mm: page_poison: always declare __kernel_map_pages() function
  mm: sparse: mark populate_section_memmap() static
  audit: avoid missing-prototype warnings
  lib: devmem_is_allowed: include linux/io.h
  locking: add lockevent_read() prototype
  panic: hide unused global functions
  panic: make function declarations visible
  kunit: include debugfs header file
  suspend: add a arch_resume_nosmt() prototype
  init: consolidate prototypes in linux/init.h
  init: move cifs_root_data() prototype into linux/mount.h
  thread_info: move function declarations to linux/thread_info.h
  time_namespace: always provide arch_get_vdso_data() prototype for vdso

 arch/arm/include/asm/irq.h           |  1 -
 arch/arm64/include/asm/thread_info.h |  4 ----
 arch/microblaze/include/asm/setup.h  |  2 --
 arch/mips/include/asm/irq.h          |  1 -
 arch/parisc/kernel/smp.c             |  1 -
 arch/powerpc/include/asm/irq.h       |  1 -
 arch/riscv/include/asm/irq.h         |  2 --
 arch/riscv/include/asm/timex.h       |  2 --
 arch/s390/include/asm/thread_info.h  |  3 ---
 arch/s390/kernel/entry.h             |  2 --
 arch/sh/include/asm/irq.h            |  1 -
 arch/sh/include/asm/rtc.h            |  2 --
 arch/sh/include/asm/thread_info.h    |  3 ---
 arch/sparc/include/asm/irq_32.h      |  1 -
 arch/sparc/include/asm/irq_64.h      |  1 -
 arch/sparc/include/asm/timer_64.h    |  1 -
 arch/sparc/kernel/kernel.h           |  4 ----
 arch/x86/include/asm/irq.h           |  2 --
 arch/x86/include/asm/mem_encrypt.h   |  3 ---
 arch/x86/include/asm/thread_info.h   |  3 ---
 arch/x86/include/asm/time.h          |  1 -
 arch/x86/include/asm/tsc.h           |  1 -
 include/asm-generic/bug.h            |  5 +++--
 include/linux/acpi.h                 |  3 ++-
 include/linux/audit.h                |  2 --
 include/linux/audit_arch.h           |  2 ++
 include/linux/delay.h                |  1 +
 include/linux/init.h                 | 20 ++++++++++++++++++++
 include/linux/mm.h                   |  3 +--
 include/linux/mount.h                |  2 ++
 include/linux/panic.h                |  3 +++
 include/linux/percpu.h               |  2 --
 include/linux/suspend.h              |  2 ++
 include/linux/thread_info.h          |  5 +++++
 include/linux/time_namespace.h       |  3 ++-
 init/do_mounts.c                     |  2 --
 init/main.c                          | 18 ------------------
 kernel/audit.h                       |  2 +-
 kernel/locking/lock_events.h         |  4 ++++
 kernel/panic.c                       |  3 +--
 lib/devmem_is_allowed.c              |  1 +
 lib/kunit/debugfs.c                  |  1 +
 mm/sparse.c                          |  2 +-
 43 files changed, 52 insertions(+), 76 deletions(-)

-- 
2.39.2


Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: audit@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-pm@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kunit-dev@googlegroups.com
