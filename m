Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D133C914
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:09:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrF83ZBSz3bwq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kbciBbot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kbciBbot; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr7H6JBVz30HR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:43 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id t37so10482302pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bPlVt+pEAnxLYsc4En+IM+DZoJ/EnNRJH7icZbm6Ye8=;
 b=kbciBbotFO7EL1sKZqi63F/xwn3Au75kxvFwiAc0c/5PQx3mQArQAbWL0oolteu27t
 4Vd0Y2S4T7R2cTSRvh/UJOnjVjbjcEoVAHe2uLkc5hqUSMcNihrKQfsm45WDQsaFXIIR
 l5iks+vmzUgGZO3eD36Rf9/m6YuqcUnr5wR482F6kRK5rLnbJjy54iZBeT9vb4qjB83+
 bPUIEv5PZxZ29m4IxETLFALZxBueKD0LLIn94LmiElO94eo+cFJFdIs0MS2voX2k0irD
 FFA0uuVlxUHFEBEwGfT5c0k2e1kFfTC0QudTc0Dj/HuD41eIG11Km0s1W4na3PbFw/kR
 FqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bPlVt+pEAnxLYsc4En+IM+DZoJ/EnNRJH7icZbm6Ye8=;
 b=WIfwlMNWz/d8WldsUuCqtOISqNRT/14s2W7N7EQznZKBlbBJm/sphmMTkipcfM5yir
 F5IETC4S0Wsd4kbIVBk8BIixnShxhSvUOWYzpAONqNlkANr+Bm3H+bxh66KWCOlujjrU
 ktklzYTIpVw7vfjcBvs+zCnJ0yjv2foNxgOHZi2JE/HBmzMl/jKuk2LQ5EXEGfbCHSfi
 SMPYlkjBSRv9Wf91CMXDGMjUWAwNMU8msI297NeU2bkPMPxPtb/zd3m/laaQFQTXxBnL
 UAzezsZUQxTO7EZikTAr1rOJspMGVsemCkuAizyktLKzaBSakeNHjXirrJeQsD2MvDCx
 JKMA==
X-Gm-Message-State: AOAM530sApUa3UYM8EyUfjSpFQeB5jX2DF4dq5/R5siBAFzqut/LBXpS
 +mkoyilkauCkWfJKpM5q8g4Vq932cvw=
X-Google-Smtp-Source: ABdhPJw+1GS8ID25Rg81TFrdulNYCBEowFJYASHTJihUp0xVeANGJdC5NUlfFgirWTPFPZnuqvG6hg==
X-Received: by 2002:a63:460e:: with SMTP id t14mr1008297pga.230.1615845881094; 
 Mon, 15 Mar 2021 15:04:41 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/14] powerpc/64e: Remove PPR from pt_regs
Date: Tue, 16 Mar 2021 08:03:59 +1000
Message-Id: <20210315220402.260594-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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

64e does not have a PPR register.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h  | 4 +++-
 arch/powerpc/kernel/asm-offsets.c  | 2 ++
 arch/powerpc/kernel/interrupt_64.S | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index d37787a74342..a59bdc020195 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -50,8 +50,10 @@ struct pt_regs
 
 	union {
 		struct {
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
 			unsigned long ppr;
+#endif
+#ifdef CONFIG_PPC64
 			unsigned long exit_result;
 #endif
 			union {
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 44d557dacc77..0b7828eff7ff 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -352,7 +352,9 @@ int main(void)
 	STACK_PT_REGS_OFFSET(_ESR, dsisr);
 #else /* CONFIG_PPC64 */
 	STACK_PT_REGS_OFFSET(SOFTE, softe);
+#ifdef CONFIG_PPC_BOOK3S_64
 	STACK_PT_REGS_OFFSET(_PPR, ppr);
+#endif
 #endif /* CONFIG_PPC64 */
 
 #ifdef CONFIG_PPC_PKEY
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 2b68b1dea8bf..f28f41a1a85a 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -532,12 +532,12 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 	lbz	r4,PACAIRQSOFTMASK(r13)
 	tdnei	r4,IRQS_ENABLED
 
+#ifdef CONFIG_PPC_BOOK3S
 BEGIN_FTR_SECTION
 	ld	r10,_PPR(r1)
 	mtspr	SPRN_PPR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
-#ifdef CONFIG_PPC_BOOK3S
 	.ifc \srr,srr
 	lbz	r4,PACASRR_VALID(r13)
 	.else
-- 
2.23.0

