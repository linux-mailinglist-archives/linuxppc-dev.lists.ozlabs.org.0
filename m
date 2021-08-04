Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0B3E0788
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 20:24:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg0Wt4Kbpz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 04:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg0WV12fLz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 04:24:18 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gg0WH6QzDz9sWW;
 Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0L_DWaTW1BYS; Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gg0WH5NCTz9sWL;
 Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9108D8B7AE;
 Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HDyRtP5JMZTt; Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 52B188B7A1;
 Wed,  4 Aug 2021 20:24:11 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0620766190; Wed,  4 Aug 2021 18:24:10 +0000 (UTC)
Message-Id: <75287841cbb8740edd44880fe60be66d489160d9.1628097995.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/smp: Fix OOPS in topology_init()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  4 Aug 2021 18:24:10 +0000 (UTC)
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

Running an SMP kernel on an UP platform not prepared for it,
I encountered the following OOPS:

	BUG: Kernel NULL pointer dereference on read at 0x00000034
	Faulting instruction address: 0xc0a04110
	Oops: Kernel access of bad area, sig: 11 [#1]
	BE PAGE_SIZE=4K SMP NR_CPUS=2 CMPCPRO
	Modules linked in:
	CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-pmac-00001-g230fedfaad21 #5234
	NIP:  c0a04110 LR: c0a040d8 CTR: c0a04084
	REGS: e100dda0 TRAP: 0300   Not tainted  (5.13.0-pmac-00001-g230fedfaad21)
	MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 84000284  XER: 00000000
	DAR: 00000034 DSISR: 20000000
	GPR00: c0006bd4 e100de60 c1033320 00000000 00000000 c0942274 00000000 00000000
	GPR08: 00000000 00000000 00000001 00000063 00000007 00000000 c0006f30 00000000
	GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000005
	GPR24: c0c67d74 c0c67f1c c0c60000 c0c67d70 c0c0c558 1efdf000 c0c00020 00000000
	NIP [c0a04110] topology_init+0x8c/0x138
	LR [c0a040d8] topology_init+0x54/0x138
	Call Trace:
	[e100de60] [80808080] 0x80808080 (unreliable)
	[e100de90] [c0006bd4] do_one_initcall+0x48/0x1bc
	[e100def0] [c0a0150c] kernel_init_freeable+0x1c8/0x278
	[e100df20] [c0006f44] kernel_init+0x14/0x10c
	[e100df30] [c00190fc] ret_from_kernel_thread+0x14/0x1c
	Instruction dump:
	7c692e70 7d290194 7c035040 7c7f1b78 5529103a 546706fe 5468103a 39400001
	7c641b78 40800054 80c690b4 7fb9402e <81060034> 7fbeea14 2c080000 7fa3eb78
	---[ end trace b246ffbc6bbbb6fb ]---

Fix it by checking smp_ops before using it, as already done in
several other places in the arch/powerpc/kernel/smp.c

Fixes: 39f87561454d ("powerpc/smp: Move ppc_md.cpu_die() to smp_ops.cpu_offline_self()")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 5ff0e55d0db1..defecb3b1b15 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -1167,7 +1167,7 @@ static int __init topology_init(void)
 		 * CPU.  For instance, the boot cpu might never be valid
 		 * for hotplugging.
 		 */
-		if (smp_ops->cpu_offline_self)
+		if (smp_ops && smp_ops->cpu_offline_self)
 			c->hotpluggable = 1;
 #endif
 
-- 
2.25.0

