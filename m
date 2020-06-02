Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F31EB311
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 03:39:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZT86C7XzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 11:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49bZQk75fyzDqR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 11:37:02 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0521ajvN013264;
 Mon, 1 Jun 2020 20:36:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0521ahNW013257;
 Mon, 1 Jun 2020 20:36:43 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Jun 2020 20:36:43 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200602013643.GL31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <20200530192212.GG31009@gate.crashing.org> <2956705.fEcJ0Lxnt5@sheen>
 <20200531204205.GI31009@gate.crashing.org>
 <4205b197-b964-451e-bc41-59b35d1dd233@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4205b197-b964-451e-bc41-59b35d1dd233@www.fastmail.com>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 01, 2020 at 12:29:56AM +0200, Daniel Kolesa wrote:
> On Sun, May 31, 2020, at 22:42, Segher Boessenkool wrote:
> > > There was just an assumption that LE == powerpc64le in libgo, spotted by 
> > > q66 (daniel@ on the CC). I just pushed the patch to [1].
> > 
> > Please send GCC patches to gcc-patches@ ?
> 
> FWIW, that patch alone is not very useful, we'd need to otherwise patch libgo to recognize a new GOARCH (as right now it's likely to just use 'ppc' which is wrong).

Gotcha.

> That said, we'll get back to you with any patches we have. One I can already think of - we will need to update the dynamic linker name so that it uses ld-musl-powerpcle.so instead of powerpc (musl needs to be updated the same way by adding the subarch variable for the 'le' prefix).

Thanks!  That would be good progress.

> > > > Almost no project that used 32-bit PowerPC in LE mode has sent patches
> > > > to the upstreams.
> > > 
> > > Right, but I have heard concerns from at least one person familiar with 
> > > the ppc kernel about breaking existing users of this arch-endianness 
> > > combo, if any. It seems likely that none of those use upstream, though ^^;
> > 
> > So we don't care, because we *cannot* care.
> 
> Well, that's the reason this thread was opened in the first place - to call out to any potential users, and synchronize with upstreams on a single way forward that all upstreams can agree on, since this effort requires changes in various parts of the stack. We don't want to hog changes locally or otherwise do any changes that would be in conflict with upstream projects, as that would mean needlessly diverging, which only means trouble later on.

Much appreciated!

I don't actually foresee any huge problems -- just lots of hard work ;-)


Segher
