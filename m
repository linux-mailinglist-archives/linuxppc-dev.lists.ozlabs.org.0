Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CFF5F83C3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 08:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mkvm70xM6z3dvv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 17:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FTiUCKip;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FTiUCKip;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkrn81MT7z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 14:50:49 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id bh13so6211439pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+M2MWnKezzvwUdnzvMnzBe5u7rJCxF/Jt+qZLDkYO0=;
        b=FTiUCKipmqUFH72GOvNGAiS4z04PbOMknPHSePECxyT+NR1MKehdmNkDokls+RTwtz
         36ZKjqvAgPt8zH/PagzHgUWgsK7jRV+Fodw+XGTQ49lxGfaN2UCRznQ1vjEUvfGAJQxE
         GFWrUL9ion4oE/GNeI8pk6ab24JqoBKXYgp6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+M2MWnKezzvwUdnzvMnzBe5u7rJCxF/Jt+qZLDkYO0=;
        b=61tJx5AzomIDIzoqP+xjjNlC6orMYd+syWYhX4umdu2qIf1Vm1fi+L8DbsFm/1fPJ7
         fC19X2bTKjV4RyupXO1M43/vEuPpbWYgBovhQPwOe3gIaqiQlL0IBGicXs7YwMEInJNW
         aC0bk+4O9bwby9IB1YlNtiU9NwydHILv/KDDWg5u4CP9gfIua+joeYnQxYiOmwu9VUQ5
         ScFB6pCQpqTMo5NKhZo+62AJhJIG/+rQPHcU1d3f7vAxQEIDeuzJg2lnSxNnRcEwYM1/
         D7VPDxuCoyqAIqCSOWwUhWlzgyn/EmeQ927vsLZSRZlo5Y+vKc9N0FqjD6rQffDIGIh3
         UxPw==
X-Gm-Message-State: ACrzQf1z9ZwmbF4iG6AXCo4kNia3tR433QgbSuspS9o8kfYCySMM9fKp
	cvlt0KqPEVHz4/t2Kv6NIl8jdw==
X-Google-Smtp-Source: AMsMyM4VVDsl7sTfR6BuaZGaWhNrchqMetZXBFqCtxdCKjUBjOregElVi6yPdvP6PdPNshZGkoA99Q==
X-Received: by 2002:a63:f806:0:b0:439:d86e:1f6e with SMTP id n6-20020a63f806000000b00439d86e1f6emr7461413pgh.46.1665201045645;
        Fri, 07 Oct 2022 20:50:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2-20020a1709026f0200b0017f5ba1fffasm2217544plk.297.2022.10.07.20.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 20:50:44 -0700 (PDT)
Date: Fri, 7 Oct 2022 20:50:43 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <53DD0148-ED15-4294-8496-9E4B4C7AD061@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 08 Oct 2022 17:03:32 +1100
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, Helge Deller <
 deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.
 franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[resending because I failed to CC]

On October 7, 2022 7:21:28 PM PDT, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Fri, Oct 07, 2022 at 03:47:44PM -0700, Kees Cook wrote:
>> On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:
>> > Rather than incurring a division or requesting too many random bytes for
>> > the given range, use the prandom_u32_max() function, which only takes
>> > the minimum required bytes from the RNG and avoids divisions.
>> 
>> I actually meant splitting the by-hand stuff by subsystem, but nearly
>> all of these can be done mechanically too, so it shouldn't be bad. Notes
>> below...
>
>Oh, cool, more coccinelle. You're basically giving me a class on these
>recipes. Much appreciated.

You're welcome! This was a fun exercise. :)

>
>> > [...]
>> > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
>> > index 92bcc1768f0b..87203429f802 100644
>> > --- a/arch/arm64/kernel/process.c
>> > +++ b/arch/arm64/kernel/process.c
>> > @@ -595,7 +595,7 @@ unsigned long __get_wchan(struct task_struct *p)
>> >  unsigned long arch_align_stack(unsigned long sp)
>> >  {
>> >  	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
>> > -		sp -= get_random_int() & ~PAGE_MASK;
>> > +		sp -= prandom_u32_max(PAGE_SIZE);
>> >  	return sp & ~0xf;
>> >  }
>> >  
>> 
>> @mask@
>> expression MASK;
>> @@
>> 
>> - (get_random_int() & ~(MASK))
>> + prandom_u32_max(MASK)
>
>Not quite! PAGE_MASK != PAGE_SIZE. In this case, things get a litttttle
>more complicated where you can do:
>
>get_random_int() & MASK == prandom_u32_max(MASK + 1)
>*only if all the top bits of MASK are set* That is, if MASK one less

Oh whoops! Yes, right, I totally misread SIZE as MASK.

>than a power of two. Or if MASK & (MASK + 1) == 0.
>
>(If those top bits aren't set, you can technically do
>prandom_u32_max(MASK >> n + 1) << n. That'd be a nice thing to work out.
>But yeesh, maybe a bit much for the time being and probably a bit beyond
>coccinelle.)
>
>This case here, though, is a bit more special, where we can just rely on
>an obvious given kernel identity. Namely, PAGE_MASK == ~(PAGE_SIZE - 1).
>So ~PAGE_MASK == PAGE_SIZE - 1.
>So get_random_int() & ~PAGE_MASK == prandom_u32_max(PAGE_SIZE - 1 + 1).
>So get_random_int() & ~PAGE_MASK == prandom_u32_max(PAGE_SIZE).
>
>And most importantly, this makes the code more readable, since everybody
>knows what bounding by PAGE_SIZE means, where as what on earth is
>happening with the &~PAGE_MASK thing. So it's a good change. I'll try to
>teach coccinelle about that special case.

Yeah, it should be possible to just check for the literal.

>
>
>
>> > diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
>> > index f32c38abd791..8c9826062652 100644
>> > --- a/arch/loongarch/kernel/vdso.c
>> > +++ b/arch/loongarch/kernel/vdso.c
>> > @@ -78,7 +78,7 @@ static unsigned long vdso_base(void)
>> >  	unsigned long base = STACK_TOP;
>> >  
>> >  	if (current->flags & PF_RANDOMIZE) {
>> > -		base += get_random_int() & (VDSO_RANDOMIZE_SIZE - 1);
>> > +		base += prandom_u32_max(VDSO_RANDOMIZE_SIZE);
>> >  		base = PAGE_ALIGN(base);
>> >  	}
>> >  
>> 
>> @minus_one@
>> expression FULL;
>> @@
>> 
>> - (get_random_int() & ((FULL) - 1)
>> + prandom_u32_max(FULL)
>
>Ahh, well, okay, this is the example I mentioned above. Only works if
>FULL is saturated. Any clever way to get coccinelle to prove that? Can
>it look at the value of constants?

I'm not sure if Cocci will do that without a lot of work. The literals trick I used below would need a lot of fanciness. :)

>
>> 
>> > diff --git a/arch/parisc/kernel/vdso.c b/arch/parisc/kernel/vdso.c
>> > index 63dc44c4c246..47e5960a2f96 100644
>> > --- a/arch/parisc/kernel/vdso.c
>> > +++ b/arch/parisc/kernel/vdso.c
>> > @@ -75,7 +75,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
>> >  
>> >  	map_base = mm->mmap_base;
>> >  	if (current->flags & PF_RANDOMIZE)
>> > -		map_base -= (get_random_int() & 0x1f) * PAGE_SIZE;
>> > +		map_base -= prandom_u32_max(0x20) * PAGE_SIZE;
>> >  
>> >  	vdso_text_start = get_unmapped_area(NULL, map_base, vdso_text_len, 0, 0);
>> >  
>> 
>> These are more fun, but Coccinelle can still do them with a little
>> Pythonic help:
>> 
>> // Find a potential literal
>> @literal_mask@
>> expression LITERAL;
>> identifier randfunc =~ "get_random_int|prandom_u32|get_random_u32";
>> position p;
>> @@
>> 
>>         (randfunc()@p & (LITERAL))
>> 
>> // Add one to the literal.
>> @script:python add_one@
>> literal << literal_mask.LITERAL;
>> RESULT;
>> @@
>> 
>> if literal.startswith('0x'):
>>         value = int(literal, 16) + 1
>>         coccinelle.RESULT = cocci.make_expr("0x%x" % (value))
>> elif literal[0] in '123456789':
>>         value = int(literal, 10) + 1
>>         coccinelle.RESULT = cocci.make_expr("%d" % (value))
>> else:
>>         print("I don't know how to handle: %s" % (literal))
>> 
>> // Replace the literal mask with the calculated result.
>> @plus_one@
>> expression literal_mask.LITERAL;
>> position literal_mask.p;
>> expression add_one.RESULT;
>> identifier FUNC;
>> @@
>> 
>> -       (FUNC()@p & (LITERAL))
>> +       prandom_u32_max(RESULT)
>
>Oh that's pretty cool. I can do the saturation check in python, since
>`value` holds the parsed result. Neat.

It is (at least how I have it here) just the string, so YMMV.

>
>> > diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
>> > index 998dd2ac8008..f4944c4dee60 100644
>> > --- a/fs/ext2/ialloc.c
>> > +++ b/fs/ext2/ialloc.c
>> > @@ -277,8 +277,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent)
>> >  		int best_ndir = inodes_per_group;
>> >  		int best_group = -1;
>> >  
>> > -		group = prandom_u32();
>> > -		parent_group = (unsigned)group % ngroups;
>> > +		parent_group = prandom_u32_max(ngroups);
>> >  		for (i = 0; i < ngroups; i++) {
>> >  			group = (parent_group + i) % ngroups;
>> >  			desc = ext2_get_group_desc (sb, group, NULL);
>> 
>> Okay, that one is too much for me -- checking that group is never used
>> after the assignment removal is likely possible, but beyond my cocci
>> know-how. :)
>
>Yea this is a tricky one, which I initially didn't do by hand, but Jan
>seemed fine with it, and it's clear if you look at it. Trixy cocci
>indeed.

I asked on the Cocci list[1], since by the time I got to the end of your "by hand" patch I *really* wanted to have it work. I was so close!


>
>> > diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
>> > index 0927f44cd478..41a0321f641a 100644
>> > --- a/lib/test_hexdump.c
>> > +++ b/lib/test_hexdump.c
>> > @@ -208,7 +208,7 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
>> >  static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
>> >  {
>> >  	unsigned int i = 0;
>> > -	int rs = (prandom_u32_max(2) + 1) * 16;
>> > +	int rs = prandom_u32_max(2) + 1 * 16;
>> >  
>> >  	do {
>> >  		int gs = 1 << i;
>> 
>> This looks wrong. Cocci says:
>> 
>> -       int rs = (get_random_int() % 2 + 1) * 16;
>> +       int rs = (prandom_u32_max(2) + 1) * 16;
>
>!! Nice catch.
>
>Alright, I'll give this a try with more cocci. The big difficulty at the
>moment is the power of 2 constant checking thing. If you have any
>pointers on that, would be nice.
>
>Thanks a bunch for the guidance.

Sure thing! I was pleased to figure out how to do the python bit.

-Kees

[1] actually, I don't see it on lore... I will resend it

-- 
Kees Cook
