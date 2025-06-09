Return-Path: <linuxppc-dev+bounces-9230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E6AD296B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 00:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGRcS3QqSz2xHX;
	Tue, 10 Jun 2025 08:36:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::832"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749508616;
	cv=none; b=M/uL3ais71g/XnUH8gLd1Hbk+CUl0dkydi9jRp/UkjydILWB3nMCLUmN3cI+sa+P7LVGJ/DzcmKT22edMRrcHlscZLCv3oj2u0EQyWNiNzcg0Bx8vZprcVpUw9oUhPZT8cvJ3+3Z6YMhvLunYsMBbiCbsq0y/v/p7UbQBvTU6jEGA1iWpTfoRiflP99KMpl34YWe60e6OYwRgzPsbCFwYFS1uQ3j1726xWH9P4RNq5/CWkGnbIufGlpB57PaxLHGcFNQh7AVxveoXp2wqshDVpmX9bSJlFFGDdzyeC48N8vu3JqxtqYn9RJb1Wm34fPZ81AZVUcoJLL2mkfetPoVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749508616; c=relaxed/relaxed;
	bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaAvM8asolJ6McqkYKrBsQ/srGF7qMhAaeu1MKIkJ4WtmuLbNznVud0uktAJ9lCEBvXaBp5TjFFai523sSOG/mgv0IuU5gN8ctN/eex9scUwFZrfhG8oNM+W7cKhPsaO+IcXFw51FGx1otiGAjE44epv8hKEHwGsStgEM00FSQV1eNNFcKJY8sVdmzOmu5jQ9zLJQ85PYBQUNxv07zqvclkPgj0QAX5YFYJ1GsinOWZnwZ6ieGtV8HUocXN3fsLsb0vCvl/IrWeKmKiVGeK6q9554Gm42HD9JUbBcQDLqH/RZY739UU7CLYI+vJtIffw9aTqcLeoHETKy+cbvsf/sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAkZdPDE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iAkZdPDE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=julian.calaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGRcR15cyz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 08:36:54 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4a6f6d07bb5so22465671cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jun 2025 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749508610; x=1750113410; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=iAkZdPDEsr73wRa+ebeRsTigoZfvC4SwRhUJJZa/2BsfVAxXSzmlSPOdPIkv2E5k6i
         yyWin329bAMeexHE6lArCq94MNl4r1GqEY204xQVQNOP65g0jrpITTzif5gnSnhhlRA/
         tZuRpcdnUq5a3Q5ggLcmv3jL/U5LurHBcsFFdBGZoYRx48TfC5OPEYNJzwVvbKBPSl3c
         +3jPzP/39TSflhOtqDVsB1K0NyZ307INOi0Kr2G4FQYWpyUVjN1P9MViXOiNFzpxUf2f
         cx1idgUW29tOqsvqVZPmW668V/Aa41SmUOQFtheRdha8BwNAP1OW/Sgaxx6qg5kkAhXu
         H60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749508610; x=1750113410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=IFT4c2aX2Zsh2Xd9ItNC8MznDgvmpDsSZjnWO40QK6bFNrsGU4hMbd7cDLVyEVTvG+
         N8T5olEBioTaLa/c54MZLY4/5Js4cATbljC9BihXfORdQfhOI1bSH1XAwvnpm7xKHQzz
         Am48mdvd8QEc+Pj7PnB9UcDbhEHLpl3yxCNgwR5kNmnpQZh5Gi/2HePwOathFB6Y0ncw
         mt3AHrEz/b6FCe2zvzt7YMtFBCKGejWPxJmpv2w/daUBenlIYFfP7ZRPeaFA5zvjyDgs
         YHs6q5yMPlYZNTGG98V/1fK23NFR1pz+oE03zd8475nwrQZhwUwduBp1Eoc8St/FYE5g
         d7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMWJY00cQzMsbWoM/Uie+oPxkztfy862FgtK8XUt/9zWnBhM9oG0J54fJCFHRZYJJWsA/JoXcFIXziSic=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx8VPpmBsztqsx+QHa9lQq8tciT69iQX72ZLNW1RiBMd4CpnWBB
	oSRgGmrAxkPX+zQNo4p2MaMPq8vCi9Q46eWcCOmc7pxiN4QzH1IyoKvy8jrTvxPQL6rsn8r5UxN
	dkY+5bV8UxM2+/dg1cpadfmQBwSww65Q=
X-Gm-Gg: ASbGncuU9wESC5YxwneqC1xbnJFiWu7VlfCp7SXiMGAHXvhtGY6CpEvXIXqB3PXU0Om
	syc7h+D1Vv/YNJEJ2MenodeLSknrVbpngsF/irtRP/8EaX6a4vm1KqTPRweYtaKTlh1UUW7qS0h
	+OGSfR8Io3zWRBgm3hUMAsboAGA0geTluEpA3tVv/b7z0=
X-Google-Smtp-Source: AGHT+IEs8tHro3Bqg7q8bk+joLEpnvyUJ+PSWmsKZZ858+7uklxqykPVE6FCaw1PpU8qCZAfdipBs10XMfJUvah5VmA=
X-Received: by 2002:a05:6214:f2a:b0:6fa:f94e:6e75 with SMTP id
 6a1803df08f44-6fb08f5f7c4mr277251346d6.25.1749508610272; Mon, 09 Jun 2025
 15:36:50 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org> <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
 <20250609194845.GC1255@sol>
In-Reply-To: <20250609194845.GC1255@sol>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 10 Jun 2025 08:36:39 +1000
X-Gm-Features: AX0GCFuUtzPWjE_fUMffnG3t-eGyXruP1OclUqP-Gat86eROO8R2ly8lc5p3jN0
Message-ID: <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Eric,

On Tue, Jun 10, 2025 at 5:49=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> > Hi Eric,
> >
> > On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> > >
> > > This series is also available at:
> > >
> > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebigger=
s/linux.git lib-crc-arch-v2
> > >
> > > This series improves how lib/crc supports arch-optimized code.  First=
,
> > > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/,=
 it
> > > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > > functions (e.g. crc32c_base()) will now be part of a single module fo=
r
> > > each CRC type, allowing better inlining and dead code elimination.  T=
he
> > > second change is made possible by the first.
> > >
> > > As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> > > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > > were already coupled together and always both got loaded together via
> > > direct symbol dependency, so the separation provided no benefit.
> > >
> > > Note: later I'd like to apply the same design to lib/crypto/ too, whe=
re
> > > often the API functions are out-of-line so this will work even better=
.
> > > In those cases, for each algorithm we currently have 3 modules all
> > > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > > sha256-x86.ko.  We should have just one, inline things properly, and
> > > rely on the compiler's dead code elimination to decide the inclusion =
of
> > > the generic code instead of manually setting it via kconfig.
> > >
> > > Having arch-specific code outside arch/ was somewhat controversial wh=
en
> > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > warranted.  It's better from a technical perspective, as it enables t=
he
> > > improvements mentioned above.  This model is already successfully use=
d
> > > in other places in the kernel such as lib/raid6/.  The community of e=
ach
> > > architecture still remains free to work on the code, even if it's not=
 in
> > > arch/.  At the time there was also a desire to put the library code i=
n
> > > the same files as the old-school crypto API, but that was a mistake; =
now
> > > that the library is separate, that's no longer a constraint either.
> >
> > Quick question, and apologies if this has been covered elsewhere.
> >
> > Why not just use choice blocks in Kconfig to choose the compiled-in
> > crc32 variant instead of this somewhat indirect scheme?
> >
> > This would keep the dependencies grouped by arch and provide a single p=
lace to
> > choose whether the generic or arch-specific method is used.
>
> It's not clear exactly what you're suggesting, but it sounds like you're
> complaining about this:
>
>     config CRC32_ARCH
>             bool
>             depends on CRC32 && CRC_OPTIMIZATIONS
>             default y if ARM && KERNEL_MODE_NEON
>             default y if ARM64
>             default y if LOONGARCH
>             default y if MIPS && CPU_MIPSR6
>             default y if PPC64 && ALTIVEC
>             default y if RISCV && RISCV_ISA_ZBC
>             default y if S390
>             default y if SPARC64
>             default y if X86

I was suggesting something roughly like:

choice
    prompt "CRC32 Variant"
    depends on CRC32 && CRC_OPTIMIZATIONS

config CRC32_ARCH_ARM_NEON
    bool "ARM NEON"
    default y
    depends ARM && KERNEL_MODE_NEON

...

config CRC32_GENERIC
    bool "Generic"

endchoice

> This patchset strikes a balance where the vast majority of the arch-speci=
fic CRC
> code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
> lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sens=
e,
> given that we're building a single module per CRC variant.  We'd have to =
go
> through some hoops to isolate the arch-specific Kconfig and Makefile snip=
pets
> into per-arch files, which don't seem worth it here IMO.

I was only really concerned with the Kconfig structure, I was
expecting Kbuild to look roughly like this: (filenames are wrong)

crc32-y +=3D crc32-base.o
crc32-$(CRC32_ARCH_ARM_NEON) +=3D arch/arm/crc32-neon.o
...
crc32-$(CRC32_GENERIC) +=3D crc32-generic.o

but yeah, your proposal here has grown on me now that I think about it
and the only real "benefit" mine has is that architectures can display
choices for variants that have Kconfig-visible requirements, which
probably isn't that many so it wouldn't be useful in practice.

Thanks for answering my question,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

