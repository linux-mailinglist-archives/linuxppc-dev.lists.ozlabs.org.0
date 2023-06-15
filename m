Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA1731A8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 15:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cX2RDj22;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhkMW2TMxz30h9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 23:55:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cX2RDj22;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 103695 seconds by postgrey-1.37 at boromir; Thu, 15 Jun 2023 23:54:47 AEST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhkLb1Db3z30dm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 23:54:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DAB360DC1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3B1C433C0;
	Thu, 15 Jun 2023 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837283;
	bh=+/moxkQoRy+4tGDo/+K1avcb9w0TBdzhL8yMtmZpejo=;
	h=From:To:Subject:Date:From;
	b=cX2RDj22FB/JQARXXfNaXnk1sJ6+IuVQPcmc7KIqMiFZnSKMEJLRdAb9f8OWxXzIK
	 CPC3ERViuHA1y50jfPZiEyoBjbgVXznld1HmDS66g1MbcjkSQIVKa/r+fwX2S5yw+W
	 Lbo4vzWW7dHPv1dAG7XAvO3FnxnQom7RlLB+I3OMmopZ1NojILt2sucRFmAkHzVsde
	 ZhY9xwTBMlmETES1WYl4Ui6sIKErZ7YW6U3Q7f1cOeiAXvFmGY5T5D5qS8zkpXxuxk
	 C0LBlDPhNEzXxhCxd4C8s0Uyn8PKXf6KamcUNuSPa2MxVm3FDm6046735i+rFMVwP6
	 OnAoyQ3gwmM1A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH] powerpc/ftrace: Create a dummy stackframe to fix stack unwind
Date: Thu, 15 Jun 2023 19:21:13 +0530
Message-Id: <20230615135113.2989625-1-naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With ppc64 -mprofile-kernel and ppc32 -pg, profiling instructions to
call into ftrace are emitted right at function entry. The instruction
sequence used is minimal to reduce overhead. Crucially, a stackframe is
not created for the function being traced. This breaks stack unwinding
since the function being traced does not have a stackframe for itself.
As such, it never shows up in the backtrace:

/sys/kernel/debug/tracing # echo 1 > /proc/sys/kernel/stack_tracer_enabled
/sys/kernel/debug/tracing # cat stack_trace
        Depth    Size   Location    (17 entries)
        -----    ----   --------
  0)     4144      32   ftrace_call+0x4/0x44
  1)     4112     432   get_page_from_freelist+0x26c/0x1ad0
  2)     3680     496   __alloc_pages+0x290/0x1280
  3)     3184     336   __folio_alloc+0x34/0x90
  4)     2848     176   vma_alloc_folio+0xd8/0x540
  5)     2672     272   __handle_mm_fault+0x700/0x1cc0
  6)     2400     208   handle_mm_fault+0xf0/0x3f0
  7)     2192      80   ___do_page_fault+0x3e4/0xbe0
  8)     2112     160   do_page_fault+0x30/0xc0
  9)     1952     256   data_access_common_virt+0x210/0x220
 10)     1696     400   0xc00000000f16b100
 11)     1296     384   load_elf_binary+0x804/0x1b80
 12)      912     208   bprm_execve+0x2d8/0x7e0
 13)      704      64   do_execveat_common+0x1d0/0x2f0
 14)      640     160   sys_execve+0x54/0x70
 15)      480      64   system_call_exception+0x138/0x350
 16)      416     416   system_call_common+0x160/0x2c4

Fix this by having ftrace create a dummy stackframe for the function
being traced. Since this is only relevant when ftrace is active, we nop
out the instruction to store LR in the LR save area in the profiling
instruction sequence on ppc32 (and in ppc64 with older gcc versions).
Instead, in ftrace, we store LR in the LR save area of the previous
stackframe, and create a minimal stackframe to represent the function
being traced. With this, backtraces now capture the function being
traced:

/sys/kernel/debug/tracing # cat stack_trace
        Depth    Size   Location    (17 entries)
        -----    ----   --------
  0)     3888      32   _raw_spin_trylock+0x8/0x70
  1)     3856     576   get_page_from_freelist+0x26c/0x1ad0
  2)     3280      64   __alloc_pages+0x290/0x1280
  3)     3216     336   __folio_alloc+0x34/0x90
  4)     2880     176   vma_alloc_folio+0xd8/0x540
  5)     2704     416   __handle_mm_fault+0x700/0x1cc0
  6)     2288      96   handle_mm_fault+0xf0/0x3f0
  7)     2192      48   ___do_page_fault+0x3e4/0xbe0
  8)     2144     192   do_page_fault+0x30/0xc0
  9)     1952     608   data_access_common_virt+0x210/0x220
 10)     1344      16   0xc0000000334bbb50
 11)     1328     416   load_elf_binary+0x804/0x1b80
 12)      912      64   bprm_execve+0x2d8/0x7e0
 13)      848     176   do_execveat_common+0x1d0/0x2f0
 14)      672     192   sys_execve+0x54/0x70
 15)      480      64   system_call_exception+0x138/0x350
 16)      416     416   system_call_common+0x160/0x2c4

This results in two additional stores in the ftrace entry code, but
produces reliable backtraces. Note that this change now aligns with
other architectures (arm64, s390, x86).

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
This applies atop the below RFC patchset:
http://lore.kernel.org/cover.1686151854.git.naveen@kernel.org

- Naveen

 arch/powerpc/kernel/trace/ftrace.c       |  8 +++++---
 arch/powerpc/kernel/trace/ftrace_entry.S | 11 ++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index a03aa4fd7a08ba..3f090f037d8ef5 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -229,13 +229,15 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
 		ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
 		if (!ret)
-			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)));
+			ret = ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4)),
+						 ppc_inst(PPC_RAW_NOP()));
 	} else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
 		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
 		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_MFLR(_R0)));
 		if (ret) {
-			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)));
-			ret |= ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
+			ret = ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
+			ret |= ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16)),
+						  ppc_inst(PPC_RAW_NOP()));
 		}
 	} else {
 		return -EINVAL;
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index bab3ab1368a33f..05e981fb526c2e 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -33,6 +33,11 @@
  * and then arrange for the ftrace function to be called.
  */
 .macro	ftrace_regs_entry allregs
+	/* Create a minimal stack frame for representing B */
+	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
+	/* Save the original return address in A's stack frame */
+	PPC_STL		r0, LRSAVE+STACK_FRAME_MIN_SIZE(r1)
+
 	/* Create our stack frame + pt_regs */
 	PPC_STLU	r1,-SWITCH_FRAME_SIZE(r1)
 
@@ -41,8 +46,6 @@
 	SAVE_GPRS(3, 10, r1)
 
 #ifdef CONFIG_PPC64
-	/* Save the original return address in A's stack frame */
-	std	r0, LRSAVE+SWITCH_FRAME_SIZE(r1)
 	/* Ok to continue? */
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
 	cmpdi	r3, 0
@@ -77,6 +80,8 @@
 	mflr	r7
 	/* Save it as pt_regs->nip */
 	PPC_STL	r7, _NIP(r1)
+	/* Also save it in B's stackframe header for proper unwind */
+	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
 	/* Save the read LR in pt_regs->link */
 	PPC_STL	r0, _LINK(r1)
 
@@ -142,7 +147,7 @@
 #endif
 
 	/* Pop our stack frame */
-	addi r1, r1, SWITCH_FRAME_SIZE
+	addi r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
 
 #ifdef CONFIG_LIVEPATCH_64
         /* Based on the cmpd above, if the NIP was altered handle livepatch */

base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
prerequisite-patch-id: b953231ea1102dee0e99a793e2b0a4cc3524d6e4
prerequisite-patch-id: 029435b7efc8ac3e9a49fd253c3a32c1ae6b625d
prerequisite-patch-id: d54692b0a2bf9d8d4230ad9d529ca5cca9f064fa
prerequisite-patch-id: f35d59616da6d295ebb49146b5e5000d63bc2e2d
prerequisite-patch-id: 7476dc63da245d21085fc1d661fc913012a2829d
prerequisite-patch-id: 2dfadfbafe18b69462284402ed2bbd20ef3627d3
prerequisite-patch-id: 0550450ddc1fa88ec7e00356799c66dbf31aed95
prerequisite-patch-id: 9a4c24553f536cde60636b2d91cd24f6127d9978
prerequisite-patch-id: af2d0864837e4e2fb85604fd6519a894a086fd22
prerequisite-patch-id: 8695c750ac80fac717e390ea8868cfd2a7fac22e
prerequisite-patch-id: 75675def2fb28145ae98ad21636cbe09b6174c57
prerequisite-patch-id: 66991e58b939a95ee69704f329aaa69de92b5f5c
prerequisite-patch-id: a86977fec45531c24925f66691c2a9624596a943
prerequisite-patch-id: f581bcc4ff26bdee41ad2e79acde16424faa8c76
prerequisite-patch-id: 423e0ef649173547fa1d16b5763883e5946469f2
-- 
2.40.1

