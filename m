Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABB1A06A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 07:40:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGT71Bg8zDqyj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:40:11 +1000 (AEST)
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
 header.s=20161025 header.b=S1tit7Tf; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xG0X0PRvzDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:18:52 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id kx8so254329pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 22:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hb4l5DDeeP4QLHvqpvnXYB6zun+jwC0osLBAO4GluFs=;
 b=S1tit7TfmlTBdv1nCpvLxsTNAPyWvQazrRn2M2clpyFlpvixQuwvBUBgiAi6yIviBg
 GHmgOMF3FiOEzKluSG9OirEzMnI/z2f7n7pHcD/mgMlfMyeK8Z8UT5K/Jao41J4tTKu2
 ZtpZ8iJSR6x7HFXfo2MQkc9Ibqqop5uIl70weoNzRxjsNcgomOPtyOXOFbMrOHCkkW/8
 SspiGjAMWqSolr9rRPumNltWN+9n5lSTRLsbHAIulPBzZxhx2ErpLEFB9wh6tVKclhd8
 Nv2//r727ArErbeNx6Zg4+ypoXfmvxVifHvqTZnfAKfyGZ0F8MKT/eDuk7C7BBqVEEfB
 EcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hb4l5DDeeP4QLHvqpvnXYB6zun+jwC0osLBAO4GluFs=;
 b=nHz7GVptBXVAW1BYoAWIsGnRqyHk0IbIHpSVV2ZgxF+aBTl4VWtytFWWegy76GJlWn
 l8p5UxcaOdUWM3n1v7df1K/O303pFA+bbLsykxUERiHMn5e8euNZVPODjA5E10bH2AWU
 kbyoTPWicNrRZX9/T4AE1z0jcBXFl+nwGOsm0pgczmyQn2iKWfhJpt0ROJtQv8E+XkVL
 cGCIk+lnQ5l0A4d6jeWukjFvBght7Qw13BWHX5gTWR5KOjelaeIdTRBDcxrvsvCnuuGE
 W6mD+PErNnV+6Osab8ar4DYwmLl7oGqcSlKzE9nFvUWD8xQEw5L9K2jS+foP2ad98LNm
 mXdA==
X-Gm-Message-State: AGi0PuYFdLaTnxU5++cKiPRQzf4Uk24lT5CEVXOubv7uJNyhooLr+aKC
 8/qhc7lii/7DmAV50NQaKK/hIHnO
X-Google-Smtp-Source: APiQypI9Lz0XTqsy+mfhGbWHg4SCYrlshgeAq2bfgGljjDv1jdxeLE5OOmRnXsMTZeN07inQQQucAw==
X-Received: by 2002:a17:902:a504:: with SMTP id s4mr852922plq.10.1586236729649; 
 Mon, 06 Apr 2020 22:18:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id y17sm12866486pfl.104.2020.04.06.22.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 22:18:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/15] powerpc/64s: machine check interrupt update NMI
 accounting
Date: Tue,  7 Apr 2020 15:16:32 +1000
Message-Id: <20200407051636.648369-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200407051636.648369-1-npiggin@gmail.com>
References: <20200407051636.648369-1-npiggin@gmail.com>
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
index 3fca22276bb1..9f221772eb73 100644
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

