Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36D8855C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 09:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0dyL72Frz3vZ9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 19:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.178; helo=mail-yw1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0dxw6BLrz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 19:32:51 +1100 (AEDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609f1f97864so7760337b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 01:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711009967; x=1711614767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mUmrGrAX3Duzs64PPgK1QzuxSOry2pd/+ceHDEcKUU=;
        b=rbGoph5N+xWPeLcGcgDKmznXC9xInjCNx7NiK3JjQwZoQv+o6oRuHnMjuggG1ZPKSM
         AooAOC70LlKWiLW+onU+Nf/WIu7hOQVRBm+lCSejKqGjRK2ToQrQUt6Be4mK/ielSDMD
         2OiHG+yLW3z0xnqnqdTzVMcZQvR14tbu8mImmOFqDhMm0377X58QCI7uZffOmq93xZva
         GlHZg/fRrBZLHYRw6+UZGAtcRZzW9cq/SXyuf1lLkNeJPHdhSz6HRHKSzNyTIK18IP74
         /vH/+rGBRszDlup/gaDXRkNuxVMRllR2WkYEOboOeR5SmCu1O9BYEIuff3159w7CMaFV
         BTrA==
X-Forwarded-Encrypted: i=1; AJvYcCXY4SHFZC5Zzhl5oaU/Har6Ezo/0sHLXS2XGCJo/3TZPoHYkT4GFX1iDP4MQ0EG6rUI6fiDcZYJOVj1ISBLfDAyTpGNLwEirfHTEQNMeg==
X-Gm-Message-State: AOJu0YzfM96mBhnVQ482vlLA5sgF+XB+WqCikL/jgX9pdh2MI4YIUYD3
	mItdFVgK7H/b9Mf5tI3lHSfq4RDTwuHNWeskTR6bi6GI8YJjbCZnrCec4wW67Bc=
X-Google-Smtp-Source: AGHT+IEm85vI1ql2lX4i0FlUTTh1p2Eifxe7by0SeKftvy21jt+Gga2zFqrE1nGg/t2p210SArPhkA==
X-Received: by 2002:a81:a10b:0:b0:5ff:bb43:2a69 with SMTP id y11-20020a81a10b000000b005ffbb432a69mr8748129ywg.40.1711009965831;
        Thu, 21 Mar 2024 01:32:45 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id e127-20020a81a785000000b00609ead89e41sm3191503ywh.75.2024.03.21.01.32.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 01:32:45 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60a0579a955so8296587b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 01:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdYH0J6IqFa7x+eHztaWyRYS/bWinltIxKbW5GfJzET4f7r+IneTDn89WK/srSfJXZP1QK8vrlRTAPo0Hs+NhCd9AUq4uIRFbsxML5hg==
X-Received: by 2002:a5b:ecc:0:b0:dc6:be64:cfd1 with SMTP id
 a12-20020a5b0ecc000000b00dc6be64cfd1mr7256066ybs.36.1711009965385; Thu, 21
 Mar 2024 01:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240320180333.151043-1-arnd@kernel.org>
In-Reply-To: <20240320180333.151043-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Mar 2024 09:32:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
Message-ID: <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for
 stack usage
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: llvm@lists.linux.dev, Kevin Hao <haokexin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, linuxppc-dev@lists.ozlabs.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Wed, Mar 20, 2024 at 7:03=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The device is way too large to be on the stack, causing a warning for
> an allmodconfig build with clang:
>
> arch/powerpc/platforms/ps3/device-init.c:771:12: error: stack frame size =
(2064) exceeds limit (2048) in 'ps3_probe_thread' [-Werror,-Wframe-larger-t=
han]
>   771 | static int ps3_probe_thread(void *data)
>
> There is only a single thread that ever accesses this, so it's fine to
> make it static, which avoids the warning.
>
> Fixes: b4cb2941f855 ("[POWERPC] PS3: Use the HVs storage device notificat=
ion mechanism properly")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -770,7 +770,7 @@ static struct task_struct *probe_task;
>
>  static int ps3_probe_thread(void *data)
>  {
> -       struct ps3_notification_device dev;
> +       static struct ps3_notification_device dev;
>         int res;
>         unsigned int irq;
>         u64 lpar;

Making it static increases kernel size for everyone.  So I'd rather
allocate it dynamically. The thread already allocates a buffer, which
can be replaced at no cost by allocating a structure containing both
the ps3_notification_device and the buffer.

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
