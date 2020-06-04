Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A1B1EEDF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:49:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dLZ633VNzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 08:49:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pbcl.net (client-ip=2a01:4f8:c2c:5794::1; helo=pbcl.net;
 envelope-from=pb@pbcl.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=pbcl.net
X-Greylist: delayed 1905 seconds by postgrey-1.36 at bilbo;
 Fri, 05 Jun 2020 08:27:15 AEST
Received: from pbcl.net (pbcl.net [IPv6:2a01:4f8:c2c:5794::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dL4M5KjgzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 08:27:15 +1000 (AEST)
Received: from pb by pbcl.net with local (Exim 4.92)
 (envelope-from <pb@pbcl.net>)
 id 1jgxpP-0007rN-Il; Thu, 04 Jun 2020 23:55:11 +0200
Date: Thu, 4 Jun 2020 23:55:11 +0200
From: Phil Blundell <pb@pbcl.net>
To: Daniel Kolesa <daniel@octaforge.org>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
Message-ID: <20200604215511.GB28641@pbcl.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 05 Jun 2020 08:48:05 +1000
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
 Will Springer <skirmisher@protonmail.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 10:39:30PM +0200, Daniel Kolesa wrote:
> Is there *any* way I can take that would make upstreams of all parts 
> of the toolchain happy? I explicitly don't want to go back to ELFv1. 
> While at it, I'd like to transition to ld64 long double format, to 
> match musl and improve software compatibility, which I feel will raise 
> more objections from IBM side.

Although I don't pretend to understand all the nuances of your port, and 
in particular I have no idea what the thing about "ld64 long double 
format" means, this doesn't sound like a particularly unusual situation.  
If I understand correctly, you are in the position of essentially 
wanting to implement the calling-standard part of the ABI on hardware 
that isn't capable of implementing the full ABI as documented.

If that's the case then, depending on exactly what instructions are
missing, I think your choices are:

1a. Define your own subset of ELFv2 which is interworkable with the full 
ABI at the function call interface but doesn't make all the same 
guarantees about binary compatibility.  That would mean that a binary 
built with your toolchain and conforming to the subset ABI would run on 
any system that implements the full ELFv2 ABI, but the opposite is not 
necessarily true.  There should be no impediment to getting support for 
such an ABI upstream in any part of the GNU toolchain where it's 
required if you can demonstrate that there's a non-trivial userbase for 
it.  The hardest part may be thinking of a name.

1b. Or, if the missing instructions are severe enough that it simply 
isn't possible to have an interworkable implementation, you just need to 
define your own ABI that fits your needs.  You can still borrow as much 
as necessary from ELFv2 but you definitely need to call it something 
else at that point.  All the other comments from 1a above still apply.

2. Implement kernel emulation for the missing instructions.  If they
are seldom used in practice then this might be adequate.  Of course,
binaries that use them intensively will be slow; you'd have to judge
whether this is better or worse than having them not run at all.  If
you do this then you can implement the full ELFv2 ABI; your own
toolchain might still choose not to use the instructions that it knows
are going to be emulated, but at least other binaries will still run
and you can call yourself compatible.

3. Persuade whoever controls the ELFv2 ABI to relax their requirements.
But I assume they didn't make the original decision capriciously so
this might be hard/impossible.  ABI definitions from hardware vendors
are always slightly political and we just have to accept this.

FWIW, we faced a similar situation about 20 years ago when the then-new 
ARM EABI was defined.  This essentially required implementations to 
support the ARMv5T instruction set; the committee that defined the ABI 
took the view that requiring implementations to cater for older 
architectures would be too onerous.  It was entirely possible to 
implement 99% of the EABI on older processors; such implementations 
weren't strictly conforming but they were interworkable enough to be 
useful in practice, and the "almost-EABI" was still significantly
better than what had gone before.

Phil
