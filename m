Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23447CC2C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 14:16:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hAbHYLrr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8tJ353X4z3cVF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 23:16:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hAbHYLrr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8tHD1mh2z3c18
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 23:15:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697544952;
	bh=E0e33x3Wa3A5OcskFtOZ7En8wEw6usUEZBhkkqpsrOY=;
	h=From:To:Cc:Subject:Date:From;
	b=hAbHYLrrcbo+xbspDGvvjFBQ8D2Y/snbVzvQd1q70XGpSvf3FxM7acD5QBe8LP3D7
	 pKbkwEGQuiRBOZUdu/znHpyJDf2JRxjcgQMJEJ7Gw044XsQ/K3eeIVnOnheTmvDvwj
	 bGP7hbKyuVpwMOCYQTfwO7e3hA1+rv8kGl4P+gaUzbXjE28bSmxfzxGT9ecFUUTEQ1
	 ZpBMeXWSEFSbodrIh2W0YAgfxj/RRtkATbZ1pmYgb0eFkwCuluPsDVvwoWp4genZUE
	 uA86xEEJodGef36Vz0BumeBLNn9VdkSETQcRxVJI+/Sb0pTDUwY2SDTlKhj1Vdz8Ef
	 lRZal7M2JvpcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S8tHC6nx8z4x1x;
	Tue, 17 Oct 2023 23:15:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s/radix: Don't warn on copros in radix__tlb_flush()
Date: Tue, 17 Oct 2023 23:15:27 +1100
Message-ID: <20231017121527.1574104-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin reported a warning when running the inject-ra-err selftest:

  # selftests: powerpc/mce: inject-ra-err
  Disabling lock debugging due to kernel taint
  MCE: CPU19: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
  MCE: CPU19: PID: 5254 Comm: inject-ra-err NIP: [0000000010000e48]
  MCE: CPU19: Initiator CPU
  MCE: CPU19: Unknown
  ------------[ cut here ]------------
  WARNING: CPU: 19 PID: 5254 at arch/powerpc/mm/book3s64/radix_tlb.c:1221 radix__tlb_flush+0x160/0x180
  CPU: 19 PID: 5254 Comm: inject-ra-err Kdump: loaded Tainted: G   M        E      6.6.0-rc3-00055-g9ed22ae6be81 #4
  Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
  ...
  NIP radix__tlb_flush+0x160/0x180
  LR  radix__tlb_flush+0x104/0x180
  Call Trace:
    radix__tlb_flush+0xf4/0x180 (unreliable)
    tlb_finish_mmu+0x15c/0x1e0
    exit_mmap+0x1a0/0x510
    __mmput+0x60/0x1e0
    exit_mm+0xdc/0x170
    do_exit+0x2bc/0x5a0
    do_group_exit+0x4c/0xc0
    sys_exit_group+0x28/0x30
    system_call_exception+0x138/0x330
    system_call_vectored_common+0x15c/0x2ec

And bisected it to commit e43c0a0c3c28 ("powerpc/64s/radix: combine
final TLB flush and lazy tlb mm shootdown IPIs"), which added a warning
in radix__tlb_flush() if mm->context.copros is still elevated.

However it's possible for the copros count to be elevated if a process
exits without first closing file descriptors that are associated with a
copro, eg. VAS.

If the process exits with a VAS file still open, the release callback
is queued up for exit_task_work() via:
  exit_files()
    put_files_struct()
      close_files()
        filp_close()
          fput()

And called via:
  exit_task_work()
    ____fput()
      __fput()
        file->f_op->release(inode, file)
          coproc_release()
            vas_user_win_ops->close_win()
              vas_deallocate_window()
                mm_context_remove_vas_window()
                  mm_context_remove_copro()

But that is after exit_mm() has been called from do_exit() and triggered
the warning.

Fix it by dropping the warning, and always calling __flush_all_mm().

In the normal case of no copros, that will result in a call to
_tlbiel_pid(mm->context.id, RIC_FLUSH_ALL) just as the current code
does.

If the copros count is elevated then it will cause a global flush, which
should flush translations from any copros. Note that the process table
entry was cleared in arch_exit_mmap(), so copros should not be able to
fetch any new translations.

Fixes: e43c0a0c3c28 ("powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown IPIs")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Closes: https://lore.kernel.org/all/A8E52547-4BF1-47CE-8AEA-BC5A9D7E3567@linux.ibm.com/
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 39acc2cbab4c..9e1f6558d026 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1212,14 +1212,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 
 			smp_mb(); /* see radix__flush_tlb_mm */
 			exit_flush_lazy_tlbs(mm);
-			_tlbiel_pid(mm->context.id, RIC_FLUSH_ALL);
-
-			/*
-			 * It should not be possible to have coprocessors still
-			 * attached here.
-			 */
-			if (WARN_ON_ONCE(atomic_read(&mm->context.copros) > 0))
-				__flush_all_mm(mm, true);
+			__flush_all_mm(mm, true);
 
 			preempt_enable();
 		} else {
-- 
2.41.0

