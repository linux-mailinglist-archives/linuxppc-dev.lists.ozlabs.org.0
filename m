Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9154D7B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 04:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlkJ5SYSz3fHr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 12:00:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jRcv7OdG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jRcv7OdG;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNdm22XGGz3bp3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 07:31:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 206FF617C0;
	Wed, 15 Jun 2022 21:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8F8C3411A;
	Wed, 15 Jun 2022 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655328687;
	bh=h/A3iOsL+jSiXeun+GclseG7VDKI7T9E6iC83VBXQmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRcv7OdG8w6WZvKDmpHu4ZTNDPKNmUeNwkF/5kyOU3kogbTfbnziKBi4Jemy89mPK
	 VB9ZLSW8Ef+8WhlhpERgKh3C4AwlLVT0YSGP+NZY7Y8aQQnRCCTfxkla/ct4P4xzOS
	 m384ySKBIIAd638YYDqCOcxaXX3uj/4hJTyxkYvLHgkuIFRDDkI8+xZ2gKK6GJvocM
	 p6WIsw8yQJAavGl0gEUO2R8b7panqmJ9rBrYblYA0mmSsjYt6gOUgcj3KHSNIx9Iq4
	 CevdQYGBbuq+VVg9ZAfGZt1g9BYutIbzx1PyMaX9HpjQg/PQYxJc+gN2u0EeJbcuw0
	 5w3ycwJy5spww==
Date: Thu, 16 Jun 2022 00:29:18 +0300
From: "jarkko@kernel.org" <jarkko@kernel.org>
To: "hch@lst.de" <hch@lst.de>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqpPLqW6/AWEQhGr@iki.fi>
References: <YqAy0qjI4Lktk/uJ@iki.fi>
 <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org>
 <20220609034852.GA30873@lst.de>
 <YqH0iEgsi6+bwS3x@bombadil.infradead.org>
 <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
 <Yqh/5nn0AhdwaCm8@iki.fi>
 <20220615063707.GA22930@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615063707.GA22930@lst.de>
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: "ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "paulus@samba.org" <paulus@samba.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "javierm@redhat.com" <javierm@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "michael.roth@amd.com" <michael.roth@amd.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, "ndesaulniers@google.com" <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "zepan@sipeed.com" <zepan@sipeed.com>, "guoren@kernel.org" <guoren@kernel.org>,
  "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "luis.machado@linaro.org" <luis.machado@linaro.org>, "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "song@kernel.org" <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "deller@gmx.de" <deller@gmx.de>, "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>, "dave.anglin@bell.net" <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "dja@axtens.net"
  <dja@axtens.net>, "nico@fluxnic.net" <nico@fluxnic.n

et>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "bristot@redhat.com" <bristot@redhat.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "kernel@esmil.dk" <kernel@esmil.dk>, "jniethe5@gmail.com" <jniethe5@gmail.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ast@kernel.org" <ast@kernel.org>, "will@kernel.org" <will@kernel.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Sakkinen, Jarkko" <jarkko@profian.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "elver@google.com" <elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "nathan@kernel.org" <nathan@kernel.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "egorenar@linux.ibm
 .com" <egorenar@linux.ibm.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "nathaniel@profian.com" <nathaniel@profian.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "huschle@linux.ibm.com" <huschle@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "ardb@kernel.org" <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "atomlin@redhat.com" <atomlin@redhat.com>, "aou@eecs.berkeley.edu" <a
 ou@eecs.berkeley.edu>, "hca@linux.ibm.com" <hca@linux
.ibm.com>, "liaochang1@huawei.com" <liaochang1@huawei.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "changbin.du@intel.com" <changbin.du@intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 15, 2022 at 08:37:07AM +0200, hch@lst.de wrote:
> On Tue, Jun 14, 2022 at 03:32:38PM +0300, jarkko@kernel.org wrote:
> > > Like say for a next step we moved prog pack out of bpf into core code,
> > > gave it it's own copy of module_alloc(), and then made kprobes use it.
> > > Then we would have something with improved W^X guard rails, and kprobes
> > > would not depend on modules anymore. I think maybe it's a step in the
> > > right direction, even if it's not perfect.
> > 
> > So you're saying that I should (as a first step) basically clone
> > module_alloc() implementation for kprobes, and future for BPF 
> > use, in order to get a clean starting point?
> 
> I don't think cloning the code helps anyone.  The fact that except
> for the eBPF mess everyone uses module_alloc and the related
> infrastructure is a feature and not a bug.  The interface should
> become better than what we have right now, but there is few enough
> users that this can be done in one go.
> 
> So assuming we really care deeply enough about fancy tracing without
> modules (and I'm not sure we do, even if you don't use modules it
> doesn't hurt to just build the modules code, I do that all the time
> for my test machines), the general approach in your series is the
> right one.

OK, thanks for the elaboration!

However I bake it, I doubt that next version is going to be the final
version, given all the angles. Therefore, I mostly Christophe's
suggestions on compilation flags, and also split this into per-arch
patches.

That should be at least to the right direction.

BR, Jarkko
