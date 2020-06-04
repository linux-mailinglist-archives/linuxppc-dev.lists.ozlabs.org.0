Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9642A1EED23
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 23:12:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dJQW6TGlzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 07:12:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49dJMr0N4kzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 07:10:31 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 054LAB80011522;
 Thu, 4 Jun 2020 16:10:11 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 054LA9jk011519;
 Thu, 4 Jun 2020 16:10:10 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Jun 2020 16:10:09 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604211009.GK31009@gate.crashing.org>
References: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, eery@paperfox.es,
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jun 04, 2020 at 10:39:30PM +0200, Daniel Kolesa wrote:
> On Thu, Jun 4, 2020, at 19:33, Segher Boessenkool wrote:
> > It is the ABI.  If you think it should be different, make your own ABI,
> > don't pretend the existing ABI is different than what it is.  Thank you.
> 
> Well then - in that case, what do you suggest that I do?
> 
> Void currently ships an ELFv2 (or apparently not, I guess) 64-bit big endian port that works on 970/G5 up. It is important to me that it stays that way (a large amount of users are running 970s, so introducing a VSX dependency means I might as well abandon the port entirely).

You can just clearly document what ABI changes you use, and try to make
sure that everyone who uses your distro / your tools / your ABI variant
knows about it.  Telling your users that it is ELFv2, without telling
them it is not compliant, namely X Y Z are different, is a bit of a
disservice to your users, and worse to everyone else involved.

If you always use -mcpu=970 (or similar), then not very much is
different for you most likely -- except of course there is no promise
to the user that they can use VSX and all instructions in ISA 2.07,
which is a very useful promise to have normally.

> It currently works out of box - there are no changes required in glibc, and nearly the entire userland builds and works (about ~11500 out of ~12000 software packages, those that don't work either don't work on ppc64le either, or have issues related to endianness, or some other unrelated reason).

Very nice!

> I'd like to eventually get this into a state where I don't have to worry about glibc arbitrarily breaking it - which means it would be necessary to stabilize it upstream. While I can probably maintain a downstream patchset when it comes to it, I'd much prefer if I didn't have to - but this sounds like an official ELFv2 glibc BE port would be impossible unless the VSX requirement (and thus IEEE 128-bit long double and so on) was in place, which would defeat the point of the port.
> 
> Is there *any* way I can take that would make upstreams of all parts of the toolchain happy? I explicitly don't want to go back to ELFv1.

Oh absolutely, it sounds like things are in quite good shape already!
It will safe a lot of grief on all sides if you make clear this is not
"plain" ELFv2, and in what ways it differs.

Btw, if you use GCC, *please* send in testresults?  :-)

> While at it, I'd like to transition to ld64 long double format, to match musl and improve software compatibility, which I feel will raise more objections from IBM side.

I have no idea what "ld64 long double" is?  Is that just IEEE DP float?
Aka "long double is the same as double".  That is likely easier for new
ports than "double-double", yes, even if the eventual goal should be
IEEE QP float -- a much smoother transition.

Same goes here: document it!  If your users know that the ELFv2 variant
you give them is not *the* ELFv2, but it differs in some clear ways,
everyone will be happier :-)


Segher
