Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6C45C788
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 15:35:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzk7X6wzWz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 01:35:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzk740bzkz2y7P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 01:34:55 +1100 (AEDT)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MekKJ-1mG0ED0f3d-00alYq for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov
 2021 15:29:40 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso4236947wmh.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 06:29:39 -0800 (PST)
X-Gm-Message-State: AOAM532GJnEcfyCsmgLOcGQlYKXWs75KJSGZDxsD+SnnULp25WeAxu8S
 GGUIbgLYPZJzTEbAye/+cUmF3y+BOIO9R89DVO4=
X-Google-Smtp-Source: ABdhPJw9AuDVJPcPk5QwMaNIqLG+Gyph350xYhCGSeBIHw0tMZdjTjgs4734tAKvoxeRwyygv81r33HtARNOkWqIoYo=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr15657228wmb.1.1637764179209;
 Wed, 24 Nov 2021 06:29:39 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 Nov 2021 15:29:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Message-ID: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:41MxNfoWf99qZX/zt7a7ac0tXxGVpkhEzkwOOcBkx9bfjnImAew
 XK9Z6L2aupWatAv7PzFRHeJhPYTrEtMk1UKREaKb1L9yAPXllV/qMkf0IGQvd1zcLeszaIQ
 GJ1FTXs04UbNSQkkvdE5l3tNPQGXvTqKeUlHN5j9ndU8+fLVLGXIm7/vric5awHoHjlJEgS
 SYs/WdznmN+jfNxd8SvMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dmBtCe5eYrg=:S+xjN4OuAUp3EUfOo2NBxZ
 6YyGadnyoEGOUKLtvsf9/um3bXogqZaZXhsSahiRQ/Ul2ES+rUU2LHCH7zRhDjjL6Oogp7rSP
 9jWR2UboPl8LIXhqUA3EIjfQI5kYLPrVvOuaA9uN++gSpADYHG+qEhZv/70zL9sg0wAC7HALp
 T5oIhtA4Dw5upleDka/MygRAGi6hsS8+IjwVejDTOyqDhrrNh8KoFgH61zYFFpWRk2PQ6BDYG
 q30CGeGBzFdgNMUy/ehLxrxNBPJGWknVsOgRyCbacI4uLCNWUsK8yPYiBBdMGu78tuUIHhE5s
 wGCIsZYd02uUkNJ3e8JMWj0Dk38oymiSXBJ4ZWp0o1GZt1mdePg88bUYYTO4dMVepMRUSzco3
 6lL9GULInOsBTy4DafGftqw41aGyEqayXLG1c9/usH2pRWX35DqUCDS/rpDliJ6/fv4ih4gRK
 3hyRsXWf00D58uJ4Z1n16QgwwDv/jrKA9l0FDWniv2cvF4idc57Y41QQLp/C3oKGRFrNpV7ta
 fnYOTpXO/bdp+DgjhPNkOnYk7CxFyTUitnzF++VwCiutNL/2RhCYGEH3UABMFvPzBQGiuFBqo
 JGGgbvgHKZeQpIKO4tmFuWb8C/z5OZ5JuOdNwXFfSpZM0TN/ql+ecHRTD3sp+c2Qr/Votg9uW
 L5+oKoAO+bAFOofEHYeEkccNLY3C/cGdMt81lfvjZEXDa1WDT+zdGDfjrLAPG3sKNWtNEanyw
 RXsMv4r0oqGVeIu6rIzbizP9u2fBzyCnda1UEbjjFxJQm6zsqSL0HSi1J8beOllMjgYGp7VkV
 1b++kHFgA4tH7jT9BPp6tg+jI2omTZsRVLecyThAN60l5yRq68=
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
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
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Waiman Long <longman@redhat.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Rob Landley <rob@landley.net>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 2:21 PM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I double-checked that futex_waitv() doesn't need any architecture specific
hacks, and that the list above is complete.

Should I take this through the asm-generic tree, or would you send it
through the
tip tree?

        Arnd
