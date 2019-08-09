Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD68855E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 23:57:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464zct6xBdzDr3T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 07:57:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 464zZw5WsHzDrMm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 07:56:08 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x79LtXlt029610;
 Fri, 9 Aug 2019 16:55:33 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x79LtWbT029609;
 Fri, 9 Aug 2019 16:55:32 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 9 Aug 2019 16:55:32 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
Message-ID: <20190809215531.GN31406@gate.crashing.org>
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
 <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
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

On Fri, Aug 09, 2019 at 08:28:19PM +0200, Arnd Bergmann wrote:
> On Fri, Aug 9, 2019 at 8:21 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> 
> >  static inline void dcbz(void *addr)
> >  {
> > -       __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
> > +       __asm__ __volatile__ ("dcbz %y0" : "=Z"(*(u8 *)addr) :: "memory");
> >  }
> >
> >  static inline void dcbi(void *addr)
> >  {
> > -       __asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory");
> > +       __asm__ __volatile__ ("dcbi %y0" : "=Z"(*(u8 *)addr) :: "memory");
> >  }
> 
> I think the result of the discussion was that an output argument only kind-of
> makes sense for dcbz, but for the others it's really an input, and clang is
> wrong in the way it handles the "Z" constraint by making a copy, which it
> doesn't do for "m".

Yes.  And clang has probably miscompiled this in all kernels since we
have used "Z" for the first time, in 2008 (0f3d6bcd391b).

It is not necessarily fatal or at least not easily visible for the I/O
accessors: it "just" gets memory ordering wrong slightly (it looks like
it does the sync;tw;isync thing around an extra stack access, after it
has performed the actual I/O as any other memory load, without any
synchronisation).

> I'm not sure whether it's correct to use "m" instead of "Z" here, which
> would be a better workaround if that works. More importantly though,
> clang really needs to be fixed to handle "Z" correctly.

"m" allows offset addressing, which these insns do not.  That is the
same reason you need the "y" output modifier.  "m" is wrong here.

We have other memory constraints, but do those work with LLVM?


Segher
