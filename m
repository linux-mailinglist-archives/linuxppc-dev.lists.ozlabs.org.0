Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B716C53BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 19:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhcPd4ZtTz3cjW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 05:26:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Nc7bqPWv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Nc7bqPWv;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhcNm1pd1z3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 05:25:59 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so19993650pjt.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=Nc7bqPWvvVP0Fh9GRUREatEuPhbNWcj8ydyJq6p7WhnKTmZsmINp40U8jm2U/D3eOh
         GiADNrvpDW1src3wBD86k8hybLw++0LHdLBlze0Q290ZO1ycLMYXpjqhF0bC849Amhtk
         Uy0gNTTczAqnmq7Ne1eUnCmgjRAczfqeQ58RKE9Z1Dbo8WYhXCE+35mHwpNTZjinRv7Z
         SvFY91A1LyC+CNVJab3PMehak5rGBLhjGTsCzg52VkGZ8uMK06Y5GA1JlP2dh0NN6NWH
         L5Jzlk3GH1BS4NTePFlNBmFvEFZSn5SfhLcK85z0+yzixjDvudD4Wt6pqVVnBBIsUYXI
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=0eGLuL94hs/mmJUcBEQhfG02ck4C+hW6PNVZO3Qw7U8PI0LNlDUy4sgM6/7yrvbAKC
         SdwR8k9uNEvswLk/7yqu9vEgi7R3s7wlKkpnRYfwOEy858E1OFPJzD2IQY8QMBzpMo0M
         Q45DQqPc41rdM/Sh7+bdUsXuhKMkHP4fnGQlU4cm9YaaiVK3Q/SzSBqkN1i+r9yJfEgc
         25/cyxDqU3D1tTg+v7xLbdJcuxilnEmUaXj5covN4VHUmYXvdbd0gR4nXXr1o1C8Rj1m
         MJcp7AxwwNHe0uD4j2jc8NCKYQlkfc8lTdtxmj/SztuvmGnVe8CLBjvB9agwoMdKwF2J
         xf4A==
X-Gm-Message-State: AO0yUKWaSF/80cR2e5uww6EJFv3A3jxXmYhWtqC5nii1pxdUTct/QFbU
	P6SvOfwPuVEN4MEjzgF14mL4yCRXY+pWH0vu1m2fEw==
X-Google-Smtp-Source: AK7set/ZMXJixIFC4D/KWjt5E7Yb69EPs9KtjzG+BYb//151Eeugg7QbDH72EBo41HILsUMiYkKai/KWyETz2jWK8JA=
X-Received: by 2002:a17:902:7b8b:b0:19a:82a2:fcf9 with SMTP id
 w11-20020a1709027b8b00b0019a82a2fcf9mr1399015pll.2.1679509556719; Wed, 22 Mar
 2023 11:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cw7dphf.fsf@all.your.base.are.belong.to.us>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Mar 2023 11:25:45 -0700
Message-ID: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, nathan@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 24, 2023 at 7:58=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> Alexandre Ghiti <alex@ghiti.fr> writes:
>
> > +cc linux-kbuild, llvm, Nathan, Nick
> >
> > On 2/15/23 15:36, Alexandre Ghiti wrote:
> >> From: Alexandre Ghiti <alex@ghiti.fr>
> >>
> > I tried a lot of things, but I struggle to understand, does anyone have
> > any idea? FYI, the same problem happens with LLVM.

Off the top of my head, no idea.

(Maybe as a follow up to this series, I wonder if pursuing
ARCH_HAS_RELR for ARCH=3Driscv is worthwhile?)

>
> Don't ask me *why*, but adding --emit-relocs to your linker flags solves
> "the NULL .rela.dyn" both for GCC and LLVM.
>
> The downside is that you end up with a bunch of .rela cruft in your
> vmlinux.

There was a patch just this week to use $(OBJCOPY) to strip these from
vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/
--=20
Thanks,
~Nick Desaulniers
