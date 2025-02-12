Return-Path: <linuxppc-dev+bounces-6117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FBA31FE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 08:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt8pb0k4Sz2yyD;
	Wed, 12 Feb 2025 18:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739344806;
	cv=none; b=Avi5uD/iPmyTkRN+VtwCXLCze/8Jjzkxv16peKLXlt0KcwkRqBo5Pk+EtnaTX1a5uvtXe99rhW/id/Ia+4Xo+u8aDSn8RLvuO+8U/u3gK3LTC/sRghJinr/fFCxZFycEn9PGryMmHB5749nEcPKEQCIHlhjyCXT3NeUaPGPF47ukoTcjeq5yEbn5XBtNryRqRNXFjplc34Qt3eb3n+q8gijizyN1e1TqL+ZBpVjdcHcOrsRavkZJQrZjbl6/wpkvRfj1VPJzkIrQkfKXiNuL820xULWSpaATPUO30olCJlxV+4uHxT3Rt3Rf2uBloq5s2XfDLeoWRoYbdyVVh0g6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739344806; c=relaxed/relaxed;
	bh=yqCfJKR5FPGGLyPdfkbYRNp6Rnio57wJ9YxxZh9GbeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gY+STPKSKBdED7OLYSrubWGZwW9WM5jaLDYq5cebaEt75bh21klNdJZLGQyZKzGzA1rKBjuRlSernHCwrdAuJL6lN+9CUgoEZQZkarVNl3htKFtkfcOzz9RZei5Ig96/mBbPG+KPEvH2pNC0NSwAxqF3rbnNwZ2r14zEQiCbkcX4Sl6EzVz191q1r3twJtJSm9D8ibEjL6EVbDeon8YSqkIfULNyFD6VSSuVdDV3+TC8ijpGfevqvfcLmxxNJvFpbF8u3wVDjBaFs01veOEHn5zIUtwbfwnK6L3Zm5vBHL/Oj0WfOSIpG83W/YRObMRVd7w3iYWw7xsuqmwwXwcWXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt8pZ0Vq4z2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 18:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yt83s13G2z9sPd;
	Wed, 12 Feb 2025 07:46:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 83R2JPrA4XVg; Wed, 12 Feb 2025 07:46:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yt83s02qzz9rvV;
	Wed, 12 Feb 2025 07:46:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E858C8B770;
	Wed, 12 Feb 2025 07:46:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wzoTdwFsLGnb; Wed, 12 Feb 2025 07:46:32 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B98A08B763;
	Wed, 12 Feb 2025 07:46:32 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH v2] powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
Date: Wed, 12 Feb 2025 07:46:28 +0100
Message-ID: <06621423da339b374f48c0886e3a5db18e896be8.1739342693.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739342788; l=4545; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=p3TXOgPutER088kooOwsPkLRYDwyiVT6E7Bu0WF26Tg=; b=ZwrR/v049bSg+M2ge8wLUfGPpag6/zJhkrHc7AVgLBNOGC47fYkLb5AohC9JsPKexXtASgR05 oGd+skniHlgAONLFqL40qWBk9HF5i69maFApz6cE6U4n+X4JbAmaGfs
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
v2: Reformated commit message to avoid git dropping away everything after --- interrupt: c00
---
 arch/powerpc/lib/code-patching.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 81c0f673eb25..f84e0337cc02 100644
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


