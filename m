Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9524456EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:12:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTDq3j6nz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RPrFIJap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RPrFIJap; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTCL1SYKz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:11:09 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id s5so6338972pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjBfRNWQVZWaErtHNHB50ZUExIhYxf1ScPKnI+Jufg4=;
 b=RPrFIJapFp6Pvd9iFPEKCGBHC0g+baxD82ReihgOm6rOHFEXFVsPlinCYyewVX6h74
 /i2CiMH0c5+H1BGcO0jIv54KN9+/yBK9lcI8lD/1IQBF5PRKOfxlqN/1cVWeFzqWMQY/
 YEqtbfQurYR05YMeo2qm/FvkiGR1hnu3g1uKUZxh02OYkovZesJyDMeTB0Ukdqox+GXp
 fHLZOv5EIZkfuEdipmd+mkArTuXjzJmfvfhDutVUOZ4SdNyAOObToLaS4/VBB3i5FOLw
 +oiv9K43seSegzTVRegPDs//GXDbwtLQB8ifbKYH9WC++VJ879as/B4wOgvHrisA7JbM
 eBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjBfRNWQVZWaErtHNHB50ZUExIhYxf1ScPKnI+Jufg4=;
 b=QNdfmtO/ec3EM83wOUMclBEIBavbx9yefCRqqbSWjDBlHoHxCqPrruQkbqsvk90wFs
 CSjRZvxCKKFwQT8QN4TMqkl7hI/WAKjqVWURa/OxeEuVT1IxAVPPp91V251LYdYofkA9
 FBje5QVhzlKAfLhLguRV0xJcmAksBa3Tav0qyEEdPyXrfBU9+v+CN4E8JNSVprx7B5EJ
 Vx3jfdEIZGUSi2KoqXydCds/GB/cnJt2oqBP/auwQdrk5M17GfrCcbTsviUx8KZ8hXk+
 lnIA15uYNl2E1yuWTmLcqZEeSB7IgmsQ0dF4FtSpzrRD8etl8fQ71dbOqlI76ODw6sj3
 iZXw==
X-Gm-Message-State: AOAM531WsufRoK4bywQIPtDMqHZcG597aWiGny/CxQ2Yft4zL0sxbIp1
 /PaGyBPo/CGTpbyO8QehInr6IhvKcJU=
X-Google-Smtp-Source: ABdhPJw09mFa7u8uaVT3eMHusG9ANRAOpSCr/kl/jWnY95/8HK+okfB9kWNp0HUQlZlYoJ8fcktYGg==
X-Received: by 2002:a63:4b58:: with SMTP id k24mr32412566pgl.326.1636042267580; 
 Thu, 04 Nov 2021 09:11:07 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 h3sm5897890pfi.207.2021.11.04.09.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:11:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] powerpc/watchdog: Tighten non-atomic read-modify-write
 access
Date: Fri,  5 Nov 2021 02:10:54 +1000
Message-Id: <20211104161057.1255659-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211104161057.1255659-1-npiggin@gmail.com>
References: <20211104161057.1255659-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most updates to wd_smp_cpus_pending are under lock except the watchdog
interrupt bit clear.

This can race with non-atomic RMW updates to the mask under lock, which
can happen in two instances:

Firstly, if another CPU detects this one is stuck, removes it from the
mask, mask becomes empty and is re-filled with non-atomic stores. This
is okay because it would re-fill the mask with this CPU's bit clear
anyway (because this CPU is now stuck), so it doesn't matter that the
bit clear update got "lost". Add a comment for this.

Secondly, if another CPU detects a different CPU is stuck and removes it
from the pending mask with a non-atomic store to bytes which also
include the bit of this CPU. This case can result in the bit clear being
lost and the end result being the bit is set. This should be so rare it
hardly matters, but to make things simpler to reason about just avoid
the non-atomic access for that case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 36 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index be80071336a4..1d2623230297 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -131,10 +131,10 @@ static void wd_lockup_ipi(struct pt_regs *regs)
 	/* Do not panic from here because that can recurse into NMI IPI layer */
 }
 
-static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
+static bool set_cpu_stuck(int cpu, u64 tb)
 {
-	cpumask_or(&wd_smp_cpus_stuck, &wd_smp_cpus_stuck, cpumask);
-	cpumask_andnot(&wd_smp_cpus_pending, &wd_smp_cpus_pending, cpumask);
+	cpumask_set_cpu(cpu, &wd_smp_cpus_stuck);
+	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 	/*
 	 * See wd_smp_clear_cpu_pending()
 	 */
@@ -144,11 +144,9 @@ static void set_cpumask_stuck(const struct cpumask *cpumask, u64 tb)
 		cpumask_andnot(&wd_smp_cpus_pending,
 				&wd_cpus_enabled,
 				&wd_smp_cpus_stuck);
+		return true;
 	}
-}
-static void set_cpu_stuck(int cpu, u64 tb)
-{
-	set_cpumask_stuck(cpumask_of(cpu), tb);
+	return false;
 }
 
 static void watchdog_smp_panic(int cpu, u64 tb)
@@ -177,15 +175,17 @@ static void watchdog_smp_panic(int cpu, u64 tb)
 		 * get a backtrace on all of them anyway.
 		 */
 		for_each_cpu(c, &wd_smp_cpus_pending) {
+			bool empty;
 			if (c == cpu)
 				continue;
+			/* Take the stuck CPUs out of the watch group */
+			empty = set_cpu_stuck(c, tb);
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
+			if (empty)
+				break;
 		}
 	}
 
-	/* Take the stuck CPUs out of the watch group */
-	set_cpumask_stuck(&wd_smp_cpus_pending, tb);
-
 	wd_smp_unlock(&flags);
 
 	if (sysctl_hardlockup_all_cpu_backtrace)
@@ -232,6 +232,22 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
 		return;
 	}
 
+	/*
+	 * All other updates to wd_smp_cpus_pending are performed under
+	 * wd_smp_lock. All of them are atomic except the case where the
+	 * mask becomes empty and is reset. This will not happen here because
+	 * cpu was tested to be in the bitmap (above), and a CPU only clears
+	 * its own bit. _Except_ in the case where another CPU has detected a
+	 * hard lockup on our CPU and takes us out of the pending mask. So in
+	 * normal operation there will be no race here, no problem.
+	 *
+	 * In the lockup case, this atomic clear-bit vs a store that refills
+	 * other bits in the accessed word wll not be a problem. The bit clear
+	 * is atomic so it will not cause the store to get lost, and the store
+	 * will never set this bit so it will not overwrite the bit clear. The
+	 * only way for a stuck CPU to return to the pending bitmap is to
+	 * become unstuck itself.
+	 */
 	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
 
 	/*
-- 
2.23.0

