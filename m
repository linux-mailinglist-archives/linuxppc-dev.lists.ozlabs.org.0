Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC63AB7EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RQb5Xr9z3cHC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pPPIPFQ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pPPIPFQ8; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPH6hRMz3bsQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:31 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id e33so5319991pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7XPIQ+l3SIhNa8WG2Be5WvFHOHgiiEe1pR3NC7Fu+3w=;
 b=pPPIPFQ8k314DgEPM3G2TSiDag3lVcAMupg+6X70lNxryW9IdXLJGs8GoO3UtRI3SW
 Wj0LLmxjec0qgO7I9kelMd5Br0Y+FishZZRORWbYjUjx87MxiCq8KY9x9Ghez5wpuocd
 z56UrxnS7fZElQy5CQsYREs73BWkz0ttvgcIX4glvUSKJ3erdqk4WiPrMCdMxhRwNPf4
 qO/N5lsQiECwX4qd/ZdAlzkgTjbriQTOvwNuIieuXsyG1ds6LGTtsFFGpu1Z9SUkPz4t
 Vy6+CW+e9JfSilyHYv+2qZL9GKcbSSItsVBi+p71k1TTOgfAItfvhcQ8iNR9CdfAr6TD
 ZNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XPIQ+l3SIhNa8WG2Be5WvFHOHgiiEe1pR3NC7Fu+3w=;
 b=MiuQVLEWUFELe2hy/2gnBDKGAjLsvGiRmKtSKxSmp8CvSu0toVYaQIvRd8ZzOTycmQ
 rMNVGvIE918PjNJRWi8NAsY8ZtoQu5aPytWSQvXTrEV/kaI81kyJui5wwVeVg/RU1HqR
 pVpI0zYHFLR9FlXxAG+LMgFuWPThMluw98IoernXs749Ozp2nokq6xZSmn5Wi1UWVdO4
 m8dKEULfvW+WxxoTvGteCqi0Fvc5Jhy5dU+Mlivqh0A+WeICDafMuHnCMhGPm4+mGhzL
 QUB96aLzWnHU2Wa7DbMnPc8LV1dGg+ohfLj+zm/h7tJF99+0n1fRabWgeFee0yhEbTcs
 Hysg==
X-Gm-Message-State: AOAM533x1TdG10NJ6VRGr/lq55yGdQ4gg8I4zw2XOxDsPQnROdaF7vf1
 SFGGS2lV2KULja/i/oj/9dwe3BoYBYs=
X-Google-Smtp-Source: ABdhPJySjVKj0v6c5MCrEgACreZ181agJaFx5gOIN4MtV6N+bbbarNX9loTBfr4k6mIAy31POVi+xQ==
X-Received: by 2002:aa7:8e5a:0:b029:2e9:10d3:376f with SMTP id
 d26-20020aa78e5a0000b02902e910d3376fmr371139pfr.19.1623945088528; 
 Thu, 17 Jun 2021 08:51:28 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 02/17] powerpc: remove interrupt exit helpers unused
 argument
Date: Fri, 18 Jun 2021 01:51:01 +1000
Message-Id: <20210617155116.2167984-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

The msr argument is not used, remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h | 4 ++--
 arch/powerpc/kernel/interrupt.c           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 1c7b75834e04..95492655462e 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -71,8 +71,8 @@ void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f2baeee437f7..05fa3ae56e25 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -352,7 +352,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ti_flags;
 	unsigned long flags;
@@ -431,7 +431,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 
 void preempt_schedule_irq(void);
 
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 {
 	unsigned long flags;
 	unsigned long ret = 0;
-- 
2.23.0

