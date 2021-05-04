Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A34C372587
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 07:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ7jx2j9Rz301s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:31:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=thorsis.com (client-ip=92.198.35.195; helo=mail.thorsis.com;
 envelope-from=ada@thorsis.com; receiver=<UNKNOWN>)
Received: from mail.thorsis.com (mail.thorsis.com [92.198.35.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ7jW25pNz2xxp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 15:30:54 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 31A1210B4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 07:30:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrZ_vSUSsYeu for <linuxppc-dev@lists.ozlabs.org>;
 Tue,  4 May 2021 07:30:50 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id AC59C3581; Tue,  4 May 2021 07:30:49 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
 *      blocked.  See
 *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 *      for more information. *      [URIs: thorsis.com]
 * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
 * -0.0 NO_RECEIVED Informational: message has no Received headers
Date: Tue, 4 May 2021 07:30:30 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>,
 Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Arnd,

Am Mon, May 03, 2021 at 11:25:21AM +0200 schrieb Arnd Bergmann:
> On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> >
> > Desktops and servers are all nice, however I just want to make you
> > aware, there are embedded users forced to stick to older cross
> > toolchains for different reasons as well, e.g. in industrial
> > environment. :-)
> >
> > This is no show stopper for us, I just wanted to let you be aware.
> 
> Can you be more specific about what scenarios you are thinking of,
> what the motivations are for using an old compiler with a new kernel
> on embedded systems, and what you think a realistic maximum
> time would be between compiler updates?

One reason might be certification. For certain industrial applications
like support for complex field bus protocols, you need to get your
devices tested by an external partner running extensive test suites.
This is time consuming and expensive. 

Changing the toolchain of your system then, would be a massive change
which would require recertification, while you could argue just
updating a single component like the kernel and building everything
again, does not require the whole testing process again. 

Thin ice, I know.

> One scenario that I've seen previously is where user space and
> kernel are built together as a source based distribution (OE, buildroot,
> openwrt, ...), and the compiler is picked to match the original sources
> of the user space because that is best tested, but the same compiler
> then gets used to build the kernel as well because that is the default
> in the build environment.

One problem we actually ran into in BSPs like that (we build with
ptxdist, however build system doesn't matter here, it could as well
have been buildroot etc.) was things* failing to build with newer
compilers, things we could not or did not want to fix, so staying with
an older toolchain was the obvious choice. 

*Things as in bootloaders for an armv5 platform.

> There are two problems I see with this logic:
> 
> - Running the latest kernel to avoid security problems is of course
>   a good idea, but if one runs that with ten year old user space that
>   is never updated, the system is likely to end up just as insecure.
>   Not all bugs are in the kernel.

Agreed.

> - The same logic that applies to ancient user space staying with
>   an ancient compiler (it's better tested in this combination) also
>   applies to the kernel: running the latest kernel on an old compiler
>   is something that few people test, and tends to run into more bugs
>   than using the compiler that other developers used to test that
>   kernel.

What we actually did: building recent userspace and kernel with older
toolchains, because bootloader. I know, there are several
possibilities to solve this kind of lock:

- built bootloader with different compiler
- update bootloader
- …

As said before, this is no problem for me now, I can work around it,
but to give an idea what could keep people on older toolchains.

Greets
Alex

