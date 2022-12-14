Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF064C831
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 12:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXD1z1zyPz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 22:40:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sp6jLt9R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Sp6jLt9R;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXD121hFcz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 22:39:33 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so6842223pjs.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 03:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BKmhMmSaZWDa3Wb9Diq13TSrmiqECYBgWVUjNdrHCo=;
        b=Sp6jLt9RB7A2VFrAxKxORICEcbmRhDvdBMc+D2XXajErHdQUHeKtFHQ8VU4nB4oB3L
         gLy4YTtAqUDCHL/KoPQPZwVws/1suEgSOCei+ULJff3hVeyXjW5RMBFk5/AZpzKHM3Lm
         YBG+Pw+PbAiREjcsiLvZxj7p8uutslsdz+xv9FsoNVBwbf0GppaQ3s0iFVRiGGI4Z/oy
         QYZ33VOJ5m3q29svLbncAZoK9GqQ1TwFzV5JCBQW0YwddMZC0AXcxJZ4kjaK9MDKI4Pk
         +v59GGp4NeTxofQ03oPEbDNYj79qVjm+pyWugOI1nRfvA5uIrjcY6ZGA+QQmC1+LAxqB
         1o5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4BKmhMmSaZWDa3Wb9Diq13TSrmiqECYBgWVUjNdrHCo=;
        b=23jBuN8Tf3CKN+JnzL+bUKfLFC8TZOej+2Ti74mZWC2u/8yl2N2iyzDaB4kzQOPJzZ
         eV3Ev5MdCqk23xzLnjQA1737fxIlrFrBKZkBhY+JDr9LryfF8Xg5chovugqHlObS6sOH
         wz2+0Bbe4lIY62levrz89E2unhC4URPjfU+SnRDbqQmUWFOGyrOIIDtyMLRl4qVaVFNR
         /IL2Rll7QOC4XaEwrhWOCgUuDW3EWvs3FWTGvapYJGzwwhCL1qLrpzbucF9iz8osHHDC
         zJkjQ95Vi5A/DcsLl0QU0xqI6fQAwHVzSvWBMsguP5VWbsVh/WU9nzH83/hSSC478TeR
         VqWQ==
X-Gm-Message-State: ANoB5pmzjG1u48UwmNu7IVK6CfN4axQ5ZbggqNSm1VG0Y9mTUOv/j0NV
	hoyV0USRefJojOZUqsjKOag=
X-Google-Smtp-Source: AA0mqf64cW1pYy4Tb6sxKQVA69m6f1Ld9mA/bup2v5lp3W0ADR1bQQWtW5WitH7p47kPZd5RaVOcSA==
X-Received: by 2002:a17:90a:ea98:b0:219:2e8c:d1c8 with SMTP id h24-20020a17090aea9800b002192e8cd1c8mr24839653pjz.35.1671017970456;
        Wed, 14 Dec 2022 03:39:30 -0800 (PST)
Received: from localhost (14-200-18-82.tpgi.com.au. [14.200.18.82])
        by smtp.gmail.com with ESMTPSA id 68-20020a17090a09ca00b00219025945dcsm1229798pjo.19.2022.12.14.03.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:39:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Dec 2022 21:39:25 +1000
Message-Id: <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Nicholas Miehlbradt"
 <nicholas@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
 <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
In-Reply-To: <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Dec 14, 2022 at 6:39 PM AEST, Christophe Leroy wrote:
>
>
> Le 14/12/2022 =C3=A0 05:42, Nicholas Miehlbradt a =C3=A9crit=C2=A0:
> > Walks the stack when copy_{to,from}_user address is in the stack to
> > ensure that the object being copied is entirely within a single stack
> > frame.
> >=20
> > Substatially similar to the x86 implementation except using the back
> > chain to traverse the stack and identify stack frame boundaries.
> >=20
> > Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
> > ---
> >   arch/powerpc/Kconfig                   |  1 +
> >   arch/powerpc/include/asm/thread_info.h | 38 +++++++++++++++++++++++++=
+
> >   2 files changed, 39 insertions(+)
> >=20
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 2ca5418457ed..4c59d139ea83 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -198,6 +198,7 @@ config PPC
> >   	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
> >   	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
> >   	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> > +	select HAVE_ARCH_WITHIN_STACK_FRAMES	if PPC64
>
> Why don't you do something that works for both PPC32 and PPC64 ?

+1

> >   	select HAVE_ARCH_KGDB
> >   	select HAVE_ARCH_MMAP_RND_BITS
> >   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> > diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/incl=
ude/asm/thread_info.h
> > index af58f1ed3952..efdf39e07884 100644
> > --- a/arch/powerpc/include/asm/thread_info.h
> > +++ b/arch/powerpc/include/asm/thread_info.h
> > @@ -186,6 +186,44 @@ static inline bool test_thread_local_flags(unsigne=
d int flags)
> >   #define is_elf2_task() (0)
> >   #endif
> >  =20
> > +#ifdef CONFIG_PPC64
> > +
> > +#ifdef CONFIG_PPC64_ELF_ABI_V1
> > +#define PARAMETER_SAVE_OFFSET 48
> > +#else
> > +#define PARAMETER_SAVE_OFFSET 32
> > +#endif
>
> Why not use STACK_INT_FRAME_REGS, defined in asm/ptrace.h ?

I think use a STACK_FRAME prefixed define in asm/ptrace.h, but maybe
avoid overloading the STACK_INT_ stuff for this.

>
> > +
> > +/*
> > + * Walks up the stack frames to make sure that the specified object is
> > + * entirely contained by a single stack frame.
> > + *
> > + * Returns:
> > + *	GOOD_FRAME	if within a frame
> > + *	BAD_STACK	if placed across a frame boundary (or outside stack)
> > + */
> > +static inline int arch_within_stack_frames(const void * const stack,
> > +					   const void * const stackend,
> > +					   const void *obj, unsigned long len)
> > +{
> > +	const void *frame;
> > +	const void *oldframe;
> > +
> > +	oldframe =3D (const void *)current_stack_pointer;
> > +	frame =3D *(const void * const *)oldframe;

This is not the same as x86, they start with the parent of the current
frame. I assume because the way the caller is set up (with a noinline
function from an out of line call), then there must be at least one
stack frame that does not have to be checked, but if I'm wrong about
that and there is some reason we need to be different it should be
commented..

> > +
> > +	while (stack <=3D frame && frame < stackend) {
> > +		if (obj + len <=3D frame)
> > +			return obj >=3D oldframe + PARAMETER_SAVE_OFFSET ?
> > +				GOOD_FRAME : BAD_STACK;
> > +		oldframe =3D frame;
> > +		frame =3D *(const void * const *)oldframe;
> > +	}
> > +
> > +	return BAD_STACK;
> > +}
>
> What about:
>
> +	const void *frame;
> +	const void *params;
> +
> +	params =3D (const void *)current_stack_pointer + STACK_INT_FRAME_REGS;
> +	frame =3D *(const void * const *)current_stack_pointer;
> +
> +	while (stack <=3D frame && frame < stackend) {
> +		if (obj + len <=3D frame)
> +			return obj >=3D params ? GOOD_FRAME : BAD_STACK;
> +		params =3D frame + STACK_INT_FRAME_REGS;
> +		frame =3D *(const void * const *)frame;
> +	}
> +
> +	return BAD_STACK;

What about just copying x86's implementation including using
__builtin_frame_address(1/2)? Are those builtins reliable for all
our targets and compiler versions?

For bonus points, extract the x86 code out into asm-generic and
make it usable by both -=20

static inline int generic_within_stack_frames(unsigned int ptr_offset,
					      unsigned int vars_offset,
                                              const void * const stack,
                                              const void * const stackend,
                                              const void *obj, unsigned lon=
g len)

And our arch_within_stack_frames can just be

    return generic_within_stack_frames(0, STACK_FRAME_ARGS_OFFSET,
                                       stack, stackend, obj, len);

Thanks,
Nick
