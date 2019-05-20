Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9216523059
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:29:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tsC0C1LzDqKT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:29:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.196; helo=mail-qk1-f196.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456tqs35QlzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:28:40 +1000 (AEST)
Received: by mail-qk1-f196.google.com with SMTP id q197so8358445qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 02:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+kdZnR5O8JiU3Pf1A/YdEoIBjaqE0FCtwtKzSb3tcg=;
 b=GBz2Abw4eBS2GLm6s6L0NxxtCmaKWKb+C1oLYvghQNaF1xgbSmMMsaoGkbgfiUR2I8
 2lWht0FVCr1UwEPN12Xt5Tgt1kEexApq8VBOAOuG7shQdYksFhWjVwraNN9p42RDIclG
 kU3+C8CsmNUoRKScbKOHsPYQD3Nl3OMcEwyH8rTtVqFguoYVxHWVZdJQgA9DreRDUks9
 A2fl8t7h9VBsfEobRzQ6Kd7hKNhghDU4NFA6WvydBvpyasO3wf1ryJGprwGFIZzGoc+v
 UCpTv/5G4p6QuGLV7zo8hA6PXAfH9K0QR6GJGb24uXBDdkWengSu/ebp0gYCwvyllGO/
 cTeg==
X-Gm-Message-State: APjAAAVYE9EKNuXfYalJEYm7FUQEza0Wnw7HhojYRFu/oUvSmSoaXWY2
 HGBnCb86WKiNMGWY2+h7zWpLV72Z1vWYlR2FMfo=
X-Google-Smtp-Source: APXvYqzng8ZEkla+MZbzTUYbwhgNGW+KYBn7MR1JRscH3T5Z56wO65FYLg4J4qPz+H5lfMoc/JUf9DqLsjfY2F/VnDs=
X-Received: by 2002:a37:a8ce:: with SMTP id
 r197mr28099585qke.269.1558344518379; 
 Mon, 20 May 2019 02:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190520025437.13825-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190520025437.13825-1-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 May 2019 11:28:20 +0200
Message-ID: <CAK8P3a2nth2sNPT46_e8G=s=D-J8LtsrA4kO2esu804_pWVs-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not check name uniqueness of builtin modules
To: Masahiro Yamada <yamada.masahiro@socionext.com>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Rusty Russell <rusty@rustcorp.com.au>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Jessica Yu <jeyu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 20, 2019 at 4:57 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I just thought it was a good idea to scan builtin.modules in the name
> uniqueness checking, but Stephen reported a false positive.
>
> ppc64_defconfig produces:
>
>   warning: same basename if the following are built as modules:
>     arch/powerpc/platforms/powermac/nvram.ko
>     drivers/char/nvram.ko
>
> ..., which is a false positive because the former is never built as
> a module as you see in arch/powerpc/platforms/powermac/Makefile:
>
>   # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
>   # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
>   # CONFIG_NVRAM=y
>   obj-$(CONFIG_NVRAM:m=y)         += nvram.o
>
> Since we cannot predict how tricky Makefiles are written in wild,
> builtin.modules may potentially contain false positives. I do not
> think it is a big deal as far as kmod is concerned, but false positive
> warnings in the kernel build makes people upset. It is better to not
> do it.
>
> Even without checking builtin.modules, we have enough (and more solid)
> test coverage with allmodconfig.
>
> While I touched this part, I replaced the sed code with neater one
> provided by Stephen.
>
> Link: https://lkml.org/lkml/2019/5/19/120
> Link: https://lkml.org/lkml/2019/5/19/123
> Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks good to me

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>
>  scripts/modules-check.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> index 2f659530e1ec..39e8cb36ba19 100755
> --- a/scripts/modules-check.sh
> +++ b/scripts/modules-check.sh
> @@ -6,10 +6,10 @@ set -e
>  # Check uniqueness of module names
>  check_same_name_modules()
>  {
> -       for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
> +       for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
>         do
> -               echo "warning: same basename if the following are built as modules:" >&2
> -               sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
> +               echo "warning: same module names found:" >&2
> +               sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
>         done
>  }
>
> --
> 2.17.1
>
