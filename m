Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A37180E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 14:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWTrB6qcjz3f6j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 22:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.170; helo=mail-yw1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWTqk3DLWz3bd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 22:59:29 +1000 (AEST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-565eaf83853so48891087b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 05:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685537966; x=1688129966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk0pPTGREGNtqqDFsY8KHF8G7JlW3Q+zzUWS3RUpyQU=;
        b=j5Vt1zex8GwJJK6Z+XwjxLUJWeiU6Fux82uHYv9OdRi05h5BRfJ6f7TDYR6s4jYu/E
         ZTx6QMGqYUaxEzGoaHOS4mFO+4WYBsXj5fNX9wSggeI1ypdsE5/oEKBhoOmYLfJO12dK
         2BFkN8trGvGaY/8dPS+ySTp0hyx0DoTQzMcdbMsfLZlF+dX1sn1H0FD4UgY0FuoV9Biy
         djiQbwmsx/NxKOmJ7RHNEqBL+Y2Tc+lnVK7HyWY0+BbO8IMwoqHDoP/Ef5bIUUtEbYwg
         d9OB7whiCzGWNiCYSTug8lhJTS6tBgrW6tyjRzS4ARYqx/CRUx3iMN9xXE8l4TarPmXP
         rq3A==
X-Gm-Message-State: AC+VfDzA843UObdb7xhx+UtqgKOoCeSf8cX6yszqy83Au8VXcSBHn3t3
	4STobEFB3PSJ9I1PE0KC/YQy2TmPpKocsg==
X-Google-Smtp-Source: ACHHUZ7kmsk6XtVzlWtGIz/KNxZ799Ylx9gtxjFF4vJxiMUCGxb0qJfHqAszIoTuNsfL9k60Kaay+Q==
X-Received: by 2002:a0d:d413:0:b0:565:ef11:1610 with SMTP id w19-20020a0dd413000000b00565ef111610mr5972950ywd.48.1685537966216;
        Wed, 31 May 2023 05:59:26 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id s130-20020a817788000000b00559ec10f245sm5308132ywc.103.2023.05.31.05.59.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:59:25 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-565ee3d14c2so47496787b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 05:59:25 -0700 (PDT)
X-Received: by 2002:a81:48cc:0:b0:55a:c51:9a15 with SMTP id
 v195-20020a8148cc000000b0055a0c519a15mr6087006ywa.22.1685537965151; Wed, 31
 May 2023 05:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531125023.1121060-1-mpe@ellerman.id.au>
In-Reply-To: <20230531125023.1121060-1-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 May 2023 14:59:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Message-ID: <CAMuHMdUbVmjcYyXmparBm6pQwu3q7HpTKsKfi_aAHGOSX97MUw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Exclude m68k-only drivers from powerpc entry
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
Cc: linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

CC Finn

On Wed, May 31, 2023 at 2:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> The powerpc section has a "F:" entry for drivers/macintosh, matching all
> files in or below drivers/macintosh. That is correct for the most part,
> but there are a couple of m68k-only drivers in the directory, so exclude
> those.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11916,6 +11916,8 @@ L:      linuxppc-dev@lists.ozlabs.org
>  S:     Odd Fixes
>  F:     arch/powerpc/platforms/powermac/
>  F:     drivers/macintosh/
> +X:     drivers/macintosh/adb-iop.c
> +X:     drivers/macintosh/via-macii.c
>
>  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:     Michael Ellerman <mpe@ellerman.id.au>

LGTM, as there are already entries for these two files under
"M68K ON APPLE MACINTOSH".
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Which leads us to a related topic: Is Joshua still around?  Should Finn
be added or replace Joshua in the "M68K ON APPLE MACINTOSH" entry?

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
