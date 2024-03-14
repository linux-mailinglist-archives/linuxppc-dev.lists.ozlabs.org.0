Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B087B90C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 09:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKfb2cTzz3vYR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 19:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.46; helo=mail-io1-f46.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKf74KSsz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 19:04:14 +1100 (AEDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7c8ae457b27so17924139f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 01:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710403450; x=1711008250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kd7vHFr5fszcwgfp701zhW6bd0WPIDQKlsKOb1KQCg=;
        b=TiFJI9Y6xr4e9st5PvdfGtd4bYSGsKTzGaFgLNzRglKwC43i2k5+OsI5IUQWW78SAc
         U3dhyWynCy1WGAwu8C0txA68caY2droirvDXTcYCBAMsRt9+h6OkAeOaglOdFkE6lXgb
         0e9lfmZpxLZ2xzI++g/kpO1uCHrsABrAqMXp749+g0/b0G00vOHZWLXgagxLVF7OBnDw
         uWaSR6Ouzw79iooLzbXImpQ8dd5HnjicSWArN6cvn8/9g/Rxtb1NSEsmMi4AzbdbZicd
         aIccOJhhdMbkqwB72yKoH9vWvp07Qhz8nWSuLjRU4eXtHzkvvseWSWd939tWykm/n/60
         uf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgjk/j6UG86+DvNne6ghXF20hh/APKh7O3WSsgrn2xlQTXz6N4gqPEhAMA/VU+eJGWDX9F5l47yuCu5vyR+6c++I/MW4aepcX5E+5QMw==
X-Gm-Message-State: AOJu0YzclMCnbrIth0+NzYpHx9r+0eOjWZjdorqdlNlWYI/cYmrBoOTa
	pa2suDYwtdK3504p1d9ljmI4hYdJzsr07W+Ch2NIwkLA5rdlmgnQS3/FBHDW5fQ=
X-Google-Smtp-Source: AGHT+IHsurm4Urq6QyzzrRFXs3p84pGhNXogyTbGtPbK2ybOPZEI/TmR0nuM5Ywz+GV9YwyOLRtnzw==
X-Received: by 2002:a05:6602:5ce:b0:7c8:b447:c3e9 with SMTP id w14-20020a05660205ce00b007c8b447c3e9mr1267161iox.7.1710403449855;
        Thu, 14 Mar 2024 01:04:09 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id c17-20020a02c9d1000000b004772b4e3a3asm39658jap.18.2024.03.14.01.04.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 01:04:09 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7c7476a11e0so24804439f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 01:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrUH1bOzwKLPqzw7BNWQmFbbX5XuFVoL3lQwt8+5TxM6D2rukD+xnEFdSa4uXQlR6BwNPzUH/Q9Yb0+ek9bm1L3+47OfoSluoJY7wJAA==
X-Received: by 2002:a0d:ea4c:0:b0:609:239a:d0fc with SMTP id
 t73-20020a0dea4c000000b00609239ad0fcmr990474ywe.38.1710403077141; Thu, 14 Mar
 2024 00:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net> <20240312170309.2546362-12-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-12-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 08:57:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] s390: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmer
 mann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi G=C3=BCnter,

On Tue, Mar 12, 2024 at 6:06=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Add name of functions triggering warning backtraces to the __bug_table
> object section to enable support for suppressing WARNING backtraces.
>
> To limit image size impact, the pointer to the function name is only adde=
d
> to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBO=
SE
> are enabled. Otherwise, the __func__ assembly parameter is replaced with =
a
> (dummy) NULL parameter to avoid an image size increase due to unused
> __func__ entries (this is necessary because __func__ is not a define but =
a
> virtual variable).
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks for your patch!

> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,19 +8,30 @@
>
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>
> +#if IS_ENABLED(CONFIG_KUNIT)
> +# define HAVE_BUG_FUNCTION
> +# define __BUG_FUNC_PTR        "       .long   %0-.\n"
> +# define __BUG_FUNC    __func__
> +#else
> +# define __BUG_FUNC_PTR
> +# define __BUG_FUNC    NULL
> +#endif /* IS_ENABLED(CONFIG_KUNIT) */
> +
>  #define __EMIT_BUG(x) do {                                     \
>         asm_inline volatile(                                    \
>                 "0:     mc      0,0\n"                          \
>                 ".section .rodata.str,\"aMS\",@progbits,1\n"    \
>                 "1:     .asciz  \""__FILE__"\"\n"               \
>                 ".previous\n"                                   \
> -               ".section __bug_table,\"awM\",@progbits,%2\n"   \
> +               ".section __bug_table,\"awM\",@progbits,%3\n"   \

This change conflicts with commit 3938490e78f443fb ("s390/bug:
remove entry size from __bug_table section") in linus/master.
I guess it should just be dropped?

>                 "2:     .long   0b-.\n"                         \
>                 "       .long   1b-.\n"                         \
> -               "       .short  %0,%1\n"                        \
> -               "       .org    2b+%2\n"                        \
> +               __BUG_FUNC_PTR                                  \
> +               "       .short  %1,%2\n"                        \
> +               "       .org    2b+%3\n"                        \
>                 ".previous\n"                                   \
> -               : : "i" (__LINE__),                             \
> +               : : "i" (__BUG_FUNC),                           \
> +                   "i" (__LINE__),                             \
>                     "i" (x),                                    \
>                     "i" (sizeof(struct bug_entry)));            \
>  } while (0)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
