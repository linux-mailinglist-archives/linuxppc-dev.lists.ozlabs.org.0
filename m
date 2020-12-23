Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A601F2E1FC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 18:16:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1KcQ3s1szDqRf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 04:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.77;
 helo=conuserg-10.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=2SquL9pu; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1KXd0YJLzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Dec 2020 04:13:04 +1100 (AEDT)
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net
 [126.90.214.151]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0BNHBjDI029748;
 Thu, 24 Dec 2020 02:11:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0BNHBjDI029748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608743507;
 bh=EJDHjvxBhuu/OgdB/K8U9ottihe8bt0d/rxGUNGG0PE=;
 h=From:To:Cc:Subject:Date:From;
 b=2SquL9pujp6+tlP0kbW8WKUCr6guAfpCgqHNGYypN6orvm6jVqiUhK4dvlRtEgaXg
 tdL2J+kwChXubNp350IaryPh7AQJzbg2K0MoaWf9usBRkanDoQfHsSzw/hHj7AO6IX
 Y5LaeCrmSCLKA0rylT9Fl1SKlZtm3N64GWd1R9TB5Tur6Vts+fwp58+n5Vguw/7Xgk
 hHKltwyFMDaaAKbRCfxIAlvSIp0silAX61dZjaO54fvhwS+1YVCHRo7rO7ymf5DRqP
 PT3SpDeLpPWxiBc0I2EbNff10BQYgd/u2EZlV3yaR3CshNaOXUdj3FaC6/tLMRKfq7
 dBSGJ6F4pL+ag==
X-Nifty-SrcIP: [126.90.214.151]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/vdso: fix unnecessary rebuilds of vgettimeofday.o
Date: Thu, 24 Dec 2020 02:11:41 +0900
Message-Id: <20201223171142.707053-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Greentime Hu <green.hu@gmail.com>, Michal Suchanek <msuchanek@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vgettimeofday.o is unnecessarily rebuilt. Adding it to 'targets' is not
enough to fix the issue. Kbuild is correctly rebuilding it because the
command line is changed.

PowerPC builds each vdso directory twice; first in vdso_prepare to
generate vdso{32,64}-offsets.h, second as part of the ordinary build
process to embed vdso{32,64}.so.dbg into the kernel.

The problem shows up when CONFIG_PPC_WERROR=y due to the following line
in arch/powerpc/Kbuild:

  subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror

In the preparation stage, Kbuild directly visits the vdso directories,
hence it does not inherit subdir-ccflags-y. In the second descend,
Kbuild adds -Werror, which results in the command line flipping
with/without -Werror.

It implies a potential danger; if a more critical flag that would impact
the resulted vdso, the offsets recorded in the headers might be different
from real offsets in the embedded vdso images.

Removing the unneeded second descend solves the problem.

Link: https://lore.kernel.org/linuxppc-dev/87tuslxhry.fsf@mpe.ellerman.id.au/
Reported-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/Makefile                      | 4 ++--
 arch/powerpc/kernel/vdso32/Makefile               | 5 +----
 arch/powerpc/kernel/{vdso32 => }/vdso32_wrapper.S | 0
 arch/powerpc/kernel/vdso64/Makefile               | 6 +-----
 arch/powerpc/kernel/{vdso64 => }/vdso64_wrapper.S | 0
 5 files changed, 4 insertions(+), 11 deletions(-)
 rename arch/powerpc/kernel/{vdso32 => }/vdso32_wrapper.S (100%)
 rename arch/powerpc/kernel/{vdso64 => }/vdso64_wrapper.S (100%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index fe2ef598e2ea..79ee7750937d 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -51,7 +51,7 @@ obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o \
 				   paca.o nvram_64.o note.o syscall_64.o
 obj-$(CONFIG_COMPAT)		+= sys_ppc32.o signal_32.o
-obj-$(CONFIG_VDSO32)		+= vdso32/
+obj-$(CONFIG_VDSO32)		+= vdso32_wrapper.o
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_DAWR)		+= dawr.o
@@ -60,7 +60,7 @@ obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
 obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_book3e.o
 obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
-obj-$(CONFIG_PPC64)		+= vdso64/
+obj-$(CONFIG_PPC64)		+= vdso64_wrapper.o
 obj-$(CONFIG_ALTIVEC)		+= vecemu.o
 obj-$(CONFIG_PPC_BOOK3S_IDLE)	+= idle_book3s.o
 procfs-y			:= proc_powerpc.o
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 59aa2944ecae..42fc3de89b39 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -30,7 +30,7 @@ CC32FLAGS += -m32
 KBUILD_CFLAGS := $(filter-out -mcmodel=medium,$(KBUILD_CFLAGS))
 endif
 
-targets := $(obj-vdso32) vdso32.so.dbg
+targets := $(obj-vdso32) vdso32.so.dbg vgettimeofday.o
 obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 
 GCOV_PROFILE := n
@@ -46,9 +46,6 @@ obj-y += vdso32_wrapper.o
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 
-# Force dependency (incbin is bad)
-$(obj)/vdso32_wrapper.o : $(obj)/vdso32.so.dbg
-
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso32ld_and_check)
diff --git a/arch/powerpc/kernel/vdso32/vdso32_wrapper.S b/arch/powerpc/kernel/vdso32_wrapper.S
similarity index 100%
rename from arch/powerpc/kernel/vdso32/vdso32_wrapper.S
rename to arch/powerpc/kernel/vdso32_wrapper.S
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index d365810a689a..b50b39fedf74 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -17,7 +17,7 @@ endif
 
 # Build rules
 
-targets := $(obj-vdso64) vdso64.so.dbg
+targets := $(obj-vdso64) vdso64.so.dbg vgettimeofday.o
 obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
 
 GCOV_PROFILE := n
@@ -29,15 +29,11 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 	-Wl,-soname=linux-vdso64.so.1 -Wl,--hash-style=both
 asflags-y := -D__VDSO64__ -s
 
-obj-y += vdso64_wrapper.o
 targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 
 $(obj)/vgettimeofday.o: %.o: %.c FORCE
 
-# Force dependency (incbin is bad)
-$(obj)/vdso64_wrapper.o : $(obj)/vdso64.so.dbg
-
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso64ld_and_check)
diff --git a/arch/powerpc/kernel/vdso64/vdso64_wrapper.S b/arch/powerpc/kernel/vdso64_wrapper.S
similarity index 100%
rename from arch/powerpc/kernel/vdso64/vdso64_wrapper.S
rename to arch/powerpc/kernel/vdso64_wrapper.S
-- 
2.27.0

