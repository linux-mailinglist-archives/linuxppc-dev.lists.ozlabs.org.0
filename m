Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1887A4F62D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 16:25:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WHsY3rqJzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2019 00:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VIuHH9Bh"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGL45WZlzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:17:00 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t7so4331094plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbZXmqaYmFEOe4ot9cqiTzIUjRUkcibvkFO1zKZwpgU=;
 b=VIuHH9Bh72D9to3wfbE2/sedF87D6tkSjaYRAvZqM1ej3h6VYMMNoIA8U3LjEnYWbo
 4fgWK+MRsyFCyNUFdp05Ne/oyjckNn5dby5ZbXcA65HCQaJK85h92gqczuSjTGQh62bs
 sZXjkR6v4d8sf+gX2yyBYNH4GgY0J7j3OHCjSKD0AiL/FrMk4hUdo31fJk7R9XLmCthU
 Ff6qTXn8NREJ0LHzFngA1EG9KIZBWMo2/+Y/cu62ROoqfEq22eNbUUOb0+9V/YRkHlh9
 bZv3Rb1DaijDKgkwzKLUBnawnvz0bwyK/zurz+wVNcby4rNLEzy/sw/E3aIKRKM8wZ+/
 mUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CbZXmqaYmFEOe4ot9cqiTzIUjRUkcibvkFO1zKZwpgU=;
 b=CPgjpcYkTV9gW4kKSvQq5R+mxFUoLbsa9lecMW7aJCM+b+vypkVzuaDULnK7/zL/RG
 XBJVn5Rwwu8/5agjexl8/JN2p0DRjnepAjATESuTXM++ZZvVHkg/HdAjxpC8qs9eBx8L
 P16AS4deeOOSdRHvPaoy0AfkXip/3CHtVlO336dVXDTjpjM2gehBYssX9YzHEyoBs0i0
 ubgRoUxu44Sz2zIXxZ5MRpD593dMb02uQRTCKurpqYElq9NkAp7LCBG3IOZYklgnUqL7
 AqXKp5fofyVy7xjBxgMNhpbHqJ5gHmEPQTOGY3XMELYjJrjP2yZShTkyB9Z+cmoRxd1l
 lwkQ==
X-Gm-Message-State: APjAAAVCBXtGC7Y88mVgEkv9rYLB82tnKhrHZ6BEiGuEnDywwdUliw8u
 W8PEFy/MOm6OHeSyixqpMg2Cr9wdGBc=
X-Google-Smtp-Source: APXvYqwAplk2d81jA8Iby832ETE/cHxJloivoyCOOIxqYx5pxZWTG3T+PTAw1Q7dcpyGv3CRKNtong==
X-Received: by 2002:a17:902:a607:: with SMTP id
 u7mr132555387plq.43.1561209418625; 
 Sat, 22 Jun 2019 06:16:58 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 21/25] powerpc/64s/exception: use a gas macro for system
 call handler code
Date: Sat, 22 Jun 2019 23:15:31 +1000
Message-Id: <20190622131535.20996-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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
index a96a8d225ad3..1bd08b90ef82 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1607,6 +1607,7 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  * without saving, though xer is not a good idea to use, as hardware may
  * interpret some bits so it may be costly to change them.
  */
+.macro SYSTEM_CALL virt
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
+	.if ! \virt
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
+	SYSTEM_CALL 0
 EXC_REAL_END(system_call, 0xc00, 0x100)
 
 EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
-	SYSCALL_KVMTEST /* loads PACA into r13, and saves r13 to r9 */
-	SYSCALL_FASTENDIAN_TEST
-	SYSCALL_VIRT
-	SYSCALL_FASTENDIAN
+	SYSTEM_CALL 1
 EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-- 
2.20.1

