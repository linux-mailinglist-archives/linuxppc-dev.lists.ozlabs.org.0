Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A7F45C4EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:50:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzj7s44sVz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.54; helo=mail-ua1-f54.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzj7P2kxZz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:50:08 +1100 (AEDT)
Received: by mail-ua1-f54.google.com with SMTP id l24so5269780uak.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hf4rPGIgUhHt4w8e7uNMvl+iKhb8nrL9YmbQ22fq8VI=;
 b=jomjZoTl3OZac/kEtzDzXlfWibWlu6OIcX8kgwS25806Wbd/XNJd3jxM6Yk/GPPF52
 SnBmGxaY0MZ8g4OnUbKKqG8h8nVYrn+qucZtGdoFeSC1on//16KlxUsuLXYobXxv/EP0
 eaeI6gF1JKi/W1f3j2mtxKYYWFudMaEgGzTCE5yetMaaMzbabLsWZwAHfJaAZwZ5P/Vg
 WgmtjhFXfqWGGFg6Kt7mHRrAudy2TJgqEqB5+m5w4g/PVEyAr0k7gAIwa2xy1ImZ2L0S
 QPRF92ubdKatBDF+9v+eEmExdgPdB9nD3tpJ7iNTgVO2ESWe04qmNotx2WyiOu3t6XuT
 o5Zg==
X-Gm-Message-State: AOAM5300Q/Snz0qc+hLplDYc1HcvvEuK00IxT2IX3fxlSa8sVzEr5kYk
 EXgtzmdp6/nsJ+z5qDsDzvYNMmPDVQ3yTA==
X-Google-Smtp-Source: ABdhPJzugl3U0gPBsPxjfZN4cu1Zr8kgjj5r7z+1t9vspDjJnTazDKhkZgFPf1tVLwn7m2ZHB64ESA==
X-Received: by 2002:a05:6102:511e:: with SMTP id
 bm30mr23352838vsb.48.1637761805364; 
 Wed, 24 Nov 2021 05:50:05 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id y7sm7710294uac.3.2021.11.24.05.50.04
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:50:04 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id w23so5238020uao.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:50:04 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr24413982vsj.50.1637761804180; 
 Wed, 24 Nov 2021 05:50:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Nov 2021 14:49:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Message-ID: <CAMuHMdViovyQ2xBeKaMRbAmYF5eMWKdYhQEPmnTyLJoF7a+xsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 lkft-triage@lists.linaro.org, Max Filippov <jcmvbkbc@gmail.com>,
 Mike Galbraith <umgwanakikbuti@gmail.com>,
 sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next <linux-next@vger.kernel.org>, Waiman Long <longman@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Rob Landley <rob@landley.net>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 2:21 PM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

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
