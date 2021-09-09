Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E2404782
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 11:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4tNN4SCFz2yPF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Sep 2021 19:04:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ow8B+4vt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=o451686892@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ow8B+4vt; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4tMf4DLNz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Sep 2021 19:03:24 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id k23so917154pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Sep 2021 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
 b=ow8B+4vt1F9pLfHYV9Ij+hl6+gQr9b6FrcTZp87zzgq1QFzurdhRot3GR615SQjlCw
 Zh4RokFDllDi62GMhO7kFspujGar5GxlzpGSBRNRsZfQbQVIAbEOyPCqPhV1TBKXPJ+s
 u9zasRNTyWq8lIbx1jH8+5ssE7WtjYRbI0SxC0XjXbWBG7dNmL5jDpm04aYaqCtEHPMd
 oLMLrY6dxdb9aYvbcIz452wViyDA59FwyRhJgVKZpONOjEDjVsaSYv3vx/vOrl7m0wyK
 ghHlPZ1M7WyydtleY3pZPxr+zKPmwqTqIBcA98XBRxv6yxV4tWBWRIp7oAV3uoS7xKav
 JWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oxrt0Di1Z5ok1Wnf6tUzyGoie6Gm8VDj4Nc/fyIhFs0=;
 b=IQzHlbOgO7/MXtDZIFYdTMPbmYlFYpsQBsGiTF0CPZAV4h/Hc8DCL6uvjNPn5V03A0
 HqWTDAC5ESDwLH1/8dtrCTY+2By1y0it0aVkXem+D4lZuxlcJlrh8czzTZnRgFor766Z
 qxS3lgtMPyTNAB0b2kHzqJExbEF2gX+APrFIVBqfEi3pb/V3tgevQLe/TYDhFn6Gbtsx
 uZUdh7EIF+2NGNfPMCHlggsjC236+LcsrSO1fTO7ppd6Aq0amRkzbw+T0L3t+bBPPhbd
 23KaAQU4wnpfJEAiZkIRH/5DS7DwPuCbKZ8O2QXFjy7x5StELvyJkBvaEBWXtcmI9Auv
 6dDw==
X-Gm-Message-State: AOAM533Jkx8F5C8K+fJxB3X2DLZ2zaeKYcTmRtI+z+GnNBULYtHVR8rY
 xICW/LHyzHrfIvscdB84Stw=
X-Google-Smtp-Source: ABdhPJxHu9zJJ9FJUWJZJWQdpknTVzTkm8TBNRuaQJzThvN9YUYI4ouL8lSFHZOTHz+j9wwl1nI78w==
X-Received: by 2002:a17:902:d486:b0:135:9335:795b with SMTP id
 c6-20020a170902d48600b001359335795bmr1692439plg.73.1631178199865; 
 Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
Received: from ownia.. ([173.248.225.217])
 by smtp.gmail.com with ESMTPSA id q126sm1600085pfc.156.2021.09.09.02.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 02:03:19 -0700 (PDT)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH v4] ftrace: Cleanup ftrace_dyn_arch_init()
Date: Thu,  9 Sep 2021 17:02:16 +0800
Message-Id: <20210909090216.1955240-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.30.2
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
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Weizhao Ouyang <o451686892@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
ftrace_dyn_arch_init() to cleanup them.

Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
Acked-by: Helge Deller <deller@gmx.de> (parisc)

---
Changes in v4:
-- revert the generic declaration

Changes in v3:
-- fix unrecognized opcode on PowerPC

Changes in v2:
-- correct CONFIG_DYNAMIC_FTRACE on PowerPC
-- add Acked-by tag

---
 arch/arm/kernel/ftrace.c        | 5 -----
 arch/arm64/kernel/ftrace.c      | 5 -----
 arch/csky/kernel/ftrace.c       | 5 -----
 arch/ia64/kernel/ftrace.c       | 6 ------
 arch/microblaze/kernel/ftrace.c | 5 -----
 arch/nds32/kernel/ftrace.c      | 5 -----
 arch/parisc/kernel/ftrace.c     | 5 -----
 arch/riscv/kernel/ftrace.c      | 5 -----
 arch/s390/kernel/ftrace.c       | 5 -----
 arch/sh/kernel/ftrace.c         | 5 -----
 arch/sparc/kernel/ftrace.c      | 5 -----
 arch/x86/kernel/ftrace.c        | 5 -----
 kernel/trace/ftrace.c           | 5 +++++
 13 files changed, 5 insertions(+), 61 deletions(-)

diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
index 3c83b5d29697..a006585e1c09 100644
--- a/arch/arm/kernel/ftrace.c
+++ b/arch/arm/kernel/ftrace.c
@@ -193,11 +193,6 @@ int ftrace_make_nop(struct module *mod,
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 7f467bd9db7a..fc62dfe73f93 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -236,11 +236,6 @@ void arch_ftrace_update_code(int command)
 	command |= FTRACE_MAY_SLEEP;
 	ftrace_modify_all_code(command);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/csky/kernel/ftrace.c b/arch/csky/kernel/ftrace.c
index b4a7ec1517ff..50bfcf129078 100644
--- a/arch/csky/kernel/ftrace.c
+++ b/arch/csky/kernel/ftrace.c
@@ -133,11 +133,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 				(unsigned long)func, true, true);
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/ia64/kernel/ftrace.c b/arch/ia64/kernel/ftrace.c
index b2ab2d58fb30..d6360fd404ab 100644
--- a/arch/ia64/kernel/ftrace.c
+++ b/arch/ia64/kernel/ftrace.c
@@ -194,9 +194,3 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	flush_icache_range(addr, addr + 16);
 	return 0;
 }
-
-/* run from kstop_machine */
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
diff --git a/arch/microblaze/kernel/ftrace.c b/arch/microblaze/kernel/ftrace.c
index 224eea40e1ee..188749d62709 100644
--- a/arch/microblaze/kernel/ftrace.c
+++ b/arch/microblaze/kernel/ftrace.c
@@ -163,11 +163,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	return ret;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	unsigned long ip = (unsigned long)(&ftrace_call);
diff --git a/arch/nds32/kernel/ftrace.c b/arch/nds32/kernel/ftrace.c
index 0e23e3a8df6b..f0ef4842d191 100644
--- a/arch/nds32/kernel/ftrace.c
+++ b/arch/nds32/kernel/ftrace.c
@@ -84,11 +84,6 @@ void _ftrace_caller(unsigned long parent_ip)
 	/* restore all state needed by the compiler epilogue */
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 static unsigned long gen_sethi_insn(unsigned long addr)
 {
 	unsigned long opcode = 0x46000000;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 0a1e75af5382..01581f715737 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -94,11 +94,6 @@ int ftrace_disable_ftrace_graph_caller(void)
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
 	return 0;
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 7f1e5203de88..4716f4cdc038 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -154,11 +154,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 
 	return ret;
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index 0a464d328467..3fd80397ff52 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -262,11 +262,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	return 0;
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 void arch_ftrace_update_code(int command)
 {
 	if (ftrace_shared_hotpatch_trampoline(NULL))
diff --git a/arch/sh/kernel/ftrace.c b/arch/sh/kernel/ftrace.c
index 295c43315bbe..930001bb8c6a 100644
--- a/arch/sh/kernel/ftrace.c
+++ b/arch/sh/kernel/ftrace.c
@@ -252,11 +252,6 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 
 	return ftrace_modify_code(rec->ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif /* CONFIG_DYNAMIC_FTRACE */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/sparc/kernel/ftrace.c b/arch/sparc/kernel/ftrace.c
index 684b84ce397f..eaead3da8e03 100644
--- a/arch/sparc/kernel/ftrace.c
+++ b/arch/sparc/kernel/ftrace.c
@@ -82,11 +82,6 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	new = ftrace_call_replace(ip, (unsigned long)func);
 	return ftrace_modify_code(ip, old, new);
 }
-
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 1b3ce3b4a2a2..23d221a9a3cd 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -252,11 +252,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-int __init ftrace_dyn_arch_init(void)
-{
-	return 0;
-}
-
 /* Currently only x86_64 supports dynamic trampolines */
 #ifdef CONFIG_X86_64
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7efbc8aaf7f6..4c090323198d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6846,6 +6846,11 @@ void __init ftrace_free_init_mem(void)
 	ftrace_free_mem(NULL, start, end);
 }
 
+int __init __weak ftrace_dyn_arch_init(void)
+{
+	return 0;
+}
+
 void __init ftrace_init(void)
 {
 	extern unsigned long __start_mcount_loc[];
-- 
2.30.2

