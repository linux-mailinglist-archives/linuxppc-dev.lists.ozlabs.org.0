Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402EC7F3C35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 04:10:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jq3m3PfJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZmTW17dSz3dFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 14:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jq3m3PfJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZmSc66Bwz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 14:09:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8BC8DB80FE1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 03:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E339DC433C8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 03:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700622584;
	bh=qdLHRBoKEw4gFMfVFRwpwvnicE8hhhtpNM9aNH2gRU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jq3m3PfJbSX+yRjZLK2B59ZrYeuva4W0cT1Sai+cg+WfR2XEw8E/X9nbeYhwJzSav
	 ZXnK1rKg8cXcz4ErBDe+qQMJ6PUqMO1WNGAqiziL6SsxbXfT76gt/fZmJ5ZrGpMMgP
	 87WIuYwfbeQiMKtyu6y1yryDCJmub3H81IQT+fqMA8mdEDhYYZj0kPKGG/M4W1OXIw
	 oPV6ScXTQxPw6+E/N10A5MFMi0FhNo65cKxm283zOnE9J2PmBoeKmf4c6N1EsZmsGI
	 8EjhJQybncfkQf+zm1LoKDdcrOPluGIBnLVN+wuFEj/2g7Ghpb+2FhpG1oTalGecFo
	 s5VOk134bwjFQ==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1f0f94943d9so2962313fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 19:09:44 -0800 (PST)
X-Gm-Message-State: AOJu0YycOSQPW6PrwOIPY2K89gMRL8BwCmzDrDCio0CoKoLL2DHHY0OX
	TlkudzyiCqDKRnFmgzPboJrFiQPKKSMdahjk98E=
X-Google-Smtp-Source: AGHT+IHCfjburBQ1UdmjywweePttcXq8IzEtQKzgns2nPfAmlJiNNiQj6TYBr2fVJWJRAVnlcJyJRUk5V/ku2eUIpJU=
X-Received: by 2002:a05:6870:8e0b:b0:1f9:5ae9:bb6e with SMTP id
 lw11-20020a0568708e0b00b001f95ae9bb6emr1378749oab.32.1700622584238; Tue, 21
 Nov 2023 19:09:44 -0800 (PST)
MIME-Version: 1.0
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <87bkbnsa5r.fsf@kernel.org>
In-Reply-To: <87bkbnsa5r.fsf@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Nov 2023 12:09:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Message-ID: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 6:55=E2=80=AFPM Aneesh Kumar K.V
<aneesh.kumar@kernel.org> wrote:
>
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>
> > On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> >> crtsavres.o is linked to modules. However, as explained in commit
> >> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> >> and always-y"), 'make modules' does not build extra-y.
> >>
> >> For example, the following command fails:
> >>
> >>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3_=
defconfig modules
> >>     [snip]
> >>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
> >>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fil=
e or directory
> >>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/c=
ell/spufs/spufs.ko] Error 1
> >>   make[2]: *** [Makefile:1844: modules] Error 2
> >>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __=
build_one_by_one] Error 2
> >>   make: *** [Makefile:234: __sub-make] Error 2
> >>
> >
> > Thanks. Is this the correct Fixes tag?
> >
> > Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
> >
>
> I am finding a different commit ID:
>
> commit baa25b571a168aff5a13bfdc973f1229e2b12b63
> Author: Nicholas Piggin <npiggin@gmail.com>
> Date:   Fri May 12 01:56:49 2017 +1000
>
>     powerpc/64: Do not link crtsavres.o in vmlinux
>
>     The 64-bit linker creates save/restore functions on demand with final
>     links, so vmlinux does not require crtsavres.o.
>
>
> -aneesh



Yeah, I think the correct tag is:


Fixes: baa25b571a16 ("powerpc/64: Do not link crtsavres.o in vmlinux")


--=20
Best Regards
Masahiro Yamada
