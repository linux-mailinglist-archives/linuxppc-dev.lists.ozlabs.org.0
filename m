Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCC295970
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:28:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CP7g3kHfzDqdr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:28:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ZBbRDSXC"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqf5VQDzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:22 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 129so2911769pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Wzd0oM19a1Y2XLWndwD600p9ctH3XimEIED6JZrwmc=;
 b=ZBbRDSXCRjVmqJ2PC8GFqluopQ051SiTynXJx9PfLu3MeBsCug9cmEEEh5Cxea+Zvs
 Nf1K85ZlrLnvTUEuFH0ABRdTed3eyw1jKmQU/ErYe3lGgyMTj3fcZs5Q4uJBniWYoW13
 PHp3l2lHlTkizNlVyFJqU9eQ4aN1ihcTxlwnMhqx7tDwDO7wKO3LvYHJQrSSb8oZh/Dr
 Zb/0X/0WGW55K5irIj8/egauywlcGRjfzX5I217r9zm+8SHbeCggQs3jZjMGKbZ4d2xg
 gTEp2SQ29zJhThFUHYd2GGJ6wo54B9wOtjmPvmtPuUYqMm/f861idfvNts4wsvnxCCVZ
 tUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Wzd0oM19a1Y2XLWndwD600p9ctH3XimEIED6JZrwmc=;
 b=l/gXKuUyg3jN6huHFb9B57e73PQXOygFVJplCK5V9cA2mk9q3Qp25kt7Ybnf0HOnrO
 yZ8to5h1XQIOxHaVtKu2yf66crJetYgioEPGT5+7KM4m/Nj6mCliOuaw3KDeKMvPPAdn
 1Sj3O8AYfytW4r4sdANF28H7ae8MRY5VTOUFPpwBRNSDqu6Stqj61Z6lZIOpX1B0t4zY
 2oHkRTBwsrj7UIb/A2xLwDjNjl6QaYLg3fEWY25HuYbIhi2Nn6y5hYrkBNBFisTlGsHw
 HSg1V4GEAZSOzeL68syPpx3PQcpysW2HbZuADQaKyVVsBRtPDQdOjjbBEIxnxW2xKBgF
 UlxQ==
X-Gm-Message-State: APjAAAWmVfORPrnJusB9kY4dmpm29tLGK46VsTwOIfxEAwt+sTx4eXvI
 whONARPn5uND0i/F5mUjvEmaDrSZXqxeGg==
X-Google-Smtp-Source: APXvYqz0xNhuk+OWDTc6Q9XvTXk7y7Y5SuYYlqgEYLTcLntkaXO68suorffOmDR6JIJkAOv/tMbD9g==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr24816952pjr.65.1566288859653; 
 Tue, 20 Aug 2019 01:14:19 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:14:19 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 6/7] powerpc/memcpy: Add memcpy_mcsafe for pmem
Date: Tue, 20 Aug 2019 13:43:51 +0530
Message-Id: <20190820081352.8641-7-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820081352.8641-1-santosh@fossix.org>
References: <20190820081352.8641-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balbir Singh <bsingharora@gmail.com>

The pmem infrastructure uses memcpy_mcsafe in the pmem layer so as to
convert machine check exceptions into a return value on failure in case
a machine check exception is encountered during the memcpy. The return
value is the number of bytes remaining to be copied.

This patch largely borrows from the copyuser_power7 logic and does not add
the VMX optimizations, largely to keep the patch simple. If needed those
optimizations can be folded in.

Signed-off-by: Balbir Singh <bsingharora@gmail.com>
[arbab@linux.ibm.com: Added symbol export]
Co-developed-by: Santosh Sivaraj <santosh@fossix.org>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/include/asm/string.h   |   2 +
 arch/powerpc/lib/Makefile           |   2 +-
 arch/powerpc/lib/memcpy_mcsafe_64.S | 242 ++++++++++++++++++++++++++++
 3 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/lib/memcpy_mcsafe_64.S

diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
index 9bf6dffb4090..b72692702f35 100644
--- a/arch/powerpc/include/asm/string.h
+++ b/arch/powerpc/include/asm/string.h
@@ -53,7 +53,9 @@ void *__memmove(void *to, const void *from, __kernel_size_t n);
 #ifndef CONFIG_KASAN
 #define __HAVE_ARCH_MEMSET32
 #define __HAVE_ARCH_MEMSET64
+#define __HAVE_ARCH_MEMCPY_MCSAFE
 
+extern int memcpy_mcsafe(void *dst, const void *src, __kernel_size_t sz);
 extern void *__memset16(uint16_t *, uint16_t v, __kernel_size_t);
 extern void *__memset32(uint32_t *, uint32_t v, __kernel_size_t);
 extern void *__memset64(uint64_t *, uint64_t v, __kernel_size_t);
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index eebc782d89a5..fa6b1b657b43 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -39,7 +39,7 @@ obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
 			       memcpy_power7.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
-	   memcpy_64.o pmem.o
+	   memcpy_64.o pmem.o memcpy_mcsafe_64.o
 
 obj64-$(CONFIG_SMP)	+= locks.o
 obj64-$(CONFIG_ALTIVEC)	+= vmx-helper.o
diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
new file mode 100644
index 000000000000..949976dc115d
--- /dev/null
+++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
@@ -0,0 +1,242 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) IBM Corporation, 2011
+ * Derived from copyuser_power7.s by Anton Blanchard <anton@au.ibm.com>
+ * Author - Balbir Singh <bsingharora@gmail.com>
+ */
+#include <asm/ppc_asm.h>
+#include <asm/errno.h>
+#include <asm/export.h>
+
+	.macro err1
+100:
+	EX_TABLE(100b,.Ldo_err1)
+	.endm
+
+	.macro err2
+200:
+	EX_TABLE(200b,.Ldo_err2)
+	.endm
+
+	.macro err3
+300:	EX_TABLE(300b,.Ldone)
+	.endm
+
+.Ldo_err2:
+	ld	r22,STK_REG(R22)(r1)
+	ld	r21,STK_REG(R21)(r1)
+	ld	r20,STK_REG(R20)(r1)
+	ld	r19,STK_REG(R19)(r1)
+	ld	r18,STK_REG(R18)(r1)
+	ld	r17,STK_REG(R17)(r1)
+	ld	r16,STK_REG(R16)(r1)
+	ld	r15,STK_REG(R15)(r1)
+	ld	r14,STK_REG(R14)(r1)
+	addi	r1,r1,STACKFRAMESIZE
+.Ldo_err1:
+	/* Do a byte by byte copy to get the exact remaining size */
+	mtctr	r7
+46:
+err3;	lbz	r0,0(r4)
+	addi	r4,r4,1
+err3;	stb	r0,0(r3)
+	addi	r3,r3,1
+	bdnz	46b
+	li	r3,0
+	blr
+
+.Ldone:
+	mfctr	r3
+	blr
+
+
+_GLOBAL(memcpy_mcsafe)
+	mr	r7,r5
+	cmpldi	r5,16
+	blt	.Lshort_copy
+
+.Lcopy:
+	/* Get the source 8B aligned */
+	neg	r6,r4
+	mtocrf	0x01,r6
+	clrldi	r6,r6,(64-3)
+
+	bf	cr7*4+3,1f
+err1;	lbz	r0,0(r4)
+	addi	r4,r4,1
+err1;	stb	r0,0(r3)
+	addi	r3,r3,1
+	subi	r7,r7,1
+
+1:	bf	cr7*4+2,2f
+err1;	lhz	r0,0(r4)
+	addi	r4,r4,2
+err1;	sth	r0,0(r3)
+	addi	r3,r3,2
+	subi	r7,r7,2
+
+2:	bf	cr7*4+1,3f
+err1;	lwz	r0,0(r4)
+	addi	r4,r4,4
+err1;	stw	r0,0(r3)
+	addi	r3,r3,4
+	subi	r7,r7,4
+
+3:	sub	r5,r5,r6
+	cmpldi	r5,128
+	blt	5f
+
+	mflr	r0
+	stdu	r1,-STACKFRAMESIZE(r1)
+	std	r14,STK_REG(R14)(r1)
+	std	r15,STK_REG(R15)(r1)
+	std	r16,STK_REG(R16)(r1)
+	std	r17,STK_REG(R17)(r1)
+	std	r18,STK_REG(R18)(r1)
+	std	r19,STK_REG(R19)(r1)
+	std	r20,STK_REG(R20)(r1)
+	std	r21,STK_REG(R21)(r1)
+	std	r22,STK_REG(R22)(r1)
+	std	r0,STACKFRAMESIZE+16(r1)
+
+	srdi	r6,r5,7
+	mtctr	r6
+
+	/* Now do cacheline (128B) sized loads and stores. */
+	.align	5
+4:
+err2;	ld	r0,0(r4)
+err2;	ld	r6,8(r4)
+err2;	ld	r8,16(r4)
+err2;	ld	r9,24(r4)
+err2;	ld	r10,32(r4)
+err2;	ld	r11,40(r4)
+err2;	ld	r12,48(r4)
+err2;	ld	r14,56(r4)
+err2;	ld	r15,64(r4)
+err2;	ld	r16,72(r4)
+err2;	ld	r17,80(r4)
+err2;	ld	r18,88(r4)
+err2;	ld	r19,96(r4)
+err2;	ld	r20,104(r4)
+err2;	ld	r21,112(r4)
+err2;	ld	r22,120(r4)
+	addi	r4,r4,128
+err2;	std	r0,0(r3)
+err2;	std	r6,8(r3)
+err2;	std	r8,16(r3)
+err2;	std	r9,24(r3)
+err2;	std	r10,32(r3)
+err2;	std	r11,40(r3)
+err2;	std	r12,48(r3)
+err2;	std	r14,56(r3)
+err2;	std	r15,64(r3)
+err2;	std	r16,72(r3)
+err2;	std	r17,80(r3)
+err2;	std	r18,88(r3)
+err2;	std	r19,96(r3)
+err2;	std	r20,104(r3)
+err2;	std	r21,112(r3)
+err2;	std	r22,120(r3)
+	addi	r3,r3,128
+	subi	r7,r7,128
+	bdnz	4b
+
+	clrldi	r5,r5,(64-7)
+
+	/* Up to 127B to go */
+5:	srdi	r6,r5,4
+	mtocrf	0x01,r6
+
+6:	bf	cr7*4+1,7f
+err2;	ld	r0,0(r4)
+err2;	ld	r6,8(r4)
+err2;	ld	r8,16(r4)
+err2;	ld	r9,24(r4)
+err2;	ld	r10,32(r4)
+err2;	ld	r11,40(r4)
+err2;	ld	r12,48(r4)
+err2;	ld	r14,56(r4)
+	addi	r4,r4,64
+err2;	std	r0,0(r3)
+err2;	std	r6,8(r3)
+err2;	std	r8,16(r3)
+err2;	std	r9,24(r3)
+err2;	std	r10,32(r3)
+err2;	std	r11,40(r3)
+err2;	std	r12,48(r3)
+err2;	std	r14,56(r3)
+	addi	r3,r3,64
+	subi	r7,r7,64
+
+7:	ld	r14,STK_REG(R14)(r1)
+	ld	r15,STK_REG(R15)(r1)
+	ld	r16,STK_REG(R16)(r1)
+	ld	r17,STK_REG(R17)(r1)
+	ld	r18,STK_REG(R18)(r1)
+	ld	r19,STK_REG(R19)(r1)
+	ld	r20,STK_REG(R20)(r1)
+	ld	r21,STK_REG(R21)(r1)
+	ld	r22,STK_REG(R22)(r1)
+	addi	r1,r1,STACKFRAMESIZE
+
+	/* Up to 63B to go */
+	bf	cr7*4+2,8f
+err1;	ld	r0,0(r4)
+err1;	ld	r6,8(r4)
+err1;	ld	r8,16(r4)
+err1;	ld	r9,24(r4)
+	addi	r4,r4,32
+err1;	std	r0,0(r3)
+err1;	std	r6,8(r3)
+err1;	std	r8,16(r3)
+err1;	std	r9,24(r3)
+	addi	r3,r3,32
+	subi	r7,r7,32
+
+	/* Up to 31B to go */
+8:	bf	cr7*4+3,9f
+err1;	ld	r0,0(r4)
+err1;	ld	r6,8(r4)
+	addi	r4,r4,16
+err1;	std	r0,0(r3)
+err1;	std	r6,8(r3)
+	addi	r3,r3,16
+	subi	r7,r7,16
+
+9:	clrldi	r5,r5,(64-4)
+
+	/* Up to 15B to go */
+.Lshort_copy:
+	mtocrf	0x01,r5
+	bf	cr7*4+0,12f
+err1;	lwz	r0,0(r4)	/* Less chance of a reject with word ops */
+err1;	lwz	r6,4(r4)
+	addi	r4,r4,8
+err1;	stw	r0,0(r3)
+err1;	stw	r6,4(r3)
+	addi	r3,r3,8
+	subi	r7,r7,8
+
+12:	bf	cr7*4+1,13f
+err1;	lwz	r0,0(r4)
+	addi	r4,r4,4
+err1;	stw	r0,0(r3)
+	addi	r3,r3,4
+	subi	r7,r7,4
+
+13:	bf	cr7*4+2,14f
+err1;	lhz	r0,0(r4)
+	addi	r4,r4,2
+err1;	sth	r0,0(r3)
+	addi	r3,r3,2
+	subi	r7,r7,2
+
+14:	bf	cr7*4+3,15f
+err1;	lbz	r0,0(r4)
+err1;	stb	r0,0(r3)
+
+15:	li	r3,0
+	blr
+
+EXPORT_SYMBOL_GPL(memcpy_mcsafe);
-- 
2.21.0

