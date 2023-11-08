Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F47E6035
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:52:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Epprvhuy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQf2D6cm6z3vqW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:52:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Epprvhuy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQGf1qwtz3cHH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 00:02:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46C71614C9;
	Wed,  8 Nov 2023 13:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E8DC43397;
	Wed,  8 Nov 2023 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448535;
	bh=UvBPZEJ0GDnePlbmzB0O0cDDu9OzrTkPFQ7DKq1zNkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Epprvhuyn/gmt9yYVzPoCkJkX/4PqBjsFbfCBlqRIyfGB7iy3AzKDVy3tfX2i0XXF
	 Uy4x1CCfvni7goWMiP4v7HdeMb5yfs4ydCq+36VNit3V94qDapD8SvovUb+ohVp1et
	 UhdhipGmJ7EHGHSkOqI5i8Hak88gF8jqNrCtQpZTJOXqHPzDJ+iCDdgRGZpDIrVPaZ
	 ov5jBAtAW7R5L6RqLgkfu5E5wsqOLFuyPmlC3Db/LK9+M2lHinUmbjU0FtGhZLEoPM
	 ZbML4CXxxu+staTE/ur5oc+p4xlYSa/kEtSdVRB35t+3iMdtfN2kTDnPjbfH98gprI
	 ufK7ZluHODiPw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 13/22] arch: add do_page_fault prototypes
Date: Wed,  8 Nov 2023 13:58:34 +0100
Message-Id: <20231108125843.3806765-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>
 , linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org, Sudip Mukherjee <sudipm.mukherj
 ee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

arch/alpha/mm/fault.c:85:1: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
arch/csky/mm/fault.c:187:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
arch/mips/mm/fault.c:323:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
arch/nios2/mm/fault.c:43:17: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
arch/sh/mm/fault.c:389:27: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/include/asm/mmu_context.h | 2 ++
 arch/csky/include/asm/traps.h        | 2 ++
 arch/mips/include/asm/traps.h        | 3 +++
 arch/nios2/include/asm/traps.h       | 2 ++
 arch/sh/include/asm/traps_32.h       | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 4eea7c616992..29a3e3a1f02b 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -183,6 +183,8 @@ ev4_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 }
 
 extern void __load_new_mm_context(struct mm_struct *);
+asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
+			      long cause, struct pt_regs *regs);
 
 #ifdef CONFIG_SMP
 #define check_mmu_context()					\
diff --git a/arch/csky/include/asm/traps.h b/arch/csky/include/asm/traps.h
index 495ce318d569..6bbbbe43165f 100644
--- a/arch/csky/include/asm/traps.h
+++ b/arch/csky/include/asm/traps.h
@@ -55,4 +55,6 @@ asmlinkage void trap_c(struct pt_regs *regs);
 asmlinkage void do_notify_resume(struct pt_regs *regs,
 			unsigned long thread_info_flags);
 
+asmlinkage void do_page_fault(struct pt_regs *regs);
+
 #endif /* __ASM_CSKY_TRAPS_H */
diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 15cde638b407..d4d9f8a8fdea 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -39,4 +39,7 @@ extern char except_vec_nmi[];
 	register_nmi_notifier(&fn##_nb);				\
 })
 
+asmlinkage void do_page_fault(struct pt_regs *regs,
+	unsigned long write, unsigned long address);
+
 #endif /* _ASM_TRAPS_H */
diff --git a/arch/nios2/include/asm/traps.h b/arch/nios2/include/asm/traps.h
index 82a48473280d..afd77bef01c6 100644
--- a/arch/nios2/include/asm/traps.h
+++ b/arch/nios2/include/asm/traps.h
@@ -14,6 +14,8 @@
 
 #ifndef __ASSEMBLY__
 void _exception(int signo, struct pt_regs *regs, int code, unsigned long addr);
+void do_page_fault(struct pt_regs *regs, unsigned long cause,
+		   unsigned long address);
 #endif
 
 #endif /* _ASM_NIOS2_TRAPS_H */
diff --git a/arch/sh/include/asm/traps_32.h b/arch/sh/include/asm/traps_32.h
index 8c5bbb7b6053..8f14071bea72 100644
--- a/arch/sh/include/asm/traps_32.h
+++ b/arch/sh/include/asm/traps_32.h
@@ -43,6 +43,9 @@ static inline void trigger_address_error(void)
 asmlinkage void do_address_error(struct pt_regs *regs,
 				 unsigned long writeaccess,
 				 unsigned long address);
+asmlinkage void do_page_fault(struct pt_regs *regs,
+			      unsigned long error_code,
+			      unsigned long address);
 asmlinkage void do_divide_error(unsigned long r4);
 asmlinkage void do_reserved_inst(void);
 asmlinkage void do_illegal_slot_inst(void);
-- 
2.39.2

