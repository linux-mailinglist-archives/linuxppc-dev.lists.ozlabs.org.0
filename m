Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE17352588
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 04:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBPTL3hpxz3byx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 13:41:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YB4XL0/T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YB4XL0/T; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBPSw3tLcz3bqw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 13:41:33 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id v186so2765729pgv.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AGSE3M9BRcI1u81aOkGyZ8Bpmd6fJJfj4CJE0weqUCQ=;
 b=YB4XL0/TTydz4+oBwrBz1OBMGs2de7g9PBkdI0DALydzNF87sm5/fbSoiczEnk7BlA
 P46BOJJQbe+7RbwCJ/YhwjXzhcgeAAZhpykAggtCPZ/M6XAfSgBw5AqKVNyHRHRnqv7H
 pTKgXqQLcHGVQORY8YvRNWCh92tiaEioVkPSgOi/Jm0A2wF+IxEnaXmAEteDdDlVOJg0
 P5vfnsUsxj21wTW54ig0F/ym76DoaVqG8IB3T3brZ6i/5IGuqGAAC5YHpXdKymTZX8oF
 Oj0y9B0/xhmG4zMGrjI1Hde3NXr/nv2kTh/zvWPr/1wk7a/pKyuIPsRJO9HLdXsv01cQ
 lwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AGSE3M9BRcI1u81aOkGyZ8Bpmd6fJJfj4CJE0weqUCQ=;
 b=fcpInTOfbkGqJ6W2qMdpJb9qwCkSqlrVhyMz3vlvY4AgfoWyPnjaTba7VSUtPP60FS
 dSJ4u5QfqUs6yyb+9gDqdsQdGu3jaEiH9x2yf6pGN4OWIdOrvkIBR8kZ5+ERfVwTqURj
 jvyJQhQRmb7zXhnG/sr8sFYl0uAdszxUahLfE3N4Q46SSxp0Hnq0LvZpOjxmtSC1Ltrz
 1l3YJwmIUuE14Jt9AJPUxi/KInRRwvXyblXBVqwqEtq57/FhMcb2buGtYUgLj3Wu2bur
 b4a9vWDJZ3+f1NFqFnL/1crxhgHXRLWcemDzbLw9qQhHpBkSyVGT5IAsfEqYCVCWj0Q7
 1COg==
X-Gm-Message-State: AOAM532cM5w4YuF37j7/H+QRBj5VIKmlI7lftPkQXBbTylg4cDO6epUs
 Kz8AYZUaudOPbKm1WMWwVBJ7WRDsiqCGKw==
X-Google-Smtp-Source: ABdhPJzcfdoNuKntNWzqO2N1lajH69OywMwV+5wgMtoLlhdXvTaIX730KJ0//msaTNHSRxUSzRcheQ==
X-Received: by 2002:a63:925a:: with SMTP id s26mr9669038pgn.216.1617331291863; 
 Thu, 01 Apr 2021 19:41:31 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.159.73])
 by smtp.gmail.com with ESMTPSA id r1sm7451501pfh.153.2021.04.01.19.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 19:41:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors
Date: Fri,  2 Apr 2021 12:41:24 +1000
Message-Id: <20210402024124.545826-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Starting with ISA v3.1, LPCR[AIL] no longer controls the interrupt
mode for HV=1 interrupts. Instead, a new LPCR[HAIL] bit is defined
which behaves like AIL=3 for HV interrupts when set.

Set HAIL on bare metal to give us mmu-on interrupts and improve
performance.

This also fixes an scv bug: we don't implement scv real mode (AIL=0)
vectors because they are at an inconvenient location, so we just
disable scv support when AIL can not be set. However powernv assumes
that LPCR[AIL] will enable AIL mode so it enables scv support despite
HV interrupts being AIL=0, which causes scv interrupts to go off into
the weeds.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/reg.h |  1 +
 arch/powerpc/kernel/setup_64.c | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1be20bc8dce2..9086a2644c89 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -441,6 +441,7 @@
 #define   LPCR_VRMA_LP1		ASM_CONST(0x0000800000000000)
 #define   LPCR_RMLS		0x1C000000	/* Implementation dependent RMO limit sel */
 #define   LPCR_RMLS_SH		26
+#define   LPCR_HAIL		ASM_CONST(0x0000000004000000)   /* HV AIL (ISAv3.1) */
 #define   LPCR_ILE		ASM_CONST(0x0000000002000000)   /* !HV irqs set MSR:LE */
 #define   LPCR_AIL		ASM_CONST(0x0000000001800000)	/* Alternate interrupt location */
 #define   LPCR_AIL_0		ASM_CONST(0x0000000000000000)	/* MMU off exception offset 0x0 */
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 04a31586f760..671192afcdfd 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -233,10 +233,23 @@ static void cpu_ready_for_interrupts(void)
 	 * If we are not in hypervisor mode the job is done once for
 	 * the whole partition in configure_exceptions().
 	 */
-	if (cpu_has_feature(CPU_FTR_HVMODE) &&
-	    cpu_has_feature(CPU_FTR_ARCH_207S)) {
+	if (cpu_has_feature(CPU_FTR_HVMODE)) {
 		unsigned long lpcr = mfspr(SPRN_LPCR);
-		mtspr(SPRN_LPCR, lpcr | LPCR_AIL_3);
+		unsigned long new_lpcr = lpcr;
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			/* P10 DD1 does not have HAIL */
+			if (pvr_version_is(PVR_POWER10) &&
+					(mfspr(SPRN_PVR) & 0xf00) == 0x100)
+				new_lpcr |= LPCR_AIL_3;
+			else
+				new_lpcr |= LPCR_HAIL;
+		} else if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
+			new_lpcr |= LPCR_AIL_3;
+		}
+
+		if (new_lpcr != lpcr)
+			mtspr(SPRN_LPCR, new_lpcr);
 	}
 
 	/*
-- 
2.23.0

