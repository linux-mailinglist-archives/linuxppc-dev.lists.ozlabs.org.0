Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2869AAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 20:18:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nWxK0BKxzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 04:18:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nWv51W2QzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 04:16:32 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6FIGLFP018897;
 Mon, 15 Jul 2019 13:16:21 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6FIGJFp018896;
 Mon, 15 Jul 2019 13:16:19 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 15 Jul 2019 13:16:18 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
Message-ID: <20190715181618.GG20882@gate.crashing.org>
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
 <CAK7LNATGEK9wxz87J3sTNOYPdtAFXaegQU9EctEBGULQL-ZC4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATGEK9wxz87J3sTNOYPdtAFXaegQU9EctEBGULQL-ZC4w@mail.gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2019 at 09:03:46PM +0900, Masahiro Yamada wrote:
> On Mon, Jul 15, 2019 at 4:30 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Mon, Jul 15, 2019 at 05:05:34PM +1000, Michael Ellerman wrote:
> > > Segher Boessenkool <segher@kernel.crashing.org> writes:
> > > > Yes, that is why I used the environment variable, all binutils work
> > > > with that.  There was no --target option in GNU ar before 2.22.
> 
> I use binutils 2.30
> It does not understand --target option.
> 
> $ powerpc-linux-ar --version
> GNU ar (GNU Binutils) 2.30
> Copyright (C) 2018 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) any later version.
> This program has absolutely no warranty.
> 
> If I give --target=elf$(BITS)-$(GNUTARGET) option, I see this:
> powerpc-linux-ar: -t: No such file or directory

You need to provide a valid command line, like

$ powerpc-linux-ar tv smth.a --target=elf32-powerpc

ar is a bit weird.


Segher
