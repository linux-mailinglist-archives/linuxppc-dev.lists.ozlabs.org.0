Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31083CBE7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:07:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLVgw166Cz3cY8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 06:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLVgM5bnHz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 06:06:52 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TLVgC34RXz9tMd;
	Thu, 25 Jan 2024 20:06:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRYntwRPDHIS; Thu, 25 Jan 2024 20:06:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TLVYs6xSjz9v5s;
	Thu, 25 Jan 2024 20:02:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E07E18B775;
	Thu, 25 Jan 2024 20:02:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OCxtGJN-gq8H; Thu, 25 Jan 2024 20:02:09 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A69BA8B765;
	Thu, 25 Jan 2024 20:02:09 +0100 (CET)
Message-ID: <bfe238da-c5e3-4478-8c3d-c4ebd584fcb4@csgroup.eu>
Date: Thu, 25 Jan 2024 20:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: build-time fixup alternate feature relative
 addresses
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20170521010130.13552-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20170521010130.13552-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nic,

Le 21/05/2017 à 03:01, Nicholas Piggin a écrit :
> Implement build-time fixup of alternate feature relative addresses for
> the out-of-line ("else") patch code. This is done post-link with a new
> powerpc build tool that parses relocations and fixup structures, and
> adjusts branch instructions.
> 
> This gives us the ability to link patch code anywhere in the kernel,
> without branches to targets outside the patch code having to be
> reached directly (without a linker stub). This allows patch code to be
> moved out from the head section, and avoids build failures with
> unresolvable branche.

Is it worth keeping this hanging in patchwork ? It seems outdated and 
doesn't apply. Could this me done with objtool instead ?

Christophe

> 
> The downside is increased complexity of the build steps.
> 
> Currently:
> 
> - The patch code must be linked with branch targets reached directly.
>    This is done by omitting the "x" attribute from the patch code's
>    section, which suppresses branch stub creation. Instead, a link error
>    is raised if a branch cannot reach its target directly.
> 
> - The runtime patcher adjusts external branch targets to compensate
>    for the distance moved (from link to runtime location).
> 
> After this change:
> 
> - The patch code is linked with branch stubs allowed, by using the "x"
>    section attribute. This allows flexibility in patch code placement.
> 
> - The final link is made with --emit-relocs, which emits relocations
>    for these branches.
> 
> - After link, a tool fixes patch code external branches to be be a
>    direct branch to target, relative to their runtime location. Any
>    branch stubs in the patch code section are ignored.
> 
> - After feature fixup, newer toolchains can strip off the additional
>    relocations.
> 
> - The runtime patcher can move the patch code into its runtime
>    location with no branch adjustment.
> 
> - After patching, original patch code can be discarded from runtime
>    image.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> 
> I'm reposting this with some fixes required to work with current
> kernels (relative exception tables). I think it's probably the right
> way to go in the long term, it gives a lot of control over instruction
> patching to have a build-time pass. It is more complexity though, so
> I don't know whether it would be better to wait until we hit more
> problems with the existing system first.
> 
> 
>   arch/powerpc/Makefile                      |   8 +-
>   arch/powerpc/Makefile.postlink             |  24 +-
>   arch/powerpc/include/asm/feature-fixups.h  |   5 +-
>   arch/powerpc/kernel/vmlinux.lds.S          |   8 +-
>   arch/powerpc/lib/feature-fixups.c          |  19 +-
>   arch/powerpc/tools/Makefile                |   3 +
>   arch/powerpc/tools/relocs/.gitignore       |   1 +
>   arch/powerpc/tools/relocs/Makefile         |  12 +
>   arch/powerpc/tools/relocs/code-patching.c  |  82 ++++
>   arch/powerpc/tools/relocs/code-patching.h  |   7 +
>   arch/powerpc/tools/relocs/elf_sections.c   | 337 ++++++++++++++
>   arch/powerpc/tools/relocs/elf_sections.h   |  50 ++
>   arch/powerpc/tools/relocs/process_relocs.c | 718 +++++++++++++++++++++++++++++
>   13 files changed, 1253 insertions(+), 21 deletions(-)
>   create mode 100644 arch/powerpc/tools/Makefile
>   create mode 100644 arch/powerpc/tools/relocs/.gitignore
>   create mode 100644 arch/powerpc/tools/relocs/Makefile
>   create mode 100644 arch/powerpc/tools/relocs/code-patching.c
>   create mode 100644 arch/powerpc/tools/relocs/code-patching.h
>   create mode 100644 arch/powerpc/tools/relocs/elf_sections.c
>   create mode 100644 arch/powerpc/tools/relocs/elf_sections.h
>   create mode 100644 arch/powerpc/tools/relocs/process_relocs.c
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index edc682f7b462..bc4791aecd03 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -104,6 +104,11 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>   LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
>   LDFLAGS_vmlinux += $(call ld-option,--orphan-handling=warn)
>   
> +# --emit-relocs required for post-link fixup of alternate feature
> +# text section relocations.
> +LDFLAGS_vmlinux	+= --emit-relocs
> +KBUILD_LDFLAGS_MODULE += --emit-relocs
> +
>   ifeq ($(CONFIG_PPC64),y)
>   ifeq ($(call cc-option-yn,-mcmodel=medium),y)
>   	# -mcmodel=medium breaks modules because it uses 32bit offsets from
> @@ -429,6 +434,7 @@ checkbin:
>   		false ; \
>   	fi
>   
> +archscripts: scripts_basic
> +	$(Q)$(MAKE) $(build)=arch/powerpc/tools
>   
>   CLEAN_FILES += $(TOUT)
> -
> diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
> index 5db43ebbe2df..bf9b180e3530 100644
> --- a/arch/powerpc/Makefile.postlink
> +++ b/arch/powerpc/Makefile.postlink
> @@ -2,7 +2,9 @@
>   # Post-link powerpc pass
>   # ===========================================================================
>   #
> -# 1. Check that vmlinux relocations look sane
> +# 1. Invoke process_relocs to fix feature fixup alternate section branches.
> +# 2. Check that vmlinux relocations look sane
> +# 3. Strip static relocations (created by --emit-relocs) if binutils >= 2.27
>   
>   PHONY := __archpost
>   __archpost:
> @@ -23,19 +25,35 @@ else
>   	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$@"
>   endif
>   
> +quiet_cmd_process_alt_ftr_relocs = FTR_ALT $@
> +      cmd_process_alt_ftr_relocs = 					\
> +	arch/powerpc/tools/relocs/process_relocs "$@"
> +
> +ifeq ($(call ld-ifversion, -ge, 227000000, y),y)
> +quiet_cmd_strip_relocs = STRIP   $@
> +      cmd_strip_relocs =						\
> +	$(OBJCOPY) $(shell for sec in					\
> +		$$(readelf -St $@ | grep -B1 RELA | grep "\.rela" |	\
> +			cut -d"]" -f2 | sed "s/[[:space:]]//" |		\
> +			grep -v "^\.rela\.dyn$$" | sed "s/\.rela//") ;	\
> +			do echo -n "--remove-relocation=$$sec " ; done) $@
> +endif
> +
>   # `@true` prevents complaint when there is nothing to be done
>   
>   vmlinux: FORCE
> -	@true
> +	$(call if_changed,process_alt_ftr_relocs)
>   ifdef CONFIG_PPC64
>   	$(call cmd,head_check)
>   endif
>   ifdef CONFIG_RELOCATABLE
>   	$(call if_changed,relocs_check)
>   endif
> +	$(call if_changed,strip_relocs)
>   
>   %.ko: FORCE
> -	@true
> +	$(call if_changed,process_alt_ftr_relocs)
> +	$(call if_changed,strip_relocs)
>   
>   clean:
>   	rm -f .tmp_symbols.txt
> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
> index 2de2319b99e2..9f78f2f62886 100644
> --- a/arch/powerpc/include/asm/feature-fixups.h
> +++ b/arch/powerpc/include/asm/feature-fixups.h
> @@ -16,6 +16,9 @@
>    * useable with the vdso shared library. There is also an assumption
>    * that values will be negative, that is, the fixup table has to be
>    * located after the code it fixes up.
> + *
> + * Please ensure that new section names, modifications to FTR_ENTRY
> + * encoding, etc., is handled by arch/powerpc/tools/relocs/ code.
>    */
>   #if defined(CONFIG_PPC64) && !defined(__powerpc64__)
>   /* 64 bits kernel, 32 bits code (ie. vdso32) */
> @@ -33,7 +36,7 @@
>   
>   #define FTR_SECTION_ELSE_NESTED(label)			\
>   label##2:						\
> -	.pushsection __ftr_alt_##label,"a";		\
> +	.pushsection __ftr_alt_##label,"ax";		\
>   	.align 2;					\
>   label##3:
>   
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 0e78129e033a..d3a4ad960176 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -87,8 +87,7 @@ SECTIONS
>   	.text : AT(ADDR(.text) - LOAD_OFFSET) {
>   		ALIGN_FUNCTION();
>   #endif
> -		/* careful! __ftr_alt_* sections need to be close to .text */
> -		*(.text.hot .text .text.fixup .text.unlikely .fixup __ftr_alt_* .ref.text);
> +		*(.text.hot .text .text.fixup .text.unlikely .fixup .ref.text);
>   		SCHED_TEXT
>   		CPUIDLE_TEXT
>   		LOCK_TEXT
> @@ -112,7 +111,6 @@ SECTIONS
>   		*(.got2)
>   		__got2_end = .;
>   #endif /* CONFIG_PPC32 */
> -
>   	} :kernel
>   
>   	. = ALIGN(PAGE_SIZE);
> @@ -141,6 +139,10 @@ SECTIONS
>   	__init_begin = .;
>   	INIT_TEXT_SECTION(PAGE_SIZE) :kernel
>   
> +	.__ftr_alternates.text : AT(ADDR(.__ftr_alternates.text) - LOAD_OFFSET) {
> +		*(__ftr_alt*);
> +	}
> +
>   	/* .exit.text is discarded at runtime, not link time,
>   	 * to deal with references from __bug_table
>   	 */
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
> index f3917705c686..26cfb3919589 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -47,20 +47,13 @@ static unsigned int *calc_addr(struct fixup_entry *fcur, long offset)
>   static int patch_alt_instruction(unsigned int *src, unsigned int *dest,
>   				 unsigned int *alt_start, unsigned int *alt_end)
>   {
> -	unsigned int instr;
> +	unsigned int instr = *src;
>   
> -	instr = *src;
> -
> -	if (instr_is_relative_branch(*src)) {
> -		unsigned int *target = (unsigned int *)branch_target(src);
> -
> -		/* Branch within the section doesn't need translating */
> -		if (target < alt_start || target >= alt_end) {
> -			instr = translate_branch(dest, src);
> -			if (!instr)
> -				return 1;
> -		}
> -	}
> +	/*
> +	 * We used to translate relative branches here, however we now
> +	 * do that by fixing up relocations after link with process_relocs
> +	 * tool in arch/powerpc/tools/relocs/
> +	 */
>   
>   	patch_instruction(dest, instr);
>   
> diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> new file mode 100644
> index 000000000000..38dbf0427080
> --- /dev/null
> +++ b/arch/powerpc/tools/Makefile
> @@ -0,0 +1,3 @@
> +always		:= $(hostprogs-y) $(hostprogs-m)
> +
> +subdir-y	+= relocs
> diff --git a/arch/powerpc/tools/relocs/.gitignore b/arch/powerpc/tools/relocs/.gitignore
> new file mode 100644
> index 000000000000..5cf4382690d2
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/.gitignore
> @@ -0,0 +1 @@
> +process_relocs
> diff --git a/arch/powerpc/tools/relocs/Makefile b/arch/powerpc/tools/relocs/Makefile
> new file mode 100644
> index 000000000000..bea662d7c1ba
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/Makefile
> @@ -0,0 +1,12 @@
> +HOST_EXTRACFLAGS		+= -Wno-unused-function
> +ifdef CONFIG_DEBUG_BUGVERBOSE
> +HOST_EXTRACFLAGS		+= -DCONFIG_DEBUG_BUGVERBOSE
> +endif
> +
> +hostprogs-y			:= process_relocs
> +
> +process_relocs-objs		:= process_relocs.o elf_sections.o code-patching.o
> +
> +always				:= $(hostprogs-y)
> +
> +HOSTLOADLIBES_process_relocs	+= -lelf
> diff --git a/arch/powerpc/tools/relocs/code-patching.c b/arch/powerpc/tools/relocs/code-patching.c
> new file mode 100644
> index 000000000000..db564a03b51c
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/code-patching.c
> @@ -0,0 +1,82 @@
> +/*
> + *  Copyright 2008 Michael Ellerman, IBM Corporation.
> + *
> + *  This program is free software; you can redistribute it and/or
> + *  modify it under the terms of the GNU General Public License
> + *  as published by the Free Software Foundation; either version
> + *  2 of the License, or (at your option) any later version.
> + */
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <inttypes.h>
> +#include <errno.h>
> +#include "code-patching.h"
> +
> +#define BRANCH_SET_LINK 0x1
> +#define BRANCH_ABSOLUTE 0x2
> +
> +static int set_uncond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target)
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
> +static int set_cond_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target)
> +{
> +	uint32_t i = *insn;
> +	int64_t offset;
> +
> +	offset = target;
> +	if (!(i & BRANCH_ABSOLUTE))
> +		offset = offset - addr;
> +
> +	/* Check we can represent the target in the instruction format */
> +	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
> +		return -EOVERFLOW;
> +
> +	/* Mask out the flags and target, so they don't step on each other. */
> +	*insn = 0x40000000 | (i & 0x3FF0003) | (offset & 0xFFFC);
> +
> +	return 0;
> +}
> +
> +static uint32_t branch_opcode(uint32_t instr)
> +{
> +	return (instr >> 26) & 0x3F;
> +}
> +
> +static int instr_is_branch_iform(uint32_t instr)
> +{
> +	return branch_opcode(instr) == 18;
> +}
> +
> +static int instr_is_branch_bform(uint32_t instr)
> +{
> +	return branch_opcode(instr) == 16;
> +}
> +
> +int set_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target)
> +{
> +	if (instr_is_branch_iform(*insn))
> +		return set_uncond_branch_target(insn, addr, target);
> +	else if (instr_is_branch_bform(*insn))
> +		return set_cond_branch_target(insn, addr, target);
> +
> +	return -EINVAL;
> +}
> diff --git a/arch/powerpc/tools/relocs/code-patching.h b/arch/powerpc/tools/relocs/code-patching.h
> new file mode 100644
> index 000000000000..1d3cbbe99102
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/code-patching.h
> @@ -0,0 +1,7 @@
> +#ifndef __CODE_PATCHING_H__
> +#define __CODE_PATCHING_H__
> +
> +int set_branch_target(uint32_t *insn,
> +		const uint64_t addr, uint64_t target);
> +
> +#endif
> diff --git a/arch/powerpc/tools/relocs/elf_sections.c b/arch/powerpc/tools/relocs/elf_sections.c
> new file mode 100644
> index 000000000000..718020d93394
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/elf_sections.c
> @@ -0,0 +1,337 @@
> +#define _GNU_SOURCE
> +#include <assert.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <gelf.h>
> +#include <elf.h>
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +
> +#include "elf_sections.h"
> +
> +#define dbg_printf(...)
> +
> +static const char *rel_type_name(unsigned int type)
> +{
> +	static const char *const type_name[] = {
> +#define REL_TYPE(X)[X] = #X
> +		REL_TYPE(R_PPC64_NONE),
> +		REL_TYPE(R_PPC64_ADDR32),
> +		REL_TYPE(R_PPC64_ADDR24),
> +		REL_TYPE(R_PPC64_ADDR16),
> +		REL_TYPE(R_PPC64_ADDR16_LO),
> +		REL_TYPE(R_PPC64_ADDR16_HI),
> +		REL_TYPE(R_PPC64_ADDR16_HA),
> +		REL_TYPE(R_PPC64_ADDR14),
> +		REL_TYPE(R_PPC64_ADDR14_BRTAKEN),
> +		REL_TYPE(R_PPC64_ADDR14_BRNTAKEN),
> +		REL_TYPE(R_PPC64_REL24),
> +		REL_TYPE(R_PPC64_REL14),
> +		REL_TYPE(R_PPC64_REL14_BRTAKEN),
> +		REL_TYPE(R_PPC64_REL14_BRNTAKEN),
> +		REL_TYPE(R_PPC64_GOT16),
> +		REL_TYPE(R_PPC64_GOT16_LO),
> +		REL_TYPE(R_PPC64_GOT16_HI),
> +		REL_TYPE(R_PPC64_GOT16_HA),
> +		REL_TYPE(R_PPC64_COPY),
> +		REL_TYPE(R_PPC64_GLOB_DAT),
> +		REL_TYPE(R_PPC64_JMP_SLOT),
> +		REL_TYPE(R_PPC64_RELATIVE),
> +		REL_TYPE(R_PPC64_UADDR32),
> +		REL_TYPE(R_PPC64_UADDR16),
> +		REL_TYPE(R_PPC64_REL32),
> +		REL_TYPE(R_PPC64_PLT32),
> +		REL_TYPE(R_PPC64_PLTREL32),
> +		REL_TYPE(R_PPC64_PLT16_LO),
> +		REL_TYPE(R_PPC64_PLT16_HI),
> +		REL_TYPE(R_PPC64_PLT16_HA),
> +		REL_TYPE(R_PPC64_SECTOFF),
> +		REL_TYPE(R_PPC64_SECTOFF_LO),
> +		REL_TYPE(R_PPC64_SECTOFF_HI),
> +		REL_TYPE(R_PPC64_SECTOFF_HA),
> +		REL_TYPE(R_PPC64_ADDR30),
> +		REL_TYPE(R_PPC64_ADDR64),
> +		REL_TYPE(R_PPC64_ADDR16_HIGHER),
> +		REL_TYPE(R_PPC64_ADDR16_HIGHERA),
> +		REL_TYPE(R_PPC64_ADDR16_HIGHEST),
> +		REL_TYPE(R_PPC64_ADDR16_HIGHESTA),
> +		REL_TYPE(R_PPC64_UADDR64),
> +		REL_TYPE(R_PPC64_REL64),
> +		REL_TYPE(R_PPC64_PLT64),
> +		REL_TYPE(R_PPC64_PLTREL64),
> +		REL_TYPE(R_PPC64_TOC16),
> +		REL_TYPE(R_PPC64_TOC16_LO),
> +		REL_TYPE(R_PPC64_TOC16_HI),
> +		REL_TYPE(R_PPC64_TOC16_HA),
> +		REL_TYPE(R_PPC64_TOC),
> +		REL_TYPE(R_PPC64_PLTGOT16),
> +		REL_TYPE(R_PPC64_PLTGOT16_LO),
> +		REL_TYPE(R_PPC64_PLTGOT16_HI),
> +		REL_TYPE(R_PPC64_PLTGOT16_HA),
> +		REL_TYPE(R_PPC64_ADDR16_DS),
> +		REL_TYPE(R_PPC64_ADDR16_LO_DS),
> +		REL_TYPE(R_PPC64_GOT16_DS),
> +		REL_TYPE(R_PPC64_GOT16_LO_DS),
> +		REL_TYPE(R_PPC64_PLT16_LO_DS),
> +		REL_TYPE(R_PPC64_SECTOFF_DS),
> +		REL_TYPE(R_PPC64_SECTOFF_LO_DS),
> +		REL_TYPE(R_PPC64_TOC16_DS),
> +		REL_TYPE(R_PPC64_TOC16_LO_DS),
> +		REL_TYPE(R_PPC64_PLTGOT16_DS),
> +		REL_TYPE(R_PPC64_PLTGOT16_LO_DS),
> +		REL_TYPE(R_PPC64_TLS),
> +		REL_TYPE(R_PPC64_DTPMOD64),
> +		REL_TYPE(R_PPC64_TPREL16),
> +		REL_TYPE(R_PPC64_TPREL16_LO),
> +		REL_TYPE(R_PPC64_TPREL16_HI),
> +		REL_TYPE(R_PPC64_TPREL16_HA),
> +		REL_TYPE(R_PPC64_TPREL64),
> +		REL_TYPE(R_PPC64_DTPREL16),
> +		REL_TYPE(R_PPC64_DTPREL16_LO),
> +		REL_TYPE(R_PPC64_DTPREL16_HI),
> +		REL_TYPE(R_PPC64_DTPREL16_HA),
> +		REL_TYPE(R_PPC64_DTPREL64),
> +		REL_TYPE(R_PPC64_GOT_TLSGD16),
> +		REL_TYPE(R_PPC64_GOT_TLSGD16_LO),
> +		REL_TYPE(R_PPC64_GOT_TLSGD16_HI),
> +		REL_TYPE(R_PPC64_GOT_TLSGD16_HA),
> +		REL_TYPE(R_PPC64_GOT_TLSLD16),
> +		REL_TYPE(R_PPC64_GOT_TLSLD16_LO),
> +		REL_TYPE(R_PPC64_GOT_TLSLD16_HI),
> +		REL_TYPE(R_PPC64_GOT_TLSLD16_HA),
> +		REL_TYPE(R_PPC64_GOT_TPREL16_DS),
> +		REL_TYPE(R_PPC64_GOT_TPREL16_LO_DS),
> +		REL_TYPE(R_PPC64_GOT_TPREL16_HI),
> +		REL_TYPE(R_PPC64_GOT_TPREL16_HA),
> +		REL_TYPE(R_PPC64_GOT_DTPREL16_DS),
> +		REL_TYPE(R_PPC64_GOT_DTPREL16_LO_DS),
> +		REL_TYPE(R_PPC64_GOT_DTPREL16_HI),
> +		REL_TYPE(R_PPC64_GOT_DTPREL16_HA),
> +		REL_TYPE(R_PPC64_TPREL16_DS),
> +		REL_TYPE(R_PPC64_TPREL16_LO_DS),
> +		REL_TYPE(R_PPC64_TPREL16_HIGHER),
> +		REL_TYPE(R_PPC64_TPREL16_HIGHERA),
> +		REL_TYPE(R_PPC64_TPREL16_HIGHEST),
> +		REL_TYPE(R_PPC64_TPREL16_HIGHESTA),
> +		REL_TYPE(R_PPC64_DTPREL16_DS),
> +		REL_TYPE(R_PPC64_DTPREL16_LO_DS),
> +		REL_TYPE(R_PPC64_DTPREL16_HIGHER),
> +		REL_TYPE(R_PPC64_DTPREL16_HIGHERA),
> +		REL_TYPE(R_PPC64_DTPREL16_HIGHEST),
> +		REL_TYPE(R_PPC64_DTPREL16_HIGHESTA),
> +		REL_TYPE(R_PPC64_TLSGD),
> +		REL_TYPE(R_PPC64_TLSLD),
> +		REL_TYPE(R_PPC64_TOCSAVE),
> +/*		REL_TYPE(R_PPC64_ENTRY), */
> +		REL_TYPE(R_PPC64_REL16),
> +		REL_TYPE(R_PPC64_REL16_LO),
> +		REL_TYPE(R_PPC64_REL16_HI),
> +		REL_TYPE(R_PPC64_REL16_HA),
> +#undef REL_TYPE
> +	};
> +	const char *name = "UNKNOWN";
> +
> +	if (type < sizeof(type_name) / sizeof(typeof(type_name[0])) && type_name[type])
> +		name = type_name[type];
> +	return name;
> +}
> +
> +static struct section *get_section(struct elf *elf, Elf_Scn *scn)
> +{
> +	struct section *section;
> +
> +	section = malloc(sizeof(struct section));
> +
> +	section->scn = scn;
> +
> +	if (gelf_getshdr(scn, &section->shdr) == NULL) {
> +		fprintf(stderr, "gelf_getshdr failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	section->name = elf_strptr(elf->elf, elf->shstrndx, section->shdr.sh_name);
> +	if (section->name == NULL) {
> +		fprintf(stderr, "gelf_strptr failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	section->data = elf_getdata(scn, NULL);
> +	if (section->data) {
> +		assert(elf_getdata(scn, section->data) == NULL);
> +	}
> +
> +	section->symtab = NULL;
> +	if (section->shdr.sh_type == SHT_SYMTAB)
> +		goto no_symtab;
> +	if (section->shdr.sh_type == SHT_DYNSYM)
> +		goto no_symtab;
> +	if (section->shdr.sh_type == SHT_DYNAMIC)
> +		goto no_symtab;
> +
> +	/* printf("symtab index:%d\n", elf_scnshndx(scn)); ??? */
> +	if (section->shdr.sh_link) {
> +		Elf_Scn *link_scn;
> +
> +		link_scn = elf_getscn(elf->elf, section->shdr.sh_link);
> +		section->symtab = get_section(elf, link_scn);
> +
> +		assert(section->symtab->shdr.sh_type == SHT_SYMTAB ||
> +			section->symtab->shdr.sh_type == SHT_DYNSYM);
> +	}
> +
> +no_symtab:
> +	section->strtab = NULL;
> +	if (section->symtab == NULL) {
> +		if (section->shdr.sh_link) {
> +			Elf_Scn *link_scn;
> +
> +			link_scn = elf_getscn(elf->elf, section->shdr.sh_link);
> +			section->strtab = get_section(elf, link_scn);
> +
> +			assert(section->strtab->shdr.sh_type == SHT_STRTAB);
> +		}
> +	}
> +
> +	return section;
> +}
> +
> +struct symbol *elf_sections_get_symbol(struct elf *elf, struct section *section, unsigned long nr)
> +{
> +	struct symbol *symbol;
> +	Elf_Scn *scn;
> +
> +	symbol = malloc(sizeof(struct symbol));
> +
> +	if (gelf_getsym(section->symtab->data, nr, &symbol->sym) == NULL) {
> +		fprintf(stderr, "gelf_getsym failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	scn = elf_getscn(elf->elf, symbol->sym.st_shndx);
> +	symbol->section = get_section(elf, scn);
> +	symbol->_name = symbol->section->name;
> +	if (symbol->sym.st_name) {
> +		symbol->name = elf_strptr(elf->elf, elf_ndxscn(section->symtab->strtab->scn), symbol->sym.st_name);
> +		symbol->_name = symbol->name;
> +	} else {
> +		symbol->name = NULL;
> +	}
> +
> +	return symbol;
> +}
> +
> +struct relocation *elf_sections_get_reloc(struct elf *elf, struct section *section, size_t n)
> +{
> +	struct relocation *relocation;
> +
> +	relocation = malloc(sizeof(struct relocation));
> +
> +	if (section->shdr.sh_type == SHT_REL) {
> +		if (gelf_getrel(section->data, n, &relocation->rel) != &relocation->rel) {
> +			return NULL;
> +		}
> +
> +		relocation->type_name = rel_type_name(GELF_R_TYPE(relocation->rel.r_info));
> +		relocation->symbol = elf_sections_get_symbol(elf, section, GELF_R_SYM(relocation->rel.r_info));
> +		relocation->offset = relocation->rel.r_offset;
> +		relocation->target = relocation->symbol->sym.st_value;
> +
> +	} else if (section->shdr.sh_type == SHT_RELA) {
> +		if (gelf_getrela(section->data, n, &relocation->rela) != &relocation->rela) {
> +			return NULL;
> +		}
> +
> +		relocation->type_name = rel_type_name(GELF_R_TYPE(relocation->rela.r_info));
> +		relocation->symbol = elf_sections_get_symbol(elf, section, GELF_R_SYM(relocation->rela.r_info));
> +		relocation->offset = relocation->rela.r_offset;
> +		relocation->target = relocation->symbol->sym.st_value;
> +		relocation->target += relocation->rela.r_addend;
> +
> +	}  else {
> +		assert(0);
> +	}
> +
> +	return relocation;
> +}
> +
> +struct elf *elf_sections_init(int fd)
> +{
> +	struct elf *elf;
> +	Elf_Scn *scn;
> +
> +	elf = malloc(sizeof(struct elf));
> +	assert(elf);
> +
> +	if (elf_version(EV_CURRENT) == EV_NONE) {
> +		fprintf(stderr, "libelf not initialized: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if ((elf->elf = elf_begin(fd, ELF_C_READ, NULL)) == NULL) {
> +		fprintf(stderr, "elf_begin failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (elf_kind(elf->elf) != ELF_K_ELF) {
> +		fprintf(stderr, "Not an ELF object.\n");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (gelf_getehdr(elf->elf, &elf->ehdr) == NULL) {
> +		fprintf(stderr, "gelf_getehdr failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (elf->ehdr.e_version != EV_CURRENT) {
> +		fprintf(stderr, "Unknown ELF version\n");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (elf->ehdr.e_machine != EM_PPC && elf->ehdr.e_machine != EM_PPC64) {
> +		fprintf(stderr, "Not a PPC/PPC64 machine\n");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (elf_getshdrstrndx(elf->elf, &elf->shstrndx) != 0) {
> +		fprintf(stderr, "elf_getshdrstrndx failed: %s\n", elf_errmsg(-1));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	scn = elf_getscn(elf->elf, elf->shstrndx);
> +	elf->strtab = get_section(elf, scn);
> +	assert(elf->strtab->shdr.sh_type == SHT_STRTAB);
> +
> +	return elf;
> +}
> +
> +void elf_sections_exit(struct elf *elf)
> +{
> +	elf_end(elf->elf);
> +}
> +
> +int elf_sections_processor(struct elf *elf,
> +				int (*fn)(struct section *section, void *arg),
> +				void *arg)
> +{
> +	Elf_Scn *scn;
> +	int err;
> +
> +	scn = NULL ;
> +	while ((scn = elf_nextscn(elf->elf, scn)) != NULL) {
> +		struct section *section;
> +
> +		section = get_section(elf, scn);
> +
> +		err = fn(section, arg);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> diff --git a/arch/powerpc/tools/relocs/elf_sections.h b/arch/powerpc/tools/relocs/elf_sections.h
> new file mode 100644
> index 000000000000..c3bc744efca8
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/elf_sections.h
> @@ -0,0 +1,50 @@
> +#ifndef __ELF_SECTIONS_H__
> +#define __ELF_SECTIONS_H__
> +
> +#include <gelf.h>
> +#include <elf.h>
> +
> +struct section {
> +	Elf_Scn *scn;
> +	GElf_Shdr shdr;
> +	const char *name;
> +	Elf_Data *data;
> +
> +	struct section *symtab;
> +	struct section *strtab;
> +};
> +
> +struct symbol {
> +	GElf_Sym sym;
> +	struct section *section;
> +	const char *name;
> +	const char *_name;
> +};
> +
> +struct relocation {
> +	GElf_Rel rel;
> +	GElf_Rela rela;
> +
> +	const char *type_name;
> +	struct symbol *symbol;
> +
> +	uint64_t offset;
> +	uint64_t target;
> +};
> +
> +struct elf {
> +	Elf *elf;
> +	GElf_Ehdr ehdr;
> +	size_t shstrndx;
> +	struct section *strtab;
> +};
> +
> +struct symbol *elf_sections_get_symbol(struct elf *elf, struct section *section, unsigned long nr);
> +struct relocation *elf_sections_get_reloc(struct elf *elf, struct section *section, size_t n);
> +struct elf *elf_sections_init(int fd);
> +void elf_sections_exit(struct elf *elf);
> +int elf_sections_processor(struct elf *elf,
> +				int (*fn)(struct section *section, void *arg),
> +				void *arg);
> +
> +#endif
> diff --git a/arch/powerpc/tools/relocs/process_relocs.c b/arch/powerpc/tools/relocs/process_relocs.c
> new file mode 100644
> index 000000000000..a678179cfd0b
> --- /dev/null
> +++ b/arch/powerpc/tools/relocs/process_relocs.c
> @@ -0,0 +1,718 @@
> +#define _GNU_SOURCE
> +#include <assert.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <gelf.h>
> +#include <elf.h>
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <getopt.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +#include <asm/byteorder.h>
> +#include "elf_sections.h"
> +#include "code-patching.h"
> +
> +/*
> + * This program runs through relocation data in PPC/PPC64 vmlinux ELF
> + * image generated with --emit-relocs, and performs some processing and
> + * checks.
> + *
> + * Presently, it has the following functions:
> + * 1. Fix relocations for branches inside alternate feature sections
> + *    (the "else" patches), so that they are correct for their destination
> + *    address. They never get executed at their linked location.
> + *
> + *    This is done by parsing all fixup_entry structures in the _ftr_fixup
> + *    sections, and keeping those with non-zero alternate patch. Then all
> + *    relocations in the .__ftr_alternates.text section are parsed, and those
> + *    matching addresses in our fixup_entry alternates patches get
> + *    struct insn_patch created for them. Finally, all struct insn_patch'es
> + *    are iterated and written to the image in-place. Care needs to be taken
> + *    with nested fixups, see check_and_flatten_fixup_entries().
> + *
> + * 2. Check that no __ex_table or __bug_table entries point to alternate
> + *    sections. We don't support that at present.
> + */
> +
> +#define dbg_printf(...)
> +
> +static int is_kernel = 0;
> +
> +struct fixup_entry_64 {
> +	uint64_t mask;
> +	uint64_t value;
> +	uint64_t start_off;
> +	uint64_t end_off;
> +	uint64_t alt_start_off;
> +	uint64_t alt_end_off;
> +} __attribute__((packed));
> +
> +#define fixup_entry fixup_entry_64
> +
> +struct fixup_entry_32 {
> +	uint32_t mask;
> +	uint32_t value;
> +	uint32_t start_off;
> +	uint32_t end_off;
> +	uint32_t alt_start_off;
> +	uint32_t alt_end_off;
> +} __attribute__((packed));
> +
> +struct exception_entry_64 {
> +	int32_t insn;
> +	int32_t fixup;
> +};
> +
> +struct exception_entry_32 {
> +	uint32_t insn;
> +	uint32_t fixup;
> +};
> +
> +struct bug_entry_64 {
> +	uint64_t bug_addr;
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +	uint64_t file;
> +	uint16_t line;
> +#endif
> +	uint16_t flags;
> +};
> +
> +struct bug_entry_32 {
> +	uint32_t bug_addr;
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +	uint32_t file;
> +	uint16_t line;
> +#endif
> +	uint16_t flags;
> +};
> +
> +struct insn_patch {
> +	uint32_t	insn;		/* New instruction */
> +	off_t		offset;		/* Image location to patch */
> +};
> +
> +static int is_64bit(struct elf *elf)
> +{
> +	return elf->ehdr.e_ident[EI_CLASS] == ELFCLASS64;
> +}
> +
> +static int is_32bit(struct elf *elf)
> +{
> +	return elf->ehdr.e_ident[EI_CLASS] == ELFCLASS32;
> +}
> +
> +static int is_le(struct elf *elf)
> +{
> +	return elf->ehdr.e_ident[EI_DATA] == ELFDATA2LSB;
> +}
> +
> +static int is_be(struct elf *elf)
> +{
> +	return elf->ehdr.e_ident[EI_DATA] == ELFDATA2MSB;
> +}
> +
> +
> +static struct elf *elf;
> +
> +static uint16_t f16_to_cpu(uint16_t val)
> +{
> +	if (is_le(elf))
> +		return __le16_to_cpu(val);
> +	else
> +		return __be16_to_cpu(val);
> +}
> +
> +static uint32_t f32_to_cpu(uint32_t val)
> +{
> +	if (is_le(elf))
> +		return __le32_to_cpu(val);
> +	else
> +		return __be32_to_cpu(val);
> +}
> +
> +static uint64_t f64_to_cpu(uint64_t val)
> +{
> +	if (is_le(elf))
> +		return __le64_to_cpu(val);
> +	else
> +		return __be64_to_cpu(val);
> +}
> +
> +static uint16_t cpu_to_f16(uint16_t val)
> +{
> +	if (is_le(elf))
> +		return __cpu_to_le16(val);
> +	else
> +		return __cpu_to_be16(val);
> +}
> +
> +static uint32_t cpu_to_f32(uint32_t val)
> +{
> +	if (is_le(elf))
> +		return __cpu_to_le32(val);
> +	else
> +		return __cpu_to_be32(val);
> +}
> +
> +static uint64_t cpu_to_f64(uint64_t val)
> +{
> +	if (is_le(elf))
> +		return __cpu_to_le64(val);
> +	else
> +		return __cpu_to_be64(val);
> +}
> +
> +static struct section *ftr_alt;
> +
> +static unsigned int nr_fes = 0;
> +static struct fixup_entry *fes = NULL;
> +
> +/* Could grab the start/end of .__ftr_alternates.text directly */
> +static uint64_t fe_alt_start = -1;
> +static uint64_t fe_alt_end = 0;
> +
> +static struct fixup_entry *find_fe_altaddr(uint64_t addr)
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
> +/*
> + * Fixup entries can be nested, so we need to find the final address. The
> + * "if" side never needs to be fixed -- if it's nested inside an "else" part,
> + * it will get fixed as part of the fixup for that else part. "else" nested
> + * in "else" needs to be fixed -- possibly multiple nestings.
> + *
> + * The inner-most nestings always come first, so we traverse the array
> + * backward, fixing up destination of nested parts according to their
> + * parent, which takes care of multiple nestings without further work.
> + *
> + * We can also do some sanity checks here.
> + */
> +static void check_and_flatten_fixup_entries(void)
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
> +			assert(!parent); /* Should be entirely contained */
> +			continue;
> +		}
> +
> +		size = fe->end_off - fe->start_off;
> +		nested_off = fe->start_off - parent->alt_start_off;
> +
> +		dbg_printf("flattening child fixup entry [%lx-%lx]->[%lx-%lx] to parent [%lx-%lx]->[%lx-%lx] new child [%lx-%lx]->[%lx-%lx]\n", fe->alt_start_off, fe->alt_end_off, fe->start_off, fe->end_off, parent->alt_start_off, parent->alt_end_off, parent->start_off, parent->end_off, fe->alt_start_off, fe->alt_end_off, parent->start_off + nested_off, parent->start_off + nested_off + size);
> +
> +		fe->start_off = parent->start_off + nested_off;
> +		fe->end_off = fe->start_off + size;
> +	}
> +
> +}
> +
> +static unsigned int nr_ips = 0;
> +static struct insn_patch *ips = NULL;
> +
> +static void create_branch_patch(struct relocation *relocation, struct fixup_entry *fe)
> +{
> +	struct insn_patch *ip;
> +	uint64_t addr = relocation->offset;
> +	uint64_t dst_addr;
> +	uint64_t scn_delta;
> +	uint64_t offset;
> +	uint32_t insn;
> +	uint32_t *i;
> +
> +	assert(addr >= ftr_alt->shdr.sh_addr &&
> +		addr < ftr_alt->shdr.sh_addr + ftr_alt->shdr.sh_size);
> +
> +	scn_delta = addr - ftr_alt->shdr.sh_addr;
> +
> +	assert(scn_delta < ftr_alt->data->d_size);
> +
> +	i = ftr_alt->data->d_buf + scn_delta;
> +
> +	insn = f32_to_cpu(*i);
> +
> +	offset = ftr_alt->shdr.sh_offset + scn_delta;
> +	dst_addr = addr - fe->alt_start_off + fe->start_off;
> +
> +	if (set_branch_target(&insn, dst_addr, relocation->target)) {
> +		fprintf(stderr, "ftr_alt branch target out of range or not a branch. address=%llx\n", (unsigned long long)addr);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (insn == *i) /* Nothing to do */
> +		return;
> +
> +	ips = realloc(ips, (nr_ips + 1) * sizeof(struct insn_patch));
> +	ip = &ips[nr_ips];
> +	nr_ips++;
> +
> +	ip->insn = insn;
> +	ip->offset = offset;
> +
> +	dbg_printf("update branch insn (%x->%x)\n", *i, ip->insn);
> +}
> +
> +static int process_alt_data(struct section *section, void *arg)
> +{
> +	if (strcmp(section->name, ".__ftr_alternates.text") != 0)
> +		return 0;
> +
> +	dbg_printf("section %-4.4jd %s\n", (uintmax_t)elf_ndxscn(section->scn), section->name);
> +	assert(section->shdr.sh_type == SHT_PROGBITS);
> +
> +	ftr_alt = section;
> +
> +	return 0;
> +}
> +
> +static int process_fixup_entries(struct section *section, void *arg)
> +{
> +	Elf_Data *data;
> +	unsigned int nr, i;
> +
> +	if (strstr(section->name, "_ftr_fixup") == 0)
> +		return 0;
> +
> +	if (section->shdr.sh_type != SHT_PROGBITS)
> +		return 0;
> +
> +	dbg_printf("section %-4.4jd %s\n", (uintmax_t)elf_ndxscn(section->scn), section->name);
> +
> +	data = section->data;
> +	assert(data);
> +	assert(data->d_size > 0);
> +
> +	if (is_64bit(elf)) {
> +		assert(data->d_size % sizeof(struct fixup_entry_64) == 0);
> +		nr = data->d_size / sizeof(struct fixup_entry_64);
> +	} else {
> +		assert(data->d_size % sizeof(struct fixup_entry_32) == 0);
> +		nr = data->d_size / sizeof(struct fixup_entry_32);
> +	}
> +
> +	for (i = 0; i < nr; i++) {
> +		struct fixup_entry *dst;
> +		unsigned long idx;
> +		unsigned long long off;
> +
> +		if (is_64bit(elf)) {
> +			struct fixup_entry_64 *src;
> +
> +			idx = i * sizeof(struct fixup_entry_64);
> +
> +			off = section->shdr.sh_addr + data->d_off + idx;
> +			src = data->d_buf + idx;
> +
> +			if (src->alt_start_off == src->alt_end_off)
> +				continue;
> +
> +			fes = realloc(fes, (nr_fes + 1) * sizeof(struct fixup_entry));
> +			dst = &fes[nr_fes];
> +			nr_fes++;
> +
> +			dst->mask = f64_to_cpu(src->mask);
> +			dst->value = f64_to_cpu(src->value);
> +			dst->start_off = f64_to_cpu(src->start_off) + off;
> +			dst->end_off = f64_to_cpu(src->end_off) + off;
> +			dst->alt_start_off = f64_to_cpu(src->alt_start_off) + off;
> +			dst->alt_end_off = f64_to_cpu(src->alt_end_off) + off;
> +
> +		} else {
> +			struct fixup_entry_32 *src;
> +
> +			idx = i * sizeof(struct fixup_entry_32);
> +
> +			off = section->shdr.sh_addr + data->d_off + idx;
> +			src = data->d_buf + idx;
> +
> +			if (src->alt_start_off == src->alt_end_off)
> +				continue;
> +
> +			fes = realloc(fes, (nr_fes + 1) * sizeof(struct fixup_entry));
> +			dst = &fes[nr_fes];
> +			nr_fes++;
> +
> +			dst->mask = f32_to_cpu(src->mask);
> +			dst->value = f32_to_cpu(src->value);
> +			dst->start_off = f32_to_cpu(src->start_off) + off;
> +			dst->end_off = f32_to_cpu(src->end_off) + off;
> +			dst->alt_start_off = f32_to_cpu(src->alt_start_off) + off;
> +			dst->alt_end_off = f32_to_cpu(src->alt_end_off) + off;
> +
> +		}
> +		if (dst->alt_start_off < fe_alt_start)
> +			fe_alt_start = dst->alt_start_off;
> +		if (dst->alt_end_off > fe_alt_end)
> +			fe_alt_end = dst->alt_end_off;
> +
> +		dbg_printf("%llx fixup entry %llx:%llx (%llx-%llx) <- (%llx-%llx)\n", off,
> +			(unsigned long long)dst->mask, (unsigned long long)dst->value,
> +			(unsigned long long)dst->start_off, (unsigned long long)dst->end_off,
> +			(unsigned long long)dst->alt_start_off, (unsigned long long)dst->alt_end_off);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Check no exceptions are in "alt" sections. We don't relocate them as
> + * yet.
> + */
> +static int process_exception_entries(struct section *section, void *arg)
> +{
> +	Elf_Data *data;
> +	unsigned int nr, i;
> +
> +	if (strcmp(section->name, "__ex_table") != 0)
> +		return 0;
> +
> +	if (section->shdr.sh_type != SHT_PROGBITS)
> +		return 0;
> +
> +	dbg_printf("section %-4.4jd %s\n", (uintmax_t)elf_ndxscn(section->scn), section->name);
> +
> +	data = section->data;
> +	assert(data);
> +	assert(data->d_size > 0);
> +
> +	if (is_64bit(elf)) {
> +		assert(data->d_size % sizeof(struct exception_entry_64) == 0);
> +		nr = data->d_size / sizeof(struct exception_entry_64);
> +	} else {
> +		assert(data->d_size % sizeof(struct exception_entry_32) == 0);
> +		nr = data->d_size / sizeof(struct exception_entry_32);
> +	}
> +
> +	for (i = 0; i < nr; i++) {
> +		unsigned long idx;
> +		uint64_t exaddr;
> +		unsigned long long off;
> +
> +		if (is_64bit(elf)) {
> +			struct exception_entry_64 *ex;
> +
> +			idx = i * sizeof(struct exception_entry_64);
> +
> +			off = section->shdr.sh_addr + data->d_off + idx;
> +
> +			ex = data->d_buf + idx;
> +
> +			exaddr = f32_to_cpu(ex->insn) + off;
> +
> +		} else {
> +			struct exception_entry_32 *ex;
> +
> +			idx = i * sizeof(struct exception_entry_32);
> +
> +			ex = data->d_buf + idx;
> +
> +			exaddr = f32_to_cpu(ex->insn);
> +		}
> +
> +		dbg_printf("exception addr:%llx\n", exaddr);
> +
> +		if (exaddr < fe_alt_start)
> +			continue;
> +		if (exaddr >= fe_alt_end)
> +			continue;
> +
> +		/*
> +		 * This would be the place to create exception address patches
> +		 * if we want to support that feature
> +		 */
> +		fprintf(stderr, "ftr_alt code contains an exception entry, which is not allowed. address=%llx\n", (unsigned long long)exaddr);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Check no exceptions are in "alt" sections. We don't relocate them as
> + * yet.
> + */
> +static int process_bug_entries(struct section *section, void *arg)
> +{
> +	Elf_Data *data;
> +	unsigned int nr, i;
> +
> +	if (strcmp(section->name, "__bug_table") != 0)
> +		return 0;
> +
> +	if (section->shdr.sh_type != SHT_PROGBITS)
> +		return 0;
> +
> +	dbg_printf("section %-4.4jd %s\n", (uintmax_t)elf_ndxscn(section->scn), section->name);
> +
> +	data = section->data;
> +	assert(data);
> +	assert(data->d_size > 0);
> +
> +	if (is_64bit(elf)) {
> +		assert(data->d_size % sizeof(struct bug_entry_64) == 0);
> +		nr = data->d_size / sizeof(struct bug_entry_64);
> +	} else {
> +		assert(data->d_size % sizeof(struct bug_entry_32) == 0);
> +		nr = data->d_size / sizeof(struct bug_entry_32);
> +	}
> +
> +	for (i = 0; i < nr; i++) {
> +		unsigned long idx;
> +		uint64_t bugaddr;
> +
> +		if (is_64bit(elf)) {
> +			struct bug_entry_64 *bug;
> +
> +			idx = i * sizeof(struct bug_entry_64);
> +
> +			bug = data->d_buf + idx;
> +
> +			bugaddr = f64_to_cpu(bug->bug_addr);
> +
> +		} else {
> +			struct bug_entry_32 *bug;
> +
> +			idx = i * sizeof(struct bug_entry_32);
> +
> +			bug = data->d_buf + idx;
> +
> +			bugaddr = f32_to_cpu(bug->bug_addr);
> +		}
> +
> +		dbg_printf("bug addr:%llx\n", bugaddr);
> +
> +		if (bugaddr < fe_alt_start)
> +			continue;
> +		if (bugaddr >= fe_alt_end)
> +			continue;
> +
> +		/*
> +		 * This would be the place to create bug address patches if
> +		 * we want to support that feature
> +		 */
> +		fprintf(stderr, "ftr_alt code contains a BUG entry, which is not allowed. address=%llx\n", (unsigned long long)bugaddr);
> +		/* Could print file, line here for verbose case */
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	return 0;
> +}
> +
> +
> +static int process_alt_relocations(struct section *section, void *arg)
> +{
> +	struct relocation *relocation;
> +	size_t n;
> +
> +	if (strcmp(section->name, ".rela.__ftr_alternates.text") != 0)
> +		return 0;
> +
> +	assert(section->shdr.sh_type == SHT_RELA);
> +
> +	dbg_printf("section %-4.4jd %s\n", (uintmax_t)elf_ndxscn(section->scn), section->name);
> +
> +	n = 0;
> +	while ((relocation = elf_sections_get_reloc(elf, section, n)) != NULL) {
> +		struct fixup_entry *fe;
> +
> +		n++;
> +
> +		dbg_printf("%llx %s %s %llx + %llx\n",
> +			(unsigned long long)relocation->offset,
> +			relocation->type_name,
> +			relocation->symbol->_name,
> +			(unsigned long long)relocation->symbol->sym.st_value,
> +			(unsigned long long)relocation->rela.r_addend);
> +
> +		fe = find_fe_altaddr(relocation->offset);
> +		if (fe) {
> +			dbg_printf("reloc has fe %llx:%llx (%llx-%llx) <- (%llx-%llx)\n",
> +				(unsigned long long)fe->mask,
> +				(unsigned long long)fe->value,
> +				(unsigned long long)fe->start_off,
> +				(unsigned long long)fe->end_off,
> +				(unsigned long long)fe->alt_start_off,
> +				(unsigned long long)fe->alt_end_off);
> +
> +			if (relocation->target >= fe->alt_start_off &&
> +				relocation->target < fe->alt_end_off) {
> +				dbg_printf("  reloc within patch code\n");
> +				continue;
> +			}
> +
> +			/*
> +			 * We really should check for all branches either side
> +			 * of fixup_entry from outside (including within
> +			 * different fixup code). It's almost guaranteed to go
> +			 * badly. Not just relocations, but branches too,
> +			 * because nearby branches might get resolved without
> +			 * a relocation.
> +			 */
> +			if (relocation->target >= ftr_alt->shdr.sh_addr &&
> +				relocation->target < ftr_alt->shdr.sh_addr +
> +						ftr_alt->shdr.sh_size) {
> +				fprintf(stderr, "ftr_alt branch target is another ftr_alt region, which is not allowed. address=%llx\n", (unsigned long long)relocation->offset);
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			/*
> +			 * Resolved module symbols should work. Unresolved
> +			 * ones would need their relocations fixed in the
> +			 * same manner as instructions are fixed.
> +			 */
> +			if (!is_kernel) {
> +				fprintf(stderr, "module code with alt feature relocations is currently not supported\n");
> +				exit(EXIT_FAILURE);
> +			}
> +
> +			create_branch_patch(relocation, fe);
> +		} else {
> +			dbg_printf("  reloc has no fe\n");
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +
> +int main(int argc, char *argv[])
> +{
> +	int fd;
> +	int err;
> +	unsigned int i;
> +	struct stat stat;
> +	void *mem;
> +	int opt;
> +
> +	if (argc != 2)
> +
> +	while ((opt = getopt(argc, argv, "k")) != -1) {
> +		switch (opt) {
> +		case 'k':
> +			is_kernel = 1;
> +			break;
> +		default:
> +			exit(EXIT_FAILURE);
> +		}
> +	}
> +
> +	if (!strcmp(argv[optind], "vmlinux"))
> +		is_kernel = 1;
> +
> +	if (optind >= argc || optind + 1 < argc)
> +		exit(EXIT_FAILURE);
> +
> +	fd = open(argv[optind], O_RDONLY, 0);
> +	if (fd == -1) {
> +		fprintf(stderr, "open %s failed: %s\n", argv[1], strerror(errno));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	elf = elf_sections_init(fd);
> +
> +	err = elf_sections_processor(elf, process_alt_data, NULL);
> +	assert(!err);
> +
> +	/* Gather and massage the fixup entries */
> +	err = elf_sections_processor(elf, process_fixup_entries, NULL);
> +	assert(!err);
> +
> +	check_and_flatten_fixup_entries();
> +
> +	/* We don't handle module relocations for these symbols as yet */
> +	if (is_kernel) {
> +		/* Sanity checking */
> +		err = elf_sections_processor(elf, process_exception_entries, NULL);
> +		assert(!err);
> +
> +		err = elf_sections_processor(elf, process_bug_entries, NULL);
> +		assert(!err);
> +	}
> +
> +	/* Check the relocations and create necessary instruction patches */
> +	err = elf_sections_processor(elf, process_alt_relocations, NULL);
> +	assert(!err);
> +
> +	/* Done with analysis phase */
> +
> +	elf_sections_exit(elf);
> +
> +	if (close(fd) == -1) {
> +		fprintf(stderr, "close %s failed: %s\n", argv[1], strerror(errno));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (!nr_ips) {
> +		dbg_printf("Nothing to do.\n");
> +		exit(EXIT_SUCCESS);
> +	}
> +
> +	/* Now apply the instruction patches by writing to the file */
> +
> +	dbg_printf("%u instructions to patch.\n", nr_ips);
> +
> +	fd = open(argv[1], O_RDWR, 0);
> +	if (fd == -1) {
> +		fprintf(stderr, "open %s failed: %s\n", argv[1], strerror(errno));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (fstat(fd, &stat) == -1) {
> +		perror("stat");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	mem = mmap(0, stat.st_size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
> +	if (mem == MAP_FAILED) {
> +		perror("mmap");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	for (i = 0; i < nr_ips; i++) {
> +		struct insn_patch *ip = &ips[i];
> +
> +		assert(ip->offset < stat.st_size);
> +		*(uint32_t *)(mem + ip->offset) = ip->insn;
> +	}
> +
> +	if (munmap(mem, stat.st_size) == -1) {
> +		perror("mmap");
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	if (close(fd) == -1) {
> +		fprintf(stderr, "close %s failed: %s\n", argv[1], strerror(errno));
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	exit(EXIT_SUCCESS);
> +}


