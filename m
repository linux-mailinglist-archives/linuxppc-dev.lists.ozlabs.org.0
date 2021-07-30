Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DB3DBFD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 22:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbzYX2bbfz3cPT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 06:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=N8HoRlaG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=N8HoRlaG; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbzY54lPLz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 06:30:15 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id m9so14062986ljp.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NlNJsWKLmqO3IeQQioweQYYN6qx+xQ/7jnpZkoegGsQ=;
 b=N8HoRlaGoRDU1r+nR55Q+mD8NeG34Px6GOxSmRxfAWW/GtjaLdW4aEeIuv/KprECeS
 nlkj1pzEAMruW5U2sly70QyiAeKTV7LAgxYxFO5Ghd+vKCdzW2j0cp2YcLu0GLu4zTkX
 gf8JtbV00p0gPK9m1zN7X84cFLWtYaj/gcnSOMvkCOkm915o9iUhaJbypDlgNwlsaCYm
 6cLVDs9eLPDBauUK9WRcd5TAEwbftzIPZKZyABICTTlEZmWKkWwmUfVd/E03Y+x7H32F
 GwRknAJs6R8kf0WLZw6JN8rYtXRbl/xtr5FoJDjoRXDQZrn8G/VXJkeaoiv3RCrBcY9C
 nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NlNJsWKLmqO3IeQQioweQYYN6qx+xQ/7jnpZkoegGsQ=;
 b=cCBiMcCy/ofanS5Mn0q3qNj7L4Gv80YGiRT5UIOXFi5byU0lu6V+09Dh2zFbbTbnrs
 pg4nsj8lH2T3B9As1f0KD/EzCYD3FMD3oUx3ej8JiMBYaPzP4QLyHLwbbBQImxnmkGv5
 8MyVvXAwOCA0tH25YJSwU/uDgiEeeIT6TXHDitoL387uzwBqBAp4qtDGjycuD9Lz/BzD
 L/HueKOHB67Ld+OEY5dk6zV3kNkPT5k03ir3PtcTATDBC7xnxLae4TclJVrOrJQjDXbR
 H5e/Q0s1L0JX3AcljHn5q+wyWpLfKm436VbF9+SiR+bJoQFPgnvVaG7unE3m874q84cu
 Il1w==
X-Gm-Message-State: AOAM53119gEkOt3YV9a7y7fFHXbPGvoatEditx6DjZNsOFCAr6mfdgpz
 dgKIUTgj8R3mxlwR0ZANWck9noH1HsEdaqwu2dWiKw==
X-Google-Smtp-Source: ABdhPJycP4d14boj+x7rHzVPDwajcqyRnadT/XwhsCoJtnZ5aga9ccR/57cOzQWxd3X3ZJJjF6Pof8pxFnN/+9b14Ac=
X-Received: by 2002:a05:651c:329:: with SMTP id
 b9mr2927423ljp.116.1627677010835; 
 Fri, 30 Jul 2021 13:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210729141937.445051-1-masahiroy@kernel.org>
 <20210729141937.445051-3-masahiroy@kernel.org>
In-Reply-To: <20210729141937.445051-3-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 30 Jul 2021 13:29:59 -0700
Message-ID: <CAKwvOdkRuxaUvAi4ik2SiDgEeNOX6D76aBtHDBPyDVTumWskLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc: move the install rule to
 arch/powerpc/Makefile
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jordan Niethe <jniethe5@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Bill Wendling <morbo@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 7:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, the install target in arch/powerpc/Makefile descends into
> arch/powerpc/boot/Makefile to invoke the shell script, but there is no
> good reason to do so.

Sure, but there are more arch/ subdirs that DO invoke install.sh from
arch/<arch>/boot/Makefile than, not:

arch/<arch>/boot/Makefile:
- parisc
- nios2
- arm
- nds32
- sparc
- riscv
- 390
- ppc (this patch)
- x86
- arm64

arch/<arch>/Makefile:
- ia64
- m68k

Patch is fine, but right now the tree is a bit inconsistent.

>
> arch/powerpc/Makefile can run the shell script directly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/Makefile      | 3 ++-
>  arch/powerpc/boot/Makefile | 6 ------
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 6505d66f1193..9aaf1abbc641 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -407,7 +407,8 @@ endef
>
>  PHONY += install
>  install:
> -       $(Q)$(MAKE) $(build)=$(boot) install
> +       sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
> +       System.map "$(INSTALL_PATH)"
>
>  archclean:
>         $(Q)$(MAKE) $(clean)=$(boot)
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 0d165bd98b61..10c0fb306f15 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -444,12 +444,6 @@ $(obj)/zImage:             $(addprefix $(obj)/, $(image-y))
>  $(obj)/zImage.initrd:  $(addprefix $(obj)/, $(initrd-y))
>         $(Q)rm -f $@; ln $< $@
>
> -# Only install the vmlinux
> -install:
> -       sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
> -
> -PHONY += install
> -
>  # anything not in $(targets)
>  clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
>         zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
