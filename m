Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03104BD11C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:59:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d8913nr2zDqXm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:59:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vOP5zBgV"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6Yz5M4WzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:50 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id a3so1605157pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eg3k9f7VurRwzf46jcAwPnzOmV7EyviW3zf+/O2RKTw=;
 b=vOP5zBgVX1pzcnG4/sH4K1pjbBqpnVYfSbP4/qi5UweyHcgj2vklkeP2uyHN8OsDnx
 01xi0g12DQXBFoHEG6N04ShMB8Tb3g6zWU0DCT1aDpOKn8ckPw5jKCulw2FqTnD+K45T
 1bhEzo2/lVTkbGTE85pEV7JL1+UyRODSsjjnIRIKk3n0Rj+r2WK+VA+R80PeZCHpwIAr
 ++JYKYeUXHQCJa/scCSxC9La632MXbzdbvxhXToajlbTHsoV+A6dmh6e9JlCsFS9vHAV
 rYuLmWMJFNvEWCB1M5KeFNJGOIr7YwWVvG8/Kog4ROjXe/TvPiMBayjV1/m4fTjLc/D5
 xk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eg3k9f7VurRwzf46jcAwPnzOmV7EyviW3zf+/O2RKTw=;
 b=DlJizPyiFopyKUL0lqifFyblHWIVinhOifHS8M2t8bvE5kZPHn7H07nwKaObV0Qza/
 lcbswXHnkLLi+fgA5j3n2oAu16A1BA2/8HxwbrftJkRtjRDec7wmkK7Nj3gGj5TGXY6z
 X4JkCYs4kgmIuh5dbqdaPNW6Blk+ROGoTwt0V9kfnq9Tht8IkrUqmixEjJ2nqiGs2Pof
 C6Xzvrg2M8CxCchRPZ7bYDHInMRlsOW/6hxsZjUtPuAEWE5ok070R3AsbMWp4LMt2rMX
 Oe+m9SM7DH28y4xzgBHbVkHGuC1m/zHyGYUMSKIwxeSJBtGTXVWMuxM0IUGA1C6Zdnmp
 qPbA==
X-Gm-Message-State: APjAAAVk7HgbVOVI1CAuIO8Gz2bfjITIMEZ5Hiuh5rriYvWko8VbtJ76
 iJnxkLd/f0JVY8Pu/BCR9hVXN8Uc43I4ncfCowtDiw==
X-Google-Smtp-Source: APXvYqzHQL7f14LNZsEHgTkF79WPuoGKOhn296bYISGkx7n4picFyC3Il0HPjOJxT0GsWDx9sLojnGag0Yvg6RxPVZs=
X-Received: by 2002:a63:d908:: with SMTP id r8mr4073008pgg.263.1569343667548; 
 Tue, 24 Sep 2019 09:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190921064954.11196-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190921064954.11196-1-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Sep 2019 09:47:36 -0700
Message-ID: <CAKwvOdnmYCbZiFKrvzwjJWmhzn5X+rKSs2GQZC4Dy-7VmKyntw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove ar-option and KBUILD_ARFLAGS
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
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 9:38 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 40df759e2b9e ("kbuild: Fix build with binutils <= 2.19")
> introduced ar-option and KBUILD_ARFLAGS to cope with old binutils.
>
> According to Documentation/process/changes.rst, the current minimal
> supported version of binutils is 2.21 so you can assume the 'D' option
> is always supported. Not only GNU ar but also llvm-ar supports it.

Yep, a nice cleanup. Thanks for the patch and I appreciate checking llvm-ar.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> With the 'D' option hard-coded, there is no more user of ar-option
> or KBUILD_ARFLAGS.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Documentation/kbuild/makefiles.rst | 5 -----
>  Makefile                           | 4 ----
>  arch/powerpc/boot/Makefile         | 2 +-
>  scripts/Kbuild.include             | 5 -----
>  scripts/Makefile.build             | 2 +-
>  scripts/Makefile.lib               | 2 +-
>  6 files changed, 3 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 6ba9d5365ff3..b89c88168d6a 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -954,11 +954,6 @@ When kbuild executes, the following steps are followed (roughly):
>
>         From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
>
> -    KBUILD_ARFLAGS   Options for $(AR) when creating archives
> -
> -       $(KBUILD_ARFLAGS) set by the top level Makefile to "D" (deterministic
> -       mode) if this option is supported by $(AR).
> -
>      KBUILD_LDS
>
>         The linker script with full path. Assigned by the top-level Makefile.
> diff --git a/Makefile b/Makefile
> index 656a8c95789d..88b180b2cb64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -498,7 +498,6 @@ export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN
>  export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
>  export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
>  export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
> -export KBUILD_ARFLAGS
>
>  # Files to ignore in find ... statements
>
> @@ -914,9 +913,6 @@ ifdef CONFIG_RETPOLINE
>  KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none)
>  endif
>
> -# use the deterministic mode of AR if available
> -KBUILD_ARFLAGS := $(call ar-option,D)
> -
>  include scripts/Makefile.kasan
>  include scripts/Makefile.extrawarn
>  include scripts/Makefile.ubsan
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 6841bd52738b..dfbd7f22eef5 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -50,7 +50,7 @@ endif
>
>  BOOTAFLAGS     := -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
>
> -BOOTARFLAGS    := -cr$(KBUILD_ARFLAGS)
> +BOOTARFLAGS    := -crD
>
>  ifdef CONFIG_CC_IS_CLANG
>  BOOTCFLAGS += $(CLANG_FLAGS)
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index e31fd6a8b2a3..956668239ef5 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -143,11 +143,6 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
>
> -# ar-option
> -# Usage: KBUILD_ARFLAGS := $(call ar-option,D)
> -# Important: no spaces around options
> -ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
> -
>  # ld-version
>  # Note this is mainly for HJ Lu's 3 number binutil versions
>  ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 611bda95ac5e..f199341f04eb 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -395,7 +395,7 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
>  ifdef builtin-target
>
>  quiet_cmd_ar_builtin = AR      $@
> -      cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> +      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>
>  $(builtin-target): $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 23e524027740..15895fd4ef9f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -238,7 +238,7 @@ quiet_cmd_ld = LD      $@
>  # ---------------------------------------------------------------------------
>
>  quiet_cmd_ar = AR      $@
> -      cmd_ar = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
> +      cmd_ar = rm -f $@; $(AR) cDPrsT $@ $(real-prereqs)
>
>  # Objcopy
>  # ---------------------------------------------------------------------------
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190921064954.11196-1-yamada.masahiro%40socionext.com.



-- 
Thanks,
~Nick Desaulniers
