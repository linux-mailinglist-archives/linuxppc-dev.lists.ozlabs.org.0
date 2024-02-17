Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3563858C84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 02:08:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nm+Hd5xd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tc9fD4zPJz3vbR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 12:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nm+Hd5xd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tc9dS0fypz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 12:07:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 888BCCE2D74
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 01:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA521C43399
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 01:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708132054;
	bh=mQf5gJJ6NdN2hyEkzBNm8aZYruwyv8J7epPgamkF1Yk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nm+Hd5xdiDX5wt8uAf1Q4UqpNP1rITuiDActDTj8tFhbw/ViXCo2e7U6Tqb8w8E9p
	 fNLnU6C2YU3T+hPGErx+ZzLaTIbhc6Yj9+hKK3OlRtrkLOzmBI2Din3TWGHGZy+A4I
	 ux46szeki3wD7Uqz5QZR3KZCmgZMwS65kWz4vcJSvw1OANkmUofn9cb8NHObannLAy
	 P9FqYVQDs76iIJEspC7vyAhkWRrxvE0iQ7P12X4JDcn7bQpRbi8kbuyp4jQoNWjrLE
	 3GxTwLKxx+qyx4Ka8oZitBSDVojEtKCkof8bTN2DSQejBWS0cXfH+j4BYjdhcUaIsg
	 BvMCFqB0uQ1fw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512a4d1451aso187902e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 17:07:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWjba9AFN14/ADMb7G+N/WWC+eI2k+2X7jtIawMrlQWa2BM60UeXDchIVi6tBv+BjvtFOU/iVcWdul4L6b4IFoNsmwrcImcZ80GfD4vA==
X-Gm-Message-State: AOJu0Yx+OUJxaCP10zl9Pv+MbqmXaxkJ+f3RCoJBGLDX55HGPNBBbqHH
	1K4QqVPuswWbmxhD7mpsHCmXGuH82ou4ay2tNFubjDK/wz5b9IKvEN7Vi+uzX5+phOzYl4vfbL9
	tNHXLyAmTCdZVI6KmonhDkIDPBdU=
X-Google-Smtp-Source: AGHT+IEom0NPnE2o3k8T7A/b6db6mij+TMhvFwofksKvsyZJ+d525UXxatwU/JP/zYIqSVRsAGgz7QhehmiLW98YHmA=
X-Received: by 2002:ac2:5e91:0:b0:512:9a29:1a81 with SMTP id
 b17-20020ac25e91000000b005129a291a81mr1405246lfq.14.1708132053196; Fri, 16
 Feb 2024 17:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20240216135517.2002749-1-masahiroy@kernel.org>
In-Reply-To: <20240216135517.2002749-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 Feb 2024 10:06:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNARFNoAUUiGMP95pTi_rSxSi5Z0HJo2kBC472f0koMr2mA@mail.gmail.com>
Message-ID: <CAK7LNARFNoAUUiGMP95pTi_rSxSi5Z0HJo2kBC472f0koMr2mA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove unused *_syscall_64.o variables in Makefile
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+To: Daniel Axtens



Maybe, we should check if the issue fixed by
2f26ed1764b42a8c40d9c48441c73a70d805decf
came back.





On Fri, Feb 16, 2024 at 10:55=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> Commit ab1a517d55b0 ("powerpc/syscall: Rename syscall_64.c into
> interrupt.c") missed to update these three lines:
>
>   GCOV_PROFILE_syscall_64.o :=3D n
>   KCOV_INSTRUMENT_syscall_64.o :=3D n
>   UBSAN_SANITIZE_syscall_64.o :=3D n
>
> To restore the original behavior, we could replace them with:
>
>   GCOV_PROFILE_interrupt.o :=3D n
>   KCOV_INSTRUMENT_interrupt.o :=3D n
>   UBSAN_SANITIZE_interrupt.o :=3D n
>
> However, nobody has noticed the functional change in the past three
> years, so they were unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/kernel/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 2919433be355..72d1cd6443bc 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -191,9 +191,6 @@ GCOV_PROFILE_kprobes-ftrace.o :=3D n
>  KCOV_INSTRUMENT_kprobes-ftrace.o :=3D n
>  KCSAN_SANITIZE_kprobes-ftrace.o :=3D n
>  UBSAN_SANITIZE_kprobes-ftrace.o :=3D n
> -GCOV_PROFILE_syscall_64.o :=3D n
> -KCOV_INSTRUMENT_syscall_64.o :=3D n
> -UBSAN_SANITIZE_syscall_64.o :=3D n
>  UBSAN_SANITIZE_vdso.o :=3D n
>
>  # Necessary for booting with kcov enabled on book3e machines
> --
> 2.40.1
>


--=20
Best Regards
Masahiro Yamada
