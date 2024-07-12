Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAD92F542
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 07:53:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8mX7n1s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WL1451k7Pz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 15:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8mX7n1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mchehab+huawei@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WL13P5htqz30W1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 15:53:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8F16CE1A35;
	Fri, 12 Jul 2024 05:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D0C3277B;
	Fri, 12 Jul 2024 05:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720763582;
	bh=OsnxxtZ8aNzoHaRaBj666PxT5Qr4RTk3qJYfN72D0hU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O8mX7n1s54ENYm8KJks55dNzdK6Lfov0Mdh9l11y1xCWHYSOZJL5FPDtJXr+64jsA
	 fF32OxVM+xZMKDjWtkpi0WMD715qEHbYCJhb29tXkcda9zAlHrZx+cwHbLqihdM1jo
	 FX8ZHIuqcZlhnL9JRhjNnsaK90IuS0DMR0feZBHQLlcO05oMcnplqDF9HZBAwI0rqn
	 EF7x26i/kXuBQYaJodreHb7KTcWolsbJa6XuhI7l6iESH+Gr5vqH9A5q6iFycCyvSr
	 I8vwKQqJ2AV6W4dekH7NjwDfRKG0MzKOSB1OvAKsZ1QfZfCfM8p2Pz327Nji+5DZXo
	 Uv4O+GvAckwqg==
Date: Fri, 12 Jul 2024 07:52:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v12 1/6] uaccess: add generic fallback version of
 copy_mc_to_user()
Message-ID: <20240712075253.05e548d9@foz.lan>
In-Reply-To: <20240711155343.3729bc30@foz.lan>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
	<20240528085915.1955987-2-tongtiangen@huawei.com>
	<20240711155343.3729bc30@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, 11 Jul 2024 15:53:43 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 28 May 2024 16:59:10 +0800
> Tong Tiangen <tongtiangen@huawei.com> escreveu:
> 
> > x86/powerpc has it's implementation of copy_mc_to_user(), we add generic
> > fallback in include/linux/uaccess.h prepare for other architechures to
> > enable CONFIG_ARCH_HAS_COPY_MC.
> > 
> > Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> > ---
> >  arch/powerpc/include/asm/uaccess.h | 1 +
> >  arch/x86/include/asm/uaccess.h     | 1 +
> >  include/linux/uaccess.h            | 8 ++++++++
> >  3 files changed, 10 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> > index de10437fd206..df42e6ad647f 100644
> > --- a/arch/powerpc/include/asm/uaccess.h
> > +++ b/arch/powerpc/include/asm/uaccess.h
> > @@ -381,6 +381,7 @@ copy_mc_to_user(void __user *to, const void *from, unsigned long n)
> >  
> >  	return n;
> >  }
> > +#define copy_mc_to_user copy_mc_to_user  
> 
> Such define looks weird on my eyes. What to do you want to do here?

Ok, other places at uaccess.h have the same pattern. After
sleeping over it, it is now clear to me the rationale:

you're using an inline to enforce typecast check, as using just a
macro won't be doing cast checks.

The define will let to use gcc preprocessor #if/#ifdef logic to check 
if the symbol was defined or not, which makes sense as not all
architectures have it.

Clever.

Patch LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> >  #endif
> >  
> >  extern long __copy_from_user_flushcache(void *dst, const void __user *src,
> > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > index 0f9bab92a43d..309f2439327e 100644
> > --- a/arch/x86/include/asm/uaccess.h
> > +++ b/arch/x86/include/asm/uaccess.h
> > @@ -497,6 +497,7 @@ copy_mc_to_kernel(void *to, const void *from, unsigned len);
> >  
> >  unsigned long __must_check
> >  copy_mc_to_user(void __user *to, const void *from, unsigned len);
> > +#define copy_mc_to_user copy_mc_to_user  
> 
> Same here.
> 
> >  #endif
> >  
> >  /*
> > diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> > index 3064314f4832..0dfa9241b6ee 100644
> > --- a/include/linux/uaccess.h
> > +++ b/include/linux/uaccess.h
> > @@ -205,6 +205,14 @@ copy_mc_to_kernel(void *dst, const void *src, size_t cnt)
> >  }
> >  #endif
> >  
> > +#ifndef copy_mc_to_user
> > +static inline unsigned long __must_check
> > +copy_mc_to_user(void *dst, const void *src, size_t cnt)
> > +{
> > +	return copy_to_user(dst, src, cnt);
> > +}
> > +#endif
> > +
> >  static __always_inline void pagefault_disabled_inc(void)
> >  {
> >  	current->pagefault_disabled++;  
> 
> 
> 
> Thanks,
> Mauro



Thanks,
Mauro
