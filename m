Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 216B3328288
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 16:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq45F0k2Jz3d5d
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 02:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=BhTaNI6y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=BhTaNI6y; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq44n17LBz3clg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 02:32:08 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net
 [126.26.90.165]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 121FUTYO004032;
 Tue, 2 Mar 2021 00:30:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 121FUTYO004032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1614612630;
 bh=VfvQguWaK1/mpP8UZ1yT4n8SsJiHcDO/BZXiCPgpcSs=;
 h=From:To:Cc:Subject:Date:From;
 b=BhTaNI6y5cfDDgRgg7tJ0flEyMmeauz+tZJELZtamlLiLFHG0Shy2tTygFUeAPZlH
 EeHhKdEYeW8n9yDOHbJ7MwFs5Qgr4HNyh/MQ9jMTub+tGJbaYn1AVOSyotgZu5df+f
 g6FiBrisFlkzYMTjQnPVv6ns8DNp+jYigUwUme33O5muP5pjTwaHdhltBhEuVe82dH
 o2c+SuilL7RCAimD5QGcA6mQtlD3/bXG24Dt1xXdhI3qDEA2wbfC3FqMV/1p6FR4QT
 ujkH44WNWUlofoOnyIvdITSVtWJAFG+cE9xBPiN7Wwsh7q4Dd+u03qNn/pIAmwkpZE
 nqM786MtcB5qw==
X-Nifty-SrcIP: [126.26.90.165]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: syscalls: switch to generic syscalltbl.sh
Date: Tue,  2 Mar 2021 00:30:18 +0900
Message-Id: <20210301153019.362742-1-masahiroy@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Christopherson <seanjc@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Gardon <bgardon@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many architectures duplicate similar shell scripts.

This commit converts powerpc to use scripts/syscalltbl.sh. This also
unifies syscall_table_32.h and syscall_table_c32.h.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/include/asm/Kbuild             |  1 -
 arch/powerpc/kernel/syscalls/Makefile       | 22 +++----------
 arch/powerpc/kernel/syscalls/syscalltbl.sh  | 36 ---------------------
 arch/powerpc/kernel/systbl.S                |  5 ++-
 arch/powerpc/platforms/cell/spu_callbacks.c |  2 +-
 5 files changed, 10 insertions(+), 56 deletions(-)
 delete mode 100644 arch/powerpc/kernel/syscalls/syscalltbl.sh

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index e1f9b4ea1c53..bcf95ce0964f 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
-generated-y += syscall_table_c32.h
 generated-y += syscall_table_spu.h
 generic-y += export.h
 generic-y += kvm_types.h
diff --git a/arch/powerpc/kernel/syscalls/Makefile b/arch/powerpc/kernel/syscalls/Makefile
index 9e3be295dbba..df21c731c806 100644
--- a/arch/powerpc/kernel/syscalls/Makefile
+++ b/arch/powerpc/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(src)/syscall.tbl
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
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) --abis $(abis) $< $@
 
 syshdr_abis_unistd_32 := common,nospu,32
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
@@ -29,30 +26,21 @@ syshdr_abis_unistd_64 := common,nospu,64
 $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-systbl_abis_syscall_table_32 := common,nospu,32
-systbl_abi_syscall_table_32 := 32
+$(kapi)/syscall_table_32.h: abis := common,nospu,32
 $(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-systbl_abis_syscall_table_64 := common,nospu,64
-systbl_abi_syscall_table_64 := 64
+$(kapi)/syscall_table_64.h: abis := common,nospu,64
 $(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-systbl_abis_syscall_table_c32 := common,nospu,32
-systbl_abi_syscall_table_c32 := c32
-$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
-	$(call if_changed,systbl)
-
-systbl_abis_syscall_table_spu := common,spu
-systbl_abi_syscall_table_spu := spu
+$(kapi)/syscall_table_spu.h: abis := common,spu
 $(kapi)/syscall_table_spu.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_32.h unistd_64.h
 kapisyshdr-y		+= syscall_table_32.h		\
 			   syscall_table_64.h		\
-			   syscall_table_c32.h		\
 			   syscall_table_spu.h
 
 uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
diff --git a/arch/powerpc/kernel/syscalls/syscalltbl.sh b/arch/powerpc/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index f7393a7b18aa..000000000000
--- a/arch/powerpc/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,36 +0,0 @@
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
-		printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry compat ; do
-		if [ "$my_abi" = "c32" ] && [ ! -z "$compat" ]; then
-			emit $((nxt+offset)) $((nr+offset)) $compat
-		else
-			emit $((nxt+offset)) $((nr+offset)) $entry
-		fi
-		nxt=$((nr+1))
-	done
-) > "$out"
diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index d34276f3c495..cb3358886203 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -21,6 +21,7 @@
 #define __SYSCALL(nr, entry)	.long entry
 #endif
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 .globl sys_call_table
 sys_call_table:
 #ifdef CONFIG_PPC64
@@ -30,8 +31,10 @@ sys_call_table:
 #endif
 
 #ifdef CONFIG_COMPAT
+#undef __SYSCALL_WITH_COMPAT
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
 .globl compat_sys_call_table
 compat_sys_call_table:
 #define compat_sys_sigsuspend	sys_sigsuspend
-#include <asm/syscall_table_c32.h>
+#include <asm/syscall_table_32.h>
 #endif
diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c b/arch/powerpc/platforms/cell/spu_callbacks.c
index abdef9bcf432..fe0d8797a00a 100644
--- a/arch/powerpc/platforms/cell/spu_callbacks.c
+++ b/arch/powerpc/platforms/cell/spu_callbacks.c
@@ -35,9 +35,9 @@
  */
 
 static void *spu_syscall_table[] = {
+#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
 #define __SYSCALL(nr, entry) [nr] = entry,
 #include <asm/syscall_table_spu.h>
-#undef __SYSCALL
 };
 
 long spu_sys_callback(struct spu_syscall_block *s)
-- 
2.27.0

