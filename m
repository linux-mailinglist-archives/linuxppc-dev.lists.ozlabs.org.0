Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58312CFE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 13:10:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47mbpv0qDSzDqB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2019 23:10:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47mbmT1l0czDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 23:08:07 +1100 (AEDT)
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Ml6i2-1jScVZ35JM-00lW1C for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec
 2019 13:08:01 +0100
Received: by mail-qv1-f53.google.com with SMTP id u1so11441039qvk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2019 04:08:00 -0800 (PST)
X-Gm-Message-State: APjAAAUtItJpEunNN7N+xjqr3H/hm3kSmznfMUuz4PDBU7zNAZwXTCp6
 TI2j2bPI9SF0LuduGGVgpQ6Z7RiwUdWSeSEkv40=
X-Google-Smtp-Source: APXvYqwgYmUQwo+iL/k4m54VB6r1wV0E9Nq8yE/j4nb6YZD4J7kjH+UJKaDQYBMfOQwb9P/Z8xhYwMz7551bLxAPNPc=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr50936334qvg.197.1577707679673; 
 Mon, 30 Dec 2019 04:07:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <d0f8dfb26c025d3e3eee1b5f610161ca19b942df.1577111367.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 Dec 2019 13:07:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Message-ID: <CAK8P3a36OgFuY72b_i6+0xBNGnaxS1SsRid+HrgQHPZtUJp3LQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/10] lib: vdso: inline do_hres()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZkcmCcfHZgs5iPF9ZB4TApfjH6KqqS1SG2tvC3ghWKy42hs1Nuw
 /Ga19XLpUTSba0Clc3zSHhCRnYt1xoE4vO242CjLFRrf/o8eyO6sVOXKtoAYUlDw6TlM6CF
 5t23gEAHJLvINUu45dQMUT6aYEio+Emcjf5hwIK982o2c+TBHDkHWNLFh0f/Bt6tJnBAXw0
 H3Q1FW+WngMr23CXW9Xzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uGd6ayO5sa4=:wwXJ9EwSg9V5iYvwWpvvhE
 UsQuMcsH7GYAXi5kD+Rg+lRrJErqPl2YkvAJuy7Ov5uWJSTBPSO9WVKGDcpkZLVAe4xtJpoNQ
 uCcqqB9spX3OARoIu/hDwHbfp20zY3yrPBF6AVlDpzNucYSxpYtfe2x8VVAkjyjYzLg1yO1fo
 HgBp/6skm/tXol/V4JzX852I9PhkqvV6vfw01jgBTaCYlyCf55dG8qk49uWcStXC4dqz1pHGJ
 TReX9te0iugoFnefuB63veVI0SjuhrQoogTDpsgBqM5S6zhflLnDo7rCkWuWWU8g0KnCRQ+m2
 cyjC6FhLRdwiADzV3fxsHw9aDhsIGVncTPQWORnTdnZ2LYVhfX04TD4urT1oLCP7L80ApvLFx
 zDlo/ADF7XjzBQDEF+CjE04jR9GP/equ3KE2KZP7ch0/xz/9Rh2UZva1ODxRFWExqrcRPLu9t
 9AT6w1UmG4Grf4hYscepCvCRIuX3HozxWeEbwZ7zccDSs6ETdhEPRqEtzc5ums0NqNO3yJMJg
 0cwdKAm4ihlQMdabotsvFrQMm0PZ7cYUKzca5ZyReJAo+5+GebItYAyvJdwijZzkkG+Z2CsBx
 McdVweB/rpYW3KVrvhzZWFxnytA4f13l7p2tBkSEXnls3npIkNqiQVOZTr9qbG+bKbiV5CgVq
 y6i1dSu/1UG8hVc8Xi8nmi9bk/OpDvHMWrjIZAO2/zf/ERXEWLXFux84jCgJoDSFrW9d+ArhK
 Swpxq+qYqLQCb8M0R3+txVbL47nmb1PZpY6u6T+RBA8aChUVWEA+jx/qw5bLwlojexblw4v+J
 qwlvMpW4pTcre9sXdz0yePxG9tNNq6gj4LLXFZlQ6aBzO0r5RpRqfjp9JtSZpszSSTafDrH/c
 B/FUHZdkU8rFUdAZ5K8A==
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> do_hres() is called from several places, so GCC doesn't inline
> it at first.
>
> do_hres() takes a struct __kernel_timespec * parameter for
> passing the result. In the 32 bits case, this parameter corresponds
> to a local var in the caller. In order to provide a pointer
> to this structure, the caller has to put it in its stack and
> do_hres() has to write the result in the stack. This is suboptimal,
> especially on RISC processor like powerpc.
>
> By making GCC inline the function, the struct __kernel_timespec
> remains a local var using registers, avoiding the need to write and
> read stack.
>
> The improvement is significant on powerpc.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Good idea, I can see how this ends up being an improvement
for most of the callers.

Acked-by: Arnd Bergmann <arnd@arndb.de>
