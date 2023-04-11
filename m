Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0096DD4D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 10:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwdnk26Lwz3fGT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 18:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.178; helo=mail-yw1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwdn84VTfz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 18:10:20 +1000 (AEST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54ee9ad5eb3so139337547b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681200617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKyKsR4WjWkIQ4662w2UQ58EahuI+KkHYModkQblq2M=;
        b=e8WsoIqAtanCg2d4uSpWBMX7Eq1yZfuaWjlGTRjHtPD9KWKY/ozIx4p1unAzhuk0Ks
         64QYN9IRQhfEbBv6EAJalYQvXJBm2F/OVMBzxn6gdzDCMbZMj+FAsA6WWHQJ37uXA324
         a1AjqYbKt4gxazJNF3jgv6xpATlR0MAOI4la6IVt6nb2KJH5L097d5wfF/vGmg6wF6Ru
         OSM7prOL0YvD1OGTjhdMinm6aU9ihZjgXlBTl6JNhyJgF0rLYMb/49iw7qxPHnky84TG
         sAJ2wY/NY04EpAEKBB1/iOnlZUAZPD43YhChrQKMepVmaQMq1v1nGfKFyj25radHHRJP
         Bczw==
X-Gm-Message-State: AAQBX9e953pQNpDhNQ3zxMjZFTz/juV66WqIHIAzg6EUHPeRBvrdgFYs
	8qPtlWd6DrYY8I2zTxr92Ysi8pF9nSq6IQ==
X-Google-Smtp-Source: AKy350aYrSBbS54Yzgzv5jVPh92/kwe4gbDgJ7uyAUIqapzR28kxDOvNYmkT+JSAhOVrOWqxB5w9nA==
X-Received: by 2002:a81:9292:0:b0:546:2787:4b93 with SMTP id j140-20020a819292000000b0054627874b93mr6974000ywg.35.1681200617599;
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id bh31-20020a05690c039f00b00545a08184a7sm3351383ywb.55.2023.04.11.01.10.16
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:10:17 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54c17fa9ae8so243175357b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 01:10:16 -0700 (PDT)
X-Received: by 2002:a81:bc08:0:b0:54e:e490:d190 with SMTP id
 a8-20020a81bc08000000b0054ee490d190mr1216128ywi.4.1681200616792; Tue, 11 Apr
 2023 01:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230406143019.6709-1-tzimmermann@suse.de> <20230406143019.6709-8-tzimmermann@suse.de>
In-Reply-To: <20230406143019.6709-8-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 10:10:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Message-ID: <CAMuHMdWY2KdnpuunRqADjDjt_vnEdyD_yfwJySTi4s5N+A1ZgA@mail.gmail.com>
Subject: Re: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
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
> Merge all variants of fb_pgprotect() into a single function body.
> There are two different cases for MMU systems. For non-MMU systems,
> the function body will be empty. No functional changes, but this
> will help with the switch to <asm-generic/fb.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
