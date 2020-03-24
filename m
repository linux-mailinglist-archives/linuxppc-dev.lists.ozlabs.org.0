Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA8191A25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 20:40:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n1n01ndWzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 06:40:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n1l44hQ9zDql2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 06:38:40 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEFC2AAB8;
 Tue, 24 Mar 2020 19:38:35 +0000 (UTC)
Date: Tue, 24 Mar 2020 20:38:33 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 3/8] powerpc/perf: consolidate read_user_stack_32
Message-ID: <20200324193833.GH25468@kitsune.suse.cz>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <184347595442b4ca664613008a09e8cea7188c36.1584620202.git.msuchanek@suse.de>
 <1585039473.da4762n2s0.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585039473.da4762n2s0.astroid@bobo.none>
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
 Allison Randal <allison@lohutok.net>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 24, 2020 at 06:48:20PM +1000, Nicholas Piggin wrote:
> Michal Suchanek's on March 19, 2020 10:19 pm:
> > There are two almost identical copies for 32bit and 64bit.
> > 
> > The function is used only in 32bit code which will be split out in next
> > patch so consolidate to one function.
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> > v6:  new patch
> > v8:  move the consolidated function out of the ifdef block.
> > v11: rebase on top of def0bfdbd603
> > ---
> >  arch/powerpc/perf/callchain.c | 48 +++++++++++++++++------------------
> >  1 file changed, 24 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> > index cbc251981209..c9a78c6e4361 100644
> > --- a/arch/powerpc/perf/callchain.c
> > +++ b/arch/powerpc/perf/callchain.c
> > @@ -161,18 +161,6 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> >  	return read_user_stack_slow(ptr, ret, 8);
> >  }
> >  
> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> > -{
> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > -	    ((unsigned long)ptr & 3))
> > -		return -EFAULT;
> > -
> > -	if (!probe_user_read(ret, ptr, sizeof(*ret)))
> > -		return 0;
> > -
> > -	return read_user_stack_slow(ptr, ret, 4);
> > -}
> > -
> >  static inline int valid_user_sp(unsigned long sp, int is_64)
> >  {
> >  	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> > @@ -277,19 +265,9 @@ static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> >  }
> >  
> >  #else  /* CONFIG_PPC64 */
> > -/*
> > - * On 32-bit we just access the address and let hash_page create a
> > - * HPTE if necessary, so there is no need to fall back to reading
> > - * the page tables.  Since this is called at interrupt level,
> > - * do_page_fault() won't treat a DSI as a page fault.
> > - */
> > -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> > +static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> >  {
> > -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> > -	    ((unsigned long)ptr & 3))
> > -		return -EFAULT;
> > -
> > -	return probe_user_read(ret, ptr, sizeof(*ret));
> > +	return 0;
> >  }
> >  
> >  static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> > @@ -312,6 +290,28 @@ static inline int valid_user_sp(unsigned long sp, int is_64)
> >  
> >  #endif /* CONFIG_PPC64 */
> >  
> > +/*
> > + * On 32-bit we just access the address and let hash_page create a
> > + * HPTE if necessary, so there is no need to fall back to reading
> > + * the page tables.  Since this is called at interrupt level,
> > + * do_page_fault() won't treat a DSI as a page fault.
> > + */
> 
> The comment is actually probably better to stay in the 32-bit
> read_user_stack_slow implementation. Is that function defined
> on 32-bit purely so that you can use IS_ENABLED()? In that case
It documents the IS_ENABLED() and that's where it is. The 32bit
definition is only a technical detail.
> I would prefer to put a BUG() there which makes it self documenting.
Which will cause checkpatch complaints about introducing new BUG() which
is frowned on.

Thanks

Michal
