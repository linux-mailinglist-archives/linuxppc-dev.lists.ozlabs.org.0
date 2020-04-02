Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277119C0AD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 14:07:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tMHt0Bq2zDrCG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 23:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aZI1gRdj; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tMDb4ljfzDrRG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 23:04:15 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id np9so1446607pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSyOBpjTRq+uXy+LP3lHjZjAKEnlJ5opeJ2ZCr5/VDQ=;
 b=aZI1gRdjW5XmQN33vEGtKlN3VYRFq4KONhbPYEG0mmilvlkTt8DH46YAhgZO8xHJ5c
 qhtRmFbqNbAbpOZgw/AqnzSFUZF+uNAfrIZNwXdd/5NZzSIgUB7L9aErPAUTN4/mcMww
 lLZJvkxEBSGaznfEpPiR9ba7nXXZEfFbudhhZh0NB8MMaa3jlGryw1CjvKCxlMCdtxwJ
 p2bRjN71tmYuqg1mvcnfb8B9GQFYMQADaEnLhQKSSvPya904T9CK3hNJL86MejFs4679
 jIDQsS3yaBvy3c03Ts+sllPGWTvbmWYgTzHjckCYX3AisAun6KEK06WaA6uU6RK2eBBs
 w1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSyOBpjTRq+uXy+LP3lHjZjAKEnlJ5opeJ2ZCr5/VDQ=;
 b=rTkb1hyT8LFHqVhIvxmJifLVa2agydF6nEIFnZ6d3kHqBRLSztWsxWky58PdusSLZk
 Lpwcl+2d3SMTGdqIYkDJDUNHhd64lisU8AOpSJUy3JAxyVZBT4LEcwmaJoKaSsbbBME2
 tFW4XoHr6FcESX2tlVH2K77fu1sQzx/kzzNTk1XRVHtYV/BxCwOllg09mxDvtiLzJ+hw
 VDbHmNRjGtv7IXVWs3nCNsMkBPparWPSLWru/RQ088JysjyP5uMTQKKGFLt315y13LyK
 3mwzLjmS1AlGEJV8iUC9SdC8JmJEdA0JGrSLywbMUvmrnd3rXQDvbgApsL/5lZkdS7vs
 mBGw==
X-Gm-Message-State: AGi0PubHDRuzE4CYEvnG9s29ydPoLGt1zJ5lSU7ddqgMShpR3L6/s2jx
 ncJBspvUq6Jyyvkb/VwVRPO0Gee+
X-Google-Smtp-Source: APiQypLIOINIdHBzLtpZW4xMpwJbDC0mAoxqkdNaFkRLdJflyCe5roXzB1ebPxrNKqkYQpb3YjG+JA==
X-Received: by 2002:a17:902:b617:: with SMTP id
 b23mr2711061pls.285.1585829051175; 
 Thu, 02 Apr 2020 05:04:11 -0700 (PDT)
Received: from bobo.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id h132sm3643943pfe.118.2020.04.02.05.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:04:10 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Revert "powerpc/64: irq_work avoid interrupt when called with
 hardware irqs enabled"
Date: Thu,  2 Apr 2020 22:04:01 +1000
Message-Id: <20200402120401.1115883-1-npiggin@gmail.com>
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

This reverts commit ebb37cf3ffd39fdb6ec5b07111f8bb2f11d92c5f.

That commit does not play well with soft-masked irq state manipulations
in idle, interrupt replay, and possibly others due to tracing code
sometimes using irq_work_queue (e.g., in trace_hardirqs_on()). That
can cause PACA_IRQ_DEC to become set when it is not expected, and be
ignored or cleared or cause warnings.

The net result seems to be missing an irq_work until the next timer
interrupt in the worst case which is usually not going to be noticed,
however it could be a long time if the tick is disabled, which is
agains the spirit of irq_work and might cause real problems.

The idea is still solid, but it would need more work. It's not really
clear if it would be worth added complexity, so revert this for now
(not a straight revert, but replace with a comment explaining why we
might see interrupts happening, and gives git blame something to find).

Fixes: ebb37cf3ffd3 ("powerpc/64: irq_work avoid interrupt when called with hardware irqs enabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This started tripping some warnings testing the latest interrupt code
which juggled a few things around, but it looks like it may have had
problems before that too.

 arch/powerpc/kernel/time.c | 44 +++++++++++---------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 1168e8b37e30..716f8d0960a7 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -522,35 +522,6 @@ static inline void clear_irq_work_pending(void)
 		"i" (offsetof(struct paca_struct, irq_work_pending)));
 }
 
-void arch_irq_work_raise(void)
-{
-	preempt_disable();
-	set_irq_work_pending_flag();
-	/*
-	 * Non-nmi code running with interrupts disabled will replay
-	 * irq_happened before it re-enables interrupts, so setthe
-	 * decrementer there instead of causing a hardware exception
-	 * which would immediately hit the masked interrupt handler
-	 * and have the net effect of setting the decrementer in
-	 * irq_happened.
-	 *
-	 * NMI interrupts can not check this when they return, so the
-	 * decrementer hardware exception is raised, which will fire
-	 * when interrupts are next enabled.
-	 *
-	 * BookE does not support this yet, it must audit all NMI
-	 * interrupt handlers to ensure they call nmi_enter() so this
-	 * check would be correct.
-	 */
-	if (IS_ENABLED(CONFIG_BOOKE) || !irqs_disabled() || in_nmi()) {
-		set_dec(1);
-	} else {
-		hard_irq_disable();
-		local_paca->irq_happened |= PACA_IRQ_DEC;
-	}
-	preempt_enable();
-}
-
 #else /* 32-bit */
 
 DEFINE_PER_CPU(u8, irq_work_pending);
@@ -559,16 +530,27 @@ DEFINE_PER_CPU(u8, irq_work_pending);
 #define test_irq_work_pending()		__this_cpu_read(irq_work_pending)
 #define clear_irq_work_pending()	__this_cpu_write(irq_work_pending, 0)
 
+#endif /* 32 vs 64 bit */
+
 void arch_irq_work_raise(void)
 {
+	/*
+	 * 64-bit code that uses irq soft-mask can just cause an immediate
+	 * interrupt here that gets soft masked, if this is called under
+	 * local_irq_disable(). It might be possible to prevent that happening
+	 * by noticing interrupts are disabled and setting decrementer pending
+	 * to be replayed when irqs are enabled. The problem there is that
+	 * tracing can call irq_work_raise, including in code that does low
+	 * level manipulations of irq soft-mask state (e.g., trace_hardirqs_on)
+	 * which could get tangled up if we're messing with the same state
+	 * here.
+	 */
 	preempt_disable();
 	set_irq_work_pending_flag();
 	set_dec(1);
 	preempt_enable();
 }
 
-#endif /* 32 vs 64 bit */
-
 #else  /* CONFIG_IRQ_WORK */
 
 #define test_irq_work_pending()	0
-- 
2.23.0

