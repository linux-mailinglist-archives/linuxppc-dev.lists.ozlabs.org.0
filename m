Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C155954BD52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2fp5CXDz3f9Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:09:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnGKuF+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RnGKuF+/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMnvC1J9Nz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 22:34:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5367D615D3;
	Tue, 14 Jun 2022 12:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9871EC3411E;
	Tue, 14 Jun 2022 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655210085;
	bh=S7mRYBt8dKQ302Phsd6Akm5kJqqFOUkmEA1v3KsTPWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnGKuF+/Y/3maKreiqaBVGd5HuZNeDQoPMRXQEpiMn/f8SIJpRly6PX6lIVouvSRe
	 xRFy4EGBk0z6QKt+Lz8vk6SzVZNTytJsNMc59tX/IUD7KSvHaKZebzDN6GiCttUHep
	 wXb4Tjb7kuj6K751aGII97hYZlNWKbGQyTiy30ylzeLfPk8aM7eYe2aDaylZCNoeQR
	 ATclZjOy43jDWkMIsNXUmPF4JLxmfzu7IwS+MDaUS4slOfQg5l4B5Bz1S20GP1bc6b
	 sBMsCSdmiWO4qBNgMSuBqkfY0qDHqU9XbdztWs0lH8KCt5CzSbvS7jQB/nQOXFnOd8
	 zwJhPQWCFHDxw==
Date: Tue, 14 Jun 2022 15:32:38 +0300
From: "jarkko@kernel.org" <jarkko@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <Yqh/5nn0AhdwaCm8@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
 <20220609034852.GA30873@lst.de>
 <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
 <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: "ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "paulus@samba.org" <paulus@samba.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hch@lst.de" <hch@lst.de>, "javierm@redhat.com" <javierm@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "michael.roth@amd.com" <michael.roth@amd.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, "ndesaulniers@google.com" <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "zepan@sipeed.com" <zepan@sipeed.com>, "guoren@kerne
 l.org" <guoren@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "luis.machado@linaro.org" <luis.machado@linaro.org>, "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "song@kernel.org" <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "deller@gmx.de" <deller@gmx.de>, "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>, "dave.anglin@bell.net" <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infra
 dead.org>, "dja@axtens.net" <dja@axtens.net>, "nico@f

luxnic.net" <nico@fluxnic.net>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "bristot@redhat.com" <bristot@redhat.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "kernel@esmil.dk" <kernel@esmil.dk>, "jniethe5@gmail.com" <jniethe5@gmail.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ast@kernel.org" <ast@kernel.org>, "will@kernel.org" <will@kernel.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Sakkinen, Jarkko" <jarkko@profian.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "elver@google.com" <elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "nathan@kernel.org" <nathan@kernel.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "egorenar@linux.ibm.com" <egorenar@linux.i
 bm.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "nathaniel@profian.com" <nathaniel@profian.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "huschle@linux.ibm.com" <huschle@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "ardb@kernel.org" <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "atomlin@redhat.com" <atomlin@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "liaochang1@
huawei.com" <liaochang1@huawei.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "changbin.du@intel.com" <changbin.du@intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 09, 2022 at 06:41:36PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2022-06-09 at 06:24 -0700, Luis Chamberlain wrote:
> > On Thu, Jun 09, 2022 at 05:48:52AM +0200, Christoph Hellwig wrote:
> > > On Wed, Jun 08, 2022 at 01:26:19PM -0700, Luis Chamberlain wrote:
> > > > No, that was removed because it has only one user.
> > > 
> > > That is only part of the story.  The other part is that the overall
> > > kernel simply does not have any business allocating exutable
> > > memory.
> > > Executable memory is a very special concept for modules or module-
> > > like
> > > code like kprobes, and should not be exposed as a general concept.
> > 
> > It is not just modules and kprobes, it is also ftrace and bpf too
> > now.
> > So while it should not be used everywhere calling it module_alloc()
> > is just confusing at this point. Likewise, module_alloc_huge() is
> > being proposed too and I'd rather we deal with this properly in
> > aligment
> > of taking care of the rename as well.
> > 
> > If the concern is to restrict access we can use the module namespace
> > stuff
> > so to ensure only intended users get access to it.
> 
> BPF even has multiple uses for text allocation. It has its own
> trampoline feature that puts different type of text in the allocation,
> with its own allocation routine. I looks like there are even more
> little allocators in there.
> 
> So yea, there seems to be a lot of the kernel in the business of
> dynamically generated text, for better or worse. I agree that it needs
> to be done carefully. However, these usages always seem to have the
> same problems (W^X, arch eccentricities, etc). So I don't think we
> should hide away the pieces. Instead we should have something with
> guard rails on it, so they can't get the allocation part wrong.
> 
> But I guess the question here is: what should we do in the meantime? It
> is kind of similar to the questions that came up around the bpf prog
> pack allocator. Should we hold up allocator related work until
> underlying problems are resolved and there is some mature core
> solution?
> 
> Personally I had thought we would need to do some clean switch to a
> much different interface. I still think someday it will be required,
> but it seems to be evolving naturally for the time being.
> 
> Like say for a next step we moved prog pack out of bpf into core code,
> gave it it's own copy of module_alloc(), and then made kprobes use it.
> Then we would have something with improved W^X guard rails, and kprobes
> would not depend on modules anymore. I think maybe it's a step in the
> right direction, even if it's not perfect.

So you're saying that I should (as a first step) basically clone
module_alloc() implementation for kprobes, and future for BPF 
use, in order to get a clean starting point?

BR, Jarkko
