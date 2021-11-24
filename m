Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D04A745CAE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 18:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzntp5C6Cz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 04:24:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LPQIsg+f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=jcmvbkbc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LPQIsg+f; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hznt40Xtfz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:23:53 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id l25so13525424eda.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 09:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ccJMIpDP63AsSWP0+gJpsJishWCjmMXQ0SENwgrm5zo=;
 b=LPQIsg+fnQjP+GIjcU+s2UMMyjwiLbLz29SB7qHmon0OqWk06zH7knq6feBANLCkBL
 i+O6SprIXvZ/RMchNw5acYJ9uMkd508g1WcEDkla4Ao/ZDtmKCSaEIOCy2BS48JnD6eZ
 eeJrqZuQva7WkELPIdub8lRIf/sL2XOOBWo1kY07QXJydijSe8PceQm7ghukbsZsXEvJ
 uTIZScnEmTsw7dp6imxmSBAeZV7cV5J7Ob229ctIQbA9R+O2pki82r+BhKZf9nOgVP3w
 p3BqEV6FrEZJK/3S3ghUyyumlvAqmGtD401bgDgsomSwG5ofZf3kcRFfKYo3ZIwOKFj9
 TyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ccJMIpDP63AsSWP0+gJpsJishWCjmMXQ0SENwgrm5zo=;
 b=TJIFidz1pezwaxJ946Q8RTTT4tiFWOikuE0FWFIaLd+XlicJF18dvIceYMFFE8LFmt
 p1PKl90rWEAGpQLJ3HmKycv6IKr/5/XsWOTfbyhB6b/c/7yj7NXjO4GK/2lXhVT1zoCq
 UAFfw44UJ83k752uAosQzj2Bd8X6Zl61vRu67B2RB2/vHR+wb9FNJ+42cZumb08xE//b
 jxOk5clyJ7rm/dFPf5UsQ9HCOvaCyzxE/1i5eYmfsb5UNIsVp4E3C0gq9Tg+sDXhOR9P
 U7e4pFUYwRJCtAYMczX2oh10OvWV5ZlfzFiCd5a0uWr3w15+42cmgBcax+2SjdF4l3Jb
 mr1A==
X-Gm-Message-State: AOAM531EZYAqwt6EGUlShGY7LcOy+8qgKR9bqfnFNgRvvE53SLk1IZWF
 6/c9wlasFVe6TnkalKEh5tQL2qC3xs7wWk0K1Y8=
X-Google-Smtp-Source: ABdhPJxCkUPK2xGVGQ8pQVAH6s4Q6tpFbqatbbYoPoAC/pb3AwqZ/UUH4ORYdYtNjszU1n1TDfxAVTzojZYvfCqJ1Zg=
X-Received: by 2002:a05:6402:40d3:: with SMTP id
 z19mr28561357edb.185.1637774628721; 
 Wed, 24 Nov 2021 09:23:48 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 24 Nov 2021 09:23:37 -0800
Message-ID: <CAMo8BfL18MQah-Bsf3NUUH+U5inLyErMfHoqr2vdwzUzCc=dyA@mail.gmail.com>
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
 "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 lkft-triage@lists.linaro.org, umgwanakikbuti@gmail.com,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, naresh.kamboju@linaro.org,
 Linux-Next <linux-next@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, longman@redhat.com,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ingo Molnar <mingo@redhat.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, LKML <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, Rob Landley <rob@landley.net>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 5:21 AM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  8 files changed, 8 insertions(+)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
