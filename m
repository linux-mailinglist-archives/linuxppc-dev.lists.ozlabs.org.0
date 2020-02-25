Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D516ED10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 18:51:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rmh36fy6zDqPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 04:51:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lPoyXWSK; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmR30gMKzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:39:58 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id ay11so90649plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XbyyUM3AJoQNA0UeeQy7MEXJUijsNOIyHugy3G9iRV4=;
 b=lPoyXWSKeLCwWlPzE//loLjfH0r/qJwnrlzI41LSfKqHvscDKoAcBKUUPXBcSs0KkB
 LlzMDNhSYPgPJtVpKH4x2Anpsg+tkW7AqBOgevKxIlbT7Wzsi7yIJF5FO6Bsl4Q2bypq
 D5xDpY5boRvSIkHSPbh3F7z+bwI+yHm4Cgks2JU72nuEgZFClIlz/9tepjpZBQhaCsGl
 IQp40vIzNg6Ng/8nCmg4oqHGFuinT88uON0n+8ix079oBqLHngFsGFd2F/ysaa6zPk9t
 wui/X/fDKbB7MLgI5MBvNbz9bdWbL1FwUytFQmZ3RMdptjGK5/oC7fOcOKr9ceRqdmir
 8+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XbyyUM3AJoQNA0UeeQy7MEXJUijsNOIyHugy3G9iRV4=;
 b=UoflHGvQVFKZEhMZSqHNl/dUM8prB3zo8m9FjvbMv9GDGJ/kyvx9wzH+OY2/K4EL8r
 8pgFKyGinCYhyttpe0YP0FdFR4yh6/VeaMOLQffTjPqwoEpLZar/iv/JLtxGfeuxckSU
 a9Vjuw9iqZYG8DntGqKlLiQlp6QZJ46pXSQOI/xQq0SKisg0Oq26OV+xUUhrsUh5QkdN
 UeYz0rJC8Apodx3EyOnhxyuJO70PuCMSiPpfHoplYFtWDlvcyZ2h+Pv0OmEf5bH51hMG
 lf9hvMekXDBeV9BP8CW/+RvTEj2LCZ985YhDkQhEwvJiZ1Bd+V7qBwA/CRhzuVdZSbEy
 RLHQ==
X-Gm-Message-State: APjAAAUgKVf/Q4J7+RsQvEqA5PYRPNN+cvYsDOLrJlR0sXN+DzFCmf2l
 G8qm1+xVpFvamHICj7mr+D93q65x
X-Google-Smtp-Source: APXvYqyYTdkFJgp8eGfgV6QJw0D+1B95yb1FyhbKatbxtVRMjpNncCo1hHiAxDJlXHkirZOd4vyPQw==
X-Received: by 2002:a17:90a:c301:: with SMTP id g1mr103144pjt.88.1582652396028; 
 Tue, 25 Feb 2020 09:39:56 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:39:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/32] powerpc/64s/exception: Expand EXC_COMMON and
 EXC_COMMON_ASYNC macros
Date: Wed, 26 Feb 2020 03:35:13 +1000
Message-Id: <20200225173541.1549955-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
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
index da3c22eea72d..0f1da3099c28 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -757,28 +757,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
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
@@ -1349,7 +1327,13 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	INT_HANDLER hardware_interrupt, 0x500, virt=1, hsrr=EXC_HV_OR_STD, bitmask=IRQS_DISABLED, kvm=1
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
@@ -1455,7 +1439,13 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	INT_HANDLER decrementer, 0x900, virt=1, bitmask=IRQS_DISABLED
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
@@ -1465,7 +1455,12 @@ EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	INT_HANDLER hdecrementer, 0x980, virt=1, hsrr=EXC_HV, kvm=1
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
@@ -1475,11 +1470,17 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	INT_HANDLER doorbell_super, 0xa00, virt=1, bitmask=IRQS_DISABLED
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
@@ -1610,7 +1611,12 @@ EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	INT_HANDLER single_step, 0xd00, virt=1
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
@@ -1641,7 +1647,12 @@ EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	INT_HANDLER h_instr_storage, 0xe20, ool=1, virt=1, hsrr=EXC_HV, kvm=1
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
@@ -1651,7 +1662,12 @@ EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	INT_HANDLER emulation_assist, 0xe40, ool=1, virt=1, hsrr=EXC_HV, kvm=1
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
@@ -1708,11 +1724,17 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	INT_HANDLER h_doorbell, 0xe80, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
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
@@ -1722,7 +1744,13 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	INT_HANDLER h_virt_irq, 0xea0, ool=1, virt=1, hsrr=EXC_HV, bitmask=IRQS_DISABLED, kvm=1
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
@@ -1738,7 +1766,13 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	INT_HANDLER performance_monitor, 0xf00, ool=1, virt=1, bitmask=IRQS_PMI_DISABLED
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
@@ -1829,7 +1863,12 @@ EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	INT_HANDLER facility_unavailable, 0xf60, ool=1, virt=1
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
@@ -1839,7 +1878,12 @@ EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	INT_HANDLER h_facility_unavailable, 0xf80, ool=1, virt=1, hsrr=EXC_HV, kvm=1
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
@@ -1860,7 +1904,12 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
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
@@ -1874,7 +1923,12 @@ EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	INT_HANDLER instruction_breakpoint, 0x1300, virt=1
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
@@ -1974,7 +2028,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
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
@@ -1983,7 +2042,12 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
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
@@ -1997,11 +2061,16 @@ EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	INT_HANDLER altivec_assist, 0x1700, virt=1
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
@@ -2010,7 +2079,12 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
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
2.23.0

