Return-Path: <linuxppc-dev+bounces-11693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A742DB42BB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 23:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHFqm1wr3z2yrp;
	Thu,  4 Sep 2025 07:19:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756934388;
	cv=none; b=e6DGvmQR+OF0pwNYMmi5g1gP/LSGTVktGwJqDqqrTRkRtxZWJURi4oVbhG1lntsMS2R082UyYpT1iWpvdibnA/CWRVM55ubriiCcigmswB8Hoiyr/cEfXAul6FZzp7R1tNJ6n3t1aWMCJurXI6tyJffbApuQ7RJog/kJzbdE3JIIXfRoDEibPo3usrjfdL9yZgW6DOMb9tgE1VxV5PZPspYCvGN5VBr2bYoG3Xsl+sJbg7PRrryK65MmHre0ygSz1d4imct9R6IM2ky/WteZVckdwCLc12dyQZZ81U6QB6GhkRcJYAoEHDoxhbjjD0KM0nzJLpQmBsiIdKsJRpXqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756934388; c=relaxed/relaxed;
	bh=xR8GTgJylvB5+0YAw84X9yU/v9BrN/dYBA2hLl6xW6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH6kXnL6GtiFILnFaxAN2vNArWwgQ2D7a/+w+nbSTR8lYVAc7NLg+CGC+YCIeIKT3LLOiH34nYpHCibLt2Hw118B8YNOwCAZrqe/aPJCGmwicNVSSLVFwMetTLdYD4x5eODd3mTbHrD/TrIo8KcRTSUzHWIn3jc5W6W88W04LwYpPifRGVAkAHo6sWOK1MmpGuTTMPFHoT6Z39T0yJlokAcZ+JahCGXzWWVzePP/FVEoDoBvpBVSz52CnPktzABBEJK5QG+U0xd+2S+4uDYJxfowfcEnl7Bx4U/mZ0o5VRVC/voZWcEyBrnBFY/UjBzXH0el+ZQpPNF2syiZTqO4KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHFqk4zg6z2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 07:19:45 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 583LJPdA3720201;
	Wed, 3 Sep 2025 16:19:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 583LJPZi3720200;
	Wed, 3 Sep 2025 16:19:25 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 3 Sep 2025 16:19:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5.4 only] powerpc: boot: Remove unnecessary zero in label
 in udelay()
Message-ID: <aLiw3L76FR5k-Xen@gate>
References: <20250902235234.2046667-1-nathan@kernel.org>
 <aLfdCkj4z99QmfMd@gate>
 <20250903211442.GA2866185@ax162>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903211442.GA2866185@ax162>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Wed, Sep 03, 2025 at 02:14:42PM -0700, Nathan Chancellor wrote:
> On Wed, Sep 03, 2025 at 01:15:38AM -0500, Segher Boessenkool wrote:
> > On Tue, Sep 02, 2025 at 04:52:34PM -0700, Nathan Chancellor wrote:
> > > When building powerpc configurations in linux-5.4.y with binutils 2.43
> > > or newer, there is an assembler error in arch/powerpc/boot/util.S:
> > > 
> > >   arch/powerpc/boot/util.S: Assembler messages:
> > >   arch/powerpc/boot/util.S:44: Error: junk at end of line, first unrecognized character is `0'
> > >   arch/powerpc/boot/util.S:49: Error: syntax error; found `b', expected `,'
> > >   arch/powerpc/boot/util.S:49: Error: junk at end of line: `b'
> > > 
> > > binutils 2.43 contains stricter parsing of certain labels [1].
> > > 
> > > Remove the unnecessary leading zero to fix the build.
> > 
> > To fix it by getting rid of this syntax error, you mean?  "00" is not a
> > valid label name: a) it cannot be a symbol name, it starts with a digit;
> > and b) it isn't a valid local label either.  As the manual says
> > > To define a local label, write a label of the form ‘N:’ (where N
> > > represents any non-negative integer).
> > "0" is written "0", not as "00" (or "0-0" or even "0-0-0", hehe).
> 
> Sure, I have sent a v2 that hopefully makes it a little clearer that the
> code in the kernel was already problematic under the existing rules.
> 
> https://lore.kernel.org/20250903211158.2844032-1-nathan@kernel.org/

You forgot to cc: me on that :-)  I have it via linuxppc-dev@ of course.

Looks great, thank you!


Segher

