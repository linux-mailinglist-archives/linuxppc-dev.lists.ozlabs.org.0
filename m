Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4486EA54A7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MS9s0M8kzDqch
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 21:13:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MS7x6SJvzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 21:11:25 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x82BB7FG023249;
 Mon, 2 Sep 2019 06:11:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x82BB5Mw023248;
 Mon, 2 Sep 2019 06:11:05 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 2 Sep 2019 06:11:05 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
Message-ID: <20190902111105.GX31406@gate.crashing.org>
References: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
 <9887dada07278cb39051941d1a47d50349d9fde0.camel@au1.ibm.com>
 <a0ad8dd8-2f5d-256d-9e88-e9c236335bb8@c-s.fr>
 <fcc94e7f347c3759a1698444239a7250b22cde7d.camel@au1.ibm.com>
 <87imqbtqlw.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87imqbtqlw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Alastair D'Silva <alastair@au1.ibm.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2019 at 11:48:59AM +1000, Michael Ellerman wrote:
> "Alastair D'Silva" <alastair@au1.ibm.com> writes:
> > On Wed, 2019-08-21 at 22:27 +0200, Christophe Leroy wrote:
> >> Can we be 100% sure that GCC won't add any code accessing some
> >> global data or stack while the Data MMU is OFF ?
> >
> > +mpe
> >
> > I'm not sure how we would go about making such a guarantee, but I've
> > tied every variable used to a register and addr is passed in a
> > register, so there is no stack usage, and every call in there only
> > operates on it's operands.
> 
> That's not safe, I can believe it happens to work but the compiler
> people will laugh at us if it ever breaks.

Yes.  Sorry.

> Let's leave it in asm.

+1

The asm is simpler, more readable, more maintainable, and perhaps more
performant even.  Plus the being-laughed-at issue.


Segher
