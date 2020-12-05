Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D2F2CFAAE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 09:49:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp3Cz1wMkzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 19:49:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp3BM5lmCzDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 19:48:10 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D673B6736F; Sat,  5 Dec 2020 09:48:04 +0100 (CET)
Date: Sat, 5 Dec 2020 09:48:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Fix KUAP warning by providing
 copy_from_kernel_nofault_allowed()
Message-ID: <20201205084804.GA25452@lst.de>
References: <e559e60c43f679195bfe4c7b0a301431c6f02c7a.1607157766.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e559e60c43f679195bfe4c7b0a301431c6f02c7a.1607157766.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, viro@zeniv.linux.org.uk,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 05, 2020 at 08:43:06AM +0000, Christophe Leroy wrote:
> Since commit c33165253492 ("powerpc: use non-set_fs based maccess
> routines"), userspace access is not granted anymore when using
> copy_from_kernel_nofault()
> 
> However, kthread_probe_data() uses copy_from_kernel_nofault()
> to check validity of pointers. When the pointer is NULL,
> it points to userspace, leading to a KUAP fault and triggering
> the following big hammer warning many times when you request
> a sysrq "show task":



> To avoid that, copy_from_kernel_nofault_allowed() is used to check
> whether the address is a valid kernel address. But the default
> version of it returns true for any address.
> 
> Provide a powerpc version of copy_from_kernel_nofault_allowed()
> that returns false when the address is below TASK_USER_MAX,
> so that copy_from_kernel_nofault() will return -ERANGE.

Looks good.  I wonder if we should just default to the TASK_SIZE_MAX
check in  copy_from_kernel_nofault_allowed for architectures that select
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE?

> 
> Reported-by: Qian Cai <qcai@redhat.com>
> Fixes: c33165253492 ("powerpc: use non-set_fs based maccess routines")
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> This issue was introduced in 5.10. I didn't mark it for stable, hopping it will go into 5.10-rc7
> ---
>  arch/powerpc/mm/Makefile  | 2 +-
>  arch/powerpc/mm/maccess.c | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/mm/maccess.c
> 
> diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
> index 5e147986400d..55b4a8bd408a 100644
> --- a/arch/powerpc/mm/Makefile
> +++ b/arch/powerpc/mm/Makefile
> @@ -5,7 +5,7 @@
>  
>  ccflags-$(CONFIG_PPC64)	:= $(NO_MINIMAL_TOC)
>  
> -obj-y				:= fault.o mem.o pgtable.o mmap.o \
> +obj-y				:= fault.o mem.o pgtable.o mmap.o maccess.o \
>  				   init_$(BITS).o pgtable_$(BITS).o \
>  				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
>  				   init-common.o mmu_context.o drmem.o
> diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
> new file mode 100644
> index 000000000000..56e97c0fb233
> --- /dev/null
> +++ b/arch/powerpc/mm/maccess.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/uaccess.h>
> +#include <linux/kernel.h>
> +
> +bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
> +{
> +	return (unsigned long)unsafe_src >= TASK_SIZE_MAX;
> +}
> -- 
> 2.25.0
---end quoted text---
