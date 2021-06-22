Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D53AFCDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8G9B2wYkz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 16:05:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=k2l9Yheo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k2l9Yheo; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8G7h026Yz302y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 16:04:31 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id v12so9876258plo.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 23:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHnMaRDZ/Zs5gCFQFLJLHxSxukFmFHoXYeVAo9PQmXc=;
 b=k2l9YheoETb5XsNaznX/J5HzwYIcT6x/v2Zm/MmfYAxstxicJ7tW0oRtqaDtf8P8nj
 HO23w7FGkv3J1SteL0SRHXoG+NfT8LsAdk3v2eHDSrjR7bULTCeoCGD6/5pOpTAzI9B6
 U0fDUq4K4IGaaENJSZlKaYwmRusmXC4DzDv9xmQzaJtd9p7QIDu7dK2LmJBBoMbQZCtT
 WtGUvKgb6Isj0qFC0bA0PcSajlzskgS+m3XluXw+8ia0XWBCPD5XWOFeJ8lUp7S9hDsZ
 bo/enRYpK6MqmXntRn/uTvEeix3KHcKtJSMzAWVdWipUJV1rw3XNkxSJBwvpfghMWIIu
 vEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHnMaRDZ/Zs5gCFQFLJLHxSxukFmFHoXYeVAo9PQmXc=;
 b=azSwAy7BKqn/lRQHEL+7JtW2j7wehuldQaO48s3AgnEN4UE7lCrawN5fkqqompvZwn
 btEG6jrvPdIOmocSQwS8FVGwpDt285Do49mVjQgK9KuqVEmCFHx5y4fbiYxf9VCIjNbU
 Fv/IF+b8rOjJPTXu3BF6CJE5G2z1+CR75yDsICvKdzpG6K9h0LhK4MpE0JnHZ494EoJX
 qAJ7jmnpTxDDUU+0A1yUp4RvCxlinE4UEDwYRbPYzCq30BBeKtNYpLsD5jPpJANRqPxH
 EAwCu4/85VVNdY0EbacT4Rg4jLzY26ddmUyMxpV8gTkigdblV0P8XtV/aZIoqXzRYud4
 x/zg==
X-Gm-Message-State: AOAM5320Vn1agrBVnLGr2pcaV+iLalVaMMH0paH1Wl+ST/jQOsdSeGae
 9NItASMavtmI9Xtt79GrcJUiQzRUnFE=
X-Google-Smtp-Source: ABdhPJyGptdPT+Xiv2mU04Ad6MZvtFJPbKchkFHj5hAg2x+mPe6NSc6VqXxwCRbRQuLJvkbEywLmMQ==
X-Received: by 2002:a17:902:7c05:b029:11c:1e7d:c633 with SMTP id
 x5-20020a1709027c05b029011c1e7dc633mr21201146pll.48.1624341868411; 
 Mon, 21 Jun 2021 23:04:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n33sm11394751pgm.55.2021.06.21.23.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 23:04:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/interrupt: Check and fix srr_valid without
 crashing
Date: Tue, 22 Jun 2021 16:04:16 +1000
Message-Id: <20210622060416.548187-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622060416.548187-1-npiggin@gmail.com>
References: <20210622060416.548187-1-npiggin@gmail.com>
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

The PPC_RFI_SRR_DEBUG check added by patch "powerpc/64s: avoid reloading
(H)SRR registers if they are still valid" has a few deficiencies. It
does not fix the actual problem, it's not enabled by default, and it
causes a program check interrupt which can cause more difficulties.

However there are a lot of paths which may clobber SRRs or change return
regs, and difficult to have a high confidence that all paths are covered
without wider testing.

Add a relatively low overhead always-enabled check that catches most
such cases, reports once, and fixes it so the kernel can continue.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 58 +++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 05fa3ae56e25..5920a3e8d1d5 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -231,6 +231,56 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
+#include <linux/sched/debug.h> /* for show_regs */
+static void check_return_regs_valid(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	static bool warned = false;
+
+	if (regs->trap == 0x980 || regs->trap == 0xe00 || regs->trap == 0xe20 ||
+	    regs->trap == 0xe40 || regs->trap == 0xe60 || regs->trap == 0xe80 ||
+	    regs->trap == 0xea0 || regs->trap == 0xf80 || regs->trap == 0x1200 ||
+	    regs->trap == 0x1500 || regs->trap == 0x1600 || regs->trap == 0x1800) {
+		if (local_paca->hsrr_valid) {
+			unsigned long hsrr0 = mfspr(SPRN_HSRR0);
+			unsigned long hsrr1 = mfspr(SPRN_HSRR1);
+
+			if (hsrr0 == regs->nip && hsrr1 == regs->msr)
+				return;
+
+			if (!warned) {
+				warned = true;
+				printk("HSRR0 was: %lx should be: %lx\n",
+					hsrr0, regs->nip);
+				printk("HSRR1 was: %lx should be: %lx\n",
+					hsrr1, regs->msr);
+				show_regs(regs);
+			}
+			local_paca->hsrr_valid = 0; /* fixup */
+		}
+
+	} else if (regs->trap != 0x3000) {
+		if (local_paca->srr_valid) {
+			unsigned long srr0 = mfspr(SPRN_SRR0);
+			unsigned long srr1 = mfspr(SPRN_SRR1);
+
+			if (srr0 == regs->nip && srr1 == regs->msr)
+				return;
+
+			if (!warned) {
+				warned = true;
+				printk("SRR0 was: %lx should be: %lx\n",
+					srr0, regs->nip);
+				printk("SRR1 was: %lx should be: %lx\n",
+					srr1, regs->msr);
+				show_regs(regs);
+			}
+			local_paca->srr_valid = 0; /* fixup */
+		}
+	}
+#endif
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -327,6 +377,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
+	check_return_regs_valid(regs);
+
 	user_enter_irqoff();
 
 	/* scv need not set RI=0 because SRRs are not used */
@@ -405,6 +457,8 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 		}
 	}
 
+	check_return_regs_valid(regs);
+
 	user_enter_irqoff();
 
 	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
@@ -469,9 +523,13 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 			}
 		}
 
+		check_return_regs_valid(regs);
+
 		if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
 			goto again;
 	} else {
+		check_return_regs_valid(regs);
+
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
 #ifdef CONFIG_PPC64
-- 
2.23.0

