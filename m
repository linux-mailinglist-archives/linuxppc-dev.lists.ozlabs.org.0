Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A12EEF9E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 10:47:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476lF21Lz4zF4VX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 20:47:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tip-bot2@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476kq42m84zDrdV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 20:27:54 +1100 (AEDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tip-bot2@linutronix.de>)
 id 1iRv7k-0007X3-0X; Tue, 05 Nov 2019 10:27:40 +0100
Received: from [127.0.1.1] (localhost [IPv6:::1])
 by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 7C9FC1C0426;
 Tue,  5 Nov 2019 10:27:32 +0100 (CET)
Date: Tue, 05 Nov 2019 09:27:32 -0000
From: "tip-bot2 for Kees Cook" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/build] vmlinux.lds.h: Replace RO_DATA_SECTION with RO_DATA
In-Reply-To: <20191029211351.13243-13-keescook@chromium.org>
References: <20191029211351.13243-13-keescook@chromium.org>
MIME-Version: 1.0
Message-ID: <157294605224.29376.12345489124896449797.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86-ml <x86@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following commit has been merged into the x86/build branch of tip:

Commit-ID:     93240b327929ff03c1878ea8badc5c6bd86f053f
Gitweb:        https://git.kernel.org/tip/93240b327929ff03c1878ea8badc5c6bd86f053f
Author:        Kees Cook <keescook@chromium.org>
AuthorDate:    Tue, 29 Oct 2019 14:13:34 -07:00
Committer:     Borislav Petkov <bp@suse.de>
CommitterDate: Mon, 04 Nov 2019 15:56:16 +01:00

vmlinux.lds.h: Replace RO_DATA_SECTION with RO_DATA

Finish renaming RO_DATA_SECTION to RO_DATA. (Calling this a "section"
is a lie, since it's multiple sections and section flags cannot be
applied to the macro.)

Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com> # s390
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Will Deacon <will@kernel.org>
Cc: x86-ml <x86@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Link: https://lkml.kernel.org/r/20191029211351.13243-13-keescook@chromium.org
---
 arch/arc/kernel/vmlinux.lds.S       | 2 +-
 arch/c6x/kernel/vmlinux.lds.S       | 2 +-
 arch/csky/kernel/vmlinux.lds.S      | 2 +-
 arch/h8300/kernel/vmlinux.lds.S     | 2 +-
 arch/hexagon/kernel/vmlinux.lds.S   | 2 +-
 arch/m68k/kernel/vmlinux-nommu.lds  | 2 +-
 arch/nds32/kernel/vmlinux.lds.S     | 2 +-
 arch/nios2/kernel/vmlinux.lds.S     | 2 +-
 arch/openrisc/kernel/vmlinux.lds.S  | 4 ++--
 arch/parisc/kernel/vmlinux.lds.S    | 4 ++--
 arch/riscv/kernel/vmlinux.lds.S     | 2 +-
 arch/s390/kernel/vmlinux.lds.S      | 2 +-
 arch/unicore32/kernel/vmlinux.lds.S | 2 +-
 include/asm-generic/vmlinux.lds.h   | 7 ++-----
 14 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 1d6eef4..7d1d270 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -95,7 +95,7 @@ SECTIONS
 	_etext = .;
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 
 	/*
 	 * 1. this is .data essentially
diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index d6e3802..a3547f9 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -82,7 +82,7 @@ SECTIONS
 
 	EXCEPTION_TABLE(16)
 
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	.const :
 	{
 		*(.const .const.* .gnu.linkonce.r.*)
diff --git a/arch/csky/kernel/vmlinux.lds.S b/arch/csky/kernel/vmlinux.lds.S
index 75dd314..8598bd7 100644
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -49,7 +49,7 @@ SECTIONS
 
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 88776e7..d3247d3 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -38,7 +38,7 @@ SECTIONS
 	_etext = . ;
 	}
 	EXCEPTION_TABLE(16)
-	RO_DATA_SECTION(4)
+	RO_DATA(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
 	. = RAMTOP;
diff --git a/arch/hexagon/kernel/vmlinux.lds.S b/arch/hexagon/kernel/vmlinux.lds.S
index 6a6e8fc..0145251 100644
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -50,7 +50,7 @@ SECTIONS
 
 	_sdata = .;
 		RW_DATA_SECTION(32,PAGE_SIZE,_THREAD_SIZE)
-		RO_DATA_SECTION(PAGE_SIZE)
+		RO_DATA(PAGE_SIZE)
 	_edata = .;
 
 	EXCEPTION_TABLE(16)
diff --git a/arch/m68k/kernel/vmlinux-nommu.lds b/arch/m68k/kernel/vmlinux-nommu.lds
index cf6edda..de80f8b 100644
--- a/arch/m68k/kernel/vmlinux-nommu.lds
+++ b/arch/m68k/kernel/vmlinux-nommu.lds
@@ -60,7 +60,7 @@ SECTIONS {
 #endif
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	RW_DATA_SECTION(16, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
diff --git a/arch/nds32/kernel/vmlinux.lds.S b/arch/nds32/kernel/vmlinux.lds.S
index c4f1c5a..10ff570 100644
--- a/arch/nds32/kernel/vmlinux.lds.S
+++ b/arch/nds32/kernel/vmlinux.lds.S
@@ -53,7 +53,7 @@ SECTIONS
 	_etext = .;			/* End of text and rodata section */
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata  =  .;
 
diff --git a/arch/nios2/kernel/vmlinux.lds.S b/arch/nios2/kernel/vmlinux.lds.S
index 20e4078..318804a 100644
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -49,7 +49,7 @@ SECTIONS
 	__init_end = .;
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index 142c51c..f73e0d3 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -67,8 +67,8 @@ SECTIONS
 
 	_sdata = .;
 
-	/* Page alignment required for RO_DATA_SECTION */
-	RO_DATA_SECTION(PAGE_SIZE)
+	/* Page alignment required for RO_DATA */
+	RO_DATA(PAGE_SIZE)
 	_e_kernel_ro = .;
 
 	/* Whatever comes after _e_kernel_ro had better be page-aligend, too */
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 168d12b..e1c563c 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -109,7 +109,7 @@ SECTIONS
 	_sdata = .;
 
 	/* Architecturally we need to keep __gp below 0x1000000 and thus
-	 * in front of RO_DATA_SECTION() which stores lots of tracepoint
+	 * in front of RO_DATA() which stores lots of tracepoint
 	 * and ftrace symbols. */
 #ifdef CONFIG_64BIT
 	. = ALIGN(16);
@@ -127,7 +127,7 @@ SECTIONS
 	}
 #endif
 
-	RO_DATA_SECTION(8)
+	RO_DATA(8)
 
 	/* RO because of BUILDTIME_EXTABLE_SORT */
 	EXCEPTION_TABLE(8)
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index df5229c..66dc17d 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -52,7 +52,7 @@ SECTIONS
 
 	/* Start of data section */
 	_sdata = .;
-	RO_DATA_SECTION(L1_CACHE_BYTES)
+	RO_DATA(L1_CACHE_BYTES)
 	.srodata : {
 		*(.srodata*)
 	}
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index beb4df0..b33c482 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,7 +52,7 @@ SECTIONS
 		_etext = .;		/* End of text section */
 	} :text = 0x0700
 
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 
 	. = ALIGN(PAGE_SIZE);
 	_sdata = .;		/* Start of data section */
diff --git a/arch/unicore32/kernel/vmlinux.lds.S b/arch/unicore32/kernel/vmlinux.lds.S
index 78c4c56..367c803 100644
--- a/arch/unicore32/kernel/vmlinux.lds.S
+++ b/arch/unicore32/kernel/vmlinux.lds.S
@@ -43,7 +43,7 @@ SECTIONS
 	_etext = .;
 
 	_sdata = .;
-	RO_DATA_SECTION(PAGE_SIZE)
+	RO_DATA(PAGE_SIZE)
 	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index a0a989f..061e57c 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -23,7 +23,7 @@
  *	_etext = .;
  *
  *      _sdata = .;
- *	RO_DATA_SECTION(PAGE_SIZE)
+ *	RO_DATA(PAGE_SIZE)
  *	RW_DATA_SECTION(...)
  *	_edata = .;
  *
@@ -363,7 +363,7 @@
 /*
  * Read only Data
  */
-#define RO_DATA_SECTION(align)						\
+#define RO_DATA(align)							\
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
 		__start_rodata = .;					\
@@ -518,9 +518,6 @@
 	. = ALIGN((align));						\
 	__end_rodata = .;
 
-/* All archs are supposed to use RO_DATA() */
-#define RO_DATA(align)  RO_DATA_SECTION(align)
-
 /*
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
