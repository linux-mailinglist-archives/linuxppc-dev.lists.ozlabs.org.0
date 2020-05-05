Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0791C5BBD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 17:41:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GkV21kXmzDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 01:41:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 49GkJH2FbYzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 01:33:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 045FWkQB009965;
 Tue, 5 May 2020 10:32:46 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 045FWjVS009961;
 Tue, 5 May 2020 10:32:45 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 5 May 2020 10:32:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
Message-ID: <20200505153245.GN31009@gate.crashing.org>
References: <23e680624680a9a5405f4b88740d2596d4b17c26.1587143308.git.christophe.leroy@c-s.fr>
 <87sggecv81.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sggecv81.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, May 06, 2020 at 12:27:58AM +1000, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> > unsafe_put_user() is designed to take benefit of 'asm goto'.
> >
> > Instead of using the standard __put_user() approach and branch
> > based on the returned error, use 'asm goto' and make the
> > exception code branch directly to the error label. There is
> > no code anymore in the fixup section.
> >
> > This change significantly simplifies functions using
> > unsafe_put_user()
> >
> ...
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >  arch/powerpc/include/asm/uaccess.h | 61 +++++++++++++++++++++++++-----
> >  1 file changed, 52 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> > index 9cc9c106ae2a..9365b59495a2 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -196,6 +193,52 @@ do {								\
> >  })
> >  
> >  
> > +#define __put_user_asm_goto(x, addr, label, op)			\
> > +	asm volatile goto(					\
> > +		"1:	" op "%U1%X1 %0,%1	# put_user\n"	\
> > +		EX_TABLE(1b, %l2)				\
> > +		:						\
> > +		: "r" (x), "m<>" (*addr)				\
> 
> The "m<>" here is breaking GCC 4.6.3, which we allegedly still support.

[ You shouldn't use 4.6.3, there has been 4.6.4 since a while.  And 4.6
  is nine years old now.  Most projects do not support < 4.8 anymore, on
  any architecture.  ]

> Plain "m" works, how much does the "<>" affect code gen in practice?
> 
> A quick diff here shows no difference from removing "<>".

It will make it impossible to use update-form instructions here.  That
probably does not matter much at all, in this case.

If you remove the "<>" constraints, also remove the "%Un" output modifier?


Segher
