Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 339762BA0B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 04:01:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CchCP6vxBzDqvL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 14:01:37 +1100 (AEDT)
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
 header.s=20161025 header.b=il5a5qT5; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cch7W2XX5zDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 13:58:14 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id v21so6075494pgi.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 18:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q42fM4ZSIDgOH+Mf6O95q9fJDIQslntwrCj9m7v0fAM=;
 b=il5a5qT5GhoI0zFTEmAdt7mgc5YhNELB5BUm/X+UnY3o0UulHn4iKnyFczSPmjxf5w
 f9mzQ0P3hRqZ2d/F+tD/aZxtJuWZhq7I0o+gOshc1ytAgqvyxiOiJvgEjkgl3cYMQqYd
 K6OUC+JCKftMOdrOtnhSvN59U02NuUhLkJIzxzbihHcCLF50yfwFsZUXqSViTEc8KW1F
 omeOUC0d724X6twEaZ9cXN6NnH3UAvec3ERcd2K1nKR7ISUobXY2LRD4h/95Jh+vanJK
 qnDFR4Y4L1oM8cyBHFENGmiGQBrIoEhMBjZFOStJWQWyGPCH8v7M+P+7P01aZRjr+ZuB
 jyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q42fM4ZSIDgOH+Mf6O95q9fJDIQslntwrCj9m7v0fAM=;
 b=OQe9h7E5v+dvjP9sAxcdkzTyZ4Jd8Eo0QWm6/nYDV105ZmN1m3MK7sgs/ciu5cvO+f
 zm7KJ1OmIXlh3ZJF0O69wZfNfH9G6r491nGQEXdHVqxdhdWmX4f0g3yod02dwVyWcbyr
 U3NEEifYwVdlVbykw3soljmgUp6+gk6Zcjr4LQxsUaf1+Aoz6WXhnqx+KwKanQXBMkGO
 UYZFr+QpEeDpaDBCAVjc4S3SPmn63ZddJMmOFqAxTKQ4/rzLHz+1RLQiohvvfm3sdTEb
 4ESeoBA3fxbUr4nR9NQ+J+Z8dpIPmGZCM3PCV9wS3QD9VuFkH0SeSMOifQQto9LOC9BX
 N73A==
X-Gm-Message-State: AOAM532fAVXJ8FyLf2i7lc+kGnDB5M3eHUYmt1S6GDTLrHoSezWCm3jW
 OqxerQnWvigqCxhZyDwmRPgRNYgxe4E=
X-Google-Smtp-Source: ABdhPJzlFdgiY8nhDpctzfQWziRzH+2sGa8JchrR0FDb3F6LH1TeRaqva7hULV5KCaWQo/Hs0U9KMw==
X-Received: by 2002:a62:5c87:0:b029:197:5f13:b66c with SMTP id
 q129-20020a625c870000b02901975f13b66cmr11843999pfb.73.1605841092254; 
 Thu, 19 Nov 2020 18:58:12 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id i130sm1181212pgc.7.2020.11.19.18.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 18:58:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] kernel/cpu: add arch override for
 clear_tasks_mm_cpumask() mm handling
Date: Fri, 20 Nov 2020 12:57:56 +1000
Message-Id: <20201120025757.325930-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201120025757.325930-1-npiggin@gmail.com>
References: <20201120025757.325930-1-npiggin@gmail.com>
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
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc keeps a counter in the mm which counts bits set in mm_cpumask as
well as other things. This means it can't use generic code to clear bits
out of the mask and doesn't adjust the arch specific counter.

Add an arch override allowing powerpc to use clear_tasks_mm_cpumask().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 kernel/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 6ff2578ecf17..2b8d7a5db383 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -815,6 +815,10 @@ void __init cpuhp_threads_init(void)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
+#ifndef arch_clear_mm_cpumask_cpu
+#define arch_clear_mm_cpumask_cpu(cpu, mm) cpumask_clear_cpu(cpu, mm_cpumask(mm))
+#endif
+
 /**
  * clear_tasks_mm_cpumask - Safely clear tasks' mm_cpumask for a CPU
  * @cpu: a CPU id
@@ -850,7 +854,7 @@ void clear_tasks_mm_cpumask(int cpu)
 		t = find_lock_task_mm(p);
 		if (!t)
 			continue;
-		cpumask_clear_cpu(cpu, mm_cpumask(t->mm));
+		arch_clear_mm_cpumask_cpu(cpu, t->mm);
 		task_unlock(t);
 	}
 	rcu_read_unlock();
-- 
2.23.0

