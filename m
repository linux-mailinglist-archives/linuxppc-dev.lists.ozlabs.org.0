Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E744B9A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmCv0qzCz2ynf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:38:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QLV/LF4O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QLV/LF4O; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCG2d70z2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:28 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id r5so1610913pls.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHDlWeOgU30NN6ENKp1b8YZhUqZ6c4bprLjEFL13Z18=;
 b=QLV/LF4OQfkNNEhLqWNZgFkjZvZ0QhFs+a8yH5fBdgzaNbYRoOzofU3U5W0qZhwZ3a
 McNoi9kXmN9TQgVHLGC+wKnrxJRabZ7iVxz+LxLGjyZ5VePFThyJqw1uoYs7HxwXeiHb
 3x3BKPshGwyiSzv4yRRpdHANooghRCTiFllmEG3XphqoMwZ7/TzrNVaA4d4F/a2RdT+m
 71QV8AACo+t7QckhGrG7FD3bKrpnc8s6vQVA3FjVVKWa/O2ogFELjexDFZCbocp3omtb
 iaEo5m2w8vRfQ7RhUsvCmGIHMmE20EBX19m6ySyoLmZpQV+nUDX2QQKeNIW1rT/jFZ0i
 7e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHDlWeOgU30NN6ENKp1b8YZhUqZ6c4bprLjEFL13Z18=;
 b=6KOjailELDB8/T26jY4u7ww/mD2CWY2s+8bPdCpbfAvOhL5Uv7Mn6EVhgfoISM8Hyv
 JnmAsZLB2eLRl47GNahxN7ODwrg0cfmAz4la0WkuBC6vzm0ZaFV/iIR8LNaYB7fKWLp9
 VoQqTwDv20rksHAzckMoYrGdZ6B0P3zCmgZGjUD93Hm4CPB9EvIVY6W2Y/Huoe0HfS/E
 TpEQKQcGsCwwljt/kybXg9/Ma43FqKGK1lej4HNj+5CMlclGRzXm8tk/0RiT53fEFHB6
 RZuLdShwlQ0G+HaURlFakXi01BbL8gJ1styot7lKngBIYQ1FQAoc+Z4xOdfymLpqlxNW
 ihyw==
X-Gm-Message-State: AOAM5308I21oVwVntIiLnGdX3PNgbfsweMK2K6+sRCes8ljiCgAIruQJ
 9iI27xKe6otKlOB2RmRdtv+lcIQxSXttHg==
X-Google-Smtp-Source: ABdhPJyltz02dr6tIZ16ouqfPzpWn7t7yBnEKKHcq2wDt0+darURf0en6SKaqjaVK/KJmoG7J+WrpA==
X-Received: by 2002:a17:90b:1d0f:: with SMTP id
 on15mr12106785pjb.144.1636504644936; 
 Tue, 09 Nov 2021 16:37:24 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:24 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 1/5] powerpc: Allow clearing and restoring registers
 independent of saved breakpoint state
Date: Wed, 10 Nov 2021 11:37:13 +1100
Message-Id: <20211110003717.1150965-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110003717.1150965-1-jniethe5@gmail.com>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For the coming temporary mm used for instruction patching, the
breakpoint registers need to be cleared to prevent them from
accidentally being triggered. As soon as the patching is done, the
breakpoints will be restored. The breakpoint state is stored in the per
cpu variable current_brk[]. Add a pause_breakpoints() function which will
clear the breakpoint registers without touching the state in
current_bkr[]. Add a pair function unpause_breakpoints() which will move
the state in current_brk[] back to the registers.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v7: New to series
---
 arch/powerpc/include/asm/debug.h |  2 ++
 arch/powerpc/kernel/process.c    | 36 +++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 86a14736c76c..83f2dc3785e8 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -46,6 +46,8 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
+void pause_breakpoints(void);
+void unpause_breakpoints(void);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 406d7ee9e322..22ed72430683 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -688,6 +688,7 @@ DEFINE_INTERRUPT_HANDLER(do_break)
 
 static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk[HBP_NUM_MAX]);
 
+
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 /*
  * Set the debug registers back to their default "safe" values.
@@ -865,10 +866,8 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
-void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+static void ____set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
-	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
-
 	if (dawr_enabled())
 		// Power8 or later
 		set_dawr(nr, brk);
@@ -882,6 +881,12 @@ void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 		WARN_ON_ONCE(1);
 }
 
+void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+{
+	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
+	____set_breakpoint(nr, brk);
+}
+
 /* Check if we have DAWR or DABR hardware */
 bool ppc_breakpoint_available(void)
 {
@@ -894,6 +899,31 @@ bool ppc_breakpoint_available(void)
 }
 EXPORT_SYMBOL_GPL(ppc_breakpoint_available);
 
+/* Disable the breakpoint in hardware without touching current_brk[] */
+void pause_breakpoints(void)
+{
+	struct arch_hw_breakpoint brk = {0};
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		____set_breakpoint(i, &brk);
+}
+
+/* Renable the breakpoint in hardware from current_brk[] */
+void unpause_breakpoints(void)
+{
+	int i;
+
+	if (!ppc_breakpoint_available())
+		return;
+
+	for (i = 0; i < nr_wp_slots(); i++)
+		____set_breakpoint(i, this_cpu_ptr(&current_brk[i]));
+}
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
 static inline bool tm_enabled(struct task_struct *tsk)
-- 
2.25.1

