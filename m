Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC5258D75
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 13:31:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BglK13qwtzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 21:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=green.hu@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IERvtppr; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BglH016zPzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 21:30:00 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id p65so554638qtd.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bmg6XgtUWDx4HuERt6+WNca9MkrxDIzUrFEsZ8s0eNY=;
 b=IERvtpprRpsI2hed0dHnnYBJc2bTsfXDoVwNNjG0Ec1Sz8CRuOUarz+Porf5yRfHFu
 30cRoDkuZP41QRrigZa6y9lS/Q9+jFle0rPTgtwQN4bp84V8ocprAVuzMQ9FqTehBEzY
 4MDJIPAYpDQqg5MZ+6ZUTXTmOnuGZXEK8IgCV4orCkGUrRtsYcj/Ywc1ICPwnctC/GyI
 dJzhbEYwl61cZTl24h34xARkW2Zaqa/kOmK3OayGekDtkeFds1gFNQRmSyQ/QvyDfdw+
 OEnwNuiuobwmd/AEPMOV6cmL4S085Ju8J83/4o3yZA4u2o3mkHjbyG61560pFu+G2c5p
 TvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bmg6XgtUWDx4HuERt6+WNca9MkrxDIzUrFEsZ8s0eNY=;
 b=J3jDl/Jwg/ikbtTIQmuKbmv/LD/rMp0tXedv+liApkzuVwxUPU5N1mpzIEeXykamkQ
 ZWVNq+N3ARYGDdQbKS9XUdIMvNNcIh9xsPRYraA75wT73CXiBtduN2vuy3XAE4mvNBub
 0RE1P0jo20TyEtsApgFIaeL0wGHv2agkxfKD8VvMZTR2R0TpMfQmrXQBlBqgV31+xpY+
 xB9Dxz/a0FzibvdhacWJa2ZaAaWwqjyTKm3BJ1IeRqFiQQtqfF9qt2FygbeA92zI2p3w
 8E6vGiiKQBEUy68jBxxtNEdKo+Ek1Yeoz4cqNpDlIjnV4fXqGyVD55eItiIXOk5qap0E
 mLIA==
X-Gm-Message-State: AOAM531nQvsZH/ClIInIdKL2osuEkqbdqigYJjrtwlKpzQf5NnzZNVKW
 RnaXqDLrbif+p18TsFRf6ZsaQ2/OhER8eSwqPJM=
X-Google-Smtp-Source: ABdhPJwVT407rq1wSU6XLfBx35x7TqzLfOV0jdufGiWqhxHXDja0Uvn0+tpPRWaGd0lmv1UnRMyszboqVwIOVOloAYU=
X-Received: by 2002:ac8:7741:: with SMTP id g1mr1183471qtu.28.1598959796622;
 Tue, 01 Sep 2020 04:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200831182239.480317-1-masahiroy@kernel.org>
In-Reply-To: <20200831182239.480317-1-masahiroy@kernel.org>
From: Greentime Hu <green.hu@gmail.com>
Date: Tue, 1 Sep 2020 19:29:19 +0800
Message-ID: <CAEbi=3cqogHs=p_y=_jfcC+D5a9e5=Nic=ECr_YvJ9p-DZEAJQ@mail.gmail.com>
Subject: Re: [PATCH] arch: vdso: add vdso linker script to 'targets' instead
 of extra-y
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Nick Hu <nickhu@andestech.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> =E6=96=BC 2020=E5=B9=B49=E6=9C=881=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:23=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The vdso linker script is preprocessed on demand.
> Adding it to 'targets' is enough to include the .cmd file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm64/kernel/vdso/Makefile     | 2 +-
>  arch/arm64/kernel/vdso32/Makefile   | 2 +-
>  arch/nds32/kernel/vdso/Makefile     | 2 +-
>  arch/powerpc/kernel/vdso32/Makefile | 2 +-
>  arch/powerpc/kernel/vdso64/Makefile | 2 +-
>  arch/s390/kernel/vdso64/Makefile    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Mak=
efile
> index 45d5cfe46429..7cd8aafbe96e 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -54,7 +54,7 @@ endif
>  GCOV_PROFILE :=3D n
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index d6adb4677c25..572475b7b7ed 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -155,7 +155,7 @@ asm-obj-vdso :=3D $(addprefix $(obj)/, $(asm-obj-vdso=
))
>  obj-vdso :=3D $(c-obj-vdso) $(c-obj-vdso-gettimeofday) $(asm-obj-vdso)
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (vdso.s includes vdso.so through incbin)
> diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Mak=
efile
> index 7c3c1ccb196e..55df25ef0057 100644
> --- a/arch/nds32/kernel/vdso/Makefile
> +++ b/arch/nds32/kernel/vdso/Makefile
> @@ -20,7 +20,7 @@ GCOV_PROFILE :=3D n
>
>
>  obj-y +=3D vdso.o
> -extra-y +=3D vdso.lds
> +targets +=3D vdso.lds
>  CPPFLAGS_vdso.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vd=
so32/Makefile
> index 87ab1152d5ce..fd5072a4c73c 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -29,7 +29,7 @@ ccflags-y :=3D -shared -fno-common -fno-builtin -nostdl=
ib \
>  asflags-y :=3D -D__VDSO32__ -s
>
>  obj-y +=3D vdso32_wrapper.o
> -extra-y +=3D vdso32.lds
> +targets +=3D vdso32.lds
>  CPPFLAGS_vdso32.lds +=3D -P -C -Upowerpc
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vd=
so64/Makefile
> index 38c317f25141..c737b3ea3207 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -17,7 +17,7 @@ ccflags-y :=3D -shared -fno-common -fno-builtin -nostdl=
ib \
>  asflags-y :=3D -D__VDSO64__ -s
>
>  obj-y +=3D vdso64_wrapper.o
> -extra-y +=3D vdso64.lds
> +targets +=3D vdso64.lds
>  CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
>
>  # Force dependency (incbin is bad)
> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/M=
akefile
> index 4a66a1cb919b..d0d406cfffa9 100644
> --- a/arch/s390/kernel/vdso64/Makefile
> +++ b/arch/s390/kernel/vdso64/Makefile
> @@ -25,7 +25,7 @@ $(targets:%=3D$(obj)/%.dbg): KBUILD_CFLAGS =3D $(KBUILD=
_CFLAGS_64)
>  $(targets:%=3D$(obj)/%.dbg): KBUILD_AFLAGS =3D $(KBUILD_AFLAGS_64)
>
>  obj-y +=3D vdso64_wrapper.o
> -extra-y +=3D vdso64.lds
> +targets +=3D vdso64.lds
>  CPPFLAGS_vdso64.lds +=3D -P -C -U$(ARCH)
>
>  # Disable gcov profiling, ubsan and kasan for VDSO code

For nds32:

Acked-by: Greentime Hu <green.hu@gmail.com>
