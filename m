Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334214456FD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:15:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTHn11SSz3cjr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:15:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VtXG9k4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VtXG9k4u; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTCW1xJyz2yLv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:11:19 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id p18so7944658plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9AXcbG4KSZwIU2h/S5yrB5tF1pdeiOAyNFrjQoVYOw=;
 b=VtXG9k4uaqwx8y1e/yGAyLaesDUKbnuRRIDdgwwr1LN6UIpe6VT9YOgutqANFY0I+f
 lr/DoqnVW0XnBdm1Lf5zFfxHkYRgsEtVkPBSWPZoLuVWS0+GGakddnxvfeMB3rRT7HOm
 dLrCCsR17saCFTZ6VK6lhdc+BDLa7cLFa4v+H/EIzUfOxN9w/UglM0hfGwBiMiU8YfI4
 UWdXNMjXMmQZNUO9ruZ6rFynl8d6Sv6HJXpCCwmYJFiSpuJCsAwF741JmGqQ1D+bzrts
 uaq+tIMkiXR7WJKF61j/XzLcJVN7TPg1eQtVGJ+6hQ2Q2TJII43bMXcnTTfcMkhUjMR3
 hytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9AXcbG4KSZwIU2h/S5yrB5tF1pdeiOAyNFrjQoVYOw=;
 b=J4S3GJ8MB5/khdsUh6NzfKg0MJ8etgB5uzbq0vY0Fka0WEzVTPOF1NTleAayWdMC2L
 Mhgsa3uZo4DzeO1v4ccU9VngEdiizT6oHm9d/MGqL2RxirOR+aFwSAS/+z7Zo/Lyk7N0
 3sy9+T7wm7WyiH52OK5KpVXzjb2O6AbnFLw+NirxQ7/0BTy9Zz54JuVmGL8suwfJa4nt
 WEP96Z5JDnIZeMaM8FLWmgz/0Acp+J5pTkIkcemGwLt9r0+x+RnCUPrn3R6CtalOUiGD
 FwcWow7Y7j9c6HN7h0PWrWSbjrHe7wVxvuit9OU0RAGXXvenWlghtDRZapG5brO1UlHe
 XShw==
X-Gm-Message-State: AOAM531IT4I2alup07gL2S5L3NrceZzbmo0cBV9FlRhMbB9NBit2VmJ9
 xnS37q9m/RidipP/ICiDKnOrl2qPvIM=
X-Google-Smtp-Source: ABdhPJz9ZepEr7VEkQXQeEkvS33rO6Y+F7Ts2zU2xsp+WMGPmTTP//wVAmg3nJ5RLS4FDTtS0jLx5g==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr11710723pjb.218.1636042274303; 
 Thu, 04 Nov 2021 09:11:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 h3sm5897890pfi.207.2021.11.04.09.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:11:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/5] powerpc/watchdog: Remove backtrace print from unstuck
 message
Date: Fri,  5 Nov 2021 02:10:57 +1000
Message-Id: <20211104161057.1255659-6-npiggin@gmail.com>
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

The watchdog unstuck message can't be serialised with other watchdog
messages because that might prevent watchdog reporting. This removes
the big backtrace from the unstuck message, which can get mixed with
other messages and confuse logs, and just prints a single line.

Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/watchdog.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 2444cd10b61a..5f69ba4de1f3 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -242,16 +242,10 @@ static void wd_smp_clear_cpu_pending(int cpu)
 {
 	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
 		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
-			struct pt_regs *regs = get_irq_regs();
 			unsigned long flags;
 
 			pr_emerg("CPU %d became unstuck TB:%lld\n",
 				 cpu, get_tb());
-			print_irqtrace_events(current);
-			if (regs)
-				show_regs(regs);
-			else
-				dump_stack();
 
 			wd_smp_lock(&flags);
 			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
-- 
2.23.0

