Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D7B19C0EB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 14:15:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tMTF4n3GzDrM9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 23:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=umdyC6Bd; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tMQ32qrGzDrJw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 23:12:25 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id k5so1763997pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lf2Da8k6TvZLsSX9LeFZKBlXTuyMXmIdvJsVQDUP90o=;
 b=umdyC6BdIBFyjdzZU0JVb1gSrVAYnlYGFKDAqr7jEfFuygKBB9/3wa4Zag6JQDl+4V
 Zb8+VMZCyo7lXVnqJ1zAbs/psSldIjo8n0yMX7SXi1JToHXM6OQfWige7Oqc8/2X9lUC
 IhzfcLMGxb1UNBAoysc4mcwSLF1sIze832dKJgihG3zYyL4uKSFepr0ZTk7gLzTurw5Z
 SSXQAeye79BZVFznJZZYdOP1nWKt33iJeWzLAR//E9si7/8KdcOVbwML6xA3t6JZgLSo
 KasGxB/eDn4GHPM4SRJj0xOvSBw15NJ7Awj+oX36FXxSzwKxsZ8bSFktac8zsHspFBZI
 Gc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lf2Da8k6TvZLsSX9LeFZKBlXTuyMXmIdvJsVQDUP90o=;
 b=RdqdkOovZvxZKc4pFJDa83pk6rW7IWMEXIKzRI8eanU/E6BRhAU2akSKsIaRi05d8s
 O6ccQgZPkG77ozPfMg1f1CZfDuk4MTsUI4Ed+Mimv1BwE5yPxAuGow+LOE1AwDx/p1hf
 bqIYKebYKbD4yQbzrAnoY/rV8Cv9i88dVNyTh7531x9EAbX4T0sK8FcHSPGHIq5K4Tvr
 dkLct4aa1Ciljv7OalYSx/krKLdsJ79EmLI8sWkNNDpKYgDWYmQPVE2swWbbv4SrTRM7
 tJWL/jAY3L0fiKVRLPPKjXwnZ9uDH3bHO19o+wX64MySIw9084qk9edZayhapIOTv1aV
 q+Dw==
X-Gm-Message-State: AGi0PuZsb6Q11uwQmiwg3KEUoyM2trMZCPJVIyYuiUttaHCG4vig3JPj
 HcHB+MC1WC0R7w+UUsl2AtcOfcHwcAI=
X-Google-Smtp-Source: APiQypKQ2ldL8uk9bJeUVXR/mZS15hAcNCSn8oLMCS0Bep0+yhEosbO2hS/2CdiWw43s6kzAHVrQ4g==
X-Received: by 2002:a63:f54d:: with SMTP id e13mr2945587pgk.157.1585829542004; 
 Thu, 02 Apr 2020 05:12:22 -0700 (PDT)
Received: from bobo.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id f15sm3683902pfq.100.2020.04.02.05.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 05:12:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix doorbell wakeup msgclr optimisation
Date: Thu,  2 Apr 2020 22:12:12 +1000
Message-Id: <20200402121212.1118218-1-npiggin@gmail.com>
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

Commit 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
broke the doorbell wakeup optimisation introduced by commit a9af97aa0a12
("powerpc/64s: msgclr when handling doorbell exceptions from system
reset").

This patch restores it, in C code. It's moved explicitly to the system
reset wakeup path, rather than the doorbell replay path, because it is
always the right thing to do in the wakeup case, but it could be rare to
have a pending message in other cases in which case it's wasted work --
we would have to be done to see if that was a worthwhile optimisation,
and I suspect it would not be.

The results are similar to those in the original commit, test on POWER8
of context_switch selftests benchmark with polling idle disabled (e.g.,
always nap, giving cross-CPU IPIs) gives the following results:

                                    broken           patched
    Different threads, same core:   317k/s           375k/s    +18.7%
    Different cores:                280k/s           282k/s     +1.0%

Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 19 -------------------
 arch/powerpc/kernel/irq.c            | 13 +++++++++++++
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 18bbce143084..728ccb0f560c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3121,22 +3121,3 @@ handle_dabr_fault:
 	li	r5,SIGSEGV
 	bl	bad_page_fault
 	b	interrupt_return
-
-/*
- * When doorbell is triggered from system reset wakeup, the message is
- * not cleared, so it would fire again when EE is enabled.
- *
- * When coming from local_irq_enable, there may be the same problem if
- * we were hard disabled.
- *
- * Execute msgclr to clear pending exceptions before handling it.
- */
-h_doorbell_common_msgclr:
-	LOAD_REG_IMMEDIATE(r3, PPC_DBELL_MSGTYPE << (63-36))
-	PPC_MSGCLR(3)
-	b 	h_doorbell_common_virt
-
-doorbell_super_common_msgclr:
-	LOAD_REG_IMMEDIATE(r3, PPC_DBELL_MSGTYPE << (63-36))
-	PPC_MSGCLRP(3)
-	b 	doorbell_super_common_virt
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6ea27dbcb872..ed6230ba0c43 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -527,6 +527,19 @@ void irq_set_pending_from_srr1(unsigned long srr1)
 		return;
 	}
 
+	if (reason == PACA_IRQ_DBELL) {
+		/*
+		 * When doorbell triggers a system reset wakeup, the message
+		 * is not cleared, so if the doorbell interrupt is replayed
+		 * and the IPI handled, the doorbell interrupt would still
+		 * fire when EE is enabled.
+		 *
+		 * To avoid taking the superfluous doorbell interrupt,
+		 * execute a msgclr here before the interrupt is replayed.
+		 */
+		ppc_msgclr(PPC_DBELL_MSGTYPE);
+	}
+
 	/*
 	 * The 0 index (SRR1[42:45]=b0000) must always evaluate to 0,
 	 * so this can be called unconditionally with the SRR1 wake
-- 
2.23.0

