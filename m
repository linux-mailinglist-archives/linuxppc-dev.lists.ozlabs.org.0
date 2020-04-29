Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA881BD4BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:40:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpmB17TMzDr5V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:40:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WOqa7G8E; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSV2WdSzDr31
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:34 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id x2so616645pfx.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZIGOLdv/hlCS4eMIgjAj5AL156Amme53dxOOAa1xQGk=;
 b=WOqa7G8E8lZg+gowd8hLiwPqbQfJmZpf6jzq7xAdNuAWRYEG+JwM8fMhOxF67nt0qp
 YZ+P0owgc23GZW1QdHX8sUL0AlmOW4anFyZmMdLiuNsh+SmUOTscrqCWVfEC6n62/K4q
 3On+fgjOQympn+gK5rq45tip/RxKIXnWr2H69xybmkaIj2DimTE1NX6fueqbOygDy/0W
 NHa9pv/xvUWByLGTC4tYUTrqiqiSFU41yfIJrT2tN5+HNRRtP4hoLQjiS0lM+SC5Dv7m
 dVzaLSm2BLDrLPhbdekJokL2vPFbb++32LNE8V53z2urSllY0QylFYehPkFWMSN+fwIb
 WigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIGOLdv/hlCS4eMIgjAj5AL156Amme53dxOOAa1xQGk=;
 b=fGnAvAuK6WK/+mtUF0roXxlDRy7AcLRzGF5vZkShtTz49hF4rCvdC2M6bB8p+ZcLME
 c8gtixwO5m+rU07whoAYOAS07ZoR57FBFmnl6sS2ClhI8E5cWAuIairEiKWvbOSU/k54
 DbLZKz6oVsjIOKF3TqcArgLlS2szk4hYVidT/6JC1qocLrLXCiqgOBs3pLJn0bhmBA1b
 jaFW9qDCLb8JkgbzeHC8ToKYCiobPks/SHvlQ748YFQ45YWMHNbFE32jVYQVVjXdXQby
 /dNxUkFVB020n+ZJKyFF3zjWwxWbWTyYxDTllNrMjtc3xufui+uQQGQzOMZr7ywnGuNj
 YIRg==
X-Gm-Message-State: AGi0PuZ9zUc9pxKKg6RM9RxTPpxFAdSI4Q5TozJu0ZQP27mn6/Ep1TAg
 P5j7mu8wQisYN5ugkxyC9+OH9E9a
X-Google-Smtp-Source: APiQypL+nEaoTvTrSERd4oWsfHPYuhHkUNxD+gSjrNgJ4IaIPZ/CzEWnyKA8jKElyGiDxULLXuuOig==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr32875258pgk.429.1588141590225; 
 Tue, 28 Apr 2020 23:26:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64/kuap: conditionally restore AMR in
 kuap_restore_amr asm
Date: Wed, 29 Apr 2020 16:26:06 +1000
Message-Id: <20200429062607.1675792-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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

Similar to the C code change, make the AMR restore conditional on
whether the register has changed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 10 +++++++---
 arch/powerpc/kernel/entry_64.S                 |  8 ++++----
 arch/powerpc/kernel/exceptions-64s.S           |  4 ++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index ec8970958a26..e82df54f5681 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -12,13 +12,17 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuap_restore_amr	gpr
+.macro kuap_restore_amr	gpr1, gpr2
 #ifdef CONFIG_PPC_KUAP
 	BEGIN_MMU_FTR_SECTION_NESTED(67)
-	ld	\gpr, STACK_REGS_KUAP(r1)
+	mfspr	\gpr1, SPRN_AMR
+	ld	\gpr2, STACK_REGS_KUAP(r1)
+	cmpd	\gpr1, \gpr2
+	beq	998f
 	isync
-	mtspr	SPRN_AMR, \gpr
+	mtspr	SPRN_AMR, \gpr2
 	/* No isync required, see kuap_restore_amr() */
+998:
 	END_MMU_FTR_SECTION_NESTED_IFSET(MMU_FTR_RADIX_KUAP, 67)
 #endif
 .endm
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index b3c9f15089b6..9d49338e0c85 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -479,11 +479,11 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 fast_interrupt_return:
 _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
-	ld	r4,_MSR(r1)
-	andi.	r0,r4,MSR_PR
+	ld	r5,_MSR(r1)
+	andi.	r0,r5,MSR_PR
 	bne	.Lfast_user_interrupt_return
-	kuap_restore_amr r3
-	andi.	r0,r4,MSR_RI
+	kuap_restore_amr r3, r4
+	andi.	r0,r5,MSR_RI
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return
 	addi	r3,r1,STACK_FRAME_OVERHEAD
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b0ad930cbae5..ef4a90212664 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -971,7 +971,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r10
+	kuap_restore_amr r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
@@ -2757,7 +2757,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	ld	r10,SOFTE(r1)
 	stb	r10,PACAIRQSOFTMASK(r13)
 
-	kuap_restore_amr r10
+	kuap_restore_amr r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
 
-- 
2.23.0

