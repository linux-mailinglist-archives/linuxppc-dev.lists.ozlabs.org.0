Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD71826A464
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:50:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrM3n3FPyzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:50:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=utnhRpgd; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0B0nR0zDqKq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:04 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id u9so1203025plk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNR2nUPpshbBtiLbdPt+k9Y54mJJ6xBG5qbPOnQ15oI=;
 b=utnhRpgd80UQxHJNhJf5hburzxP9UrVjYGG04qiSszzhdatBCpN8TUCYgWGZa0Rc0O
 8/FoZBlEVuRp4BuyZMb25EHhZZ0hdCm+peil1eXiDzzEGFqIS5W2h7sg9HSivVDXTDob
 C4yJOYHNnQ8W/h3WT7a6f0da2Gd7L5TgyvVxVlnzsBB9EwZOzHKS/mqoMn6dAoFli8jx
 ZhBBf3pQ5758Jy50LQETlrA/oF4r90CZds6NDFSGzvCiyVoiA51FZ7KyROwwAx+3V00P
 J2zC+xFQ+HNB3G25ntc0+QO2kznzmIo2o9QG2WR5rnvpqwgy+WEDsp0T/g6LuQBfJV8v
 ekuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nNR2nUPpshbBtiLbdPt+k9Y54mJJ6xBG5qbPOnQ15oI=;
 b=BnnrGFiFEb/dNIi8rQQqFtUtT5naONmz9nQ1mMHqdMm7hSSnz0j1wxxJiRedLa+2fN
 KIyKkNk0x/c6E8cY4fRAwdE7PRdIZmdytCvxbFQ7T1RFe3koN5TXf8Ag7wJmRgmR3Jfs
 um93fMZ9abiXURjU8j4N5X/PvqEbQlUWR49a1vi1B53+dZcErtzlc/y5KSA0CTS0ch/P
 3QB4QTPYYldPGp47Ddu2j2kZFNlbXPKupQytBWir8/6DXnWLoVPeQbRDlIb1lcgLJzK2
 3XzezCk6q0XtIVTg2aaCxGZ1ZjpTqm3JrAoBxjMr69CKAYIE+bcSoO/jz53F4oVPDWb3
 +ZKA==
X-Gm-Message-State: AOAM531kxpRpozQ+vA6MQCZxwIkxxpENCgr0gfMMiq62K/hGtbVzuzAO
 XfUM/h9LAWBKZTCoJWspKR6s6g6tT9JU5Q==
X-Google-Smtp-Source: ABdhPJxyLsmIz6gu2nDF7gxvzhJHtTsNOrg0f/LlLmy6BuDbHmDs3wm1W/ZtrjaZoaHI4L/xUxqjxQ==
X-Received: by 2002:a17:902:ed4c:b029:d1:e5f8:81df with SMTP id
 y12-20020a170902ed4cb02900d1e5f881dfmr1250893plb.60.1600170419425; 
 Tue, 15 Sep 2020 04:46:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:46:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64: fix irq replay missing preempt
Date: Tue, 15 Sep 2020 21:46:45 +1000
Message-Id: <20200915114650.3980244-1-npiggin@gmail.com>
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

Prior to commit 3282a3da25bd ("powerpc/64: Implement soft interrupt
replay in C"), replayed interrupts returned by the regular interrupt
exit code, which performs preemption in case an interrupt had set
need_resched.

This logic was missed by the conversion. Adding preempt_disable/enable
around the interrupt replay and final irq enable will reschedule if
needed.

Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bf21ebd36190..77019699606a 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -368,6 +368,12 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		}
 	}
 
+	/*
+	 * Disable preempt here, so that the below preempt_enable will
+	 * perform resched if required (a replayed interrupt may set
+	 * need_resched).
+	 */
+	preempt_disable();
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
 	trace_hardirqs_off();
 
@@ -377,6 +383,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	trace_hardirqs_on();
 	irq_soft_mask_set(IRQS_ENABLED);
 	__hard_irq_enable();
+	preempt_enable();
 }
 EXPORT_SYMBOL(arch_local_irq_restore);
 
-- 
2.23.0

