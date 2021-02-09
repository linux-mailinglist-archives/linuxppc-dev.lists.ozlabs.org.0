Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB13156DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 20:35:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZtQl2DSJzDwgF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZtJ10bgKzDsdJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 06:29:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZtHr4swQz9v023;
 Tue,  9 Feb 2021 20:29:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rPYpfhSM1kL7; Tue,  9 Feb 2021 20:29:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZtHr274tz9v021;
 Tue,  9 Feb 2021 20:29:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A0078B7EA;
 Tue,  9 Feb 2021 20:29:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id K6FQxBvXI5xg; Tue,  9 Feb 2021 20:29:28 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3FB58B764;
 Tue,  9 Feb 2021 20:29:27 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8F74767382; Tue,  9 Feb 2021 19:29:27 +0000 (UTC)
Message-Id: <fb87b205ae8eb8c623f33bb316801acf95a831e6.1612898425.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612898425.git.christophe.leroy@csgroup.eu>
References: <cover.1612898425.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v6 1/2] powerpc/syscall: Do not check unsupported scv vector
 on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Tue,  9 Feb 2021 19:29:27 +0000 (UTC)
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

Only book3s/64 has scv. No need to check the 0x7ff0 trap on 32 or 64e.
For that, add a helper trap_is_unsupported_scv() similar to
trap_is_scv().

And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
346 => 332 cycles)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: Added a helper trap_is_unsupported_scv()
v6: Still set r5 when calling syscall_exit_prepare() and introduce a local bool 'is_not_scv'
---
 arch/powerpc/include/asm/ptrace.h | 5 +++++
 arch/powerpc/kernel/interrupt.c   | 9 +++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 8236c5e749e4..975ba260006a 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -232,6 +232,11 @@ static inline bool trap_is_scv(struct pt_regs *regs)
 	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x3000);
 }
 
+static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
+{
+	return IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) == 0x7ff0;
+}
+
 static inline bool trap_is_syscall(struct pt_regs *regs)
 {
 	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 107ec39f05cb..75d657b63332 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -88,7 +88,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	local_irq_enable();
 
 	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
-		if (unlikely(regs->trap == 0x7ff0)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
 			return regs->gpr[3];
@@ -111,7 +111,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		r8 = regs->gpr[8];
 
 	} else if (unlikely(r0 >= NR_syscalls)) {
-		if (unlikely(regs->trap == 0x7ff0)) {
+		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
 			return regs->gpr[3];
@@ -220,6 +220,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
 	unsigned long ret = 0;
+	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
 
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
@@ -234,7 +235,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	ti_flags = *ti_flagsp;
 
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && !scv) {
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
 			r3 = -r3;
 			regs->ccr |= 0x10000000; /* Set SO bit in CR */
@@ -305,7 +306,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	user_enter_irqoff();
 
 	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!__prep_irq_for_enabled_exit(!scv))) {
+	if (unlikely(!__prep_irq_for_enabled_exit(is_not_scv))) {
 		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
-- 
2.25.0

