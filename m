Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2DA44BA75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpqCc2b8hz30CK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 13:53:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IjQ8ndPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IjQ8ndPa; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpq9X5SsHz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 13:51:12 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so808677pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 18:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=blV/pWb8i/VPUCqUakRcwuChs1OQSrAXFGeQViLr4gk=;
 b=IjQ8ndPae+PxzgaB7w5sKxU9NtcBmmO1HpV+2qEG7CjZCpj1Tresv5kChSh+20xm+X
 CV3cQ+1LoplDbUQYs7rQ217fkSB8yHZvAAXZxopDojJUG2eRWj0YYxs/vFsw71aX5RL4
 GLrKaxMBCDl7mj4in4y5GKghSNcZraGy3E3s5qNFnhIrNzC2fOqWa4bxusZNadGbkmoa
 XkHyBBgw7X0oeWrHdksCkDn78P2kJ8/jT+GaNnWDmwNAkkGI02SjLOTpfKHXvlluLctt
 2lexgYFWNH0Ocl9FT0SKEShSNg6aaFSKYgb056lZYjc51U1q4mvHIV7H0cd2K+W6XK83
 VG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=blV/pWb8i/VPUCqUakRcwuChs1OQSrAXFGeQViLr4gk=;
 b=pM9ca0gs/N6qCA876RKoUIYUgImImXkj/L1sXepEVddvTxGiwdyPjNrCLEqEG4e+Om
 QZAgSrvjjdCsiaMo5BjB0RXCVOemKk85R02rEe+OxTarbnHZ1evEAwnKMj69zc6XekGJ
 zCGqy9GyA3iTNdS7xiv+Lxq/C6LaaQxv2ns+DE27dt6Jt7J1i/4dGsk/Z23Fs+BjcYBq
 u+zBu2tETZCUDE/Phgoc7q0s96zo9wfSFFgEQ/x6xeR/6EouhQIJpQ0Dl7M300EwuBBw
 YKtwVFEoLuSjlYsnyPIPgtxwl7mtHVMvUiS4nWcrPB6RpoKKRGyrvoRcyqWvRbZUisKJ
 hePg==
X-Gm-Message-State: AOAM531cKvgnyM3cm9bum6x5NLnAzpnrLjdqlO6WN1hvN0zsd8JIz41U
 g1Apr46FjLJxabo6tw4M54QE+xw9YDPEZg==
X-Google-Smtp-Source: ABdhPJwcQGhELnzTVtgdRZn5vAERuwu35Ve0V54Y7CaRG3+eor3Znwfc77jc1CPSH9UgWT6WvlwRtA==
X-Received: by 2002:a17:90b:384d:: with SMTP id
 nl13mr13241884pjb.80.1636512670290; 
 Tue, 09 Nov 2021 18:51:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.146.48.179])
 by smtp.gmail.com with ESMTPSA id b4sm21604406pfl.60.2021.11.09.18.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:51:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/4] powerpc/watchdog: tighten non-atomic read-modify-write
 access
Date: Wed, 10 Nov 2021 12:50:54 +1000
Message-Id: <20211110025056.2084347-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211110025056.2084347-1-npiggin@gmail.com>
References: <20211110025056.2084347-1-npiggin@gmail.com>
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

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 36 ++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 3c60872b6a2c..668ea1c13bef 100644
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
@@ -237,6 +237,22 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
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

