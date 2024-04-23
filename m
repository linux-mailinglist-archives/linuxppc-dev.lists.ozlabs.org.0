Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BACF8ADB22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 02:29:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kGP8WfJJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNjfg1XQ7z3dLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 10:29:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kGP8WfJJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNjdy4SZ3z30PD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 10:28:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EF87611E3;
	Tue, 23 Apr 2024 00:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B3BC113CC;
	Tue, 23 Apr 2024 00:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713832115;
	bh=bYg7Bua8mbv/lRd7aBsldip0FxWjdUU2v59h3z6dUOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGP8WfJJ0xFkVhI+VyW4A8vesExJmUlX6ezuZfTn/p4alm0AfMRW0GJGJcLPzeQtu
	 OFtvVI0Ef0LtCQKWInJI/2iJ90JvWkp71YUgZqBJqiol1BqgP5qQzLNzzNHfY78QFM
	 RirMZHIVf5n5aWT/gELpWnEAu9Cj2zMgIcd5cgnIX/zSj3A4XQ76cUo2h8y/9lfA8+
	 3JJJm/Udzp/wbTHFP5ydAYqPPKNQIJmjfwSJ3n4CHOI9trQbL/8UQBpqOaInjnD/ZN
	 9CMI6L0MKIZnMlmu7IJn3qUmRxPywutLPc8OIG6J2qovv+3cg5PinGmR3bDEOOk5v4
	 hLdddKrMDXsWg==
Date: Mon, 22 Apr 2024 17:28:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
Message-ID: <20240423002833.GA1436185@dev-arch.thelio-3990X>
References: <20240422092206.147078-1-sv@linux.ibm.com>
 <20240422092206.147078-2-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422092206.147078-2-sv@linux.ibm.com>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, masahiroy@kernel.org, mahesh@linux.ibm.com, mingo@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sathvika,

On Mon, Apr 22, 2024 at 02:52:06PM +0530, Sathvika Vasireddy wrote:
> Implement build-time fixup of alternate feature relative addresses for
> the out-of-line (else) patch code. Initial posting to achieve the same
> using another tool can be found at [1]. Idea is to implement this using
> objtool instead of introducing another tool since it already has elf
> parsing and processing covered.
> 
> Introduce --ftr-fixup as an option to objtool to do feature fixup at
> build-time.
> 
> Couple of issues and warnings encountered while implementing feature
> fixup using objtool are as follows:
> 
> 1. libelf is creating corrupted vmlinux file after writing necessary
> changes to the file. Due to this, kexec is not able to load new
> kernel.
> 
> It gives the following error:
>         ELF Note corrupted !
>         Cannot determine the file type of vmlinux
> 
> To fix this issue, after opening vmlinux file, make a call to
> elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
> to touch the segment and section layout. It informs the library
> that the application will take responsibility for the layout of the
> file and that the library should not insert any padding between
> sections.
> 
> 2. Fix can't find starting instruction warnings when run on vmlinux
> 
> Objtool throws a lot of can't find starting instruction warnings
> when run on vmlinux with --ftr-fixup option.
> 
> These warnings are seen because find_insn() function looks for
> instructions at offsets that are relative to the start of the section.
> In case of individual object files (.o), there are no can't find
> starting instruction warnings seen because the actual offset
> associated with an instruction is itself a relative offset since the
> sections start at offset 0x0.
> 
> However, in case of vmlinux, find_insn() function fails to find
> instructions at the actual offset associated with an instruction
> since the sections in vmlinux do not start at offset 0x0. Due to
> this, find_insn() will look for absolute offset and not the relative
> offset. This is resulting in a lot of can't find starting instruction
> warnings when objtool is run on vmlinux.
> 
> To fix this, pass offset that is relative to the start of the section
> to find_insn().
> 
> find_insn() is also looking for symbols of size 0. But, objtool does
> not store empty STT_NOTYPE symbols in the rbtree. Due to this,
> for empty symbols, objtool is throwing can't find starting
> instruction warnings. Fix this by ignoring symbols that are of
> size 0 since objtool does not add them to the rbtree.
> 
> 3. Objtool is throwing unannotated intra-function call warnings
> when run on vmlinux with --ftr-fixup option.
> 
> One such example:
> 
> vmlinux: warning: objtool: .text+0x3d94:
>                         unannotated intra-function call
> 
> .text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4
> 
> c0000000000081d4: 45 24 02 48  bl c00000000002a618
> <system_reset_exception+0x8>
> 
> c00000000002a610 <system_reset_exception>:
> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>                         c00000000002a610: R_PPC64_REL16_HA    .TOC.
> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>                         c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
> c00000000002a618:       a6 02 08 7c     mflr    r0
> 
> This is happening because we should be looking for destination
> symbols that are at absolute offsets instead of relative offsets.
> After fixing dest_off to point to absolute offset, there are still
> a lot of these warnings shown.
> 
> In the above example, objtool is computing the destination
> offset to be c00000000002a618, which points to a completely
> different instruction. find_call_destination() is looking for this
> offset and failing. Instead, we should be looking for destination
> offset c00000000002a610 which points to system_reset_exception
> function.
> 
> Even after fixing the way destination offset is computed, and
> after looking for dest_off - 0x8 in cases where the original offset
> is not found, there are still a lot of unannotated intra-function
> call warnings generated. This is due to symbols that are not
> properly annotated.
> 
> So, for now, as a hack to curb these warnings, do not emit
> unannotated intra-function call warnings when objtool is run
> with --ftr-fixup option.
> 
> TODO:
> This patch enables build time feature fixup only for powerpc little
> endian configs. There are boot failures with big endian configs.
> Posting this as an initial RFC to get some review comments while I work
> on big endian issues.
> 
> [1]
> https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail.com/
> 
> Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

When I build this series with LLVM 14 [1] (due to an issue I report
below), I am getting a crash when CONFIG_FTR_FIXUP_SELFTEST is disabled.

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 544a65fda77b..95d2906ec814 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -427,7 +427,6 @@ CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_IO_STRICT_DEVMEM=y
 CONFIG_PPC_EMULATED_STATS=y
 CONFIG_CODE_PATCHING_SELFTEST=y
-CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_BOOTX_TEXT=y

  $ make -kj"$(nproc)" ARCH=powerpc LLVM=$PWD/llvm-14.0.6-x86_64/bin/ ppc64le_defconfig vmlinux
  ...
    LD      vmlinux
    NM      System.map
    SORTTAB vmlinux
    CHKHEAD vmlinux
    CHKREL  vmlinux
  make[4]: *** [scripts/Makefile.vmlinux:38: vmlinux] Error 139
  make[4]: *** Deleting file 'vmlinux
  ...

I do not see the objtool command in V=1 output but I do see the end of
scripts/link-vmlinux.sh, so it does seem like it is crashing in objtool.

[1]: from https://mirrors.edge.kernel.org/pub/tools/llvm/

> ---
>  arch/Kconfig                              |   3 +
>  arch/powerpc/Kconfig                      |   5 +
>  arch/powerpc/Makefile                     |   5 +
>  arch/powerpc/include/asm/feature-fixups.h |  11 +-
>  arch/powerpc/kernel/vmlinux.lds.S         |  14 +-
>  arch/powerpc/lib/feature-fixups.c         |  13 +
>  scripts/Makefile.lib                      |   7 +
>  scripts/Makefile.vmlinux                  |  15 +-
>  tools/objtool/arch/powerpc/special.c      | 329 ++++++++++++++++++++++
>  tools/objtool/arch/x86/special.c          |  49 ++++
>  tools/objtool/builtin-check.c             |   2 +
>  tools/objtool/check.c                     |  38 ++-
>  tools/objtool/elf.c                       |   4 +
>  tools/objtool/include/objtool/builtin.h   |   1 +
>  tools/objtool/include/objtool/special.h   |  43 +++
>  15 files changed, 530 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 9f066785bb71..8defdf86a69e 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1206,6 +1206,9 @@ config HAVE_UACCESS_VALIDATION
>  	bool
>  	select OBJTOOL
>  
> +config HAVE_OBJTOOL_FTR_FIXUP
> +        bool
> +
>  config HAVE_STACK_VALIDATION
>  	bool
>  	help
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1c4be3373686..806285a28231 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -23,6 +23,11 @@ config 64BIT
>  	bool
>  	default y if PPC64
>  
> +config HAVE_OBJTOOL_FTR_FIXUP
> +        bool
> +        default y if CPU_LITTLE_ENDIAN && PPC64
> +        select OBJTOOL
> +
>  config LIVEPATCH_64
>  	def_bool PPC64
>  	depends on LIVEPATCH
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 65261cbe5bfd..bc81847d5c3d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -112,6 +112,11 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>  LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
>  LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
>  
> +# --emit-relocs required for post-link fixup of alternate feature
> +# text section relocations.
> +LDFLAGS_vmlinux        += --emit-relocs
> +KBUILD_LDFLAGS_MODULE += --emit-relocs
> +
>  ifdef CONFIG_PPC64
>  ifndef CONFIG_PPC_KERNEL_PCREL
>  ifeq ($(call cc-option-yn,-mcmodel=medium),y)
> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
> index 77824bd289a3..006e2493c7c3 100644
> --- a/arch/powerpc/include/asm/feature-fixups.h
> +++ b/arch/powerpc/include/asm/feature-fixups.h
> @@ -30,12 +30,19 @@
>  
>  #define START_FTR_SECTION(label)	label##1:
>  
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  #define FTR_SECTION_ELSE_NESTED(label)			\
>  label##2:						\
> -	.pushsection __ftr_alt_##label,"a";		\
> +	.pushsection __ftr_alt_##label, "ax";		\
>  	.align 2;					\
>  label##3:
> -
> +#else
> +#define FTR_SECTION_ELSE_NESTED(label)			\
> +label##2 : \
> +	.pushsection __ftr_alt_##label, "a";		\
> +	.align 2;					\
> +label##3 :
> +#endif
>  
>  #ifndef CONFIG_CC_IS_CLANG
>  #define CHECK_ALT_SIZE(else_size, body_size)			\
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index f420df7888a7..6b1c61e8af47 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -105,8 +105,13 @@ SECTIONS
>  	.text : AT(ADDR(.text) - LOAD_OFFSET) {
>  		ALIGN_FUNCTION();
>  #endif
> -		/* careful! __ftr_alt_* sections need to be close to .text */
> -		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely .text.unlikely.* .fixup __ftr_alt_* .ref.text);
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely
> +			.text.unlikely.* .fixup .ref.text);
> +#else
> +		*(.text.hot .text.hot.* TEXT_MAIN .text.fixup .text.unlikely
> +			.text.unlikely.* .fixup __ftr_alt_* .ref.text);
> +#endif
>  		*(.tramp.ftrace.text);
>  		NOINSTR_TEXT
>  		SCHED_TEXT
> @@ -276,6 +281,11 @@ SECTIONS
>  		_einittext = .;
>  		*(.tramp.ftrace.init);
>  	} :text
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +	.__ftr_alternates.text : AT(ADDR(.__ftr_alternates.text) - LOAD_OFFSET) {
> +		*(__ftr_alt*);
> +	}
> +#endif
>  
>  	/* .exit.text is discarded at runtime, not link time,
>  	 * to deal with references from __bug_table
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
> index 4f82581ca203..8c5eb7c8612f 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -44,6 +44,18 @@ static u32 *calc_addr(struct fixup_entry *fcur, long offset)
>  	return (u32 *)((unsigned long)fcur + offset);
>  }
>  
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u32 *alt_end)
> +{
> +	ppc_inst_t instr;
> +
> +	instr = ppc_inst_read(src);
> +
> +	raw_patch_instruction(dest, instr);
> +
> +	return 0;
> +}
> +#else
>  static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u32 *alt_end)
>  {
>  	int err;
> @@ -66,6 +78,7 @@ static int patch_alt_instruction(u32 *src, u32 *dest, u32 *alt_start, u32 *alt_e
>  
>  	return 0;
>  }
> +#endif
>  
>  static int patch_feature_section_mask(unsigned long value, unsigned long mask,
>  				      struct fixup_entry *fcur)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index c65bb0fbd136..8fff27b9bdcb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -290,6 +290,13 @@ ifneq ($(objtool-args-y),)
>  cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
>  endif
>  
> +cmd_objtool_vmlinux :=
> +ifeq ($(CONFIG_HAVE_OBJTOOL_FTR_FIXUP),y)
> +cmd_objtool_vmlinux = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
> +vmlinux:
> +    $(cmd_objtool_vmlinux)
> +endif
> +
>  cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
>  
>  endif # CONFIG_OBJTOOL
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index c9f3e03124d7..2f4a7154e676 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -30,7 +30,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =							\
>  	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
> -	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
> +	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
> +	$(cmd_objtool_vmlinux)
>  
>  targets += vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
> @@ -52,3 +53,15 @@ existing-targets := $(wildcard $(sort $(targets)))
>  -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
>  
>  .PHONY: $(PHONY)
> +
> +# objtool for vmlinux
> +# ----------------------------------
> +#
> +#  For feature fixup, objtool does not run on individual
> +#  translation units. Run this on vmlinux instead.
> +
> +objtool-enabled := $(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)
> +
> +vmlinux-objtool-args-$(CONFIG_HAVE_OBJTOOL_FTR_FIXUP)  += --ftr-fixup
> +
> +objtool-args = $(vmlinux-objtool-args-y) --link
> diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
> index d33868147196..5ec3eed34eb0 100644
> --- a/tools/objtool/arch/powerpc/special.c
> +++ b/tools/objtool/arch/powerpc/special.c
> @@ -3,7 +3,17 @@
>  #include <stdlib.h>
>  #include <objtool/special.h>
>  #include <objtool/builtin.h>
> +#include <objtool/warn.h>
> +#include <asm/byteorder.h>
> +#include <errno.h>
>  
> +struct section *ftr_alt;
> +
> +struct fixup_entry *fes;
> +unsigned int nr_fes;
> +
> +uint64_t fe_alt_start = -1;
> +uint64_t fe_alt_end;
>  
>  bool arch_support_alt_relocation(struct special_alt *special_alt,
>  				 struct instruction *insn,
> @@ -17,3 +27,322 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
>  {
>  	exit(-1);
>  }
> +
> +int process_alt_data(struct objtool_file *file)
> +{
> +	struct section *section;
> +
> +	section = find_section_by_name(file->elf, ".__ftr_alternates.text");
> +	ftr_alt = section;
> +
> +	if (!ftr_alt) {
> +		WARN(".__ftr_alternates.text section not found\n");
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +int process_fixup_entries(struct objtool_file *file)
> +{
> +	struct section *sec;
> +	unsigned int nr = 0;
> +	int i;
> +
> +	for_each_sec(file, sec) {
> +		if (strstr(sec->name, "_ftr_fixup") != NULL) {
> +			Elf_Data *data = sec->data;
> +
> +			if (data && data->d_size > 0)
> +				nr = data->d_size / sizeof(struct fixup_entry);
> +
> +			for (i = 0; i < nr; i++) {
> +				struct fixup_entry *dst;
> +				unsigned long idx;
> +				unsigned long long off;
> +				struct fixup_entry *src;
> +
> +				idx = i * sizeof(struct fixup_entry);
> +				off = sec->sh.sh_addr + data->d_off + idx;
> +				src = data->d_buf + idx;
> +
> +				if (src->alt_start_off == src->alt_end_off)
> +					continue;
> +
> +				fes = realloc(fes, (nr_fes + 1) * sizeof(struct fixup_entry));
> +				dst = &fes[nr_fes];
> +				nr_fes++;
> +
> +				dst->mask = __le64_to_cpu(src->mask);
> +				dst->value = __le64_to_cpu(src->value);
> +				dst->start_off = __le64_to_cpu(src->start_off) + off;
> +				dst->end_off = __le64_to_cpu(src->end_off) + off;
> +				dst->alt_start_off = __le64_to_cpu(src->alt_start_off) + off;
> +				dst->alt_end_off = __le64_to_cpu(src->alt_end_off) + off;
> +
> +				if (dst->alt_start_off < fe_alt_start)
> +					fe_alt_start = dst->alt_start_off;
> +
> +				if (dst->alt_end_off > fe_alt_end)
> +					fe_alt_end = dst->alt_end_off;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +struct fixup_entry *find_fe_altaddr(uint64_t addr)
> +{
> +	unsigned int i;
> +
> +	if (addr < fe_alt_start)
> +		return NULL;
> +	if (addr >= fe_alt_end)
> +		return NULL;
> +
> +	for (i = 0; i < nr_fes; i++) {
> +		if (addr >= fes[i].alt_start_off && addr < fes[i].alt_end_off)
> +			return &fes[i];
> +	}
> +	return NULL;
> +}
> +
> +int set_uncond_branch_target(uint32_t *insn,
> +	       const uint64_t addr, uint64_t target)
> +{
> +	uint32_t i = *insn;
> +	int64_t offset;
> +
> +	offset = target;
> +	if (!(i & BRANCH_ABSOLUTE))
> +		offset = offset - addr;
> +
> +	/* Check we can represent the target in the instruction format */
> +	if (offset < -0x2000000 || offset > 0x1fffffc || offset & 0x3)
> +		return -EOVERFLOW;
> +
> +	/* Mask out the flags and target, so they don't step on each other. */
> +	*insn = 0x48000000 | (i & 0x3) | (offset & 0x03FFFFFC);
> +
> +	return 0;
> +}
> +
> +int set_cond_branch_target(uint32_t *insn,
> +	       const uint64_t addr, uint64_t target)
> +{
> +	uint32_t i = *insn;
> +	int64_t offset;
> +
> +	offset = target;
> +
> +	if (!(i & BRANCH_ABSOLUTE))
> +		offset = offset - addr;
> +
> +	/* Check we can represent the target in the instruction format */
> +	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3) {
> +		printf("cannot represent\n");
> +		return -EOVERFLOW;
> +	}
> +
> +	/* Mask out the flags and target, so they don't step on each other. */
> +	*insn = 0x40000000 | (i & 0x3FF0003) | (offset & 0xFFFC);
> +
> +	return 0;
> +}
> +
> +void check_and_flatten_fixup_entries(void)
> +{
> +	static struct fixup_entry *fe;
> +	unsigned int i;
> +
> +	i = nr_fes;
> +	while (i) {
> +		static struct fixup_entry *parent;
> +		uint64_t nested_off; /* offset from start of parent */
> +		uint64_t size;
> +
> +		i--;
> +		fe = &fes[i];
> +
> +		parent = find_fe_altaddr(fe->start_off);
> +		if (!parent) {
> +			parent = find_fe_altaddr(fe->end_off);
> +			continue;
> +		}
> +
> +		size = fe->end_off - fe->start_off;
> +		nested_off = fe->start_off - parent->alt_start_off;
> +
> +		fe->start_off = parent->start_off + nested_off;
> +		fe->end_off = fe->start_off + size;
> +	}
> +}
> +
> +int process_bug_entries(struct objtool_file *file)
> +{
> +	struct section *section;
> +
> +	Elf_Data *data;
> +	unsigned int nr, i;
> +
> +	section = find_section_by_name(file->elf, "__bug_table");
> +
> +	data = section->data;
> +
> +	nr = data->d_size / sizeof(struct bug_entry_64);
> +
> +	for (i = 0; i < nr; i++) {
> +		unsigned long idx;
> +		uint64_t bugaddr;
> +		struct bug_entry_64 *bug;
> +
> +		idx = i * sizeof(struct bug_entry_64);
> +		bug = data->d_buf + idx;
> +		bugaddr = __le64_to_cpu(bug->bug_addr);
> +
> +		if (bugaddr < fe_alt_start)
> +			continue;
> +
> +		if (bugaddr >= fe_alt_end)
> +			continue;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct symbol *find_symbol_at_address_within_section(struct section *sec,
> +								unsigned long address)
> +{
> +	struct symbol *sym;
> +
> +	sec_for_each_sym(sec, sym) {
> +		if (sym->sym.st_value <= address && address < sym->sym.st_value + sym->len)
> +			return sym;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int is_local_symbol(uint8_t st_other)
> +{
> +	return (st_other & 0x3) != 0;
> +}
> +
> +static struct symbol *find_symbol_at_address(struct objtool_file *file,
> +						unsigned long address)
> +{
> +	struct section *sec;
> +	struct symbol *sym;
> +
> +	list_for_each_entry(sec, &file->elf->sections, list) {
> +		sym = find_symbol_at_address_within_section(sec, address);
> +		if (sym)
> +			return sym;
> +	}
> +	return NULL;
> +}
> +
> +int process_alt_relocations(struct objtool_file *file)
> +{
> +	struct section *section;
> +	size_t n = 0;
> +	uint32_t insn;
> +	uint32_t *i;
> +	unsigned int opcode;
> +
> +	section = find_section_by_name(file->elf, ".rela.__ftr_alternates.text");
> +	if (!section) {
> +		printf(".rela.__ftr_alternates.text section not found.\n");
> +		return -1;
> +	}
> +
> +	for (int j = 0; j < sec_num_entries(section); j++) {
> +		struct reloc *relocation = &section->relocs[j];
> +		struct symbol *sym = relocation->sym;
> +		struct fixup_entry *fe;
> +		uint64_t addr = reloc_offset(relocation);
> +		uint64_t scn_delta;
> +		uint64_t dst_addr;
> +		const char *insn_ptr;
> +		unsigned long target = sym->sym.st_value + reloc_addend(relocation);
> +
> +		struct symbol *symbol = find_symbol_at_address(file, target);
> +
> +		if (symbol) {
> +			int is_local = is_local_symbol(symbol->sym.st_other);
> +
> +			if (!is_local)
> +				target = target + 0x8;
> +		}
> +
> +		n++;

When HOSTCC is Clang 15 or newer, there is a warning (or error due to
objtool using -Werror) that n is only incremented but never actually
used:

  arch/powerpc/special.c:249:9: error: variable 'n' set but not used [-Werror,-Wunused-but-set-variable]
    249 |         size_t n = 0;
        |                ^
  1 error generated.
  make[7]: *** [tools/build/Makefile.build:106: tools/objtool/arch/powerpc/special.o] Error 1

> +		fe = find_fe_altaddr(addr);
> +		if (fe) {
> +
> +			if (target >= fe->alt_start_off &&
> +					target < fe->alt_end_off)
> +				continue;
> +
> +			if (target >= ftr_alt->sh.sh_addr &&
> +					target < ftr_alt->sh.sh_addr +
> +					ftr_alt->sh.sh_size) {
> +				printf("ftr_alt branch target is another ftr_alt region.\n");
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			scn_delta = addr - ftr_alt->sh.sh_addr;
> +			dst_addr = addr - fe->alt_start_off + fe->start_off;
> +
> +			i = ftr_alt->data->d_buf + scn_delta;
> +			insn = __le32_to_cpu(*i);
> +
> +			opcode = insn >> 26;
> +
> +			if (opcode == 16)
> +				set_cond_branch_target(&insn, dst_addr, target);
> +
> +			if (opcode == 18)
> +				set_uncond_branch_target(&insn, dst_addr, target);
> +
> +			insn_ptr = (const char *)&insn;
> +			elf_write_insn(file->elf, ftr_alt, scn_delta, sizeof(insn), insn_ptr);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int process_exception_entries(struct objtool_file *file)
> +{
> +	struct section *section;
> +	Elf_Data *data;
> +	unsigned int nr, i;
> +
> +	section = find_section_by_name(file->elf, "__ex_table");
> +
> +	data = section->data;
> +	nr = data->d_size / sizeof(struct exception_entry_64);
> +
> +	for (i = 0; i < nr; i++) {
> +		unsigned long idx;
> +		uint64_t exaddr;
> +		unsigned long long off;
> +		struct exception_entry_64 *ex;
> +
> +		idx = i * sizeof(struct exception_entry_64);
> +		off = section->sh.sh_addr + data->d_off + idx;
> +		ex = data->d_buf + idx;
> +		exaddr = __le32_to_cpu(ex->insn) + off;
> +
> +		if (exaddr < fe_alt_start)
> +			continue;
> +		if (exaddr >= fe_alt_end)
> +			continue;
> +
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	return 0;
> +}
> diff --git a/tools/objtool/arch/x86/special.c b/tools/objtool/arch/x86/special.c
> index 4134d27c696b..85527cf73e2d 100644
> --- a/tools/objtool/arch/x86/special.c
> +++ b/tools/objtool/arch/x86/special.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  #include <string.h>
> +#include <stdlib.h>
>  
>  #include <objtool/special.h>
>  #include <objtool/builtin.h>
> @@ -137,3 +138,51 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
>  
>  	return rodata_reloc;
>  }
> +
> +
> +int process_alt_data(struct objtool_file *file)
> +{
> +	exit(-1);
> +}
> +
> +int process_fixup_entries(struct objtool_file *file)
> +{
> +	exit(-1);
> +}
> +
> +struct fixup_entry *find_fe_altaddr(uint64_t addr)
> +{
> +	exit(-1);
> +}
> +
> +int set_uncond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target)
> +{
> +	exit(-1);
> +}
> +
> +int set_cond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target)
> +{
> +	exit(-1);
> +}
> +
> +void check_and_flatten_fixup_entries(void)
> +{
> +	exit(-1);
> +}
> +
> +int process_bug_entries(struct objtool_file *file)
> +{
> +	exit(-1);
> +}
> +
> +int process_alt_relocations(struct objtool_file *file)
> +{
> +	exit(-1);
> +}
> +
> +int process_exception_entries(struct objtool_file *file)
> +{
> +	exit(-1);
> +}
> diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
> index 5e21cfb7661d..dae04ea2a9a4 100644
> --- a/tools/objtool/builtin-check.c
> +++ b/tools/objtool/builtin-check.c
> @@ -68,6 +68,7 @@ static int parse_hacks(const struct option *opt, const char *str, int unset)
>  static const struct option check_options[] = {
>  	OPT_GROUP("Actions:"),
>  	OPT_CALLBACK_OPTARG('h', "hacks", NULL, NULL, "jump_label,noinstr,skylake", "patch toolchain bugs/limitations", parse_hacks),
> +	OPT_BOOLEAN('f', "ftr-fixup", &opts.ftr_fixup, "feature fixup"),
>  	OPT_BOOLEAN('i', "ibt", &opts.ibt, "validate and annotate IBT"),
>  	OPT_BOOLEAN('m', "mcount", &opts.mcount, "annotate mcount/fentry calls for ftrace"),
>  	OPT_BOOLEAN('n', "noinstr", &opts.noinstr, "validate noinstr rules"),
> @@ -132,6 +133,7 @@ int cmd_parse_options(int argc, const char **argv, const char * const usage[])
>  static bool opts_valid(void)
>  {
>  	if (opts.hack_jump_label	||
> +	    opts.ftr_fixup		||
>  	    opts.hack_noinstr		||
>  	    opts.ibt			||
>  	    opts.mcount			||
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 0a33d9195b7a..d6a75fabefb6 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -22,6 +22,9 @@
>  #include <linux/static_call_types.h>
>  #include <linux/string.h>
>  
> +#include <asm/byteorder.h>
> +#include <errno.h>
> +
>  struct alternative {
>  	struct alternative *next;
>  	struct instruction *insn;
> @@ -456,12 +459,15 @@ static int decode_instructions(struct objtool_file *file)
>  				return -1;
>  			}
>  
> +			if (func->len == 0)
> +				continue;
> +
>  			if (func->embedded_insn || func->alias != func)
>  				continue;
>  
> -			if (!find_insn(file, sec, func->offset)) {
> -				WARN("%s(): can't find starting instruction",
> -				     func->name);
> +			if (!find_insn(file, sec, opts.ftr_fixup ?
> +						func->offset - sec->sym->offset : func->offset)) {
> +				WARN("%s(): can't find starting instruction", func->name);
>  				return -1;
>  			}
>  
> @@ -1707,7 +1713,7 @@ static int add_call_destinations(struct objtool_file *file)
>  			if (insn->ignore)
>  				continue;
>  
> -			if (!insn_call_dest(insn)) {
> +			if (!insn_call_dest(insn) && !opts.ftr_fixup) {
>  				WARN_INSN(insn, "unannotated intra-function call");
>  				return -1;
>  			}
> @@ -4720,6 +4726,30 @@ int check(struct objtool_file *file)
>  	if (!nr_insns)
>  		goto out;
>  
> +	if (opts.ftr_fixup) {
> +		ret = process_alt_data(file);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = process_fixup_entries(file);
> +		if (ret < 0)
> +			return ret;
> +
> +		check_and_flatten_fixup_entries();
> +
> +		ret = process_exception_entries(file);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = process_bug_entries(file);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = process_alt_relocations(file);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	if (opts.retpoline) {
>  		ret = validate_retpoline(file);
>  		if (ret < 0)
> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> index 3d27983dc908..e5f8327f1d30 100644
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -1022,6 +1022,10 @@ struct elf *elf_open_read(const char *name, int flags)
>  		cmd = ELF_C_WRITE;
>  
>  	elf->elf = elf_begin(elf->fd, cmd, NULL);
> +
> +	if (opts.ftr_fixup)
> +		elf_flagelf(elf->elf, ELF_C_SET, ELF_F_LAYOUT);
> +
>  	if (!elf->elf) {
>  		WARN_ELF("elf_begin");
>  		goto err;
> diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
> index fcca6662c8b4..2a80f206072c 100644
> --- a/tools/objtool/include/objtool/builtin.h
> +++ b/tools/objtool/include/objtool/builtin.h
> @@ -10,6 +10,7 @@
>  struct opts {
>  	/* actions: */
>  	bool dump_orc;
> +	bool ftr_fixup;
>  	bool hack_jump_label;
>  	bool hack_noinstr;
>  	bool hack_skylake;
> diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
> index 86d4af9c5aa9..390a0e7816b7 100644
> --- a/tools/objtool/include/objtool/special.h
> +++ b/tools/objtool/include/objtool/special.h
> @@ -12,6 +12,28 @@
>  
>  #define C_JUMP_TABLE_SECTION ".rodata..c_jump_table"
>  
> +#define BRANCH_SET_LINK 0x1
> +#define BRANCH_ABSOLUTE 0x2
> +
> +struct bug_entry_64 {
> +	uint64_t bug_addr;
> +	uint16_t flags;
> +};
> +
> +struct exception_entry_64 {
> +	int32_t insn;
> +	int32_t fixup;
> +};
> +
> +struct fixup_entry {
> +	uint64_t mask;
> +	uint64_t value;
> +	uint64_t start_off;
> +	uint64_t end_off;
> +	uint64_t alt_start_off;
> +	uint64_t alt_end_off;
> +};
> +
>  struct special_alt {
>  	struct list_head list;
>  
> @@ -37,6 +59,27 @@ void arch_handle_alternative(unsigned short feature, struct special_alt *alt);
>  bool arch_support_alt_relocation(struct special_alt *special_alt,
>  				 struct instruction *insn,
>  				 struct reloc *reloc);
> +
>  struct reloc *arch_find_switch_table(struct objtool_file *file,
>  				    struct instruction *insn);
> +
> +int process_alt_data(struct objtool_file *file);
> +
> +int process_fixup_entries(struct objtool_file *file);
> +
> +void check_and_flatten_fixup_entries(void);
> +
> +int process_exception_entries(struct objtool_file *file);
> +
> +int process_bug_entries(struct objtool_file *file);
> +
> +int process_alt_relocations(struct objtool_file *file);
> +
> +struct fixup_entry *find_fe_altaddr(uint64_t addr);
> +
> +int set_uncond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target);
> +
> +int set_cond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target);
>  #endif /* _SPECIAL_H */
> -- 
> 2.34.1
> 
