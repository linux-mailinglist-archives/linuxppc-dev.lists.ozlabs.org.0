Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6081B5BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 13:27:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cnahzuWu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwqSz1ZNNz3cYS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 23:27:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cnahzuWu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwqS90VGhz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 23:27:03 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-dbd73ac40ecso672426276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703161620; x=1703766420; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYCdZB2oAnETMBwyQdDy+4dFajVcth2ZujTMMW2Knx8=;
        b=cnahzuWu+U8nAERXpdilukMoyPe7Zg3DmoM3OdxjdAbAVFyeuVqyRuOdtZgoRM9Bpe
         rnMnu9YCFUNx2JlbHoCLrjaO+2Pr96t2mgI1x40rYJi/3dj8Vr2jlRA7u5/HAwNoflmH
         h5nTnLMhUPhCxn8Qu5npJdW53DZLKyUjPfqNa0dFEWSB6wu/yp8cITh5rAknhnWCmB03
         +qFhEQ9aJh7l744Fqery6YEil+1eRiZW+wcuZBz/0ej6NUhwa5w3MLSyD3EITz/sSp/2
         ZUwmSBl0eyhG0DPs+zeog6YtEEgzj3N+Gh1WTgHS5/qUDpW8VsmNh1dXueL2We+mocmP
         pRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161620; x=1703766420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYCdZB2oAnETMBwyQdDy+4dFajVcth2ZujTMMW2Knx8=;
        b=VApDo39PhZFegO3DWjqs1QLazO6nlej4GjvrziAar8YAbLmDvUfZGE1cvYIyuWFzQm
         bSI/Yf3QFe9YPreMWd8AMIk8uNA8O3PftvZT4Rau5TvbDEwC9i/ipAZk8lBYSH0anQZ3
         sVw/+CRM7vy2QetpykC7Ic/1vp2u/xA7zcNsrpXpOkXT4oEY5Mfr8Ofez9ejDFg8Xi4s
         owfWAsUhDPIU8bheR+kBljRZmkbFK9PbTPxFuDXoPXafHFr0+aM1jkLmZtch1Fu3gXQt
         xMO3Efig26kmcevkKijvN5Kfhp7YeDHbx0us+2f4BX+ADWmyiHIoSsqGHw5LOg/mNKsJ
         R3wA==
X-Gm-Message-State: AOJu0YzaxBH5368vcxL5OksPDDOEDH5vrn2OyE4lmzikhgA0hAX+/vPl
	BvoG8cDLdU21iCHkPuM6rS4ptgIZATKkBqU+8nwBUMgSYkp/mTPg
X-Google-Smtp-Source: AGHT+IGrVziv3UXCpUUC8WLa/MEHofxmfTx/XE7Rtr+H1u/sYxNOxp94QqUG/ZW+Yp5LnAIG/HkO54sDNYHgy9yoEwE=
X-Received: by 2002:a81:b408:0:b0:5e8:566:56ff with SMTP id
 h8-20020a81b408000000b005e8056656ffmr1268837ywi.32.1703161620018; Thu, 21 Dec
 2023 04:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20231221120410.2226678-1-mpe@ellerman.id.au>
In-Reply-To: <20231221120410.2226678-1-mpe@ellerman.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Dec 2023 13:26:48 +0100
Message-ID: <CACRpkdZk3pSZ_EfhkPDcm3eXRDRqvHtZ=7hqOHUnTFiew_VtJg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Split PAGE_SHIFT/SIZE into vdso/page.h
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 21, 2023 at 1:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:

> The VDSO needs PAGE_SHIFT/SIZE defined, so it includes asm/page.h.
>
> However when COMPAT=3Dy the VDSO is built 32-bit, even though the kernel
> is 64-bit. That can lead to odd warnings because some kernel constants
> are 64-bit, but unsigned long is 32-bit, for example:
>
>     VDSO32C arch/powerpc/kernel/vdso/vgettimeofday-32.o
>   In file included from <built-in>:4:
>   In file included from /home/michael/linux/lib/vdso/gettimeofday.c:5:
>   In file included from ../include/vdso/datapage.h:137:
>   In file included from ../arch/powerpc/include/asm/vdso/gettimeofday.h:7=
:
>   ../arch/powerpc/include/asm/page.h:230:9: warning: result of comparison=
 of constant 13835058055282163712 with expression of type 'unsigned long' i=
s always true
>     230 |         return __pa(kaddr) >> PAGE_SHIFT;
>         |                ^~~~~~~~~~~
>
> Fix it by moving the PAGE_SHIFT/SIZE constants into a separate header,
> which can be included by the VDSO, and also by the existing kernel
> headers. That avoids exposing the rest of the header to the non-standard
> build environment of the compat VDSO.
>
> The particular warning above was introduced by commit 58b6fed89ab0
> ("powerpc: Make virt_to_pfn() a static inline"), though it is not at
> fault, it just exposed the fact that the VDSO was including parts of
> page.h that weren't needed or appropriate for the VDSO.
>
> Don't copy the comment about page sizes, it just risks becoming
> outdated, that information is better available in the Kconfig
> dependencies and help text.
>
> Fixes: 58b6fed89ab0 ("powerpc: Make virt_to_pfn() a static inline")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311061940.4pBrm44u-lkp@i=
ntel.com/
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Clearly a working solution!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Just a note:

> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/p=
age.h
(...)
> +#include <asm/vdso/page.h>

(...)
> +++ b/arch/powerpc/include/asm/vdso/page.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_POWERPC_VDSO_PAGE_H
> +#define _ASM_POWERPC_VDSO_PAGE_H
> +
> +#include <vdso/const.h>

Now the whole kernel includes <vdso/const.h>, is this necessary?

Yours,
Linus Walleij
