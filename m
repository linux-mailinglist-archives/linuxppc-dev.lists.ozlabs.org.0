Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D173492E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 00:33:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bdpHhvr9;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZuJVVOhs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qknk70qgMz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 08:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bdpHhvr9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZuJVVOhs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QknjB22Snz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 08:33:02 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687127575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eocF6oVYznFl/DEwITHqQ7TMn26EFf0pZbwEDCTK84=;
	b=bdpHhvr9Hn5s8M8pBt6h0RlUGOZ1Lo4/y28rwu0yVR7JZSlAq39/46BcKsilIUinfOPogU
	qmKwez+jgzyMGsHhHmUjh9dF2vQKfcfzUpnC430yDZMMldnMWI1vYw06jpKeElXhmTcntG
	yypvYR4iRqVpOziVhZdqJC7qgQJw5KA81XnRrk5f520jV+sacnO/fQhXBIQnrLmfO/2M+r
	YFxwYhKBguqFcAkoCz4x6FEz5SiwhD5VV9/U1fv8TVeo3fA0XlwfdM8MGzqwB21MFiONgp
	HFCCVB4X260bSKBTYLft5JXmqXu6l7oYYyLOqT0toHcgXAbIR5XTU+7H5xAo3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687127575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eocF6oVYznFl/DEwITHqQ7TMn26EFf0pZbwEDCTK84=;
	b=ZuJVVOhsCR9WDQQO84QX2oPc5VTYDEn0agA6nGmpVtt6s52bacZEJ4aPLDh/ary7zlNGrA
	JmqYVkKOO6bt5CBA==
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
In-Reply-To: <20230616085038.4121892-7-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
Date: Mon, 19 Jun 2023 00:32:55 +0200
Message-ID: <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike!

Sorry for being late on this ...

On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
>  
> +void *execmem_data_alloc(size_t size)
> +{
> +	unsigned long start = execmem_params.modules.data.start;
> +	unsigned long end = execmem_params.modules.data.end;
> +	pgprot_t pgprot = execmem_params.modules.data.pgprot;
> +	unsigned int align = execmem_params.modules.data.alignment;
> +	unsigned long fallback_start = execmem_params.modules.data.fallback_start;
> +	unsigned long fallback_end = execmem_params.modules.data.fallback_end;
> +	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;

While I know for sure that you read up on the discussion I had with Song
about data structures, it seems you completely failed to understand it.

> +	return execmem_alloc(size, start, end, align, pgprot,
> +			     fallback_start, fallback_end, kasan);

Having _seven_ intermediate variables to fill _eight_ arguments of a
function instead of handing in @size and a proper struct pointer is
tasteless and disgusting at best.

Six out of those seven parameters are from:

    execmem_params.module.data

while the KASAN shadow part is retrieved from

    execmem_params.module.flags

So what prevents you from having a uniform data structure, which is
extensible and decribes _all_ types of allocations?

Absolutely nothing. The flags part can either be in the type dependend
part or you make the type configs an array as I had suggested originally
and then execmem_alloc() becomes:

void *execmem_alloc(type, size)

and

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(EXECMEM_TYPE_DATA, size);
}

which gets the type independent parts from @execmem_param.

Just read through your own series and watch the evolution of
execmem_alloc():

  static void *execmem_alloc(size_t size)

  static void *execmem_alloc(size_t size, unsigned long start,
                             unsigned long end, unsigned int align,
                             pgprot_t pgprot)

  static void *execmem_alloc(size_t len, unsigned long start,
                             unsigned long end, unsigned int align,
                             pgprot_t pgprot,
                             unsigned long fallback_start,
                             unsigned long fallback_end,
                             bool kasan)

In a month from now this function will have _ten_ parameters and tons of
horrible wrappers which convert an already existing data structure into
individual function arguments.

Seriously?

If you want this function to be [ab]used outside of the exec_param
configuration space for whatever non-sensical reasons then this still
can be either:

void *execmem_alloc(params, type, size)

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(&exec_param, EXECMEM_TYPE_DATA, size);
}

or

void *execmem_alloc(type_params, size);

static inline void *execmem_data_alloc(size_t size)
{
        return execmem_alloc(&exec_param.data, size);
}

which both allows you to provide alternative params, right?

Coming back to my conversation with Song:

   "Bad programmers worry about the code. Good programmers worry about
    data structures and their relationships."

You might want to reread:

    https://lore.kernel.org/r/87lenuukj0.ffs@tglx

and the subsequent thread.

The fact that my suggestions had a 'mod_' namespace prefix does not make
any of my points moot.

Song did an extremly good job in abstracting things out, but you decided
to ditch his ground work instead of building on it and keeping the good
parts. That's beyond sad.

Worse, you went the full 'not invented here' path with an outcome which is
even worse than the original hackery from Song which started the above
referenced thread.

I don't know what caused you to decide that ad hoc hackery is better
than proper data structure based design patterns. I actually don't want
to know.

As much as my voice counts:

  NAK-ed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx
