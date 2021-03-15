Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61333A9F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzMD81l1Fz3f1j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:22:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uv5oLlsf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uv5oLlsf; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM7B1JmNz3cWZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:58 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso11330611pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Kp72aT76gdbSTqpYV7yp/TKHQaU/VygiQHbpe3wL/g=;
 b=uv5oLlsfNQ9huIeGDiO+YrlvHFA4y5f4zRkAOwtDr0f5sLdRVkcIdeXFgpmAuPHUno
 sCZd/5D2Z9Ocymq840OEikOD92osxDEEso/W0djj7K3bJbWcWPsPzjZOHW5Se2jAd6dH
 3YFSfNSFMK0C/WLCmW20doeECPTLJRmmH7FGYgx2qFzdTuNZlpfr1NRFh40ZvljN2zos
 G+ncEX8OAx75ILdCqM3ufONSciNdhQcJSIFAo3hzx8IyTTEqfg9CMz0a7VqiVkFpE2Bp
 96z9m76Evh9Lu1OvsQe0fD3I5UCQQuh8Rc+kxKO0fRPWOEtugMzBizFu+857JW+lRTny
 LNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Kp72aT76gdbSTqpYV7yp/TKHQaU/VygiQHbpe3wL/g=;
 b=KqOYtzFnuK+xzF9215dZWRbgeEzZLsl6rbj6SMnIsbUAIf1SZxhiGsMcxRYp/DD03y
 Na44g+dj/flcZTi9PoaQ3VDfC1ExGKhdhDiyiA51oTykialxYJu1t5Dz0hVrf9QAH1iw
 pGS4Nuf6s+cji1kHMh0yTgTCStJDhUH9/R6IURqo4Rya5ifW1cjs8fTYT0+G86zp4Xk3
 T4/ltU+irUQ90EHaQjrgy/nZ73rC4AJFt33cGuSMhLgi+GfCm+MyjqqwvXdB01Yaq4t3
 DKjdQXuLKCQckep910YAdFlwttV7d7zZ6WXzRdCyw3SkS20cMpIzsOYJBk1KALpG2fQv
 mHCw==
X-Gm-Message-State: AOAM533tf+J/cIhBk7ZewxGoYue8yI5kzYdK/Ce0qDhiBzWyUtn8dExJ
 QglgKS1AJ9hgHvBsi4yECE3k5N3yZtk=
X-Google-Smtp-Source: ABdhPJwEFoYVqDs982KLLxWq8pheqoYAlA5QZSVr6YhH/wDCbI1svVQ6+3l6jJ5ZTpfB8dqZK+85tg==
X-Received: by 2002:a17:902:dac2:b029:e6:30a6:4c06 with SMTP id
 q2-20020a170902dac2b02900e630a64c06mr9530555plx.65.1615778275451; 
 Sun, 14 Mar 2021 20:17:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/10] powerpc: move norestart trap flag to bit 0
Date: Mon, 15 Mar 2021 13:17:16 +1000
Message-Id: <20210315031716.3940350-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Compact the trap flags down to use the low 4 bits of regs.trap.

A few 64e interrupt trap numbers set bit 4. Although they tended to be
trivial so it wasn't a real problem[1], it is not the right thing to do,
and confusing.

[*] E.g., 0x310 hypercall goes to unknown_exception, which prints
    regs->trap directly so 0x310 will appear fine, and only the syscall
    interrupt will test norestart, so it won't be confused by 0x310.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 91194fdd5d01..6a04abfe5eb6 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -185,15 +185,21 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 #define current_pt_regs() \
 	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
 
+/*
+ * The 4 low bits (0xf) are available as flags to overload the trap word,
+ * because interrupt vectors have minimum alignment of 0x10. TRAP_FLAGS_MASK
+ * must cover the bits used as flags, including bit 0 which is used as the
+ * "norestart" bit.
+ */
 #ifdef __powerpc64__
-#define TRAP_FLAGS_MASK		0x10
+#define TRAP_FLAGS_MASK		0x1
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #else
 /*
  * On 4xx we use bit 1 in the trap word to indicate whether the exception
  * is a critical exception (1 means it is).
  */
-#define TRAP_FLAGS_MASK		0x1E
+#define TRAP_FLAGS_MASK		0xf
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
@@ -222,12 +228,12 @@ static inline bool trap_is_syscall(struct pt_regs *regs)
 
 static inline bool trap_norestart(struct pt_regs *regs)
 {
-	return regs->trap & 0x10;
+	return regs->trap & 0x1;
 }
 
 static inline void set_trap_norestart(struct pt_regs *regs)
 {
-	regs->trap |= 0x10;
+	regs->trap |= 0x1;
 }
 
 #define arch_has_single_step()	(1)
-- 
2.23.0

