Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E38641CDFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:30:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Pny3kxhzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 03:29:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nf5qEYtd"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453PRl4mrjzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:14:11 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 005E82084A;
 Tue, 14 May 2019 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557854049;
 bh=+QLRERDw/Up8LkE1KCQQ7P8QktT4Sr7OIjEI7he9coI=;
 h=Subject:To:Cc:From:Date:From;
 b=Nf5qEYtdwXYTmVOHNowyCzcXGiZoT30zi1ox7i1Wc7YE7JJ2f+gFaXNOT5q61YraS
 f/vVFtQ9qIeqLtwFaQLA07c9FW4gPj/STyQjwbHIrV9or4opQ4IMcl4xobbXVokXAV
 MI2p50LeSN3va+yTWJ3ImGpkGslPTYPQFhbzJjtw=
Subject: Patch "[PATCH 22/27] powerpc/speculation: Support 'mitigations='
 cmdline" has been added to the 5.1-stable tree
To: 245a606e1a42a558a310220312d9b6adb9159df6.1555085500.git.jpoimboe@redhat.com,
 aarcange@redhat.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, gregkh@linuxfoundation.org, heiko.carstens@de.ibm.com,
 hpa@zytor.com, jcm@redhat.com, jikos@kernel.org, jkosina@suse.cz,
 jpoimboe@redhat.com, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, longman@redhat.com, luto@kernel.org,
 mpe@ellerman.id.au, pauld@redhat.com, paulus@samba.org, peterz@infradead.org,
 rdunlap@infradead.org, schwidefsky@de.ibm.com, steven.price@arm.com,
 tglx@linutronix.de, torvalds@linux-foundation.org, tyhicks@canonical.com,
 will.deacon@arm.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 14 May 2019 19:06:20 +0200
Message-ID: <1557853580181229@kroah.com>
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

    [PATCH 22/27] powerpc/speculation: Support 'mitigations=' cmdline

to the 5.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     0022-powerpc-speculation-Support-mitigations-cmdline-opti.patch
and it can be found in the queue-5.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b7344dd66dc6a99ecabeb0ab059334eba128da83 Mon Sep 17 00:00:00 2001
From: Josh Poimboeuf <jpoimboe@redhat.com>
Date: Fri, 12 Apr 2019 15:39:30 -0500
Subject: [PATCH 22/27] powerpc/speculation: Support 'mitigations=' cmdline
 option

commit 782e69efb3dfed6e8360bc612e8c7827a901a8f9 upstream

Configure powerpc CPU runtime speculation bug mitigations in accordance
with the 'mitigations=' cmdline option.  This affects Meltdown, Spectre
v1, Spectre v2, and Speculative Store Bypass.

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
Link: https://lkml.kernel.org/r/245a606e1a42a558a310220312d9b6adb9159df6.1555085500.git.jpoimboe@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 +++++----
 arch/powerpc/kernel/security.c                  | 6 +++---
 arch/powerpc/kernel/setup_64.c                  | 2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4392a66bfa3d..3294030d7f57 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2571,7 +2571,7 @@
 			http://repo.or.cz/w/linux-2.6/mini2440.git
 
 	mitigations=
-			[X86] Control optional mitigations for CPU
+			[X86,PPC] Control optional mitigations for CPU
 			vulnerabilities.  This is a set of curated,
 			arch-independent options, each of which is an
 			aggregation of existing arch-specific options.
@@ -2580,10 +2580,11 @@
 				Disable all optional CPU mitigations.  This
 				improves system performance, but it may also
 				expose users to several CPU vulnerabilities.
-				Equivalent to: nopti [X86]
-					       nospectre_v2 [X86]
+				Equivalent to: nopti [X86,PPC]
+					       nospectre_v1 [PPC]
+					       nospectre_v2 [X86,PPC]
 					       spectre_v2_user=off [X86]
-					       spec_store_bypass_disable=off [X86]
+					       spec_store_bypass_disable=off [X86,PPC]
 					       l1tf=off [X86]
 
 			auto (default)
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index b33bafb8fcea..70568ccbd9fd 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -57,7 +57,7 @@ void setup_barrier_nospec(void)
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
 		 security_ftr_enabled(SEC_FTR_BNDS_CHK_SPEC_BAR);
 
-	if (!no_nospec)
+	if (!no_nospec && !cpu_mitigations_off())
 		enable_barrier_nospec(enable);
 }
 
@@ -116,7 +116,7 @@ static int __init handle_nospectre_v2(char *p)
 early_param("nospectre_v2", handle_nospectre_v2);
 void setup_spectre_v2(void)
 {
-	if (no_spectrev2)
+	if (no_spectrev2 || cpu_mitigations_off())
 		do_btb_flush_fixups();
 	else
 		btb_flush_enabled = true;
@@ -300,7 +300,7 @@ void setup_stf_barrier(void)
 
 	stf_enabled_flush_types = type;
 
-	if (!no_stf_barrier)
+	if (!no_stf_barrier && !cpu_mitigations_off())
 		stf_barrier_enable(enable);
 }
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index ba404dd9ce1d..4f49e1a3594c 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -932,7 +932,7 @@ void setup_rfi_flush(enum l1d_flush_type types, bool enable)
 
 	enabled_flush_types = types;
 
-	if (!no_rfi_flush)
+	if (!no_rfi_flush && !cpu_mitigations_off())
 		rfi_flush_enable(enable);
 }
 
-- 
2.21.0



Patches currently in stable-queue which might be from jpoimboe@redhat.com are

queue-5.1/0019-x86-speculation-mds-Print-SMT-vulnerable-on-MSBDS-wi.patch
queue-5.1/0016-x86-speculation-Move-arch_smt_update-call-to-after-m.patch
queue-5.1/0024-x86-speculation-mds-Add-mitigations-support-for-MDS.patch
queue-5.1/0021-x86-speculation-Support-mitigations-cmdline-option.patch
queue-5.1/0022-powerpc-speculation-Support-mitigations-cmdline-opti.patch
queue-5.1/0020-cpu-speculation-Add-mitigations-cmdline-option.patch
queue-5.1/0023-s390-speculation-Support-mitigations-cmdline-option.patch
queue-5.1/0015-x86-speculation-mds-Add-mds-full-nosmt-cmdline-optio.patch
queue-5.1/0027-x86-speculation-mds-Fix-documentation-typo.patch
queue-5.1/0017-x86-speculation-mds-Add-SMT-warning-message.patch
queue-5.1/0018-x86-speculation-mds-Fix-comment.patch
