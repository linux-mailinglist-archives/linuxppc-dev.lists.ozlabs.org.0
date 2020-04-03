Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3A19D8DA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:19:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v29m1LXXzDscf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:19:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wmf/zHed; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v1211cBDzDrdH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:27:21 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 22so3461778pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Am6B09x/fNpGssFpfXwAjNZ7Iqf7+NTHlq8C+rD0/5o=;
 b=Wmf/zHedFizHraIe2V6n8Hr/bM3OKYyYhuB/wVQJPw+qzbtZVsX1zuQTAB35L+MBaK
 eqDrnKEwHziUdlNT1G6KpZHNL3UXdgpwl0r73cy2x0dFJs28bFLr1AD9oTV/bcDOsVSq
 46xFEmaXsr5qLVAor7ILiRDAlY/naGCaWXK+knYUVIEYcuhPSErn+r0zl1nWLZZc0P0p
 S4/4zVXZ/WdfWxrkrMyQbFBpKuXzrlf6pNRihfSZ2BmFSj8EbB2nOSmgZmf395R1RyCt
 vkfZT8YccRf4JALdPzaeuUIdWge8rJn9W2wFkY5CzU3FptGj1KLCFqr6vP/hk6Bjesrq
 ip2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Am6B09x/fNpGssFpfXwAjNZ7Iqf7+NTHlq8C+rD0/5o=;
 b=jMi3LRFKCOt8f/47qYZF0bSw0LiPTpPSVfbiNuQvdOB8qbLIiVAeVapR98eaSJDCMj
 nK9uax317bOR+OygAwjJC413TOhh4o4yPu7h7hdlAnSFum6pHboCbooVRaReAK1QbMKp
 dDbaoeFImGB8iMEWo6JkVPw7F0w8sw48rg1dskTLs4F+Qgc9XykgF0UNBW/fRmuaCb+A
 7UHNEwxyLg0IruxI4DzezfXJNP8WUH3paygawZi7ywk7N03ILcQoHiid/ex4fKuJEVkR
 teNX/fHLkLQLnkcAwylczRzTKn5HUpX1mIrN4gHJlwxKf7JC47bsiwBXKO4MZR/RcI5A
 xDMw==
X-Gm-Message-State: AGi0PuaeB386w8sJy0oknXs5bDSIkn2AdMD53D83C3Z67cesI94d579f
 gP36oe4sW7P0gugTwA9HyM1sDaCe
X-Google-Smtp-Source: APiQypJ4Nljsk0ioQc2wPNJWLon2ClDzekybyHoScSwJkCw67cEqsflNj4Q1leZ7vJSuCWZZ+iO8CQ==
X-Received: by 2002:aa7:9695:: with SMTP id f21mr8562702pfk.93.1585920437726; 
 Fri, 03 Apr 2020 06:27:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:27:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/14] powerpc/64s: machine check interrupt update NMI
 accounting
Date: Fri,  3 Apr 2020 23:26:19 +1000
Message-Id: <20200403132622.130394-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
index 1dea4d280f6f..f06d20678611 100644
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

