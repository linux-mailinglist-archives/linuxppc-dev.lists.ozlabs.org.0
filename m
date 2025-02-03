Return-Path: <linuxppc-dev+bounces-5785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD09A25745
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2025 11:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymjv46GwSz2yF1;
	Mon,  3 Feb 2025 21:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738579808;
	cv=none; b=FAGV4qI0Axq6QTw9NDKrD/4SX48YKKcc5VJsPVuxG21VfDioRN8AUNm8utWenHdRiRZRGnYeq64q8qIazRCqUWh68nEGpeTLqORXlyfY3IqfswlIvMaic4a9eImLypNPwqLB/8cRlC7jhTiFtB+YWxps7px29xkRA6cKYDkmttlKk2gyvvoieEhVg7WyizT5sLGGAO8J9hmXRQaMWCNH1lAjc2EU9CDNQdHyKwfFrB28AuzYLxobx5u5yKuY0iSWAYZBy4+JVdGc7jeTd3/4KBYs6CxOzPWmE/O14bqbag7ahPxmoORnJDp2c6Hm2Nqx27wMif7EEP93ruHxldMyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738579808; c=relaxed/relaxed;
	bh=4iBNDdeIpxyZTzDdjOwScf+eZQp0Y1K2A5QQPlPlwHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deM4oh+hBLceNj3Ch32jtw2KSeUXhI/qPkgnGt8XCyHqDQrkshjv2R/3fo1LVwayC1KfxzkaMFtIPllyz0X9FplxPbBsGDHH+uzY6JRtEqlwLBZT+22OBZH7H7BlGtMZVMa9dZ9yGudYrecXfqP718dfrX8VXhrIUWfvQrPKbDV9S2i0NHQIx213xMkERsrqcITgQ2a2/jjhhbqF3VXjsQ4KzcuzRQT0/OtMXP7Am25rOOPeBHLGkJRa48NGsRFvjvoHZfaT0xTAfTyRx8oFrXTyUdLNnIks19FVmcJIsO9GCUMufywXBvsKkfCCy5x1z+PtxmmYFvGC8Oiq9LWAiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ymjv31lV0z2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2025 21:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ymj6j0dnsz9sRy;
	Mon,  3 Feb 2025 11:15:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id edW2Lj5g4zeh; Mon,  3 Feb 2025 11:15:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ymj6h6dwNz9sPd;
	Mon,  3 Feb 2025 11:15:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D18508B767;
	Mon,  3 Feb 2025 11:15:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WY6UOIcsx0kV; Mon,  3 Feb 2025 11:15:08 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 264DE8B766;
	Mon,  3 Feb 2025 11:15:08 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] powerpc/code-patching: Disable KASAN report during patching via temporary mm
Date: Mon,  3 Feb 2025 11:14:57 +0100
Message-ID: <1c05b2a1b02ad75b981cfc45927e0b4a90441046.1738577687.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738577698; l=5368; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=wiXX7GseMnf0CAkGInhemcdG19OuOZo2Pnji6hPKJJo=; b=hnkmHRVbpIhnKdpl5axPAUioZBWcxN1JWyRbrxpkjwu6lvyUyJaWCEBngqxhR+ts6GFvgfEpT pQur9Y9R00NAisdIIFRACH/lsy4KUIPZdplQ8G65xQWZpOOTTGSVupx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Erhard reports the following KASAN hit on Talos II (power9) with kernel 6.13:

[   12.028126] ==================================================================
[   12.028198] BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0
[   12.028260] Write of size 8 at addr 0000187e458f2000 by task systemd/1

[   12.028346] CPU: 87 UID: 0 PID: 1 Comm: systemd Tainted: G                T  6.13.0-P9-dirty #3
[   12.028408] Tainted: [T]=RANDSTRUCT
[   12.028446] Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
[   12.028500] Call Trace:
[   12.028536] [c000000008dbf3b0] [c000000001656a48] dump_stack_lvl+0xbc/0x110 (unreliable)
[   12.028609] [c000000008dbf3f0] [c0000000006e2fc8] print_report+0x6b0/0x708
[   12.028666] [c000000008dbf4e0] [c0000000006e2454] kasan_report+0x164/0x300
[   12.028725] [c000000008dbf600] [c0000000006e54d4] kasan_check_range+0x314/0x370
[   12.028784] [c000000008dbf640] [c0000000006e6310] __kasan_check_write+0x20/0x40
[   12.028842] [c000000008dbf660] [c000000000578e8c] copy_to_kernel_nofault+0x8c/0x1a0
[   12.028902] [c000000008dbf6a0] [c0000000000acfe4] __patch_instructions+0x194/0x210
[   12.028965] [c000000008dbf6e0] [c0000000000ade80] patch_instructions+0x150/0x590
[   12.029026] [c000000008dbf7c0] [c0000000001159bc] bpf_arch_text_copy+0x6c/0xe0
[   12.029085] [c000000008dbf800] [c000000000424250] bpf_jit_binary_pack_finalize+0x40/0xc0
[   12.029147] [c000000008dbf830] [c000000000115dec] bpf_int_jit_compile+0x3bc/0x930
[   12.029206] [c000000008dbf990] [c000000000423720] bpf_prog_select_runtime+0x1f0/0x280
[   12.029266] [c000000008dbfa00] [c000000000434b18] bpf_prog_load+0xbb8/0x1370
[   12.029324] [c000000008dbfb70] [c000000000436ebc] __sys_bpf+0x5ac/0x2e00
[   12.029379] [c000000008dbfd00] [c00000000043a228] sys_bpf+0x28/0x40
[   12.029435] [c000000008dbfd20] [c000000000038eb4] system_call_exception+0x334/0x610
[   12.029497] [c000000008dbfe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
[   12.029561] --- interrupt: 3000 at 0x3fff82f5cfa8
[   12.029608] NIP:  00003fff82f5cfa8 LR: 00003fff82f5cfa8 CTR: 0000000000000000
[   12.029660] REGS: c000000008dbfe80 TRAP: 3000   Tainted: G                T   (6.13.0-P9-dirty)
[   12.029735] MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 42004848  XER: 00000000
[   12.029855] IRQMASK: 0
               GPR00: 0000000000000169 00003fffdcf789a0 00003fff83067100 0000000000000005
               GPR04: 00003fffdcf78a98 0000000000000090 0000000000000000 0000000000000008
               GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
               GPR12: 0000000000000000 00003fff836ff7e0 c000000000010678 0000000000000000
               GPR16: 0000000000000000 0000000000000000 00003fffdcf78f28 00003fffdcf78f90
               GPR20: 0000000000000000 0000000000000000 0000000000000000 00003fffdcf78f80
               GPR24: 00003fffdcf78f70 00003fffdcf78d10 00003fff835c7239 00003fffdcf78bd8
               GPR28: 00003fffdcf78a98 0000000000000000 0000000000000000 000000011f547580
[   12.030316] NIP [00003fff82f5cfa8] 0x3fff82f5cfa8
[   12.030361] LR [00003fff82f5cfa8] 0x3fff82f5cfa8
[   12.030405] --- interrupt: 3000
[   12.030444] ==================================================================

Commit c28c15b6d28a ("powerpc/code-patching: Use temporary mm for
Radix MMU") is inspired from x86 but unlike x86 is doesn't disable
KASAN reports during patching. This wasn't a problem at the begining
because __patch_mem() is not instrumented.

Commit 465cabc97b42 ("powerpc/code-patching: introduce
patch_instructions()") use copy_to_kernel_nofault() to copy several
instructions at once. But when using temporary mm the destination is
not regular kernel memory but a kind of kernel-like memory located
in user address space. Because it is not in kernel address space it is
not covered by KASAN shadow memory. Since commit e4137f08816b ("mm,
kasan, kmsan: instrument copy_from/to_kernel_nofault") KASAN reports
bad accesses from copy_to_kernel_nofault(). Here a bad access to user
memory is reported because KASAN detects the lack of shadow memory and
the address is below TASK_SIZE.

Do like x86 in commit b3fd8e83ada0 ("x86/alternatives: Use temporary
mm for text poking") and disable KASAN reports during patching when
using temporary mm.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Close: https://lore.kernel.org/all/20250201151435.48400261@yea/
Fixes: 465cabc97b42 ("powerpc/code-patching: introduce patch_instructions()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 8a378fc19074..f84e0337cc02 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -493,7 +493,9 @@ static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool rep
 
 	orig_mm = start_using_temp_mm(patching_mm);
 
+	kasan_disable_current();
 	err = __patch_instructions(patch_addr, code, len, repeat_instr);
+	kasan_enable_current();
 
 	/* context synchronisation performed by __patch_instructions */
 	stop_using_temp_mm(patching_mm, orig_mm);
-- 
2.47.0


