Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6143FD8AC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 13:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H01w45nXBz2yZp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 21:26:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i1EJYFEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i1EJYFEn; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H01vN2jv5z2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 21:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630495531;
 bh=8hGAA/QOr6F5kU5gS2k45AniEpmHZXueI2jDE5wUmQE=;
 h=From:To:Cc:Subject:Date:From;
 b=i1EJYFEnOURK75nzv6RaesyermwD1GanN9E/fZSuK+q8Ld3fu5XZi1IVMaid3umEs
 MIIhPnIJr/f/LE2EkxTk5/KLQAGW0KY7fjpjEMQMeX9u1KhRMQ9TTDjLBVEGPmEiuY
 YLPq0kN64G6UPxntldYAKxgetC0rEQ/c4FJDA0eKjVEq3+9YjOUP8gGFmSvomS8lva
 BPtHVaukBHFzBweBsBFoH3axLmiosoonDNnsiCVAeUuekf8qjyJHxLWBgLBjqKrlKQ
 VkZFBnJSztshib5+v0OOAWG8tO5tl229SLFtZP6Lt6Ah8icnkb1e3GsLhNAOedzoNk
 qIcyYEbusEGYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H01vH1gdvz9sRN;
 Wed,  1 Sep 2021 21:25:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/bug: Cast to unsigned long before passing to
 inline asm
Date: Wed,  1 Sep 2021 21:25:22 +1000
Message-Id: <20210901112522.1085134-1-mpe@ellerman.id.au>
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
Cc: nathan@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to
WARN_ON/__WARN_FLAGS() with asm goto") we changed WARN_ON(). Previously
it would take the warning condition, x, and double negate it before
converting the result to int, and passing that int to the underlying
inline asm. ie:

  #define WARN_ON(x) ({
  	int __ret_warn_on = !!(x);
  	if (__builtin_constant_p(__ret_warn_on)) {
  	...
  	} else {
  		BUG_ENTRY(PPC_TLNEI " %4, 0",
  			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
  			  "r" (__ret_warn_on));

The asm then does a full register width comparison with zero and traps
if it is non-zero (PPC_TLNEI).

The new code instead passes the full expression, x, with some arbitrary
type, to the inline asm:

  #define WARN_ON(x) ({
	...
	do {
		if (__builtin_constant_p((x))) {
		...
		} else {
			...
			WARN_ENTRY(PPC_TLNEI " %4, 0",
				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
				   __label_warn_on, "r" (x));

As reported[1] by Nathan, when building with clang this can cause
spurious warnings to fire repeatedly at boot:

  WARNING: CPU: 0 PID: 1 at lib/klist.c:62 .klist_add_tail+0x3c/0x110
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-next-20210825 #1
  NIP:  c0000000007ff81c LR: c00000000090a038 CTR: 0000000000000000
  REGS: c0000000073c32a0 TRAP: 0700   Tainted: G        W          (5.14.0-rc7-next-20210825)
  MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 22000a40  XER: 00000000
  CFAR: c00000000090a034 IRQMASK: 0
  GPR00: c00000000090a038 c0000000073c3540 c000000001be3200 0000000000000001
  GPR04: c0000000072d65c0 0000000000000000 c0000000091ba798 c0000000091bb0a0
  GPR08: 0000000000000001 0000000000000000 c000000008581918 fffffffffffffc00
  GPR12: 0000000044000240 c000000001dd0000 c000000000012300 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24: 0000000000000000 c0000000017e3200 0000000000000000 c000000001a0e778
  GPR28: c0000000072d65b0 c0000000072d65a8 c000000007de72c8 c0000000073c35d0
  NIP .klist_add_tail+0x3c/0x110
  LR  .bus_add_driver+0x148/0x290
  Call Trace:
    0xc0000000073c35d0 (unreliable)
    .bus_add_driver+0x148/0x290
    .driver_register+0xb8/0x190
    .__hid_register_driver+0x70/0xd0
    .redragon_driver_init+0x34/0x58
    .do_one_initcall+0x130/0x3b0
    .do_initcall_level+0xd8/0x188
    .do_initcalls+0x7c/0xdc
    .kernel_init_freeable+0x178/0x21c
    .kernel_init+0x34/0x220
    .ret_from_kernel_thread+0x58/0x60
  Instruction dump:
  fba10078 7c7d1b78 38600001 fb810070 3b9d0008 fbc10080 7c9e2378 389d0018
  fb9d0008 fb9d0010 90640000 fbdd0000 <0b1e0000> e87e0018 28230000 41820024

The instruction dump shows that we are trapping because r30 is not zero:
  tdnei   r30,0

Where r30 = c000000007de72c8

The WARN_ON() comes from:

  static void knode_set_klist(struct klist_node *knode, struct klist *klist)
  {
  	knode->n_klist = klist;
  	/* no knode deserves to start its life dead */
  	WARN_ON(knode_dead(knode));
  		      ^^^^^^^^^^^^^^^^^

Where:

  #define KNODE_DEAD		1LU

  static bool knode_dead(struct klist_node *knode)
  {
  	return (unsigned long)knode->n_klist & KNODE_DEAD;
  }

The full disassembly shows that clang has not generated any code to
apply the "& KNODE_DEAD" to the n_klist pointer, which is surprising.

Nathan filed an LLVM bug [2], in which Eli Friedman explained that clang
believes it is only passing a single bit to the asm (ie. a bool) and so
the mask of bit 0 with 1 can be omitted, and suggested that if we want
the full 64-bit value passed to the inline asm we should cast to a
64-bit type (or 32-bit on 32-bits).

In fact we already do that for BUG_ENTRY(), which was added to fix a
possibly similar bug in 2005 in commit 32818c2eb6b8 ("[PATCH] ppc64: Fix
issue with gcc 4.0 compiled kernels").

So cast the value we pass to the inline asm to long.

For GCC this appears to have no effect on code generation, other than
causing sign extension in some cases.

[1]: http://lore.kernel.org/r/YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain
[2]: https://bugs.llvm.org/show_bug.cgi?id=51634

Fixes: 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/bug.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

v2: Reword the change log a bit to hopefully make it clearer that it's clang that believes
it only needs to pass a single bit for bool, whether that's correct behaviour can be
discussed on the list at a later date :)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1ee0f22313ee..02c08d1492f8 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -119,7 +119,8 @@ __label_warn_on:						\
 								\
 			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-				   __label_warn_on, "r" (x));	\
+				   __label_warn_on,		\
+				   "r" ((__force long)(x)));	\
 			break;					\
 __label_warn_on:						\
 			__ret_warn_on = true;			\
-- 
2.25.1

