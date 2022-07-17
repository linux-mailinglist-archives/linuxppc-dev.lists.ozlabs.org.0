Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744BD57780F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 21:58:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmG9m6Gw6z3c81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 05:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmG9M0nlvz2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 05:57:57 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26HJsmgu016415;
	Sun, 17 Jul 2022 14:54:48 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26HJsmPs016414;
	Sun, 17 Jul 2022 14:54:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 17 Jul 2022 14:54:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
Message-ID: <20220717195448.GB25951@gate.crashing.org>
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com> <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 07:44:22AM -0700, Linus Torvalds wrote:
> On Sun, Jul 17, 2022 at 2:13 AM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> > I was trying to check it. With gcc-11 the assembly code generated is
> > not using memset, but using __memset.
> > But with gcc-12, I can see the assembly code is using memset. One
> > example from the assembly:
> 
> You could try making the 'args' array in 'struct prom_args' be marked
> 'volatile'.
> 
> Ie something like this:
> 
>   --- a/arch/powerpc/kernel/prom_init.c
>   +++ b/arch/powerpc/kernel/prom_init.c
>   @@ -115,6 +115,6 @@ struct prom_args {
>            __be32 service;
>            __be32 nargs;
>            __be32 nret;
>   -          __be32 args[10];
>   +        volatile __be32 args[10];
>    };
> 
> because I think it's just the compilers turning the small loop over
> those fields into a "memset()".

Yes.  See <https://gcc.gnu.org/onlinedocs/gcc/Standards.html#C-Language>
near the end:
  Most of the compiler support routines used by GCC are present in
  libgcc, but there are a few exceptions. GCC requires the freestanding
  environment provide memcpy, memmove, memset and memcmp. Finally, if
  __builtin_trap is used, and the target does not implement the trap
  pattern, then GCC emits a call to abort.

Can't we simply have a small simple implementation of these functions in
arch/powerpc/boot/?  This stuff is not performance-critical, and this is
not the first time we hit these problems.


Segher
