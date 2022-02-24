Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F56C4C2650
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45hp5TBqz3089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:31:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256 header.s=DKIM header.b=ndlmi1AQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.148; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=ndlmi1AQ; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound5mad.lav.puc.rediris.es
 [130.206.19.148])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45gs4pQQz3bcv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:30:13 +1100 (AEDT)
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es
 [130.206.24.43])
 by mx01.puc.rediris.es  with ESMTP id 21O8U0DJ022857-21O8U0DL022857
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 24 Feb 2022 09:30:00 +0100
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 88B8B300B952;
 Thu, 24 Feb 2022 09:30:00 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTP id 78135300C3A2;
 Thu, 24 Feb 2022 09:30:00 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out01.sim.rediris.es
Received: from mta-out01.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out01.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ga1OKfOOAvLI; Thu, 24 Feb 2022 09:30:00 +0100 (CET)
Received: from lt-gp.iram.es (haproxy02.sim.rediris.es [130.206.24.70])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPA id F1025300B952;
 Thu, 24 Feb 2022 09:29:59 +0100 (CET)
Date: Thu, 24 Feb 2022 09:29:55 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Message-ID: <YhdCAwQ+VfLTslnV@lt-gp.iram.es>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
 <YhadiVbwao/p2N7o@lt-gp.iram.es>
 <20220223232739.GJ614@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223232739.GJ614@gate.crashing.org>
X-FE-Policy-ID: 23:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=qlaKR81TB9uC2qecK8Ka2Y5+wlvJqCdWDbHzUcfcJ7U=;
 b=ndlmi1AQs/O8De46rNXAR9JR8GwX4uyB1QBUMFmXWqdacLOh079Mhp/eegPEMKZg954bG9hOoScg
 VcOb27Mdh41JaedY6PFZMnh+E1lVA4+WkxH+Y7v03pjbdBzUSZdbqKzySXGqABGHYW4pHelBvRwp
 UlnhV7SXcomMZRou0yHIYHvFYpYhcWiE1aJaPVVegXfMoqKfbaoLTKTWM3Zu+8lDIkHXdmmoUe2i
 PcC88D9V6X0cikzfXu1DrmE7L5xzrQbi9ilyuINsxvUnFY/725tpUxQgxDFi5mcI5M3Mr1GAyaDn
 Jh9zAHux/U9FUMGQC8wtxpNNZ0Ab8qT0e82V0w==
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

On Wed, Feb 23, 2022 at 05:27:39PM -0600, Segher Boessenkool wrote:
> On Wed, Feb 23, 2022 at 09:48:09PM +0100, Gabriel Paubert wrote:
> > On Wed, Feb 23, 2022 at 06:11:36PM +0100, Christophe Leroy wrote:
> > > +	/* Zero volatile regs that may contain sensitive kernel data */
> > > +	li	r0,0
> > > +	li	r4,0
> > > +	li	r5,0
> > > +	li	r6,0
> > > +	li	r7,0
> > > +	li	r8,0
> > > +	li	r9,0
> > > +	li	r10,0
> > > +	li	r11,0
> > > +	li	r12,0
> > > +	mtctr	r0
> > > +	mtxer	r0
> > 
> > Here, I'm almost sure that on some processors, it would be better to
> > separate mtctr form mtxer. mtxer is typically very expensive (pipeline
> > flush) but I don't know what's the best ordering for the average core.
> 
> mtxer is cheaper than mtctr on many cores :-)

We're speaking of 32 bit here I believe; on my (admittedly old) paper
copy of PowerPC 604 user's manual, I read in a footnote:

"The mtspr (XER) instruction causes instructions to be flushed when it
executes." 

Also a paragraph about "PostDispatch Serialization Mode" which reads:
"All instructions following the postdispatch serialization instruction
are flushed, refetched, and reexecuted."

Then it goes on to list the affected instructions which starts with:
mtsper(xer), mcrxr, isync, ...

I know there are probably very few 604 left in the field, but in this
case mtspr(xer) looks very much like a superset of isync.

I also just had a look at the documentation of a more widespread core:

https://www.nxp.com/docs/en/reference-manual/MPC7450UM.pdf

and mtspr(xer) is marked as execution and refetch serialized, actually
it is the only instruction to have both.

Maybe there is a subtle difference between "refetch serialization" and
"pipeline flush", but in this case please educate me.

Besides that the back to back mtctr/mtspr(xer) may limit instruction
decoding and issuing bandwidth.  I'd rather move one of them up by a few
lines since they can only go to one of the execution units on some
(or even most?) cores. This was my main point initially.

	Gabriel

> 
> On p9 mtxer is cracked into two latency 3 ops (which run in parallel).
> While mtctr has latency 5.
> 
> On p8 mtxer was horrible indeed (but nothing near as bad as a pipeline
> flush).
> 
> 
> Segher
 

