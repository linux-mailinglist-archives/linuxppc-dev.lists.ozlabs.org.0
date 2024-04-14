Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF58A40EB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 09:28:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSn3bFIT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHMNn1JkQz3vZd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 17:28:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSn3bFIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHMN502T9z3cHN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 17:28:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AE1B6091C;
	Sun, 14 Apr 2024 07:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759F8C072AA;
	Sun, 14 Apr 2024 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713079682;
	bh=7UcAoz/SHZJ9dQ0bgxdPwC8jDXsqkfxw4nZlv0SLw5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSn3bFITK7eYlJdTFbScch0ThBeU+CtfVZynIF2TKYAjwpfIWpT9mvprRtl/vRdi+
	 PWs0IudDlFW6Beno7xjDAiW1ip7pL/FGhEaTkCamfUxQ5eDkHTs4QkNm97zhVJccwv
	 UxX9+hkJgUV7GSohwVI620vdp0JYtwTWKKysZvcjBk9t6kUNPFg5Eeatgn84u8vivs
	 7On6vy8KLlD97z5wp8DI0bLXFhxIaSTkHjS//iWFuOPg7CQ+rJyeDYDISTJa6W6AFc
	 TXNbcHaOhhepqyuh8BUKoPaV89wZMsoGzWH9gtBjUYYSDb1AqF+wsfY3ZeQjYF2dQ5
	 tmillpYns8epg==
Date: Sun, 14 Apr 2024 10:26:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 06/15] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <ZhuFNyaZcfOrp7Cl@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-7-rppt@kernel.org>
 <20240411205346.GA66667@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411205346.GA66667@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev
 >, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 10:53:46PM +0200, Sam Ravnborg wrote:
> Hi Mike.
> 
> On Thu, Apr 11, 2024 at 07:00:42PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > Several architectures override module_alloc() only to define address
> > range for code allocations different than VMALLOC address space.
> > 
> > Provide a generic implementation in execmem that uses the parameters for
> > address space ranges, required alignment and page protections provided
> > by architectures.
> > 
> > The architectures must fill execmem_info structure and implement
> > execmem_arch_setup() that returns a pointer to that structure. This way the
> > execmem initialization won't be called from every architecture, but rather
> > from a central place, namely a core_initcall() in execmem.
> > 
> > The execmem provides execmem_alloc() API that wraps __vmalloc_node_range()
> > with the parameters defined by the architectures.  If an architecture does
> > not implement execmem_arch_setup(), execmem_alloc() will fall back to
> > module_alloc().
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> 
> This code snippet could be more readable ...
> > diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
> > index 66c45a2764bc..b70047f944cc 100644
> > --- a/arch/sparc/kernel/module.c
> > +++ b/arch/sparc/kernel/module.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/string.h>
> >  #include <linux/ctype.h>
> >  #include <linux/mm.h>
> > +#include <linux/execmem.h>
> >  
> >  #include <asm/processor.h>
> >  #include <asm/spitfire.h>
> > @@ -21,34 +22,26 @@
> >  
> >  #include "entry.h"
> >  
> > +static struct execmem_info execmem_info __ro_after_init = {
> > +	.ranges = {
> > +		[EXECMEM_DEFAULT] = {
> >  #ifdef CONFIG_SPARC64
> > -
> > -#include <linux/jump_label.h>
> > -
> > -static void *module_map(unsigned long size)
> > -{
> > -	if (PAGE_ALIGN(size) > MODULES_LEN)
> > -		return NULL;
> > -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> > -				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> > -				__builtin_return_address(0));
> > -}
> > +			.start = MODULES_VADDR,
> > +			.end = MODULES_END,
> >  #else
> > -static void *module_map(unsigned long size)
> > +			.start = VMALLOC_START,
> > +			.end = VMALLOC_END,
> > +#endif
> > +			.alignment = 1,
> > +		},
> > +	},
> > +};
> > +
> > +struct execmem_info __init *execmem_arch_setup(void)
> >  {
> > -	return vmalloc(size);
> > -}
> > -#endif /* CONFIG_SPARC64 */
> > -
> > -void *module_alloc(unsigned long size)
> > -{
> > -	void *ret;
> > -
> > -	ret = module_map(size);
> > -	if (ret)
> > -		memset(ret, 0, size);
> > +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
> >  
> > -	return ret;
> > +	return &execmem_info;
> >  }
> >  
> >  /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
> 
> ... if the following was added:
> 
> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
> index 9e85d57ac3f2..62bcafe38b1f 100644
> --- a/arch/sparc/include/asm/pgtable_32.h
> +++ b/arch/sparc/include/asm/pgtable_32.h
> @@ -432,6 +432,8 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
> 
>  #define VMALLOC_START           _AC(0xfe600000,UL)
>  #define VMALLOC_END             _AC(0xffc00000,UL)
> +#define MODULES_VADDR           VMALLOC_START
> +#define MODULES_END             VMALLOC_END
> 
> 
> Then the #ifdef CONFIG_SPARC64 could be dropped and the code would be
> the same for 32 and 64 bits.
 
Yeah, the #ifdef there can be dropped even regardless of execmem.
I'll add a patch for that.

> Just a drive-by comment.
> 
> 	Sam
> 

-- 
Sincerely yours,
Mike.
