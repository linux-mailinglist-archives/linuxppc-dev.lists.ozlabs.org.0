Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDA022C257
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 11:33:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCkXT3QNnzF0YC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 19:33:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCkML6FykzDrRS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 19:25:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XWi27uu7; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCkML2wPxz9sSn; Fri, 24 Jul 2020 19:25:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCkML15nCz9sTH; Fri, 24 Jul 2020 19:25:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595582734;
 bh=+8cqjkqHaV2Fdc+XJiRrtGzQPkh7+z+f1xp0j/Xr3Gc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWi27uu7R1nVGiZeI8S20drXeMQ3IsVk028DUF/7CI1vOI3XvVuL3z567R+IFbGF6
 I+ouzWrWBIv5F5vf1409baseyFg0AWvwivHdRmYGSQiCLfF0dUA6SyLinQauLNjQQs
 mYopcr4Zeg5wjW6CZTv0aQTybVJ/LG0QqCefOFJ81f9/Huw9RjDFhRvqTu06eBX6up
 1IkVzfIz5VtYVU0vl01QiZ1LFvtT6gp8HrkcUH++0wpMv+m4yBasw/46EWP7RwUZdz
 bpb5EDJAa8TnkMlMQbqdHQ0PWRncfie6SjI+5PO2ShRwTOPG9PDh5g4fYSLRufbt1P
 MUUFlNoHSWQdg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 4/5] powerpc/mm: Remove custom stack expansion checking
Date: Fri, 24 Jul 2020 19:25:27 +1000
Message-Id: <20200724092528.1578671-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724092528.1578671-1-mpe@ellerman.id.au>
References: <20200724092528.1578671-1-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have powerpc specific logic in our page fault handling to decide if
an access to an unmapped address below the stack pointer should expand
the stack VMA.

The logic aims to prevent userspace from doing bad accesses below the
stack pointer. However as long as the stack is < 1MB in size, we allow
all accesses without further checks. Adding some debug I see that I
can do a full kernel build and LTP run, and not a single process has
used more than 1MB of stack. So for the majority of processes the
logic never even fires.

We also recently found a nasty bug in this code which could cause
userspace programs to be killed during signal delivery. It went
unnoticed presumably because most processes use < 1MB of stack.

The generic mm code has also grown support for stack guard pages since
this code was originally written, so the most heinous case of the
stack expanding into other mappings is now handled for us.

Finally although some other arches have special logic in this path,
from what I can tell none of x86, arm64, arm and s390 impose any extra
checks other than those in expand_stack().

So drop our complicated logic and like other architectures just let
the stack expand as long as its within the rlimit.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/fault.c | 109 ++--------------------------------------
 1 file changed, 5 insertions(+), 104 deletions(-)

v2: no change just rebased.

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 3ebb1792e636..925a7231abb3 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -42,39 +42,7 @@
 #include <asm/kup.h>
 #include <asm/inst.h>
 
-/*
- * Check whether the instruction inst is a store using
- * an update addressing form which will update r1.
- */
-static bool store_updates_sp(struct ppc_inst inst)
-{
-	/* check for 1 in the rA field */
-	if (((ppc_inst_val(inst) >> 16) & 0x1f) != 1)
-		return false;
-	/* check major opcode */
-	switch (ppc_inst_primary_opcode(inst)) {
-	case OP_STWU:
-	case OP_STBU:
-	case OP_STHU:
-	case OP_STFSU:
-	case OP_STFDU:
-		return true;
-	case OP_STD:	/* std or stdu */
-		return (ppc_inst_val(inst) & 3) == 1;
-	case OP_31:
-		/* check minor opcode */
-		switch ((ppc_inst_val(inst) >> 1) & 0x3ff) {
-		case OP_31_XOP_STDUX:
-		case OP_31_XOP_STWUX:
-		case OP_31_XOP_STBUX:
-		case OP_31_XOP_STHUX:
-		case OP_31_XOP_STFSUX:
-		case OP_31_XOP_STFDUX:
-			return true;
-		}
-	}
-	return false;
-}
+
 /*
  * do_page_fault error handling helpers
  */
@@ -267,57 +235,6 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
 	return false;
 }
 
-// This comes from 64-bit struct rt_sigframe + __SIGNAL_FRAMESIZE
-#define SIGFRAME_MAX_SIZE	(4096 + 128)
-
-static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
-				struct vm_area_struct *vma, unsigned int flags,
-				bool *must_retry)
-{
-	/*
-	 * N.B. The POWER/Open ABI allows programs to access up to
-	 * 288 bytes below the stack pointer.
-	 * The kernel signal delivery code writes a bit over 4KB
-	 * below the stack pointer (r1) before decrementing it.
-	 * The exec code can write slightly over 640kB to the stack
-	 * before setting the user r1.  Thus we allow the stack to
-	 * expand to 1MB without further checks.
-	 */
-	if (address + 0x100000 < vma->vm_end) {
-		struct ppc_inst __user *nip = (struct ppc_inst __user *)regs->nip;
-		/* get user regs even if this fault is in kernel mode */
-		struct pt_regs *uregs = current->thread.regs;
-		if (uregs == NULL)
-			return true;
-
-		/*
-		 * A user-mode access to an address a long way below
-		 * the stack pointer is only valid if the instruction
-		 * is one which would update the stack pointer to the
-		 * address accessed if the instruction completed,
-		 * i.e. either stwu rs,n(r1) or stwux rs,r1,rb
-		 * (or the byte, halfword, float or double forms).
-		 *
-		 * If we don't check this then any write to the area
-		 * between the last mapped region and the stack will
-		 * expand the stack rather than segfaulting.
-		 */
-		if (address + SIGFRAME_MAX_SIZE >= uregs->gpr[1])
-			return false;
-
-		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
-		    access_ok(nip, sizeof(*nip))) {
-			struct ppc_inst inst;
-
-			if (!probe_user_read_inst(&inst, nip))
-				return !store_updates_sp(inst);
-			*must_retry = true;
-		}
-		return true;
-	}
-	return false;
-}
-
 #ifdef CONFIG_PPC_MEM_KEYS
 static bool access_pkey_error(bool is_write, bool is_exec, bool is_pkey,
 			      struct vm_area_struct *vma)
@@ -483,7 +400,6 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	int is_user = user_mode(regs);
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
-	bool must_retry = false;
 	bool kprobe_fault = kprobe_page_fault(regs, 11);
 
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
@@ -572,30 +488,15 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	vma = find_vma(mm, address);
 	if (unlikely(!vma))
 		return bad_area(regs, address);
-	if (likely(vma->vm_start <= address))
-		goto good_area;
-	if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
-		return bad_area(regs, address);
 
-	/* The stack is being expanded, check if it's valid */
-	if (unlikely(bad_stack_expansion(regs, address, vma, flags,
-					 &must_retry))) {
-		if (!must_retry)
+	if (unlikely(vma->vm_start > address)) {
+		if (unlikely(!(vma->vm_flags & VM_GROWSDOWN)))
 			return bad_area(regs, address);
 
-		mmap_read_unlock(mm);
-		if (fault_in_pages_readable((const char __user *)regs->nip,
-					    sizeof(unsigned int)))
-			return bad_area_nosemaphore(regs, address);
-		goto retry;
+		if (unlikely(expand_stack(vma, address)))
+			return bad_area(regs, address);
 	}
 
-	/* Try to expand it */
-	if (unlikely(expand_stack(vma, address)))
-		return bad_area(regs, address);
-
-good_area:
-
 #ifdef CONFIG_PPC_MEM_KEYS
 	if (unlikely(access_pkey_error(is_write, is_exec,
 				       (error_code & DSISR_KEYFAULT), vma)))
-- 
2.25.1

