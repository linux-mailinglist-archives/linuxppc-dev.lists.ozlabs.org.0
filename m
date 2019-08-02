Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 054067F6C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:24:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RDB2LrbzDr7K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:24:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GXs2Rr9j"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNM1BpYzDqsK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:06 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n190so770105pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cY15fmHDdVsb6SoZj1b9yBJEq3yfwBCYQa1vAezDpfc=;
 b=GXs2Rr9jXgqhufIUkGeNAAGTUzK29la+UbY7pxhcJz0AxsukscZ0NKYMcjOvh+qY7M
 OWZIIPI79TWzKXGmJLRBMKeYKqcaKD3FO+s094HlXBheh4rQrv/btc65FlA73EZRMdT0
 vIx4B43yM4nz7hQMOINexV0Qbsk+/wrh/D2f/ZXd94q4ChxQUabAsnsocgfDKgSK4HXv
 KyQlfRspwLR1vT+iGj0cE+DUdA/bYaVRzXNP+WsWcoY4kGBY36kIW4kq5L4gLVDSWmev
 Gza4Ts3BZoyF+AHe2KMONFKCKc/nCj+mb9h9f0TWqmwp9r8R8DH7jZwPPUh0BjhGAH3q
 DXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cY15fmHDdVsb6SoZj1b9yBJEq3yfwBCYQa1vAezDpfc=;
 b=X/FzuvL4SYt5UfDHUvJlnOxwu0Q0o5K7eaScPLcugM26FRMygVbbQP+Cua49TV72R6
 9rnWGTiZfhRs1wtaNEkqD/K/Qn/Ke5si1QxUsHRuLjE8uY1GbhMTblzs4MCJZBOGoEYY
 vj1quGa2WAwPVO5EjQWMMarSF1qAa+SoP2hzG77EusvmRyWcfwtmU2KAnAmrPpcFsDlq
 pU3LPgzNjcBI+q/quNYU962BY1Y/7yZ1zarhUNGSsMfvf6YigXUqYcfqgZ7JRCnusqBj
 rdAAxatFV6xNkyKGUseO+k2y8Gc6M3GqU52r+oBZqfuFswjplBp6HkyYgtjyGu3VK3Bs
 d+BA==
X-Gm-Message-State: APjAAAW6arMVrN9hTAm+dyYfw1Z0rXK8KOTnoHCYS6019MCAIeSYlYLQ
 YLNDzSDzOjjkFpwojzdYZATad5Am1Ss=
X-Google-Smtp-Source: APXvYqzsHjX1zf3C+hvwPHq0ebXqVU5rHvtDXDBiVQsvJfai5+CveLhL+oUVM/Nv/1iGx0oOUUqWeA==
X-Received: by 2002:a62:6344:: with SMTP id x65mr61584800pfb.111.1564743662598; 
 Fri, 02 Aug 2019 04:01:02 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 35/44] powerpc/64s/exception: Remove pointless KVM handler
 name bifurcation
Date: Fri,  2 Aug 2019 20:57:00 +1000
Message-Id: <20190802105709.27696-36-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 102 ++++++++++++---------------
 1 file changed, 44 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3ebb39a4b9fa..908c8003f063 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -193,12 +193,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	mtctr	reg;							\
 	bctr
 
-.macro INT_KVM_HANDLER vec, hsrr, area, skip
-	.if \hsrr
-	TRAMP_KVM_BEGIN(do_kvm_H\vec\())
-	.else
-	TRAMP_KVM_BEGIN(do_kvm_\vec\())
-	.endif
+.macro INT_KVM_HANDLER name, vec, hsrr, area, skip
+	TRAMP_KVM_BEGIN(\name\()_kvm)
 	KVM_HANDLER \vec, \hsrr, \area, \skip
 .endm
 
@@ -214,20 +210,10 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define kvmppc_interrupt kvmppc_interrupt_pr
 #endif
 
-.macro KVMTEST hsrr, n
+.macro KVMTEST name, hsrr, n
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
-	.if \hsrr == EXC_HV_OR_STD
-	BEGIN_FTR_SECTION
-	bne	do_kvm_H\n
-	FTR_SECTION_ELSE
-	bne	do_kvm_\n
-	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
-	.elseif \hsrr
-	bne	do_kvm_H\n
-	.else
-	bne	do_kvm_\n
-	.endif
+	bne	\name\()_kvm
 .endm
 
 .macro KVM_HANDLER vec, hsrr, area, skip
@@ -298,9 +284,9 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 .endm
 
 #else
-.macro KVMTEST hsrr, n
+.macro KVMTEST name, hsrr, n
 .endm
-.macro KVM_HANDLER vec, hsrr, area, skip
+.macro KVM_HANDLER name, vec, hsrr, area, skip
 .endm
 #endif
 
@@ -445,7 +431,7 @@ END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
 	SAVE_CTR(r10, \area\())
 	mfcr	r9
 	.if \kvm
-		KVMTEST \hsrr \vec
+		KVMTEST \name \hsrr \vec
 	.endif
 	.if \bitmask
 		lbz	r10,PACAIRQSOFTMASK(r13)
@@ -842,7 +828,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 */
 EXC_REAL_END(system_reset, 0x100, 0x100)
 EXC_VIRT_NONE(0x4100, 0x100)
-INT_KVM_HANDLER 0x100, EXC_STD, PACA_EXNMI, 0
+INT_KVM_HANDLER system_reset 0x100, EXC_STD, PACA_EXNMI, 0
 
 #ifdef CONFIG_PPC_P7_NAP
 TRAMP_REAL_BEGIN(system_reset_idle_wake)
@@ -936,7 +922,7 @@ TRAMP_REAL_BEGIN(machine_check_fwnmi)
 	INT_HANDLER machine_check, 0x200, 0, 1, 0, EXC_STD, PACA_EXMC, 0, 1, 1, 0, 0
 #endif
 
-INT_KVM_HANDLER 0x200, EXC_STD, PACA_EXMC, 1
+INT_KVM_HANDLER machine_check 0x200, EXC_STD, PACA_EXMC, 1
 
 #define MACHINE_CHECK_HANDLER_WINDUP			\
 	/* Clear MSR_RI before setting SRR0 and SRR1. */\
@@ -1022,8 +1008,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	/*
 	 * Check if we are coming from guest. If yes, then run the normal
-	 * exception handler which will take the do_kvm_200->kvmppc_interrupt
-	 * branch to deliver the MC event to guest.
+	 * exception handler which will take the
+	 * machine_check_kvm->kvmppc_interrupt branch to deliver the MC event
+	 * to guest.
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
@@ -1163,7 +1150,7 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	INT_HANDLER data_access, 0x300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-INT_KVM_HANDLER 0x300, EXC_STD, PACA_EXGEN, 1
+INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(data_access_common)
 	/*
 	 * Here r13 points to the paca, r9 contains the saved CR,
@@ -1189,7 +1176,7 @@ EXC_REAL_END(data_access_slb, 0x380, 0x80)
 EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 	INT_HANDLER data_access_slb, 0x380, 0, 0, 1, 0, PACA_EXSLB, 1, 1, 0, 0, 0
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
-INT_KVM_HANDLER 0x380, EXC_STD, PACA_EXSLB, 1
+INT_KVM_HANDLER data_access_slb, 0x380, EXC_STD, PACA_EXSLB, 1
 EXC_COMMON_BEGIN(data_access_slb_common)
 	INT_COMMON 0x380, PACA_EXSLB, 1, 1, 0, 1, 0
 	ld	r4,_DAR(r1)
@@ -1221,7 +1208,7 @@ EXC_REAL_END(instruction_access, 0x400, 0x80)
 EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 	INT_HANDLER instruction_access, 0x400, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
-INT_KVM_HANDLER 0x400, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER instruction_access, 0x400, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(instruction_access_common)
 	INT_COMMON 0x400, PACA_EXGEN, 1, 1, 1, 2, 2
 	ld      r12,_MSR(r1)
@@ -1241,7 +1228,7 @@ EXC_REAL_END(instruction_access_slb, 0x480, 0x80)
 EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 	INT_HANDLER instruction_access_slb, 0x480, 0, 0, 1, EXC_STD, PACA_EXSLB, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
-INT_KVM_HANDLER 0x480, EXC_STD, PACA_EXSLB, 0
+INT_KVM_HANDLER instruction_access_slb, 0x480, EXC_STD, PACA_EXSLB, 0
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	INT_COMMON 0x480, PACA_EXSLB, 1, 1, 0, 2, 0
 	ld	r4,_DAR(r1)
@@ -1272,8 +1259,7 @@ EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 	INT_HANDLER hardware_interrupt, 0x500, 0, 0, 1, EXC_HV_OR_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
-INT_KVM_HANDLER 0x500, EXC_STD, PACA_EXGEN, 0
-INT_KVM_HANDLER 0x500, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER hardware_interrupt, 0x500, EXC_HV_OR_STD, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(hardware_interrupt_common, 0x500, do_IRQ)
 
 
@@ -1283,7 +1269,7 @@ EXC_REAL_END(alignment, 0x600, 0x100)
 EXC_VIRT_BEGIN(alignment, 0x4600, 0x100)
 	INT_HANDLER alignment, 0x600, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 1, 1, 0, 0
 EXC_VIRT_END(alignment, 0x4600, 0x100)
-INT_KVM_HANDLER 0x600, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER alignment, 0x600, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(alignment_common)
 	INT_COMMON 0x600, PACA_EXGEN, 1, 1, 1, 1, 1
 	bl	save_nvgprs
@@ -1298,7 +1284,7 @@ EXC_REAL_END(program_check, 0x700, 0x100)
 EXC_VIRT_BEGIN(program_check, 0x4700, 0x100)
 	INT_HANDLER program_check, 0x700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(program_check, 0x4700, 0x100)
-INT_KVM_HANDLER 0x700, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER program_check, 0x700, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(program_check_common)
 	/*
 	 * It's possible to receive a TM Bad Thing type program check with
@@ -1341,7 +1327,7 @@ EXC_REAL_END(fp_unavailable, 0x800, 0x100)
 EXC_VIRT_BEGIN(fp_unavailable, 0x4800, 0x100)
 	INT_HANDLER fp_unavailable, 0x800, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
-INT_KVM_HANDLER 0x800, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER fp_unavailable, 0x800, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(fp_unavailable_common)
 	INT_COMMON 0x800, PACA_EXGEN, 1, 1, 0, 0, 0
 	bne	1f			/* if from user, just load it up */
@@ -1378,7 +1364,7 @@ EXC_REAL_END(decrementer, 0x900, 0x80)
 EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 	INT_HANDLER decrementer, 0x900, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
-INT_KVM_HANDLER 0x900, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER decrementer, 0x900, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(decrementer_common, 0x900, timer_interrupt)
 
 
@@ -1388,7 +1374,7 @@ EXC_REAL_END(hdecrementer, 0x980, 0x80)
 EXC_VIRT_BEGIN(hdecrementer, 0x4980, 0x80)
 	INT_HANDLER hdecrementer, 0x980, 0, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(hdecrementer, 0x4980, 0x80)
-INT_KVM_HANDLER 0x980, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER hdecrementer, 0x980, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(hdecrementer_common, 0x980, hdec_interrupt)
 
 
@@ -1398,7 +1384,7 @@ EXC_REAL_END(doorbell_super, 0xa00, 0x100)
 EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 	INT_HANDLER doorbell_super, 0xa00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 0
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
-INT_KVM_HANDLER 0xa00, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER doorbell_super, 0xa00, EXC_STD, PACA_EXGEN, 0
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(doorbell_super_common, 0xa00, doorbell_exception)
 #else
@@ -1459,7 +1445,7 @@ EXC_VIRT_NONE(0x4b00, 0x100)
 	GET_PACA(r13)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
-	KVMTEST EXC_STD 0xc00 /* uses r10, branch to do_kvm_0xc00_system_call */
+	KVMTEST system_call EXC_STD 0xc00 /* uses r10, branch to system_call_kvm */
 	mfctr	r9
 #else
 	mr	r9,r13
@@ -1525,7 +1511,7 @@ EXC_VIRT_END(system_call, 0x4c00, 0x100)
 	 * ctr = orig r13
 	 * orig r10 saved in PACA
 	 */
-TRAMP_KVM_BEGIN(do_kvm_0xc00)
+TRAMP_KVM_BEGIN(system_call_kvm)
 	 /*
 	  * Save the PPR (on systems that support it) before changing to
 	  * HMT_MEDIUM. That allows the KVM code to save that value into the
@@ -1548,7 +1534,7 @@ EXC_REAL_END(single_step, 0xd00, 0x100)
 EXC_VIRT_BEGIN(single_step, 0x4d00, 0x100)
 	INT_HANDLER single_step, 0xd00, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(single_step, 0x4d00, 0x100)
-INT_KVM_HANDLER 0xd00, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER single_step, 0xd00, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON(single_step_common, 0xd00, single_step_exception)
 
 
@@ -1558,7 +1544,7 @@ EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
 	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
-INT_KVM_HANDLER 0xe00, EXC_HV, PACA_EXGEN, 1
+INT_KVM_HANDLER h_data_storage, 0xe00, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON_BEGIN(h_data_storage_common)
 	INT_COMMON 0xe00, PACA_EXGEN, 1, 1, 1, 1, 1
 	bl      save_nvgprs
@@ -1579,7 +1565,7 @@ EXC_REAL_END(h_instr_storage, 0xe20, 0x20)
 EXC_VIRT_BEGIN(h_instr_storage, 0x4e20, 0x20)
 	INT_HANDLER h_instr_storage, 0xe20, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
-INT_KVM_HANDLER 0xe20, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER h_instr_storage, 0xe20, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(h_instr_storage_common, 0xe20, unknown_exception)
 
 
@@ -1589,7 +1575,7 @@ EXC_REAL_END(emulation_assist, 0xe40, 0x20)
 EXC_VIRT_BEGIN(emulation_assist, 0x4e40, 0x20)
 	INT_HANDLER emulation_assist, 0xe40, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
-INT_KVM_HANDLER 0xe40, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER emulation_assist, 0xe40, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
 
 
@@ -1602,7 +1588,7 @@ EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
 	INT_HANDLER hmi_exception, 0xe60, 1, 1, 0, EXC_HV, PACA_EXGEN, 0, 0, 0, 0, 1
 EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 EXC_VIRT_NONE(0x4e60, 0x20)
-INT_KVM_HANDLER 0xe60, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER hmi_exception, 0xe60, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(hmi_exception_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_HSRR0		/* Save HSRR0 */
@@ -1646,7 +1632,7 @@ EXC_REAL_END(h_doorbell, 0xe80, 0x20)
 EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 	INT_HANDLER h_doorbell, 0xe80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
-INT_KVM_HANDLER 0xe80, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER h_doorbell, 0xe80, EXC_HV, PACA_EXGEN, 0
 #ifdef CONFIG_PPC_DOORBELL
 EXC_COMMON_ASYNC(h_doorbell_common, 0xe80, doorbell_exception)
 #else
@@ -1660,7 +1646,7 @@ EXC_REAL_END(h_virt_irq, 0xea0, 0x20)
 EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 	INT_HANDLER h_virt_irq, 0xea0, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, IRQS_DISABLED, 1
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
-INT_KVM_HANDLER 0xea0, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER h_virt_irq, 0xea0, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(h_virt_irq_common, 0xea0, do_IRQ)
 
 
@@ -1676,7 +1662,7 @@ EXC_REAL_END(performance_monitor, 0xf00, 0x20)
 EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 	INT_HANDLER performance_monitor, 0xf00, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, IRQS_PMI_DISABLED, 0
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
-INT_KVM_HANDLER 0xf00, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER performance_monitor, 0xf00, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_ASYNC(performance_monitor_common, 0xf00, performance_monitor_exception)
 
 
@@ -1686,7 +1672,7 @@ EXC_REAL_END(altivec_unavailable, 0xf20, 0x20)
 EXC_VIRT_BEGIN(altivec_unavailable, 0x4f20, 0x20)
 	INT_HANDLER altivec_unavailable, 0xf20, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(altivec_unavailable, 0x4f20, 0x20)
-INT_KVM_HANDLER 0xf20, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER altivec_unavailable, 0xf20, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(altivec_unavailable_common)
 	INT_COMMON 0xf20, PACA_EXGEN, 1, 1, 0, 0, 0
 #ifdef CONFIG_ALTIVEC
@@ -1727,7 +1713,7 @@ EXC_REAL_END(vsx_unavailable, 0xf40, 0x20)
 EXC_VIRT_BEGIN(vsx_unavailable, 0x4f40, 0x20)
 	INT_HANDLER vsx_unavailable, 0xf40, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(vsx_unavailable, 0x4f40, 0x20)
-INT_KVM_HANDLER 0xf40, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER vsx_unavailable, 0xf40, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(vsx_unavailable_common)
 	INT_COMMON 0xf40, PACA_EXGEN, 1, 1, 0, 0, 0
 #ifdef CONFIG_VSX
@@ -1767,7 +1753,7 @@ EXC_REAL_END(facility_unavailable, 0xf60, 0x20)
 EXC_VIRT_BEGIN(facility_unavailable, 0x4f60, 0x20)
 	INT_HANDLER facility_unavailable, 0xf60, 1, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
-INT_KVM_HANDLER 0xf60, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER facility_unavailable, 0xf60, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON(facility_unavailable_common, 0xf60, facility_unavailable_exception)
 
 
@@ -1777,7 +1763,7 @@ EXC_REAL_END(h_facility_unavailable, 0xf80, 0x20)
 EXC_VIRT_BEGIN(h_facility_unavailable, 0x4f80, 0x20)
 	INT_HANDLER h_facility_unavailable, 0xf80, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
-INT_KVM_HANDLER 0xf80, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER h_facility_unavailable, 0xf80, EXC_HV, PACA_EXGEN, 0
 EXC_COMMON(h_facility_unavailable_common, 0xf80, facility_unavailable_exception)
 
 
@@ -1798,7 +1784,7 @@ EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
 	INT_HANDLER cbe_system_error, 0x1200, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_system_error, 0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
-INT_KVM_HANDLER 0x1200, EXC_HV, PACA_EXGEN, 1
+INT_KVM_HANDLER cbe_system_error, 0x1200, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_system_error_common, 0x1200, cbe_system_error_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
@@ -1812,7 +1798,7 @@ EXC_REAL_END(instruction_breakpoint, 0x1300, 0x100)
 EXC_VIRT_BEGIN(instruction_breakpoint, 0x5300, 0x100)
 	INT_HANDLER instruction_breakpoint, 0x1300, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
-INT_KVM_HANDLER 0x1300, EXC_STD, PACA_EXGEN, 1
+INT_KVM_HANDLER instruction_breakpoint, 0x1300, EXC_STD, PACA_EXGEN, 1
 EXC_COMMON(instruction_breakpoint_common, 0x1300, instruction_breakpoint_exception)
 
 
@@ -1826,7 +1812,7 @@ EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
 	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
 	bne+	denorm_assist
 #endif
-	KVMTEST EXC_HV 0x1500
+	KVMTEST denorm_exception_hv, EXC_HV 0x1500
 	INT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV, 1
 EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
@@ -1842,7 +1828,7 @@ EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 EXC_VIRT_NONE(0x5500, 0x100)
 #endif
 
-INT_KVM_HANDLER 0x1500, EXC_HV, PACA_EXGEN, 0
+INT_KVM_HANDLER denorm_exception_hv, 0x1500, EXC_HV, PACA_EXGEN, 0
 
 #ifdef CONFIG_PPC_DENORMALISATION
 TRAMP_REAL_BEGIN(denorm_assist)
@@ -1921,7 +1907,7 @@ EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
 	INT_HANDLER cbe_maintenance, 0x1600, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_maintenance, 0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
-INT_KVM_HANDLER 0x1600, EXC_HV, PACA_EXGEN, 1
+INT_KVM_HANDLER cbe_maintenance, 0x1600, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_maintenance_common, 0x1600, cbe_maintenance_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
@@ -1935,7 +1921,7 @@ EXC_REAL_END(altivec_assist, 0x1700, 0x100)
 EXC_VIRT_BEGIN(altivec_assist, 0x5700, 0x100)
 	INT_HANDLER altivec_assist, 0x1700, 0, 0, 1, EXC_STD, PACA_EXGEN, 1, 0, 0, 0, 0
 EXC_VIRT_END(altivec_assist, 0x5700, 0x100)
-INT_KVM_HANDLER 0x1700, EXC_STD, PACA_EXGEN, 0
+INT_KVM_HANDLER altivec_assist, 0x1700, EXC_STD, PACA_EXGEN, 0
 #ifdef CONFIG_ALTIVEC
 EXC_COMMON(altivec_assist_common, 0x1700, altivec_assist_exception)
 #else
@@ -1948,7 +1934,7 @@ EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
 	INT_HANDLER cbe_thermal, 0x1800, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
 EXC_REAL_END(cbe_thermal, 0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
-INT_KVM_HANDLER 0x1800, EXC_HV, PACA_EXGEN, 1
+INT_KVM_HANDLER cbe_thermal, 0x1800, EXC_HV, PACA_EXGEN, 1
 EXC_COMMON(cbe_thermal_common, 0x1800, cbe_thermal_exception)
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
-- 
2.22.0

