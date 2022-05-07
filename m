Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B9E51E4BF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ223x01z3c7P
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:49:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwHzm62vNz3cJC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:47:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzK0ckqz9sVq;
 Sat,  7 May 2022 08:46:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQCu1Il80dM8; Sat,  7 May 2022 08:46:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzD5hp5z9sVV;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A977B8B770;
 Sat,  7 May 2022 08:46:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HMc5DPu-VFf8; Sat,  7 May 2022 08:46:48 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E789B8B76E;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kc2W1320469
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:38 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kZLE1320456;
 Sat, 7 May 2022 08:46:35 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 00/25] powerpc: ftrace optimisation and cleanup and more
 [v2]
Date: Sat,  7 May 2022 08:46:02 +0200
Message-Id: <cover.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905980; l=3734; s=20211009;
 h=from:subject:message-id; bh=sB47Li5cspS+Q/H8GVp437MSeqxST6ZTmmFQ7liQjVo=;
 b=+VMsngPikIwGNNaEsxH4AQJ2KbgCYHnSNkKjWOcg2MTB3VZJmKdqbiSAlgpgxIkiqekEeM3t8G/g
 LnafOpzMA8g2jyJO1UZvDZx4OgECooe7zv4fVgGMmRqBONaUVHWg
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series provides optimisation and cleanup of ftrace on powerpc.

With this series ftrace activation is about 20% faster on an 8xx.

At the end of the series come additional cleanups around ppc-opcode,
that would likely conflict with this series if posted separately.

Main changes since v1 (details in after each individual patch description):
- Added 3 patches (8, 9, 10) that convert PPC64_ELF_ABI_v{1/2} macros by CONFIG_PPC64_ELF_ABI_V{1/2}
- Taken comments from Naveen

Christophe Leroy (25):
  powerpc/ftrace: Refactor prepare_ftrace_return()
  powerpc/ftrace: Remove redundant create_branch() calls
  powerpc/code-patching: Inline is_offset_in_{cond}_branch_range()
  powerpc/ftrace: Use is_offset_in_branch_range()
  powerpc/code-patching: Inline create_branch()
  powerpc/ftrace: Inline ftrace_modify_code()
  powerpc/ftrace: Use patch_instruction() return directly
  powerpc: Add CONFIG_PPC64_ELF_ABI_V1 and CONFIG_PPC64_ELF_ABI_V2
  powerpc: Replace PPC64_ELF_ABI_v{1/2} by CONFIG_PPC64_ELF_ABI_V{1/2}
  powerpc: Finalise cleanup around ABI use
  powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and
    PPC64
  powerpc/ftrace: Don't include ftrace.o for CONFIG_FTRACE_SYSCALLS
  powerpc/ftrace: Use CONFIG_FUNCTION_TRACER instead of
    CONFIG_DYNAMIC_FTRACE
  powerpc/ftrace: Remove ftrace_plt_tramps[]
  powerpc/ftrace: Use BRANCH_SET_LINK instead of value 1
  powerpc/ftrace: Use PPC_RAW_xxx() macros instead of opencoding.
  powerpc/ftrace: Use size macro instead of opencoding
  powerpc/ftrace: Simplify expected_nop_sequence()
  powerpc/ftrace: Minimise number of #ifdefs
  powerpc/inst: Add __copy_inst_from_kernel_nofault()
  powerpc/ftrace: Don't use copy_from_kernel_nofault() in
    module_trampoline_target()
  powerpc/inst: Remove PPC_INST_BRANCH
  powerpc/modules: Use PPC_LI macros instead of opencoding
  powerpc/inst: Remove PPC_INST_BL
  powerpc/opcodes: Remove unused PPC_INST_XXX macros

 arch/powerpc/Kconfig                     |   2 +-
 arch/powerpc/Makefile                    |  12 +-
 arch/powerpc/boot/Makefile               |   2 +
 arch/powerpc/include/asm/code-patching.h |  65 +++-
 arch/powerpc/include/asm/ftrace.h        |   4 +-
 arch/powerpc/include/asm/inst.h          |  13 +-
 arch/powerpc/include/asm/linkage.h       |   2 +-
 arch/powerpc/include/asm/module.h        |   2 -
 arch/powerpc/include/asm/ppc-opcode.h    |  22 +-
 arch/powerpc/include/asm/ppc_asm.h       |   4 +-
 arch/powerpc/include/asm/ptrace.h        |   2 +-
 arch/powerpc/include/asm/sections.h      |  24 +-
 arch/powerpc/include/asm/types.h         |   8 -
 arch/powerpc/kernel/fadump.c             |  13 +-
 arch/powerpc/kernel/head_64.S            |   2 +-
 arch/powerpc/kernel/interrupt_64.S       |   2 +-
 arch/powerpc/kernel/kprobes.c            |   6 +-
 arch/powerpc/kernel/misc_64.S            |   2 +-
 arch/powerpc/kernel/module.c             |   4 +-
 arch/powerpc/kernel/module_32.c          |  23 +-
 arch/powerpc/kernel/module_64.c          |   7 +-
 arch/powerpc/kernel/ptrace/ptrace.c      |   6 -
 arch/powerpc/kernel/trace/Makefile       |   5 +-
 arch/powerpc/kernel/trace/ftrace.c       | 375 +++++++----------------
 arch/powerpc/kvm/book3s_interrupts.S     |   2 +-
 arch/powerpc/kvm/book3s_rmhandlers.S     |   2 +-
 arch/powerpc/lib/code-patching.c         |  49 +--
 arch/powerpc/lib/feature-fixups.c        |   2 +-
 arch/powerpc/net/bpf_jit.h               |   4 +-
 arch/powerpc/net/bpf_jit_comp.c          |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c        |   4 +-
 arch/powerpc/platforms/Kconfig.cputype   |   6 +
 32 files changed, 262 insertions(+), 416 deletions(-)

-- 
2.35.1

