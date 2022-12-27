Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6E6568EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 10:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh8dz2D3fz3fF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Dec 2022 20:35:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UspMMhOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UspMMhOO;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh8Rs2ldWz3bhW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 20:26:49 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id n4so12757035plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Dec 2022 01:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6T64ooHncg/4Wl/ee4pWcDkch9L/OSmP8E+VwU9AkY=;
        b=UspMMhOOPEZxSO42ebd8uiHboS3W3A6ARooTDIP+eX376Dp1JMcWyoNzRHrtfwc2w6
         bW+DLKkJgHAjZwl/a4Q9EuQEeiT+lvaM3AHa9GrenUK5d85XZtVpZc/0gVDfWACj4B9J
         EyAcAavF52+dg7ugDJS3ZKHeNES8OA4yYpUc0jd1gh6IvII+gcgcwQLwiS/28+q4L+DZ
         0qlMgxbpWaWrMIXBfihwW8FC1OpnTKHsGFXKPSUqGfCBB59fbViwnb5Pkr3IS298rkKr
         +NXxXVe8YifjUQVTgCoVImAexWmCPaljHvo3Hjp3uOCdsXkzE6j2fegLNIstABOKKtZI
         A/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6T64ooHncg/4Wl/ee4pWcDkch9L/OSmP8E+VwU9AkY=;
        b=b1lv81WqecTup1FS1OBwov7T5sjLYWXDxheHw78IItmAwma2Y4c8E8lRV0D37lCc/W
         ATyLCfL3CYh1giod8pK3BjVdI0JfkrQYpNNTT/aZ+a0NZv+fre7FA3BT4XlJLvkq82WT
         GyIUIHCEhdt978equAtP3zLhQqQdAg+0/O3xGZ/0k3M+gQE86rn/F8AyL2yVPkYBeqoY
         sqEtIM3Qy/ktxilJIrhEdqwuv29t8AFzbUA8/gb6+QqSUU5Df5+BAx2g4qhATVz4e6HG
         STgOOWqDgUYvWc46DUl3Poni60FqBdC7qc+CT4BKBGPaJC2VYFchm1BbJadgZfAB8IfK
         Y9Yg==
X-Gm-Message-State: AFqh2kr16uO2REARyuxKzrCDfJb4AVC7lvxcC6kQh8urdjjVHauVeDs5
	y3Xim0wtx9/HlBJ/d+AkAoLvsxCo7Kw=
X-Google-Smtp-Source: AMrXdXuI9pheDPhntiYFpficofN3HVwlR3EyZCZVFwuVrD49JoRK2F7llg0sJukp3aKr8TmRh4rCPQ==
X-Received: by 2002:a17:902:ff0f:b0:186:b88c:2c5e with SMTP id f15-20020a170902ff0f00b00186b88c2c5emr28510634plj.4.1672133206290;
        Tue, 27 Dec 2022 01:26:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-252-227.tpgi.com.au. [58.6.252.227])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b00189947bd9f7sm8598998plg.50.2022.12.27.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:26:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 9/9] powerpc/64: modules support building with PCREL addresing
Date: Tue, 27 Dec 2022 19:26:09 +1000
Message-Id: <20221227092609.2078908-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221227092609.2078908-1-npiggin@gmail.com>
References: <20221227092609.2078908-1-npiggin@gmail.com>
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

Build modules using PCREL addressing when the kernel PCREL build option
is selected.

The module loader must handle several new relocation types:
- R_PPC64_REL24_NOTOC is a function cal handled like R_PPC_REL24, but
  does not restore r2 upon return. The external function call stub is
  changed to use PCREL addressing to load the function pointer rather
  than based on the module TOC.
- R_PPC64_GOT_PCREL34 is a reference to external data. A GOT table must
  be built by hand, because the linker adds this during the final link
  (which is not done for kernel modules). The GOT table is built
  similarly to the way the external function call stub table is. This
  section is called .mygot because .got has a special meaning for the
  linker which can upset it.
- R_PPC64_PCREL34 is used for local data addressing. There is a special
  case where the percpu section is moved at load-time to the percpu
  area which is out of range of this relocation, that case gets converted
  to a GOT address (XXX: is this kosher? Must restrict this case to only
  percpu so it doesn't paper over any bugs).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile               |   5 +-
 arch/powerpc/include/asm/module.h   |   9 +-
 arch/powerpc/include/asm/ppc_asm.h  |   6 +-
 arch/powerpc/include/uapi/asm/elf.h |   4 +
 arch/powerpc/kernel/module_64.c     | 294 ++++++++++++++++++++++++----
 5 files changed, 269 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 7bd83d124c1e..833247e1a81a 100644
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
index 09e2ffd360bb..f3d12a553863 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -27,8 +27,12 @@ struct ppc_plt_entry {
 struct mod_arch_specific {
 #ifdef __powerpc64__
 	unsigned int stubs_section;	/* Index of stubs section in module */
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	unsigned int got_section;	/* What section is the GOT? */
+#else
 	unsigned int toc_section;	/* What section is the TOC? */
 	bool toc_fixed;			/* Have we fixed up .TOC.? */
+#endif
 
 	/* For module function descriptor dereference */
 	unsigned long start_opd;
@@ -52,12 +56,15 @@ struct mod_arch_specific {
 
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
index de01ded00281..6f443916ad7b 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -114,6 +114,10 @@ struct ppc64_stub_entry {
 	func_desc_t funcdata;
 } __aligned(8);
 
+struct ppc64_got_entry {
+	u64 addr;
+};
+
 /*
  * PPC64 uses 24 bit jumps, but we need to jump into other modules or
  * the kernel which may be further.  So we jump to a stub.
@@ -128,6 +132,14 @@ struct ppc64_stub_entry {
  * to the TOC ptr, r2) into the stub.
  */
 static u32 ppc64_stub_insns[] = {
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	/* pla r11,addr ; ld r12,32(r11) (XXX: could use PLD) */
+	PPC_PREFIX_MLS | __PPC_PRFX_R(1),
+	PPC_INST_PADDI | ___PPC_RT(_R11),
+	PPC_RAW_LD(_R12, _R11, 32),
+	PPC_RAW_MTCTR(_R12),
+	PPC_RAW_BCTR(),
+#else
 	PPC_RAW_ADDIS(_R11, _R2, 0),
 	PPC_RAW_ADDI(_R11, _R11, 0),
 	/* Save current r2 value in magic place on the stack. */
@@ -139,11 +151,13 @@ static u32 ppc64_stub_insns[] = {
 #endif
 	PPC_RAW_MTCTR(_R12),
 	PPC_RAW_BCTR(),
+#endif
 };
 
 /* Count how many different 24-bit relocations (different symbol,
    different addend) */
-static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
+static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num,
+				 unsigned long r_type)
 {
 	unsigned int i, r_info, r_addend, _count_relocs;
 
@@ -153,7 +167,7 @@ static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
 	r_addend = 0;
 	for (i = 0; i < num; i++)
 		/* Only count 24-bit relocs, others don't need stubs */
-		if (ELF64_R_TYPE(rela[i].r_info) == R_PPC_REL24 &&
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
 
@@ -231,6 +252,47 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 	return relocs * sizeof(struct ppc64_stub_entry);
 }
 
+/* Get size of potential GOT required. */
+static unsigned long get_got_size(const Elf64_Ehdr *hdr,
+				  const Elf64_Shdr *sechdrs)
+{
+	/* One extra reloc so it's always 0-addr terminated */
+	unsigned long relocs = 1;
+	unsigned i;
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
+		}
+	}
+
+#ifdef CONFIG_SMP
+	relocs++; /* .data..percpu relocs XXX: count this properly? */
+#endif
+
+	pr_debug("Looks like a total of %lu GOT entries, max\n", relocs);
+	return relocs * sizeof(struct ppc64_got_entry);
+}
+
+
 /* Still needed for ELFv2, for .TOC. */
 static void dedotify_versions(struct modversion_info *vers,
 			      unsigned long size)
@@ -263,6 +325,7 @@ static void dedotify(Elf64_Sym *syms, unsigned int numsyms, char *strtab)
 	}
 }
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 static Elf64_Sym *find_dot_toc(Elf64_Shdr *sechdrs,
 			       const char *strtab,
 			       unsigned int symindex)
@@ -280,6 +343,7 @@ static Elf64_Sym *find_dot_toc(Elf64_Shdr *sechdrs,
 	}
 	return NULL;
 }
+#endif
 
 bool module_init_section(const char *name)
 {
@@ -298,11 +362,19 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 	for (i = 1; i < hdr->e_shnum; i++) {
 		if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0)
 			me->arch.stubs_section = i;
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		else if (strcmp(secstrings + sechdrs[i].sh_name, ".mygot") == 0) {
+			me->arch.got_section = i;
+			if (sechdrs[i].sh_addralign < 8)
+				sechdrs[i].sh_addralign = 8;
+		}
+#else
 		else if (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0) {
 			me->arch.toc_section = i;
 			if (sechdrs[i].sh_addralign < 8)
 				sechdrs[i].sh_addralign = 8;
 		}
+#endif
 		else if (strcmp(secstrings+sechdrs[i].sh_name,"__versions")==0)
 			dedotify_versions((void *)hdr + sechdrs[i].sh_offset,
 					  sechdrs[i].sh_size);
@@ -319,15 +391,26 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 		return -ENOEXEC;
 	}
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+	if (!me->arch.got_section) {
+		pr_err("%s: doesn't contain .mygot.\n", me->name);
+		return -ENOEXEC;
+	}
+
+	/* Override the got size */
+	sechdrs[me->arch.got_section].sh_size = get_got_size(hdr, sechdrs);
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
 
@@ -381,8 +464,8 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 		/* Stub uses address relative to kernel base (from the paca) */
 		reladdr = addr - local_paca->kernelbase;
 		if (reladdr > 0x1FFFFFFFFL || reladdr < -0x200000000L) {
-			pr_err("%s: Address of 0x%lx out of range of 34-bit relative address reladdr=0x%lx entry=0x%lx.\n",
-				me->name, addr, reladdr, (unsigned long)entry);
+			pr_err("%s: Address of %p out of range of 34-bit relative address.\n",
+				me->name, (void *)addr);
 			return 0;
 		}
 
@@ -392,8 +475,8 @@ static inline int create_ftrace_stub(struct ppc64_stub_entry *entry,
 		/* Stub uses address relative to kernel toc (from the paca) */
 		reladdr = addr - kernel_toc_addr();
 		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-			pr_err("%s: Address of %ps out of range of kernel_toc.\n",
-								me->name, (void *)addr);
+			pr_err("%s: Address of %p out of range of kernel_toc.\n",
+				me->name, (void *)addr);
 			return 0;
 		}
 
@@ -437,6 +520,39 @@ static bool is_mprofile_ftrace_call(const char *name)
 }
 #endif
 
+/* We expect a noop next: if it is, replace it with instruction to
+   restore r2. */
+static int restore_r2(const char *name, u32 *instruction, struct module *me)
+{
+	u32 *prev_insn = instruction - 1;
+
+	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		return 1;
+
+	if (is_mprofile_ftrace_call(name))
+		return 1;
+
+	/*
+	 * Make sure the branch isn't a sibling call.  Sibling calls aren't
+	 * "link" branches and they don't return, so they don't need the r2
+	 * restore afterwards.
+	 */
+	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
+		return 1;
+
+	if (*instruction != PPC_RAW_NOP()) {
+		pr_err("%s: Expected nop after call, got %08x at %pS\n",
+			me->name, *instruction, instruction);
+		return 0;
+	}
+
+	/* ld r2,R2_STACK_OFFSET(r1) */
+	if (patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC)))
+		return 0;
+
+	return 1;
+}
+
 /*
  * r2 is the TOC pointer: it actually points 0x8000 into the TOC (this gives the
  * value maximum span in an instruction which uses a signed offset). Round down
@@ -445,7 +561,11 @@ static bool is_mprofile_ftrace_call(const char *name)
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
@@ -462,28 +582,52 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
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
+		reladdr = 0;
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
@@ -527,34 +671,33 @@ static unsigned long stub_for_addr(const Elf64_Shdr *sechdrs,
 	return (unsigned long)&stubs[i];
 }
 
-/* We expect a noop next: if it is, replace it with instruction to
-   restore r2. */
-static int restore_r2(const char *name, u32 *instruction, struct module *me)
+/* Create GOT to load the location described in this ptr */
+static unsigned long got_for_addr(const Elf64_Shdr *sechdrs,
+				  unsigned long addr,
+				  struct module *me,
+				  const char *name)
 {
-	u32 *prev_insn = instruction - 1;
+	struct ppc64_got_entry *got;
+	unsigned int i, num_got;
 
-	if (is_mprofile_ftrace_call(name))
-		return 1;
+	if (!IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
+		return addr;
 
-	/*
-	 * Make sure the branch isn't a sibling call.  Sibling calls aren't
-	 * "link" branches and they don't return, so they don't need the r2
-	 * restore afterwards.
-	 */
-	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
-		return 1;
+	num_got = sechdrs[me->arch.got_section].sh_size / sizeof(*got);
 
-	if (*instruction != PPC_RAW_NOP()) {
-		pr_err("%s: Expected nop after call, got %08x at %pS\n",
-			me->name, *instruction, instruction);
-		return 0;
+	/* Find this stub, or if that fails, the next avail. entry */
+	got = (void *)sechdrs[me->arch.got_section].sh_addr;
+	for (i = 0; got[i].addr; i++) {
+		if (WARN_ON(i >= num_got))
+			return 0;
+
+		if (got[i].addr == addr)
+			return (unsigned long)&got[i];
 	}
 
-	/* ld r2,R2_STACK_OFFSET(r1) */
-	if (patch_instruction(instruction, ppc_inst(PPC_INST_LD_TOC)))
-		return 0;
+	got[i].addr = addr;
 
-	return 1;
+	return (unsigned long)&got[i];
 }
 
 int apply_relocate_add(Elf64_Shdr *sechdrs,
@@ -572,6 +715,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 	pr_debug("Applying ADD relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 	/* First time we're called, we can fix up .TOC. */
 	if (!me->arch.toc_fixed) {
 		sym = find_dot_toc(sechdrs, strtab, symindex);
@@ -581,6 +725,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			sym->st_value = my_r2(sechdrs, me);
 		me->arch.toc_fixed = true;
 	}
+#endif
 
 	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
 		/* This is where to make the change */
@@ -609,6 +754,7 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			*(unsigned long *)location = value;
 			break;
 
+#ifndef CONFIG_PPC_KERNEL_PCREL
 		case R_PPC64_TOC:
 			*(unsigned long *)location = my_r2(sechdrs, me);
 			break;
@@ -668,8 +814,13 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
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
@@ -717,6 +868,45 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 			*(u32 *)location = value;
 			break;
 
+#ifdef CONFIG_PPC_KERNEL_PCREL
+		case R_PPC64_PCREL34:
+			if (value - (unsigned long)location + 0x200000000 > 0x3ffffffff) {
+				/* XXX: this hits for per-cpu data relocs, should enforce no other relocs go through here */
+				value = got_for_addr(sechdrs, value, me,
+						strtab + sym->st_name);
+				if (!value)
+					return -ENOENT;
+				value -= (unsigned long)location;
+				/* Turn pla into pld */
+				((uint32_t *)location)[0]
+					= (((uint32_t *)location)[0] & ~0x02000000);
+				((uint32_t *)location)[1]
+					= (((uint32_t *)location)[1] & ~0xf8000000) | 0xe4000000;
+
+				((uint32_t *)location)[0]
+					= (((uint32_t *)location)[0] & ~0x3ffff)
+					| ((value >> 16) & 0x3ffff);
+				((uint32_t *)location)[1]
+					= (((uint32_t *)location)[1] & ~0xffff)
+					| (value & 0xffff);
+				break;
+			}
+			/* Convert value to relative */
+			value -= (unsigned long)location;
+			if (value + 0x200000000 > 0x3ffffffff) {
+				pr_err("%s: PCREL34 %li out of range!\n",
+				       me->name, (long int)value);
+				return -ENOEXEC;
+			}
+
+			if (patch_instruction((u32 *)location,
+			    ppc_inst_prefix((*(u32 *)location & ~0x3ffff) | IMM_H18(value),
+					    (*((u32 *)location + 1) & ~0xffff) | IMM_L(value))))
+				return -EFAULT;
+
+			break;
+
+#else
 		case R_PPC64_TOCSAVE:
 			/*
 			 * Marker reloc indicates we don't have to save r2.
@@ -724,8 +914,12 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
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
@@ -768,6 +962,22 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
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
2.37.2

