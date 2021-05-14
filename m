Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11033810F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 21:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhf0Y6PsYz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 05:36:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhf093qkgz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 05:36:09 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8317AB114;
 Fri, 14 May 2021 19:36:05 +0000 (UTC)
Date: Fri, 14 May 2021 21:36:03 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELFv2 ABI for big-endian
 kernels
Message-ID: <20210514193603.GJ8544@kitsune.suse.cz>
References: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
 <87eeeooxnu.fsf@igel.home> <20210503143841.GN6564@kitsune.suse.cz>
 <87tunh8jum.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tunh8jum.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, Andreas Schwab <schwab@linux-m68k.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 05, 2021 at 10:07:29PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Mon, May 03, 2021 at 01:37:57PM +0200, Andreas Schwab wrote:
> >> Should this add a tag to the module vermagic?
> >
> > Would the modues link even if the vermagic was not changed?
> 
> Most modules will require some symbols from the kernel, and those will
> be dot symbols, which won't resolve.
> 
> But there are a few small modules that don't rely on any kernel symbols,
> which can load.
> 
> > I suppose something like this might do it.
> 
> It would, but I feel like we should be handling this at the ELF level.
> ie. we don't allow loading modules with a different ELF machine type, so
> neither should we allow loading a module with the wrong ELF ABI.
> 
> And you can build the kernel without MODVERSIONS, so relying on
> MODVERSIONS still leaves a small exposure (same kernel version
> with/without ELFv2).
> 
> I don't see an existing hook that would do what we want. There's
> elf_check_arch(), but that also applies to userspace binaries, which is
> not what we want.
> 
> Maybe something like below.

The below patch works for me.

Tested-by: Michal Suchánek <msuchanek@suse.de>

Built a Hello World module for both v1 and v2 ABI, and kernels built
with v1 and v2 ABI rejected module with the other ABI.

[  100.602943] Module has invalid ELF structures
insmod: ERROR: could not insert module moin_v1.ko: Invalid module format

Thanks

Michal
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
> index 857d9ff24295..d0e9368982d8 100644
> --- a/arch/powerpc/include/asm/module.h
> +++ b/arch/powerpc/include/asm/module.h
> @@ -83,5 +83,28 @@ static inline int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sec
>  }
>  #endif
>  
> +#ifdef CONFIG_PPC64
> +static inline bool elf_check_module_arch(Elf_Ehdr *hdr)
> +{
> +	unsigned long flags;
> +
> +	if (!elf_check_arch(hdr))
> +		return false;
> +
> +	flags = hdr->e_flags & 0x3;
> +
> +#ifdef CONFIG_PPC64_BUILD_ELF_V2_ABI
> +	if (flags == 2)
> +		return true;
> +#else
> +	if (flags < 2)
> +		return true;
> +#endif
> +	return false;
> +}
> +
> +#define elf_check_module_arch elf_check_module_arch
> +#endif /* CONFIG_PPC64 */
> +
>  #endif /* __KERNEL__ */
>  #endif	/* _ASM_POWERPC_MODULE_H */
> diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> index 9e09d11ffe5b..fdc042a84562 100644
> --- a/include/linux/moduleloader.h
> +++ b/include/linux/moduleloader.h
> @@ -13,6 +13,11 @@
>   * must be implemented by each architecture.
>   */
>  
> +// Allow arch to optionally do additional checking of module ELF header
> +#ifndef elf_check_module_arch
> +#define elf_check_module_arch elf_check_arch
> +#endif
> +
>  /* Adjust arch-specific sections.  Return 0 on success.  */
>  int module_frob_arch_sections(Elf_Ehdr *hdr,
>  			      Elf_Shdr *sechdrs,
> diff --git a/kernel/module.c b/kernel/module.c
> index b5dd92e35b02..c71889107226 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2941,7 +2941,7 @@ static int elf_validity_check(struct load_info *info)
>  
>  	if (memcmp(info->hdr->e_ident, ELFMAG, SELFMAG) != 0
>  	    || info->hdr->e_type != ET_REL
> -	    || !elf_check_arch(info->hdr)
> +	    || !elf_check_module_arch(info->hdr)
>  	    || info->hdr->e_shentsize != sizeof(Elf_Shdr))
>  		return -ENOEXEC;
>  
