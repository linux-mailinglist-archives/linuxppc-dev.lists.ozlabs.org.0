Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C6306962
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:06:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR2Nq3Bv4zDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:06:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=SWxDVkAF; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR24m68hszDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:52:37 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIX024172;
 Thu, 28 Jan 2021 09:51:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIX024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795109;
 bh=gbMbtPrd1uw4SfvZtDPN5tcO1lAksGEXidy2tzv1gck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SWxDVkAFQuRWzyvDXKhEirM3GO9HVgiEkoPwsziGrvA7UHp95u8zOvl2m3BNNeRcn
 v0X+PTytGRvV0KXggsA0+sczavCS/X8fsffUaDv+X+yehtphUYPdkwYjeipobfCz/a
 8pZmwG/BWtM/M2zhRXbfxUnzxSPcifSt4r5t5+vqnrh+liLvpH4qIj+8b5xaZCodWY
 l9jrY+Drka/f4haON0F/9+X4wb+aJTiV2DF+HEhY0UEXW6HzAPz/KVjoBqfgvW8k5Z
 +l+UHueS+m36Ex3b3/IZtMxZgI7SdQL2BTY2S5lFJxEGaNwIun784zcwCV86iKsFLo
 sXJ9FgfjTFX7g==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings from
 COND_SYSCALL()
Date: Thu, 28 Jan 2021 09:50:44 +0900
Message-Id: <20210128005110.2613902-3-masahiroy@kernel.org>
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

Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes
warnings.

$ make W=1 kernel/sys_ni.o
  [ snip ]
  CC      kernel/sys_ni.o
In file included from kernel/sys_ni.c:10:
./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
   83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
      |              ^~
./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
  100 |  __COND_SYSCALL(x64, sys_##name)
      |  ^~~~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
  256 |  __X64_COND_SYSCALL(name)     \
      |  ^~~~~~~~~~~~~~~~~~
kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
   39 | COND_SYSCALL(io_setup);
      | ^~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
   83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
      |              ^~
./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
  120 |  __COND_SYSCALL(ia32, sys_##name)
      |  ^~~~~~~~~~~~~~
./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
  257 |  __IA32_COND_SYSCALL(name)
      |  ^~~~~~~~~~~~~~~~~~~
kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
   39 | COND_SYSCALL(io_setup);
      | ^~~~~~~~~~~~
  ...

__SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
declarations. Let's do likewise for __COND_SYSCALL() to fix the
warnings.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/include/asm/syscall_wrapper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
index a84333adeef2..80c08c7d5e72 100644
--- a/arch/x86/include/asm/syscall_wrapper.h
+++ b/arch/x86/include/asm/syscall_wrapper.h
@@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
 	}
 
 #define __COND_SYSCALL(abi, name)					\
+	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
 	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
 	{								\
 		return sys_ni_syscall();				\
-- 
2.27.0

