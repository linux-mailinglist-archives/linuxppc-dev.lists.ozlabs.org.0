Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920003717BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 17:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYmrc4DY4z30C0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 01:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FYmrG3yLbz2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 01:20:28 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 143FIPbe031669;
 Mon, 3 May 2021 10:18:25 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 143FIPs9031667;
 Mon, 3 May 2021 10:18:25 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 3 May 2021 10:18:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20210503151824.GJ10366@gate.crashing.org>
References: <20200428112517.1402927-1-npiggin@gmail.com>
 <20200428234046.GP17645@gate.crashing.org>
 <1588121596.7zej1imag0.astroid@bobo.none>
 <20210502175506.GE10366@gate.crashing.org>
 <1620002801.0iaahdk9xn.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620002801.0iaahdk9xn.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, May 03, 2021 at 10:51:41AM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of May 3, 2021 3:55 am:
> > On Wed, Apr 29, 2020 at 10:57:16AM +1000, Nicholas Piggin wrote:
> >> Excerpts from Segher Boessenkool's message of April 29, 2020 9:40 am:
> >> I blame toolchain for -mabi=elfv2 ! And also some blame on ABI document 
> >> which is called ELF V2 ABI rather than ELF ABI V2 which would have been 
> >> unambiguous.
> > 
> > At least ELFv2 ABI is correct.  "ELF ABI v2" is not.
> > 
> >> I can go through and change all my stuff and config options to ELF_ABI_v2.
> > 
> > Please don't.  It is wrong.
> 
> Then I'm not sure what the point of your previous mail was, what did I 
> miss?

I asked if you could make it clearer to people who do not know what this
is whether they want to use it.  Or that was my intention, anyhow :-/

> > Both the original PowerPC ELF ABI and the
> > ELFv2 one have versions themselves.  Also, the base ELF standard has a
> > version, and is set up so there can be incompatible versions even!  Of
> > course it still is version 1 to this day, but :-)
> 
> The point was for people who don't know ELFv2 has a specific meaning for 
> powerpc,

It does not have *any* meaning outside of Power.  But people who do not
know what it is can assume the wrong things about it.  It isn't a great
name because of that :-(

(It's not as bad as the MIPS ABIs -- an older one is called "new" :-) )

> then ELF ABIv2 is more explanatory about it being an abi change
> rather than base elf change, even if it's not the "correct" name.

I very much disagree.  "ELF ABIv2" is completely meaningless.

> If you don't want that then good, I also prefer to just use ELFv2. I 

Good :-)

> think people who change this option can easily look up the name in 
> toolchain and other docs.

Yeah.  As long as the defaults are good, whoever blows themselves up has
only themselves to blame :-P


Segher
