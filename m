Return-Path: <linuxppc-dev+bounces-1962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4C9981B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPPD05NQ0z3bp1;
	Thu, 10 Oct 2024 20:12:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728551552;
	cv=none; b=gV269OrcnHotmOtTAg6+JMrW/mQFf15JJyvcotZX1uz8TdUzhT+1735yGO30vpUGIwWuwFe/mV045XGKC6ebtXArgX/RJqlwXKKQcfc94F6U0lNUntznc/GTCAJWBqBGYOlQ2F7xDuhawRPvqbGtl3A0y04LPVxAx2zcaZMLZc8AIxMUTlk8RQs/i12os5ip8/9hwypbH7lrGzeJ0AICejn4bv0OJfraoJNYvHmesyXwxdkc+LOsED34RFsdXSioYZ95/TRW+uaTVorNL4IT4/oh8QPJDvzpfeNZVTdBXlsUneI2gAMKz5Wv3e1wVzpcE51fsps2d3D/XoRH2Wj9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728551552; c=relaxed/relaxed;
	bh=B9WvqSSuYngn3X8rooA70RyvWXYKx86qbC9FBxuI7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z17U4BI13xCEMmCsqr149cuNDEuHfAyv++bdtanq2AoCO9o1wtXxpjITZRB4e7FYE7ifcj81C2YMKXLYeEPHKwhYjjCSc9mI+9k24JVr5rEB/ThCsWdhwEP4NnxAqPb8CSIlwuK9dQVInQD2Mdyo3PC1C2/Ele1kTsBXkbLQOMqYjqLU6NAlKyga22IA77HjHeOUedreaEonuyW14O9xzo7LanAnQey2VJiz4PtbXBtfaOsvX1BuqYQoc+QLNdZd5xf1L3cqjt1ZsdRROdT08T9ztkPCrqvnxoc2s01eoeFHn1UGHfBae5/K77f79hmthybmbSd38QLDnE2i6vVP+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LbLzXC0Y; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rhnbZ+GF; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=LbLzXC0Y;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rhnbZ+GF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPPCz2Q6gz3bp0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:12:31 +1100 (AEDT)
Date: Thu, 10 Oct 2024 11:12:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728551547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9WvqSSuYngn3X8rooA70RyvWXYKx86qbC9FBxuI7Xw=;
	b=LbLzXC0YXMyWzsBumaCTMWHZ/56y8B/zeoF8uML7fGq2ZQQP+yMhFykhySr/gC6VkgO0y1
	B4juL1gyKX7KfSrl90xPE8t7/P1W4GPxHOTt4omAhnzlQdSzo+eWeZn1XjFzoPK8OGQ7Qa
	U3pCRH/8T0DBJW2FIHlofLDwNlbJ+ttss2a5XjnKaev9RYxNt4IvcLgnzMmb6ESu/SFdGa
	Bpvr5eIenVnajVUxFEnqXhDrUvV48B7+1cwwmU2rL4HHEY6jvX1cfzqxBRETTJWzrLohut
	okG9tWgFseXy4HK2bST0Uafusd1/iASAFAE/wUgacOJP6oAZFPY+gu8SVcle2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728551547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B9WvqSSuYngn3X8rooA70RyvWXYKx86qbC9FBxuI7Xw=;
	b=rhnbZ+GFZTsNP1JMG0bcENLcS/PXk6kQ9VYiZwjF7VweMLYCZluTySEF+7ZQcy8CeS+tyB
	MSihMSUEStHx3aDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
Subject: Re: [PATCH 2/2] powerpc/vdso: Implement __arch_get_vdso_rng_data()
Message-ID: <20241010110927-9688b27e-6048-48ac-a908-5b80ba8da63e@linutronix.de>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
 <a1a9bd0df508f1b5c04684b7366940577dfc6262.1727858295.git.christophe.leroy@csgroup.eu>
 <20241010101449-007991a0-f7c7-4f76-a6cc-413c474b9219@linutronix.de>
 <0a3d0813-e44f-45be-8b9a-957c75aa26cb@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a3d0813-e44f-45be-8b9a-957c75aa26cb@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 11:00:15AM +0200, Christophe Leroy wrote:
> Hi Thomas,
> 
> Le 10/10/2024 à 10:20, Thomas Weißschuh a écrit :
> > On Wed, Oct 02, 2024 at 10:39:29AM +0200, Christophe Leroy wrote:
> > > VDSO time functions do not call any other function, so they don't
> > > need to save/restore LR. However, retrieving the address of VDSO data
> > > page requires using LR hence saving then restoring it, which can be
> > > heavy on some CPUs. On the other hand, VDSO functions on powerpc are
> > > not standard functions and require a wrapper function to call C VDSO
> > > functions. And that wrapper has to save and restore LR in order to
> > > call the C VDSO function, so retrieving VDSO data page address in that
> > > wrapper doesn't require additional save/restore of LR.
> > > 
> > > For random VDSO functions it is a bit different. Because the function
> > > calls __arch_chacha20_blocks_nostack(), it saves and restores LR.
> > > Retrieving VDSO data page address can then be done there without
> > > additional save/restore of LR.
> > > 
> > > So lets implement __arch_get_vdso_rng_data() and simplify the wrapper.
> > > 
> > > It starts paving the way for the day powerpc will implement a more
> > > standard ABI for VDSO functions.
> > > 
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > >   arch/powerpc/include/asm/vdso/getrandom.h | 15 +++++++++++++--
> > >   arch/powerpc/kernel/asm-offsets.c         |  1 -
> > >   arch/powerpc/kernel/vdso/getrandom.S      |  1 -
> > >   arch/powerpc/kernel/vdso/vgetrandom.c     |  4 ++--
> > >   4 files changed, 15 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/include/asm/vdso/getrandom.h b/arch/powerpc/include/asm/vdso/getrandom.h
> > > index 501d6bb14e8a..4302e7c67aa5 100644
> > > --- a/arch/powerpc/include/asm/vdso/getrandom.h
> > > +++ b/arch/powerpc/include/asm/vdso/getrandom.h
> > > @@ -7,6 +7,8 @@
> > >   #ifndef __ASSEMBLY__
> > > +#include <asm/vdso_datapage.h>
> > > +
> > >   static __always_inline int do_syscall_3(const unsigned long _r0, const unsigned long _r3,
> > >   					const unsigned long _r4, const unsigned long _r5)
> > >   {
> > > @@ -43,11 +45,20 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
> > >   static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
> > >   {
> > > -	return NULL;
> > > +	struct vdso_arch_data *data;
> > > +
> > > +	asm(
> > > +		"	bcl	20, 31, .+4\n"
> > > +		"0:	mflr	%0\n"
> > > +		"	addis	%0, %0, (_vdso_datapage - 0b)@ha\n"
> > > +		"	addi	%0, %0, (_vdso_datapage - 0b)@l\n"
> > > +	: "=r" (data) :: "lr");
> > > +
> > > +	return &data->rng_data;
> > >   }
> > 
> > Did you also try something like this:
> > 
> > extern struct vdso_arch_data _vdso_datapage __attribute__((visibility("hidden")));
> > 
> > static __always_inline struct vdso_rng_data *__arch_get_vdso_rng_data(void)
> > {
> >         return &_vdso_datapage.rng_data;
> > }
> > 
> > Not knowing much about ppc asm the resulting assembly looks simpler.
> > And it would be more in line with what other archs are doing.
> 
> Did you build it ?

Yes, I couldn't have looked at the asm otherwise.

> I get :
> 
>   VDSO32C arch/powerpc/kernel/vdso/vgetrandom-32.o
>   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
> supported
> make[2]: *** [arch/powerpc/kernel/vdso/Makefile:75:
> arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1

I forgot to enable CONFIG_COMPAT.
It's only broken for the 32 bit case.

> Current solution gives:
> 
>   24:	42 9f 00 05 	bcl     20,4*cr7+so,28 <__c_kernel_getrandom+0x28>
>   28:	7e a8 02 a6 	mflr    r21
>   2c:	3e b5 00 00 	addis   r21,r21,0
> 			2e: R_PPC_REL16_HA	_vdso_datapage+0x6
>   30:	3a b5 00 00 	addi    r21,r21,0
> 			32: R_PPC_REL16_LO	_vdso_datapage+0xa
> 
> 
> Your solution gives:
> 
>   60:	3e e0 00 00 	lis     r23,0
> 			62: R_PPC_ADDR16_HA	_vdso_datapage
>   64:	3a f7 00 00 	addi    r23,r23,0
> 			66: R_PPC_ADDR16_LO	_vdso_datapage
> 
> 
> So yes your solution looks simpler, but relies on absolute addresses set up
> through dynamic relocation which is not possible because different processes
> map the same VDSO datapage at different addresses.

Due to visibility("hidden"), the compiler should not emit absolute
references but PC-relative ones.
This is how it works for most other architectures, see
include/vdso/datapage.h.

I'll try to see why this doesn't work for ppc32.


Thomas

