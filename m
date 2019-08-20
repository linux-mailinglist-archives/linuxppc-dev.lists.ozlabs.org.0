Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65B961A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:54:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CXMj5V0SzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:54:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CVl90xPBzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:40:52 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7KCeYgc030746;
 Tue, 20 Aug 2019 07:40:34 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x7KCeXYY030745;
 Tue, 20 Aug 2019 07:40:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 20 Aug 2019 07:40:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] powerpc: Don't add -mabi= flags when building with Clang
Message-ID: <20190820124033.GQ31406@gate.crashing.org>
References: <20190818191321.58185-1-natechancellor@gmail.com>
 <20190819091930.GZ31406@gate.crashing.org>
 <20190820031538.GC30221@archlinux-threadripper>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820031538.GC30221@archlinux-threadripper>
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 08:15:38PM -0700, Nathan Chancellor wrote:
> On Mon, Aug 19, 2019 at 04:19:31AM -0500, Segher Boessenkool wrote:
> > On Sun, Aug 18, 2019 at 12:13:21PM -0700, Nathan Chancellor wrote:
> > > When building pseries_defconfig, building vdso32 errors out:
> > > 
> > >   error: unknown target ABI 'elfv1'
> > > 
> > > Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
> > > powerpc64le toolchain") added these flags to fix building GCC but
> > > clang is multitargeted and does not need these flags. The ABI is
> > > properly set based on the target triple, which is derived from
> > > CROSS_COMPILE.
> > 
> > You mean that LLVM does not *allow* you to select a different ABI, or
> > different ABI options, you always have to use the default.  (Everything
> > else you say is true for GCC as well).
> 
> I need to improve the wording of the commit message as it is really that
> clang does not allow a different ABI to be selected for 32-bit PowerPC,
> as the setABI function is not overridden and it defaults to false.

> GCC appears to just silently ignores this flag (I think it is the
> SUBSUBTARGET_OVERRIDE_OPTIONS macro in gcc/config/rs6000/linux64.h).

What flag?  -mabi=elfv[12]?

(Only irrelevant things are ever ignored; otherwise, please do a bug
report).

> It can be changed for 64-bit PowerPC it seems but it doesn't need to be
> with clang because everything is set properly internally (I'll find a
> better way to clearly word that as I am sure I'm not quite getting that
> subtlety right).

You can have elfv2 on BE, and e.g. the sysv ABI on LE.  Neither of those
is tested a lot.

> > (-mabi= does not set a "target ABI", fwiw, it is more subtle; please see
> > the documentation.  Unless LLVM is incompatible in that respect as well?)
> 
> Are you referring to the error message?

Yup.

> I suppose I could file an LLVM
> bug report on that but that message applies to all of the '-mabi='
> options, which may refer to a target ABI.

That depends on what you call "an ABI", I guess.  You can call any ABI
variant a separate ABI: you'll have to rebuild all of userland.  You can
also says ELFv1 and ELFv2 are pretty much the same thing, which is true
as well.  The way -mabi= is defined is the latter:

'-mabi=ABI-TYPE'
     Extend the current ABI with a particular extension, or remove such
     extension.  Valid values are 'altivec', 'no-altivec',
     'ibmlongdouble', 'ieeelongdouble', 'elfv1', 'elfv2'.


Segher
