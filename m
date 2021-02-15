Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8116631B3B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 01:53:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df5FH2RxHz3cHV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 11:53:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=SM2AX/TT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.75;
 helo=conuserg-08.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=SM2AX/TT; 
 dkim-atps=neutral
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Df5Dq030kz2yTs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 11:52:58 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id 11F0mqgC009582;
 Mon, 15 Feb 2021 09:48:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11F0mqgC009582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1613350139;
 bh=Do58g+fIWucUZ2Hl9cDGQ5X6Gc6bjsY9y84cwfGvMEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SM2AX/TTCgabZcepPaY+EzPWlVFG07BHed4+vVXzs76ahyRHkYdvjiMaxbo4SciNk
 99V7vAau2v1CJZ3KHHFtlsyvo6HAayFKsqyE45QYBEFlto50Klgio1cy4dCikELgg4
 jXzbhQlcLnoMztNUY+qoz6gF3IiQTs6LZQECNhrQ3SgQk+5ZjIEOVkvEjNe0kLdvQy
 5lnx8xIDULhJNVq2q/XmnUdcQ2NkNa26MnbkcPi1iQ03oyTXDlmPZELJWBN+zT1pYk
 2YZu+JYUWZc3XOFM1ST+sDLb1bwtcZGRc02Yve6q1UW7Z2EZW/5av6DrunsU9tIhyS
 NiEpgCG0PPQ4w==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] arch: syscalls: remove $(srctree)/ prefix from syscall
 tables
Date: Mon, 15 Feb 2021 09:48:23 +0900
Message-Id: <20210215004823.440102-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210215004823.440102-1-masahiroy@kernel.org>
References: <20210215004823.440102-1-masahiroy@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-xtensa@linux-xtensa.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 'syscall' variables are not directly used in the commands.
Remove the $(srctree)/ prefix because we can rely on VPATH.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/kernel/syscalls/Makefile      | 2 +-
 arch/arm/tools/Makefile                  | 2 +-
 arch/ia64/kernel/syscalls/Makefile       | 2 +-
 arch/m68k/kernel/syscalls/Makefile       | 2 +-
 arch/microblaze/kernel/syscalls/Makefile | 2 +-
 arch/mips/kernel/syscalls/Makefile       | 6 +++---
 arch/parisc/kernel/syscalls/Makefile     | 2 +-
 arch/powerpc/kernel/syscalls/Makefile    | 2 +-
 arch/sh/kernel/syscalls/Makefile         | 2 +-
 arch/sparc/kernel/syscalls/Makefile      | 2 +-
 arch/x86/entry/syscalls/Makefile         | 4 ++--
 arch/xtensa/kernel/syscalls/Makefile     | 2 +-
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/syscalls/Makefile
index 1c42d2d2926d..285aaba832d9 100644
--- a/arch/alpha/kernel/syscalls/Makefile
+++ b/arch/alpha/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
index 27d8beb7c941..3654f979851b 100644
--- a/arch/arm/tools/Makefile
+++ b/arch/arm/tools/Makefile
@@ -11,7 +11,7 @@ uapi := $(gen)/uapi/asm
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 sysnr := $(srctree)/$(src)/syscallnr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 
 gen-y := $(gen)/calls-oabi.S
 gen-y += $(gen)/calls-eabi.S
diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
index b9bfd186295f..bf4bda0f63eb 100644
--- a/arch/ia64/kernel/syscalls/Makefile
+++ b/arch/ia64/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/m68k/kernel/syscalls/Makefile b/arch/m68k/kernel/syscalls/Makefile
index 1c42d2d2926d..285aaba832d9 100644
--- a/arch/m68k/kernel/syscalls/Makefile
+++ b/arch/m68k/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/microblaze/kernel/syscalls/Makefile b/arch/microblaze/kernel/syscalls/Makefile
index 1c42d2d2926d..285aaba832d9 100644
--- a/arch/microblaze/kernel/syscalls/Makefile
+++ b/arch/microblaze/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index f15842bda464..ed22b711ccb7 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -5,9 +5,9 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscalln32 := $(srctree)/$(src)/syscall_n32.tbl
-syscalln64 := $(srctree)/$(src)/syscall_n64.tbl
-syscallo32 := $(srctree)/$(src)/syscall_o32.tbl
+syscalln32 := $(src)/syscall_n32.tbl
+syscalln64 := $(src)/syscall_n64.tbl
+syscallo32 := $(src)/syscall_o32.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 sysnr := $(srctree)/$(src)/syscallnr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
index 556fe30a6c8f..283f64407b07 100644
--- a/arch/parisc/kernel/syscalls/Makefile
+++ b/arch/parisc/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/powerpc/kernel/syscalls/Makefile b/arch/powerpc/kernel/syscalls/Makefile
index d609f0040b2a..9e3be295dbba 100644
--- a/arch/powerpc/kernel/syscalls/Makefile
+++ b/arch/powerpc/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/sh/kernel/syscalls/Makefile b/arch/sh/kernel/syscalls/Makefile
index 1c42d2d2926d..285aaba832d9 100644
--- a/arch/sh/kernel/syscalls/Makefile
+++ b/arch/sh/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/sparc/kernel/syscalls/Makefile b/arch/sparc/kernel/syscalls/Makefile
index 556fe30a6c8f..283f64407b07 100644
--- a/arch/sparc/kernel/syscalls/Makefile
+++ b/arch/sparc/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index e1c7ddb7546b..cf388e9e8989 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -6,8 +6,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(out)' ] || mkdir -p '$(out)') \
 	  $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')
 
-syscall32 := $(srctree)/$(src)/syscall_32.tbl
-syscall64 := $(srctree)/$(src)/syscall_64.tbl
+syscall32 := $(src)/syscall_32.tbl
+syscall64 := $(src)/syscall_64.tbl
 
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
diff --git a/arch/xtensa/kernel/syscalls/Makefile b/arch/xtensa/kernel/syscalls/Makefile
index 1c42d2d2926d..285aaba832d9 100644
--- a/arch/xtensa/kernel/syscalls/Makefile
+++ b/arch/xtensa/kernel/syscalls/Makefile
@@ -5,7 +5,7 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 	  $(shell [ -d '$(kapi)' ] || mkdir -p '$(kapi)')
 
-syscall := $(srctree)/$(src)/syscall.tbl
+syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
 systbl := $(srctree)/$(src)/syscalltbl.sh
 
-- 
2.27.0

