Return-Path: <linuxppc-dev+bounces-551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA995FBF0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt42g1TC3z2xb9;
	Tue, 27 Aug 2024 07:44:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724693321;
	cv=none; b=kBAwuTAFuPxKv5FlBW/pBd4/YiPP5W5WcEAyYj8u5n/FDwScf474sPjdRqr6qHM0bUxaFWXrUfPlTjZ9eTelxSg4r0FW4HpIMmFESGptvDPx7kjvCrS1gvinknb9Pd8jnsjVfAlYNrYlop8tBGVkcjoUqg7iFKqsWqI1VHU9Wy0NAwhYL1245hxX4VSqpHcTvKLElWLV1pO+oLyjBQmlM7kuDrxOWoJ7htiWr5xY7/OFx+mGY8N7mQZgzBNArhdYciioirkuBlTCuiSyd7zTt5UplYgl1Yac8rsf1Ph2Zxl9iLi8NXz3TmQCDnKp4o8TIU5T++9xEq7jeTjuhkxybg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724693321; c=relaxed/relaxed;
	bh=4ZWLg5+gQ2MC14u4w9y/ExKKPt6x5L9tkEAX3YeiJo0=;
	h=Received:Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=Jq/Vtb4jtnGKe2oI1AoUnQeAERDDTN8JwPI4ngvTRev/z00Q/7ZKMDVnkrQ8OFsYU90oba7uh583SRENwodRIaL0kPUqNtYoK3koEMiW2BA5WusOZYwcqaXNI5QtULxj89gXq/A9yFA4Inof9IjZUPNoTJd34RRvdtCgkmirhzK1fp5cl7Srzje8LLO6JQPoShLXF1aHKC87Yg182NUdZECkO1SFOaqVrPnL886+dBKFqYNyatN4HlaH9yGFPcK3E18ElsyDOXSy3FfULjDKm50yUIK95sIK73YiIr6t3CYJBHtWu7aOhtRpET68dr8Zy0+jI/uAAXMAD7whIYt+cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=3pkx=pz=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=3pkx=pz=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsyMD3xGlz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 03:28:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3469A40480;
	Mon, 26 Aug 2024 17:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E6AC8B7B5;
	Mon, 26 Aug 2024 17:28:29 +0000 (UTC)
Date: Mon, 26 Aug 2024 13:29:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Christoph
 Hellwig <hch@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 5/8] ftrace: Add swap_func to ftrace_process_locs()
Message-ID: <20240826132909.306b08fc@gandalf.local.home>
In-Reply-To: <20240826065532.2618273-6-rppt@kernel.org>
References: <20240826065532.2618273-1-rppt@kernel.org>
	<20240826065532.2618273-6-rppt@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Aug 2024 09:55:29 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: Song Liu <song@kernel.org>
> 
> ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
> ftrace_swap_func so that archs can use RO-memory-poke function to do the
> sorting.

Can you add the above as a comment above the ftrace_swap_func() function?

Thanks,

-- Steve

> 
> Signed-off-by: Song Liu <song@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/ftrace.h |  2 ++
>  kernel/trace/ftrace.c  | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index fd5e84d0ec47..b794dcb7cae8 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -1188,4 +1188,6 @@ unsigned long arch_syscall_addr(int nr);
>  
>  #endif /* CONFIG_FTRACE_SYSCALLS */
>  
> +void ftrace_swap_func(void *a, void *b, int n);
> +
>  #endif /* _LINUX_FTRACE_H */
> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 4c28dd177ca6..9829979f3a46 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6989,6 +6989,17 @@ static void test_is_sorted(unsigned long *start,
> unsigned long count) }
>  #endif
>  
> +void __weak ftrace_swap_func(void *a, void *b, int n)
> +{
> +	unsigned long t;
> +
> +	WARN_ON_ONCE(n != sizeof(t));
> +
> +	t = *((unsigned long *)a);
> +	*(unsigned long *)a = *(unsigned long *)b;
> +	*(unsigned long *)b = t;
> +}
> +
>  static int ftrace_process_locs(struct module *mod,
>  			       unsigned long *start,
>  			       unsigned long *end)
> @@ -7016,7 +7027,7 @@ static int ftrace_process_locs(struct module *mod,
>  	 */
>  	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
>  		sort(start, count, sizeof(*start),
> -		     ftrace_cmp_ips, NULL);
> +		     ftrace_cmp_ips, ftrace_swap_func);
>  	} else {
>  		test_is_sorted(start, count);
>  	}


