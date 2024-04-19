Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384628AB470
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 19:33:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hz5HA12m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLhZp0Jkpz3dKX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 03:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hz5HA12m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLhZ51XWJz3cR2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 03:33:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A907CE1B5C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 17:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96E1C3277B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713547992;
	bh=sVegppIF/niXLnTLCcBWzkxa2L1ow1Dt9dF+ATN6lsk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hz5HA12mGjDKfqVeo5OEuWAXF7TDIh13CeKJ5HkGMfIHVK1Eso9dNbU7tD++O5rKF
	 0sUzDpSaXME0yKE/l8cgrQWT0Z2sDz6N+xBa5e2JQHDmU99ok3qp4SzMoIVGoVpEwf
	 FexKUZUXH+JNYzZwL8sv4Ui8jBZVcdQT31/FMgdQ0m5wu28goRuvm3B21LF/otZU2O
	 XoCzXXYsLp/0EakVkhWxF02OBZtpBRVRnjNTzYgCBl9NhL3X5Jwa9LaLOt0hsxr64Z
	 QzmDAxTOkYMWvKL9laT9o+PUmzjOHAVeOdb0I3eJy8krCoZrJBeqor627d4pzQ8XKs
	 l7bBiZSmzj0Uw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a5269c3f9c7so262718066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 10:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/jamgLYZfwUOkoEhGPVNq5pOLzPiQt1uKz8nt3TpVFYGGJLA175LFgESZz/TKjFc5bAXAI+mKlAUhjN80Eipo+swFM3MKCYCJi8lrnQ==
X-Gm-Message-State: AOJu0YzAfbnEsnkNskK+c4OnyGeeCNmwLTll3rSLtrnJRtCfpYab7Xom
	+FP6egosB8ZvM0bRpIaxlF3yQLt9vRAmWumo0b/XhNbQ3fTGGgvey5dZPa9912neB95Ldj3fbOY
	EcE0yq4tH4gvF0vgBH3/75CjMAgo=
X-Google-Smtp-Source: AGHT+IFQL0ZIY0ZfQ4j9vl7SSSW0Y7vt5IE5s4aAkthQ3+dt0vC//uVhsYgqRpBdUKo6ap4ecg5hjMNFhNToQ1hMBQU=
X-Received: by 2002:ac2:5a1e:0:b0:519:296e:2c80 with SMTP id
 q30-20020ac25a1e000000b00519296e2c80mr1475078lfn.15.1713547970497; Fri, 19
 Apr 2024 10:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com> <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org> <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org> <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org> <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
In-Reply-To: <ZiKjmaDgz_56ovbv@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Apr 2024 10:32:39 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
Message-ID: <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
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

On Fri, Apr 19, 2024 at 10:03=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
[...]
> > >
> > > [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@kernel.=
org
> >
> > For the ROX to work, we need different users (module text, kprobe, etc.=
) to have
> > the same execmem_range. From [1]:
> >
> > static void *execmem_cache_alloc(struct execmem_range *range, size_t si=
ze)
> > {
> > ...
> >        p =3D __execmem_cache_alloc(size);
> >        if (p)
> >                return p;
> >       err =3D execmem_cache_populate(range, size);
> > ...
> > }
> >
> > We are calling __execmem_cache_alloc() without range. For this to work,
> > we can only call execmem_cache_alloc() with one execmem_range.
>
> Actually, on x86 this will "just work" because everything shares the same
> address space :)
>
> The 2M pages in the cache will be in the modules space, so
> __execmem_cache_alloc() will always return memory from that address space=
.
>
> For other architectures this indeed needs to be fixed with passing the
> range to __execmem_cache_alloc() and limiting search in the cache for tha=
t
> range.

I think we at least need the "map to" concept (initially proposed by Thomas=
)
to get this work. For example, EXECMEM_BPF and EXECMEM_KPROBE
maps to EXECMEM_MODULE_TEXT, so that all these actually share
the same range.

Does this make sense?

Song
