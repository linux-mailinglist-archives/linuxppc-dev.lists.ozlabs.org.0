Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C4464F1A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 20:18:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYf5k0kxGz3cV8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 06:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYf58301gz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 06:18:00 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2BGJFiNr026484;
	Fri, 16 Dec 2022 13:15:44 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 2BGJFhmm026483;
	Fri, 16 Dec 2022 13:15:43 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 16 Dec 2022 13:15:43 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1] powerpc/64: Set default CPU in Kconfig
Message-ID: <20221216191543.GE25951@gate.crashing.org>
References: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu> <20221215204202.mbw2ij4ou7t2ttpv@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221215204202.mbw2ij4ou7t2ttpv@pali>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Dec 15, 2022 at 09:42:02PM +0100, Pali Rohár wrote:
> On Wednesday 07 December 2022 14:38:40 Christophe Leroy wrote:
> >  	default "power8" if POWER8_CPU
> >  	default "power9" if POWER9_CPU
> >  	default "power10" if POWER10_CPU
> > +	default "e500mc64" if E5500_CPU
> 
> Now I'm looking at this change again... and should not E5500_CPU rather
> enforce -mcpu=e5500 flag? I know that your patch moves e500mc64 flag
> from the Makefile to Kconfig, but maybe it could be changed in some
> other followup patch...
> 
> Anyway, do you know what is e500mc64 core? I was trying to find some
> information about it, but it looks like some unreleased freescale core
> which predates e5500 core.

It looks that way yes.  It was submitted at
<https://gcc.gnu.org/pipermail/gcc-patches/2009-November/273251.html>
and committed as <https://gcc.gnu.org/g:b17f98b1c541>.  It looks as if
it was based on the e500mc core, while e5500 is a new core (or
significantly different anyway).

> ISA (without extensions like altivec) seems
> to be same for e500mc64, e5500 and e6500 cores and difference is only
> pipeline definitions in gcc config files. So if my understanding is
> correct then kernel binary compiled with any of these -mcpu= flag should
> work on any of those cores. Just for mismatches core binary will not be
> optimized for speed.

It appears the E500MC64 never made it outside of FSL, so it is best not
to use it at all, imo.


Segher
