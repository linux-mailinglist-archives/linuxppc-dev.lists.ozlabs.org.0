Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01011E9660
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 10:39:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ZWvN4dhZzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 18:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ZWsl2RYkzDqDp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 18:38:18 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id h7so5531774otr.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 01:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=il8HCm7VOhnKzl1XMZoe2G47NdOZUu6wpsg1d44qw+4=;
 b=VL7z/GwsztbWNNOtSxPHQfJZIAXHjR+DbbZeyyI/bp4QZZrfgIAMBXG3L472pjvHoj
 QVUimTW1IInT9W9apNJv3igD8WXEIEK6h643d4poU4zvNoVPtyciUS/S+eew9ay/Gd2D
 BhbF68a97buGqeE9KPj2qLlx4o4ivn3WqiqFnGX7lqtSegT1bo7lwhpqDLD/WC4a7M5L
 +bDVGJyZCyd+HqT0pIYTwXP89k85aX0i/va2lJa4beT7Ku+dw14vW+MSXFxeRwLJ5j4i
 FcM3Rk/AP7ul6XK0ptT/CILN5v6NqSUYXgsRv5qdhLNmMvvpmpYwnKQiIlP1dVv3xZKq
 3niA==
X-Gm-Message-State: AOAM531J64Do2rgZsRSTgrhlyE7oDFx/qnFlunihVLKXHVug6WBiS77h
 3ZNdnsYc7cYPRiulx8VTBHgBY7jmqiysYdCpA5Q=
X-Google-Smtp-Source: ABdhPJyWAqRS0RRmaKRioJgNyQk6X8M+vph3CUcrrUDm59u0OhqrcmYDrag8OKeZfYreJFeDK2DjPdxpkmXZicd+u5A=
X-Received: by 2002:a05:6830:141a:: with SMTP id
 v26mr716939otp.250.1590914295626; 
 Sun, 31 May 2020 01:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
In-Reply-To: <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 31 May 2020 10:38:04 +0200
Message-ID: <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
To: Finn Thain <fthain@telegraphics.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Sun, May 31, 2020 at 1:20 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> The adb_driver.autopoll method is needed during ADB bus scan and device
> address assignment. Implement this method so that the IOP's list of
> device addresses can be updated. When the list is empty, disable SRQ
> autopolling.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Thanks for your patch!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/m68k/include/asm/adb_iop.h |  1 +
>  drivers/macintosh/adb-iop.c     | 32 ++++++++++++++++++++++++++------

As this header file is used by a single source file only, perhaps it should
just be absorbed by the latter?
Then you no longer need my Acked-by for future changes ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
