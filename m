Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E041CDC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:16:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453PVV2wvMzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 03:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="OkVsBYjg"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453PML42NTzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:10:22 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C59AF2084A;
 Tue, 14 May 2019 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557853820;
 bh=Ht/GR8HB1FUSUzS8AN032OUyYJxPZRJheUXYadqgqq0=;
 h=Subject:To:Cc:From:Date:From;
 b=OkVsBYjgE/lEMyZox6TLpalUu/fjN8L6oraou4BhOx/s31+cb26DCXlYYs4KsOZxE
 G3F0etSLME92TAjYZCxIR9pfUGwALWqPnToA8VcgpbHyF9vP8AXLllEOdVyTueiDeL
 Gz8ljAUYxeldj69itWgq/HgMghX58w1dyokxY6XM=
Subject: Patch "[PATCH 28/32] s390/speculation: Support 'mitigations=' cmdline
 option" has been added to the 4.14-stable tree
To: aarcange@redhat.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com,
 e4a161805458a5ec88812aac0307ae3908a030fc.1555085500.git.jpoimboe@redhat.com,
 gregkh@linuxfoundation.org, heiko.carstens@de.ibm.com, hpa@zytor.com,
 jcm@redhat.com, jikos@kernel.org, jkosina@suse.cz, jpoimboe@redhat.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 longman@redhat.com, luto@kernel.org, mpe@ellerman.id.au, pauld@redhat.com,
 paulus@samba.org, peterz@infradead.org, rdunlap@infradead.org,
 schwidefsky@de.ibm.com, steven.price@arm.com, tglx@linutronix.de,
 torvalds@linux-foundation.org, tyhicks@canonical.com, will.deacon@arm.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 14 May 2019 19:06:11 +0200
Message-ID: <15578535713886@kroah.com>
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

    [PATCH 28/32] s390/speculation: Support 'mitigations=' cmdline option

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     0028-s390-speculation-Support-mitigations-cmdline-option.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From fd823d678f3cdc35d423a25e6ce9a7c0d2e55e1b Mon Sep 17 00:00:00 2001
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Fri, 12 Apr 2019 15:39:31 -0500
Subject: [PATCH 28/32] s390/speculation: Support 'mitigations=' cmdline option

commit 0336e04a6520bdaefdb0769d2a70084fa52e81ed upstream

Configure s390 runtime CPU speculation bug mitigations in accordance
with the 'mitigations=' cmdline option.  This affects Spectre v1 and
Spectre v2.

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
Link: https://lkml.kernel.org/r/e4a161805458a5ec88812aac0307ae3908a030fc.1555085500.git.jpoimboe@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++--
 arch/s390/kernel/nospec-branch.c                | 9 +++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 204161cee674..6fa7895885c9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2389,7 +2389,7 @@
 			http://repo.or.cz/w/linux-2.6/mini2440.git
 
 	mitigations=
-			[X86,PPC] Control optional mitigations for CPU
+			[X86,PPC,S390] Control optional mitigations for CPU
 			vulnerabilities.  This is a set of curated,
 			arch-independent options, each of which is an
 			aggregation of existing arch-specific options.
@@ -2400,7 +2400,8 @@
 				expose users to several CPU vulnerabilities.
 				Equivalent to: nopti [X86,PPC]
 					       nospectre_v1 [PPC]
-					       nospectre_v2 [X86,PPC]
+					       nobp=0 [S390]
+					       nospectre_v2 [X86,PPC,S390]
 					       spectre_v2_user=off [X86]
 					       spec_store_bypass_disable=off [X86,PPC]
 					       l1tf=off [X86]
diff --git a/arch/s390/kernel/nospec-branch.c b/arch/s390/kernel/nospec-branch.c
index d5eed651b5ab..83e597688562 100644
--- a/arch/s390/kernel/nospec-branch.c
+++ b/arch/s390/kernel/nospec-branch.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/cpu.h>
 #include <asm/facility.h>
 #include <asm/nospec-branch.h>
 
@@ -55,8 +56,16 @@ static int __init nospectre_v2_setup_early(char *str)
 }
 early_param("nospectre_v2", nospectre_v2_setup_early);
 
+
 void __init nospec_auto_detect(void)
 {
+	if (cpu_mitigations_off()) {
+		/*
+		 * Disable expolines and disable nobp.
+		 */
+		if (IS_ENABLED(CC_USING_EXPOLINE))
+			nospec_disable = 1;
+		__clear_facility(82, S390_lowcore.alt_stfle_fac_list);
 	if (IS_ENABLED(CC_USING_EXPOLINE)) {
 		/*
 		 * The kernel has been compiled with expolines.
-- 
2.21.0



Patches currently in stable-queue which might be from jpoimboe@redhat.com are

queue-4.14/0022-x86-speculation-mds-Add-SMT-warning-message.patch
queue-4.14/0027-powerpc-speculation-Support-mitigations-cmdline-opti.patch
queue-4.14/0025-cpu-speculation-Add-mitigations-cmdline-option.patch
queue-4.14/0029-x86-speculation-mds-Add-mitigations-support-for-MDS.patch
queue-4.14/0028-s390-speculation-Support-mitigations-cmdline-option.patch
queue-4.14/0032-x86-speculation-mds-Fix-documentation-typo.patch
queue-4.14/0023-x86-speculation-mds-Fix-comment.patch
queue-4.14/0002-Documentation-l1tf-Fix-small-spelling-typo.patch
queue-4.14/0024-x86-speculation-mds-Print-SMT-vulnerable-on-MSBDS-wi.patch
queue-4.14/0026-x86-speculation-Support-mitigations-cmdline-option.patch
queue-4.14/0021-x86-speculation-Move-arch_smt_update-call-to-after-m.patch
queue-4.14/0020-x86-speculation-mds-Add-mds-full-nosmt-cmdline-optio.patch
