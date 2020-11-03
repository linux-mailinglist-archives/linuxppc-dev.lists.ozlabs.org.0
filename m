Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3B2A4704
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:54:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQWW14fhFzDqjJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:54:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQVxb6zFDzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XeKpGeFt; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CQVxZ1vqdz9sVZ; Wed,  4 Nov 2020 00:29:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CQVxY6JLCz9sVW; Wed,  4 Nov 2020 00:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604410161;
 bh=bSaHqAWLPvKvWz8UBYj9Yhq+nHvHiyQvhy2Bqzr9AL4=;
 h=From:To:Cc:Subject:Date:From;
 b=XeKpGeFtDeDGZto0GKAW6gLBUYtV66VLhC6X22qJoEYNJN8zYFfnPRklCEfDqcEF5
 UGpPS71gScnsrr9hPS9fkVgmr6EAGjNgXjJ0k7+dKHnAXh493xMZLf7xdQl9r5sl2u
 J0LM22amOfwkk9fQmxd4ogPkSkSS2Wu8JT7PW6HyT3s44mAffEtrxaaJLysQ5If4De
 L/mZKYR8azxP8i4bmQvlM3ALTwPCh+1IUx6fwl1X+bi3c+kKFGAZzOldVUwhvEIJ3+
 2zwpbZN3Fk5EgUjjHoemyPSHJVtc1eEHAp6RdarJ7AyzEtoWZBo+hjoYlrzKRaMFFS
 Gp2RXIatgh5YA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
Date: Wed,  4 Nov 2020 00:29:15 +1100
Message-Id: <20201103132915.529337-1-mpe@ellerman.id.au>
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

When CONFIG_PPC_KUAP=y, the memory clobber that's part of the isync()
and mtspr() inlined via allow_user_access() seems to be enough to
avoid the bug.

For now though let's just not use asm goto with GCC 4.9, to avoid this
bug and any other issues we haven't noticed yet. Possibly in future we
can find a smaller workaround.

This is basically a revert of commit ee0a49a6870e ("powerpc/uaccess:
Switch __put_user_size_allowed() to __put_user_asm_goto()") and commit
7fdf966bed15 ("powerpc/uaccess: Remove __put_user_asm() and
__put_user_asm2()"), but only for GCC 4.9.

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
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/uaccess.h | 48 ++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index ef5bbb705c08..526a6658946b 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -110,6 +110,52 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 
 extern long __put_user_bad(void);
 
+#if defined(GCC_VERSION) && GCC_VERSION < 50000
+#define __put_user_asm(x, addr, err, op)			\
+	__asm__ __volatile__(					\
+		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
+		"2:\n"						\
+		".section .fixup,\"ax\"\n"			\
+		"3:	li %0,%3\n"				\
+		"	b 2b\n"					\
+		".previous\n"					\
+		EX_TABLE(1b, 3b)				\
+		: "=r" (err)					\
+		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))
+
+#ifdef __powerpc64__
+#define __put_user_asm2(x, ptr, retval)				\
+	  __put_user_asm(x, ptr, retval, "std")
+#else /* __powerpc64__ */
+#define __put_user_asm2(x, addr, err)				\
+	__asm__ __volatile__(					\
+		"1:	stw%X2 %1,%2\n"			\
+		"2:	stw%X2 %L1,%L2\n"			\
+		"3:\n"						\
+		".section .fixup,\"ax\"\n"			\
+		"4:	li %0,%3\n"				\
+		"	b 3b\n"					\
+		".previous\n"					\
+		EX_TABLE(1b, 4b)				\
+		EX_TABLE(2b, 4b)				\
+		: "=r" (err)					\
+		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
+#endif /* __powerpc64__ */
+
+#define __put_user_size_allowed(x, ptr, size, retval)		\
+do {								\
+	retval = 0;						\
+	switch (size) {						\
+	  case 1: __put_user_asm(x, ptr, retval, "stb"); break;	\
+	  case 2: __put_user_asm(x, ptr, retval, "sth"); break;	\
+	  case 4: __put_user_asm(x, ptr, retval, "stw"); break;	\
+	  case 8: __put_user_asm2(x, ptr, retval); break;	\
+	  default: __put_user_bad();				\
+	}							\
+} while (0)
+
+#else
+
 #define __put_user_size_allowed(x, ptr, size, retval)		\
 do {								\
 	__label__ __pu_failed;					\
@@ -122,6 +168,8 @@ __pu_failed:							\
 	retval = -EFAULT;					\
 } while (0)
 
+#endif /* GCC_VERSION */
+
 #define __put_user_size(x, ptr, size, retval)			\
 do {								\
 	allow_write_to_user(ptr, size);				\
-- 
2.25.1

