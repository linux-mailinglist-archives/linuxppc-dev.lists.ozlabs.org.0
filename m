Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88E3345CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwft96GC5z3cKb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfst2kttz30Ql
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:57:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfsl0t1dz9tytV;
 Wed, 10 Mar 2021 18:56:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id I1EXGECxpNsE; Wed, 10 Mar 2021 18:56:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfsk6Bl4z9tytT;
 Wed, 10 Mar 2021 18:56:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 95A8A8B78D;
 Wed, 10 Mar 2021 18:57:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 918SWz6Z3lvi; Wed, 10 Mar 2021 18:57:00 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A3148B77E;
 Wed, 10 Mar 2021 18:57:00 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 748F26756B; Wed, 10 Mar 2021 17:56:59 +0000 (UTC)
Message-Id: <cover.1615398498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/8] Miscellaneous user access improvement
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:56:59 +0000 (UTC)
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

Patches 1-3 are cleaning parts of uaccess.h not related
to put_user/get_user
Patch 4 removes some usage of consecutives __get_user
Patches 5 rewrite __patch_instruction to not use uaccess.h internals.
Patches 6-8 switch some parts of code to user_access_begin/end blocks

All patches are independant.

Christophe Leroy (8):
  powerpc/uaccess: Also perform 64 bits copies in unsafe_copy_to_user()
    on ppc32
  powerpc/uaccess: Swap clear_user() and __clear_user()
  powerpc/uaccess: Move copy_mc_xxx() functions down
  powerpc/syscalls: Use sys_old_select() in ppc_select()
  powerpc/lib: Don't use __put_user_asm_goto() outside of uaccess.h
  powerpc/net: Switch csum_and_copy_{to/from}_user to user_access block
  powerpc/futex: Switch to user_access block
  powerpc/ptrace: Convert gpr32_set_common() to user access block

 arch/powerpc/include/asm/futex.h         | 12 ++--
 arch/powerpc/include/asm/ptrace.h        |  2 +-
 arch/powerpc/include/asm/uaccess.h       | 75 ++++++++++++------------
 arch/powerpc/include/asm/unistd.h        |  1 +
 arch/powerpc/kernel/ptrace/ptrace-view.c | 30 ++++++----
 arch/powerpc/kernel/syscalls.c           | 12 +---
 arch/powerpc/lib/checksum_wrappers.c     | 15 ++---
 arch/powerpc/lib/code-patching.c         | 13 ++--
 8 files changed, 77 insertions(+), 83 deletions(-)

-- 
2.25.0

