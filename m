Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C472DD279
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 14:56:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYSM2NR0zDqb0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 00:56:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MCBTCADb; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGb06SlzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:51 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id b5so4144515pjk.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qI/PyxRQV1nLHW53+iB1ulyMpApftHitzwW5skPu7Tw=;
 b=MCBTCADb0b7x9Tzp2y5My/EEEPVVkFuUR0m65xVc9VRPvWq0ry9XIcWX26Ul5Nszip
 QKyV0ZUndZQWkJ2LSlZxH/uHbPUfphTD70yT7+/XzHMlflJDlQAwF5kHnSIGR6alDsoo
 yPLhHMHE5EAE82YRKqpyQYdpYSj+ak6W+sFEUhnXdCptO4N5BxMk2BCF/U7dh2zlftmB
 Fo7qNVsvRAJNfW3Ns9BS/DnMvdw+BFMFIb7H2/qJNnoDbSC5BwDwwuc321/EH3dqGNJp
 hSHFJQqCxUYof38U7/EIwnPwjg3mhmmM86PeHeBQmTYvx7GMzBkU3By2DFaBh5um36/f
 5FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qI/PyxRQV1nLHW53+iB1ulyMpApftHitzwW5skPu7Tw=;
 b=JhEAxlw7q+14bSk2AEv0gLNI1hSeJ596CJvkoyMoUALSkDldbBhlvxL8K5SmW9ZML9
 3HYObEjLS3gun2thFUMQEh94aF/PrWN7yG/Ebq2THZ7FWWQ5QH79P64iPchKqg2OBLr5
 uIM+33vwZiaG8suZjoCdq61a+BRhveCivUDhLDeQD6c9N2S+IB0yQ2/Q9z9bOcCy1OA4
 j8duqghHC0RSCcFXSgh9+CuRq+c0UB1v0s2eT4kKKdn1G8Br2AVHWa98OG8lZJ7uyMZ2
 1O97Zvu9g/Gv28Id4Ovn7eAqja1tvc4Bjx5qSuHKOre+llxXyYwXCEJPcTrSgNTIMj69
 F0KA==
X-Gm-Message-State: AOAM533Hru2T3a7ACLEViPZc8oR7XREmLwBHS+3GuvPt8kpHSjaVdOSp
 fyjnbAiRYk99vQ1NbaNOkBt7ltxnc6dGXA==
X-Google-Smtp-Source: ABdhPJwtN3GSJbg9L/KznHKhcqVK0Dhbv7coyLmKpRKtmqvKl+jfEAC8D+/LMj9HpUzTcnQ14GI8Dw==
X-Received: by 2002:a17:90b:3845:: with SMTP id
 nl5mr8162310pjb.108.1608212868835; 
 Thu, 17 Dec 2020 05:47:48 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/64s/radix: Allow mm_cpumask trimming from
 external sources
Date: Thu, 17 Dec 2020 23:47:28 +1000
Message-Id: <20201217134731.488135-5-npiggin@gmail.com>
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

mm_cpumask trimming is currently restricted to be issued by the current
thread of a single-threaded mm. This patch relaxes that and allows the
mask to be trimmed from any context.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 5b62e2e7371c..7b199bee4baa 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -657,20 +657,16 @@ static void do_exit_flush_lazy_tlb(void *arg)
 	}
 
 	/*
-	 * This IPI is only initiated from a CPU which is running mm which
-	 * is a single-threaded process, so there will not be another racing
-	 * IPI coming in where we would find our cpumask already clear.
-	 *
-	 * Nothing else clears our bit in the cpumask except CPU offlining,
-	 * in which case we should not be taking IPIs here. However check
-	 * this just in case the logic is wrong somewhere, and don't underflow
-	 * the active_cpus count.
+	 * This IPI may be initiated from any source including those not
+	 * running the mm, so there may be a racing IPI that comes after
+	 * this one which finds the cpumask already clear. Check and avoid
+	 * underflowing the active_cpus count in that case. The race should
+	 * not otherwise be a problem, but the TLB must be flushed because
+	 * that's what the caller expects.
 	 */
 	if (cpumask_test_cpu(cpu, mm_cpumask(mm))) {
 		atomic_dec(&mm->context.active_cpus);
 		cpumask_clear_cpu(cpu, mm_cpumask(mm));
-	} else {
-		WARN_ON_ONCE(1);
 	}
 
 out_flush:
-- 
2.23.0

