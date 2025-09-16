Return-Path: <linuxppc-dev+bounces-12291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11736B59C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR5kK5Ggxz30FR;
	Wed, 17 Sep 2025 01:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758037337;
	cv=none; b=C80YuXJz83r7+7GqCDx7bx9kxyr3z7mRt6SAYkqEj5MTeEvKgW5d7ORAgel7b0UoiWDIa7hrzsZpjYhD2Tj/qEcR4t0ozBpr5768t1B1pIR2ol6BosryCKVx6gMteCReWZQToMrkvL8B2fCWpOzqEWM5SQ/SPky3WGDY7omxFKQ/rDrblsI7k28thxMfEXPOWlW3Humrus3fkKQhvCTYesfqzUMfcYHEShWt/4Gavww2YbmXCi50dFu7HbFwoCfTd2qPl7Qk0vo0W+lr8MbbMHyqYlB7KiFg4xihCfXybaYy/TCCA8mb5gnR/O7HMiB9iqIgJD11nrpXFHf/itcnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758037337; c=relaxed/relaxed;
	bh=H+g/7Jbkf5vwP8J72528bcpP20mfz7LBE7e2465Pz74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwiwtGKo/rOyM/cN4KIVVuoXSR84Jk1LK1Ych6rF3CfMdv3j8hVD73bis97TXG/DPiy17l5Fg7L4yQn6mwBTGoVPNOGNb9+vOdHF7XOBpKEsGWBGeO227VA42I9+6WdZjmrz6fPh3sczJB2tARebTZWeuXCMHoS5euUlrTaGY+QQCr10RLBH1tF45si4Swk6sIYytBa3Ddf97rfrvlJTML1d01+pPmJK5KST9UXES6WeSvObyv5faD8CuOoMFHcT4Fx6eaCyduQjnr6iie/o0j505x7zZDM88iHEIMhoEYd8DQt347i813ajiH5cRd1Njfizlxyj138k0qmtZplXmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR5kG0GyJz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 01:42:13 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58GFfn80294667;
	Tue, 16 Sep 2025 10:41:49 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 58GFfmi4294661;
	Tue, 16 Sep 2025 10:41:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 16 Sep 2025 10:41:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ash Logan <ash@heyquark.com>
Cc: arnd@arndb.de, christophe.leroy@csgroup.eu,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        officialTechflashYT@gmail.com, AWilcox@wilcox-tech.com,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Message-ID: <aMmFPCwU-mVxBbsv@gate>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <aMbNwBrxtBSPl8NQ@gate>
 <95d176d1-e1be-4594-91bd-caf0d68fd532@heyquark.com>
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
In-Reply-To: <95d176d1-e1be-4594-91bd-caf0d68fd532@heyquark.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 12:10:14PM +1000, Ash Logan wrote:
> On 15/9/25 00:14, Segher Boessenkool wrote:
> > On Sat, Sep 13, 2025 at 08:53:08PM +1000, Ash Logan wrote:
> > > Wii (2006)
> > > - 1x PowerPC 750CL "Broadway" @ 729MHz
> > > - 24MB "MEM1" + 64MB "MEM2" (non-contiguous - MEM2 starts 256MiB in)
> > > - Kernel 4.19 (+ CIP patchset), dev has been working on forward-porting all
> > > the drivers one major version at a time (he's currently up to 5.15 last I
> > > checked) + limited upstream support (hardware bringup, UART, not many
> > > peripherals)
> > 
> > There *aren't* many peripherals, so that is quite okay :-)
> 
> That's true. The lack of a UART or similar does make USB kinda essential for
> an input device in my opinion, though getting it working is Complicated for
> DMA reasons. (I think this is the main thing holding the downstream back in
> their rebasing efforts)

We often threw something on the EXI bus, either something that directly
converts to USB (like the EXIUSB board we did), or anything goes really,
it is a really simple bus so an FPGA or a CPLD or XS1 or even pure
software works.

> > > Wii U (2012)
> > > - 3x PowerPC 750CL "Espresso" @ 1.2GHz
> > 
> > It is not a 750CL.  We never found out what the model # is, if indeed it
> > has one!  But the CPU cores are compatible to the Broadway, sure, there
> > even are configuration bits to make it do the bugs that were fixed in
> > Espresso!  (Just like Broadway can emulate a Gekko, 750CXe, the GCN
> > thing).
> > 
> > It does have its own PVR value of course, that is something at least :-)
> > 
> > (Espresso is one chip btw, with three mostly symmetrical cores).
> 
> Yeah, I was just going for the closest "public" chip :) I think the PVR is
> closer to the CXe too, but all the HIDs, missing THRM, missing frequency
> scaling - it's very CL-y...

The 750CX and 750CXe (and so, Gekko as well) have a PVN of 8, it is
just a 750 after all.  750FX has 0x7000 though, and 750GX has 0x7002.
Espresso is 0x7001, maybe it is somwhat inbetween FX and GX wrt
implementation process or the like.

The numbering is a bit of a mess, yeah :-)

> > > - 32MB "MEM1" + 2GB "MEM2" (also starts 256MiB in) + various small SRAMs
> > 
> > It has 32MB MEM1?  Huh.  Why?
> 
> New generation upgrade? MEM1 does get used for Wii U software too, usually
> to keep framebuffers and other 3D things, so I guess they wanted just a
> little more for all the 1080p buffers the new console juggles.

Ah, it appears the MEM1 is not implemented as 1T-SRAM anymore, but just
is a hunk of off-the-shelf DDR2 (or GDDR3, or DDR3, or whatever they
used; it doesn't matter so much).  Those come in power-of-two sizes
mostly :-)

There only is 3MB of 1T on WiiU, for the graphics memory.

> > > Distribution-wise, we're supported by ArchPOWER [5], Adélie Linux [6], and
> > > other distros. The Wii U's Espresso has CPU errata requiring a patched
> > > compiler,
> > 
> > Can you remind me what that is about?  It shouldn't be too hard to
> > include it in mainline GCC.
> 
> The short version is "every stwcx. should be prefaced with a dcbst" -
> something to do with bus snooping (store-with-flush, store-with-kill) I'd
> guess. I have some GCC patches drafted (activated by -mcpu=espresso) here:
> https://gitlab.com/linux-wiiu/smp-patches

Ah cool.  I'm maintainer for PowerPC GCC these days, I'll be happy to
work with whoever wants to do a good patch (not this one, it is not a
different CPU type, we shouldn't pretend it is, the actual patch can be
just a handful of lines).

> I'm impressed by how often IBM stuffed up atomics during this generation.
> The Xbox 360 has an extremely similar issue despite being an entirely
> different lineage of chip.

It is not very similar at all.  Both have some issues related to
(off-core) coherency stuff, something for which there were no good
testing frameworks in that era.  And that is where the similarity ends.

This needs full-system emulation to test well, probably interpreting
the whole VHDL, for all cores and the caches and the fabric.  Or special
ASICs to implement the whole thing at a hundred of a percent of real
speed.

> No surprise the console vendors all went to x86
> and ARM right after, I suppose.

Both of which had similar (but even worse) bugs, yeah :-)


Segher

