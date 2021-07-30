Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49203DBFC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 22:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbzQj46GGz2yWl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 06:24:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=pMsQbhst;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pMsQbhst; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbzQH4nrTz2xtr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 06:24:23 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id h2so20271531lfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhW1Jw1DENMC35TDbXRVr3UzXIX691dUHdyLHQqhvKg=;
 b=pMsQbhstAXAmYIm7x/KJo8DsaFh27rjlna5EJEi5Y2LEKQo42VBLqMQ7F3uoL7aqDc
 7KalHMpeGGtNBwzzAW90LiJeFK5gdUYVoi4oWOAQVO+GksnGO+4p5CHgTDB6dH6HgEDm
 wagLS0ulkCrycuUroE+gCiHrmv36u0gyNEvcaASPoqxxzELVoSydDSKq5wjTfSCA0lSm
 SbhwYnI5joFdBdRkLRNwgRcYwmJ8wcf5TtfGUG+R4n31ZlWrsWPXL9b77Mgk1QDwz1yI
 KYpmqQ8zwiS3F8w42QipdXmgdZ8yqVcnjq0j1g80SwotApygxBDwp0GOdSCwvxJ8QMVe
 X2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhW1Jw1DENMC35TDbXRVr3UzXIX691dUHdyLHQqhvKg=;
 b=FnsW1Qa0txvcKF4dzvY7UkN80Hcal4a4T81qLkMSsRf/f2IV4x7KKpnyC8ZykiIKlI
 s4Tq4aPd2WyzMTM/SJzbqfpQ3It58UQXkbYBfJxt76eJlxYnZUh28c/4QQq6RW7gpmeL
 V2DV5o2zn8drNZnOvlAKCB5Muy6g68wiYTLchFapWmIbcBubDXp+lUlb3DTj5bSaWg6s
 zMjEr78JgjkAfmH/n6PD02nDHVSJ4+50FxnnOFDUPUkRaK25Xf+WByZGJfv1M+g5tGsU
 F0CxSjYCzcGJRjwCvMLJwvHwUNAr686cqKkKRXD9IepaCVrWlUgrjsgZbVJBWVMqV4aC
 4HYQ==
X-Gm-Message-State: AOAM531/+A8exJNhC+isMLftol24P8SaSwJkU997WOP7hnMAWbMTKyC6
 PtoeKA5qlDRjlusEbraQu/08Aj4pIkPdjsT/b46DKg==
X-Google-Smtp-Source: ABdhPJyvSrq0KR6B0tuKx+NyIXbuYTNdLjAlogrdD/CfP9mB+76d2GTI/v6xgCFbE43Y6mY1Rj19njas82jQmJyHaAE=
X-Received: by 2002:a05:6512:32aa:: with SMTP id
 q10mr3148115lfe.368.1627676658562; 
 Fri, 30 Jul 2021 13:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210729141937.445051-1-masahiroy@kernel.org>
 <20210729141937.445051-2-masahiroy@kernel.org>
In-Reply-To: <20210729141937.445051-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 30 Jul 2021 13:24:07 -0700
Message-ID: <CAKwvOd=dkr_GYEO3fdges+saA-7r0b2xWsuMQDex3FNQJgQNCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: make the install target not depend on any
 build artifact
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
 Bill Wendling <morbo@google.com>, linuxppc-dev@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 29, 2021 at 7:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The install target should not depend on any build artifact.
>
> The reason is explained in commit 19514fc665ff ("arm, kbuild: make
> "make install" not depend on vmlinux").
>
> Change the PowerPC installation code in a similar way.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  arch/powerpc/boot/Makefile   |  2 +-
>  arch/powerpc/boot/install.sh | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index a702f9d1ec0d..0d165bd98b61 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -445,7 +445,7 @@ $(obj)/zImage.initrd:       $(addprefix $(obj)/, $(initrd-y))
>         $(Q)rm -f $@; ln $< $@
>
>  # Only install the vmlinux
> -install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
> +install:
>         sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
>
>  PHONY += install
> diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
> index 658c93ca7437..14473150ddb4 100644
> --- a/arch/powerpc/boot/install.sh
> +++ b/arch/powerpc/boot/install.sh
> @@ -20,6 +20,20 @@
>  # Bail with error code if anything goes wrong
>  set -e
>
> +verify () {
> +       if [ ! -f "$1" ]; then
> +               echo ""                                                   1>&2
> +               echo " *** Missing file: $1"                              1>&2
> +               echo ' *** You need to run "make" before "make install".' 1>&2
> +               echo ""                                                   1>&2
> +               exit 1
> +       fi
> +}
> +
> +# Make sure the files actually exist
> +verify "$2"
> +verify "$3"
> +
>  # User may have a custom install script
>
>  if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
