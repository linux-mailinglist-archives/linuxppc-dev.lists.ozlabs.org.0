Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E5A70EDA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR14T2dnPz3fFp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:10:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NFHsc9hw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NFHsc9hw;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR12n30hnz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:08:33 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso382034b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908511; x=1687500511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHRrz+AGNmJliP5aOJUlFgtC9T/nLlGEtygMnlMlFwk=;
        b=NFHsc9hwv/Mc9mA6uYrnVOWvhi8x/MdNc66Dq6Uu5RQ3d/l0/7Oi0viuudvrrvq0Iv
         u6yPUhUZQUJpDI4xR5nxW61vnGcCedgzTwecaIFUGjdxj2XE4Z/5rVZQm3A/5zXtTj+1
         8UE65Xj1+JFkPzRheZ8uGXgP1K+6M70x27n91UJ6nQwH0dQfi05JbRYEJcE5pRxrdnfk
         azXYPu5RGbw+FExt5Vq7vFM2+VxcD87+r1NIzGsE72Rggwpa5QEzcaifw9RfS9Ylj6+M
         LKVk909cbWXVBgHFwIbQTex/mfzAmd8imQnuoDxOoKuXhL/YAt0IsLGqYnEikWsIpqmy
         DoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908511; x=1687500511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHRrz+AGNmJliP5aOJUlFgtC9T/nLlGEtygMnlMlFwk=;
        b=hSNxuYQoy3nGlZsfw3TRUIvFGOCGil+m1m66I/Vvtccv5REF9coA0nfVDWPQXSWByb
         ZPml3nk3FA5eC+PeYtTmJwgu0cIHqlN8yuJE6yHIaV9wBHWIdy+6qixyAI3P2bS2GJIi
         l2uM9w27qCl1qCQHGFnbOQC+00kEglccXQAvbGAR6dIBlWtQLxI3XPu5paem0TtF7Wtk
         MZ9vc1W3+1YuDBFzzNSS3heqVqwZcxD9bimR3g6MUhNYFUwIpNdHdUwxWFXx9EpQhEaW
         CWN+FD6J7Zti3ce0Ca6kva/N5Whyxo9gGOmEsQHR4KcbxC1Ea9ss7Hk+N2yDzRYJHcEy
         9keA==
X-Gm-Message-State: AC+VfDyYLb/UYIKsMMik/ZpruZjz0qONaSJJfEeMIJDCT+2Igta0eY1+
	/f+bs6WHHea39Hn0R/8Dvd4MuWQFxGk=
X-Google-Smtp-Source: ACHHUZ7wfFfh9j5weGGZoSRb+OxRWyu8cyLicJpGhyfElakzQg0ANZ6XWrtM6mFAUIrHFJodaWYSyg==
X-Received: by 2002:a17:902:e848:b0:1ad:d500:19d3 with SMTP id t8-20020a170902e84800b001add50019d3mr21348233plg.23.1684908510636;
        Tue, 23 May 2023 23:08:30 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001aaecb74f82sm7793019plj.72.2023.05.23.23.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:08:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc: Account mm_cpumask and active_cpus in init_mm
Date: Wed, 24 May 2023 16:08:18 +1000
Message-Id: <20230524060821.148015-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524060821.148015-1-npiggin@gmail.com>
References: <20230524060821.148015-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

init_mm mm_cpumask and context.active_cpus is not maintained at boot
and hotplug. This seems to be harmless because init_mm does not have a
userspace and so never gets user TLBs flushed, but it looks odd and it
prevents some sanity checks being added.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup-common.c |  6 +++++-
 arch/powerpc/kernel/smp.c          | 12 ++++++++++++
 arch/powerpc/mm/mmu_context.c      |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index d2a446216444..16843294d978 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -969,8 +969,12 @@ void __init setup_arch(char **cmdline_p)
 	klp_init_thread_info(&init_task);
 
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
-
+	/* sched_init() does the mmgrab(&init_mm) for the primary CPU */
+	VM_WARN_ON(cpumask_test_cpu(smp_processor_id(), mm_cpumask(&init_mm)));
+	cpumask_set_cpu(smp_processor_id(), mm_cpumask(&init_mm));
+	inc_mm_active_cpus(&init_mm);
 	mm_iommu_init(&init_mm);
+
 	irqstack_early_init();
 	exc_lvl_early_init();
 	emergency_stack_init();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 265801a3e94c..76a57dc753c8 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -47,6 +47,7 @@
 #include <asm/smp.h>
 #include <asm/time.h>
 #include <asm/machdep.h>
+#include <asm/mmu_context.h>
 #include <asm/cputhreads.h>
 #include <asm/cputable.h>
 #include <asm/mpic.h>
@@ -1615,6 +1616,9 @@ void start_secondary(void *unused)
 
 	mmgrab_lazy_tlb(&init_mm);
 	current->active_mm = &init_mm;
+	VM_WARN_ON(cpumask_test_cpu(smp_processor_id(), mm_cpumask(&init_mm)));
+	cpumask_set_cpu(cpu, mm_cpumask(&init_mm));
+	inc_mm_active_cpus(&init_mm);
 
 	smp_store_cpu_info(cpu);
 	set_dec(tb_ticks_per_jiffy);
@@ -1750,6 +1754,14 @@ int __cpu_disable(void)
 
 void __cpu_die(unsigned int cpu)
 {
+	/*
+	 * This could perhaps be a generic call in idlea_task_dead(), but
+	 * that requires testing from all archs, so first put it here to
+	 */
+	VM_WARN_ON_ONCE(!cpumask_test_cpu(cpu, mm_cpumask(&init_mm)));
+	dec_mm_active_cpus(&init_mm);
+	cpumask_clear_cpu(cpu, mm_cpumask(&init_mm));
+
 	if (smp_ops->cpu_die)
 		smp_ops->cpu_die(cpu);
 }
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 1fb9c99f8679..894468975a44 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -47,6 +47,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 
 	/* Mark this context has been used on the new CPU */
 	if (!cpumask_test_cpu(smp_processor_id(), mm_cpumask(next))) {
+		VM_WARN_ON_ONCE(next == &init_mm);
 		cpumask_set_cpu(smp_processor_id(), mm_cpumask(next));
 		inc_mm_active_cpus(next);
 
-- 
2.40.1

