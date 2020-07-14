Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34521EE1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5cRM3sCQzDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5bK9022hzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:47:23 +1000 (AEST)
IronPort-SDR: 6ljhCjQYc8saOOrUhV5hESNwvppN9RtNnB3Cntw0bpXh5reKGpze3VUNm3nzB0ZOMJYNzdJKsF
 4bkxZBZFMRzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="213661351"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="213661351"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 02:47:19 -0700
IronPort-SDR: tnOCkLt8IfVkm5xN3VakaM9NZRaZ4I7vcKaIxPq0JkwL/dnT/xa9qFx9uW0JY5/S7u+lxPJYn9
 QgrYykxLQnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="429708293"
Received: from rmarti11-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.57])
 by orsmga004.jf.intel.com with ESMTP; 14 Jul 2020 02:46:40 -0700
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] kprobes: Remove MODULE dependency
Date: Tue, 14 Jul 2020 12:45:35 +0300
Message-Id: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Jul 2020 20:36:21 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Song Liu <songliubraving@fb.com>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 Paul Burton <paulburton@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Omar Sandoval <osandov@fb.com>, Petr Mladek <pmladek@suse.com>,
 Brian Gerst <brgerst@gmail.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Iurii Zaikin <yzaikin@google.com>,
 Jiri Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 Philipp Rudo <prudo@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Torsten Duwe <duwe@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Helge Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>,
 Yonghong Song <yhs@fb.com>, Borislav Petkov <bp@suse.de>,
 Andrii Nakryiko <andriin@fb.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Martin KaFai Lau <kafai@fb.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Atish Patra <atish.patra@wdc.com>, Will Deacon <will@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Ben Dooks <ben-linux@fluff.org>, Peter Collingbourne <pcc@google.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Amit Daniel Kachhap <amit.kachhap@arm.com>,
 "open list:LIVE PATCHING" <live-patching@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Miroslav Benes <mbenes@suse.cz>, Jiri Olsa <jolsa@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Sven Schnelle <svens@stackframe.org>,
 Mike Rapoport <rppt@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "open list:BPF JIT for MIPS 32-BIT AND 64-BIT" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove MODULES dependency by creating module subsystem indepdent
text_alloc() and text_memfree() to allocate space for executable code.

Right now one has to compile modules support only to enable kprobes. This
incrases the barrier to use them in test kernels and I'd guess also in some
embedded kernels (the former is my use case).

v2:
* Added the missing cover letter.

Jarkko Sakkinen (3):
  module: Rename module_alloc() to text_alloc() and move to kernel
    proper
  module: Add lock_modules() and unlock_modules()
  kprobes: Flag out CONFIG_MODULES dependent code

 arch/Kconfig                     |  1 -
 arch/arm/kernel/Makefile         |  3 +-
 arch/arm/kernel/module.c         | 21 -------
 arch/arm/kernel/text.c           | 33 +++++++++++
 arch/arm64/kernel/Makefile       |  2 +-
 arch/arm64/kernel/module.c       | 42 --------------
 arch/arm64/kernel/text.c         | 54 ++++++++++++++++++
 arch/mips/kernel/Makefile        |  2 +-
 arch/mips/kernel/module.c        |  9 ---
 arch/mips/kernel/text.c          | 19 +++++++
 arch/mips/net/bpf_jit.c          |  4 +-
 arch/nds32/kernel/Makefile       |  2 +-
 arch/nds32/kernel/module.c       |  7 ---
 arch/nds32/kernel/text.c         | 12 ++++
 arch/nios2/kernel/Makefile       |  1 +
 arch/nios2/kernel/module.c       | 19 -------
 arch/nios2/kernel/text.c         | 34 +++++++++++
 arch/parisc/kernel/Makefile      |  2 +-
 arch/parisc/kernel/module.c      | 11 ----
 arch/parisc/kernel/text.c        | 22 ++++++++
 arch/powerpc/net/bpf_jit_comp.c  |  4 +-
 arch/riscv/kernel/Makefile       |  1 +
 arch/riscv/kernel/module.c       | 12 ----
 arch/riscv/kernel/text.c         | 20 +++++++
 arch/s390/kernel/Makefile        |  2 +-
 arch/s390/kernel/ftrace.c        |  2 +-
 arch/s390/kernel/module.c        | 16 ------
 arch/s390/kernel/text.c          | 23 ++++++++
 arch/sparc/kernel/Makefile       |  1 +
 arch/sparc/kernel/module.c       | 30 ----------
 arch/sparc/kernel/text.c         | 39 +++++++++++++
 arch/sparc/net/bpf_jit_comp_32.c |  6 +-
 arch/unicore32/kernel/Makefile   |  1 +
 arch/unicore32/kernel/module.c   |  7 ---
 arch/unicore32/kernel/text.c     | 18 ++++++
 arch/x86/kernel/Makefile         |  1 +
 arch/x86/kernel/ftrace.c         |  4 +-
 arch/x86/kernel/kprobes/core.c   |  4 +-
 arch/x86/kernel/module.c         | 49 ----------------
 arch/x86/kernel/text.c           | 60 ++++++++++++++++++++
 include/linux/module.h           | 29 +++++++---
 include/linux/moduleloader.h     |  4 +-
 kernel/Makefile                  |  2 +-
 kernel/bpf/core.c                |  4 +-
 kernel/kprobes.c                 | 17 ++++--
 kernel/livepatch/core.c          |  8 +--
 kernel/module.c                  | 97 +++++++++++++-------------------
 kernel/text.c                    | 25 ++++++++
 kernel/trace/trace_kprobe.c      | 20 ++++++-
 49 files changed, 484 insertions(+), 322 deletions(-)
 create mode 100644 arch/arm/kernel/text.c
 create mode 100644 arch/arm64/kernel/text.c
 create mode 100644 arch/mips/kernel/text.c
 create mode 100644 arch/nds32/kernel/text.c
 create mode 100644 arch/nios2/kernel/text.c
 create mode 100644 arch/parisc/kernel/text.c
 create mode 100644 arch/riscv/kernel/text.c
 create mode 100644 arch/s390/kernel/text.c
 create mode 100644 arch/sparc/kernel/text.c
 create mode 100644 arch/unicore32/kernel/text.c
 create mode 100644 arch/x86/kernel/text.c
 create mode 100644 kernel/text.c

-- 
2.25.1

