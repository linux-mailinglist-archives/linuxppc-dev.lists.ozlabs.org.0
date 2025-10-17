Return-Path: <linuxppc-dev+bounces-13002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF50FBE84F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 13:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp2YY0g2nz3cdR;
	Fri, 17 Oct 2025 22:25:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760700321;
	cv=none; b=EbQQF8AFQfZRFKqpNgZqCUWltxqDyk/xBuV2+e+bfEGquTbUM58qJEuHrGbgSQDZr+ldXeWpy9jWE0IYY4juEMJ+2V6mpDPzn/0IdWSLEPMd6/X7/vAzGuISHtXTVWufwTmZKxZ2i5Y3uBh+xvEOK8wM565ggIEAK6e3bFaXeLnYmEvlkqAaDxz8qWUKV0eM26AR4GLsSxbOOOiOTvLHHWGRocZkL2a817pH6lBDXH903AznwtPE5tDnOG0O8oFGVIUVuHClN5s1XZTr3IizPYs9J/z3i/YNGNqVGt1FOIn7/M5WYJE4zDXJrTnDb20dBu9vNmoeBb9jCvLtMWFOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760700321; c=relaxed/relaxed;
	bh=6NUdGt9MtwvZM8jFQHDsw1CCYzG2H7JFSs9BY7PdJqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK6yT0y5DBMAgeCtj9oLt936/qRF5f2weXbmJuWThtbgnU2UH86zzMxQ6jJLfPQ7jfiyqX17Vd9LC1Hkkw1n8uZlBbaCPiMtHowYgGaBRWfoesL6gKgwo1dtJGSmfyKvqW6mXP06oynfSYEKoqEz4+CXw0BOjVCfs7FV1feil5fI4u9zxCbTd66nWdrG7ufOmBEH/HxtZd1UvAJWHG3Jrj/nL0GoE2xI6gv9Ha8rfeZQkpR0ZhxmagNALENBKFnWhRmOQDmwqJ2csJMDzKrVHHEvK+3HQgy0Zn63WDcXVBQxHfZOs7lKLnpN1p9ecKGpmmBwbBk4rYwFyX36yBI2pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hs9rnXkx; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hs9rnXkx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp2YW3gfnz3cZ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 22:25:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6NUdGt9MtwvZM8jFQHDsw1CCYzG2H7JFSs9BY7PdJqA=; b=Hs9rnXkxHjJhukQH8YKpfmx1MG
	VZA60esTzih9n9wz+52eqcD59QOx+XDFIHyh7c+pophLHqgU4pS4pFhzbPljuZVWqPytPuzxcaLl7
	S+E7SYSRSFwMybJrMhDmdTjSEfc00iD7BHmyfTmTRiICFGeQllh5SzKuMB3fgb9Ax4AAWWvj3Uavu
	KjG5+YOXW8tPPa0//Qqm1AlGRYRbcs7Y3JxSsHqhWz2AGe38QnB6cYh9h9t3xtx3WZuOcipGJF8lQ
	1baXzfSn292iNCLYPtUPcw5e9HmK8yNQQvOc+EEUeIP/k8jyFwFcGC+J6+je+9353wqrDfz3kSPye
	pecvA4Gw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia1-00000007Web-1SpD;
	Fri, 17 Oct 2025 11:25:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E1F4030023C; Fri, 17 Oct 2025 13:25:04 +0200 (CEST)
Date: Fri, 17 Oct 2025 13:25:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
Message-ID: <20251017112504.GE3245006@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de>
 <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adba2f37-85fc-45fa-b93b-9b86ab3493f3@citrix.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17, 2025 at 12:08:24PM +0100, Andrew Cooper wrote:
> On 17/10/2025 11:09 am, Thomas Gleixner wrote:
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > +#define __scoped_masked_user_access(_mode, _uptr, _size, _elbl)					\
> > +for (bool ____stop = false; !____stop; ____stop = true)						\
> > +	for (typeof((_uptr)) _tmpptr = __scoped_user_access_begin(_mode, _uptr, _size, _elbl);	\
> > +	     !____stop; ____stop = true)							\
> > +		for (CLASS(masked_user_##_mode##_access, scope) (_tmpptr); !____stop;		\
> > +		     ____stop = true)					\
> > +			/* Force modified pointer usage within the scope */			\
> > +			for (const typeof((_uptr)) _uptr = _tmpptr; !____stop; ____stop = true)	\
> > +				if (1)
> > +
> 
> Truly a thing of beauty.  At least the end user experience is nice.
> 
> One thing to be aware of is that:
> 
>     scoped_masked_user_rw_access(ptr, efault) {
>         unsafe_get_user(rval, &ptr->rval, efault);
>         unsafe_put_user(wval, &ptr->wval, efault);
>     } else {
>         // unreachable
>     }
> 
> will compile.  Instead, I think you want the final line of the macro to
> be "if (0) {} else" to prevent this.
> 
> 
> While we're on the subject, can we find some C standards people to lobby.
> 
> C2Y has a proposal to introduce "if (int foo =" syntax to generalise the
> for() loop special case.  Can we please see about fixing the restriction
> of only allowing a single type per loop?   This example could be a
> single loop if it weren't for that restriction.

So elsewhere, Linus suggested to use a struct to get around that. See
for example this lovely thing:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=locking/core&id=1bc5d8cefd0d9768dc03c83140dd54c552bea470


