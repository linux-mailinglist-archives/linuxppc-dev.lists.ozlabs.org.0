Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AF20CE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 18:26:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454cHH034ZzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 02:26:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=decadent.org.uk
 (client-ip=88.96.1.126; helo=shadbolt.e.decadent.org.uk;
 envelope-from=ben@decadent.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=decadent.org.uk
X-Greylist: delayed 1549 seconds by postgrey-1.36 at bilbo;
 Fri, 17 May 2019 02:24:51 AEST
Received: from shadbolt.e.decadent.org.uk (shadbolt.e.decadent.org.uk
 [88.96.1.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454cFv0YR5zDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 02:24:51 +1000 (AEST)
Received: from [167.98.27.226] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImJ-0006zD-H0; Thu, 16 May 2019 16:58:43 +0100
Received: from ben by deadeye with local (Exim 4.92)
 (envelope-from <ben@decadent.org.uk>)
 id 1hRImF-0001Sn-3k; Thu, 16 May 2019 16:58:39 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 16 May 2019 16:55:33 +0100
Message-ID: <lsq.1558022133.121998781@decadent.org.uk>
X-Mailer: LinuxStableQueue (scripts by bwh)
X-Patchwork-Hint: ignore
Subject: [PATCH 3.16 80/86] x86/speculation: Support 'mitigations='
 cmdline option
In-Reply-To: <lsq.1558022132.52852998@decadent.org.uk>
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk);
 SAEximRunCond expanded to false
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Denis Kirjanov <kda@linux-powerpc.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Waiman Long <longman@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Jon Masters <jcm@redhat.com>, Will Deacon <will.deacon@arm.com>,
 Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Phil Auld <pauld@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
 Randy Dunlap <rdunlap@infradead.org>, Tyler Hicks <tyhicks@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

3.16.68-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Josh Poimboeuf <jpoimboe@redhat.com>

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
[bwh: Backported to 3.16:
 - Drop the auto,nosmt option and the l1tf mitigation selection, which we can't
   support
 - Adjust filenames, context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1907,15 +1907,19 @@ bytes respectively. Such letter suffixes
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
 
 			auto (default)
 				Mitigate all CPU vulnerabilities, but leave SMT
@@ -1923,7 +1927,7 @@ bytes respectively. Such letter suffixes
 				users who don't want to be surprised by SMT
 				getting disabled across kernel upgrades, or who
 				have other ways of avoiding SMT-based attacks.
-				This is the default behavior.
+				Equivalent to: (default behavior)
 
 	mminit_loglevel=
 			[KNL] When CONFIG_DEBUG_MEMORY_INIT is set, this
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -545,7 +545,8 @@ static enum spectre_v2_mitigation_cmd __
 	char arg[20];
 	int ret, i;
 
-	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2"))
+	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2") ||
+	    cpu_mitigations_off())
 		return SPECTRE_V2_CMD_NONE;
 
 	ret = cmdline_find_option(boot_command_line, "spectre_v2", arg, sizeof(arg));
@@ -809,7 +810,8 @@ static enum ssb_mitigation_cmd __init ss
 	char arg[20];
 	int ret, i;
 
-	if (cmdline_find_option_bool(boot_command_line, "nospec_store_bypass_disable")) {
+	if (cmdline_find_option_bool(boot_command_line, "nospec_store_bypass_disable") ||
+	    cpu_mitigations_off()) {
 		return SPEC_STORE_BYPASS_CMD_NONE;
 	} else {
 		ret = cmdline_find_option(boot_command_line, "spec_store_bypass_disable",
--- a/arch/x86/mm/kaiser.c
+++ b/arch/x86/mm/kaiser.c
@@ -10,6 +10,7 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <linux/ftrace.h>
+#include <linux/cpu.h>
 #include <xen/xen.h>
 
 #undef pr_fmt
@@ -294,7 +295,8 @@ void __init kaiser_check_boottime_disabl
 			goto skip;
 	}
 
-	if (cmdline_find_option_bool(boot_command_line, "nopti"))
+	if (cmdline_find_option_bool(boot_command_line, "nopti") ||
+	    cpu_mitigations_off())
 		goto disable;
 
 skip:

