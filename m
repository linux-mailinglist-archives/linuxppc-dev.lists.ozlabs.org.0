Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1473F9B0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 16:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx2ZW3XFhz3bhl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 00:45:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gx2Z16RZ3z2yNl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 00:45:13 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17REemKD003680;
 Fri, 27 Aug 2021 09:40:48 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17REel3N003679;
 Fri, 27 Aug 2021 09:40:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 27 Aug 2021 09:40:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
Message-ID: <20210827144047.GN1583@gate.crashing.org>
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
 <20210813200508.7bqehxgd6ruerds5@google.com>
 <20210814125812.GC1583@gate.crashing.org>
 <CAFP8O3LZ3ZtpkF=RdyDyyXn40oYeDkqgY6NX7YRsBWeVnmPv1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3LZ3ZtpkF=RdyDyyXn40oYeDkqgY6NX7YRsBWeVnmPv1A@mail.gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, Aug 14, 2021 at 12:34:15PM -0700, Fāng-ruì Sòng wrote:
> On Sat, Aug 14, 2021 at 5:59 AM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Fri, Aug 13, 2021 at 01:05:08PM -0700, Fangrui Song wrote:
> > > Text relocations are considered very awful by linker developers.
> >
> > By very few linker developers.

> https://groups.google.com/g/generic-abi/c/Ckq19PfLxyk/m/uW29sgkoAgAJ
> Ali Bahrami: "My opinion is that no one wants text relocations, but
> not labeling them if they do exist doesn't seem right. I find the
> presence of DF_TEXTREL very interesting when diagnosing various
> issues."

I don't know who that is, and that post has no context.

> https://gcc.gnu.org/legacy-ml/gcc/2016-04/msg00138.html
> ( "So why not simply create 'dynamic text relocations' then?  Is that
> possible with a pure linker change?" )
> Cary Coutant: "Ugh. Besides being a bad idea from a performance point
> of view, it's not even always possible to do. Depending on the
> architecture, a direct reference from an executable to a variable in a
> shared library may not have the necessary reach."

That is about a very specific kind of relocation.

> binutils-gdb commit "Add linker option: --warn-shared-textrel to
> produce warnings when adding a DT_TEXTREL to a shared object."
> Nick Clifton

That does not say text relocations are bad.  Of course you want to know
if they are there, for various reasons, like, if they are disallowed on
some systems.

> https://www.openwall.com/lists/musl/2020/09/26/3
> Szabolcs Nagy: "nice.  and gcc passes -z text for static pie code so
> that case should not end up with text rels."

That does not say text relocations are bad.

> Someone wrote "Overall, the overhead of processing text relocations
> can cause serious performance degradation." in Solaris' Linker and
> Libraries Guide.

In process startup, sure.  And it can make those processes run faster
as well.  That is the tradeoff with *all* relocations; you can make any
code without any relocations.  Relocations are a tradeoff, like most
things.

> > How would this be a benefit to security?
> 
> https://flameeyes.blog/2016/01/16/textrels-text-relocations-and-their-impact-on-hardening-techniques/

This means that those "hardening techniques" have some serious
weaknesses, that is all.  And hardening is not part of security
anyway; it is impact mitigation.

> FWIW I contributed a glibc patch allowing TEXTREL to co-exist with ifunc.
> It requires temporary mapping the text segment W^X.

What does W^X mean here?  It normally means no mapping is both writable
and executable at the same time.

> > > There are no text relocations, therefore no need for -z notext.
> >
> > This is a choice by the compiler, nothing more.  It saves some process
> > startup time, and allows slightly more maps to be shared by processes
> > that run the same images.  But it is a tradeoff, so it might change; and
> > of course it is not an ABI requirement.

> Text relocations are generally awful.

Great arguments, thanks!  :-P

> GNU ld and gold's traditional "add DF_TEXTREL on-demand" behavior made
> such user errors easy to make.

That has no bearing on if text relocations are useful or not.

> I understand that kernels are special applications where we apply
> relocations once and many user-space objection can be less of a
> concern/ignored.
> However, the Linux kernel is already in a position where many linker
> options are controlled and thus should specify -z notext to make
> the intention explicit, or fix the problems (I think x86-64 is good;
> that said, powerpc
> has a higher cost using PC-relative instructions so pay the oneshot relocation
> time cost probably isn't a bad choice)

I have no idea what you mean.


Segher
