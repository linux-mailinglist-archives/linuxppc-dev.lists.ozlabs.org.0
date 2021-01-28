Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6180306A48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:22:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2l62YTJzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=0AvOpll9; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR25C3lhVzDr3P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:53:02 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIm024172;
 Thu, 28 Jan 2021 09:52:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIm024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795128;
 bh=wgcDkGkr+fADFw2acutcJVav26gpalK1ucrzuPe9fvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0AvOpll9V5c4Wf1O6fqeg3J7C9F3lt+q7XKBF2KkSBs6k2Ilf/U2wJeNmLrwDxKUo
 WLJbdWdGaZtbeckWqkDZOFXOwWNqe/4V8KHT39AYVDSQNMIIRWdYZJhxJE3qzyL4ay
 ru/SQXe0kblt9+P2dTAQW5kNEK8b6Jzev+i3eqP1I5M9QKYljmLjYmdT8P04VgWlJD
 ZBuJBy1+tvrRETQ9PuRnRBD+/lTlarj/RgGeaHcoi2z9Mou4Gjihr0pErICkYgVzpk
 orLr65FqhO7iQMz+CUztP0jFaQM2jdaGkA6G9n92NU3FBYzG/a8DpS9CXn3llIKHFP
 5Jfif5BQVNUtw==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 17/27] parisc: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:59 +0900
Message-Id: <20210128005110.2613902-18-masahiroy@kernel.org>
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

The rules in this Makefile cannot detect the command line change because
the prerequisite 'FORCE' is missing.

Adding 'FORCE' will result in the headers being rebuilt every time
because the 'targets' addition is also wrong; the file paths in
'targets' must be relative to the current Makefile.

Fix all of them so the if_changed rules work correctly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/parisc/kernel/syscalls/Makefile | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
index c22a21c39f30..556fe30a6c8f 100644
--- a/arch/parisc/kernel/syscalls/Makefile
+++ b/arch/parisc/kernel/syscalls/Makefile
@@ -22,24 +22,24 @@ quiet_cmd_systbl = SYSTBL  $@
 		   '$(systbl_offset_$(basetarget))'
 
 syshdr_abis_unistd_32 := common,32
-$(uapi)/unistd_32.h: $(syscall) $(syshdr)
+$(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abis_unistd_64 := common,64
-$(uapi)/unistd_64.h: $(syscall) $(syshdr)
+$(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 systbl_abis_syscall_table_32 := common,32
-$(kapi)/syscall_table_32.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abis_syscall_table_64 := common,64
-$(kapi)/syscall_table_64.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abis_syscall_table_c32 := common,32
 systbl_abi_syscall_table_c32 := c32
-$(kapi)/syscall_table_c32.h: $(syscall) $(systbl)
+$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_32.h unistd_64.h
@@ -47,9 +47,10 @@ kapisyshdr-y		+= syscall_table_32.h		\
 			   syscall_table_64.h		\
 			   syscall_table_c32.h
 
-targets	+= $(uapisyshdr-y) $(kapisyshdr-y)
+uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
+kapisyshdr-y	:= $(addprefix $(kapi)/, $(kapisyshdr-y))
+targets		+= $(addprefix ../../../../, $(uapisyshdr-y) $(kapisyshdr-y))
 
 PHONY += all
-all: $(addprefix $(uapi)/,$(uapisyshdr-y))
-all: $(addprefix $(kapi)/,$(kapisyshdr-y))
+all: $(uapisyshdr-y) $(kapisyshdr-y)
 	@:
-- 
2.27.0

