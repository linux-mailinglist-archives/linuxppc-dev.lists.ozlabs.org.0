Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA67331E1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 05:57:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvjcR2r4wz3cHq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 15:57:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FHdIrsEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FHdIrsEn; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvjc04h4bz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 15:56:45 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id e26so20004pfd.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 20:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=7OQZIyg3GZfEAV8orvOTLc3ScGpxwzNj403HfKXmGLU=;
 b=FHdIrsEnl4B5srE6ubePG3DckDWoTAAUDneZpoX40Vbjxer+I9MeWJNXskktiEmihI
 kF731i3bAOOZP25/8euDWe19aFoERiXuFkm+A1B3LiHNqvaZVhB/7tO2jABwx2hdoEsM
 qNKwjoaQ3dchldOzmRXW206msn+0e7dTLngSkuK0y+2YIUPqOwuzPQdNjxNXWyRbTgAz
 JOQAk7IPeY9sxmZYI71USL64yN2taA29gl+nu50p8wkMzM6hC049CVA2tbQ4Q0A0VjoL
 3p61kxApW3NAnbu0sYWJdPgSZaysBWAiXiRoUpfYiVdVa1DMDxUBdL5Th1/JYmG1q+hA
 qZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=7OQZIyg3GZfEAV8orvOTLc3ScGpxwzNj403HfKXmGLU=;
 b=HV5R3d2rG07AiwMMQK1sWYI/O51LHIg4v9qgsU6ct0r59rfBD4h4/yqdiu1J5h971e
 kIRH8GQr4c9DEhgKmdZksuDhCNKKjMdzB1BFpB1GigvVhwjDF5pbhEJXQNjcVFH9/xXg
 tWkPgtPfZpmJlqLEIlRRqYfTpg7ULMGC+Hvrsv1vLQpAYs4CYt7484Op3YqxjJPyLP/S
 UshHaKvBkvWFG3axqnvWvULa04Sh+LNvRXXeQwjTj6GGHrl1Pi8NV67t3jJS2WF9Boby
 h8X6NKxKJlIz9JyaDlEsulOw/px//HG4noLkRQGLhMMaJVQLuRyTA4ydBBBiqWatfQla
 hPlg==
X-Gm-Message-State: AOAM530NPdl6yWjwh6gU0Byn3Kz7P0jcisEpYPiyHWppwQZ3k34sS3yz
 kunprUtjSLypNFszBK9MbFeYTJYcHar/Ww==
X-Google-Smtp-Source: ABdhPJxJSOSUN3pPFsmvtFcJdBGCCm7X6HybbUJrWqdF90aAdtW8tQs+K1FPU2Dxo880hg3d6IHloQ==
X-Received: by 2002:a63:5d4c:: with SMTP id o12mr23906349pgm.398.1615265803124; 
 Mon, 08 Mar 2021 20:56:43 -0800 (PST)
Received: from bubble.grove.modra.org (158.106.96.58.static.exetel.com.au.
 [58.96.106.158])
 by smtp.gmail.com with ESMTPSA id j3sm10987883pgk.24.2021.03.08.20.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 20:56:42 -0800 (PST)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id 9737541AAA; Tue,  9 Mar 2021 15:26:38 +1030 (ACDT)
Date: Tue, 9 Mar 2021 15:26:38 +1030
From: Alan Modra <amodra@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: PowerPC64 future proof kernel toc, revised
Message-ID: <20210309045638.GI6042@bubble.grove.modra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
replacing __toc_start+0x8000 with __toc_ptr throughout.  __toc_ptr
is set from the symbol .TOC. emitted by ld on a final link, falling
back to .got+0x8000 for older ld that doesn't provide .TOC.  If the
kernel's idea of the toc pointer doesn't agree with the linker, bad
things happen.

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


diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 1d83966f5ef6..8397af058650 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -28,7 +28,7 @@ p_etext:	.8byte	_etext
 p_bss_start:	.8byte	__bss_start
 p_end:		.8byte	_end
 
-p_toc:		.8byte	__toc_start + 0x8000 - p_base
+p_toc:		.8byte	__toc_ptr - p_base
 p_dyn:		.8byte	__dynamic_start - p_base
 p_rela:		.8byte	__rela_dyn_start - p_base
 p_prom:		.8byte	0
diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index d6f072865627..35654cbcd294 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -36,13 +36,11 @@ SECTIONS
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
+  __toc_ptr = DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
 #endif
 
   .hash : { *(.hash) }
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 324d7b298ec3..4c3e84a2a073 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -49,13 +49,13 @@ static inline int in_kernel_text(unsigned long addr)
 static inline unsigned long kernel_toc_addr(void)
 {
 	/* Defined by the linker, see vmlinux.lds.S */
-	extern unsigned long __toc_start;
+	extern unsigned long __toc_ptr;
 
 	/*
 	 * The TOC register (r2) points 32kB into the TOC, so that 64kB of
 	 * the TOC can be addressed using a single machine instruction.
 	 */
-	return (unsigned long)(&__toc_start) + 0x8000UL;
+	return (unsigned long)&__toc_ptr;
 }
 
 static inline int overlaps_interrupt_vector_text(unsigned long start,
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ece7f97bafff..1cae5b0943be 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -899,7 +899,7 @@ _GLOBAL(relative_toc)
 	blr
 
 .balign 8
-p_toc:	.8byte	__toc_start + 0x8000 - 0b
+p_toc:	.8byte	__toc_ptr - 0b
 
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
index 72fa3c00229a..343579080dd5 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -326,17 +326,16 @@ SECTIONS
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
+	__toc_ptr = DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
 #endif
 
 	/* The initial task and kernel stack */

-- 
Alan Modra
Australia Development Lab, IBM
