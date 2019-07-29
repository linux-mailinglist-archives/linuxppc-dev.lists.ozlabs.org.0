Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF2A78E76
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:54:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2lj0DVqzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KB+9ajCO"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rd2GkDzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:53 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t132so28328028pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xq1uCt+RMtcyLRwwVY39DIXKeYtXh+TTGtKehO3qec=;
 b=KB+9ajCOUgVouj2EfwG01eiIcPbjhcJv9zSF1ly+bT9LW8DfEddOU4iRCLUTLpYSzZ
 8KDl5wNz/D80DSr3Cy93m9uLV0rdooZP1/n0QA7Ts7MKaUp/yuECcj1VOf2WSBTmYC48
 hWYefnDztr7FRQTAUyKTtpLRj/Cz0K/SucR06+KoB4y03xcNSRno6BwycZtykGjNFLuj
 74ak+KW8G1TUpMaYb4grfDyN9dU+KeOSheXVh8GVfoHC2mayJMpICewbut/UR/C/v94X
 vV5955tGvI7rMEcdbSs8OE9jptCsvYpdTDT1Eo7S4VPJDQPgx++c4WlDDI3QOceXAQVv
 Q2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xq1uCt+RMtcyLRwwVY39DIXKeYtXh+TTGtKehO3qec=;
 b=Ja5ATtjf8aAD6uDeWlB+BKMKEaeKLWm9AFN5mk9mUkS4G7/4tifM808RFSsSBuv2l7
 z9sbgMXrk8kJVKsBmvR42omC+gKCxzrWYMbwPIGczeabeWMh40YRk8k+FNp7dCVsLXcu
 tmiCMWAiJI/+xCl5P19L/EO9FwaYF80F4j/knfYqEp6ugqZ/WhwqprnHLWv+HezCMwbi
 OAGTipQaFe5xg5rJG13nAhXy+XSXPVaxvOHumQWtpL2i2QjaGSR+MIXGhGfO8HGpIvaX
 oUXZ+5L8p15pmLgs5SzO7KGzj1QkDyei3my5klIUccjzS4Dbl+Fy5Nqti6Ml18DG/Im3
 qH7Q==
X-Gm-Message-State: APjAAAUk/K7Y1E1r52FOhaZWNvR89m9vCO7Jjo4syzokV0KXB/tRk/L6
 PCUPY5CPi9GK1rBueLzzAqHWWNO59T8=
X-Google-Smtp-Source: APXvYqxr9ytFMWS9XTv/hjGnRCgF8bPEP6ZLAYHkCYhCyzy4boFD0Bt5GdgKotG2LFVRwDcEaa3/IQ==
X-Received: by 2002:a63:c009:: with SMTP id h9mr77151444pgg.166.1564409631056; 
 Mon, 29 Jul 2019 07:13:51 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/18] powerpc/64s/exception: Add INT_KVM_HANDLER gas macro
Date: Tue, 30 Jul 2019 00:12:39 +1000
Message-Id: <20190729141247.26762-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

Replace the 4 variants of cpp macros with one gas macro.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 99 +++++++++++-----------------
 1 file changed, 40 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e5122ace5f05..4b2d4c8f8831 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -651,22 +651,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	.endif
 .endm
 
-
-#define TRAMP_KVM(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n, 0
-
-#define TRAMP_KVM_SKIP(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n, 1
-
-#define TRAMP_KVM_HV(area, n)						\
-	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n, 0
-
-#define TRAMP_KVM_HV_SKIP(area, n)					\
-	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n, 1
+.macro INT_KVM_HANDLER vec, hsrr, area, skip
+	.if \hsrr
+	TRAMP_KVM_BEGIN(do_kvm_H\vec\())
+	.else
+	TRAMP_KVM_BEGIN(do_kvm_\vec\())
+	.endif
+	KVM_HANDLER \area, \hsrr, \vec, \skip
+.endm
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
@@ -827,9 +819,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * be dangerous anyway.
 	 */
 EXC_REAL_END(system_reset, 0x100, 0x100)
-
 EXC_VIRT_NONE(0x4100, 0x100)
-TRAMP_KVM(PACA_EXNMI, 0x100)
+INT_KVM_HANDLER 0x100, EXC_STD, PACA_EXNMI, 0
 
 #ifdef CONFIG_PPC_P7_NAP
 TRAMP_REAL_BEGIN(system_reset_idle_wake)
@@ -923,7 +914,7 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
 #endif
 
-TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
+INT_KVM_HANDLER 0x200, EXC_STD, PACA_EXMC, 1
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
@@ -1162,9 +1153,7 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	INT_HANDLER data_access, 0x300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-
-TRAMP_KVM_SKIP(PACA_EXGEN, 0x300)
-
+INT_KVM_HANDLER 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
 	/*
 	 * Here r13 points to the paca, r9 contains the saved CR,
@@ -1193,9 +1182,7 @@ EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	INT_HANDLER data_access_slb, 0x380, 0, 0, 1, 0, PACA_EXSLB, 1, 1, 0, 0, 0
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
-
-TRAMP_KVM_SKIP(PACA_EXSLB, 0x380)
-
+INT_KVM_HANDLER 0x380, EXC_STD, PACA_EXSLB, 1
 EXC_COMMON_BEGIN(data_access_slb_common)
 	EXCEPTION_COMMON(PACA_EXSLB, 0x380)
 	ld	r4,PACA_EXSLB+EX_DAR(r13)
@@ -1228,9 +1215,7 @@ EXC_REAL_END(instruction_access, 0x400, 0x80)
 EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 	INT_HANDLER instruction_access, 0x400, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
-
-TRAMP_KVM(PACA_EXGEN, 0x400)
-
+INT_KVM_HANDLER 0x400, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(instruction_access_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0x400)
 	RECONCILE_IRQ_STATE(r10, r11)
@@ -1253,8 +1238,7 @@ EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 1, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
-TRAMP_KVM(PACA_EXSLB, 0x480)
-
+INT_KVM_HANDLER 0x480, EXC_STD, PACA_EXSLB, 0
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	EXCEPTION_COMMON(PACA_EXSLB, 0x480)
 	ld	r4,_NIP(r1)
@@ -1285,9 +1269,8 @@ EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
-
-TRAMP_KVM(PACA_EXGEN, 0x500)
-TRAMP_KVM_HV(PACA_EXGEN, 0x500)
+INT_KVM_HANDLER 0x500, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER 0x500, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
@@ -1297,8 +1280,7 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 	INT_HANDLER alignment, 0x600, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(alignment, 0x4600, 0x100)
-
-TRAMP_KVM(PACA_EXGEN, 0x600)
+INT_KVM_HANDLER 0x600, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(alignment_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0x600)
 	ld	r3,PACA_EXGEN+EX_DAR(r13)
@@ -1318,7 +1300,7 @@ EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
 	INT_HANDLER program_check, 0x700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(program_check, 0x4700, 0x100)
-TRAMP_KVM(PACA_EXGEN, 0x700)
+INT_KVM_HANDLER 0x700, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(program_check_common)
 	/*
 	 * It's possible to receive a TM Bad Thing type program check with
@@ -1360,7 +1342,7 @@ EXC_REAL_END(fp_unavailable, 0x800, 0x100)
 EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
 	INT_HANDLER fp_unavailable, 0x800, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
-TRAMP_KVM(PACA_EXGEN, 0x800)
+INT_KVM_HANDLER 0x800, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0x800)
 	bne	1f			/* if from user, just load it up */
@@ -1397,7 +1379,7 @@ EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
-TRAMP_KVM(PACA_EXGEN, 0x900)
+INT_KVM_HANDLER 0x900, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
 
 
@@ -1407,7 +1389,7 @@ EXC_REAL_END(hdecrementer, 0x980, 0x80)
 EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
-TRAMP_KVM_HV(PACA_EXGEN, 0x980)
+INT_KVM_HANDLER 0x980, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
 
 
@@ -1417,7 +1399,7 @@ EXC_REAL_END(doorbell_super, 0xa00, 0x100)
 EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
-TRAMP_KVM(PACA_EXGEN, 0xa00)
+INT_KVM_HANDLER 0xa00, EXC_STD, PACA_EXGEN, 0
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, doorbell_exception)
 #else
@@ -1567,7 +1549,7 @@ EXC_REAL_END(single_step, 0xd00, 0x100)
 EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
-TRAMP_KVM(PACA_EXGEN, 0xd00)
+INT_KVM_HANDLER 0xd00, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON(single_step_common, 0xd00, single_step_exception)
 
 
@@ -1577,7 +1559,7 @@ EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
-TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0xe00)
+INT_KVM_HANDLER 0xe00, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(h_data_storage_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xe00)
 	bl      save_nvgprs
@@ -1602,7 +1584,7 @@ EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
 EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xe20)
+INT_KVM_HANDLER 0xe20, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
 
 
@@ -1612,7 +1594,7 @@ EXC_REAL_END(emulation_assist, 0xe40, 0x20)
 EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xe40)
+INT_KVM_HANDLER 0xe40, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
 
 
@@ -1625,8 +1607,7 @@ EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
 	INT_HANDLER hmi_exception, 0xe60, 1, 1, 0, EXC_HV, PACA_EXGEN, 0, 0, 0, 0, 1
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
-
+INT_KVM_HANDLER 0xe60, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
@@ -1671,7 +1652,7 @@ EXC_REAL_END(h_doorbell, 0xe80, 0x20)
 EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xe80)
+INT_KVM_HANDLER 0xe80, EXC_HV, PACA_EXGEN, 0
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, doorbell_exception)
 #else
@@ -1685,7 +1666,7 @@ EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
 EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xea0)
+INT_KVM_HANDLER 0xea0, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
 
 
@@ -1701,7 +1682,7 @@ EXC_REAL_END(performance_monitor, 0xf00, 0x20)
 EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
-TRAMP_KVM(PACA_EXGEN, 0xf00)
+INT_KVM_HANDLER 0xf00, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
 
 
@@ -1711,7 +1692,7 @@ EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
 	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
-TRAMP_KVM(PACA_EXGEN, 0xf20)
+INT_KVM_HANDLER 0xf20, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(altivec_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xf20)
 #ifdef CONFIG_ALTIVEC
@@ -1752,7 +1733,7 @@ EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
 	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
-TRAMP_KVM(PACA_EXGEN, 0xf40)
+INT_KVM_HANDLER 0xf40, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(vsx_unavailable_common)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xf40)
 #ifdef CONFIG_VSX
@@ -1792,7 +1773,7 @@ EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
 EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
-TRAMP_KVM(PACA_EXGEN, 0xf60)
+INT_KVM_HANDLER 0xf60, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
 
 
@@ -1802,7 +1783,7 @@ EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
 EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
-TRAMP_KVM_HV(PACA_EXGEN, 0xf80)
+INT_KVM_HANDLER 0xf80, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
 
 
@@ -1823,7 +1804,7 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x20)
 	INT_HANDLER cbe_system_error, 0x1200, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_system_error, 0x1200, 0x20)
 EXC_VIRT_NONE(0x5200, 0x100)
-TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1200)
+INT_KVM_HANDLER 0x1200, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_system_error_common, 0x1200, cbe_system_error_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
@@ -1837,7 +1818,7 @@ EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
 EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
-TRAMP_KVM_SKIP(PACA_EXGEN, 0x1300)
+INT_KVM_HANDLER 0x1300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
 
 
@@ -1867,7 +1848,7 @@ EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 EXC_VIRT_NONE(0x5500, 0x100)
 #endif
 
-TRAMP_KVM_HV(PACA_EXGEN, 0x1500)
+INT_KVM_HANDLER 0x1500, EXC_HV, PACA_EXGEN, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
 TRAMP_REAL_BEGIN(denorm_assist)
@@ -1946,7 +1927,7 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x20)
 	INT_HANDLER cbe_maintenance, 0x1600, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x20)
 EXC_VIRT_NONE(0x5600, 0x100)
-TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1600)
+INT_KVM_HANDLER 0x1600, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_maintenance_common, 0x1600, cbe_maintenance_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
@@ -1960,7 +1941,7 @@ EXC_REAL_END(altivec_assist, 0x1700, 0x100)
 EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
-TRAMP_KVM(PACA_EXGEN, 0x1700)
+INT_KVM_HANDLER 0x1700, EXC_STD, PACA_EXGEN, 0
 #ifdef CONFIG_ALTIVEC
 EXC_COMMON(altivec_assist_common, 0x1700, altivec_assist_exception)
 #else
@@ -1973,7 +1954,7 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x20)
 	INT_HANDLER cbe_thermal, 0x1800, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_thermal, 0x1800, 0x20)
 EXC_VIRT_NONE(0x5800, 0x100)
-TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0x1800)
+INT_KVM_HANDLER 0x1800, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_thermal_common, 0x1800, cbe_thermal_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
-- 
2.22.0

