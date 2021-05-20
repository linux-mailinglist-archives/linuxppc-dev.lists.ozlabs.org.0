Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F938B071
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB364N36z3bv5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB2n1RDZz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:50:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB2k1mcQz9sTJ;
 Thu, 20 May 2021 15:50:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fZ3poNK2C58; Thu, 20 May 2021 15:50:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2j5Yqtz9sT8;
 Thu, 20 May 2021 15:50:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7870F8B813;
 Thu, 20 May 2021 15:50:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N-dgg_hcNp0b; Thu, 20 May 2021 15:50:37 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 271F08B808;
 Thu, 20 May 2021 15:50:37 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 11DFF64C40; Thu, 20 May 2021 13:50:37 +0000 (UTC)
Message-Id: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 00/12] powerpc: Cleanup use of 'struct ppc_inst'
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:37 +0000 (UTC)
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

This series is a cleanup of the use of 'struct ppc_inst'.

A confusion is made between internal representation of powerpc
instructions with 'struct ppc_inst' and in-memory code which is
and will always be an array of 'unsigned int'.

This series cleans it up.

First patch is fixing detection of missing '__user' flag by sparse
when using get_user_instr().

Last part of the series does some source code cleanup in
optprobes, it is put at the ends of this series because of
clashes with the 'struct ppc_inst' cleanups.

Changes in v2:
- Temporarily don't use get_op() and don't include asm/disassemble.h in asm/inst.h because it exhibits a conflict for function get_ra() with drivers/staging/rtl8723bs/include/wifi.h
- Fix a create_branch() in ftrace and take copy_inst_from_kernel_nofault() into account

Christophe Leroy (12):
  powerpc/inst: Fix sparse detection on get_user_instr()
  powerpc/inst: Reduce casts in get_user_instr()
  powerpc/inst: Improve readability of get_user_instr() and friends
  powerpc/inst: Avoid pointer dereferencing in ppc_inst_equal()
  powerpc: Do not dereference code as 'struct ppc_inst' (uprobe,
    code-patching, feature-fixups)
  powerpc/lib/code-patching: Make instr_is_branch_to_addr() static
  powerpc/lib/code-patching: Don't use struct 'ppc_inst' for runnable
    code in tests.
  powerpc: Don't use 'struct ppc_inst' to reference instruction location
  powerpc/inst: Refactor PPC32 and PPC64 versions
  powerpc/optprobes: Minimise casts
  powerpc/optprobes: Compact code source a bit.
  powerpc/optprobes: use PPC_RAW_ macros

 arch/powerpc/include/asm/code-patching.h  |  23 ++-
 arch/powerpc/include/asm/inst.h           |  92 +++++-------
 arch/powerpc/include/asm/ppc-opcode.h     |  11 +-
 arch/powerpc/include/asm/uprobes.h        |   4 +-
 arch/powerpc/kernel/crash_dump.c          |   4 +-
 arch/powerpc/kernel/epapr_paravirt.c      |   4 +-
 arch/powerpc/kernel/jump_label.c          |   2 +-
 arch/powerpc/kernel/kgdb.c                |   6 +-
 arch/powerpc/kernel/kprobes.c             |  17 ++-
 arch/powerpc/kernel/mce_power.c           |   2 +-
 arch/powerpc/kernel/optprobes.c           | 124 +++++-----------
 arch/powerpc/kernel/setup_32.c            |   2 +-
 arch/powerpc/kernel/trace/ftrace.c        |  33 +++--
 arch/powerpc/kernel/uprobes.c             |   6 +-
 arch/powerpc/lib/code-patching.c          | 165 ++++++++++++----------
 arch/powerpc/lib/feature-fixups.c         |  98 ++++++-------
 arch/powerpc/mm/maccess.c                 |   4 +-
 arch/powerpc/perf/core-book3s.c           |   4 +-
 arch/powerpc/platforms/86xx/mpc86xx_smp.c |   2 +-
 arch/powerpc/platforms/powermac/smp.c     |   4 +-
 arch/powerpc/xmon/xmon.c                  |  10 +-
 21 files changed, 277 insertions(+), 340 deletions(-)

-- 
2.25.0

