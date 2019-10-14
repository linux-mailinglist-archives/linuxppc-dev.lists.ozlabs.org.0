Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D41D69F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 21:13:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sSs42xrZzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 06:13:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sSpy3lq9zDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 06:11:54 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x9EJBhSD000977;
 Mon, 14 Oct 2019 14:11:43 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x9EJBgBM000976;
 Mon, 14 Oct 2019 14:11:42 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 14 Oct 2019 14:11:41 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Message-ID: <20191014191141.GK28442@gate.crashing.org>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
 <20191014025101.18567-4-natechancellor@gmail.com>
 <20191014093501.GE28442@gate.crashing.org>
 <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 14, 2019 at 08:56:12AM -0700, Nick Desaulniers wrote:
> On Mon, Oct 14, 2019 at 2:35 AM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Sun, Oct 13, 2019 at 07:51:01PM -0700, Nathan Chancellor wrote:
> > > r374662 gives LLVM the ability to convert certain loops into a reference
> > > to bcmp as an optimization; this breaks prom_init_check.sh:
> >
> > When/why does LLVM think this is okay?  This function has been removed
> > from POSIX over a decade ago (and before that it always was marked as
> > legacy).
> 
> Segher, do you have links for any of the above? If so, that would be
> helpful to me.

Sure!

https://pubs.opengroup.org/onlinepubs/9699919799/xrat/V4_xsh_chap03.html

Older versions are harder to find online, unfortunately.  But there is

https://kernel.org/pub/linux/docs/man-pages/man-pages-posix/

in which man3p/bcmp.3p says:

FUTURE DIRECTIONS
       This function may be withdrawn in a future version.

Finally, the Linux man pages say (man bcmp):

CONFORMING TO
       4.3BSD.   This  function   is   deprecated   (marked   as   LEGACY   in
       POSIX.1-2001): use memcmp(3) in new programs.  POSIX.1-2008 removes the
       specification of bcmp().


> I'm arguing against certain transforms that assume that
> one library function is faster than another, when such claims are
> based on measurements from one stdlib implementation.

Wow.  The difference between memcmp and bcmp is trivial (just the return
value is different, and that costs hardly anything to add).  And memcmp
is guaranteed to exist since C89/C90 at least.

> The rationale for why it was added was that memcmp takes a measurable
> amount of time in Google's fleet, and most calls to memcmp don't care
> about the position of the mismatch; bcmp is lower overhead (or at
> least for our libc implementation, not sure about others).

You just have to do the read of the last words you compare as big-endian,
and then you can just subtract the two words, convert that to "int" (which
is very inconvenient to do, but hardly expensive), and there you go.

Or on x86 use the bswap insn, or something like it.

Or, if you use GCC, it has __builtin_memcmp but also __builtin_memcmp_eq,
and those are automatically used, too.


Segher
