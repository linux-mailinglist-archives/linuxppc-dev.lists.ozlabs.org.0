Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7A72A6334
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 12:24:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR46l69Z2zDqY2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 22:24:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR40r0HRyzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 22:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ab0bRIa3; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CR40n4GG0z9sTL; Wed,  4 Nov 2020 22:19:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CR40m5x7mz9sVN; Wed,  4 Nov 2020 22:19:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604488744;
 bh=JYGhLHOyu1E9uoLqre7FRsjAlw9JEeRYRpUoRtp87Y0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ab0bRIa33TMsV5fMxuYNAbPNz9o6I9YojN70LTbNZrSTIlh8JqxdhaXRdFsT2Olv+
 2ijgmbRweyrdjowwldunKfp6rnPjByH2HTQSm8wGp4ShfMPcsOiuzTnxM40/47fveK
 8LU6AA+ZC2mLJcUXZoTfVE42wCfZw0M18O0SHYSnrF8Q1Hoa2xDPsskTIrYu9ldZVJ
 o+nHaAmedIxUraN54d9Tc+0AldIxz1JHEJzCsHJV0QHowIEbGN1aZFCAnzJsw6qfvi
 0VG5MViu4CPvSpsSBr2NgBQ6wE0Sx3ch/Tjzx0f9n/b/Ae2ZJFF8yCdyZxndMLrwQn
 0XyFYACGfecZg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Use asm_goto_volatile for put_user()
Date: Wed,  4 Nov 2020 22:17:42 +1100
Message-Id: <20201104111742.672142-1-mpe@ellerman.id.au>
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
Cc: schwab@linux-m68k.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas reported that commit ee0a49a6870e ("powerpc/uaccess: Switch
__put_user_size_allowed() to __put_user_asm_goto()") broke
CLONE_CHILD_SETTID.

Further inspection showed that the put_user() in schedule_tail() was
missing entirely, the store not emitted by the compiler.

  <.schedule_tail>:
    mflr    r0
    std     r0,16(r1)
    stdu    r1,-112(r1)
    bl      <.finish_task_switch>
    ld      r9,2496(r3)
    cmpdi   cr7,r9,0
    bne     cr7,<.schedule_tail+0x60>
    ld      r3,392(r13)
    ld      r9,1392(r3)
    cmpdi   cr7,r9,0
    beq     cr7,<.schedule_tail+0x3c>
    li      r4,0
    li      r5,0
    bl      <.__task_pid_nr_ns>
    nop
    bl      <.calculate_sigpending>
    nop
    addi    r1,r1,112
    ld      r0,16(r1)
    mtlr    r0
    blr
    nop
    nop
    nop
    bl      <.__balance_callback>
    b       <.schedule_tail+0x1c>

Notice there are no stores other than to the stack. There should be a
stw in there for the store to current->set_child_tid.

This is only seen with GCC 4.9 era compilers (tested with 4.9.3 and
4.9.4), and only when CONFIG_PPC_KUAP is disabled.

When CONFIG_PPC_KUAP=y, the inline asm that's part of the isync()
and mtspr() inlined via allow_user_access() seems to be enough to
avoid the bug.

We already have a macro to work around this (or a similar bug), called
asm_volatile_goto which includes an empty asm block to tickle the
compiler into generating the right code. So use that.

With this applied the code generation looks more like it will work:

  <.schedule_tail>:
    mflr    r0
    std     r31,-8(r1)
    std     r0,16(r1)
    stdu    r1,-144(r1)
    std     r3,112(r1)
    bl      <._mcount>
    nop
    ld      r3,112(r1)
    bl      <.finish_task_switch>
    ld      r9,2624(r3)
    cmpdi   cr7,r9,0
    bne     cr7,<.schedule_tail+0xa0>
    ld      r3,2408(r13)
    ld      r31,1856(r3)
    cmpdi   cr7,r31,0
    beq     cr7,<.schedule_tail+0x80>
    li      r4,0
    li      r5,0
    bl      <.__task_pid_nr_ns>
    nop
    li      r9,-1
    clrldi  r9,r9,12
    cmpld   cr7,r31,r9
    bgt     cr7,<.schedule_tail+0x80>
    lis     r9,16
    rldicr  r9,r9,32,31
    subf    r9,r31,r9
    cmpldi  cr7,r9,3
    ble     cr7,<.schedule_tail+0x80>
    li      r9,0
    stw     r3,0(r31)				<-- stw
    nop
    bl      <.calculate_sigpending>
    nop
    addi    r1,r1,144
    ld      r0,16(r1)
    ld      r31,-8(r1)
    mtlr    r0
    blr
    nop
    bl      <.__balance_callback>
    b       <.schedule_tail+0x30>

Fixes: ee0a49a6870e ("powerpc/uaccess: Switch __put_user_size_allowed() to __put_user_asm_goto()")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ef5bbb705c08..501c9a79038c 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -178,7 +178,7 @@ do {								\
  * are no aliasing issues.
  */
 #define __put_user_asm_goto(x, addr, label, op)			\
-	asm volatile goto(					\
+	asm_volatile_goto(					\
 		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
 		EX_TABLE(1b, %l2)				\
 		:						\
@@ -191,7 +191,7 @@ do {								\
 	__put_user_asm_goto(x, ptr, label, "std")
 #else /* __powerpc64__ */
 #define __put_user_asm2_goto(x, addr, label)			\
-	asm volatile goto(					\
+	asm_volatile_goto(					\
 		"1:	stw%X1 %0, %1\n"			\
 		"2:	stw%X1 %L0, %L1\n"			\
 		EX_TABLE(1b, %l2)				\
-- 
2.25.1

