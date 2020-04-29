Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD691BD574
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:13:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqVG2T9yzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:13:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iSV1SdhK; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq85419WzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:57:25 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id s10so514710plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZIGOLdv/hlCS4eMIgjAj5AL156Amme53dxOOAa1xQGk=;
 b=iSV1SdhK2mOs3uQreaLyzrSNHsFqFC/8BRazlUVJWev8hIt/W+IRU5woWsvLHdFBxN
 VbUlseIo7zH/RKvWLDe7LAYI+LxxKo3cijm9dsvU3FfP7UjMSMJumLDBGIC6mAzJKWQS
 CLD9hjjPn/NOgOwdLLtdooE5TmIPgE6QQKrGBSbQrQ+z/XfaE2GCBGgl1jq4UW3F/mN0
 K5zvTuSh06DUw+4HtmiAuTQmFjp+nzpQz60bxkPxQiB8YyifHhiGmUVOdXz6S07nKgJO
 XMLyt+1pTIHRnKvDo0dvrleY4TAs9df7VaQEFwY5hSlu9lUZ81i5V1uJPRGNmhb/Xm4r
 mqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIGOLdv/hlCS4eMIgjAj5AL156Amme53dxOOAa1xQGk=;
 b=dKD6FN0IGOft5x4Naf4evrC4vyEyp/ktSR+Z81mHuP/9wR5noLCnpdXr3+yRc1PQh+
 biGX9bt4PwhYITmKOIFEL0+WUKpdVaLzWoKbk75z0Fg/WTC0d7590x5luPN/Eldhb7Ez
 Gn726+/NSglCSic77/h49ehZxDw2qOD548pB66q+kGS7Rgx8B62+2OVitEjDXxWOX2o0
 NgFrg/y6SVPX0Tpg2E39eqD+Pq2whc9ssaqWbIaDBeNeELZU6FOjMNYK9qyFWfhTwOPU
 zo1WrFO/BbcNKAKFG3eucqxshuqJTePjCULnIe8IQ6IbRW8yaCgoDsM5EZQIihDaZcjy
 wAMw==
X-Gm-Message-State: AGi0PuZpZpqaC3SBuAHqg2RBkIeIHZeJ+bYueCW791JQvQ37qpnke/yr
 td0X5Fspv6jg7KVhXm9DZeMua8Cz
X-Google-Smtp-Source: APiQypIVYJ3HA53EdAz224hwpUb03TXzAFB7bdl0Sppea8rwIVcvQTL4dXZscKwYTT+EY4opyxSRnw==
X-Received: by 2002:a17:90a:2281:: with SMTP id
 s1mr1481722pjc.68.1588143442536; 
 Tue, 28 Apr 2020 23:57:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id a26sm254660pgd.68.2020.04.28.23.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:57:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64s/kuap: conditionally restore AMR in
 kuap_restore_amr asm
Date: Wed, 29 Apr 2020 16:56:54 +1000
Message-Id: <20200429065654.1677541-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
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

