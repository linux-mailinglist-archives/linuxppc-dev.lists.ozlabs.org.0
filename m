Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A445F81F5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 03:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mknp46nfgz3f1l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Oct 2022 12:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=f8gITOWu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=jvfi=2i=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=f8gITOWu;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mkbbc3VWbz3bq5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Oct 2022 04:56:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F174B818F6;
	Fri,  7 Oct 2022 17:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63F0C433D7;
	Fri,  7 Oct 2022 17:56:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="f8gITOWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665165391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK/H0hVDBIBg7GodmLmaWI9qS4fvsGkmZJoRHEB4Sqs=;
	b=f8gITOWuIwqHaHfAd2Ip5iMe8yRrocgJ4MTv+syk8BIYaorE//Q+fvXw/I7Wb9QIt67mY7
	sXmAQixgC0HtGsR77BaUpuASQ/P2J6ViTMRZs6w1NXyDA3Tn8jOyTwjjjCV8bnJYFxdwV5
	RGF0qzBCT4wpILO3WXYw3dx9t9cPRE4=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a87e0a2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Oct 2022 17:56:31 +0000 (UTC)
Date: Fri, 7 Oct 2022 11:56:18 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Message-ID: <Y0BoQmVauPLC2uW5@zx2c4.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
 <CAHmME9pE4saqnwxhsAwt-xegYGjsavPOGnHCbZhUXD7kaJ+GAA@mail.gmail.com>
 <501b0fc3-6c67-657f-781e-25ee0283bc2e@csgroup.eu>
 <Y0Ayvov/KQmrIwTS@zx2c4.com>
 <202210071010.52C672FA9@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202210071010.52C672FA9@keescook>
X-Mailman-Approved-At: Sat, 08 Oct 2022 12:28:34 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@ker
 nel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, "linux-um@lists.infradead.
 org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "linux-kernel@vger.kernel.org" 
 <linux-kernel@vger.kernel.org>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Chuck Lever <chuck.lever@oracle.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 07, 2022 at 10:12:42AM -0700, Kees Cook wrote:
> On Fri, Oct 07, 2022 at 08:07:58AM -0600, Jason A. Donenfeld wrote:
> > On Fri, Oct 07, 2022 at 04:57:24AM +0000, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 07/10/2022 à 01:36, Jason A. Donenfeld a écrit :
> > > > On 10/6/22, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> > > >>
> > > >>
> > > >> Le 06/10/2022 à 19:31, Christophe Leroy a écrit :
> > > >>>
> > > >>>
> > > >>> Le 06/10/2022 à 19:24, Jason A. Donenfeld a écrit :
> > > >>>> Hi Christophe,
> > > >>>>
> > > >>>> On Thu, Oct 6, 2022 at 11:21 AM Christophe Leroy
> > > >>>> <christophe.leroy@csgroup.eu> wrote:
> > > >>>>> Le 06/10/2022 à 18:53, Jason A. Donenfeld a écrit :
> > > >>>>>> The prandom_u32() function has been a deprecated inline wrapper around
> > > >>>>>> get_random_u32() for several releases now, and compiles down to the
> > > >>>>>> exact same code. Replace the deprecated wrapper with a direct call to
> > > >>>>>> the real function. The same also applies to get_random_int(), which is
> > > >>>>>> just a wrapper around get_random_u32().
> > > >>>>>>
> > > >>>>>> Reviewed-by: Kees Cook <keescook@chromium.org>
> > > >>>>>> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk> # for sch_cake
> > > >>>>>> Acked-by: Chuck Lever <chuck.lever@oracle.com> # for nfsd
> > > >>>>>> Reviewed-by: Jan Kara <jack@suse.cz> # for ext4
> > > >>>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > >>>>>> ---
> > > >>>>>
> > > >>>>>> diff --git a/arch/powerpc/kernel/process.c
> > > >>>>>> b/arch/powerpc/kernel/process.c
> > > >>>>>> index 0fbda89cd1bb..9c4c15afbbe8 100644
> > > >>>>>> --- a/arch/powerpc/kernel/process.c
> > > >>>>>> +++ b/arch/powerpc/kernel/process.c
> > > >>>>>> @@ -2308,6 +2308,6 @@ void notrace __ppc64_runlatch_off(void)
> > > >>>>>>     unsigned long arch_align_stack(unsigned long sp)
> > > >>>>>>     {
> > > >>>>>>         if (!(current->personality & ADDR_NO_RANDOMIZE) &&
> > > >>>>>> randomize_va_space)
> > > >>>>>> -             sp -= get_random_int() & ~PAGE_MASK;
> > > >>>>>> +             sp -= get_random_u32() & ~PAGE_MASK;
> > > >>>>>>         return sp & ~0xf;
> > > >>>>>
> > > >>>>> Isn't that a candidate for prandom_u32_max() ?
> > > >>>>>
> > > >>>>> Note that sp is deemed to be 16 bytes aligned at all time.
> > > >>>>
> > > >>>> Yes, probably. It seemed non-trivial to think about, so I didn't. But
> > > >>>> let's see here... maybe it's not too bad:
> > > >>>>
> > > >>>> If PAGE_MASK is always ~(PAGE_SIZE-1), then ~PAGE_MASK is
> > > >>>> (PAGE_SIZE-1), so prandom_u32_max(PAGE_SIZE) should yield the same
> > > >>>> thing? Is that accurate? And holds across platforms (this comes up a
> > > >>>> few places)? If so, I'll do that for a v4.
> > > >>>>
> > > >>>
> > > >>> On powerpc it is always (from arch/powerpc/include/asm/page.h) :
> > > >>>
> > > >>> /*
> > > >>>    * Subtle: (1 << PAGE_SHIFT) is an int, not an unsigned long. So if we
> > > >>>    * assign PAGE_MASK to a larger type it gets extended the way we want
> > > >>>    * (i.e. with 1s in the high bits)
> > > >>>    */
> > > >>> #define PAGE_MASK      (~((1 << PAGE_SHIFT) - 1))
> > > >>>
> > > >>> #define PAGE_SIZE        (1UL << PAGE_SHIFT)
> > > >>>
> > > >>>
> > > >>> So it would work I guess.
> > > >>
> > > >> But taking into account that sp must remain 16 bytes aligned, would it
> > > >> be better to do something like ?
> > > >>
> > > >> 	sp -= prandom_u32_max(PAGE_SIZE >> 4) << 4;
> > > >>
> > > >> 	return sp;
> > > > 
> > > > Does this assume that sp is already aligned at the beginning of the
> > > > function? I'd assume from the function's name that this isn't the
> > > > case?
> > > 
> > > Ah you are right, I overlooked it.
> > 
> > So I think to stay on the safe side, I'm going to go with
> > `prandom_u32_max(PAGE_SIZE)`. Sound good?
> 
> Given these kinds of less mechanical changes, it may make sense to split
> these from the "trivial" conversions in a treewide patch. The chance of
> needing a revert from the simple 1:1 conversions is much lower than the
> need to revert by-hand changes.
> 
> The Cocci script I suggested in my v1 review gets 80% of the first
> patch, for example.

I'll split things up into a mechanical step and a non-mechanical step.
Good idea.

Jason
