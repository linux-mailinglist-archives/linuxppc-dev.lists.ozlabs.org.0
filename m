Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD48C7D7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 21:52:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgLNk1ZJPz3fvv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 05:52:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgLNH5kp2z3fnb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 05:52:31 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 44GJmEdc016902;
	Thu, 16 May 2024 14:48:14 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 44GJmCLk016900;
	Thu, 16 May 2024 14:48:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 16 May 2024 14:48:12 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
Message-ID: <20240516194812.GN19790@gate.crashing.org>
References: <20240514173835.4814-1-dtsen@linux.ibm.com> <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse> <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org> <875xvevu3h.fsf@mail.lhotse>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xvevu3h.fsf@mail.lhotse>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, Andy Polyakov <appro@cryptogams.org>, linux-crypto@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, May 16, 2024 at 10:06:58PM +1000, Michael Ellerman wrote:
> Andy Polyakov <appro@cryptogams.org> writes:
> >>> +.abiversion	2
> >>
> >> I'd prefer that was left to the compiler flags.
> >
> > Problem is that it's the compiler that is responsible for providing this
> > directive in the intermediate .s prior invoking the assembler. And there
> > is no assembler flag to pass through -Wa.
> 
> Hmm, right. But none of our existing .S files include .abiversion
> directives.
> 
> We build .S files with gcc, passing -mabi=elfv2, but it seems to have no
> effect.

Yup.  You coulds include some header file, maybe?  Since you run the
assembler code through the C preprocessor anyway, for some weird reason :-)

> But the actual code follows ELFv2, because we wrote it that way, and I
> guess the linker doesn't look at the actual ABI version of the .o ?

It isn't a version.  It is an actual different ABI.

GNU LD allows linking together whatever, yes.

> Is .abiversion documented anywhere? I can't see it in the manual.

Yeah me neither.  https://sourceware.org/bugzilla/enter_bug.cgi ?
A commandline flag (to GAS) would seem best?


Segher
