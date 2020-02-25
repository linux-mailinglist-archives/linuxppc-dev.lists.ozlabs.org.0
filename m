Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FBF16EE22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:39:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnlY0m13zDqXG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hslcDIe4; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmS735KyzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:40:51 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id dw13so1567736pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Wj1LFgjKdBKqX9HGIBhUqpSqR+VCP0+0muo9hEru8M=;
 b=hslcDIe4e4pAkITQkA4m80/JggMbY3JUR5RmVLLYhRE5ihKP4Uh/y+JIfSi4V/+GgP
 ldl2tYWPBFcotAQ2xDqWkgfFymiyF6zM77YnofybhC90BPO22A5jBXOFwDP5X+kL3opo
 w2KJ3XEBLI+AV2C2O/bOgRUxoGI9WUwpOChzBzqf1CihU2JJEEkZhySv2Xc/EO2Xf4KJ
 zs7lIrWMkJsrfSxQ9nEPF7IywMODKt56j5v2t73EOV3/GpWw3lJNz3GjYe2bGxJItxJh
 bi2xwTuoal/akShCg5w7M3ykM2ux3D8lCaM+ar9+LOP5EqIdZwUyvhOcBD4oCfb7hWoD
 3cdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Wj1LFgjKdBKqX9HGIBhUqpSqR+VCP0+0muo9hEru8M=;
 b=QO60XWVDzqmOH/piVpK2V3AA3gsdxwFQxbKlk7YDuHMaSnhMpqQ2m3u8gQ469/24ng
 pdHiSS/BRFz2/czmBFotZpKz+bmZ1hV1bVRsb83dHQZuGGEPV3NETVmEMx061rYQb3zS
 BCZAxLY8i0C0U2g7SbAA6rEPkN+NKLXaQsedP19GEtsCq4d+8QUApkjhb3+tuKzXV3Ow
 4GXhCaJFOYGIW1M34vXL+LVGRNtuT96clYoiEs6HupbtZ3lANxjSqQFZE1x/pC2AD1BT
 HMxxKN/yZFKmOy2Sa1/mAUdoMQ881bzNpzB4S37vRU2w4tfODB9BuQnVYgH7+UnWDTUE
 8uNg==
X-Gm-Message-State: APjAAAW9qBTO1cwKWJ4PVsrVZIiuNGs+dLWp6ZJMFn0Nug5XsZAX3AdZ
 j1KIbw5xgy/FNYiUys21YPzmL/FR
X-Google-Smtp-Source: APXvYqw97E3EevYXCKalybHfJr71i/tZ0ahcpZfRTbdi5gCahqX3HbrrO6lWIIBv3Gu+B4EOzONaBg==
X-Received: by 2002:a17:902:9f86:: with SMTP id
 g6mr51935830plq.299.1582652444482; 
 Tue, 25 Feb 2020 09:40:44 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 21/32] powerpc/64s/exception: sreset interrupts reconcile
 fix
Date: Wed, 26 Feb 2020 03:35:30 +1000
Message-Id: <20200225173541.1549955-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds IRQ_HARD_DIS to irq_happened. Although it doesn't seem to
matter much because we're not allowed to enable irqs in an NMI handler,
the soft-irq debugging code is becoming more strict about ensuring
IRQ_HARD_DIS is in sync with MSR[EE], this may help avoid asserts or
other issues.

Add a comments explaining why MCE does not have this. Early machine
check is generally much smaller and more contained code which will
explode if you look at it wrong anyway as it runs in real mode, though
there's an argument that we should do similar reconciling for the MCE
as well.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c23eb9c572b2..6ff5ea236b17 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -920,18 +920,19 @@ EXC_COMMON_BEGIN(system_reset_common)
 	__GEN_COMMON_BODY system_reset
 	bl	save_nvgprs
 	/*
-	 * Set IRQS_ALL_DISABLED unconditionally so arch_irqs_disabled does
+	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
 	 * the right thing. We do not want to reconcile because that goes
 	 * through irq tracing which we don't want in NMI.
 	 *
-	 * Save PACAIRQHAPPENED because some code will do a hard disable
-	 * (e.g., xmon). So we want to restore this back to where it was
-	 * when we return. DAR is unused in the stack, so save it there.
+	 * Save PACAIRQHAPPENED to _DAR (otherwise unused), and set HARD_DIS
+	 * as we are running with MSR[EE]=0.
 	 */
 	li	r10,IRQS_ALL_DISABLED
 	stb	r10,PACAIRQSOFTMASK(r13)
 	lbz	r10,PACAIRQHAPPENED(r13)
 	std	r10,_DAR(r1)
+	ori	r10,r10,PACA_IRQ_HARD_DIS
+	stb	r10,PACAIRQHAPPENED(r13)
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
@@ -976,6 +977,11 @@ EXC_COMMON_BEGIN(system_reset_common)
  * error detected there), determines if it was recoverable and logs the
  * event.
  *
+ * This early code does not "reconcile" irq soft-mask state like SRESET or
+ * regular interrupts do, so irqs_disabled() among other things may not work
+ * properly (irq disable/enable already doesn't work because irq tracing can
+ * not work in real mode).
+ *
  * Then, depending on the execution context when the interrupt is taken, there
  * are 3 main actions:
  * - Executing in kernel mode. The event is queued with irq_work, which means
-- 
2.23.0

