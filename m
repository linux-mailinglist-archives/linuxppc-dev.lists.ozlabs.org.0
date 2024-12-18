Return-Path: <linuxppc-dev+bounces-4289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 660539F6287
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:17:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCqNd0VvFz2xxt;
	Wed, 18 Dec 2024 21:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734517025;
	cv=none; b=YqJhABYsDXiumkLTAzomWg9zycDJNT6Sg0bc5/QZCvIupv6rh12vFJyMZkF40bzg3kORLJyOuYP79zI4YZO9rF9BDzMvLjOIFNwyDzgMR9xH6/THy6Nui7GQplclecgeBMyT4d5ccNwx7/8wKhNggfBC6kQkJNcKEtAJZ3nDFXZ7+QdXqfw/9Wnx2BXaZ489bdet4Udr9fCVT/kVEownNGOZMKrNrQI8w5DoZKCHgz0OXJ/3gq/FS2WykWRGAeo80MxbwGn0PxeGySGetqos2GllaZqOedL0g1BsZEnRb5kF/NwHdwEP9TmH3qFj5+ymHZ0vUlrdwaWn9lfcGKThOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734517025; c=relaxed/relaxed;
	bh=asQwivYoQ6OyVNJBd3EdgJw1JjuKg7fNklboQjqanF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXpGqW7bTa00BdmfFUaakFZNDPto9YWA0eyW64j7rXuW4J+OniOWrozyFmLotiq2H+ujAVi2j9FfkewsUoN5KP7nIKaEj5OI59kJb2/Rzt/XckzOleMpaksCdyRYHODv7EUzdX13pxFJL6X13ipO7Sn7ep8eeFTZtP+k3wLcndvKUtNO3I56QmpAUhKpl/L/ylFOrRoyehMMqz2ZyNVaBlKbANparJFoiyaoiTW49sPfHFRV+fI8qnsK0wads2VznDGunuC5aueF2ZXNTXD+2IrNvGc0KiNR2zVUWDioEKDRN3D46Xqn00axhKEO+LgZTGd8GnQAjh6SvXIPgrBXGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=k+9+2dt8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yXhQ4Rje; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=k+9+2dt8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yXhQ4Rje;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCqNb31p0z2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:17:03 +1100 (AEDT)
Date: Wed, 18 Dec 2024 11:16:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734517014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asQwivYoQ6OyVNJBd3EdgJw1JjuKg7fNklboQjqanF4=;
	b=k+9+2dt84P2yu2JQjHriNsnfLK1U2zwMe3zETXzWpHvMFbzWIWRl0216I0Fp7Fs0GxVlyo
	yc6i4Q3Hu1q2hD8wlkaWxUa2/LSRxg2COBfpJYgxfKOVjFaVDrdSLxoJSE3b4rni7eSePg
	zI/dWD74oT5nZPEZZO7hwDCfBtI4dfQFjxRIFS9AkAU85OAfFsoE1hleSOYGu1n4z2yAZY
	Y1RK/InyIx+aLJuE6QRRzC4LUqndo/HAvuKeT1pLXt7sSb5Bh3nglAiSTENEvex8fG+geW
	f0ENU722o2Q/62/Nus5sE3hNF3ZF1A45agg8WoxbV4hKlyXpoR26vp6T9Jw1dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734517014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asQwivYoQ6OyVNJBd3EdgJw1JjuKg7fNklboQjqanF4=;
	b=yXhQ4RjeaS/+ewnR286ORrRNsrdJ4qpmR9IkiLgWDlKmPEPu6UZYxm4SDqI/YyJISRXAyJ
	qqASr10vg3j1/pBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 12/17] powerpc/vdso: Switch to generic storage
 implementation
Message-ID: <20241218105556-6d6d0bcb-f2d7-418e-a4e6-1222c506d2cb@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-12-f7aed1bdb3b2@linutronix.de>
 <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

On Wed, Dec 18, 2024 at 08:20:51AM +0100, Christophe Leroy wrote:
> Le 16/12/2024 à 15:10, Thomas Weißschuh a écrit :

[..]

> >   #ifdef CONFIG_TIME_NS
> > -static __always_inline
> > -const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
> > +static __always_inline const struct vdso_time_data *__ppc_get_vdso_u_timens_data(void)
> >   {
> > -	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
> > +	struct vdso_time_data *time_data;
> > +
> > +	asm(
> > +		"	bcl	20, 31, .+4\n"
> > +		"0:	mflr	%0\n"
> > +		"	addis	%0, %0, (vdso_u_timens_data - 0b)@ha\n"
> > +		"	addi	%0, %0, (vdso_u_timens_data - 0b)@l\n"
> > +	: "=r" (time_data) :: "lr");
> > +
> > +	return time_data;
> 
> Please don't do that, it kills optimisation efforts done when implementing
> VDSO time. Commit ce7d8056e38b ("powerpc/vdso: Prepare for switching VDSO to
> generic C implementation.") explains why.
> 
> For time data, the bcl/mflr dance is done by get_datapage macro called by
> cvdso_call macro in gettimeofday.S, and given to
> __cvdso_clock_gettime_data() by __c_kernel_clock_gettime() in
> vgettimeofday.c . Use that information and don't redo the bcl/mflr sequence.

So instead keeping the logic of this:

static __always_inline
const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
{
	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
}

Makes sense.

Adding a constant value should be cheaper or just as cheap as a
PC-relative addressing for all architectures, so it can go into the
generic code, too.

[..]

> >   }
> > +#define __arch_get_vdso_u_timens_data __ppc_get_vdso_u_timens_data
> 
> There is not #ifdef __arch_get_vdso_u_timens_data anywhere, this #define is
> not needed, the function should be called __arch_get_vdso_u_timens_data()
> directly as before, unnecessary indirections reduce readability.

I'll see how this works out with the include order and conflicts with
symbols in include/vdso/datapage.h.

> >   #endif
> > -static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
> > +static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
> >   {
> >   	return true;
> >   }


Thanks!
Thomas

