Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814A0192659
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 11:57:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nQ7L3RrPzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 21:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jUCzAIKw; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPdk4HvYzDqjv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 21:35:22 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id mj6so851300pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xdF/0NCr7Mw/Mtdo62rDZZCH5Nm4d+gY44y4674fL70=;
 b=jUCzAIKwKkbvy84tEcA8lZa9/h1W9C4wN9LOcIgxuOQ5k6GV82+69kH2AgDTU4FXZl
 iBELSCjUAhHs8Jb2L/bKcCkD5DHKCkik3JreBeoOykbEHctrMaVmfF5LNGTGmoMTwAYe
 nJU2AW7xqYlRBdb5Wsb/sWGVAUHEp49yHC8j65PNlmM9x+TaWGSljtS4N1PdJ9sOhl7l
 XOOa+MyKhSwukbnxCdcvwovDUMNew5f2YctalB2LM8InlBR4Ci4o41wjDQETbSiXL3Sj
 29NUykUR36onA/gl6FYrK5Gp08lbEog6iKQigDLMLNIECECu8yZDLDH7Sm0GIAAWgnkD
 kRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xdF/0NCr7Mw/Mtdo62rDZZCH5Nm4d+gY44y4674fL70=;
 b=TdvnHPQnyUi5q5Z8IrXN8u8FXGw/OTY8GWCGxwidY5Y+h9o/w1IlPCFP+iKfIWIzD0
 dICay7FT8mXENPcCGk8VZIWK7Sr4uGPTP4qHKMe/kEFBVOa+2Azzqbcep1VTXVNORJyq
 8siAlM7Zkf54ZUYlfHHkZ2v/JzDVEzbkflYHBGcEkBqJgE2r1k/IQJ7UWsftr/ngmV50
 FvOBrWwVmL2e7Dq44KpovsiwgysqCn0eXwUocoLnvorx1lQE2ZfbXHnKRwYEpxMTisZL
 bcOu37RRfv1Lpe+k+N56aTXvvX61TB/uxEziJWkAYRb++Q250X9XwmWRLUMQDVuJA8RI
 Fw3w==
X-Gm-Message-State: ANhLgQ1jKI4/wwY9IKQhZ8Irv/wtTiXgKiM8pzCGBjqNKMliBtdFexJh
 M7MtmCypCzi7Tbj1bYWIJrByRHKM
X-Google-Smtp-Source: ADFU+vu/FUxmP5xzmhgTxiy7QIu8CHamxOGw/yKm/OPK6p2unVpH9Cf3MEm3rGUloMRrtWIIjIzPIA==
X-Received: by 2002:a17:902:7581:: with SMTP id
 j1mr2565581pll.316.1585132518946; 
 Wed, 25 Mar 2020 03:35:18 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id b9sm16549701pgi.75.2020.03.25.03.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 03:35:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 10/12] powerpc/64s: machine check interrupt update NMI
 accounting
Date: Wed, 25 Mar 2020 20:34:08 +1000
Message-Id: <20200325103410.157573-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200325103410.157573-1-npiggin@gmail.com>
References: <20200325103410.157573-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
 arch/powerpc/kernel/traps.c   | 13 +------------
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 34c1001e9e8b..c1684be0d8b7 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -560,6 +560,9 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 long machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
+	bool nested = in_nmi();
+	if (!nested)
+		nmi_enter();
 
 	hv_nmi_check_nonrecoverable(regs);
 
@@ -568,6 +571,10 @@ long machine_check_early(struct pt_regs *regs)
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
index d27bf367e929..c21344c1a151 100644
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
index 82a3438300fd..1845fd7e161a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -823,9 +823,6 @@ int machine_check_generic(struct pt_regs *regs)
 void machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
-	bool nested = in_nmi();
-	if (!nested)
-		nmi_enter();
 
 	__this_cpu_inc(irq_stat.mce_exceptions);
 
@@ -851,20 +848,12 @@ void machine_check_exception(struct pt_regs *regs)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (!nested)
-		nmi_exit();
-
 	die("Machine check", regs, SIGBUS);
 
+bail:
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
 		nmi_panic(regs, "Unrecoverable Machine check");
-
-	return;
-
-bail:
-	if (!nested)
-		nmi_exit();
 }
 
 void SMIException(struct pt_regs *regs)
-- 
2.23.0

