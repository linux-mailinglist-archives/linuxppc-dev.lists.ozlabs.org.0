Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628D5F8287
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 04:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkqR51FNLz3dsj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 13:50:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=m7dkF4Qq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=1ou5=2j=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=m7dkF4Qq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkntk4RrYz3fCP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 12:40:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B32061DF3;
	Sat,  8 Oct 2022 01:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F81CC433D6;
	Sat,  8 Oct 2022 01:40:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="m7dkF4Qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665193218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNH2mnpIcj00WUdnQLlhiavniZvHilK6oGwgWIcL7uw=;
	b=m7dkF4QqvbJypdgEAbc35NBJnnqvQzB21sgNt0EURJQOR1FGkUsyi73yIMXgdPHVIIUlOg
	5CTO5f2vbWzw/vm/odmtp7dHuxfMwfhY9ZkhyfcncvX8HsEngEbDzs4FmPwfNkPExdyoZz
	X0uIWOW2Vu+MHRe3zl9le1EOdBfLqFs=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f0b17dc7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 8 Oct 2022 01:40:18 +0000 (UTC)
Date: Fri, 7 Oct 2022 19:40:07 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH v4 4/6] treewide: use get_random_u32() when possible
Message-ID: <Y0DU93wMsDwlLmMP@zx2c4.com>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-5-Jason@zx2c4.com>
 <3216619.44csPzL39Z@daneel.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3216619.44csPzL39Z@daneel.sf-tec.de>
X-Mailman-Approved-At: Sat, 08 Oct 2022 13:48:30 +1100
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
Cc: linux-wireless@vger.kernel.org, ulf.hansson@linaro.org, x86@kernel.org, jack@suse.cz, vigneshr@ti.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kernel-janitors@vger.kernel.org, kpsingh@kernel.org, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, edumazet@google.com, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, hpa@zytor.com, andreas.noever@gmail.com, kernel@xen0n.name, will@kernel.org, hch@lst.de, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, mchehab@kernel.org, herbert@gondor.apana.org.au, daniel@iogearbox.net, corbet@lwn.net, linux-rdma@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, hughd@google.com, linux@armlinux.org.uk, kadlec@netfilter.org, jgg@ziepe.ca, airlied@redhat.com, pabeni@redhat.com, jejb@linux.ibm.com, pablo@netfilter.org, linux-media@vger.kernel.org, elver@google.com, keescook@chromium.org, yury.norov@gmail.com, hca@li
 nux.ibm.com, toke@toke.dk, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-block@vger.kernel.org, richard@nod.at, bp@alien8.de, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, kuba@kernel.org, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, johannes@sipsolutions.net, linux-arm-kernel@lists.infradead.org, axboe@kernel.dk, linux-mmc@vger.kernel.org, tsbogend@alpha.franken.de, tytso@mit.edu, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, fw@strlen.de, linux-kernel@vger.kernel.org, christoph.boehmwalder@linbit.com, chuck.lever@oracle.com, linux-crypto@vger.kernel.org, jack@suse.com, tgraf@suug.ch, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 10:34:47PM +0200, Rolf Eike Beer wrote:
> > diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
> > index 7c37e09c92da..18c4f0e3e906 100644
> > --- a/arch/parisc/kernel/process.c
> > +++ b/arch/parisc/kernel/process.c
> > @@ -288,7 +288,7 @@ __get_wchan(struct task_struct *p)
> > 
> >  static inline unsigned long brk_rnd(void)
> >  {
> > -	return (get_random_int() & BRK_RND_MASK) << PAGE_SHIFT;
> > +	return (get_random_u32() & BRK_RND_MASK) << PAGE_SHIFT;
> >  }
> 
> Can't this be
> 
>   prandom_u32_max(BRK_RND_MASK + 1) << PAGE_SHIFT
> 
> ? More similar code with other masks follows below.

I guess it can, because BRK_RND_MASK happens to have all its lower bits
set. But as a "_MASK" maybe this isn't a given, and I don't want to
change intended semantics in this patchset. It's also not more
efficient, because BRK_RND_MASK is actually an expression:

    #define BRK_RND_MASK        (is_32bit_task() ? 0x07ffUL : 0x3ffffUL)

So at compile-time, the compiler can't prove that it's <= U16_MAX, since
it isn't always the case, so it'll use get_random_u32() anyway.

[Side note: maybe that compile-time check should become a runtime check,
 but I'll need to do some benchmarking before changing that and
 introducing two added branches to every non-constant invocation, so for
 now it's a compile-time check. Fortunately the vast majority of uses
 are done on inputs the compiler can prove something about.]

> 
> > diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > b/drivers/gpu/drm/i915/i915_gem_gtt.c index 329ff75b80b9..7bd1861ddbdf
> > 100644
> > --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > @@ -137,12 +137,12 @@ static u64 random_offset(u64 start, u64 end, u64 len,
> > u64 align) range = round_down(end - len, align) - round_up(start, align);
> >  	if (range) {
> >  		if (sizeof(unsigned long) == sizeof(u64)) {
> > -			addr = get_random_long();
> > +			addr = get_random_u64();
> >  		} else {
> > -			addr = get_random_int();
> > +			addr = get_random_u32();
> >  			if (range > U32_MAX) {
> >  				addr <<= 32;
> > -				addr |= get_random_int();
> > +				addr |= get_random_u32();
> >  			}
> >  		}
> >  		div64_u64_rem(addr, range, &addr);
> 
> How about 
> 
>  		if (sizeof(unsigned long) == sizeof(u64) || range > 
> U32_MAX)
> 			addr = get_random_u64();
>  		else
> 			addr = get_random_u32();
> 

Yes, maybe, probably, indeed... But I don't want to go wild and start
fixing all the weird algorithms everywhere. My goal is to only make
changes that are "obviously right". But maybe after this lands this is
something that you or I can submit to the i915 people as an
optimization.

> > diff --git a/drivers/infiniband/hw/cxgb4/cm.c
> > b/drivers/infiniband/hw/cxgb4/cm.c index 14392c942f49..499a425a3379 100644
> > --- a/drivers/infiniband/hw/cxgb4/cm.c
> > +++ b/drivers/infiniband/hw/cxgb4/cm.c
> > @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
> >  				   &ep->com.remote_addr;
> >  	int ret;
> >  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> > -	u32 isn = (prandom_u32() & ~7UL) - 1;
> > +	u32 isn = (get_random_u32() & ~7UL) - 1;
> >  	struct net_device *netdev;
> >  	u64 params;
> > 
> > @@ -2469,7 +2469,7 @@ static int accept_cr(struct c4iw_ep *ep, struct
> > sk_buff *skb, }
> > 
> >  	if (!is_t4(adapter_type)) {
> > -		u32 isn = (prandom_u32() & ~7UL) - 1;
> > +		u32 isn = (get_random_u32() & ~7UL) - 1;
> 
> u32 isn = get_random_u32() | 0x7;

Again, maybe so, but same rationale as above.

> >  static void ns_do_bit_flips(struct nandsim *ns, int num)
> >  {
> > -	if (bitflips && prandom_u32() < (1 << 22)) {
> > +	if (bitflips && get_random_u32() < (1 << 22)) {
> 
> Doing "get_random_u16() < (1 << 6)" should have the same probability with only 
> 2 bytes of random, no?

That's very clever. (1<<22)/(1<<32) == (1<<6)/(1<<16). But also, same
rationale as above for not doing that.

Anyway, I realize this is probably disappointing to read. But also, we
can come back to those optimization cases later pretty easily.

Jason
