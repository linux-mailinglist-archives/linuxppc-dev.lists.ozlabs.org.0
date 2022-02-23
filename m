Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CE14C27A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46Zd0Ywhz3dgK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K46PK2N2lz3f3T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:02:43 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21NNReM1024539;
 Wed, 23 Feb 2022 17:27:40 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21NNRd3Z024538;
 Wed, 23 Feb 2022 17:27:39 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 23 Feb 2022 17:27:39 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Gabriel Paubert <paubert@iram.es>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Message-ID: <20220223232739.GJ614@gate.crashing.org>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
 <YhadiVbwao/p2N7o@lt-gp.iram.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhadiVbwao/p2N7o@lt-gp.iram.es>
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
 Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 09:48:09PM +0100, Gabriel Paubert wrote:
> On Wed, Feb 23, 2022 at 06:11:36PM +0100, Christophe Leroy wrote:
> > +	/* Zero volatile regs that may contain sensitive kernel data */
> > +	li	r0,0
> > +	li	r4,0
> > +	li	r5,0
> > +	li	r6,0
> > +	li	r7,0
> > +	li	r8,0
> > +	li	r9,0
> > +	li	r10,0
> > +	li	r11,0
> > +	li	r12,0
> > +	mtctr	r0
> > +	mtxer	r0
> 
> Here, I'm almost sure that on some processors, it would be better to
> separate mtctr form mtxer. mtxer is typically very expensive (pipeline
> flush) but I don't know what's the best ordering for the average core.

mtxer is cheaper than mtctr on many cores :-)

On p9 mtxer is cracked into two latency 3 ops (which run in parallel).
While mtctr has latency 5.

On p8 mtxer was horrible indeed (but nothing near as bad as a pipeline
flush).


Segher
