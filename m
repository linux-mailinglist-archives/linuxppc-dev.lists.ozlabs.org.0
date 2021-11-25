Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0945D850
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 11:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0DlH0ywGz3c8p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 21:34:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jld7bJyz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jld7bJyz; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Dkd47Trz2xtR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 21:33:59 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id iq11so4876894pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 02:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uti4GyZsaJgrJ7k6soY+VvyoyKxX+DkZaIvxBJanjo=;
 b=jld7bJyzw+T0dq5UseQ01rsVKlZ5BOu8w2TP050FNVtZMLBti71oM2X0EV3Fv0VGdO
 YEsMP+XJQlRVZlXKcCjiTXlkwRjRE7hebPHDYWhwJrOoCmeOE20ESFgcc8b/Mw1mpl67
 wMTQluNTECNEJfPo1+DeRwe89hblx4GrQZ1mRawQNvGCUjVisMtNVfJRt9fEg1xd7yXv
 8a0k/Onj19RWXM2txH2yzDe3Q8sdjjC4L1jPjpsdjVVaGF+BIHv46/yCrleeVlEQ3d/X
 Mmzwz/+JiuHe/AGne5YvZkdokoa+ELzEqfutRO9+Tglj+l5IGgDnj97sTx1SUpCwiSnW
 vPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3uti4GyZsaJgrJ7k6soY+VvyoyKxX+DkZaIvxBJanjo=;
 b=awpDpPYzmsqQ9tmtBgYURStERYOZDMFkVZ6BDVjFCVrfzCcGe1RXUHfhVzjNEeBfFN
 degfdNLYIU8Gy8cvWIMlXb7PdJk4ILfSvk2ORVtJsxAYuYt2yfPDMSav2KJwUfqOMmg+
 8UIgfmYeAA2y/dtvs1K89UMWe87batjpoT3PCIiWvavbKeRs7hwtl6Pj03lEvvVVF1zr
 uFwytxyPBNgDDAcku3Azhn9Oz+U6+ZnLqcnuPpO1Mb9RzbCaJ21R/9zlJ0hyPpHYrjIj
 soczBCEa6LoxFxAviQEJ3PiDyia9gGxmnxsm3Z1QDMaHdWj/I1jlv9ob6EhPDH1M4bdq
 HGkA==
X-Gm-Message-State: AOAM533qvi3QnLcApVTyh4zDcIsPTRDbh8HP19/sJVeg0UUASSQq6UNg
 8MFZ1T6CnGpK43RUfG2Iog5vznGa8n5Kkw==
X-Google-Smtp-Source: ABdhPJxI+XtXnJ+hOOPy4z4+JLGonR5mOh9kcZ6hhEfr05aAtsGpw99tuIbMXSYOFmlDRSCKrtNbOQ==
X-Received: by 2002:a17:90a:430f:: with SMTP id
 q15mr5729543pjg.170.1637836436050; 
 Thu, 25 Nov 2021 02:33:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id x9sm7212170pjq.50.2021.11.25.02.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 02:33:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
Date: Thu, 25 Nov 2021 20:33:46 +1000
Message-Id: <20211125103346.1188958-1-npiggin@gmail.com>
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

wd_smp_last_reset_tb now gets reset by watchdog_smp_panic() as part of
marking CPUs stuck and removing them from the pending mask before it
begins any printing. This causes last reset times reported to be off.

Fix this by reading it into a local variable before it gets reset.

Fixes: 76521c4b0291 ("powerpc/watchdog: Avoid holding wd_smp_lock over printk and smp_send_nmi_ipi")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

This is the delta for patches 1-4 between v3 and v4 of the series which
is the result of fixing the bug in patch 3. Sending because v3 got
merged into powerpc next

Thanks,
Nick

 arch/powerpc/kernel/watchdog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index b6533539386b..23745af38d62 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -179,13 +179,14 @@ static void watchdog_smp_panic(int cpu)
 {
 	static cpumask_t wd_smp_cpus_ipi; // protected by reporting
 	unsigned long flags;
-	u64 tb;
+	u64 tb, last_reset;
 	int c;
 
 	wd_smp_lock(&flags);
 	/* Double check some things under lock */
 	tb = get_tb();
-	if ((s64)(tb - wd_smp_last_reset_tb) < (s64)wd_smp_panic_timeout_tb)
+	last_reset = wd_smp_last_reset_tb;
+	if ((s64)(tb - last_reset) < (s64)wd_smp_panic_timeout_tb)
 		goto out;
 	if (cpumask_test_cpu(cpu, &wd_smp_cpus_pending))
 		goto out;
@@ -210,8 +211,7 @@ static void watchdog_smp_panic(int cpu)
 	pr_emerg("CPU %d detected hard LOCKUP on other CPUs %*pbl\n",
 		 cpu, cpumask_pr_args(&wd_smp_cpus_ipi));
 	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
-		 cpu, tb, wd_smp_last_reset_tb,
-		 tb_to_ns(tb - wd_smp_last_reset_tb) / 1000000);
+		 cpu, tb, last_reset, tb_to_ns(tb - last_reset) / 1000000);
 
 	if (!sysctl_hardlockup_all_cpu_backtrace) {
 		/*
-- 
2.23.0

