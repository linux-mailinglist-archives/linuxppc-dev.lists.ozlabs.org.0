Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88D54D7A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:57:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlfv2mSWz3f1k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:57:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNFwG6dhVz3blJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 16:37:17 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D469067373; Wed, 15 Jun 2022 08:37:07 +0200 (CEST)
Date: Wed, 15 Jun 2022 08:37:07 +0200
From: "hch@lst.de" <hch@lst.de>
To: "jarkko@kernel.org" <jarkko@kernel.org>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <20220615063707.GA22930@lst.de>
References: <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com> <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org> <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com> <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com> <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de> <YqH0iEgsi6+bwS3x@bombadil.infradead.org> <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com> <Yqh/5nn0AhdwaCm8@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqh/5nn0AhdwaCm8@iki.fi>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: "ashimida@linux.alibaba.com" <ashimida@linux.alibaba.com>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "paulus@samba.org" <paulus@samba.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hch@lst.de" <hch@lst.de>, "javierm@redhat.com" <javierm@redhat.com>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "michael.roth@amd.com" <michael.roth@amd.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, "ndesaulniers@google.com" <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "zepan@sipeed.com" <zepan@sipeed.com>, "guoren@kerne
 l.org" <guoren@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "luis.machado@linaro.org" <luis.machado@linaro.org>, "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "song@kernel.org" <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "deller@gmx.de" <deller@gmx.de>, "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>, "dave.anglin@bell.net" <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infra
 dead.org>, "dja@axtens.net" <dja@axtens.net>, "nico@f

luxnic.net" <nico@fluxnic.net>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "bristot@redhat.com" <bristot@redhat.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "kernel@esmil.dk" <kernel@esmil.dk>, "jniethe5@gmail.com" <jniethe5@gmail.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ast@kernel.org" <ast@kernel.org>, "will@kernel.org" <will@kernel.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Sakkinen, Jarkko" <jarkko@profian.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "elver@google.com" <elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "nathan@kernel.org" <nathan@kernel.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alie
 n8.de>, "egorenar@linux.ibm.com" <egorenar@linux.ibm.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "nathaniel@profian.com" <nathaniel@profian.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "huschle@linux.ibm.com" <huschle@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "ardb@kernel.org" <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "atomlin@redhat.com" <atomlin@redhat.com>,
  "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "hc
a@linux.ibm.com" <hca@linux.ibm.com>, "liaochang1@huawei.com" <liaochang1@huawei.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "changbin.du@intel.com" <changbin.du@intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 03:32:38PM +0300, jarkko@kernel.org wrote:
> > Like say for a next step we moved prog pack out of bpf into core code,
> > gave it it's own copy of module_alloc(), and then made kprobes use it.
> > Then we would have something with improved W^X guard rails, and kprobes
> > would not depend on modules anymore. I think maybe it's a step in the
> > right direction, even if it's not perfect.
> 
> So you're saying that I should (as a first step) basically clone
> module_alloc() implementation for kprobes, and future for BPF 
> use, in order to get a clean starting point?

I don't think cloning the code helps anyone.  The fact that except
for the eBPF mess everyone uses module_alloc and the related
infrastructure is a feature and not a bug.  The interface should
become better than what we have right now, but there is few enough
users that this can be done in one go.

So assuming we really care deeply enough about fancy tracing without
modules (and I'm not sure we do, even if you don't use modules it
doesn't hurt to just build the modules code, I do that all the time
for my test machines), the general approach in your series is the
right one.
