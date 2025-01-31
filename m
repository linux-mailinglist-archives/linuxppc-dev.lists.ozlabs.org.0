Return-Path: <linuxppc-dev+bounces-5736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7E5A23A3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 08:40:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YknqJ3sbSz2yRM;
	Fri, 31 Jan 2025 18:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.68
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738309212;
	cv=none; b=IHg1olXa6JwIlAG9Qw1uEGgVDP40sl7h9ySadlbkwokOVe3LAvM1ZnOn5peHgcsZlxf/QTwFoiIzy5te+StKNKS22vFdbKQvK2kkyMkW8Q/MiDHE2C2aTP7s4b22lrHOriAKUE2ZrWfRl4SBuYvTLPD7cxURB7qNUk3IWw0J/AU3kh3KIwDZAhKHQq4IdvvR/woseoR25ZyeZhJEodi+GT3vHtF/vYic9LPOu/Oee1VcSvjkdm4CfJbLU3hqdCrYLg2LqU2Rw+Aidv4+Tze5rd9e5Y37+4zCjKiE+jB/3KZeIasetLT486L0KP9/MzSJkvroOZ2QoTKjtT3Wjh11mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738309212; c=relaxed/relaxed;
	bh=8kQmZAAK+6ewvnmsf4szqYR99Nu9ojx8MPSG+efC0JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=iJdoIgFKd5Zx+j5gm8Lp667qHA9xikG2qr51LD3F64TLXODELApSqqa/q+dgIodGUj3Xy63NWlggFfjazaoea5xsbiHX8Kid8Km6P3WN8V5hQMh29cqEDg4XcYpAyLkDTHzHI9Cb4GJuxEtO3WKZb2rtfcG32YdtAyR5/n3b/INKcGBVOcd63QdCNsfCDUKw4LIbjmlivvNZLamvXm8srsp8mCuY2a1IGRHuE2Ml+yIBigNhaMN00TuczL30B0M2yh5Q9/iSrJf1E4yq6l1OH8AO90FNpOsiStXs0dFsGfZBVawTsC2Rb2lm7c0AgMs4PVs5ne8xF7d1lVnxvmEsmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.68; helo=mail-ua1-f68.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.68; helo=mail-ua1-f68.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YknqG72KBz2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 18:40:10 +1100 (AEDT)
Received: by mail-ua1-f68.google.com with SMTP id a1e0cc1a2514c-85c662ebbc3so403235241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 23:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309207; x=1738914007;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kQmZAAK+6ewvnmsf4szqYR99Nu9ojx8MPSG+efC0JQ=;
        b=hhdHMv5v7vm4c0SUjmj6xjts6L4kZaPHbmyT5jKfygVQRI7yPKJ3yRUqT93svmUoMI
         FBoQ8zFOaMboAHJp+WWLPE0T4HF69WxGP/njPyga35Cxito3Iu6B7slp2b0cvxE3oxDK
         M67TVT0DSn5rgUN8mAiihF2UN6gLBnrsvoRkhZWxmaggnXkb27psxD5PwNp6BkrSxodM
         l7Ee1SuVV65HXobOWrq7pScYn29076D4/hgnUC2+cyRL1tKtsxHUTdCh7Nf39h/T3lri
         M+owgOxKcrwZWWPCdVlfZUFMS1US7JmqOcDzLcIqDjSjkJzf40ssurNJ3PPIoYYjpv7k
         s3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUeFSswCXyDnudVq0oOW/ltS8nnpIrAsTLcW6/IsyrMQwwUi+5DJigeqPw5OQzMRlF1J8oUcUf5zGVKiu4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgWl4Ae7spIknhpvuv1OK7zBG1R9+hTOMRLMzTEE1Qv/pONM9b
	2eQ2x33j3AGg8jTPbzfDvRUcFXBxJJhHzXlfS71nIn6DhFgcpbzMktBGvky3BQh3HA==
X-Gm-Gg: ASbGncuBn1HanhWnEcJXF+CkKR5uI2w4B4DLlHOGWSZAHoZ1iRjVqzfu0ebXSADvlnd
	cPlAjUtqN0HfrJ31vQvZPJja2VbEg4YKGWFrXlLKrpsAv8CkxcOGhPMmksIDlXnVqwQ7OrdHoT+
	o9xIYZtTm7pLEvEeiwKenm8hxIvSEInsFtME4noS5q456yikSh2/69dTGQ1jcQvtg4iAq3rMVJU
	gX3igwqc9V5QwjcnF28R1ZC9i8x4SYI4GoDxqlfgLNSRM932qneAvX7Grau5fQwqrLv+uU91hA3
	7vv6gOM77gpABbEReijp9XnoXI2tAb2cqzcODMMBUR34WzWEHT6O4A==
X-Google-Smtp-Source: AGHT+IFyeMhV4k870DXF4rqgFaI2UiEow3A36aWFg+5dkkVgkTNt6qYJPPJhB+0QJVyAtvpXlbDyqw==
X-Received: by 2002:a05:6102:801f:b0:4b2:4950:16fe with SMTP id ada2fe7eead31-4b9a4fa6ba6mr9446366137.14.1738309206500;
        Thu, 30 Jan 2025 23:40:06 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9bad52bc3sm533380137.29.2025.01.30.23.40.05
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 23:40:05 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85b95896cefso393893241.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 23:40:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJqYqBGiivXb13YZrcX7gRg5F8C5A2BqH5P1260mu6DTWQ5RPiBY4KFVvMgzMlnmAczEejDLXKsfLOOEE=@lists.ozlabs.org
X-Received: by 2002:a05:6122:d87:b0:518:81aa:899b with SMTP id
 71dfb90a1353d-51e9e4e2f3cmr8999970e0c.6.1738309205451; Thu, 30 Jan 2025
 23:40:05 -0800 (PST)
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
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
 <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
 <CAMuHMdVUZQTgLpa9L9R117s39nEqxdGy=CJLyLQaTv_16EDhZg@mail.gmail.com> <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
In-Reply-To: <ihl4bxs65uphmepoyw4xoa26mr4f3gci2mgtoq4osrzeyh3mup@hww2utbkxkfn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 08:39:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
X-Gm-Features: AWEUYZkH_w9tBM_pRW6Ohl7HsK0YqaRuQD-fO1ItmvH8HD9xdtZANpKrFhiastY
Message-ID: <CAMuHMdVUrCfL+UheG56tEtT6K7vm++dNHDmcaL3cWWHyzAaZnw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.6 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
	URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Liam,

On Thu, 30 Jan 2025 at 16:17, Liam R. Howlett <Liam.Howlett@oracle.com> wro=
te:
> * Geert Uytterhoeven <geert@linux-m68k.org> [250130 09:25]:
> > On Thu, 30 Jan 2025 at 15:06, Liam R. Howlett <Liam.Howlett@oracle.com>=
 wrote:
> > > > > it is to get m68k to build, you should probably know how to read =
a
> > > > > makefile.
> > > >
> > > > Like all other kernel cross-compilation? Usually you don't even hav=
e
> > > > to know where your cross-compiler is living:
> > > >
> > > >     make ARCH=3Dm68k
> > >
> > > Ignoring that I had to make a config - which asked challenging
> > > questions...
> >
> > make ARCH=3Dm68k defconfig
>
> That also prompts, defoldconfig did not.

Hmm, using a defconfig should never ask for questions.
Perhaps this might happen if it has an option enabled that depends on
specific compiler support?

> > > And ignoring the steps to get m68k compiler...
> >
> > apt install gcc-m68k-linux-gnu?
>
> There are a few compilers, multilib or such?  I've had issues with
> getting all the archs working for cross compile on the same machine
> (arm, arm64, riscv, m68k, ppc, ppc64, parisc).

I have installed all of the above (and more) from Ubuntu
(except for parisc, as Ubuntu does not have it), and more
from https://www.kernel.org/pub/tools/crosstool/.
All of them should work fine (for building kernels).

> > > > > > When trying the above, and ignoring failures due to missing pac=
kages
> > > > > > on my host:
> > > > > >   - there are several weird build errors,
> > > > > >   - this doesn't play well with O=3D,
> > > > > >   - lots of scary warnings when building for 32-bit,
> > > > > >   - ...
> > > > > >
> > >
> > > In file included from ./include/linux/sched.h:12,
> > >                  from arch/m68k/kernel/asm-offsets.c:15:
> > > ./arch/m68k/include/asm/current.h:7:30: error: invalid register name =
for =E2=80=98current=E2=80=99
> > >     7 | register struct task_struct *current __asm__("%a2");
> >
> > Which compiler are you using?
>
> I've had a hard time getting m68k to boot in qemu because of the lack of
> userspace.  I use m68k for nommu testing, but have a hard time getting
> the buildroot to work correctly to build what I need.

I only do m68k with MMU, and use Debian (ports) userland.
Perhaps https://landley.net/toybox/ might give you a nommu userland.

> More importantly, I think I get your point, you think that the testing
> should be integrated and complain if it's broken - at least by bots.  I
> don't think this is practical in all cases, unfortunately.

Exactly:
  - (cross)building kernel module tests is easy, and included in a
     kernel build, so build failures are detected early.
  - (cross)building the userland testing tools is cumbersome.
So there's an opportunity for improvement...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

