Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CB2F829E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:37:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHT0D2fSqzDsng
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:37:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iOpZK9xw; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzC18fXzDshL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:35 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b8so4978419plh.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itgindI9KjNtEaDV+stxWHGH8NPZLd/HkcQjDKROgX8=;
 b=iOpZK9xwJDNdon1UX2uQlgJ9m4WmQOQwmhxfGtKuTMVAxuwYIllp9gBjN2pQtr0UJX
 SuCRbsx4DtDfAMaxAyC4w1C1rRrEA9z8GIU6LJzJLrMCLxvsH+darqpCxy3Cz6/sKk5L
 NzwDJPRovdbQd79uQOOvkHZDPS+Me9qowrXNEq/zedAa5oWIkud7qjmZN1YK1l2Kcv1Y
 FW/+FuPVigjgDs+u0Q/TyicgxzlPwET8emNKB/ip224EG6Jiw8xrABEEW+5Rlt4sqe8n
 feqFZkwwEXeJ1MyjHOcAAWyYXe1VqggIDKkbUaYCZ3w7V1fBXu3QlCHRhJDGwkJOcqdF
 ehyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itgindI9KjNtEaDV+stxWHGH8NPZLd/HkcQjDKROgX8=;
 b=tKp6IISnilP6wdIeOGU/3ejUlbM+ezIEkHOOV6NMyaCxoxLinygLzstr9Dnz37ROSR
 MK/YPL9V7e4LMexxf+efqRRnDZta9A16a+uljB/HtJLpMUNBkdG1INVhdAb9x2g/0SGj
 iZ3yFaBoU4EB9ECf8i3L7v2GeZCI9LLQD6wtsePajsZEuW2lMcRY54ge+qE19I6QIJPF
 YW4LCftROZNlDnbt/XvTQXPd9DO3haOq758FoEA+01kubl77EiEf8wbJ60+ztgtIT7N0
 jdz+OTbW2Mg64EE54V5u3Zn6jdAZdSdUkpt30Fbj6qw1IzrYOlZN7k9Hx0oZduxg88/c
 7TRQ==
X-Gm-Message-State: AOAM533+YiICW8Xw6JLhZxAKeTqf2FUhlgqGFe3vnwlmvQAvJXsjelub
 EUplzAKfqFS7tWVyty10vFePYlbf5D4=
X-Google-Smtp-Source: ABdhPJwKBwglMCn3GiQMvqp9fNBOVAhMWBUES7dNeLXzDWNIdXq2t81Lmv5IVeNpwdeUKOPhNqEcmg==
X-Received: by 2002:a17:90a:4083:: with SMTP id
 l3mr11630707pjg.109.1610729491168; 
 Fri, 15 Jan 2021 08:51:31 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 18/39] powerpc: DebugException remove args
Date: Sat, 16 Jan 2021 02:49:51 +1000
Message-Id: <20210115165012.1260253-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

Like other interrupt handler conversions, switch to getting registers
from the pt_regs argument.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 2 --
 arch/powerpc/kernel/head_40x.S       | 1 +
 arch/powerpc/kernel/head_booke.h     | 2 ++
 arch/powerpc/kernel/traps.c          | 4 +++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 52421042a020..003999c7836c 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -791,7 +791,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	EXCEPTION_COMMON_CRIT(0xd00)
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
 	bl	save_nvgprs
@@ -864,7 +863,6 @@ kernel_dbg_exc:
 	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
 	bl	save_nvgprs
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 3c5577ac4dc8..24724a7dad49 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -476,6 +476,7 @@ _ENTRY(saved_ksp_limit)
 
 	/* continue normal handling for a critical exception... */
 2:	mfspr	r4,SPRN_DBSR
+	stw	r4,_ESR(r11)		/* DebugException takes DBSR in _ESR */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, \
 		(MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 0fbdacc7fab7..bf33af714d11 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -406,6 +406,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 									      \
 	/* continue normal handling for a debug exception... */		      \
 2:	mfspr	r4,SPRN_DBSR;						      \
+	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_TEMPLATE(DebugException, 0x2008, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), debug_transfer_to_handler, ret_from_debug_exc)
 
@@ -459,6 +460,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 									      \
 	/* continue normal handling for a critical exception... */	      \
 2:	mfspr	r4,SPRN_DBSR;						      \
+	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), crit_transfer_to_handler, ret_from_crit_exc)
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1af52a4bce1f..6691774fe1fb 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2000,8 +2000,10 @@ static void handle_debug(struct pt_regs *regs, unsigned long debug_status)
 		mtspr(SPRN_DBCR0, current->thread.debug.dbcr0);
 }
 
-void DebugException(struct pt_regs *regs, unsigned long debug_status)
+void DebugException(struct pt_regs *regs)
 {
+	unsigned long debug_status = regs->dsisr;
+
 	current->thread.debug.dbsr = debug_status;
 
 	/* Hack alert: On BookE, Branch Taken stops on the branch itself, while
-- 
2.23.0

