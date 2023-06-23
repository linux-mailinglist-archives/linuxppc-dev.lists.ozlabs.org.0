Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B073AF18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 05:29:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ri8oxVqP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnN5r35vlz3bn6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 13:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ri8oxVqP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnN4w6CZzz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 13:29:02 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666eef03ebdso43742b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687490937; x=1690082937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbCparE/RKUBvduSG+9T7tJYjF4EAS3Se6eC6l4lN3I=;
        b=Ri8oxVqPuYB8qbqbpDHBR7UsvWxZYJPhe0Z/RzlE+I4ZLTBMwDVvs4C6yEr/K2LQM0
         G8KdvziFF5fR91nZYgF/YyNcQ7CHa5pAiNev+qKDdpls/Un3s/+e58oaD/FTy6+rDTV/
         EP7ug2pDfnLrdNksWColE+/sETHm8R2Ze2zZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687490937; x=1690082937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbCparE/RKUBvduSG+9T7tJYjF4EAS3Se6eC6l4lN3I=;
        b=h/sHl9AJCOYixo57h5itMz9ZaXxKrg/5/EwL2WRlUGiIOfSpU+/dFsSRvPp+aepZps
         9btMHzf6PtI0g+8TZmaKqDsiIFOao+osfmc8j9OaRLWLZm5gFNAF8v1CFIoG8APm+Z8k
         7WDu+q1U5M6gR9eQ6+HyJy1KJNv27bbigNlvrOToZR3jzb9Ec1unU1vty6TsNHdn21pk
         BBy3Ui4CBKY0ln+zzliI4dCWO49v+4V2BV6aifwgRfVWsTwzArpu8BztuDc6duyW5JDx
         sP6svYDYKwEDk8m+Y74D4AbAss/yc9WSvIMNraVPBQG7ufltCz3lEQJn3LFZFiPDKTVr
         ujRA==
X-Gm-Message-State: AC+VfDyb32uLKRzfjb6QO2szRvnJOcGKB7OpRPHt9+vjBZbFzgPPHbga
	oVRM7XVu6Xaz2NbU5ansEJV/vg==
X-Google-Smtp-Source: ACHHUZ71Y8YUhMdZD3k4/kExQ1KMRHXAMNZY4EEbBixcC9tU/J9oOscg5bO9OohTYDHLuQg7HGWZ2A==
X-Received: by 2002:a05:6a00:b51:b0:668:71a1:2e74 with SMTP id p17-20020a056a000b5100b0066871a12e74mr12139295pfo.5.1687490937604;
        Thu, 22 Jun 2023 20:28:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:fddd:7fcf:b7e4:2619])
        by smtp.gmail.com with ESMTPSA id m2-20020aa79002000000b0064d1d8fd24asm5156391pfo.60.2023.06.22.20.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 20:28:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] powerpc: Move arch_trigger_cpumask_backtrace from nmi.h to irq.h
Date: Thu, 22 Jun 2023 20:28:25 -0700
Message-ID: <20230622202816.v2.1.Ice67126857506712559078e7de26d32d26e64631@changeid>
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
Cc: Petr Mladek <pmladek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
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

NOTE: when moving this into irq.h, we also change the guards from just
checking if "CONFIG_NMI_IPI" is defined to also checking if
"CONFIG_PPC_BOOK3S_64" is defined. This matches the code in
arch/powerpc/kernel/stacktrace.c. Previously this worked because
<asm.nmi.h> was included if "CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH" was
defined. For powerpc that's only selected if "CONFIG_PPC_BOOK3S_64" is
defined.

Fixes: 7ca8fe94aa92 ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH")
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Closes: https://lore.kernel.org/r/871qi5otdh.fsf@mail.lhotse
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'd expect that this would land in Andrew Morton's tree along with the
other lockup detector stuff.

Changes in v2:
- Change the guards to include CONFIG_PPC_BOOK3S_64.

 arch/powerpc/include/asm/irq.h | 6 ++++++
 arch/powerpc/include/asm/nmi.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 94dffa1dd223..f257cacb49a9 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -53,5 +53,11 @@ void __do_IRQ(struct pt_regs *regs);
 
 int irq_choose_cpu(const struct cpumask *mask);
 
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_NMI_IPI)
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

