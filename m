Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9276DD4C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 10:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwdmG05GCz3cdd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 18:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwdlk5gFYz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 18:09:06 +1000 (AEST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-54f6fc7943eso26164607b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hALJfm4jnccIo090MDgna4b/Z74t0kji7w+cuP7uYXI=;
        b=73wdeMRMcblmSchRp4s9No8Y+/S8mfaTpfEyOGhvMCpeGSl24h790EavnrOeuq217G
         1oRqUW4aD43U9EDomFa6UXYLeSGt0nunuYhsMO7op2Qx9SMelQg+OrwY4FO3vdLhY3VN
         5KbV3MocIRkbjlL8pDHFpKjPDa4SA8EHG3L6GElaYIbIel+laRNvjDTYr+Cl2yNL/oDz
         AyvyNQ6AVoq3WsOWazwdzQ7MDIYyGu4ImyP7oLjyzpJQNiuPxE0thcsMfoxFQVORF0AB
         sFyYqQGyMqV1ZMmyyCExwgvQkvZ4cDCSrHLtDWxREMmWNSLkohmH9XdFCe1hYzKq8web
         cvuQ==
X-Gm-Message-State: AAQBX9eUb6wk2n7dQCQpf4BaMM0nyqg5sKvVulryfnPBZElCOMGM1kmw
	Y9libnw4o1EqxYVZ80SGlmgOcpr6gsXSjw==
X-Google-Smtp-Source: AKy350beegGBz3ZTUyaDd3OWAlFH+MgalYHZqB7jlAS2af5iF7VbbqBZ0EE/sh/HNHftqBTVse64+w==
X-Received: by 2002:a81:468a:0:b0:54e:f301:ca1c with SMTP id t132-20020a81468a000000b0054ef301ca1cmr6945532ywa.49.1681200542890;
        Tue, 11 Apr 2023 01:09:02 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id ci4-20020a05690c0a8400b00545a08184d0sm3325733ywb.96.2023.04.11.01.09.00
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54c061acbc9so283788627b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:09:00 -0700 (PDT)
X-Received: by 2002:a81:e401:0:b0:54c:19a6:480 with SMTP id
 r1-20020a81e401000000b0054c19a60480mr7173247ywl.4.1681200539960; Tue, 11 Apr
 2023 01:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-2-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:08:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Message-ID: <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, arnd@arndb.de, linux-sh@vger.kernel.org, daniel.vetter@ffwll.ch, deller@gmx.de, linux-mips@vger.kernel.org, javierm@redhat.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, gregkh@linuxfoundation.org, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect()
> and by removing include statements. The default mode set by
> fb_pgprotect() is now writecombine, which is what most platforms
> want.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> v2:
>         *  use writecombine mappings by default (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/include/asm-generic/fb.h
> +++ b/include/asm-generic/fb.h
> @@ -1,13 +1,32 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +
>  #ifndef __ASM_GENERIC_FB_H_
>  #define __ASM_GENERIC_FB_H_
> -#include <linux/fb.h>
>
> -#define fb_pgprotect(...) do {} while (0)
> +/*
> + * Only include this header file from your architecture's <asm/fb.h>.
> + */
> +
> +#include <asm/page.h>
> +
> +struct fb_info;
> +struct file;
> +
> +#ifndef fb_pgprotect
> +#define fb_pgprotect fb_pgprotect
> +static inline void fb_pgprotect(struct file *file, struct vm_area_struct=
 *vma,
> +                               unsigned long off)

Does this affect any noMMU platforms that relied on fb_pgprotect()
doing nothing before?
Perhaps the body below should be protected by "#ifdef CONFIG_MMU"?

> +{
> +       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);

Shouldn't this use the pgprot_val() wrapper?

> +}
> +#endif

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
