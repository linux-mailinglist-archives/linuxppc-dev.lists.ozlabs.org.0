Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DB26AB7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 20:08:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrWSb44GtzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 04:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrWQv1n5CzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 04:07:18 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B5B8B302;
 Tue, 15 Sep 2020 18:07:30 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] Revert "powerpc/64s: machine check interrupt update NMI
 accounting"
Date: Tue, 15 Sep 2020 20:06:59 +0200
Message-Id: <20200915180659.12503-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915084302.GG29778@kitsune.suse.cz>
References: <20200915084302.GG29778@kitsune.suse.cz>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Alistair Popple <alistair@popple.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, stable@vger.kernel.org,
 Michal Suchanek <msuchanek@suse.de>, Jordan Niethe <jniethe5@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 116ac378bb3ff844df333e7609e7604651a0db9d.

This commit causes the kernel to oops and reboot when injecting a SLB
multihit which causes a MCE.

Before this commit a SLB multihit was corrected by the kernel and the
system continued to operate normally.

cc: stable@vger.kernel.org
Fixes: 116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/mce.c   |  7 -------
 arch/powerpc/kernel/traps.c | 18 +++---------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index ada59f6c4298..2e13528dcc92 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -591,14 +591,10 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
 long notrace machine_check_early(struct pt_regs *regs)
 {
 	long handled = 0;
-	bool nested = in_nmi();
 	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
 
 	this_cpu_set_ftrace_enabled(0);
 
-	if (!nested)
-		nmi_enter();
-
 	hv_nmi_check_nonrecoverable(regs);
 
 	/*
@@ -607,9 +603,6 @@ long notrace machine_check_early(struct pt_regs *regs)
 	if (ppc_md.machine_check_early)
 		handled = ppc_md.machine_check_early(regs);
 
-	if (!nested)
-		nmi_exit();
-
 	this_cpu_set_ftrace_enabled(ftrace_enabled);
 
 	return handled;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d1ebe152f210..7853b770918d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -827,19 +827,7 @@ void machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
 
-	/*
-	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
-	 * (it uses its own early real-mode handler to handle the MCE proper
-	 * and then raises irq_work to call this handler when interrupts are
-	 * enabled).
-	 *
-	 * This is silly. The BOOK3S_64 should just call a different function
-	 * rather than expecting semantics to magically change. Something
-	 * like 'non_nmi_machine_check_exception()', perhaps?
-	 */
-	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
-
-	if (nmi) nmi_enter();
+	nmi_enter();
 
 	__this_cpu_inc(irq_stat.mce_exceptions);
 
@@ -865,7 +853,7 @@ void machine_check_exception(struct pt_regs *regs)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (nmi) nmi_exit();
+	nmi_exit();
 
 	die("Machine check", regs, SIGBUS);
 
@@ -876,7 +864,7 @@ void machine_check_exception(struct pt_regs *regs)
 	return;
 
 bail:
-	if (nmi) nmi_exit();
+	nmi_exit();
 }
 
 void SMIException(struct pt_regs *regs)
-- 
2.28.0

