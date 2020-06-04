Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6301EEE4C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 01:37:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dMdY2klQzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 09:37:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 49dMbJ3g1kzDqvv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 09:35:39 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 054NZKtM017290;
 Thu, 4 Jun 2020 18:35:20 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 054NZH6K017289;
 Thu, 4 Jun 2020 18:35:17 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Jun 2020 18:35:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604233516.GM31009@gate.crashing.org>
References: <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
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

On Thu, Jun 04, 2020 at 11:43:53PM +0200, Daniel Kolesa wrote:
> The thing is, I've yet to see in which way the ELFv2 ABI *actually* requires VSX - I don't think compiling for 970 introduces any actual differences. There will be omissions, yes - but then the more accurate thing would be to say that a subset of ELFv2 is used, rather than it being a different ABI per se.

Two big things are that binaries that someone else made are supposed to
work for you as well -- including binaries using VSX registers, or any
instructions that require ISA 2.07 (or some older ISA after 970).  This
includes DSOs (shared libraries).  So for a distribution this means that
they will not use VSX *anywhere*, or only in very specialised things.
That is a many-years setback, for people/situations where it could be
used.

> The ELFv2 document specifies things like passing of quadruple precision floats. Indeed, VSX is needed there, but that's not a concern if you *don't* use quadruple precision floats.

As Joseph says, QP float is passed in the VRs, so that works just fine
*if* you have AltiVec.  If not, you probably should pass such values in
the GPRs, or however a struct of 16 bytes is passed in whatever ABI you
use (this is a much more general problem than just BE ELFv2 ;-) )  And
then you have some kind of "partial soft float".  Fun!  (Or not...)

> > If you always use -mcpu=970 (or similar), then not very much is
> > different for you most likely -- except of course there is no promise
> > to the user that they can use VSX and all instructions in ISA 2.07,
> > which is a very useful promise to have normally.
> 
> Yes, -mcpu=970 is used for default packages. *However*, it is possible that the user compiles their own packages with -mcpu=power9 or something similar, and then it'll be possible to utilize VSX and all, and it should still work with the existing userland. When speaking of ABI, what matters is... well, the binary interface, which is the same - so I believe this is still ELFv2. A subset is always compliant with the whole.

The same calling convention will probably work, yes.  An ABI is more
than that though.


> > Btw, if you use GCC, *please* send in testresults?  :-)
> 
> Yes, it's all gcc (we do have clang, but compiling repo packages with clang is generally frowned upon in the project, as we have vast majority of packages cross-compilable, and our cross-compiling infrastructure is gcc-centric, plus we enable certain things by default such as hardening flags that clang does not support). I'll try to remember next time I'm running tests.

Thanks in advance!

> I have a feeling that glibc would object to such port, since it means it would have to exist in parallel with a potential different ELFv2 port that does have a POWER8 minimal requirement; gcc would need a way to tell them apart, too (based on what would they be told apart? the simplest way would probably be something like, if --with-abi=elfv2 { if --with-cpu < power8 -> use glibc-novsx else use glibc-vsx } ...)

The target name allows to make such distinctions: this could for example
be  powerpc64-*-linux-void  (maybe I put the distinction in the wrong
part of the name here?  The glibc people will know better, and "void" is
probably not a great name anyway).


Segher
