Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BF2C5207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:31:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChYvl1mDrzDrBg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yl1/7mkI; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChYnB6ZRpzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:25:49 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 131so1255743pfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cjV5GYuWAfA8mSdft9LAlW0gOhgTWtZ1LrOPDwiip+E=;
 b=Yl1/7mkIPLobIN4HbAJgJ4Hr9+xOzyjFAWgs6T4HbfPzyFXteFVUeh+m6yeWxJPEb7
 v9JNeZzrmrzxwvMegaOx060R2SxCtvMehlhOralcRazM31DGR8wcpbCuhke/9Cf6hdmI
 dkCB4qQxAE2mEEk/zCcqF1746yG5hhKfM1DgkPDPFVbAebCDHmEWGlitdD7/0R/c9Zv3
 tBJQhmHH6AmlNX3JVAsTkqvVl/E/v+qDmqE4sAqO4IKxc4qtIbMW1zgOBzG0oHPOCXjO
 S8rBg6MHiLkMHrUhohWSLSKYQISqk6BXkcZBjF5IsQmP0ftftNnYowkAqF6Yf0V6xYqu
 Phvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cjV5GYuWAfA8mSdft9LAlW0gOhgTWtZ1LrOPDwiip+E=;
 b=GVFzhDXLrSRlJCkLTh9faX7JkHtzWl+0tLk89M+FnL5lVrb1LG56q2xTFO1X4+KCfQ
 IS2RiQH4ntrZOCFCiqqNrmcZQElX0k3sO0OOYQljnOzXAEbqwNRZ/1EJ3+2/8Tfqp68U
 odDD5xxS9h9eeFs2iy/d//5wc2JroV8qNscL0nkBpg9lhTz7uOmhBr4mQUVc114G2CxM
 iMzH8bvgTUiC2dbwUpVqzlxX5TTuQ3cUGIXmq6lfMgmuSvg7n5L4g1VnwqAQXj5RhPby
 F5hf3Ax1Lq4lbFJTGbooxL5VQH79tPIg64dYmGiCCHccZM9I8ShWizcVQ0JrCxBP/uo9
 J7+Q==
X-Gm-Message-State: AOAM531AobU5QS/HpsSg4PGFPYqGuTMa53uwYq6euHEWhbcG+l728hxG
 MC2yyMrDkH6Q7GEGq0kZiDIFVkL2+rwvDw==
X-Google-Smtp-Source: ABdhPJxXgl7kf0WdalfEGZbJQ7pf4LeqBqI4qgKwlOFXSKh2ddH4knwIVoYfEqNed3LVTmIaGAGRgA==
X-Received: by 2002:a17:90a:f288:: with SMTP id
 fs8mr15405pjb.184.1606386347510; 
 Thu, 26 Nov 2020 02:25:47 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id h7sm4338134pgr.33.2020.11.26.02.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:25:47 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] kernel/cpu: add arch override for
 clear_tasks_mm_cpumask() mm handling
Date: Thu, 26 Nov 2020 20:25:29 +1000
Message-Id: <20201126102530.691335-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Milton Miller <miltonm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc/64s keeps a counter in the mm which counts bits set in
mm_cpumask as well as other things. This means it can't use generic code
to clear bits out of the mask and doesn't adjust the arch specific
counter.

Add an arch override that allows powerpc/64s to use
clear_tasks_mm_cpumask().

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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

