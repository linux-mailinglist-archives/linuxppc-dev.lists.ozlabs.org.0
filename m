Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4C3651C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 22:09:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45K0Hj3c0jzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 06:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.109; helo=emh03.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh03.mail.saunalahti.fi (emh03.mail.saunalahti.fi
 [62.142.5.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K0GL3zFqzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 06:08:07 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-64-161-nat.elisa-mobile.fi
 [85.76.64.161])
 by emh03.mail.saunalahti.fi (Postfix) with ESMTP id B9366400BA;
 Wed,  5 Jun 2019 23:08:00 +0300 (EEST)
Date: Wed, 5 Jun 2019 23:08:00 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3] powerpc: fix kexec failure on book3s/32
Message-ID: <20190605200800.GK3538@darkstar.musicnaut.iki.fi>
References: <56efc3b317622d5f607d1f7a35894b194c385492.1559549824.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56efc3b317622d5f607d1f7a35894b194c385492.1559549824.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Jun 03, 2019 at 08:20:28AM +0000, Christophe Leroy wrote:
> In the old days, _PAGE_EXEC didn't exist on 6xx aka book3s/32.
> Therefore, allthough __mapin_ram_chunk() was already mapping kernel
> text with PAGE_KERNEL_TEXT and the rest with PAGE_KERNEL, the entire
> memory was executable. Part of the memory (first 512kbytes) was
> mapped with BATs instead of page table, but it was also entirely
> mapped as executable.
> 
> In commit 385e89d5b20f ("powerpc/mm: add exec protection on
> powerpc 603"), we started adding exec protection to some 6xx, namely
> the 603, for pages mapped via pagetables.
> 
> Then, in commit 63b2bc619565 ("powerpc/mm/32s: Use BATs for
> STRICT_KERNEL_RWX"), the exec protection was extended to BAT mapped
> memory, so that really only the kernel text could be executed.
> 
> The problem here is that kexec is based on copying some code into
> upper part of memory then executing it from there in order to install
> a fresh new kernel at its definitive location.
> 
> However, the code is position independant and first part of it is
> just there to deactivate the MMU and jump to the second part. So it
> is possible to run this first part inplace instead of running the
> copy. Once the MMU is off, there is no protection anymore and the
> second part of the code will just run as before.
> 
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  Aaro, can you test this patch ? Thanks.

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

>  arch/powerpc/include/asm/kexec.h       | 3 +++
>  arch/powerpc/kernel/machine_kexec_32.c | 4 +++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 4a585cba1787..c68476818753 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -94,6 +94,9 @@ static inline bool kdump_in_progress(void)
>  	return crashing_cpu >= 0;
>  }
>  
> +void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_code_buffer,
> +			 unsigned long start_address) __noreturn;
> +
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops kexec_elf64_ops;
>  
> diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/machine_kexec_32.c
> index affe5dcce7f4..2b160d68db49 100644
> --- a/arch/powerpc/kernel/machine_kexec_32.c
> +++ b/arch/powerpc/kernel/machine_kexec_32.c
> @@ -30,7 +30,6 @@ typedef void (*relocate_new_kernel_t)(
>   */
>  void default_machine_kexec(struct kimage *image)
>  {
> -	extern const unsigned char relocate_new_kernel[];
>  	extern const unsigned int relocate_new_kernel_size;
>  	unsigned long page_list;
>  	unsigned long reboot_code_buffer, reboot_code_buffer_phys;
> @@ -58,6 +57,9 @@ void default_machine_kexec(struct kimage *image)
>  				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
>  	printk(KERN_INFO "Bye!\n");
>  
> +	if (!IS_ENABLED(CONFIG_FSL_BOOKE) && !IS_ENABLED(CONFIG_44x))
> +		relocate_new_kernel(page_list, reboot_code_buffer_phys, image->start);
> +
>  	/* now call it */
>  	rnk = (relocate_new_kernel_t) reboot_code_buffer;
>  	(*rnk)(page_list, reboot_code_buffer_phys, image->start);
> -- 
> 2.13.3
> 
