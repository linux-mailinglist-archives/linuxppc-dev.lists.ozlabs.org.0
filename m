Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D534C749
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:14:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ts3532HLzDq60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JIE/+uBy"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqm22mK5zDqv4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:02 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c85so982018pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVN9aN5qqBAWEgJvASFHinG7PxPY97JGSreoYjJWQQ0=;
 b=JIE/+uByTMwR+hcCmcK8eo7JLXGYltrXB+o0PNsQDwupEweRlk9tT9TpNDmvcXHMky
 2vJ9qNm8zLfFrffCTa/qK6cVfGpNRTbw6cZoSGQK7e4PqZ5jvkUhfCSDghdue9Qq9AG5
 Lnbym3KKBFsrYIdR0ZEi1PCBQ4wtU4OVZVUz6OpEKu+9fvzCnCA3b0lb9VmJWpZvrfFm
 03Rvdr6qL3x98LQ2gg6uG5MBDhIx7unbYnRdPycLEZtmpDpvTBVZf5XEYMkEPZe3DYWq
 GCG+Af0zdgUpxw24mMR/8dSB7+glw5BJaFA0ekpdeyupnz4WfTcItPV/BqMS+sG6eUVk
 JfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVN9aN5qqBAWEgJvASFHinG7PxPY97JGSreoYjJWQQ0=;
 b=R0lTUqq3U1b8dm3uH2DZPjJ02SYliZXfrgxvaBVRLJ3yPLahUoGY5eUvnDaWJMoLKN
 2T/jkyYBm/S1l2UPvrwRkU/+72tc5nV+nTAnjRHKD8pO/fseeE2werVuEIyDR1gZtyO0
 CAMuNEdRf0LntoTx7vsZR475fWKWv0HvlFDgbIZiQN8SvAMz3X8orJ1Q8XlNFfsy2vyL
 BVMB1i8KRuOtaX5fUglBbar0eiQ93Mics4N0Hq3kDYgbuA5TcKUWvkvb97YkdiEeF0DA
 xYjK+iLVJpcRqZe9+TPBZm1v7gI5+VxfbIsVcwVGfmFIVkOtpOC2w+K6NEbHEO31RPZB
 rE/Q==
X-Gm-Message-State: APjAAAWbd0dR91xO/Y7yAXPIpPtgAQkr2gtVnTS31/t+IizIDngAC3DW
 GSIJyMidHOZnRhIA0JhW2qMkbKVG
X-Google-Smtp-Source: APXvYqwi+zTcntXM1DZlX+9ZrAMVs0s910FSW4fS6UXL4XmQFlLHEerjXkfHiXWUR+y9KhDAMDe3ug==
X-Received: by 2002:a62:2d3:: with SMTP id 202mr54892078pfc.131.1561007759678; 
 Wed, 19 Jun 2019 22:15:59 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 28/52] powerpc/64s/exception: clean up system call entry
Date: Thu, 20 Jun 2019 15:14:35 +1000
Message-Id: <20190620051459.29573-29-npiggin@gmail.com>
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

syscall / hcall entry unnecessarily differs between KVM and non-KVM
builds. Move the SMT priority instruction to the same location
(after INTERRUPT_TO_KERNEL).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d6de0ce1f0f2..62f7e9ad23c6 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1635,10 +1635,8 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
 	KVMTEST EXC_STD 0xc00 /* uses r10, branch to do_kvm_0xc00_system_call */
-	HMT_MEDIUM
 	mfctr	r9
 #else
-	HMT_MEDIUM
 	mr	r9,r13
 	GET_PACA(r13)
 	INTERRUPT_TO_KERNEL
@@ -1650,11 +1648,13 @@ BEGIN_FTR_SECTION
 	beq-	1f
 END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 #endif
-	/* We reach here with PACA in r13, r13 in r9, and HMT_MEDIUM. */
-
-	.if \real
+	/* We reach here with PACA in r13, r13 in r9. */
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
+
+	HMT_MEDIUM
+
+	.if \real
 	__LOAD_HANDLER(r10, system_call_common)
 	mtspr	SPRN_SRR0,r10
 	ld	r10,PACAKMSR(r13)
@@ -1662,24 +1662,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 	.else
+	li	r10,MSR_RI
+	mtmsrd 	r10,1			/* Set RI (EE=0) */
 #ifdef CONFIG_RELOCATABLE
-	/*
-	 * We can't branch directly so we do it via the CTR which
-	 * is volatile across system calls.
-	 */
 	__LOAD_HANDLER(r10, system_call_common)
 	mtctr	r10
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 	bctr
 #else
-	/* We can branch directly */
-	mfspr	r11,SPRN_SRR0
-	mfspr	r12,SPRN_SRR1
-	li	r10,MSR_RI
-	mtmsrd 	r10,1			/* Set RI (EE=0) */
 	b	system_call_common
 #endif
 	.endif
-- 
2.20.1

