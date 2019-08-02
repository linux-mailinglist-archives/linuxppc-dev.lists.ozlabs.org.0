Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD07F6FF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:39:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RZF0RsNzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b4ueocEG"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNX6bRxzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:16 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c2so33487281plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YkzBvopKzlMDlJ4NiLfogubDAF7q4s89sb0HLChPRLk=;
 b=b4ueocEGtreqnAc/eeaFh7pJ2Y5tTc42hPnK4ycgno01zyuH7bgJZ05WRbCmUgki+w
 GTn7J3YATfc2RZ1JzQZfhZIWRGaj9HRGH0rVA9j689D4bQF7l7mDbNk1P1WoabNu8iBG
 50tTMKvfFQUPhw4akTwJ4kPg7gpjJwbJ8TudH132vuXS0FBNlg3visPvdlipHOKQ0QpL
 x7BJZn10z4V/9ZFRLATZODfEmJd3NWKu98i0LEXAUnepLq6fb+rHmgM9ODU5s9Q7STP0
 CZW4uTC5voBMT/ciWbQSWOClB6YXRXbVsAfYcdoqDXYkkYjFRElifJCpMfE1m71A5hh2
 J7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YkzBvopKzlMDlJ4NiLfogubDAF7q4s89sb0HLChPRLk=;
 b=WGaLJY0gkjbkCdGdE3ZoVtEDbNyHE5dd/pR1WcuVLvj8go6H1WVZ1sCKf/BsW2vVGd
 cgMrpbOQ5worNQ05q8V6e3l99FL5z+WGGTP0meY4cUBByaEOYK8+3VWhYL+y1b4MLdWH
 SznSmKyRN7VhEwQ0AfLDnNE37wwi3lmizetsCZeOpRX9ma2KxVDP6rAfGkPugC4Aq0i4
 dsC1j2kWfD5hqJmJqPEzCKILT9Atnb8z5F/i0RY85/wDD5/ParGyMAnPnu+s0Z0/XXDb
 fBjDS6+5673gKtEHk7GepB6CSPAGhheHuFLQKQ4XFM+QbDw3RP7vMo5w3s8TzKrdyq6J
 1YIw==
X-Gm-Message-State: APjAAAXQYz4PwwTwAeugXlHuDMrjPibMMGLNOkTSKXCCBI1DJ6hoDMT2
 WJHhzTgEHpdNyY1JwglAQe24mAt4+ro=
X-Google-Smtp-Source: APXvYqxqboHQnR8R15oyLpflAAtazvcS8hSQ91/QThNq2S3LV7JLWOiIgTfyVu2zEtt8Vw8dlX5zig==
X-Received: by 2002:a17:902:7043:: with SMTP id
 h3mr104303183plt.10.1564743673630; 
 Fri, 02 Aug 2019 04:01:13 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 40/44] powerpc/64s/exception: Expand EXC_COMMON and
 EXC_COMMON_ASYNC macros
Date: Fri,  2 Aug 2019 20:57:05 +1000
Message-Id: <20190802105709.27696-41-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

These don't provide a large amount of code sharing. Removing them
makes code easier to shuffle around. For example, some of the common
instructions will be moved into the common code gen macro.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 160 ++++++++++++++++++++-------
 1 file changed, 117 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4e475e33b14a..94f8ecacbce5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -761,28 +761,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #define FINISH_NAP
 #endif
 
-#define EXC_COMMON(name, realvec, hdlr)					\
-	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
-	bl	save_nvgprs;						\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except
-
-/*
- * Like EXC_COMMON, but for exceptions that can occur in the idle task and
- * therefore need the special idle handling (finish nap and runlatch)
- */
-#define EXC_COMMON_ASYNC(name, realvec, hdlr)				\
-	EXC_COMMON_BEGIN(name);						\
-	INT_COMMON realvec, PACA_EXGEN, 1, 1, 1, 0, 0 ;			\
-	FINISH_NAP;							\
-	RUNLATCH_ON;							\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
-	bl	hdlr;							\
-	b	ret_from_except_lite
-
-
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical location.
@@ -1362,7 +1340,13 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 INT_KVM_HANDLER hardware_interrupt, 0x500, EXC_HV_OR_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
+EXC_COMMON_BEGIN(hardware_interrupt_common)
+	INT_COMMON 0x500, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	do_IRQ
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(alignment, 0x600, 0x100)
@@ -1467,7 +1451,13 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 INT_KVM_HANDLER decrementer, 0x900, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
+EXC_COMMON_BEGIN(decrementer_common)
+	INT_COMMON 0x900, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	timer_interrupt
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(hdecrementer, 0x980, 0x80)
@@ -1477,7 +1467,12 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
 INT_KVM_HANDLER hdecrementer, 0x980, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
+EXC_COMMON_BEGIN(hdecrementer_common)
+	INT_COMMON 0x980, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	hdec_interrupt
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1487,11 +1482,17 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 INT_KVM_HANDLER doorbell_super, 0xa00, EXC_STD, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(doorbell_super_common)
+	INT_COMMON 0xa00, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, doorbell_exception)
+	bl	doorbell_exception
 #else
-EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except_lite
 
 
 EXC_REAL_NONE(0xb00, 0x100)
@@ -1637,7 +1638,12 @@ EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
 INT_KVM_HANDLER single_step, 0xd00, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON(single_step_common, 0xd00, single_step_exception)
+EXC_COMMON_BEGIN(single_step_common)
+	INT_COMMON 0xd00, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	single_step_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
@@ -1668,7 +1674,12 @@ EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 INT_KVM_HANDLER h_instr_storage, 0xe20, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
+EXC_COMMON_BEGIN(h_instr_storage_common)
+	INT_COMMON 0xe20, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unknown_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(emulation_assist, 0xe40, 0x20)
@@ -1678,7 +1689,12 @@ EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 INT_KVM_HANDLER emulation_assist, 0xe40, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
+EXC_COMMON_BEGIN(emulation_assist_common)
+	INT_COMMON 0xe40, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	emulation_assist_interrupt
+	b	ret_from_except
 
 
 /*
@@ -1735,11 +1751,17 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 INT_KVM_HANDLER h_doorbell, 0xe80, EXC_HV, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(h_doorbell_common)
+	INT_COMMON 0xe80, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, doorbell_exception)
+	bl	doorbell_exception
 #else
-EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
@@ -1749,7 +1771,13 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 INT_KVM_HANDLER h_virt_irq, 0xea0, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
+EXC_COMMON_BEGIN(h_virt_irq_common)
+	INT_COMMON 0xea0, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	do_IRQ
+	b	ret_from_except_lite
 
 
 EXC_REAL_NONE(0xec0, 0x20)
@@ -1765,7 +1793,13 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 INT_KVM_HANDLER performance_monitor, 0xf00, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
+EXC_COMMON_BEGIN(performance_monitor_common)
+	INT_COMMON 0xf00, PACA_EXGEN, 1, 1, 1, 0, 0
+	FINISH_NAP
+	RUNLATCH_ON
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	performance_monitor_exception
+	b	ret_from_except_lite
 
 
 EXC_REAL_BEGIN(altivec_unavailable, 0xf20, 0x20)
@@ -1856,7 +1890,12 @@ EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 INT_KVM_HANDLER facility_unavailable, 0xf60, EXC_STD, PACA_EXGEN, 0
-EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
+EXC_COMMON_BEGIN(facility_unavailable_common)
+	INT_COMMON 0xf60, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	facility_unavailable_exception
+	b	ret_from_except
 
 
 EXC_REAL_BEGIN(h_facility_unavailable, 0xf80, 0x20)
@@ -1866,7 +1905,12 @@ EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 INT_KVM_HANDLER h_facility_unavailable, 0xf80, EXC_HV, PACA_EXGEN, 0
-EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
+EXC_COMMON_BEGIN(h_facility_unavailable_common)
+	INT_COMMON 0xf80, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	facility_unavailable_exception
+	b	ret_from_except
 
 
 EXC_REAL_NONE(0xfa0, 0x20)
@@ -1887,7 +1931,12 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
 INT_KVM_HANDLER cbe_system_error, 0x1200, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_system_error_common, 0x1200, cbe_system_error_exception)
+EXC_COMMON_BEGIN(cbe_system_error_common)
+	INT_COMMON 0x1200, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_system_error_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
@@ -1901,7 +1950,12 @@ EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 INT_KVM_HANDLER instruction_breakpoint, 0x1300, EXC_STD, PACA_EXGEN, 1
-EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
+EXC_COMMON_BEGIN(instruction_breakpoint_common)
+	INT_COMMON 0x1300, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	instruction_breakpoint_exception
+	b	ret_from_except
 
 
 EXC_REAL_NONE(0x1400, 0x100)
@@ -2001,7 +2055,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	b	.
 #endif
 
-EXC_COMMON(denorm_common, 0x1500, unknown_exception)
+EXC_COMMON_BEGIN(denorm_common)
+	INT_COMMON 0x1500, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	unknown_exception
+	b	ret_from_except
 
 
 #ifdef CONFIG_CBE_RAS
@@ -2010,7 +2069,12 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
 INT_KVM_HANDLER cbe_maintenance, 0x1600, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_maintenance_common, 0x1600, cbe_maintenance_exception)
+EXC_COMMON_BEGIN(cbe_maintenance_common)
+	INT_COMMON 0x1600, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_maintenance_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
@@ -2024,11 +2088,16 @@ EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
 INT_KVM_HANDLER altivec_assist, 0x1700, EXC_STD, PACA_EXGEN, 0
+EXC_COMMON_BEGIN(altivec_assist_common)
+	INT_COMMON 0x1700, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
-EXC_COMMON(altivec_assist_common, 0x1700, altivec_assist_exception)
+	bl	altivec_assist_exception
 #else
-EXC_COMMON(altivec_assist_common, 0x1700, unknown_exception)
+	bl	unknown_exception
 #endif
+	b	ret_from_except
 
 
 #ifdef CONFIG_CBE_RAS
@@ -2037,7 +2106,12 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
 INT_KVM_HANDLER cbe_thermal, 0x1800, EXC_HV, PACA_EXGEN, 1
-EXC_COMMON(cbe_thermal_common, 0x1800, cbe_thermal_exception)
+EXC_COMMON_BEGIN(cbe_thermal_common)
+	INT_COMMON 0x1800, PACA_EXGEN, 1, 1, 1, 0, 0
+	bl	save_nvgprs
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	bl	cbe_thermal_exception
+	b	ret_from_except
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
-- 
2.22.0

