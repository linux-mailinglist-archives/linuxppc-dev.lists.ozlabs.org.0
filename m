Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE832EC73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 14:47:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsTZQ2XY2z3dLm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 00:47:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=DhVOTTeN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=DhVOTTeN; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsTZ027Xpz3cK9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 00:47:17 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id w65so2537893oie.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SInNMXqsGtA9/hulueI4v7s5Z4FGO7USmnkW6ykDyNk=;
 b=DhVOTTeNEWGP7nvs0N/96ctaUuIi3XAgBRwWEtcDF9LYjBWCG9/iF2Z2IeAfgY9gSk
 EuxxAQT4/gGX6oWuIsL6s1QIwBjSRsL2dc7lgry22R6oLBArIyQwgw2T1gFk3S+cGX+q
 Hx7usAEK/x12IwalJNVxcV6vyfULFvH09nCkI8BKgJ2tE+n1rlu0+POxAoWC/QLasjmI
 LGeYlSTK5JxCH23E0aZKYzbMAlfwLAkH8DVqxUtkJDTwZlLL1f4UaDgFPUbxJtmdX3ao
 m8DaAsVeHxyL9TdQxZTB0Rg+TiMf5JfAQsFOB+islX108CeCvfwMT1fIi6W4EdAyn7hF
 qODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SInNMXqsGtA9/hulueI4v7s5Z4FGO7USmnkW6ykDyNk=;
 b=rAjERGr0A4yMu6RcOcCYb1bzJLDZQId5Tb/OZ5TgFm2Y0DWfG7+QQWI2ZSqHSiLu1L
 F/GBfBBRg1ys3YoM+SyaO9tug3yGwLEA2ClvWPXvUEonyzr4g3zQCX4b/PNHgZTC2jWa
 Tucjgs0AMjk78X3PdhYDrmC/RfFhXF4c1XBXoROAqpgdenQQvFPc2udgCsyZUvXq4EKm
 68TU0EDVhoosyoaCp5QAWBHsivCk9XtIDlYX6c89cnvG06YBAWu7mzYp8lt5eSbO2qyA
 ZYLkcOkeMCas/P3J1kL+NvBRg2wY12CW0gmxa0sVXTo6ORZBj9dcUBItGRZOpeWhkYnZ
 1Ymg==
X-Gm-Message-State: AOAM531/tj4jV+hykPer8MZevg7pw7Kkn2MF1OasyF1hLleaCDWjZmJ+
 qQIJjp2lXtI7zrnSJJfE2Y/qRHmMspreDSNSPl1QOg==
X-Google-Smtp-Source: ABdhPJzSLALcuCZpE3cEHOvqGJGgFlt2enFY7q4Ev6KGRAIV11AF0b9dUVgfJK1I9YZPXDk6vk12D8KHVvIvf6hKa6U=
X-Received: by 2002:a05:6808:10d3:: with SMTP id
 s19mr7309520ois.70.1614952029845; 
 Fri, 05 Mar 2021 05:47:09 -0800 (PST)
MIME-Version: 1.0
References: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
 <874khqry78.fsf@mpe.ellerman.id.au> <YEHiq1ALdPn2crvP@elver.google.com>
 <f6e47f4f-6953-6584-f023-8b9c22d6974e@csgroup.eu>
 <CANpmjNM9o1s4O4v2T9HUohPdCDJzWcaC5KDrt_7BSVdTUQWagw@mail.gmail.com>
 <87tupprfan.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tupprfan.fsf@mpe.ellerman.id.au>
From: Marco Elver <elver@google.com>
Date: Fri, 5 Mar 2021 14:46:58 +0100
Message-ID: <CANpmjNMzY-Jmd9v9MHYqeQ934V91D25vtj85HwJkYuXS2a+4Yg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, linuxppc-dev@lists.ozlabs.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Mar 2021 at 12:49, Michael Ellerman <mpe@ellerman.id.au> wrote:
> Marco Elver <elver@google.com> writes:
> ...
> >
> > The choice is between:
> >
> > 1. ARCH_FUNC_PREFIX (as a matter of fact, the ARCH_FUNC_PREFIX patch
> > is already in -mm). Perhaps we could optimize it further, by checking
> > ARCH_FUNC_PREFIX in buf, and advancing buf like you propose, but I'm
> > not sure it's worth worrying about.
> >
> > 2. The dynamic solution that I proposed that does not use a hard-coded
> > '.' (or some variation thereof).
> >
> > Please tell me which solution you prefer, 1 or 2 -- I'd like to stop
> > bikeshedding here. If there's a compelling argument for hard-coding
> > the '.' in non-arch code, please clarify, but otherwise I'd like to
> > keep arch-specific things out of generic code.
>
> It's your choice, I was just trying to minimise the size of the wart you
> have to carry in kfence code to deal with it.
>
> The ARCH_FUNC_PREFIX solution is fine by me.

Thank you -- the ARCH_FUNC_PREFIX version is already in -mm, so let's
keep it. It's purely static vs the other options. Should another
debugging tool need something similar we can revisit whether to change
or move it.

Thanks,
-- Marco
