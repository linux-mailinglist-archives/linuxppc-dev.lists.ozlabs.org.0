Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CC73333F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 04:48:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwJ320lWZz3ckC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 14:48:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ue1Des28;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ue1Des28; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwJ2Z5kLGz3cKC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 14:48:21 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id e2so2538562pld.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 19:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SMtw5+QnSaw2Y6qNpZi4X1C2CMeJ4xcKvB7ckTI5jHA=;
 b=ue1Des28Ms9L/OJX/4dKF+Xxv/EnBOkFzmmbBAdY0CKQdjgZPLNOymszIeRbmKXeN/
 KFJb1IIOmomIaPrUTs/2dC9dpD+dI56HTGaqAND3EMcqqYf4HKF2Dpbadgjh7IKxZycC
 FLtiLJLgUdI8LOY4V5Fge6pOIEL/HdCgSCACh/5v4dK5mRl6Oab+xBGdPch9JI2QPte4
 EzjgMgqUUIrE8vmscoBSTJwZFNGrEDwN521UTykPbNr/AyLksu1e8KM5n8Q0vlGSPgiv
 Sy79b7Wfc8gLAWMhG0VAczYFEMgge0wsM9dRQC30hMVNCfVtYiRlJwOlr/zw8NMdIXCe
 8eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SMtw5+QnSaw2Y6qNpZi4X1C2CMeJ4xcKvB7ckTI5jHA=;
 b=aRxmTt+EWd9HkyB5nmG1yq4Y92Q6si6P5y5gbMbOEsik9VtfXvwg79cMYb+ND4YGnt
 354fgo4ZRYImoXZ007jghQHLYmC2rZBJUBMifuocQoH4jiKShhOMCRLVB9D33gjxUsTw
 W6wNDS5YYfFfXVuLOL6R1cz1Tj40sxG61p7ep0Ps1jxTorR6JEuwhpkN+9Wym4t4FWyR
 LMXyzT+1j3ehinIWxEpH2Wbs4Mw1oC5M5rZmbECnMOMYWsg8dE9Te4s+S6wGs2LQttaY
 7Qc+xeClC9vQxz2JFDoV41FeWtKmidYi5PMkl6+/FA7qy6PtAkDfBS8zHdBAXQQ6aTde
 WW+A==
X-Gm-Message-State: AOAM531UWI0YuefwE3umnmoUNb5/qqVm7TnU/9MU8hCkZ78AFVtHMtkx
 JF+KB5wvWoC39TMhhhVHhaoEAYC00Gb3Xg==
X-Google-Smtp-Source: ABdhPJywv9zQZPlacfQHzeRfWKf2CIS/BGK0laW+ohJlnbhgTX+0kJcwLMfG+hEuSiY50BFiMHQiDg==
X-Received: by 2002:a17:90a:ec15:: with SMTP id
 l21mr1328340pjy.164.1615348098340; 
 Tue, 09 Mar 2021 19:48:18 -0800 (PST)
Received: from bubble.grove.modra.org
 ([2406:3400:51d:8cc0:782f:891e:65a1:90c6])
 by smtp.gmail.com with ESMTPSA id p5sm12732908pfq.56.2021.03.09.19.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:48:17 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id CFA5641A8C; Wed, 10 Mar 2021 14:18:13 +1030 (ACDT)
Date: Wed, 10 Mar 2021 14:18:13 +1030
From: Alan Modra <amodra@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
Message-ID: <20210310034813.GM6042@bubble.grove.modra.org>
References: <20210309045638.GI6042@bubble.grove.modra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309045638.GI6042@bubble.grove.modra.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alexey@au1.ibm.com, ellerman@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch future-proofs the kernel against linker changes that might
put the toc pointer at some location other than .got+0x8000, by
replacing __toc_start+0x8000 with .TOC. throughout.  If the kernel's
idea of the toc pointer doesn't agree with the linker, bad things
happen.

prom_init.c code relocating its toc is also changed so that a symbolic
__prom_init_toc_start toc-pointer relative address is calculated
rather than assuming that it is always at toc-pointer - 0x8000.  The
length calculations loading values from the toc are also avoided.
It's a little incestuous to do that with unreloc_toc picking up
adjusted values (which is fine in practice, they both adjust by the
same amount if all goes well).

I've also changed the way .got is aligned in vmlinux.lds and
zImage.lds, mostly so that dumping out section info by objdump or
readelf plainly shows the alignment is 256.  This linker script
feature was added 2005-09-27, available in FSF binutils releases from
2.17 onwards.  Should be safe to use in the kernel, I think.

Finally, put *(.got) before the prom_init.o entry which only needs
*(.toc), so that the GOT header goes in the correct place.  I don't
believe this makes any difference for the kernel as it would for
dynamic objects being loaded by ld.so.  That change is just to stop
lusers who blindly copy kernel scripts being led astray.  Of course,
this change needs the prom_init.c changes.

Some notes on .toc and .got.

.toc is a compiler generated section of addresses.  .got is a linker
generated section of addresses, generally built when the linker sees
R_*_*GOT* relocations.  In the case of powerpc64 ld.bfd, there are
multiple generated .got sections, one per input object file.  So you
can somewhat reasonably write in a linker script an input section
statement like *prom_init.o(.got .toc) to mean "the .got and .toc
section for files matching *prom_init.o".  On other architectures that
doesn't make sense, because the linker generally has just one .got
section.  Even on powerpc64, note well that the GOT entries for
prom_init.o may be merged with GOT entries from other objects.  That
means that if prom_init.o references, say, _end via some GOT
relocation, and some other object also references _end via a GOT
relocation, the GOT entry for _end may be in the range
__prom_init_toc_start to __prom_init_toc_end and if the kernel does
something special to GOT/TOC entries in that range then the value of
_end as seen by objects other than prom_init.o will be affected.  On
the other hand the GOT entry for _end may not be in the range
__prom_init_toc_start to __prom_init_toc_end.  Which way it turns out
is deterministic but a detail of linker operation that should not be
relied on.

A feature of ld.bfd is that input .toc (and .got) sections matching
one linker input section statement may be sorted, to put entries used
by small-model code first, near the toc base.  This is why scripts for
powerpc64 normally use *(.got .toc) rather than *(.got) *(.toc), since
the first form allows more freedom to sort.

Another feature of ld.bfd is that indirect addressing sequences using
the GOT/TOC may be edited by the linker to relative addressing.  In
many cases relative addressing would be emitted by gcc for
-mcmodel=medium if you appropriately decorate variable declarations
with non-default visibility.

Signed-off-by: Alan Modra <amodra@au1.ibm.com>

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 1d83966f5ef6..e45907fe468f 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -28,7 +28,7 @@ p_etext:	.8byte	_etext
 p_bss_start:	.8byte	__bss_start
 p_end:		.8byte	_end
 
-p_toc:		.8byte	__toc_start + 0x8000 - p_base
+p_toc:		.8byte	.TOC. - p_base
 p_dyn:		.8byte	__dynamic_start - p_base
 p_rela:		.8byte	__rela_dyn_start - p_base
 p_prom:		.8byte	0
diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index d6f072865627..d65cd55a6f38 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -36,12 +36,9 @@ SECTIONS
   }
 
 #ifdef CONFIG_PPC64_BOOT_WRAPPER
-  . = ALIGN(256);
-  .got :
+  .got : ALIGN(256)
   {
-    __toc_start = .;
-    *(.got)
-    *(.toc)
+    *(.got .toc)
   }
 #endif
 
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 324d7b298ec3..e5a1eae11ed5 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -48,14 +48,18 @@ static inline int in_kernel_text(unsigned long addr)
 
 static inline unsigned long kernel_toc_addr(void)
 {
-	/* Defined by the linker, see vmlinux.lds.S */
-	extern unsigned long __toc_start;
-
-	/*
-	 * The TOC register (r2) points 32kB into the TOC, so that 64kB of
-	 * the TOC can be addressed using a single machine instruction.
-	 */
-	return (unsigned long)(&__toc_start) + 0x8000UL;
+#if 0
+	/* This version is appropriate if the kernel is never compiled
+	   -mcmodel=small or the total .toc is always less than 64k.  */
+	register unsigned long toc_ptr asm ("r2");
+	return toc_ptr;
+#else
+	/* Otherwise linker automatic multiple toc sections might be
+	   required, and in that case r2 may be adjusted by a linker
+	   stub.  */
+	extern unsigned long __attribute__((visibility("hidden"))) toc asm (".TOC.");
+	return (unsigned long)&toc;
+#endif
 }
 
 static inline int overlaps_interrupt_vector_text(unsigned long start,
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..9542d03b2efe 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -899,7 +899,7 @@ _GLOBAL(relative_toc)
 	blr
 
 .balign 8
-p_toc:	.8byte	__toc_start + 0x8000 - 0b
+p_toc:	.8byte	.TOC. - 0b
 
 /*
  * This is where the main kernel code starts.
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index ccf77b985c8f..d309a7787652 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -3220,27 +3220,26 @@ static void unreloc_toc(void)
 {
 }
 #else
-static void __reloc_toc(unsigned long offset, unsigned long nr_entries)
+static void __reloc_toc(unsigned long offset)
 {
-	unsigned long i;
 	unsigned long *toc_entry;
+	unsigned long *toc_start, *toc_end;
 
-	/* Get the start of the TOC by using r2 directly. */
-	asm volatile("addi %0,2,-0x8000" : "=b" (toc_entry));
+	asm("addis %0,2,__prom_init_toc_start@toc@ha\n\t"
+	    "addi %0,%0,__prom_init_toc_start@toc@l" : "=b" (toc_start));
+	asm("addis %0,2,__prom_init_toc_end@toc@ha\n\t"
+	    "addi %0,%0,__prom_init_toc_end@toc@l" : "=b" (toc_end));
 
-	for (i = 0; i < nr_entries; i++) {
-		*toc_entry = *toc_entry + offset;
-		toc_entry++;
+	for (toc_entry = toc_start; toc_entry != toc_end; toc_entry++) {
+		*toc_entry += offset;
 	}
 }
 
 static void reloc_toc(void)
 {
 	unsigned long offset = reloc_offset();
-	unsigned long nr_entries =
-		(__prom_init_toc_end - __prom_init_toc_start) / sizeof(long);
 
-	__reloc_toc(offset, nr_entries);
+	__reloc_toc(offset);
 
 	mb();
 }
@@ -3248,12 +3247,10 @@ static void reloc_toc(void)
 static void unreloc_toc(void)
 {
 	unsigned long offset = reloc_offset();
-	unsigned long nr_entries =
-		(__prom_init_toc_end - __prom_init_toc_start) / sizeof(long);
 
 	mb();
 
-	__reloc_toc(-offset, nr_entries);
+	__reloc_toc(-offset);
 }
 #endif
 #endif
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 72fa3c00229a..3d2e6e2b81b5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -326,15 +326,13 @@ SECTIONS
 		__end_opd = .;
 	}
 
-	. = ALIGN(256);
-	.got : AT(ADDR(.got) - LOAD_OFFSET) {
-		__toc_start = .;
+	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+		*(.got)
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
-		arch/powerpc/kernel/prom_init.o*(.toc .got)
+		arch/powerpc/kernel/prom_init.o*(.toc)
 		__prom_init_toc_end = .;
 #endif
-		*(.got)
 		*(.toc)
 	}
 #endif

-- 
Alan Modra
Australia Development Lab, IBM
