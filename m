Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A70BF8D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:07:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fNFC0HFqzDqtm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="n9yc4BHE";
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fN096YKRzDqrj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 03:56:25 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a2so2240301pfo.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O3QCNK0Sa729dKyV+OU4JCI6A47TrPf1EYjHeURUF3c=;
 b=n9yc4BHEtaq9x6B5Caek1vzC7Kj3cBAKN1aFv5AxrtAqhGoXrV6YdYIMxu2rFMVkPg
 k9nvejXtTidhjDe1qOVaAEpDCmdnEEqenwqRMZy/FHknIybfHqsmUzoxgFcuVfJyQFxE
 0V7i3wSHnbtKbIRqxJtQ1JLFksmfgInqEY2MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O3QCNK0Sa729dKyV+OU4JCI6A47TrPf1EYjHeURUF3c=;
 b=ToKCNfeFfOmOY0k0n81aber6+SFFdwzpVbmxGKo0KOjJ3bYltMWe9c2G+gexj5r69r
 YiCFHuxFpyIXqlA6QH5b8wZCcCfYYCrVXDQ3mVdlBiO4TE1EU4twIJD5nbTl+t60Hu1J
 0oFmanA0S2iLxXse3cJhtakmSeddJ5cjFXS+bBrgCET8rPKwRsz15JrzObwelGJT0jnX
 oE5yEGlla73mbnGjg+YnZaWQlhjI8+0HDcWoJwSGjQxdz0vEU6VJoCCClcFbqm/aZ5Mm
 4iCdm63xNyj6K7k+ASAkJzpeffpOfmgZAFgabafobZo7lMB9tN8FZgAe58KO+JTvIbl1
 mzUw==
X-Gm-Message-State: APjAAAWHC5UqpEOtKJGyWDExRN0Ff+4VHlpNjr1b/FfCfSynfI6dmFwP
 62HUs/l/naDmYiCGtdEjv7rZXw==
X-Google-Smtp-Source: APXvYqxmYPXz4BvV1iqJiFFDAZheIjk4wIrN+AAlsUUcP9FgR6X3pebswh+pd9KfAuIc5VZHSe/Cvw==
X-Received: by 2002:aa7:8c19:: with SMTP id c25mr4982222pfd.150.1569520583539; 
 Thu, 26 Sep 2019 10:56:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z29sm4938159pff.23.2019.09.26.10.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 10:56:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 10/29] vmlinux.lds.h: Move NOTES into RO_DATA
Date: Thu, 26 Sep 2019 10:55:43 -0700
Message-Id: <20190926175602.33098-11-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190926175602.33098-1-keescook@chromium.org>
References: <20190926175602.33098-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 linux-parisc@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .notes section should be non-executable read-only data. As such, it
can live in the RO_DATA macro instead of being per-architecture defined.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/alpha/kernel/vmlinux.lds.S      | 2 --
 arch/arc/kernel/vmlinux.lds.S        | 2 --
 arch/arm/kernel/vmlinux-xip.lds.S    | 2 --
 arch/arm/kernel/vmlinux.lds.S        | 2 --
 arch/arm64/kernel/vmlinux.lds.S      | 1 -
 arch/c6x/kernel/vmlinux.lds.S        | 1 -
 arch/csky/kernel/vmlinux.lds.S       | 1 -
 arch/h8300/kernel/vmlinux.lds.S      | 1 -
 arch/hexagon/kernel/vmlinux.lds.S    | 1 -
 arch/ia64/kernel/vmlinux.lds.S       | 2 --
 arch/microblaze/kernel/vmlinux.lds.S | 1 -
 arch/mips/kernel/vmlinux.lds.S       | 2 --
 arch/nds32/kernel/vmlinux.lds.S      | 1 -
 arch/nios2/kernel/vmlinux.lds.S      | 1 -
 arch/openrisc/kernel/vmlinux.lds.S   | 1 -
 arch/parisc/kernel/vmlinux.lds.S     | 1 -
 arch/powerpc/kernel/vmlinux.lds.S    | 2 --
 arch/riscv/kernel/vmlinux.lds.S      | 1 -
 arch/s390/kernel/vmlinux.lds.S       | 2 --
 arch/sh/kernel/vmlinux.lds.S         | 1 -
 arch/sparc/kernel/vmlinux.lds.S      | 1 -
 arch/um/include/asm/common.lds.S     | 1 -
 arch/unicore32/kernel/vmlinux.lds.S  | 1 -
 arch/x86/kernel/vmlinux.lds.S        | 2 --
 arch/xtensa/kernel/vmlinux.lds.S     | 1 -
 include/asm-generic/vmlinux.lds.h    | 9 +++++----
 26 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index cdfdc91ce64c..bf28043485f6 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -34,8 +34,6 @@ SECTIONS
 	swapper_pg_dir = SWAPPER_PGD;
 	_etext = .;	/* End of text section */
 
-	NOTES
-
 	RODATA
 	EXCEPTION_TABLE(16)
 
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 6c693a9d29b6..1d6eef4b6976 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -118,8 +118,6 @@ SECTIONS
 	/DISCARD/ : {	*(.eh_frame) }
 #endif
 
-	NOTES
-
 	. = ALIGN(PAGE_SIZE);
 	_end = . ;
 
diff --git a/arch/arm/kernel/vmlinux-xip.lds.S b/arch/arm/kernel/vmlinux-xip.lds.S
index 8c74037ade22..d2a9651c24ad 100644
--- a/arch/arm/kernel/vmlinux-xip.lds.S
+++ b/arch/arm/kernel/vmlinux-xip.lds.S
@@ -70,8 +70,6 @@ SECTIONS
 	ARM_UNWIND_SECTIONS
 #endif
 
-	NOTES
-
 	_etext = .;			/* End of text and rodata section */
 
 	ARM_VECTORS
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index 23150c0f0f4d..068db6860867 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -81,8 +81,6 @@ SECTIONS
 	ARM_UNWIND_SECTIONS
 #endif
 
-	NOTES
-
 #ifdef CONFIG_STRICT_KERNEL_RWX
 	. = ALIGN(1<<SECTION_SHIFT);
 #else
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 7fa008374907..5cf9424485d5 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -137,7 +137,6 @@ SECTIONS
 
 	RO_DATA(PAGE_SIZE)		/* everything from this point to     */
 	EXCEPTION_TABLE(8)		/* __init_begin will be marked RO NX */
-	NOTES
 
 	. = ALIGN(PAGE_SIZE);
 	idmap_pg_dir = .;
diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index 584bab2bace6..d6e3802536b3 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -81,7 +81,6 @@ SECTIONS
 	}
 
 	EXCEPTION_TABLE(16)
-	NOTES
 
 	RO_DATA_SECTION(PAGE_SIZE)
 	.const :
diff --git a/arch/csky/kernel/vmlinux.lds.S b/arch/csky/kernel/vmlinux.lds.S
index ae7961b973f2..75dd31412242 100644
--- a/arch/csky/kernel/vmlinux.lds.S
+++ b/arch/csky/kernel/vmlinux.lds.S
@@ -53,7 +53,6 @@ SECTIONS
 	RW_DATA_SECTION(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	_edata = .;
 
-	NOTES
 	EXCEPTION_TABLE(L1_CACHE_BYTES)
 	BSS_SECTION(L1_CACHE_BYTES, PAGE_SIZE, L1_CACHE_BYTES)
 	VBR_BASE
diff --git a/arch/h8300/kernel/vmlinux.lds.S b/arch/h8300/kernel/vmlinux.lds.S
index 49f716c0a1df..88776e785245 100644
--- a/arch/h8300/kernel/vmlinux.lds.S
+++ b/arch/h8300/kernel/vmlinux.lds.S
@@ -38,7 +38,6 @@ SECTIONS
 	_etext = . ;
 	}
 	EXCEPTION_TABLE(16)
-	NOTES
 	RO_DATA_SECTION(4)
 	ROMEND = .;
 #if defined(CONFIG_ROMKERNEL)
diff --git a/arch/hexagon/kernel/vmlinux.lds.S b/arch/hexagon/kernel/vmlinux.lds.S
index 78f2418e97c8..6a6e8fc422ee 100644
--- a/arch/hexagon/kernel/vmlinux.lds.S
+++ b/arch/hexagon/kernel/vmlinux.lds.S
@@ -54,7 +54,6 @@ SECTIONS
 	_edata = .;
 
 	EXCEPTION_TABLE(16)
-	NOTES
 
 	BSS_SECTION(_PAGE_SIZE, _PAGE_SIZE, _PAGE_SIZE)
 
diff --git a/arch/ia64/kernel/vmlinux.lds.S b/arch/ia64/kernel/vmlinux.lds.S
index fdcc992ab360..ad3578924589 100644
--- a/arch/ia64/kernel/vmlinux.lds.S
+++ b/arch/ia64/kernel/vmlinux.lds.S
@@ -70,8 +70,6 @@ SECTIONS {
 	/*
 	 * Read-only data
 	 */
-	NOTES
-
 	EXCEPTION_TABLE(16)
 
 	/* MCA table */
diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
index e1f3e8741292..d008e50bb212 100644
--- a/arch/microblaze/kernel/vmlinux.lds.S
+++ b/arch/microblaze/kernel/vmlinux.lds.S
@@ -53,7 +53,6 @@ SECTIONS {
 	. = ALIGN(16);
 	RODATA
 	EXCEPTION_TABLE(16)
-	NOTES
 
 	/*
 	 * sdata2 section can go anywhere, but must be word aligned
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 6a22f531d815..91e566defc16 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -81,8 +81,6 @@ SECTIONS
 		__stop___dbe_table = .;
 	}
 
-	NOTES
-
 	_sdata = .;			/* Start of data section */
 	RODATA
 
diff --git a/arch/nds32/kernel/vmlinux.lds.S b/arch/nds32/kernel/vmlinux.lds.S
index 9e90f30a181d..c4f1c5a604c3 100644
--- a/arch/nds32/kernel/vmlinux.lds.S
+++ b/arch/nds32/kernel/vmlinux.lds.S
@@ -58,7 +58,6 @@ SECTIONS
 	_edata  =  .;
 
 	EXCEPTION_TABLE(16)
-	NOTES
 	BSS_SECTION(4, 4, 4)
 	_end = .;
 
diff --git a/arch/nios2/kernel/vmlinux.lds.S b/arch/nios2/kernel/vmlinux.lds.S
index 6ad64f14617d..20e4078b3477 100644
--- a/arch/nios2/kernel/vmlinux.lds.S
+++ b/arch/nios2/kernel/vmlinux.lds.S
@@ -58,7 +58,6 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
-	NOTES
 
 	DISCARDS
 }
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index 2e2c72c157f3..142c51c994f5 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -79,7 +79,6 @@ SECTIONS
         _edata  =  .;
 
 	EXCEPTION_TABLE(4)
-	NOTES
 
 	/* Init code and data */
 	. = ALIGN(PAGE_SIZE);
diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 99cd24f2ea01..168d12b2ebb8 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -131,7 +131,6 @@ SECTIONS
 
 	/* RO because of BUILDTIME_EXTABLE_SORT */
 	EXCEPTION_TABLE(8)
-	NOTES
 
 	/* unwind info */
 	.PARISC.unwind : {
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 4f19d814d592..4e7cec088c8b 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -164,8 +164,6 @@ SECTIONS
 #endif
 	EXCEPTION_TABLE(0)
 
-	NOTES
-
 /*
  * Init sections discarded at runtime
  */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 23cd1a9e52a1..df5229c4034d 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -69,7 +69,6 @@ SECTIONS
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
 	EXCEPTION_TABLE(0x10)
-	NOTES
 
 	.rel.dyn : {
 		*(.rel.dyn*)
diff --git a/arch/s390/kernel/vmlinux.lds.S b/arch/s390/kernel/vmlinux.lds.S
index f88eedeb915a..beb4df053e20 100644
--- a/arch/s390/kernel/vmlinux.lds.S
+++ b/arch/s390/kernel/vmlinux.lds.S
@@ -52,8 +52,6 @@ SECTIONS
 		_etext = .;		/* End of text section */
 	} :text = 0x0700
 
-	NOTES
-
 	RO_DATA_SECTION(PAGE_SIZE)
 
 	. = ALIGN(PAGE_SIZE);
diff --git a/arch/sh/kernel/vmlinux.lds.S b/arch/sh/kernel/vmlinux.lds.S
index 77a59d8c6b4d..fef39054cc70 100644
--- a/arch/sh/kernel/vmlinux.lds.S
+++ b/arch/sh/kernel/vmlinux.lds.S
@@ -48,7 +48,6 @@ SECTIONS
 	} = 0x0009
 
 	EXCEPTION_TABLE(16)
-	NOTES
 
 	_sdata = .;
 	RO_DATA(PAGE_SIZE)
diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.lds.S
index 61afd787bd0c..8929fbc35a80 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -78,7 +78,6 @@ SECTIONS
 		__stop___fixup = .;
 	}
 	EXCEPTION_TABLE(16)
-	NOTES
 
 	. = ALIGN(PAGE_SIZE);
 	__init_begin = ALIGN(PAGE_SIZE);
diff --git a/arch/um/include/asm/common.lds.S b/arch/um/include/asm/common.lds.S
index 4049f2c46387..a24b284f5135 100644
--- a/arch/um/include/asm/common.lds.S
+++ b/arch/um/include/asm/common.lds.S
@@ -16,7 +16,6 @@
   PROVIDE (_unprotected_end = .);
 
   . = ALIGN(4096);
-  NOTES
   EXCEPTION_TABLE(0)
 
   BUG_TABLE
diff --git a/arch/unicore32/kernel/vmlinux.lds.S b/arch/unicore32/kernel/vmlinux.lds.S
index 7abf90537cd5..78c4c56057b0 100644
--- a/arch/unicore32/kernel/vmlinux.lds.S
+++ b/arch/unicore32/kernel/vmlinux.lds.S
@@ -48,7 +48,6 @@ SECTIONS
 	_edata = .;
 
 	EXCEPTION_TABLE(L1_CACHE_BYTES)
-	NOTES
 
 	BSS_SECTION(0, 0, 0)
 	_end = .;
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 8be25b09c2b7..41362e90142d 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -148,8 +148,6 @@ SECTIONS
 		_etext = .;
 	} :text = 0x9090
 
-	NOTES
-
 	EXCEPTION_TABLE(16)
 
 	/* .text should occupy whole number of pages */
diff --git a/arch/xtensa/kernel/vmlinux.lds.S b/arch/xtensa/kernel/vmlinux.lds.S
index 943f10639a93..a0a843745695 100644
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@ -131,7 +131,6 @@ SECTIONS
   .fixup   : { *(.fixup) }
 
   EXCEPTION_TABLE(16)
-  NOTES
   /* Data section */
 
   _sdata = .;
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 6a0a657dfdb4..3a4c1cb971da 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -28,7 +28,6 @@
  *	_edata = .;
  *
  *	EXCEPTION_TABLE(...)
- *	NOTES
  *
  *	BSS_SECTION(0, 0, 0)
  *	_end = .;
@@ -507,10 +506,12 @@
 		__start___modver = .;					\
 		KEEP(*(__modver))					\
 		__stop___modver = .;					\
-		. = ALIGN((align));					\
-		__end_rodata = .;					\
 	}								\
-	. = ALIGN((align));
+									\
+	NOTES								\
+									\
+	. = ALIGN((align));						\
+	__end_rodata = .;
 
 /* RODATA & RO_DATA provided for backward compatibility.
  * All archs are supposed to use RO_DATA() */
-- 
2.17.1

