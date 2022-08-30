Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B85A6F17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 23:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHL094JPRz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 07:23:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fGy0gzgj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fGy0gzgj;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHKzb6kXmz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 07:23:22 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id z6so17268112lfu.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Un8D+RzoqoDUZVj/+1gveT/n77oAnfjQBOt6BHJvn2c=;
        b=fGy0gzgjiZ+53KOeASW0wrxA5YqP8wgYcrG1eR/loYwSPFjuCdKYFJ62OU7yHQ+0ka
         o8e+A/1BsHDB5g9vdtI6G0sHtgJkat3w3QyA2bphzWW1/EpS6xzQnJDcSpz/pyAQtfI1
         M30PdRC5OmXfwEXGYzk0zNCnvCcyIO4Lr/tvdc0D7uDFrL01MnE1JACO+d+33BcAbCRM
         XiNI4kMQD5Ub0jGMnogmwuYO8Uf+qFdg+IpNtarFA4ZtXmcHPSPFHpjKc+PsDOvXIGkl
         FmVvwr7R6Sx7SuznxdjpC8dFiPbE7jXN8J3Ymf0jA9ZYZDtuFy+CrG8ZT4dVBZP9Kjqm
         5EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Un8D+RzoqoDUZVj/+1gveT/n77oAnfjQBOt6BHJvn2c=;
        b=ZjzVMrWe62CO5ANzISzSPFJRYgp+qdR1+shHByxK8Q7CFTCeGyVdMK/gRGe9QMILs+
         Or8VcoN290y5ho99atn2ta+i6cpfc+4zuVn1592/bmCXdqZTUJQccA/8woaK/khYj7rs
         MyO7G9rUr0CB9DuVPAay0TXRdZs6Lmv976xyBvhEvfSq/7CfGt0lRD/nChwql5yRarDA
         cNFWQXOkf8FNCuLnsWbYoCyd0+hRS9eSbWBJ8yg9+ynEHnWEpMd4vDMWSYSr4Hv2bij6
         S3sPChgI/Q+81Yr1wpJDSCY0wYX9ma/cY+JOJnnwteAlUej/9Nt7HI1lGMV0ckZEQKek
         fsyw==
X-Gm-Message-State: ACgBeo1+sEkb52NyrySf0isiF4LPn+y9EbxknnHWxbttMj3y0Sp85f3d
	nWL9qL0irFh57TjEbYt6gaO55SJPfl6/8bFWhc6PEA==
X-Google-Smtp-Source: AA6agR64s8JEMC5T5a0Ai1fiyPfmvH5US21eWBVd68Tgd2kr0cXRr6/uoKT0hGc49vAteJ/2bT56Ey4Ef8aytqi1Dqo=
X-Received: by 2002:a05:6512:158b:b0:48b:38:cff8 with SMTP id
 bp11-20020a056512158b00b0048b0038cff8mr7716291lfb.100.1661894594746; Tue, 30
 Aug 2022 14:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220830190811.323760-1-masahiroy@kernel.org>
In-Reply-To: <20220830190811.323760-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Aug 2022 14:23:03 -0700
Message-ID: <CAKwvOdnuAZqv1B3AZHSD+WzHXK_Fg+9xWJNYPVhXNxoYXam0hQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: raise minimum supported version of
 binutils to 2.25.1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Binutils 2.23 was released in 2012. Almost 10 years old.
>
> We already require GCC 5.1, which was released in 2015.
>
> Bump the binutils version to 2.25.1, which was also released in 2015.
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Documentation/process/changes.rst | 4 ++--

This document has also been translated into Italian. Let's keep them in sync?
Documentation/translations/it_IT/process/changes.rst

Either way.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

grepping for binutils shows lots of potentially stale references to
even older versions of binutils. There may be more cleanups lurking
than just the ppc ld-ifversion check.


>  scripts/min-tool-version.sh       | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 19c286c23786..5fb6a60677ef 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -33,7 +33,7 @@ GNU C                  5.1              gcc --version
>  Clang/LLVM (optional)  11.0.0           clang --version
>  GNU make               3.81             make --version
>  bash                   4.2              bash --version
> -binutils               2.23             ld -v
> +binutils               2.25.1           ld -v
>  flex                   2.5.35           flex --version
>  bison                  2.0              bison --version
>  pahole                 1.16             pahole --version
> @@ -94,7 +94,7 @@ Bash 4.2 or newer is needed.
>  Binutils
>  --------
>
> -Binutils 2.23 or newer is needed to build the kernel.
> +Binutils 2.25.1 or newer is needed to build the kernel.
>
>  pkg-config
>  ----------
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 250925aab101..8b1edd1f7281 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -14,7 +14,7 @@ fi
>
>  case "$1" in
>  binutils)
> -       echo 2.23.0
> +       echo 2.25.1
>         ;;
>  gcc)
>         echo 5.1.0
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
