Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 124851CD9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:11:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453PNR5wjYzDqNQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 03:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="yeJzQxsj"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453PKR2K1bzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:08:43 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0650E20881;
 Tue, 14 May 2019 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557853721;
 bh=J4/8+rvCOIlsyFOgkvzm5D6oMX+w+g7QTXmZ+7WKyWU=;
 h=Subject:To:Cc:From:Date:From;
 b=yeJzQxsjzjBLzGKxmwppj0OsHHo+LZeCCSBDxQcj2nCs42TQ33SmqW7UbnprLAymG
 r4hHHLsGw8J0T/+zrwK1xhlBswOMx5RFypEcSQdSgB7m8unenfbnFhrTk4n1VrCAYy
 5Oko1MCKiaW1nj7ZYZ7IJNenNjQ3YeWI7ME90ivk=
Subject: Patch "[PATCH 70/76] x86/speculation: Support 'mitigations=' cmdline
 option" has been added to the 4.9-stable tree
To: 6616d0ae169308516cfdf5216bedd169f8a8291b.1555085500.git.jpoimboe@redhat.com,
 aarcange@redhat.com, ben@decadent.org.uk, benh@kernel.crashing.org,
 bp@alien8.de, catalin.marinas@arm.com, gregkh@linuxfoundation.org,
 heiko.carstens@de.ibm.com, hpa@zytor.com, jcm@redhat.com, jikos@kernel.org,
 jkosina@suse.cz, jpoimboe@redhat.com, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, longman@redhat.com, luto@kernel.org,
 mpe@ellerman.id.au, pauld@redhat.com, paulus@samba.org, peterz@infradead.org,
 rdunlap@infradead.org, schwidefsky@de.ibm.com, steven.price@arm.com,
 tglx@linutronix.de, torvalds@linux-foundation.org, tyhicks@canonical.com,
 will.deacon@arm.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 14 May 2019 19:05:49 +0200
Message-ID: <155785354916842@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    [PATCH 70/76] x86/speculation: Support 'mitigations=' cmdline option

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     0070-x86-speculation-Support-mitigations-cmdline-option.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 9137d21d9fdd50e1615bdd4be82dd9921376c2b7 Mon Sep 17 00:00:00 2001
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Fri, 12 Apr 2019 15:39:29 -0500
Subject: [PATCH 70/76] x86/speculation: Support 'mitigations=' cmdline option

commit d68be4c4d31295ff6ae34a8ddfaa4c1a8ff42812 upstream.

Configure x86 runtime CPU speculation bug mitigations in accordance with
the 'mitigations=' cmdline option.  This affects Meltdown, Spectre v2,
Speculative Store Bypass, and L1TF.

The default behavior is unchanged.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Jiri Kosina <jkosina@suse.cz> (on x86)
Reviewed-by: Jiri Kosina <jkosina@suse.cz>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H . Peter Anvin" <hpa@zytor.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Jon Masters <jcm@redhat.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arch@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tyler Hicks <tyhicks@canonical.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Phil Auld <pauld@redhat.com>
Link: https://lkml.kernel.org/r/6616d0ae169308516cfdf5216bedd169f8a8291b.1555085500.git.jpoimboe@redhat.com
[bwh: Backported to 4.9: adjust filenames, context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/kernel-parameters.txt | 16 +++++++++++-----
 arch/x86/kernel/cpu/bugs.c          | 11 +++++++++--
 arch/x86/mm/kaiser.c                |  4 +++-
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index 23af0afe24d1..5f81df18b2be 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -2474,15 +2474,20 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 			http://repo.or.cz/w/linux-2.6/mini2440.git
 
 	mitigations=
-			Control optional mitigations for CPU vulnerabilities.
-			This is a set of curated, arch-independent options, each
-			of which is an aggregation of existing arch-specific
-			options.
+			[X86] Control optional mitigations for CPU
+			vulnerabilities.  This is a set of curated,
+			arch-independent options, each of which is an
+			aggregation of existing arch-specific options.
 
 			off
 				Disable all optional CPU mitigations.  This
 				improves system performance, but it may also
 				expose users to several CPU vulnerabilities.
+				Equivalent to: nopti [X86]
+					       nospectre_v2 [X86]
+					       spectre_v2_user=off [X86]
+					       spec_store_bypass_disable=off [X86]
+					       l1tf=off [X86]
 
 			auto (default)
 				Mitigate all CPU vulnerabilities, but leave SMT
@@ -2490,12 +2495,13 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
 				users who don't want to be surprised by SMT
 				getting disabled across kernel upgrades, or who
 				have other ways of avoiding SMT-based attacks.
-				This is the default behavior.
+				Equivalent to: (default behavior)
 
 			auto,nosmt
 				Mitigate all CPU vulnerabilities, disabling SMT
 				if needed.  This is for users who always want to
 				be fully mitigated, even if it means losing SMT.
+				Equivalent to: l1tf=flush,nosmt [X86]
 
 	mminit_loglevel=
 			[KNL] When CONFIG_DEBUG_MEMORY_INIT is set, this
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index d81f55e4ca5c..c2e07be3773c 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -500,7 +500,8 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
 	char arg[20];
 	int ret, i;
 
-	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2"))
+	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2") ||
+	    cpu_mitigations_off())
 		return SPECTRE_V2_CMD_NONE;
 
 	ret = cmdline_find_option(boot_command_line, "spectre_v2", arg, sizeof(arg));
@@ -764,7 +765,8 @@ static enum ssb_mitigation_cmd __init ssb_parse_cmdline(void)
 	char arg[20];
 	int ret, i;
 
-	if (cmdline_find_option_bool(boot_command_line, "nospec_store_bypass_disable")) {
+	if (cmdline_find_option_bool(boot_command_line, "nospec_store_bypass_disable") ||
+	    cpu_mitigations_off()) {
 		return SPEC_STORE_BYPASS_CMD_NONE;
 	} else {
 		ret = cmdline_find_option(boot_command_line, "spec_store_bypass_disable",
@@ -1085,6 +1087,11 @@ static void __init l1tf_select_mitigation(void)
 	if (!boot_cpu_has_bug(X86_BUG_L1TF))
 		return;
 
+	if (cpu_mitigations_off())
+		l1tf_mitigation = L1TF_MITIGATION_OFF;
+	else if (cpu_mitigations_auto_nosmt())
+		l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
+
 	override_cache_bits(&boot_cpu_data);
 
 	switch (l1tf_mitigation) {
diff --git a/arch/x86/mm/kaiser.c b/arch/x86/mm/kaiser.c
index 3f729e20f0e3..12522dbae615 100644
--- a/arch/x86/mm/kaiser.c
+++ b/arch/x86/mm/kaiser.c
@@ -9,6 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/mm.h>
 #include <linux/uaccess.h>
+#include <linux/cpu.h>
 
 #undef pr_fmt
 #define pr_fmt(fmt)     "Kernel/User page tables isolation: " fmt
@@ -297,7 +298,8 @@ void __init kaiser_check_boottime_disable(void)
 			goto skip;
 	}
 
-	if (cmdline_find_option_bool(boot_command_line, "nopti"))
+	if (cmdline_find_option_bool(boot_command_line, "nopti") ||
+	    cpu_mitigations_off())
 		goto disable;
 
 skip:
-- 
2.21.0



Patches currently in stable-queue which might be from jpoimboe@redhat.com are

queue-4.9/0037-x86-speculation-Add-command-line-control-for-indirec.patch
queue-4.9/0026-x86-speculation-Disable-STIBP-when-enhanced-IBRS-is-.patch
queue-4.9/0022-x86-speculation-Update-the-TIF_SSBD-comment.patch
queue-4.9/0046-x86-speculation-Enable-prctl-mode-for-spectre_v2_use.patch
queue-4.9/0042-x86-speculation-Split-out-TIF-update.patch
queue-4.9/0044-x86-speculation-Prevent-stale-SPEC_CTRL-msr-content.patch
queue-4.9/0069-cpu-speculation-Add-mitigations-cmdline-option.patch
queue-4.9/0047-x86-speculation-Add-seccomp-Spectre-v2-user-space-pr.patch
queue-4.9/0038-x86-speculation-Prepare-for-per-task-indirect-branch.patch
queue-4.9/0034-x86-speculation-Mark-string-arrays-const-correctly.patch
queue-4.9/0068-x86-speculation-mds-Print-SMT-vulnerable-on-MSBDS-wi.patch
queue-4.9/0035-x86-speculataion-Mark-command-line-parser-data-__ini.patch
queue-4.9/0041-x86-speculation-Prepare-for-conditional-IBPB-in-swit.patch
queue-4.9/0033-x86-speculation-Reorder-the-spec_v2-code.patch
queue-4.9/0045-x86-speculation-Add-prctl-control-for-indirect-branc.patch
queue-4.9/0025-x86-speculation-Move-STIPB-IBPB-string-conditionals-.patch
queue-4.9/0040-x86-speculation-Avoid-__switch_to_xtra-calls.patch
queue-4.9/0043-x86-speculation-Prepare-arch_smt_update-for-PRCTL-mo.patch
queue-4.9/0028-x86-speculation-Reorganize-speculation-control-MSRs-.patch
queue-4.9/0031-x86-speculation-Rework-SMT-state-change.patch
queue-4.9/0024-x86-speculation-Remove-unnecessary-ret-variable-in-c.patch
queue-4.9/0018-x86-speculation-Apply-IBPB-more-strictly-to-avoid-cr.patch
queue-4.9/0029-x86-Kconfig-Select-SCHED_SMT-if-SMP-enabled.patch
queue-4.9/0071-x86-speculation-mds-Add-mitigations-support-for-MDS.patch
queue-4.9/0070-x86-speculation-Support-mitigations-cmdline-option.patch
queue-4.9/0065-x86-speculation-Move-arch_smt_update-call-to-after-m.patch
queue-4.9/0017-Documentation-l1tf-Fix-small-spelling-typo.patch
queue-4.9/0067-x86-speculation-mds-Fix-comment.patch
queue-4.9/0064-x86-speculation-mds-Add-mds-full-nosmt-cmdline-optio.patch
queue-4.9/0036-x86-speculation-Unify-conditional-spectre-v2-print-f.patch
queue-4.9/0027-x86-speculation-Rename-SSBD-update-functions.patch
queue-4.9/0074-x86-speculation-mds-Fix-documentation-typo.patch
queue-4.9/0020-x86-speculation-Propagate-information-about-RSB-fill.patch
queue-4.9/0032-x86-l1tf-Show-actual-SMT-state.patch
queue-4.9/0023-x86-speculation-Clean-up-spectre_v2_parse_cmdline.patch
queue-4.9/0066-x86-speculation-mds-Add-SMT-warning-message.patch
queue-4.9/0048-x86-speculation-Provide-IBPB-always-command-line-opt.patch
queue-4.9/0039-x86-process-Consolidate-and-simplify-switch_to_xtra-.patch
queue-4.9/0019-x86-speculation-Enable-cross-hyperthread-spectre-v2-.patch
queue-4.9/0011-x86-mm-Use-WRITE_ONCE-when-setting-PTEs.patch
