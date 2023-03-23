Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80F6C717C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 21:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjGTP4lgcz3fQg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 07:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IPZIkew3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IPZIkew3;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjGSW08HPz3cfg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 07:01:29 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id u20so13544012pfk.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=IPZIkew3dFtjmZdaViTjyD0HscLUwPXqPripmrMsr3WTFFmpjru7uOEiW5MdR0VV95
         3AkjKWS+SSGR66Z2HcB5pk7YSGalu08/hGwoMnkFnDkE2qoAQbU1GvgUd6upSXxx5s2P
         WgA85mghqIhhEYMtWiZMDw6eVS30vmwumoj8UFiy4jXPgOQpsvTsmsWOaQLIrepOjNLG
         23PQbOvHd/lWhmQ57R9lQXqXoeGABGhKFPHzTLsKICBt+2gzhqsz8P/8SexMqUTFcc6H
         UOF5X9dx/gsFR66RqsvJo3OswMwtQs/bMnp7PF1XkJIv33y55T3bQzLy+NDa36XNhCpS
         +QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679601687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55oTh7z8IE/JgYLIE37w82gPzf2I2OB6Ia2/zSR7Vs=;
        b=nP+ZaZv/k7AEbtAfJI6XlgTV2pOcsQM5rinuggqVRwsaTV/PXqHLLg4l3uHD2zpLSR
         XPd5Cd0eIKybpSMUJ5HLard2qYNtH0rBpyPO3WjlgavPGDQS4d9ms0FbprVslkxWL7sY
         cEeljXNap0WaQLnR4VpQGST1PVAdTj4fuTzKtPnOOQgIjLkSW/KMP3Hcf6Wl642pWUno
         1hHZyYg0dz+2s7YcNcJ4Pmnm5TykozobiznwSct6SqmWQxFx5f4Eo/gzU8LZsAzV5SSD
         FhWxF/nChypLyaFB8Uz+k2mtWp0X5pxzH/o0Fj0Eo2Iq8Yf6I5DoQEujPqsvAZNBZ28x
         mguQ==
X-Gm-Message-State: AO0yUKVZff8Zwr7XUSSOEjQKIUUbxFbZstYzFo0SW0cv8gSQEdTQzJiM
	hlsekQ123jA8t3UWRdaGuLPM2wTsAmQZDV4YxhEiOw==
X-Google-Smtp-Source: AK7set+ozY4YViDqnsSitk2Wr074yCOGB0DUpWwEKn9HjfwuqHnY07bD2pSglnB1LUnHagdMFzX9OQx8JdW2HNZ3kOw=
X-Received: by 2002:a65:484d:0:b0:503:354c:41ad with SMTP id
 i13-20020a65484d000000b00503354c41admr2238413pgs.11.1679601686525; Thu, 23
 Mar 2023 13:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us> <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Thu, 23 Mar 2023 13:01:15 -0700
Message-ID: <CAFP8O3+UO0x9aETSnOkL7=473mX0wrt+ueuB9UgOJaf+N0p7gw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, nathan@kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 22, 2023 at 11:26=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Feb 24, 2023 at 7:58=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:
> >
> > Alexandre Ghiti <alex@ghiti.fr> writes:
> >
> > > +cc linux-kbuild, llvm, Nathan, Nick
> > >
> > > On 2/15/23 15:36, Alexandre Ghiti wrote:
> > >> From: Alexandre Ghiti <alex@ghiti.fr>
> > >>
> > > I tried a lot of things, but I struggle to understand, does anyone ha=
ve
> > > any idea? FYI, the same problem happens with LLVM.
>
> Off the top of my head, no idea.
>
> (Maybe as a follow up to this series, I wonder if pursuing
> ARCH_HAS_RELR for ARCH=3Driscv is worthwhile?)

(I had thought about this for my own fun, but the currently only
implementation arch/arm64/kernel/head.S uses assembly.
Every port needs to write some assembly for the same task, which is a pity.
In FreeBSD rtld, glibc, and musl, DT_RELR code is target-independent.)


> >
> > Don't ask me *why*, but adding --emit-relocs to your linker flags solve=
s
> > "the NULL .rela.dyn" both for GCC and LLVM.
> >
> > The downside is that you end up with a bunch of .rela cruft in your
> > vmlinux.
>
> There was a patch just this week to use $(OBJCOPY) to strip these from
> vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
> https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/
> --
> Thanks,
> ~Nick Desaulniers
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
