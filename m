Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C36DF6DD519
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 10:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwf185Hn3z3f6r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 18:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.171; helo=mail-yw1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwf0d5NDrz3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 18:20:17 +1000 (AEST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54f64b29207so36340787b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOXdqLxEHLBZ7hy/2mM/9REbA1X5ZreSZtF+7etv6Sw=;
        b=RrxwDJJLqpYrSDtRs87/WbxjpKLjQfUl9VyJaWGux92+fjcEtiobkZPmn7eu0qN5b8
         EWH5n6TOLh/G6xizhfkvkcnyrhQD4LjX2qV2A13kzOqKgWX/oWlf7FI9GYfxmGjE6ySH
         qPdjguA/5atmXpO3xz0HlZcCV7YrkbC9ALUvzEUvdFtBVHwN0HDKwiggGDtsUdiNaKco
         OfOHEQl6raisumkqpURY0L9qmRT90Qo6RIMPSnwWFkWm1G3owwIZO9yGhFvMXCKjukzM
         d2smyOmlS8DYswwQsXXE1I7uoc9UuqPzcYiwFBVcjikK8EbZPMkEW54/QE9tBb7dZesc
         DNxA==
X-Gm-Message-State: AAQBX9fnTTM87lUMh4KP/n9fFDu4MY6k1K3Zy/ldqphGg9ES7ihGRBLD
	ksFql0C4Qjzja0Lcz7/WVgPZPaJ/EkPIIw==
X-Google-Smtp-Source: AKy350ZXBiL5DHvoZFAI20rmJt2k6zp8qAHmuqLBCaVNODnuiU5s7e8RidS/09flEWwQ0x1FuAAGGQ==
X-Received: by 2002:a81:7482:0:b0:538:5216:2ad2 with SMTP id p124-20020a817482000000b0053852162ad2mr1462508ywc.52.1681201214362;
        Tue, 11 Apr 2023 01:20:14 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id y207-20020a814bd8000000b00545a0818496sm3343294ywa.38.2023.04.11.01.20.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i20so10861275ybg.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:20:13 -0700 (PDT)
X-Received: by 2002:a25:d447:0:b0:b75:9519:dbcd with SMTP id
 m68-20020a25d447000000b00b759519dbcdmr960089ybf.12.1681201212819; Tue, 11 Apr
 2023 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-9-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:20:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Message-ID: <CAMuHMdVmZ2GRKqEnZgQKzJ1-Hy-Cz8yoUOhD0TMMqZriH82-tQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] arch/m68k: Implement <asm/fb.h> with generic helpers
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

On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Replace the architecture's fb_is_primary_device() with the generic
> one from <asm-generic/fb.h>. No functional changes.
>
> v2:
>         * provide empty fb_pgprotect() on non-MMU systems
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
