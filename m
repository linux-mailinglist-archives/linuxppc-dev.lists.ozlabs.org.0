Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFF78F96F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 10:00:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaRktxRV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcVnK3HWFz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 18:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaRktxRV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcVmP4g56z30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 17:59:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FD1061E2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 07:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E98C433CD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693555154;
	bh=GYFYHNBwiYIMyxXYhNMZBkYnxr8aCSZaJphpVUbR/gI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AaRktxRVhEkyJ9abOTUx7V1990sLCQZsTcFUleQ9gIPImVoGeS5XT88pEptizfQDW
	 nHQgbPUErQ/EtGTelQCn2JhACffAb906a3fJ4in3B4pCmK6qM0io61lBIOnhXZ01m0
	 H5w1WWX4mbREPA9UDC2fe+zlPL9TSAvCy5V5R8UagFmSy8vYheYL0hPJCXf5I91b7T
	 TooNiVCUoUTRJvGRT3I4IL6EjI/AcDVnd0G4O3HqcJT1EWm5mQPzH+sLC+Ivo0edUD
	 zFOJ+InUvPaokhPEzGYCjmb5rvDpXKLESGTzYoF9j92Jto02sA1aNf4Ycj8NwKOsMP
	 OOd4SSi9NU49A==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-573921661a6so1038157eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Sep 2023 00:59:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YyMwHdbnVCo/xWNxJu2boPiSgvuykbxuPF/zy4je//3Dq6oowNc
	1wtcThxFsx+dxI03S5e9i6+wez2uVPS8PEYx3mc=
X-Google-Smtp-Source: AGHT+IHWr1PcUpOyQTzQJYAg/TVFLv3Ywby9u7RUE31cJ6C0yBF+em+y7ml6sODmNo5t9DAFJN+2Shqq08kJwtSujfQ=
X-Received: by 2002:a4a:919c:0:b0:56e:4921:deb0 with SMTP id
 d28-20020a4a919c000000b0056e4921deb0mr1662294ooh.8.1693555153843; Fri, 01 Sep
 2023 00:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230831191335.give.534-kees@kernel.org>
In-Reply-To: <20230831191335.give.534-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 Sep 2023 16:58:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
Message-ID: <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 1, 2023 at 4:13=E2=80=AFAM Kees Cook <keescook@chromium.org> wr=
ote:
>
> Currently the Kconfig fragments in kernel/configs and arch/*/configs
> that aren't used internally aren't discoverable through "make help",
> which consists of hard-coded lists of config fragments. Instead, list
> all the fragment targets that have a "# Help: " comment prefix so the
> targets can be generated dynamically.
>
> Add logic to the Makefile to search for and display the fragment and
> comment. Add comments to fragments that are intended to be direct targets=
.
>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> v3:
> - Use Makefile logic from Masahiro Yamada
> - Use "# Help: " prefix, but only on desired fragment targets
> v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.org
> v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.org
> ---
>  Makefile                                   |  1 -
>  arch/arm/configs/dram_0x00000000.config    |  1 +
>  arch/arm/configs/dram_0xc0000000.config    |  1 +
>  arch/arm/configs/dram_0xd0000000.config    |  1 +
>  arch/arm/configs/lpae.config               |  1 +
>  arch/arm64/configs/virt.config             |  1 +
>  arch/powerpc/configs/disable-werror.config |  1 +
>  arch/powerpc/configs/security.config       |  4 +++-
>  arch/riscv/configs/32-bit.config           |  1 +
>  arch/riscv/configs/64-bit.config           |  1 +
>  arch/s390/configs/btf.config               |  1 +
>  arch/s390/configs/kasan.config             |  1 +
>  arch/x86/Makefile                          |  4 ----
>  kernel/configs/debug.config                |  2 ++
>  kernel/configs/kvm_guest.config            |  1 +
>  kernel/configs/nopm.config                 |  2 ++
>  kernel/configs/rust.config                 |  1 +
>  kernel/configs/tiny.config                 |  2 ++
>  kernel/configs/x86_debug.config            |  1 +
>  kernel/configs/xen.config                  |  2 ++
>  scripts/kconfig/Makefile                   | 15 ++++++++++++---
>  21 files changed, 36 insertions(+), 9 deletions(-)
>


Just one thing.





> diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> index 00009f7d0835..60a4b6d80b36 100644
> --- a/kernel/configs/tiny.config
> +++ b/kernel/configs/tiny.config
> @@ -1,3 +1,5 @@
> +# Help: Size-optimized kernel image


I will drop this.


We already have a hard-coded help message.

  tinyconfig   - Configure the tiniest possible kernel




Then, some lines below, again.

  tiny.config               - Size-optimized kernel image



tiny.config is for internal use for tinyconfig.




--=20
Best Regards
Masahiro Yamada
