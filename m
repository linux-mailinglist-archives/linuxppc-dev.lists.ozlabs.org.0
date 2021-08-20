Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B43F32DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 20:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrqXh00rhz3cJ6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 04:14:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GrqXH0HRJz3022
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 04:14:06 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17KIC27u027695;
 Fri, 20 Aug 2021 13:12:02 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17KIC1p7027690;
 Fri, 20 Aug 2021 13:12:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 20 Aug 2021 13:12:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32: indirect function call use bctrl rather than
 blrl in ret_from_kernel_thread
Message-ID: <20210820181201.GT1583@gate.crashing.org>
References: <91b1d242525307ceceec7ef6e832bfbacdd4501b.1629436472.git.christophe.leroy@csgroup.eu>
 <871r6oe2i8.fsf@mpe.ellerman.id.au> <20210820171845.GS1583@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820171845.GS1583@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 20, 2021 at 12:18:45PM -0500, Segher Boessenkool wrote:
> On Fri, Aug 20, 2021 at 10:15:11PM +1000, Michael Ellerman wrote:
> > Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > > Copied from commit 89bbe4c798bc ("powerpc/64: indirect function call
> > > use bctrl rather than blrl in ret_from_kernel_thread")
> > >
> > > blrl is not recommended to use as an indirect function call, as it may
> > > corrupt the link stack predictor.
> > 
> > Do we know if any 32-bit CPUs have a link stack predictor or similar?
> 
> 74xx do.

7450 and later, that is.  Will I ever get that right, sigh.


Segher
