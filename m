Return-Path: <linuxppc-dev+bounces-5764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351AA2483D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2025 11:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlTKM5sJ3z2y8X;
	Sat,  1 Feb 2025 21:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738405207;
	cv=none; b=W1HF+e5D4WyEuUp+Rf7DBZMt26PeqQH1Pk4l2elRPPoxdWdPB2rstG2HizxVUbGFXZ27e5TM4Ulb4EtrW7MZ1wFOj1QSgD4wIsK5AOzNNqqjkhkJiY3MQfjYnG4sEvPd8ZGQvMP4faW5Sccd5AkGAHFDkkEB+JhrRzXMP1AFzvTk5XEBf/2R/esqZtNVW6hlfYAUQaeugGM4X0ArFBllXElMtjWkseIYGu/kxnr3E0KjbCuh3pVjhMpyB0ObEr00Yis2DiY8NrhJdln/+BhGjx9wrfkwl44tRPNiJ81WT2Tv+tjx1z3qzJv4ldsaeTt/a2ksViOGUWOpQOBbul1+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738405207; c=relaxed/relaxed;
	bh=eibNGPHMZYVCzevVR1+em6/IYT+Zijq4KYx20pBY2H8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMSkyIJcJw+stayN3PS6ysJloFHHDodiGKe9LwmaBKVYwfNuOCziu6cL9ZJjeAOXu/K0edHjcB7O2ul0qm/0GiFaztX6dBynBMadxfU1Yz/Nn53WTWO3+DBq+9wE6ytIyJBy9eaCzat9nqI5lyNYrwF8nw0llRw6ib0y2PATWU23GTy2jNmIvD7ddNchxDVEyJdY7XHZUT3RDRBX/yGWg0j8j6kf85fpQO7tqb+HbliHgtwnyU9GZOng6bSYfxMYPYJnF3aiPXhQZJl+3K1TUbYCCEbsKi5YFUJlHEAp0d4BKMEV7obSDYjogzg93Kpx7oHesTs9ulvNQHBPNTqtRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YlTKL67pFz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 21:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YlT035vgpz9sRr;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44aJXLhgEmTy; Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YlT034Cr1z9sRk;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AF0B8B764;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id peW_oZzE6k61; Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 012D88B763;
	Sat,  1 Feb 2025 11:05:06 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Balbir Singh <bsingharora@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
Date: Sat,  1 Feb 2025 11:04:36 +0100
Message-ID: <606946a557db1b5e9771b2a6fed30af3c0bc4863.1738404206.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738404280; l=4348; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=IXLjIKMuTavW1pDWvDyywJCypmcD9yKTT9S1qkcCOu8=; b=rY99R2gmgrYtl3WBL0z/ZbNXgdPXWwU2n4XknyljHCNZEA62TfMx69RHlKBMyriw+f7SqRn7F ErzOhNC9b1hDt9UspUGPUPpSfspXDYMtUromSwgOiTb1cMfE94f4am0
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Erhard reported the following KASAN hit while booting his PowerMac G4
with a KASAN-enabled kernel 6.13-rc6:

BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
Write of size 8 at addr f1000000 by task chronyd/1293

CPU: 0 UID: 123 PID: 1293 Comm: chronyd Tainted: G        W          6.13.0-rc6-PMacG4 #2
Tainted: [W]=WARN
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c2437590] [c1631a84] dump_stack_lvl+0x70/0x8c (unreliable)
[c24375b0] [c0504998] print_report+0xdc/0x504
[c2437610] [c050475c] kasan_report+0xf8/0x108
[c2437690] [c0505a3c] kasan_check_range+0x24/0x18c
[c24376a0] [c03fb5e4] copy_to_kernel_nofault+0xd8/0x1c8
[c24376c0] [c004c014] patch_instructions+0x15c/0x16c
[c2437710] [c00731a8] bpf_arch_text_copy+0x60/0x7c
[c2437730] [c0281168] bpf_jit_binary_pack_finalize+0x50/0xac
[c2437750] [c0073cf4] bpf_int_jit_compile+0xb30/0xdec
[c2437880] [c0280394] bpf_prog_select_runtime+0x15c/0x478
[c24378d0] [c1263428] bpf_prepare_filter+0xbf8/0xc14
[c2437990] [c12677ec] bpf_prog_create_from_user+0x258/0x2b4
[c24379d0] [c027111c] do_seccomp+0x3dc/0x1890
[c2437ac0] [c001d8e0] system_call_exception+0x2dc/0x420
[c2437f30] [c00281ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x5a1274
NIP:  005a1274 LR: 006a3b3c CTR: 005296c8
REGS: c2437f40 TRAP: 0c00   Tainted: G        W           (6.13.0-rc6-PMacG4)
MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24004422  XER: 00000000

GPR00: 00000166 af8f3fa0 a7ee3540 00000001 00000000 013b6500 005a5858 0200f932
GPR08: 00000000 00001fe9 013d5fc8 005296c8 2822244c 00b2fcd8 00000000 af8f4b57
GPR16: 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000002
GPR24: 00afdbb0 00000000 00000000 00000000 006e0004 013ce060 006e7c1c 00000001
NIP [005a1274] 0x5a1274
LR [006a3b3c] 0x6a3b3c
--- interrupt: c00

The buggy address belongs to the virtual mapping at
 [f1000000, f1002000) created by:
 text_area_cpu_up+0x20/0x190

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x76e30
flags: 0x80000000(zone=2)
raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 f0ffff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 f0ffff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>f1000000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
           ^
 f1000080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 f1000100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================

f8 corresponds to KASAN_VMALLOC_INVALID which means the area is not
initialised hence not supposed to be used yet.

Powerpc text patching infrastructure allocates a virtual memory area
using get_vm_area() and flags it as VM_ALLOC. But that flag is meant
to be used for vmalloc() and vmalloc() allocated memory is not
supposed to be used before a call to __vmalloc_node_range() which is
never called for that area.

That went undetected until commit e4137f08816b ("mm, kasan, kmsan:
instrument copy_from/to_kernel_nofault")

The area allocated by text_area_cpu_up() is not vmalloc memory, it is
mapped directly on demand when needed by map_kernel_page(). There is
no VM flag corresponding to such usage, so just pass no flag. That way
the area will be unpoisonned and usable immediately.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/20250112135832.57c92322@yea/
Fixes: 37bc3e5fd764 ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index af97fbb3c257..8a378fc19074 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -108,7 +108,7 @@ static int text_area_cpu_up(unsigned int cpu)
 	unsigned long addr;
 	int err;
 
-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
+	area = get_vm_area(PAGE_SIZE, 0);
 	if (!area) {
 		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
 			cpu);
-- 
2.47.0


