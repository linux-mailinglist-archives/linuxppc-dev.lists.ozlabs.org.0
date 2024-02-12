Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF8851DD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYZ695fl1z3fFT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:20:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYZ5l2l6Jz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 06:19:38 +1100 (AEDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60491cb9571so33230777b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 11:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707765574; x=1708370374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6GjgFueoDqMOuDA9UzqgtUxPlfanNs+VyQkqEQBDVs=;
        b=PJaZMprlq+5cAclTesXKqajrep3JnWX6XRIfK+xxb+iuKv5KGLZrLOPCiKZp1CMJnZ
         QNeneLxEuEHjrnFoPjEzkHaWe4oDTr8W1oLYKx40QHtmTzWsx25pC4FyVUjtumrao3S4
         qXYCNxI6ZNdONa9oeDRwOzfjmN5O0pqjl31TvG6EOoi++dLejKZVQlFuS12S+mbLlk9d
         owpuwl4H9y8GWbjhBH1qk7+TrhAM1aPvH7V2IbuM40OLRahni9afsKDF3gNPeuSFXDpw
         UUTmWDPM2QfieXe+ZuKTskFD4OzPedfhoVA0Pm4Jr3GWBq2BGlaIlM1LrnUz2CPnNE42
         5Plg==
X-Gm-Message-State: AOJu0YzgQM0MrvHC+8l9sXSQ27eYFGMWtAFQgJZolU7GqCLMAkhqbWvc
	gp1B5UXorv2tqW4xZPYhX4UHBSeLMMRT10eUuZyqB4WfoB+bgxj0EDLRMGD6l3c=
X-Google-Smtp-Source: AGHT+IEeIvk4Tko3pWjt/Nkg1BzmeMt0YCW/UlzowLVuFZtHjVlSy/SOJegxAqqMhTNosH0iFZXRmQ==
X-Received: by 2002:a81:de52:0:b0:604:7a8d:50c9 with SMTP id o18-20020a81de52000000b006047a8d50c9mr6508080ywl.30.1707765574367;
        Mon, 12 Feb 2024 11:19:34 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id n36-20020a81af24000000b006077dacef7asm82359ywh.18.2024.02.12.11.19.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 11:19:34 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc755afdecfso3011906276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 11:19:34 -0800 (PST)
X-Received: by 2002:a25:bc8a:0:b0:dc2:5674:b408 with SMTP id
 e10-20020a25bc8a000000b00dc25674b408mr5941166ybk.57.1707765574018; Mon, 12
 Feb 2024 11:19:34 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
In-Reply-To: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 20:19:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpqSeJ4XpEzrOwVsUs9DgaTkApQmmAHCr8YkfyjbhwDw@mail.gmail.com>
Message-ID: <CAMuHMdUpqSeJ4XpEzrOwVsUs9DgaTkApQmmAHCr8YkfyjbhwDw@mail.gmail.com>
Subject: Re: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Geoff Levand <geoff@infradead.org>, clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 7:36=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> I encountered the following build warnings/errors while compiling the pow=
erpc
> kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
> ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
> make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.
>
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrp=
ga6PluAWLAMa/

https://lore.kernel.org/linuxppc-dev/43ed64aa-17b0-4d04-a1f3-a6e13f59a743@s=
use.de/T/#ma2e81d77ee4a708c75d09c4e46904072b3f7b70f

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
