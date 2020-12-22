Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14B2E0AEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:38:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0cq86tdCzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cbz39ggzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cbn5l4Jz9v1vm;
 Tue, 22 Dec 2020 14:28:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IaxKO6DRfFR5; Tue, 22 Dec 2020 14:28:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cbn4rFrz9v1vl;
 Tue, 22 Dec 2020 14:28:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 061FF8B81B;
 Tue, 22 Dec 2020 14:28:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0E_a5BmWXZY0; Tue, 22 Dec 2020 14:28:22 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B14928B812;
 Tue, 22 Dec 2020 14:28:22 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7B05A66969; Tue, 22 Dec 2020 13:28:22 +0000 (UTC)
Message-Id: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 00/15] powerpc/32: Reduce head complexity and re-activate
 MMU earlier
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:22 +0000 (UTC)
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

This series aims at reducing exception/syscall prologs complexity.
It also brings earlier MMU re-activation.

At the time being, we have two pathes in the prologs: one for
when we have CONFIG_VMAP stack and one when we don't.

Among 40x, 6xx and 8xx, only 40x doesn't support VMAP stack.

When VMAP stack is supported, there is special prolog code to
allow accessing stack with MMU on.

That code that access VM stack with MMU on is also able to access
linear memory, so it can also access non VM stack with MMU on.

CONFIG_VMAP_STACK as been on by default on 6xx and 8xx for some
kernel releases now, so it is known to work.

On the 8xx, null_syscall runs in 292 cycles with VMAP_STACK and in
296 cycles without VMAP stack.
On the 832x, null_syscall runs in 224 cycles with VMAP_STACK and in
213 cycles without VMAP stack.

By removing the old non VMAP stack code, and using the same prolog
regardless of the activation of VMAP stacks, we make the code a lot
simplier and open perspective to even more.

Once this is done, we can easily go one step further and re-activate
Instruction translation at the same time as data translation.

At the end, null_syscall runs in 286 cycles on the 8xx and in 216
cycles on the 832x

To do this, I splitted head_32.h in two files, one for 40x which
doesn't have VMAP stack and one for 6xx and 8xx that have VMAP stack.

Now that we have MMU back on earlier on the 6xx and 8xx, once the 40x is
gone it will be possible have more commonalities with book3e/32 which
has MMU always on.

Christophe Leroy (15):
  powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on
    syscall too
  powerpc/32s: Fix RTAS machine check with VMAP stack
  powerpc/32s: Only build hash code when CONFIG_PPC_BOOK3S_604 is
    selected
  powerpc/32s: Do DABR match out of handle_page_fault()
  powerpc: Remove address argument from bad_page_fault()
  powerpc: Remove address and errorcode arguments from do_break()
  powerpc: Remove address and errorcode arguments from do_page_fault()
  powerpc/32: Split head_32.h into head_40x.h and head_6xx_8xx.h
  powerpc/32: Preserve cr1 in exception prolog stack check
  powerpc/32: Make VMAP stack code depend on HAVE_ARCH_VMAP_STACK
  powerpc/32: Use r1 directly instead of r11 in syscall prolog
  powerpc/32: Remove msr argument in EXC_XFER_TEMPLATE() on 6xx/8xx
  powerpc/32: Enable instruction translation at the same time as data
    translation
  powerpc/32: Use r1 directly instead of r11 in exception prologs on
    6xx/8xx
  powerpc/32: Use r11 to store DSISR in prolog

 arch/powerpc/include/asm/bug.h                |   6 +-
 arch/powerpc/include/asm/debug.h              |   3 +-
 arch/powerpc/include/asm/processor.h          |   2 +-
 arch/powerpc/kernel/asm-offsets.c             |   2 +-
 arch/powerpc/kernel/entry_32.S                |  56 ++---
 arch/powerpc/kernel/exceptions-64e.S          |   5 +-
 arch/powerpc/kernel/exceptions-64s.S          |  10 +-
 arch/powerpc/kernel/fpu.S                     |   2 +-
 arch/powerpc/kernel/head_40x.S                |   8 +-
 arch/powerpc/kernel/{head_32.h => head_40x.h} | 186 +--------------
 .../kernel/{head_32.h => head_6xx_8xx.h}      | 222 +++++-------------
 arch/powerpc/kernel/head_8xx.S                |  33 +--
 arch/powerpc/kernel/head_book3s_32.S          |  64 ++---
 arch/powerpc/kernel/head_booke.h              |   4 +-
 arch/powerpc/kernel/idle_6xx.S                |  12 +-
 arch/powerpc/kernel/process.c                 |   8 +-
 arch/powerpc/kernel/traps.c                   |   2 +-
 arch/powerpc/kernel/vector.S                  |   2 +-
 arch/powerpc/mm/book3s32/Makefile             |   4 +-
 arch/powerpc/mm/book3s32/hash_low.S           |  14 --
 arch/powerpc/mm/book3s64/hash_utils.c         |   2 +-
 arch/powerpc/mm/book3s64/slb.c                |   2 +-
 arch/powerpc/mm/fault.c                       |  16 +-
 arch/powerpc/platforms/8xx/machine_check.c    |   2 +-
 24 files changed, 154 insertions(+), 513 deletions(-)
 copy arch/powerpc/kernel/{head_32.h => head_40x.h} (53%)
 rename arch/powerpc/kernel/{head_32.h => head_6xx_8xx.h} (50%)

-- 
2.25.0

