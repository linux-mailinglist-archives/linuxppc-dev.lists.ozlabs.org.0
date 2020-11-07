Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 795602AA4AF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 12:33:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSw9y54jbzDrQs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 22:33:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSw2b5347zDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 22:26:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSw2L4kCPz9txhF;
 Sat,  7 Nov 2020 12:26:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Qmf8VUomACSP; Sat,  7 Nov 2020 12:26:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSw2L3pCVz9txQD;
 Sat,  7 Nov 2020 12:26:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CA2308B776;
 Sat,  7 Nov 2020 12:26:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IUi8-SgwCRJS; Sat,  7 Nov 2020 12:26:51 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92B988B75B;
 Sat,  7 Nov 2020 12:26:51 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 516AA6686C; Sat,  7 Nov 2020 11:26:51 +0000 (UTC)
Message-Id: <e8c055458b080707f1bc1a98ff8bea79d0cec445.1604748361.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] panic: don't dump stack twice on warn
To: akpm@linux-foundation.org,
    aik@ozlabs.ru
Date: Sat,  7 Nov 2020 11:26:51 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before commit 3f388f28639f ("panic: dump registers on panic_on_warn"),
__warn() was calling show_regs() when regs was not NULL, and
show_stack() otherwise.

After that commit, show_stack() is called regardless of whether
show_regs() has been called or not, leading to duplicated Call Trace:

[    7.112617] ------------[ cut here ]------------
[    7.117041] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/nohash/8xx.c:186 mmu_mark_initmem_nx+0x24/0x94
[    7.126021] CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.0-rc2-s3k-dev-01375-gf46ec0d3ecbd-dirty #4092
[    7.135202] NIP:  c00128b4 LR: c0010228 CTR: 00000000
[    7.140205] REGS: c9023e40 TRAP: 0700   Not tainted  (5.10.0-rc2-s3k-dev-01375-gf46ec0d3ecbd-dirty)
[    7.149131] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24000424  XER: 00000000
[    7.155760]
[    7.155760] GPR00: c0010228 c9023ef8 c2100000 0074c000 ffffffff 00000000 c2151000 c07b3880
[    7.155760] GPR08: ff000900 0074c000 c8000000 c33b53a8 24000822 00000000 c0003a20 00000000
[    7.155760] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.155760] GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00800000
[    7.191092] NIP [c00128b4] mmu_mark_initmem_nx+0x24/0x94
[    7.196333] LR [c0010228] free_initmem+0x20/0x58
[    7.200855] Call Trace:
[    7.203319] [c9023f18] [c0010228] free_initmem+0x20/0x58
[    7.208564] [c9023f28] [c0003a3c] kernel_init+0x1c/0x114
[    7.213813] [c9023f38] [c000f184] ret_from_kernel_thread+0x14/0x1c
[    7.219869] Instruction dump:
[    7.222805] 7d291850 7d234b78 4e800020 9421ffe0 7c0802a6 bfc10018 3fe0c060 3bff0000
[    7.230462] 3fff4080 3bffffff 90010024 57ff0010 <0fe00000> 392001cd 7c3e0b78 953e0008
[    7.238327] CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.0-rc2-s3k-dev-01375-gf46ec0d3ecbd-dirty #4092
[    7.247500] Call Trace:
[    7.249977] [c9023dc0] [c001e070] __warn+0x8c/0xd8 (unreliable)
[    7.255815] [c9023de0] [c05e0e5c] report_bug+0x11c/0x154
[    7.261085] [c9023e10] [c0009ea4] program_check_exception+0x1dc/0x6e0
[    7.267430] [c9023e30] [c000f43c] ret_from_except_full+0x0/0x4
[    7.273238] --- interrupt: 700 at mmu_mark_initmem_nx+0x24/0x94
[    7.273238]     LR = free_initmem+0x20/0x58
[    7.283155] [c9023ef8] [00000000] 0x0 (unreliable)
[    7.287913] [c9023f18] [c0010228] free_initmem+0x20/0x58
[    7.293160] [c9023f28] [c0003a3c] kernel_init+0x1c/0x114
[    7.298410] [c9023f38] [c000f184] ret_from_kernel_thread+0x14/0x1c
[    7.304479] ---[ end trace 31702cd2a9570752 ]---

Only call show_stack() when regs is NULL.

Fixes: 3f388f28639f ("panic: dump registers on panic_on_warn")
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 kernel/panic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 396142ee43fd..332736a72a58 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -605,7 +605,8 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 		panic("panic_on_warn set ...\n");
 	}
 
-	dump_stack();
+	if (!regs)
+		dump_stack();
 
 	print_irqtrace_events(current);
 
-- 
2.25.0

