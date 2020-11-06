Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EACF2A8E7F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 05:55:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS7P05qtmzDrFH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 15:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tTWsEdEF; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS7MP03NBzDr6P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 15:53:50 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so96931plq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 20:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRftrkL/jJqs1mHTuiclABYaqtYMMZ47EoJz30mOZHI=;
 b=tTWsEdEFIY+PBWODdqr0Yo3x0WKDSM2vPxmKlT/+UtajzucMsdNhQC24T59GtamsVi
 9nLuGdmD98EktYw7tOhwO2797fZo/Sqf/TqT4VyPrlzcJXduPO77u4Ytr9WW1CfNIO3l
 1i0zqHgKBPtj6Q4erzMy5PtxRny5pmD6oppmSQ+bYjHCOLL499DZ9x2tJVIscBdMBflX
 zfPUWkhcKAQsYUj8iE5yipPFINPjSgsaHudVF7GGPgBuinkbJjFTQExOVUsBuyr//ZPt
 sfp5ume21wFd1HYb7aasSCjlP3iXyppI0AuIeBYtYjwFrkgoZadsQAO2QKoVkKXfBQOT
 PDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gRftrkL/jJqs1mHTuiclABYaqtYMMZ47EoJz30mOZHI=;
 b=COh2/jPSTH4KkX8PO1HejZxkfE6+3ppBdbCqMrANnBuJ1ZxptwgPEyNIC50jueQkVR
 LCd3J3fOjtr8YFtosK6trWRHghlBCEZHeEZGXUCf6YmClSQ2aJ2xF2Gxo+LOw5cJgdC0
 nzTG6Uw2soyLfk04pfeVEywh91qxXvj1J4gBte/kBRlzBdBDLFwexd3PqmdGXNqa/vR4
 eG20heA97f6O/GWE0b3kmGKyjx6lHlSgdPZfyWUunAIE0eVPh/pmJewuQHQvUSARwzjj
 okrlc8bj0xuv1d9Raq09YBXq1+xD09YQrhfKUyGm9mSSV0SI7pvfRuNAxD2Ik09bw1k2
 7GBQ==
X-Gm-Message-State: AOAM530BpPN0Y/KXL7JqQPNdWM2DLXoMvA4ALDf6ZuKbu4p1EGw76mcC
 NzRuNAYpsfI51CBin//WwXNf5ZrVcOg=
X-Google-Smtp-Source: ABdhPJxz7IRFBrlgndg/y8WZEQE+MbOEwzSb0Az+uWdYLlOmIPpJV9y4LteOf06iepJzYz0WkjZPOQ==
X-Received: by 2002:a17:902:324:b029:d6:ba15:90bc with SMTP id
 33-20020a1709020324b02900d6ba1590bcmr395627pld.29.1604638426856; 
 Thu, 05 Nov 2020 20:53:46 -0800 (PST)
Received: from bobo.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n7sm59773pgk.70.2020.11.05.20.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 20:53:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Remove MSR[ISF] bit
Date: Fri,  6 Nov 2020 14:53:40 +1000
Message-Id: <20201106045340.1935841-1-npiggin@gmail.com>
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

No supported processor implements this mode. Setting the bit in
MSR values can be a bit confusing (and would prevent the bit from
ever being reused). Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/reg.h | 5 +----
 arch/powerpc/kernel/entry_64.S | 2 +-
 arch/powerpc/kernel/head_64.S  | 3 +--
 arch/powerpc/kvm/book3s_pr.c   | 2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index f877a576b338..8885fbf4285b 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -29,7 +29,6 @@
 #include <asm/reg_8xx.h>
 
 #define MSR_SF_LG	63              /* Enable 64 bit mode */
-#define MSR_ISF_LG	61              /* Interrupt 64b mode valid on 630 */
 #define MSR_HV_LG 	60              /* Hypervisor state */
 #define MSR_TS_T_LG	34		/* Trans Mem state: Transactional */
 #define MSR_TS_S_LG	33		/* Trans Mem state: Suspended */
@@ -69,13 +68,11 @@
 
 #ifdef CONFIG_PPC64
 #define MSR_SF		__MASK(MSR_SF_LG)	/* Enable 64 bit mode */
-#define MSR_ISF		__MASK(MSR_ISF_LG)	/* Interrupt 64b mode valid on 630 */
 #define MSR_HV 		__MASK(MSR_HV_LG)	/* Hypervisor state */
 #define MSR_S		__MASK(MSR_S_LG)	/* Secure state */
 #else
 /* so tests for these bits fail on 32-bit */
 #define MSR_SF		0
-#define MSR_ISF		0
 #define MSR_HV		0
 #define MSR_S		0
 #endif
@@ -134,7 +131,7 @@
 #define MSR_64BIT	MSR_SF
 
 /* Server variant */
-#define __MSR		(MSR_ME | MSR_RI | MSR_IR | MSR_DR | MSR_ISF |MSR_HV)
+#define __MSR		(MSR_ME | MSR_RI | MSR_IR | MSR_DR | MSR_HV)
 #ifdef __BIG_ENDIAN__
 #define MSR_		__MSR
 #define MSR_IDLE	(MSR_ME | MSR_SF | MSR_HV)
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 2f3846192ec7..479fb58844fa 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -967,7 +967,7 @@ _GLOBAL(enter_prom)
 	mtsrr1	r11
 	rfi
 #else /* CONFIG_PPC_BOOK3E */
-	LOAD_REG_IMMEDIATE(r12, MSR_SF | MSR_ISF | MSR_LE)
+	LOAD_REG_IMMEDIATE(r12, MSR_SF | MSR_LE)
 	andc	r11,r11,r12
 	mtsrr1	r11
 	RFI_TO_KERNEL
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 1510b2a56669..4e2591cb4bd1 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -865,8 +865,7 @@ enable_64b_mode:
 	oris	r11,r11,0x8000		/* CM bit set, we'll set ICM later */
 	mtmsr	r11
 #else /* CONFIG_PPC_BOOK3E */
-	li	r12,(MSR_64BIT | MSR_ISF)@highest
-	sldi	r12,r12,48
+	LOAD_REG_IMMEDIATE(r12, MSR_64BIT)
 	or	r11,r11,r12
 	mtmsrd	r11
 	isync
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index b1fefa63e125..913944dc3620 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -239,7 +239,7 @@ static void kvmppc_recalc_shadow_msr(struct kvm_vcpu *vcpu)
 	smsr |= (guest_msr & vcpu->arch.guest_owned_ext);
 	/* 64-bit Process MSR values */
 #ifdef CONFIG_PPC_BOOK3S_64
-	smsr |= MSR_ISF | MSR_HV;
+	smsr |= MSR_HV;
 #endif
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
-- 
2.23.0

