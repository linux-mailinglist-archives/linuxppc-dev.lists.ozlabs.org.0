Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6D1CA278
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:59:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JJ5x0WjpzDqnr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:59:33 +1000 (AEST)
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
 header.s=20161025 header.b=mK+yjD3p; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHYK5tZ2zDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:45 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id t11so302969pgg.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV/k3cRrj2UhbuAe0JAVMxGZ7uNcX+9jFtQRwk1Dsco=;
 b=mK+yjD3p/ys94m1ns9vDvAK0zVTxj7KE9dP0+aAf2AEXTqyZbGtHu76ELjd1YiOmYe
 AdukloMw95iu+5f8W4LPXcYPm7ecESXErLYLVxDaVYsie2hzZ5ZhiU1EJDT85RShBShm
 jCXQBCAoPx5sS3+jzQ2gAj0OSDUBBp50vwgq3SB9fzJLlJDgpmaMYf+4T6M0YEDL0NFm
 mYbJKbV+mTjeTXIviws4rni1CVczAPrmsVFoV1onXwr0qcE2qhWawlGI9NhPWpT8n0XM
 9w8jLczDPdOorZr80qvwrFwfbKs2fvSMLipFmRrMkI2ieBCb1MGMPbYU94k5kNNWZ8Ti
 SpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV/k3cRrj2UhbuAe0JAVMxGZ7uNcX+9jFtQRwk1Dsco=;
 b=bM3WuL4OJgsp3qMbw+T+AW3m9qLYTmRC48CygI4RHCpA7soUYthq13UQun6LU/iM8t
 YNQg8k4Ms0jmj4oM0BREsTcfkeyHcQZjxbM21hGqleTqjrY52+TuPvnjQiZ1GCZNV6ET
 JPGEI6+ZkXaoucfN2qpUxJMuGVIgDeDBVRSAGKzqaGrghQcuTIdWbmqpx76SVtBZg8T7
 MdxuNLfD/lhELXV4EXHVnWFehSwIYDy436RoLobphclPffziqtDzi7mwL+hew4dcuweF
 7cuqo0SO+ZtGOo1W8E9w11Dt0lFvBmyS8IdQPjNqb2Pk5TPas/MSp1r5RjZKzJUqEz+e
 r32w==
X-Gm-Message-State: AGi0PuZafiuDu+98B/FFDTO3yiuJIvqXmsDfloFXXgAgVUsEKaf4Gp83
 Obd/PSA2egVzQ6T3uLaIpCHozTTm
X-Google-Smtp-Source: APiQypK34GMCBMAVG8xxdN8uCZg0ajsP8vbhnyWciXbbHC0Pg9vlSlwS2nupnMouN/ANkg1th0rqXw==
X-Received: by 2002:aa7:8ad6:: with SMTP id b22mr778310pfd.251.1588912482893; 
 Thu, 07 May 2020 21:34:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/16] powerpc/64s: machine check interrupt update NMI
 accounting
Date: Fri,  8 May 2020 14:34:03 +1000
Message-Id: <20200508043408.886394-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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

machine_check_early is taken as an NMI, so nmi_enter is used there.
machine_check_exception is no longer taken as an NMI (it's invoked
via irq_work in the case a machine check hits in kernel mode), so
remove the nmi_enter from that case.

In NMI context, hash faults don't try to refill the hash table, which
can lead to crashes accessing non-pinned kernel pages. System reset
still has this potential problem.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce.c     |  7 +++++++
 arch/powerpc/kernel/process.c |  2 +-
 arch/powerpc/kernel/traps.c   | 14 +++++++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 8077b5fb18a7..be7e3f92a7b5 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -574,6 +574,9 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 long machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
+	bool nested = in_nmi();
+	if (!nested)
+		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
 
@@ -582,6 +585,10 @@ long machine_check_early(struct pt_regs *regs)
 	 */
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
+
+	if (!nested)
+		nmi_exit();
+
 	return handled;
 }
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9c21288f8645..44410dd3029f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1421,7 +1421,7 @@ void show_regs(struct pt_regs * regs)
 		pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar, regs->dsisr);
 #endif
 #ifdef CONFIG_PPC64
-	pr_cont("IRQMASK: %lx ", regs->softe);
+	pr_cont("IRQMASK: %lx IN_NMI:%d IN_MCE:%d", regs->softe, (int)get_paca()->in_nmi, (int)get_paca()->in_mce);
 #endif
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(regs->msr))
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..9f6852322e59 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -823,7 +823,19 @@ int machine_check_generic(struct pt_regs *regs)
 void machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
-	bool nested = in_nmi();
+	bool nested;
+
+	/*
+	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
+	 * (it uses its own early real-mode handler to handle the MCE proper
+	 * and then raises irq_work to call this handler when interrupts are
+	 * enabled). Set nested = true for this case, which just makes it avoid
+	 * the nmi_enter/exit.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) || in_nmi())
+		nested = true;
+	else
+		nested = false;
 	if (!nested)
 		nmi_enter();
 
-- 
2.23.0

