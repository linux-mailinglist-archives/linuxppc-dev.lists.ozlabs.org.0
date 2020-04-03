Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C219D552
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 12:54:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48txdT5ZwhzDsLx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 21:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48txbb1KDxzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 21:52:43 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69219AC92;
 Fri,  3 Apr 2020 10:52:37 +0000 (UTC)
Date: Fri, 3 Apr 2020 12:52:34 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 3/8] powerpc/perf: consolidate read_user_stack_32
Message-ID: <20200403105234.GX25468@kitsune.suse.cz>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <184347595442b4ca664613008a09e8cea7188c36.1584620202.git.msuchanek@suse.de>
 <1585039473.da4762n2s0.astroid@bobo.none>
 <20200324193833.GH25468@kitsune.suse.cz>
 <1585896170.ohti800w9v.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1585896170.ohti800w9v.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

there are 3 variants of the function

read_user_stack_64

32bit read_user_stack_32
64bit read_user_Stack_32

On Fri, Apr 03, 2020 at 05:13:25PM +1000, Nicholas Piggin wrote:
> Michal Suchánek's on March 25, 2020 5:38 am:
> > On Tue, Mar 24, 2020 at 06:48:20PM +1000, Nicholas Piggin wrote:
> >> Michal Suchanek's on March 19, 2020 10:19 pm:
> >> > There are two almost identical copies for 32bit and 64bit.
> >> > 
> >> > The function is used only in 32bit code which will be split out in next
> >> > patch so consolidate to one function.
> >> > 
> >> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >> > Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >> > ---
> >> > v6:  new patch
> >> > v8:  move the consolidated function out of the ifdef block.
> >> > v11: rebase on top of def0bfdbd603
> >> > ---
> >> >  arch/powerpc/perf/callchain.c | 48 +++++++++++++++++------------------
> >> >  1 file changed, 24 insertions(+), 24 deletions(-)
> >> > 
> >> > diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> >> > index cbc251981209..c9a78c6e4361 100644
> >> > --- a/arch/powerpc/perf/callchain.c
> >> > +++ b/arch/powerpc/perf/callchain.c
> >> > @@ -161,18 +161,6 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> >> >  	return read_user_stack_slow(ptr, ret, 8);
> >> >  }
> >> >  
> >> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> >> > -{
> >> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> >> > -	    ((unsigned long)ptr & 3))
> >> > -		return -EFAULT;
> >> > -
> >> > -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> >> > -		return 0;
> >> > -
> >> > -	return read_user_stack_slow(ptr, ret, 4);
> >> > -}
> >> > -
> >> >  static inline int valid_user_sp(unsigned long sp, int is_64)
> >> >  {
> >> >  	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> >> > @@ -277,19 +265,9 @@ static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> >> >  }
> >> >  
> >> >  #else  /* CONFIG_PPC64 */
> >> > -/*
> >> > - * On 32-bit we just access the address and let hash_page create a
> >> > - * HPTE if necessary, so there is no need to fall back to reading
> >> > - * the page tables.  Since this is called at interrupt level,
> >> > - * do_page_fault() won't treat a DSI as a page fault.
> >> > - */
> >> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> >> > +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> >> >  {
> >> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> >> > -	    ((unsigned long)ptr & 3))
> >> > -		return -EFAULT;
> >> > -
> >> > -	return probe_user_read(ret, ptr, sizeof(*ret));
> >> > +	return 0;
> >> >  }
> >> >  
> >> >  static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> >> > @@ -312,6 +290,28 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
> >> >  
> >> >  #endif /* CONFIG_PPC64 */
> >> >  
> >> > +/*
> >> > + * On 32-bit we just access the address and let hash_page create a
> >> > + * HPTE if necessary, so there is no need to fall back to reading
> >> > + * the page tables.  Since this is called at interrupt level,
> >> > + * do_page_fault() won't treat a DSI as a page fault.
> >> > + */
> >> 
> >> The comment is actually probably better to stay in the 32-bit
> >> read_user_stack_slow implementation. Is that function defined
> >> on 32-bit purely so that you can use IS_ENABLED()? In that case
> > It documents the IS_ENABLED() and that's where it is. The 32bit
> > definition is only a technical detail.
> 
> Sorry for the late reply, busy trying to fix bugs in the C rewrite
> series. I don't think it is the right place, it should be in the
> ppc32 implementation detail. ppc64 has an equivalent comment at the
> top of its read_user_stack functions.
> 
> >> I would prefer to put a BUG() there which makes it self documenting.
> > Which will cause checkpatch complaints about introducing new BUG() which
> > is frowned on.
> 
> It's fine in this case, that warning is about not introducing
> runtime bugs, but this wouldn't be.
> 
> But... I actually don't like adding read_user_stack_slow on 32-bit
> and especially not just to make IS_ENABLED work.
> 
> IMO this would be better if you really want to consolidate it
> 
> ---
> 
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index cbc251981209..ca3a599b3f54 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -108,7 +108,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>   * interrupt context, so if the access faults, we read the page tables
>   * to find which page (if any) is mapped and access it directly.
>   */
> -static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> +static int read_user_stack_slow(const void __user *ptr, void *buf, int nb)
>  {
>  	int ret = -EFAULT;
>  	pgd_t *pgdir;
> @@ -149,28 +149,21 @@ static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
>  	return ret;
>  }
>  
> -static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> +static int __read_user_stack(const void __user *ptr, void *ret, size_t size)
>  {
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
> -	    ((unsigned long)ptr & 7))
> +	if ((unsigned long)ptr > TASK_SIZE - size ||
> +	    ((unsigned long)ptr & (size - 1)))
>  		return -EFAULT;
>  
> -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> +	if (!probe_user_read(ret, ptr, size))
>  		return 0;
>  
> -	return read_user_stack_slow(ptr, ret, 8);
> +	return read_user_stack_slow(ptr, ret, size);
>  }
>  
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
>  {
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> -		return 0;
> -
> -	return read_user_stack_slow(ptr, ret, 4);
> +	return __read_user_stack(ptr, ret, sizeof(*ret));
>  }
>  
>  static inline int valid_user_sp(unsigned long sp, int is_64)
> @@ -283,13 +276,13 @@ static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
>   * the page tables.  Since this is called at interrupt level,
>   * do_page_fault() won't treat a DSI as a page fault.
>   */
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +static int __read_user_stack(const void __user *ptr, void *ret, size_t size)
>  {
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> +	if ((unsigned long)ptr > TASK_SIZE - size ||
> +	    ((unsigned long)ptr & (size - 1)))
>  		return -EFAULT;
>  
> -	return probe_user_read(ret, ptr, sizeof(*ret));
> +	return probe_user_read(ret, ptr, size);
>  }
>  
>  static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> @@ -312,6 +305,11 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
>  
>  #endif /* CONFIG_PPC64 */
>  
> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +{
> +	return __read_user_stack(ptr, ret, sizeof(*ret));
Does not work for 64bit read_user_stack_32 ^ this should be 4.

Other than that it should preserve the existing logic just fine.

Thanks

Michal
