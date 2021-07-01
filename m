Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A183B9107
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 13:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFwfn3Zk7z3bjQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 21:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFwfR4yzLz301X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 21:17:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GFwfG1JNGzBDd1;
 Thu,  1 Jul 2021 13:17:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9iG8UJUbAIoV; Thu,  1 Jul 2021 13:17:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GFwfG0R6KzBDb6;
 Thu,  1 Jul 2021 13:17:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D7A078B8F9;
 Thu,  1 Jul 2021 13:17:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rl1aU70ZKTna; Thu,  1 Jul 2021 13:17:09 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B9F18B903;
 Thu,  1 Jul 2021 13:17:09 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BFD336627F; Thu,  1 Jul 2021 11:17:08 +0000 (UTC)
Message-Id: <024bb05105050f704743a0083fe3548702be5706.1625138205.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/mm: Fix lockup on kernel exec fault
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu,  1 Jul 2021 11:17:08 +0000 (UTC)
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

The powerpc kernel is not prepared to handle exec faults from kernel.
Especially, the function is_exec_fault() will return 'false' when an
exec fault is taken by kernel, because the check is based on reading
current->thread.regs->trap which contains the trap from user.

For instance, when provoking a LKDTM EXEC_USERSPACE test,
current->thread.regs->trap is set to SYSCALL trap (0xc00), and
the fault taken by the kernel is not seen as an exec fault by
set_access_flags_filter().

Commit d7df2443cd5f ("powerpc/mm: Fix spurrious segfaults on radix
with autonuma") made it clear and handled it properly. But later on
commit d3ca587404b3 ("powerpc/mm: Fix reporting of kernel execute
faults") removed that handling, introducing test based on error_code.
And here is the problem, because on the 603 all upper bits of SRR1
get cleared when the TLB instruction miss handler bails out to ISI.

Until commit cbd7e6ca0210 ("powerpc/fault: Avoid heavy
search_exception_tables() verification"), an exec fault from kernel
at a userspace address was indirectly caught by the lack of entry for
that address in the exception tables. But after that commit the
kernel mainly rely on KUAP or on core mm handling to catch wrong
user accesses. Here the access is not wrong, so mm handles it.
It is a minor fault because PAGE_EXEC is not set,
set_access_flags_filter() should set PAGE_EXEC and voila.
But as is_exec_fault() returns false as explained in the begining,
set_access_flags_filter() bails out without setting PAGE_EXEC flag,
which leads to a forever minor exec fault.

As the kernel is not prepared to handle such exec faults, the thing
to do is to fire in bad_kernel_fault() for any exec fault taken by
the kernel, as it was prior to commit d3ca587404b3.

Fixes: d3ca587404b3 ("powerpc/mm: Fix reporting of kernel execute faults")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/fault.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 34f641d4a2fe..a8d0ce85d39a 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -199,9 +199,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 {
 	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 
-	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
-	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
-				      DSISR_PROTFAULT))) {
+	if (is_exec) {
 		pr_crit_ratelimited("kernel tried to execute %s page (%lx) - exploit attempt? (uid: %d)\n",
 				    address >= TASK_SIZE ? "exec-protected" : "user",
 				    address,
-- 
2.25.0

