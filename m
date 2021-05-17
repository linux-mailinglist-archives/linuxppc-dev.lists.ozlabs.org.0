Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4DA383D03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 21:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkTML6Xwmz3bsm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 05:14:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FkTLz4GzKz2xvX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 05:13:44 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14HJAYe3010889;
 Mon, 17 May 2021 14:10:34 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14HJAXEs010888;
 Mon, 17 May 2021 14:10:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 17 May 2021 14:10:32 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Message-ID: <20210517191032.GU10366@gate.crashing.org>
References: <20210513115904.519912-1-aik@ozlabs.ru>
 <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
 <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
 <20210514084649.GI10366@gate.crashing.org>
 <f8d64d7d-cd2b-342a-de6a-c14a5df9462c@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d64d7d-cd2b-342a-de6a-c14a5df9462c@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, May 17, 2021 at 01:23:11PM +1000, Alexey Kardashevskiy wrote:
> On 5/14/21 18:46, Segher Boessenkool wrote:
> >On Fri, May 14, 2021 at 11:42:32AM +0900, Masahiro Yamada wrote:
> >>In my best guess, the reason why powerpc adding the endian flag to CPP
> >>is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S
> >>
> >>#ifdef __LITTLE_ENDIAN__
> >>OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
> >>#else
> >>OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> >>#endif
> >
> >Which is equivalent to
> >
> >#ifdef __LITTLE_ENDIAN__
> >OUTPUT_FORMAT("elf64-powerpcle")
> >#else
> >OUTPUT_FORMAT("elf64-powerpc")
> >#endif
> >
> >so please change that at the same time if you touch this :-)
> 
> "If you touch this" approach did not work well with this patch so sorry 
> but no ;)
> 
> and for a separate patch, I'll have to dig since when it is equal, do 
> you know?

Since 1994, when the three-arg version was introduced (the one-arg
version is from 1992).

> >>__LITTLE_ENDIAN__  is defined by powerpc gcc and clang.
> >
> >This predefined macro is required by the newer ABIs, but all older
> 
> That's good so I'll stick to it.

Great.

> >You can just write -mbig and -mlittle btw.  Those aren't available on
> >all targets, but neither are the long-winded -m{big,little}-endian
> >option names.  Pet peeve, I know :-)
> 
> I am looking the same guarantees across modern enough gcc and clang and 
> I am not sure all of the above is valid for clang 10.0.something (or 
> whatever we say we support) ;)

-mbig/-mlittle is supported in GCC since times immemorial.  Whether LLVM
supports it as well just depends on how good their emulation is, I have
no idea.


Segher
