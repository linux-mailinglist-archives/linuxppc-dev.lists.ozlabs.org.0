Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FA67C26A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 02:32:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2NVF60Whz3fLN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 12:32:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KtA+CZIw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KtA+CZIw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2NSW416wz3fYV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:30:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46C136172A
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 01:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B9FC433A1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 01:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674696632;
	bh=9Lh0ux9Zjc+mk8Ceh0QCNDAViDCua68lGhmuTig8r+w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KtA+CZIwrH2qb+NoBg9EilsCesGAwuRFzBgPw9ft82cmuEAuuKVJrb4djefWh/u2W
	 jufWPMY6x55uBlfYyLUyOD3huU90EFEWLQxXmu8n3O7PUFUZH6VgiQYmgNhus/lpsi
	 cvcTbOWvypkWDeegrFmzYB9R4irpqtIjmK7BK7oZLGC4962oxd66t1P0SdBhwcCwM/
	 9INhR1YaJq4T1iZpHafFdTkaj4PO9OKt5D6+wuqIQ0q41q3cM3AA39BZL1Lp3pBNHC
	 yaBl3aOeveTk/3dmmryrxW87A0rs3qj34wzoEqkbjBWltF+hJLu6VJjWrzJEKZ6VdM
	 armPQIea1APnw==
Received: by mail-oi1-f169.google.com with SMTP id r132so226990oif.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 17:30:32 -0800 (PST)
X-Gm-Message-State: AFqh2kpuV2Kx9QMTKVqn013R/u9EFHtC4s/wYkH4+H6ns1mCFsuoTmqT
	++eUxVVrB0hzB1YC6U/zbXiIFs3LoHmcVtbnXAg=
X-Google-Smtp-Source: AMrXdXsfvPvL2urzZZqRicG4SfEFSLP9JKSv0AoUExWqN2ZCFertmu8zVDPffGSN+eWZWjZTXnLVCYhlaPJoasY3fXM=
X-Received: by 2002:a05:6808:1786:b0:35e:7c55:b015 with SMTP id
 bg6-20020a056808178600b0035e7c55b015mr2087600oib.287.1674696631283; Wed, 25
 Jan 2023 17:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org> <871qnjqmmq.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qnjqmmq.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Jan 2023 10:29:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
Message-ID: <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nathan Chancellor <nathan@kernel.org> writes:
> > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > used:
>
> Should that say "unused" ?



Nathan, shall I fix it up locally?
(it will change the commit hash, though.)





>
> >   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> >
> > This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> > unnecessary, as all supported versions of clang and gcc will pass '-a64'
> > or '-a32' to GNU as based on the value of '-m'; the behavior of the
> > latest stable release of the oldest supported major version of each
> > compiler is shown below and each compiler's latest release exhibits the
> > same behavior (GCC 12.2.0 and Clang 15.0.6).
> >
> >   $ powerpc64-linux-gcc --version | head -1
> >   powerpc64-linux-gcc (GCC) 5.5.0
> >
> >   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> >   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
> >
> >   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
> >   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
> >
> >   $ clang --version | head -1
> >   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
> >
> >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> >    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
> >
> >   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
> >     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
> >    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
> >
> > Remove this flag altogether to avoid future issues.
> >
> > Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Cc: mpe@ellerman.id.au
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers



-- 
Best Regards
Masahiro Yamada
