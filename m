Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD879E19B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 10:09:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RltR452htz3cnc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 18:09:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.177; helo=mail-yb1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RltQc0Yzdz2yt6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:09:26 +1000 (AEST)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d7b91422da8so5660744276.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 01:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694592562; x=1695197362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCz1YqPLlml0me4QSAkCQsY8FV1Cudx91zoZbXBVMOA=;
        b=c4goPputaa3GgNLjuEXuG4zGwQ1heQkURaB0PPAfufU8YHExRC2Eq9IQkArQdn+m3N
         NUNUXaxSX05yiM4ZVLZnYCIxZXhDwpwJlFMR+un4O+nNw+bQ0XeyJ12PZJTcpFk4BYBU
         e3O8lhkrYOysAPpfzt1C+an2hD8LuuvI+TYfahPXkSdEHhgyHDoGJ+okCAPHXUfQvlZZ
         SU5BezQU7S1aSIjKrz066i+d2Byw+HwfAv6uyFmXyg/GChkIB5utiJPOKaSIkmY7VPo0
         ajKNO+r2F8YaxcQjjHc0aLAusWfgMmH3yjAaI01BDCu4KPrCRFMEwbxjI7hDRT+LC1WD
         LkrA==
X-Gm-Message-State: AOJu0YwSyGLOlImAAFYaFWnVNuhQO6iVY0TA7vqSdjb74BoypoP/4mgN
	8DAKsiuEutGKB42UMm0sTS416pJYEeH43w==
X-Google-Smtp-Source: AGHT+IFbBN699UDtjRJ7YDp7Mawp/6ZlRlOS2yy/q1Bxprn2LOVqm9cS+PoD2cEITlt+WXrymewsPA==
X-Received: by 2002:a05:6902:285:b0:d81:5ec1:80cf with SMTP id v5-20020a056902028500b00d815ec180cfmr616471ybh.12.1694592562631;
        Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id o9-20020a254109000000b00d74c9618c6fsm2622397yba.1.2023.09.13.01.09.22
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d776e1f181bso5673070276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 01:09:22 -0700 (PDT)
X-Received: by 2002:a25:9844:0:b0:d81:4e98:4f5c with SMTP id
 k4-20020a259844000000b00d814e984f5cmr1178332ybo.47.1694592562230; Wed, 13 Sep
 2023 01:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230912135050.17155-1-tzimmermann@suse.de> <20230912135050.17155-3-tzimmermann@suse.de>
In-Reply-To: <20230912135050.17155-3-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Sep 2023 10:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Message-ID: <CAMuHMdU66MLdWM9Qjk-2qmHUZA6F8L-W1iAoc73-HvSB1n-drg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, arnd@arndb.de, deller@gmx.de, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, npiggin@gmail.com, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Tue, Sep 12, 2023 at 5:32=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer(
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align pgprot_framebuffer() with other pgprot_()
> functions.
>
> v4:
>         * fix commit message (Christophe)
> v3:
>         * rename fb_pgprotect() to pgprot_framebuffer() (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Looks like you forgot to apply my
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
given on v1.

I didn't notice before, as I never received v2 and v3 due to the
gmail/vger email issues.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
