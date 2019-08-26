Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9D09D115
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 15:51:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HD2G4Vp2zDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 23:51:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCRy5ZSLzDqG0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:25:34 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7QDPGHZ009715;
 Mon, 26 Aug 2019 08:25:17 -0500
Message-ID: <60da7620a43dc29317a062f1d58dcfde8d32b258.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/time: use feature fixup in __USE_RTC() instead
 of cpu feature.
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
Date: Mon, 26 Aug 2019 23:25:14 +1000
In-Reply-To: <87blwc40i4.fsf@concordia.ellerman.id.au>
References: <55c267ac6e0cd289970accfafbf9dda11a324c2e.1566802736.git.christophe.leroy@c-s.fr>
 <87blwc40i4.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-26 at 21:41 +1000, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> > sched_clock(), used by printk(), calls __USE_RTC() to know
> > whether to use realtime clock or timebase.
> > 
> > __USE_RTC() uses cpu_has_feature() which is initialised by
> > machine_init(). Before machine_init(), __USE_RTC() returns true,
> > leading to a program check exception on CPUs not having realtime
> > clock.
> > 
> > In order to be able to use printk() earlier, use feature fixup.
> > Feature fixups are applies in early_init(), enabling the use of
> > printk() earlier.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > ---
> >  arch/powerpc/include/asm/time.h | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> The other option would be just to make this a compile time decision, eg.
> add CONFIG_PPC_601 and use that to gate whether we use RTC.
> 
> Given how many 601 users there are, maybe 1?, I think that would be a
> simpler option and avoids complicating the code / binary for everyone
> else.

Didn't we ditch 601 support years ago anyway ? We had workaround we
threw out I think...

Cheers,
Ben.

> cheers
> 
> > diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> > index 54f4ec1f9fab..3455cb54c333 100644
> > --- a/arch/powerpc/include/asm/time.h
> > +++ b/arch/powerpc/include/asm/time.h
> > @@ -42,7 +42,14 @@ struct div_result {
> >  /* Accessor functions for the timebase (RTC on 601) registers. */
> >  /* If one day CONFIG_POWER is added just define __USE_RTC as 1 */
> >  #ifdef CONFIG_PPC_BOOK3S_32
> > -#define __USE_RTC()	(cpu_has_feature(CPU_FTR_USE_RTC))
> > +static inline bool __USE_RTC(void)
> > +{
> > +	asm_volatile_goto(ASM_FTR_IFCLR("nop;", "b %1;", %0) ::
> > +			  "i" (CPU_FTR_USE_RTC) :: l_use_rtc);
> > +	return false;
> > +l_use_rtc:
> > +	return true;
> > +}
> >  #else
> >  #define __USE_RTC()	0
> >  #endif
> > -- 
> > 2.13.3

