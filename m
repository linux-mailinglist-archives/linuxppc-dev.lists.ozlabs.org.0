Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202C73933C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 01:50:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c5YuTRy9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmgHL1LSqz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 09:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c5YuTRy9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmgGL53wsz2yDL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 09:49:44 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-666e97fcc60so3148307b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 16:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687391381; x=1689983381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf6e3zoK2lsWX8TAhmhXGe8qT9YHqy+yrmBlFlT9OBM=;
        b=c5YuTRy9R2yb2eiPTBYXT2zor3k2ndwHM7Z5Nd7s9q1+mLBz0lrz9Te3PBUdI/CRMr
         gYOSYN9K4kxbL9H5UQRxV1pjPbUCgBX+5aDsvcs9HeWrYIO3xebc6wABof7qNNl15ovb
         u3zKMOKhENXOjtAtM7LIG3U2QCZ453qy1irqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687391381; x=1689983381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qf6e3zoK2lsWX8TAhmhXGe8qT9YHqy+yrmBlFlT9OBM=;
        b=EK62wZz+Iez6bg/qYTererA88kAYjl2CbpMIJvEmXpfIvA5IjCFam7SDnOoB1dj3Rg
         fGj5kwWgL6hPhZixIgFRaXnh+RczwOfV99su5zv/vQK/qG51le2nA0ucT29xWClxbFb/
         J8QnGimnelfh0dZMjhSCSPpsgC2Z2fjtg7MkTKqMmIY2jeFQDBOGJ7Qp/XJSUQ7S/E8P
         K/lihPZDo5cXTdoBN7iOnnQ0VDK3KhIDwrDYKU81tgOnPC/A7Jm/z9jd6lG5lHRYbvBQ
         dFjKU4XACaCBHiXgYGFnzV+jo6YsKG257oIsRQQfqyNDsRZ2w7uNYQ8RHHJOzpH71Wn/
         E+jg==
X-Gm-Message-State: AC+VfDw8J7QNsL1Py5A278D8h78MDt22HeepzMPc619Up7nfNcc9aeaQ
	NIfD061exRU8a4LHhzOVn/k1dg==
X-Google-Smtp-Source: ACHHUZ5RRv6lO7lptwFwZwCIvhWJ2DKoOHfR/syo0v3pV9+ibIJneyN8vuWWvvovrkxhJaXmUQ/z1Q==
X-Received: by 2002:a05:6a20:5496:b0:123:21e7:cf22 with SMTP id i22-20020a056a20549600b0012321e7cf22mr3510740pzk.52.1687391381205;
        Wed, 21 Jun 2023 16:49:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:4fc5:ca67:5b9a:cee0])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902ebd200b001b523714ed5sm3940880plg.252.2023.06.21.16.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 16:49:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] powerpc: Move arch_trigger_cpumask_backtrace from nmi.h to irq.h
Date: Wed, 21 Jun 2023 16:48:19 -0700
Message-ID: <20230621164809.1.Ice67126857506712559078e7de26d32d26e64631@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc architecture was the only one that defined
arch_trigger_cpumask_backtrace() in asm/nmi.h instead of
asm/irq.h. Move it to be consistent.

This fixes compile time errors introduced by commit 7ca8fe94aa92
("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH"). That commit
caused <asm/nmi.h> to stop being included if the hardlockup detector
wasn't enabled. The specific errors were:
  error: implicit declaration of function ‘nmi_cpu_backtrace’
  error: implicit declaration of function ‘nmi_trigger_cpumask_backtrace’

Fixes: 7ca8fe94aa92 ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Closes: https://lore.kernel.org/r/871qi5otdh.fsf@mail.lhotse
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'd expect that this would land in Andrew Morton's tree along with the
other lockup detector stuff.

 arch/powerpc/include/asm/irq.h | 6 ++++++
 arch/powerpc/include/asm/nmi.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 94dffa1dd223..f7a90b6f3ceb 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -53,5 +53,11 @@ void __do_IRQ(struct pt_regs *regs);
 
 int irq_choose_cpu(const struct cpumask *mask);
 
+#ifdef CONFIG_NMI_IPI
+extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
+					   bool exclude_self);
+#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
+#endif
+
 #endif /* _ASM_IRQ_H */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index ce25318c3902..49a75340c3e0 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -9,12 +9,6 @@ void watchdog_hardlockup_set_timeout_pct(u64 pct);
 static inline void watchdog_hardlockup_set_timeout_pct(u64 pct) {}
 #endif
 
-#ifdef CONFIG_NMI_IPI
-extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
-					   bool exclude_self);
-#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
-#endif
-
 extern void hv_nmi_check_nonrecoverable(struct pt_regs *regs);
 
 #endif /* _ASM_NMI_H */
-- 
2.41.0.162.gfafddb0af9-goog

