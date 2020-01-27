Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083F14A22D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 11:43:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485mZL57PgzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 21:43:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=jYbS0ZG5; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485mXM3jhBzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 21:42:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 485mX91WVPz9v02y;
 Mon, 27 Jan 2020 11:42:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jYbS0ZG5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wAs_VF93qg3X; Mon, 27 Jan 2020 11:42:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 485mX90Jr0z9v02x;
 Mon, 27 Jan 2020 11:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580121721; bh=QSas4AzfycVcrZrrY4ffgcs9Nqt9q9y8HeREqBisZ1g=;
 h=From:Subject:To:Cc:Date:From;
 b=jYbS0ZG5TuPWxcWiyHouSkNGKS6T7nOHGR/C/q6ryvjV5iouim64mr7SL5Cgs9goY
 Ov6I5aKw/QSgPMK1sIlPbI48lAmwds0y09CAp+yoKeClSQXmHGHqTJynVJdSzDGvpE
 WYlRjdNkkqeAAsSSwCLhq0XUxBCPB2y68rc3QwkQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CEEA48B79C;
 Mon, 27 Jan 2020 11:42:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V8fDMGbeqcJv; Mon, 27 Jan 2020 11:42:05 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E0AC8B752;
 Mon, 27 Jan 2020 11:42:05 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1A841651FA; Mon, 27 Jan 2020 10:42:04 +0000 (UTC)
Message-Id: <6d02c3ae6ad77af34392e98117e44c2bf6d13ba1.1580121710.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32s: Fix CPU wake-up from sleep mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 27 Jan 2020 10:42:04 +0000 (UTC)
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

Commit f7354ccac844 ("powerpc/32: Remove CURRENT_THREAD_INFO and
rename TI_CPU") broke the CPU wake-up from sleep mode (i.e. when
_TLF_SLEEPING is set) by delaying the tovirt(r2, r2).

This is because r2 is not restored by fast_exception_return. It used
to work (by chance ?) because CPU wake-up interrupt never comes from
user, so r2 is expected to point to 'current' on return.

Commit e2fb9f544431 ("powerpc/32: Prepare for Kernel Userspace Access
Protection") broke it even more by clobbering r0 which is not
restored by fast_exception_return either.

Use r6 instead of r0. This is possible because r3-r6 are restored by
fast_exception_return and only r3-r5 are used for exception arguments.

For r2 it could be converted back to virtual address, but stay on the
safe side and restore it from the stack instead. It should be live
in the cache at that moment, so loading from the stack should make
no difference compared to converting it from phys to virt.

Fixes: f7354ccac844 ("powerpc/32: Remove CURRENT_THREAD_INFO and rename TI_CPU")
Fixes: e2fb9f544431 ("powerpc/32: Prepare for Kernel Userspace Access Protection")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 73b80143ffac..27e2afce8b78 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -180,7 +180,7 @@ transfer_to_handler:
 2:	/* if from kernel, check interrupted DOZE/NAP mode and
          * check for stack overflow
          */
-	kuap_save_and_lock r11, r12, r9, r2, r0
+	kuap_save_and_lock r11, r12, r9, r2, r6
 	addi	r2, r12, -THREAD
 #ifndef CONFIG_VMAP_STACK
 	lwz	r9,KSP_LIMIT(r12)
@@ -288,6 +288,7 @@ reenable_mmu:
 	rlwinm	r9,r9,0,~MSR_EE
 	lwz	r12,_LINK(r11)		/* and return to address in LR */
 	kuap_restore r11, r2, r3, r4, r5
+	lwz	r2, GPR2(r11)
 	b	fast_exception_return
 #endif
 
-- 
2.25.0

