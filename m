Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1C1458D4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 12:23:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyPzN30Hdz2ynG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 22:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyPyx54Rsz2yPm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 22:23:21 +1100 (AEDT)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 03088D222E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 11:23:16 +0000 (UTC)
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 732BD1C000F;
 Mon, 22 Nov 2021 11:22:47 +0000 (UTC)
Message-ID: <325663a5-d9a1-a8b8-7f16-c2985c319864@ghiti.fr>
Date: Mon, 22 Nov 2021 12:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 6/8] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Content-Language: fr
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
 <e2209d0f1f3c1b581592bd6c32243402ccfe3dde.1637570556.git.christophe.leroy@csgroup.eu>
From: Alex Ghiti <alex@ghiti.fr>
In-Reply-To: <e2209d0f1f3c1b581592bd6c32243402ccfe3dde.1637570556.git.christophe.leroy@csgroup.eu>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Le 22/11/2021 à 09:48, Christophe Leroy a écrit :
> Commit e7142bf5d231 ("arm64, mm: make randomization selected by
> generic topdown mmap layout") introduced a default version of
> arch_randomize_brk() provided when
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.
> 
> powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> but needs to provide its own arch_randomize_brk().
> 
> In order to allow that, don't make
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT select
> CONFIG_ARCH_HAS_ELF_RANDOMIZE. Instead, ensure that
> selecting CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
> selecting CONFIG_ARCH_HAS_ELF_RANDOMIZE has the same effect.

This feels weird to me since if CONFIG_ARCH_HAS_ELF_RANDOMIZE is used 
somewhere else at some point, it is not natural to add 
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT: can't we use a __weak 
function or a new CONFIG_ARCH_HAS_RANDOMIZE_BRK?

Thanks,

Alex

> 
> Then only provide the default arch_randomize_brk() when the
> architecture has not selected CONFIG_ARCH_HAS_ELF_RANDOMIZE.
> 
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/Kconfig                  | 1 -
>   fs/binfmt_elf.c               | 3 ++-
>   include/linux/elf-randomize.h | 3 ++-
>   mm/util.c                     | 2 ++
>   4 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 26b8ed11639d..ef3ce947b7a1 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1000,7 +1000,6 @@ config HAVE_ARCH_COMPAT_MMAP_BASES
>   config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>   	bool
>   	depends on MMU
> -	select ARCH_HAS_ELF_RANDOMIZE
>   
>   config HAVE_STACK_VALIDATION
>   	bool
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index f8c7f26f1fbb..28968a189a91 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -1287,7 +1287,8 @@ static int load_elf_binary(struct linux_binprm *bprm)
>   		 * (since it grows up, and may collide early with the stack
>   		 * growing down), and into the unused ELF_ET_DYN_BASE region.
>   		 */
> -		if (IS_ENABLED(CONFIG_ARCH_HAS_ELF_RANDOMIZE) &&
> +		if ((IS_ENABLED(CONFIG_ARCH_HAS_ELF_RANDOMIZE) ||
> +		     IS_ENABLED(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)) &&
>   		    elf_ex->e_type == ET_DYN && !interpreter) {
>   			mm->brk = mm->start_brk = ELF_ET_DYN_BASE;
>   		}
> diff --git a/include/linux/elf-randomize.h b/include/linux/elf-randomize.h
> index da0dbb7b6be3..1e471ca7caaf 100644
> --- a/include/linux/elf-randomize.h
> +++ b/include/linux/elf-randomize.h
> @@ -4,7 +4,8 @@
>   
>   struct mm_struct;
>   
> -#ifndef CONFIG_ARCH_HAS_ELF_RANDOMIZE
> +#if !defined(CONFIG_ARCH_HAS_ELF_RANDOMIZE) && \
> +	!defined(CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT)
>   static inline unsigned long arch_mmap_rnd(void) { return 0; }
>   # if defined(arch_randomize_brk) && defined(CONFIG_COMPAT_BRK)
>   #  define compat_brk_randomized
> diff --git a/mm/util.c b/mm/util.c
> index e58151a61255..edb9e94cceb5 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -344,6 +344,7 @@ unsigned long randomize_stack_top(unsigned long stack_top)
>   }
>   
>   #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> +#ifndef CONFIG_ARCH_HAS_ELF_RANDOMIZE
>   unsigned long arch_randomize_brk(struct mm_struct *mm)
>   {
>   	/* Is the current task 32bit ? */
> @@ -352,6 +353,7 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
>   
>   	return randomize_page(mm->brk, SZ_1G);
>   }
> +#endif
>   
>   unsigned long arch_mmap_rnd(void)
>   {
> 
