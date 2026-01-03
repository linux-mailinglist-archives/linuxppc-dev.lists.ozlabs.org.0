Return-Path: <linuxppc-dev+bounces-15184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D06CF00A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 15:07:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk2Sh40NXz2yFl;
	Sun, 04 Jan 2026 01:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767449252;
	cv=none; b=Zf1WMiBHJLMokjvUmRMofO5GqUoGKQXwNf8EdDlkJB+V1AZ0QDEQI+5jAt2yscfEVqyI3tOqGvwzGGB4WvN+A8V1nOl3aHUR6vHA2scHbZBHYuZK24ceiIWQZp+8aPaCYY+zio1prSPwmbA/cL4ilckCh6KB/X2AHfddV+j6PFILwjwlD/Cqizi1sB1axYzUZbFGijrWpa/A/CQIl/aJlm/ANwL7+5Nej40XYbnDE6Lumg0Dq7C54ryxIs+QDgN3cxyFs0dhGOmrNQOLM9gzvyHNG4/f5bqvsuANdL5R6869fEyY4w2kFQ9ghZ9C4bH8wWGcQ47f/mPHX+9TYb79Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767449252; c=relaxed/relaxed;
	bh=gPcIpdvOfHJ6rC9sFzXby3U4KzGXxS0/Yt+Xrq9Gwco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuvKGaSjfai2hWsrsopt4QgoUBdRFIK/kLgs//v6T4VdwSQuA9QmJ7sk9Y5xLWGSOh80YeleJovU7Rbql3RyfXb1JW4WYv9Prs9ZUeTDa/eWCalGVZFQwj3v+Y0XIrDjSWAPIuYTiCbIrDgPy6abjgf9Y8/NAFmVncAptsUh2XDq8iDQqfpO/hOariCziCjgEFNvu6if8yHaDtvdQijSyYQgcpB1Kn6np6yB8EL+kLkn++yq/WxhV+fj5XujOtoQLxhd4B2U/HE+iYzTOhQXU5jtA/9uEIO2kS5zep3M4t2ou69uhGFeWASExvnhmg7vC4sNv1MqrPkYDrdrJvW7iQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk2Sf6xcZz2yFd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 01:07:25 +1100 (AEDT)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 603E6jce1357382;
	Sat, 3 Jan 2026 08:06:45 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 603E6gCl1357376;
	Sat, 3 Jan 2026 08:06:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 3 Jan 2026 08:06:42 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Implement ARCH_HAS_CC_CAN_LINK
Message-ID: <aVkico3Uno03-rkz@gate>
References: <20251230-cc-can-link-powerpc-v1-1-82298df6e3bf@linutronix.de>
 <f51557ff-412b-46e4-b968-78b4e4d9872d@kernel.org>
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
In-Reply-To: <f51557ff-412b-46e4-b968-78b4e4d9872d@kernel.org>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi!

On Sat, Jan 03, 2026 at 11:39:12AM +0100, Christophe Leroy (CS GROUP) wrote:
> Le 30/12/2025 à 08:06, Thomas Weißschuh a écrit :
> > The generic CC_CAN_LINK detection does not handle different byte orders.
> > This may lead to userprogs which are not actually runnable on the target
> > kernel.
> 
> Isn't the kernel supposed to handle any userland endianess ? Macro
> SET_ENDIAN() is there for that as far as I understand.

Yes, the kernel does not get much data out of data structures in memory
in the first place :-)

> And if you want to be complete, I think you should also check whether the
> ELF ABI is v1 or v2.

ELFv2 is version 1 of ELF, as wel as version 1 of its particular ABI.
It is just a cutesy name.  The thing now called "ELFv1" was called
"PowerOpen", or simply "PowerPC 64-bit ELF", or one of a hundred other
names :-)

All of the ABIs we use with PowerPC (in trunk, anyway) work with either
endianness (well, you need a userland built for it of course, and maybe
AIX and/or Darwin have not actually been designed to work with wrong-
endian as well).

But powerpc-{elf,linux} and powerpcle-{elf,linux} work equivalently
well, and so do both BE and LE versions of ELFv2 (yes, BE of that exists
just as well, and some distros even ship it!)

powerpc64-linux and powerpc64le-linux use different ABIs though (BE
ELFv1 and LE ELFv2, resp.)


Segher

