Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33017306A4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:24:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2mr6Pt5zDqs8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=WLBdunEB; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR25C56sczDr3X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:53:02 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIh024172;
 Thu, 28 Jan 2021 09:52:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIh024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795121;
 bh=PrMVoBNKnnm+AGS+8M8VBTW3dXXc2TUBPnlfCe8Gz5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WLBdunEBGknKebKtH+IwrgSup4M7Svnzx2H9PmcLb4zvAT9M2S+/NX5vd+q2DCj8K
 kbdRsoRrHnyvU+Iy3h73hKOTF2pe4hGA9Zty6JUXn6NPSUiirOqqL3gZHC1aa/YP1T
 FEaoZo5ZM3p5ojfDODnnyOZQkad/P6QfHc4xvZussNwrQ7V69Zald5QCkgnaZBSRnw
 9lGO4sNSEZTZGNnXmdJl6kmu0L+pzgNvs1POxFf1Wd4LM65ND8PtGhWMNlbXd5FRDx
 emJH5g2nzykOgT1+CgWB1CFQLeTMIn1Xxc9Q/PDXyBp1II/ekvasYfTWKck3lSE1Jc
 AZoEN4x3lIafA==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 12/27] m68k: syscalls: switch to generic syscalltbl.sh
Date: Thu, 28 Jan 2021 09:50:54 +0900
Message-Id: <20210128005110.2613902-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
order to generate syscall table headers. My goal is to unify them into
the single scripts/syscalltbl.sh.

This commit converts m68k to use scripts/syscalltbl.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/m68k/kernel/syscalls/Makefile      |  7 ++----
 arch/m68k/kernel/syscalls/syscalltbl.sh | 32 -------------------------
 arch/m68k/kernel/syscalltable.S         |  3 +--
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 arch/m68k/kernel/syscalls/syscalltbl.sh

diff --git a/arch/m68k/kernel/syscalls/Makefile b/arch/m68k/kernel/syscalls/Makefile
index 1c42d2d2926d..6610130c67bc 100644
--- a/arch/m68k/kernel/syscalls/Makefile
+++ b/arch/m68k/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(srctree)/$(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -16,10 +16,7 @@ quiet_cmd_syshdr = SYSHDR  $@
 		   '$(syshdr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
diff --git a/arch/m68k/kernel/syscalls/syscalltbl.sh b/arch/m68k/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 85d78d9309ad..000000000000
--- a/arch/m68k/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-my_abi="$4"
-offset="$5"
-
-emit() {
-	t_nxt="$1"
-	t_nr="$2"
-	t_entry="$3"
-
-	while [ $t_nxt -lt $t_nr ]; do
-		printf "__SYSCALL(%s, sys_ni_syscall, )\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s, %s, )\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry ; do
-		emit $((nxt+offset)) $((nr+offset)) $entry
-		nxt=$((nr+1))
-	done
-) > "$out"
diff --git a/arch/m68k/kernel/syscalltable.S b/arch/m68k/kernel/syscalltable.S
index d329cc7b481c..e25ef4a9df30 100644
--- a/arch/m68k/kernel/syscalltable.S
+++ b/arch/m68k/kernel/syscalltable.S
@@ -18,9 +18,8 @@
 #define sys_mmap2	sys_mmap_pgoff
 #endif
 
-#define __SYSCALL(nr, entry, nargs) .long entry
+#define __SYSCALL(nr, entry) .long entry
 	.section .rodata
 ALIGN
 ENTRY(sys_call_table)
 #include <asm/syscall_table.h>
-#undef __SYSCALL
-- 
2.27.0

