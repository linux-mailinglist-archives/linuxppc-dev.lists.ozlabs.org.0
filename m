Return-Path: <linuxppc-dev+bounces-12144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB9B55F28
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 09:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cP3JG0fSFz2yrN;
	Sat, 13 Sep 2025 17:46:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757749565;
	cv=none; b=DYIrkQDvQ8EvCMSMHig7Tuef87EXlv4PnGZkN3F6RHbLFZzKE4gFH2RURcgrhEuWgWncC+oi7J8oePjCPK6Ba7GbMi6F9LKRrKxmCkGOMv+tFX93ksQB7F9WcjpUmFrH4wae6U5QVANEnfCLoUDKJhDB6qj10BRdZFtmA4UMdGmum3YiUnbSY6gvewsDlqxPNzR4pYi4ApAP2aZxwxwXzmR/XaQkNjJd9DXkGdQ0uZudRogoew42Dp9Doe/XY7DVacBRx+4nx77LcB4zkNB/Fvz2D5NPlq6GDlfRlTZCPBr/cJc7GDXcz/cZ84ZkgNUHLiHno58Ad6h/UhuMM/8Q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757749565; c=relaxed/relaxed;
	bh=MIQJUr2n3bqnRg04yuYiP90LHsbvZ4+KfmPIT8f4BxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+vvjRwPOoWD+uy9EYkzzIjoCJ8rQU4KTGncWJ3X/N0oh7uUxmSRoizrcnNYdDyYMP0HDhLvrLH/cgzPGUXa+rf7miU0UGlif48RiP73Bxuk0ISMreprEAg4N0Bo1PynV58aSCChYlYhytkI49ovicjRVGSbKyAYE+2eCR1pnu74CqZBcn4G1gRL9+mDgmA8vKDo8kQw7CSG/irFdXtMXh63g/b0S7qKurw4/8RwjPsNuzzI8wHpvYyJWTClf8Yyq2lGpTIXkZv7Jq2IhILQrNtqD12Uz6i8ZDto7OC+bts5UaQnjafVaVDiMP17jV2t1wbb3iAbTEdL9r4KaVAFhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cP3J856w2z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 17:45:59 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58D7jsDu091520;
	Sat, 13 Sep 2025 02:45:55 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 58D7jsKB091517;
	Sat, 13 Sep 2025 02:45:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 13 Sep 2025 02:45:54 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: RFI: powerpc cpus supporting BLRM for MSR_LE
Message-ID: <aMUhMomd752SWzUm@gate>
References: <5dddd2be-e53d-4067-82aa-02146c39223d@ilande.co.uk>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dddd2be-e53d-4067-82aa-02146c39223d@ilande.co.uk>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Fri, Sep 12, 2025 at 08:21:10PM +0100, Mark Cave-Ayland wrote:
> Whilst the patch is fairly complete, the problem I have is that there
> doesn't appear to be a concise list of CPUs that use BLRM (as opposed to
> proper LE memory accesses) when MSR_LE is enabled.

*All* older PowerPC have everything on the system busses in BE, and
when the CPU has MSR[LE]=1 it just swaps some lanes somewhere where
stuff is transfered to the execution cores.  Exactly how this is done
is quite funky, but not-naturally-aligned accesses in LE mode always
were disallowed anyway!

I'm not sure how LE is done on 970 (aka "G5"), a 64-bit core (it is
derived from GQ, POWER4+).

For the more current cores, since Power8 all LE and misaligned accesses
are supported with hardly any delay at all (sometimes the hardware needs
to do two memory accesses, but there is no exception and interrupt
caused, etc.)  And the hardware does a real shift, a big fat barrel
shifter in the load/store unit.

Oh, and also since P8 instructions in LE mode are stored byteswapped in
memory, too (older CPUs had instructions in BE always).  This is done
somewhere between the instruction cache and predecode.

> From what I can gather all 64-bit CPUs use proper LE memory accesses, but

They don't.

> it's not clear whether for 32-bit CPUs the use of BLRM can be derived from
> the PVR or other CPU registers.

It is still not clear to me what "BLRM" really means.

> Can anyone provide any insight as to which CPUs make use of BLRM for MSR_LE?

*All* CPUs that use the 6xx bus simply swap *and duplicate* some byte
lanes, in such a way that all naturally aligned accesses work as-if a
"real LE access" was done.  You can investigate it on real hardware by
seeing what happens to weird accesses.  There was something on the
Dolphin (GCN and Wii emulator) mailing lists some years ago you might
be able to find (I fail to currently, but I didn't look very far).

Btw:

>   g2               PVR 00810011

That is mpc82xx, which uses a "603e" core.  *All* 603 and 604 are called
G2 (G1 was 601, G3 is 740/750, G4 is 7400/7450 (two quite different
cores!), G5 is 970).


Segher

