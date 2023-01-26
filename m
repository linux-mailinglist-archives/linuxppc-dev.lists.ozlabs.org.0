Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F4267C3D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 05:25:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2SLG0qKGz3fC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 15:25:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UwapKS2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UwapKS2v;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2SKH5dYZz3cgw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 15:24:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 552A4B81CCA
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F209EC4339E
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674707071;
	bh=sWbjQTRCxadlbLQUn48rYhAzqa6RuEwbYlxB2uDoP2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UwapKS2vrsI7ZOzOY5TofHCbFKrUlciDFa9tN6TEiMdx7KUG8QhImE+8styYe5LrF
	 KWw8Wbq4InPm/slYsE+49hdnc/i4gxclZXc4yvTxOd524CO4YwmUCz3/xEY6Ez5Yz9
	 bF5ZVpx3MBxPfsrbclYAQnutqTS7/NRjsQLG+PGAGZknEKCvzQtW5P9tkwMLmFCeAk
	 oz6RBiq6BWWB8PuxVl0FXiZibxDL8emUgfKohrysRkKx2kht9JibKnbGz9YfRyH2t9
	 ERC5LJVGox+5KPDx4mvwnp1tguJ9M293x3l2Uzv41Rk1FJMXzIGYF7M1s4rqWAD34g
	 ASwx/zKw+nvNA==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-142b72a728fso1074117fac.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 20:24:30 -0800 (PST)
X-Gm-Message-State: AFqh2kozjnqTEhgf/tVRxBNBmKdDcxslWRqKcz010OmBXjWKa0Ueunk0
	XK9kVh8rGBqHsOhnWalRQFMZYrgX3UhBzl4MKKA=
X-Google-Smtp-Source: AK7set/PNYPvPP/GjRjIRGJzYjSEmyoUNcXyniROhcp8vnAKH6317MZroWIjsXCLu1JuqdqIc9JD2eMm+ul9pJnsLE8=
X-Received: by 2002:a05:6870:110f:b0:160:3296:a9b9 with SMTP id
 15-20020a056870110f00b001603296a9b9mr850092oaf.287.1674707070213; Wed, 25 Jan
 2023 20:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20230123-qunused-argument-auto-var-init-v1-1-ec06051f0d87@kernel.org>
In-Reply-To: <20230123-qunused-argument-auto-var-init-v1-1-ec06051f0d87@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Jan 2023 13:23:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAThyrFRH22f8pdKyh0ypgCkEhnF9kUJ3XM3C=B2XGF-9A@mail.gmail.com>
Message-ID: <CAK7LNAThyrFRH22f8pdKyh0ypgCkEhnF9kUJ3XM3C=B2XGF-9A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vdso: Filter clang's auto var init zero enabler
 when linking
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, trix@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 1:20 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 7bbf02b875b5 ("kbuild: Stop using '-Qunused-arguments' with
> clang"), the PowerPC vDSO shows the following error with clang-13 and
> older when CONFIG_INIT_STACK_ALL_ZERO is enabled:
>
>   clang: error: argument unused during compilation: '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang' [-Werror,-Wunused-command-line-argument]
>
> clang-14 added a change to make sure this flag never triggers
> -Wunused-command-line-argument, so it is fixed with newer releases. For
> older releases that the kernel still supports building with, just filter
> out this flag, as has been done for other flags.
>
> Fixes: b174f4c26aa3 ("powerpc/vdso: Improve linker flags")
> Fixes: 7bbf02b875b5 ("kbuild: Stop using '-Qunused-arguments' with clang")
> Link: https://github.com/llvm/llvm-project/commit/ca6d5813d17598cd180995fb3bdfca00f364475f
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This should be the last flag that needs to be filtered (famous last
> words...) but if any more come up, we should really just explore
> switching the PowerPC vDSO to linking with $(LD) like every other part
> of the kernel; for now, I hope this is fine.
>
> Cheers,
> Nathan


Applied to linux-kbuild. Thanks.

Since I rebased the branch, the tags have been updated
accordingly.





    powerpc/vdso: Filter clang's auto var init zero enabler when linking

    After commit 8d9acfce3332 ("kbuild: Stop using '-Qunused-arguments' with
    clang"), the PowerPC vDSO shows the following error with clang-13 and
    older when CONFIG_INIT_STACK_ALL_ZERO is enabled:

      clang: error: argument unused during compilation:
'-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'
[-Werror,-Wunused-command-line-argument]

    clang-14 added a change to make sure this flag never triggers
    -Wunused-command-line-argument, so it is fixed with newer releases. For
    older releases that the kernel still supports building with, just filter
    out this flag, as has been done for other flags.

    Fixes: f0a42fbab447 ("powerpc/vdso: Improve linker flags")
    Fixes: 8d9acfce3332 ("kbuild: Stop using '-Qunused-arguments' with clang")
    Link: https://github.com/llvm/llvm-project/commit/ca6d5813d17598cd180995fb3bdfca00f364475f
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



-- 
Best Regards
Masahiro Yamada
