Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715C129840
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:29:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNYX6PQDzDqG9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:29:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="mb9cH2ZE"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVG6xtWzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:14 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNV60097z9vJyp;
 Mon, 23 Dec 2019 16:26:06 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=mb9cH2ZE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AMfTUWCOxQHb; Mon, 23 Dec 2019 16:26:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNV560H5z9vJyn;
 Mon, 23 Dec 2019 16:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114765; bh=XwT2bCOLWphD/sSJh9VwSsc95eI+wrP0sTiw3zw31v0=;
 h=From:Subject:To:Cc:Date:From;
 b=mb9cH2ZEAK/hU2LwwQQDycPlb295W0zc/5AOtP4sonsQhNJVeDG5RpB6CoBfGZCjm
 E9aFumiFyRKygt6kIJr1GpRZ0MxSw8y7dXP6U9IxXH68Vkv74is9J39/dZPi5AbOgl
 K/327GMTI2SNZr+tWK9TKEjAx0e2LDZp/+5jSCkI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 058D58B7AB;
 Mon, 23 Dec 2019 16:26:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wu9RLPM7jVpd; Mon, 23 Dec 2019 16:26:10 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D3A6C8B7A1;
 Mon, 23 Dec 2019 16:26:10 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C82E6637D8; Mon, 23 Dec 2019 15:26:10 +0000 (UTC)
Message-Id: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 0/8] Accelarate IRQ entry
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:10 +0000 (UTC)
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

The purpose of this series is to accelerate IRQ entry by
avoiding unneccessary trampoline functions like call_do_irq()
and call_do_softirq() and by switching to IRQ stack
immediately in the exception handler.

For now, it is an RFC as it is still a bit messy.

Please provide feedback and I'll improve next year

Christophe Leroy (8):
  powerpc/32: drop ksp_limit based stack overflow detection
  powerpc/irq: inline call_do_irq() and call_do_softirq() on PPC32
  powerpc/irq: don't use current_stack_pointer() in do_IRQ()
  powerpc/irq: move set_irq_regs() closer to irq_enter/exit()
  powerpc/irq: move stack overflow verification
  powerpc/irq: cleanup check_stack_overflow() a bit
  powerpc/32: use IRQ stack immediately on IRQ exception
  powerpc/irq: drop softirq stack

 arch/powerpc/include/asm/asm-prototypes.h |  1 -
 arch/powerpc/include/asm/irq.h            |  3 +-
 arch/powerpc/include/asm/processor.h      |  3 --
 arch/powerpc/include/asm/reg.h            |  8 ++++
 arch/powerpc/kernel/asm-offsets.c         |  2 -
 arch/powerpc/kernel/entry_32.S            | 57 ------------------------
 arch/powerpc/kernel/head_32.S             |  2 +-
 arch/powerpc/kernel/head_32.h             | 32 +++++++++++--
 arch/powerpc/kernel/head_40x.S            |  4 +-
 arch/powerpc/kernel/head_8xx.S            |  2 +-
 arch/powerpc/kernel/head_booke.h          |  1 -
 arch/powerpc/kernel/irq.c                 | 74 +++++++++++++++++++++----------
 arch/powerpc/kernel/misc_32.S             | 39 ----------------
 arch/powerpc/kernel/process.c             |  7 ---
 arch/powerpc/kernel/setup_32.c            |  4 +-
 arch/powerpc/kernel/setup_64.c            |  4 +-
 arch/powerpc/kernel/traps.c               |  9 ----
 arch/powerpc/lib/sstep.c                  |  9 ----
 18 files changed, 95 insertions(+), 166 deletions(-)

-- 
2.13.3

