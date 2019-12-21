Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 301B6128905
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 13:16:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47g4Ms6hNZzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 23:16:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47g4KK264JzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 23:13:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="mk1ipUBQ"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47g4KK1C8wz9sP6; Sat, 21 Dec 2019 23:13:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47g4KK0NsKz9sPV; Sat, 21 Dec 2019 23:13:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576930437;
 bh=fdGx99SybEx58+mgqPKw8RXITFkl+BhWI68Y46n/QKY=;
 h=From:To:Cc:Subject:Date:From;
 b=mk1ipUBQWoF7JXo8cyYKz3kFqgdxrSHmBOb5/ffUK+RNZCQihMAlzqCiXhA1eLUr3
 pVNudNzN1EZNyRSSxMsg40OZqoTIldaflgRNHHAdKLzxYIzFztIuJ/FiRZ2JsDUxWB
 f2hR0Btdg4IN1KVIXQC9cJr+Ov49cb1UuKAGiPT8Jh/Ll9piQ7CCA9sUQk9Jrdxy44
 uyV5qsdia1Wn12rEoqlpxh6fWzayngAudNxXNJPIwVUyWDUVseawTpPzcEGJvAYjFA
 onSkRVecUe7JGMQhDGrCdAADM8GJkZutjk7HnB+foA+edevZ2E9Dc7MHdf3FbBKAbc
 swsrg0W5eF2fw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/mm: Mark get_slice_psize() & slice_addr_is_low() as
 notrace
Date: Sat, 21 Dec 2019 23:13:37 +1100
Message-Id: <20191221121337.4894-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These slice routines are called from the SLB miss handler, which can
lead to warnings from the IRQ code, because we have not reconciled the
IRQ state properly:

  WARNING: CPU: 72 PID: 30150 at arch/powerpc/kernel/irq.c:258 arch_local_irq_restore.part.0+0xcc/0x100
  Modules linked in:
  CPU: 72 PID: 30150 Comm: ftracetest Not tainted 5.5.0-rc2-gcc9x-g7e0165b2f1a9 #1
  NIP:  c00000000001d83c LR: c00000000029ab90 CTR: c00000000026cf90
  REGS: c0000007eee3b960 TRAP: 0700   Not tainted  (5.5.0-rc2-gcc9x-g7e0165b2f1a9)
  MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22242844  XER: 20000000
  CFAR: c00000000001d780 IRQMASK: 0
  ...
  NIP arch_local_irq_restore.part.0+0xcc/0x100
  LR  trace_graph_entry+0x270/0x340
  Call Trace:
    trace_graph_entry+0x254/0x340 (unreliable)
    function_graph_enter+0xe4/0x1a0
    prepare_ftrace_return+0xa0/0x130
    ftrace_graph_caller+0x44/0x94	# (get_slice_psize())
    slb_allocate_user+0x7c/0x100
    do_slb_fault+0xf8/0x300
    instruction_access_slb_common+0x140/0x180

Fixes: 48e7b7695745 ("powerpc/64s/hash: Convert SLB miss handlers to C")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/slice.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index 42bbcd47cc85..dffe1a45b6ed 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -50,7 +50,7 @@ static void slice_print_mask(const char *label, const struct slice_mask *mask) {
 
 #endif
 
-static inline bool slice_addr_is_low(unsigned long addr)
+static inline notrace bool slice_addr_is_low(unsigned long addr)
 {
 	u64 tmp = (u64)addr;
 
@@ -659,7 +659,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 				       mm_ctx_user_psize(&current->mm->context), 1);
 }
 
-unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr)
+unsigned int notrace get_slice_psize(struct mm_struct *mm, unsigned long addr)
 {
 	unsigned char *psizes;
 	int index, mask_index;
-- 
2.21.0

