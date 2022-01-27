Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734B49EC85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 21:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlC9k0bmYz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 07:39:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=3nbw=sl=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlC9D0lJrz3bPW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 07:38:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DD69618FE;
 Thu, 27 Jan 2022 20:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E89CC340E4;
 Thu, 27 Jan 2022 20:38:34 +0000 (UTC)
Date: Thu, 27 Jan 2022 15:38:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ftrace: Have architectures opt-in for mcount build time
 sorting
Message-ID: <20220127153821.3bc1ac6e@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>,
 Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 Sachin Sant <sachinp@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yinan Liu <yinan@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=46rom f7d4ef4e77464e08af38789ea5d3a9cfb80a3d78 Mon Sep 17 00:00:00 2001
From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Date: Tue, 25 Jan 2022 09:19:10 -0500
Subject: [PATCH] ftrace: Have architectures opt-in for mcount build time
 sorting

First S390 complained that the sorting of the mcount sections at build
time caused the kernel to crash on their architecture. Now PowerPC is
complaining about it too. And also ARM64 appears to be having issues.

It may be necessary to also update the relocation table for the values
in the mcount table. Not only do we have to sort the table, but also
update the relocations that may be applied to the items in the table.

If the system is not relocatable, then it is fine to sort, but if it is,
some architectures may have issues (although x86 does not as it shifts all
addresses the same).

Add a HAVE_BUILDTIME_MCOUNT_SORT that an architecture can set to say it is
safe to do the sorting at build time.

Also update the config to compile in build time sorting in the sorttable
code in scripts/ to depend on CONFIG_BUILDTIME_MCOUNT_SORT.

Link: https://lore.kernel.org/all/944D10DA-8200-4BA9-8D0A-3BED9AA99F82@linu=
x.ibm.com/

Cc: Yinan Liu <yinan@linux.alibaba.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com> [arm64]
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: 72b3942a173c ("scripts: ftrace - move the sort-processing in ftrace_=
init")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
Changes since v1: https://lore.kernel.org/all/20220127114249.03b1b52b@ganda=
lf.local.home/
 - Have CONFIG_BUILDTIME_MCOUNT_SORT depend on DYNAMIC_FTRACE
   otherwise it fails to build when DYNAMIC_FTRACE is not set
   because it can not find the mcount section in the sorttable code.

 arch/arm/Kconfig     | 1 +
 arch/x86/Kconfig     | 1 +
 kernel/trace/Kconfig | 8 +++++++-
 scripts/Makefile     | 2 +-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c2724d986fa0..5256ebe57451 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -82,6 +82,7 @@ config ARM
 	select HAVE_EBPF_JIT if !CPU_ENDIAN_BE32
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_C_RECORDMCOUNT
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK if !XIP_KERNEL
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && !CPU_ENDIAN_BE32 && MMU
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7399327d1eff..46080dea5dba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -186,6 +186,7 @@ config X86
 	select HAVE_CONTEXT_TRACKING_OFFSTACK	if HAVE_CONTEXT_TRACKING
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_OBJTOOL_MCOUNT		if STACK_VALIDATION
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 752ed89a293b..a5eb5e7fd624 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -70,10 +70,16 @@ config HAVE_C_RECORDMCOUNT
 	help
 	  C version of recordmcount available?
=20
+config HAVE_BUILDTIME_MCOUNT_SORT
+       bool
+       help
+         An architecture selects this if it sorts the mcount_loc section
+	 at build time.
+
 config BUILDTIME_MCOUNT_SORT
        bool
        default y
-       depends on BUILDTIME_TABLE_SORT && !S390
+       depends on HAVE_BUILDTIME_MCOUNT_SORT && DYNAMIC_FTRACE
        help
          Sort the mcount_loc section at build time.
=20
diff --git a/scripts/Makefile b/scripts/Makefile
index b082d2f93357..cedc1f0e21d8 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -32,7 +32,7 @@ HOSTCFLAGS_sorttable.o +=3D -I$(srctree)/tools/arch/x86/i=
nclude
 HOSTCFLAGS_sorttable.o +=3D -DUNWINDER_ORC_ENABLED
 endif
=20
-ifdef CONFIG_DYNAMIC_FTRACE
+ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o +=3D -DMCOUNT_SORT_ENABLED
 endif
=20
--=20
2.33.0

