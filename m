Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135C871362
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:13:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QalY8slx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfHS243qz3dWx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QalY8slx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfGm0qHYz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:12:47 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e617b39877so1562014b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709604765; x=1710209565; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+XQ3M+Esqxw+BYm1LMLo360LMfLh1KPGarB/Ars53U=;
        b=QalY8slxU1kAmv/Pe+YMVi6+WJ1irdvZRkSadPUVrQ6ZYoyl4XW75m1v1zH7EI3Kv/
         slKvBujfN84pxMbSOMkAESBS7e7ZEjhz4V+Ox6fUeGFAu+IaRQZ+Ce1TQmG0lo4+fcGQ
         pfqQAWcuQjG7/TEYs1bwaSzyZM2xreZdnbp35gQ0w6aYB+3XKDKPxwgvP6OlVVdzk1zT
         Ep4MMrFeJoN0d7EUGMl6ZX3gYhB8MiMsU6OeGFUZT3LojNrG2axv75+2UHYhTMlpQbxE
         hleaK3UqZaFchRimAnmFf9diFlhq+PrNgaYOTZmGH/G48KVsjXWsEaM3EbyVyUWGbdjf
         5OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604765; x=1710209565;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6+XQ3M+Esqxw+BYm1LMLo360LMfLh1KPGarB/Ars53U=;
        b=MOJY+aMEFaIZ2wbIe9BYQbrQeeqzit0XZYSUzGvRuyJ3KjusC7Dy55RZZcNzo6yP6a
         A9f6MWqEVsEfxMWnF0hePBJa97Z4JB+Xg0b40DDdCbiwugJZwwpS3oH/Zje0pXCEQDcc
         BqBFHaDJRvQvMLFFK/abQBmMrqxLw29gvOh1raBawrl5UPnsvDiP5Zyj/9UDwDepBJEQ
         yfyos4/Oxt4QHmylytUDMewMIke9pnEAQfomABOCwOxPFGc4v5JDxxhbbxWiYEcqQRgj
         n3Hg/hxHy2kPNdE78iCRSFCnqQp8cupEdss0SVlNRa5DmVu3iuGc1xejFBlhxv3RQlZ5
         6wpw==
X-Forwarded-Encrypted: i=1; AJvYcCWeVTLZDMQhjRuezW0Rjm+tzNgOqZvgZuVFDOsZi/+YbjLJCK2jXV3K2A3KE3Q6KFIEcR6I9RXReEOD/DzuuS8ldxUIAor5u6KVz5HuvA==
X-Gm-Message-State: AOJu0YzVTV7WhXZXbmBpXx9VWJZAg4QsUGcG74btYBrp6jZA5W5Bb/pj
	FanQesuN4kEP8j66rTP2fzkowIbAljqqk39EKzWllpqtMyvDB/bJZG8YJEqD
X-Google-Smtp-Source: AGHT+IEu8DynXzu9BByQp4QIf16lsnSVc/1E7fhz1eJ1/IbWK85IpX7ljsbYufF7UOAOwWKIv4wY9g==
X-Received: by 2002:a05:6a20:428e:b0:1a1:4d86:7d2 with SMTP id o14-20020a056a20428e00b001a14d8607d2mr554530pzj.11.1709604765212;
        Mon, 04 Mar 2024 18:12:45 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id gx15-20020a17090b124f00b00298ca46547fsm8430529pjb.36.2024.03.04.18.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:12:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:12:39 +1000
Message-Id: <CZLGB4BCREUU.SZ1AQ0LTGNKB@wheely>
Subject: Re: [kvm-unit-tests PATCH 04/32] powerpc: interrupt stack
 backtracing
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-5-npiggin@gmail.com>
 <9d1166ed-e24f-4257-a441-080f577d3dde@redhat.com>
In-Reply-To: <9d1166ed-e24f-4257-a441-080f577d3dde@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 7:53 PM AEST, Thomas Huth wrote:
> On 26/02/2024 11.11, Nicholas Piggin wrote:
> > Add support for backtracing across interrupt stacks, and
> > add interrupt frame backtrace for unhandled interrupts.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/powerpc/processor.c |  4 ++-
> >   lib/ppc64/asm/stack.h   |  3 +++
> >   lib/ppc64/stack.c       | 55 ++++++++++++++++++++++++++++++++++++++++=
+
> >   powerpc/Makefile.ppc64  |  1 +
> >   powerpc/cstart64.S      |  7 ++++--
> >   5 files changed, 67 insertions(+), 3 deletions(-)
> >   create mode 100644 lib/ppc64/stack.c
> >=20
> > diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> > index ad0d95666..114584024 100644
> > --- a/lib/powerpc/processor.c
> > +++ b/lib/powerpc/processor.c
> > @@ -51,7 +51,9 @@ void do_handle_exception(struct pt_regs *regs)
> >   		return;
> >   	}
> >  =20
> > -	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",=
 regs->trap, regs->nip, regs->msr);
> > +	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
> > +			regs->trap, regs->nip, regs->msr);
> > +	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
> >   	abort();
> >   }
> >  =20
> > diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
> > index 9734bbb8f..94fd1021c 100644
> > --- a/lib/ppc64/asm/stack.h
> > +++ b/lib/ppc64/asm/stack.h
> > @@ -5,4 +5,7 @@
> >   #error Do not directly include <asm/stack.h>. Just use <stack.h>.
> >   #endif
> >  =20
> > +#define HAVE_ARCH_BACKTRACE
> > +#define HAVE_ARCH_BACKTRACE_FRAME
> > +
> >   #endif
> > diff --git a/lib/ppc64/stack.c b/lib/ppc64/stack.c
> > new file mode 100644
> > index 000000000..fcb7fa860
> > --- /dev/null
> > +++ b/lib/ppc64/stack.c
> > @@ -0,0 +1,55 @@
> > +#include <libcflat.h>
> > +#include <asm/ptrace.h>
> > +#include <stack.h>
> > +
> > +extern char exception_stack_marker[];
> > +
> > +int backtrace_frame(const void *frame, const void **return_addrs, int =
max_depth)
> > +{
> > +	static int walking;
> > +	int depth =3D 0;
> > +	const unsigned long *bp =3D (unsigned long *)frame;
> > +	void *return_addr;
> > +
> > +	asm volatile("" ::: "lr"); /* Force it to save LR */
> > +
> > +	if (walking) {
> > +		printf("RECURSIVE STACK WALK!!!\n");
> > +		return 0;
> > +	}
> > +	walking =3D 1;
> > +
> > +	bp =3D (unsigned long *)bp[0];
> > +	return_addr =3D (void *)bp[2];
> > +
> > +	for (depth =3D 0; bp && depth < max_depth; depth++) {
> > +		return_addrs[depth] =3D return_addr;
> > +		if (return_addrs[depth] =3D=3D 0)
> > +			break;
> > +		if (return_addrs[depth] =3D=3D exception_stack_marker) {
> > +			struct pt_regs *regs;
> > +
> > +			regs =3D (void *)bp + STACK_FRAME_OVERHEAD;
> > +			bp =3D (unsigned long *)bp[0];
> > +			/* Represent interrupt frame with vector number */
> > +			return_addr =3D (void *)regs->trap;
> > +			if (depth + 1 < max_depth) {
> > +				depth++;
> > +				return_addrs[depth] =3D return_addr;
> > +				return_addr =3D (void *)regs->nip;
> > +			}
> > +		} else {
> > +			bp =3D (unsigned long *)bp[0];
> > +			return_addr =3D (void *)bp[2];
> > +		}
> > +	}
> > +
> > +	walking =3D 0;
> > +	return depth;
> > +}
> > +
> > +int backtrace(const void **return_addrs, int max_depth)
> > +{
> > +	return backtrace_frame(__builtin_frame_address(0), return_addrs,
> > +			       max_depth);
> > +}
> > diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> > index b0ed2b104..eb682c226 100644
> > --- a/powerpc/Makefile.ppc64
> > +++ b/powerpc/Makefile.ppc64
> > @@ -17,6 +17,7 @@ cstart.o =3D $(TEST_DIR)/cstart64.o
> >   reloc.o  =3D $(TEST_DIR)/reloc64.o
> >  =20
> >   OBJDIRS +=3D lib/ppc64
> > +cflatobjs +=3D lib/ppc64/stack.o
> >  =20
> >   # ppc64 specific tests
> >   tests =3D $(TEST_DIR)/spapr_vpa.elf
> > diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> > index 14ab0c6c8..278af84a6 100644
> > --- a/powerpc/cstart64.S
> > +++ b/powerpc/cstart64.S
> > @@ -188,6 +188,7 @@ call_handler:
> >   	.endr
> >   	mfsprg1	r0
> >   	std	r0,GPR1(r1)
> > +	std	r0,0(r1)
> >  =20
> >   	/* lr, xer, ccr */
> >  =20
> > @@ -206,12 +207,12 @@ call_handler:
> >   	subi	r31, r31, 0b - start_text
> >   	ld	r2, (p_toc_text - start_text)(r31)
> >  =20
> > -	/* FIXME: build stack frame */
> > -
> >   	/* call generic handler */
> >  =20
> >   	addi	r3,r1,STACK_FRAME_OVERHEAD
> >   	bl	do_handle_exception
> > +	.global exception_stack_marker
> > +exception_stack_marker:
> >  =20
> >   	/* restore context */
> >  =20
> > @@ -321,6 +322,7 @@ handler_trampoline:
> >   	/* nip and msr */
> >   	mfsrr0	r0
> >   	std	r0, _NIP(r1)
> > +	std	r0, INT_FRAME_SIZE+16(r1)
>
> So if I got that right, INT_FRAME_SIZE+16 points to the stack frame of th=
e=20
> function that was running before the interrupt handler? Is it such a good=
=20
> idea to change that here?

No, we switch to exception stack and don't support recursing interrupts
on stack at the moment, so this goes into the initial frame.

> Please add a comment here explaining this line.=20
> Thanks!

Yes, good idea.

Thanks,
Nick

>
>
> >   	mfsrr1	r0
> >   	std	r0, _MSR(r1)
> > @@ -337,6 +339,7 @@ handler_htrampoline:
> >   	/* nip and msr */
> >   	mfspr	r0, SPR_HSRR0
> >   	std	r0, _NIP(r1)
> > +	std	r0, INT_FRAME_SIZE+16(r1)
>
> dito.
>
> >   	mfspr	r0, SPR_HSRR1
> >   	std	r0, _MSR(r1)
>
>   Thomas

