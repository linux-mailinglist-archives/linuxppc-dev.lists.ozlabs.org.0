Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0454657F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJY82WQMz3g5y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tKaXvF9Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tKaXvF9Q;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJzly3NxWz3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 08:48:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3EBECB830AE
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527A2C341E5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654814920;
	bh=fXQHcxnj09/NTw2WTFOlO+YMcNuPa2JywCYJxs8h+OI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tKaXvF9QRb62Y+vempgVpRbPDoZKp3cW4FtttO8/7E0uh+KETERHOu8TdTzwWAwrU
	 xGtYH/7o85i8ECoYtdzu2/ShEXy+m07iogmJ9CUJeAlDjbQ2g3dhnnWKivbd6l611c
	 ETEuLIgJTOC8tmx8PPLKakpM2Y2Dg6Cu1wXK+Dtq8oLRIw63QxqKIzj32OHFg3Gsw6
	 AGkKVZWTMj49Mv8nIzBDTZVpv3vfd2s0qEMP1rFfNqr6ubzI6iC51MVz/LLcWo+V7V
	 Kl+ZJHKlUAAw9KLyuLFScyw6YZsSX2/8Tbyln3mxluYtmDgtXTwVPl4MHJ2O27WoCG
	 e1lej69VaPWJw==
Received: by mail-yb1-f178.google.com with SMTP id r82so44128752ybc.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jun 2022 15:48:40 -0700 (PDT)
X-Gm-Message-State: AOAM531bR+YMHiH6dE6Ffkjn8t/n96/J4axHXsdb3uYGO6SqH/HOcR5I
	rJZ85pvqyLghM76WFLHVCHQmgFe47xROXXa4Few=
X-Google-Smtp-Source: ABdhPJzemSM5GrpgirpnnQNTEDsYpAOxmoxNmoSmK2+phEV9mudE18JL5yVLSDRq4A8vq3lyLIBxhhDyWWNd79LGZgg=
X-Received: by 2002:a25:3b49:0:b0:664:5a43:5895 with SMTP id
 i70-20020a253b49000000b006645a435895mr1766286yba.9.1654814908410; Thu, 09 Jun
 2022 15:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220608000014.3054333-1-jarkko@profian.com> <CAJF2gTQgCn2CyZ4+VBqEEBT2b4+1KxoEXxrd+Ritk=58+U8EFA@mail.gmail.com>
 <YqAy0qjI4Lktk/uJ@iki.fi> <20220608232115.ccd4399f4a1d133e9b65c2a9@kernel.org>
 <CAPhsuW6iUieQvA6KqzSLgtxmjkVSWCuVwNA338DATb_myHxo7w@mail.gmail.com>
 <CAPhsuW6BzUtqnjvaGJScXRpghs0_V_phpdyd4_oAKhvmkX-GFw@mail.gmail.com>
 <YqEF6+YKqCHsWZJW@bombadil.infradead.org> <20220609034852.GA30873@lst.de>
 <YqH0iEgsi6+bwS3x@bombadil.infradead.org> <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
In-Reply-To: <e7dedb9086193ca7682edc10fabc4195894e5146.camel@intel.com>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jun 2022 15:48:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4rF1cFmdSUZD=Tw4QRmOf=v+V_2EhEphzJA5teqOrH0Q@mail.gmail.com>
Message-ID: <CAPhsuW4rF1cFmdSUZD=Tw4QRmOf=v+V_2EhEphzJA5teqOrH0Q@mail.gmail.com>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
 l.org" <guoren@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "luis.machado@linaro.org" <luis.machado@linaro.org>, "anemo@mba.ocn.ne.jp" <anemo@mba.ocn.ne.jp>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "anup@brainfault.org" <anup@brainfault.org>, "deller@gmx.de" <deller@gmx.de>, "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "philipp.tomsich@vrull.eu" <philipp.tomsich@vrull.eu>, "dave.anglin@bell.net" <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "dja@axtens.net" <dja@axte
 ns.net>, "nico@fluxnic.net" <nico@fluxnic.net>, "jark

ko@kernel.org" <jarkko@kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "bristot@redhat.com" <bristot@redhat.com>, "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "kernel@esmil.dk" <kernel@esmil.dk>, "jniethe5@gmail.com" <jniethe5@gmail.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ast@kernel.org" <ast@kernel.org>, "will@kernel.org" <will@kernel.org>, "masahiroy@kernel.org" <masahiroy@kernel.org>, "Sakkinen, Jarkko" <jarkko@profian.com>, "samitolvanen@google.com" <samitolvanen@google.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "elver@google.com" <elver@google.com>, "keescook@chromium.org" <keescook@chromium.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "nathan@kernel.org" <nathan@kernel.org>, "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>, "bp@alien8.de" <bp@alien8.de>, "egorenar@linux.ibm.com" <egorenar@lin
 ux.ibm.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "nathaniel@profian.com" <nathaniel@profian.com>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "huschle@linux.ibm.com" <huschle@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "yangtiezhu@loongson.cn" <yangtiezhu@loongson.cn>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "ardb@kernel.org" <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "atomlin@redhat.com" <atomlin@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.ed
 u>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "liaocha
ng1@huawei.com" <liaochang1@huawei.com>, "atishp@atishpatra.org" <atishp@atishpatra.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "tmricht@linux.ibm.com" <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "changbin.du@intel.com" <changbin.du@intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 9, 2022 at 11:41 AM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Thu, 2022-06-09 at 06:24 -0700, Luis Chamberlain wrote:

[...]

>
> Like say for a next step we moved prog pack out of bpf into core code,
> gave it it's own copy of module_alloc(), and then made kprobes use it.
> Then we would have something with improved W^X guard rails, and kprobes
> would not depend on modules anymore. I think maybe it's a step in the
> right direction, even if it's not perfect.

I was also thinking about where to put the prog pack allocator eventually.
Shall it be part of mm code or module code?

Btw, prog pack has more challenges with W^X requirement:
1. The arch need to have text poke mechanism;
2. Some users of prog pack need to learn to use the ROXbuffer with text poke,
  for example, how to calculate relative address differently.

Thanks,
Song
