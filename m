Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3610A555
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 21:18:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MwFt5tlRzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 07:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mw8r23rmzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 07:14:03 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39C4BAAD0;
 Tue, 26 Nov 2019 20:13:59 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/35] exception cleanup, syscall in C and !COMPAT
Date: Tue, 26 Nov 2019 21:13:14 +0100
Message-Id: <cover.1574798487.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Christian Brauner <christian@brauner.io>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Diana Craciun <diana.craciun@nxp.com>,
 Firoz Khan <firoz.khan@linaro.org>, Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Jagadeesh Pagadala <jagdsh.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>,
 Gustavo Romero <gromero@linux.ibm.com>, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Brajeswar Ghosh <brajeswar.linux@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

This is merge of https://patchwork.ozlabs.org/cover/1162376/ (except two
last experimental patches) and
https://patchwork.ozlabs.org/patch/1162079/ rebased on top of master.

There was minor conflict in Makefile in the latter series.

Refreshed the patchset to fix build error on ppc32 and ppc64e.

Thanks

Michal

Michal Suchanek (10):
  powerpc/64: system call: Fix sparse warning about missing declaration
  powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
  powerpc: move common register copy functions from signal_32.c to
    signal.c
  powerpc/perf: remove current_is_64bit()
  powerpc/perf: consolidate read_user_stack_32
  powerpc/perf: consolidate valid_user_sp
  powerpc/64: make buildable without CONFIG_COMPAT
  powerpc/64: Make COMPAT user-selectable disabled on littleendian by
    default.
  powerpc/perf: split callchain.c by bitness
  MAINTAINERS: perf: Add pattern that matches ppc perf to the perf
    entry.

Nicholas Piggin (25):
  powerpc/64s/exception: Introduce INT_DEFINE parameter block for code
    generation
  powerpc/64s/exception: Add GEN_COMMON macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Add GEN_KVM macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Expand EXC_COMMON and EXC_COMMON_ASYNC macros
  powerpc/64s/exception: Move all interrupt handlers to new style code
    gen macros
  powerpc/64s/exception: Remove old INT_ENTRY macro
  powerpc/64s/exception: Remove old INT_COMMON macro
  powerpc/64s/exception: Remove old INT_KVM_HANDLER
  powerpc/64s/exception: Add ISIDE option
  powerpc/64s/exception: move real->virt switch into the common handler
  powerpc/64s/exception: move soft-mask test to common code
  powerpc/64s/exception: move KVM test to common code
  powerpc/64s/exception: remove confusing IEARLY option
  powerpc/64s/exception: remove the SPR saving patch code macros
  powerpc/64s/exception: trim unused arguments from KVMTEST macro
  powerpc/64s/exception: hdecrementer avoid touching the stack
  powerpc/64s/exception: re-inline some handlers
  powerpc/64s/exception: Clean up SRR specifiers
  powerpc/64s/exception: add more comments for interrupt handlers
  powerpc/64s/exception: only test KVM in SRR interrupts when PR KVM is
    supported
  powerpc/64s/exception: soft nmi interrupt should not use
    ret_from_except
  powerpc/64: system call remove non-volatile GPR save optimisation
  powerpc/64: system call implement the bulk of the logic in C
  powerpc/64s: interrupt return in C
  powerpc/64s/exception: remove lite interrupt return

 MAINTAINERS                                   |    2 +
 arch/powerpc/Kconfig                          |    5 +-
 arch/powerpc/include/asm/asm-prototypes.h     |   17 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h |   24 +-
 arch/powerpc/include/asm/cputime.h            |   24 +
 arch/powerpc/include/asm/exception-64s.h      |    4 -
 arch/powerpc/include/asm/hw_irq.h             |    4 +
 arch/powerpc/include/asm/ptrace.h             |    3 +
 arch/powerpc/include/asm/signal.h             |    3 +
 arch/powerpc/include/asm/switch_to.h          |   11 +
 arch/powerpc/include/asm/thread_info.h        |    4 +-
 arch/powerpc/include/asm/time.h               |    4 +-
 arch/powerpc/include/asm/unistd.h             |    1 +
 arch/powerpc/kernel/Makefile                  |    9 +-
 arch/powerpc/kernel/entry_64.S                |  880 ++------
 arch/powerpc/kernel/exceptions-64e.S          |  255 ++-
 arch/powerpc/kernel/exceptions-64s.S          | 1937 ++++++++++++-----
 arch/powerpc/kernel/process.c                 |   89 +-
 arch/powerpc/kernel/signal.c                  |  144 +-
 arch/powerpc/kernel/signal.h                  |    2 -
 arch/powerpc/kernel/signal_32.c               |  140 --
 arch/powerpc/kernel/syscall_64.c              |  349 +++
 arch/powerpc/kernel/syscalls/syscall.tbl      |   22 +-
 arch/powerpc/kernel/systbl.S                  |    9 +-
 arch/powerpc/kernel/time.c                    |    9 -
 arch/powerpc/kernel/vdso.c                    |    3 +-
 arch/powerpc/kernel/vector.S                  |    2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |   11 -
 arch/powerpc/kvm/book3s_segment.S             |    7 -
 arch/powerpc/perf/Makefile                    |    5 +-
 arch/powerpc/perf/callchain.c                 |  387 +---
 arch/powerpc/perf/callchain.h                 |   20 +
 arch/powerpc/perf/callchain_32.c              |  197 ++
 arch/powerpc/perf/callchain_64.c              |  178 ++
 fs/read_write.c                               |    3 +-
 35 files changed, 2799 insertions(+), 1965 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c
 create mode 100644 arch/powerpc/perf/callchain.h
 create mode 100644 arch/powerpc/perf/callchain_32.c
 create mode 100644 arch/powerpc/perf/callchain_64.c

-- 
2.23.0

