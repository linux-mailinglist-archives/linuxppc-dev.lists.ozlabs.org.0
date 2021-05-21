Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89E38C5EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlCr5X5Hz30Ff
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:45:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H89gNftr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H89gNftr; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlBt3xLNz303P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:38 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id g18so13052114pfr.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNM7LjNlG7D3yR4PH6b+cf+7c/bYLg6X4ID7/qjSGq4=;
 b=H89gNftrl0q1jhRcpV26HpNysWYArvj6B+a6dllG+OFuQE+ibrZO5XMxsJrny0B/i0
 SYycFn/nTAeQxOh6nAEZYn7/ZfEb4uJSK4PqQr6FbxdJzRO3kGdbNE1bIEfBlUsWb1rB
 M9WsdusRujw8IkeIGG1e30xRkgqYI7VnJ1ptzcpWk78dHWb+oQrfuTfaFYyWK33Fy4aJ
 oFEOJ/aFEqpKd6kDa7wtct2AHvrmHyu1i2KaovidWQkDvuyhcGtPg7VU7H6bUhKv/h9V
 aHIb+RyoR3wEhOhMvG155HqZT83rXW2bcHii4umrgdRZWiJSlTpoK75IBICACM/AWICg
 sr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNM7LjNlG7D3yR4PH6b+cf+7c/bYLg6X4ID7/qjSGq4=;
 b=KVgE9mjrtBZBzRCG7XyHrLU0hp7N4103CNOopN7dIEZLaSIMMjjGfZ+VFGuFMz7YDe
 3pDxYqiW60cKZlHVTGmxdc+MpLWlZ0g+ldSev6RI9CRwMyqlHVDi8Z3aKPjjuAIJK8FC
 NrZEuqD2NXSFRuDRnKROHD348ud5l9vuH0ZvrhGZ99gKMAikTyOxjj2X8yt91Aby/gP4
 BcVCaCLRMEUNNuH87lzDVvyvx5FGn7FpJKAvYGbmVh+jOHvHN2FwR79AxTQtr24jqRRb
 +Wwpe/1kTbUKdz+jrOZOZCoJNzR7wqQKux9CDbnSpRD5FyVK7PFR9fqtaN7yz0S6cV9+
 Mu0g==
X-Gm-Message-State: AOAM531xMASN9QuyAjmpaLg0O6UGix1AHRHeSrMoNCEhv40j/xN90Jg9
 6j6sn7Il9yd9a5wrRMC5vtUTpWYX8i4=
X-Google-Smtp-Source: ABdhPJwyriYyq9Zdjn3RfO4Xd2hLRMMxWx65dUnA6hvDUsSvkHUg4470YGl03rzdBUyL3GMewY/15Q==
X-Received: by 2002:aa7:982c:0:b029:2e3:af1e:4566 with SMTP id
 q12-20020aa7982c0000b02902e3af1e4566mr6805214pfl.5.1621597474910; 
 Fri, 21 May 2021 04:44:34 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/11] powerpc: remove interrupt exit helpers unused
 argument
Date: Fri, 21 May 2021 21:44:12 +1000
Message-Id: <20210521114422.3179350-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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
index e0938ba298f2..38ae7057d6c2 100644
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

