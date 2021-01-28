Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC8306A9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:44:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3Dr1Qw4zDrBl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:44:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=aKtiHyjH; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR25k0cbrzDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:53:29 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIk024172;
 Thu, 28 Jan 2021 09:52:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIk024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795125;
 bh=4ZenFWWjMwiEnwQD+VnDQheVfxi1y/5KimgQE4NLnQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aKtiHyjHsYe9u5ri0K9prFcwTl4Bu2c/ZztMNtcYtVPAQARxtyi4eBxNF1EAEn4Tj
 8B5t6MgqLiD3v9YEkZ8C+xCVVG2/9D7KvftmX9XZ696fogvkawfmp/oU43+NJeJuQ2
 b37yyIHcbTSFxO6RddsBhC5l3I8VmTxbFF/QjSD/MyCE5FR+/rSLec2ixwvptvbtUg
 tZl/DpRD7MkiwOA77aOsNkqjYGxyyhpGsCPv9myVExs2Tk4NLqLPWgHDgwUWw2UHnN
 QPxvVsN+Q0M9AK0hO66OjoKnSVvDP+l2GRRWPrfOOcFamvz44AwX0HLrpC1/IOfImK
 lDZlmx2kV35qA==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 15/27] mips: add missing FORCE and fix 'targets' to make
 if_changed work
Date: Thu, 28 Jan 2021 09:50:57 +0900
Message-Id: <20210128005110.2613902-16-masahiroy@kernel.org>
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

 arch/mips/kernel/syscalls/Makefile | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index 6efb2f6889a7..f15842bda464 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -31,50 +31,50 @@ quiet_cmd_systbl = SYSTBL  $@
 		   '$(systbl_offset_$(basetarget))'
 
 syshdr_offset_unistd_n32 := __NR_Linux
-$(uapi)/unistd_n32.h: $(syscalln32) $(syshdr)
+$(uapi)/unistd_n32.h: $(syscalln32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_offset_unistd_n64 := __NR_Linux
-$(uapi)/unistd_n64.h: $(syscalln64) $(syshdr)
+$(uapi)/unistd_n64.h: $(syscalln64) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 syshdr_offset_unistd_o32 := __NR_Linux
-$(uapi)/unistd_o32.h: $(syscallo32) $(syshdr)
+$(uapi)/unistd_o32.h: $(syscallo32) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
 sysnr_pfx_unistd_nr_n32 := N32
 sysnr_offset_unistd_nr_n32 := 6000
-$(uapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr)
+$(uapi)/unistd_nr_n32.h: $(syscalln32) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 sysnr_pfx_unistd_nr_n64 := 64
 sysnr_offset_unistd_nr_n64 := 5000
-$(uapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr)
+$(uapi)/unistd_nr_n64.h: $(syscalln64) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 sysnr_pfx_unistd_nr_o32 := O32
 sysnr_offset_unistd_nr_o32 := 4000
-$(uapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr)
+$(uapi)/unistd_nr_o32.h: $(syscallo32) $(sysnr) FORCE
 	$(call if_changed,sysnr)
 
 systbl_abi_syscall_table_32_o32 := 32_o32
 systbl_offset_syscall_table_32_o32 := 4000
-$(kapi)/syscall_table_32_o32.h: $(syscallo32) $(systbl)
+$(kapi)/syscall_table_32_o32.h: $(syscallo32) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abi_syscall_table_64_n32 := 64_n32
 systbl_offset_syscall_table_64_n32 := 6000
-$(kapi)/syscall_table_64_n32.h: $(syscalln32) $(systbl)
+$(kapi)/syscall_table_64_n32.h: $(syscalln32) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abi_syscall_table_64_n64 := 64_n64
 systbl_offset_syscall_table_64_n64 := 5000
-$(kapi)/syscall_table_64_n64.h: $(syscalln64) $(systbl)
+$(kapi)/syscall_table_64_n64.h: $(syscalln64) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 systbl_abi_syscall_table_64_o32 := 64_o32
 systbl_offset_syscall_table_64_o32 := 4000
-$(kapi)/syscall_table_64_o32.h: $(syscallo32) $(systbl)
+$(kapi)/syscall_table_64_o32.h: $(syscallo32) $(systbl) FORCE
 	$(call if_changed,systbl)
 
 uapisyshdr-y		+= unistd_n32.h			\
@@ -88,9 +88,10 @@ kapisyshdr-y		+= syscall_table_32_o32.h	\
 			   syscall_table_64_n64.h	\
 			   syscall_table_64_o32.h
 
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

