Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20525157A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 11:36:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbP4w1CJmzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 19:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbP2w6wXdzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 19:34:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LTOa9BJ9; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BbP2w2TFpz9sSP; Tue, 25 Aug 2020 19:34:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BbP2w1KZSz9sTd; Tue, 25 Aug 2020 19:34:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1598348072;
 bh=GKk6/xj1RQwa99bGbVhYtp6VWY69Y7v+jxwX6B2E49s=;
 h=From:To:Cc:Subject:Date:From;
 b=LTOa9BJ90Li51nqRu4Js7O0jImdwbdfhpvjPZYUoKHRKIIr82HPo/psr+jgy7ftRo
 xUj2pBqEOvhh55HZW3m5UkwxrEgA5NiYjK54hht7dc1TrLzMTWDEfw0o7Vf1gnnXih
 26RqTctZnk8+Ggl9IzvH1coCqpN9QYfxhf2ECTVTjGjx4DIYOOUKBJyee3jfKYWMNT
 BfpLKjFtyMP53AWLcM2qeBYlYPhrQdLeer9MMjItUeU7xTuU5d7+g6od7UOMlDpn4B
 0ujXi5nE+TXtQhLWvn50RiwBhuzjim0zfcJeovqSDRLfziKFsraqM6Lvfwu2uv23VD
 tpYbBN2H9LcEw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/64s: Fix crash in load_fp_state() due to fpexc_mode
Date: Tue, 25 Aug 2020 19:34:24 +1000
Message-Id: <20200825093424.3967813-1-mpe@ellerman.id.au>
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
Cc: miltonm@us.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent commit 01eb01877f33 ("powerpc/64s: Fix restore_math
unnecessarily changing MSR") changed some of the handling of floating
point/vector restore.

In particular it caused current->thread.fpexc_mode to be copied into
the current MSR (via msr_check_and_set()), rather than just into
regs->msr (which is moved into MSR on return to userspace).

This can lead to a crash in the kernel if we take a floating point
exception when restoring FPSCR:

  Oops: Exception in kernel mode, sig: 8 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
  Modules linked in:
  CPU: 3 PID: 101213 Comm: ld64.so.2 Not tainted 5.9.0-rc1-00098-g18445bf405cb-dirty #9
  NIP:  c00000000000fbb4 LR: c00000000001a7ac CTR: c000000000183570
  REGS: c0000016b7cfb3b0 TRAP: 0700   Not tainted  (5.9.0-rc1-00098-g18445bf405cb-dirty)
  MSR:  900000000290b933 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 44002444  XER: 00000000
  CFAR: c00000000001a7a8 IRQMASK: 1
  GPR00: c00000000001ae40 c0000016b7cfb640 c0000000011b7f00 c000001542a0f740
  GPR04: c000001542a0f720 c000001542a0eb00 0000000000000900 c000001542a0eb00
  GPR08: 000000000000000a 0000000000002000 9000000000009033 0000000000000000
  GPR12: 0000000000004000 c0000017ffffd900 0000000000000001 c000000000df5a58
  GPR16: c000000000e19c18 c0000000010e1123 0000000000000001 c000000000e1a638
  GPR20: 0000000000000000 c0000000044b1d00 0000000000000000 c000001542a0f2a0
  GPR24: 00000016c7fe0000 c000001542a0f720 c000000001c93da0 c000000000fe5f28
  GPR28: c000001542a0f720 0000000000800000 c0000016b7cfbe90 0000000002802900
  NIP load_fp_state+0x4/0x214
  LR  restore_math+0x17c/0x1f0
  Call Trace:
    0xc0000016b7cfb680 (unreliable)
    __switch_to+0x330/0x460
    __schedule+0x318/0x920
    schedule+0x74/0x140
    schedule_timeout+0x318/0x3f0
    wait_for_completion+0xc8/0x210
    call_usermodehelper_exec+0x234/0x280
    do_coredump+0xedc/0x13c0
    get_signal+0x1d4/0xbe0
    do_notify_resume+0x1a0/0x490
    interrupt_exit_user_prepare+0x1c4/0x230
    interrupt_return+0x14/0x1c0
  Instruction dump:
  ebe10168 e88101a0 7c8ff120 382101e0 e8010010 7c0803a6 4e800020 790605c4
  782905c4 7c0008a8 7c0008a8 c8030200 <fffe058e> 48000088 c8030000 c8230010

Fix it by only loading the fpexc_mode value into regs->msr.

Also add a comment to explain that although VSX is subject to the
value of fpexc_mode, we don't have to handle that separately because
we only allow VSX to be enabled if FP is also enabled.

Fixes: 01eb01877f33 ("powerpc/64s: Fix restore_math unnecessarily changing MSR")
Reported-by: Milton Miller <miltonm@us.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 016bd831908e..73a57043ee66 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -548,7 +548,7 @@ void notrace restore_math(struct pt_regs *regs)
 	 * are live for the user thread).
 	 */
 	if ((!(msr & MSR_FP)) && should_restore_fp())
-		new_msr |= MSR_FP | current->thread.fpexc_mode;
+		new_msr |= MSR_FP;
 
 	if ((!(msr & MSR_VEC)) && should_restore_altivec())
 		new_msr |= MSR_VEC;
@@ -559,11 +559,17 @@ void notrace restore_math(struct pt_regs *regs)
 	}
 
 	if (new_msr) {
+		unsigned long fpexc_mode = 0;
+
 		msr_check_and_set(new_msr);
 
-		if (new_msr & MSR_FP)
+		if (new_msr & MSR_FP) {
 			do_restore_fp();
 
+			// This also covers VSX, because VSX implies FP
+			fpexc_mode = current->thread.fpexc_mode;
+		}
+
 		if (new_msr & MSR_VEC)
 			do_restore_altivec();
 
@@ -572,7 +578,7 @@ void notrace restore_math(struct pt_regs *regs)
 
 		msr_check_and_clear(new_msr);
 
-		regs->msr |= new_msr;
+		regs->msr |= new_msr | fpexc_mode;
 	}
 }
 #endif
-- 
2.25.1

