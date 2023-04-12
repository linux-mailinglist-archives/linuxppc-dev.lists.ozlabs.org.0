Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE346DF784
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 15:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxP5V4DB3z3cjT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 23:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fwo5YyaV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fwo5YyaV;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxP4b39Fsz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 23:41:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DH15/SxDiYPBLclQ56VREuISrrW5j0LDqpqQq7OVNTI=; b=fwo5YyaVDrgsSL1EW2eG6ZifCn
	nQARtc5HebgVz/+GdbkxT/HPewsrSDhvVH8ViRA5L7yR3WDbC9DmPggQPMdj2YU5JTreQzgfcwIKm
	QRIAf1XdE4vAZHL0z+gNAmTMcU5KaoOQ2EOMGd9NlHIdVOmX12t8zqrCTXjMvpovvMKsp/zSSW2QL
	wq1adFoxn9YV53iWVnsLJEs7kK5kS/Iud8T75kNNVd8EGfzTkIbD/mdTwGc/j8gZRy4ze+jaUhHxc
	USHi7FYvDd+KVHT4eWYOpwNhRzG3lGIjcuJBHNZ/qmCUUEBKnMbL9FzU4jNUAL2z3AnG8l+wY3m+A
	6p0qEndQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaiM-00DwAw-10;
	Wed, 12 Apr 2023 13:40:46 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A7C5B3002A6;
	Wed, 12 Apr 2023 15:40:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 91D902095F65D; Wed, 12 Apr 2023 15:40:42 +0200 (CEST)
Date: Wed, 12 Apr 2023 15:40:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Message-ID: <20230412134042.GA629004@hirez.programming.kicks-ass.net>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <20230405141710.3551-4-ubizjak@gmail.com>
 <20230412113231.GA628377@hirez.programming.kicks-ass.net>
 <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4aCNNcyQm3Av+KkWVXuU9Cb0G5H5cFmqVR_T5LwCW=YJA@mail.gmail.com>
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 03:37:50PM +0200, Uros Bizjak wrote:
> On Wed, Apr 12, 2023 at 1:33 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Apr 05, 2023 at 04:17:08PM +0200, Uros Bizjak wrote:
> > > diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
> > > index bc4bd19b7fc2..45492fb5bf22 100644
> > > --- a/arch/powerpc/include/asm/local.h
> > > +++ b/arch/powerpc/include/asm/local.h
> > > @@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
> > >       return t;
> > >  }
> > >
> > > +static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
> > > +{
> > > +     long o = *po, r;
> > > +
> > > +     r = local_cmpxchg(l, o, n);
> > > +     if (unlikely(r != o))
> > > +             *po = r;
> > > +
> > > +     return likely(r == o);
> > > +}
> > > +
> >
> > Why is the ppc one different from the rest? Why can't it use the
> > try_cmpxchg_local() fallback and needs to have it open-coded?
> 
> Please note that ppc directly defines local_cmpxchg that bypasses
> cmpxchg_local/arch_cmpxchg_local machinery. The patch takes the same
> approach for local_try_cmpxchg, because fallbacks are using
> arch_cmpxchg_local definitions.
> 
> PPC should be converted to use arch_cmpxchg_local (to also enable
> instrumentation), but this is not the scope of the proposed patchset.

Ah indeed. Thanks!
