Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A05FF3D0F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:36:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYy251zLzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:36:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pZlSbTwy"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZf72dpzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:34 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 81so7543118pfy.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seDVkbLJmbbHDIRdWV1mF9UJ8RqgF/gEffT37a11hDE=;
 b=pZlSbTwyBKGuaqHQBJlXsbBmJF+EgctZ3yxeSQTO26SbyO4FJnqKckqAxqbR6PaqFE
 1R0pXdGnighE5AZrHpYElJBu7aJE542hfwXCzsH/kdHRalgkPCWHTcdvn3VG0ha7kFtI
 ECpP6Niex488Uhq3aDoRnRQY2214Qb0BSDM+CIodl1hXvXqp/lF8633uxHH8m4mJmDHk
 EEFcHXZiHTewfM5XY+REbYPYSA5oT6eLsR5OD4WgBoUf9vOs8rFkEvJvdvGNupwme4Kq
 x+ut0zQLvSvZRwTZm0vEzl6iU80rgMdfFqNOz/D5phy87lRLbYlSGruI+zNMYvfiBMWb
 qW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seDVkbLJmbbHDIRdWV1mF9UJ8RqgF/gEffT37a11hDE=;
 b=qzDGUQ616QgPJ1P+PU4HBOXAGUG6uUc+ychhwSu3w5w9S6orZhwsfVAT8gOr6QzGaK
 wtSyKkGQCLVL8MpvA+jusb5JcktXd6DckAbaaxMsst5p7m1TlbJOA90miOGzySm1EIZM
 R+txIXArdUcpVJ5X+J3Gu/pGpJm005MitMxnFEv3eHeA13FqpPzUo2Kx1KAWyD5mn1Ub
 L3OtO7x8EkFYjqnxPwXfnQP/eNv/WzruEgZMm6ZqFgYiRQxybT4yqDXCSSME/8Zn6iwU
 8Hm94fD9DDoiijYZb+80tRxrfs9ReRV7w+ScXPIUuV+Y5YMvdPMTyT8bKYLWnO/Uz3JK
 s4ng==
X-Gm-Message-State: APjAAAXkx0Kagz3IWaDaSc8ZiyzTBDbQj4A7wOkv2vYXykMDJfeA+snf
 atCgsMSDUA6zjHOyA8RNUJfTOK0h
X-Google-Smtp-Source: APXvYqzTmcEINkhZb1UxszNXzoQUhU0WoDIK4LwnO+dDaDkdhnUkFtHzylX+ORgA0vClWLTYESi4fw==
X-Received: by 2002:a17:90a:db42:: with SMTP id
 u2mr18095585pjx.48.1560263671570; 
 Tue, 11 Jun 2019 07:34:31 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 21/28] powerpc/64s/exception: use a gas macro for system call
 handler code
Date: Wed, 12 Jun 2019 00:30:33 +1000
Message-Id: <20190611143040.7834-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 127 ++++++++++++---------------
 1 file changed, 55 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8a65ae64ed54..1c11a7330856 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1615,6 +1615,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  * without saving, though xer is not a good idea to use, as hardware may
  * interpret some bits so it may be costly to change them.
  */
+.macro SYSTEM_CALL real
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
 	 * There is a little bit of juggling to get syscall and hcall
@@ -1624,95 +1625,77 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
 	 * Userspace syscalls have already saved the PPR, hcalls must save
 	 * it before setting HMT_MEDIUM.
 	 */
-#define SYSCALL_KVMTEST							\
-	mtctr	r13;							\
-	GET_PACA(r13);							\
-	std	r10,PACA_EXGEN+EX_R10(r13);				\
-	INTERRUPT_TO_KERNEL;						\
-	KVMTEST EXC_STD 0xc00 ; /* uses r10, branch to do_kvm_0xc00_system_call */ \
-	HMT_MEDIUM;							\
-	mfctr	r9;
-
+	mtctr	r13
+	GET_PACA(r13)
+	std	r10,PACA_EXGEN+EX_R10(r13)
+	INTERRUPT_TO_KERNEL
+	KVMTEST EXC_STD 0xc00 /* uses r10, branch to do_kvm_0xc00_system_call */
+	HMT_MEDIUM
+	mfctr	r9
 #else
-#define SYSCALL_KVMTEST							\
-	HMT_MEDIUM;							\
-	mr	r9,r13;							\
-	GET_PACA(r13);							\
-	INTERRUPT_TO_KERNEL;
+	HMT_MEDIUM
+	mr	r9,r13
+	GET_PACA(r13)
+	INTERRUPT_TO_KERNEL
 #endif
-	
-#define LOAD_SYSCALL_HANDLER(reg)					\
-	__LOAD_HANDLER(reg, system_call_common)
-
-/*
- * After SYSCALL_KVMTEST, we reach here with PACA in r13, r13 in r9,
- * and HMT_MEDIUM.
- */
-#define SYSCALL_REAL	 					\
-	mfspr	r11,SPRN_SRR0 ;					\
-	mfspr	r12,SPRN_SRR1 ;					\
-	LOAD_SYSCALL_HANDLER(r10) ; 				\
-	mtspr	SPRN_SRR0,r10 ; 				\
-	ld	r10,PACAKMSR(r13) ;				\
-	mtspr	SPRN_SRR1,r10 ; 				\
-	RFI_TO_KERNEL ;						\
-	b	. ;	/* prevent speculative execution */
 
 #ifdef CONFIG_PPC_FAST_ENDIAN_SWITCH
-#define SYSCALL_FASTENDIAN_TEST					\
-BEGIN_FTR_SECTION						\
-	cmpdi	r0,0x1ebe ; 					\
-	beq-	1f ;						\
-END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)				\
-
-#define SYSCALL_FASTENDIAN					\
-	/* Fast LE/BE switch system call */			\
-1:	mfspr	r12,SPRN_SRR1 ;					\
-	xori	r12,r12,MSR_LE ;				\
-	mtspr	SPRN_SRR1,r12 ;					\
-	mr	r13,r9 ;					\
-	RFI_TO_USER ;	/* return to userspace */		\
-	b	. ;	/* prevent speculative execution */
-#else
-#define SYSCALL_FASTENDIAN_TEST
-#define SYSCALL_FASTENDIAN
-#endif /* CONFIG_PPC_FAST_ENDIAN_SWITCH */
+BEGIN_FTR_SECTION
+	cmpdi	r0,0x1ebe
+	beq-	1f
+END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
+#endif
+	/* We reach here with PACA in r13, r13 in r9, and HMT_MEDIUM. */
 
-#if defined(CONFIG_RELOCATABLE)
+	.if \real
+	mfspr	r11,SPRN_SRR0
+	mfspr	r12,SPRN_SRR1
+	__LOAD_HANDLER(r10, system_call_common)
+	mtspr	SPRN_SRR0,r10
+	ld	r10,PACAKMSR(r13)
+	mtspr	SPRN_SRR1,r10
+	RFI_TO_KERNEL
+	b	.	/* prevent speculative execution */
+	.else
+#ifdef CONFIG_RELOCATABLE
 	/*
 	 * We can't branch directly so we do it via the CTR which
 	 * is volatile across system calls.
 	 */
-#define SYSCALL_VIRT						\
-	LOAD_SYSCALL_HANDLER(r10) ;				\
-	mtctr	r10 ;						\
-	mfspr	r11,SPRN_SRR0 ;					\
-	mfspr	r12,SPRN_SRR1 ;					\
-	li	r10,MSR_RI ;					\
-	mtmsrd 	r10,1 ;						\
-	bctr ;
+	__LOAD_HANDLER(r10, system_call_common)
+	mtctr	r10
+	mfspr	r11,SPRN_SRR0
+	mfspr	r12,SPRN_SRR1
+	li	r10,MSR_RI
+	mtmsrd 	r10,1
+	bctr
 #else
 	/* We can branch directly */
-#define SYSCALL_VIRT						\
-	mfspr	r11,SPRN_SRR0 ;					\
-	mfspr	r12,SPRN_SRR1 ;					\
-	li	r10,MSR_RI ;					\
-	mtmsrd 	r10,1 ;			/* Set RI (EE=0) */	\
-	b	system_call_common ;
+	mfspr	r11,SPRN_SRR0
+	mfspr	r12,SPRN_SRR1
+	li	r10,MSR_RI
+	mtmsrd 	r10,1			/* Set RI (EE=0) */
+	b	system_call_common
+#endif
+	.endif
+
+#ifdef CONFIG_PPC_FAST_ENDIAN_SWITCH
+	/* Fast LE/BE switch system call */
+1:	mfspr	r12,SPRN_SRR1
+	xori	r12,r12,MSR_LE
+	mtspr	SPRN_SRR1,r12
+	mr	r13,r9
+	RFI_TO_USER	/* return to userspace */
+	b	.	/* prevent speculative execution */
 #endif
+.endm
 
 EXC_REAL_BEGIN(system_call, 0xc00, 0x100)
-	SYSCALL_KVMTEST /* loads PACA into r13, and saves r13 to r9 */
-	SYSCALL_FASTENDIAN_TEST
-	SYSCALL_REAL
-	SYSCALL_FASTENDIAN
+	SYSTEM_CALL 1
 EXC_REAL_END(system_call, 0xc00, 0x100)
 
 EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
-	SYSCALL_KVMTEST /* loads PACA into r13, and saves r13 to r9 */
-	SYSCALL_FASTENDIAN_TEST
-	SYSCALL_VIRT
-	SYSCALL_FASTENDIAN
+	SYSTEM_CALL 0
 EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-- 
2.20.1

