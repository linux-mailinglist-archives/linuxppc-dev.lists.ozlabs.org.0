Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 915491EB347
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:16:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bbJ54yHJzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:16:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49bbDH6QB8zDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:13:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 0522Ckod015053;
 Mon, 1 Jun 2020 21:12:46 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 0522CjoF015050;
 Mon, 1 Jun 2020 21:12:45 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Jun 2020 21:12:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joseph Myers <joseph@codesourcery.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200602021245.GO31009@gate.crashing.org>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 01, 2020 at 11:45:51PM +0000, Joseph Myers wrote:
> On Tue, 2 Jun 2020, Daniel Kolesa wrote:
> > Are you sure this would be a new port? Glibc already works in this 
> > combination, as it seems to me it'd be best if it was just a variant of 
> > the existing 32-bit PowerPC port, sharing most conventions besides 
> > endianness with the BE port.
> 
> The supported glibc ABIs are listed at 
> <https://sourceware.org/glibc/wiki/ABIList>.

powerpcle-linux already does work somewhat, and that should also he
worth something, official or not ;-)

(It has worked for very many years already...  That is, I have built it
a lot, I have no idea about running a full distro that way).

> > 128-bit IEEE long double would not work, since that relies on VSX being 
> > present (gcc will explicitly complain if it's not). I'd be all for using 
> 
> The minimum supported architecture for powerpc64le (POWER8) has VSX.  My 
> understanding was that the suggestion was for 32-bit userspace to run 
> under powerpc64le kernels running on POWER8 or later, meaning that such a 
> 32-bit LE port, and any ABI designed for such a port, can assume VSX is 
> available.  Or does VSX not work, at the hardware level, for 32-bit 
> POWER8?  (In which case you could pick another ABI for binary128 argument 
> passing and return.)

The current powerpcle-linux runs on anything 6xx, or maybe older.  It
isn't actually supported of course.

If the CPU is Power8, that does not mean VSX is available to you.

VSX works fine in 32-bit mode (with the standard gotcha that the GPRs
do not preserve the high part in all cases, so e.g. the m[ft]vsr insns
might not work as you want.

Passing IEEE QP float in GPRs would be natural for most ABIs, and it
should work fine indeed.  That isn't currently supported in GCC (needs
some libgcc work), and it might need __int128 to work on 32-bit ports
first.

> > There is also one more thing while we're at this. The 64-bit big endian 
> > Void port uses the ELFv2 ABI, even on glibc. This is not officially 
> > supported on glibc as far as I can tell, but it does work out of box, 
> > without any patching (things in general match little endian then, i.e. 
> > ld64.so.2 etc, but they're big endian). Is there any chance of making 
> > that support official?
> 
> If you want to support ELFv2 for 64-bit big endian in glibc, again that 
> should have a unique dynamic linker name, new symbol versions, only 
> binary128 long double, etc. - avoid all the legacy aspects of the existing 
> ELFv1 port rather than selectively saying that "ELFv1" itself is the only 
> legacy aspect and keeping the others (when it's the others that are 
> actually more problematic in glibc).

You should view it as a variant of the LE ELFv2 port, it has nothing
much to do with the other BE 64-bit PowerPC ports, other than being BE.


Segher
