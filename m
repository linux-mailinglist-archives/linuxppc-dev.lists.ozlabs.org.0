Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77D62FA2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 17:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDMZM17Hbz3f2p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 03:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sDm8w6n6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sDm8w6n6;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDMYN62Xlz3cKD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 03:24:07 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id E63131FD42;
	Fri, 18 Nov 2022 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668788644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qr94mBts7Tg7djDvAk8xY0jbfoze+lyUFDJ0niaddco=;
	b=sDm8w6n6FIXPkYgQQi+mur1gToC1gsnY6I7eXu1vTz+HfSNpRGAGCcBL8bqGb0I75oSX89
	R5NuXjrwHvY+n0u8pH+3j08iTJlbMG5cPc6viYx14SdhghLIeewt2Hys5IexxBuAMRkawM
	nVK7Uxa+T0Onbjgz1Cqp6+9xqutZ8VY=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 7B3D32C141;
	Fri, 18 Nov 2022 16:24:04 +0000 (UTC)
Date: Fri, 18 Nov 2022 17:24:04 +0100
From: Petr Mladek <pmladek@suse.com>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
Message-ID: <Y3expGRt4cPoZgHL@alley>
References: <20220901171252.2148348-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901171252.2148348-1-song@kernel.org>
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2022-09-01 10:12:52, Song Liu wrote:
> From: Miroslav Benes <mbenes@suse.cz>
> 
> Josh reported a bug:
> 
>   When the object to be patched is a module, and that module is
>   rmmod'ed and reloaded, it fails to load with:
> 
>   module: x86/modules: Skipping invalid relocation target, existing value is nonzero for type 2, loc 00000000ba0302e9, val ffffffffa03e293c
>   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
>   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> 
>   The livepatch module has a relocation which references a symbol
>   in the _previous_ loading of nfsd. When apply_relocate_add()
>   tries to replace the old relocation with a new one, it sees that
>   the previous one is nonzero and it errors out.
> 
> We thus decided to reverse the relocation patching (clear all relocation
> targets on x86_64). The solution is not
> universal and is too much arch-specific, but it may prove to be simpler
> in the end.
>
>  arch/powerpc/kernel/module_32.c |  10 ++++
>  arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
>  arch/s390/kernel/module.c       |   8 +++
>  arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
>  include/linux/moduleloader.h    |   7 +++
>  kernel/livepatch/core.c         |  41 ++++++++++++-

First, thanks a lot for working on this.

I can't check or test the powerpc and s390 code easily.

I am going to comment only x86 and generic code. It looks good
but it needs some changes to improve maintainability.

>  6 files changed, 189 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
> index ea6536171778..e3c312770453 100644
> --- a/arch/powerpc/kernel/module_32.c
> +++ b/arch/powerpc/kernel/module_32.c
> @@ -285,6 +285,16 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_LIVEPATCH
> +void clear_relocate_add(Elf32_Shdr *sechdrs,
> +		   const char *strtab,
> +		   unsigned int symindex,
> +		   unsigned int relsec,
> +		   struct module *me)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  notrace int module_trampoline_target(struct module *mod, unsigned long addr,
>  				     unsigned long *target)
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 7e45dc98df8a..514951f97391 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -739,6 +739,55 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_LIVEPATCH
> +void clear_relocate_add(Elf64_Shdr *sechdrs,
> +		       const char *strtab,
> +		       unsigned int symindex,
> +		       unsigned int relsec,
> +		       struct module *me)
> +{
> +	unsigned int i;
> +	Elf64_Rela *rela = (void *)sechdrs[relsec].sh_addr;
> +	Elf64_Sym *sym;
> +	unsigned long *location;
> +	const char *symname;
> +	u32 *instruction;
> +
> +	pr_debug("Clearing ADD relocate section %u to %u\n", relsec,
> +		 sechdrs[relsec].sh_info);
> +
> +	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
> +		location = (void *)sechdrs[sechdrs[relsec].sh_info].sh_addr
> +			+ rela[i].r_offset;
> +		sym = (Elf64_Sym *)sechdrs[symindex].sh_addr
> +			+ ELF64_R_SYM(rela[i].r_info);
> +		symname = me->core_kallsyms.strtab
> +			+ sym->st_name;
> +
> +		if (ELF64_R_TYPE(rela[i].r_info) != R_PPC_REL24)
> +			continue;
> +		/*
> +		 * reverse the operations in apply_relocate_add() for case
> +		 * R_PPC_REL24.
> +		 */
> +		if (sym->st_shndx != SHN_UNDEF &&
> +		    sym->st_shndx != SHN_LIVEPATCH)
> +			continue;
> +
> +		instruction = (u32 *)location;
> +		if (is_mprofile_ftrace_call(symname))
> +			continue;
> +
> +		if (!instr_is_relative_link_branch(ppc_inst(*instruction)))
> +			continue;
> +
> +		instruction += 1;
> +		patch_instruction(instruction, ppc_inst(PPC_RAW_NOP()));
> +	}
> +
> +}

This looks like a lot of duplicated code. Isn't it?

> +#endif
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  int module_trampoline_target(struct module *mod, unsigned long addr,
>  			     unsigned long *target)
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -128,18 +128,20 @@ int apply_relocate(Elf32_Shdr *sechdrs,
>  	return 0;
>  }
>  #else /*X86_64*/
> -static int __apply_relocate_add(Elf64_Shdr *sechdrs,
> +static int __apply_clear_relocate_add(Elf64_Shdr *sechdrs,

Nit: Honestly, the combination of 4 verbs: "apply", "clear, "relocate", and "add"
     is really crazy. It is far from obvious what the function does.

     The name was not ideal even before. Let's not make it worse and
     use on 3 verbs again.

     What about __update_relocate_add or __write_relocate_add()?

     Note that the "__" prefix is still needed, see below.


>  		   const char *strtab,
>  		   unsigned int symindex,
>  		   unsigned int relsec,
>  		   struct module *me,
> -		   void *(*write)(void *dest, const void *src, size_t len))
> +		   void *(*write)(void *dest, const void *src, size_t len),
> +		   bool clear)
>  {
>  	unsigned int i;
>  	Elf64_Rela *rel = (void *)sechdrs[relsec].sh_addr;
>  	Elf64_Sym *sym;
>  	void *loc;
>  	u64 val;
> +	u64 zero = 0ULL;
>  
>  	DEBUGP("Applying relocate section %u to %u\n",
>  	       relsec, sechdrs[relsec].sh_info);
> @@ -163,40 +165,60 @@ static int __apply_relocate_add(Elf64_Shdr *sechdrs,
>  		case R_X86_64_NONE:
>  			break;
>  		case R_X86_64_64:
> -			if (*(u64 *)loc != 0)
> -				goto invalid_relocation;
> -			write(loc, &val, 8);
> +			if (!clear) {

Nit: I would prefer to use positive check when both if/else branches
     are used. I would call the parameter "apply".

> +				if (*(u64 *)loc != 0)
> +					goto invalid_relocation;
> +				write(loc, &val, 8);
> +			} else {
> +				write(loc, &zero, 8);
> +			}
>  			break;
>  		case R_X86_64_32:
> -			if (*(u32 *)loc != 0)
> -				goto invalid_relocation;
> -			write(loc, &val, 4);
> -			if (val != *(u32 *)loc)
> -				goto overflow;
> +			if (!clear) {
> +				if (*(u32 *)loc != 0)
> +					goto invalid_relocation;
> +				write(loc, &val, 4);
> +				if (val != *(u32 *)loc)
> +					goto overflow;
> +			} else {
> +				write(loc, &zero, 4);
> +			}
>  			break;
>  		case R_X86_64_32S:
> -			if (*(s32 *)loc != 0)
> -				goto invalid_relocation;
> -			write(loc, &val, 4);
> -			if ((s64)val != *(s32 *)loc)
> -				goto overflow;
> +			if (!clear) {
> +				if (*(s32 *)loc != 0)
> +					goto invalid_relocation;
> +				write(loc, &val, 4);
> +				if ((s64)val != *(s32 *)loc)
> +					goto overflow;
> +			} else {
> +				write(loc, &zero, 4);
> +			}
>  			break;
>  		case R_X86_64_PC32:
>  		case R_X86_64_PLT32:
> -			if (*(u32 *)loc != 0)
> -				goto invalid_relocation;
> -			val -= (u64)loc;
> -			write(loc, &val, 4);
> +			if (!clear) {
> +				if (*(u32 *)loc != 0)
> +					goto invalid_relocation;
> +				val -= (u64)loc;
> +				write(loc, &val, 4);
>  #if 0
> -			if ((s64)val != *(s32 *)loc)
> -				goto overflow;
> +				if ((s64)val != *(s32 *)loc)
> +					goto overflow;
>  #endif
> +			} else {
> +				write(loc, &zero, 4);
> +			}
>  			break;
>  		case R_X86_64_PC64:
> -			if (*(u64 *)loc != 0)
> -				goto invalid_relocation;
> -			val -= (u64)loc;
> -			write(loc, &val, 8);
> +			if (!clear) {
> +				if (*(u64 *)loc != 0)
> +					goto invalid_relocation;
> +				val -= (u64)loc;
> +				write(loc, &val, 8);
> +			} else {
> +				write(loc, &zero, 8);
> +			}
>  			break;
>  		default:
>  			pr_err("%s: Unknown rela relocation: %llu\n",
> @@ -245,6 +267,32 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_LIVEPATCH
> +
> +void clear_relocate_add(Elf64_Shdr *sechdrs,
> +			const char *strtab,
> +			unsigned int symindex,
> +			unsigned int relsec,
> +			struct module *me)
> +{
> +	bool early = me->state == MODULE_STATE_UNFORMED;
> +	void *(*write)(void *, const void *, size_t) = memcpy;
> +
> +	if (!early) {
> +		write = text_poke;
> +		mutex_lock(&text_mutex);
> +	}
> +
> +	__apply_clear_relocate_add(sechdrs, strtab, symindex, relsec, me,
> +				   write, true /* clear */);
> +
> +	if (!early) {
> +		text_poke_sync();
> +		mutex_unlock(&text_mutex);
> +	}
> +}

This duplicates a lot of code. Please, rename apply_relocate_add() the
same way as __apply_clear_relocate_add() and add the "apply" parameter.
Then add the wrappers for this:

int write_relocate_add(Elf64_Shdr *sechdrs,
		       const char *strtab,
		       unsigned int symindex,
		       unsigned int relsec,
		       struct module *me,
		       bool apply)
{
	int ret;
	bool early = me->state == MODULE_STATE_UNFORMED;
	void *(*write)(void *, const void *, size_t) = memcpy;

	if (!early) {
		write = text_poke;
		mutex_lock(&text_mutex);
	}

	ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
					 write, apply);

	if (!early) {
		text_poke_sync();
		mutex_unlock(&text_mutex);
	}

	return ret;
}

int apply_relocate_add(Elf64_Shdr *sechdrs,
		       const char *strtab,
		       unsigned int symindex,
		       unsigned int relsec,
		       struct module *me)
{
	return write_relocate_add(sechdrs, strtab, symindex, relsec, me, true);
}

#ifdef CONFIG_LIVEPATCH
void apply_relocate_add(Elf64_Shdr *sechdrs,
			const char *strtab,
			unsigned int symindex,
			unsigned int relsec,
			struct module *me)
{
	write_relocate_add(sechdrs, strtab, symindex, relsec, me, false);
}
#endif


> +#endif
> +
>  #endif
>  
>  int module_finalize(const Elf_Ehdr *hdr,
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -316,6 +316,45 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
>  	return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
>  }
>  
> +static void klp_clear_object_relocations(struct module *pmod,
> +					struct klp_object *obj)
> +{
> +	int i, cnt;
> +	const char *objname, *secname;
> +	char sec_objname[MODULE_NAME_LEN];
> +	Elf_Shdr *sec;
> +
> +	objname = klp_is_module(obj) ? obj->name : "vmlinux";
> +
> +	/* For each klp relocation section */
> +	for (i = 1; i < pmod->klp_info->hdr.e_shnum; i++) {
> +		sec = pmod->klp_info->sechdrs + i;
> +		secname = pmod->klp_info->secstrings + sec->sh_name;
> +		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
> +			continue;
> +
> +		/*
> +		 * Format: .klp.rela.sec_objname.section_name
> +		 * See comment in klp_resolve_symbols() for an explanation
> +		 * of the selected field width value.
> +		 */
> +		secname = pmod->klp_info->secstrings + sec->sh_name;
> +		cnt = sscanf(secname, ".klp.rela.%55[^.]", sec_objname);
> +		if (cnt != 1) {
> +			pr_err("section %s has an incorrectly formatted name\n",
> +			       secname);
> +			continue;
> +		}
> +
> +		if (strcmp(objname, sec_objname))
> +			continue;
> +
> +		clear_relocate_add(pmod->klp_info->sechdrs,
> +				   pmod->core_kallsyms.strtab,
> +				   pmod->klp_info->symndx, i, pmod);
> +	}
> +}

Huh, this duplicates a lot of tricky code.

It is even worse because this squashed code from two functions
klp_apply_section_relocs() and klp_apply_object_relocs()
into a single function. As a result, the code duplication is not
even obvious.

Also the suffix "_reloacations() does not match the suffix of
the related funciton:

	+ klp_apply_object_relocs()		(existing)
	+ klp_clear_object_relocations()        (new)

This all would complicate maintenance of the code.

Please, implement a common:

int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
			     const char *shstrtab, const char *strtab,
			     unsigned int symndx, unsigned int secndx,
			     const char *objname, bool apply);

and

int klp_write_object_relocs(struct klp_patch *patch,
			    struct klp_object *obj,
			    bool apply);

and add the respective wrappers:

int klp_apply_section_relocs();   /* also needed in module/main.c */
int klp_apply_object_relocs();
void klp_clear_object_relocs();

Best Regards,
Petr
