Return-Path: <linuxppc-dev+bounces-615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C496134F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 17:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtX9p0xX1z2xJ6;
	Wed, 28 Aug 2024 01:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724773950;
	cv=none; b=T2kLm/0unyauwwW2kT0qjs1gaI0x/U/xK1I4oOWBulc0TfiXAB0TBXIP8SFQP8CgzLETMhFub5Q0FawEkG+Irpub40eL4DbGUyBlE1vUqGrAYWOpdhRhdNIs+sgGjiozw1V6Vo/6NlsfqP86EwrOikFv9tuxYLdogCOtOVYhRdulaNfW/mkyeBuoADcEkfY211sN0gyyd5yQkuhr1drqu98HmESDnmHEmYeBirwp8pIqESRzpvC3FkXKHAqbS0GzpbV9UZVPyuI5uY9fDT2wZZKgNy6OASqKQdIMAh10bl2QDemWc5OU3xj114VaINt2JsPQzHHDN6MEq6mmKXDwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724773950; c=relaxed/relaxed;
	bh=GWHE7tOwocWsn8tOtjtNDaroe1R2gQ10VN2+EPpdp4I=;
	h=Received:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LnfOhnjKAJVYk1c/kPzfri+dpwXY4xMl7oDSeBf10ipnKq4CvcZODffuyNGS7fKo+uVmpPw0q+o/SjGU2HAYcpxdCeiMhDhxMZGu+XnqMTaQC+isvK7HmxHNE69u9OmXV15DC5FwRRiyhQmjDXCcA6lhHLuhXMMEikcGYNiFgX9lJ4Rd9SYDGKBJXc2odhYvKUQx4rjTmQIwl++YyP8tZqxTGTnRhNCeiacHjZ7/OqVgGcWrd6RANzikXc/+qW9+5RCOqZ2iiv+66Ir9nXSTmCLPtIefTudNc1jPQU+Wd/6+tdIdsqDmGoveCXJ+xHuVWhFsZzGSJKMkdqFJZllDaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pJjeZGdR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pJjeZGdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtX9n4dZjz2xDl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 01:52:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EE20A41FD3;
	Tue, 27 Aug 2024 15:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C93C4DE0D;
	Tue, 27 Aug 2024 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724773408;
	bh=gLN6XrXPe8lnOYBY+qE6Br7q9z15uQyViI2cYvrjDUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJjeZGdRlRZciwiSds7ncOoFJeP+wPAbVUVeY1LlTa56La6oD/XycPb3ju2I/Si6N
	 bNsP9pfRPVziKGgn/Q7CZW62Bt7rl9iXHC+NkqAHxIdvlozlUPOn7DKQtQl24SAAKo
	 NVAJkyrxO3xLQShBOmpHzZcPcSpDnuVLQLFIjp6TCSAVJcQE/Q6oni4wO6fU4ZsrHD
	 4ovVIvkGw6loTWaFlHze4az9iCCc+TXdBuzKzGsuhZ4ATm4q785T8iPGoGLrAdyrZK
	 3tUYk2k2P5uZy+/qiIPItAj2gx6xlt89fXh5S1kblIuw6KS4FNa+7dzFK9H80hz+VW
	 wYQnWN9qfNMIA==
Date: Tue, 27 Aug 2024 18:40:35 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 5/8] ftrace: Add swap_func to ftrace_process_locs()
Message-ID: <Zs3zcwyygUk4_X8y@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
 <20240826065532.2618273-6-rppt@kernel.org>
 <20240826132909.306b08fc@gandalf.local.home>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826132909.306b08fc@gandalf.local.home>

On Mon, Aug 26, 2024 at 01:29:09PM -0400, Steven Rostedt wrote:
> On Mon, 26 Aug 2024 09:55:29 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: Song Liu <song@kernel.org>
> > 
> > ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
> > ftrace_swap_func so that archs can use RO-memory-poke function to do the
> > sorting.
> 
> Can you add the above as a comment above the ftrace_swap_func() function?

Sure.
 
> Thanks,
> 
> -- Steve
> 
> > 
> > Signed-off-by: Song Liu <song@kernel.org>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  include/linux/ftrace.h |  2 ++
> >  kernel/trace/ftrace.c  | 13 ++++++++++++-
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index fd5e84d0ec47..b794dcb7cae8 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -1188,4 +1188,6 @@ unsigned long arch_syscall_addr(int nr);
> >  
> >  #endif /* CONFIG_FTRACE_SYSCALLS */
> >  
> > +void ftrace_swap_func(void *a, void *b, int n);
> > +
> >  #endif /* _LINUX_FTRACE_H */
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 4c28dd177ca6..9829979f3a46 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6989,6 +6989,17 @@ static void test_is_sorted(unsigned long *start,
> > unsigned long count) }
> >  #endif
> >  
> > +void __weak ftrace_swap_func(void *a, void *b, int n)
> > +{
> > +	unsigned long t;
> > +
> > +	WARN_ON_ONCE(n != sizeof(t));
> > +
> > +	t = *((unsigned long *)a);
> > +	*(unsigned long *)a = *(unsigned long *)b;
> > +	*(unsigned long *)b = t;
> > +}
> > +
> >  static int ftrace_process_locs(struct module *mod,
> >  			       unsigned long *start,
> >  			       unsigned long *end)
> > @@ -7016,7 +7027,7 @@ static int ftrace_process_locs(struct module *mod,
> >  	 */
> >  	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
> >  		sort(start, count, sizeof(*start),
> > -		     ftrace_cmp_ips, NULL);
> > +		     ftrace_cmp_ips, ftrace_swap_func);
> >  	} else {
> >  		test_is_sorted(start, count);
> >  	}
> 

-- 
Sincerely yours,
Mike.

