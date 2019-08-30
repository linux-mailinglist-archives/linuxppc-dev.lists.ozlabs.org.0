Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9AA3035
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 08:44:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KVM34Z8nzDrgX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 16:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KVK51X3GzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 16:42:32 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 832E8ACC5;
 Fri, 30 Aug 2019 06:42:27 +0000 (UTC)
Date: Fri, 30 Aug 2019 08:42:25 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 5/5] powerpc/perf: split callchain.c by bitness
Message-ID: <20190830084225.527f4265@naga>
In-Reply-To: <4d996b0a225ca5b7d287ae46825d7da4a1d6e509.1567146554.git.christophe.leroy@c-s.fr>
References: <c77eec3d99fd0251edf725a3d9e1b79f396eba6e.1567117050.git.msuchanek@suse.de>
 <4d996b0a225ca5b7d287ae46825d7da4a1d6e509.1567146554.git.christophe.leroy@c-s.fr>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 06:35:11 +0000 (UTC)
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> On 08/29/2019 10:28 PM, Michal Suchanek wrote:
> > Building callchain.c with !COMPAT proved quite ugly with all the
> > defines. Splitting out the 32bit and 64bit parts looks better.
> > 
> > Also rewrite current_is_64bit as common function. No other code change
> > intended.  
> 
> Nice result.
> 
> Could look even better by merging both read_user_stack_32(), see below.
> 
> Also a possible cosmetic change to Makefile.
> 
> ---
>  arch/powerpc/perf/Makefile       |  7 ++---
>  arch/powerpc/perf/callchain_32.c | 65 ++++++++++++++++------------------------
>  2 files changed, 29 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index e9f3202251d0..53d614e98537 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_PERF_EVENTS)	+= callchain.o perf_regs.o
> -ifdef CONFIG_PERF_EVENTS
> -obj-y				+= callchain_$(BITS).o
> -obj-$(CONFIG_COMPAT)		+= callchain_32.o
> +obj-$(CONFIG_PERF_EVENTS)	+= callchain.o callchain_$(BITS).o perf_regs.o
> +ifdef CONFIG_COMPAT
> +obj-$(CONFIG_PERF_EVENTS)	+= callchain_32.o
>  endif
>  
That looks good.
>  obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> index 0bd4484eddaa..17c43ae03084 100644
> --- a/arch/powerpc/perf/callchain_32.c
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -15,50 +15,13 @@
>  #include <asm/sigcontext.h>
>  #include <asm/ucontext.h>
>  #include <asm/vdso.h>
> -#ifdef CONFIG_PPC64
> -#include "../kernel/ppc32.h"
> -#endif
>  #include <asm/pte-walk.h>
>  
>  #include "callchain.h"
>  
>  #ifdef CONFIG_PPC64
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> -{
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	if (!__get_user_inatomic(*ret, ptr)) {
> -		pagefault_enable();
> -		return 0;
> -	}
> -	pagefault_enable();
> -
> -	return read_user_stack_slow(ptr, ret, 4);
> -}
> -#else /* CONFIG_PPC64 */
> -/*
> - * On 32-bit we just access the address and let hash_page create a
> - * HPTE if necessary, so there is no need to fall back to reading
> - * the page tables.  Since this is called at interrupt level,
> - * do_page_fault() won't treat a DSI as a page fault.
> - */
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> -{
> -	int rc;
> -
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	rc = __get_user_inatomic(*ret, ptr);
> -	pagefault_enable();
> -
> -	return rc;
> -}
> +#include "../kernel/ppc32.h"
> +#else
>  
>  #define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
>  #define sigcontext32		sigcontext
> @@ -95,6 +58,30 @@ struct rt_signal_frame_32 {
>  	int			abigap[56];
>  };
>  
> +/*
> + * On 32-bit we just access the address and let hash_page create a
> + * HPTE if necessary, so there is no need to fall back to reading
> + * the page tables.  Since this is called at interrupt level,
> + * do_page_fault() won't treat a DSI as a page fault.
> + */
> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +{
> +	int rc;
> +
> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> +	    ((unsigned long)ptr & 3))
> +		return -EFAULT;
> +
> +	pagefault_disable();
> +	rc = __get_user_inatomic(*ret, ptr);
> +	pagefault_enable();
> +
> +	if (IS_ENABLED(CONFIG_PPC32) || !rc)
> +		return rc;
> +
> +	return read_user_stack_slow(ptr, ret, 4);
> +}
> +
>  static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
>  {
>  	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))

I will leave consolidating this function to somebody who knows what the
desired semantic is. With a short ifdef section at the top of the file
it is a low-hanging fruit.

Thanks

Michal
