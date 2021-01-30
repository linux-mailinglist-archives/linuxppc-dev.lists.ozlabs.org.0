Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 220773095C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:15:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbpG1fVZzDsTk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:15:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s7kMLzkr; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZM33287zDrVB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:23 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id h15so7084773pli.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5BWe7D7WxyRyYiMtz3JT/sp3Kz4YbXoIbO4vUD8G2s=;
 b=s7kMLzkreJdwfBNU5EuRbAjvlKLoV4NsjjHmCetyOnD1Nc/bqCjijwTbnTmNDFG5cf
 c4FRY9GBCdD1B4+rCe8dOT9hygs69VCyKUNZYJkpkiZz5uG15CmOEL9dVN55sGMPzj2O
 juAae7XW8ZrxsdQce83UONFEydsd52GcKLe825e2VVz1l736AgxkzupuK+aNXXh0zhP1
 sBMPZjT138M/tyGuEUi8N21DOFYyE1O5rC9MfthVzq3dow2grPNfijdqoEvAh0ivf+X+
 MVDj/BVtqYTJOFEaie1rCUro4CBZdrNVUsW2M/3TiL2Vkrz7YvNdPO9159fDPjPysuSX
 bqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5BWe7D7WxyRyYiMtz3JT/sp3Kz4YbXoIbO4vUD8G2s=;
 b=iGkZgEiRizvCQ3FqYbR0M+a+ZiZlfLUdWuf8+XNS/ffGIMMOXQzlZtot9pfw1obAsE
 R8p4dUByNuC9Tl66b1gVokS07gWRkP4UY+4pmzyxWV57paRKHOdbMXiAjh+GfeJMbwIP
 7aggbqpOx5CMgVc83kX5n13uri+1BRL/DY54S6QgmtPR77yr6A/Vo4WF1thddOb9mPcD
 wv5/QDQ++q0yVOZyN8h4QaY3IuT/PNTwDr7S+qe/UTV3Mh0V8Ba2MTJLzZ8pbF5yai85
 yvq6vgGStxh/zHM/ka/oTykQ1ckvsbilgMBD0A4IjrMuCs1bMtU/yRYmMoqR6yf16pVu
 OpaA==
X-Gm-Message-State: AOAM531TLcbeEzQBkkFmKn7dmR6OgEv7WwAI8rpIQgwP+k6+VRb0dBgY
 E/o1pTUuQFyhzSo68xJJmdSCP5Sglr0=
X-Google-Smtp-Source: ABdhPJw56qR/+wQlUanKEX1GoouOdzvun/7NqHxso1fP+efQucKNhok90rT3dx2RRElcfarWuE0e6g==
X-Received: by 2002:a17:90a:e508:: with SMTP id
 t8mr8779824pjy.90.1612012219897; 
 Sat, 30 Jan 2021 05:10:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 23/42] powerpc: introduce die_mce
Date: Sat, 30 Jan 2021 23:08:33 +1000
Message-Id: <20210130130852.2952424-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As explained by commit daf00ae71dad ("powerpc/traps: restore
recoverability of machine_check interrupts"), die() can't be called from
within nmi_enter to nicely kill a process context that was interrupted.
nmi_exit must be called first.

This adds a function die_mce which takes care of this for machine check
handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  1 +
 arch/powerpc/kernel/traps.c           | 21 +++++++++++++++------
 arch/powerpc/platforms/powernv/opal.c |  2 +-
 arch/powerpc/platforms/pseries/ras.c  |  2 +-
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 8f09ddae9305..c10ae0a9bbaf 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -118,6 +118,7 @@ void do_bad_page_fault_segv(struct pt_regs *regs);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
+void die_mce(const char *str, struct pt_regs *regs, long err);
 extern bool die_will_crash(void);
 extern void panic_flush_kmsg_start(void);
 extern void panic_flush_kmsg_end(void);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 6691774fe1fb..f9ef183a5454 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -789,6 +789,19 @@ int machine_check_generic(struct pt_regs *regs)
 }
 #endif /* everything else */
 
+void die_mce(const char *str, struct pt_regs *regs, long err)
+{
+	/*
+	 * The machine check wants to kill the interrupted context, but
+	 * do_exit() checks for in_interrupt() and panics in that case, so
+	 * exit the irq/nmi before calling die.
+	 */
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		nmi_exit();
+	die(str, regs, err);
+}
+NOKPROBE_SYMBOL(die_mce);
+
 void machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
@@ -831,15 +844,11 @@ void machine_check_exception(struct pt_regs *regs)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (nmi) nmi_exit();
-
-	die("Machine check", regs, SIGBUS);
+	die_mce("Machine check", regs, SIGBUS);
 
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		die("Unrecoverable Machine check", regs, SIGBUS);
-
-	return;
+		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
 bail:
 	if (nmi) nmi_exit();
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index c61c3b62c8c6..303d7c775740 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -624,7 +624,7 @@ static int opal_recover_mce(struct pt_regs *regs,
 			 */
 			recovered = 0;
 		} else {
-			die("Machine check", regs, SIGBUS);
+			die_mce("Machine check", regs, SIGBUS);
 			recovered = 1;
 		}
 	}
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 149cec2212e6..2d9f985fd13a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -813,7 +813,7 @@ static int recover_mce(struct pt_regs *regs, struct machine_check_event *evt)
 			 */
 			recovered = 0;
 		} else {
-			die("Machine check", regs, SIGBUS);
+			die_mce("Machine check", regs, SIGBUS);
 			recovered = 1;
 		}
 	}
-- 
2.23.0

