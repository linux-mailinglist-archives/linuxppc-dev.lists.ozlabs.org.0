Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 222DA18EFB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 07:15:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m3yD5YSszDqNv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 17:15:00 +1100 (AEDT)
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
 header.s=20161025 header.b=KCzHmgnf; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m3w42sq6zDq8g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 17:13:08 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id w3so5487173plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V85CyMcsNpBNSE74FZRSku17ygeg3qFLt9X3LPZQj/k=;
 b=KCzHmgnfDF0wEULtxkRH93jdQSQUtTx+0MBs9rusRyB1psXa9l6ZZs7YB4ouZgCUPe
 SfbOp7wmTZAHh0b2XcKZCKwAY4Nll3OU103ALHImDlXZvGhC0OIC4WRlwsVHtfnVtK+2
 P3j0qudH3sjj2x7Z6Anbz8PZFi1U9/eZ/zA9bpVpomXAgtkgU8q+dC0MqYWFUUecMl/I
 fd+Lyl1DRqqiFFdzm8+hli420z3XA0H6/f9hNstVvaWtpE88Rs4JX/h1uduWm+PH52QT
 R/2soxmDx3cIwe7Z046qDy5FkgUYk30ILlyGxTQYLxF2Mp4PClQKN9cj03ZQF/UymKxY
 wntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V85CyMcsNpBNSE74FZRSku17ygeg3qFLt9X3LPZQj/k=;
 b=htGyU/3n1jz8xN0g7nUtQD9o0n59Dxr0jen1LLt2w1Xc3qV12UcU1CIpTg+9Vy1aGj
 lJH5QeuSHrR/eovJKXOW8b92q1gMBlvIJkFmcyvdW9WqB9iw8vkjQ/YzelIIGT9T6kT5
 RTrtSIJ8sGj33Cu7XRE6gk8sijWj8JNAvg7V7R+V0S3p6uxuS4Pd+BbbTUSemAqn2GSa
 493uG2ogaoiz5lw9NCzA96ZhpBdOukPBHxM5UjCpebDj8+HiOuLoMu1dpoZOX1WvhPQc
 W69kD234xjt+fgpxKN0cZJwSVkho5iB6daxeUKzfb2Q/8Os/o944KXJQXBQxu30i4YqP
 qZYw==
X-Gm-Message-State: ANhLgQ1dv2yqLnI4/Xwk+cETXWSwrYNJLCnUV870IOfW8X5KgG0LMApQ
 9k48oyKC6QQ2FPNCtIPOv3/yA2Cv
X-Google-Smtp-Source: ADFU+vtjxEDY0VlCrcBoP4s2buZgYHedO6g0borJP92Y3JOjfD0gIABEycah/yV4AvZz3UWzphVt6A==
X-Received: by 2002:a17:90a:840a:: with SMTP id
 j10mr23054809pjn.37.1584943984035; 
 Sun, 22 Mar 2020 23:13:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-202-190-183.tpgi.com.au.
 [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id g16sm11566213pgb.54.2020.03.22.23.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 23:13:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] Fix 2 "[v3,
 28/32] powerpc/64s: interrupt implement exit logic in C"
Date: Mon, 23 Mar 2020 16:09:18 +1000
Message-Id: <20200323060918.1933232-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200323054409.1932037-1-npiggin@gmail.com>
References: <20200323054409.1932037-1-npiggin@gmail.com>
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

This completes the move of the stray hunk. Also fixes an irq tracer
bug, returning to irqs-disabled context should not trace_hardirqs_on().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h | 2 ++
 arch/powerpc/kernel/syscall_64.c          | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index ab59a4904254..7d81e86a1e5d 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -99,6 +99,8 @@ void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index ef4ce621f862..ffd601d87065 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -355,7 +355,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		irq_soft_mask_set(IRQS_ENABLED);
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
-		trace_hardirqs_on();
 		__hard_EE_RI_disable();
 		if (regs->msr & MSR_EE)
 			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
-- 
2.23.0

