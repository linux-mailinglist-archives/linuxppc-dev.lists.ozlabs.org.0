Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABF7B36F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 21:37:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ymzG3hHDzDqWv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 05:37:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ymx84tWtzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 05:35:24 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6UJZ30i024763;
 Tue, 30 Jul 2019 14:35:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6UJZ26C024762;
 Tue, 30 Jul 2019 14:35:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 30 Jul 2019 14:35:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
Message-ID: <20190730193502.GR31406@gate.crashing.org>
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
 <20190729215200.GN31406@gate.crashing.org>
 <CAK8P3a1GQSyCj1L8fFG4Pah8dr5Lanw=1yuimX1o+53ARzOX+Q@mail.gmail.com>
 <20190730134856.GO31406@gate.crashing.org>
 <CAK8P3a2755_6xq453C2AePLW8BeQk_Jg=HfjB_F-zyVMnQDfdg@mail.gmail.com>
 <20190730161637.GP31406@gate.crashing.org>
 <CAK8P3a0_ovcX9tOo1UQ3_1UmM=+A2X=yErw27i2pHOj4XD40-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0_ovcX9tOo1UQ3_1UmM=+A2X=yErw27i2pHOj4XD40-A@mail.gmail.com>
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

On Tue, Jul 30, 2019 at 08:24:14PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 30, 2019 at 6:16 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > in_le32 and friends?  Yeah, huh.  If LLVM copies that to the stack as
> > well, its (not byte reversing) read will be atomic just fine, so things
> > will still work correctly.
> 
> byteorder is fine, the problem I was thinking of is when moving the load/store
> instructions around the barriers that synchronize with DMA, or turning
> them into different-size accesses. Changing two consecutive 16-bit mmio reads
> into an unaligned 32-bit read will rarely have the intended effect ;-)

Most such barriers will also work on the copy accesses, I think.  But
yes it depends on exactly how it is written.  The {in,out}_{be,le}<N>
ones use sync;store for out and sync;load;trap;isync for in, so they
should be safe ;-)

(Well, almost -- writes to I/O will not necessarily actually happen
before other stores, not from these macros alone at least).

Should be pretty easy to check what LLVM makes of this?


Segher
