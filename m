Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8C07AA38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 15:55:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ydNC3St3zDqJ7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 23:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ydG64NqnzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 23:49:34 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6UDmwB5006744;
 Tue, 30 Jul 2019 08:48:58 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6UDmu7O006742;
 Tue, 30 Jul 2019 08:48:56 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 30 Jul 2019 08:48:56 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
Message-ID: <20190730134856.GO31406@gate.crashing.org>
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
 <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2019 at 09:34:28AM +0200, Arnd Bergmann wrote:
> Upon a second look, I think the issue is that the "Z" is an input argument
> when it should be an output. clang decides that it can make a copy of the
> input and pass that into the inline asm. This is not the most efficient
> way, but it seems entirely correct according to the constraints.

Most dcb* (and all icb*) do not change the memory pointed to.  The
memory is an input here, logically as well, and that is obvious.

> Changing it to an output "=Z" constraint seems to make it work:
> 
> https://godbolt.org/z/FwEqHf
> 
> Clang still doesn't use the optimum form, but it passes the correct pointer.

As I said many times already, LLVM does not seem to treat all asm
operands as lvalues.  That is a bug.  And it is critical for memory
operands for example, as should be obvious if you look at at for a few
seconds (you pass *that* memory, not a copy of it).  The thing you pass
has an identity.  It's an lvalue.  This is true for *all* inline asm
operands, not just output operands and memory operands, but it is most
obvious there.

Or, LLVM might have a bug elsewhere.

Either way, the asm is fine, and it has worked fine in GCC since
forever.  Changing this constraint to be an output constraint would
just be obfuscation (we could change *all* operands to *everything* to
be inout ("+") constraints, and it won't affect correctness, just the
reader's sanity).


Segher
