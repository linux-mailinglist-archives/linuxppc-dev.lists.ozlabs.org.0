Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924EB5BEFF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 00:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXGCd3MB0z3c9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 08:18:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXGCC4sBBz2xmr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 08:18:14 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28KMG8nd010624;
	Tue, 20 Sep 2022 17:16:08 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28KMG8L6010623;
	Tue, 20 Sep 2022 17:16:08 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 20 Sep 2022 17:16:08 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 5/7] powerpc/64s: update generic cpu option name and compiler flags
Message-ID: <20220920221608.GB25951@gate.crashing.org>
References: <20220919140149.4018927-1-npiggin@gmail.com> <20220919140149.4018927-6-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919140149.4018927-6-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Sep 20, 2022 at 12:01:47AM +1000, Nicholas Piggin wrote:
> Update the 64s GENERIC_CPU option. POWER4 support has been dropped, so
> make that clear in the option name.

AFAIR the minimum now is POWER4+ (ISA 2.01), not POWER5 (ISA 2.02).

> -mtune= before power8 is dropped because the minimum gcc version
> supports power8, and tuning is made consistent between big and little
> endian.

Tuning for p8 on e.g. 970 gives quite bad results.  No idea if anyone
cares, but this is a serious regression if so.

> Big endian drops -mcpu=power4 in favour of power5. Effectively the
> minimum compiler version means power5 was always being selected here,
> so this should not change anything. 970 / G5 code generation does not
> seem to have been a problem with -mcpu=power5, but it's possible we
> should go back to power4 to be really safe.

Yes, -mcpu=power5 code does *not* run on 970, if you are unlucky enough
that the compiler does something smart with popcntb (the sole non-float
insn new on p5, not counting hrfid).

> +# -mcpu=power5 should generate 970 compatible kernel code

It doesn't.  Even if it did, it would need more explanation!


Segher
