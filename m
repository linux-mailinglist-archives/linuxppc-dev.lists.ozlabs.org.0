Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20D4C700
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:00:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TrlH4CXZzDq9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="N0ICVdBg"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqln18BQzDqvp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:49 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v11so926668pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pIlpiVmLSQBmdRkEpWuyvVhf+N2mCBQTt7NBP6n6RQ=;
 b=N0ICVdBg0rWYuP8BALBILSDylvjyD6+msuz29oWAd9OQio3gzgEmv+KTXKqbOQKWFf
 kQheeNno/loYYisnymABZ8yzy8J9pSMYMBMkBzLHcqNvKHpolTgjjCXTQlkLAzG72JAM
 QF7s3vf7vDeRBl9oqlbD7KcEsx7W2TamLA5/mjejiSRMowhQyRE0Sk7LVJkRsXse9SBA
 kxsD2hErXOd4cxkqrMNrpA3wyAQHrhtzI4h1go1M2k6ys2q/MtfNMwqwN+A/EJMz9Yjj
 GetLi//wofxBskK4HaEt7WOjWgfOub8FIXLyxp9Dyi0WPsOnGF3i5vVtYXm1jzF4fWp4
 2sZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pIlpiVmLSQBmdRkEpWuyvVhf+N2mCBQTt7NBP6n6RQ=;
 b=Tv5x/ibjwJfwb139gTLSvfQdEwDrBj8+tBZo9kR7BTZjR4l+AtEd7XiATUoQ6cLFyR
 q4wmOaQc+hEPrVs13y1PSGRyX3Xt+ap5G7gOWwQXrVe8S/dJdG6p33TyFj61+Xh3qEut
 Tt7BxIJItlonUjtyfQCHQzXU9m2LzN1TjVHlSRWnb53SW/1LrAtlr4ZfoyFYlHksfigq
 gHCSL1kufnDTgAkdQr6xFPA+V6b7Ex7tzGpq5hXnm4fa462valv76hpWVtdKLjyDnKhG
 5vHLyTixwNtwr6mppDKswFTkkArgKaNU75d93RL7eO7xBwKGXwfGIZ4M3sMWe1VHc+t2
 PkRw==
X-Gm-Message-State: APjAAAUxi43t+lovq6BJcAMo3FE6emLUl5/sVSGybA7vORhHUTTzYGpb
 W6UMy1CCJPqaBGmZ4uqzOJx1wCOI
X-Google-Smtp-Source: APXvYqzq9xSMGKZvZeT/bL0OrC2UDpvQsrA4ub4L0h+h+c+4WOeO55ILM5kvPZ+2UWLTEFdVOvznuA==
X-Received: by 2002:a62:1883:: with SMTP id 125mr23537751pfy.178.1561007746768; 
 Wed, 19 Jun 2019 22:15:46 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 22/52] powerpc/64s/exception: use a gas macro for system
 call handler code
Date: Thu, 20 Jun 2019 15:14:29 +1000
Message-Id: <20190620051459.29573-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
index f1f1278cb131..f7b6634bcc75 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1607,6 +1607,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  * without saving, though xer is not a good idea to use, as hardware may
  * interpret some bits so it may be costly to change them.
  */
+.macro SYSTEM_CALL real
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
 	 * There is a little bit of juggling to get syscall and hcall
@@ -1616,95 +1617,77 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
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

