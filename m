Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCF84A651
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 21:52:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQSKBB1a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTJTw15NBz3cRY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 07:52:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gQSKBB1a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTJTB1KHdz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 07:51:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AF4D61283
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 20:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC40DC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 20:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707166296;
	bh=rbxfWPsAtsZkwAub+b6KRhh6zPgaO8+Nsj7bKR2m5RM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gQSKBB1auVt0+2i1wF9el62IAUkh4PeL0/sd2OjWkiV52ekTZFcXWz9X1ePXPXA3R
	 3xiLneomSrhi0rvZm7fvIS94AFFbrPjE9vfY3vqBlTbo6U202xyk8qz5fabVfyZFFc
	 +LEZTedFJ/GMXteRffOyJpwkNmrt5lhm1ExY81vW5OTDtyVlJ/B8PUThs0l1AnChu9
	 kVIfSrZ8jyH8sLN+/uaOqGAwhKcUcPaUcmpRwR5EPpIijVKGEmtugZmDDFiitJllYI
	 ClMllxJdWTGCL3M7Uac7F/Ei2FAGASPRVok1n1kDHZNiLOMzsxKX/S7tv4PG+NQhcJ
	 5oYI/r14MPTOA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d090c83d45so34718081fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 12:51:36 -0800 (PST)
X-Gm-Message-State: AOJu0YxJdhAqHjrxZLU3D4ahK3R54urwVgrg9HPV5Au8Qf/HdUosnPIZ
	xoNz7QGoeSptUVi6siwJ9hPcUDa98h9apoTOP/p35JlqYw9o7YnovZEcCSwdGwfmZPsqZwkDA4Z
	oe/4R1Q9rOQYdLcCxiaFfyd1ZFNo=
X-Google-Smtp-Source: AGHT+IH48mHUOfbKPsHz4ex522m4Efo9yfxYkbY+WPFm87RC+2HZW07sdB9JpcI7VvmtbRlov+g35Jw+FX0st/t6jd4=
X-Received: by 2002:a2e:920d:0:b0:2d0:af09:e3d7 with SMTP id
 k13-20020a2e920d000000b002d0af09e3d7mr580084ljg.41.1707166295433; Mon, 05 Feb
 2024 12:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <ZbjHTMhQ4Z9lRR6L@t14s>
 <87v873870m.fsf@mail.lhotse> <CAASaF6w9SRoj+Kn6=UaReBNNfL_rrKo-4rvtCj=iF4Nd3Zpw-g@mail.gmail.com>
In-Reply-To: <CAASaF6w9SRoj+Kn6=UaReBNNfL_rrKo-4rvtCj=iF4Nd3Zpw-g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 6 Feb 2024 05:50:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQe5SounO60gyYE_3e-M0cAAgT=9jac_SLcR0i9BeEgDQ@mail.gmail.com>
Message-ID: <CAK7LNAQe5SounO60gyYE_3e-M0cAAgT=9jac_SLcR0i9BeEgDQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
To: Jan Stancek <jstancek@redhat.com>
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

On Mon, Feb 5, 2024 at 10:22=E2=80=AFPM Jan Stancek <jstancek@redhat.com> w=
rote:
>
> On Mon, Feb 5, 2024 at 12:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
> >
> > Jan Stancek <jstancek@redhat.com> writes:
> > > On Tue, Nov 21, 2023 at 10:51:34AM +1000, Nicholas Piggin wrote:
> > >>On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> > >>> crtsavres.o is linked to modules. However, as explained in commit
> > >>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> > >>> and always-y"), 'make modules' does not build extra-y.
> > >>>
> > >>> For example, the following command fails:
> > >>>
> > >>>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper p=
s3_defconfig modules
> > >>>     [snip]
> > >>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
> > >>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such =
file or directory
> > >>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platform=
s/cell/spufs/spufs.ko] Error 1
> > >>>   make[2]: *** [Makefile:1844: modules] Error 2
> > >>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350:=
 __build_one_by_one] Error 2
> > >>>   make: *** [Makefile:234: __sub-make] Error 2
> > >>>
> > >>
> > >>Thanks. Is this the correct Fixes tag?
> > >>
> > >>Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux"=
)
> > >>
> > >>Hmm, looks like LLD might just do this now automatically for us
> > >>too without --save-restore-funcs (https://reviews.llvm.org/D79977).
> > >>But we probably still need it for older versions, so we still need
> > >>your patch.
> > >
> > > Hi,
> > >
> > > I'm still seeing the error of crtsavres.o missing when building exter=
nal modules
> > > after "make LLVM=3D1 modules_prepare". Should it be built also in arc=
hprepare?
> >
> > Or modules_prepare?
> >
> > Example patch below.
>
> I tested your patch with my setup and that works for me as well.
>




Please note 'make ARCH=3Dpowerpc clean' will remove  '*.o'
files globally.


Kbuild promised you would still be able to compile external modules
after 'make clean' (until you run 'make mrproper'), but
that would not work in this case.

So, the external module support for powerpc
is broken in another way, already.


Perhaps, an easy workaround might be to change
the suffix, but I did not test it at all.

mv arch/powerpc/lib/crtsavres.o arch/powerpc/lib/crtsavres.o.do_not_remove_=
me




--=20
Best Regards
Masahiro Yamada
