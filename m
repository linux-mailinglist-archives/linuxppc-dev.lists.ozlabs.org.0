Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED62F19A3A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 04:40:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sVmc0ksFzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 13:40:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sVkJ4DD1zDqs8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 13:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fLa0ya0+; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48sVkJ39mvz9sRf; Wed,  1 Apr 2020 13:38:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48sVkJ1x0Jz9sSM; Wed,  1 Apr 2020 13:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585708712;
 bh=eEFffkpaN5s+3viEkmrUNSElhApvcJKdzmsjPER6WEw=;
 h=From:To:Cc:Subject:Date:From;
 b=fLa0ya0+vqVmdARFFM8PVPMmx0JUEmBWcVn2tG8LAJI1OTBI9jaXwQgkaUIF+73hl
 Hcd4S1mKyLGdEMnVY0CM6zjtGGGeqolzpBM/pyRQTTgcPiH7owAVIxU3Oc3uyK/6Kd
 tNET7swOc6iEEK1SSTH35AOuL++aqO1IqsoCpmDngNidXojnfMdYKwIBrXjKNrp77F
 cX2Tnfit0D8ciRuVs5bCJtkem/U/PuYggT5Na+W6QD+ACcdX7J7j37wDfGGaKJLFDK
 48DAWADxIRvwTEy8JAZIM9Ybz/58KXoUlvJziQFq6AysZrVmFOfEembe1qDhrFVZrt
 2zRYcq22herrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64/tm: Don't let userspace set regs->trap via
 sigreturn
Date: Wed,  1 Apr 2020 13:38:36 +1100
Message-Id: <20200401023836.3286664-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: mikey@neuling.org, npiggin@gmail.com, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In restore_tm_sigcontexts() we take the trap value directly from the
user sigcontext with no checking:

	err |= __get_user(regs->trap, &sc->gp_regs[PT_TRAP]);

This means we can be in the kernel with an arbitrary regs->trap value.

Although that's not immediately problematic, there is a risk we could
trigger one of the uses of CHECK_FULL_REGS():

	#define CHECK_FULL_REGS(regs)	BUG_ON(regs->trap & 1)

It can also cause us to unnecessarily save non-volatile GPRs again in
save_nvgprs(), which shouldn't be problematic but is still wrong.

It's also possible it could trick the syscall restart machinery, which
relies on regs->trap not being == 0xc00 (see 9a81c16b5275 ("powerpc:
fix double syscall restarts")), though I haven't been able to make
that happen.

Finally it doesn't match the behaviour of the non-TM case, in
restore_sigcontext() which zeroes regs->trap.

So change restore_tm_sigcontexts() to zero regs->trap.

This was discovered while testing Nick's upcoming rewrite of the
syscall entry path. In that series the call to save_nvgprs() prior to
signal handling (do_notify_resume()) is removed, which leaves the
low-bit of regs->trap uncleared which can then trigger the FULL_REGS()
WARNs in setup_tm_sigcontexts().

Fixes: 2b0a576d15e0 ("powerpc: Add new transactional memory state to the signal context")
Cc: stable@vger.kernel.org # v3.9+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/signal_64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 84ed2e77ef9c..adfde59cf4ba 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -473,8 +473,10 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	err |= __get_user(tsk->thread.ckpt_regs.ccr,
 			  &sc->gp_regs[PT_CCR]);
 
+	/* Don't allow userspace to set the trap value */
+	regs->trap = 0;
+
 	/* These regs are not checkpointed; they can go in 'regs'. */
-	err |= __get_user(regs->trap, &sc->gp_regs[PT_TRAP]);
 	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
 	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
 	err |= __get_user(regs->result, &sc->gp_regs[PT_RESULT]);

base-commit: 7074695ac6fb965d478f373b95bc5c636e9f21b0
-- 
2.25.1

