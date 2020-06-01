Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A41EB101
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 23:38:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bT7D26h8zDqQK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bT5W07KtzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 07:36:45 +1000 (AEST)
Date: Mon, 1 Jun 2020 17:36:40 -0400
From: Rich Felker <dalias@libc.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200601213639.GX1079@brightrain.aerifal.cx>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
> corresponding type size conversions).  And a new port should not be added 
> that uses the IBM long double format.  You can use IEEE binary128 long 
> double, possibly with an ABI similar to that used on powerpc64le, or can 
> use long double = double, but should not support IBM long double, and 
> preferably should only have one long double format rather than using the 
> glibc support for building with different options resulting in functions 
> for different long double formats being called.

Thanks, these are great points, and the same applies for musl I think.
We always have 64-bit off_t anyway, but new ports should have 64-bit
time_t to begin with rather than defining _REDIR_TIME64.

It's a little bit complicated by the fact that powerpcle would be a
"subarch" for powerpc, and we don't yet have any like that where the
subarchs' time64 statuses differ, but it doesn't look like that should
be hard to do. The arch-specific alltypes.h.in already has access to
endianness knowledge. src/ldso/powerpc/dlsym_time64.S would also need
added preprocessor conditionals.

Exemption from this would be open to discussion if there are existing
non-upstream users of powerpcle musl that otherwise complies with ABI
policy except for time64, but I'm not aware of any that aren't
experimental.

Rich
