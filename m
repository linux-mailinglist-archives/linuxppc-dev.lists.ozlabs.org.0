Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BA8AB696
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 23:43:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m4HnPRVF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLp6s6jyDz3dKy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 07:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m4HnPRVF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLp660Q6Cz3cVv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 07:42:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BBBD61A53
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 21:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA847C072AA
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 21:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713562970;
	bh=TCFccoU0QynIlhNVSwfE9PBflv6m2g3eer2smjEjHo0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m4HnPRVFmWRnbZz8jQgaboXaGgGHKM6NiRHPnWxYnXriYRx79b4qxLh61hmOGchcc
	 BeAAWFrwxoxYJkYzlzLPxW1HmMSHuQQ804wgQ9HB2dliWoJAMe+WuPJgC73w48qsaY
	 8p0FVzWBN/to3b7K3DQ7j/PsKeJd4uV1W+Gch+w6NTUGukNdlDn0g0cB3UnAb3jQx7
	 PSf8rBW9ZQhouGbP6ra7uug8JuzEdjBEg+XfggIiIEQt0h1ve10SOMFqY9M0wevTbL
	 Eq6Fd3MJ0oNRWLCEy29E4JMXnQs2SedtXJyicXYfXpkSeddtxs7BNvLDpvfmOC5KQu
	 tl/dlpBBhEWSQ==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343c2f5b50fso1630317f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 14:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUp4tDu5DqLrxmeJ+Yq9lJyE/J4X/+QXMmbjRBPLU4VJKibjP1RjZ3UAEzCOtQ5rONX6wCiw8RSo+gfXEikQTReoeLaITXA9oJvsq/XJg==
X-Gm-Message-State: AOJu0YzuSEi56Zy5T9hUNlZQBQnTgY2IHb9754uUp6ZwgLeu6kqRisSC
	qF3liVgK+IHHTfG4JXMrI0Ww/KJ6G/vlA6XrP1lnQacDPo8F+oOXtYKvr6IoPSOTsQSe0FvGsgf
	12y+PgsoaWZnP22c/HPNAJnwHWvU=
X-Google-Smtp-Source: AGHT+IH4AnwX5zN14P6kYOA/5jMldeW1Bv8FPwjpWGtVTE89ihBaxTYgE7/68A2MjqxVZZCm/ny8Sr/SdDVp6qchZyo=
X-Received: by 2002:a19:5f4d:0:b0:519:5b84:1038 with SMTP id
 a13-20020a195f4d000000b005195b841038mr1897119lfj.20.1713562948432; Fri, 19
 Apr 2024 14:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org> <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org>
In-Reply-To: <ZiLNGgVSQ7_cg58y@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 14:42:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
Message-ID: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstree
 t@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Bjorn Topel <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024 at 1:00=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Apr 19, 2024 at 10:32:39AM -0700, Song Liu wrote:
> > On Fri, Apr 19, 2024 at 10:03=E2=80=AFAM Mike Rapoport <rppt@kernel.org=
> wrote:
> > [...]
> > > > >
> > > > > [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@ker=
nel.org
> > > >
> > > > For the ROX to work, we need different users (module text, kprobe, =
etc.) to have
> > > > the same execmem_range. From [1]:
> > > >
> > > > static void *execmem_cache_alloc(struct execmem_range *range, size_=
t size)
> > > > {
> > > > ...
> > > >        p =3D __execmem_cache_alloc(size);
> > > >        if (p)
> > > >                return p;
> > > >       err =3D execmem_cache_populate(range, size);
> > > > ...
> > > > }
> > > >
> > > > We are calling __execmem_cache_alloc() without range. For this to w=
ork,
> > > > we can only call execmem_cache_alloc() with one execmem_range.
> > >
> > > Actually, on x86 this will "just work" because everything shares the =
same
> > > address space :)
> > >
> > > The 2M pages in the cache will be in the modules space, so
> > > __execmem_cache_alloc() will always return memory from that address s=
pace.
> > >
> > > For other architectures this indeed needs to be fixed with passing th=
e
> > > range to __execmem_cache_alloc() and limiting search in the cache for=
 that
> > > range.
> >
> > I think we at least need the "map to" concept (initially proposed by Th=
omas)
> > to get this work. For example, EXECMEM_BPF and EXECMEM_KPROBE
> > maps to EXECMEM_MODULE_TEXT, so that all these actually share
> > the same range.
>
> Why?

IIUC, we need to update __execmem_cache_alloc() to take a range pointer as
input. module text will use "range" for EXECMEM_MODULE_TEXT, while kprobe
will use "range" for EXECMEM_KPROBE. Without "map to" concept or sharing
the "range" object, we will have to compare different range parameters to c=
heck
we can share cached pages between module text and kprobe, which is not
efficient. Did I miss something?

Thanks,
Song
