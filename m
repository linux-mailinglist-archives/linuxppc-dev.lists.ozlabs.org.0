Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4E42708C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 20:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQx7g2V3Nz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 05:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YOrwrfRf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YOrwrfRf; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQx703Tbzz305S
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 05:10:02 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id u18so42358531lfd.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Oct 2021 11:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8+FegxBRVxRrgPWVVGMtq1wKrHppaacPkxALtOQRBY=;
 b=YOrwrfRfPyQO1ZBAi+3+DQkNbgBhBy6EKwbXvINEkq/aTPFW1og7L/fs9NpqbzN6z1
 5X6oQf/+B/Silb9FbQqmO3xRnDgCgkcvoNMUDxQJyhwX4y78gLOZALuLdIxQP01PPnv9
 PZE8oA0Tmwdh4ZQejjLfIe2InvfCi6/bINLzFjNKmly6EB5gGP2dARkT8c7Aw4e3y2jT
 fW7hTrVOq/PyN7QaFU3UIe7patsW97p6Kbw+79ue8O7EB0qh2Tkraw11fKO7Z55kqPLh
 YABx3ZHNFqLZ+vzYtrhA474WGAvNz2DkBJuL+Hb0SESrhgHIcjelLPzINb9gYfRYcC4B
 20BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8+FegxBRVxRrgPWVVGMtq1wKrHppaacPkxALtOQRBY=;
 b=Ok9bk2VjuzOgTYYuw/Dc96AXP0S7PRsfK2OALQ/ddZYWcvcffm1zjRsK/mFf76ha7x
 q9u46pGlpZtaR/DsaZVdW79KPrdisdETAwjNIvoLyseez7uk5HnF8GtFtal+D2Pba8Qe
 yIO/cRpjPw7IaE/EOlwsO6wdFB5mlfkUby9ZxwUjJwgXXVWGRlivthnNSVuf6RgR9tbM
 GBQEHFXbSalqHCcD4K6ZsSlajPBXJAvx+M1hE+hLCZl63+cVF7EiLegOHvY4sIAjzr6d
 idcQCWReF/0eXcNy4KGxu5UISZp1NxFyVRHAKam8rxPxFQR7VXS0YdWDdqJJR5Db1SGX
 tRiQ==
X-Gm-Message-State: AOAM5335JZ/eXI/lMbw6QB6D6c+sW7qUaDmtf/G8pvBfAfbGzdnD0r+T
 joH72NRJdUcdrOEdbtsKlBihusMHjx1Clsd4wslzzA==
X-Google-Smtp-Source: ABdhPJwu1Rpl3tvnFDgCiaoWQ3gS12YFEfzTq97WXsi7NA4DKXpDqKrjR0tv9fwX/2tcJ2jyOo6K+IRTwTdICIjJACw=
X-Received: by 2002:a05:6512:110a:: with SMTP id
 l10mr11921727lfg.550.1633716599116; 
 Fri, 08 Oct 2021 11:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <8900731fbc05fb8b0de18af7133a8fc07c3c53a1.1633712176.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8900731fbc05fb8b0de18af7133a8fc07c3c53a1.1633712176.git.christophe.leroy@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Oct 2021 11:09:47 -0700
Message-ID: <CAKwvOdnWbKdBuSGtmu2DURy5dtVGUYWJ_mwxSL6N5OfbmjU3EA@mail.gmail.com>
Subject: Re: [PATCH] lkdtm: Fix content of section containing
 lkdtm_rodata_do_nothing()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 8, 2021 at 9:59 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> On a kernel without CONFIG_STRICT_KERNEL_RWX, running EXEC_RODATA
> test leads to "Illegal instruction" failure.
>
> Looking at the content of rodata_objcopy.o, we see that the
> function content zeroes only:
>
>         Disassembly of section .rodata:
>
>         0000000000000000 <.lkdtm_rodata_do_nothing>:
>            0:   00 00 00 00     .long 0x0
>
> Add the contents flag in order to keep the content of the section
> while renaming it.
>
>         Disassembly of section .rodata:
>
>         0000000000000000 <.lkdtm_rodata_do_nothing>:
>            0:   4e 80 00 20     blr
>
> Fixes: e9e08a07385e ("lkdtm: support llvm-objcopy")

Thanks for the patch; sorry I broke this.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Cc: stable@vger.kernel.org
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
> index aa12097668d3..e2984ce51fe4 100644
> --- a/drivers/misc/lkdtm/Makefile
> +++ b/drivers/misc/lkdtm/Makefile
> @@ -20,7 +20,7 @@ CFLAGS_REMOVE_rodata.o                += $(CC_FLAGS_LTO)
>
>  OBJCOPYFLAGS :=
>  OBJCOPYFLAGS_rodata_objcopy.o  := \
> -                       --rename-section .noinstr.text=.rodata,alloc,readonly,load
> +                       --rename-section .noinstr.text=.rodata,alloc,readonly,load,contents
>  targets += rodata.o rodata_objcopy.o
>  $(obj)/rodata_objcopy.o: $(obj)/rodata.o FORCE
>         $(call if_changed,objcopy)
> --
> 2.31.1
>


-- 
Thanks,
~Nick Desaulniers
