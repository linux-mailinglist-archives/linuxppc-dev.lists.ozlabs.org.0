Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D709B163085
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 20:46:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MWZT1MSyzDqKg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 06:46:41 +1100 (AEDT)
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
 header.s=mail header.b=AntGsIiZ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MWP36GmXzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 06:38:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48MWP04TdBz9v2j6;
 Tue, 18 Feb 2020 20:38:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AntGsIiZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LxG3iblSf05O; Tue, 18 Feb 2020 20:38:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48MWP03HQhz9v2j0;
 Tue, 18 Feb 2020 20:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582054708; bh=16FXGVyDUmjGA6KMYi97nEXumIjz7MvmF/4qtp6LbAI=;
 h=From:Subject:To:Cc:Date:From;
 b=AntGsIiZwJCT3RniNbT2nRmoco8sk+1EkOaa33MzNB6gJxNDRFTFSzCH/il0r6ikW
 uhdf/Hay2/RTudjJJKfno01BpYQpL23AsiJ9/Hnz4coUuBwi44kpRVS5Fa21+ndGaR
 Er+pGjYMmJ9ttKBZRln5uAn5x9x56LsB1wyizpf8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 763288B81D;
 Tue, 18 Feb 2020 20:38:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e_KG-rJSnDtJ; Tue, 18 Feb 2020 20:38:28 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 231408B80C;
 Tue, 18 Feb 2020 20:38:28 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B152965316; Tue, 18 Feb 2020 19:38:27 +0000 (UTC)
Message-Id: <424331e2006e7291a1bfe40e7f3fa58825f565e1.1582054578.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3] powerpc/kprobes: Ignore traps that happened in real mode
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Date: Tue, 18 Feb 2020 19:38:27 +0000 (UTC)
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
Cc: stable@kernel.vger.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a program check exception happens while MMU translation is
disabled, following Oops happens in kprobe_handler() in the following
code:

		} else if (*addr != BREAKPOINT_INSTRUCTION) {

[   33.098554] BUG: Unable to handle kernel data access on read at 0x0000e268
[   33.105091] Faulting instruction address: 0xc000ec34
[   33.110010] Oops: Kernel access of bad area, sig: 11 [#1]
[   33.115348] BE PAGE_SIZE=16K PREEMPT CMPC885
[   33.119540] Modules linked in:
[   33.122591] CPU: 0 PID: 429 Comm: cat Not tainted 5.6.0-rc1-s3k-dev-00824-g84195dc6c58a #3267
[   33.131005] NIP:  c000ec34 LR: c000ecd8 CTR: c019cab8
[   33.136002] REGS: ca4d3b58 TRAP: 0300   Not tainted  (5.6.0-rc1-s3k-dev-00824-g84195dc6c58a)
[   33.144324] MSR:  00001032 <ME,IR,DR,RI>  CR: 2a4d3c52  XER: 00000000
[   33.150699] DAR: 0000e268 DSISR: c0000000
[   33.150699] GPR00: c000b09c ca4d3c10 c66d0620 00000000 ca4d3c60 00000000 00009032 00000000
[   33.150699] GPR08: 00020000 00000000 c087de44 c000afe0 c66d0ad0 100d3dd6 fffffff3 00000000
[   33.150699] GPR16: 00000000 00000041 00000000 ca4d3d70 00000000 00000000 0000416d 00000000
[   33.150699] GPR24: 00000004 c53b6128 00000000 0000e268 00000000 c07c0000 c07bb6fc ca4d3c60
[   33.188015] NIP [c000ec34] kprobe_handler+0x128/0x290
[   33.192989] LR [c000ecd8] kprobe_handler+0x1cc/0x290
[   33.197854] Call Trace:
[   33.200340] [ca4d3c30] [c000b09c] program_check_exception+0xbc/0x6fc
[   33.206590] [ca4d3c50] [c000e43c] ret_from_except_full+0x0/0x4
[   33.212392] --- interrupt: 700 at 0xe268
[   33.270401] Instruction dump:
[   33.273335] 913e0008 81220000 38600001 3929ffff 91220000 80010024 bb410008 7c0803a6
[   33.280992] 38210020 4e800020 38600000 4e800020 <813b0000> 6d2a7fe0 2f8a0008 419e0154
[   33.288841] ---[ end trace 5b9152d4cdadd06d ]---

kprobe is not prepared to handle events in real mode and functions
running in real mode should have been blacklisted, so kprobe_handler()
can safely bail out telling 'this trap is not mine' for any trap that
happened while in real-mode.

If the trap happened with MSR_IR or MSR_DR cleared, return 0 immediately.

Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
Fixes: 6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
Cc: stable@vger.kernel.org
Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v3: Also bail out if MSR_DR is cleared.

Resending v2 with a more appropriate name

v2: bailing out instead of converting real-time address to virtual and continuing.

The bug might have existed even before that commit from Naveen.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/kprobes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 2d27ec4feee4..9b340af02c38 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -264,6 +264,9 @@ int kprobe_handler(struct pt_regs *regs)
 	if (user_mode(regs))
 		return 0;
 
+	if (!(regs->msr & MSR_IR) || !(regs->msr & MSR_DR))
+		return 0;
+
 	/*
 	 * We don't want to be preempted for the entire
 	 * duration of kprobe processing
-- 
2.25.0

