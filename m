Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E57911A1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 08:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfK5t4PM1z30hn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 16:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfK5M7250z2ygT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Sep 2023 16:50:14 +1000 (AEST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58dfe2d5b9aso15061127b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Sep 2023 23:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693810210; x=1694415010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rK9iNlhM9qm2dLN2U9ruHBYs+JWxgylVxpO0f1W8IM=;
        b=D8lKB9NgK/jhQPIHSPnrJpkEhr2vlNVDShXvgbRfJDztydpzmKKyNHUJFrrf/J5P/3
         VCkh+0ommzA0UrllGj+CgSOxyxFQBTgvj4695Jwfw5rvgXF40+sokLYG19cUNRpxBVE9
         A+a+kNv7/HOkRY/3k7eAU6X0cmeGzUKlTqnCR5U+vy8TvDEO2YBOfTBe50UqRHCB9Fly
         kvOP7Evv2Zy+dGE1J1WonxK9csSq//mfOV+yifgKV/CjIqnQMo7yww+KmlkjLxEHzdT5
         uRd6BxjBt7W0euani7GWTwSPk/ZouB11SiFH1ylwaxwzG+Hhb0TOTbnMYdaR+pP6NPdL
         MR6g==
X-Gm-Message-State: AOJu0Yzb3gyuIxjfMj+PpaXwZicZtRj28T1n3OZHJy6+/TMMfdQ5WXXt
	qSzhO9cXf1VvrdC5/s5GnYQjohKUsuXcDw==
X-Google-Smtp-Source: AGHT+IGrgHT39l9rDCESFkkNOFcTEV5po3KM/eLuJAabrYa8zr7CTtP+IY4EUujdLBDKF1rb9lqT+Q==
X-Received: by 2002:a81:a092:0:b0:56d:2d82:63de with SMTP id x140-20020a81a092000000b0056d2d8263demr12219454ywg.3.1693810210577;
        Sun, 03 Sep 2023 23:50:10 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id z198-20020a0dd7cf000000b005925d7b62e0sm2483906ywd.24.2023.09.03.23.50.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 23:50:09 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d7766072ba4so2728035276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Sep 2023 23:50:09 -0700 (PDT)
X-Received: by 2002:a25:a1a9:0:b0:d7b:a78e:6b2d with SMTP id
 a38-20020a25a1a9000000b00d7ba78e6b2dmr12488603ybi.20.1693810209384; Sun, 03
 Sep 2023 23:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230901142659.31787-1-tzimmermann@suse.de> <20230901142659.31787-5-tzimmermann@suse.de>
In-Reply-To: <20230901142659.31787-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Sep 2023 08:49:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Message-ID: <CAMuHMdV+0P40QpPcLeuSAd0HJ_Z2uPpmhyBKXnxoOQibtGAVFg@mail.gmail.com>
Subject: Re: [PATCH 4/4] fbdev: Replace fb_pgprotect() with fb_pgprot_device()
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

On Sat, Sep 2, 2023 at 11:13=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Rename the fbdev mmap helper fb_pgprotect() to fb_pgprot_device().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory. The new name follows pgprot_device(), which does the same for
> arbitrary devices.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align fb_pgprot_device() closer with pgprot_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

>  arch/m68k/include/asm/fb.h           | 19 ++++++++++---------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


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
