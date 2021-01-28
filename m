Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 295FB306964
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:08:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2Qn3FQBzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=dHgoABCG; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR24m4176zDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:52:36 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIY024172;
 Thu, 28 Jan 2021 09:51:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIY024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795110;
 bh=d+/7doZEOPv1GMwh0J3MdPuks+/gdDt09tnPkcOGE80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dHgoABCG/DLtFuPlboUdmsid9QOFdwj4Tf4PGzheip0c70k1znW9rHwDaVAm1ON9c
 MqujfDDvycEhQUC7c4A6EAS6XcIAN+RsPgZg5X4iVdsdNl9Ijhku5W1E2IB3RHnIHf
 PVi5uaMIr3ScOj/K206H/yZuaQRofL0r01hroLHoZkOIAH7k8bCVjqex4M7jHFsd7w
 33gPNSjwYmhXY9xmRZGWkWTY/bJWhubfFR5maBIJRAqhuDUIE8dR/O5ZmuTYZ6lCHz
 KufvyYi7nnMRU/ql91EaeR5YhQwmGuzj1a6eX+DwdGUvtDgwlx3gy7/iWUC78zcslY
 Ti9bulEqhkoFA==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 03/27] x86/build: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:45 +0900
Message-Id: <20210128005110.2613902-4-masahiroy@kernel.org>
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

 arch/x86/entry/syscalls/Makefile | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index 6fb9b57ed5ba..e1c7ddb7546b 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -24,34 +24,34 @@ quiet_cmd_hypercalls = HYPERCALLS $@
       cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$^)
 
 syshdr_abi_unistd_32 := i386
-$(uapi)/unistd_32.h: $(syscall32) $(syshdr)
+$(uapi)/unistd_32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_32_ia32 := i386
 syshdr_pfx_unistd_32_ia32 := ia32_
-$(out)/unistd_32_ia32.h: $(syscall32) $(syshdr)
+$(out)/unistd_32_ia32.h: $(syscall32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_x32 := common,x32
 syshdr_offset_unistd_x32 := __X32_SYSCALL_BIT
-$(uapi)/unistd_x32.h: $(syscall64) $(syshdr)
+$(uapi)/unistd_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_64 := common,64
-$(uapi)/unistd_64.h: $(syscall64) $(syshdr)
+$(uapi)/unistd_64.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_abi_unistd_64_x32 := x32
 syshdr_pfx_unistd_64_x32 := x32_
-$(out)/unistd_64_x32.h: $(syscall64) $(syshdr)
+$(out)/unistd_64_x32.h: $(syscall64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-$(out)/syscalls_32.h: $(syscall32) $(systbl)
+$(out)/syscalls_32.h: $(syscall32) $(systbl) FORCE
 	$(call if_changed,systbl)
-$(out)/syscalls_64.h: $(syscall64) $(systbl)
+$(out)/syscalls_64.h: $(syscall64) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh
+$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh FORCE
 	$(call if_changed,hypercalls)
 
 $(out)/xen-hypercalls.h: $(srctree)/include/xen/interface/xen*.h
@@ -62,9 +62,10 @@ syshdr-$(CONFIG_X86_64)		+= unistd_32_ia32.h unistd_64_x32.h
 syshdr-$(CONFIG_X86_64)		+= syscalls_64.h
 syshdr-$(CONFIG_XEN)		+= xen-hypercalls.h
 
-targets	+= $(uapisyshdr-y) $(syshdr-y)
+uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
+syshdr-y	:= $(addprefix $(out)/, $(syshdr-y))
+targets		+= $(addprefix ../../../../, $(uapisyshdr-y) $(syshdr-y))
 
 PHONY += all
-all: $(addprefix $(uapi)/,$(uapisyshdr-y))
-all: $(addprefix $(out)/,$(syshdr-y))
+all: $(uapisyshdr-y) $(syshdr-y)
 	@:
-- 
2.27.0

