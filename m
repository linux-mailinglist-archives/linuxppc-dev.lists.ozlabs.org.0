Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF008AB28A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 17:55:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqf8XrEo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLfPj6bcCz3dBx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 01:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pqf8XrEo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLfP154wtz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 01:55:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5DDBECE16E7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 15:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F700C3277B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713542114;
	bh=PNzXHy/tRctT7iPO4Hxb0l/pQDROtMOUfttALn8mdWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pqf8XrEo/ZXtoYY6s3PyoZrVaUFPmoHxFRVaIVD+cv3s9s0b57yKCkZBfgw3J/DFY
	 ItFu/AL8+h/o6KzZv3W/jgdaahJ+fBSkuBMaq6Fa9gIV+jIx0BRXS0xUN7/X5dBPCS
	 CtUI7XjfYrMseAEBlWGp1/BlZfgiFr+70fAxlZPMxdU8CUsp8cqjeiGh7fSLDtYeJ4
	 ci293wBMZSj5XVodFvDDRPQI2WnRMIxx356QO12oxl9Vr7bTlPCN/kbkpDTGdnUTk0
	 OJtvbGt6roHNq6+muZAwUQgB2hXjVyHoavfSajpvVRjHUvmn/YdlEKZxa/rSjatbO9
	 x3piRqi1B5HPQ==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a526d381d2fso575722966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 08:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/fY6ooaFZ8CJVO9h7hgg0aDOZZwc7BswNkm3F7E2vbt5W5wY7cY+Ee4+3FIpvQZWn0kdEUizlHdO+VBKDoKJ4xTNpP4G7MjS1CkWZMA==
X-Gm-Message-State: AOJu0YyEscYMtgybeP3IjQaBZub3TAFngnOO3/fnGI9LbTpFkz48F1sc
	GjNKX+Z2ZPxN8GgPPGd0456UZWzCGFCUOwBPSTNCKMhyOpyL8v44eACZKs6hFvNwpo8MLEyuAaI
	gqxg91rQaFGNybRBh770AB8DipXI=
X-Google-Smtp-Source: AGHT+IGasMltj1XTiWxWNEYkPSMxwP63y2jyTt8tLpdHn26unpYTPPkYdRp/dT6gEwD6NrNiKXUtIlL7PF9cDNubUq4=
X-Received: by 2002:ac2:5f9b:0:b0:519:ab33:7459 with SMTP id
 r27-20020ac25f9b000000b00519ab337459mr752898lfe.30.1713542091952; Fri, 19 Apr
 2024 08:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240411160051.2093261-1-rppt@kernel.org> <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net> <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org> <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
In-Reply-To: <ZiIVVBgaDN4RsroT@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 08:54:40 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
Message-ID: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 11:56=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Thu, Apr 18, 2024 at 02:01:22PM -0700, Song Liu wrote:
> > On Thu, Apr 18, 2024 at 10:54=E2=80=AFAM Mike Rapoport <rppt@kernel.org=
> wrote:
> > >
> > > On Thu, Apr 18, 2024 at 09:13:27AM -0700, Song Liu wrote:
> > > > On Thu, Apr 18, 2024 at 8:37=E2=80=AFAM Mike Rapoport <rppt@kernel.=
org> wrote:
> > > > > > >
> > > > > > > I'm looking at execmem_types more as definition of the consum=
ers, maybe I
> > > > > > > should have named the enum execmem_consumer at the first plac=
e.
> > > > > >
> > > > > > I think looking at execmem_type from consumers' point of view a=
dds
> > > > > > unnecessary complexity. IIUC, for most (if not all) archs, ftra=
ce, kprobe,
> > > > > > and bpf (and maybe also module text) all have the same requirem=
ents.
> > > > > > Did I miss something?
> > > > >
> > > > > It's enough to have one architecture with different constrains fo=
r kprobes
> > > > > and bpf to warrant a type for each.
> > > >
> > > > AFAICT, some of these constraints can be changed without too much w=
ork.
> > >
> > > But why?
> > > I honestly don't understand what are you trying to optimize here. A f=
ew
> > > lines of initialization in execmem_info?
> >
> > IIUC, having separate EXECMEM_BPF and EXECMEM_KPROBE makes it
> > harder for bpf and kprobe to share the same ROX page. In many use cases=
,
> > a 2MiB page (assuming x86_64) is enough for all BPF, kprobe, ftrace, an=
d
> > module text. It is not efficient if we have to allocate separate pages =
for each
> > of these use cases. If this is not a problem, the current approach work=
s.
>
> The caching of large ROX pages does not need to be per type.
>
> In the POC I've posted for caching of large ROX pages on x86 [1], the cac=
he is
> global and to make kprobes and bpf use it it's enough to set a flag in
> execmem_info.
>
> [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@kernel.org

For the ROX to work, we need different users (module text, kprobe, etc.) to=
 have
the same execmem_range. From [1]:

static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
{
...
       p =3D __execmem_cache_alloc(size);
       if (p)
               return p;
      err =3D execmem_cache_populate(range, size);
...
}

We are calling __execmem_cache_alloc() without range. For this to work,
we can only call execmem_cache_alloc() with one execmem_range.

Did I miss something?

Thanks,
Song
