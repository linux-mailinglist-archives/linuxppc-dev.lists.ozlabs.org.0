Return-Path: <linuxppc-dev+bounces-12180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ACCB569A0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 16:14:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPqtN1Sqvz3chv;
	Mon, 15 Sep 2025 00:14:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757859292;
	cv=none; b=hvwnAhWGU1y8GzbygdIXayCf9Vtdf7HNuG9JJu5YD00WoMSOe5ehhVbKMTRoSr4HKBlwZgJv92fijdpwEuXHp6Vai8bOcBepSPaaRXmZF80phXAuGReaNtWNAS38JcnZo8vI5+V+eGkf5S9Kptq1ehURiDyDuA3vmSzF3hwMGG0jCqcAMQ9ulMH4LGIaAbxmyOlp580fa1DfjFo9E6nJy8pgZpxXx3CAle1+wXb2caC3+X5nFMwimUuhHZxtsxm1csMzH9AJrqGFxCpcQ0o4nq7nDy6v1TLNP2FpzeukE1pUEqd5O0jECLYDdzyLTgbHJQdG6Gh2Q1gCK9F9Gt+E5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757859292; c=relaxed/relaxed;
	bh=YgVL5HFe/bgT50buxj9wk01m0PJuMG/Zbg54dZyiKYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L56Z756VlVyvkDZtrptTIqyNbKbJP9I+4eNUCZCqAO+OjFdmqGOoibiza3+Ifh5ZbtX/ILZgnsUSNNw/j0PE8GML4qRUsDzwl3dF+mPd8Yj6lCe0QpfZYkbKrT36RAkQV4EzntSoJGy8NqtDw7ZzRCPvWjkMl77T0KT9Uoq9jnonkNRTYi/byo8YCacEoOBhgzGErkUjiNRlg4W4DAlvniTB8TPvCGOiZz3Tw3nbZ8ZiJrMnWOgXJOP1vLTOwa9FAKisU4soywLXkQqls/RRev+mMJEdTobKqs0h6wGvNBmMQGghhbEsx3XU7IGfHsR3tgtCmWBKczN5cBSLx/FP/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPqtM0Dr5z3chL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 00:14:49 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58EEEPWI157725;
	Sun, 14 Sep 2025 09:14:25 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 58EEEOtL157724;
	Sun, 14 Sep 2025 09:14:24 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 14 Sep 2025 09:14:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ash Logan <ash@heyquark.com>
Cc: arnd@arndb.de, christophe.leroy@csgroup.eu,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        officialTechflashYT@gmail.com, AWilcox@wilcox-tech.com,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Message-ID: <aMbNwBrxtBSPl8NQ@gate>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Sep 13, 2025 at 08:53:08PM +1000, Ash Logan wrote:
> Wii (2006)
> - 1x PowerPC 750CL "Broadway" @ 729MHz
> - 24MB "MEM1" + 64MB "MEM2" (non-contiguous - MEM2 starts 256MiB in)
> - Kernel 4.19 (+ CIP patchset), dev has been working on forward-porting all
> the drivers one major version at a time (he's currently up to 5.15 last I
> checked) + limited upstream support (hardware bringup, UART, not many
> peripherals)

There *aren't* many peripherals, so that is quite okay :-)

> Wii U (2012)
> - 3x PowerPC 750CL "Espresso" @ 1.2GHz

It is not a 750CL.  We never found out what the model # is, if indeed it
has one!  But the CPU cores are compatible to the Broadway, sure, there
even are configuration bits to make it do the bugs that were fixed in
Espresso!  (Just like Broadway can emulate a Gekko, 750CXe, the GCN
thing).

It does have its own PVR value of course, that is something at least :-)

(Espresso is one chip btw, with three mostly symmetrical cores).

> - 32MB "MEM1" + 2GB "MEM2" (also starts 256MiB in) + various small SRAMs

It has 32MB MEM1?  Huh.  Why?

> Special mention to the GameCube, basically a slower Wii with only 24MB
> direct RAM and 16MB of non-mapped "ARAM". Wii Linux has experimental support
> for this where they use the ARAM as swap.

The main memory on the GCN was very fast, low-latency, ram.  "1T-SRAM",
named so because it isn't SRAM, and not really single cycle access
either :-)

There is a block of it for graphics, too.  No idea where that is direct-
mapped, if at all.

> There is a somewhat active userbase for both devices.

Still?  Nice to hear!

> I only have stats for
> the Wii U side, but some rough nginx grepping for the last few days - Sep
> 7th-Sep 12th - shows 39 downloads of distribution tarballs and bootloader
> binaries in that period, not including torrents. In the past 2 weeks - Aug
> 29th-Sep 12th - 9 people joined the community Discord, 442 total.
> Anecdotally, the Wii Linux userbase appears at least twice as big (based on
> their Discord activity).

That makes sense, there are way more Wii devices than WiiU devices, but
the latter is newer and somewhat nicer (bigger) to run Linux on.

> Distribution-wise, we're supported by ArchPOWER [5], Adélie Linux [6], and
> other distros. The Wii U's Espresso has CPU errata requiring a patched
> compiler,

Can you remind me what that is about?  It shouldn't be too hard to
include it in mainline GCC.

> and both distributions ship separate package repos for this CPU.
> ArchPOWER requested I rebase onto 6.6 so they could have firmware
> compression - previously the Wii U was on 4.19 - so there is some demand for
> newer kernel features as well.
> 
> I know I'm talking about hobbyist use - and mostly downstream use at that -
> and I do suspect that in the event of a wider 32-bit deprecation we'd be
> fine on the final LTS, whatever that ends up being. Still, I think the Wii
> and Wii U represent a decent number of 32-bit users, so I wanted to add to
> the conversation here.

Hey, at least you hobbyists are responsive!

I don't see any real reason to no longer support 32-bit systems in
Linux -- all of the ways where that needs different treatment have been
figured out decades ago already, and perhaps not too many people still
use it, but for some architectures it is the only option and that will
never change.  Not all of the world is x86.  Even with Arm there are
many 32-bit only systems in the wild, some pretty new even!


Segher

