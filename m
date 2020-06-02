Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF551EB31B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 03:44:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZbG65KdzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 11:44:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49bZYM1JLKzDqDN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 11:42:46 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0521gSr7013590;
 Mon, 1 Jun 2020 20:42:29 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0521gSOw013589;
 Mon, 1 Jun 2020 20:42:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Jun 2020 20:42:27 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200602014227.GM31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 binutils@sourceware.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joseph,

On Mon, Jun 01, 2020 at 09:28:25PM +0000, Joseph Myers wrote:
> On Fri, 29 May 2020, Will Springer via Binutils wrote:
> 
> > Hey all, a couple of us over in #talos-workstation on freenode have been
> > working on an effort to bring up a Linux PowerPC userland that runs in 32-bit
> > little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
> > designated for this (unless you count the patchset from a decade ago [1]), so
> > it's pretty much uncharted territory as far as Linux is concerned. We want to
> > sync up with libc and the relevant kernel folks to establish the best path
> > forward.
> 
> As a general comment on the glibc side of things, if this is considered 
> like a new port, and it probably is, the same principles that apply to new 
> ports apply here.
> 
> There's a general discussion at 
> <https://sourceware.org/glibc/wiki/NewPorts>, although much of that is 
> only applicable when adding new CPU architecture support.  More specific 
> points include that new 32-bit ports should default to 64-bit time and 
> file offsets from the start, with no support for 32-bit time or offsets 
> (meaning that if you want to use this with some kind of library call 
> translation, the library call translation will need to deal with 
> corresponding type size conversions).

Either that, or use the same as BE 32-bit PowerPC Linux, I'd say (it
won't make things worse, and if it is easier?)  But preferably the
newer, better, thing of course :-)

> And a new port should not be added 
> that uses the IBM long double format.  You can use IEEE binary128 long 
> double, possibly with an ABI similar to that used on powerpc64le, or can 
> use long double = double, but should not support IBM long double, and 
> preferably should only have one long double format rather than using the 
> glibc support for building with different options resulting in functions 
> for different long double formats being called.

You cannot use IEEE QP float ("binary128") here, but more on that in a
later post.

(I so very much agree about the problems having more than one long
double format -- on the other hand, you'll just share it with BE, and
with the existing powerpcle-linux (sup)port).


Segher
