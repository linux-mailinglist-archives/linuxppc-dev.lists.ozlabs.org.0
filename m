Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C635A86DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 21:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHvdT3hkhz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 05:39:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOn5BRs/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOn5BRs/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOn5BRs/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DOn5BRs/;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHvch2P8fz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 05:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661974736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lREOL0jn8+3wIguOMEziWX7BLVYoUbjnyP2AozKdPP8=;
	b=DOn5BRs/8yUVbr2mQ5M1c/dej7XasgR2NsB0XGaxPO7ldI6h4/qwHznFBeuw7UzjEPMjtK
	XsfuFUZgVLQkijTzn8NZo52e21pqef5UOem9mMCe9Pr3hCB7RCjZBTxz9s9lx4Xt7XDY4a
	qc943iXY7MYCAS2pNxFmgai+PvVVT10=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661974736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lREOL0jn8+3wIguOMEziWX7BLVYoUbjnyP2AozKdPP8=;
	b=DOn5BRs/8yUVbr2mQ5M1c/dej7XasgR2NsB0XGaxPO7ldI6h4/qwHznFBeuw7UzjEPMjtK
	XsfuFUZgVLQkijTzn8NZo52e21pqef5UOem9mMCe9Pr3hCB7RCjZBTxz9s9lx4Xt7XDY4a
	qc943iXY7MYCAS2pNxFmgai+PvVVT10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-E4FlSP9LNb6KAhJasQ_8nA-1; Wed, 31 Aug 2022 15:38:50 -0400
X-MC-Unique: E4FlSP9LNb6KAhJasQ_8nA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4E68811E87;
	Wed, 31 Aug 2022 19:38:49 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.220])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F96D2166B2A;
	Wed, 31 Aug 2022 19:38:49 +0000 (UTC)
Date: Wed, 31 Aug 2022 15:38:47 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v5] livepatch: Clear relocation targets on a module
 removal
Message-ID: <Yw+4xxiONngOTqin@redhat.com>
References: <20220830185313.76402-1-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830185313.76402-1-song@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: pmladek@suse.com, x86@kernel.org, jikos@kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 11:53:13AM -0700, Song Liu wrote:
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
>   On ppc64le, we have a similar issue:
> 
>   module_64: livepatch_nfsd: Expected nop after call, got e8410018 at e_show+0x60/0x548 [livepatch_nfsd]
>   livepatch: failed to initialize patch 'livepatch_nfsd' for module 'nfsd' (-8)
>   livepatch: patch 'livepatch_nfsd' failed for module 'nfsd', refusing to load module 'nfsd'
> 
> He also proposed three different solutions. We could remove the error
> check in apply_relocate_add() introduced by commit eda9cec4c9a1
> ("x86/module: Detect and skip invalid relocations"). However the check
> is useful for detecting corrupted modules.
> 
> We could also deny the patched modules to be removed. If it proved to be
> a major drawback for users, we could still implement a different
> approach. The solution would also complicate the existing code a lot.
> 
> We thus decided to reverse the relocation patching (clear all relocation
> targets on x86_64). The solution is not
> universal and is too much arch-specific, but it may prove to be simpler
> in the end.
> 
> Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> Signed-off-by: Song Liu <song@kernel.org>
> 
> ---
> 
> NOTE: powerpc code has not be tested.
> 
> Changes v4 = v5:
> 1. Fix compile with powerpc.
> 
> Changes v3 = v4:
> 1. Reuse __apply_relocate_add to make it more reliable in long term.
>    (Josh Poimboeuf)
> 2. Add back ppc64 logic from v2, with changes to match current code.
>    (Josh Poimboeuf)
> 
> Changes v2 => v3:
> 1. Rewrite x86 changes to match current code style.
> 2. Remove powerpc changes as there is no test coverage in v3.
> 3. Only keep 1/3 of v2.
> 
> v2: https://lore.kernel.org/all/20190905124514.8944-1-mbenes@suse.cz/T/#u
> ---
>  arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
>  arch/s390/kernel/module.c       |   8 +++
>  arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
>  include/linux/moduleloader.h    |   7 +++
>  kernel/livepatch/core.c         |  41 ++++++++++++-
>  5 files changed, 179 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 7e45dc98df8a..6aaf5720070d 100644
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
> +		*instruction = PPC_RAW_NOP();
> +	}
> +
> +}
> +#endif
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  int module_trampoline_target(struct module *mod, unsigned long addr,
>  			     unsigned long *target)
> diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> index 2d159b32885b..cc6784fbc1ac 100644
> --- a/arch/s390/kernel/module.c
> +++ b/arch/s390/kernel/module.c
> @@ -500,6 +500,14 @@ static int module_alloc_ftrace_hotpatch_trampolines(struct module *me,
>  }
>  #endif /* CONFIG_FUNCTION_TRACER */
>  
> +#ifdef CONFIG_LIVEPATCH
> +void clear_relocate_add(Elf64_Shdr *sechdrs, const char *strtab,
> +			unsigned int symindex, unsigned int relsec,
> +			struct module *me)
> +{
> +}
> +#endif
> +
>  int module_finalize(const Elf_Ehdr *hdr,
>  		    const Elf_Shdr *sechdrs,
>  		    struct module *me)
> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> index b1abf663417c..f9632afbb84c 100644
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -128,18 +128,20 @@ int apply_relocate(Elf32_Shdr *sechdrs,
>  	return 0;
>  }
>  #else /*X86_64*/
> -static int __apply_relocate_add(Elf64_Shdr *sechdrs,
> +static int __apply_clear_relocate_add(Elf64_Shdr *sechdrs,
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
> @@ -234,8 +256,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>  		mutex_lock(&text_mutex);
>  	}
>  
> -	ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
> -				   write);
> +	ret = __apply_clear_relocate_add(sechdrs, strtab, symindex, relsec, me,
> +					 write, false /* clear */);
>  
>  	if (!early) {
>  		text_poke_sync();
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
> +#endif
> +
>  #endif
>  
>  int module_finalize(const Elf_Ehdr *hdr,
> diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> index 9e09d11ffe5b..d22b36b84b4b 100644
> --- a/include/linux/moduleloader.h
> +++ b/include/linux/moduleloader.h
> @@ -72,6 +72,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
>  		       unsigned int symindex,
>  		       unsigned int relsec,
>  		       struct module *mod);
> +#ifdef CONFIG_LIVEPATCH
> +void clear_relocate_add(Elf64_Shdr *sechdrs,
> +		   const char *strtab,
> +		   unsigned int symindex,
> +		   unsigned int relsec,
> +		   struct module *me);
> +#endif
>  #else
>  static inline int apply_relocate_add(Elf_Shdr *sechdrs,
>  				     const char *strtab,
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index bc475e62279d..5c0d8a4eba13 100644
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
> +
>  /*
>   * Sysfs Interface
>   *
> @@ -1154,7 +1193,7 @@ static void klp_cleanup_module_patches_limited(struct module *mod,
>  			klp_unpatch_object(obj);
>  
>  			klp_post_unpatch_callback(obj);
> -
> +			klp_clear_object_relocations(patch->mod, obj);
>  			klp_free_object_loaded(obj);
>  			break;
>  		}
> -- 
> 2.30.2
> 

Hi Song,

Applying your patch on top of my latest klp-convert-tree branch [1], I
modified a few of its late module patching tests
(tools/testing/selftests/livepatch/test-song.sh) such that:

 1 - A livepatch module is loaded
   - this module contains klp-relocations to objects in (2)
 2 - A target test module is loaded
 3 - Unload the test target module
   - Clear klp-relocations in (1)
 4 - Repeat target module load (2) / unload (3) a few times
 5 - Unload livepatch module

The results:

 x86_64  : pass
 s390x   : pass
 ppc64le : crash

I suspect Power 32-bit would suffer the same fate, but I don't have
hardware to verify.  See the kernel log from the crash below...


===== TEST: klp-convert symbols (late module patching) =====
% modprobe test_klp_convert1
test_klp_convert1: tainting kernel with TAINT_LIVEPATCH
livepatch: enabling patch 'test_klp_convert1'
livepatch: 'test_klp_convert1': starting patching transition
livepatch: 'test_klp_convert1': patching complete
% modprobe test_klp_convert_mod
livepatch: applying patch 'test_klp_convert1' to loading module 'test_klp_convert_mod'
test_klp_convert1: saved_command_line, 0: BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000003/disk@8100000000000000,msdos2)/vmlinuz-5.19.0+ root=/dev/mapper/rhel_ibm--p9z--18--lp7-root ro crashkernel=2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G rd.lvm.lv=rhel_ibm-p9z-18-lp7/root rd.lvm.lv=rhel_ibm-p9z-18-lp7/swap
test_klp_convert1: driver_name, 0: test_klp_convert_mod
test_klp_convert1: test_klp_get_driver_name(), 0: test_klp_convert_mod
test_klp_convert1: homonym_string, 1: homonym string A
test_klp_convert1: get_homonym_string(), 1: homonym string A
test_klp_convert1: klp_string.12345 = lib/livepatch/test_klp_convert_mod_a.c static string
test_klp_convert1: klp_string.67890 = lib/livepatch/test_klp_convert_mod_b.c static string
% rmmod test_klp_convert_mod
livepatch: reverting patch 'test_klp_convert1' on unloading module 'test_klp_convert_mod'
module_64: Clearing ADD relocate section 48 to 6
BUG: Unable to handle kernel data access on write at 0xc008000002140150
Faulting instruction address: 0xc00000000005659c
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in: test_klp_convert_mod(-) test_klp_convert1(K) bonding tls rfkill pseries_rng drm fuse drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto dm_mirror dm_region_hash dm_log dm_mod
CPU: 6 PID: 4766 Comm: rmmod Kdump: loaded Tainted: G              K   5.19.0+ #1
NIP:  c00000000005659c LR: c000000000056590 CTR: 0000000000000024
REGS: c000000007223840 TRAP: 0300   Tainted: G              K    (5.19.0+)
MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48008282  XER: 0000000a
CFAR: c0000000000a87e0 DAR: c008000002140150 DSISR: 0a000000 IRQMASK: 0 
GPR00: c000000000056568 c000000007223ae0 c000000002a68a00 0000000000000001 
GPR04: c0080000021706f0 000000000000002d 0000000000000000 0000000000000000 
GPR08: 0000000000000066 0000001200000010 0000000000000000 0000000000008000 
GPR12: 0000000000000000 c00000000ffca080 0000000000000000 0000000000000000 
GPR16: 0000010005bf1810 000000010c0f7370 c0000000011b7e50 c0000000011b7e68 
GPR20: c0080000021501c8 c008000002150228 0000000000000030 0000000060000000 
GPR24: c008000002160380 c000000056b43000 000000000000ff20 c000000056b43c00 
GPR28: aaaaaaaaaaaaaaab c000000056b43b40 0000000000000000 c00800000214014c 
NIP [c00000000005659c] clear_relocate_add+0x11c/0x1c0
LR [c000000000056590] clear_relocate_add+0x110/0x1c0
Call Trace:
[c000000007223ae0] [ffffffffffffffff] 0xffffffffffffffff (unreliable)
[c000000007223ba0] [c00000000021e3a8] klp_cleanup_module_patches_limited+0x448/0x480
[c000000007223cb0] [c000000000220278] klp_module_going+0x68/0x94
[c000000007223ce0] [c00000000022f480] __do_sys_delete_module.constprop.0+0x1d0/0x390
[c000000007223db0] [c00000000002f004] system_call_exception+0x164/0x340
[c000000007223e10] [c00000000000be68] system_call_vectored_common+0xe8/0x278
--- interrupt: 3000 at 0x7fffa178fb6c
NIP:  00007fffa178fb6c LR: 0000000000000000 CTR: 0000000000000000
REGS: c000000007223e80 TRAP: 3000   Tainted: G              K    (5.19.0+)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48002482  XER: 00000000
IRQMASK: 0 
GPR00: 0000000000000081 00007ffff2d1b720 00007fffa1887200 0000010005bf1878 
GPR04: 0000000000000800 000000000000000a 0000000000000000 00000000000000da 
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR12: 0000000000000000 00007fffa201c540 0000000000000000 0000000000000000 
GPR16: 0000010005bf1810 000000010c0f7370 000000010c0f8090 000000010c0f8078 
GPR20: 000000010c0f8050 000000010c0f80a8 000000010c0f7518 000000010c0f80d0 
GPR24: 00007ffff2d1b830 00007ffff2d1efbb 0000000000000000 0000010005bf02a0 
GPR28: 00007ffff2d1be50 0000000000000000 0000010005bf1810 0000000000100000 
NIP [00007fffa178fb6c] 0x7fffa178fb6c
LR [0000000000000000] 0x0
--- interrupt: 3000
Instruction dump:
40820044 813b002c 7ff5f82a 79293664 7d394a14 e9290010 7c69f82e 7fe9fa14 
48052235 60000000 2c030000 41820008 <92ff0004> eadb0020 60000000 60000000 
---[ end trace 0000000000000000 ]---

$ addr2line 0xc00000000005659c -e vmlinux
/root/klp-convert-tree/arch/powerpc/kernel/module_64.c:785

743 void clear_relocate_add(Elf64_Shdr *sechdrs,
744                        const char *strtab,
745                        unsigned int symindex,
746                        unsigned int relsec,
747                        struct module *me)
748 {
...
759         for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rela); i++) {
...
785                 *instruction = PPC_RAW_NOP();
786         }

$ readelf --wide --sections test_klp_convert1.ko | grep -e '\[ 6\]' -e '\[48\]'
[ 6]  .text.unlikely                                 PROGBITS  0000000000000000  0001b8  0001cc  00  AX  0   0  4
[48]  .klp.rela.test_klp_convert_mod..text.unlikely  RELA      0000000000000000  041358  000030  18  Ao  45  6  8

$ readelf --wide --relocs test_klp_convert1.ko
...
Relocation section '.klp.rela.test_klp_convert_mod..text.unlikely' at offset 0x41358 contains 2 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
00000000000000f0  000000490000000a R_PPC64_REL24          0000000000000000 .klp.sym.test_klp_convert_mod.test_klp_get_driver_name,0 + 0
0000000000000158  000000450000000a R_PPC64_REL24          0000000000000000 .klp.sym.test_klp_convert_mod.get_homonym_string,1 + 0


PS - I will be OOTO for a few weeks in Sept

[1] https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v7-devel+song

-- Joe

