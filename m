Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2B15B2995
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 00:49:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNvSK0bzPz3bry
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 08:49:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNvRw4HVCz2xHN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 08:48:44 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 288Me86X019587;
	Thu, 8 Sep 2022 17:40:08 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 288Me5E7019584;
	Thu, 8 Sep 2022 17:40:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 8 Sep 2022 17:40:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Message-ID: <20220908224005.GN25951@gate.crashing.org>
References: <20190621085822.1527-1-malat@debian.org> <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu> <87v8pyemmw.fsf@mpe.ellerman.id.au> <8afc110f-641e-40f0-9bf9-b7b2ca3df6a1@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afc110f-641e-40f0-9bf9-b7b2ca3df6a1@www.fastmail.com>
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
Cc: Mathieu Malaterre <malat@debian.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Sep 08, 2022 at 05:07:24PM +0200, Arnd Bergmann wrote:
> - if the XOR code has its frame size explode like this, it's
>   probably an indication of the compiler doing something wrong,
>   not the kernel code.

On the contrary, it is most likely an indication that the kernel code
wants something unreasonable.  Like, having 20 variables live at the
same time, but still wanting nicely scheduled machine code generated.

But I suspect GCC unrolled the loops here, even?  Best way to prevent
that here is to put an option in the Makefile, for these files.  We
don't want any of this unrolled after all?  Or, alternatively, remove
all the manual unrolling from this code, let GCC do its thing, without
painting it in a corner.

>   The result is likely that the "optimized"
>   XOR implementation is slower than the default version as a
>   result, and the kernel will pick the other one at boot time.

Yes.  So it's self-healing even, of a sort :-)


Segher
