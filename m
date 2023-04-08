Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB026DB820
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtfDm36ZWz3fY7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:23:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gU5Zls/+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gU5Zls/+;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf6R3wHSz3fVw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:23 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id g3so933810pja.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920301; x=1683512301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a77NKc7WgrzQPfyTOGbQoH8tCMQ3oRJKODpfO3sLD+4=;
        b=gU5Zls/+xZu06onRRIlL+sYBB0z142LUXwHNF65nXPb98bYR49Ys8Kl/JOBxn1hGFI
         BZgEF5ATH49yyxBG9u8WoKpLAu6BjBGsfqL46n/+ptu5kVEYM2HeFz3RRFt70AW8EWe+
         GM+Y34qes1fJ3xEJeckAfWDclJq3PdZOJXf4IiG1MyjJTvRA3q4yFTecyY+1tJ+et6S0
         A3BZ0b4oOBszChr811KP3Ag88LTZPgrVuoIlxffBnfkLGL6XtuUWY6vAEx/ZTzRwopqa
         3io2FhCRP915pPcD3dwZ0qKB5w6jymPYr7pdtoyKX3yLB0W31FztYO1aKJIirFfJmRDv
         bkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920301; x=1683512301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a77NKc7WgrzQPfyTOGbQoH8tCMQ3oRJKODpfO3sLD+4=;
        b=2UNEmR2c6Yu2K6gcuZ6iPzrnvHjEXhA931KKDQvcRpv72rSv/elprdx0K9X7gQ6WTA
         y/vlgljNSPjysKxtKHBEvzWOF/Qt6k1lJ5wwfzS1ShWV2X75XtcfTh9oO77hYPIznmyt
         GeLQhb2LyXfERgkXZdbTSIe4+SNLURd8FMEBADOMDzv/5fF9r6GiAWFKA1a4DQFSYZh1
         SaO7UaCdA6bvgdJtr0/JHNK7gX+szA6TwUaNiVn/UDwKNFexm+4s2p4oIMDvpULTcQcv
         d/eaiD1u4LJwHVG3MoBs5W53tDG+QJRqpRIFQEpZ1+0aoqBZ77Sq7LXdDfhF27My/hoe
         6KKw==
X-Gm-Message-State: AAQBX9d2HI7LK8dNiL2DSRBO08bjRdKwm86DZyMHKYpuW8lL+JZ73L9N
	6424rNPYWoojLhik29J6wlxffbdYYvw9wQ==
X-Google-Smtp-Source: AKy350bZC1yxrsWgARuEm9b0AV46IPqFoQCFKbWW7QzCxtiLwHbfBGbvBsnWqrGGYsntvUojvUdXpA==
X-Received: by 2002:a17:902:da86:b0:19e:6700:174 with SMTP id j6-20020a170902da8600b0019e67000174mr5552785plx.25.1680920300456;
        Fri, 07 Apr 2023 19:18:20 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/64: modules support building with PCREL addresing
Date: Sat,  8 Apr 2023 12:17:52 +1000
Message-Id: <20230408021752.862660-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408021752.862660-1-npiggin@gmail.com>
References: <20230408021752.862660-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Build modules using PCREL addressing when CONFIG_PPC_KERNEL_PCREL=y.

- The module loader must handle several new relocation types:

  * R_PPC64_REL24_NOTOC is a function call handled like R_PPC_REL24, but
    does not restore r2 upon return. The external function call stub is
    changed to use pcrel addressing to load the function pointer rather
    than based on the module TOC.

  * R_PPC64_GOT_PCREL34 is a reference to external data. A GOT table
    must be built by hand, because the linker adds this during the final
    link (which is not done for kernel modules). The GOT table is built
    similarly to the way the external function call stub table is. This
    section is called .mygot because .got has a special meaning for the
    linker and can become upset.

  * R_PPC64_PCREL34 is used for local data addressing, but there is a
    special case where the percpu section is moved at load-time to the
    percpu area which is out of range of this relocation. This requires
    the PCREL34 relocations are converted to use GOT_PCREL34 addressing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile               |   5 +-
 arch/powerpc/include/asm/module.h   |  10 +-
 arch/powerpc/include/asm/ppc_asm.h  |   6 +-
 arch/powerpc/include/uapi/asm/elf.h |   4 +
 arch/powerpc/kernel/module_64.c     | 318 +++++++++++++++++++++++++---
 5 files changed, 309 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index d99fdd0f111a..85c1c2b23e7a 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -107,9 +107,7 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
-ifdef CONFIG_PPC_KERNEL_PCREL
-	KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-pcrel)
-endif
+ifndef CONFIG_PPC_KERNEL_PCREL
 ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
@@ -124,6 +122,7 @@ else
 	export NO_MINIMAL_TOC := -mno-minimal-toc
 endif
 endif
+endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
 ifndef CONFIG_CC_IS_CLANG
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index 09e2ffd360bb..ac53606c2594 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -27,8 +27,13 @@ struct ppc_plt_entry {
 struct mod_arch_specific {
 #ifdef __powerpc64__
 	unsigned int stubs_section;	/* Index of stubs section in module */
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	unsigned int got_section;	/* What section is the GOT? */
+	unsigned int pcpu_section;	/* .data..percpu section */
+#else
 	unsigned int toc_section;	/* What section is the TOC? */
 	bool toc_fixed;			/* Have we fixed up .TOC.? */
+#endif
 
 	/* For module function descriptor dereference */
 	unsigned long start_opd;
@@ -52,12 +57,15 @@ struct mod_arch_specific {
 
 /*
  * Select ELF headers.
- * Make empty section for module_frob_arch_sections to expand.
+ * Make empty sections for module_frob_arch_sections to expand.
  */
 
 #ifdef __powerpc64__
 #    ifdef MODULE
 	asm(".section .stubs,\"ax\",@nobits; .align 3; .previous");
+#        ifdef CONFIG_PPC_KERNEL_PCREL
+	    asm(".section .mygot,\"a\",@nobits; .align 3; .previous");
+#        endif
 #    endif
 #else
 #    ifdef MODULE
diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 9315f007d010..1a00523559e7 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -183,7 +183,7 @@
 /*
  * Used to name C functions called from asm
  */
-#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#ifdef CONFIG_PPC_KERNEL_PCREL
 #define CFUNC(name) name@notoc
 #else
 #define CFUNC(name) name
@@ -216,7 +216,7 @@
 	.globl name; \
 name:
 
-#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#ifdef CONFIG_PPC_KERNEL_PCREL
 #define _GLOBAL_TOC _GLOBAL
 #else
 #define _GLOBAL_TOC(name) \
@@ -379,7 +379,7 @@ GLUE(.,name):
 	ori	reg, reg, (expr)@l;		\
 	rldimi	reg, tmp, 32, 0
 
-#if defined(CONFIG_PPC_KERNEL_PCREL) && !defined(MODULE)
+#ifdef CONFIG_PPC_KERNEL_PCREL
 #define LOAD_REG_ADDR(reg,name)			\
 	pla	reg,name@pcrel
 
diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
index 308857123a08..dbc4a5b8d02d 100644
--- a/arch/powerpc/include/uapi/asm/elf.h
+++ b/arch/powerpc/include/uapi/asm/elf.h
@@ -279,8 +279,12 @@ typedef elf_fpreg_t elf_vsrreghalf_t32[ELF_NVSRHALFREG];
 #define R_PPC64_TLSLD		108
 #define R_PPC64_TOCSAVE		109
 
+#define R_PPC64_REL24_NOTOC	116
 #define R_PPC64_ENTRY		118
 
+#define R_PPC64_PCREL34		132
+#define R_PPC64_GOT_PCREL34	133
+
 #define R_PPC64_REL16		249
 #define R_PPC64_REL16_LO	250
 #define R_PPC64_REL16_HI	251
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 0fc04abac3bd..44b774d0de59 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -114,20 +114,32 @@ struct ppc64_stub_entry {
 	func_desc_t funcdata;
 } __aligned(8);
 
+struct ppc64_got_entry {
+	u64 addr;
+};
+
 /*
  * PPC64 uses 24 bit jumps, but we need to jump into other modules or
  * the kernel which may be further.  So we jump to a stub.
  *
- * For ELFv1 we need to use this to set up the new r2 value (aka TOC
- * pointer).  For ELFv2 it's the callee's responsibility to set up the
- * new r2, but for both we need to save the old r2.
+ * Target address and TOC are loaded from function descriptor in the
+ * ppc64_stub_entry.
+ *
+ * r12 is used to generate the target address, which is required for the
+ * ELFv2 global entry point calling convention.
  *
- * We could simply patch the new r2 value and function pointer into
- * the stub, but it's significantly shorter to put these values at the
- * end of the stub code, and patch the stub address (32-bits relative
- * to the TOC ptr, r2) into the stub.
+ * TOC handling:
+ * - PCREL does not have a TOC.
+ * - ELFv2 non-PCREL just has to save r2, the callee is responsible for
+ *   setting its own TOC pointer at the global entry address.
+ * - ELFv1 must load the new TOC pointer from the function descriptor.
  */
 static u32 ppc64_stub_insns[] = {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	/* pld r12,addr */
+	PPC_PREFIX_8LS | __PPC_PRFX_R(1),
+	PPC_INST_PLD | ___PPC_RT(_R12),
+#else
 	PPC_RAW_ADDIS(_R11, _R2, 0),
 	PPC_RAW_ADDI(_R11, _R11, 0),
 	/* Save current r2 value in magic place on the stack. */
@@ -136,14 +148,16 @@ static u32 ppc64_stub_insns[] = {
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 	/* Set up new r2 from function descriptor */
 	PPC_RAW_LD(_R2, _R11, 40),
+#endif
 #endif
 	PPC_RAW_MTCTR(_R12),
 	PPC_RAW_BCTR(),
 };
 
-/* Count how many different 24-bit relocations (different symbol,
+/* Count how many different r_type relocations (different symbol,
    different addend) */
-static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
+static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num,
+				 unsigned long r_type)
 {
 	unsigned int i, r_info, r_addend, _count_relocs;
 
@@ -152,8 +166,8 @@ static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
 	r_info = 0;
 	r_addend = 0;
 	for (i = 0; i < num; i++)
-		/* Only count 24-bit relocs, others don't need stubs */
-		if (ELF64_R_TYPE(rela[i].r_info) == R_PPC_REL24 &&
+		/* Only count r_type relocs, others don't need stubs */
+		if (ELF64_R_TYPE(rela[i].r_info) == r_type &&
 		    (r_info != ELF64_R_SYM(rela[i].r_info) ||
 		     r_addend != rela[i].r_addend)) {
 			_count_relocs++;
@@ -214,7 +228,14 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 
 			relocs += count_relocs((void *)sechdrs[i].sh_addr,
 					       sechdrs[i].sh_size
-					       / sizeof(Elf64_Rela));
+					       / sizeof(Elf64_Rela),
+					       R_PPC_REL24);
+#ifdef CONFIG_PPC_KERNEL_PCREL
+			relocs += count_relocs((void *)sechdrs[i].sh_addr,
+					       sechdrs[i].sh_size
+					       / sizeof(Elf64_Rela),
+					       R_PPC64_REL24_NOTOC);
+#endif
 		}
 	}
 
@@ -231,6 +252,96 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 	return relocs * sizeof(struct ppc64_stub_entry);
 }
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+static int count_pcpu_relocs(const Elf64_Shdr *sechdrs,
+			     const Elf64_Rela *rela, unsigned int num,
+			     unsigned int symindex, unsigned int pcpu)
+{
+	unsigned int i, r_info, r_addend, _count_relocs;
+
+	_count_relocs = 0;
+	r_info = 0;
+	r_addend = 0;
+
+	for (i = 0; i < num; i++) {
+		Elf64_Sym *sym;
+
+		/* This is the symbol it is referring to */
+		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
+			+ ELF64_R_SYM(rela[i].r_info);
+
+		if (sym->st_shndx == pcpu &&
+		    (r_info != ELF64_R_SYM(rela[i].r_info) ||
+		     r_addend != rela[i].r_addend)) {
+			_count_relocs++;
+			r_info = ELF64_R_SYM(rela[i].r_info);
+			r_addend = rela[i].r_addend;
+		}
+	}
+
+	return _count_relocs;
+}
+
+/* Get size of potential GOT required. */
+static unsigned long get_got_size(const Elf64_Ehdr *hdr,
+				  const Elf64_Shdr *sechdrs,
+				  struct module *me)
+{
+	/* One extra reloc so it's always 0-addr terminated */
+	unsigned long relocs = 1;
+	unsigned i;
+	unsigned symindex = 0;
+
+	for (i = 1; i < hdr->e_shnum; i++) {
+		if (sechdrs[i].sh_type == SHT_SYMTAB) {
+			symindex = i;
+			break;
+		}
+	}
+	WARN_ON_ONCE(!symindex);
+
+	/* Every relocated section... */
+	for (i = 1; i < hdr->e_shnum; i++) {
+		if (sechdrs[i].sh_type == SHT_RELA) {
+			pr_debug("Found relocations in section %u\n", i);
+			pr_debug("Ptr: %p.  Number: %Lu\n",
+			       (void *)sechdrs[i].sh_addr,
+			       sechdrs[i].sh_size / sizeof(Elf64_Rela));
+
+			/* Sort the relocation information based on a symbol and
+			 * addend key. This is a stable O(n*log n) complexity
+			 * algorithm but it will reduce the complexity of
+			 * count_relocs() to linear complexity O(n)
+			 */
+			sort((void *)sechdrs[i].sh_addr,
+			     sechdrs[i].sh_size / sizeof(Elf64_Rela),
+			     sizeof(Elf64_Rela), relacmp, NULL);
+
+			relocs += count_relocs((void *)sechdrs[i].sh_addr,
+					       sechdrs[i].sh_size
+					       / sizeof(Elf64_Rela),
+					       R_PPC64_GOT_PCREL34);
+
+			/*
+			 * Percpu data access typically gets linked with
+			 * REL34 relocations, but the percpu section gets
+			 * moved at load time and requires that to be
+			 * converted to GOT linkage.
+			 */
+			if (IS_ENABLED(CONFIG_SMP) && symindex)
+				relocs += count_pcpu_relocs(sechdrs,
+						(void *)sechdrs[i].sh_addr,
+					       sechdrs[i].sh_size
+					       / sizeof(Elf64_Rela),
+					       symindex, me->arch.pcpu_section);
+		}
+	}
+
+	pr_debug("Looks like a total of %lu GOT entries, max\n", relocs);
+	return relocs * sizeof(struct ppc64_got_entry);
+}
+#else /* CONFIG_PPC_KERNEL_PCREL */
+
 /* Still needed for ELFv2, for .TOC. */
 static void dedotify_versions(struct modversion_info *vers,
 			      unsigned long size)
@@ -280,6 +391,7 @@ static Elf64_Sym *find_dot_toc(Elf64_Shdr *sechdrs,
 	}
 	return NULL;
 }
+#endif /* CONFIG_PPC_KERNEL_PCREL */
 
 bool module_init_section(const char *name)
 {
@@ -298,6 +410,15 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 	for (i = 1; i < hdr->e_shnum; i++) {
 		if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0)
 			me->arch.stubs_section = i;
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		else if (strcmp(secstrings + sechdrs[i].sh_name, ".data..percpu") == 0)
+			me->arch.pcpu_section = i;
+		else if (strcmp(secstrings + sechdrs[i].sh_name, ".mygot") == 0) {
+			me->arch.got_section = i;
+			if (sechdrs[i].sh_addralign < 8)
+				sechdrs[i].sh_addralign = 8;
+		}
+#else
 		else if (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0) {
 			me->arch.toc_section = i;
 			if (sechdrs[i].sh_addralign < 8)
@@ -312,6 +433,7 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 				 sechdrs[i].sh_size / sizeof(Elf64_Sym),
 				 (void *)hdr
 				 + sechdrs[sechdrs[i].sh_link].sh_offset);
+#endif
 	}
 
 	if (!me->arch.stubs_section) {
@@ -319,15 +441,26 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 		return -ENOEXEC;
 	}
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	if (!me->arch.got_section) {
+		pr_err("%s: doesn't contain .mygot.\n", me->name);
+		return -ENOEXEC;
+	}
+
+	/* Override the got size */
+	sechdrs[me->arch.got_section].sh_size = get_got_size(hdr, sechdrs, me);
+#else
 	/* If we don't have a .toc, just use .stubs.  We need to set r2
 	   to some reasonable value in case the module calls out to
 	   other functions via a stub, or if a function pointer escapes
 	   the module by some means.  */
 	if (!me->arch.toc_section)
 		me->arch.toc_section = me->arch.stubs_section;
+#endif
 
 	/* Override the stubs size */
 	sechdrs[me->arch.stubs_section].sh_size = get_stubs_size(hdr, sechdrs);
+
 	return 0;
 }
 
@@ -445,7 +578,11 @@ static bool is_mprofile_ftrace_call(const char *name)
  */
 static inline unsigned long my_r2(const Elf64_Shdr *sechdrs, struct module *me)
 {
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	return (sechdrs[me->arch.toc_section].sh_addr & ~0xfful) + 0x8000;
+#else
+	return -1;
+#endif
 }
 
 /* Patch stub to reference function and correct r2 value. */
@@ -462,28 +599,53 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	if (is_mprofile_ftrace_call(name))
 		return create_ftrace_stub(entry, addr, me);
 
+	if ((unsigned long)entry->jump % 8 != 0) {
+		pr_err("%s: Address of stub entry is not 8-byte aligned\n", me->name);
+		return 0;
+	}
+
+	BUILD_BUG_ON(sizeof(ppc64_stub_insns) > sizeof(entry->jump));
 	for (i = 0; i < ARRAY_SIZE(ppc64_stub_insns); i++) {
 		if (patch_instruction(&entry->jump[i],
 				      ppc_inst(ppc64_stub_insns[i])))
 			return 0;
 	}
 
-	/* Stub uses address relative to r2. */
-	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
-	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-		pr_err("%s: Address %p of stub out of range of %p.\n",
-		       me->name, (void *)reladdr, (void *)my_r2);
-		return 0;
-	}
-	pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
+		/* Stub uses address relative to itself! */
+		reladdr = 0 + offsetof(struct ppc64_stub_entry, funcdata);
+		BUILD_BUG_ON(reladdr != 32);
+		if (reladdr > 0x1FFFFFFFFL || reladdr < -0x200000000L) {
+			pr_err("%s: Address of %p out of range of 34-bit relative address.\n",
+				me->name, (void *)reladdr);
+			return 0;
+		}
+		pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
 
-	if (patch_instruction(&entry->jump[0],
-			      ppc_inst(entry->jump[0] | PPC_HA(reladdr))))
-		return 0;
+		/* May not even need this if we're relative to 0 */
+		if (patch_instruction(&entry->jump[0],
+		    ppc_inst_prefix(entry->jump[0] | IMM_H18(reladdr),
+				    entry->jump[1] | IMM_L(reladdr))))
+			return 0;
 
-	if (patch_instruction(&entry->jump[1],
-			  ppc_inst(entry->jump[1] | PPC_LO(reladdr))))
-		return 0;
+	} else {
+		/* Stub uses address relative to r2. */
+		reladdr = (unsigned long)entry - my_r2(sechdrs, me);
+		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
+			pr_err("%s: Address %p of stub out of range of %p.\n",
+			       me->name, (void *)reladdr, (void *)my_r2);
+			return 0;
+		}
+		pr_debug("Stub %p get data from reladdr %li\n", entry, reladdr);
+
+		if (patch_instruction(&entry->jump[0],
+				      ppc_inst(entry->jump[0] | PPC_HA(reladdr))))
+			return 0;
+
+		if (patch_instruction(&entry->jump[1],
+				  ppc_inst(entry->jump[1] | PPC_LO(reladdr))))
+			return 0;
+	}
 
 	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
 	desc = func_desc(addr);
@@ -527,6 +689,37 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 	return (unsigned long)&stubs[i];
 }
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+/* Create GOT to load the location described in this ptr */
+static unsigned long got_for_addr(const Elf64_Shdr *sechdrs,
+				  unsigned long addr,
+				  struct module *me,
+				  const char *name)
+{
+	struct ppc64_got_entry *got;
+	unsigned int i, num_got;
+
+	if (!IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		return addr;
+
+	num_got = sechdrs[me->arch.got_section].sh_size / sizeof(*got);
+
+	/* Find this stub, or if that fails, the next avail. entry */
+	got = (void *)sechdrs[me->arch.got_section].sh_addr;
+	for (i = 0; got[i].addr; i++) {
+		if (WARN_ON(i >= num_got))
+			return 0;
+
+		if (got[i].addr == addr)
+			return (unsigned long)&got[i];
+	}
+
+	got[i].addr = addr;
+
+	return (unsigned long)&got[i];
+}
+#endif
+
 /* We expect a noop next: if it is, replace it with instruction to
    restore r2. */
 static int restore_r2(const char *name, u32 *instruction, struct module *me)
@@ -534,6 +727,9 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	u32 *prev_insn = instruction - 1;
 	u32 insn_val = *instruction;
 
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		return 0;
+
 	if (is_mprofile_ftrace_call(name))
 		return 0;
 
@@ -579,6 +775,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	pr_debug("Applying ADD relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	/* First time we're called, we can fix up .TOC. */
 	if (!me->arch.toc_fixed) {
 		sym = find_dot_toc(sechdrs, strtab, symindex);
@@ -588,7 +785,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			sym->st_value = my_r2(sechdrs, me);
 		me->arch.toc_fixed = true;
 	}
-
+#endif
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
 		/* This is where to make the change */
 		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
@@ -616,6 +813,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			*(unsigned long *)location = value;
 			break;
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 		case R_PPC64_TOC:
 			*(unsigned long *)location = my_r2(sechdrs, me);
 			break;
@@ -675,8 +873,13 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				= (*((uint16_t *) location) & ~0xffff)
 				| (value & 0xffff);
 			break;
+#endif
 
 		case R_PPC_REL24:
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		/* PCREL still generates REL24 for mcount */
+		case R_PPC64_REL24_NOTOC:
+#endif
 			/* FIXME: Handle weak symbols here --RR */
 			if (sym->st_shndx == SHN_UNDEF ||
 			    sym->st_shndx == SHN_LIVEPATCH) {
@@ -724,6 +927,47 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			*(u32 *)location = value;
 			break;
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		case R_PPC64_PCREL34: {
+			unsigned long absvalue = value;
+
+			/* Convert value to relative */
+			value -= (unsigned long)location;
+
+			if (value + 0x200000000 > 0x3ffffffff) {
+				if (sym->st_shndx != me->arch.pcpu_section) {
+					pr_err("%s: REL34 %li out of range!\n",
+					       me->name, (long int)value);
+					return -ENOEXEC;
+				}
+
+				/*
+				 * per-cpu section is special cased because
+				 * it is moved during loading, so has to be
+				 * converted to use GOT.
+				 */
+				value = got_for_addr(sechdrs, absvalue, me,
+						strtab + sym->st_name);
+				if (!value)
+					return -ENOENT;
+				value -= (unsigned long)location;
+
+				/* Turn pla into pld */
+				if (patch_instruction((u32 *)location,
+				    ppc_inst_prefix((*(u32 *)location & ~0x02000000),
+						    (*((u32 *)location + 1) & ~0xf8000000) | 0xe4000000)))
+					return -EFAULT;
+			}
+
+			if (patch_instruction((u32 *)location,
+			    ppc_inst_prefix((*(u32 *)location & ~0x3ffff) | IMM_H18(value),
+					    (*((u32 *)location + 1) & ~0xffff) | IMM_L(value))))
+				return -EFAULT;
+
+			break;
+		}
+
+#else
 		case R_PPC64_TOCSAVE:
 			/*
 			 * Marker reloc indicates we don't have to save r2.
@@ -731,8 +975,12 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			 * it.
 			 */
 			break;
+#endif
 
 		case R_PPC64_ENTRY:
+			if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+				break;
+
 			/*
 			 * Optimize ELFv2 large code model entry point if
 			 * the TOC is within 2GB range of current location.
@@ -775,6 +1023,22 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 				| (value & 0xffff);
 			break;
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		case R_PPC64_GOT_PCREL34:
+			value = got_for_addr(sechdrs, value, me,
+					strtab + sym->st_name);
+			if (!value)
+				return -ENOENT;
+			value -= (unsigned long)location;
+			((uint32_t *)location)[0]
+				= (((uint32_t *)location)[0] & ~0x3ffff)
+				| ((value >> 16) & 0x3ffff);
+			((uint32_t *)location)[1]
+				= (((uint32_t *)location)[1] & ~0xffff)
+				| (value & 0xffff);
+			break;
+#endif
+
 		default:
 			pr_err("%s: Unknown ADD relocation: %lu\n",
 			       me->name,
-- 
2.40.0

