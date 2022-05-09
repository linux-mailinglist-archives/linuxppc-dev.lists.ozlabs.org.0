Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F882520841
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 01:14:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxxns1MCNz3cHw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 09:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=f6fWCk6p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136;
 helo=mail-yw1-x1136.google.com; envelope-from=samitolvanen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=f6fWCk6p; dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxxnD2qBxz3bqy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 09:13:51 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7d621d1caso161486907b3.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oazinpgomaqUG0jSYMm8ubizFPTzpD9YluLXTH1Uf+8=;
 b=f6fWCk6p41OZaY/aYptJIOS/H7gQoR2LQU/vFrk5Gn4NSNwuGdiZDiDStk7AbG3yZD
 IKBXb4w884/50UAgGFMYKZ1TW7UWPSrJsR6aU/0xVkQloWI1gv9dqJSDbnU+7ZRlaq+H
 5q6FzLE9Jch5W51SjYRwMzmvNSaAVh59pmK1la7G6Ce7QS8+phGNXM1poUTxBJEghkkL
 rkNzGIHiR6cg7h2j0E68I08LETn6PDCH3Bk2j2CtnK3mFxMH+qkZYlQ5Mbk0pgP96vbx
 k86u84TYrd/iZlrt9edUpHqGeZQt6sH9DbxxljCpeCMl8DqbX8Q9LTMC9vVENf9lnOH2
 8xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oazinpgomaqUG0jSYMm8ubizFPTzpD9YluLXTH1Uf+8=;
 b=e9HhgnaxzTISPaSMXLrhJ0ylVgTPhkG+DWW+5Kkni6VM3b6Ut/Ss4tLfPXU2Bj1ob5
 p3gTZFsIeKMzSL6xbgZ4WuLI9HivJavj9WpWr+J2M4x/S06QuY5MryTrTjwek5sBJJ3H
 1RQEwPw2o//i37dQlyb35VEW5ZhpJ8WT7XpYa0RkhqyHyLn+hdbraGs4BTB6+SUXrYZD
 HJePKIrjinIyrkgKGjlDiKPZh37zzJWga0U3p+YYmfip8qgZfFod0qobpZLiye78GCFP
 nA3xW6Ra6JXNxMjw1q/dUL+VE7qX8juNwlBCyoAnAC68tRiOhW8OtFDTROItG3+sM798
 b6Lg==
X-Gm-Message-State: AOAM530h6lWmE/PHZp0lzFipd0SMx2GwGe9TGptCvtrCxhGmPSL33M0q
 ZfIruISLfA2BM8avXIlonO2HbcoO8Lq8GeoHwZ+KTQ==
X-Google-Smtp-Source: ABdhPJxssHqsbnbsTj81I2dSgjtFlZace94GadSqyvpd5jqz1pk64Y4lHyhr+1TXl7QDxSK2F5OuNrrpLo+K4Kc2AN8=
X-Received: by 2002:a81:1108:0:b0:2f7:bf11:3fb9 with SMTP id
 8-20020a811108000000b002f7bf113fb9mr17011668ywr.305.1652138027673; Mon, 09
 May 2022 16:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-10-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-10-masahiroy@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 9 May 2022 16:13:11 -0700
Message-ID: <CABCJKudnbTS=_2WgX63xb_3oCwt_6jwotqfoV5wSjkmfjuUJZQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/14] kbuild: do not create *.prelink.o for Clang LTO
 or IBT
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When CONFIG_LTO_CLANG=y, additional intermediate *.prelink.o is created
> for each module. Also, objtool is postponed until LLVM bitcode is
> converted to ELF.
>
> CONFIG_X86_KERNEL_IBT works in a similar way to postpone objtool until
> objects are merged together.
>
> This commit stops generating *.prelink.o, so the build flow will look
> the same with/without LTO.
>
> The following figures show how the LTO build currently works, and
> how this commit is changing it.
>
> Current build flow
> ==================
>
>  [1] single-object module
>
>                                       $(LD)
>            $(CC)                     +objtool              $(LD)
>     foo.c --------------------> foo.o -----> foo.prelink.o -----> foo.ko
>                            (LLVM bitcode)        (ELF)       |
>                                                              |
>                                                  foo.mod.o --/
>
>  [2] multi-object module
>                                       $(LD)
>            $(CC)         $(AR)       +objtool               $(LD)
>     foo1.c -----> foo1.o -----> foo.o -----> foo.prelink.o -----> foo.ko
>                            |  (archive)          (ELF)       |
>     foo2.c -----> foo2.o --/                                 |
>                 (LLVM bitcode)                   foo.mod.o --/
>
>   One confusion is foo.o in multi-object module is an archive despite of
>   its suffix.
>
> New build flow
> ==============
>
>  [1] single-object module
>
>   Since there is only one object, we do not need to have the LLVM
>   bitcode stage. Use $(CC)+$(LD) to generate an ELF object in one
>   build rule. When LTO is disabled, $(LD) is unneeded because $(CC)
>   produces an ELF object.
>
>            $(CC)+$(LD)+objtool             $(LD)
>     foo.c ------------------------> foo.o -------> foo.ko
>                                     (ELF)    |
>                                              |
>                                  foo.mod.o --/
>
>  [2] multi-object module
>
>   Previously, $(AR) was used to combine LLVM bitcode into an archive,
>   but there was no technical reason to do so.
>   This commit just uses $(LD) to combine and convert them into a single
>   ELF object.
>
>                             $(LD)
>             $(CC)          +objtool        $(LD)
>     foo1.c -------> foo1.o -------> foo.o -------> foo.ko
>                               |     (ELF)    |
>     foo2.c -------> foo2.o ---/              |
>                 (LLVM bitcode)   foo.mod.o --/
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Looks good, thanks for cleaning this up!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
