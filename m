Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D295785F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 17:01:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmlXw1hH2z3c7r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 01:01:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmlXW6wXBz3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 01:01:15 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26IEu3b6021466;
	Mon, 18 Jul 2022 09:56:03 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26IEu2Km021465;
	Mon, 18 Jul 2022 09:56:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 18 Jul 2022 09:56:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
Message-ID: <20220718145601.GE25951@gate.crashing.org>
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com> <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com> <20220717195448.GB25951@gate.crashing.org> <87k08bdqm1.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k08bdqm1.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 01:52:38PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> > Can't we simply have a small simple implementation of these functions in
> > arch/powerpc/boot/?  This stuff is not performance-critical, and this is
> > not the first time we hit these problems.
> 
> prom_init.c isn't in arch/powerpc/boot :)

Ah duh :-)

> It's linked into the kernel proper, but we want it to behave like a
> pre-boot environment (because not all boot paths run it) which is why we
> restrict what symbols it can call.
> 
> We could have a prom_memset() etc. but we'd need to do some tricks to
> rewrite references to memset() to prom_memset() before linking.

You can do it in its linker script?


Segher
