Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03D2DD272
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:50:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYL33bFyzDqW1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:50:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QPA76Wdu; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGS1vz8zDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:43 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id be12so2119905plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPsb/4fI9G88ggjmyRcdaOTn7/nC835zjMG0iwy8nE4=;
 b=QPA76Wdu32y4E/v1ReP9XePvRMlgxzd9jjuR+ROciwCregl9cw+NbEL76/k6msEkXI
 leIULe2K9mt53g4lx9VCVxeD6qm55QewWSfScO6hfRedLqviee/jJtDqxNpmXlCWGQCS
 Vi/0KY7mPWBCOyzZtuTJjiG86xJj8JNVN+aC+PW1ssyNpecQV+sQw8nCV8pMeL8PShla
 /cPoFoiP4B0uBGiCd2gq+O9IEB8a1nKfCThMafx54UVGS6cQp7zQcnc+QhkX+2wplYIP
 IBRzkBCfiwE63/BARsty4EnW6WONkfJYbReLArlEc7LiEvF2UMa4j3ndQvRozX6krMOu
 kYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPsb/4fI9G88ggjmyRcdaOTn7/nC835zjMG0iwy8nE4=;
 b=ogTg4PK46tyhgdqb+zl9zhJk9tdhufBphevd9gp5zVK45D0qp/ZQ77Z7Tbsgni5HaK
 /qMDHVTJZtXaE0GCaOioCsnev0qTnZDx6AcWylX4JH1iUaDI47b/b3o8CF8jQXm+vd4p
 Jb+nFSKBoONPc/TPJdrBI2wDCY9mV5oQWC1jxWPBhlD1nuDXt92kOLdeh7G785U2l2N9
 pWcVqR+eHAZjMXCmZkomBsQMTzNRXbqKGRAX8j8xq4RLyfofsE1Jf1fnp4FgHDMTdltO
 +ay67RwYN5XNuh+O0wevHAwiVMhtq/BeMiN+i9CikIarmhLkdOZx4Vua4xM7F6b64Uot
 EF7Q==
X-Gm-Message-State: AOAM531dciqWzr7pImzNp/n0hahOkmfiV27weo+aPe5cSwSb23UwbpmB
 XCbnrS3n9yY0XNegjFB71ddUsV8iyP6BAw==
X-Google-Smtp-Source: ABdhPJy9zcCZkc3fSYkU2lns1lP4sM0yJu7bby0SgsVk/CDUwfe49C3R49kVjtFQuFirwPmgYqjxXw==
X-Received: by 2002:a17:902:b70f:b029:da:b944:f3b7 with SMTP id
 d15-20020a170902b70fb02900dab944f3b7mr35883068pls.82.1608212861328; 
 Thu, 17 Dec 2020 05:47:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] powerpc/64s/radix: add warning and comments in mm_cpumask
 trim
Date: Thu, 17 Dec 2020 23:47:25 +1000
Message-Id: <20201217134731.488135-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217134731.488135-1-npiggin@gmail.com>
References: <20201217134731.488135-1-npiggin@gmail.com>
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

Add a comment explaining part of the logic for mm_cpumask trimming, and
add a (hopefully graceful) check and warning in case something gets it
wrong.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index b487b489d4b6..5f09e0cd0016 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -644,13 +644,14 @@ static void do_exit_flush_lazy_tlb(void *arg)
 {
 	struct mm_struct *mm = arg;
 	unsigned long pid = mm->context.id;
+	int cpu = smp_processor_id();
 
 	/*
 	 * A kthread could have done a mmget_not_zero() after the flushing CPU
-	 * checked mm_is_singlethreaded, and be in the process of
-	 * kthread_use_mm when interrupted here. In that case, current->mm will
-	 * be set to mm, because kthread_use_mm() setting ->mm and switching to
-	 * the mm is done with interrupts off.
+	 * checked mm_cpumask, and be in the process of kthread_use_mm when
+	 * interrupted here. In that case, current->mm will be set to mm,
+	 * because kthread_use_mm() setting ->mm and switching to the mm is
+	 * done with interrupts off.
 	 */
 	if (current->mm == mm)
 		goto out_flush;
@@ -664,8 +665,22 @@ static void do_exit_flush_lazy_tlb(void *arg)
 		mmdrop(mm);
 	}
 
-	atomic_dec(&mm->context.active_cpus);
-	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(mm));
+	/*
+	 * This IPI is only initiated from a CPU which is running mm which
+	 * is a single-threaded process, so there will not be another racing
+	 * IPI coming in where we would find our cpumask already clear.
+	 *
+	 * Nothing else clears our bit in the cpumask except CPU offlining,
+	 * in which case we should not be taking IPIs here. However check
+	 * this just in case the logic is wrong somewhere, and don't underflow
+	 * the active_cpus count.
+	 */
+	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
+		atomic_dec(&mm->context.active_cpus);
+		cpumask_clear_cpu(cpu, mm_cpumask(mm));
+	} else {
+		WARN_ON_ONCE(1);
+	}
 
 out_flush:
 	_tlbiel_pid(pid, RIC_FLUSH_ALL);
-- 
2.23.0

