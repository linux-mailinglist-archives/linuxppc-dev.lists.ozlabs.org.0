Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11943341BD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:56:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F22RR0W3jz3c4t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AvllA/pN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=AvllA/pN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F22R06zhPz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:55:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0932460233;
 Fri, 19 Mar 2021 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616154952;
 bh=xEggSgwLTsxsRSBCrktgETXhVT4kXbKFtICLOdi9pY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvllA/pNHM01eptUHALZqK7jqyXMvVBQyy3Hx/6pWSGz2zC6ZVyEFWmPuJSVPDd3R
 6I77gkfy9yLXyZfPIB0HjJtdc62tYVEuDd1/RNd7GoPlKTTQRniu0+Gv41CynFYGdq
 0DdY5Uh7Znaay4BVVuRq/Q79Ak9ueJzm9S6+Bvr8=
Date: Fri, 19 Mar 2021 12:55:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Subject: Re: [for-stable-4.19 PATCH 1/2] vmlinux.lds.h: Create section for
 protection against instrumentation
Message-ID: <YFSRRux3FHJVgWXt@kroah.com>
References: <20210318235416.794798-1-drinkcat@chromium.org>
 <20210319075410.for-stable-4.19.1.I222f801866f71be9f7d85e5b10665cd4506d78ec@changeid>
 <YFR/fQIePjDQcO5W@kroah.com>
 <b5d3d0ed-953e-083d-15f6-4a1e3ed95428@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5d3d0ed-953e-083d-15f6-4a1e3ed95428@oracle.com>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arch@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Christopher Li <sparse@chrisli.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-sparse@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 12:20:22PM +0100, Alexandre Chartre wrote:
> 
> On 3/19/21 11:39 AM, Greg Kroah-Hartman wrote:
> > On Fri, Mar 19, 2021 at 07:54:15AM +0800, Nicolas Boichat wrote:
> > > From: Thomas Gleixner <tglx@linutronix.de>
> > > 
> > > commit 6553896666433e7efec589838b400a2a652b3ffa upstream.
> > > 
> > > Some code pathes, especially the low level entry code, must be protected
> > > against instrumentation for various reasons:
> > > 
> > >   - Low level entry code can be a fragile beast, especially on x86.
> > > 
> > >   - With NO_HZ_FULL RCU state needs to be established before using it.
> > > 
> > > Having a dedicated section for such code allows to validate with tooling
> > > that no unsafe functions are invoked.
> > > 
> > > Add the .noinstr.text section and the noinstr attribute to mark
> > > functions. noinstr implies notrace. Kprobes will gain a section check
> > > later.
> > > 
> > > Provide also a set of markers: instrumentation_begin()/end()
> > > 
> > > These are used to mark code inside a noinstr function which calls
> > > into regular instrumentable text section as safe.
> > > 
> > > The instrumentation markers are only active when CONFIG_DEBUG_ENTRY is
> > > enabled as the end marker emits a NOP to prevent the compiler from merging
> > > the annotation points. This means the objtool verification requires a
> > > kernel compiled with this option.
> > > 
> > > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > > Reviewed-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> > > Acked-by: Peter Zijlstra <peterz@infradead.org>
> > > Link: https://lkml.kernel.org/r/20200505134100.075416272@linutronix.de
> > > 
> > > [Nicolas: context conflicts in:
> > > 	arch/powerpc/kernel/vmlinux.lds.S
> > > 	include/asm-generic/vmlinux.lds.h
> > > 	include/linux/compiler.h
> > > 	include/linux/compiler_types.h]
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > 
> > Did you build this on x86?
> > 
> > I get the following build error:
> > 
> > ld:./arch/x86/kernel/vmlinux.lds:20: syntax error
> > 
> > And that line looks like:
> > 
> >   . = ALIGN(8); *(.text.hot .text.hot.*) *(.text .text.fixup) *(.text.unlikely .text.unlikely.*) *(.text.unknown .text.unknown.*) . = ALIGN(8); __noinstr_text_start = .; *(.__attribute__((noinline)) __attribute__((no_instrument_function)) __attribute((__section__(".noinstr.text"))).text) __noinstr_text_end = .; *(.text..refcount) *(.ref.text) *(.meminit.text*) *(.memexit.text*)
> > 
> 
> In the NOINSTR_TEXT macro, noinstr is expanded with the value of the noinstr
> macro from linux/compiler_types.h while it shouldn't.
> 
> The problem is possibly that the noinstr macro is defined for assembly. Make
> sure that the macro is not defined for assembly e.g.:
> 
> #ifndef __ASSEMBLY__
> 
> /* Section for code which can't be instrumented at all */
> #define noinstr								\
> 	noinline notrace __attribute((__section__(".noinstr.text")))
> 
> #endif

This implies that the backport is incorrect, so I'll wait for an updated
version...

thanks,

greg k-h
